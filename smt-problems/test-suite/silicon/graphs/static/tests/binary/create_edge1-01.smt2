(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:13:00
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Set<$Snap> 0)
(declare-sort TrClo 0)
(declare-sort __FieldEnum__ 0)
(declare-sort Edge 0)
(declare-sort $FVF<l> 0)
(declare-sort $FVF<r> 0)
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
(declare-fun $SortWrappers.__FieldEnum__To$Snap (__FieldEnum__) $Snap)
(declare-fun $SortWrappers.$SnapTo__FieldEnum__ ($Snap) __FieldEnum__)
(assert (forall ((x __FieldEnum__)) (!
    (= x ($SortWrappers.$SnapTo__FieldEnum__($SortWrappers.__FieldEnum__To$Snap x)))
    :pattern (($SortWrappers.__FieldEnum__To$Snap x))
    :qid |$Snap.$SnapTo__FieldEnum__To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.__FieldEnum__To$Snap($SortWrappers.$SnapTo__FieldEnum__ x)))
    :pattern (($SortWrappers.$SnapTo__FieldEnum__ x))
    :qid |$Snap.__FieldEnum__To$SnapTo__FieldEnum__|
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<l>To$Snap ($FVF<l>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<l> ($Snap) $FVF<l>)
(assert (forall ((x $FVF<l>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<l>($SortWrappers.$FVF<l>To$Snap x)))
    :pattern (($SortWrappers.$FVF<l>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<l>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<l>To$Snap($SortWrappers.$SnapTo$FVF<l> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<l> x))
    :qid |$Snap.$FVF<l>To$SnapTo$FVF<l>|
    )))
(declare-fun $SortWrappers.$FVF<r>To$Snap ($FVF<r>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<r> ($Snap) $FVF<r>)
(assert (forall ((x $FVF<r>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<r>($SortWrappers.$FVF<r>To$Snap x)))
    :pattern (($SortWrappers.$FVF<r>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<r>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<r>To$Snap($SortWrappers.$SnapTo$FVF<r> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<r> x))
    :qid |$Snap.$FVF<r>To$SnapTo$FVF<r>|
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
(declare-const __left__<__FieldEnum__> __FieldEnum__)
(declare-const __right__<__FieldEnum__> __FieldEnum__)
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
; /field_value_functions_declarations.smt2 [l: Ref]
(declare-fun $FVF.domain_l ($FVF<l>) Set<$Ref>)
(declare-fun $FVF.lookup_l ($FVF<l> $Ref) $Ref)
(declare-fun $FVF.after_l ($FVF<l> $FVF<l>) Bool)
(declare-fun $FVF.loc_l ($Ref $Ref) Bool)
(declare-fun $FVF.perm_l ($FPM $Ref) $Perm)
(declare-const $fvfTOP_l $FVF<l>)
; /field_value_functions_declarations.smt2 [r: Ref]
(declare-fun $FVF.domain_r ($FVF<r>) Set<$Ref>)
(declare-fun $FVF.lookup_r ($FVF<r> $Ref) $Ref)
(declare-fun $FVF.after_r ($FVF<r> $FVF<r>) Bool)
(declare-fun $FVF.loc_r ($Ref $Ref) Bool)
(declare-fun $FVF.perm_r ($FPM $Ref) $Perm)
(declare-const $fvfTOP_r $FVF<r>)
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
(assert (distinct __left__<__FieldEnum__> __right__<__FieldEnum__>))
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
; /field_value_functions_axioms.smt2 [l: Ref]
(assert (forall ((vs $FVF<l>) (ws $FVF<l>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_l vs) ($FVF.domain_l ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_l vs))
            (= ($FVF.lookup_l vs x) ($FVF.lookup_l ws x)))
          :pattern (($FVF.lookup_l vs x) ($FVF.lookup_l ws x))
          :qid |qp.$FVF<l>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<l>To$Snap vs)
              ($SortWrappers.$FVF<l>To$Snap ws)
              )
    :qid |qp.$FVF<l>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_l pm r))
    :pattern (($FVF.perm_l pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_l f r) true)
    :pattern (($FVF.loc_l f r)))))
; /field_value_functions_axioms.smt2 [r: Ref]
(assert (forall ((vs $FVF<r>) (ws $FVF<r>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_r vs) ($FVF.domain_r ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_r vs))
            (= ($FVF.lookup_r vs x) ($FVF.lookup_r ws x)))
          :pattern (($FVF.lookup_r vs x) ($FVF.lookup_r ws x))
          :qid |qp.$FVF<r>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<r>To$Snap vs)
              ($SortWrappers.$FVF<r>To$Snap ws)
              )
    :qid |qp.$FVF<r>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_r pm r))
    :pattern (($FVF.perm_r pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_r f r) true)
    :pattern (($FVF.loc_r f r)))))
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
(declare-const n@5@00 $Ref)
(push) ; 2
; [eval] (n in refs)
(assert (Set_in n@5@00 refs@0@00))
(declare-fun sm@6@00 ($Snap Set<$Ref>) $FVF<l>)
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
  
  :qid |l-rcvrInj|))))
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
  :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) n@5@00) n@5@00))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@00 s@$ refs@0@00 r)
      (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
    (= (inv@7@00 s@$ refs@0@00 r) r))
  :pattern ((inv@7@00 s@$ refs@0@00 r))
  :qid |l-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@5@00 $Ref)) (!
  (=> (Set_in n@5@00 refs@0@00) (not (= n@5@00 $Ref.null)))
  :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) n@5@00) n@5@00))
  :qid |l-permImpliesNonNull|)))
(declare-fun sm@9@00 ($Snap Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@00 s@$ refs@0@00 r)
      (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00)
    ($FVF.loc_l ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r) r))
  :pattern ((inv@7@00 s@$ refs@0@00 r))
  :qid |quant-u-6|)))
(declare-const n@10@00 $Ref)
(push) ; 2
; [eval] (n in refs)
(assert (Set_in n@10@00 refs@0@00))
(declare-fun sm@11@00 ($Snap Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@12@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@13@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@10@00 $Ref) (n2@10@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@10@00 refs@0@00)
      (Set_in n2@10@00 refs@0@00)
      (= n1@10@00 n2@10@00))
    (= n1@10@00 n2@10@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@10@00 $Ref)) (!
  (=>
    (Set_in n@10@00 refs@0@00)
    (and
      (= (inv@12@00 s@$ refs@0@00 n@10@00) n@10@00)
      (img@13@00 s@$ refs@0@00 n@10@00)))
  :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) n@10@00) n@10@00))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ refs@0@00 r)
      (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
    (= (inv@12@00 s@$ refs@0@00 r) r))
  :pattern ((inv@12@00 s@$ refs@0@00 r))
  :qid |r-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@10@00 $Ref)) (!
  (=> (Set_in n@10@00 refs@0@00) (not (= n@10@00 $Ref.null)))
  :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) n@10@00) n@10@00))
  :qid |r-permImpliesNonNull|)))
(declare-fun sm@14@00 ($Snap Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ refs@0@00 r)
      (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r) r)
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00)
    ($FVF.loc_r ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r) r))
  :pattern ((inv@12@00 s@$ refs@0@00 r))
  :qid |quant-u-9|)))
(declare-const $t@15@00 $Snap)
(assert (= $t@15@00 ($Snap.combine ($Snap.first $t@15@00) ($Snap.second $t@15@00))))
(assert (= ($Snap.first $t@15@00) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { create_edge(p, s) } ((p in refs) && ((s in refs) && (p.l == s || p.r == s))) == (create_edge(p, s) in result))
(declare-const p@16@00 $Ref)
(declare-const s@17@00 $Ref)
(push) ; 2
; [eval] ((p in refs) && ((s in refs) && (p.l == s || p.r == s))) == (create_edge(p, s) in result)
; [eval] (p in refs) && ((s in refs) && (p.l == s || p.r == s))
; [eval] (p in refs)
(push) ; 3
; [then-branch: 0 | !(p@16@00 in refs@0@00) | live]
; [else-branch: 0 | p@16@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 0 | !(p@16@00 in refs@0@00)]
(assert (not (Set_in p@16@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | p@16@00 in refs@0@00]
(assert (Set_in p@16@00 refs@0@00))
; [eval] (s in refs)
(push) ; 5
; [then-branch: 1 | !(s@17@00 in refs@0@00) | live]
; [else-branch: 1 | s@17@00 in refs@0@00 | live]
(push) ; 6
; [then-branch: 1 | !(s@17@00 in refs@0@00)]
(assert (not (Set_in s@17@00 refs@0@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | s@17@00 in refs@0@00]
(assert (Set_in s@17@00 refs@0@00))
; [eval] p.l == s || p.r == s
; [eval] p.l == s
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@8@00 s@$ refs@0@00 r)
        (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
      (=
        ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r)
        ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
    :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
    :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_l ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) p@16@00))
(push) ; 7
(assert (not (and
  (img@8@00 s@$ refs@0@00 p@16@00)
  (Set_in (inv@7@00 s@$ refs@0@00 p@16@00) refs@0@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 2 | Lookup(l, sm@9@00(s@$, refs@0@00), p@16@00) == s@17@00 | live]
; [else-branch: 2 | Lookup(l, sm@9@00(s@$, refs@0@00), p@16@00) != s@17@00 | live]
(push) ; 8
; [then-branch: 2 | Lookup(l, sm@9@00(s@$, refs@0@00), p@16@00) == s@17@00]
(assert (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | Lookup(l, sm@9@00(s@$, refs@0@00), p@16@00) != s@17@00]
(assert (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00)))
; [eval] p.r == s
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@00 s@$ refs@0@00 r)
        (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
      (=
        ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r)
        ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r)))
    :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
    :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r) r)
    :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) p@16@00) p@16@00))
(push) ; 9
(assert (not (and
  (img@13@00 s@$ refs@0@00 p@16@00)
  (Set_in (inv@12@00 s@$ refs@0@00 p@16@00) refs@0@00))))
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
      (img@13@00 s@$ refs@0@00 r)
      (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r) r)
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
  (and
    (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
    ($FVF.loc_r ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) p@16@00) p@16@00))))
(assert (or
  (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
  (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00)))
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
      ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ refs@0@00 r)
      (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r) r)
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (Set_in s@17@00 refs@0@00)
  (and
    (Set_in s@17@00 refs@0@00)
    ($FVF.loc_l ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) p@16@00)
    (=>
      (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
      (and
        (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) p@16@00) p@16@00)))
    (or
      (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
      (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00)))))
(assert (or (Set_in s@17@00 refs@0@00) (not (Set_in s@17@00 refs@0@00))))
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
      ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ refs@0@00 r)
      (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r) r)
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (Set_in p@16@00 refs@0@00)
  (and
    (Set_in p@16@00 refs@0@00)
    (=>
      (Set_in s@17@00 refs@0@00)
      (and
        (Set_in s@17@00 refs@0@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) p@16@00)
        (=>
          (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
          (and
            (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) p@16@00) p@16@00)))
        (or
          (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
          (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))))
    (or (Set_in s@17@00 refs@0@00) (not (Set_in s@17@00 refs@0@00))))))
(assert (or (Set_in p@16@00 refs@0@00) (not (Set_in p@16@00 refs@0@00))))
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
      ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ refs@0@00 r)
      (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
    (=
      ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r)))
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r) r)
  :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@16@00 $Ref) (s@17@00 $Ref)) (!
  (and
    (=>
      (Set_in p@16@00 refs@0@00)
      (and
        (Set_in p@16@00 refs@0@00)
        (=>
          (Set_in s@17@00 refs@0@00)
          (and
            (Set_in s@17@00 refs@0@00)
            ($FVF.loc_l ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) p@16@00)
            (=>
              (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
              (and
                (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
                ($FVF.loc_r ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) p@16@00) p@16@00)))
            (or
              (not (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))
              (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00))))
        (or (Set_in s@17@00 refs@0@00) (not (Set_in s@17@00 refs@0@00)))))
    (or (Set_in p@16@00 refs@0@00) (not (Set_in p@16@00 refs@0@00))))
  :pattern ((create_edge<Edge> p@16@00 s@17@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@169@13@173@44-aux|)))
(assert (forall ((p@16@00 $Ref) (s@17@00 $Ref)) (!
  (=
    (and
      (Set_in p@16@00 refs@0@00)
      (and
        (Set_in s@17@00 refs@0@00)
        (or
          (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p@16@00) s@17@00)
          (= ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) p@16@00) s@17@00))))
    (Set_in (create_edge<Edge> p@16@00 s@17@00) result@1@00))
  :pattern ((create_edge<Edge> p@16@00 s@17@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@169@13@173@44|)))
(assert (=
  ($Snap.second $t@15@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@00))
    ($Snap.second ($Snap.second $t@15@00)))))
