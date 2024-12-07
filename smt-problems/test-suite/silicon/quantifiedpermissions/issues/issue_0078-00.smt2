(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:17:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0078.vpr
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
(declare-sort $FVF<left> 0)
(declare-sort $FVF<p> 0)
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
(declare-fun $SortWrappers.$FVF<left>To$Snap ($FVF<left>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<left> ($Snap) $FVF<left>)
(assert (forall ((x $FVF<left>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<left>($SortWrappers.$FVF<left>To$Snap x)))
    :pattern (($SortWrappers.$FVF<left>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<left>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<left>To$Snap($SortWrappers.$SnapTo$FVF<left> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<left> x))
    :qid |$Snap.$FVF<left>To$SnapTo$FVF<left>|
    )))
(declare-fun $SortWrappers.$FVF<p>To$Snap ($FVF<p>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<p> ($Snap) $FVF<p>)
(assert (forall ((x $FVF<p>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<p>($SortWrappers.$FVF<p>To$Snap x)))
    :pattern (($SortWrappers.$FVF<p>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<p>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<p>To$Snap($SortWrappers.$SnapTo$FVF<p> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<p> x))
    :qid |$Snap.$FVF<p>To$SnapTo$FVF<p>|
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
; /field_value_functions_declarations.smt2 [left: Ref]
(declare-fun $FVF.domain_left ($FVF<left>) Set<$Ref>)
(declare-fun $FVF.lookup_left ($FVF<left> $Ref) $Ref)
(declare-fun $FVF.after_left ($FVF<left> $FVF<left>) Bool)
(declare-fun $FVF.loc_left ($Ref $Ref) Bool)
(declare-fun $FVF.perm_left ($FPM $Ref) $Perm)
(declare-const $fvfTOP_left $FVF<left>)
; /field_value_functions_declarations.smt2 [p: Ref]
(declare-fun $FVF.domain_p ($FVF<p>) Set<$Ref>)
(declare-fun $FVF.lookup_p ($FVF<p> $Ref) $Ref)
(declare-fun $FVF.after_p ($FVF<p> $FVF<p>) Bool)
(declare-fun $FVF.loc_p ($Ref $Ref) Bool)
(declare-fun $FVF.perm_p ($FPM $Ref) $Perm)
(declare-const $fvfTOP_p $FVF<p>)
; Declaring symbols related to program functions (from program analysis)
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
; /field_value_functions_axioms.smt2 [left: Ref]
(assert (forall ((vs $FVF<left>) (ws $FVF<left>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_left vs) ($FVF.domain_left ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_left vs))
            (= ($FVF.lookup_left vs x) ($FVF.lookup_left ws x)))
          :pattern (($FVF.lookup_left vs x) ($FVF.lookup_left ws x))
          :qid |qp.$FVF<left>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<left>To$Snap vs)
              ($SortWrappers.$FVF<left>To$Snap ws)
              )
    :qid |qp.$FVF<left>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_left pm r))
    :pattern (($FVF.perm_left pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_left f r) true)
    :pattern (($FVF.loc_left f r)))))
