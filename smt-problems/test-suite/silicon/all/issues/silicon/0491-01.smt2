(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0491.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<next> 0)
(declare-sort $PSF<list2> 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<list2>To$Snap ($PSF<list2>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<list2> ($Snap) $PSF<list2>)
(assert (forall ((x $PSF<list2>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<list2>($SortWrappers.$PSF<list2>To$Snap x)))
    :pattern (($SortWrappers.$PSF<list2>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<list2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<list2>To$Snap($SortWrappers.$SnapTo$PSF<list2> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<list2> x))
    :qid |$Snap.$PSF<list2>To$SnapTo$PSF<list2>|
    )))
; ////////// Symbols
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
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; /predicate_snap_functions_declarations.smt2 [list2: Snap]
(declare-fun $PSF.domain_list2 ($PSF<list2>) Set<$Snap>)
(declare-fun $PSF.lookup_list2 ($PSF<list2> $Snap) $Snap)
(declare-fun $PSF.after_list2 ($PSF<list2> $PSF<list2>) Bool)
(declare-fun $PSF.loc_list2 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_list2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_list2 $PSF<list2>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun foo ($Snap $Ref Int) Bool)
(declare-fun foo%limited ($Snap $Ref Int) Bool)
(declare-fun foo%stateless ($Ref Int) Bool)
(declare-fun foo%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list2%trigger ($Snap $Ref Int) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
; /predicate_snap_functions_axioms.smt2 [list2: Snap]
(assert (forall ((vs $PSF<list2>) (ws $PSF<list2>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_list2 vs) ($PSF.domain_list2 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_list2 vs))
            (= ($PSF.lookup_list2 vs x) ($PSF.lookup_list2 ws x)))
          :pattern (($PSF.lookup_list2 vs x) ($PSF.lookup_list2 ws x))
          :qid |qp.$PSF<list2>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<list2>To$Snap vs)
              ($SortWrappers.$PSF<list2>To$Snap ws)
              )
    :qid |qp.$PSF<list2>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_list2 pm s))
    :pattern (($PSF.perm_list2 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_list2 f s) true)
    :pattern (($PSF.loc_list2 f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION foo----------
(declare-fun l@0@00 () $Ref)
(declare-fun i@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-fun sm@3@00 ($Snap $Ref Int) $PSF<list2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap i@1@00)))
  s@$))
(declare-fun sm@4@00 ($Snap $Ref Int) $PSF<list2>)
(declare-const s@5@00 $Snap)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap i@1@00))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap i@1@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@0@00 $Ref) (i@1@00 Int)) (!
  (= (foo%limited s@$ l@0@00 i@1@00) (foo s@$ l@0@00 i@1@00))
  :pattern ((foo s@$ l@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (l@0@00 $Ref) (i@1@00 Int)) (!
  (foo%stateless l@0@00 i@1@00)
  :pattern ((foo%limited s@$ l@0@00 i@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (=
  ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap i@1@00)))
  s@$))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap i@1@00))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap i@1@00))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall j: Int :: { list2(l, j) } { foo(l.next, j) } i == j ==> (unfolding acc(list2(l, j), write) in (l.next == null ? true : foo(l.next, j))))
(declare-const j@6@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] i == j ==> (unfolding acc(list2(l, j), write) in (l.next == null ? true : foo(l.next, j)))
; [eval] i == j
(push) ; 3
; [then-branch: 0 | i@1@00 == j@6@00 | live]
; [else-branch: 0 | i@1@00 != j@6@00 | live]
(push) ; 4
; [then-branch: 0 | i@1@00 == j@6@00]
(assert (= i@1@00 j@6@00))
; [eval] (unfolding acc(list2(l, j), write) in (l.next == null ? true : foo(l.next, j)))
(push) ; 5
(declare-fun sm@7@00 ($Snap $Ref Int) $PSF<list2>)
(declare-const s@8@00 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@8@00 $Snap)) (!
  (=>
    (and
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@8@00)) l@0@00)
      (= ($SortWrappers.$SnapToInt ($Snap.second s@8@00)) i@1@00))
    (and
      (not (= s@8@00 $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00)
        ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))))
  :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
  :pattern (($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@8@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00) s@8@00)
  :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
  :qid |qp.psmResTrgDef2|)))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap j@6@00))))
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
(assert (not (= (- $Perm.Write (ite (= i@1@00 j@6@00) $Perm.Write $Perm.No)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (i Int)) (!
  (=>
    (and (= this l@0@00) (= i j@6@00))
    (=
      (-
        $Perm.Write
        (ite
          (and (= this l@0@00) (= i j@6@00))
          ($Perm.min
            (ite (and (= this l@0@00) (= i i@1@00)) $Perm.Write $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= j@6@00 i@1@00)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))
        $Snap.unit))
    (=
      ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))
      ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap j@6@00))))