(assert (= ($Snap.first ($Snap.second $t@15@00)) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { (p in refs), (s in refs), exists_path(result, p, s) } (p in refs) && exists_path(result, p, s) ==> (s in refs))
(declare-const p@18@00 $Ref)
(declare-const s@19@00 $Ref)
(push) ; 2
; [eval] (p in refs) && exists_path(result, p, s) ==> (s in refs)
; [eval] (p in refs) && exists_path(result, p, s)
; [eval] (p in refs)
(push) ; 3
; [then-branch: 3 | !(p@18@00 in refs@0@00) | live]
; [else-branch: 3 | p@18@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 3 | !(p@18@00 in refs@0@00)]
(assert (not (Set_in p@18@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | p@18@00 in refs@0@00]
(assert (Set_in p@18@00 refs@0@00))
; [eval] exists_path(result, p, s)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in p@18@00 refs@0@00) (not (Set_in p@18@00 refs@0@00))))
(push) ; 3
; [then-branch: 4 | p@18@00 in refs@0@00 && exists_path[Bool](result@1@00, p@18@00, s@19@00) | live]
; [else-branch: 4 | !(p@18@00 in refs@0@00 && exists_path[Bool](result@1@00, p@18@00, s@19@00)) | live]
(push) ; 4
; [then-branch: 4 | p@18@00 in refs@0@00 && exists_path[Bool](result@1@00, p@18@00, s@19@00)]
(assert (and (Set_in p@18@00 refs@0@00) (exists_path<Bool> result@1@00 p@18@00 s@19@00)))
; [eval] (s in refs)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(p@18@00 in refs@0@00 && exists_path[Bool](result@1@00, p@18@00, s@19@00))]
(assert (not
  (and
    (Set_in p@18@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@18@00 s@19@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in p@18@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@18@00 s@19@00)))
  (and
    (Set_in p@18@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@18@00 s@19@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@18@00 $Ref) (s@19@00 $Ref)) (!
  (and
    (or (Set_in p@18@00 refs@0@00) (not (Set_in p@18@00 refs@0@00)))
    (or
      (not
        (and
          (Set_in p@18@00 refs@0@00)
          (exists_path<Bool> result@1@00 p@18@00 s@19@00)))
      (and
        (Set_in p@18@00 refs@0@00)
        (exists_path<Bool> result@1@00 p@18@00 s@19@00))))
  :pattern ((Set_in p@18@00 refs@0@00) (Set_in s@19@00 refs@0@00) (exists_path<Bool> result@1@00 p@18@00 s@19@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@175@13@177@63-aux|)))
(assert (forall ((p@18@00 $Ref) (s@19@00 $Ref)) (!
  (=>
    (and
      (Set_in p@18@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@18@00 s@19@00))
    (Set_in s@19@00 refs@0@00))
  :pattern ((Set_in p@18@00 refs@0@00) (Set_in s@19@00 refs@0@00) (exists_path<Bool> result@1@00 p@18@00 s@19@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@175@13@177@63|)))
(assert (= ($Snap.second ($Snap.second $t@15@00)) $Snap.unit))
; [eval] (forall p: Ref, s: Ref :: { (p in refs), (s in refs), exists_path(result, p, s) } (s in refs) && exists_path(result, p, s) ==> (p in refs))
(declare-const p@20@00 $Ref)
(declare-const s@21@00 $Ref)
(push) ; 2
; [eval] (s in refs) && exists_path(result, p, s) ==> (p in refs)
; [eval] (s in refs) && exists_path(result, p, s)
; [eval] (s in refs)
(push) ; 3
; [then-branch: 5 | !(s@21@00 in refs@0@00) | live]
; [else-branch: 5 | s@21@00 in refs@0@00 | live]
(push) ; 4
; [then-branch: 5 | !(s@21@00 in refs@0@00)]
(assert (not (Set_in s@21@00 refs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | s@21@00 in refs@0@00]
(assert (Set_in s@21@00 refs@0@00))
; [eval] exists_path(result, p, s)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s@21@00 refs@0@00) (not (Set_in s@21@00 refs@0@00))))
(push) ; 3
; [then-branch: 6 | s@21@00 in refs@0@00 && exists_path[Bool](result@1@00, p@20@00, s@21@00) | live]
; [else-branch: 6 | !(s@21@00 in refs@0@00 && exists_path[Bool](result@1@00, p@20@00, s@21@00)) | live]
(push) ; 4
; [then-branch: 6 | s@21@00 in refs@0@00 && exists_path[Bool](result@1@00, p@20@00, s@21@00)]
(assert (and (Set_in s@21@00 refs@0@00) (exists_path<Bool> result@1@00 p@20@00 s@21@00)))
; [eval] (p in refs)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(s@21@00 in refs@0@00 && exists_path[Bool](result@1@00, p@20@00, s@21@00))]
(assert (not
  (and
    (Set_in s@21@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@20@00 s@21@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s@21@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@20@00 s@21@00)))
  (and
    (Set_in s@21@00 refs@0@00)
    (exists_path<Bool> result@1@00 p@20@00 s@21@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@20@00 $Ref) (s@21@00 $Ref)) (!
  (and
    (or (Set_in s@21@00 refs@0@00) (not (Set_in s@21@00 refs@0@00)))
    (or
      (not
        (and
          (Set_in s@21@00 refs@0@00)
          (exists_path<Bool> result@1@00 p@20@00 s@21@00)))
      (and
        (Set_in s@21@00 refs@0@00)
        (exists_path<Bool> result@1@00 p@20@00 s@21@00))))
  :pattern ((Set_in p@20@00 refs@0@00) (Set_in s@21@00 refs@0@00) (exists_path<Bool> result@1@00 p@20@00 s@21@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@178@13@180@63-aux|)))
(assert (forall ((p@20@00 $Ref) (s@21@00 $Ref)) (!
  (=>
    (and
      (Set_in s@21@00 refs@0@00)
      (exists_path<Bool> result@1@00 p@20@00 s@21@00))
    (Set_in p@20@00 refs@0@00))
  :pattern ((Set_in p@20@00 refs@0@00) (Set_in s@21@00 refs@0@00) (exists_path<Bool> result@1@00 p@20@00 s@21@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@178@13@180@63|)))
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
      :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) n@5@00) n@5@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@8@00 s@$ refs@0@00 r)
          (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
        (= (inv@7@00 s@$ refs@0@00 r) r))
      :pattern ((inv@7@00 s@$ refs@0@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@10@00 $Ref)) (!
      (=>
        (Set_in n@10@00 refs@0@00)
        (and
          (= (inv@12@00 s@$ refs@0@00 n@10@00) n@10@00)
          (img@13@00 s@$ refs@0@00 n@10@00)))
      :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) n@10@00) n@10@00))
      :qid |quant-u-8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ refs@0@00 r)
          (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
        (= (inv@12@00 s@$ refs@0@00 r) r))
      :pattern ((inv@12@00 s@$ refs@0@00 r))
      :qid |r-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_l (sm@6@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef0|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_r (sm@11@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@8@00 s@$ refs@0@00 r)
          (Set_in (inv@7@00 s@$ refs@0@00 r) refs@0@00))
        (=
          ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef1|))
    (forall ((r $Ref)) (!
      ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
      :pattern (($FVF.lookup_l (sm@9@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ refs@0@00 r)
          (Set_in (inv@12@00 s@$ refs@0@00 r) refs@0@00))
        (=
          ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.second s@$)) r) r)
      :pattern (($FVF.lookup_r (sm@14@00 s@$ refs@0@00) r))
      :qid |qp.fvfResTrgDef5|))
    (=>
      ($$%precondition s@$ refs@0@00)
      (and
        (forall ((p $Ref) (s $Ref)) (!
          (=
            (and
              (Set_in p refs@0@00)
              (and
                (Set_in s refs@0@00)
                (or
                  (= ($FVF.lookup_l (sm@9@00 s@$ refs@0@00) p) s)
                  (= ($FVF.lookup_r (sm@14@00 s@$ refs@0@00) p) s))))
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
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (refs@0@00 Set<$Ref>)) (!
  (let ((result@1@00 ($$%limited s@$ refs@0@00))) true)
  :pattern (($$%limited s@$ refs@0@00))
  :qid |quant-u-13|)))
; ---------- FUNCTION apply_TCFraming----------
(declare-fun g0@2@00 () Set<$Ref>)
(declare-fun g1@3@00 () Set<$Ref>)
(declare-fun result@4@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const n@22@00 $Ref)
(push) ; 2
; [eval] (n in g0)
(assert (Set_in n@22@00 g0@2@00))
(declare-fun sm@23@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@24@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@25@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@22@00 $Ref) (n2@22@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@22@00 g0@2@00)
      (Set_in n2@22@00 g0@2@00)
      (= n1@22@00 n2@22@00))
    (= n1@22@00 n2@22@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@22@00 $Ref)) (!
  (=>
    (Set_in n@22@00 g0@2@00)
    (and
      (= (inv@24@00 s@$ g0@2@00 g1@3@00 n@22@00) n@22@00)
      (img@25@00 s@$ g0@2@00 g1@3@00 n@22@00)))
  :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) n@22@00) n@22@00))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@24@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@24@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@22@00 $Ref)) (!
  (=> (Set_in n@22@00 g0@2@00) (not (= n@22@00 $Ref.null)))
  :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) n@22@00) n@22@00))
  :qid |l-permImpliesNonNull|)))
(declare-fun sm@26@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@26@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@26@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_l (sm@26@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_l ($FVF.lookup_l (sm@26@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@24@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-16|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const n@27@00 $Ref)
(push) ; 2
; [eval] (n in g0)
(assert (Set_in n@27@00 g0@2@00))
(declare-fun sm@28@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@29@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@30@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@27@00 $Ref) (n2@27@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@27@00 g0@2@00)
      (Set_in n2@27@00 g0@2@00)
      (= n1@27@00 n2@27@00))
    (= n1@27@00 n2@27@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@27@00 $Ref)) (!
  (=>
    (Set_in n@27@00 g0@2@00)
    (and
      (= (inv@29@00 s@$ g0@2@00 g1@3@00 n@27@00) n@27@00)
      (img@30@00 s@$ g0@2@00 g1@3@00 n@27@00)))
  :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) n@27@00) n@27@00))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@29@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@29@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@27@00 $Ref)) (!
  (=> (Set_in n@27@00 g0@2@00) (not (= n@27@00 $Ref.null)))
  :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) n@27@00) n@27@00))
  :qid |r-permImpliesNonNull|)))
(declare-fun sm@31@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@31@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@31@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r)
  :pattern (($FVF.lookup_r (sm@31@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_r ($FVF.lookup_r (sm@31@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@29@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-19|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(declare-const n@32@00 $Ref)
(push) ; 2
; [eval] (n in g1)
(assert (Set_in n@32@00 g1@3@00))
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@33@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@34@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@32@00 $Ref) (n2@32@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@32@00 g1@3@00)
      (Set_in n2@32@00 g1@3@00)
      (= n1@32@00 n2@32@00))
    (= n1@32@00 n2@32@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@32@00 $Ref)) (!
  (=>
    (Set_in n@32@00 g1@3@00)
    (and
      (= (inv@33@00 s@$ g0@2@00 g1@3@00 n@32@00) n@32@00)
      (img@34@00 s@$ g0@2@00 g1@3@00 n@32@00)))
  :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) n@32@00) n@32@00))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@33@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@33@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@32@00 $Ref)) (!
  (=> (Set_in n@32@00 g1@3@00) (not (= n@32@00 $Ref.null)))
  :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) n@32@00) n@32@00))
  :qid |l-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= n@32@00 n@22@00)
    (=
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))))
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@35@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@33@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-23|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(declare-const n@36@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (n in g1)
(assert (Set_in n@36@00 g1@3@00))
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@37@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@38@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@36@00 $Ref) (n2@36@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@36@00 g1@3@00)
      (Set_in n2@36@00 g1@3@00)
      (= n1@36@00 n2@36@00))
    (= n1@36@00 n2@36@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@36@00 $Ref)) (!
  (=>
    (Set_in n@36@00 g1@3@00)
    (and
      (= (inv@37@00 s@$ g0@2@00 g1@3@00 n@36@00) n@36@00)
      (img@38@00 s@$ g0@2@00 g1@3@00 n@36@00)))
  :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) n@36@00) n@36@00))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@37@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@37@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@36@00 $Ref)) (!
  (=> (Set_in n@36@00 g1@3@00) (not (= n@36@00 $Ref.null)))
  :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) n@36@00) n@36@00))
  :qid |r-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= n@36@00 n@27@00)
    (=
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))))
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@39@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@39@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@39@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@39@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@39@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r))
  :pattern (($FVF.lookup_r (sm@39@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_r ($FVF.lookup_r (sm@39@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@37@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-27|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] (forall n$0: Ref :: { (n$0 in g0), (n$0 in g1) } (n$0 in g0) ==> !((n$0 in g1)))
(declare-const n$0@40@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (n$0 in g0) ==> !((n$0 in g1))
; [eval] (n$0 in g0)
(push) ; 3
; [then-branch: 7 | n$0@40@00 in g0@2@00 | live]
; [else-branch: 7 | !(n$0@40@00 in g0@2@00) | live]
(push) ; 4
; [then-branch: 7 | n$0@40@00 in g0@2@00]
(assert (Set_in n$0@40@00 g0@2@00))
; [eval] !((n$0 in g1))
; [eval] (n$0 in g1)
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(n$0@40@00 in g0@2@00)]
(assert (not (Set_in n$0@40@00 g0@2@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in n$0@40@00 g0@2@00)) (Set_in n$0@40@00 g0@2@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$0@40@00 $Ref)) (!
  (or (not (Set_in n$0@40@00 g0@2@00)) (Set_in n$0@40@00 g0@2@00))
  :pattern ((Set_in n$0@40@00 g0@2@00) (Set_in n$0@40@00 g1@3@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@208@14@208@34-aux|)))
(assert (forall ((n$0@40@00 $Ref)) (!
  (=> (Set_in n$0@40@00 g0@2@00) (not (Set_in n$0@40@00 g1@3@00)))
  :pattern ((Set_in n$0@40@00 g0@2@00) (Set_in n$0@40@00 g1@3@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@208@14@208@34|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] (forall n$1: Ref :: { (n$1 in g0), (n$1 in g1) } (n$1 in g1) ==> !((n$1 in g0)))
(declare-const n$1@41@00 $Ref)
(push) ; 2
; [eval] (n$1 in g1) ==> !((n$1 in g0))
; [eval] (n$1 in g1)
(push) ; 3
; [then-branch: 8 | n$1@41@00 in g1@3@00 | live]
; [else-branch: 8 | !(n$1@41@00 in g1@3@00) | live]
(push) ; 4
; [then-branch: 8 | n$1@41@00 in g1@3@00]
(assert (Set_in n$1@41@00 g1@3@00))
; [eval] !((n$1 in g0))
; [eval] (n$1 in g0)
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(n$1@41@00 in g1@3@00)]
(assert (not (Set_in n$1@41@00 g1@3@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in n$1@41@00 g1@3@00)) (Set_in n$1@41@00 g1@3@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$1@41@00 $Ref)) (!
  (or (not (Set_in n$1@41@00 g1@3@00)) (Set_in n$1@41@00 g1@3@00))
  :pattern ((Set_in n$1@41@00 g0@2@00) (Set_in n$1@41@00 g1@3@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@208@14@208@34-aux|)))
(assert (forall ((n$1@41@00 $Ref)) (!
  (=> (Set_in n$1@41@00 g1@3@00) (not (Set_in n$1@41@00 g0@2@00)))
  :pattern ((Set_in n$1@41@00 g0@2@00) (Set_in n$1@41@00 g1@3@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@208@14@208@34|)))
(declare-const $t@42@00 $Snap)
(assert (= $t@42@00 ($Snap.combine ($Snap.first $t@42@00) ($Snap.second $t@42@00))))
(assert (= ($Snap.first $t@42@00) $Snap.unit))
; [eval] (g0 union g1) == (g1 union g0)
; [eval] (g0 union g1)
; [eval] (g1 union g0)
(assert (Set_equal (Set_union g0@2@00 g1@3@00) (Set_union g1@3@00 g0@2@00)))
(assert (=
  ($Snap.second $t@42@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@42@00))
    ($Snap.second ($Snap.second $t@42@00)))))
(assert (= ($Snap.first ($Snap.second $t@42@00)) $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g0), u, v) } { exists_path($$((g0 union g1)), u, v) } (u in g0) && ((v in g0) && exists_path($$(g0), u, v)) ==> exists_path($$((g0 union g1)), u, v))
(declare-const u@43@00 $Ref)
(declare-const v@44@00 $Ref)
(push) ; 2
; [eval] (u in g0) && ((v in g0) && exists_path($$(g0), u, v)) ==> exists_path($$((g0 union g1)), u, v)
; [eval] (u in g0) && ((v in g0) && exists_path($$(g0), u, v))
; [eval] (u in g0)
(push) ; 3
; [then-branch: 9 | !(u@43@00 in g0@2@00) | live]
; [else-branch: 9 | u@43@00 in g0@2@00 | live]
(push) ; 4
; [then-branch: 9 | !(u@43@00 in g0@2@00)]
(assert (not (Set_in u@43@00 g0@2@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | u@43@00 in g0@2@00]
(assert (Set_in u@43@00 g0@2@00))
; [eval] (v in g0)
(push) ; 5
; [then-branch: 10 | !(v@44@00 in g0@2@00) | live]
; [else-branch: 10 | v@44@00 in g0@2@00 | live]
(push) ; 6
; [then-branch: 10 | !(v@44@00 in g0@2@00)]
(assert (not (Set_in v@44@00 g0@2@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | v@44@00 in g0@2@00]
(assert (Set_in v@44@00 g0@2@00))
; [eval] exists_path($$(g0), u, v)
; [eval] $$(g0)
(push) ; 7
(declare-const n@45@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@45@00 g0@2@00))
(pop) ; 8
(declare-fun inv@46@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@47@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@45@00 $Ref) (n2@45@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@45@00 g0@2@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) n1@45@00) n1@45@00))
      (and
        (Set_in n2@45@00 g0@2@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) n2@45@00) n2@45@00))
      (= n1@45@00 n2@45@00))
    (= n1@45@00 n2@45@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 g0@2@00)
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 g0@2@00))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-29|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@47@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-31|))))
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
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-32|))))
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
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@47@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@46@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@48@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef21|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef20|)))
(declare-const n@49@00 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@49@00 g0@2@00))
(pop) ; 8
(declare-fun inv@50@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@51@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@52@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef24|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@49@00 $Ref) (n2@49@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@49@00 g0@2@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) n1@49@00) n1@49@00))
      (and
        (Set_in n2@49@00 g0@2@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) n2@49@00) n2@49@00))
      (= n1@49@00 n2@49@00))
    (= n1@49@00 n2@49@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@49@00 $Ref)) (!
  (=>
    (Set_in n@49@00 g0@2@00)
    (and
      (= (inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00) n@49@00)
      (img@51@00 s@$ g0@2@00 g1@3@00 n@49@00)))
  :pattern ((Set_in n@49@00 g0@2@00))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :pattern ((img@51@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@50@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_r ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-35|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@51@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-37|))))
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
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-38|))))
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
      (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@51@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@51@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-39|))))
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
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@51@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@30@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                (img@51@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@38@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-40|))))
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
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
              (img@51@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-41|))))
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
      (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@51@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
              (img@51@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@51@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@30@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                  (img@51@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@50@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@38@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@53@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef28|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef27|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 g0@2@00)
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 g0@2@00))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (forall ((n@49@00 $Ref)) (!
  (=>
    (Set_in n@49@00 g0@2@00)
    (and
      (= (inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00) n@49@00)
      (img@51@00 s@$ g0@2@00 g1@3@00 n@49@00)))
  :pattern ((Set_in n@49@00 g0@2@00))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :pattern ((img@51@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@50@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-29|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      ($FVF.loc_r ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-35|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 g0@2@00)
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 g0@2@00))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (forall ((n@49@00 $Ref)) (!
  (=>
    (Set_in n@49@00 g0@2@00)
    (and
      (= (inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00) n@49@00)
      (img@51@00 s@$ g0@2@00 g1@3@00 n@49@00)))
  :pattern ((Set_in n@49@00 g0@2@00))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :pattern ((img@51@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@50@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (=>
  (Set_in v@44@00 g0@2@00)
  (and
    (Set_in v@44@00 g0@2@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-29|))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-35|))
    ($$%precondition ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00))))
(assert (or (Set_in v@44@00 g0@2@00) (not (Set_in v@44@00 g0@2@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 g0@2@00)
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 g0@2@00))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (forall ((n@49@00 $Ref)) (!
  (=>
    (Set_in n@49@00 g0@2@00)
    (and
      (= (inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00) n@49@00)
      (img@51@00 s@$ g0@2@00 g1@3@00 n@49@00)))
  :pattern ((Set_in n@49@00 g0@2@00))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :pattern ((img@51@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@50@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (=>
  (Set_in u@43@00 g0@2@00)
  (and
    (Set_in u@43@00 g0@2@00)
    (=>
      (Set_in v@44@00 g0@2@00)
      (and
        (Set_in v@44@00 g0@2@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-29|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            ($FVF.loc_r ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-35|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00)))
    (or (Set_in v@44@00 g0@2@00) (not (Set_in v@44@00 g0@2@00))))))
(assert (or (Set_in u@43@00 g0@2@00) (not (Set_in u@43@00 g0@2@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | u@43@00 in g0@2@00 && v@44@00 in g0@2@00 && exists_path[Bool]($$((sm@48@00(s@$, g0@2@00, g1@3@00), sm@53@00(s@$, g0@2@00, g1@3@00)), g0@2@00), u@43@00, v@44@00) | live]
; [else-branch: 11 | !(u@43@00 in g0@2@00 && v@44@00 in g0@2@00 && exists_path[Bool]($$((sm@48@00(s@$, g0@2@00, g1@3@00), sm@53@00(s@$, g0@2@00, g1@3@00)), g0@2@00), u@43@00, v@44@00)) | live]
(push) ; 4
; [then-branch: 11 | u@43@00 in g0@2@00 && v@44@00 in g0@2@00 && exists_path[Bool]($$((sm@48@00(s@$, g0@2@00, g1@3@00), sm@53@00(s@$, g0@2@00, g1@3@00)), g0@2@00), u@43@00, v@44@00)]
(assert (and
  (Set_in u@43@00 g0@2@00)
  (and
    (Set_in v@44@00 g0@2@00)
    (exists_path<Bool> ($$ ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00))))
; [eval] exists_path($$((g0 union g1)), u, v)
; [eval] $$((g0 union g1))
; [eval] (g0 union g1)
(push) ; 5
(declare-const n@54@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@54@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 6
(declare-fun inv@55@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@56@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@57@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef31|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@54@00 $Ref) (n2@54@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@54@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) n1@54@00) n1@54@00))
      (and
        (Set_in n2@54@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) n2@54@00) n2@54@00))
      (= n1@54@00 n2@54@00))
    (= n1@54@00 n2@54@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@54@00 $Ref)) (!
  (=>
    (Set_in n@54@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00) n@54@00)
      (img@56@00 s@$ g0@2@00 g1@3@00 n@54@00)))
  :pattern ((Set_in n@54@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00))
  :pattern ((img@56@00 s@$ g0@2@00 g1@3@00 n@54@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@55@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_l ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-44|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@56@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-46|))))
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
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-47|))))
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
      (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@56@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@56@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
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
          (img@34@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@56@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@34@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@56@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@25@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-49|))))
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
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@56@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-50|))))
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
      (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@56@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@56@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@56@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@34@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@56@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@55@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@25@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@58@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef35|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef34|)))
