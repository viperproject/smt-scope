(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:24:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/basic/recursive.vpr
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
(declare-sort $PSF<list> 0)
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
(declare-fun $SortWrappers.$PSF<list>To$Snap ($PSF<list>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<list> ($Snap) $PSF<list>)
(assert (forall ((x $PSF<list>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<list>($SortWrappers.$PSF<list>To$Snap x)))
    :pattern (($SortWrappers.$PSF<list>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<list>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<list>To$Snap($SortWrappers.$SnapTo$PSF<list> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<list> x))
    :qid |$Snap.$PSF<list>To$SnapTo$PSF<list>|
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
; /predicate_snap_functions_declarations.smt2 [list: Snap]
(declare-fun $PSF.domain_list ($PSF<list>) Set<$Snap>)
(declare-fun $PSF.lookup_list ($PSF<list> $Snap) $Snap)
(declare-fun $PSF.after_list ($PSF<list> $PSF<list>) Bool)
(declare-fun $PSF.loc_list ($Snap $Snap) Bool)
(declare-fun $PSF.perm_list ($PPM $Snap) $Perm)
(declare-const $psfTOP_list $PSF<list>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list%trigger ($Snap $Ref Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [list: Snap]
(assert (forall ((vs $PSF<list>) (ws $PSF<list>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_list vs) ($PSF.domain_list ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_list vs))
            (= ($PSF.lookup_list vs x) ($PSF.lookup_list ws x)))
          :pattern (($PSF.lookup_list vs x) ($PSF.lookup_list ws x))
          :qid |qp.$PSF<list>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<list>To$Snap vs)
              ($SortWrappers.$PSF<list>To$Snap ws)
              )
    :qid |qp.$PSF<list>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_list pm s))
    :pattern (($PSF.perm_list pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_list f s) true)
    :pattern (($PSF.loc_list f s)))))
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
; ---------- m1 ----------
(declare-const r@0@01 $Ref)
(declare-const length@1@01 Int)
(declare-const v@2@01 Int)
(declare-const r@3@01 $Ref)
(declare-const length@4@01 Int)
(declare-const v@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] length > 0
(assert (> length@4@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (unfolding acc(list(r, length), write) in r.val == v)
(push) ; 3
(assert (list%trigger ($Snap.first $t@7@01) r@3@01 length@4@01))
; [eval] i > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | length@4@01 > 0 | live]
; [else-branch: 0 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | length@4@01 > 0]
(assert (=
  ($Snap.first $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@7@01))
    ($Snap.second ($Snap.first $t@7@01)))))
(assert (not (= r@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
; [eval] i - 1
; [eval] r.val == v
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (list%trigger ($Snap.first $t@7@01) r@3@01 length@4@01))
(assert (=>
  (> length@4@01 0)
  (and
    (=
      ($Snap.first $t@7@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@7@01))
        ($Snap.second ($Snap.first $t@7@01))))
    (not (= r@3@01 $Ref.null))
    (=
      ($Snap.second ($Snap.first $t@7@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))) v@5@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(list(r, length), write)
; [eval] i > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | length@4@01 > 0 | live]
; [else-branch: 1 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | length@4@01 > 0]
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (not (= r@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
; [eval] i - 1
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.second $t@6@01) r@3@01 length@4@01))
; [exec]
; r.val := v
; [eval] length - 1 > 0
; [eval] length - 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> (- length@4@01 1) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> (- length@4@01 1) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | length@4@01 - 1 > 0 | live]
; [else-branch: 2 | !(length@4@01 - 1 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | length@4@01 - 1 > 0]
(assert (> (- length@4@01 1) 0))
; [exec]
; m1(r.next, length - 1, v)
; [eval] length - 1
; [eval] length > 0
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.second $t@8@01) $Snap.unit))
; [eval] (unfolding acc(list(r, length), write) in r.val == v)
(push) ; 5
(assert (list%trigger ($Snap.first $t@8@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) (-
  length@4@01
  1)))
; [eval] i > 0
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> (- length@4@01 1) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | length@4@01 - 1 > 0 | live]
; [else-branch: 3 | !(length@4@01 - 1 > 0) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | length@4@01 - 1 > 0]
(assert (=
  ($Snap.first $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@8@01))
    ($Snap.second ($Snap.first $t@8@01)))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  r@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@6@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  r@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@6@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i - 1