(assert (list2%trigger ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap j@6@00))) l@0@00 j@6@00))
(assert (=
  ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))
    ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))))
(assert (not (= l@0@00 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))))
; [eval] this.next != null
; [then-branch: 1 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) != Null | live]
; [else-branch: 1 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 1 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))
    $Ref.null)))
(declare-fun sm@9@00 ($Snap $Ref Int Int) $PSF<list2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00)))
  ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))))
    $Perm.Write
    $Perm.No)))
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))))
; [eval] (l.next == null ? true : foo(l.next, j))
; [eval] l.next == null
(push) ; 7
; [then-branch: 2 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) == Null | live]
; [else-branch: 2 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) != Null | live]
(push) ; 8
; [then-branch: 2 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))))))
  $Ref.null))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) != Null]
; [eval] foo(l.next, j)
(push) ; 9
(declare-fun sm@10@00 ($Snap $Ref Int) $PSF<list2>)
(declare-const s@11@00 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@11@00 $Snap)) (!
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@11@00))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))))
      (= ($SortWrappers.$SnapToInt ($Snap.second s@11@00)) j@6@00))
    (and
      (not (= s@11@00 $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00)
        ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))))
  :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
  :pattern (($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))
  :qid |qp.psmValDef3|)))
(assert (forall ((s@11@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00) s@11@00)
  :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
  :qid |qp.psmResTrgDef4|)))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))))
      ($Perm.min
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))))
          $Perm.Write
          $Perm.No)
        $Perm.Write)
      $Perm.No))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((this $Ref) (i Int)) (!
  (=>
    (and
      (=
        this
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))))
      (= i j@6@00))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (=
              this
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))))
            (= i j@6@00))
          ($Perm.min
            (ite
              (and
                (=
                  this
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))))
                (= i j@6@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00))
        $Snap.unit))
    (=
      ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))
        ($SortWrappers.IntTo$Snap j@6@00)))
      ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))
        ($SortWrappers.IntTo$Snap j@6@00)))))))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))))
(assert (foo%precondition ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))
(pop) ; 9
; Joined path conditions
(assert (and
  (forall ((s@11@00 $Snap)) (!
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first s@11@00))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))))
        (= ($SortWrappers.$SnapToInt ($Snap.second s@11@00)) j@6@00))
      (and
        (not (= s@11@00 $Snap.unit))
        (=
          ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00)
          ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))))
    :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
    :pattern (($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))
    :qid |qp.psmValDef3|))
  (forall ((s@11@00 $Snap)) (!
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00) s@11@00)
    :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
    :qid |qp.psmResTrgDef4|))
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00)))
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))
            ($SortWrappers.IntTo$Snap j@6@00))
          $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00)))
        ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00))))))
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00)))
  (foo%precondition ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      $Ref.null))
  (and
    (forall ((s@11@00 $Snap)) (!
      (=>
        (and
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first s@11@00))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))))
          (= ($SortWrappers.$SnapToInt ($Snap.second s@11@00)) j@6@00))
        (and
          (not (= s@11@00 $Snap.unit))
          (=
            ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00)
            ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))))
      :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
      :pattern (($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))
      :qid |qp.psmValDef3|))
    (forall ((s@11@00 $Snap)) (!
      ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00) s@11@00)
      :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
      :qid |qp.psmResTrgDef4|))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00))
            $Snap.unit))
        (=
          ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))
            ($SortWrappers.IntTo$Snap j@6@00)))
          ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))
            ($SortWrappers.IntTo$Snap j@6@00))))))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00)))
    (foo%precondition ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))))
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))
    $Ref.null)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 1 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  $Snap.unit))
