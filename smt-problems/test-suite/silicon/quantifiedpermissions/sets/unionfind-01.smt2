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
; ---------- FUNCTION allNodes----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Set<$Ref>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $k@5@00 $Perm)
(assert ($Perm.isReadVar $k@5@00))
(assert (<= $Perm.No $k@5@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (allNodes%limited s@$ this@0@00) (allNodes s@$ this@0@00))
  :pattern ((allNodes s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (allNodes%stateless this@0@00)
  :pattern ((allNodes%limited s@$ this@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@5@00))
(assert (<= $Perm.No $k@5@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(inv(this), wildcard) in this.nodes)
(declare-const $k@6@00 $Perm)
(assert ($Perm.isReadVar $k@6@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@7@00 $Perm)
(assert ($Perm.isReadVar $k@7@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@5@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@7@00 $k@5@00))
(assert (<= $Perm.No (- $k@5@00 $k@7@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (inv%trigger s@$ this@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= $Perm.No $k@6@00))
(assert (<= $k@6@00 $Perm.Write))
(assert (=> (< $Perm.No $k@6@00) (not (= this@0@00 $Ref.null))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] !((null in this.nodes))
; [eval] (null in this.nodes)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_in $Ref.null ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(declare-const n@8@00 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n in this.nodes)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
(pop) ; 3
(declare-fun inv@9@00 ($Snap $Ref $Ref) $Ref)
(declare-fun img@10@00 ($Snap $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((n1@8@00 $Ref) (n2@8@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
      (Set_in n2@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
      (= n1@8@00 n2@8@00))
    (= n1@8@00 n2@8@00))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@8@00 $Ref)) (!
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
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@00 s@$ this@0@00 r)
      (and
        (Set_in (inv@9@00 s@$ this@0@00 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
        (< $Perm.No $k@6@00)))
    (= (inv@9@00 s@$ this@0@00 r) r))
  :pattern ((inv@9@00 s@$ this@0@00 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((n@8@00 $Ref)) (!
  (<= $Perm.No $k@6@00)
  :pattern ((Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :pattern ((inv@9@00 s@$ this@0@00 n@8@00))
  :pattern ((img@10@00 s@$ this@0@00 n@8@00))
  :qid |parent-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((n@8@00 $Ref)) (!
  (<= $k@6@00 $Perm.Write)
  :pattern ((Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :pattern ((inv@9@00 s@$ this@0@00 n@8@00))
  :pattern ((img@10@00 s@$ this@0@00 n@8@00))
  :qid |parent-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((n@8@00 $Ref)) (!
  (=>
    (and
      (Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
      (< $Perm.No $k@6@00))
    (not (= n@8@00 $Ref.null)))
  :pattern ((Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :pattern ((inv@9@00 s@$ this@0@00 n@8@00))
  :pattern ((img@10@00 s@$ this@0@00 n@8@00))
  :qid |parent-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (forall q: Ref :: { (q in this.nodes) } { (q.parent in this.nodes) } (q in this.nodes) ==> (q.parent in this.nodes))
(declare-const q@11@00 $Ref)
(push) ; 3
; [eval] (q in this.nodes) ==> (q.parent in this.nodes)
; [eval] (q in this.nodes)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | q@11@00 in First:(s@$) | live]
; [else-branch: 0 | !(q@11@00 in First:(s@$)) | live]
(push) ; 5
; [then-branch: 0 | q@11@00 in First:(s@$)]
(assert (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
; [eval] (q.parent in this.nodes)
(push) ; 6
(assert (not (ite
  (and
    (img@10@00 s@$ this@0@00 q@11@00)
    (Set_in (inv@9@00 s@$ this@0@00 q@11@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  (< $Perm.No $k@6@00)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 0 | !(q@11@00 in First:(s@$))]
(assert (not (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((q@11@00 $Ref)) (!
  (or
    (not (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :pattern ((Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|)))
(assert (forall ((q@11@00 $Ref)) (!
  (or
    (not (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second s@$)))) q@11@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|)))
(assert (forall ((q@11@00 $Ref)) (!
  (=>
    (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
    (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second s@$)))) q@11@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :pattern ((Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second s@$)))) q@11@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@7@00))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@00 s@$ this@0@00 r)
      (and
        (Set_in (inv@9@00 s@$ this@0@00 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
        (< $Perm.No $k@6@00)))
    (= (inv@9@00 s@$ this@0@00 r) r))
  :pattern ((inv@9@00 s@$ this@0@00 r))
  :qid |parent-fctOfInv|)))
(assert (and
  (< $k@7@00 $k@5@00)
  (<= $Perm.No (- $k@5@00 $k@7@00))
  (inv%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (<= $Perm.No $k@6@00)
  (<= $k@6@00 $Perm.Write)
  (=> (< $Perm.No $k@6@00) (not (= this@0@00 $Ref.null)))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (= ($Snap.first ($Snap.second s@$)) $Snap.unit)
  (not (Set_in $Ref.null ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (and
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
  (forall ((n@8@00 $Ref)) (!
    (<= $Perm.No $k@6@00)
    :pattern ((Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :pattern ((inv@9@00 s@$ this@0@00 n@8@00))
    :pattern ((img@10@00 s@$ this@0@00 n@8@00))
    :qid |parent-permAtLeastZero|))
  (forall ((n@8@00 $Ref)) (!
    (<= $k@6@00 $Perm.Write)
    :pattern ((Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :pattern ((inv@9@00 s@$ this@0@00 n@8@00))
    :pattern ((img@10@00 s@$ this@0@00 n@8@00))
    :qid |parent-permAtMostOne|))
  (forall ((n@8@00 $Ref)) (!
    (=>
      (and
        (Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
        (< $Perm.No $k@6@00))
      (not (= n@8@00 $Ref.null)))
    :pattern ((Set_in n@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :pattern ((inv@9@00 s@$ this@0@00 n@8@00))
    :pattern ((img@10@00 s@$ this@0@00 n@8@00))
    :qid |parent-permImpliesNonNull|))
  (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (forall ((q@11@00 $Ref)) (!
    (or
      (not (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
      (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :pattern ((Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|))
  (forall ((q@11@00 $Ref)) (!
    (or
      (not (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
      (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second s@$)))) q@11@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|))
  (forall ((q@11@00 $Ref)) (!
    (=>
      (Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
      (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second s@$)))) q@11@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :pattern ((Set_in q@11@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second s@$)))) q@11@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66|))))
(assert (= result@1@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
(pop) ; 1
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
; ---------- FUNCTION find----------
(declare-fun struct@2@00 () $Ref)
(declare-fun this@3@00 () $Ref)
(declare-fun result@4@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] struct != null
(assert (not (= struct@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] this != null
(assert (not (= this@3@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(declare-const $k@12@00 $Perm)
(assert ($Perm.isReadVar $k@12@00))
(assert (<= $Perm.No $k@12@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (this in allNodes(struct))
; [eval] allNodes(struct)
(push) ; 2
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@12@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@13@00 $k@12@00))
(assert (<= $Perm.No (- $k@12@00 $k@13@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (allNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@13@00))
(assert (and
  (< $k@13@00 $k@12@00)
  (<= $Perm.No (- $k@12@00 $k@13@00))
  (allNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00)))
(assert (Set_in this@3@00 (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00)))
(declare-const $t@14@00 $Snap)
(assert (= $t@14@00 ($Snap.combine ($Snap.first $t@14@00) ($Snap.second $t@14@00))))
(assert (= ($Snap.first $t@14@00) $Snap.unit))
; [eval] result != null
(assert (not (= result@4@00 $Ref.null)))
(assert (= ($Snap.second $t@14@00) $Snap.unit))
; [eval] (result in allNodes(struct))
; [eval] allNodes(struct)
(set-option :timeout 0)
(push) ; 2
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@12@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@15@00 $k@12@00))
(assert (<= $Perm.No (- $k@12@00 $k@15@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@15@00))
(assert (and (< $k@15@00 $k@12@00) (<= $Perm.No (- $k@12@00 $k@15@00))))
(assert (Set_in result@4@00 (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert ($Perm.isReadVar $k@12@00))
(assert ($Perm.isReadVar $k@13@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= struct@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (not (= this@3@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (<= $Perm.No $k@12@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (< $k@13@00 $k@12@00))
(assert (<= $Perm.No (- $k@12@00 $k@13@00)))
(assert (allNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))
(assert (Set_in this@3@00 (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(inv(struct), wildcard) in (this == this.parent ? this : find(struct, this.parent)))
(declare-const $k@16@00 $Perm)
(assert ($Perm.isReadVar $k@16@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@17@00 $Perm)
(assert ($Perm.isReadVar $k@17@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@12@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@17@00 $k@12@00))
(assert (<= $Perm.No (- $k@12@00 $k@17@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (inv%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(assert (<= $Perm.No $k@16@00))
(assert (<= $k@16@00 $Perm.Write))
(assert (=> (< $Perm.No $k@16@00) (not (= struct@2@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] !((null in this.nodes))
; [eval] (null in this.nodes)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (Set_in $Ref.null ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(declare-const n@18@00 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n in this.nodes)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 3
(declare-fun inv@19@00 ($Snap $Ref $Ref $Ref) $Ref)
(declare-fun img@20@00 ($Snap $Ref $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((n1@18@00 $Ref) (n2@18@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (Set_in n2@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (= n1@18@00 n2@18@00))
    (= n1@18@00 n2@18@00))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@18@00 $Ref)) (!
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
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ struct@2@00 this@3@00 r)
      (and
        (Set_in (inv@19@00 s@$ struct@2@00 this@3@00 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (< $Perm.No $k@16@00)))
    (= (inv@19@00 s@$ struct@2@00 this@3@00 r) r))
  :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((n@18@00 $Ref)) (!
  (<= $Perm.No $k@16@00)
  :pattern ((Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 n@18@00))
  :pattern ((img@20@00 s@$ struct@2@00 this@3@00 n@18@00))
  :qid |parent-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((n@18@00 $Ref)) (!
  (<= $k@16@00 $Perm.Write)
  :pattern ((Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 n@18@00))
  :pattern ((img@20@00 s@$ struct@2@00 this@3@00 n@18@00))
  :qid |parent-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((n@18@00 $Ref)) (!
  (=>
    (and
      (Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (< $Perm.No $k@16@00))
    (not (= n@18@00 $Ref.null)))
  :pattern ((Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 n@18@00))
  :pattern ((img@20@00 s@$ struct@2@00 this@3@00 n@18@00))
  :qid |parent-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (forall q: Ref :: { (q in this.nodes) } { (q.parent in this.nodes) } (q in this.nodes) ==> (q.parent in this.nodes))
(declare-const q@21@00 $Ref)
(push) ; 3
; [eval] (q in this.nodes) ==> (q.parent in this.nodes)
; [eval] (q in this.nodes)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | q@21@00 in First:(First:(Second:(Second:(s@$)))) | live]
; [else-branch: 1 | !(q@21@00 in First:(First:(Second:(Second:(s@$))))) | live]
(push) ; 5
; [then-branch: 1 | q@21@00 in First:(First:(Second:(Second:(s@$))))]
(assert (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
; [eval] (q.parent in this.nodes)
(push) ; 6
(assert (not (ite
  (and
    (img@20@00 s@$ struct@2@00 this@3@00 q@21@00)
    (Set_in (inv@19@00 s@$ struct@2@00 this@3@00 q@21@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  (< $Perm.No $k@16@00)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | !(q@21@00 in First:(First:(Second:(Second:(s@$)))))]
(assert (not
  (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((q@21@00 $Ref)) (!
  (or
    (not
      (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|)))
(assert (forall ((q@21@00 $Ref)) (!
  (or
    (not
      (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) q@21@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|)))
(assert (forall ((q@21@00 $Ref)) (!
  (=>
    (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) q@21@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) q@21@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66|)))
; [eval] (this == this.parent ? this : find(struct, this.parent))
; [eval] this == this.parent
(push) ; 3
(assert (not (ite
  (and
    (img@20@00 s@$ struct@2@00 this@3@00 this@3@00)
    (Set_in (inv@19@00 s@$ struct@2@00 this@3@00 this@3@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  (< $Perm.No $k@16@00)
  false)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    this@3@00
    ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@3@00
  ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | this@3@00 == Lookup(parent, First:(Second:(Second:(First:(Second:(Second:(s@$)))))), this@3@00) | live]
; [else-branch: 2 | this@3@00 != Lookup(parent, First:(Second:(Second:(First:(Second:(Second:(s@$)))))), this@3@00) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | this@3@00 == Lookup(parent, First:(Second:(Second:(First:(Second:(Second:(s@$)))))), this@3@00)]
(assert (=
  this@3@00
  ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | this@3@00 != Lookup(parent, First:(Second:(Second:(First:(Second:(Second:(s@$)))))), this@3@00)]
(assert (not
  (=
    this@3@00
    ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))))
; [eval] find(struct, this.parent)
(push) ; 5
(assert (not (ite
  (and
    (img@20@00 s@$ struct@2@00 this@3@00 this@3@00)
    (Set_in (inv@19@00 s@$ struct@2@00 this@3@00 this@3@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  (< $Perm.No $k@16@00)
  false)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [eval] struct != null
; [eval] this != null
(push) ; 6
(assert (not (not
  (=
    ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)
    $Ref.null)))
(declare-const $k@22@00 $Perm)
(assert ($Perm.isReadVar $k@22@00))
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= (- $k@12@00 $k@17@00) $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< $k@22@00 (- $k@12@00 $k@17@00)))
(assert (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@22@00)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] (this in allNodes(struct))
; [eval] allNodes(struct)
(set-option :timeout 0)
(push) ; 6
(declare-const $k@23@00 $Perm)
(assert ($Perm.isReadVar $k@23@00))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (- $k@12@00 $k@17@00) $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< $k@23@00 (- $k@12@00 $k@17@00)))
(assert (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@23@00)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@23@00))
(assert (and
  (< $k@23@00 (- $k@12@00 $k@17@00))
  (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@23@00))))
(set-option :timeout 0)
(push) ; 6
(assert (not (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00) (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00) (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00)))
(assert (find%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))) struct@2@00 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@22@00))
(assert ($Perm.isReadVar $k@23@00))
(assert (and
  (not
    (=
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)
      $Ref.null))
  (< $k@22@00 (- $k@12@00 $k@17@00))
  (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@22@00))
  (< $k@23@00 (- $k@12@00 $k@17@00))
  (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@23@00))
  (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00) (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))
  (find%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))) struct@2@00 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@22@00))
(assert ($Perm.isReadVar $k@23@00))
(assert (=>
  (not
    (=
      this@3@00
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))
  (and
    (not
      (=
        this@3@00
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))
    (not
      (=
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)
        $Ref.null))
    (< $k@22@00 (- $k@12@00 $k@17@00))
    (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@22@00))
    (< $k@23@00 (- $k@12@00 $k@17@00))
    (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@23@00))
    (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00) (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))
    (find%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit))) struct@2@00 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))))
(assert (or
  (not
    (=
      this@3@00
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))
  (=
    this@3@00
    ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@17@00))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 s@$ struct@2@00 this@3@00 r)
      (and
        (Set_in (inv@19@00 s@$ struct@2@00 this@3@00 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (< $Perm.No $k@16@00)))
    (= (inv@19@00 s@$ struct@2@00 this@3@00 r) r))
  :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 r))
  :qid |parent-fctOfInv|)))
(assert ($Perm.isReadVar $k@22@00))
(assert ($Perm.isReadVar $k@23@00))
(assert (and
  (< $k@17@00 $k@12@00)
  (<= $Perm.No (- $k@12@00 $k@17@00))
  (inv%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00)
  (=
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (<= $Perm.No $k@16@00)
  (<= $k@16@00 $Perm.Write)
  (=> (< $Perm.No $k@16@00) (not (= struct@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (not
    (Set_in $Ref.null ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (and
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
  (forall ((n@18@00 $Ref)) (!
    (<= $Perm.No $k@16@00)
    :pattern ((Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 n@18@00))
    :pattern ((img@20@00 s@$ struct@2@00 this@3@00 n@18@00))
    :qid |parent-permAtLeastZero|))
  (forall ((n@18@00 $Ref)) (!
    (<= $k@16@00 $Perm.Write)
    :pattern ((Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 n@18@00))
    :pattern ((img@20@00 s@$ struct@2@00 this@3@00 n@18@00))
    :qid |parent-permAtMostOne|))
  (forall ((n@18@00 $Ref)) (!
    (=>
      (and
        (Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (< $Perm.No $k@16@00))
      (not (= n@18@00 $Ref.null)))
    :pattern ((Set_in n@18@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :pattern ((inv@19@00 s@$ struct@2@00 this@3@00 n@18@00))
    :pattern ((img@20@00 s@$ struct@2@00 this@3@00 n@18@00))
    :qid |parent-permImpliesNonNull|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (forall ((q@21@00 $Ref)) (!
    (or
      (not
        (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :pattern ((Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|))
  (forall ((q@21@00 $Ref)) (!
    (or
      (not
        (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) q@21@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|))
  (forall ((q@21@00 $Ref)) (!
    (=>
      (Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) q@21@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :pattern ((Set_in q@21@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) q@21@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66|))
  (=>
    (not
      (=
        this@3@00
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))
    (and
      (not
        (=
          this@3@00
          ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))
      (not
        (=
          ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)
          $Ref.null))
      (< $k@22@00 (- $k@12@00 $k@17@00))
      (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@22@00))
      (< $k@23@00 (- $k@12@00 $k@17@00))
      (<= $Perm.No (- (- $k@12@00 $k@17@00) $k@23@00))
      (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00) (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))
      (find%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            $Snap.unit))) struct@2@00 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))))
  (or
    (not
      (=
        this@3@00
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))
    (=
      this@3@00
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))))
(assert (=
  result@4@00
  (ite
    (=
      this@3@00
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00))
    this@3@00
    (find ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit))) struct@2@00 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))) this@3@00)))))
; [eval] result != null
(push) ; 2
(assert (not (not (= result@4@00 $Ref.null))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= result@4@00 $Ref.null)))
; [eval] (result in allNodes(struct))
; [eval] allNodes(struct)
(push) ; 2
(declare-const $k@24@00 $Perm)
(assert ($Perm.isReadVar $k@24@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@12@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@24@00 $k@12@00))
(assert (<= $Perm.No (- $k@12@00 $k@24@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@24@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@24@00))
(assert (and (< $k@24@00 $k@12@00) (<= $Perm.No (- $k@12@00 $k@24@00))))
(set-option :timeout 0)
(push) ; 2
(assert (not (Set_in result@4@00 (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (Set_in result@4@00 (allNodes ($Snap.first ($Snap.second ($Snap.second s@$))) struct@2@00)))
(pop) ; 1
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
; ---------- inv ----------
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
; [eval] !((null in this.nodes))
; [eval] (null in this.nodes)
(assert (not (Set_in $Ref.null ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@26@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@00))))))
(declare-const n@27@00 $Ref)
(push) ; 2
; [eval] (n in this.nodes)
(assert (Set_in n@27@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
(pop) ; 2
(declare-fun inv@28@00 ($Ref) $Ref)
(declare-fun img@29@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@27@00 $Ref) (n2@27@00 $Ref)) (!
  (=>
    (and
      (Set_in n1@27@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00)))
      (Set_in n2@27@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00)))
      (= n1@27@00 n2@27@00))
    (= n1@27@00 n2@27@00))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@27@00 $Ref)) (!
  (=>
    (Set_in n@27@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00)))
    (and (= (inv@28@00 n@27@00) n@27@00) (img@29@00 n@27@00)))
  :pattern ((Set_in n@27@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :pattern ((inv@28@00 n@27@00))
  :pattern ((img@29@00 n@27@00))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@00 r)
      (Set_in (inv@28@00 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
    (= (inv@28@00 r) r))
  :pattern ((inv@28@00 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@27@00 $Ref)) (!
  (=>
    (Set_in n@27@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00)))
    (not (= n@27@00 $Ref.null)))
  :pattern ((Set_in n@27@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :pattern ((inv@28@00 n@27@00))
  :pattern ((img@29@00 n@27@00))
  :qid |parent-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@26@00))) $Snap.unit))
; [eval] (forall q: Ref :: { (q in this.nodes) } { (q.parent in this.nodes) } (q in this.nodes) ==> (q.parent in this.nodes))
(declare-const q@30@00 $Ref)
(push) ; 2
; [eval] (q in this.nodes) ==> (q.parent in this.nodes)
; [eval] (q in this.nodes)
(push) ; 3
; [then-branch: 3 | q@30@00 in First:($t@26@00) | live]
; [else-branch: 3 | !(q@30@00 in First:($t@26@00)) | live]
(push) ; 4
; [then-branch: 3 | q@30@00 in First:($t@26@00)]
(assert (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
; [eval] (q.parent in this.nodes)
(push) ; 5
(assert (not (and
  (img@29@00 q@30@00)
  (Set_in (inv@28@00 q@30@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(q@30@00 in First:($t@26@00))]
(assert (not (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((q@30@00 $Ref)) (!
  (or
    (not
      (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
    (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :pattern ((Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|)))
(assert (forall ((q@30@00 $Ref)) (!
  (or
    (not
      (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
    (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second $t@26@00)))) q@30@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66-aux|)))
(assert (forall ((q@30@00 $Ref)) (!
  (=>
    (Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00)))
    (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second $t@26@00)))) q@30@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :pattern ((Set_in q@30@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :pattern ((Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.second ($Snap.second $t@26@00)))) q@30@00) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@26@00))))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionfind.vpr@116@6@116@66|)))
(pop) ; 1
