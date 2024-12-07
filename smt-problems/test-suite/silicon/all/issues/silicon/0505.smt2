(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:12
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0505.vpr
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
(declare-sort $FVF<f> 0)
(declare-sort $FVF<g> 0)
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
(declare-fun $SortWrappers.$FVF<f>To$Snap ($FVF<f>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<f> ($Snap) $FVF<f>)
(assert (forall ((x $FVF<f>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<f>($SortWrappers.$FVF<f>To$Snap x)))
    :pattern (($SortWrappers.$FVF<f>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<f>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<f>To$Snap($SortWrappers.$SnapTo$FVF<f> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<f> x))
    :qid |$Snap.$FVF<f>To$SnapTo$FVF<f>|
    )))
(declare-fun $SortWrappers.$FVF<g>To$Snap ($FVF<g>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<g> ($Snap) $FVF<g>)
(assert (forall ((x $FVF<g>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<g>($SortWrappers.$FVF<g>To$Snap x)))
    :pattern (($SortWrappers.$FVF<g>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<g>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<g>To$Snap($SortWrappers.$SnapTo$FVF<g> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<g> x))
    :qid |$Snap.$FVF<g>To$SnapTo$FVF<g>|
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
; /field_value_functions_declarations.smt2 [f: Ref]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) $Ref)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f ($Ref $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /field_value_functions_declarations.smt2 [g: Int]
(declare-fun $FVF.domain_g ($FVF<g>) Set<$Ref>)
(declare-fun $FVF.lookup_g ($FVF<g> $Ref) Int)
(declare-fun $FVF.after_g ($FVF<g> $FVF<g>) Bool)
(declare-fun $FVF.loc_g (Int $Ref) Bool)
(declare-fun $FVF.perm_g ($FPM $Ref) $Perm)
(declare-const $fvfTOP_g $FVF<g>)
; Declaring symbols related to program functions (from program analysis)
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
; /field_value_functions_axioms.smt2 [f: Ref]
(assert (forall ((vs $FVF<f>) (ws $FVF<f>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_f vs) ($FVF.domain_f ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_f vs))
            (= ($FVF.lookup_f vs x) ($FVF.lookup_f ws x)))
          :pattern (($FVF.lookup_f vs x) ($FVF.lookup_f ws x))
          :qid |qp.$FVF<f>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<f>To$Snap vs)
              ($SortWrappers.$FVF<f>To$Snap ws)
              )
    :qid |qp.$FVF<f>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_f pm r))
    :pattern (($FVF.perm_f pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
; /field_value_functions_axioms.smt2 [g: Int]
(assert (forall ((vs $FVF<g>) (ws $FVF<g>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_g vs) ($FVF.domain_g ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_g vs))
            (= ($FVF.lookup_g vs x) ($FVF.lookup_g ws x)))
          :pattern (($FVF.lookup_g vs x) ($FVF.lookup_g ws x))
          :qid |qp.$FVF<g>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<g>To$Snap vs)
              ($SortWrappers.$FVF<g>To$Snap ws)
              )
    :qid |qp.$FVF<g>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_g pm r))
    :pattern (($FVF.perm_g pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_g f r) true)
    :pattern (($FVF.loc_g f r)))))
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
; ---------- foo ----------
(declare-const r@0@01 $Ref)
(declare-const set@1@01 Set<$Ref>)
(declare-const r@2@01 $Ref)
(declare-const set@3@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const x@5@01 $Ref)
(push) ; 2
; [eval] (x in set)
(assert (Set_in x@5@01 set@3@01))
(declare-const sm@6@01 $FVF<f>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@7@01 ($Ref) $Ref)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@5@01 $Ref) (x2@5@01 $Ref)) (!
  (=>
    (and (Set_in x1@5@01 set@3@01) (Set_in x2@5@01 set@3@01) (= x1@5@01 x2@5@01))
    (= x1@5@01 x2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@5@01 $Ref)) (!
  (=>
    (Set_in x@5@01 set@3@01)
    (and (= (inv@7@01 x@5@01) x@5@01) (img@8@01 x@5@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) x@5@01) x@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01)) (= (inv@7@01 r) r))
  :pattern ((inv@7@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@5@01 $Ref)) (!
  (=> (Set_in x@5@01 set@3@01) (not (= x@5@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) x@5@01) x@5@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@9@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
    (=
      ($FVF.lookup_f (as sm@9@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@7@01 r) set@3@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) r) r))
  :pattern ((inv@7@01 r))
  :qid |quant-u-2|)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { (x in set), (y in set) } (x in set) && ((y in set) && x != y) ==> x.f != y.f)