; [eval] (l.next == null ? true : foo(l.next, j))
; [eval] l.next == null
(push) ; 7
; [then-branch: 3 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) == Null | live]
; [else-branch: 3 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) != Null | live]
(push) ; 8
; [then-branch: 3 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) == Null]
(pop) ; 8
(push) ; 8
; [else-branch: 3 | First:(Second:(PredicateLookup(list2, sm@7@00(s@$, l@0@00, i@1@00), List(l@0@00, j@6@00)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))
    $Ref.null)))
; [eval] foo(l.next, j)
(push) ; 9
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 10
(assert (not (forall ((this $Ref) (i Int)) (!
  (=>
    (and
      (=
        this
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))))
      (= i j@6@00))
    false)
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (foo%precondition ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))
  ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@0@00)
  ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))
(pop) ; 9
; Joined path conditions
(assert (and
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00)))
  (foo%precondition ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        $Ref.null))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00)))
    (foo%precondition ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))))
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))
    $Ref.null)))
(pop) ; 6
(pop) ; 5
(declare-fun joined_unfolding@12@00 ($Snap $Ref Int Int) Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      $Ref.null))
  (=
    (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        $Ref.null)
      true
      (foo ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))
        ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))
    $Ref.null)
  (=
    (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        $Ref.null)
      true
      (foo ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))
        ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))))
; Joined path conditions
(assert (forall ((s@8@00 $Snap)) (!
  (=>
    (and
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@8@00)) l@0@00)
      (= ($SortWrappers.$SnapToInt ($Snap.second s@8@00)) i@1@00))
    (and
      (not (= s@8@00 $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00)
        ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))))
  :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
  :pattern (($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@8@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00) s@8@00)
  :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
  :qid |qp.psmResTrgDef2|)))
(assert (and
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))
  (=>
    (= j@6@00 i@1@00)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))
          $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))
        ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))
  (list2%trigger ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))) l@0@00 j@6@00)
  (=
    ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))
      ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
  (not (= l@0@00 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      $Ref.null))
  (and
    (=
      ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))
        ($SortWrappers.IntTo$Snap j@6@00)))
      ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
    (<=
      $Perm.No
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))))
        $Perm.Write
        $Perm.No))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          $Ref.null))
      (and
        (forall ((s@11@00 $Snap)) (!
          (=>
            (and
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first s@11@00))
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))))
              (= ($SortWrappers.$SnapToInt ($Snap.second s@11@00)) j@6@00))
            (and
              (not (= s@11@00 $Snap.unit))
              (=
                ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00)
                ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))))
          :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
          :pattern (($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))
          :qid |qp.psmValDef3|))
        (forall ((s@11@00 $Snap)) (!
          ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00) s@11@00)
          :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
          :qid |qp.psmResTrgDef4|))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))
                $Snap.unit))
            (=
              ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))
                ($SortWrappers.IntTo$Snap j@6@00)))
              ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))
                ($SortWrappers.IntTo$Snap j@6@00))))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00)))
        (foo%precondition ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          $Ref.null))
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        $Ref.null)))))
; Joined path conditions
(assert (and
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))
  (=>
    (= j@6@00 i@1@00)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))
          $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))
        ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))
  (list2%trigger ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))) l@0@00 j@6@00)
  (=
    ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))
      ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
  (not (= l@0@00 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00)))
        (foo%precondition ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          $Ref.null))
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        $Ref.null)))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))))
      $Ref.null))))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i@1@00 != j@6@00]
(assert (not (= i@1@00 j@6@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((s@8@00 $Snap)) (!
  (=>
    (and
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@8@00)) l@0@00)
      (= ($SortWrappers.$SnapToInt ($Snap.second s@8@00)) i@1@00))
    (and
      (not (= s@8@00 $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00)
        ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))))
  :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
  :pattern (($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@8@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00) s@8@00)
  :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
  :qid |qp.psmResTrgDef2|)))