; [eval] r.val == v
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (list%trigger ($Snap.first $t@8@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) (-
  length@4@01
  1)))
(assert (=>
  (> (- length@4@01 1) 0)
  (and
    (=
      ($Snap.first $t@8@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@8@01))
        ($Snap.second ($Snap.first $t@8@01))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.first $t@8@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@8@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))))
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@8@01))) v@5@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(list(r, length), write)
; [eval] i > 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | length@4@01 > 0 | live]
; [else-branch: 4 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | length@4@01 > 0]
; [eval] i - 1
(assert (list%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.first $t@8@01))) r@3@01 length@4@01))
; [eval] (unfolding acc(list(r, length), write) in r.val == v)
(push) ; 6
; [eval] i > 0
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | length@4@01 > 0 | live]
; [else-branch: 5 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | length@4@01 > 0]
; [eval] i - 1
; [eval] r.val == v
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(length@4@01 - 1 > 0)]
(assert (not (> (- length@4@01 1) 0)))
(pop) ; 4
; [eval] !(length - 1 > 0)
; [eval] length - 1 > 0
; [eval] length - 1
(push) ; 4
(set-option :timeout 10)
(assert (not (> (- length@4@01 1) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> (- length@4@01 1) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(length@4@01 - 1 > 0) | live]
; [else-branch: 6 | length@4@01 - 1 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | !(length@4@01 - 1 > 0)]
(assert (not (> (- length@4@01 1) 0)))
; [exec]
; fold acc(list(r, length), write)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | length@4@01 > 0 | live]
; [else-branch: 7 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | length@4@01 > 0]
; [eval] i - 1
(assert (list%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))) r@3@01 length@4@01))
; [eval] (unfolding acc(list(r, length), write) in r.val == v)
(push) ; 6
; [eval] i > 0
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | length@4@01 > 0 | live]
; [else-branch: 8 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 8 | length@4@01 > 0]
; [eval] i - 1
; [eval] r.val == v
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 6 | length@4@01 - 1 > 0]
(assert (> (- length@4@01 1) 0))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const l1@9@01 $Ref)
(declare-const l2@10@01 $Ref)
(declare-const length@11@01 Int)
(declare-const v@12@01 Int)
(declare-const l1@13@01 $Ref)
(declare-const l2@14@01 $Ref)
(declare-const length@15@01 Int)
(declare-const v@16@01 Int)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.first $t@17@01) $Snap.unit))
; [eval] length > 0
(assert (> length@15@01 0))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (= ($Snap.first ($Snap.second $t@17@01)) $Snap.unit))
; [eval] l1 != l2
(assert (not (= l1@13@01 l2@14@01)))
(declare-const l@18@01 $Ref)
(push) ; 2
; [eval] (l in Set(l1, l2))
; [eval] Set(l1, l2)
(assert (Set_in l@18@01 (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
(pop) ; 2
(declare-fun inv@19@01 ($Ref Int) $Ref)
(declare-fun img@20@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((l1@18@01 $Ref) (l2@18@01 $Ref)) (!
  (=>
    (and
      (Set_in l1@18@01 (Set_unionone (Set_singleton l1@13@01) l2@14@01))
      (Set_in l2@18@01 (Set_unionone (Set_singleton l1@13@01) l2@14@01))
      (= l1@18@01 l2@18@01))
    (= l1@18@01 l2@18@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@18@01 $Ref)) (!
  (=>
    (Set_in l@18@01 (Set_unionone (Set_singleton l1@13@01) l2@14@01))
    (and
      (= (inv@19@01 l@18@01 length@15@01) l@18@01)
      (img@20@01 l@18@01 length@15@01)))
  :pattern ((Set_in l@18@01 (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
  :pattern ((inv@19@01 l@18@01 length@15@01))
  :pattern ((img@20@01 l@18@01 length@15@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (img@20@01 r i)
      (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
    (and (= (inv@19@01 r i) r) (= length@15@01 i)))
  :pattern ((inv@19@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(declare-const sm@22@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@22@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))
  ($Snap.first $t@21@01)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(declare-const sm@23@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@23@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l2@14@01)
    ($SortWrappers.IntTo$Snap length@15@01)))
  ($Snap.first ($Snap.second $t@21@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= l2@14@01 l1@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@21@01)) $Snap.unit))
; [eval] (unfolding acc(list(l1, length), write) in l1.val == v)
(set-option :timeout 0)
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite (and (= r l1@13@01) (= i length@15@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@25@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite (and (= r l2@14@01) (= i length@15@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@24@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@24@01 l1@13@01 length@15@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l1@13@01) (= i length@15@01))
    (= (- $Perm.Write (pTaken@24@01 r i)) $Perm.No))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@26@01 $PSF<list>)
(declare-const s@27@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))
      $Snap.unit))
  (=
    ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))
    ($PSF.lookup_list (as sm@22@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))
(assert (=>
  (= l1@13@01 l2@14@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($PSF.lookup_list (as sm@23@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
(assert (list%trigger ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l1@13@01)
  ($SortWrappers.IntTo$Snap length@15@01))) l1@13@01 length@15@01))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> length@15@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | length@15@01 > 0 | live]
; [else-branch: 9 | !(length@15@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | length@15@01 > 0]
(assert (=
  ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))
    ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))))
(assert (not (= l1@13@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))))
; [eval] i - 1
(declare-const sm@28@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@28@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1))))
  ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))
    l2@14@01)
  (= (- length@15@01 1) length@15@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= (- length@15@01 1) (- length@15@01 1)))
    $Perm.Write
    $Perm.No)))
