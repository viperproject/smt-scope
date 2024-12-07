(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:33
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Node 0)
(declare-sort Graph 0)
(declare-sort $FVF<l> 0)
(declare-sort $FVF<r> 0)
(declare-sort $FVF<m> 0)
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
(declare-fun $SortWrappers.NodeTo$Snap (Node) $Snap)
(declare-fun $SortWrappers.$SnapToNode ($Snap) Node)
(assert (forall ((x Node)) (!
    (= x ($SortWrappers.$SnapToNode($SortWrappers.NodeTo$Snap x)))
    :pattern (($SortWrappers.NodeTo$Snap x))
    :qid |$Snap.$SnapToNodeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.NodeTo$Snap($SortWrappers.$SnapToNode x)))
    :pattern (($SortWrappers.$SnapToNode x))
    :qid |$Snap.NodeTo$SnapToNode|
    )))
(declare-fun $SortWrappers.GraphTo$Snap (Graph) $Snap)
(declare-fun $SortWrappers.$SnapToGraph ($Snap) Graph)
(assert (forall ((x Graph)) (!
    (= x ($SortWrappers.$SnapToGraph($SortWrappers.GraphTo$Snap x)))
    :pattern (($SortWrappers.GraphTo$Snap x))
    :qid |$Snap.$SnapToGraphTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.GraphTo$Snap($SortWrappers.$SnapToGraph x)))
    :pattern (($SortWrappers.$SnapToGraph x))
    :qid |$Snap.GraphTo$SnapToGraph|
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
(declare-fun $SortWrappers.$FVF<m>To$Snap ($FVF<m>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<m> ($Snap) $FVF<m>)
(assert (forall ((x $FVF<m>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<m>($SortWrappers.$FVF<m>To$Snap x)))
    :pattern (($SortWrappers.$FVF<m>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<m>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<m>To$Snap($SortWrappers.$SnapTo$FVF<m> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<m> x))
    :qid |$Snap.$FVF<m>To$SnapTo$FVF<m>|
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
(declare-const default_node<Node> Node)
(declare-fun lookup<Node> ($Ref) Node)
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
; /field_value_functions_declarations.smt2 [m: Int]
(declare-fun $FVF.domain_m ($FVF<m>) Set<$Ref>)
(declare-fun $FVF.lookup_m ($FVF<m> $Ref) Int)
(declare-fun $FVF.after_m ($FVF<m> $FVF<m>) Bool)
(declare-fun $FVF.loc_m (Int $Ref) Bool)
(declare-fun $FVF.perm_m ($FPM $Ref) $Perm)
(declare-const $fvfTOP_m $FVF<m>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun purify_node ($Snap $Ref) Node)
(declare-fun purify_node%limited ($Snap $Ref) Node)
(declare-fun purify_node%stateless ($Ref) Bool)
(declare-fun purify_node%precondition ($Snap $Ref) Bool)
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
; /field_value_functions_axioms.smt2 [m: Int]
(assert (forall ((vs $FVF<m>) (ws $FVF<m>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_m vs) ($FVF.domain_m ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_m vs))
            (= ($FVF.lookup_m vs x) ($FVF.lookup_m ws x)))
          :pattern (($FVF.lookup_m vs x) ($FVF.lookup_m ws x))
          :qid |qp.$FVF<m>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<m>To$Snap vs)
              ($SortWrappers.$FVF<m>To$Snap ws)
              )
    :qid |qp.$FVF<m>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_m pm r))
    :pattern (($FVF.perm_m pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_m f r) true)
    :pattern (($FVF.loc_m f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (n@0@00 $Ref)) (!
  (= (purify_node%limited s@$ n@0@00) (purify_node s@$ n@0@00))
  :pattern ((purify_node s@$ n@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (n@0@00 $Ref)) (!
  (purify_node%stateless n@0@00)
  :pattern ((purify_node%limited s@$ n@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (n@0@00 $Ref)) (!
  (let ((result@1@00 (purify_node%limited s@$ n@0@00))) (=>
    (purify_node%precondition s@$ n@0@00)
    (= result@1@00 (as default_node<Node>  Node))))
  :pattern ((purify_node%limited s@$ n@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (n@0@00 $Ref)) (!
  (let ((result@1@00 (purify_node%limited s@$ n@0@00))) true)
  :pattern ((purify_node%limited s@$ n@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
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
; var vroot: Ref
(declare-const vroot@0@01 $Ref)
; [exec]
; var root: Ref
(declare-const root@1@01 $Ref)
; [exec]
; var graph: Set[Ref]
(declare-const graph@2@01 Set<$Ref>)
; [exec]
; vroot := new(m, l, r)
(declare-const vroot@3@01 $Ref)
(assert (not (= vroot@3@01 $Ref.null)))
(declare-const m@4@01 Int)
(declare-const sm@5@01 $FVF<m>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_m (as sm@5@01  $FVF<m>) vroot@3@01) m@4@01))
(declare-const l@6@01 $Ref)
(declare-const sm@7@01 $FVF<l>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_l (as sm@7@01  $FVF<l>) vroot@3@01) l@6@01))
(declare-const r@8@01 $Ref)
(declare-const sm@9@01 $FVF<r>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) vroot@3@01) r@8@01))
(assert (not (= vroot@3@01 vroot@0@01)))
(assert (not (= vroot@3@01 root@1@01)))
(assert (not (Set_in vroot@3@01 graph@2@01)))
; [exec]
; vroot.l := vroot
(declare-const sm@10@01 $FVF<l>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_l (as sm@10@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@7@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@10@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@7@01  $FVF<l>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_l ($FVF.lookup_l (as sm@7@01  $FVF<l>) r) r)
  :pattern (($FVF.lookup_l (as sm@10@01  $FVF<l>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert ($FVF.loc_l ($FVF.lookup_l (as sm@10@01  $FVF<l>) vroot@3@01) vroot@3@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@11@01 ((r $Ref)) $Perm
  (ite
    (= r vroot@3@01)
    ($Perm.min (ite (= r vroot@3@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@11@01 vroot@3@01)) $Perm.No)))
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
  (=> (= r vroot@3@01) (= (- $Perm.Write (pTaken@11@01 r)) $Perm.No))
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@12@01 $FVF<l>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_l (as sm@12@01  $FVF<l>) vroot@3@01) vroot@3@01))
(assert ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) vroot@3@01) vroot@3@01))
; [exec]
; vroot.r := vroot
(declare-const sm@13@01 $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_r (as sm@13@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@9@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@13@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) r)
  :pattern (($FVF.lookup_r (as sm@13@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@13@01  $FVF<r>) vroot@3@01) vroot@3@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@14@01 ((r $Ref)) $Perm
  (ite
    (= r vroot@3@01)
    ($Perm.min (ite (= r vroot@3@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@14@01 vroot@3@01)) $Perm.No)))
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
  (=> (= r vroot@3@01) (= (- $Perm.Write (pTaken@14@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@15@01 $FVF<r>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_r (as sm@15@01  $FVF<r>) vroot@3@01) vroot@3@01))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) vroot@3@01) vroot@3@01))