(declare-const x@10@01 $Ref)
(declare-const y@11@01 $Ref)
(push) ; 2
; [eval] (x in set) && ((y in set) && x != y) ==> x.f != y.f
; [eval] (x in set) && ((y in set) && x != y)
; [eval] (x in set)
(push) ; 3
; [then-branch: 0 | !(x@10@01 in set@3@01) | live]
; [else-branch: 0 | x@10@01 in set@3@01 | live]
(push) ; 4
; [then-branch: 0 | !(x@10@01 in set@3@01)]
(assert (not (Set_in x@10@01 set@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | x@10@01 in set@3@01]
(assert (Set_in x@10@01 set@3@01))
; [eval] (y in set)
(push) ; 5
; [then-branch: 1 | !(y@11@01 in set@3@01) | live]
; [else-branch: 1 | y@11@01 in set@3@01 | live]
(push) ; 6
; [then-branch: 1 | !(y@11@01 in set@3@01)]
(assert (not (Set_in y@11@01 set@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | y@11@01 in set@3@01]
(assert (Set_in y@11@01 set@3@01))
; [eval] x != y
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y@11@01 set@3@01) (not (Set_in y@11@01 set@3@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@10@01 set@3@01)
  (and
    (Set_in x@10@01 set@3@01)
    (or (Set_in y@11@01 set@3@01) (not (Set_in y@11@01 set@3@01))))))
(assert (or (Set_in x@10@01 set@3@01) (not (Set_in x@10@01 set@3@01))))
(push) ; 3
; [then-branch: 2 | x@10@01 in set@3@01 && y@11@01 in set@3@01 && x@10@01 != y@11@01 | live]
; [else-branch: 2 | !(x@10@01 in set@3@01 && y@11@01 in set@3@01 && x@10@01 != y@11@01) | live]
(push) ; 4
; [then-branch: 2 | x@10@01 in set@3@01 && y@11@01 in set@3@01 && x@10@01 != y@11@01]
(assert (and
  (Set_in x@10@01 set@3@01)
  (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01)))))
; [eval] x.f != y.f
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
      (=
        ($FVF.lookup_f (as sm@9@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
    :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@10@01) x@10@01))
(push) ; 5
(assert (not (and (img@8@01 x@10@01) (Set_in (inv@7@01 x@10@01) set@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
      (=
        ($FVF.lookup_f (as sm@9@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
    :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) y@11@01) y@11@01))
(push) ; 5
(assert (not (and (img@8@01 y@11@01) (Set_in (inv@7@01 y@11@01) set@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(x@10@01 in set@3@01 && y@11@01 in set@3@01 && x@10@01 != y@11@01)]
(assert (not
  (and
    (Set_in x@10@01 set@3@01)
    (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
    (=
      ($FVF.lookup_f (as sm@9@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and
    (Set_in x@10@01 set@3@01)
    (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01))))
  (and
    (Set_in x@10@01 set@3@01)
    (Set_in y@11@01 set@3@01)
    (not (= x@10@01 y@11@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@10@01) x@10@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) y@11@01) y@11@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x@10@01 set@3@01)
      (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01)))))
  (and
    (Set_in x@10@01 set@3@01)
    (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
    (=
      ($FVF.lookup_f (as sm@9@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@10@01 $Ref) (y@11@01 $Ref)) (!
  (and
    (=>
      (Set_in x@10@01 set@3@01)
      (and
        (Set_in x@10@01 set@3@01)
        (or (Set_in y@11@01 set@3@01) (not (Set_in y@11@01 set@3@01)))))
    (or (Set_in x@10@01 set@3@01) (not (Set_in x@10@01 set@3@01)))
    (=>
      (and
        (Set_in x@10@01 set@3@01)
        (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01))))
      (and
        (Set_in x@10@01 set@3@01)
        (Set_in y@11@01 set@3@01)
        (not (= x@10@01 y@11@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@10@01) x@10@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) y@11@01) y@11@01)))
    (or
      (not
        (and
          (Set_in x@10@01 set@3@01)
          (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01)))))
      (and
        (Set_in x@10@01 set@3@01)
        (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01))))))
  :pattern ((Set_in x@10@01 set@3@01) (Set_in y@11@01 set@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0505.vpr@9@12@9@84-aux|)))
