(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:14:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr
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
(declare-sort FramingWisdoms 0)
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
(declare-fun $SortWrappers.FramingWisdomsTo$Snap (FramingWisdoms) $Snap)
(declare-fun $SortWrappers.$SnapToFramingWisdoms ($Snap) FramingWisdoms)
(assert (forall ((x FramingWisdoms)) (!
    (= x ($SortWrappers.$SnapToFramingWisdoms($SortWrappers.FramingWisdomsTo$Snap x)))
    :pattern (($SortWrappers.FramingWisdomsTo$Snap x))
    :qid |$Snap.$SnapToFramingWisdomsTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FramingWisdomsTo$Snap($SortWrappers.$SnapToFramingWisdoms x)))
    :pattern (($SortWrappers.$SnapToFramingWisdoms x))
    :qid |$Snap.FramingWisdomsTo$SnapToFramingWisdoms|
    )))
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
(declare-fun edge_pred<Ref> (Edge) $Ref)
(declare-fun edge_succ<Ref> (Edge) $Ref)
(declare-fun create_edge<Edge> ($Ref $Ref) Edge)
(declare-fun create_edge_<Edge> ($Ref $Ref) Edge)
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
(declare-fun acyclic_list_segment ($Snap Set<$Ref>) Bool)
(declare-fun acyclic_list_segment%limited ($Snap Set<$Ref>) Bool)
(declare-fun acyclic_list_segment%stateless (Set<$Ref>) Bool)
(declare-fun acyclic_list_segment%precondition ($Snap Set<$Ref>) Bool)
(declare-fun is_global_sroot ($Snap Set<$Ref> Set<$Ref>) Bool)
(declare-fun is_global_sroot%limited ($Snap Set<$Ref> Set<$Ref>) Bool)
(declare-fun is_global_sroot%stateless (Set<$Ref> Set<$Ref>) Bool)
(declare-fun is_global_sroot%precondition ($Snap Set<$Ref> Set<$Ref>) Bool)
(declare-fun is_global_root ($Snap Set<$Ref> $Ref) Bool)
(declare-fun is_global_root%limited ($Snap Set<$Ref> $Ref) Bool)
(declare-fun is_global_root%stateless (Set<$Ref> $Ref) Bool)
(declare-fun is_global_root%precondition ($Snap Set<$Ref> $Ref) Bool)
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
(assert (forall ((g0 Set<$Ref>) (g1 Set<$Ref>)) (!
  (=>
    (Set_equal (Set_intersection g0 g1) (as Set_empty  Set<$Ref>))
    (forall ((r $Ref)) (!
      (=> (and (Set_in r g0) (Set_in r g1)) (Set_in r (as Set_empty  Set<$Ref>)))
      :pattern ((Set_in r g0) (Set_in r g1))
      )))
  :pattern ((Set_intersection g0 g1))
  :qid |prog.ax_SetIntersection|)))
(assert (forall ((g Set<Edge>) (e Edge)) (!
  (=>
    (Set_in e g)
    (= (create_edge<Edge> (edge_pred<Ref> e) (edge_succ<Ref> e)) e))
  :pattern ((Set_in e g))
  :qid |prog.ax_EdgeReverse|)))
(assert (forall ((p $Ref) (s $Ref)) (!
  (and
    (= (edge_pred<Ref> (create_edge<Edge> p s)) p)
    (= (edge_succ<Ref> (create_edge<Edge> p s)) s))
  :pattern ((create_edge<Edge> p s))
  :qid |prog.edge_injectivity|)))
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
(declare-const n@13@00 $Ref)
(push) ; 2
; [eval] (n in refs)
(assert (Set_in n@13@00 refs@0@00))
(declare-fun sm@14@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@15@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@16@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@13@00 $Ref) (n2@13@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@13@00 refs@0@00)
      (Set_in n2@13@00 refs@0@00)
      (= n1@13@00 n2@13@00))
    (= n1@13@00 n2@13@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@13@00 $Ref)) (!
  (=>
    (Set_in n@13@00 refs@0@00)
    (and
      (= (inv@15@00 s@$ refs@0@00 n@13@00) n@13@00)
      (img@16@00 s@$ refs@0@00 n@13@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) n@13@00) n@13@00))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@00 s@$ refs@0@00 r)
      (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00))
    (= (inv@15@00 s@$ refs@0@00 r) r))
  :pattern ((inv@15@00 s@$ refs@0@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@13@00 $Ref)) (!
  (=> (Set_in n@13@00 refs@0@00) (not (= n@13@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) n@13@00) n@13@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@17@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@00 s@$ refs@0@00 r)
      (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
  :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
  :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r) r))
  :pattern ((inv@15@00 s@$ refs@0@00 r))
  :qid |quant-u-12|)))
(declare-const $t@18@00 $Snap)
(assert (= $t@18@00 ($Snap.combine ($Snap.first $t@18@00) ($Snap.second $t@18@00))))
(assert (= ($Snap.first $t@18@00) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { create_edge(p, s) } ((p in refs) && ((s in refs) && p.next == s)) == (create_edge(p, s) in result))
(declare-const p@19@00 $Ref)
(declare-const s@20@00 $Ref)
(push) ; 2
; [eval] ((p in refs) && ((s in refs) && p.next == s)) == (create_edge(p, s) in result)
; [eval] (p in refs) && ((s in refs) && p.next == s)
; [eval] (p in refs)
(push) ; 3
; [then-branch: 0 | !(p@19@00 in refs@0@00) | live]
; [else-branch: 0 | p@19@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 0 | !(p@19@00 in refs@0@00)]
(assert (not (Set_in p@19@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | p@19@00 in refs@0@00]
(assert (Set_in p@19@00 refs@0@00))
; [eval] (s in refs)
(push) ; 5
; [then-branch: 1 | !(s@20@00 in refs@0@00) | live]
; [else-branch: 1 | s@20@00 in refs@0@00 | live]
(push) ; 6
; [then-branch: 1 | !(s@20@00 in refs@0@00)]
(assert (not (Set_in s@20@00 refs@0@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | s@20@00 in refs@0@00]
(assert (Set_in s@20@00 refs@0@00))
; [eval] p.next == s
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@16@00 s@$ refs@0@00 r)
        (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00))
      (=
        ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
    :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
    :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) p@19@00) p@19@00))
(push) ; 7
(assert (not (and
  (img@16@00 s@$ refs@0@00 p@19@00)
  (Set_in (inv@15@00 s@$ refs@0@00 p@19@00) refs@0@00))))
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
      (img@16@00 s@$ refs@0@00 r)
      (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
  :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
  :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (Set_in s@20@00 refs@0@00)
  (and
    (Set_in s@20@00 refs@0@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) p@19@00) p@19@00))))
(assert (or (Set_in s@20@00 refs@0@00) (not (Set_in s@20@00 refs@0@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@00 s@$ refs@0@00 r)
      (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
  :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
  :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (Set_in p@19@00 refs@0@00)
  (and
    (Set_in p@19@00 refs@0@00)
    (=>
      (Set_in s@20@00 refs@0@00)
      (and
        (Set_in s@20@00 refs@0@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) p@19@00) p@19@00)))
    (or (Set_in s@20@00 refs@0@00) (not (Set_in s@20@00 refs@0@00))))))
(assert (or (Set_in p@19@00 refs@0@00) (not (Set_in p@19@00 refs@0@00))))
; [eval] (create_edge(p, s) in result)
; [eval] create_edge(p, s)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@00 s@$ refs@0@00 r)
      (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
  :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
  :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@19@00 $Ref) (s@20@00 $Ref)) (!
  (and
    (=>
      (Set_in p@19@00 refs@0@00)
      (and
        (Set_in p@19@00 refs@0@00)
        (=>
          (Set_in s@20@00 refs@0@00)
          (and
            (Set_in s@20@00 refs@0@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) p@19@00) p@19@00)))
        (or (Set_in s@20@00 refs@0@00) (not (Set_in s@20@00 refs@0@00)))))
    (or (Set_in p@19@00 refs@0@00) (not (Set_in p@19@00 refs@0@00))))
  :pattern ((create_edge<Edge> p@19@00 s@20@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@305@13@309@44-aux|)))
(assert (forall ((p@19@00 $Ref) (s@20@00 $Ref)) (!
  (=
    (and
      (Set_in p@19@00 refs@0@00)
      (and
        (Set_in s@20@00 refs@0@00)
        (= ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) p@19@00) s@20@00)))
    (Set_in (create_edge<Edge> p@19@00 s@20@00) result@1@00))
  :pattern ((create_edge<Edge> p@19@00 s@20@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@305@13@309@44|)))
(assert (=
  ($Snap.second $t@18@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@00))
    ($Snap.second ($Snap.second $t@18@00)))))
(assert (= ($Snap.first ($Snap.second $t@18@00)) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { (p in refs), (s in refs), exists_path(result, p, s) } (p in refs) && exists_path(result, p, s) ==> (s in refs))
(declare-const p@21@00 $Ref)
(declare-const s@22@00 $Ref)
(push) ; 2
; [eval] (p in refs) && exists_path(result, p, s) ==> (s in refs)
; [eval] (p in refs) && exists_path(result, p, s)
; [eval] (p in refs)
(push) ; 3
; [then-branch: 2 | !(p@21@00 in refs@0@00) | live]
; [else-branch: 2 | p@21@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 2 | !(p@21@00 in refs@0@00)]
(assert (not (Set_in p@21@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | p@21@00 in refs@0@00]
(assert (Set_in p@21@00 refs@0@00))
; [eval] exists_path(result, p, s)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in p@21@00 refs@0@00) (not (Set_in p@21@00 refs@0@00))))
(push) ; 3
; [then-branch: 3 | p@21@00 in refs@0@00 && exists_path[Bool](result@1@00, p@21@00, s@22@00) | live]
; [else-branch: 3 | !(p@21@00 in refs@0@00 && exists_path[Bool](result@1@00, p@21@00, s@22@00)) | live]
(push) ; 4
; [then-branch: 3 | p@21@00 in refs@0@00 && exists_path[Bool](result@1@00, p@21@00, s@22@00)]
(assert (and (Set_in p@21@00 refs@0@00) (exists_path<Bool> result@1@00 p@21@00 s@22@00)))
; [eval] (s in refs)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(p@21@00 in refs@0@00 && exists_path[Bool](result@1@00, p@21@00, s@22@00))]
(assert (not
  (and
    (Set_in p@21@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@21@00 s@22@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in p@21@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@21@00 s@22@00)))
  (and
    (Set_in p@21@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@21@00 s@22@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@21@00 $Ref) (s@22@00 $Ref)) (!
  (and
    (or (Set_in p@21@00 refs@0@00) (not (Set_in p@21@00 refs@0@00)))
    (or
      (not
        (and
          (Set_in p@21@00 refs@0@00)
          (exists_path<Bool> result@1@00 p@21@00 s@22@00)))
      (and
        (Set_in p@21@00 refs@0@00)
        (exists_path<Bool> result@1@00 p@21@00 s@22@00))))
  :pattern ((Set_in p@21@00 refs@0@00) (Set_in s@22@00 refs@0@00) (exists_path<Bool> result@1@00 p@21@00 s@22@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@312@13@314@63-aux|)))
(assert (forall ((p@21@00 $Ref) (s@22@00 $Ref)) (!
  (=>
    (and
      (Set_in p@21@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@21@00 s@22@00))
    (Set_in s@22@00 refs@0@00))
  :pattern ((Set_in p@21@00 refs@0@00) (Set_in s@22@00 refs@0@00) (exists_path<Bool> result@1@00 p@21@00 s@22@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@312@13@314@63|)))
(assert (= ($Snap.second ($Snap.second $t@18@00)) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { (p in refs), (s in refs), exists_path(result, p, s) } (s in refs) && exists_path(result, p, s) ==> (p in refs))
(declare-const p@23@00 $Ref)
(declare-const s@24@00 $Ref)
(push) ; 2
; [eval] (s in refs) && exists_path(result, p, s) ==> (p in refs)
; [eval] (s in refs) && exists_path(result, p, s)
; [eval] (s in refs)
(push) ; 3
; [then-branch: 4 | !(s@24@00 in refs@0@00) | live]
; [else-branch: 4 | s@24@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 4 | !(s@24@00 in refs@0@00)]
(assert (not (Set_in s@24@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | s@24@00 in refs@0@00]
(assert (Set_in s@24@00 refs@0@00))
; [eval] exists_path(result, p, s)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s@24@00 refs@0@00) (not (Set_in s@24@00 refs@0@00))))
(push) ; 3
; [then-branch: 5 | s@24@00 in refs@0@00 && exists_path[Bool](result@1@00, p@23@00, s@24@00) | live]
; [else-branch: 5 | !(s@24@00 in refs@0@00 && exists_path[Bool](result@1@00, p@23@00, s@24@00)) | live]
(push) ; 4
; [then-branch: 5 | s@24@00 in refs@0@00 && exists_path[Bool](result@1@00, p@23@00, s@24@00)]
(assert (and (Set_in s@24@00 refs@0@00) (exists_path<Bool> result@1@00 p@23@00 s@24@00)))
; [eval] (p in refs)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(s@24@00 in refs@0@00 && exists_path[Bool](result@1@00, p@23@00, s@24@00))]
(assert (not
  (and
    (Set_in s@24@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@23@00 s@24@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s@24@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@23@00 s@24@00)))
  (and
    (Set_in s@24@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@23@00 s@24@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@23@00 $Ref) (s@24@00 $Ref)) (!
  (and
    (or (Set_in s@24@00 refs@0@00) (not (Set_in s@24@00 refs@0@00)))
    (or
      (not
        (and
          (Set_in s@24@00 refs@0@00)
          (exists_path<Bool> result@1@00 p@23@00 s@24@00)))
      (and
        (Set_in s@24@00 refs@0@00)
        (exists_path<Bool> result@1@00 p@23@00 s@24@00))))
  :pattern ((Set_in p@23@00 refs@0@00) (Set_in s@24@00 refs@0@00) (exists_path<Bool> result@1@00 p@23@00 s@24@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@315@13@317@63-aux|)))
(assert (forall ((p@23@00 $Ref) (s@24@00 $Ref)) (!
  (=>
    (and
      (Set_in s@24@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@23@00 s@24@00))
    (Set_in p@23@00 refs@0@00))
  :pattern ((Set_in p@23@00 refs@0@00) (Set_in s@24@00 refs@0@00) (exists_path<Bool> result@1@00 p@23@00 s@24@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@315@13@317@63|)))
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
    (forall ((n@13@00 $Ref)) (!
      (=>
        (Set_in n@13@00 refs@0@00)
        (and
          (= (inv@15@00 s@$ refs@0@00 n@13@00) n@13@00)
          (img@16@00 s@$ refs@0@00 n@13@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) n@13@00) n@13@00))
      :qid |quant-u-11|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@16@00 s@$ refs@0@00 r)
          (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00))
        (= (inv@15@00 s@$ refs@0@00 r) r))
      :pattern ((inv@15@00 s@$ refs@0@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@14@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@16@00 s@$ refs@0@00 r)
          (Set_in (inv@15@00 s@$ refs@0@00 r) refs@0@00))
        (=
          ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r)))
      :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r))
      :qid |qp.fvfValDef1|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> s@$) r) r)
      :pattern (($FVF.lookup_next (sm@17@00 s@$ refs@0@00) r))
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
                (= ($FVF.lookup_next (sm@17@00 s@$ refs@0@00) p) s)))
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
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-16|)))
; ---------- FUNCTION apply_TCFraming----------
(declare-fun g0@2@00 () Set<$Ref>)
(declare-fun g1@3@00 () Set<$Ref>)
(declare-fun result@4@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const n@25@00 $Ref)
(push) ; 2
; [eval] (n in g0)
(assert (Set_in n@25@00 g0@2@00))
(declare-fun sm@26@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@27@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@28@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@25@00 $Ref) (n2@25@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@25@00 g0@2@00)
      (Set_in n2@25@00 g0@2@00)
      (= n1@25@00 n2@25@00))
    (= n1@25@00 n2@25@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@25@00 $Ref)) (!
  (=>
    (Set_in n@25@00 g0@2@00)
    (and
      (= (inv@27@00 s@$ g0@2@00 g1@3@00 n@25@00) n@25@00)
      (img@28@00 s@$ g0@2@00 g1@3@00 n@25@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) n@25@00) n@25@00))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@27@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@27@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@25@00 $Ref)) (!
  (=> (Set_in n@25@00 g0@2@00) (not (= n@25@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) n@25@00) n@25@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@29@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@29@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@29@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_next (sm@29@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@27@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-19|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const n@30@00 $Ref)
(push) ; 2
; [eval] (n in g1)
(assert (Set_in n@30@00 g1@3@00))
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@31@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@32@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@30@00 $Ref) (n2@30@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@30@00 g1@3@00)
      (Set_in n2@30@00 g1@3@00)
      (= n1@30@00 n2@30@00))
    (= n1@30@00 n2@30@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@30@00 $Ref)) (!
  (=>
    (Set_in n@30@00 g1@3@00)
    (and
      (= (inv@31@00 s@$ g0@2@00 g1@3@00 n@30@00) n@30@00)
      (img@32@00 s@$ g0@2@00 g1@3@00 n@30@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@30@00) n@30@00))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@31@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@31@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@30@00 $Ref)) (!
  (=> (Set_in n@30@00 g1@3@00) (not (= n@30@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@30@00) n@30@00))
  :qid |next-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= n@30@00 n@25@00)
    (=
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))))
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@33@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@31@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-23|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] (g1 intersection g0) == Set[Ref]()
; [eval] (g1 intersection g0)
; [eval] Set[Ref]()
(assert (Set_equal (Set_intersection g1@3@00 g0@2@00) (as Set_empty  Set<$Ref>)))
(declare-const $t@34@00 $Snap)
(assert (= $t@34@00 ($Snap.combine ($Snap.first $t@34@00) ($Snap.second $t@34@00))))
(assert (= ($Snap.first $t@34@00) $Snap.unit))
; [eval] (g0 union g1) == (g1 union g0)
; [eval] (g0 union g1)
; [eval] (g1 union g0)
(assert (Set_equal (Set_union g0@2@00 g1@3@00) (Set_union g1@3@00 g0@2@00)))
(assert (=
  ($Snap.second $t@34@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@34@00))
    ($Snap.second ($Snap.second $t@34@00)))))