; [exec]
; root := new(m, l, r)
(declare-const root@16@01 $Ref)
(assert (not (= root@16@01 $Ref.null)))
(declare-const m@17@01 Int)
(declare-const sm@18@01 $FVF<m>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_m (as sm@18@01  $FVF<m>) root@16@01) m@17@01))
(declare-const l@19@01 $Ref)
(declare-const sm@20@01 $FVF<l>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_l (as sm@20@01  $FVF<l>) root@16@01) l@19@01))
(declare-const r@21@01 $Ref)
(declare-const sm@22@01 $FVF<r>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_r (as sm@22@01  $FVF<r>) root@16@01) r@21@01))
(assert (not (= root@16@01 vroot@3@01)))
(assert (not (= root@16@01 root@1@01)))
(assert (not (= root@16@01 ($FVF.lookup_l (as sm@12@01  $FVF<l>) vroot@3@01))))
(assert (not (= root@16@01 ($FVF.lookup_r (as sm@15@01  $FVF<r>) vroot@3@01))))
(assert (not (Set_in root@16@01 graph@2@01)))
; [exec]
; root.l := vroot
(declare-const sm@23@01 $FVF<l>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_l (as sm@23@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@20@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@23@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@20@01  $FVF<l>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_l (as sm@23@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@12@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@23@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@12@01  $FVF<l>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l (as sm@20@01  $FVF<l>) r) r)
    ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) r) r))
  :pattern (($FVF.lookup_l (as sm@23@01  $FVF<l>) r))
  :qid |qp.fvfResTrgDef6|)))
(assert ($FVF.loc_l ($FVF.lookup_l (as sm@23@01  $FVF<l>) root@16@01) root@16@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (= r root@16@01)
    ($Perm.min (ite (= r root@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@25@01 ((r $Ref)) $Perm
  (ite
    (= r root@16@01)
    ($Perm.min
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@24@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@24@01 root@16@01)) $Perm.No)))
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
  (=> (= r root@16@01) (= (- $Perm.Write (pTaken@24@01 r)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@26@01 $FVF<l>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_l (as sm@26@01  $FVF<l>) root@16@01) vroot@3@01))
(assert ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) root@16@01) root@16@01))
; [exec]
; root.r := vroot
(declare-const sm@27@01 $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_r (as sm@27@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@15@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@27@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@15@01  $FVF<r>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_r (as sm@27@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@22@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@27@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@22@01  $FVF<r>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@22@01  $FVF<r>) r) r))
  :pattern (($FVF.lookup_r (as sm@27@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@27@01  $FVF<r>) root@16@01) root@16@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@28@01 ((r $Ref)) $Perm
  (ite
    (= r root@16@01)
    ($Perm.min (ite (= r root@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@29@01 ((r $Ref)) $Perm
  (ite
    (= r root@16@01)
    ($Perm.min
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@28@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@28@01 root@16@01)) $Perm.No)))
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
  (=> (= r root@16@01) (= (- $Perm.Write (pTaken@28@01 r)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@30@01 $FVF<r>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_r (as sm@30@01  $FVF<r>) root@16@01) vroot@3@01))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) root@16@01) root@16@01))