; /field_value_functions_axioms.smt2 [p: Ref]
(assert (forall ((vs $FVF<p>) (ws $FVF<p>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_p vs) ($FVF.domain_p ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_p vs))
            (= ($FVF.lookup_p vs x) ($FVF.lookup_p ws x)))
          :pattern (($FVF.lookup_p vs x) ($FVF.lookup_p ws x))
          :qid |qp.$FVF<p>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<p>To$Snap vs)
              ($SortWrappers.$FVF<p>To$Snap ws)
              )
    :qid |qp.$FVF<p>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_p pm r))
    :pattern (($FVF.perm_p pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_p f r) true)
    :pattern (($FVF.loc_p f r)))))
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
; ---------- Dmm ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(declare-const sm@3@01 $FVF<p>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_p (as sm@3@01  $FVF<p>) this@1@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))
(assert (not (= this@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@2@01))) $Snap.unit))
; [eval] this.s == Set(this)
; [eval] Set(this)
(assert (Set_equal ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))) (Set_singleton this@1@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@2@01))) $Snap.unit))
; [eval] this.p == null
(assert (= ($FVF.lookup_p (as sm@3@01  $FVF<p>) this@1@01) $Ref.null))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(this.s, write) &&
;   ((forall x: Ref ::(x in this.s) ==> acc(x.p, 1 / 2)) &&
;   (forall x: Ref ::(x in this.s) && x.p == null ==> acc(x.p, 1 / 2)))
(declare-const x@4@01 $Ref)
(push) ; 3
; [eval] (x in this.s)
(assert (Set_in x@4@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 3
(declare-fun inv@5@01 ($Ref) $Ref)
(declare-fun img@6@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@4@01 $Ref) (x2@4@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@4@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
      (Set_in x2@4@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
      (= x1@4@01 x2@4@01))
    (= x1@4@01 x2@4@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@4@01 $Ref)) (!
  (=>
    (Set_in x@4@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
    (and (= (inv@5@01 x@4@01) x@4@01) (img@6@01 x@4@01)))
  :pattern ((Set_in x@4@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01)))))
  :pattern ((inv@5@01 x@4@01))
  :pattern ((img@6@01 x@4@01))
  :qid |p-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@6@01 r)
      (Set_in (inv@5@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01)))))
    (= (inv@5@01 r) r))
  :pattern ((inv@5@01 r))
  :qid |p-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@7@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@5@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
      (img@6@01 r)
      (= r (inv@5@01 r)))
    ($Perm.min
      (ite (= r this@1@01) $Perm.Write $Perm.No)
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
(assert (not (= (- $Perm.Write (pTaken@7@01 this@1@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@7@01 r) $Perm.No)
  
  :qid |quant-u-8|))))
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
    (and
      (Set_in (inv@5@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
      (img@6@01 r)
      (= r (inv@5@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@7@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@8@01 $FVF<p>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r this@1@01)
    (=
      ($FVF.lookup_p (as sm@8@01  $FVF<p>) r)
      ($FVF.lookup_p (as sm@3@01  $FVF<p>) r)))
  :pattern (($FVF.lookup_p (as sm@8@01  $FVF<p>) r))
  :pattern (($FVF.lookup_p (as sm@3@01  $FVF<p>) r))
  :qid |qp.fvfValDef0|)))
(declare-const x@9@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in this.s) && x.p == null
; [eval] (x in this.s)
(push) ; 4
; [then-branch: 0 | !(x@9@01 in First:(Second:($t@2@01))) | live]
; [else-branch: 0 | x@9@01 in First:(Second:($t@2@01)) | live]
(push) ; 5
; [then-branch: 0 | !(x@9@01 in First:(Second:($t@2@01)))]
(assert (not
  (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | x@9@01 in First:(Second:($t@2@01))]
(assert (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01)))))
; [eval] x.p == null
(push) ; 6
(assert (not (= x@9@01 this@1@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
  (not
    (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01)))))))