(assert (= ($Snap.first ($Snap.second $t@34@00)) $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g0), u, v) } { exists_path($$((g0 union g1)), u, v) } (u in g0) && ((v in g0) && exists_path($$(g0), u, v)) ==> exists_path($$((g0 union g1)), u, v))
(declare-const u@35@00 $Ref)
(declare-const v@36@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (u in g0) && ((v in g0) && exists_path($$(g0), u, v)) ==> exists_path($$((g0 union g1)), u, v)
; [eval] (u in g0) && ((v in g0) && exists_path($$(g0), u, v))
; [eval] (u in g0)
(push) ; 3
; [then-branch: 6 | !(u@35@00 in g0@2@00) | live]
; [else-branch: 6 | u@35@00 in g0@2@00 | live]
(push) ; 4
; [then-branch: 6 | !(u@35@00 in g0@2@00)]
(assert (not (Set_in u@35@00 g0@2@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | u@35@00 in g0@2@00]
(assert (Set_in u@35@00 g0@2@00))
; [eval] (v in g0)
(push) ; 5
; [then-branch: 7 | !(v@36@00 in g0@2@00) | live]
; [else-branch: 7 | v@36@00 in g0@2@00 | live]
(push) ; 6
; [then-branch: 7 | !(v@36@00 in g0@2@00)]
(assert (not (Set_in v@36@00 g0@2@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | v@36@00 in g0@2@00]
(assert (Set_in v@36@00 g0@2@00))
; [eval] exists_path($$(g0), u, v)
; [eval] $$(g0)
(push) ; 7
(declare-const n@37@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@37@00 g0@2@00))
(pop) ; 8
(declare-fun inv@38@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@39@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@37@00 $Ref) (n2@37@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@37@00 g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) n1@37@00) n1@37@00))
      (and
        (Set_in n2@37@00 g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) n2@37@00) n2@37@00))
      (= n1@37@00 n2@37@00))
    (= n1@37@00 n2@37@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@37@00 $Ref)) (!
  (=>
    (Set_in n@37@00 g0@2@00)
    (and
      (= (inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00) n@37@00)
      (img@39@00 s@$ g0@2@00 g1@3@00 n@37@00)))
  :pattern ((Set_in n@37@00 g0@2@00))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :pattern ((img@39@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@38@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-25|)))
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
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@39@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@38@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@28@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-27|))))
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
      (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@39@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@38@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@39@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@38@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@28@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@40@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef12|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((n@37@00 $Ref)) (!
  (=>
    (Set_in n@37@00 g0@2@00)
    (and
      (= (inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00) n@37@00)
      (img@39@00 s@$ g0@2@00 g1@3@00 n@37@00)))
  :pattern ((Set_in n@37@00 g0@2@00))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :pattern ((img@39@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@38@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-25|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((n@37@00 $Ref)) (!
  (=>
    (Set_in n@37@00 g0@2@00)
    (and
      (= (inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00) n@37@00)
      (img@39@00 s@$ g0@2@00 g1@3@00 n@37@00)))
  :pattern ((Set_in n@37@00 g0@2@00))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :pattern ((img@39@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@38@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (=>
  (Set_in v@36@00 g0@2@00)
  (and
    (Set_in v@36@00 g0@2@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-25|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00))))
(assert (or (Set_in v@36@00 g0@2@00) (not (Set_in v@36@00 g0@2@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((n@37@00 $Ref)) (!
  (=>
    (Set_in n@37@00 g0@2@00)
    (and
      (= (inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00) n@37@00)
      (img@39@00 s@$ g0@2@00 g1@3@00 n@37@00)))
  :pattern ((Set_in n@37@00 g0@2@00))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :pattern ((img@39@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@38@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (=>
  (Set_in u@35@00 g0@2@00)
  (and
    (Set_in u@35@00 g0@2@00)
    (=>
      (Set_in v@36@00 g0@2@00)
      (and
        (Set_in v@36@00 g0@2@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-25|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
    (or (Set_in v@36@00 g0@2@00) (not (Set_in v@36@00 g0@2@00))))))
(assert (or (Set_in u@35@00 g0@2@00) (not (Set_in u@35@00 g0@2@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | u@35@00 in g0@2@00 && v@36@00 in g0@2@00 && exists_path[Bool]($$(sm@40@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@35@00, v@36@00) | live]
; [else-branch: 8 | !(u@35@00 in g0@2@00 && v@36@00 in g0@2@00 && exists_path[Bool]($$(sm@40@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@35@00, v@36@00)) | live]
(push) ; 4
; [then-branch: 8 | u@35@00 in g0@2@00 && v@36@00 in g0@2@00 && exists_path[Bool]($$(sm@40@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@35@00, v@36@00)]
(assert (and
  (Set_in u@35@00 g0@2@00)
  (and
    (Set_in v@36@00 g0@2@00)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00))))
; [eval] exists_path($$((g0 union g1)), u, v)
; [eval] $$((g0 union g1))
; [eval] (g0 union g1)
(push) ; 5
(declare-const n@41@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@41@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 6
(declare-fun inv@42@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@43@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@44@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef15|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@41@00 $Ref) (n2@41@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@41@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) n1@41@00) n1@41@00))
      (and
        (Set_in n2@41@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) n2@41@00) n2@41@00))
      (= n1@41@00 n2@41@00))
    (= n1@41@00 n2@41@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@41@00 $Ref)) (!
  (=>
    (Set_in n@41@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00) n@41@00)
      (img@43@00 s@$ g0@2@00 g1@3@00 n@41@00)))
  :pattern ((Set_in n@41@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00))
  :pattern ((img@43@00 s@$ g0@2@00 g1@3@00 n@41@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@42@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-30|)))
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
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@43@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@28@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-32|))))
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
    (and
      (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@43@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@43@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@28@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-33|))))
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
          (img@32@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@43@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@32@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@43@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@28@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                $Perm.Write)
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-34|))))
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
    (and
      (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@43@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@43@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@28@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              $Perm.Write)
            $Perm.No))
        (ite
          (and
            (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@43@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@32@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              $Perm.Write
              (ite
                (and
                  (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@43@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@42@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@28@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  $Perm.Write)
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@45@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef19|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef18|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((n@41@00 $Ref)) (!
  (=>
    (Set_in n@41@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00) n@41@00)
      (img@43@00 s@$ g0@2@00 g1@3@00 n@41@00)))
  :pattern ((Set_in n@41@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00))
  :pattern ((img@43@00 s@$ g0@2@00 g1@3@00 n@41@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@42@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-30|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 8 | !(u@35@00 in g0@2@00 && v@36@00 in g0@2@00 && exists_path[Bool]($$(sm@40@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@35@00, v@36@00))]
(assert (not
  (and
    (Set_in u@35@00 g0@2@00)
    (and
      (Set_in v@36@00 g0@2@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((n@41@00 $Ref)) (!
  (=>
    (Set_in n@41@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00) n@41@00)
      (img@43@00 s@$ g0@2@00 g1@3@00 n@41@00)))
  :pattern ((Set_in n@41@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00))
  :pattern ((img@43@00 s@$ g0@2@00 g1@3@00 n@41@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@42@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (=>
  (and
    (Set_in u@35@00 g0@2@00)
    (and
      (Set_in v@36@00 g0@2@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)))
  (and
    (Set_in u@35@00 g0@2@00)
    (Set_in v@36@00 g0@2@00)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-30|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@35@00 g0@2@00)
      (and
        (Set_in v@36@00 g0@2@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00))))
  (and
    (Set_in u@35@00 g0@2@00)
    (and
      (Set_in v@36@00 g0@2@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@37@00 $Ref)) (!
  (=>
    (Set_in n@37@00 g0@2@00)
    (and
      (= (inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00) n@37@00)
      (img@39@00 s@$ g0@2@00 g1@3@00 n@37@00)))
  :pattern ((Set_in n@37@00 g0@2@00))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :pattern ((img@39@00 s@$ g0@2@00 g1@3@00 n@37@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@38@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@39@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((n@41@00 $Ref)) (!
  (=>
    (Set_in n@41@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00) n@41@00)
      (img@43@00 s@$ g0@2@00 g1@3@00 n@41@00)))
  :pattern ((Set_in n@41@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00))
  :pattern ((img@43@00 s@$ g0@2@00 g1@3@00 n@41@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@42@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@43@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@35@00 $Ref) (v@36@00 $Ref)) (!
  (and
    (=>
      (Set_in u@35@00 g0@2@00)
      (and
        (Set_in u@35@00 g0@2@00)
        (=>
          (Set_in v@36@00 g0@2@00)
          (and
            (Set_in v@36@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-25|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@36@00 g0@2@00) (not (Set_in v@36@00 g0@2@00)))))
    (or (Set_in u@35@00 g0@2@00) (not (Set_in u@35@00 g0@2@00)))
    (=>
      (and
        (Set_in u@35@00 g0@2@00)
        (and
          (Set_in v@36@00 g0@2@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)))
      (and
        (Set_in u@35@00 g0@2@00)
        (Set_in v@36@00 g0@2@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-30|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@35@00 g0@2@00)
          (and
            (Set_in v@36@00 g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00))))
      (and
        (Set_in u@35@00 g0@2@00)
        (and
          (Set_in v@36@00 g0@2@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@295@13@295@182-aux|)))
(assert (forall ((u@35@00 $Ref) (v@36@00 $Ref)) (!
  (and
    (=>
      (Set_in u@35@00 g0@2@00)
      (and
        (Set_in u@35@00 g0@2@00)
        (=>
          (Set_in v@36@00 g0@2@00)
          (and
            (Set_in v@36@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@33@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-25|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@36@00 g0@2@00) (not (Set_in v@36@00 g0@2@00)))))
    (or (Set_in u@35@00 g0@2@00) (not (Set_in u@35@00 g0@2@00)))
    (=>
      (and
        (Set_in u@35@00 g0@2@00)
        (and
          (Set_in v@36@00 g0@2@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)))
      (and
        (Set_in u@35@00 g0@2@00)
        (Set_in v@36@00 g0@2@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@44@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-30|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@35@00 g0@2@00)
          (and
            (Set_in v@36@00 g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00))))
      (and
        (Set_in u@35@00 g0@2@00)
        (and
          (Set_in v@36@00 g0@2@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@35@00 v@36@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@295@13@295@182-aux|)))
(assert (forall ((u@35@00 $Ref) (v@36@00 $Ref)) (!
  (=>
    (and
      (Set_in u@35@00 g0@2@00)
      (and
        (Set_in v@36@00 g0@2@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00)))
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@35@00 v@36@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@35@00 v@36@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@35@00 v@36@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@295@13@295@182|)))
(assert (=
  ($Snap.second ($Snap.second $t@34@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@34@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@34@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@34@00))) $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g1), u, v) } { exists_path($$((g1 union g0)), u, v) } (u in g1) && ((v in g1) && exists_path($$(g1), u, v)) ==> exists_path($$((g1 union g0)), u, v))
(declare-const u@46@00 $Ref)
(declare-const v@47@00 $Ref)
(push) ; 2
; [eval] (u in g1) && ((v in g1) && exists_path($$(g1), u, v)) ==> exists_path($$((g1 union g0)), u, v)
; [eval] (u in g1) && ((v in g1) && exists_path($$(g1), u, v))
; [eval] (u in g1)
(push) ; 3
; [then-branch: 9 | !(u@46@00 in g1@3@00) | live]
; [else-branch: 9 | u@46@00 in g1@3@00 | live]
(push) ; 4
; [then-branch: 9 | !(u@46@00 in g1@3@00)]
(assert (not (Set_in u@46@00 g1@3@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | u@46@00 in g1@3@00]
(assert (Set_in u@46@00 g1@3@00))
; [eval] (v in g1)
(push) ; 5
; [then-branch: 10 | !(v@47@00 in g1@3@00) | live]
; [else-branch: 10 | v@47@00 in g1@3@00 | live]
(push) ; 6
; [then-branch: 10 | !(v@47@00 in g1@3@00)]
(assert (not (Set_in v@47@00 g1@3@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | v@47@00 in g1@3@00]
(assert (Set_in v@47@00 g1@3@00))
; [eval] exists_path($$(g1), u, v)
; [eval] $$(g1)
(push) ; 7
(declare-const n@48@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@48@00 g1@3@00))
(pop) ; 8
(declare-fun inv@49@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@50@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@51@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@48@00 $Ref) (n2@48@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@48@00 g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) n1@48@00) n1@48@00))
      (and
        (Set_in n2@48@00 g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) n2@48@00) n2@48@00))
      (= n1@48@00 n2@48@00))
    (= n1@48@00 n2@48@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@48@00 $Ref)) (!
  (=>
    (Set_in n@48@00 g1@3@00)
    (and
      (= (inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00) n@48@00)
      (img@50@00 s@$ g0@2@00 g1@3@00 n@48@00)))
  :pattern ((Set_in n@48@00 g1@3@00))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :pattern ((img@50@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@49@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-37|)))
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
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@50@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@28@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
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
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        $Perm.Write)
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-40|))))
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
      (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@50@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@50@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@28@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-41|))))
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
          (img@32@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@50@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@32@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                (img@50@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@28@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                $Perm.Write)
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-42|))))
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
      (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@50@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@50@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@28@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              $Perm.Write)
            $Perm.No))
        (ite
          (and
            (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@50@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@32@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              $Perm.Write
              (ite
                (and
                  (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                  (img@50@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@49@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@28@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  $Perm.Write)
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@52@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef26|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((n@48@00 $Ref)) (!
  (=>
    (Set_in n@48@00 g1@3@00)
    (and
      (= (inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00) n@48@00)
      (img@50@00 s@$ g0@2@00 g1@3@00 n@48@00)))
  :pattern ((Set_in n@48@00 g1@3@00))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :pattern ((img@50@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@49@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-37|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((n@48@00 $Ref)) (!
  (=>
    (Set_in n@48@00 g1@3@00)
    (and
      (= (inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00) n@48@00)
      (img@50@00 s@$ g0@2@00 g1@3@00 n@48@00)))
  :pattern ((Set_in n@48@00 g1@3@00))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :pattern ((img@50@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@49@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (=>
  (Set_in v@47@00 g1@3@00)
  (and
    (Set_in v@47@00 g1@3@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-37|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00))))
(assert (or (Set_in v@47@00 g1@3@00) (not (Set_in v@47@00 g1@3@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((n@48@00 $Ref)) (!
  (=>
    (Set_in n@48@00 g1@3@00)
    (and
      (= (inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00) n@48@00)
      (img@50@00 s@$ g0@2@00 g1@3@00 n@48@00)))
  :pattern ((Set_in n@48@00 g1@3@00))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :pattern ((img@50@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@49@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (=>
  (Set_in u@46@00 g1@3@00)
  (and
    (Set_in u@46@00 g1@3@00)
    (=>
      (Set_in v@47@00 g1@3@00)
      (and
        (Set_in v@47@00 g1@3@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-37|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
    (or (Set_in v@47@00 g1@3@00) (not (Set_in v@47@00 g1@3@00))))))
(assert (or (Set_in u@46@00 g1@3@00) (not (Set_in u@46@00 g1@3@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | u@46@00 in g1@3@00 && v@47@00 in g1@3@00 && exists_path[Bool]($$(sm@52@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@46@00, v@47@00) | live]
; [else-branch: 11 | !(u@46@00 in g1@3@00 && v@47@00 in g1@3@00 && exists_path[Bool]($$(sm@52@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@46@00, v@47@00)) | live]
(push) ; 4
; [then-branch: 11 | u@46@00 in g1@3@00 && v@47@00 in g1@3@00 && exists_path[Bool]($$(sm@52@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@46@00, v@47@00)]
(assert (and
  (Set_in u@46@00 g1@3@00)
  (and
    (Set_in v@47@00 g1@3@00)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00))))
; [eval] exists_path($$((g1 union g0)), u, v)
; [eval] $$((g1 union g0))
; [eval] (g1 union g0)
(push) ; 5
(declare-const n@53@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@53@00 (Set_union g1@3@00 g0@2@00)))
(pop) ; 6
(declare-fun inv@54@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@55@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@56@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef29|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@53@00 $Ref) (n2@53@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@53@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) n1@53@00) n1@53@00))
      (and
        (Set_in n2@53@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) n2@53@00) n2@53@00))
      (= n1@53@00 n2@53@00))
    (= n1@53@00 n2@53@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@53@00 $Ref)) (!
  (=>
    (Set_in n@53@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00) n@53@00)
      (img@55@00 s@$ g0@2@00 g1@3@00 n@53@00)))
  :pattern ((Set_in n@53@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00))
  :pattern ((img@55@00 s@$ g0@2@00 g1@3@00 n@53@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@54@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-45|)))
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
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@55@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@28@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-47|))))
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
    (and
      (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@55@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@55@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@28@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-48|))))
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
          (img@32@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@55@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@32@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                (img@55@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@28@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                $Perm.Write)
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-49|))))
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
    (and
      (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@55@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@55@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@28@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              $Perm.Write)
            $Perm.No))
        (ite
          (and
            (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@55@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@32@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              $Perm.Write
              (ite
                (and
                  (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                  (img@55@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@54@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@28@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  $Perm.Write)
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
(declare-fun sm@57@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef32|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((n@53@00 $Ref)) (!
  (=>
    (Set_in n@53@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00) n@53@00)
      (img@55@00 s@$ g0@2@00 g1@3@00 n@53@00)))
  :pattern ((Set_in n@53@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00))
  :pattern ((img@55@00 s@$ g0@2@00 g1@3@00 n@53@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@54@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-45|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(u@46@00 in g1@3@00 && v@47@00 in g1@3@00 && exists_path[Bool]($$(sm@52@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@46@00, v@47@00))]
(assert (not
  (and
    (Set_in u@46@00 g1@3@00)
    (and
      (Set_in v@47@00 g1@3@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((n@53@00 $Ref)) (!
  (=>
    (Set_in n@53@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00) n@53@00)
      (img@55@00 s@$ g0@2@00 g1@3@00 n@53@00)))
  :pattern ((Set_in n@53@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00))
  :pattern ((img@55@00 s@$ g0@2@00 g1@3@00 n@53@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@54@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (=>
  (and
    (Set_in u@46@00 g1@3@00)
    (and
      (Set_in v@47@00 g1@3@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)))
  (and
    (Set_in u@46@00 g1@3@00)
    (Set_in v@47@00 g1@3@00)
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-45|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@46@00 g1@3@00)
      (and
        (Set_in v@47@00 g1@3@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00))))
  (and
    (Set_in u@46@00 g1@3@00)
    (and
      (Set_in v@47@00 g1@3@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((n@48@00 $Ref)) (!
  (=>
    (Set_in n@48@00 g1@3@00)
    (and
      (= (inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00) n@48@00)
      (img@50@00 s@$ g0@2@00 g1@3@00 n@48@00)))
  :pattern ((Set_in n@48@00 g1@3@00))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :pattern ((img@50@00 s@$ g0@2@00 g1@3@00 n@48@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@49@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@50@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((n@53@00 $Ref)) (!
  (=>
    (Set_in n@53@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00) n@53@00)
      (img@55@00 s@$ g0@2@00 g1@3@00 n@53@00)))
  :pattern ((Set_in n@53@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00))
  :pattern ((img@55@00 s@$ g0@2@00 g1@3@00 n@53@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@54@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@55@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef32|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@46@00 $Ref) (v@47@00 $Ref)) (!
  (and
    (=>
      (Set_in u@46@00 g1@3@00)
      (and
        (Set_in u@46@00 g1@3@00)
        (=>
          (Set_in v@47@00 g1@3@00)
          (and
            (Set_in v@47@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-37|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@47@00 g1@3@00) (not (Set_in v@47@00 g1@3@00)))))
    (or (Set_in u@46@00 g1@3@00) (not (Set_in u@46@00 g1@3@00)))
    (=>
      (and
        (Set_in u@46@00 g1@3@00)
        (and
          (Set_in v@47@00 g1@3@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)))
      (and
        (Set_in u@46@00 g1@3@00)
        (Set_in v@47@00 g1@3@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-45|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@46@00 g1@3@00)
          (and
            (Set_in v@47@00 g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00))))
      (and
        (Set_in u@46@00 g1@3@00)
        (and
          (Set_in v@47@00 g1@3@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@296@13@296@182-aux|)))
(assert (forall ((u@46@00 $Ref) (v@47@00 $Ref)) (!
  (and
    (=>
      (Set_in u@46@00 g1@3@00)
      (and
        (Set_in u@46@00 g1@3@00)
        (=>
          (Set_in v@47@00 g1@3@00)
          (and
            (Set_in v@47@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-37|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@47@00 g1@3@00) (not (Set_in v@47@00 g1@3@00)))))
    (or (Set_in u@46@00 g1@3@00) (not (Set_in u@46@00 g1@3@00)))
    (=>
      (and
        (Set_in u@46@00 g1@3@00)
        (and
          (Set_in v@47@00 g1@3@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)))
      (and
        (Set_in u@46@00 g1@3@00)
        (Set_in v@47@00 g1@3@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@56@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-45|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@46@00 g1@3@00)
          (and
            (Set_in v@47@00 g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00))))
      (and
        (Set_in u@46@00 g1@3@00)
        (and
          (Set_in v@47@00 g1@3@00)
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@46@00 v@47@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@296@13@296@182-aux|)))
(assert (forall ((u@46@00 $Ref) (v@47@00 $Ref)) (!
  (=>
    (and
      (Set_in u@46@00 g1@3@00)
      (and
        (Set_in v@47@00 g1@3@00)
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00)))
    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@46@00 v@47@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@46@00 v@47@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@46@00 v@47@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@296@13@296@182|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@34@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@34@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@34@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@34@00))))
  $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { (u in g0), (v in g0) } { (u in g0), exists_path($$(g0), u, v) } { (u in g0), exists_path($$((g0 union g1)), u, v) } { (v in g0), exists_path($$(g0), u, v) } { (v in g0), exists_path($$((g0 union g1)), u, v) } { exists_path($$(g0), u, v) } { exists_path($$((g0 union g1)), u, v) } (u in g0) && ((v in g0) && !exists_path($$(g0), u, v)) ==> !exists_path($$((g0 union g1)), u, v))
(declare-const u@58@00 $Ref)
(declare-const v@59@00 $Ref)
(push) ; 2
; [eval] (u in g0) && ((v in g0) && !exists_path($$(g0), u, v)) ==> !exists_path($$((g0 union g1)), u, v)
; [eval] (u in g0) && ((v in g0) && !exists_path($$(g0), u, v))
; [eval] (u in g0)
(push) ; 3
; [then-branch: 12 | !(u@58@00 in g0@2@00) | live]
; [else-branch: 12 | u@58@00 in g0@2@00 | live]
(push) ; 4
; [then-branch: 12 | !(u@58@00 in g0@2@00)]
(assert (not (Set_in u@58@00 g0@2@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | u@58@00 in g0@2@00]
(assert (Set_in u@58@00 g0@2@00))
; [eval] (v in g0)
(push) ; 5
; [then-branch: 13 | !(v@59@00 in g0@2@00) | live]
; [else-branch: 13 | v@59@00 in g0@2@00 | live]
(push) ; 6
; [then-branch: 13 | !(v@59@00 in g0@2@00)]
(assert (not (Set_in v@59@00 g0@2@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | v@59@00 in g0@2@00]
(assert (Set_in v@59@00 g0@2@00))
; [eval] !exists_path($$(g0), u, v)
; [eval] exists_path($$(g0), u, v)
; [eval] $$(g0)
(push) ; 7
(declare-const n@60@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@60@00 g0@2@00))
(pop) ; 8
(declare-fun inv@61@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@62@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@63@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@60@00 $Ref) (n2@60@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@60@00 g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) n1@60@00) n1@60@00))
      (and
        (Set_in n2@60@00 g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) n2@60@00) n2@60@00))
      (= n1@60@00 n2@60@00))
    (= n1@60@00 n2@60@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@60@00 $Ref)) (!
  (=>
    (Set_in n@60@00 g0@2@00)
    (and
      (= (inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00) n@60@00)
      (img@62@00 s@$ g0@2@00 g1@3@00 n@60@00)))
  :pattern ((Set_in n@60@00 g0@2@00))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :pattern ((img@62@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@61@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
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
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@62@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@61@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@28@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-54|))))
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
      (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@62@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@61@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@62@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@61@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@28@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@64@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef40|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@60@00 $Ref)) (!
  (=>
    (Set_in n@60@00 g0@2@00)
    (and
      (= (inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00) n@60@00)
      (img@62@00 s@$ g0@2@00 g1@3@00 n@60@00)))
  :pattern ((Set_in n@60@00 g0@2@00))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :pattern ((img@62@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@61@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-52|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@60@00 $Ref)) (!
  (=>
    (Set_in n@60@00 g0@2@00)
    (and
      (= (inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00) n@60@00)
      (img@62@00 s@$ g0@2@00 g1@3@00 n@60@00)))
  :pattern ((Set_in n@60@00 g0@2@00))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :pattern ((img@62@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@61@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (=>
  (Set_in v@59@00 g0@2@00)
  (and
    (Set_in v@59@00 g0@2@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-52|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00))))
(assert (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@60@00 $Ref)) (!
  (=>
    (Set_in n@60@00 g0@2@00)
    (and
      (= (inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00) n@60@00)
      (img@62@00 s@$ g0@2@00 g1@3@00 n@60@00)))
  :pattern ((Set_in n@60@00 g0@2@00))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :pattern ((img@62@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@61@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (=>
  (Set_in u@58@00 g0@2@00)
  (and
    (Set_in u@58@00 g0@2@00)
    (=>
      (Set_in v@59@00 g0@2@00)
      (and
        (Set_in v@59@00 g0@2@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-52|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
    (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00))))))
(assert (or (Set_in u@58@00 g0@2@00) (not (Set_in u@58@00 g0@2@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | u@58@00 in g0@2@00 && v@59@00 in g0@2@00 && !(exists_path[Bool]($$(sm@64@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@58@00, v@59@00)) | live]
; [else-branch: 14 | !(u@58@00 in g0@2@00 && v@59@00 in g0@2@00 && !(exists_path[Bool]($$(sm@64@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@58@00, v@59@00))) | live]
(push) ; 4
; [then-branch: 14 | u@58@00 in g0@2@00 && v@59@00 in g0@2@00 && !(exists_path[Bool]($$(sm@64@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@58@00, v@59@00))]
(assert (and
  (Set_in u@58@00 g0@2@00)
  (and
    (Set_in v@59@00 g0@2@00)
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
; [eval] !exists_path($$((g0 union g1)), u, v)
; [eval] exists_path($$((g0 union g1)), u, v)
; [eval] $$((g0 union g1))
; [eval] (g0 union g1)
(push) ; 5
(declare-const n@65@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@65@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 6
(declare-fun inv@66@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@67@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@68@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef43|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@65@00 $Ref) (n2@65@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@65@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) n1@65@00) n1@65@00))
      (and
        (Set_in n2@65@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) n2@65@00) n2@65@00))
      (= n1@65@00 n2@65@00))
    (= n1@65@00 n2@65@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@65@00 $Ref)) (!
  (=>
    (Set_in n@65@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00) n@65@00)
      (img@67@00 s@$ g0@2@00 g1@3@00 n@65@00)))
  :pattern ((Set_in n@65@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00))
  :pattern ((img@67@00 s@$ g0@2@00 g1@3@00 n@65@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@67@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@66@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-57|)))
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
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@67@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@28@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-59|))))
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
    (and
      (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@67@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@67@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@28@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-60|))))
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
          (img@32@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@67@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@32@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@67@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@28@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                $Perm.Write)
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-61|))))
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
    (and
      (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@67@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@67@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@28@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              $Perm.Write)
            $Perm.No))
        (ite
          (and
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@67@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@32@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              $Perm.Write
              (ite
                (and
                  (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@67@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@66@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@28@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  $Perm.Write)
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@69@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef47|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef46|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@65@00 $Ref)) (!
  (=>
    (Set_in n@65@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00) n@65@00)
      (img@67@00 s@$ g0@2@00 g1@3@00 n@65@00)))
  :pattern ((Set_in n@65@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00))
  :pattern ((img@67@00 s@$ g0@2@00 g1@3@00 n@65@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@67@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@66@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-57|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 14 | !(u@58@00 in g0@2@00 && v@59@00 in g0@2@00 && !(exists_path[Bool]($$(sm@64@00(s@$, g0@2@00, g1@3@00), g0@2@00), u@58@00, v@59@00)))]
(assert (not
  (and
    (Set_in u@58@00 g0@2@00)
    (and
      (Set_in v@59@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@65@00 $Ref)) (!
  (=>
    (Set_in n@65@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00) n@65@00)
      (img@67@00 s@$ g0@2@00 g1@3@00 n@65@00)))
  :pattern ((Set_in n@65@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00))
  :pattern ((img@67@00 s@$ g0@2@00 g1@3@00 n@65@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@67@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@66@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (=>
  (and
    (Set_in u@58@00 g0@2@00)
    (and
      (Set_in v@59@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
  (and
    (Set_in u@58@00 g0@2@00)
    (Set_in v@59@00 g0@2@00)
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-57|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
  (and
    (Set_in u@58@00 g0@2@00)
    (and
      (Set_in v@59@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (forall ((n@60@00 $Ref)) (!
  (=>
    (Set_in n@60@00 g0@2@00)
    (and
      (= (inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00) n@60@00)
      (img@62@00 s@$ g0@2@00 g1@3@00 n@60@00)))
  :pattern ((Set_in n@60@00 g0@2@00))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :pattern ((img@62@00 s@$ g0@2@00 g1@3@00 n@60@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@61@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@62@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (forall ((n@65@00 $Ref)) (!
  (=>
    (Set_in n@65@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00) n@65@00)
      (img@67@00 s@$ g0@2@00 g1@3@00 n@65@00)))
  :pattern ((Set_in n@65@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00))
  :pattern ((img@67@00 s@$ g0@2@00 g1@3@00 n@65@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@67@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@66@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@67@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef46|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@58@00 $Ref) (v@59@00 $Ref)) (!
  (and
    (=>
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in u@58@00 g0@2@00)
        (=>
          (Set_in v@59@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00)))))
    (or (Set_in u@58@00 g0@2@00) (not (Set_in u@58@00 g0@2@00)))
    (=>
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
      (and
        (Set_in u@58@00 g0@2@00)
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-57|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@58@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
  :pattern ((Set_in u@58@00 g0@2@00) (Set_in v@59@00 g0@2@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@297@13@297@120-aux|)))
(assert (forall ((u@58@00 $Ref) (v@59@00 $Ref)) (!
  (and
    (=>
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in u@58@00 g0@2@00)
        (=>
          (Set_in v@59@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00)))))
    (or (Set_in u@58@00 g0@2@00) (not (Set_in u@58@00 g0@2@00)))
    (=>
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
      (and
        (Set_in u@58@00 g0@2@00)
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-57|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@58@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
  :pattern ((Set_in u@58@00 g0@2@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@297@13@297@120-aux|)))
(assert (forall ((u@58@00 $Ref) (v@59@00 $Ref)) (!
  (and
    (=>
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in u@58@00 g0@2@00)
        (=>
          (Set_in v@59@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00)))))
    (or (Set_in u@58@00 g0@2@00) (not (Set_in u@58@00 g0@2@00)))
    (=>
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
      (and
        (Set_in u@58@00 g0@2@00)
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-57|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@58@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
  :pattern ((Set_in u@58@00 g0@2@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@58@00 v@59@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@297@13@297@120-aux|)))
(assert (forall ((u@58@00 $Ref) (v@59@00 $Ref)) (!
  (and
    (=>
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in u@58@00 g0@2@00)
        (=>
          (Set_in v@59@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00)))))
    (or (Set_in u@58@00 g0@2@00) (not (Set_in u@58@00 g0@2@00)))
    (=>
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
      (and
        (Set_in u@58@00 g0@2@00)
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-57|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@58@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
  :pattern ((Set_in v@59@00 g0@2@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@297@13@297@120-aux|)))
(assert (forall ((u@58@00 $Ref) (v@59@00 $Ref)) (!
  (and
    (=>
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in u@58@00 g0@2@00)
        (=>
          (Set_in v@59@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00)))))
    (or (Set_in u@58@00 g0@2@00) (not (Set_in u@58@00 g0@2@00)))
    (=>
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
      (and
        (Set_in u@58@00 g0@2@00)
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-57|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@58@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
  :pattern ((Set_in v@59@00 g0@2@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@58@00 v@59@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@297@13@297@120-aux|)))
(assert (forall ((u@58@00 $Ref) (v@59@00 $Ref)) (!
  (and
    (=>
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in u@58@00 g0@2@00)
        (=>
          (Set_in v@59@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00)))))
    (or (Set_in u@58@00 g0@2@00) (not (Set_in u@58@00 g0@2@00)))
    (=>
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
      (and
        (Set_in u@58@00 g0@2@00)
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-57|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@58@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@297@13@297@120-aux|)))
(assert (forall ((u@58@00 $Ref) (v@59@00 $Ref)) (!
  (and
    (=>
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in u@58@00 g0@2@00)
        (=>
          (Set_in v@59@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@63@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-52|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00)))
        (or (Set_in v@59@00 g0@2@00) (not (Set_in v@59@00 g0@2@00)))))
    (or (Set_in u@58@00 g0@2@00) (not (Set_in u@58@00 g0@2@00)))
    (=>
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
      (and
        (Set_in u@58@00 g0@2@00)
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@68@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-57|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@58@00 g0@2@00)
          (and
            (Set_in v@59@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00)))))
      (and
        (Set_in u@58@00 g0@2@00)
        (and
          (Set_in v@59@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@58@00 v@59@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@297@13@297@120-aux|)))
(assert (forall ((u@58@00 $Ref) (v@59@00 $Ref)) (!
  (=>
    (and
      (Set_in u@58@00 g0@2@00)
      (and
        (Set_in v@59@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))))
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@58@00 v@59@00)))
  :pattern ((Set_in u@58@00 g0@2@00) (Set_in v@59@00 g0@2@00))
  :pattern ((Set_in u@58@00 g0@2@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
  :pattern ((Set_in u@58@00 g0@2@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@58@00 v@59@00))
  :pattern ((Set_in v@59@00 g0@2@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
  :pattern ((Set_in v@59@00 g0@2@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@58@00 v@59@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u@58@00 v@59@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00)) (Set_union g0@2@00 g1@3@00)) u@58@00 v@59@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@297@13@297@120|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@34@00))))
  $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { (u in g1), (v in g1) } { (u in g1), exists_path($$(g1), u, v) } { (u in g1), exists_path($$((g1 union g0)), u, v) } { (v in g1), exists_path($$(g1), u, v) } { (v in g1), exists_path($$((g1 union g0)), u, v) } { exists_path($$(g1), u, v) } { exists_path($$((g1 union g0)), u, v) } (u in g1) && ((v in g1) && !exists_path($$(g1), u, v)) ==> !exists_path($$((g1 union g0)), u, v))
(declare-const u@70@00 $Ref)
(declare-const v@71@00 $Ref)
(push) ; 2
; [eval] (u in g1) && ((v in g1) && !exists_path($$(g1), u, v)) ==> !exists_path($$((g1 union g0)), u, v)
; [eval] (u in g1) && ((v in g1) && !exists_path($$(g1), u, v))
; [eval] (u in g1)
(push) ; 3
; [then-branch: 15 | !(u@70@00 in g1@3@00) | live]
; [else-branch: 15 | u@70@00 in g1@3@00 | live]
(push) ; 4
; [then-branch: 15 | !(u@70@00 in g1@3@00)]
(assert (not (Set_in u@70@00 g1@3@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | u@70@00 in g1@3@00]
(assert (Set_in u@70@00 g1@3@00))
; [eval] (v in g1)
(push) ; 5
; [then-branch: 16 | !(v@71@00 in g1@3@00) | live]
; [else-branch: 16 | v@71@00 in g1@3@00 | live]
(push) ; 6
; [then-branch: 16 | !(v@71@00 in g1@3@00)]
(assert (not (Set_in v@71@00 g1@3@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | v@71@00 in g1@3@00]
(assert (Set_in v@71@00 g1@3@00))
; [eval] !exists_path($$(g1), u, v)
; [eval] exists_path($$(g1), u, v)
; [eval] $$(g1)
(push) ; 7
(declare-const n@72@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@72@00 g1@3@00))
(pop) ; 8
(declare-fun inv@73@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@74@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@75@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@72@00 $Ref) (n2@72@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@72@00 g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) n1@72@00) n1@72@00))
      (and
        (Set_in n2@72@00 g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) n2@72@00) n2@72@00))
      (= n1@72@00 n2@72@00))
    (= n1@72@00 n2@72@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@72@00 $Ref)) (!
  (=>
    (Set_in n@72@00 g1@3@00)
    (and
      (= (inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00) n@72@00)
      (img@74@00 s@$ g0@2@00 g1@3@00 n@72@00)))
  :pattern ((Set_in n@72@00 g1@3@00))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :pattern ((img@74@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@74@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@73@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-64|)))
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
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@74@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@28@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-66|))))
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
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        $Perm.Write)
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-67|))))
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
      (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@74@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@74@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@28@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-68|))))
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
          (img@32@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@74@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@32@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                (img@74@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@28@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                $Perm.Write)
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-69|))))
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
      (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@74@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@74@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@28@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              $Perm.Write)
            $Perm.No))
        (ite
          (and
            (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@74@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@32@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              $Perm.Write
              (ite
                (and
                  (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                  (img@74@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@73@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@28@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  $Perm.Write)
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@76@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef54|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@72@00 $Ref)) (!
  (=>
    (Set_in n@72@00 g1@3@00)
    (and
      (= (inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00) n@72@00)
      (img@74@00 s@$ g0@2@00 g1@3@00 n@72@00)))
  :pattern ((Set_in n@72@00 g1@3@00))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :pattern ((img@74@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@74@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@73@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-64|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@72@00 $Ref)) (!
  (=>
    (Set_in n@72@00 g1@3@00)
    (and
      (= (inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00) n@72@00)
      (img@74@00 s@$ g0@2@00 g1@3@00 n@72@00)))
  :pattern ((Set_in n@72@00 g1@3@00))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :pattern ((img@74@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@74@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@73@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (=>
  (Set_in v@71@00 g1@3@00)
  (and
    (Set_in v@71@00 g1@3@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-64|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00))))
(assert (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@72@00 $Ref)) (!
  (=>
    (Set_in n@72@00 g1@3@00)
    (and
      (= (inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00) n@72@00)
      (img@74@00 s@$ g0@2@00 g1@3@00 n@72@00)))
  :pattern ((Set_in n@72@00 g1@3@00))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :pattern ((img@74@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@74@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@73@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (=>
  (Set_in u@70@00 g1@3@00)
  (and
    (Set_in u@70@00 g1@3@00)
    (=>
      (Set_in v@71@00 g1@3@00)
      (and
        (Set_in v@71@00 g1@3@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-64|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
    (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00))))))
(assert (or (Set_in u@70@00 g1@3@00) (not (Set_in u@70@00 g1@3@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | u@70@00 in g1@3@00 && v@71@00 in g1@3@00 && !(exists_path[Bool]($$(sm@76@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@70@00, v@71@00)) | live]
; [else-branch: 17 | !(u@70@00 in g1@3@00 && v@71@00 in g1@3@00 && !(exists_path[Bool]($$(sm@76@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@70@00, v@71@00))) | live]
(push) ; 4
; [then-branch: 17 | u@70@00 in g1@3@00 && v@71@00 in g1@3@00 && !(exists_path[Bool]($$(sm@76@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@70@00, v@71@00))]
(assert (and
  (Set_in u@70@00 g1@3@00)
  (and
    (Set_in v@71@00 g1@3@00)
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
; [eval] !exists_path($$((g1 union g0)), u, v)
; [eval] exists_path($$((g1 union g0)), u, v)
; [eval] $$((g1 union g0))
; [eval] (g1 union g0)
(push) ; 5
(declare-const n@77@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@77@00 (Set_union g1@3@00 g0@2@00)))
(pop) ; 6
(declare-fun inv@78@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@79@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@80@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef57|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@77@00 $Ref) (n2@77@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@77@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) n1@77@00) n1@77@00))
      (and
        (Set_in n2@77@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) n2@77@00) n2@77@00))
      (= n1@77@00 n2@77@00))
    (= n1@77@00 n2@77@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@77@00 $Ref)) (!
  (=>
    (Set_in n@77@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00) n@77@00)
      (img@79@00 s@$ g0@2@00 g1@3@00 n@77@00)))
  :pattern ((Set_in n@77@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00))
  :pattern ((img@79@00 s@$ g0@2@00 g1@3@00 n@77@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@79@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@78@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
    ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-72|)))
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
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@79@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@28@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-74|))))
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
    (and
      (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@79@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@79@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@28@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
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
          (img@32@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@79@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@32@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                (img@79@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@28@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                $Perm.Write)
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-76|))))
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
    (and
      (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@79@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@79@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@28@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              $Perm.Write)
            $Perm.No))
        (ite
          (and
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@79@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@32@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              $Perm.Write
              (ite
                (and
                  (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                  (img@79@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@78@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@28@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  $Perm.Write)
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@81@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef61|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef60|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (forall ((n@77@00 $Ref)) (!
  (=>
    (Set_in n@77@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00) n@77@00)
      (img@79@00 s@$ g0@2@00 g1@3@00 n@77@00)))
  :pattern ((Set_in n@77@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00))
  :pattern ((img@79@00 s@$ g0@2@00 g1@3@00 n@77@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@79@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@78@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-72|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 17 | !(u@70@00 in g1@3@00 && v@71@00 in g1@3@00 && !(exists_path[Bool]($$(sm@76@00(s@$, g0@2@00, g1@3@00), g1@3@00), u@70@00, v@71@00)))]
(assert (not
  (and
    (Set_in u@70@00 g1@3@00)
    (and
      (Set_in v@71@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (forall ((n@77@00 $Ref)) (!
  (=>
    (Set_in n@77@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00) n@77@00)
      (img@79@00 s@$ g0@2@00 g1@3@00 n@77@00)))
  :pattern ((Set_in n@77@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00))
  :pattern ((img@79@00 s@$ g0@2@00 g1@3@00 n@77@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@79@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@78@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (=>
  (and
    (Set_in u@70@00 g1@3@00)
    (and
      (Set_in v@71@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
  (and
    (Set_in u@70@00 g1@3@00)
    (Set_in v@71@00 g1@3@00)
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-72|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
  (and
    (Set_in u@70@00 g1@3@00)
    (and
      (Set_in v@71@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@72@00 $Ref)) (!
  (=>
    (Set_in n@72@00 g1@3@00)
    (and
      (= (inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00) n@72@00)
      (img@74@00 s@$ g0@2@00 g1@3@00 n@72@00)))
  :pattern ((Set_in n@72@00 g1@3@00))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :pattern ((img@74@00 s@$ g0@2@00 g1@3@00 n@72@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@74@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@73@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@74@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (forall ((n@77@00 $Ref)) (!
  (=>
    (Set_in n@77@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00) n@77@00)
      (img@79@00 s@$ g0@2@00 g1@3@00 n@77@00)))
  :pattern ((Set_in n@77@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00))
  :pattern ((img@79@00 s@$ g0@2@00 g1@3@00 n@77@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@79@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@78@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@28@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@79@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@32@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef60|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@70@00 $Ref) (v@71@00 $Ref)) (!
  (and
    (=>
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in u@70@00 g1@3@00)
        (=>
          (Set_in v@71@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-64|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00)))))
    (or (Set_in u@70@00 g1@3@00) (not (Set_in u@70@00 g1@3@00)))
    (=>
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
      (and
        (Set_in u@70@00 g1@3@00)
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-72|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@70@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
  :pattern ((Set_in u@70@00 g1@3@00) (Set_in v@71@00 g1@3@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@298@13@298@120-aux|)))
(assert (forall ((u@70@00 $Ref) (v@71@00 $Ref)) (!
  (and
    (=>
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in u@70@00 g1@3@00)
        (=>
          (Set_in v@71@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-64|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00)))))
    (or (Set_in u@70@00 g1@3@00) (not (Set_in u@70@00 g1@3@00)))
    (=>
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
      (and
        (Set_in u@70@00 g1@3@00)
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-72|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@70@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
  :pattern ((Set_in u@70@00 g1@3@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@298@13@298@120-aux|)))
(assert (forall ((u@70@00 $Ref) (v@71@00 $Ref)) (!
  (and
    (=>
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in u@70@00 g1@3@00)
        (=>
          (Set_in v@71@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-64|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00)))))
    (or (Set_in u@70@00 g1@3@00) (not (Set_in u@70@00 g1@3@00)))
    (=>
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
      (and
        (Set_in u@70@00 g1@3@00)
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-72|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@70@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
  :pattern ((Set_in u@70@00 g1@3@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@70@00 v@71@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@298@13@298@120-aux|)))
(assert (forall ((u@70@00 $Ref) (v@71@00 $Ref)) (!
  (and
    (=>
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in u@70@00 g1@3@00)
        (=>
          (Set_in v@71@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-64|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00)))))
    (or (Set_in u@70@00 g1@3@00) (not (Set_in u@70@00 g1@3@00)))
    (=>
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
      (and
        (Set_in u@70@00 g1@3@00)
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-72|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@70@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
  :pattern ((Set_in v@71@00 g1@3@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@298@13@298@120-aux|)))
(assert (forall ((u@70@00 $Ref) (v@71@00 $Ref)) (!
  (and
    (=>
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in u@70@00 g1@3@00)
        (=>
          (Set_in v@71@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-64|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00)))))
    (or (Set_in u@70@00 g1@3@00) (not (Set_in u@70@00 g1@3@00)))
    (=>
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
      (and
        (Set_in u@70@00 g1@3@00)
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-72|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@70@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
  :pattern ((Set_in v@71@00 g1@3@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@70@00 v@71@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@298@13@298@120-aux|)))
(assert (forall ((u@70@00 $Ref) (v@71@00 $Ref)) (!
  (and
    (=>
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in u@70@00 g1@3@00)
        (=>
          (Set_in v@71@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-64|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00)))))
    (or (Set_in u@70@00 g1@3@00) (not (Set_in u@70@00 g1@3@00)))
    (=>
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
      (and
        (Set_in u@70@00 g1@3@00)
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-72|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@70@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@298@13@298@120-aux|)))
(assert (forall ((u@70@00 $Ref) (v@71@00 $Ref)) (!
  (and
    (=>
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in u@70@00 g1@3@00)
        (=>
          (Set_in v@71@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-64|))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00)))
        (or (Set_in v@71@00 g1@3@00) (not (Set_in v@71@00 g1@3@00)))))
    (or (Set_in u@70@00 g1@3@00) (not (Set_in u@70@00 g1@3@00)))
    (=>
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
      (and
        (Set_in u@70@00 g1@3@00)
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_next ($FVF.lookup_next (sm@80@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-72|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@70@00 g1@3@00)
          (and
            (Set_in v@71@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00)))))
      (and
        (Set_in u@70@00 g1@3@00)
        (and
          (Set_in v@71@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@70@00 v@71@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@298@13@298@120-aux|)))
(assert (forall ((u@70@00 $Ref) (v@71@00 $Ref)) (!
  (=>
    (and
      (Set_in u@70@00 g1@3@00)
      (and
        (Set_in v@71@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))))
    (not
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@70@00 v@71@00)))
  :pattern ((Set_in u@70@00 g1@3@00) (Set_in v@71@00 g1@3@00))
  :pattern ((Set_in u@70@00 g1@3@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
  :pattern ((Set_in u@70@00 g1@3@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@70@00 v@71@00))
  :pattern ((Set_in v@71@00 g1@3@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
  :pattern ((Set_in v@71@00 g1@3@00) (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@70@00 v@71@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u@70@00 v@71@00))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00)) (Set_union g1@3@00 g0@2@00)) u@70@00 v@71@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@298@13@298@120|)))
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
    (forall ((n@25@00 $Ref)) (!
      (=>
        (Set_in n@25@00 g0@2@00)
        (and
          (= (inv@27@00 s@$ g0@2@00 g1@3@00 n@25@00) n@25@00)
          (img@28@00 s@$ g0@2@00 g1@3@00 n@25@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) n@25@00) n@25@00))
      :qid |quant-u-18|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@27@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@27@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@30@00 $Ref)) (!
      (=>
        (Set_in n@30@00 g1@3@00)
        (and
          (= (inv@31@00 s@$ g0@2@00 g1@3@00 n@30@00) n@30@00)
          (img@32@00 s@$ g0@2@00 g1@3@00 n@30@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@30@00) n@30@00))
      :qid |quant-u-21|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@32@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@31@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@31@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@37@00 $Ref)) (!
      (=>
        (Set_in n@37@00 g0@2@00)
        (and
          (= (inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00) n@37@00)
          (img@39@00 s@$ g0@2@00 g1@3@00 n@37@00)))
      :pattern ((Set_in n@37@00 g0@2@00))
      :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 n@37@00))
      :pattern ((img@39@00 s@$ g0@2@00 g1@3@00 n@37@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@39@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@38@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@38@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@41@00 $Ref)) (!
      (=>
        (Set_in n@41@00 (Set_union g0@2@00 g1@3@00))
        (and
          (= (inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00) n@41@00)
          (img@43@00 s@$ g0@2@00 g1@3@00 n@41@00)))
      :pattern ((Set_in n@41@00 (Set_union g0@2@00 g1@3@00)))
      :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 n@41@00))
      :pattern ((img@43@00 s@$ g0@2@00 g1@3@00 n@41@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@43@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
        (= (inv@42@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@42@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@48@00 $Ref)) (!
      (=>
        (Set_in n@48@00 g1@3@00)
        (and
          (= (inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00) n@48@00)
          (img@50@00 s@$ g0@2@00 g1@3@00 n@48@00)))
      :pattern ((Set_in n@48@00 g1@3@00))
      :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 n@48@00))
      :pattern ((img@50@00 s@$ g0@2@00 g1@3@00 n@48@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@50@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@49@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@49@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@53@00 $Ref)) (!
      (=>
        (Set_in n@53@00 (Set_union g1@3@00 g0@2@00))
        (and
          (= (inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00) n@53@00)
          (img@55@00 s@$ g0@2@00 g1@3@00 n@53@00)))
      :pattern ((Set_in n@53@00 (Set_union g1@3@00 g0@2@00)))
      :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 n@53@00))
      :pattern ((img@55@00 s@$ g0@2@00 g1@3@00 n@53@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@55@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
        (= (inv@54@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@54@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@60@00 $Ref)) (!
      (=>
        (Set_in n@60@00 g0@2@00)
        (and
          (= (inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00) n@60@00)
          (img@62@00 s@$ g0@2@00 g1@3@00 n@60@00)))
      :pattern ((Set_in n@60@00 g0@2@00))
      :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 n@60@00))
      :pattern ((img@62@00 s@$ g0@2@00 g1@3@00 n@60@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@62@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@61@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@61@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@65@00 $Ref)) (!
      (=>
        (Set_in n@65@00 (Set_union g0@2@00 g1@3@00))
        (and
          (= (inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00) n@65@00)
          (img@67@00 s@$ g0@2@00 g1@3@00 n@65@00)))
      :pattern ((Set_in n@65@00 (Set_union g0@2@00 g1@3@00)))
      :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 n@65@00))
      :pattern ((img@67@00 s@$ g0@2@00 g1@3@00 n@65@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@67@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
        (= (inv@66@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@66@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@72@00 $Ref)) (!
      (=>
        (Set_in n@72@00 g1@3@00)
        (and
          (= (inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00) n@72@00)
          (img@74@00 s@$ g0@2@00 g1@3@00 n@72@00)))
      :pattern ((Set_in n@72@00 g1@3@00))
      :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 n@72@00))
      :pattern ((img@74@00 s@$ g0@2@00 g1@3@00 n@72@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@74@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@73@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@73@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@77@00 $Ref)) (!
      (=>
        (Set_in n@77@00 (Set_union g1@3@00 g0@2@00))
        (and
          (= (inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00) n@77@00)
          (img@79@00 s@$ g0@2@00 g1@3@00 n@77@00)))
      :pattern ((Set_in n@77@00 (Set_union g1@3@00 g0@2@00)))
      :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 n@77@00))
      :pattern ((img@79@00 s@$ g0@2@00 g1@3@00 n@77@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@79@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
        (= (inv@78@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@78@00 s@$ g0@2@00 g1@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@26@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@28@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (=
          ($FVF.lookup_next (sm@29@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@29@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
      :pattern (($FVF.lookup_next (sm@29@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef5|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@39@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@39@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@40@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef12|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@39@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef9|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@38@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@39@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@32@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef10|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@40@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef11|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@43@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@43@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@45@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef19|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@43@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef16|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@42@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@43@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@32@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef17|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@45@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef18|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@50@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@50@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@52@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef26|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@50@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef23|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@49@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@50@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@32@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef24|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@52@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef25|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@55@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@55@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@57@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef33|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@55@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef30|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@54@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@55@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@32@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef31|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@57@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef32|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@62@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@62@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@64@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef40|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@62@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef37|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@61@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@62@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@32@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef38|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@64@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef39|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@67@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@67@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@69@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef47|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@67@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef44|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@66@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@67@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@32@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef45|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@69@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef46|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@74@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@74@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@76@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef54|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@74@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef51|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@73@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@74@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@32@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef52|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@76@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef53|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@79@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@79@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@81@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef61|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@79@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@28@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@27@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef58|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@78@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@79@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@32@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@31@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef59|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first s@$)) r) r)
        ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_next (sm@81@00 s@$ g0@2@00 g1@3@00) r))
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
                    ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
                  ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
            (exists_path<Bool> ($$ (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
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
                    ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
                  ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
            (exists_path<Bool> ($$ (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g1@3@00)
              (and
                (Set_in v g1@3@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
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
                      ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
                    ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))))
            (not
              (exists_path<Bool> ($$ (ite
                (and
                  (Set_in u g0@2@00)
                  (and
                    (Set_in v g0@2@00)
                    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
                ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v)))
          :pattern ((Set_in u g0@2@00) (Set_in v g0@2@00))
          :pattern ((Set_in u g0@2@00) (exists_path<Bool> ($$ (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
          :pattern ((Set_in u g0@2@00) (exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
          :pattern ((Set_in v g0@2@00) (exists_path<Bool> ($$ (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
          :pattern ((Set_in v g0@2@00) (exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
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
                      ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
                    ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))))
            (not
              (exists_path<Bool> ($$ (ite
                (and
                  (Set_in u g1@3@00)
                  (and
                    (Set_in v g1@3@00)
                    (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
                ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v)))
          :pattern ((Set_in u g1@3@00) (Set_in v g1@3@00))
          :pattern ((Set_in u g1@3@00) (exists_path<Bool> ($$ (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
          :pattern ((Set_in u g1@3@00) (exists_path<Bool> ($$ (ite
            (and
              (Set_in u g1@3@00)
              (and
                (Set_in v g1@3@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
          :pattern ((Set_in v g1@3@00) (exists_path<Bool> ($$ (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
          :pattern ((Set_in v g1@3@00) (exists_path<Bool> ($$ (ite
            (and
              (Set_in u g1@3@00)
              (and
                (Set_in v g1@3@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g1@3@00)
              (and
                (Set_in v g1@3@00)
                (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
            ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
          ))))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-78|)))
; WARNING: (8287,11): 'if' cannot be used in patterns.
; WARNING: (8287,11): 'if' cannot be used in patterns.
; WARNING: (8287,11): 'and' cannot be used in patterns.
; WARNING: (8287,11): 'and' cannot be used in patterns.
; WARNING: (8287,11): 'if' cannot be used in patterns.
; WARNING: (8324,11): 'if' cannot be used in patterns.
; WARNING: (8324,11): 'if' cannot be used in patterns.
; WARNING: (8324,11): 'and' cannot be used in patterns.
; WARNING: (8324,11): 'and' cannot be used in patterns.
; WARNING: (8324,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'and' cannot be used in patterns.
; WARNING: (8394,11): 'and' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'and' cannot be used in patterns.
; WARNING: (8394,11): 'and' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8394,11): 'and' cannot be used in patterns.
; WARNING: (8394,11): 'and' cannot be used in patterns.
; WARNING: (8394,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'and' cannot be used in patterns.
; WARNING: (8464,11): 'and' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'and' cannot be used in patterns.
; WARNING: (8464,11): 'and' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
; WARNING: (8464,11): 'and' cannot be used in patterns.
; WARNING: (8464,11): 'and' cannot be used in patterns.
; WARNING: (8464,11): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) true)
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-79|)))
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
              ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00))
        (=>
          (and
            (Set_in u g0@2@00)
            (and
              (Set_in v g0@2@00)
              (exists_path<Bool> ($$ (ite
                (Set_in v g0@2@00)
                (ite
                  (Set_in u g0@2@00)
                  ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
                ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
          (and
            (=>
              (and (Set_in u g0@2@00) (Set_in v g0@2@00))
              ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00))
            ($$%precondition (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g0@2@00)
        (ite
          (Set_in u g0@2@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-80|)))
; WARNING: (8524,7): 'if' cannot be used in patterns.
; WARNING: (8524,7): 'if' cannot be used in patterns.
; WARNING: (8524,7): 'and' cannot be used in patterns.
; WARNING: (8524,7): 'and' cannot be used in patterns.
; WARNING: (8524,7): 'if' cannot be used in patterns.
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
              ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00))
        (=>
          (and
            (Set_in u g1@3@00)
            (and
              (Set_in v g1@3@00)
              (exists_path<Bool> ($$ (ite
                (Set_in v g1@3@00)
                (ite
                  (Set_in u g1@3@00)
                  ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
                ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
          (and
            (=>
              (and (Set_in u g1@3@00) (Set_in v g1@3@00))
              ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00))
            ($$%precondition (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g1@3@00)
        (ite
          (Set_in u g1@3@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g1@3@00)
          (and
            (Set_in v g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-81|)))
; WARNING: (8580,7): 'if' cannot be used in patterns.
; WARNING: (8580,7): 'if' cannot be used in patterns.
; WARNING: (8580,7): 'and' cannot be used in patterns.
; WARNING: (8580,7): 'and' cannot be used in patterns.
; WARNING: (8580,7): 'if' cannot be used in patterns.
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
              ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00))
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
                    ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
                  ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))))
          (and
            (=>
              (and (Set_in u g0@2@00) (Set_in v g0@2@00))
              ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00))
            ($$%precondition (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))))
      :pattern ((Set_in u g0@2@00) (Set_in v g0@2@00))
      :pattern ((Set_in u g0@2@00) (exists_path<Bool> ($$ (ite
        (Set_in v g0@2@00)
        (ite
          (Set_in u g0@2@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
      :pattern ((Set_in u g0@2@00) (exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
      :pattern ((Set_in v g0@2@00) (exists_path<Bool> ($$ (ite
        (Set_in v g0@2@00)
        (ite
          (Set_in u g0@2@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
      :pattern ((Set_in v g0@2@00) (exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g0@2@00)
        (ite
          (Set_in u g0@2@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@64@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@40@00 s@$ g0@2@00 g1@3@00)) g0@2@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@45@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@69@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-82|)))
; WARNING: (8668,7): 'if' cannot be used in patterns.
; WARNING: (8668,7): 'if' cannot be used in patterns.
; WARNING: (8668,7): 'and' cannot be used in patterns.
; WARNING: (8668,7): 'and' cannot be used in patterns.
; WARNING: (8668,7): 'if' cannot be used in patterns.
; WARNING: (8668,7): 'if' cannot be used in patterns.
; WARNING: (8668,7): 'if' cannot be used in patterns.
; WARNING: (8668,7): 'and' cannot be used in patterns.
; WARNING: (8668,7): 'and' cannot be used in patterns.
; WARNING: (8668,7): 'if' cannot be used in patterns.
; WARNING: (8668,7): 'if' cannot be used in patterns.
; WARNING: (8668,7): 'if' cannot be used in patterns.
; WARNING: (8668,7): 'and' cannot be used in patterns.
; WARNING: (8668,7): 'and' cannot be used in patterns.
; WARNING: (8668,7): 'if' cannot be used in patterns.
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
              ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
            ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00))
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
                    ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
                  ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))))
          (and
            (=>
              (and (Set_in u g1@3@00) (Set_in v g1@3@00))
              ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00))
            ($$%precondition (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
              ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)))))
      :pattern ((Set_in u g1@3@00) (Set_in v g1@3@00))
      :pattern ((Set_in u g1@3@00) (exists_path<Bool> ($$ (ite
        (Set_in v g1@3@00)
        (ite
          (Set_in u g1@3@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
      :pattern ((Set_in u g1@3@00) (exists_path<Bool> ($$ (ite
        (and
          (Set_in u g1@3@00)
          (and
            (Set_in v g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
      :pattern ((Set_in v g1@3@00) (exists_path<Bool> ($$ (ite
        (Set_in v g1@3@00)
        (ite
          (Set_in u g1@3@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
      :pattern ((Set_in v g1@3@00) (exists_path<Bool> ($$ (ite
        (and
          (Set_in u g1@3@00)
          (and
            (Set_in v g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g1@3@00)
        (ite
          (Set_in u g1@3@00)
          ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00)))
        ($SortWrappers.$FVF<next>To$Snap (sm@76@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g1@3@00)
          (and
            (Set_in v g1@3@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@52@00 s@$ g0@2@00 g1@3@00)) g1@3@00) u v)))
        ($SortWrappers.$FVF<next>To$Snap (sm@57@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<next>To$Snap (sm@81@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-83|)))
; WARNING: (8756,7): 'if' cannot be used in patterns.
; WARNING: (8756,7): 'if' cannot be used in patterns.
; WARNING: (8756,7): 'and' cannot be used in patterns.
; WARNING: (8756,7): 'and' cannot be used in patterns.
; WARNING: (8756,7): 'if' cannot be used in patterns.
; WARNING: (8756,7): 'if' cannot be used in patterns.
; WARNING: (8756,7): 'if' cannot be used in patterns.
; WARNING: (8756,7): 'and' cannot be used in patterns.
; WARNING: (8756,7): 'and' cannot be used in patterns.
; WARNING: (8756,7): 'if' cannot be used in patterns.
; WARNING: (8756,7): 'if' cannot be used in patterns.
; WARNING: (8756,7): 'if' cannot be used in patterns.
; WARNING: (8756,7): 'and' cannot be used in patterns.
; WARNING: (8756,7): 'and' cannot be used in patterns.
; WARNING: (8756,7): 'if' cannot be used in patterns.
; ---------- FUNCTION acyclic_list_segment----------
(declare-fun g@5@00 () Set<$Ref>)
(declare-fun result@6@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (not (Set_in $Ref.null g@5@00)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const n@82@00 $Ref)
(push) ; 2
; [eval] (n in g)
(assert (Set_in n@82@00 g@5@00))
(declare-fun sm@83@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@84@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@85@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@82@00 $Ref) (n2@82@00 $Ref)) (!
  (=>
    (and (Set_in n1@82@00 g@5@00) (Set_in n2@82@00 g@5@00) (= n1@82@00 n2@82@00))
    (= n1@82@00 n2@82@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@82@00 $Ref)) (!
  (=>
    (Set_in n@82@00 g@5@00)
    (and
      (= (inv@84@00 s@$ g@5@00 n@82@00) n@82@00)
      (img@85@00 s@$ g@5@00 n@82@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@82@00) n@82@00))
  :qid |quant-u-85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (= (inv@84@00 s@$ g@5@00 r) r))
  :pattern ((inv@84@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@82@00 $Ref)) (!
  (=> (Set_in n@82@00 g@5@00) (not (= n@82@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@82@00) n@82@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@86@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r) r))
  :pattern ((inv@84@00 s@$ g@5@00 r))
  :qid |quant-u-86|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] (forall n$0: Ref :: { (n$0.next in g) } { (n$0 in g), n$0.next } (n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@87@00 $Ref)
(push) ; 2
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 3
; [then-branch: 18 | !(n$0@87@00 in g@5@00) | live]
; [else-branch: 18 | n$0@87@00 in g@5@00 | live]
(push) ; 4
; [then-branch: 18 | !(n$0@87@00 in g@5@00)]
(assert (not (Set_in n$0@87@00 g@5@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | n$0@87@00 in g@5@00]
(assert (Set_in n$0@87@00 g@5@00))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
      (=
        ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef63|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
    :qid |qp.fvfResTrgDef64|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00))
(push) ; 5
(assert (not (and
  (img@85@00 s@$ g@5@00 n$0@87@00)
  (Set_in (inv@84@00 s@$ g@5@00 n$0@87@00) g@5@00))))
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
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (=>
  (Set_in n$0@87@00 g@5@00)
  (and
    (Set_in n$0@87@00 g@5@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00))))
(assert (or (Set_in n$0@87@00 g@5@00) (not (Set_in n$0@87@00 g@5@00))))
(push) ; 3
; [then-branch: 19 | n$0@87@00 in g@5@00 && Lookup(next, sm@86@00(s@$, g@5@00), n$0@87@00) != Null | live]
; [else-branch: 19 | !(n$0@87@00 in g@5@00 && Lookup(next, sm@86@00(s@$, g@5@00), n$0@87@00) != Null) | live]
(push) ; 4
; [then-branch: 19 | n$0@87@00 in g@5@00 && Lookup(next, sm@86@00(s@$, g@5@00), n$0@87@00) != Null]
(assert (and
  (Set_in n$0@87@00 g@5@00)
  (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
      (=
        ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef63|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
    :qid |qp.fvfResTrgDef64|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00))
(push) ; 5
(assert (not (and
  (img@85@00 s@$ g@5@00 n$0@87@00)
  (Set_in (inv@84@00 s@$ g@5@00 n$0@87@00) g@5@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(n$0@87@00 in g@5@00 && Lookup(next, sm@86@00(s@$, g@5@00), n$0@87@00) != Null)]
(assert (not
  (and
    (Set_in n$0@87@00 g@5@00)
    (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (=>
  (and
    (Set_in n$0@87@00 g@5@00)
    (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))
  (and
    (Set_in n$0@87@00 g@5@00)
    (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@87@00 g@5@00)
      (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))))
  (and
    (Set_in n$0@87@00 g@5@00)
    (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef64|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$0@87@00 $Ref)) (!
  (and
    (=>
      (Set_in n$0@87@00 g@5@00)
      (and
        (Set_in n$0@87@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00)))
    (or (Set_in n$0@87@00 g@5@00) (not (Set_in n$0@87@00 g@5@00)))
    (=>
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00)))
    (or
      (not
        (and
          (Set_in n$0@87@00 g@5@00)
          (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))))
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) g@5@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@346@14@346@22-aux|)))
(assert (forall ((n$0@87@00 $Ref)) (!
  (and
    (=>
      (Set_in n$0@87@00 g@5@00)
      (and
        (Set_in n$0@87@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00)))
    (or (Set_in n$0@87@00 g@5@00) (not (Set_in n$0@87@00 g@5@00)))
    (=>
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00)))
    (or
      (not
        (and
          (Set_in n$0@87@00 g@5@00)
          (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))))
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))))
  :pattern ((Set_in n$0@87@00 g@5@00) ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@346@14@346@22-aux|)))
(assert (forall ((n$0@87@00 $Ref)) (!
  (=>
    (and
      (Set_in n$0@87@00 g@5@00)
      (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))
    (Set_in ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) g@5@00))
  :pattern ((Set_in ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) g@5@00))
  :pattern ((Set_in n$0@87@00 g@5@00) ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@346@14@346@22|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (g@5@00 Set<$Ref>)) (!
  (= (acyclic_list_segment%limited s@$ g@5@00) (acyclic_list_segment s@$ g@5@00))
  :pattern ((acyclic_list_segment s@$ g@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (g@5@00 Set<$Ref>)) (!
  (acyclic_list_segment%stateless g@5@00)
  :pattern ((acyclic_list_segment%limited s@$ g@5@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (= (inv@84@00 s@$ g@5@00 r) r))
  :pattern ((inv@84@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (forall ((n@82@00 $Ref)) (!
  (=>
    (Set_in n@82@00 g@5@00)
    (and
      (= (inv@84@00 s@$ g@5@00 n@82@00) n@82@00)
      (img@85@00 s@$ g@5@00 n@82@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@82@00) n@82@00))
  :qid |quant-u-85|)))
(assert (forall ((n@82@00 $Ref)) (!
  (=> (Set_in n@82@00 g@5@00) (not (= n@82@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@82@00) n@82@00))
  :qid |next-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r) r))
  :pattern ((inv@84@00 s@$ g@5@00 r))
  :qid |quant-u-86|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (forall ((n$0@87@00 $Ref)) (!
  (and
    (=>
      (Set_in n$0@87@00 g@5@00)
      (and
        (Set_in n$0@87@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00)))
    (or (Set_in n$0@87@00 g@5@00) (not (Set_in n$0@87@00 g@5@00)))
    (=>
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00)))
    (or
      (not
        (and
          (Set_in n$0@87@00 g@5@00)
          (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))))
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) g@5@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@346@14@346@22-aux|)))
(assert (forall ((n$0@87@00 $Ref)) (!
  (and
    (=>
      (Set_in n$0@87@00 g@5@00)
      (and
        (Set_in n$0@87@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00)))
    (or (Set_in n$0@87@00 g@5@00) (not (Set_in n$0@87@00 g@5@00)))
    (=>
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00)))
    (or
      (not
        (and
          (Set_in n$0@87@00 g@5@00)
          (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null))))
      (and
        (Set_in n$0@87@00 g@5@00)
        (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))))
  :pattern ((Set_in n$0@87@00 g@5@00) ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@346@14@346@22-aux|)))
(assert (forall ((n$0@87@00 $Ref)) (!
  (=>
    (and
      (Set_in n$0@87@00 g@5@00)
      (not (= ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) $Ref.null)))
    (Set_in ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) g@5@00))
  :pattern ((Set_in ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) g@5@00))
  :pattern ((Set_in n$0@87@00 g@5@00) ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n$0@87@00) n$0@87@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@346@14@346@22|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (Set_in $Ref.null g@5@00)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] acyclic_graph($$(g)) && (func_graph($$(g)) && unshared_graph($$(g)))
; [eval] acyclic_graph($$(g))
; [eval] $$(g)
(set-option :timeout 0)
(push) ; 2
(declare-const n@88@00 $Ref)
(push) ; 3
; [eval] (n in refs)
(assert (Set_in n@88@00 g@5@00))
(pop) ; 3
(declare-fun inv@89@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@90@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@88@00 $Ref) (n2@88@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@88@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n1@88@00) n1@88@00))
      (and
        (Set_in n2@88@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) n2@88@00) n2@88@00))
      (= n1@88@00 n2@88@00))
    (= n1@88@00 n2@88@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@88@00 $Ref)) (!
  (=>
    (Set_in n@88@00 g@5@00)
    (and
      (= (inv@89@00 s@$ g@5@00 n@88@00) n@88@00)
      (img@90@00 s@$ g@5@00 n@88@00)))
  :pattern ((Set_in n@88@00 g@5@00))
  :pattern ((inv@89@00 s@$ g@5@00 n@88@00))
  :pattern ((img@90@00 s@$ g@5@00 n@88@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@90@00 s@$ g@5@00 r) (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00))
    (= (inv@89@00 s@$ g@5@00 r) r))
  :pattern ((inv@89@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r) r))
  :pattern ((inv@89@00 s@$ g@5@00 r))
  :qid |quant-u-88|)))
; Precomputing data for removing quantified permissions
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
        (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00)
          (img@90@00 s@$ g@5@00 r)
          (= r (inv@89@00 s@$ g@5@00 r)))
        ($Perm.min
          (ite
            (and
              (img@85@00 s@$ g@5@00 r)
              (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-90|))))
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
      (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00)
      (img@90@00 s@$ g@5@00 r)
      (= r (inv@89@00 s@$ g@5@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00)
            (img@90@00 s@$ g@5@00 r)
            (= r (inv@89@00 s@$ g@5@00 r)))
          ($Perm.min
            (ite
              (and
                (img@85@00 s@$ g@5@00 r)
                (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@91@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00)))
      (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef67|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@91@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@91@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@91@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef66|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
(pop) ; 2
; Joined path conditions
(assert (forall ((n@88@00 $Ref)) (!
  (=>
    (Set_in n@88@00 g@5@00)
    (and
      (= (inv@89@00 s@$ g@5@00 n@88@00) n@88@00)
      (img@90@00 s@$ g@5@00 n@88@00)))
  :pattern ((Set_in n@88@00 g@5@00))
  :pattern ((inv@89@00 s@$ g@5@00 n@88@00))
  :pattern ((img@90@00 s@$ g@5@00 n@88@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@90@00 s@$ g@5@00 r) (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00))
    (= (inv@89@00 s@$ g@5@00 r) r))
  :pattern ((inv@89@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00)))
      (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@91@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@91@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@91@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef66|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r) r))
    :pattern ((inv@89@00 s@$ g@5@00 r))
    :qid |quant-u-88|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00)))
(set-option :timeout 0)
(push) ; 2
; [then-branch: 20 | !(acyclic_graph[Bool]($$(sm@91@00(s@$, g@5@00), g@5@00))) | live]
; [else-branch: 20 | acyclic_graph[Bool]($$(sm@91@00(s@$, g@5@00), g@5@00)) | live]
(push) ; 3
; [then-branch: 20 | !(acyclic_graph[Bool]($$(sm@91@00(s@$, g@5@00), g@5@00)))]
(assert (not
  (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 20 | acyclic_graph[Bool]($$(sm@91@00(s@$, g@5@00), g@5@00))]
(assert (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00)))
; [eval] func_graph($$(g))
; [eval] $$(g)
(push) ; 4
(declare-const n@92@00 $Ref)
(push) ; 5
; [eval] (n in refs)
(assert (Set_in n@92@00 g@5@00))
(pop) ; 5
(declare-fun inv@93@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@94@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@95@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@95@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@95@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@95@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef69|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@92@00 $Ref) (n2@92@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@92@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@95@00 s@$ g@5@00) n1@92@00) n1@92@00))
      (and
        (Set_in n2@92@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@95@00 s@$ g@5@00) n2@92@00) n2@92@00))
      (= n1@92@00 n2@92@00))
    (= n1@92@00 n2@92@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@92@00 $Ref)) (!
  (=>
    (Set_in n@92@00 g@5@00)
    (and
      (= (inv@93@00 s@$ g@5@00 n@92@00) n@92@00)
      (img@94@00 s@$ g@5@00 n@92@00)))
  :pattern ((Set_in n@92@00 g@5@00))
  :pattern ((inv@93@00 s@$ g@5@00 n@92@00))
  :pattern ((img@94@00 s@$ g@5@00 n@92@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@94@00 s@$ g@5@00 r) (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00))
    (= (inv@93@00 s@$ g@5@00 r) r))
  :pattern ((inv@93@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@95@00 s@$ g@5@00) r) r))
  :pattern ((inv@93@00 s@$ g@5@00 r))
  :qid |quant-u-93|)))
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
        (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00)
          (img@94@00 s@$ g@5@00 r)
          (= r (inv@93@00 s@$ g@5@00 r)))
        ($Perm.min
          (ite
            (and
              (img@85@00 s@$ g@5@00 r)
              (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-95|))))
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
      (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00)
      (img@94@00 s@$ g@5@00 r)
      (= r (inv@93@00 s@$ g@5@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00)
            (img@94@00 s@$ g@5@00 r)
            (= r (inv@93@00 s@$ g@5@00 r)))
          ($Perm.min
            (ite
              (and
                (img@85@00 s@$ g@5@00 r)
                (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-96|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@96@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00)))
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef72|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@96@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@96@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@96@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef71|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@95@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@95@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@95@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef69|)))
(assert (forall ((n@92@00 $Ref)) (!
  (=>
    (Set_in n@92@00 g@5@00)
    (and
      (= (inv@93@00 s@$ g@5@00 n@92@00) n@92@00)
      (img@94@00 s@$ g@5@00 n@92@00)))
  :pattern ((Set_in n@92@00 g@5@00))
  :pattern ((inv@93@00 s@$ g@5@00 n@92@00))
  :pattern ((img@94@00 s@$ g@5@00 n@92@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@94@00 s@$ g@5@00 r) (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00))
    (= (inv@93@00 s@$ g@5@00 r) r))
  :pattern ((inv@93@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00)))
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@96@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@96@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@96@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef71|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@95@00 s@$ g@5@00) r) r))
    :pattern ((inv@93@00 s@$ g@5@00 r))
    :qid |quant-u-93|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00)))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | !(func_graph[Bool]($$(sm@96@00(s@$, g@5@00), g@5@00))) | live]
; [else-branch: 21 | func_graph[Bool]($$(sm@96@00(s@$, g@5@00), g@5@00)) | live]
(push) ; 5
; [then-branch: 21 | !(func_graph[Bool]($$(sm@96@00(s@$, g@5@00), g@5@00)))]
(assert (not
  (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | func_graph[Bool]($$(sm@96@00(s@$, g@5@00), g@5@00))]
(assert (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00)))
; [eval] unshared_graph($$(g))
; [eval] $$(g)
(push) ; 6
(declare-const n@97@00 $Ref)
(push) ; 7
; [eval] (n in refs)
(assert (Set_in n@97@00 g@5@00))
(pop) ; 7
(declare-fun inv@98@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@99@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@100@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@100@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@100@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@100@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef74|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@97@00 $Ref) (n2@97@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@97@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@100@00 s@$ g@5@00) n1@97@00) n1@97@00))
      (and
        (Set_in n2@97@00 g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@100@00 s@$ g@5@00) n2@97@00) n2@97@00))
      (= n1@97@00 n2@97@00))
    (= n1@97@00 n2@97@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@97@00 $Ref)) (!
  (=>
    (Set_in n@97@00 g@5@00)
    (and
      (= (inv@98@00 s@$ g@5@00 n@97@00) n@97@00)
      (img@99@00 s@$ g@5@00 n@97@00)))
  :pattern ((Set_in n@97@00 g@5@00))
  :pattern ((inv@98@00 s@$ g@5@00 n@97@00))
  :pattern ((img@99@00 s@$ g@5@00 n@97@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@99@00 s@$ g@5@00 r) (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00))
    (= (inv@98@00 s@$ g@5@00 r) r))
  :pattern ((inv@98@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@100@00 s@$ g@5@00) r) r))
  :pattern ((inv@98@00 s@$ g@5@00 r))
  :qid |quant-u-98|)))
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
        (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00)
          (img@99@00 s@$ g@5@00 r)
          (= r (inv@98@00 s@$ g@5@00 r)))
        ($Perm.min
          (ite
            (and
              (img@85@00 s@$ g@5@00 r)
              (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-100|))))
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
      (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00)
      (img@99@00 s@$ g@5@00 r)
      (= r (inv@98@00 s@$ g@5@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00)
            (img@99@00 s@$ g@5@00 r)
            (= r (inv@98@00 s@$ g@5@00 r)))
          ($Perm.min
            (ite
              (and
                (img@85@00 s@$ g@5@00 r)
                (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@101@00 ($Snap Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef77|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@101@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef76|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@101@00 s@$ g@5@00)) g@5@00))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@100@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@100@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@100@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef74|)))
(assert (forall ((n@97@00 $Ref)) (!
  (=>
    (Set_in n@97@00 g@5@00)
    (and
      (= (inv@98@00 s@$ g@5@00 n@97@00) n@97@00)
      (img@99@00 s@$ g@5@00 n@97@00)))
  :pattern ((Set_in n@97@00 g@5@00))
  :pattern ((inv@98@00 s@$ g@5@00 n@97@00))
  :pattern ((img@99@00 s@$ g@5@00 n@97@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@99@00 s@$ g@5@00 r) (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00))
    (= (inv@98@00 s@$ g@5@00 r) r))
  :pattern ((inv@98@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@101@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@100@00 s@$ g@5@00) r) r))
    :pattern ((inv@98@00 s@$ g@5@00 r))
    :qid |quant-u-98|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@101@00 s@$ g@5@00)) g@5@00)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@100@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@100@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@100@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef74|)))
(assert (forall ((n@97@00 $Ref)) (!
  (=>
    (Set_in n@97@00 g@5@00)
    (and
      (= (inv@98@00 s@$ g@5@00 n@97@00) n@97@00)
      (img@99@00 s@$ g@5@00 n@97@00)))
  :pattern ((Set_in n@97@00 g@5@00))
  :pattern ((inv@98@00 s@$ g@5@00 n@97@00))
  :pattern ((img@99@00 s@$ g@5@00 n@97@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@99@00 s@$ g@5@00 r) (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00))
    (= (inv@98@00 s@$ g@5@00 r) r))
  :pattern ((inv@98@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@101@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (=>
  (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))
  (and
    (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@100@00 s@$ g@5@00) r) r))
      :pattern ((inv@98@00 s@$ g@5@00 r))
      :qid |quant-u-98|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@101@00 s@$ g@5@00)) g@5@00))))
(assert (or
  (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))
  (not
    (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@95@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@95@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@95@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef69|)))
(assert (forall ((n@92@00 $Ref)) (!
  (=>
    (Set_in n@92@00 g@5@00)
    (and
      (= (inv@93@00 s@$ g@5@00 n@92@00) n@92@00)
      (img@94@00 s@$ g@5@00 n@92@00)))
  :pattern ((Set_in n@92@00 g@5@00))
  :pattern ((inv@93@00 s@$ g@5@00 n@92@00))
  :pattern ((img@94@00 s@$ g@5@00 n@92@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@94@00 s@$ g@5@00 r) (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00))
    (= (inv@93@00 s@$ g@5@00 r) r))
  :pattern ((inv@93@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00)))
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@96@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@96@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@96@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
    (=
      ($FVF.lookup_next (sm@100@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@100@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@100@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef74|)))
(assert (forall ((n@97@00 $Ref)) (!
  (=>
    (Set_in n@97@00 g@5@00)
    (and
      (= (inv@98@00 s@$ g@5@00 n@97@00) n@97@00)
      (img@99@00 s@$ g@5@00 n@97@00)))
  :pattern ((Set_in n@97@00 g@5@00))
  :pattern ((inv@98@00 s@$ g@5@00 n@97@00))
  :pattern ((img@99@00 s@$ g@5@00 n@97@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@99@00 s@$ g@5@00 r) (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00))
    (= (inv@98@00 s@$ g@5@00 r) r))
  :pattern ((inv@98@00 s@$ g@5@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r)))
    (=>
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
      (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
      (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
    (=
      ($FVF.lookup_next (sm@101@00 s@$ g@5@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (=>
  (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
  (and
    (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@95@00 s@$ g@5@00) r) r))
      :pattern ((inv@93@00 s@$ g@5@00 r))
      :qid |quant-u-93|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00)
    (=>
      (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))
      (and
        (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@100@00 s@$ g@5@00) r) r))
          :pattern ((inv@98@00 s@$ g@5@00 r))
          :qid |quant-u-98|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@101@00 s@$ g@5@00)) g@5@00)))
    (or
      (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))
      (not
        (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00)))))))
(assert (or
  (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
  (not
    (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00)))))
(assert (=
  result@6@00
  (and
    (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
    (and
      (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@96@00 s@$ g@5@00)) g@5@00))
      (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@101@00 s@$ g@5@00)) g@5@00))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (g@5@00 Set<$Ref>)) (!
  (and
    (forall ((n@82@00 $Ref)) (!
      (=>
        (Set_in n@82@00 g@5@00)
        (and
          (= (inv@84@00 s@$ g@5@00 n@82@00) n@82@00)
          (img@85@00 s@$ g@5@00 n@82@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n@82@00) n@82@00))
      :qid |quant-u-85|))
    (forall ((r $Ref)) (!
      (=>
        (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
        (= (inv@84@00 s@$ g@5@00 r) r))
      :pattern ((inv@84@00 s@$ g@5@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@88@00 $Ref)) (!
      (=>
        (Set_in n@88@00 g@5@00)
        (and
          (= (inv@89@00 s@$ g@5@00 n@88@00) n@88@00)
          (img@90@00 s@$ g@5@00 n@88@00)))
      :pattern ((Set_in n@88@00 g@5@00))
      :pattern ((inv@89@00 s@$ g@5@00 n@88@00))
      :pattern ((img@90@00 s@$ g@5@00 n@88@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and (img@90@00 s@$ g@5@00 r) (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00))
        (= (inv@89@00 s@$ g@5@00 r) r))
      :pattern ((inv@89@00 s@$ g@5@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@92@00 $Ref)) (!
      (=>
        (Set_in n@92@00 g@5@00)
        (and
          (= (inv@93@00 s@$ g@5@00 n@92@00) n@92@00)
          (img@94@00 s@$ g@5@00 n@92@00)))
      :pattern ((Set_in n@92@00 g@5@00))
      :pattern ((inv@93@00 s@$ g@5@00 n@92@00))
      :pattern ((img@94@00 s@$ g@5@00 n@92@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and (img@94@00 s@$ g@5@00 r) (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00))
        (= (inv@93@00 s@$ g@5@00 r) r))
      :pattern ((inv@93@00 s@$ g@5@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@97@00 $Ref)) (!
      (=>
        (Set_in n@97@00 g@5@00)
        (and
          (= (inv@98@00 s@$ g@5@00 n@97@00) n@97@00)
          (img@99@00 s@$ g@5@00 n@97@00)))
      :pattern ((Set_in n@97@00 g@5@00))
      :pattern ((inv@98@00 s@$ g@5@00 n@97@00))
      :pattern ((img@99@00 s@$ g@5@00 n@97@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and (img@99@00 s@$ g@5@00 r) (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00))
        (= (inv@98@00 s@$ g@5@00 r) r))
      :pattern ((inv@98@00 s@$ g@5@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@83@00 s@$ g@5@00) r))
      :qid |qp.fvfResTrgDef62|))
    (forall ((r $Ref)) (!
      (=>
        (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00))
        (=
          ($FVF.lookup_next (sm@86@00 s@$ g@5@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef63|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_next (sm@86@00 s@$ g@5@00) r))
      :qid |qp.fvfResTrgDef64|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00)))
          (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r)))
        (=>
          (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r))
          (Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@91@00 s@$ g@5@00))))
      :qid |qp.fvfDomDef67|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and (Set_in (inv@89@00 s@$ g@5@00 r) g@5@00) (img@90@00 s@$ g@5@00 r))
          (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
        (=
          ($FVF.lookup_next (sm@91@00 s@$ g@5@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@91@00 s@$ g@5@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef65|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_next (sm@91@00 s@$ g@5@00) r))
      :qid |qp.fvfResTrgDef66|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00)))
          (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r)))
        (=>
          (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r))
          (Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@96@00 s@$ g@5@00))))
      :qid |qp.fvfDomDef72|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and (Set_in (inv@93@00 s@$ g@5@00 r) g@5@00) (img@94@00 s@$ g@5@00 r))
          (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
        (=
          ($FVF.lookup_next (sm@96@00 s@$ g@5@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@96@00 s@$ g@5@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef70|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_next (sm@96@00 s@$ g@5@00) r))
      :qid |qp.fvfResTrgDef71|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))
          (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r)))
        (=>
          (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
          (Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@101@00 s@$ g@5@00))))
      :qid |qp.fvfDomDef77|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and (Set_in (inv@98@00 s@$ g@5@00 r) g@5@00) (img@99@00 s@$ g@5@00 r))
          (and (img@85@00 s@$ g@5@00 r) (Set_in (inv@84@00 s@$ g@5@00 r) g@5@00)))
        (=
          ($FVF.lookup_next (sm@101@00 s@$ g@5@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef75|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_next (sm@101@00 s@$ g@5@00) r))
      :qid |qp.fvfResTrgDef76|))
    (=>
      (acyclic_list_segment%precondition s@$ g@5@00)
      (=
        (acyclic_list_segment s@$ g@5@00)
        (and
          (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
          (and
            (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
            (unshared_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00)))))))
  :pattern ((acyclic_list_segment s@$ g@5@00))
  :qid |quant-u-102|)))
(assert (forall ((s@$ $Snap) (g@5@00 Set<$Ref>)) (!
  (=>
    (acyclic_list_segment%precondition s@$ g@5@00)
    (and
      ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00)
      (=>
        (acyclic_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
        (and
          ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00)
          (=>
            (func_graph<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))
            ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@91@00 s@$ g@5@00)) g@5@00))))))
  :pattern ((acyclic_list_segment s@$ g@5@00))
  :qid |quant-u-103|)))
; ---------- FUNCTION is_global_sroot----------
(declare-fun g@7@00 () Set<$Ref>)
(declare-fun roots@8@00 () Set<$Ref>)
(declare-fun result@9@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (not (Set_in $Ref.null g@7@00)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const n$0@102@00 $Ref)
(push) ; 2
; [eval] (n$0 in g)
(assert (Set_in n$0@102@00 g@7@00))
(declare-fun sm@103@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@104@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@105@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n$01@102@00 $Ref) (n$02@102@00 $Ref)) (!
  (=>
    (and
      (Set_in n$01@102@00 g@7@00)
      (Set_in n$02@102@00 g@7@00)
      (= n$01@102@00 n$02@102@00))
    (= n$01@102@00 n$02@102@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$0@102@00 $Ref)) (!
  (=>
    (Set_in n$0@102@00 g@7@00)
    (and
      (= (inv@104@00 s@$ g@7@00 roots@8@00 n$0@102@00) n$0@102@00)
      (img@105@00 s@$ g@7@00 roots@8@00 n$0@102@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@102@00) n$0@102@00))
  :qid |quant-u-105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (= (inv@104@00 s@$ g@7@00 roots@8@00 r) r))
  :pattern ((inv@104@00 s@$ g@7@00 roots@8@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n$0@102@00 $Ref)) (!
  (=> (Set_in n$0@102@00 g@7@00) (not (= n$0@102@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@102@00) n$0@102@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@106@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (=
      ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r) r))
  :pattern ((inv@104@00 s@$ g@7@00 roots@8@00 r))
  :qid |quant-u-106|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (forall n$1: Ref :: { (n$1.next in g) } { (n$1 in g), n$1.next } (n$1 in g) && n$1.next != null ==> (n$1.next in g))
(declare-const n$1@107@00 $Ref)
(push) ; 2
; [eval] (n$1 in g) && n$1.next != null ==> (n$1.next in g)
; [eval] (n$1 in g) && n$1.next != null
; [eval] (n$1 in g)
(push) ; 3
; [then-branch: 22 | !(n$1@107@00 in g@7@00) | live]
; [else-branch: 22 | n$1@107@00 in g@7@00 | live]
(push) ; 4
; [then-branch: 22 | !(n$1@107@00 in g@7@00)]
(assert (not (Set_in n$1@107@00 g@7@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 22 | n$1@107@00 in g@7@00]
(assert (Set_in n$1@107@00 g@7@00))
; [eval] n$1.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@105@00 s@$ g@7@00 roots@8@00 r)
        (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
      (=
        ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef79|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
    :qid |qp.fvfResTrgDef80|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00))
(push) ; 5
(assert (not (and
  (img@105@00 s@$ g@7@00 roots@8@00 n$1@107@00)
  (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 n$1@107@00) g@7@00))))
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
    (and
      (img@105@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (=
      ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (=>
  (Set_in n$1@107@00 g@7@00)
  (and
    (Set_in n$1@107@00 g@7@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00))))
(assert (or (Set_in n$1@107@00 g@7@00) (not (Set_in n$1@107@00 g@7@00))))
(push) ; 3
; [then-branch: 23 | n$1@107@00 in g@7@00 && Lookup(next, sm@106@00(s@$, g@7@00, roots@8@00), n$1@107@00) != Null | live]
; [else-branch: 23 | !(n$1@107@00 in g@7@00 && Lookup(next, sm@106@00(s@$, g@7@00, roots@8@00), n$1@107@00) != Null) | live]
(push) ; 4
; [then-branch: 23 | n$1@107@00 in g@7@00 && Lookup(next, sm@106@00(s@$, g@7@00, roots@8@00), n$1@107@00) != Null]
(assert (and
  (Set_in n$1@107@00 g@7@00)
  (not
    (= ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) $Ref.null))))
; [eval] (n$1.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@105@00 s@$ g@7@00 roots@8@00 r)
        (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
      (=
        ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef79|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
    :qid |qp.fvfResTrgDef80|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00))
(push) ; 5
(assert (not (and
  (img@105@00 s@$ g@7@00 roots@8@00 n$1@107@00)
  (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 n$1@107@00) g@7@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 23 | !(n$1@107@00 in g@7@00 && Lookup(next, sm@106@00(s@$, g@7@00, roots@8@00), n$1@107@00) != Null)]
(assert (not
  (and
    (Set_in n$1@107@00 g@7@00)
    (not
      (=
        ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
        $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (=
      ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (=>
  (and
    (Set_in n$1@107@00 g@7@00)
    (not
      (=
        ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
        $Ref.null)))
  (and
    (Set_in n$1@107@00 g@7@00)
    (not
      (=
        ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$1@107@00 g@7@00)
      (not
        (=
          ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
          $Ref.null))))
  (and
    (Set_in n$1@107@00 g@7@00)
    (not
      (=
        ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
        $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (=
      ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef80|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$1@107@00 $Ref)) (!
  (and
    (=>
      (Set_in n$1@107@00 g@7@00)
      (and
        (Set_in n$1@107@00 g@7@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00)))
    (or (Set_in n$1@107@00 g@7@00) (not (Set_in n$1@107@00 g@7@00)))
    (=>
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null)))
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00)))
    (or
      (not
        (and
          (Set_in n$1@107@00 g@7@00)
          (not
            (=
              ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
              $Ref.null))))
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) g@7@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@339@14@339@22-aux|)))
(assert (forall ((n$1@107@00 $Ref)) (!
  (and
    (=>
      (Set_in n$1@107@00 g@7@00)
      (and
        (Set_in n$1@107@00 g@7@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00)))
    (or (Set_in n$1@107@00 g@7@00) (not (Set_in n$1@107@00 g@7@00)))
    (=>
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null)))
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00)))
    (or
      (not
        (and
          (Set_in n$1@107@00 g@7@00)
          (not
            (=
              ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
              $Ref.null))))
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null)))))
  :pattern ((Set_in n$1@107@00 g@7@00) ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@339@14@339@22-aux|)))
(assert (forall ((n$1@107@00 $Ref)) (!
  (=>
    (and
      (Set_in n$1@107@00 g@7@00)
      (not
        (=
          ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
          $Ref.null)))
    (Set_in ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) g@7@00))
  :pattern ((Set_in ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) g@7@00))
  :pattern ((Set_in n$1@107@00 g@7@00) ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@339@14@339@22|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (roots subset g)
(assert (Set_subset roots@8@00 g@7@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (g@7@00 Set<$Ref>) (roots@8@00 Set<$Ref>)) (!
  (=
    (is_global_sroot%limited s@$ g@7@00 roots@8@00)
    (is_global_sroot s@$ g@7@00 roots@8@00))
  :pattern ((is_global_sroot s@$ g@7@00 roots@8@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (g@7@00 Set<$Ref>) (roots@8@00 Set<$Ref>)) (!
  (is_global_sroot%stateless g@7@00 roots@8@00)
  :pattern ((is_global_sroot%limited s@$ g@7@00 roots@8@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (= (inv@104@00 s@$ g@7@00 roots@8@00 r) r))
  :pattern ((inv@104@00 s@$ g@7@00 roots@8@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (=
      ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (forall ((n$0@102@00 $Ref)) (!
  (=>
    (Set_in n$0@102@00 g@7@00)
    (and
      (= (inv@104@00 s@$ g@7@00 roots@8@00 n$0@102@00) n$0@102@00)
      (img@105@00 s@$ g@7@00 roots@8@00 n$0@102@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@102@00) n$0@102@00))
  :qid |quant-u-105|)))
(assert (forall ((n$0@102@00 $Ref)) (!
  (=> (Set_in n$0@102@00 g@7@00) (not (= n$0@102@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@102@00) n$0@102@00))
  :qid |next-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r) r))
  :pattern ((inv@104@00 s@$ g@7@00 roots@8@00 r))
  :qid |quant-u-106|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (forall ((n$1@107@00 $Ref)) (!
  (and
    (=>
      (Set_in n$1@107@00 g@7@00)
      (and
        (Set_in n$1@107@00 g@7@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00)))
    (or (Set_in n$1@107@00 g@7@00) (not (Set_in n$1@107@00 g@7@00)))
    (=>
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null)))
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00)))
    (or
      (not
        (and
          (Set_in n$1@107@00 g@7@00)
          (not
            (=
              ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
              $Ref.null))))
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) g@7@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@339@14@339@22-aux|)))
(assert (forall ((n$1@107@00 $Ref)) (!
  (and
    (=>
      (Set_in n$1@107@00 g@7@00)
      (and
        (Set_in n$1@107@00 g@7@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00)))
    (or (Set_in n$1@107@00 g@7@00) (not (Set_in n$1@107@00 g@7@00)))
    (=>
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null)))
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00)))
    (or
      (not
        (and
          (Set_in n$1@107@00 g@7@00)
          (not
            (=
              ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
              $Ref.null))))
      (and
        (Set_in n$1@107@00 g@7@00)
        (not
          (=
            ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
            $Ref.null)))))
  :pattern ((Set_in n$1@107@00 g@7@00) ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@339@14@339@22-aux|)))
(assert (forall ((n$1@107@00 $Ref)) (!
  (=>
    (and
      (Set_in n$1@107@00 g@7@00)
      (not
        (=
          ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00)
          $Ref.null)))
    (Set_in ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) g@7@00))
  :pattern ((Set_in ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) g@7@00))
  :pattern ((Set_in n$1@107@00 g@7@00) ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n$1@107@00) n$1@107@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@339@14@339@22|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (Set_subset roots@8@00 g@7@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (Set_in $Ref.null g@7@00)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall n: Ref :: { exists_spath($$(g), roots, n) } (n in g) ==> exists_spath($$(g), roots, n))
(declare-const n@108@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (n in g) ==> exists_spath($$(g), roots, n)
; [eval] (n in g)
(push) ; 3
; [then-branch: 24 | n@108@00 in g@7@00 | live]
; [else-branch: 24 | !(n@108@00 in g@7@00) | live]
(push) ; 4
; [then-branch: 24 | n@108@00 in g@7@00]
(assert (Set_in n@108@00 g@7@00))
; [eval] exists_spath($$(g), roots, n)
; [eval] $$(g)
(push) ; 5
(declare-const n@109@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@109@00 g@7@00))
(pop) ; 6
(declare-fun inv@110@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@111@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@109@00 $Ref) (n2@109@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@109@00 g@7@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n1@109@00) n1@109@00))
      (and
        (Set_in n2@109@00 g@7@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) n2@109@00) n2@109@00))
      (= n1@109@00 n2@109@00))
    (= n1@109@00 n2@109@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@109@00 $Ref)) (!
  (=>
    (Set_in n@109@00 g@7@00)
    (and
      (= (inv@110@00 s@$ g@7@00 roots@8@00 n@109@00) n@109@00)
      (img@111@00 s@$ g@7@00 roots@8@00 n@109@00)))
  :pattern ((Set_in n@109@00 g@7@00))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 n@109@00))
  :pattern ((img@111@00 s@$ g@7@00 roots@8@00 n@109@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (= (inv@110@00 s@$ g@7@00 roots@8@00 r) r))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r) r))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
  :qid |quant-u-108|)))
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
          (img@105@00 s@$ g@7@00 roots@8@00 r)
          (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
          (img@111@00 s@$ g@7@00 roots@8@00 r)
          (= r (inv@110@00 s@$ g@7@00 roots@8@00 r)))
        ($Perm.min
          (ite
            (and
              (img@105@00 s@$ g@7@00 roots@8@00 r)
              (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-110|))))
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
    (and
      (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
      (img@111@00 s@$ g@7@00 roots@8@00 r)
      (= r (inv@110@00 s@$ g@7@00 roots@8@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
            (img@111@00 s@$ g@7@00 roots@8@00 r)
            (= r (inv@110@00 s@$ g@7@00 roots@8@00 r)))
          ($Perm.min
            (ite
              (and
                (img@105@00 s@$ g@7@00 roots@8@00 r)
                (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@112@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r)))
    (=>
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r))
      (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00))))
  :qid |qp.fvfDomDef83|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r))
      (and
        (img@105@00 s@$ g@7@00 roots@8@00 r)
        (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00)))
    (=
      ($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef82|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00))
(pop) ; 5
; Joined path conditions
(assert (forall ((n@109@00 $Ref)) (!
  (=>
    (Set_in n@109@00 g@7@00)
    (and
      (= (inv@110@00 s@$ g@7@00 roots@8@00 n@109@00) n@109@00)
      (img@111@00 s@$ g@7@00 roots@8@00 n@109@00)))
  :pattern ((Set_in n@109@00 g@7@00))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 n@109@00))
  :pattern ((img@111@00 s@$ g@7@00 roots@8@00 n@109@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (= (inv@110@00 s@$ g@7@00 roots@8@00 r) r))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r)))
    (=>
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r))
      (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00))))
  :qid |qp.fvfDomDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r))
      (and
        (img@105@00 s@$ g@7@00 roots@8@00 r)
        (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00)))
    (=
      ($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef82|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r) r))
    :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
    :qid |quant-u-108|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 24 | !(n@108@00 in g@7@00)]
(assert (not (Set_in n@108@00 g@7@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((n@109@00 $Ref)) (!
  (=>
    (Set_in n@109@00 g@7@00)
    (and
      (= (inv@110@00 s@$ g@7@00 roots@8@00 n@109@00) n@109@00)
      (img@111@00 s@$ g@7@00 roots@8@00 n@109@00)))
  :pattern ((Set_in n@109@00 g@7@00))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 n@109@00))
  :pattern ((img@111@00 s@$ g@7@00 roots@8@00 n@109@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (= (inv@110@00 s@$ g@7@00 roots@8@00 r) r))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r)))
    (=>
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r))
      (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00))))
  :qid |qp.fvfDomDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r))
      (and
        (img@105@00 s@$ g@7@00 roots@8@00 r)
        (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00)))
    (=
      ($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef82|)))