(declare-const n@59@00 $Ref)
(set-option :timeout 0)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@59@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 6
(declare-fun inv@60@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@61@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@62@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef38|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@59@00 $Ref) (n2@59@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@59@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) n1@59@00) n1@59@00))
      (and
        (Set_in n2@59@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) n2@59@00) n2@59@00))
      (= n1@59@00 n2@59@00))
    (= n1@59@00 n2@59@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@59@00 $Ref)) (!
  (=>
    (Set_in n@59@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00) n@59@00)
      (img@61@00 s@$ g0@2@00 g1@3@00 n@59@00)))
  :pattern ((Set_in n@59@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00))
  :pattern ((img@61@00 s@$ g0@2@00 g1@3@00 n@59@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@60@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_r ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-53|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@61@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-55|))))
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
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-56|))))
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
      (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@61@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@61@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-57|))))
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
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@61@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@30@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@61@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@38@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-58|))))
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
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@61@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-59|))))
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
      (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@61@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@61@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@61@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@30@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@61@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@60@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@38@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@63@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef42|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef41|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef31|)))
(assert (forall ((n@54@00 $Ref)) (!
  (=>
    (Set_in n@54@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00) n@54@00)
      (img@56@00 s@$ g0@2@00 g1@3@00 n@54@00)))
  :pattern ((Set_in n@54@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00))
  :pattern ((img@56@00 s@$ g0@2@00 g1@3@00 n@54@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@55@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef38|)))
(assert (forall ((n@59@00 $Ref)) (!
  (=>
    (Set_in n@59@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00) n@59@00)
      (img@61@00 s@$ g0@2@00 g1@3@00 n@59@00)))
  :pattern ((Set_in n@59@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00))
  :pattern ((img@61@00 s@$ g0@2@00 g1@3@00 n@59@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@60@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef41|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_l ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-44|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_r ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-53|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(u@43@00 in g0@2@00 && v@44@00 in g0@2@00 && exists_path[Bool]($$((sm@48@00(s@$, g0@2@00, g1@3@00), sm@53@00(s@$, g0@2@00, g1@3@00)), g0@2@00), u@43@00, v@44@00))]
(assert (not
  (and
    (Set_in u@43@00 g0@2@00)
    (and
      (Set_in v@44@00 g0@2@00)
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef31|)))
(assert (forall ((n@54@00 $Ref)) (!
  (=>
    (Set_in n@54@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00) n@54@00)
      (img@56@00 s@$ g0@2@00 g1@3@00 n@54@00)))
  :pattern ((Set_in n@54@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00))
  :pattern ((img@56@00 s@$ g0@2@00 g1@3@00 n@54@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@55@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef38|)))
(assert (forall ((n@59@00 $Ref)) (!
  (=>
    (Set_in n@59@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00) n@59@00)
      (img@61@00 s@$ g0@2@00 g1@3@00 n@59@00)))
  :pattern ((Set_in n@59@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00))
  :pattern ((img@61@00 s@$ g0@2@00 g1@3@00 n@59@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@60@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef41|)))
(assert (=>
  (and
    (Set_in u@43@00 g0@2@00)
    (and
      (Set_in v@44@00 g0@2@00)
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)))
  (and
    (Set_in u@43@00 g0@2@00)
    (Set_in v@44@00 g0@2@00)
    (exists_path<Bool> ($$ ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-44|))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-53|))
    ($$%precondition ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@43@00 g0@2@00)
      (and
        (Set_in v@44@00 g0@2@00)
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00))))
  (and
    (Set_in u@43@00 g0@2@00)
    (and
      (Set_in v@44@00 g0@2@00)
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@45@00 $Ref)) (!
  (=>
    (Set_in n@45@00 g0@2@00)
    (and
      (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
      (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
  :pattern ((Set_in n@45@00 g0@2@00))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@47@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (forall ((n@49@00 $Ref)) (!
  (=>
    (Set_in n@49@00 g0@2@00)
    (and
      (= (inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00) n@49@00)
      (img@51@00 s@$ g0@2@00 g1@3@00 n@49@00)))
  :pattern ((Set_in n@49@00 g0@2@00))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :pattern ((img@51@00 s@$ g0@2@00 g1@3@00 n@49@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@50@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@51@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef31|)))
(assert (forall ((n@54@00 $Ref)) (!
  (=>
    (Set_in n@54@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00) n@54@00)
      (img@56@00 s@$ g0@2@00 g1@3@00 n@54@00)))
  :pattern ((Set_in n@54@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00))
  :pattern ((img@56@00 s@$ g0@2@00 g1@3@00 n@54@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@55@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@56@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef38|)))
(assert (forall ((n@59@00 $Ref)) (!
  (=>
    (Set_in n@59@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00) n@59@00)
      (img@61@00 s@$ g0@2@00 g1@3@00 n@59@00)))
  :pattern ((Set_in n@59@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00))
  :pattern ((img@61@00 s@$ g0@2@00 g1@3@00 n@59@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@60@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@61@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef41|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@43@00 $Ref) (v@44@00 $Ref)) (!
  (and
    (=>
      (Set_in u@43@00 g0@2@00)
      (and
        (Set_in u@43@00 g0@2@00)
        (=>
          (Set_in v@44@00 g0@2@00)
          (and
            (Set_in v@44@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-29|))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_r ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-35|))
            ($$%precondition ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00)))
        (or (Set_in v@44@00 g0@2@00) (not (Set_in v@44@00 g0@2@00)))))
    (or (Set_in u@43@00 g0@2@00) (not (Set_in u@43@00 g0@2@00)))
    (=>
      (and
        (Set_in u@43@00 g0@2@00)
        (and
          (Set_in v@44@00 g0@2@00)
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)))
      (and
        (Set_in u@43@00 g0@2@00)
        (Set_in v@44@00 g0@2@00)
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_l ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-44|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-53|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@43@00 g0@2@00)
          (and
            (Set_in v@44@00 g0@2@00)
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00))))
      (and
        (Set_in u@43@00 g0@2@00)
        (and
          (Set_in v@44@00 g0@2@00)
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)))))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@214@13@214@182-aux|)))
(assert (forall ((u@43@00 $Ref) (v@44@00 $Ref)) (!
  (and
    (=>
      (Set_in u@43@00 g0@2@00)
      (and
        (Set_in u@43@00 g0@2@00)
        (=>
          (Set_in v@44@00 g0@2@00)
          (and
            (Set_in v@44@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_l ($FVF.lookup_l (sm@35@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-29|))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_r ($FVF.lookup_r (sm@52@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-35|))
            ($$%precondition ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00)))
        (or (Set_in v@44@00 g0@2@00) (not (Set_in v@44@00 g0@2@00)))))
    (or (Set_in u@43@00 g0@2@00) (not (Set_in u@43@00 g0@2@00)))
    (=>
      (and
        (Set_in u@43@00 g0@2@00)
        (and
          (Set_in v@44@00 g0@2@00)
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)))
      (and
        (Set_in u@43@00 g0@2@00)
        (Set_in v@44@00 g0@2@00)
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_l ($FVF.lookup_l (sm@57@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-44|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@62@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-53|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@43@00 g0@2@00)
          (and
            (Set_in v@44@00 g0@2@00)
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00))))
      (and
        (Set_in u@43@00 g0@2@00)
        (and
          (Set_in v@44@00 g0@2@00)
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)))))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u@43@00 v@44@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@214@13@214@182-aux|)))
(assert (forall ((u@43@00 $Ref) (v@44@00 $Ref)) (!
  (=>
    (and
      (Set_in u@43@00 g0@2@00)
      (and
        (Set_in v@44@00 g0@2@00)
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00)))
    (exists_path<Bool> ($$ ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u@43@00 v@44@00))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@43@00 v@44@00))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u@43@00 v@44@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@214@13@214@182|)))
(assert (=
  ($Snap.second ($Snap.second $t@42@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@42@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@42@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@42@00))) $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g1), u, v) } { exists_path($$((g1 union g0)), u, v) } (u in g1) && ((v in g1) && exists_path($$(g1), u, v)) ==> exists_path($$((g1 union g0)), u, v))
(declare-const u@64@00 $Ref)
(declare-const v@65@00 $Ref)
(push) ; 2
; [eval] (u in g1) && ((v in g1) && exists_path($$(g1), u, v)) ==> exists_path($$((g1 union g0)), u, v)
; [eval] (u in g1) && ((v in g1) && exists_path($$(g1), u, v))
; [eval] (u in g1)
(push) ; 3
; [then-branch: 12 | !(u@64@00 in g1@3@00) | live]
; [else-branch: 12 | u@64@00 in g1@3@00 | live]
(push) ; 4
; [then-branch: 12 | !(u@64@00 in g1@3@00)]
(assert (not (Set_in u@64@00 g1@3@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | u@64@00 in g1@3@00]
(assert (Set_in u@64@00 g1@3@00))
; [eval] (v in g1)
(push) ; 5
; [then-branch: 13 | !(v@65@00 in g1@3@00) | live]
; [else-branch: 13 | v@65@00 in g1@3@00 | live]
(push) ; 6
; [then-branch: 13 | !(v@65@00 in g1@3@00)]
(assert (not (Set_in v@65@00 g1@3@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | v@65@00 in g1@3@00]
(assert (Set_in v@65@00 g1@3@00))
; [eval] exists_path($$(g1), u, v)
; [eval] $$(g1)
(push) ; 7
(declare-const n@66@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@66@00 g1@3@00))
(pop) ; 8
(declare-fun inv@67@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@68@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@69@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef45|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@66@00 $Ref) (n2@66@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@66@00 g1@3@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) n1@66@00) n1@66@00))
      (and
        (Set_in n2@66@00 g1@3@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) n2@66@00) n2@66@00))
      (= n1@66@00 n2@66@00))
    (= n1@66@00 n2@66@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@66@00 $Ref)) (!
  (=>
    (Set_in n@66@00 g1@3@00)
    (and
      (= (inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00) n@66@00)
      (img@68@00 s@$ g0@2@00 g1@3@00 n@66@00)))
  :pattern ((Set_in n@66@00 g1@3@00))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :pattern ((img@68@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@67@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_l ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-62|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@68@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-64|))))
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
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-65|))))
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
      (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@68@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@68@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-66|))))
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
          (img@34@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@68@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@34@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                (img@68@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@25@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-67|))))
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
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@68@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-68|))))
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
      (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@68@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@68@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@68@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@34@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                  (img@68@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@67@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@25@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@70@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef49|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef48|)))
(declare-const n@71@00 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@71@00 g1@3@00))
(pop) ; 8
(declare-fun inv@72@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@73@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@74@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef52|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@71@00 $Ref) (n2@71@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@71@00 g1@3@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) n1@71@00) n1@71@00))
      (and
        (Set_in n2@71@00 g1@3@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) n2@71@00) n2@71@00))
      (= n1@71@00 n2@71@00))
    (= n1@71@00 n2@71@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@71@00 $Ref)) (!
  (=>
    (Set_in n@71@00 g1@3@00)
    (and
      (= (inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00) n@71@00)
      (img@73@00 s@$ g0@2@00 g1@3@00 n@71@00)))
  :pattern ((Set_in n@71@00 g1@3@00))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :pattern ((img@73@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@72@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_r ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-71|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@73@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@72@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-73|))))
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
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@72@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-74|))))
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
      (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@73@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@72@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@73@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@72@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@75@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef56|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef55|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef45|)))