(assert (=>
  (= i@1@00 j@6@00)
  (and
    (= i@1@00 j@6@00)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          $Ref.null))
      (=
        (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null)
          true
          (foo ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))
            ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        $Ref.null)
      (=
        (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null)
          true
          (foo ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))
            ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))
    (=>
      (= j@6@00 i@1@00)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))
            $Snap.unit))
        (=
          ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))
          ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))
    (list2%trigger ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))) l@0@00 j@6@00)
    (=
      ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))
        ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
    (not (= l@0@00 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))
        ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          $Ref.null))
      (and
        (=
          ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))
            ($SortWrappers.IntTo$Snap j@6@00)))
          ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
        (<=
          $Perm.No
          (ite
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))))
            $Perm.Write
            $Perm.No))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          ($SortWrappers.IntTo$Snap j@6@00)))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null))
          (and
            (forall ((s@11@00 $Snap)) (!
              (=>
                (and
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first s@11@00))
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00)))))))
                  (= ($SortWrappers.$SnapToInt ($Snap.second s@11@00)) j@6@00))
                (and
                  (not (= s@11@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00)
                    ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))))
              :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
              :pattern (($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))
              :qid |qp.psmValDef3|))
            (forall ((s@11@00 $Snap)) (!
              ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00) s@11@00)
              :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
              :qid |qp.psmResTrgDef4|))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00)))
            (=>
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))))
              (and
                (not
                  (=
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                        ($SortWrappers.$RefTo$Snap l@0@00)
                        ($SortWrappers.IntTo$Snap j@6@00)))))
                      ($SortWrappers.IntTo$Snap j@6@00))
                    $Snap.unit))
                (=
                  ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00)))))
                    ($SortWrappers.IntTo$Snap j@6@00)))
                  ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
                    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00)))))
                    ($SortWrappers.IntTo$Snap j@6@00))))))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00)))
            (foo%precondition ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))))
          $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00)))
            (foo%precondition ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null))))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))))
          $Ref.null))))))
; Joined path conditions
(assert (or (not (= i@1@00 j@6@00)) (= i@1@00 j@6@00)))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((s@8@00 $Snap)) (!
  (=>
    (and
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@8@00)) l@0@00)
      (= ($SortWrappers.$SnapToInt ($Snap.second s@8@00)) i@1@00))
    (and
      (not (= s@8@00 $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00)
        ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))))
  :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
  :pattern (($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@8@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00) s@8@00)
  :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
  :qid |qp.psmResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@6@00 Int)) (!
  (and
    (=>
      (= i@1@00 j@6@00)
      (and
        (= i@1@00 j@6@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null))
          (=
            (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null)
              true
              (foo ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))
                ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null)
          (=
            (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null)
              true
              (foo ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))
                ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))
        (=>
          (= j@6@00 i@1@00)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))
                $Snap.unit))
            (=
              ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))
              ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))
        (list2%trigger ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))) l@0@00 j@6@00)
        (=
          ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))
            ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
        (not (= l@0@00 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))
            ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))
                ($SortWrappers.IntTo$Snap j@6@00)))
              ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
            (<=
              $Perm.No
              (ite
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))))
                $Perm.Write
                $Perm.No))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00)))
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  $Ref.null))
              (and
                (forall ((s@11@00 $Snap)) (!
                  (=>
                    (and
                      (=
                        ($SortWrappers.$SnapTo$Ref ($Snap.first s@11@00))
                        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@0@00)
                          ($SortWrappers.IntTo$Snap j@6@00)))))))
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.second s@11@00))
                        j@6@00))
                    (and
                      (not (= s@11@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00)
                        ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))))
                  :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
                  :pattern (($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))
                  :qid |qp.psmValDef3|))
                (forall ((s@11@00 $Snap)) (!
                  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00) s@11@00)
                  :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
                  :qid |qp.psmResTrgDef4|))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00)))
                (=>
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00))))))
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00)))))))
                  (and
                    (not
                      (=
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                            ($SortWrappers.$RefTo$Snap l@0@00)
                            ($SortWrappers.IntTo$Snap j@6@00)))))
                          ($SortWrappers.IntTo$Snap j@6@00))
                        $Snap.unit))
                    (=
                      ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@0@00)
                          ($SortWrappers.IntTo$Snap j@6@00)))))
                        ($SortWrappers.IntTo$Snap j@6@00)))
                      ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
                        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@0@00)
                          ($SortWrappers.IntTo$Snap j@6@00)))))
                        ($SortWrappers.IntTo$Snap j@6@00))))))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00)))
                (foo%precondition ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  $Ref.null))
              (and
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00))))))
                    $Ref.null))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00)))
                (foo%precondition ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null))))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null)))))
    (or (not (= i@1@00 j@6@00)) (= i@1@00 j@6@00)))
  :pattern (($PSF.loc_list2 ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0491.vpr@12@3@13@82-aux|)))