(assert (=>
  (Set_in n@108@00 g@7@00)
  (and
    (Set_in n@108@00 g@7@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r) r))
      :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
      :qid |quant-u-108|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00))))
; Joined path conditions
(assert (or (not (Set_in n@108@00 g@7@00)) (Set_in n@108@00 g@7@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@109@00 $Ref)) (!
  (=>
    (Set_in n@109@00 g@7@00)
    (and
      (= (inv@110@00 s@$ g@7@00 roots@8@00 n@109@00) n@109@00)
      (img@111@00 s@$ g@7@00 roots@8@00 n@109@00)))
  :pattern ((Set_in n@109@00 g@7@00))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 n@109@00))
  :pattern ((img@111@00 s@$ g@7@00 roots@8@00 n@109@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@00 s@$ g@7@00 roots@8@00 r)
      (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00))
    (= (inv@110@00 s@$ g@7@00 roots@8@00 r) r))
  :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r)))
    (=>
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r))
      (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00))))
  :qid |qp.fvfDomDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
        (img@111@00 s@$ g@7@00 roots@8@00 r))
      (and
        (img@105@00 s@$ g@7@00 roots@8@00 r)
        (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00)))
    (=
      ($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
  :qid |qp.fvfResTrgDef82|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@108@00 $Ref)) (!
  (and
    (=>
      (Set_in n@108@00 g@7@00)
      (and
        (Set_in n@108@00 g@7@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r) r))
          :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
          :qid |quant-u-108|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00)))
    (or (not (Set_in n@108@00 g@7@00)) (Set_in n@108@00 g@7@00)))
  :pattern ((exists_spath<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00) roots@8@00 n@108@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@342@5@342@91-aux|)))