(assert (forall ((n@66@00 $Ref)) (!
  (=>
    (Set_in n@66@00 g1@3@00)
    (and
      (= (inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00) n@66@00)
      (img@68@00 s@$ g0@2@00 g1@3@00 n@66@00)))
  :pattern ((Set_in n@66@00 g1@3@00))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :pattern ((img@68@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@67@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (forall ((n@71@00 $Ref)) (!
  (=>
    (Set_in n@71@00 g1@3@00)
    (and
      (= (inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00) n@71@00)
      (img@73@00 s@$ g0@2@00 g1@3@00 n@71@00)))
  :pattern ((Set_in n@71@00 g1@3@00))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :pattern ((img@73@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@72@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      ($FVF.loc_l ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-62|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      ($FVF.loc_r ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-71|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef45|)))
(assert (forall ((n@66@00 $Ref)) (!
  (=>
    (Set_in n@66@00 g1@3@00)
    (and
      (= (inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00) n@66@00)
      (img@68@00 s@$ g0@2@00 g1@3@00 n@66@00)))
  :pattern ((Set_in n@66@00 g1@3@00))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :pattern ((img@68@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@67@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (forall ((n@71@00 $Ref)) (!
  (=>
    (Set_in n@71@00 g1@3@00)
    (and
      (= (inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00) n@71@00)
      (img@73@00 s@$ g0@2@00 g1@3@00 n@71@00)))
  :pattern ((Set_in n@71@00 g1@3@00))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :pattern ((img@73@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@72@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (=>
  (Set_in v@65@00 g1@3@00)
  (and
    (Set_in v@65@00 g1@3@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-62|))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-71|))
    ($$%precondition ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00))))
(assert (or (Set_in v@65@00 g1@3@00) (not (Set_in v@65@00 g1@3@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef45|)))
(assert (forall ((n@66@00 $Ref)) (!
  (=>
    (Set_in n@66@00 g1@3@00)
    (and
      (= (inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00) n@66@00)
      (img@68@00 s@$ g0@2@00 g1@3@00 n@66@00)))
  :pattern ((Set_in n@66@00 g1@3@00))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :pattern ((img@68@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@67@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (forall ((n@71@00 $Ref)) (!
  (=>
    (Set_in n@71@00 g1@3@00)
    (and
      (= (inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00) n@71@00)
      (img@73@00 s@$ g0@2@00 g1@3@00 n@71@00)))
  :pattern ((Set_in n@71@00 g1@3@00))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :pattern ((img@73@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@72@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (=>
  (Set_in u@64@00 g1@3@00)
  (and
    (Set_in u@64@00 g1@3@00)
    (=>
      (Set_in v@65@00 g1@3@00)
      (and
        (Set_in v@65@00 g1@3@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            ($FVF.loc_l ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-62|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            ($FVF.loc_r ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-71|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00)))
    (or (Set_in v@65@00 g1@3@00) (not (Set_in v@65@00 g1@3@00))))))
(assert (or (Set_in u@64@00 g1@3@00) (not (Set_in u@64@00 g1@3@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | u@64@00 in g1@3@00 && v@65@00 in g1@3@00 && exists_path[Bool]($$((sm@70@00(s@$, g0@2@00, g1@3@00), sm@75@00(s@$, g0@2@00, g1@3@00)), g1@3@00), u@64@00, v@65@00) | live]
; [else-branch: 14 | !(u@64@00 in g1@3@00 && v@65@00 in g1@3@00 && exists_path[Bool]($$((sm@70@00(s@$, g0@2@00, g1@3@00), sm@75@00(s@$, g0@2@00, g1@3@00)), g1@3@00), u@64@00, v@65@00)) | live]
(push) ; 4
; [then-branch: 14 | u@64@00 in g1@3@00 && v@65@00 in g1@3@00 && exists_path[Bool]($$((sm@70@00(s@$, g0@2@00, g1@3@00), sm@75@00(s@$, g0@2@00, g1@3@00)), g1@3@00), u@64@00, v@65@00)]
(assert (and
  (Set_in u@64@00 g1@3@00)
  (and
    (Set_in v@65@00 g1@3@00)
    (exists_path<Bool> ($$ ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00))))
; [eval] exists_path($$((g1 union g0)), u, v)
; [eval] $$((g1 union g0))
; [eval] (g1 union g0)
(push) ; 5
(declare-const n@76@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@76@00 (Set_union g1@3@00 g0@2@00)))
(pop) ; 6
(declare-fun inv@77@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@78@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@79@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef59|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@76@00 $Ref) (n2@76@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@76@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) n1@76@00) n1@76@00))
      (and
        (Set_in n2@76@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) n2@76@00) n2@76@00))
      (= n1@76@00 n2@76@00))
    (= n1@76@00 n2@76@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@76@00 $Ref)) (!
  (=>
    (Set_in n@76@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00) n@76@00)
      (img@78@00 s@$ g0@2@00 g1@3@00 n@76@00)))
  :pattern ((Set_in n@76@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00))
  :pattern ((img@78@00 s@$ g0@2@00 g1@3@00 n@76@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@78@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@77@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
    ($FVF.loc_l ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-77|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@78@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-79|))))
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
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-80|))))
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
      (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@78@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@78@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-81|))))
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
          (img@34@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@78@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@34@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                (img@78@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@25@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-82|))))
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
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@78@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-83|))))
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
      (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@78@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@78@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@78@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@34@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                  (img@78@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@77@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@25@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@80@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef63|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef62|)))
(declare-const n@81@00 $Ref)
(set-option :timeout 0)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@81@00 (Set_union g1@3@00 g0@2@00)))
(pop) ; 6
(declare-fun inv@82@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@83@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@84@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef66|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@81@00 $Ref) (n2@81@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@81@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) n1@81@00) n1@81@00))
      (and
        (Set_in n2@81@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) n2@81@00) n2@81@00))
      (= n1@81@00 n2@81@00))
    (= n1@81@00 n2@81@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@81@00 $Ref)) (!
  (=>
    (Set_in n@81@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00) n@81@00)
      (img@83@00 s@$ g0@2@00 g1@3@00 n@81@00)))
  :pattern ((Set_in n@81@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00))
  :pattern ((img@83@00 s@$ g0@2@00 g1@3@00 n@81@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@83@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@82@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
    ($FVF.loc_r ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-86|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@83@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-88|))))
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
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-89|))))
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
      (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@83@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@83@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-90|))))
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
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@83@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@30@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                (img@83@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@38@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-91|))))
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
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@83@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-92|))))
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
      (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@83@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@83@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@83@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@30@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                  (img@83@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@82@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@38@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@85@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef70|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef69|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef59|)))
(assert (forall ((n@76@00 $Ref)) (!
  (=>
    (Set_in n@76@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00) n@76@00)
      (img@78@00 s@$ g0@2@00 g1@3@00 n@76@00)))
  :pattern ((Set_in n@76@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00))
  :pattern ((img@78@00 s@$ g0@2@00 g1@3@00 n@76@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@78@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@77@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef66|)))
(assert (forall ((n@81@00 $Ref)) (!
  (=>
    (Set_in n@81@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00) n@81@00)
      (img@83@00 s@$ g0@2@00 g1@3@00 n@81@00)))
  :pattern ((Set_in n@81@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00))
  :pattern ((img@83@00 s@$ g0@2@00 g1@3@00 n@81@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@83@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@82@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef69|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      ($FVF.loc_l ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-77|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      ($FVF.loc_r ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-86|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 14 | !(u@64@00 in g1@3@00 && v@65@00 in g1@3@00 && exists_path[Bool]($$((sm@70@00(s@$, g0@2@00, g1@3@00), sm@75@00(s@$, g0@2@00, g1@3@00)), g1@3@00), u@64@00, v@65@00))]
(assert (not
  (and
    (Set_in u@64@00 g1@3@00)
    (and
      (Set_in v@65@00 g1@3@00)
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef59|)))
(assert (forall ((n@76@00 $Ref)) (!
  (=>
    (Set_in n@76@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00) n@76@00)
      (img@78@00 s@$ g0@2@00 g1@3@00 n@76@00)))
  :pattern ((Set_in n@76@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00))
  :pattern ((img@78@00 s@$ g0@2@00 g1@3@00 n@76@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@78@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@77@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef66|)))
(assert (forall ((n@81@00 $Ref)) (!
  (=>
    (Set_in n@81@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00) n@81@00)
      (img@83@00 s@$ g0@2@00 g1@3@00 n@81@00)))
  :pattern ((Set_in n@81@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00))
  :pattern ((img@83@00 s@$ g0@2@00 g1@3@00 n@81@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@83@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@82@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef69|)))
(assert (=>
  (and
    (Set_in u@64@00 g1@3@00)
    (and
      (Set_in v@65@00 g1@3@00)
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)))
  (and
    (Set_in u@64@00 g1@3@00)
    (Set_in v@65@00 g1@3@00)
    (exists_path<Bool> ($$ ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-77|))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-86|))
    ($$%precondition ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@64@00 g1@3@00)
      (and
        (Set_in v@65@00 g1@3@00)
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00))))
  (and
    (Set_in u@64@00 g1@3@00)
    (and
      (Set_in v@65@00 g1@3@00)
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef45|)))
(assert (forall ((n@66@00 $Ref)) (!
  (=>
    (Set_in n@66@00 g1@3@00)
    (and
      (= (inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00) n@66@00)
      (img@68@00 s@$ g0@2@00 g1@3@00 n@66@00)))
  :pattern ((Set_in n@66@00 g1@3@00))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :pattern ((img@68@00 s@$ g0@2@00 g1@3@00 n@66@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@67@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@68@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (forall ((n@71@00 $Ref)) (!
  (=>
    (Set_in n@71@00 g1@3@00)
    (and
      (= (inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00) n@71@00)
      (img@73@00 s@$ g0@2@00 g1@3@00 n@71@00)))
  :pattern ((Set_in n@71@00 g1@3@00))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :pattern ((img@73@00 s@$ g0@2@00 g1@3@00 n@71@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@72@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@73@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef59|)))
(assert (forall ((n@76@00 $Ref)) (!
  (=>
    (Set_in n@76@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00) n@76@00)
      (img@78@00 s@$ g0@2@00 g1@3@00 n@76@00)))
  :pattern ((Set_in n@76@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00))
  :pattern ((img@78@00 s@$ g0@2@00 g1@3@00 n@76@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@78@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@77@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@78@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef66|)))
(assert (forall ((n@81@00 $Ref)) (!
  (=>
    (Set_in n@81@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00) n@81@00)
      (img@83@00 s@$ g0@2@00 g1@3@00 n@81@00)))
  :pattern ((Set_in n@81@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00))
  :pattern ((img@83@00 s@$ g0@2@00 g1@3@00 n@81@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@83@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@82@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@83@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef69|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@64@00 $Ref) (v@65@00 $Ref)) (!
  (and
    (=>
      (Set_in u@64@00 g1@3@00)
      (and
        (Set_in u@64@00 g1@3@00)
        (=>
          (Set_in v@65@00 g1@3@00)
          (and
            (Set_in v@65@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_l ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-62|))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_r ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-71|))
            ($$%precondition ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00)))
        (or (Set_in v@65@00 g1@3@00) (not (Set_in v@65@00 g1@3@00)))))
    (or (Set_in u@64@00 g1@3@00) (not (Set_in u@64@00 g1@3@00)))
    (=>
      (and
        (Set_in u@64@00 g1@3@00)
        (and
          (Set_in v@65@00 g1@3@00)
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)))
      (and
        (Set_in u@64@00 g1@3@00)
        (Set_in v@65@00 g1@3@00)
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_l ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-77|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-86|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@64@00 g1@3@00)
          (and
            (Set_in v@65@00 g1@3@00)
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00))))
      (and
        (Set_in u@64@00 g1@3@00)
        (and
          (Set_in v@65@00 g1@3@00)
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)))))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@215@13@215@182-aux|)))
(assert (forall ((u@64@00 $Ref) (v@65@00 $Ref)) (!
  (and
    (=>
      (Set_in u@64@00 g1@3@00)
      (and
        (Set_in u@64@00 g1@3@00)
        (=>
          (Set_in v@65@00 g1@3@00)
          (and
            (Set_in v@65@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_l ($FVF.lookup_l (sm@69@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-62|))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_r ($FVF.lookup_r (sm@74@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-71|))
            ($$%precondition ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00)))
        (or (Set_in v@65@00 g1@3@00) (not (Set_in v@65@00 g1@3@00)))))
    (or (Set_in u@64@00 g1@3@00) (not (Set_in u@64@00 g1@3@00)))
    (=>
      (and
        (Set_in u@64@00 g1@3@00)
        (and
          (Set_in v@65@00 g1@3@00)
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)))
      (and
        (Set_in u@64@00 g1@3@00)
        (Set_in v@65@00 g1@3@00)
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_l ($FVF.lookup_l (sm@79@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-77|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@84@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-86|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@64@00 g1@3@00)
          (and
            (Set_in v@65@00 g1@3@00)
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00))))
      (and
        (Set_in u@64@00 g1@3@00)
        (and
          (Set_in v@65@00 g1@3@00)
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)))))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u@64@00 v@65@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@215@13@215@182-aux|)))
(assert (forall ((u@64@00 $Ref) (v@65@00 $Ref)) (!
  (=>
    (and
      (Set_in u@64@00 g1@3@00)
      (and
        (Set_in v@65@00 g1@3@00)
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00)))
    (exists_path<Bool> ($$ ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u@64@00 v@65@00))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@64@00 v@65@00))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u@64@00 v@65@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@215@13@215@182|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@42@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@42@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@42@00))))
  $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g0), u, v) } { exists_path($$((g0 union g1)), u, v) } (u in g0) && ((v in g0) && !exists_path($$(g0), u, v)) ==> !exists_path($$((g0 union g1)), u, v))
(declare-const u@86@00 $Ref)
(declare-const v@87@00 $Ref)
(push) ; 2
; [eval] (u in g0) && ((v in g0) && !exists_path($$(g0), u, v)) ==> !exists_path($$((g0 union g1)), u, v)
; [eval] (u in g0) && ((v in g0) && !exists_path($$(g0), u, v))
; [eval] (u in g0)
(push) ; 3
; [then-branch: 15 | !(u@86@00 in g0@2@00) | live]
; [else-branch: 15 | u@86@00 in g0@2@00 | live]
(push) ; 4
; [then-branch: 15 | !(u@86@00 in g0@2@00)]
(assert (not (Set_in u@86@00 g0@2@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | u@86@00 in g0@2@00]
(assert (Set_in u@86@00 g0@2@00))
; [eval] (v in g0)
(push) ; 5
; [then-branch: 16 | !(v@87@00 in g0@2@00) | live]
; [else-branch: 16 | v@87@00 in g0@2@00 | live]
(push) ; 6
; [then-branch: 16 | !(v@87@00 in g0@2@00)]
(assert (not (Set_in v@87@00 g0@2@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | v@87@00 in g0@2@00]
(assert (Set_in v@87@00 g0@2@00))
; [eval] !exists_path($$(g0), u, v)
; [eval] exists_path($$(g0), u, v)
; [eval] $$(g0)
(push) ; 7
(declare-const n@88@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@88@00 g0@2@00))
(pop) ; 8
(declare-fun inv@89@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@90@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@91@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef73|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@88@00 $Ref) (n2@88@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@88@00 g0@2@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) n1@88@00) n1@88@00))
      (and
        (Set_in n2@88@00 g0@2@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) n2@88@00) n2@88@00))
      (= n1@88@00 n2@88@00))
    (= n1@88@00 n2@88@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@88@00 $Ref)) (!
  (=>
    (Set_in n@88@00 g0@2@00)
    (and
      (= (inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00) n@88@00)
      (img@90@00 s@$ g0@2@00 g1@3@00 n@88@00)))
  :pattern ((Set_in n@88@00 g0@2@00))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :pattern ((img@90@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@89@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_l ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-95|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@90@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@89@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-97|))))
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
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@89@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-98|))))
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
      (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@90@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@89@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@90@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@89@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@92@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef77|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef76|)))