(assert (and
  (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
  (= ($FVF.lookup_p (as sm@8@01  $FVF<p>) x@9@01) $Ref.null)))
(pop) ; 3
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (and
      (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
      (= ($FVF.lookup_p (as sm@8@01  $FVF<p>) x@9@01) $Ref.null))
    (or
      (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
      (not
        (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01)))))))
  :pattern ((Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01)))))
  :pattern (($FVF.lookup_p (as sm@8@01  $FVF<p>) x@9@01))
  :pattern ((inv@10@01 x@9@01))
  :pattern ((img@11@01 x@9@01))
  :qid |p-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@9@01 $Ref) (x2@9@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
        (= ($FVF.lookup_p (as sm@8@01  $FVF<p>) x1@9@01) $Ref.null))
      (and
        (Set_in x2@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
        (= ($FVF.lookup_p (as sm@8@01  $FVF<p>) x2@9@01) $Ref.null))
      (= x1@9@01 x2@9@01))
    (= x1@9@01 x2@9@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (and
      (Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
      (= ($FVF.lookup_p (as sm@8@01  $FVF<p>) x@9@01) $Ref.null))
    (and (= (inv@10@01 x@9@01) x@9@01) (img@11@01 x@9@01)))
  :pattern ((Set_in x@9@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01)))))
  :pattern (($FVF.lookup_p (as sm@8@01  $FVF<p>) x@9@01))
  :pattern ((inv@10@01 x@9@01))
  :pattern ((img@11@01 x@9@01))
  :qid |p-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (Set_in (inv@10@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
        (= ($FVF.lookup_p (as sm@8@01  $FVF<p>) (inv@10@01 r)) $Ref.null)))
    (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |p-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@12@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@10@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
        (= ($FVF.lookup_p (as sm@8@01  $FVF<p>) (inv@10@01 r)) $Ref.null))
      (img@11@01 r)
      (= r (inv@10@01 r)))
    ($Perm.min
      (ite (= r this@1@01) (- $Perm.Write (pTaken@7@01 r)) $Perm.No)
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
(assert (not (= (- (- $Perm.Write (pTaken@7@01 this@1@01)) (pTaken@12@01 this@1@01)) $Perm.No)))
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
      (and
        (Set_in (inv@10@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@2@01))))
        (= ($FVF.lookup_p (as sm@8@01  $FVF<p>) (inv@10@01 r)) $Ref.null))
      (img@11@01 r)
      (= r (inv@10@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@12@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@13@01 $FVF<p>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r this@1@01) (< $Perm.No (- $Perm.Write (pTaken@7@01 r))) false)
    (=
      ($FVF.lookup_p (as sm@13@01  $FVF<p>) r)
      ($FVF.lookup_p (as sm@3@01  $FVF<p>) r)))
  :pattern (($FVF.lookup_p (as sm@13@01  $FVF<p>) r))
  :pattern (($FVF.lookup_p (as sm@3@01  $FVF<p>) r))
  :qid |qp.fvfValDef1|)))