; [eval] l1.val == v
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))
      $Snap.unit))
  (=
    ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))
    ($PSF.lookup_list (as sm@22@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))
  (=>
    (= l1@13@01 l2@14@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))
        ($PSF.lookup_list (as sm@23@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
  (list%trigger ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01))) l1@13@01 length@15@01)))
(assert (=>
  (> length@15@01 0)
  (and
    (=
      ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))
        ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
    (not (= l1@13@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))))))
(assert (=>
  (> length@15@01 0)
  (and
    (=
      ($PSF.lookup_list (as sm@28@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))))
    (<=
      $Perm.No
      (ite
        (and
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))))
          (= (- length@15@01 1) (- length@15@01 1)))
        $Perm.Write
        $Perm.No)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_list (as sm@26@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))
  v@16@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(list(l1, length), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@29@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@29@01 r i))
    $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@29@01 r i) $Perm.No)
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l1@13@01) (= i length@15@01))
    (= (- $Perm.Write (pTaken@29@01 r i)) $Perm.No))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@30@01 $PSF<list>)
(declare-const s@31@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@20@01 l1@13@01 length@15@01)
    (Set_in (inv@19@01 l1@13@01 length@15@01) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> length@15@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | length@15@01 > 0 | live]
; [else-branch: 10 | !(length@15@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | length@15@01 > 0]
(assert (=
  ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))
    ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))))
(assert (not (= l1@13@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))))
; [eval] i - 1
(declare-const sm@32@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@32@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1))))
  ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))))
(assert (<=
  $Perm.No
  (ite
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= (- length@15@01 1) (- length@15@01 1)))
    $Perm.Write
    $Perm.No)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l1@13@01)
  ($SortWrappers.IntTo$Snap length@15@01))) l1@13@01 length@15@01))