(assert (=
  result@9@00
  (forall ((n@108@00 $Ref)) (!
    (=>
      (Set_in n@108@00 g@7@00)
      (exists_spath<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00) roots@8@00 n@108@00))
    :pattern ((exists_spath<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00) roots@8@00 n@108@00))
    :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@342@5@342@91|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (g@7@00 Set<$Ref>) (roots@8@00 Set<$Ref>)) (!
  (and
    (forall ((n$0@102@00 $Ref)) (!
      (=>
        (Set_in n$0@102@00 g@7@00)
        (and
          (= (inv@104@00 s@$ g@7@00 roots@8@00 n$0@102@00) n$0@102@00)
          (img@105@00 s@$ g@7@00 roots@8@00 n$0@102@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@102@00) n$0@102@00))
      :qid |quant-u-105|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@105@00 s@$ g@7@00 roots@8@00 r)
          (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
        (= (inv@104@00 s@$ g@7@00 roots@8@00 r) r))
      :pattern ((inv@104@00 s@$ g@7@00 roots@8@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@109@00 $Ref)) (!
      (=>
        (Set_in n@109@00 g@7@00)
        (and
          (= (inv@110@00 s@$ g@7@00 roots@8@00 n@109@00) n@109@00)
          (img@111@00 s@$ g@7@00 roots@8@00 n@109@00)))
      :pattern ((Set_in n@109@00 g@7@00))
      :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 n@109@00))
      :pattern ((img@111@00 s@$ g@7@00 roots@8@00 n@109@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@111@00 s@$ g@7@00 roots@8@00 r)
          (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00))
        (= (inv@110@00 s@$ g@7@00 roots@8@00 r) r))
      :pattern ((inv@110@00 s@$ g@7@00 roots@8@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@103@00 s@$ g@7@00 roots@8@00) r))
      :qid |qp.fvfResTrgDef78|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@105@00 s@$ g@7@00 roots@8@00 r)
          (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00))
        (=
          ($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef79|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_next (sm@106@00 s@$ g@7@00 roots@8@00) r))
      :qid |qp.fvfResTrgDef80|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))
          (and
            (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
            (img@111@00 s@$ g@7@00 roots@8@00 r)))
        (=>
          (and
            (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
            (img@111@00 s@$ g@7@00 roots@8@00 r))
          (Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@112@00 s@$ g@7@00 roots@8@00))))
      :qid |qp.fvfDomDef83|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@110@00 s@$ g@7@00 roots@8@00 r) g@7@00)
            (img@111@00 s@$ g@7@00 roots@8@00 r))
          (and
            (img@105@00 s@$ g@7@00 roots@8@00 r)
            (Set_in (inv@104@00 s@$ g@7@00 roots@8@00 r) g@7@00)))
        (=
          ($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef81|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_next (sm@112@00 s@$ g@7@00 roots@8@00) r))
      :qid |qp.fvfResTrgDef82|))
    (=>
      (is_global_sroot%precondition s@$ g@7@00 roots@8@00)
      (=
        (is_global_sroot s@$ g@7@00 roots@8@00)
        (forall ((n $Ref)) (!
          (=>
            (Set_in n g@7@00)
            (exists_spath<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00) roots@8@00 n))
          :pattern ((exists_spath<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00) roots@8@00 n))
          )))))
  :pattern ((is_global_sroot s@$ g@7@00 roots@8@00))
  :qid |quant-u-112|)))