; [exec]
; graph := Set(vroot, root)
; [eval] Set(vroot, root)
(declare-const graph@31@01 Set<$Ref>)
(assert (= graph@31@01 (Set_unionone (Set_singleton vroot@3@01) root@16@01)))
; [exec]
; assert !((null in graph)) &&
;   ((forall n: Ref ::(n in graph) ==> acc(n.l, write)) &&
;   ((forall n$0: Ref ::(n$0 in graph) ==> acc(n$0.r, write)) &&
;   ((forall n$1: Ref ::(n$1 in graph) ==> acc(n$1.m, write)) &&
;   ((forall n$2: Ref ::
;     { (n$2.l in graph) }
;     { (n$2 in graph), n$2.l }
;     (n$2 in graph) && n$2.l != null ==> (n$2.l in graph)) &&
;   (forall n$3: Ref ::
;     { (n$3.r in graph) }
;     { (n$3 in graph), n$3.r }
;     (n$3 in graph) && n$3.r != null ==> (n$3.r in graph))))))
; [eval] !((null in graph))
; [eval] (null in graph)
(set-option :timeout 0)
(push) ; 3
(assert (not (not (Set_in $Ref.null graph@31@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_in $Ref.null graph@31@01)))
(declare-const n@32@01 $Ref)
(push) ; 3
; [eval] (n in graph)
(assert (Set_in n@32@01 graph@31@01))
(pop) ; 3
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@35@01 $FVF<l>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@12@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@12@01  $FVF<l>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@26@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@26@01  $FVF<l>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) r) r)
    ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) r) r))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :qid |qp.fvfResTrgDef12|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@32@01 $Ref) (n2@32@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@32@01 graph@31@01)
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n1@32@01) n1@32@01))
      (and
        (Set_in n2@32@01 graph@31@01)
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n2@32@01) n2@32@01))
      (= n1@32@01 n2@32@01))
    (= n1@32@01 n2@32@01))
  
  :qid |l-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@32@01 $Ref)) (!
  (=>
    (Set_in n@32@01 graph@31@01)
    (and (= (inv@33@01 n@32@01) n@32@01) (img@34@01 n@32@01)))
  :pattern ((Set_in n@32@01 graph@31@01))
  :pattern ((inv@33@01 n@32@01))
  :pattern ((img@34@01 n@32@01))
  :qid |l-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (Set_in (inv@33@01 r) graph@31@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |l-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@33@01 r) graph@31@01)
    ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) r) r))
  :pattern ((inv@33@01 r))
  :qid |quant-u-17|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@33@01 r) graph@31@01) (img@34@01 r) (= r (inv@33@01 r)))
    ($Perm.min (ite (= r vroot@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@33@01 r) graph@31@01) (img@34@01 r) (= r (inv@33@01 r)))
    ($Perm.min
      (ite (= r root@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@36@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@36@01 vroot@3@01)) $Perm.No)))
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
    (and (Set_in (inv@33@01 r) graph@31@01) (img@34@01 r) (= r (inv@33@01 r)))
    (= (- $Perm.Write (pTaken@36@01 r)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@37@01 root@16@01)) $Perm.No)))
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
    (and (Set_in (inv@33@01 r) graph@31@01) (img@34@01 r) (= r (inv@33@01 r)))
    (= (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@37@01 r)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const n$0@38@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n$0 in graph)
(assert (Set_in n$0@38@01 graph@31@01))
(pop) ; 3
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@41@01 $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_r (as sm@41@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@15@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@41@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@15@01  $FVF<r>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_r (as sm@41@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@30@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@41@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@30@01  $FVF<r>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r))
  :pattern (($FVF.lookup_r (as sm@41@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef15|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n$01@38@01 $Ref) (n$02@38@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n$01@38@01 graph@31@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@41@01  $FVF<r>) n$01@38@01) n$01@38@01))
      (and
        (Set_in n$02@38@01 graph@31@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@41@01  $FVF<r>) n$02@38@01) n$02@38@01))
      (= n$01@38@01 n$02@38@01))
    (= n$01@38@01 n$02@38@01))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$0@38@01 $Ref)) (!
  (=>
    (Set_in n$0@38@01 graph@31@01)
    (and (= (inv@39@01 n$0@38@01) n$0@38@01) (img@40@01 n$0@38@01)))
  :pattern ((Set_in n$0@38@01 graph@31@01))
  :pattern ((inv@39@01 n$0@38@01))
  :pattern ((img@40@01 n$0@38@01))
  :qid |r-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@40@01 r) (Set_in (inv@39@01 r) graph@31@01)) (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |r-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@39@01 r) graph@31@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@41@01  $FVF<r>) r) r))
  :pattern ((inv@39@01 r))
  :qid |quant-u-24|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@42@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@39@01 r) graph@31@01) (img@40@01 r) (= r (inv@39@01 r)))
    ($Perm.min (ite (= r vroot@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@43@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@39@01 r) graph@31@01) (img@40@01 r) (= r (inv@39@01 r)))
    ($Perm.min
      (ite (= r root@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@42@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@42@01 vroot@3@01)) $Perm.No)))
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
    (and (Set_in (inv@39@01 r) graph@31@01) (img@40@01 r) (= r (inv@39@01 r)))
    (= (- $Perm.Write (pTaken@42@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@43@01 root@16@01)) $Perm.No)))
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
    (and (Set_in (inv@39@01 r) graph@31@01) (img@40@01 r) (= r (inv@39@01 r)))
    (= (- (- $Perm.Write (pTaken@42@01 r)) (pTaken@43@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const n$1@44@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n$1 in graph)
(assert (Set_in n$1@44@01 graph@31@01))
(pop) ; 3
(declare-fun inv@45@01 ($Ref) $Ref)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n$11@44@01 $Ref) (n$12@44@01 $Ref)) (!
  (=>
    (and
      (Set_in n$11@44@01 graph@31@01)
      (Set_in n$12@44@01 graph@31@01)
      (= n$11@44@01 n$12@44@01))
    (= n$11@44@01 n$12@44@01))
  
  :qid |m-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$1@44@01 $Ref)) (!
  (=>
    (Set_in n$1@44@01 graph@31@01)
    (and (= (inv@45@01 n$1@44@01) n$1@44@01) (img@46@01 n$1@44@01)))
  :pattern ((Set_in n$1@44@01 graph@31@01))
  :pattern ((inv@45@01 n$1@44@01))
  :pattern ((img@46@01 n$1@44@01))
  :qid |m-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@46@01 r) (Set_in (inv@45@01 r) graph@31@01)) (= (inv@45@01 r) r))
  :pattern ((inv@45@01 r))
  :qid |m-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@47@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@45@01 r) graph@31@01) (img@46@01 r) (= r (inv@45@01 r)))
    ($Perm.min (ite (= r root@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@45@01 r) graph@31@01) (img@46@01 r) (= r (inv@45@01 r)))
    ($Perm.min
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@47@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@47@01 root@16@01)) $Perm.No)))
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
    (and (Set_in (inv@45@01 r) graph@31@01) (img@46@01 r) (= r (inv@45@01 r)))
    (= (- $Perm.Write (pTaken@47@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@48@01 vroot@3@01)) $Perm.No)))
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
    (and (Set_in (inv@45@01 r) graph@31@01) (img@46@01 r) (= r (inv@45@01 r)))
    (= (- (- $Perm.Write (pTaken@47@01 r)) (pTaken@48@01 r)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $FVF<m>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_m (as sm@49@01  $FVF<m>) r)
      ($FVF.lookup_m (as sm@18@01  $FVF<m>) r)))
  :pattern (($FVF.lookup_m (as sm@49@01  $FVF<m>) r))
  :pattern (($FVF.lookup_m (as sm@18@01  $FVF<m>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_m (as sm@49@01  $FVF<m>) r)
      ($FVF.lookup_m (as sm@5@01  $FVF<m>) r)))
  :pattern (($FVF.lookup_m (as sm@49@01  $FVF<m>) r))
  :pattern (($FVF.lookup_m (as sm@5@01  $FVF<m>) r))
  :qid |qp.fvfValDef17|)))