(pop) ; 2
(pop) ; 1
; ---------- Dmm2 ----------
(declare-const this@14@01 $Ref)
(declare-const this@15@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(declare-const sm@17@01 $FVF<p>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_p (as sm@17@01  $FVF<p>) this@15@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01))))
(assert (not (= this@15@01 $Ref.null)))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [eval] (this in this.s)
(assert (Set_in this@15@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01)))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [eval] this.p == null
(assert (= ($FVF.lookup_p (as sm@17@01  $FVF<p>) this@15@01) $Ref.null))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(this.s, write) &&
;   ((forall x: Ref ::(x in this.s) ==> acc(x.p, 1 / 2)) &&
;   (forall x: Ref ::(x in this.s) && x.p == null ==> acc(x.p, 1 / 2)))
(declare-const x@18@01 $Ref)
(push) ; 3
; [eval] (x in this.s)
(assert (Set_in x@18@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01)))))
(pop) ; 3
(declare-fun inv@19@01 ($Ref) $Ref)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@18@01 $Ref) (x2@18@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@18@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (Set_in x2@18@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (= x1@18@01 x2@18@01))
    (= x1@18@01 x2@18@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@18@01 $Ref)) (!
  (=>
    (Set_in x@18@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
    (and (= (inv@19@01 x@18@01) x@18@01) (img@20@01 x@18@01)))
  :pattern ((Set_in x@18@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01)))))
  :pattern ((inv@19@01 x@18@01))
  :pattern ((img@20@01 x@18@01))
  :qid |p-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (Set_in (inv@19@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01)))))
    (= (inv@19@01 r) r))
  :pattern ((inv@19@01 r))
  :qid |p-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@19@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (img@20@01 r)
      (= r (inv@19@01 r)))
    ($Perm.min
      (ite (= r this@15@01) $Perm.Write $Perm.No)
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
(assert (not (= (- $Perm.Write (pTaken@21@01 this@15@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@21@01 r) $Perm.No)
  
  :qid |quant-u-17|))))
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
    (and
      (Set_in (inv@19@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (img@20@01 r)
      (= r (inv@19@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@19@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (img@20@01 r)
      (= r (inv@19@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@22@01 $FVF<p>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r this@15@01)
    (=
      ($FVF.lookup_p (as sm@22@01  $FVF<p>) r)
      ($FVF.lookup_p (as sm@17@01  $FVF<p>) r)))
  :pattern (($FVF.lookup_p (as sm@22@01  $FVF<p>) r))
  :pattern (($FVF.lookup_p (as sm@17@01  $FVF<p>) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@23@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_p (as pm@23@01  $FPM) r)
    (ite (= r this@15@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_p (as pm@23@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(assert (<= ($FVF.perm_p (as pm@23@01  $FPM) this@15@01) $Perm.Write))
(declare-const x@24@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in this.s)
(assert (Set_in x@24@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01)))))
(pop) ; 3
(declare-fun inv@25@01 ($Ref) $Ref)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@24@01 $Ref) (x2@24@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@24@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (Set_in x2@24@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (= x1@24@01 x2@24@01))
    (= x1@24@01 x2@24@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@24@01 $Ref)) (!
  (=>
    (Set_in x@24@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
    (and (= (inv@25@01 x@24@01) x@24@01) (img@26@01 x@24@01)))
  :pattern ((Set_in x@24@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01)))))
  :pattern ((inv@25@01 x@24@01))
  :pattern ((img@26@01 x@24@01))
  :qid |p-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@26@01 r)
      (Set_in (inv@25@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01)))))
    (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |p-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@27@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@25@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (img@26@01 r)
      (= r (inv@25@01 r)))
    ($Perm.min
      (ite (= r this@15@01) $Perm.Write $Perm.No)
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
(assert (not (= (- $Perm.Write (pTaken@27@01 this@15@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@27@01 r) $Perm.No)
  
  :qid |quant-u-22|))))
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
    (and
      (Set_in (inv@25@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (img@26@01 r)
      (= r (inv@25@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@27@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@25@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($Snap.second $t@16@01))))
      (img@26@01 r)
      (= r (inv@25@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@27@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- foo ----------
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
; var x: Ref
(declare-const x@28@01 $Ref)
; [exec]
; var t: Ref
(declare-const t@29@01 $Ref)
; [exec]
; inhale acc(x.left, write) && x.left == null
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(declare-const sm@31@01 $FVF<left>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_left (as sm@31@01  $FVF<left>) x@28@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01))))
(assert (not (= x@28@01 $Ref.null)))
(assert (= ($Snap.second $t@30@01) $Snap.unit))
; [eval] x.left == null
(assert (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) x@28@01) $Ref.null))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(t.all, write) && t.all == Set(x)
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (not (= t@29@01 $Ref.null)))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] t.all == Set(x)
; [eval] Set(x)
(assert (Set_equal ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)) (Set_singleton x@28@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; fold acc(inv(t), write)
(declare-const q@33@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (q in this.all)
(assert (Set_in q@33@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01))))
(pop) ; 3
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((q1@33@01 $Ref) (q2@33@01 $Ref)) (!
  (=>
    (and
      (Set_in q1@33@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
      (Set_in q2@33@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
      (= q1@33@01 q2@33@01))
    (= q1@33@01 q2@33@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((q@33@01 $Ref)) (!
  (=>
    (Set_in q@33@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
    (and (= (inv@34@01 q@33@01) q@33@01) (img@35@01 q@33@01)))
  :pattern ((Set_in q@33@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01))))
  :pattern ((inv@34@01 q@33@01))
  :pattern ((img@35@01 q@33@01))
  :qid |left-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@01 r)
      (Set_in (inv@34@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01))))
    (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |left-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@34@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
      (img@35@01 r)
      (= r (inv@34@01 r)))
    ($Perm.min
      (ite (= r x@28@01) $Perm.Write $Perm.No)
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
(assert (not (= (- $Perm.Write (pTaken@36@01 x@28@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@36@01 r) $Perm.No)
  
  :qid |quant-u-27|))))
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
    (and
      (Set_in (inv@34@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
      (img@35@01 r)
      (= r (inv@34@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@36@01 r)) $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@37@01 $FVF<left>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_left (as sm@37@01  $FVF<left>)))
      (and
        (Set_in (inv@34@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
        (img@35@01 r)))
    (=>
      (and
        (Set_in (inv@34@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
        (img@35@01 r))
      (Set_in r ($FVF.domain_left (as sm@37@01  $FVF<left>)))))
  :pattern ((Set_in r ($FVF.domain_left (as sm@37@01  $FVF<left>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@34@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
        (img@35@01 r))
      (= r x@28@01))
    (=
      ($FVF.lookup_left (as sm@37@01  $FVF<left>) r)
      ($FVF.lookup_left (as sm@31@01  $FVF<left>) r)))
  :pattern (($FVF.lookup_left (as sm@37@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left (as sm@31@01  $FVF<left>) r))
  :qid |qp.fvfValDef4|)))
(declare-const x@38@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in this.all) && x.left == null
; [eval] (x in this.all)
(push) ; 4
; [then-branch: 1 | !(x@38@01 in First:($t@32@01)) | live]
; [else-branch: 1 | x@38@01 in First:($t@32@01) | live]
(push) ; 5
; [then-branch: 1 | !(x@38@01 in First:($t@32@01))]
(assert (not (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | x@38@01 in First:($t@32@01)]
(assert (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01))))
; [eval] x.left == null
(push) ; 6
(assert (not (= x@38@01 x@28@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
  (not (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01))))))
(assert (and
  (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
  (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) x@38@01) $Ref.null)))
(pop) ; 3
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@38@01 $Ref)) (!
  (=>
    (and
      (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
      (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) x@38@01) $Ref.null))
    (or
      (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
      (not
        (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01))))))
  :pattern ((Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01))))
  :pattern (($FVF.lookup_left (as sm@31@01  $FVF<left>) x@38@01))
  :pattern ((inv@39@01 x@38@01))
  :pattern ((img@40@01 x@38@01))
  :qid |left-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@38@01 $Ref) (x2@38@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
        (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) x1@38@01) $Ref.null))
      (and
        (Set_in x2@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
        (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) x2@38@01) $Ref.null))
      (= x1@38@01 x2@38@01))
    (= x1@38@01 x2@38@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@38@01 $Ref)) (!
  (=>
    (and
      (Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
      (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) x@38@01) $Ref.null))
    (and (= (inv@39@01 x@38@01) x@38@01) (img@40@01 x@38@01)))
  :pattern ((Set_in x@38@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01))))
  :pattern (($FVF.lookup_left (as sm@31@01  $FVF<left>) x@38@01))
  :pattern ((inv@39@01 x@38@01))
  :pattern ((img@40@01 x@38@01))
  :qid |left-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@40@01 r)
      (and
        (Set_in (inv@39@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
        (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) (inv@39@01 r)) $Ref.null)))
    (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |left-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@39@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
        (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) (inv@39@01 r)) $Ref.null))
      (img@40@01 r)
      (= r (inv@39@01 r)))
    ($Perm.min
      (ite (= r x@28@01) (- $Perm.Write (pTaken@36@01 r)) $Perm.No)
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
(assert (not (= (- (- $Perm.Write (pTaken@36@01 x@28@01)) (pTaken@41@01 x@28@01)) $Perm.No)))
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
      (and
        (Set_in (inv@39@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
        (= ($FVF.lookup_left (as sm@31@01  $FVF<left>) (inv@39@01 r)) $Ref.null))
      (img@40@01 r)
      (= r (inv@39@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $FVF<left>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_left (as sm@42@01  $FVF<left>)))
      (and
        (and
          (Set_in (inv@39@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
          (=
            ($FVF.lookup_left (as sm@31@01  $FVF<left>) (inv@39@01 r))
            $Ref.null))
        (img@40@01 r)))
    (=>
      (and
        (and
          (Set_in (inv@39@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
          (=
            ($FVF.lookup_left (as sm@31@01  $FVF<left>) (inv@39@01 r))
            $Ref.null))
        (img@40@01 r))
      (Set_in r ($FVF.domain_left (as sm@42@01  $FVF<left>)))))
  :pattern ((Set_in r ($FVF.domain_left (as sm@42@01  $FVF<left>))))
  :qid |qp.fvfDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@39@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@32@01)))
          (=
            ($FVF.lookup_left (as sm@31@01  $FVF<left>) (inv@39@01 r))
            $Ref.null))
        (img@40@01 r))
      (ite (= r x@28@01) (< $Perm.No (- $Perm.Write (pTaken@36@01 r))) false))
    (=
      ($FVF.lookup_left (as sm@42@01  $FVF<left>) r)
      ($FVF.lookup_left (as sm@31@01  $FVF<left>) r)))
  :pattern (($FVF.lookup_left (as sm@42@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left (as sm@31@01  $FVF<left>) r))
  :qid |qp.fvfValDef6|)))