(assert (forall ((j@6@00 Int)) (!
  (and
    (=>
      (= i@1@00 j@6@00)
      (and
        (= i@1@00 j@6@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null))
          (=
            (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null)
              true
              (foo ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))
                ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null)
          (=
            (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null)
              true
              (foo ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))
                ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))
        (=>
          (= j@6@00 i@1@00)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))
                $Snap.unit))
            (=
              ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))
              ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00)))
        (list2%trigger ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@0@00)
          ($SortWrappers.IntTo$Snap j@6@00))) l@0@00 j@6@00)
        (=
          ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))
            ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
        (not (= l@0@00 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j@6@00))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))
            ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00)))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))
                ($SortWrappers.IntTo$Snap j@6@00)))
              ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
            (<=
              $Perm.No
              (ite
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))))
                $Perm.Write
                $Perm.No))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              ($SortWrappers.IntTo$Snap j@6@00)))
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  $Ref.null))
              (and
                (forall ((s@11@00 $Snap)) (!
                  (=>
                    (and
                      (=
                        ($SortWrappers.$SnapTo$Ref ($Snap.first s@11@00))
                        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@0@00)
                          ($SortWrappers.IntTo$Snap j@6@00)))))))
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.second s@11@00))
                        j@6@00))
                    (and
                      (not (= s@11@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00)
                        ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))))
                  :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
                  :pattern (($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00))
                  :qid |qp.psmValDef3|))
                (forall ((s@11@00 $Snap)) (!
                  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) s@11@00) s@11@00)
                  :pattern (($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) s@11@00))
                  :qid |qp.psmResTrgDef4|))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00)))
                (=>
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00))))))
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00)))))))
                  (and
                    (not
                      (=
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                            ($SortWrappers.$RefTo$Snap l@0@00)
                            ($SortWrappers.IntTo$Snap j@6@00)))))
                          ($SortWrappers.IntTo$Snap j@6@00))
                        $Snap.unit))
                    (=
                      ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@0@00)
                          ($SortWrappers.IntTo$Snap j@6@00)))))
                        ($SortWrappers.IntTo$Snap j@6@00)))
                      ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
                        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@0@00)
                          ($SortWrappers.IntTo$Snap j@6@00)))))
                        ($SortWrappers.IntTo$Snap j@6@00))))))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@9@00 s@$ l@0@00 i@1@00 j@6@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00)))
                (foo%precondition ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00)))))
              $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  $Ref.null))
              (and
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j@6@00))))))
                    $Ref.null))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00)))
                (foo%precondition ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00)))))
                  ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00)))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j@6@00))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j@6@00))))))
                $Ref.null))))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j@6@00))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j@6@00))))))
              $Ref.null)))))
    (or (not (= i@1@00 j@6@00)) (= i@1@00 j@6@00)))
  :pattern ((foo%limited ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))
    ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@0@00)
    ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0491.vpr@12@3@13@82-aux|)))