; [eval] (forall n$2: Ref :: { (n$2.l in graph) } { (n$2 in graph), n$2.l } (n$2 in graph) && n$2.l != null ==> (n$2.l in graph))
(declare-const n$2@50@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n$2 in graph) && n$2.l != null ==> (n$2.l in graph)
; [eval] (n$2 in graph) && n$2.l != null
; [eval] (n$2 in graph)
(push) ; 4
; [then-branch: 0 | !(n$2@50@01 in graph@31@01) | live]
; [else-branch: 0 | n$2@50@01 in graph@31@01 | live]
(push) ; 5
; [then-branch: 0 | !(n$2@50@01 in graph@31@01)]
(assert (not (Set_in n$2@50@01 graph@31@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | n$2@50@01 in graph@31@01]
(assert (Set_in n$2@50@01 graph@31@01))
; [eval] n$2.l != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r vroot@3@01)
      (=
        ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
        ($FVF.lookup_l (as sm@12@01  $FVF<l>) r)))
    :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
    :pattern (($FVF.lookup_l (as sm@12@01  $FVF<l>) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (= r root@16@01)
      (=
        ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
        ($FVF.lookup_l (as sm@26@01  $FVF<l>) r)))
    :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
    :pattern (($FVF.lookup_l (as sm@26@01  $FVF<l>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) r) r)
      ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) r) r))
    :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
    :qid |qp.fvfResTrgDef12|))))
(assert ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= n$2@50@01 vroot@3@01) $Perm.Write $Perm.No)
    (ite (= n$2@50@01 root@16@01) $Perm.Write $Perm.No)))))
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
    (= r vroot@3@01)
    (=
      ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@12@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@12@01  $FVF<l>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@26@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@26@01  $FVF<l>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) r) r)
    ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) r) r))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (=>
  (Set_in n$2@50@01 graph@31@01)
  (and
    (Set_in n$2@50@01 graph@31@01)
    ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01))))
(assert (or (Set_in n$2@50@01 graph@31@01) (not (Set_in n$2@50@01 graph@31@01))))
(push) ; 4
; [then-branch: 1 | n$2@50@01 in graph@31@01 && Lookup(l, sm@35@01, n$2@50@01) != Null | live]
; [else-branch: 1 | !(n$2@50@01 in graph@31@01 && Lookup(l, sm@35@01, n$2@50@01) != Null) | live]
(push) ; 5
; [then-branch: 1 | n$2@50@01 in graph@31@01 && Lookup(l, sm@35@01, n$2@50@01) != Null]
(assert (and
  (Set_in n$2@50@01 graph@31@01)
  (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null))))
; [eval] (n$2.l in graph)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r vroot@3@01)
      (=
        ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
        ($FVF.lookup_l (as sm@12@01  $FVF<l>) r)))
    :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
    :pattern (($FVF.lookup_l (as sm@12@01  $FVF<l>) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (= r root@16@01)
      (=
        ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
        ($FVF.lookup_l (as sm@26@01  $FVF<l>) r)))
    :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
    :pattern (($FVF.lookup_l (as sm@26@01  $FVF<l>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) r) r)
      ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) r) r))
    :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
    :qid |qp.fvfResTrgDef12|))))