(assert (forall ((s@$ $Snap) (g@7@00 Set<$Ref>) (roots@8@00 Set<$Ref>)) (!
  (=>
    (is_global_sroot%precondition s@$ g@7@00 roots@8@00)
    (forall ((n $Ref)) (!
      (=>
        (Set_in n g@7@00)
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00))
      :pattern ((exists_spath<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@112@00 s@$ g@7@00 roots@8@00)) g@7@00) roots@8@00 n))
      )))
  :pattern ((is_global_sroot s@$ g@7@00 roots@8@00))
  :qid |quant-u-113|)))
; ---------- FUNCTION is_global_root----------
(declare-fun g@10@00 () Set<$Ref>)
(declare-fun root@11@00 () $Ref)
(declare-fun result@12@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (not (Set_in $Ref.null g@10@00)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const n$0@113@00 $Ref)
(push) ; 2
; [eval] (n$0 in g)
(assert (Set_in n$0@113@00 g@10@00))
(declare-fun sm@114@00 ($Snap Set<$Ref> $Ref) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@115@00 ($Snap Set<$Ref> $Ref $Ref) $Ref)
(declare-fun img@116@00 ($Snap Set<$Ref> $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n$01@113@00 $Ref) (n$02@113@00 $Ref)) (!
  (=>
    (and
      (Set_in n$01@113@00 g@10@00)
      (Set_in n$02@113@00 g@10@00)
      (= n$01@113@00 n$02@113@00))
    (= n$01@113@00 n$02@113@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$0@113@00 $Ref)) (!
  (=>
    (Set_in n$0@113@00 g@10@00)
    (and
      (= (inv@115@00 s@$ g@10@00 root@11@00 n$0@113@00) n$0@113@00)
      (img@116@00 s@$ g@10@00 root@11@00 n$0@113@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@113@00) n$0@113@00))
  :qid |quant-u-115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (= (inv@115@00 s@$ g@10@00 root@11@00 r) r))
  :pattern ((inv@115@00 s@$ g@10@00 root@11@00 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n$0@113@00 $Ref)) (!
  (=> (Set_in n$0@113@00 g@10@00) (not (= n$0@113@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@113@00) n$0@113@00))
  :qid |next-permImpliesNonNull|)))