(assert (forall ((x@10@01 $Ref) (y@11@01 $Ref)) (!
  (=>
    (and
      (Set_in x@10@01 set@3@01)
      (and (Set_in y@11@01 set@3@01) (not (= x@10@01 y@11@01))))
    (not
      (=
        ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@10@01)
        ($FVF.lookup_f (as sm@9@01  $FVF<f>) y@11@01))))
  :pattern ((Set_in x@10@01 set@3@01) (Set_in y@11@01 set@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0505.vpr@9@12@9@84|)))
(declare-const x@12@01 $Ref)
(push) ; 2
; [eval] (x in set)
(assert (Set_in x@12@01 set@3@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
      (=
        ($FVF.lookup_f (as sm@9@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
    :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01) x@12@01))
(push) ; 3
(assert (not (and (img@8@01 x@12@01) (Set_in (inv@7@01 x@12@01) set@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@13@01 $FVF<g>)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@14@01 ($Ref) $Ref)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
    (=
      ($FVF.lookup_f (as sm@9@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Set_in x@12@01 set@3@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01) x@12@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01) x@12@01) ($FVF.loc_g ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01)) ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01)))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@12@01 $Ref) (x2@12@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@12@01 set@3@01)
      (Set_in x2@12@01 set@3@01)
      (=
        ($FVF.lookup_f (as sm@9@01  $FVF<f>) x1@12@01)
        ($FVF.lookup_f (as sm@9@01  $FVF<f>) x2@12@01)))
    (= x1@12@01 x2@12@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Set_in x@12@01 set@3@01)
    (and
      (= (inv@14@01 ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01)) x@12@01)
      (img@15@01 ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01) x@12@01) ($FVF.loc_g ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01)) ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01)))
  :qid |quant-u-4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@15@01 r) (Set_in (inv@14@01 r) set@3@01))
    (= ($FVF.lookup_f (as sm@9@01  $FVF<f>) (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Set_in x@12@01 set@3@01)
    (not (= ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01) $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01) x@12@01) ($FVF.loc_g ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01)) ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@12@01)))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@16@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@15@01 r) (Set_in (inv@14@01 r) set@3@01))
    (=
      ($FVF.lookup_g (as sm@16@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r)))
  :pattern (($FVF.lookup_g (as sm@16@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_g ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r) r)
  :pattern (($FVF.lookup_g (as sm@16@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@14@01 r) set@3@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@16@01  $FVF<g>) r) r))
  :pattern ((inv@14@01 r))
  :qid |quant-u-5|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var new_set: Set[Ref]
(declare-const new_set@17@01 Set<$Ref>)
; [exec]
; new_set := (set union Set(r))
; [eval] (set union Set(r))
; [eval] Set(r)
(declare-const new_set@18@01 Set<$Ref>)
(assert (= new_set@18@01 (Set_union set@3@01 (Set_singleton r@2@01))))
; [exec]
; inhale acc(r.f, 1 / 3)
(declare-const $t@19@01 $Ref)
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r@2@01) $t@19@01))
(assert (not (= r@2@01 $Ref.null)))
(declare-const sm@21@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@2@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01) r@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(r.f.g, 2 / 3)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (= r r@2@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
      ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef8|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 r@2@01) (Set_in (inv@7@01 r@2@01) set@3@01))
      (/ (to_real 1) (to_real 3))
      $Perm.No)
    (/ (to_real 1) (to_real 3))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@22@01 Int)
(declare-const sm@23@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@23@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
  $t@22@01))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01)
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01)
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01)
    ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
  (not (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01) $Ref.null))))