(assert ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= n$2@50@01 vroot@3@01) $Perm.Write $Perm.No)
    (ite (= n$2@50@01 root@16@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(n$2@50@01 in graph@31@01 && Lookup(l, sm@35@01, n$2@50@01) != Null)]
(assert (not
  (and
    (Set_in n$2@50@01 graph@31@01)
    (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@12@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@12@01  $FVF<l>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@26@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@26@01  $FVF<l>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) r) r)
    ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) r) r))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (=>
  (and
    (Set_in n$2@50@01 graph@31@01)
    (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))
  (and
    (Set_in n$2@50@01 graph@31@01)
    (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null))
    ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$2@50@01 graph@31@01)
      (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null))))
  (and
    (Set_in n$2@50@01 graph@31@01)
    (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@12@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@12@01  $FVF<l>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_l (as sm@35@01  $FVF<l>) r)
      ($FVF.lookup_l (as sm@26@01  $FVF<l>) r)))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :pattern (($FVF.lookup_l (as sm@26@01  $FVF<l>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) r) r)
    ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) r) r))
  :pattern (($FVF.lookup_l (as sm@35@01  $FVF<l>) r))
  :qid |qp.fvfResTrgDef12|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$2@50@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@50@01 graph@31@01)
      (and
        (Set_in n$2@50@01 graph@31@01)
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01)))
    (or (Set_in n$2@50@01 graph@31@01) (not (Set_in n$2@50@01 graph@31@01)))
    (=>
      (and
        (Set_in n$2@50@01 graph@31@01)
        (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))
      (and
        (Set_in n$2@50@01 graph@31@01)
        (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null))
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01)))
    (or
      (not
        (and
          (Set_in n$2@50@01 graph@31@01)
          (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null))))
      (and
        (Set_in n$2@50@01 graph@31@01)
        (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) graph@31@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@45@12@45@24-aux|)))
(assert (forall ((n$2@50@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@50@01 graph@31@01)
      (and
        (Set_in n$2@50@01 graph@31@01)
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01)))
    (or (Set_in n$2@50@01 graph@31@01) (not (Set_in n$2@50@01 graph@31@01)))
    (=>
      (and
        (Set_in n$2@50@01 graph@31@01)
        (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))
      (and
        (Set_in n$2@50@01 graph@31@01)
        (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null))
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01)))
    (or
      (not
        (and
          (Set_in n$2@50@01 graph@31@01)
          (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null))))
      (and
        (Set_in n$2@50@01 graph@31@01)
        (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))))
  :pattern ((Set_in n$2@50@01 graph@31@01) ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@45@12@45@24-aux|)))
(push) ; 3
(assert (not (forall ((n$2@50@01 $Ref)) (!
  (=>
    (and
      (Set_in n$2@50@01 graph@31@01)
      (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))
    (Set_in ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) graph@31@01))
  :pattern ((Set_in ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) graph@31@01))
  :pattern ((Set_in n$2@50@01 graph@31@01) ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@45@12@45@24|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$2@50@01 $Ref)) (!
  (=>
    (and
      (Set_in n$2@50@01 graph@31@01)
      (not (= ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) $Ref.null)))
    (Set_in ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) graph@31@01))
  :pattern ((Set_in ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) graph@31@01))
  :pattern ((Set_in n$2@50@01 graph@31@01) ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n$2@50@01) n$2@50@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@45@12@45@24|)))