(declare-const n@93@00 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@93@00 g0@2@00))
(pop) ; 8
(declare-fun inv@94@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@95@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@96@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef80|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@93@00 $Ref) (n2@93@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@93@00 g0@2@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) n1@93@00) n1@93@00))
      (and
        (Set_in n2@93@00 g0@2@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) n2@93@00) n2@93@00))
      (= n1@93@00 n2@93@00))
    (= n1@93@00 n2@93@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@93@00 $Ref)) (!
  (=>
    (Set_in n@93@00 g0@2@00)
    (and
      (= (inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00) n@93@00)
      (img@95@00 s@$ g0@2@00 g1@3@00 n@93@00)))
  :pattern ((Set_in n@93@00 g0@2@00))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :pattern ((img@95@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@95@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@94@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
    ($FVF.loc_r ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-101|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@95@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-103|))))
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
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-104|))))
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
      (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@95@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@95@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-105|))))
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
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
          (img@95@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@30@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                (img@95@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@38@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-106|))))
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
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
              (img@95@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-107|))))
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
      (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      (img@95@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
              (img@95@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@95@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@30@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                  (img@95@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@94@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@38@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-108|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@97@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef84|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef83|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (forall ((n@88@00 $Ref)) (!
  (=>
    (Set_in n@88@00 g0@2@00)
    (and
      (= (inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00) n@88@00)
      (img@90@00 s@$ g0@2@00 g1@3@00 n@88@00)))
  :pattern ((Set_in n@88@00 g0@2@00))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :pattern ((img@90@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@89@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (forall ((n@93@00 $Ref)) (!
  (=>
    (Set_in n@93@00 g0@2@00)
    (and
      (= (inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00) n@93@00)
      (img@95@00 s@$ g0@2@00 g1@3@00 n@93@00)))
  :pattern ((Set_in n@93@00 g0@2@00))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :pattern ((img@95@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@95@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@94@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef83|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      ($FVF.loc_l ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-95|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
      ($FVF.loc_r ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-101|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (forall ((n@88@00 $Ref)) (!
  (=>
    (Set_in n@88@00 g0@2@00)
    (and
      (= (inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00) n@88@00)
      (img@90@00 s@$ g0@2@00 g1@3@00 n@88@00)))
  :pattern ((Set_in n@88@00 g0@2@00))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :pattern ((img@90@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@89@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (forall ((n@93@00 $Ref)) (!
  (=>
    (Set_in n@93@00 g0@2@00)
    (and
      (= (inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00) n@93@00)
      (img@95@00 s@$ g0@2@00 g1@3@00 n@93@00)))
  :pattern ((Set_in n@93@00 g0@2@00))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :pattern ((img@95@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@95@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@94@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef83|)))
(assert (=>
  (Set_in v@87@00 g0@2@00)
  (and
    (Set_in v@87@00 g0@2@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-95|))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-101|))
    ($$%precondition ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00))))
(assert (or (Set_in v@87@00 g0@2@00) (not (Set_in v@87@00 g0@2@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (forall ((n@88@00 $Ref)) (!
  (=>
    (Set_in n@88@00 g0@2@00)
    (and
      (= (inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00) n@88@00)
      (img@90@00 s@$ g0@2@00 g1@3@00 n@88@00)))
  :pattern ((Set_in n@88@00 g0@2@00))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :pattern ((img@90@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@89@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (forall ((n@93@00 $Ref)) (!
  (=>
    (Set_in n@93@00 g0@2@00)
    (and
      (= (inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00) n@93@00)
      (img@95@00 s@$ g0@2@00 g1@3@00 n@93@00)))
  :pattern ((Set_in n@93@00 g0@2@00))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :pattern ((img@95@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@95@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@94@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef83|)))
(assert (=>
  (Set_in u@86@00 g0@2@00)
  (and
    (Set_in u@86@00 g0@2@00)
    (=>
      (Set_in v@87@00 g0@2@00)
      (and
        (Set_in v@87@00 g0@2@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            ($FVF.loc_l ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-95|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            ($FVF.loc_r ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-101|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00)))
    (or (Set_in v@87@00 g0@2@00) (not (Set_in v@87@00 g0@2@00))))))
(assert (or (Set_in u@86@00 g0@2@00) (not (Set_in u@86@00 g0@2@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | u@86@00 in g0@2@00 && v@87@00 in g0@2@00 && !(exists_path[Bool]($$((sm@92@00(s@$, g0@2@00, g1@3@00), sm@97@00(s@$, g0@2@00, g1@3@00)), g0@2@00), u@86@00, v@87@00)) | live]
; [else-branch: 17 | !(u@86@00 in g0@2@00 && v@87@00 in g0@2@00 && !(exists_path[Bool]($$((sm@92@00(s@$, g0@2@00, g1@3@00), sm@97@00(s@$, g0@2@00, g1@3@00)), g0@2@00), u@86@00, v@87@00))) | live]
(push) ; 4
; [then-branch: 17 | u@86@00 in g0@2@00 && v@87@00 in g0@2@00 && !(exists_path[Bool]($$((sm@92@00(s@$, g0@2@00, g1@3@00), sm@97@00(s@$, g0@2@00, g1@3@00)), g0@2@00), u@86@00, v@87@00))]
(assert (and
  (Set_in u@86@00 g0@2@00)
  (and
    (Set_in v@87@00 g0@2@00)
    (not
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00)))))
; [eval] !exists_path($$((g0 union g1)), u, v)
; [eval] exists_path($$((g0 union g1)), u, v)
; [eval] $$((g0 union g1))
; [eval] (g0 union g1)
(push) ; 5
(declare-const n@98@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@98@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 6
(declare-fun inv@99@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@100@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@101@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef87|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@98@00 $Ref) (n2@98@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@98@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) n1@98@00) n1@98@00))
      (and
        (Set_in n2@98@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) n2@98@00) n2@98@00))
      (= n1@98@00 n2@98@00))
    (= n1@98@00 n2@98@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@98@00 $Ref)) (!
  (=>
    (Set_in n@98@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00) n@98@00)
      (img@100@00 s@$ g0@2@00 g1@3@00 n@98@00)))
  :pattern ((Set_in n@98@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00))
  :pattern ((img@100@00 s@$ g0@2@00 g1@3@00 n@98@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@100@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@99@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_l ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-110|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@100@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@100@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@100@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-114|))))
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
          (img@34@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@100@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@34@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@100@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@25@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@100@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-116|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@100@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@100@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@100@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@34@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@100@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@99@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@25@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@102@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef91|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef90|)))
(declare-const n@103@00 $Ref)
(set-option :timeout 0)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@103@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 6
(declare-fun inv@104@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@105@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@106@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef94|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@103@00 $Ref) (n2@103@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@103@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) n1@103@00) n1@103@00))
      (and
        (Set_in n2@103@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) n2@103@00) n2@103@00))
      (= n1@103@00 n2@103@00))
    (= n1@103@00 n2@103@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@103@00 $Ref)) (!
  (=>
    (Set_in n@103@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00) n@103@00)
      (img@105@00 s@$ g0@2@00 g1@3@00 n@103@00)))
  :pattern ((Set_in n@103@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00))
  :pattern ((img@105@00 s@$ g0@2@00 g1@3@00 n@103@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@104@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_r ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-119|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@105@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-121|))))
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
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-122|))))
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
      (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@105@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@105@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-123|))))
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
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@105@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@30@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@105@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@38@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-124|))))
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
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@105@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-125|))))
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
      (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@105@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@105@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@105@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@30@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@105@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@104@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@38@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-126|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@107@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef98|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef96|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef97|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef87|)))
(assert (forall ((n@98@00 $Ref)) (!
  (=>
    (Set_in n@98@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00) n@98@00)
      (img@100@00 s@$ g0@2@00 g1@3@00 n@98@00)))
  :pattern ((Set_in n@98@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00))
  :pattern ((img@100@00 s@$ g0@2@00 g1@3@00 n@98@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@100@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@99@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (forall ((n@103@00 $Ref)) (!
  (=>
    (Set_in n@103@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00) n@103@00)
      (img@105@00 s@$ g0@2@00 g1@3@00 n@103@00)))
  :pattern ((Set_in n@103@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00))
  :pattern ((img@105@00 s@$ g0@2@00 g1@3@00 n@103@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@104@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef96|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef97|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_l ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-110|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_r ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-119|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 17 | !(u@86@00 in g0@2@00 && v@87@00 in g0@2@00 && !(exists_path[Bool]($$((sm@92@00(s@$, g0@2@00, g1@3@00), sm@97@00(s@$, g0@2@00, g1@3@00)), g0@2@00), u@86@00, v@87@00)))]
(assert (not
  (and
    (Set_in u@86@00 g0@2@00)
    (and
      (Set_in v@87@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef87|)))
(assert (forall ((n@98@00 $Ref)) (!
  (=>
    (Set_in n@98@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00) n@98@00)
      (img@100@00 s@$ g0@2@00 g1@3@00 n@98@00)))
  :pattern ((Set_in n@98@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00))
  :pattern ((img@100@00 s@$ g0@2@00 g1@3@00 n@98@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@100@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@99@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (forall ((n@103@00 $Ref)) (!
  (=>
    (Set_in n@103@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00) n@103@00)
      (img@105@00 s@$ g0@2@00 g1@3@00 n@103@00)))
  :pattern ((Set_in n@103@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00))
  :pattern ((img@105@00 s@$ g0@2@00 g1@3@00 n@103@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@104@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef96|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef97|)))
(assert (=>
  (and
    (Set_in u@86@00 g0@2@00)
    (and
      (Set_in v@87@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))))
  (and
    (Set_in u@86@00 g0@2@00)
    (Set_in v@87@00 g0@2@00)
    (not
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-110|))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-119|))
    ($$%precondition ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@86@00 g0@2@00)
      (and
        (Set_in v@87@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00)))))
  (and
    (Set_in u@86@00 g0@2@00)
    (and
      (Set_in v@87@00 g0@2@00)
      (not
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (forall ((n@88@00 $Ref)) (!
  (=>
    (Set_in n@88@00 g0@2@00)
    (and
      (= (inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00) n@88@00)
      (img@90@00 s@$ g0@2@00 g1@3@00 n@88@00)))
  :pattern ((Set_in n@88@00 g0@2@00))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :pattern ((img@90@00 s@$ g0@2@00 g1@3@00 n@88@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@89@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@90@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (forall ((n@93@00 $Ref)) (!
  (=>
    (Set_in n@93@00 g0@2@00)
    (and
      (= (inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00) n@93@00)
      (img@95@00 s@$ g0@2@00 g1@3@00 n@93@00)))
  :pattern ((Set_in n@93@00 g0@2@00))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :pattern ((img@95@00 s@$ g0@2@00 g1@3@00 n@93@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@95@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (= (inv@94@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
        (img@95@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef87|)))
(assert (forall ((n@98@00 $Ref)) (!
  (=>
    (Set_in n@98@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00) n@98@00)
      (img@100@00 s@$ g0@2@00 g1@3@00 n@98@00)))
  :pattern ((Set_in n@98@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00))
  :pattern ((img@100@00 s@$ g0@2@00 g1@3@00 n@98@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@100@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@99@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@100@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (forall ((n@103@00 $Ref)) (!
  (=>
    (Set_in n@103@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00) n@103@00)
      (img@105@00 s@$ g0@2@00 g1@3@00 n@103@00)))
  :pattern ((Set_in n@103@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00))
  :pattern ((img@105@00 s@$ g0@2@00 g1@3@00 n@103@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@104@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@105@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef96|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef97|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@86@00 $Ref) (v@87@00 $Ref)) (!
  (and
    (=>
      (Set_in u@86@00 g0@2@00)
      (and
        (Set_in u@86@00 g0@2@00)
        (=>
          (Set_in v@87@00 g0@2@00)
          (and
            (Set_in v@87@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_l ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-95|))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_r ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-101|))
            ($$%precondition ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00)))
        (or (Set_in v@87@00 g0@2@00) (not (Set_in v@87@00 g0@2@00)))))
    (or (Set_in u@86@00 g0@2@00) (not (Set_in u@86@00 g0@2@00)))
    (=>
      (and
        (Set_in u@86@00 g0@2@00)
        (and
          (Set_in v@87@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))))
      (and
        (Set_in u@86@00 g0@2@00)
        (Set_in v@87@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_l ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-110|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-119|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@86@00 g0@2@00)
          (and
            (Set_in v@87@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00)))))
      (and
        (Set_in u@86@00 g0@2@00)
        (and
          (Set_in v@87@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))))))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@217@13@217@184-aux|)))
(assert (forall ((u@86@00 $Ref) (v@87@00 $Ref)) (!
  (and
    (=>
      (Set_in u@86@00 g0@2@00)
      (and
        (Set_in u@86@00 g0@2@00)
        (=>
          (Set_in v@87@00 g0@2@00)
          (and
            (Set_in v@87@00 g0@2@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_l ($FVF.lookup_l (sm@91@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-95|))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
                ($FVF.loc_r ($FVF.lookup_r (sm@96@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-101|))
            ($$%precondition ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00)))
        (or (Set_in v@87@00 g0@2@00) (not (Set_in v@87@00 g0@2@00)))))
    (or (Set_in u@86@00 g0@2@00) (not (Set_in u@86@00 g0@2@00)))
    (=>
      (and
        (Set_in u@86@00 g0@2@00)
        (and
          (Set_in v@87@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))))
      (and
        (Set_in u@86@00 g0@2@00)
        (Set_in v@87@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_l ($FVF.lookup_l (sm@101@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-110|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@106@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-119|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00))))
    (or
      (not
        (and
          (Set_in u@86@00 g0@2@00)
          (and
            (Set_in v@87@00 g0@2@00)
            (not
              (exists_path<Bool> ($$ ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00)))))
      (and
        (Set_in u@86@00 g0@2@00)
        (and
          (Set_in v@87@00 g0@2@00)
          (not
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))))))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u@86@00 v@87@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@217@13@217@184-aux|)))
(assert (forall ((u@86@00 $Ref) (v@87@00 $Ref)) (!
  (=>
    (and
      (Set_in u@86@00 g0@2@00)
      (and
        (Set_in v@87@00 g0@2@00)
        (not
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))))
    (not
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u@86@00 v@87@00)))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u@86@00 v@87@00))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u@86@00 v@87@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@217@13@217@184|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@00))))
  $Snap.unit))
; [eval] (forall u: Ref, v: Ref :: { exists_path($$(g1), u, v) } { exists_path($$((g0 union g1)), u, v) } (u in g1) && ((v in g1) && !exists_path($$(g1), u, v)) ==> !exists_path($$((g1 union g0)), u, v))
(declare-const u@108@00 $Ref)
(declare-const v@109@00 $Ref)
(push) ; 2
; [eval] (u in g1) && ((v in g1) && !exists_path($$(g1), u, v)) ==> !exists_path($$((g1 union g0)), u, v)
; [eval] (u in g1) && ((v in g1) && !exists_path($$(g1), u, v))
; [eval] (u in g1)
(push) ; 3
; [then-branch: 18 | !(u@108@00 in g1@3@00) | live]
; [else-branch: 18 | u@108@00 in g1@3@00 | live]
(push) ; 4
; [then-branch: 18 | !(u@108@00 in g1@3@00)]
(assert (not (Set_in u@108@00 g1@3@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | u@108@00 in g1@3@00]
(assert (Set_in u@108@00 g1@3@00))
; [eval] (v in g1)
(push) ; 5
; [then-branch: 19 | !(v@109@00 in g1@3@00) | live]
; [else-branch: 19 | v@109@00 in g1@3@00 | live]
(push) ; 6
; [then-branch: 19 | !(v@109@00 in g1@3@00)]
(assert (not (Set_in v@109@00 g1@3@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 19 | v@109@00 in g1@3@00]
(assert (Set_in v@109@00 g1@3@00))
; [eval] !exists_path($$(g1), u, v)
; [eval] exists_path($$(g1), u, v)
; [eval] $$(g1)
(push) ; 7
(declare-const n@110@00 $Ref)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@110@00 g1@3@00))
(pop) ; 8
(declare-fun inv@111@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@112@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@113@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef100|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef101|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@110@00 $Ref) (n2@110@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@110@00 g1@3@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) n1@110@00) n1@110@00))
      (and
        (Set_in n2@110@00 g1@3@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) n2@110@00) n2@110@00))
      (= n1@110@00 n2@110@00))
    (= n1@110@00 n2@110@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@110@00 $Ref)) (!
  (=>
    (Set_in n@110@00 g1@3@00)
    (and
      (= (inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00) n@110@00)
      (img@112@00 s@$ g0@2@00 g1@3@00 n@110@00)))
  :pattern ((Set_in n@110@00 g1@3@00))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :pattern ((img@112@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@112@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@111@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_l ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-128|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@112@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-130|))))
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
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-131|))))
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
      (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@112@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@112@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-132|))))
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
          (img@34@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@112@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@34@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                (img@112@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@25@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-133|))))
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
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@112@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-134|))))
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
      (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@112@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
              (img@112@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@112@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@34@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                  (img@112@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@111@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@25@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-135|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@114@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef105|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef104|)))