(declare-fun sm@117@00 ($Snap Set<$Ref> $Ref) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (=
      ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r) r))
  :pattern ((inv@115@00 s@$ g@10@00 root@11@00 r))
  :qid |quant-u-116|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (forall n$1: Ref :: { (n$1.next in g) } { (n$1 in g), n$1.next } (n$1 in g) && n$1.next != null ==> (n$1.next in g))
(declare-const n$1@118@00 $Ref)
(push) ; 2
; [eval] (n$1 in g) && n$1.next != null ==> (n$1.next in g)
; [eval] (n$1 in g) && n$1.next != null
; [eval] (n$1 in g)
(push) ; 3
; [then-branch: 25 | !(n$1@118@00 in g@10@00) | live]
; [else-branch: 25 | n$1@118@00 in g@10@00 | live]
(push) ; 4
; [then-branch: 25 | !(n$1@118@00 in g@10@00)]
(assert (not (Set_in n$1@118@00 g@10@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 25 | n$1@118@00 in g@10@00]
(assert (Set_in n$1@118@00 g@10@00))
; [eval] n$1.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@116@00 s@$ g@10@00 root@11@00 r)
        (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
      (=
        ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef85|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
    :qid |qp.fvfResTrgDef86|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00))
(push) ; 5
(assert (not (and
  (img@116@00 s@$ g@10@00 root@11@00 n$1@118@00)
  (Set_in (inv@115@00 s@$ g@10@00 root@11@00 n$1@118@00) g@10@00))))
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
    (and
      (img@116@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (=
      ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef86|)))
(assert (=>
  (Set_in n$1@118@00 g@10@00)
  (and
    (Set_in n$1@118@00 g@10@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00))))
(assert (or (Set_in n$1@118@00 g@10@00) (not (Set_in n$1@118@00 g@10@00))))
(push) ; 3
; [then-branch: 26 | n$1@118@00 in g@10@00 && Lookup(next, sm@117@00(s@$, g@10@00, root@11@00), n$1@118@00) != Null | live]
; [else-branch: 26 | !(n$1@118@00 in g@10@00 && Lookup(next, sm@117@00(s@$, g@10@00, root@11@00), n$1@118@00) != Null) | live]
(push) ; 4
; [then-branch: 26 | n$1@118@00 in g@10@00 && Lookup(next, sm@117@00(s@$, g@10@00, root@11@00), n$1@118@00) != Null]
(assert (and
  (Set_in n$1@118@00 g@10@00)
  (not
    (=
      ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
      $Ref.null))))
; [eval] (n$1.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@116@00 s@$ g@10@00 root@11@00 r)
        (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
      (=
        ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
    :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
    :qid |qp.fvfValDef85|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
    :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
    :qid |qp.fvfResTrgDef86|))))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00))