; [eval] (forall n$3: Ref :: { (n$3.r in graph) } { (n$3 in graph), n$3.r } (n$3 in graph) && n$3.r != null ==> (n$3.r in graph))
(declare-const n$3@51@01 $Ref)
(push) ; 3
; [eval] (n$3 in graph) && n$3.r != null ==> (n$3.r in graph)
; [eval] (n$3 in graph) && n$3.r != null
; [eval] (n$3 in graph)
(push) ; 4
; [then-branch: 2 | !(n$3@51@01 in graph@31@01) | live]
; [else-branch: 2 | n$3@51@01 in graph@31@01 | live]
(push) ; 5
; [then-branch: 2 | !(n$3@51@01 in graph@31@01)]
(assert (not (Set_in n$3@51@01 graph@31@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | n$3@51@01 in graph@31@01]
(assert (Set_in n$3@51@01 graph@31@01))
; [eval] n$3.r != null
(declare-const sm@52@01 $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@30@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@30@01  $FVF<r>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@15@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@15@01  $FVF<r>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef20|)))
(declare-const pm@53@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_r (as pm@53@01  $FPM) r)
    (+
      (ite (= r root@16@01) $Perm.Write $Perm.No)
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_r (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
  :pattern (($FVF.perm_r (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef22|)))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_r (as pm@53@01  $FPM) n$3@51@01))))
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
    (= r root@16@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@30@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@30@01  $FVF<r>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@15@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@15@01  $FVF<r>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_r (as pm@53@01  $FPM) r)
    (+
      (ite (= r root@16@01) $Perm.Write $Perm.No)
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_r (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
  :pattern (($FVF.perm_r (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef22|)))
(assert (=>
  (Set_in n$3@51@01 graph@31@01)
  (and
    (Set_in n$3@51@01 graph@31@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01))))
(assert (or (Set_in n$3@51@01 graph@31@01) (not (Set_in n$3@51@01 graph@31@01))))
(push) ; 4
; [then-branch: 3 | n$3@51@01 in graph@31@01 && Lookup(r, sm@52@01, n$3@51@01) != Null | live]
; [else-branch: 3 | !(n$3@51@01 in graph@31@01 && Lookup(r, sm@52@01, n$3@51@01) != Null) | live]
(push) ; 5
; [then-branch: 3 | n$3@51@01 in graph@31@01 && Lookup(r, sm@52@01, n$3@51@01) != Null]
(assert (and
  (Set_in n$3@51@01 graph@31@01)
  (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null))))
; [eval] (n$3.r in graph)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@16@01)
      (=
        ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
        ($FVF.lookup_r (as sm@30@01  $FVF<r>) r)))
    :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r (as sm@30@01  $FVF<r>) r))
    :qid |qp.fvfValDef18|))
  (forall ((r $Ref)) (!
    (=>
      (= r vroot@3@01)
      (=
        ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
        ($FVF.lookup_r (as sm@15@01  $FVF<r>) r)))
    :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r (as sm@15@01  $FVF<r>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
      ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
    :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef20|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= n$3@51@01 root@16@01) $Perm.Write $Perm.No)
    (ite (= n$3@51@01 vroot@3@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(n$3@51@01 in graph@31@01 && Lookup(r, sm@52@01, n$3@51@01) != Null)]
(assert (not
  (and
    (Set_in n$3@51@01 graph@31@01)
    (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@30@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@30@01  $FVF<r>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@15@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@15@01  $FVF<r>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (=>
  (and
    (Set_in n$3@51@01 graph@31@01)
    (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))
  (and
    (Set_in n$3@51@01 graph@31@01)
    (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null))
    ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$3@51@01 graph@31@01)
      (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null))))
  (and
    (Set_in n$3@51@01 graph@31@01)
    (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@16@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@30@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@30@01  $FVF<r>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r vroot@3@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) r)
      ($FVF.lookup_r (as sm@15@01  $FVF<r>) r)))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r (as sm@15@01  $FVF<r>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
  :pattern (($FVF.lookup_r (as sm@52@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_r (as pm@53@01  $FPM) r)
    (+
      (ite (= r root@16@01) $Perm.Write $Perm.No)
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_r (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
  :pattern (($FVF.perm_r (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef22|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$3@51@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@51@01 graph@31@01)
      (and
        (Set_in n$3@51@01 graph@31@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01)))
    (or (Set_in n$3@51@01 graph@31@01) (not (Set_in n$3@51@01 graph@31@01)))
    (=>
      (and
        (Set_in n$3@51@01 graph@31@01)
        (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))
      (and
        (Set_in n$3@51@01 graph@31@01)
        (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null))
        ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01)))
    (or
      (not
        (and
          (Set_in n$3@51@01 graph@31@01)
          (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null))))
      (and
        (Set_in n$3@51@01 graph@31@01)
        (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) graph@31@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@45@12@45@24-aux|)))
(assert (forall ((n$3@51@01 $Ref)) (!
  (and
    (=>
      (Set_in n$3@51@01 graph@31@01)
      (and
        (Set_in n$3@51@01 graph@31@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01)))
    (or (Set_in n$3@51@01 graph@31@01) (not (Set_in n$3@51@01 graph@31@01)))
    (=>
      (and
        (Set_in n$3@51@01 graph@31@01)
        (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))
      (and
        (Set_in n$3@51@01 graph@31@01)
        (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null))
        ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01)))
    (or
      (not
        (and
          (Set_in n$3@51@01 graph@31@01)
          (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null))))
      (and
        (Set_in n$3@51@01 graph@31@01)
        (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))))
  :pattern ((Set_in n$3@51@01 graph@31@01) ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@45@12@45@24-aux|)))
(push) ; 3
(assert (not (forall ((n$3@51@01 $Ref)) (!
  (=>
    (and
      (Set_in n$3@51@01 graph@31@01)
      (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))
    (Set_in ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) graph@31@01))
  :pattern ((Set_in ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) graph@31@01))
  :pattern ((Set_in n$3@51@01 graph@31@01) ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@45@12@45@24|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$3@51@01 $Ref)) (!
  (=>
    (and
      (Set_in n$3@51@01 graph@31@01)
      (not (= ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) $Ref.null)))
    (Set_in ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) graph@31@01))
  :pattern ((Set_in ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) graph@31@01))
  :pattern ((Set_in n$3@51@01 graph@31@01) ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n$3@51@01) n$3@51@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@45@12@45@24|)))
; [exec]
; assert (root in graph)
; [eval] (root in graph)
(push) ; 3
(assert (not (Set_in root@16@01 graph@31@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in root@16@01 graph@31@01))
; [exec]
; inhale (forall n: Ref ::
;     { (n in graph) }
;     { lookup(n) }
;     { purify_node(n) }
;     (n in graph) ==> lookup(n) == purify_node(n))
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 $Snap.unit))
; [eval] (forall n: Ref :: { (n in graph) } { lookup(n) } { purify_node(n) } (n in graph) ==> lookup(n) == purify_node(n))
(declare-const n@55@01 $Ref)
(push) ; 3
; [eval] (n in graph) ==> lookup(n) == purify_node(n)
; [eval] (n in graph)
(push) ; 4
; [then-branch: 4 | n@55@01 in graph@31@01 | live]
; [else-branch: 4 | !(n@55@01 in graph@31@01) | live]
(push) ; 5
; [then-branch: 4 | n@55@01 in graph@31@01]
(assert (Set_in n@55@01 graph@31@01))
; [eval] lookup(n) == purify_node(n)
; [eval] lookup(n)
; [eval] purify_node(n)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= root@16@01 n@55@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= vroot@3@01 n@55@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@56@01 ((r $Ref) (n@55@01 $Ref)) $Perm
  (ite
    (= r n@55@01)
    ($Perm.min (ite (= r root@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@57@01 ((r $Ref) (n@55@01 $Ref)) $Perm
  (ite
    (= r n@55@01)
    ($Perm.min
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@56@01 r n@55@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@56@01 root@16@01 n@55@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@56@01 r n@55@01) $Perm.No)
  
  :qid |quant-u-38|))))
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
  (=> (= r n@55@01) (= (- $Perm.Write (pTaken@56@01 r n@55@01)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@57@01 vroot@3@01 n@55@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@57@01 r n@55@01) $Perm.No)
  
  :qid |quant-u-41|))))
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
    (= r n@55@01)
    (=
      (- (- $Perm.Write (pTaken@56@01 r n@55@01)) (pTaken@57@01 r n@55@01))
      $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= n@55@01 root@16@01)
  (=
    ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
    ($FVF.lookup_m (as sm@18@01  $FVF<m>) n@55@01))))