(declare-const n@115@00 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (n in refs)
(assert (Set_in n@115@00 g1@3@00))
(pop) ; 8
(declare-fun inv@116@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@117@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@118@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef108|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((n1@115@00 $Ref) (n2@115@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@115@00 g1@3@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) n1@115@00) n1@115@00))
      (and
        (Set_in n2@115@00 g1@3@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) n2@115@00) n2@115@00))
      (= n1@115@00 n2@115@00))
    (= n1@115@00 n2@115@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@115@00 $Ref)) (!
  (=>
    (Set_in n@115@00 g1@3@00)
    (and
      (= (inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00) n@115@00)
      (img@117@00 s@$ g0@2@00 g1@3@00 n@115@00)))
  :pattern ((Set_in n@115@00 g1@3@00))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :pattern ((img@117@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@117@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@116@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
    ($FVF.loc_r ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-137|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
          (img@117@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@116@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-139|))))
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
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@116@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-140|))))
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
      (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      (img@117@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@116@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@117@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@116@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-141|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@119@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef112|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef109|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef111|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00))
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef100|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef101|)))
(assert (forall ((n@110@00 $Ref)) (!
  (=>
    (Set_in n@110@00 g1@3@00)
    (and
      (= (inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00) n@110@00)
      (img@112@00 s@$ g0@2@00 g1@3@00 n@110@00)))
  :pattern ((Set_in n@110@00 g1@3@00))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :pattern ((img@112@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@112@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@111@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef108|)))
(assert (forall ((n@115@00 $Ref)) (!
  (=>
    (Set_in n@115@00 g1@3@00)
    (and
      (= (inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00) n@115@00)
      (img@117@00 s@$ g0@2@00 g1@3@00 n@115@00)))
  :pattern ((Set_in n@115@00 g1@3@00))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :pattern ((img@117@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@117@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@116@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef109|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef111|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      ($FVF.loc_l ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-128|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
      ($FVF.loc_r ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-137|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef100|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef101|)))
(assert (forall ((n@110@00 $Ref)) (!
  (=>
    (Set_in n@110@00 g1@3@00)
    (and
      (= (inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00) n@110@00)
      (img@112@00 s@$ g0@2@00 g1@3@00 n@110@00)))
  :pattern ((Set_in n@110@00 g1@3@00))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :pattern ((img@112@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@112@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@111@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef108|)))
(assert (forall ((n@115@00 $Ref)) (!
  (=>
    (Set_in n@115@00 g1@3@00)
    (and
      (= (inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00) n@115@00)
      (img@117@00 s@$ g0@2@00 g1@3@00 n@115@00)))
  :pattern ((Set_in n@115@00 g1@3@00))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :pattern ((img@117@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@117@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@116@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef109|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef111|)))
(assert (=>
  (Set_in v@109@00 g1@3@00)
  (and
    (Set_in v@109@00 g1@3@00)
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        ($FVF.loc_l ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-128|))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        ($FVF.loc_r ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-137|))
    ($$%precondition ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00))))
(assert (or (Set_in v@109@00 g1@3@00) (not (Set_in v@109@00 g1@3@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef100|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef101|)))
(assert (forall ((n@110@00 $Ref)) (!
  (=>
    (Set_in n@110@00 g1@3@00)
    (and
      (= (inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00) n@110@00)
      (img@112@00 s@$ g0@2@00 g1@3@00 n@110@00)))
  :pattern ((Set_in n@110@00 g1@3@00))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :pattern ((img@112@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@112@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@111@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef108|)))
(assert (forall ((n@115@00 $Ref)) (!
  (=>
    (Set_in n@115@00 g1@3@00)
    (and
      (= (inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00) n@115@00)
      (img@117@00 s@$ g0@2@00 g1@3@00 n@115@00)))
  :pattern ((Set_in n@115@00 g1@3@00))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :pattern ((img@117@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@117@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@116@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef109|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef111|)))
(assert (=>
  (Set_in u@108@00 g1@3@00)
  (and
    (Set_in u@108@00 g1@3@00)
    (=>
      (Set_in v@109@00 g1@3@00)
      (and
        (Set_in v@109@00 g1@3@00)
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            ($FVF.loc_l ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-128|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            ($FVF.loc_r ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-137|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00)))
    (or (Set_in v@109@00 g1@3@00) (not (Set_in v@109@00 g1@3@00))))))
(assert (or (Set_in u@108@00 g1@3@00) (not (Set_in u@108@00 g1@3@00))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 20 | u@108@00 in g1@3@00 && v@109@00 in g1@3@00 && !(exists_path[Bool]($$((sm@114@00(s@$, g0@2@00, g1@3@00), sm@119@00(s@$, g0@2@00, g1@3@00)), g1@3@00), u@108@00, v@109@00)) | live]
; [else-branch: 20 | !(u@108@00 in g1@3@00 && v@109@00 in g1@3@00 && !(exists_path[Bool]($$((sm@114@00(s@$, g0@2@00, g1@3@00), sm@119@00(s@$, g0@2@00, g1@3@00)), g1@3@00), u@108@00, v@109@00))) | live]
(push) ; 4
; [then-branch: 20 | u@108@00 in g1@3@00 && v@109@00 in g1@3@00 && !(exists_path[Bool]($$((sm@114@00(s@$, g0@2@00, g1@3@00), sm@119@00(s@$, g0@2@00, g1@3@00)), g1@3@00), u@108@00, v@109@00))]
(assert (and
  (Set_in u@108@00 g1@3@00)
  (and
    (Set_in v@109@00 g1@3@00)
    (not
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00)))))
; [eval] !exists_path($$((g1 union g0)), u, v)
; [eval] exists_path($$((g1 union g0)), u, v)
; [eval] $$((g1 union g0))
; [eval] (g1 union g0)
(push) ; 5
(declare-const n@120@00 $Ref)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@120@00 (Set_union g1@3@00 g0@2@00)))
(pop) ; 6
(declare-fun inv@121@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@122@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@123@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef114|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef115|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@120@00 $Ref) (n2@120@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@120@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) n1@120@00) n1@120@00))
      (and
        (Set_in n2@120@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) n2@120@00) n2@120@00))
      (= n1@120@00 n2@120@00))
    (= n1@120@00 n2@120@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@120@00 $Ref)) (!
  (=>
    (Set_in n@120@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00) n@120@00)
      (img@122@00 s@$ g0@2@00 g1@3@00 n@120@00)))
  :pattern ((Set_in n@120@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00))
  :pattern ((img@122@00 s@$ g0@2@00 g1@3@00 n@120@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@122@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@121@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
    ($FVF.loc_l ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-143|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@122@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 6
; 0,04s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-146|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@122@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@122@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-147|))))
(check-sat)
; unknown
(pop) ; 6
; 0,04s
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
          (img@34@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@122@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@34@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                (img@122@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@25@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-148|))))
(check-sat)
; unknown
(pop) ; 6
; 0,04s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@122@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-149|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@122@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@122@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@122@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@34@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                  (img@122@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@121@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@25@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@124@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef119|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef118|)))
(declare-const n@125@00 $Ref)
(set-option :timeout 0)
(push) ; 6
; [eval] (n in refs)
(assert (Set_in n@125@00 (Set_union g1@3@00 g0@2@00)))
(pop) ; 6
(declare-fun inv@126@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@127@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@128@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef120|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef122|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@125@00 $Ref) (n2@125@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@125@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) n1@125@00) n1@125@00))
      (and
        (Set_in n2@125@00 (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) n2@125@00) n2@125@00))
      (= n1@125@00 n2@125@00))
    (= n1@125@00 n2@125@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@125@00 $Ref)) (!
  (=>
    (Set_in n@125@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00) n@125@00)
      (img@127@00 s@$ g0@2@00 g1@3@00 n@125@00)))
  :pattern ((Set_in n@125@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00))
  :pattern ((img@127@00 s@$ g0@2@00 g1@3@00 n@125@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@127@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@126@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
    ($FVF.loc_r ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-152|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@127@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 6
; 0,04s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@127@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@127@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 6
; 0,04s
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
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
          (img@127@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@30@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                (img@127@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@38@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-157|))))
(check-sat)
; unknown
(pop) ; 6
; 0,04s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@127@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-158|))))
(check-sat)
; unknown
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      (img@127@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
              (img@127@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@127@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@30@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
                  (img@127@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@126@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@38@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-159|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@129@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef126|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef125|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef114|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef115|)))
(assert (forall ((n@120@00 $Ref)) (!
  (=>
    (Set_in n@120@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00) n@120@00)
      (img@122@00 s@$ g0@2@00 g1@3@00 n@120@00)))
  :pattern ((Set_in n@120@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00))
  :pattern ((img@122@00 s@$ g0@2@00 g1@3@00 n@120@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@122@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@121@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef119|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef120|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef122|)))
(assert (forall ((n@125@00 $Ref)) (!
  (=>
    (Set_in n@125@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00) n@125@00)
      (img@127@00 s@$ g0@2@00 g1@3@00 n@125@00)))
  :pattern ((Set_in n@125@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00))
  :pattern ((img@127@00 s@$ g0@2@00 g1@3@00 n@125@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@127@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@126@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef126|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      ($FVF.loc_l ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-143|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
      ($FVF.loc_r ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-152|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 20 | !(u@108@00 in g1@3@00 && v@109@00 in g1@3@00 && !(exists_path[Bool]($$((sm@114@00(s@$, g0@2@00, g1@3@00), sm@119@00(s@$, g0@2@00, g1@3@00)), g1@3@00), u@108@00, v@109@00)))]
(assert (not
  (and
    (Set_in u@108@00 g1@3@00)
    (and
      (Set_in v@109@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef114|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef115|)))
(assert (forall ((n@120@00 $Ref)) (!
  (=>
    (Set_in n@120@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00) n@120@00)
      (img@122@00 s@$ g0@2@00 g1@3@00 n@120@00)))
  :pattern ((Set_in n@120@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00))
  :pattern ((img@122@00 s@$ g0@2@00 g1@3@00 n@120@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@122@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@121@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef119|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef120|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef122|)))
(assert (forall ((n@125@00 $Ref)) (!
  (=>
    (Set_in n@125@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00) n@125@00)
      (img@127@00 s@$ g0@2@00 g1@3@00 n@125@00)))
  :pattern ((Set_in n@125@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00))
  :pattern ((img@127@00 s@$ g0@2@00 g1@3@00 n@125@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@127@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@126@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef126|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (=>
  (and
    (Set_in u@108@00 g1@3@00)
    (and
      (Set_in v@109@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))))
  (and
    (Set_in u@108@00 g1@3@00)
    (Set_in v@109@00 g1@3@00)
    (not
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-143|))
    (forall ((r $Ref)) (!
      (=>
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r) r))
      :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
      :qid |quant-u-152|))
    ($$%precondition ($Snap.combine
      ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
      ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in u@108@00 g1@3@00)
      (and
        (Set_in v@109@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00)))))
  (and
    (Set_in u@108@00 g1@3@00)
    (and
      (Set_in v@109@00 g1@3@00)
      (not
        (exists_path<Bool> ($$ ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))))))
; [eval] exists_path($$((g0 union g1)), u, v)
; [eval] $$((g0 union g1))
; [eval] (g0 union g1)
(push) ; 3
(declare-const n@130@00 $Ref)
(push) ; 4
; [eval] (n in refs)
(assert (Set_in n@130@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 4
(declare-fun inv@131@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@132@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@133@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef129|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n1@130@00 $Ref) (n2@130@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@130@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) n1@130@00) n1@130@00))
      (and
        (Set_in n2@130@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_l ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) n2@130@00) n2@130@00))
      (= n1@130@00 n2@130@00))
    (= n1@130@00 n2@130@00))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@130@00 $Ref)) (!
  (=>
    (Set_in n@130@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@131@00 s@$ g0@2@00 g1@3@00 n@130@00) n@130@00)
      (img@132@00 s@$ g0@2@00 g1@3@00 n@130@00)))
  :pattern ((Set_in n@130@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 n@130@00))
  :pattern ((img@132@00 s@$ g0@2@00 g1@3@00 n@130@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@132@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@131@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_l ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-161|)))
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
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@132@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-163|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-164|))))
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
      (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@132@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@132@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
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
          (img@34@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@132@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@34@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@132@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@25@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-166|))))
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
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@132@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-167|))))
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
      (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@132@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@132@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@25@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@132@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@34@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@132@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@131@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@25@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-168|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@134@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<l>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef133|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef132|)))