(declare-const sm@24@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@15@01 r) (Set_in (inv@14@01 r) set@3@01))
    (=
      ($FVF.lookup_g (as sm@24@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r)))
  :pattern (($FVF.lookup_g (as sm@24@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
    (=
      ($FVF.lookup_g (as sm@24@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@23@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@24@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@23@01  $FVF<g>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r) r)
    ($FVF.loc_g ($FVF.lookup_g (as sm@23@01  $FVF<g>) r) r))
  :pattern (($FVF.lookup_g (as sm@24@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert ($FVF.loc_g ($FVF.lookup_g (as sm@24@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01)) ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall x: Ref :: { x.f } (x in new_set) ==> acc(x.f, 1 / 3))
(declare-const x@25@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in new_set)
(assert (Set_in x@25@01 new_set@18@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@26@01 ($Ref) $Ref)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@25@01 $Ref) (x2@25@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@25@01 new_set@18@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x1@25@01) x1@25@01))
      (and
        (Set_in x2@25@01 new_set@18@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x2@25@01) x2@25@01))
      (= x1@25@01 x2@25@01))
    (= x1@25@01 x2@25@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@25@01 $Ref)) (!
  (=>
    (Set_in x@25@01 new_set@18@01)
    (and (= (inv@26@01 x@25@01) x@25@01) (img@27@01 x@25@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@25@01) x@25@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (Set_in (inv@26@01 r) new_set@18@01))
    (= (inv@26@01 r) r))
  :pattern ((inv@26@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@26@01 r) new_set@18@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) r))
  :pattern ((inv@26@01 r))
  :qid |quant-u-7|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@28@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@26@01 r) new_set@18@01) (img@27@01 r) (= r (inv@26@01 r)))
    ($Perm.min
      (ite
        (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
        (/ (to_real 1) (to_real 3))
        $Perm.No)
      (/ (to_real 1) (to_real 3)))
    $Perm.No))
(define-fun pTaken@29@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@26@01 r) new_set@18@01) (img@27@01 r) (= r (inv@26@01 r)))
    ($Perm.min
      (ite (= r r@2@01) (/ (to_real 1) (to_real 3)) $Perm.No)
      (- (/ (to_real 1) (to_real 3)) (pTaken@28@01 r)))
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
        (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
        (/ (to_real 1) (to_real 3))
        $Perm.No)
      (pTaken@28@01 r))
    $Perm.No)
  
  :qid |quant-u-9|))))
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
    (and (Set_in (inv@26@01 r) new_set@18@01) (img@27@01 r) (= r (inv@26@01 r)))
    (= (- (/ (to_real 1) (to_real 3)) (pTaken@28@01 r)) $Perm.No))
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (/ (to_real 1) (to_real 3)) (pTaken@29@01 r@2@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@29@01 r) $Perm.No)
  
  :qid |quant-u-12|))))
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
    (and (Set_in (inv@26@01 r) new_set@18@01) (img@27@01 r) (= r (inv@26@01 r)))
    (=
      (- (- (/ (to_real 1) (to_real 3)) (pTaken@28@01 r)) (pTaken@29@01 r))
      $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; assert (forall x: Ref :: { x.f.g } (x in new_set) ==> acc(x.f.g, 2 / 3))
(declare-const x@30@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in new_set)
(assert (Set_in x@30@01 new_set@18@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (= r r@2@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
      ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef8|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@30@01) x@30@01))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 x@30@01) (Set_in (inv@7@01 x@30@01) set@3@01))
      (/ (to_real 1) (to_real 3))
      $Perm.No)
    (ite (= x@30@01 r@2@01) (/ (to_real 1) (to_real 3)) $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@31@01 ($Ref) $Ref)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@2@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@30@01 $Ref)) (!
  (=>
    (Set_in x@30@01 new_set@18@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@30@01) x@30@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@30@01) x@30@01) ($FVF.loc_g ($FVF.lookup_g (as sm@24@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@30@01)) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@30@01)))
  :qid |g-aux|)))
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@30@01 $Ref) (x2@30@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@30@01 new_set@18@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@24@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x1@30@01)) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x1@30@01)))
      (and
        (Set_in x2@30@01 new_set@18@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@24@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x2@30@01)) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x2@30@01)))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) x1@30@01)
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) x2@30@01)))
    (= x1@30@01 x2@30@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@33@01  $FPM) r)
    (+
      (ite
        (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
        (/ (to_real 1) (to_real 3))
        $Perm.No)
      (ite (= r r@2@01) (/ (to_real 1) (to_real 3)) $Perm.No)))
  :pattern (($FVF.perm_f (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@33@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@33@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@34@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@34@01  $FPM) r)
    (+
      (ite
        (and (img@15@01 r) (Set_in (inv@14@01 r) set@3@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (ite
        (= r ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g (as sm@24@01  $FVF<g>) r) r)
    ($FVF.loc_g ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r) r)
    ($FVF.loc_g ($FVF.lookup_g (as sm@23@01  $FVF<g>) r) r))
  :pattern (($FVF.perm_g (as pm@34@01  $FPM) r))
  :qid |qp.resTrgDef15|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@34@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_g ($FVF.lookup_g (as sm@24@01  $FVF<g>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const x@35@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in new_set)
(assert (Set_in x@35@01 new_set@18@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (= r r@2@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
      ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef8|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01) x@35@01))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 x@35@01) (Set_in (inv@7@01 x@35@01) set@3@01))
      (/ (to_real 1) (to_real 3))
      $Perm.No)
    (ite (= x@35@01 r@2@01) (/ (to_real 1) (to_real 3)) $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@36@01 ($Ref) $Ref)
(declare-fun img@37@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) set@3@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@2@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@35@01 $Ref)) (!
  (=>
    (Set_in x@35@01 new_set@18@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01) x@35@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01) x@35@01) ($FVF.loc_g ($FVF.lookup_g (as sm@24@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01)) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01)))
  :qid |g-aux|)))