(assert (inv%trigger ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine
    ($SortWrappers.$FVF<left>To$Snap (as sm@37@01  $FVF<left>))
    ($SortWrappers.$FVF<left>To$Snap (as sm@42@01  $FVF<left>)))) t@29@01))
(pop) ; 2
(pop) ; 1
; ---------- goo ----------
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
; var x: Ref
(declare-const x@43@01 $Ref)
; [exec]
; var t: Ref
(declare-const t@44@01 $Ref)
; [exec]
; inhale acc(inv(t), write)
(declare-const $t@45@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(inv(t), write)
(assert (= $t@45@01 ($Snap.combine ($Snap.first $t@45@01) ($Snap.second $t@45@01))))
(assert (not (= t@44@01 $Ref.null)))
(assert (=
  ($Snap.second $t@45@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@45@01))
    ($Snap.second ($Snap.second $t@45@01)))))
(declare-const q@46@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (q in this.all)
(assert (Set_in q@46@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
(pop) ; 3
(declare-fun inv@47@01 ($Ref) $Ref)
(declare-fun img@48@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((q1@46@01 $Ref) (q2@46@01 $Ref)) (!
  (=>
    (and
      (Set_in q1@46@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
      (Set_in q2@46@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
      (= q1@46@01 q2@46@01))
    (= q1@46@01 q2@46@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((q@46@01 $Ref)) (!
  (=>
    (Set_in q@46@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
    (and (= (inv@47@01 q@46@01) q@46@01) (img@48@01 q@46@01)))
  :pattern ((Set_in q@46@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
  :pattern ((inv@47@01 q@46@01))
  :pattern ((img@48@01 q@46@01))
  :qid |quant-u-34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (Set_in (inv@47@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
    (= (inv@47@01 r) r))
  :pattern ((inv@47@01 r))
  :qid |left-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((q@46@01 $Ref)) (!
  (=>
    (Set_in q@46@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
    (not (= q@46@01 $Ref.null)))
  :pattern ((Set_in q@46@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
  :pattern ((inv@47@01 q@46@01))
  :pattern ((img@48@01 q@46@01))
  :qid |left-permImpliesNonNull|)))
(declare-const x@49@01 $Ref)
(push) ; 3
; [eval] (x in this.all) && x.left == null
; [eval] (x in this.all)
(push) ; 4
; [then-branch: 2 | !(x@49@01 in First:($t@45@01)) | live]
; [else-branch: 2 | x@49@01 in First:($t@45@01) | live]
(push) ; 5
; [then-branch: 2 | !(x@49@01 in First:($t@45@01))]
(assert (not (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | x@49@01 in First:($t@45@01)]
(assert (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
; [eval] x.left == null
(push) ; 6
(assert (not (and
  (img@48@01 x@49@01)
  (Set_in (inv@47@01 x@49@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
  (not (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))))
(assert (and
  (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
  (=
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x@49@01)
    $Ref.null)))
(pop) ; 3
(declare-fun inv@50@01 ($Ref) $Ref)
(declare-fun img@51@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@49@01 $Ref)) (!
  (=>
    (and
      (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
      (=
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x@49@01)
        $Ref.null))
    (or
      (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
      (not
        (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))))
  :pattern ((Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
  :pattern (($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x@49@01))
  :pattern ((inv@50@01 x@49@01))
  :pattern ((img@51@01 x@49@01))
  :qid |left-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@49@01 $Ref) (x2@49@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
        (=
          ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x1@49@01)
          $Ref.null))
      (and
        (Set_in x2@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
        (=
          ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x2@49@01)
          $Ref.null))
      (= x1@49@01 x2@49@01))
    (= x1@49@01 x2@49@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@49@01 $Ref)) (!
  (=>
    (and
      (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
      (=
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x@49@01)
        $Ref.null))
    (and (= (inv@50@01 x@49@01) x@49@01) (img@51@01 x@49@01)))
  :pattern ((Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
  :pattern (($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x@49@01))
  :pattern ((inv@50@01 x@49@01))
  :pattern ((img@51@01 x@49@01))
  :qid |quant-u-36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@01 r)
      (and
        (Set_in (inv@50@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
        (=
          ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) (inv@50@01 r))
          $Ref.null)))
    (= (inv@50@01 r) r))
  :pattern ((inv@50@01 r))
  :qid |left-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@49@01 $Ref)) (!
  (=>
    (and
      (Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
      (=
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x@49@01)
        $Ref.null))
    (not (= x@49@01 $Ref.null)))
  :pattern ((Set_in x@49@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
  :pattern (($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x@49@01))
  :pattern ((inv@50@01 x@49@01))
  :pattern ((img@51@01 x@49@01))
  :qid |left-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= x@49@01 q@46@01)
    (=
      (and
        (img@51@01 r)
        (and
          (Set_in (inv@50@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
          (=
            ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) (inv@50@01 r))
            $Ref.null)))
      (and
        (img@48@01 r)
        (Set_in (inv@47@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))))
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger $t@45@01 t@44@01))
; [exec]
; inhale (x in t.all) && x.left == null
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 ($Snap.combine ($Snap.first $t@52@01) ($Snap.second $t@52@01))))
(assert (= ($Snap.first $t@52@01) $Snap.unit))
; [eval] (x in t.all)
(assert (Set_in x@43@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
(assert (= ($Snap.second $t@52@01) $Snap.unit))
; [eval] x.left == null
(declare-const sm@53@01 $FVF<left>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (Set_in (inv@47@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
    (=
      ($FVF.lookup_left (as sm@53@01  $FVF<left>) r)
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) r)))
  :pattern (($FVF.lookup_left (as sm@53@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@01 r)
      (and
        (Set_in (inv@50@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
        (=
          ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) (inv@50@01 r))
          $Ref.null)))
    (=
      ($FVF.lookup_left (as sm@53@01  $FVF<left>) r)
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.second ($Snap.second $t@45@01))) r)))
  :pattern (($FVF.lookup_left (as sm@53@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.second ($Snap.second $t@45@01))) r))
  :qid |qp.fvfValDef9|)))
(declare-const pm@54@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_left (as pm@54@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (Set_in (inv@47@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@51@01 r)
          (and
            (Set_in (inv@50@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
            (=
              ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) (inv@50@01 r))
              $Ref.null)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_left (as pm@54@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_left (as pm@54@01  $FPM) x@43@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_left (as sm@53@01  $FVF<left>) x@43@01) $Ref.null))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(x.left, write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (= r x@43@01)
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (Set_in (inv@47@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (= r x@43@01)
    ($Perm.min
      (ite
        (and
          (img@51@01 r)
          (and
            (Set_in (inv@50@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
            (=
              ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) (inv@50@01 r))
              $Ref.null)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@55@01 r)))
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
        (and
          (img@48@01 r)
          (Set_in (inv@47@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@55@01 r))
    $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@55@01 r) $Perm.No)
  
  :qid |quant-u-40|))))
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
  (=> (= r x@43@01) (= (- $Perm.Write (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@51@01 r)
          (and
            (Set_in (inv@50@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
            (=
              ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) (inv@50@01 r))
              $Ref.null)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@56@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@56@01 r) $Perm.No)
  
  :qid |quant-u-43|))))
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
    (= r x@43@01)
    (= (- (- $Perm.Write (pTaken@55@01 r)) (pTaken@56@01 r)) $Perm.No))
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@48@01 x@43@01)
    (Set_in (inv@47@01 x@43@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01))))
  (=
    ($FVF.lookup_left (as sm@53@01  $FVF<left>) x@43@01)
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) x@43@01))))
(assert (=>
  (and
    (img@51@01 x@43@01)
    (and
      (Set_in (inv@50@01 x@43@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@45@01)))
      (=
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second $t@45@01))) (inv@50@01 x@43@01))
        $Ref.null)))
  (=
    ($FVF.lookup_left (as sm@53@01  $FVF<left>) x@43@01)
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.second ($Snap.second $t@45@01))) x@43@01))))
(pop) ; 2
(pop) ; 1