(push) ; 5
(assert (not (and
  (img@116@00 s@$ g@10@00 root@11@00 n$1@118@00)
  (Set_in (inv@115@00 s@$ g@10@00 root@11@00 n$1@118@00) g@10@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 26 | !(n$1@118@00 in g@10@00 && Lookup(next, sm@117@00(s@$, g@10@00, root@11@00), n$1@118@00) != Null)]
(assert (not
  (and
    (Set_in n$1@118@00 g@10@00)
    (not
      (=
        ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
        $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (=
      ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef86|)))
(assert (=>
  (and
    (Set_in n$1@118@00 g@10@00)
    (not
      (=
        ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
        $Ref.null)))
  (and
    (Set_in n$1@118@00 g@10@00)
    (not
      (=
        ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$1@118@00 g@10@00)
      (not
        (=
          ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
          $Ref.null))))
  (and
    (Set_in n$1@118@00 g@10@00)
    (not
      (=
        ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
        $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (=
      ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef86|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$1@118@00 $Ref)) (!
  (and
    (=>
      (Set_in n$1@118@00 g@10@00)
      (and
        (Set_in n$1@118@00 g@10@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00)))
    (or (Set_in n$1@118@00 g@10@00) (not (Set_in n$1@118@00 g@10@00)))
    (=>
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null)))
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00)))
    (or
      (not
        (and
          (Set_in n$1@118@00 g@10@00)
          (not
            (=
              ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
              $Ref.null))))
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) g@10@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@332@14@332@22-aux|)))
(assert (forall ((n$1@118@00 $Ref)) (!
  (and
    (=>
      (Set_in n$1@118@00 g@10@00)
      (and
        (Set_in n$1@118@00 g@10@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00)))
    (or (Set_in n$1@118@00 g@10@00) (not (Set_in n$1@118@00 g@10@00)))
    (=>
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null)))
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00)))
    (or
      (not
        (and
          (Set_in n$1@118@00 g@10@00)
          (not
            (=
              ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
              $Ref.null))))
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null)))))
  :pattern ((Set_in n$1@118@00 g@10@00) ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@332@14@332@22-aux|)))