(assert (=>
  (= n@55@01 vroot@3@01)
  (=
    ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
    ($FVF.lookup_m (as sm@5@01  $FVF<m>) n@55@01))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n@55@01) n@55@01))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= root@16@01 n@55@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= vroot@3@01 n@55@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((r $Ref) (n@55@01 $Ref)) $Perm
  (ite
    (= r n@55@01)
    ($Perm.min (ite (= r root@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@59@01 ((r $Ref) (n@55@01 $Ref)) $Perm
  (ite
    (= r n@55@01)
    ($Perm.min
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@58@01 r n@55@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@58@01 root@16@01 n@55@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@58@01 r n@55@01) $Perm.No)
  
  :qid |quant-u-45|))))
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
  (=> (= r n@55@01) (= (- $Perm.Write (pTaken@58@01 r n@55@01)) $Perm.No))
  
  :qid |quant-u-46|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@59@01 vroot@3@01 n@55@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@59@01 r n@55@01) $Perm.No)
  
  :qid |quant-u-48|))))
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
    (= r n@55@01)
    (=
      (- (- $Perm.Write (pTaken@58@01 r n@55@01)) (pTaken@59@01 r n@55@01))
      $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@60@01 $FVF<l>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= n@55@01 root@16@01)
  (=
    ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
    ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01))))
(assert (=>
  (= n@55@01 vroot@3@01)
  (=
    ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
    ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01))))
(assert (and
  ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01) n@55@01)
  ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01) n@55@01)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01) n@55@01))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= root@16@01 n@55@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= vroot@3@01 n@55@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@61@01 ((r $Ref) (n@55@01 $Ref)) $Perm
  (ite
    (= r n@55@01)
    ($Perm.min (ite (= r root@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@62@01 ((r $Ref) (n@55@01 $Ref)) $Perm
  (ite
    (= r n@55@01)
    ($Perm.min
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@61@01 r n@55@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@61@01 root@16@01 n@55@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@61@01 r n@55@01) $Perm.No)
  
  :qid |quant-u-52|))))
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
  (=> (= r n@55@01) (= (- $Perm.Write (pTaken@61@01 r n@55@01)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@62@01 vroot@3@01 n@55@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@62@01 r n@55@01) $Perm.No)
  
  :qid |quant-u-55|))))
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
    (= r n@55@01)
    (=
      (- (- $Perm.Write (pTaken@61@01 r n@55@01)) (pTaken@62@01 r n@55@01))
      $Perm.No))
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= n@55@01 root@16@01)
  (=
    ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
    ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01))))
(assert (=>
  (= n@55@01 vroot@3@01)
  (=
    ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
    ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01))))
(assert (and
  ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01) n@55@01)
  ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01) n@55@01)))
(assert (purify_node%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (= n@55@01 root@16@01)
    (=
      ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
      ($FVF.lookup_m (as sm@18@01  $FVF<m>) n@55@01)))
  (=>
    (= n@55@01 vroot@3@01)
    (=
      ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
      ($FVF.lookup_m (as sm@5@01  $FVF<m>) n@55@01)))
  ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n@55@01) n@55@01)
  (=>
    (= n@55@01 root@16@01)
    (=
      ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
      ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01)))
  (=>
    (= n@55@01 vroot@3@01)
    (=
      ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
      ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01)))
  ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01) n@55@01)
  ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01) n@55@01)
  ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01) n@55@01)
  (=>
    (= n@55@01 root@16@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
      ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01)))
  (=>
    (= n@55@01 vroot@3@01)
    (=
      ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
      ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01)))
  ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01) n@55@01)
  ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01) n@55@01)
  (purify_node%precondition ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | !(n@55@01 in graph@31@01)]
(assert (not (Set_in n@55@01 graph@31@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in n@55@01 graph@31@01)
  (and
    (Set_in n@55@01 graph@31@01)
    (=>
      (= n@55@01 root@16@01)
      (=
        ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
        ($FVF.lookup_m (as sm@18@01  $FVF<m>) n@55@01)))
    (=>
      (= n@55@01 vroot@3@01)
      (=
        ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
        ($FVF.lookup_m (as sm@5@01  $FVF<m>) n@55@01)))
    ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n@55@01) n@55@01)
    (=>
      (= n@55@01 root@16@01)
      (=
        ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
        ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01)))
    (=>
      (= n@55@01 vroot@3@01)
      (=
        ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
        ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01)))
    ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01) n@55@01)
    ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01) n@55@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01) n@55@01)
    (=>
      (= n@55@01 root@16@01)
      (=
        ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
        ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01)))
    (=>
      (= n@55@01 vroot@3@01)
      (=
        ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
        ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01)))
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01) n@55@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01) n@55@01)
    (purify_node%precondition ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01))))
; Joined path conditions
(assert (or (not (Set_in n@55@01 graph@31@01)) (Set_in n@55@01 graph@31@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@55@01 $Ref)) (!
  (and
    (=>
      (Set_in n@55@01 graph@31@01)
      (and
        (Set_in n@55@01 graph@31@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
            ($FVF.lookup_m (as sm@18@01  $FVF<m>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
            ($FVF.lookup_m (as sm@5@01  $FVF<m>) n@55@01)))
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n@55@01) n@55@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
            ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
            ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01)))
        ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01) n@55@01)
        ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01) n@55@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01) n@55@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
            ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
            ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01)))
        ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01) n@55@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01) n@55@01)
        (purify_node%precondition ($Snap.combine
          ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01)))
    (or (not (Set_in n@55@01 graph@31@01)) (Set_in n@55@01 graph@31@01)))
  :pattern ((Set_in n@55@01 graph@31@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@47@12@47@71-aux|)))