(declare-const n@135@00 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (n in refs)
(assert (Set_in n@135@00 (Set_union g0@2@00 g1@3@00)))
(pop) ; 4
(declare-fun inv@136@00 ($Snap Set<$Ref> Set<$Ref> $Ref) $Ref)
(declare-fun img@137@00 ($Snap Set<$Ref> Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-fun sm@138@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef136|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n1@135@00 $Ref) (n2@135@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@135@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) n1@135@00) n1@135@00))
      (and
        (Set_in n2@135@00 (Set_union g0@2@00 g1@3@00))
        ($FVF.loc_r ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) n2@135@00) n2@135@00))
      (= n1@135@00 n2@135@00))
    (= n1@135@00 n2@135@00))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@135@00 $Ref)) (!
  (=>
    (Set_in n@135@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@136@00 s@$ g0@2@00 g1@3@00 n@135@00) n@135@00)
      (img@137@00 s@$ g0@2@00 g1@3@00 n@135@00)))
  :pattern ((Set_in n@135@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 n@135@00))
  :pattern ((img@137@00 s@$ g0@2@00 g1@3@00 n@135@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@137@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@136@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_r ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-170|)))
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
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@137@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@38@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
            $Perm.Write
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-172|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
          $Perm.Write
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-173|))))
(check-sat)
; unknown
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
      (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@137@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@137@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@38@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
              $Perm.Write
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-174|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
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
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
          (img@137@00 s@$ g0@2@00 g1@3@00 r)
          (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
        ($Perm.min
          (ite
            (and
              (img@30@00 s@$ g0@2@00 g1@3@00 r)
              (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
            $Perm.Write
            $Perm.No)
          (-
            (/ (to_real 1) (to_real 2))
            (ite
              (and
                (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                (img@137@00 s@$ g0@2@00 g1@3@00 r)
                (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
              ($Perm.min
                (ite
                  (and
                    (img@38@00 s@$ g0@2@00 g1@3@00 r)
                    (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                  $Perm.Write
                  $Perm.No)
                (/ (to_real 1) (to_real 2)))
              $Perm.No)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-175|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r)
        (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
      ($Perm.min
        (ite
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
          $Perm.Write
          $Perm.No)
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@137@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-176|))))
(check-sat)
; unknown
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
      (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      (img@137@00 s@$ g0@2@00 g1@3@00 r)
      (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
    (=
      (-
        (-
          (/ (to_real 1) (to_real 2))
          (ite
            (and
              (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
              (img@137@00 s@$ g0@2@00 g1@3@00 r)
              (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
            ($Perm.min
              (ite
                (and
                  (img@38@00 s@$ g0@2@00 g1@3@00 r)
                  (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                $Perm.Write
                $Perm.No)
              (/ (to_real 1) (to_real 2)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@137@00 s@$ g0@2@00 g1@3@00 r)
            (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
          ($Perm.min
            (ite
              (and
                (img@30@00 s@$ g0@2@00 g1@3@00 r)
                (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
              $Perm.Write
              $Perm.No)
            (-
              (/ (to_real 1) (to_real 2))
              (ite
                (and
                  (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
                  (img@137@00 s@$ g0@2@00 g1@3@00 r)
                  (= r (inv@136@00 s@$ g0@2@00 g1@3@00 r)))
                ($Perm.min
                  (ite
                    (and
                      (img@38@00 s@$ g0@2@00 g1@3@00 r)
                      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
                    $Perm.Write
                    $Perm.No)
                  (/ (to_real 1) (to_real 2)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-177|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@139@00 ($Snap Set<$Ref> Set<$Ref>) $FVF<r>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef140|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef139|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@134@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@139@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (forall ((n@130@00 $Ref)) (!
  (=>
    (Set_in n@130@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@131@00 s@$ g0@2@00 g1@3@00 n@130@00) n@130@00)
      (img@132@00 s@$ g0@2@00 g1@3@00 n@130@00)))
  :pattern ((Set_in n@130@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 n@130@00))
  :pattern ((img@132@00 s@$ g0@2@00 g1@3@00 n@130@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@132@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@131@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef136|)))
(assert (forall ((n@135@00 $Ref)) (!
  (=>
    (Set_in n@135@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@136@00 s@$ g0@2@00 g1@3@00 n@135@00) n@135@00)
      (img@137@00 s@$ g0@2@00 g1@3@00 n@135@00)))
  :pattern ((Set_in n@135@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 n@135@00))
  :pattern ((img@137@00 s@$ g0@2@00 g1@3@00 n@135@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@137@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@136@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef139|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_l ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-161|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
      ($FVF.loc_r ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r) r))
    :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 r))
    :qid |quant-u-170|))
  ($$%precondition ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@134@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@139@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00))))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (forall ((n@130@00 $Ref)) (!
  (=>
    (Set_in n@130@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@131@00 s@$ g0@2@00 g1@3@00 n@130@00) n@130@00)
      (img@132@00 s@$ g0@2@00 g1@3@00 n@130@00)))
  :pattern ((Set_in n@130@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 n@130@00))
  :pattern ((img@132@00 s@$ g0@2@00 g1@3@00 n@130@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@132@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@131@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef136|)))
(assert (forall ((n@135@00 $Ref)) (!
  (=>
    (Set_in n@135@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@136@00 s@$ g0@2@00 g1@3@00 n@135@00) n@135@00)
      (img@137@00 s@$ g0@2@00 g1@3@00 n@135@00)))
  :pattern ((Set_in n@135@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 n@135@00))
  :pattern ((img@137@00 s@$ g0@2@00 g1@3@00 n@135@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@137@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@136@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef139|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_l ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-161|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_r ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-170|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@134@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@139@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef100|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef101|)))
(assert (forall ((n@110@00 $Ref)) (!
  (=>
    (Set_in n@110@00 g1@3@00)
    (and
      (= (inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00) n@110@00)
      (img@112@00 s@$ g0@2@00 g1@3@00 n@110@00)))
  :pattern ((Set_in n@110@00 g1@3@00))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :pattern ((img@112@00 s@$ g0@2@00 g1@3@00 n@110@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@112@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@111@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@112@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef108|)))
(assert (forall ((n@115@00 $Ref)) (!
  (=>
    (Set_in n@115@00 g1@3@00)
    (and
      (= (inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00) n@115@00)
      (img@117@00 s@$ g0@2@00 g1@3@00 n@115@00)))
  :pattern ((Set_in n@115@00 g1@3@00))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :pattern ((img@117@00 s@$ g0@2@00 g1@3@00 n@115@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@117@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (= (inv@116@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef109|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
        (img@117@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef111|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef114|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef115|)))
(assert (forall ((n@120@00 $Ref)) (!
  (=>
    (Set_in n@120@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00) n@120@00)
      (img@122@00 s@$ g0@2@00 g1@3@00 n@120@00)))
  :pattern ((Set_in n@120@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00))
  :pattern ((img@122@00 s@$ g0@2@00 g1@3@00 n@120@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@122@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@121@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef119|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@122@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef120|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef122|)))
(assert (forall ((n@125@00 $Ref)) (!
  (=>
    (Set_in n@125@00 (Set_union g1@3@00 g0@2@00))
    (and
      (= (inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00) n@125@00)
      (img@127@00 s@$ g0@2@00 g1@3@00 n@125@00)))
  :pattern ((Set_in n@125@00 (Set_union g1@3@00 g0@2@00)))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00))
  :pattern ((img@127@00 s@$ g0@2@00 g1@3@00 n@125@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@127@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
    (= (inv@126@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef126|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
        (img@127@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (forall ((n@130@00 $Ref)) (!
  (=>
    (Set_in n@130@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@131@00 s@$ g0@2@00 g1@3@00 n@130@00) n@130@00)
      (img@132@00 s@$ g0@2@00 g1@3@00 n@130@00)))
  :pattern ((Set_in n@130@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 n@130@00))
  :pattern ((img@132@00 s@$ g0@2@00 g1@3@00 n@130@00))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@132@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@131@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_l (sm@134@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@25@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@132@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@34@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
    ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
  :pattern (($FVF.lookup_l (sm@134@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
    (=
      ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
    (=
      ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef136|)))
(assert (forall ((n@135@00 $Ref)) (!
  (=>
    (Set_in n@135@00 (Set_union g0@2@00 g1@3@00))
    (and
      (= (inv@136@00 s@$ g0@2@00 g1@3@00 n@135@00) n@135@00)
      (img@137@00 s@$ g0@2@00 g1@3@00 n@135@00)))
  :pattern ((Set_in n@135@00 (Set_union g0@2@00 g1@3@00)))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 n@135@00))
  :pattern ((img@137@00 s@$ g0@2@00 g1@3@00 n@135@00))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@137@00 s@$ g0@2@00 g1@3@00 r)
      (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
    (= (inv@136@00 s@$ g0@2@00 g1@3@00 r) r))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00)))
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r)))
    (=>
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00)))))
  :pattern ((Set_in r ($FVF.domain_r (sm@139@00 s@$ g0@2@00 g1@3@00))))
  :qid |qp.fvfDomDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@38@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
    (=
      ($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
        (img@137@00 s@$ g0@2@00 g1@3@00 r))
      (and
        (img@30@00 s@$ g0@2@00 g1@3@00 r)
        (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
    (=
      ($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r)
      ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
    ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_r (sm@139@00 s@$ g0@2@00 g1@3@00) r))
  :qid |qp.fvfResTrgDef139|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@131@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_l ($FVF.lookup_l (sm@133@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@131@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-161|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@136@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
    ($FVF.loc_r ($FVF.lookup_r (sm@138@00 s@$ g0@2@00 g1@3@00) r) r))
  :pattern ((inv@136@00 s@$ g0@2@00 g1@3@00 r))
  :qid |quant-u-170|)))
(assert ($$%precondition ($Snap.combine
  ($SortWrappers.$FVF<l>To$Snap (sm@134@00 s@$ g0@2@00 g1@3@00))
  ($SortWrappers.$FVF<r>To$Snap (sm@139@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@108@00 $Ref) (v@109@00 $Ref)) (!
  (and
    (=>
      (Set_in u@108@00 g1@3@00)
      (and
        (Set_in u@108@00 g1@3@00)
        (=>
          (Set_in v@109@00 g1@3@00)
          (and
            (Set_in v@109@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_l ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-128|))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_r ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-137|))
            ($$%precondition ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00)))
        (or (Set_in v@109@00 g1@3@00) (not (Set_in v@109@00 g1@3@00)))))
    (or (Set_in u@108@00 g1@3@00) (not (Set_in u@108@00 g1@3@00)))
    (=>
      (and
        (Set_in u@108@00 g1@3@00)
        (and
          (Set_in v@109@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))))
      (and
        (Set_in u@108@00 g1@3@00)
        (Set_in v@109@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_l ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-143|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-152|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@108@00 g1@3@00)
          (and
            (Set_in v@109@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00)))))
      (and
        (Set_in u@108@00 g1@3@00)
        (and
          (Set_in v@109@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))))))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@218@13@218@184-aux|)))
(assert (forall ((u@108@00 $Ref) (v@109@00 $Ref)) (!
  (and
    (=>
      (Set_in u@108@00 g1@3@00)
      (and
        (Set_in u@108@00 g1@3@00)
        (=>
          (Set_in v@109@00 g1@3@00)
          (and
            (Set_in v@109@00 g1@3@00)
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_l ($FVF.lookup_l (sm@113@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-128|))
            (forall ((r $Ref)) (!
              (=>
                (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
                ($FVF.loc_r ($FVF.lookup_r (sm@118@00 s@$ g0@2@00 g1@3@00) r) r))
              :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
              :qid |quant-u-137|))
            ($$%precondition ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00)))
        (or (Set_in v@109@00 g1@3@00) (not (Set_in v@109@00 g1@3@00)))))
    (or (Set_in u@108@00 g1@3@00) (not (Set_in u@108@00 g1@3@00)))
    (=>
      (and
        (Set_in u@108@00 g1@3@00)
        (and
          (Set_in v@109@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))))
      (and
        (Set_in u@108@00 g1@3@00)
        (Set_in v@109@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_l ($FVF.lookup_l (sm@123@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-143|))
        (forall ((r $Ref)) (!
          (=>
            (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            ($FVF.loc_r ($FVF.lookup_r (sm@128@00 s@$ g0@2@00 g1@3@00) r) r))
          :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
          :qid |quant-u-152|))
        ($$%precondition ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00))))
    (or
      (not
        (and
          (Set_in u@108@00 g1@3@00)
          (and
            (Set_in v@109@00 g1@3@00)
            (not
              (exists_path<Bool> ($$ ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00)))))
      (and
        (Set_in u@108@00 g1@3@00)
        (and
          (Set_in v@109@00 g1@3@00)
          (not
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))))))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@134@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@139@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u@108@00 v@109@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@218@13@218@184-aux|)))
(assert (forall ((u@108@00 $Ref) (v@109@00 $Ref)) (!
  (=>
    (and
      (Set_in u@108@00 g1@3@00)
      (and
        (Set_in v@109@00 g1@3@00)
        (not
          (exists_path<Bool> ($$ ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))))
    (not
      (exists_path<Bool> ($$ ($Snap.combine
        ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
        ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00))) (Set_union g1@3@00 g0@2@00)) u@108@00 v@109@00)))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u@108@00 v@109@00))
  :pattern ((exists_path<Bool> ($$ ($Snap.combine
    ($SortWrappers.$FVF<l>To$Snap (sm@134@00 s@$ g0@2@00 g1@3@00))
    ($SortWrappers.$FVF<r>To$Snap (sm@139@00 s@$ g0@2@00 g1@3@00))) (Set_union g0@2@00 g1@3@00)) u@108@00 v@109@00))
  :qid |prog./silicon/silver/src/test/resources/graphs/static/tests/binary/create_edge1.vpr@218@13@218@184|)))
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
    (forall ((n@22@00 $Ref)) (!
      (=>
        (Set_in n@22@00 g0@2@00)
        (and
          (= (inv@24@00 s@$ g0@2@00 g1@3@00 n@22@00) n@22@00)
          (img@25@00 s@$ g0@2@00 g1@3@00 n@22@00)))
      :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) n@22@00) n@22@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@24@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@24@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@27@00 $Ref)) (!
      (=>
        (Set_in n@27@00 g0@2@00)
        (and
          (= (inv@29@00 s@$ g0@2@00 g1@3@00 n@27@00) n@27@00)
          (img@30@00 s@$ g0@2@00 g1@3@00 n@27@00)))
      :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) n@27@00) n@27@00))
      :qid |quant-u-18|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@29@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@29@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@32@00 $Ref)) (!
      (=>
        (Set_in n@32@00 g1@3@00)
        (and
          (= (inv@33@00 s@$ g0@2@00 g1@3@00 n@32@00) n@32@00)
          (img@34@00 s@$ g0@2@00 g1@3@00 n@32@00)))
      :pattern (($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) n@32@00) n@32@00))
      :qid |quant-u-21|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@34@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@33@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@33@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@36@00 $Ref)) (!
      (=>
        (Set_in n@36@00 g1@3@00)
        (and
          (= (inv@37@00 s@$ g0@2@00 g1@3@00 n@36@00) n@36@00)
          (img@38@00 s@$ g0@2@00 g1@3@00 n@36@00)))
      :pattern (($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) n@36@00) n@36@00))
      :qid |quant-u-25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@38@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@37@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@37@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@45@00 $Ref)) (!
      (=>
        (Set_in n@45@00 g0@2@00)
        (and
          (= (inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00) n@45@00)
          (img@47@00 s@$ g0@2@00 g1@3@00 n@45@00)))
      :pattern ((Set_in n@45@00 g0@2@00))
      :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 n@45@00))
      :pattern ((img@47@00 s@$ g0@2@00 g1@3@00 n@45@00))
      :qid |l-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@47@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@46@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@46@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@49@00 $Ref)) (!
      (=>
        (Set_in n@49@00 g0@2@00)
        (and
          (= (inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00) n@49@00)
          (img@51@00 s@$ g0@2@00 g1@3@00 n@49@00)))
      :pattern ((Set_in n@49@00 g0@2@00))
      :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 n@49@00))
      :pattern ((img@51@00 s@$ g0@2@00 g1@3@00 n@49@00))
      :qid |r-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@51@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@50@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@50@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@54@00 $Ref)) (!
      (=>
        (Set_in n@54@00 (Set_union g0@2@00 g1@3@00))
        (and
          (= (inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00) n@54@00)
          (img@56@00 s@$ g0@2@00 g1@3@00 n@54@00)))
      :pattern ((Set_in n@54@00 (Set_union g0@2@00 g1@3@00)))
      :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 n@54@00))
      :pattern ((img@56@00 s@$ g0@2@00 g1@3@00 n@54@00))
      :qid |l-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@56@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
        (= (inv@55@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@55@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@59@00 $Ref)) (!
      (=>
        (Set_in n@59@00 (Set_union g0@2@00 g1@3@00))
        (and
          (= (inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00) n@59@00)
          (img@61@00 s@$ g0@2@00 g1@3@00 n@59@00)))
      :pattern ((Set_in n@59@00 (Set_union g0@2@00 g1@3@00)))
      :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 n@59@00))
      :pattern ((img@61@00 s@$ g0@2@00 g1@3@00 n@59@00))
      :qid |r-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@61@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
        (= (inv@60@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@60@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@66@00 $Ref)) (!
      (=>
        (Set_in n@66@00 g1@3@00)
        (and
          (= (inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00) n@66@00)
          (img@68@00 s@$ g0@2@00 g1@3@00 n@66@00)))
      :pattern ((Set_in n@66@00 g1@3@00))
      :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 n@66@00))
      :pattern ((img@68@00 s@$ g0@2@00 g1@3@00 n@66@00))
      :qid |l-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@68@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@67@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@67@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@71@00 $Ref)) (!
      (=>
        (Set_in n@71@00 g1@3@00)
        (and
          (= (inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00) n@71@00)
          (img@73@00 s@$ g0@2@00 g1@3@00 n@71@00)))
      :pattern ((Set_in n@71@00 g1@3@00))
      :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 n@71@00))
      :pattern ((img@73@00 s@$ g0@2@00 g1@3@00 n@71@00))
      :qid |r-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@73@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@72@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@72@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@76@00 $Ref)) (!
      (=>
        (Set_in n@76@00 (Set_union g1@3@00 g0@2@00))
        (and
          (= (inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00) n@76@00)
          (img@78@00 s@$ g0@2@00 g1@3@00 n@76@00)))
      :pattern ((Set_in n@76@00 (Set_union g1@3@00 g0@2@00)))
      :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 n@76@00))
      :pattern ((img@78@00 s@$ g0@2@00 g1@3@00 n@76@00))
      :qid |l-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@78@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
        (= (inv@77@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@77@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@81@00 $Ref)) (!
      (=>
        (Set_in n@81@00 (Set_union g1@3@00 g0@2@00))
        (and
          (= (inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00) n@81@00)
          (img@83@00 s@$ g0@2@00 g1@3@00 n@81@00)))
      :pattern ((Set_in n@81@00 (Set_union g1@3@00 g0@2@00)))
      :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 n@81@00))
      :pattern ((img@83@00 s@$ g0@2@00 g1@3@00 n@81@00))
      :qid |r-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@83@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
        (= (inv@82@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@82@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@88@00 $Ref)) (!
      (=>
        (Set_in n@88@00 g0@2@00)
        (and
          (= (inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00) n@88@00)
          (img@90@00 s@$ g0@2@00 g1@3@00 n@88@00)))
      :pattern ((Set_in n@88@00 g0@2@00))
      :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 n@88@00))
      :pattern ((img@90@00 s@$ g0@2@00 g1@3@00 n@88@00))
      :qid |l-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@90@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@89@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@89@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@93@00 $Ref)) (!
      (=>
        (Set_in n@93@00 g0@2@00)
        (and
          (= (inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00) n@93@00)
          (img@95@00 s@$ g0@2@00 g1@3@00 n@93@00)))
      :pattern ((Set_in n@93@00 g0@2@00))
      :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 n@93@00))
      :pattern ((img@95@00 s@$ g0@2@00 g1@3@00 n@93@00))
      :qid |r-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@95@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (= (inv@94@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@94@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@98@00 $Ref)) (!
      (=>
        (Set_in n@98@00 (Set_union g0@2@00 g1@3@00))
        (and
          (= (inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00) n@98@00)
          (img@100@00 s@$ g0@2@00 g1@3@00 n@98@00)))
      :pattern ((Set_in n@98@00 (Set_union g0@2@00 g1@3@00)))
      :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 n@98@00))
      :pattern ((img@100@00 s@$ g0@2@00 g1@3@00 n@98@00))
      :qid |l-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@100@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
        (= (inv@99@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@99@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@103@00 $Ref)) (!
      (=>
        (Set_in n@103@00 (Set_union g0@2@00 g1@3@00))
        (and
          (= (inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00) n@103@00)
          (img@105@00 s@$ g0@2@00 g1@3@00 n@103@00)))
      :pattern ((Set_in n@103@00 (Set_union g0@2@00 g1@3@00)))
      :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 n@103@00))
      :pattern ((img@105@00 s@$ g0@2@00 g1@3@00 n@103@00))
      :qid |r-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@105@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00)))
        (= (inv@104@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@104@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@110@00 $Ref)) (!
      (=>
        (Set_in n@110@00 g1@3@00)
        (and
          (= (inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00) n@110@00)
          (img@112@00 s@$ g0@2@00 g1@3@00 n@110@00)))
      :pattern ((Set_in n@110@00 g1@3@00))
      :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 n@110@00))
      :pattern ((img@112@00 s@$ g0@2@00 g1@3@00 n@110@00))
      :qid |l-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@112@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@111@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@111@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@115@00 $Ref)) (!
      (=>
        (Set_in n@115@00 g1@3@00)
        (and
          (= (inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00) n@115@00)
          (img@117@00 s@$ g0@2@00 g1@3@00 n@115@00)))
      :pattern ((Set_in n@115@00 g1@3@00))
      :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 n@115@00))
      :pattern ((img@117@00 s@$ g0@2@00 g1@3@00 n@115@00))
      :qid |r-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@117@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00))
        (= (inv@116@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@116@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((n@120@00 $Ref)) (!
      (=>
        (Set_in n@120@00 (Set_union g1@3@00 g0@2@00))
        (and
          (= (inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00) n@120@00)
          (img@122@00 s@$ g0@2@00 g1@3@00 n@120@00)))
      :pattern ((Set_in n@120@00 (Set_union g1@3@00 g0@2@00)))
      :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 n@120@00))
      :pattern ((img@122@00 s@$ g0@2@00 g1@3@00 n@120@00))
      :qid |l-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@122@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
        (= (inv@121@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@121@00 s@$ g0@2@00 g1@3@00 r))
      :qid |l-fctOfInv|))
    (forall ((n@125@00 $Ref)) (!
      (=>
        (Set_in n@125@00 (Set_union g1@3@00 g0@2@00))
        (and
          (= (inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00) n@125@00)
          (img@127@00 s@$ g0@2@00 g1@3@00 n@125@00)))
      :pattern ((Set_in n@125@00 (Set_union g1@3@00 g0@2@00)))
      :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 n@125@00))
      :pattern ((img@127@00 s@$ g0@2@00 g1@3@00 n@125@00))
      :qid |r-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@127@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00)))
        (= (inv@126@00 s@$ g0@2@00 g1@3@00 r) r))
      :pattern ((inv@126@00 s@$ g0@2@00 g1@3@00 r))
      :qid |r-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_l (sm@23@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef6|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_r (sm@28@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef9|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@25@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (=
          ($FVF.lookup_l (sm@26@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@26@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef7|))
    (forall ((r $Ref)) (!
      ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
      :pattern (($FVF.lookup_l (sm@26@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@30@00 s@$ g0@2@00 g1@3@00 r)
          (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00))
        (=
          ($FVF.lookup_r (sm@31@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@31@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef10|))
    (forall ((r $Ref)) (!
      ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r)
      :pattern (($FVF.lookup_r (sm@31@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef11|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@47@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@47@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_l (sm@48@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef21|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@47@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef18|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@46@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@47@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef19|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
      :pattern (($FVF.lookup_l (sm@48@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef20|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@51@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@51@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_r (sm@53@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef28|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@51@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@50@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@51@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef26|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_r (sm@53@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef27|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@56@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@56@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_l (sm@58@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef35|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@56@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef32|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@55@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@56@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef33|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
      :pattern (($FVF.lookup_l (sm@58@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef34|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@61@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@61@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_r (sm@63@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef42|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@61@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef39|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@60@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@61@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef40|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_r (sm@63@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef41|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@68@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@68@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_l (sm@70@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef49|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@68@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef46|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@67@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@68@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef47|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
      :pattern (($FVF.lookup_l (sm@70@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef48|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@73@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@73@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_r (sm@75@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef56|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@73@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef53|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@72@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@73@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef54|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_r (sm@75@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef55|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@78@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@78@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_l (sm@80@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef63|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@78@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef60|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@77@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@78@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef61|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
      :pattern (($FVF.lookup_l (sm@80@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef62|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@83@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@83@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_r (sm@85@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef70|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@83@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef67|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@82@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@83@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef68|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_r (sm@85@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef69|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@90@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@90@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_l (sm@92@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef77|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@90@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef74|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@89@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@90@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef75|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
      :pattern (($FVF.lookup_l (sm@92@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef76|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@95@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@95@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_r (sm@97@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef84|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@95@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef81|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@94@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)
            (img@95@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef82|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_r (sm@97@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef83|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@100@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@100@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_l (sm@102@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef91|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@100@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef88|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@99@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@100@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef89|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
      :pattern (($FVF.lookup_l (sm@102@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef90|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@105@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@105@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_r (sm@107@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef98|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@105@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef95|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@104@00 s@$ g0@2@00 g1@3@00 r) (Set_union g0@2@00 g1@3@00))
            (img@105@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef96|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_r (sm@107@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef97|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@112@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@112@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_l (sm@114@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef105|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@112@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef102|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@111@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@112@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef103|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
      :pattern (($FVF.lookup_l (sm@114@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef104|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@117@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@117@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_r (sm@119@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef112|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@117@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef109|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@116@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)
            (img@117@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef110|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_r (sm@119@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef111|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@122@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@122@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_l (sm@124@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef119|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@122@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@25@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@24@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef116|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@121@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@122@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@34@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@33@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef117|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first s@$)) r) r)
        ($FVF.loc_l ($FVF.lookup_l ($SortWrappers.$SnapTo$FVF<l> ($Snap.first ($Snap.second ($Snap.second s@$)))) r) r))
      :pattern (($FVF.lookup_l (sm@124@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef118|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))
          (and
            (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@127@00 s@$ g0@2@00 g1@3@00 r)))
        (=>
          (and
            (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@127@00 s@$ g0@2@00 g1@3@00 r))
          (Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00)))))
      :pattern ((Set_in r ($FVF.domain_r (sm@129@00 s@$ g0@2@00 g1@3@00))))
      :qid |qp.fvfDomDef126|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@127@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@38@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@37@00 s@$ g0@2@00 g1@3@00 r) g1@3@00)))
        (=
          ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef123|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@126@00 s@$ g0@2@00 g1@3@00 r) (Set_union g1@3@00 g0@2@00))
            (img@127@00 s@$ g0@2@00 g1@3@00 r))
          (and
            (img@30@00 s@$ g0@2@00 g1@3@00 r)
            (Set_in (inv@29@00 s@$ g0@2@00 g1@3@00 r) g0@2@00)))
        (=
          ($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r)
          ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
      :pattern (($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef124|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
        ($FVF.loc_r ($FVF.lookup_r ($SortWrappers.$SnapTo$FVF<r> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_r (sm@129@00 s@$ g0@2@00 g1@3@00) r))
      :qid |qp.fvfResTrgDef125|))
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
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
                  ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00) u v)))
            (exists_path<Bool> ($$ (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)) u v))
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
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
                  ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00) u v)))
            (exists_path<Bool> ($$ (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00)))) (Set_union g1@3@00 g0@2@00)) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g1@3@00)
              (and
                (Set_in v g1@3@00)
                (exists_path<Bool> ($$ ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00)))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00)))) (Set_union g1@3@00 g0@2@00)) u v))
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
                      ($Snap.combine
                        ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                        ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
                      ($Snap.combine
                        ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                        ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00) u v))))
            (not
              (exists_path<Bool> ($$ (ite
                (and
                  (Set_in u g0@2@00)
                  (and
                    (Set_in v g0@2@00)
                    (exists_path<Bool> ($$ ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
                ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
                ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)) u v)))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g0@2@00)
            (ite
              (Set_in u g0@2@00)
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)) u v))
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
                      ($Snap.combine
                        ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                        ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
                      ($Snap.combine
                        ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                        ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00) u v))))
            (not
              (exists_path<Bool> ($$ (ite
                (and
                  (Set_in u g1@3@00)
                  (and
                    (Set_in v g1@3@00)
                    (exists_path<Bool> ($$ ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
                ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00)))
                ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00)))) (Set_union g1@3@00 g0@2@00)) u v)))
          :pattern ((exists_path<Bool> ($$ (ite
            (Set_in v g1@3@00)
            (ite
              (Set_in u g1@3@00)
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00) u v))
          :pattern ((exists_path<Bool> ($$ (ite
            (and
              (Set_in u g0@2@00)
              (and
                (Set_in v g0@2@00)
                (exists_path<Bool> ($$ ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)) u v))
          ))))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-178|)))
; WARNING: (16431,11): 'if' cannot be used in patterns.
; WARNING: (16431,11): 'if' cannot be used in patterns.
; WARNING: (16431,11): 'and' cannot be used in patterns.
; WARNING: (16431,11): 'and' cannot be used in patterns.
; WARNING: (16431,11): 'if' cannot be used in patterns.
; WARNING: (16492,11): 'if' cannot be used in patterns.
; WARNING: (16492,11): 'if' cannot be used in patterns.
; WARNING: (16492,11): 'and' cannot be used in patterns.
; WARNING: (16492,11): 'and' cannot be used in patterns.
; WARNING: (16492,11): 'if' cannot be used in patterns.
; WARNING: (16555,11): 'if' cannot be used in patterns.
; WARNING: (16555,11): 'if' cannot be used in patterns.
; WARNING: (16555,11): 'and' cannot be used in patterns.
; WARNING: (16555,11): 'and' cannot be used in patterns.
; WARNING: (16555,11): 'if' cannot be used in patterns.
; WARNING: (16618,11): 'if' cannot be used in patterns.
; WARNING: (16618,11): 'if' cannot be used in patterns.
; WARNING: (16618,11): 'and' cannot be used in patterns.
; WARNING: (16618,11): 'and' cannot be used in patterns.
; WARNING: (16618,11): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (g0@2@00 Set<$Ref>) (g1@3@00 Set<$Ref>)) (!
  (let ((result@4@00 (apply_TCFraming%limited s@$ g0@2@00 g1@3@00))) true)
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-179|)))
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
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00))
        (=>
          (and
            (Set_in u g0@2@00)
            (and
              (Set_in v g0@2@00)
              (exists_path<Bool> ($$ (ite
                (Set_in v g0@2@00)
                (ite
                  (Set_in u g0@2@00)
                  ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
                  ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
                ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00) u v)))
          (and
            (=>
              (and (Set_in u g0@2@00) (Set_in v g0@2@00))
              ($$%precondition ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00))
            ($$%precondition (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g0@2@00)
        (ite
          (Set_in u g0@2@00)
          ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
          ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-180|)))
; WARNING: (16710,7): 'if' cannot be used in patterns.
; WARNING: (16710,7): 'if' cannot be used in patterns.
; WARNING: (16710,7): 'and' cannot be used in patterns.
; WARNING: (16710,7): 'and' cannot be used in patterns.
; WARNING: (16710,7): 'if' cannot be used in patterns.
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
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00))
        (=>
          (and
            (Set_in u g1@3@00)
            (and
              (Set_in v g1@3@00)
              (exists_path<Bool> ($$ (ite
                (Set_in v g1@3@00)
                (ite
                  (Set_in u g1@3@00)
                  ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
                  ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
                ($Snap.combine
                  ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                  ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00) u v)))
          (and
            (=>
              (and (Set_in u g1@3@00) (Set_in v g1@3@00))
              ($$%precondition ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00))
            ($$%precondition (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00)))) (Set_union g1@3@00 g0@2@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g1@3@00)
        (ite
          (Set_in u g1@3@00)
          ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
          ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g1@3@00)
          (and
            (Set_in v g1@3@00)
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00)))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00)))) (Set_union g1@3@00 g0@2@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-181|)))
; WARNING: (16798,7): 'if' cannot be used in patterns.
; WARNING: (16798,7): 'if' cannot be used in patterns.
; WARNING: (16798,7): 'and' cannot be used in patterns.
; WARNING: (16798,7): 'and' cannot be used in patterns.
; WARNING: (16798,7): 'if' cannot be used in patterns.
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
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00))
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
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
                  ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00) u v))))
          (and
            (=>
              (and (Set_in u g0@2@00) (Set_in v g0@2@00))
              ($$%precondition ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00))
            ($$%precondition (ite
              (and
                (Set_in u g0@2@00)
                (and
                  (Set_in v g0@2@00)
                  (exists_path<Bool> ($$ ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g0@2@00)
        (ite
          (Set_in u g0@2@00)
          ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00)))
          ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00))))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@92@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@97@00 s@$ g0@2@00 g1@3@00)))) g0@2@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-182|)))