(assert (=
  result@2@00
  (forall ((j@6@00 Int)) (!
    (=> (= i@1@00 j@6@00) (joined_unfolding@12@00 s@$ l@0@00 i@1@00 j@6@00))
    :pattern (($PSF.loc_list2 ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00))))
    :pattern ((foo%limited ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j@6@00)))))
      ($SortWrappers.IntTo$Snap j@6@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@0@00)
      ($SortWrappers.IntTo$Snap j@6@00)))))) j@6@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0491.vpr@12@3@13@82|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@0@00 $Ref) (i@1@00 Int)) (!
  (and
    (=
      ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap i@1@00)))
      s@$)
    (forall ((s@8@00 $Snap)) (!
      (=>
        (and
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@8@00)) l@0@00)
          (= ($SortWrappers.$SnapToInt ($Snap.second s@8@00)) i@1@00))
        (and
          (not (= s@8@00 $Snap.unit))
          (=
            ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00)
            ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))))
      :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
      :pattern (($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00))
      :qid |qp.psmValDef1|))
    (forall ((s@8@00 $Snap)) (!
      ($PSF.loc_list2 ($PSF.lookup_list2 (sm@3@00 s@$ l@0@00 i@1@00) s@8@00) s@8@00)
      :pattern (($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) s@8@00))
      :qid |qp.psmResTrgDef2|))
    (forall ((s@5@00 $Snap)) (!
      true
      :pattern (($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) s@5@00))
      :qid |qp.psmResTrgDef0|))
    (=>
      (foo%precondition s@$ l@0@00 i@1@00)
      (=
        (foo s@$ l@0@00 i@1@00)
        (forall ((j Int)) (!
          (=>
            (= i@1@00 j)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null)
              true
              (foo%limited (ite
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@0@00)
                      ($SortWrappers.IntTo$Snap j))))))
                    $Ref.null))
                ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j)))))
                  ($SortWrappers.IntTo$Snap j)))
                ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@0@00)
                    ($SortWrappers.IntTo$Snap j)))))
                  ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j)))))) j)))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j)))))
          :pattern ((foo%limited (ite
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null))
            ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))
            ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j)))))) j))
          )))))
  :pattern ((foo s@$ l@0@00 i@1@00))
  :qid |quant-u-9|)))
; WARNING: (2749,11): 'not' cannot be used in patterns.
; WARNING: (2749,11): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (l@0@00 $Ref) (i@1@00 Int)) (!
  (=>
    (foo%precondition s@$ l@0@00 i@1@00)
    (forall ((j Int)) (!
      (=>
        (= i@1@00 j)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j))))))
            $Ref.null)
          true
          (foo%precondition (ite
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@0@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null))
            ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))
            ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@0@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j)))))) j)))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j)))))
      :pattern ((foo%limited (ite
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@0@00)
              ($SortWrappers.IntTo$Snap j))))))
            $Ref.null))
        ($PSF.lookup_list2 (sm@10@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j)))))
          ($SortWrappers.IntTo$Snap j)))
        ($PSF.lookup_list2 (sm@4@00 s@$ l@0@00 i@1@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@0@00)
            ($SortWrappers.IntTo$Snap j)))))
          ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@7@00 s@$ l@0@00 i@1@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@0@00)
        ($SortWrappers.IntTo$Snap j)))))) j))
      )))
  :pattern ((foo s@$ l@0@00 i@1@00))
  :qid |quant-u-10|)))
; WARNING: (2806,7): 'not' cannot be used in patterns.
; WARNING: (2806,7): 'if' cannot be used in patterns.
; ---------- list2 ----------
(declare-const this@13@00 $Ref)
(declare-const i@14@00 Int)
(push) ; 1
(declare-const $t@15@00 $Snap)
(assert (= $t@15@00 ($Snap.combine ($Snap.first $t@15@00) ($Snap.second $t@15@00))))
(assert (not (= this@13@00 $Ref.null)))
(assert (=
  ($Snap.second $t@15@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@00))
    ($Snap.second ($Snap.second $t@15@00)))))
; [eval] this.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@15@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@15@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:($t@15@00)) != Null | live]
; [else-branch: 4 | First:(Second:($t@15@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 4 | First:(Second:($t@15@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@15@00))) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 4 | First:(Second:($t@15@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@15@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@15@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