(assert (forall ((n@55@01 $Ref)) (!
  (and
    (=>
      (Set_in n@55@01 graph@31@01)
      (and
        (Set_in n@55@01 graph@31@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
            ($FVF.lookup_m (as sm@18@01  $FVF<m>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
            ($FVF.lookup_m (as sm@5@01  $FVF<m>) n@55@01)))
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n@55@01) n@55@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
            ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
            ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01)))
        ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01) n@55@01)
        ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01) n@55@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01) n@55@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
            ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
            ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01)))
        ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01) n@55@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01) n@55@01)
        (purify_node%precondition ($Snap.combine
          ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01)))
    (or (not (Set_in n@55@01 graph@31@01)) (Set_in n@55@01 graph@31@01)))
  :pattern ((lookup<Node> n@55@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@47@12@47@71-aux|)))
(assert (forall ((n@55@01 $Ref)) (!
  (and
    (=>
      (Set_in n@55@01 graph@31@01)
      (and
        (Set_in n@55@01 graph@31@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
            ($FVF.lookup_m (as sm@18@01  $FVF<m>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01)
            ($FVF.lookup_m (as sm@5@01  $FVF<m>) n@55@01)))
        ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) n@55@01) n@55@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
            ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01)
            ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01)))
        ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) n@55@01) n@55@01)
        ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) n@55@01) n@55@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01) n@55@01)
        (=>
          (= n@55@01 root@16@01)
          (=
            ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
            ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01)))
        (=>
          (= n@55@01 vroot@3@01)
          (=
            ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)
            ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01)))
        ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) n@55@01) n@55@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) n@55@01) n@55@01)
        (purify_node%precondition ($Snap.combine
          ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01)))
    (or (not (Set_in n@55@01 graph@31@01)) (Set_in n@55@01 graph@31@01)))
  :pattern ((purify_node%limited ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@47@12@47@71-aux|)))
(assert (forall ((n@55@01 $Ref)) (!
  (=>
    (Set_in n@55@01 graph@31@01)
    (=
      (lookup<Node> n@55@01)
      (purify_node ($Snap.combine
        ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01)))
  :pattern ((Set_in n@55@01 graph@31@01))
  :pattern ((lookup<Node> n@55@01))
  :pattern ((purify_node%limited ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_m (as sm@49@01  $FVF<m>) n@55@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_l (as sm@60@01  $FVF<l>) n@55@01))
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_r (as sm@52@01  $FVF<r>) n@55@01)))) n@55@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0242b.vpr@47@12@47@71|)))
; State saturation: after inhale
(set-option :timeout 20)
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
(assert (not (= root@16@01 vroot@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= vroot@3@01 root@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= root@16@01 vroot@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_m (as sm@18@01  $FVF<m>) root@16@01)
    ($FVF.lookup_m (as sm@5@01  $FVF<m>) vroot@3@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_m (as sm@5@01  $FVF<m>) vroot@3@01)
    ($FVF.lookup_m (as sm@18@01  $FVF<m>) root@16@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_l (as sm@12@01  $FVF<l>) vroot@3@01)
    ($FVF.lookup_l (as sm@26@01  $FVF<l>) root@16@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_l (as sm@26@01  $FVF<l>) root@16@01)
    ($FVF.lookup_l (as sm@12@01  $FVF<l>) vroot@3@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_r (as sm@30@01  $FVF<r>) root@16@01)
    ($FVF.lookup_r (as sm@15@01  $FVF<r>) vroot@3@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_r (as sm@15@01  $FVF<r>) vroot@3@01)
    ($FVF.lookup_r (as sm@30@01  $FVF<r>) root@16@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= root@16@01 vroot@3@01)) (not (= vroot@3@01 root@16@01)))
  (and (not (= vroot@3@01 root@16@01)) (not (= root@16@01 vroot@3@01)))))
; Definitional axioms for snapshot map values
(declare-const pm@63@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_m (as pm@63@01  $FPM) r)
    (+
      (ite (= r root@16@01) $Perm.Write $Perm.No)
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_m (as pm@63@01  $FPM) r))
  :qid |qp.resPrmSumDef26|)))
(assert (<= ($FVF.perm_m (as pm@63@01  $FPM) root@16@01) $Perm.Write))
(assert (<= ($FVF.perm_m (as pm@63@01  $FPM) vroot@3@01) $Perm.Write))
; Definitional axioms for snapshot map values
(declare-const pm@64@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_l (as pm@64@01  $FPM) r)
    (+
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)
      (ite (= r root@16@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_l (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) r) r)
    ($FVF.loc_l ($FVF.lookup_l (as sm@12@01  $FVF<l>) r) r)
    ($FVF.loc_l ($FVF.lookup_l (as sm@26@01  $FVF<l>) r) r))
  :pattern (($FVF.perm_l (as pm@64@01  $FPM) r))
  :qid |qp.resTrgDef28|)))
; Assume upper permission bound for field l
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_l (as pm@64@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_l ($FVF.lookup_l (as sm@35@01  $FVF<l>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@65@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_r (as pm@65@01  $FPM) r)
    (+
      (ite (= r root@16@01) $Perm.Write $Perm.No)
      (ite (= r vroot@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_r (as pm@65@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@30@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r (as sm@15@01  $FVF<r>) r) r))
  :pattern (($FVF.perm_r (as pm@65@01  $FPM) r))
  :qid |qp.resTrgDef30|)))
; Assume upper permission bound for field r
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_r (as pm@65@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@52@01  $FVF<r>) r) r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