; [exec]
; l1.val := v
; [eval] length - 1 > 0
; [eval] length - 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> (- length@15@01 1) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> (- length@15@01 1) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | length@15@01 - 1 > 0 | live]
; [else-branch: 11 | !(length@15@01 - 1 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | length@15@01 - 1 > 0]
(assert (> (- length@15@01 1) 0))
; [exec]
; m1(l1.next, length - 1, v)
; [eval] length - 1
; [eval] length > 0
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    ($Perm.min
      (ite
        (and
          (=
            r
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))))
          (= i (- length@15@01 1)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@34@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@33@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))))
        (= (- length@15@01 1) (- length@15@01 1)))
      $Perm.Write
      $Perm.No)
    (pTaken@33@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    (= (- $Perm.Write (pTaken@33@01 r i)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@35@01 $PSF<list>)
(declare-const s@36@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@20@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))
      (Set_in (inv@19@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
    (<
      $Perm.No
      (-
        $Perm.Write
        (pTaken@29@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@35@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
    (= (- length@15@01 1) (- length@15@01 1)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@35@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($PSF.lookup_list (as sm@32@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(declare-const sm@38@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@38@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1))))
  ($Snap.first $t@37@01)))
(assert (= ($Snap.second $t@37@01) $Snap.unit))
; [eval] (unfolding acc(list(r, length), write) in r.val == v)
(set-option :timeout 0)
(push) ; 5
; Precomputing data for removing quantified permissions
(define-fun pTaken@39@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    ($Perm.min
      (ite
        (and
          (=
            r
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))))
          (= i (- length@15@01 1)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@40@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@39@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))))
        (= (- length@15@01 1) (- length@15@01 1)))
      $Perm.Write
      $Perm.No)
    (pTaken@39@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    (= (- $Perm.Write (pTaken@39@01 r i)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@41@01 $PSF<list>)
(declare-const s@42@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@20@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))
      (Set_in (inv@19@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
    (<
      $Perm.No
      (-
        $Perm.Write
        (pTaken@29@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
    (= (- length@15@01 1) (- length@15@01 1)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($PSF.lookup_list (as sm@38@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
(assert (list%trigger ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))
  ($SortWrappers.IntTo$Snap (- length@15@01 1)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l1@13@01)
  ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> (- length@15@01 1) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | length@15@01 - 1 > 0 | live]
; [else-branch: 12 | !(length@15@01 - 1 > 0) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 12 | length@15@01 - 1 > 0]
(assert (=
  ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($SortWrappers.IntTo$Snap (- length@15@01 1)))))
    ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  l1@13@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($SortWrappers.IntTo$Snap (- length@15@01 1))))))
    ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($SortWrappers.IntTo$Snap (- length@15@01 1)))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  l1@13@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i - 1
(declare-const sm@43@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@43@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($SortWrappers.IntTo$Snap (- length@15@01 1))))))
    ($SortWrappers.IntTo$Snap (- (- length@15@01 1) 1))))
  ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
(assert (<=
  $Perm.No
  (ite
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
      (= (- (- length@15@01 1) 1) (- (- length@15@01 1) 1)))
    $Perm.Write
    $Perm.No)))
; [eval] r.val == v
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (and
  (=>
    (ite
      (and
        (img@20@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))
        (Set_in (inv@19@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@29@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))
            ($SortWrappers.IntTo$Snap (- length@15@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))))))
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= (- length@15@01 1) (- length@15@01 1)))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))
            ($SortWrappers.IntTo$Snap (- length@15@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1))))
        ($PSF.lookup_list (as sm@38@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))))))
  (list%trigger ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))))
(assert (=>
  (> (- length@15@01 1) 0)
  (and
    (=
      ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))))
        ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
        $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1))))))
        ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))))))))))
(assert (=>
  (> (- length@15@01 1) 0)
  (and
    (=
      ($PSF.lookup_list (as sm@43@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1))))))
        ($SortWrappers.IntTo$Snap (- (- length@15@01 1) 1))))
      ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1)))))))
    (<=
      $Perm.No
      (ite
        (and
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l1@13@01)
                ($SortWrappers.IntTo$Snap length@15@01)))))
              ($SortWrappers.IntTo$Snap (- length@15@01 1)))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l1@13@01)
                ($SortWrappers.IntTo$Snap length@15@01)))))
              ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
          (= (- (- length@15@01 1) 1) (- (- length@15@01 1) 1)))
        $Perm.Write
        $Perm.No)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1))))))
  v@16@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(list(l1, length), write)
; [eval] i > 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> length@15@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | length@15@01 > 0 | live]
; [else-branch: 13 | !(length@15@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | length@15@01 > 0]
; [eval] i - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@44@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    ($Perm.min
      (ite
        (and
          (=
            r
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))))
          (= i (- length@15@01 1)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@45@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@44@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))))
        (= (- length@15@01 1) (- length@15@01 1)))
      $Perm.Write
      $Perm.No)
    (pTaken@44@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    (= (- $Perm.Write (pTaken@44@01 r i)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (list%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($SortWrappers.IntTo$Snap (- length@15@01 1)))))) l1@13@01 length@15@01))
(declare-const sm@46@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@46@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap v@16@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($PSF.lookup_list (as sm@41@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@47@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite (and (= r l1@13@01) (= i length@15@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@48@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@47@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@47@01 l1@13@01 length@15@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l1@13@01) (= i length@15@01))
    (= (- $Perm.Write (pTaken@47@01 r i)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $PSF<list>)
(declare-const s@50@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))
      $Snap.unit))
  (=
    ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))
    ($PSF.lookup_list (as sm@46@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))