; WARNING: (16887,7): 'if' cannot be used in patterns.
; WARNING: (16887,7): 'if' cannot be used in patterns.
; WARNING: (16887,7): 'and' cannot be used in patterns.
; WARNING: (16887,7): 'and' cannot be used in patterns.
; WARNING: (16887,7): 'if' cannot be used in patterns.
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
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
            ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00))
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
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
                    ($Snap.combine
                      ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                      ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
                  ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00) u v))))
          (and
            (=>
              (and (Set_in u g1@3@00) (Set_in v g1@3@00))
              ($$%precondition ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00))
            ($$%precondition (ite
              (and
                (Set_in u g1@3@00)
                (and
                  (Set_in v g1@3@00)
                  (exists_path<Bool> ($$ ($Snap.combine
                    ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
                    ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00))) g1@3@00) u v)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@80@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@85@00 s@$ g0@2@00 g1@3@00)))
              ($Snap.combine
                ($SortWrappers.$FVF<l>To$Snap (sm@124@00 s@$ g0@2@00 g1@3@00))
                ($SortWrappers.$FVF<r>To$Snap (sm@129@00 s@$ g0@2@00 g1@3@00)))) (Set_union g1@3@00 g0@2@00)))))
      :pattern ((exists_path<Bool> ($$ (ite
        (Set_in v g1@3@00)
        (ite
          (Set_in u g1@3@00)
          ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@70@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@75@00 s@$ g0@2@00 g1@3@00)))
          ($Snap.combine
            ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
            ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00))))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@114@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@119@00 s@$ g0@2@00 g1@3@00)))) g1@3@00) u v))
      :pattern ((exists_path<Bool> ($$ (ite
        (and
          (Set_in u g0@2@00)
          (and
            (Set_in v g0@2@00)
            (exists_path<Bool> ($$ ($Snap.combine
              ($SortWrappers.$FVF<l>To$Snap (sm@48@00 s@$ g0@2@00 g1@3@00))
              ($SortWrappers.$FVF<r>To$Snap (sm@53@00 s@$ g0@2@00 g1@3@00))) g0@2@00) u v)))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@58@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@63@00 s@$ g0@2@00 g1@3@00)))
        ($Snap.combine
          ($SortWrappers.$FVF<l>To$Snap (sm@102@00 s@$ g0@2@00 g1@3@00))
          ($SortWrappers.$FVF<r>To$Snap (sm@107@00 s@$ g0@2@00 g1@3@00)))) (Set_union g0@2@00 g1@3@00)) u v))
      ))))
  :pattern ((apply_TCFraming%limited s@$ g0@2@00 g1@3@00))
  :qid |quant-u-183|)))
; WARNING: (16976,7): 'if' cannot be used in patterns.
; WARNING: (16976,7): 'if' cannot be used in patterns.
; WARNING: (16976,7): 'and' cannot be used in patterns.
; WARNING: (16976,7): 'and' cannot be used in patterns.
; WARNING: (16976,7): 'if' cannot be used in patterns.