(assert (forall ((n$1@118@00 $Ref)) (!
  (=>
    (and
      (Set_in n$1@118@00 g@10@00)
      (not
        (=
          ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
          $Ref.null)))
    (Set_in ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) g@10@00))
  :pattern ((Set_in ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) g@10@00))
  :pattern ((Set_in n$1@118@00 g@10@00) ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@332@14@332@22|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (root in g)
(assert (Set_in root@11@00 g@10@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (g@10@00 Set<$Ref>) (root@11@00 $Ref)) (!
  (=
    (is_global_root%limited s@$ g@10@00 root@11@00)
    (is_global_root s@$ g@10@00 root@11@00))
  :pattern ((is_global_root s@$ g@10@00 root@11@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (g@10@00 Set<$Ref>) (root@11@00 $Ref)) (!
  (is_global_root%stateless g@10@00 root@11@00)
  :pattern ((is_global_root%limited s@$ g@10@00 root@11@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (= (inv@115@00 s@$ g@10@00 root@11@00 r) r))
  :pattern ((inv@115@00 s@$ g@10@00 root@11@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (=
      ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef86|)))
(assert (forall ((n$0@113@00 $Ref)) (!
  (=>
    (Set_in n$0@113@00 g@10@00)
    (and
      (= (inv@115@00 s@$ g@10@00 root@11@00 n$0@113@00) n$0@113@00)
      (img@116@00 s@$ g@10@00 root@11@00 n$0@113@00)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@113@00) n$0@113@00))
  :qid |quant-u-115|)))
(assert (forall ((n$0@113@00 $Ref)) (!
  (=> (Set_in n$0@113@00 g@10@00) (not (= n$0@113@00 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@113@00) n$0@113@00))
  :qid |next-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r) r))
  :pattern ((inv@115@00 s@$ g@10@00 root@11@00 r))
  :qid |quant-u-116|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (forall ((n$1@118@00 $Ref)) (!
  (and
    (=>
      (Set_in n$1@118@00 g@10@00)
      (and
        (Set_in n$1@118@00 g@10@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00)))
    (or (Set_in n$1@118@00 g@10@00) (not (Set_in n$1@118@00 g@10@00)))
    (=>
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null)))
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00)))
    (or
      (not
        (and
          (Set_in n$1@118@00 g@10@00)
          (not
            (=
              ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
              $Ref.null))))
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) g@10@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@332@14@332@22-aux|)))
(assert (forall ((n$1@118@00 $Ref)) (!
  (and
    (=>
      (Set_in n$1@118@00 g@10@00)
      (and
        (Set_in n$1@118@00 g@10@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00)))
    (or (Set_in n$1@118@00 g@10@00) (not (Set_in n$1@118@00 g@10@00)))
    (=>
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null)))
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00)))
    (or
      (not
        (and
          (Set_in n$1@118@00 g@10@00)
          (not
            (=
              ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
              $Ref.null))))
      (and
        (Set_in n$1@118@00 g@10@00)
        (not
          (=
            ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
            $Ref.null)))))
  :pattern ((Set_in n$1@118@00 g@10@00) ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@332@14@332@22-aux|)))
(assert (forall ((n$1@118@00 $Ref)) (!
  (=>
    (and
      (Set_in n$1@118@00 g@10@00)
      (not
        (=
          ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00)
          $Ref.null)))
    (Set_in ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) g@10@00))
  :pattern ((Set_in ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) g@10@00))
  :pattern ((Set_in n$1@118@00 g@10@00) ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n$1@118@00) n$1@118@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@332@14@332@22|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (Set_in root@11@00 g@10@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (Set_in $Ref.null g@10@00)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall n: Ref :: { exists_path($$(g), root, n) } (n in g) ==> exists_path($$(g), root, n))
(declare-const n@119@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (n in g) ==> exists_path($$(g), root, n)
; [eval] (n in g)
(push) ; 3
; [then-branch: 27 | n@119@00 in g@10@00 | live]
; [else-branch: 27 | !(n@119@00 in g@10@00) | live]
(push) ; 4
; [then-branch: 27 | n@119@00 in g@10@00]
(assert (Set_in n@119@00 g@10@00))
; [eval] exists_path($$(g), root, n)
; [eval] $$(g)
(push) ; 5
(declare-const n@120@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@120@00 g@10@00))
(pop) ; 6
(declare-fun inv@121@00 ($Snap Set<$Ref> $Ref $Ref) $Ref)
(declare-fun img@122@00 ($Snap Set<$Ref> $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@120@00 $Ref) (n2@120@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@120@00 g@10@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n1@120@00) n1@120@00))
      (and
        (Set_in n2@120@00 g@10@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) n2@120@00) n2@120@00))
      (= n1@120@00 n2@120@00))
    (= n1@120@00 n2@120@00))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@120@00 $Ref)) (!
  (=>
    (Set_in n@120@00 g@10@00)
    (and
      (= (inv@121@00 s@$ g@10@00 root@11@00 n@120@00) n@120@00)
      (img@122@00 s@$ g@10@00 root@11@00 n@120@00)))
  :pattern ((Set_in n@120@00 g@10@00))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 n@120@00))
  :pattern ((img@122@00 s@$ g@10@00 root@11@00 n@120@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@122@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (= (inv@121@00 s@$ g@10@00 root@11@00 r) r))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
    ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r) r))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
  :qid |quant-u-118|)))
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
          (img@116@00 s@$ g@10@00 root@11@00 r)
          (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
          (img@122@00 s@$ g@10@00 root@11@00 r)
          (= r (inv@121@00 s@$ g@10@00 root@11@00 r)))
        ($Perm.min
          (ite
            (and
              (img@116@00 s@$ g@10@00 root@11@00 r)
              (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-120|))))
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
    (and
      (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
      (img@122@00 s@$ g@10@00 root@11@00 r)
      (= r (inv@121@00 s@$ g@10@00 root@11@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
            (img@122@00 s@$ g@10@00 root@11@00 r)
            (= r (inv@121@00 s@$ g@10@00 root@11@00 r)))
          ($Perm.min
            (ite
              (and
                (img@116@00 s@$ g@10@00 root@11@00 r)
                (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-121|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@123@00 ($Snap Set<$Ref> $Ref) $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r)))
    (=>
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r))
      (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00))))
  :qid |qp.fvfDomDef89|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r))
      (and
        (img@116@00 s@$ g@10@00 root@11@00 r)
        (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00)))
    (=
      ($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef88|)))
(assert ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00))
(pop) ; 5
; Joined path conditions
(assert (forall ((n@120@00 $Ref)) (!
  (=>
    (Set_in n@120@00 g@10@00)
    (and
      (= (inv@121@00 s@$ g@10@00 root@11@00 n@120@00) n@120@00)
      (img@122@00 s@$ g@10@00 root@11@00 n@120@00)))
  :pattern ((Set_in n@120@00 g@10@00))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 n@120@00))
  :pattern ((img@122@00 s@$ g@10@00 root@11@00 n@120@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@122@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (= (inv@121@00 s@$ g@10@00 root@11@00 r) r))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r)))
    (=>
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r))
      (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00))))
  :qid |qp.fvfDomDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r))
      (and
        (img@116@00 s@$ g@10@00 root@11@00 r)
        (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00)))
    (=
      ($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef88|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
      ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r) r))
    :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
    :qid |quant-u-118|))
  ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 27 | !(n@119@00 in g@10@00)]
(assert (not (Set_in n@119@00 g@10@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((n@120@00 $Ref)) (!
  (=>
    (Set_in n@120@00 g@10@00)
    (and
      (= (inv@121@00 s@$ g@10@00 root@11@00 n@120@00) n@120@00)
      (img@122@00 s@$ g@10@00 root@11@00 n@120@00)))
  :pattern ((Set_in n@120@00 g@10@00))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 n@120@00))
  :pattern ((img@122@00 s@$ g@10@00 root@11@00 n@120@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@122@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (= (inv@121@00 s@$ g@10@00 root@11@00 r) r))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r)))
    (=>
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r))
      (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00))))
  :qid |qp.fvfDomDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r))
      (and
        (img@116@00 s@$ g@10@00 root@11@00 r)
        (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00)))
    (=
      ($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef88|)))
(assert (=>
  (Set_in n@119@00 g@10@00)
  (and
    (Set_in n@119@00 g@10@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r) r))
      :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
      :qid |quant-u-118|))
    ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00))))
; Joined path conditions
(assert (or (not (Set_in n@119@00 g@10@00)) (Set_in n@119@00 g@10@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@120@00 $Ref)) (!
  (=>
    (Set_in n@120@00 g@10@00)
    (and
      (= (inv@121@00 s@$ g@10@00 root@11@00 n@120@00) n@120@00)
      (img@122@00 s@$ g@10@00 root@11@00 n@120@00)))
  :pattern ((Set_in n@120@00 g@10@00))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 n@120@00))
  :pattern ((img@122@00 s@$ g@10@00 root@11@00 n@120@00))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@122@00 s@$ g@10@00 root@11@00 r)
      (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00))
    (= (inv@121@00 s@$ g@10@00 root@11@00 r) r))
  :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r)))
    (=>
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r))
      (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))))
  :pattern ((Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00))))
  :qid |qp.fvfDomDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
        (img@122@00 s@$ g@10@00 root@11@00 r))
      (and
        (img@116@00 s@$ g@10@00 root@11@00 r)
        (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00)))
    (=
      ($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
  :qid |qp.fvfResTrgDef88|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@119@00 $Ref)) (!
  (and
    (=>
      (Set_in n@119@00 g@10@00)
      (and
        (Set_in n@119@00 g@10@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
            ($FVF.loc_next ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r) r))
          :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
          :qid |quant-u-118|))
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00)))
    (or (not (Set_in n@119@00 g@10@00)) (Set_in n@119@00 g@10@00)))
  :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00) root@11@00 n@119@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@335@5@335@87-aux|)))
(assert (=
  result@12@00
  (forall ((n@119@00 $Ref)) (!
    (=>
      (Set_in n@119@00 g@10@00)
      (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00) root@11@00 n@119@00))
    :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00) root@11@00 n@119@00))
    :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/lists/framing1.vpr@335@5@335@87|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (g@10@00 Set<$Ref>) (root@11@00 $Ref)) (!
  (and
    (forall ((n$0@113@00 $Ref)) (!
      (=>
        (Set_in n$0@113@00 g@10@00)
        (and
          (= (inv@115@00 s@$ g@10@00 root@11@00 n$0@113@00) n$0@113@00)
          (img@116@00 s@$ g@10@00 root@11@00 n$0@113@00)))
      :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) n$0@113@00) n$0@113@00))
      :qid |quant-u-115|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@116@00 s@$ g@10@00 root@11@00 r)
          (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
        (= (inv@115@00 s@$ g@10@00 root@11@00 r) r))
      :pattern ((inv@115@00 s@$ g@10@00 root@11@00 r))
      :qid |next-fctOfInv|))
    (forall ((n@120@00 $Ref)) (!
      (=>
        (Set_in n@120@00 g@10@00)
        (and
          (= (inv@121@00 s@$ g@10@00 root@11@00 n@120@00) n@120@00)
          (img@122@00 s@$ g@10@00 root@11@00 n@120@00)))
      :pattern ((Set_in n@120@00 g@10@00))
      :pattern ((inv@121@00 s@$ g@10@00 root@11@00 n@120@00))
      :pattern ((img@122@00 s@$ g@10@00 root@11@00 n@120@00))
      :qid |next-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@122@00 s@$ g@10@00 root@11@00 r)
          (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00))
        (= (inv@121@00 s@$ g@10@00 root@11@00 r) r))
      :pattern ((inv@121@00 s@$ g@10@00 root@11@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@114@00 s@$ g@10@00 root@11@00) r))
      :qid |qp.fvfResTrgDef84|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@116@00 s@$ g@10@00 root@11@00 r)
          (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00))
        (=
          ($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef85|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_next (sm@117@00 s@$ g@10@00 root@11@00) r))
      :qid |qp.fvfResTrgDef86|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))
          (and
            (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
            (img@122@00 s@$ g@10@00 root@11@00 r)))
        (=>
          (and
            (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
            (img@122@00 s@$ g@10@00 root@11@00 r))
          (Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00)))))
      :pattern ((Set_in r ($FVF.domain_next (sm@123@00 s@$ g@10@00 root@11@00))))
      :qid |qp.fvfDomDef89|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@121@00 s@$ g@10@00 root@11@00 r) g@10@00)
            (img@122@00 s@$ g@10@00 root@11@00 r))
          (and
            (img@116@00 s@$ g@10@00 root@11@00 r)
            (Set_in (inv@115@00 s@$ g@10@00 root@11@00 r) g@10@00)))
        (=
          ($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef87|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_next (sm@123@00 s@$ g@10@00 root@11@00) r))
      :qid |qp.fvfResTrgDef88|))
    (=>
      (is_global_root%precondition s@$ g@10@00 root@11@00)
      (=
        (is_global_root s@$ g@10@00 root@11@00)
        (forall ((n $Ref)) (!
          (=>
            (Set_in n g@10@00)
            (exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00) root@11@00 n))
          :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00) root@11@00 n))
          )))))
  :pattern ((is_global_root s@$ g@10@00 root@11@00))
  :qid |quant-u-122|)))
(assert (forall ((s@$ $Snap) (g@10@00 Set<$Ref>) (root@11@00 $Ref)) (!
  (=>
    (is_global_root%precondition s@$ g@10@00 root@11@00)
    (forall ((n $Ref)) (!
      (=>
        (Set_in n g@10@00)
        ($$%precondition ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00))
      :pattern ((exists_path<Bool> ($$ ($SortWrappers.$FVF<next>To$Snap (sm@123@00 s@$ g@10@00 root@11@00)) g@10@00) root@11@00 n))
      )))
  :pattern ((is_global_root s@$ g@10@00 root@11@00))
  :qid |quant-u-123|)))