(assert (=>
  (ite
    (and
      (img@20@01 l1@13@01 length@15@01)
      (Set_in (inv@19@01 l1@13@01 length@15@01) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
    (< $Perm.No (- $Perm.Write (pTaken@29@01 l1@13@01 length@15@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l2@14@01) (= i length@15@01))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (pTaken@51@01 r i))
    $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l2@14@01) (= i length@15@01))
    (= (- $Perm.Write (pTaken@51@01 r i)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $PSF<list>)
(declare-const s@53@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@20@01 l2@14@01 length@15@01)
      (Set_in (inv@19@01 l2@14@01 length@15@01) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
    (< $Perm.No (- $Perm.Write (pTaken@29@01 l2@14@01 length@15@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l2@14@01)
          ($SortWrappers.IntTo$Snap length@15@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@52@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l2@14@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l2@14@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
; [eval] (unfolding acc(list(l1, length), write) in l1.val == v)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite (and (= r l1@13@01) (= i length@15@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@55@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@54@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@54@01 l1@13@01 length@15@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l1@13@01) (= i length@15@01))
    (= (- $Perm.Write (pTaken@54@01 r i)) $Perm.No))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))
      $Snap.unit))
  (=
    ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))
    ($PSF.lookup_list (as sm@46@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))
(assert (list%trigger ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l1@13@01)
  ($SortWrappers.IntTo$Snap length@15@01))) l1@13@01 length@15@01))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> length@15@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | length@15@01 > 0 | live]
; [else-branch: 14 | !(length@15@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 14 | length@15@01 > 0]
(assert (=
  ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))
    ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))))
(assert (=
  ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))))
; [eval] i - 1
(declare-const sm@56@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@56@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1))))
  ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))))
(assert (<=
  $Perm.No
  (ite
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= (- length@15@01 1) (- length@15@01 1)))
    $Perm.Write
    $Perm.No)))
; [eval] l1.val == v
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))
      $Snap.unit))
  (=
    ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))
    ($PSF.lookup_list (as sm@46@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))
  (list%trigger ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01))) l1@13@01 length@15@01)))
(assert (=>
  (> length@15@01 0)
  (and
    (=
      ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))
        ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
    (=
      ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))))))
(assert (=>
  (> length@15@01 0)
  (and
    (=
      ($PSF.lookup_list (as sm@56@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))))
    (<=
      $Perm.No
      (ite
        (and
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))))
          (= (- length@15@01 1) (- length@15@01 1)))
        $Perm.Write
        $Perm.No)))))
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))
  v@16@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_list (as sm@49@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))
  v@16@01))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(length@15@01 - 1 > 0)]
(assert (not (> (- length@15@01 1) 0)))
(pop) ; 4
; [eval] !(length - 1 > 0)
; [eval] length - 1 > 0
; [eval] length - 1
(push) ; 4
(set-option :timeout 10)
(assert (not (> (- length@15@01 1) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> (- length@15@01 1) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | !(length@15@01 - 1 > 0) | live]
; [else-branch: 15 | length@15@01 - 1 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | !(length@15@01 - 1 > 0)]
(assert (not (> (- length@15@01 1) 0)))
; [exec]
; fold acc(list(l1, length), write)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> length@15@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | length@15@01 > 0 | live]
; [else-branch: 16 | !(length@15@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | length@15@01 > 0]
; [eval] i - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@57@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    ($Perm.min
      (ite
        (and
          (=
            r
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))))
          (= i (- length@15@01 1)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@58@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@57@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))))
        (= (- length@15@01 1) (- length@15@01 1)))
      $Perm.Write
      $Perm.No)
    (pTaken@57@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= i (- length@15@01 1)))
    (= (- $Perm.Write (pTaken@57@01 r i)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@59@01 $PSF<list>)
(declare-const s@60@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@20@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))
      (Set_in (inv@19@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1)) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
    (<
      $Perm.No
      (-
        $Perm.Write
        (pTaken@29@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))) (- length@15@01 1))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@59@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
    (= (- length@15@01 1) (- length@15@01 1)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l1@13@01)
            ($SortWrappers.IntTo$Snap length@15@01)))))
          ($SortWrappers.IntTo$Snap (- length@15@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@59@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($PSF.lookup_list (as sm@32@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($PSF.lookup_list (as sm@59@01  $PSF<list>) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($SortWrappers.IntTo$Snap (- length@15@01 1)))))) l1@13@01 length@15@01))
