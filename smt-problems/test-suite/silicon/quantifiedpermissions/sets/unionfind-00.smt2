(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:47
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr
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
(declare-sort Set<Set<$Ref>> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<parent> 0)
(declare-sort $FVF<nodes> 0)
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
(declare-fun $SortWrappers.Set<Set<$Ref>>To$Snap (Set<Set<$Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<$Ref>> ($Snap) Set<Set<$Ref>>)
(assert (forall ((x Set<Set<$Ref>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<$Ref>>($SortWrappers.Set<Set<$Ref>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<$Ref>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<$Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<$Ref>>To$Snap($SortWrappers.$SnapToSet<Set<$Ref>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<$Ref>> x))
    :qid |$Snap.Set<Set<$Ref>>To$SnapToSet<Set<$Ref>>|
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
(declare-fun $SortWrappers.$FVF<parent>To$Snap ($FVF<parent>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<parent> ($Snap) $FVF<parent>)
(assert (forall ((x $FVF<parent>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<parent>($SortWrappers.$FVF<parent>To$Snap x)))
    :pattern (($SortWrappers.$FVF<parent>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<parent>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<parent>To$Snap($SortWrappers.$SnapTo$FVF<parent> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<parent> x))
    :qid |$Snap.$FVF<parent>To$SnapTo$FVF<parent>|
    )))
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
(declare-fun Set_card (Set<Set<$Ref>>) Int)
(declare-const Set_empty Set<Set<$Ref>>)
(declare-fun Set_in (Set<$Ref> Set<Set<$Ref>>) Bool)
(declare-fun Set_singleton (Set<$Ref>) Set<Set<$Ref>>)
(declare-fun Set_unionone (Set<Set<$Ref>> Set<$Ref>) Set<Set<$Ref>>)
(declare-fun Set_union (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_intersection (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_difference (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_subset (Set<Set<$Ref>> Set<Set<$Ref>>) Bool)
(declare-fun Set_equal (Set<Set<$Ref>> Set<Set<$Ref>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<$Ref>> Set<Set<$Ref>>) Set<$Ref>)
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
; /field_value_functions_declarations.smt2 [parent: Ref]
(declare-fun $FVF.domain_parent ($FVF<parent>) Set<$Ref>)
(declare-fun $FVF.lookup_parent ($FVF<parent> $Ref) $Ref)
(declare-fun $FVF.after_parent ($FVF<parent> $FVF<parent>) Bool)
(declare-fun $FVF.loc_parent ($Ref $Ref) Bool)
(declare-fun $FVF.perm_parent ($FPM $Ref) $Perm)
(declare-const $fvfTOP_parent $FVF<parent>)
; /field_value_functions_declarations.smt2 [nodes: Set[Ref]]
(declare-fun $FVF.domain_nodes ($FVF<nodes>) Set<$Ref>)
(declare-fun $FVF.lookup_nodes ($FVF<nodes> $Ref) Set<$Ref>)
(declare-fun $FVF.after_nodes ($FVF<nodes> $FVF<nodes>) Bool)
(declare-fun $FVF.loc_nodes (Set<$Ref> $Ref) Bool)
(declare-fun $FVF.perm_nodes ($FPM $Ref) $Perm)
(declare-const $fvfTOP_nodes $FVF<nodes>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun allNodes ($Snap $Ref) Set<$Ref>)
(declare-fun allNodes%limited ($Snap $Ref) Set<$Ref>)
(declare-fun allNodes%stateless ($Ref) Bool)
(declare-fun allNodes%precondition ($Snap $Ref) Bool)
(declare-fun find ($Snap $Ref $Ref) $Ref)
(declare-fun find%limited ($Snap $Ref $Ref) $Ref)
(declare-fun find%stateless ($Ref $Ref) Bool)
(declare-fun find%precondition ($Snap $Ref $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun inv%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s Set<Set<$Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<$Ref>)) (!
  (not (Set_in o (as Set_empty  Set<Set<$Ref>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<$Ref>>)))
  )))
(assert (forall ((s Set<Set<$Ref>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<$Ref>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Set<$Ref>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<$Ref>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<$Ref>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<$Ref>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>) (y Set<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
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
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<$Ref>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
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
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
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
; /field_value_functions_axioms.smt2 [parent: Ref]
(assert (forall ((vs $FVF<parent>) (ws $FVF<parent>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_parent vs) ($FVF.domain_parent ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_parent vs))
            (= ($FVF.lookup_parent vs x) ($FVF.lookup_parent ws x)))
          :pattern (($FVF.lookup_parent vs x) ($FVF.lookup_parent ws x))
          :qid |qp.$FVF<parent>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<parent>To$Snap vs)
              ($SortWrappers.$FVF<parent>To$Snap ws)
              )
    :qid |qp.$FVF<parent>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_parent pm r))
    :pattern (($FVF.perm_parent pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_parent f r) true)
    :pattern (($FVF.loc_parent f r)))))
; /field_value_functions_axioms.smt2 [nodes: Set[Ref]]
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
(assert (forall ((r $Ref) (f Set<$Ref>)) (!
    (= ($FVF.loc_nodes f r) true)
    :pattern (($FVF.loc_nodes f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(declare-fun inv@9@00 ($Snap $Ref $Ref) $Ref)
(declare-fun img@10@00 ($Snap $Ref $Ref) Bool)
(declare-fun $k@12@00 () $Perm)
(declare-fun $k@13@00 () $Perm)
(declare-fun $k@15@00 () $Perm)
(declare-fun $k@16@00 () $Perm)
(declare-fun $k@17@00 () $Perm)
(declare-fun $k@22@00 () $Perm)
(declare-fun $k@23@00 () $Perm)
(declare-fun $k@24@00 () $Perm)
(declare-fun inv@19@00 ($Snap $Ref $Ref $Ref) $Ref)
(declare-fun img@20@00 ($Snap $Ref $Ref $Ref) Bool)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (allNodes%limited s@$ this@0@00) (allNodes s@$ this@0@00))
  :pattern ((allNodes s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (allNodes%stateless this@0@00)
  :pattern ((allNodes%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    (forall ((n@8@00 $Ref)) (!
      (=>
        (and
          (Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
          (< $Perm.No $k@6@00))
        (and
          (= (inv@9@00 s@$ this@0@00 n@8@00) n@8@00)
          (img@10@00 s@$ this@0@00 n@8@00)))
      :pattern ((Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
      :pattern ((inv@9@00 s@$ this@0@00 n@8@00))
      :pattern ((img@10@00 s@$ this@0@00 n@8@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@10@00 s@$ this@0@00 r)
          (and
            (Set_in (inv@9@00 s@$ this@0@00 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
            (< $Perm.No $k@6@00)))
        (= (inv@9@00 s@$ this@0@00 r) r))
      :pattern ((inv@9@00 s@$ this@0@00 r))
      :qid |parent-fctOfInv|))
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    (=>
      (allNodes%precondition s@$ this@0@00)
      (=
        (allNodes s@$ this@0@00)
        ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))))
  :pattern ((allNodes s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((allNodes s@$ this@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (struct@2@00 $Ref) (this@3@00 $Ref)) (!
  (= (find%limited s@$ struct@2@00 this@3@00) (find s@$ struct@2@00 this@3@00))
  :pattern ((find s@$ struct@2@00 this@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (struct@2@00 $Ref) (this@3@00 $Ref)) (!
  (find%stateless struct@2@00 this@3@00)
  :pattern ((find%limited s@$ struct@2@00 this@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (struct@2@00 $Ref) (this@3@00 $Ref)) (!
  (let ((result@4@00 (find%limited s@$ struct@2@00 this@3@00))) (and
    ($Perm.isReadVar $k@12@00)
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@15@00)
    (=>
      (find%precondition s@$ struct@2@00 this@3@00)
      (and
        (not (= result@4@00 $Ref.null))
        (Set_in result@4@00 (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))))))
  :pattern ((find%limited s@$ struct@2@00 this@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (struct@2@00 $Ref) (this@3@00 $Ref)) (!
  (let ((result@4@00 (find%limited s@$ struct@2@00 this@3@00))) true)
  :pattern ((find%limited s@$ struct@2@00 this@3@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (struct@2@00 $Ref) (this@3@00 $Ref)) (!
  (let ((result@4@00 (find%limited s@$ struct@2@00 this@3@00))) (=>
    (find%precondition s@$ struct@2@00 this@3@00)
    (allNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00)))
  :pattern ((find%limited s@$ struct@2@00 this@3@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (struct@2@00 $Ref) (this@3@00 $Ref)) (!
  (and
    (forall ((n@18@00 $Ref)) (!
      (=>
        (and
          (Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (< $Perm.No $k@16@00))
        (and
          (= (inv@19@00 s@$ struct@2@00 this@3@00 n@18@00) n@18@00)
          (img@20@00 s@$ struct@2@00 this@3@00 n@18@00)))
      :pattern ((Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 n@18@00))
      :pattern ((img@20@00 s@$ struct@2@00 this@3@00 n@18@00))
      :qid |quant-u-12|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@20@00 s@$ struct@2@00 this@3@00 r)
          (and
            (Set_in (inv@19@00 s@$ struct@2@00 this@3@00 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (< $Perm.No $k@16@00)))
        (= (inv@19@00 s@$ struct@2@00 this@3@00 r) r))
      :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 r))
      :qid |parent-fctOfInv|))
    ($Perm.isReadVar $k@12@00)
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@16@00)
    ($Perm.isReadVar $k@17@00)
    ($Perm.isReadVar $k@22@00)
    ($Perm.isReadVar $k@23@00)
    ($Perm.isReadVar $k@24@00)
    (=>
      (find%precondition s@$ struct@2@00 this@3@00)
      (=
        (find s@$ struct@2@00 this@3@00)
        (ite
          (=
            this@3@00
            ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))
          this@3@00
          (find%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                $Snap.unit))) struct@2@00 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))))))
  :pattern ((find s@$ struct@2@00 this@3@00))
  :pattern ((find%stateless struct@2@00 this@3@00) (inv%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (struct@2@00 $Ref) (this@3@00 $Ref)) (!
  (=>
    (find%precondition s@$ struct@2@00 this@3@00)
    (ite
      (=
        this@3@00
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))
      true
      (find%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            $Snap.unit))) struct@2@00 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))))
  :pattern ((find s@$ struct@2@00 this@3@00))
  :qid |quant-u-14|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- add ----------
(declare-const struct@0@01 $Ref)
(declare-const this@1@01 $Ref)
(declare-const struct@2@01 $Ref)
(declare-const this@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const sm@5@01 $FVF<parent>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_parent (as sm@5@01  $FVF<parent>) this@3@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01))))
(assert (not (= this@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] this.parent == null
(assert (= ($FVF.lookup_parent (as sm@5@01  $FVF<parent>) this@3@01) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] struct != null
(assert (not (= struct@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] allNodes(struct) == (old(allNodes(struct)) union Set(this))
; [eval] allNodes(struct)
(push) ; 3
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (< $k@7@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@7@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (allNodes%precondition ($Snap.first $t@6@01) struct@2@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@7@01))
(assert (and
  (< $k@7@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@7@01))
  (allNodes%precondition ($Snap.first $t@6@01) struct@2@01)))
; [eval] (old(allNodes(struct)) union Set(this))
; [eval] old(allNodes(struct))
; [eval] allNodes(struct)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (< $k@8@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@8@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (allNodes%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) struct@2@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@8@01))
(assert (and
  (< $k@8@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@8@01))
  (allNodes%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) struct@2@01)))
; [eval] Set(this)
(assert (Set_equal (allNodes ($Snap.first $t@6@01) struct@2@01) (Set_union (allNodes ($Snap.second ($Snap.second ($Snap.second $t@4@01))) struct@2@01) (Set_singleton this@3@01))))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] this == find(struct, this)
; [eval] find(struct, this)
(set-option :timeout 0)
(push) ; 3
; [eval] struct != null
; [eval] this != null
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (< $k@9@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@9@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (this in allNodes(struct))
; [eval] allNodes(struct)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(assert (< $k@10@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@10@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@10@01))
(assert (and (< $k@10@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@10@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (Set_in this@3@01 (allNodes ($Snap.first $t@6@01) struct@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Set_in this@3@01 (allNodes ($Snap.first $t@6@01) struct@2@01)))
(assert (find%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine ($Snap.first $t@6@01) $Snap.unit))) struct@2@01 this@3@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@9@01))
(assert ($Perm.isReadVar $k@10@01))
(assert (and
  (< $k@9@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@9@01))
  (< $k@10@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@10@01))
  (Set_in this@3@01 (allNodes ($Snap.first $t@6@01) struct@2@01))
  (find%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine ($Snap.first $t@6@01) $Snap.unit))) struct@2@01 this@3@01)))
(assert (=
  this@3@01
  (find ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine ($Snap.first $t@6@01) $Snap.unit))) struct@2@01 this@3@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] (forall o: Ref :: { (o in old(allNodes(struct))) } { old(find(struct, o)) } (o in old(allNodes(struct))) ==> find(struct, o) == old(find(struct, o)))
(declare-const o@11@01 $Ref)
(push) ; 3
; [eval] (o in old(allNodes(struct))) ==> find(struct, o) == old(find(struct, o))
; [eval] (o in old(allNodes(struct)))
; [eval] old(allNodes(struct))
; [eval] allNodes(struct)
(push) ; 4
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(assert (< $k@12@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@12@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@12@01))
(assert (and (< $k@12@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@12@01))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | o@11@01 in allNodes(Second:(Second:(Second:($t@4@01))), struct@2@01) | live]
; [else-branch: 0 | !(o@11@01 in allNodes(Second:(Second:(Second:($t@4@01))), struct@2@01)) | live]
(push) ; 5
; [then-branch: 0 | o@11@01 in allNodes(Second:(Second:(Second:($t@4@01))), struct@2@01)]
(assert (Set_in o@11@01 (allNodes ($Snap.second ($Snap.second ($Snap.second $t@4@01))) struct@2@01)))
; [eval] find(struct, o) == old(find(struct, o))
; [eval] find(struct, o)
(push) ; 6
; [eval] struct != null
; [eval] this != null
(push) ; 7
(assert (not (not (= o@11@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != null
(set-option :timeout 0)
(push) ; 7
(assert (not (not (= o@11@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != null
(set-option :timeout 0)
(push) ; 7
(assert (not (not (= o@11@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != null
(set-option :timeout 0)
(push) ; 7
(assert (not (not (= o@11@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- unionn ----------
(declare-const struct@13@01 $Ref)
(declare-const this@14@01 $Ref)
(declare-const other@15@01 $Ref)
(declare-const struct@16@01 $Ref)
(declare-const this@17@01 $Ref)
(declare-const other@18@01 $Ref)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
; [eval] struct != null
(assert (not (= struct@16@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] this != null
(assert (not (= this@17@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  $Snap.unit))
; [eval] (this in allNodes(struct))
; [eval] allNodes(struct)
(push) ; 2
(declare-const $k@20@01 $Perm)
(assert ($Perm.isReadVar $k@20@01))
(assert (< $k@20@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@20@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (allNodes%precondition ($Snap.first ($Snap.second $t@19@01)) struct@16@01))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@20@01))
(assert (and
  (< $k@20@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@20@01))
  (allNodes%precondition ($Snap.first ($Snap.second $t@19@01)) struct@16@01)))
(assert (Set_in this@17@01 (allNodes ($Snap.first ($Snap.second $t@19@01)) struct@16@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; [eval] other != null
(assert (not (= other@18@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; [eval] (other in allNodes(struct))
; [eval] allNodes(struct)
(set-option :timeout 0)
(push) ; 2
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
(assert (< $k@21@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@21@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@21@01))
(assert (and (< $k@21@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@21@01))))
(assert (Set_in other@18@01 (allNodes ($Snap.first ($Snap.second $t@19@01)) struct@16@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (= ($Snap.first ($Snap.second $t@22@01)) $Snap.unit))
; [eval] allNodes(struct) == old(allNodes(struct))
; [eval] allNodes(struct)
(push) ; 3
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(assert (< $k@23@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@23@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (allNodes%precondition ($Snap.first $t@22@01) struct@16@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@23@01))
(assert (and
  (< $k@23@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@23@01))
  (allNodes%precondition ($Snap.first $t@22@01) struct@16@01)))
; [eval] old(allNodes(struct))
; [eval] allNodes(struct)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(assert (< $k@24@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@24@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@24@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@24@01))
(assert (and (< $k@24@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@24@01))))
(assert (Set_equal (allNodes ($Snap.first $t@22@01) struct@16@01) (allNodes ($Snap.first ($Snap.second $t@19@01)) struct@16@01)))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@22@01))) $Snap.unit))
; [eval] (forall p: Ref, q: Ref :: { (p in allNodes(struct)), (q in allNodes(struct)) } { (p in allNodes(struct)), old(find(struct, q)) } { (p in allNodes(struct)), find(struct, q) } { (q in allNodes(struct)), old(find(struct, p)) } { (q in allNodes(struct)), find(struct, p) } { old(find(struct, p)), old(find(struct, q)) } { old(find(struct, p)), find(struct, q) } { old(find(struct, q)), find(struct, p) } (p in allNodes(struct)) && ((q in allNodes(struct)) && old(find(struct, p) == find(struct, q))) ==> find(struct, p) == find(struct, q))
(declare-const p@25@01 $Ref)
(declare-const q@26@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (p in allNodes(struct)) && ((q in allNodes(struct)) && old(find(struct, p) == find(struct, q))) ==> find(struct, p) == find(struct, q)
; [eval] (p in allNodes(struct)) && ((q in allNodes(struct)) && old(find(struct, p) == find(struct, q)))
; [eval] (p in allNodes(struct))
; [eval] allNodes(struct)
(push) ; 4
(declare-const $k@27@01 $Perm)
(assert ($Perm.isReadVar $k@27@01))
(assert (< $k@27@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@27@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@27@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@27@01))
(assert (and (< $k@27@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@27@01))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | !(p@25@01 in allNodes(First:($t@22@01), struct@16@01)) | live]
; [else-branch: 1 | p@25@01 in allNodes(First:($t@22@01), struct@16@01) | live]
(push) ; 5
; [then-branch: 1 | !(p@25@01 in allNodes(First:($t@22@01), struct@16@01))]
(assert (not (Set_in p@25@01 (allNodes ($Snap.first $t@22@01) struct@16@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | p@25@01 in allNodes(First:($t@22@01), struct@16@01)]
(assert (Set_in p@25@01 (allNodes ($Snap.first $t@22@01) struct@16@01)))
; [eval] (q in allNodes(struct))
; [eval] allNodes(struct)
(push) ; 6
(declare-const $k@28@01 $Perm)
(assert ($Perm.isReadVar $k@28@01))
(assert (< $k@28@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@28@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@28@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@28@01))
(assert (and (< $k@28@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@28@01))))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | !(q@26@01 in allNodes(First:($t@22@01), struct@16@01)) | live]
; [else-branch: 2 | q@26@01 in allNodes(First:($t@22@01), struct@16@01) | live]
(push) ; 7
; [then-branch: 2 | !(q@26@01 in allNodes(First:($t@22@01), struct@16@01))]
(assert (not (Set_in q@26@01 (allNodes ($Snap.first $t@22@01) struct@16@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | q@26@01 in allNodes(First:($t@22@01), struct@16@01)]
(assert (Set_in q@26@01 (allNodes ($Snap.first $t@22@01) struct@16@01)))
; [eval] old(find(struct, p) == find(struct, q))
; [eval] find(struct, p) == find(struct, q)
; [eval] find(struct, p)
(push) ; 8
; [eval] struct != null
; [eval] this != null
(push) ; 9
(assert (not (not (= p@25@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != null
(set-option :timeout 0)
(push) ; 9
(assert (not (not (= p@25@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != null
(set-option :timeout 0)
(push) ; 9
(assert (not (not (= p@25@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != null
(set-option :timeout 0)
(push) ; 9
(assert (not (not (= p@25@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