(declare-const sm@38@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
    (=
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@23@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@23@01  $FVF<g>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@15@01 r) (Set_in (inv@14@01 r) set@3@01))
    (=
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r)))
  :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_g ($FVF.lookup_g (as sm@23@01  $FVF<g>) r) r)
    ($FVF.loc_g ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@4@01))) r) r))
  :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
  :qid |qp.fvfResTrgDef18|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@35@01 $Ref) (x2@35@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@35@01 new_set@18@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@38@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x1@35@01)) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x1@35@01)))
      (and
        (Set_in x2@35@01 new_set@18@01)
        ($FVF.loc_g ($FVF.lookup_g (as sm@38@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x2@35@01)) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x2@35@01)))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) x1@35@01)
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) x2@35@01)))
    (= x1@35@01 x2@35@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@35@01 $Ref)) (!
  (=>
    (Set_in x@35@01 new_set@18@01)
    (and
      (= (inv@36@01 ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01)) x@35@01)
      (img@37@01 ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01) x@35@01) ($FVF.loc_g ($FVF.lookup_g (as sm@24@01  $FVF<g>) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01)) ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01)))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (Set_in (inv@36@01 r) new_set@18@01))
    (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) (inv@36@01 r)) r))
  :pattern ((inv@36@01 r))
  :qid |g-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@36@01 r) new_set@18@01)
    ($FVF.loc_g ($FVF.lookup_g (as sm@38@01  $FVF<g>) r) r))
  :pattern ((inv@36@01 r))
  :qid |quant-u-16|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x@35@01 $Ref)) (!
  (=
    ($FVF.lookup_f (as sm@21@01  $FVF<f>) x@35@01)
    ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@35@01))
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@39@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@36@01 r) new_set@18@01)
      (img@37@01 r)
      (= r ($FVF.lookup_f (as sm@21@01  $FVF<f>) (inv@36@01 r))))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (/ (to_real 2) (to_real 3)))
    $Perm.No))
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@36@01 r) new_set@18@01)
      (img@37@01 r)
      (= r ($FVF.lookup_f (as sm@21@01  $FVF<f>) (inv@36@01 r))))
    ($Perm.min
      (ite
        (and (img@15@01 r) (Set_in (inv@14@01 r) set@3@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (- (/ (to_real 2) (to_real 3)) (pTaken@39@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01)
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (pTaken@39@01 ($FVF.lookup_f (as sm@21@01  $FVF<f>) r@2@01)))
  $Perm.No)))
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
      (Set_in (inv@36@01 r) new_set@18@01)
      (img@37@01 r)
      (= r ($FVF.lookup_f (as sm@21@01  $FVF<f>) (inv@36@01 r))))
    (= (- (/ (to_real 2) (to_real 3)) (pTaken@39@01 r)) $Perm.No))
  
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@15@01 r) (Set_in (inv@14@01 r) set@3@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (pTaken@40@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
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
      (Set_in (inv@36@01 r) new_set@18@01)
      (img@37@01 r)
      (= r ($FVF.lookup_f (as sm@21@01  $FVF<f>) (inv@36@01 r))))
    (=
      (- (- (/ (to_real 2) (to_real 3)) (pTaken@39@01 r)) (pTaken@40@01 r))
      $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 2
(pop) ; 1