(declare-const sm@61@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@61@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap v@16@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))
      ($PSF.lookup_list (as sm@59@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@30@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite (and (= r l1@13@01) (= i length@15@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@63@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@62@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@62@01 l1@13@01 length@15@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l1@13@01) (= i length@15@01))
    (= (- $Perm.Write (pTaken@62@01 r i)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@64@01 $PSF<list>)
(declare-const s@65@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))
      $Snap.unit))
  (=
    ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))
    ($PSF.lookup_list (as sm@61@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))
(assert (=>
  (ite
    (and
      (img@20@01 l1@13@01 length@15@01)
      (Set_in (inv@19@01 l1@13@01 length@15@01) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
    (< $Perm.No (- $Perm.Write (pTaken@29@01 l1@13@01 length@15@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@66@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l2@14@01) (= i length@15@01))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (pTaken@66@01 r i))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l2@14@01) (= i length@15@01))
    (= (- $Perm.Write (pTaken@66@01 r i)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@67@01 $PSF<list>)
(declare-const s@68@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@20@01 l2@14@01 length@15@01)
      (Set_in (inv@19@01 l2@14@01 length@15@01) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
    (< $Perm.No (- $Perm.Write (pTaken@29@01 l2@14@01 length@15@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l2@14@01)
          ($SortWrappers.IntTo$Snap length@15@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@67@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l2@14@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second ($Snap.second $t@17@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l2@14@01)
        ($SortWrappers.IntTo$Snap length@15@01)))))))
; [eval] (unfolding acc(list(l1, length), write) in l1.val == v)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@69@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite (and (= r l1@13@01) (= i length@15@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@70@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l1@13@01) (= i length@15@01))
    ($Perm.min
      (ite
        (and
          (img@20@01 r i)
          (Set_in (inv@19@01 r i) (Set_unionone (Set_singleton l1@13@01) l2@14@01)))
        (- $Perm.Write (pTaken@29@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@69@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@69@01 l1@13@01 length@15@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l1@13@01) (= i length@15@01))
    (= (- $Perm.Write (pTaken@69@01 r i)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))
      $Snap.unit))
  (=
    ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))
    ($PSF.lookup_list (as sm@61@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))
(assert (list%trigger ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l1@13@01)
  ($SortWrappers.IntTo$Snap length@15@01))) l1@13@01 length@15@01))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> length@15@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | length@15@01 > 0 | live]
; [else-branch: 17 | !(length@15@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 17 | length@15@01 > 0]
(assert (=
  ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))
    ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))))
(assert (=
  ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))))))
; [eval] i - 1
(declare-const sm@71@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@71@01  $PSF<list>) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))))
    ($SortWrappers.IntTo$Snap (- length@15@01 1))))
  ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))))
(assert (<=
  $Perm.No
  (ite
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))))
      (= (- length@15@01 1) (- length@15@01 1)))
    $Perm.Write
    $Perm.No)))
; [eval] l1.val == v
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))
      $Snap.unit))
  (=
    ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01)))
    ($PSF.lookup_list (as sm@61@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l1@13@01)
      ($SortWrappers.IntTo$Snap length@15@01))))
  (list%trigger ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01))) l1@13@01 length@15@01)))
(assert (=>
  (> length@15@01 0)
  (and
    (=
      ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))
        ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))
    (=
      ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01))))))))))
(assert (=>
  (> length@15@01 0)
  (and
    (=
      ($PSF.lookup_list (as sm@71@01  $PSF<list>) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l1@13@01)
          ($SortWrappers.IntTo$Snap length@15@01)))))
        ($SortWrappers.IntTo$Snap (- length@15@01 1))))
      ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l1@13@01)
        ($SortWrappers.IntTo$Snap length@15@01))))))
    (<=
      $Perm.No
      (ite
        (and
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l1@13@01)
              ($SortWrappers.IntTo$Snap length@15@01)))))))
          (= (- length@15@01 1) (- length@15@01 1)))
        $Perm.Write
        $Perm.No)))))
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))
  v@16@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l1@13@01)
    ($SortWrappers.IntTo$Snap length@15@01)))))
  v@16@01))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 15 | length@15@01 - 1 > 0]
(assert (> (- length@15@01 1) 0))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
