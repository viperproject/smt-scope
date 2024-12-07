(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:04:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0455.vpr
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
(declare-sort $FVF<next> 0)
(declare-sort $PSF<list2> 0)
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
; /predicate_snap_functions_declarations.smt2 [list: Snap]
(declare-fun $PSF.domain_list ($PSF<list>) Set<$Snap>)
(declare-fun $PSF.lookup_list ($PSF<list> $Snap) $Snap)
(declare-fun $PSF.after_list ($PSF<list> $PSF<list>) Bool)
(declare-fun $PSF.loc_list ($Snap $Snap) Bool)
(declare-fun $PSF.perm_list ($PPM $Snap) $Perm)
(declare-const $psfTOP_list $PSF<list>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun length3_impl ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length3_impl%limited ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length3_impl%stateless (Set<$Ref> $Ref Int Int) Bool)
(declare-fun length3_impl%precondition ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length_impl ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length_impl%limited ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length_impl%stateless (Set<$Ref> $Ref Int Int) Bool)
(declare-fun length_impl%precondition ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length2_impl ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length2_impl%limited ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length2_impl%stateless (Set<$Ref> $Ref Int Int) Bool)
(declare-fun length2_impl%precondition ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun foo ($Snap $Ref Int) Bool)
(declare-fun foo%limited ($Snap $Ref Int) Bool)
(declare-fun foo%stateless ($Ref Int) Bool)
(declare-fun foo%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list2%trigger ($Snap $Ref Int) Bool)
(declare-fun list%trigger ($Snap $Ref) Bool)
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
(declare-fun $k@19@00 () $Perm)
(declare-fun inv@22@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@23@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun sm@20@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun joined_unfolding@50@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun $k@27@00 () $Perm)
(declare-fun $k@28@00 () $Perm)
(declare-fun $k@35@00 () $Perm)
(declare-fun $k@43@00 () $Perm)
(declare-fun inv@36@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@37@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun inv@44@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@45@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun sm@24@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@29@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
(declare-fun sm@30@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@31@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
(declare-fun sm@40@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@48@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@51@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@52@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun joined_unfolding@63@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun sm@56@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@58@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
(declare-fun sm@59@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@60@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
(declare-fun sm@61@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@53@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@64@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun $k@66@00 () $Perm)
(declare-fun inv@67@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@68@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun joined_unfolding@95@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun $k@72@00 () $Perm)
(declare-fun $k@73@00 () $Perm)
(declare-fun $k@80@00 () $Perm)
(declare-fun $k@88@00 () $Perm)
(declare-fun inv@81@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@82@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun inv@89@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@90@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun sm@69@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@74@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
(declare-fun sm@75@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@76@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
(declare-fun sm@85@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@93@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@96@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@97@00 ($Snap $Ref Int) $PSF<list2>)
(declare-fun joined_unfolding@106@00 ($Snap $Ref Int Int) Bool)
(declare-fun sm@101@00 ($Snap $Ref Int) $PSF<list2>)
(declare-fun sm@103@00 ($Snap $Ref Int Int) $PSF<list2>)
(declare-fun sm@104@00 ($Snap $Ref Int) $PSF<list2>)
(declare-fun sm@98@00 ($Snap $Ref Int) $PSF<list2>)
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref) (akk@2@00 Int) (res@3@00 Int)) (!
  (=
    (length3_impl%limited s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)
    (length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :pattern ((length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref) (akk@2@00 Int) (res@3@00 Int)) (!
  (length3_impl%stateless xs@0@00 y@1@00 akk@2@00 res@3@00)
  :pattern ((length3_impl%limited s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref) (akk@2@00 Int) (res@3@00 Int)) (!
  (and
    (forall ((x@18@00 $Ref)) (!
      (=>
        (and (Set_in x@18@00 xs@0@00) (< $Perm.No $k@19@00))
        (and
          (= (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@18@00) x@18@00)
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@18@00)))
      :pattern ((Set_in x@18@00 xs@0@00))
      :pattern (($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@18@00)) ($SortWrappers.$RefTo$Snap x@18@00)))
      :qid |quant-u-9|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
          (and
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (< $Perm.No $k@19@00)))
        (= (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
      :pattern ((inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |list-fctOfInv|))
    (forall ((x@34@00 $Ref)) (!
      (=>
        (and (Set_in x@34@00 xs@0@00) (< $Perm.No $k@35@00))
        (and
          (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00) x@34@00)
          (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00)))
      :pattern ((Set_in x@34@00 xs@0@00))
      :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
      :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
      :qid |list-invOfFct|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
          (and
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (< $Perm.No $k@35@00)))
        (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
      :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |list-fctOfInv|))
    (forall ((x@42@00 $Ref)) (!
      (=>
        (and (Set_in x@42@00 xs@0@00) (< $Perm.No $k@43@00))
        (and
          (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00) x@42@00)
          (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00)))
      :pattern ((Set_in x@42@00 xs@0@00))
      :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
      :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
      :qid |list-invOfFct|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
          (and
            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (< $Perm.No $k@43@00)))
        (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
      :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |list-fctOfInv|))
    (forall ((s@21@00 $Snap)) (!
      true
      :pattern (($PSF.lookup_list (sm@20@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@21@00))
      :qid |qp.psmResTrgDef0|))
    (forall ((s@25@00 $Snap)) (!
      (=>
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@25@00))
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@25@00)) xs@0@00))
          (< $Perm.No $k@19@00)
          false)
        (and
          (not (= s@25@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@25@00)
            ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@25@00))))
      :pattern (($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@25@00))
      :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@25@00))
      :qid |qp.psmValDef1|))
    (forall ((s@25@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@25@00) s@25@00)
      :pattern (($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@25@00))
      :qid |qp.psmResTrgDef2|))
    (forall ((s@41@00 $Snap)) (!
      (and
        (=>
          (Set_in s@41@00 ($PSF.domain_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)))
          (and
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
            (< $Perm.No $k@35@00)
            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))))
        (=>
          (and
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
            (< $Perm.No $k@35@00)
            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
          (Set_in s@41@00 ($PSF.domain_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)))))
      :pattern ((Set_in s@41@00 ($PSF.domain_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))))
      :qid |qp.psmDomDef14|))
    (forall ((s@49@00 $Snap)) (!
      (and
        (=>
          (Set_in s@49@00 ($PSF.domain_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)))
          (and
            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00)
            (< $Perm.No $k@43@00)
            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))))
        (=>
          (and
            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00)
            (< $Perm.No $k@43@00)
            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)))
          (Set_in s@49@00 ($PSF.domain_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)))))
      :pattern ((Set_in s@49@00 ($PSF.domain_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))))
      :qid |qp.psmDomDef20|))
    (forall ((s@49@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00) s@49@00)
      :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
      :qid |qp.psmResTrgDef19|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@51@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :qid |qp.fvfResTrgDef21|))
    ($Perm.isReadVar $k@19@00)
    ($Perm.isReadVar $k@27@00)
    ($Perm.isReadVar $k@28@00)
    ($Perm.isReadVar $k@35@00)
    ($Perm.isReadVar $k@43@00)
    (=>
      (length3_impl%precondition s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)
      (=
        (length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)
        (forall ((x $Ref)) (!
          (=>
            (and (Set_in x xs@0@00) (= x y@1@00))
            (ite
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
                $Ref.null)
              (= res@3@00 akk@2@00)
              (length3_impl%limited (ite
                (not
                  (=
                    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
                    $Ref.null))
                ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
                ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x) (+
                akk@2@00
                1) res@3@00)))
          :pattern ((Set_in x xs@0@00))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x))))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x))
          )))))
  :pattern ((length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref) (akk@2@00 Int) (res@3@00 Int)) (!
  (=>
    (length3_impl%precondition s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)
    (forall ((x $Ref)) (!
      (=>
        (and (Set_in x xs@0@00) (= x y@1@00))
        (ite
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
            $Ref.null)
          true
          (length3_impl%precondition (ite
            (not
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
                $Ref.null))
            ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
            ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x) (+
            akk@2@00
            1) res@3@00)))
      :pattern ((Set_in x xs@0@00))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x))))
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x))
      )))
  :pattern ((length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Set<$Ref>) (y@6@00 $Ref) (akk@7@00 Int) (res@8@00 Int)) (!
  (=
    (length_impl%limited s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)
    (length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :pattern ((length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Set<$Ref>) (y@6@00 $Ref) (akk@7@00 Int) (res@8@00 Int)) (!
  (length_impl%stateless xs@5@00 y@6@00 akk@7@00 res@8@00)
  :pattern ((length_impl%limited s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Set<$Ref>) (y@6@00 $Ref) (akk@7@00 Int) (res@8@00 Int)) (!
  (and
    (=
      ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap y@6@00))
      s@$)
    (forall ((s@57@00 $Snap)) (!
      (=>
        (= ($SortWrappers.$SnapTo$Ref s@57@00) y@6@00)
        (and
          (not (= s@57@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00)
            ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))))
      :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
      :pattern (($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
      :qid |qp.psmValDef23|))
    (forall ((s@57@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00) s@57@00)
      :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
      :qid |qp.psmResTrgDef24|))
    (forall ((s@54@00 $Snap)) (!
      true
      :pattern (($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@54@00))
      :qid |qp.psmResTrgDef22|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@64@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :qid |qp.fvfResTrgDef29|))
    (=>
      (length_impl%precondition s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)
      (=
        (length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)
        (forall ((x $Ref)) (!
          (=>
            (and (Set_in x xs@5@00) (= x y@6@00))
            (ite
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
                $Ref.null)
              (= res@8@00 akk@7@00)
              (length_impl%limited (ite
                (not
                  (=
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
                    $Ref.null))
                ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)))
                ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x) (+
                akk@7@00
                1) res@8@00)))
          :pattern ((Set_in x xs@5@00))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x))))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x))
          )))))
  :pattern ((length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Set<$Ref>) (y@6@00 $Ref) (akk@7@00 Int) (res@8@00 Int)) (!
  (=>
    (length_impl%precondition s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)
    (forall ((x $Ref)) (!
      (=>
        (and (Set_in x xs@5@00) (= x y@6@00))
        (ite
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
            $Ref.null)
          true
          (length_impl%precondition (ite
            (not
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
                $Ref.null))
            ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)))
            ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x) (+
            akk@7@00
            1) res@8@00)))
      :pattern ((Set_in x xs@5@00))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x))))
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x))
      )))
  :pattern ((length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Set<$Ref>) (y@11@00 $Ref) (akk@12@00 Int) (res@13@00 Int)) (!
  (=
    (length2_impl%limited s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)
    (length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :pattern ((length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Set<$Ref>) (y@11@00 $Ref) (akk@12@00 Int) (res@13@00 Int)) (!
  (length2_impl%stateless xs@10@00 y@11@00 akk@12@00 res@13@00)
  :pattern ((length2_impl%limited s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Set<$Ref>) (y@11@00 $Ref) (akk@12@00 Int) (res@13@00 Int)) (!
  (and
    (forall ((x@65@00 $Ref)) (!
      (=>
        (and (Set_in x@65@00 xs@10@00) (< $Perm.No $k@66@00))
        (and
          (=
            (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00)
            x@65@00)
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00)))
      :pattern ((Set_in x@65@00 xs@10@00))
      :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
      :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
      :qid |quant-u-36|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
          (and
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (< $Perm.No $k@66@00)))
        (= (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
      :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |list-fctOfInv|))
    (forall ((x@79@00 $Ref)) (!
      (=>
        (and (Set_in x@79@00 xs@10@00) (< $Perm.No $k@80@00))
        (and
          (=
            (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00)
            x@79@00)
          (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00)))
      :pattern ((Set_in x@79@00 xs@10@00))
      :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
      :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
      :qid |list-invOfFct|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (< $Perm.No $k@80@00)))
        (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
      :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |list-fctOfInv|))
    (forall ((x@87@00 $Ref)) (!
      (=>
        (and (Set_in x@87@00 xs@10@00) (< $Perm.No $k@88@00))
        (and
          (=
            (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00)
            x@87@00)
          (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00)))
      :pattern ((Set_in x@87@00 xs@10@00))
      :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
      :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
      :qid |list-invOfFct|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
          (and
            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (< $Perm.No $k@88@00)))
        (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
      :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |list-fctOfInv|))
    (forall ((s@70@00 $Snap)) (!
      (=>
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@70@00))
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@70@00)) xs@10@00))
          (< $Perm.No $k@66@00)
          false)
        (and
          (not (= s@70@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@70@00)
            ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@70@00))))
      :pattern (($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@70@00))
      :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@70@00))
      :qid |qp.psmValDef30|))
    (forall ((s@70@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@70@00) s@70@00)
      :pattern (($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@70@00))
      :qid |qp.psmResTrgDef31|))
    (forall ((s@86@00 $Snap)) (!
      (and
        (=>
          (Set_in s@86@00 ($PSF.domain_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)))
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
            (< $Perm.No $k@80@00)
            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))))
        (=>
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
            (< $Perm.No $k@80@00)
            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
          (Set_in s@86@00 ($PSF.domain_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)))))
      :pattern ((Set_in s@86@00 ($PSF.domain_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))))
      :qid |qp.psmDomDef43|))
    (forall ((s@94@00 $Snap)) (!
      (and
        (=>
          (Set_in s@94@00 ($PSF.domain_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)))
          (and
            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00)
            (< $Perm.No $k@88@00)
            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))))
        (=>
          (and
            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00)
            (< $Perm.No $k@88@00)
            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)))
          (Set_in s@94@00 ($PSF.domain_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)))))
      :pattern ((Set_in s@94@00 ($PSF.domain_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))))
      :qid |qp.psmDomDef49|))
    (forall ((s@94@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00) s@94@00)
      :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
      :qid |qp.psmResTrgDef48|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@96@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :qid |qp.fvfResTrgDef50|))
    ($Perm.isReadVar $k@66@00)
    ($Perm.isReadVar $k@72@00)
    ($Perm.isReadVar $k@73@00)
    ($Perm.isReadVar $k@80@00)
    ($Perm.isReadVar $k@88@00)
    (=>
      (length2_impl%precondition s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)
      (=
        (length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)
        (forall ((x $Ref)) (!
          (=>
            (and (Set_in x xs@10@00) (= x y@11@00))
            (ite
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
                $Ref.null)
              (= res@13@00 akk@12@00)
              (length2_impl%limited (ite
                (not
                  (=
                    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
                    $Ref.null))
                ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
                ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x) (+
                akk@12@00
                1) res@13@00)))
          :pattern ((Set_in x xs@10@00))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x))))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x))
          )))))
  :pattern ((length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :qid |quant-u-51|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Set<$Ref>) (y@11@00 $Ref) (akk@12@00 Int) (res@13@00 Int)) (!
  (=>
    (length2_impl%precondition s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)
    (forall ((x $Ref)) (!
      (=>
        (and (Set_in x xs@10@00) (= x y@11@00))
        (ite
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
            $Ref.null)
          true
          (length2_impl%precondition (ite
            (not
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
                $Ref.null))
            ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
            ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x) (+
            akk@12@00
            1) res@13@00)))
      :pattern ((Set_in x xs@10@00))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x))))
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x))
      )))
  :pattern ((length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (= (foo%limited s@$ l@15@00 i@16@00) (foo s@$ l@15@00 i@16@00))
  :pattern ((foo s@$ l@15@00 i@16@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (foo%stateless l@15@00 i@16@00)
  :pattern ((foo%limited s@$ l@15@00 i@16@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (and
    (=
      ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap i@16@00)))
      s@$)
    (forall ((s@102@00 $Snap)) (!
      (=>
        (and
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@102@00)) l@15@00)
          (= ($SortWrappers.$SnapToInt ($Snap.second s@102@00)) i@16@00))
        (and
          (not (= s@102@00 $Snap.unit))
          (=
            ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) s@102@00)
            ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) s@102@00))))
      :pattern (($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) s@102@00))
      :pattern (($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) s@102@00))
      :qid |qp.psmValDef52|))
    (forall ((s@102@00 $Snap)) (!
      ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) s@102@00) s@102@00)
      :pattern (($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) s@102@00))
      :qid |qp.psmResTrgDef53|))
    (forall ((s@99@00 $Snap)) (!
      true
      :pattern (($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) s@99@00))
      :qid |qp.psmResTrgDef51|))
    (=>
      (foo%precondition s@$ l@15@00 i@16@00)
      (=
        (foo s@$ l@15@00 i@16@00)
        (forall ((j Int)) (!
          (=>
            (= i@16@00 j)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null)
              true
              (foo%limited (ite
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j))))))
                    $Ref.null))
                ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j)))))
                  ($SortWrappers.IntTo$Snap j)))
                ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j)))))
                  ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))) j)))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))
          :pattern ((foo%limited (ite
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null))
            ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))
            ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))) j))
          )))))
  :pattern ((foo s@$ l@15@00 i@16@00))
  :qid |quant-u-60|)))
; WARNING: (1332,11): 'not' cannot be used in patterns.
; WARNING: (1332,11): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (=>
    (foo%precondition s@$ l@15@00 i@16@00)
    (forall ((j Int)) (!
      (=>
        (= i@16@00 j)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j))))))
            $Ref.null)
          true
          (foo%precondition (ite
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null))
            ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))
            ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))) j)))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j)))))
      :pattern ((foo%limited (ite
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j))))))
            $Ref.null))
        ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))
          ($SortWrappers.IntTo$Snap j)))
        ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))
          ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j)))))) j))
      )))
  :pattern ((foo s@$ l@15@00 i@16@00))
  :qid |quant-u-61|)))
; WARNING: (1389,7): 'not' cannot be used in patterns.
; WARNING: (1389,7): 'if' cannot be used in patterns.
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test_foo1 ----------
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
; var x1: Ref
(declare-const x1@0@01 $Ref)
; [exec]
; x1 := new(elem, next)
(declare-const x1@1@01 $Ref)
(assert (not (= x1@1@01 $Ref.null)))
(declare-const elem@2@01 Int)
(declare-const next@3@01 $Ref)
(assert (not (= x1@1@01 x1@0@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list2(x1, 77), write)
; [eval] this.next != null
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 3
; [else-branch: 0 | True]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77))
; [exec]
; assert foo(x1, 77)
; [eval] foo(x1, 77)
(push) ; 4
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77))
(pop) ; 4
; Joined path conditions
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77))
(push) ; 4
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_foo2 ----------
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
; var x1: Ref
(declare-const x1@4@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@5@01 $Ref)
; [exec]
; x1 := new(elem, next)
(declare-const x1@6@01 $Ref)
(assert (not (= x1@6@01 $Ref.null)))
(declare-const elem@7@01 Int)
(declare-const next@8@01 $Ref)
(assert (not (= x1@6@01 x1@4@01)))
(assert (not (= x1@6@01 x2@5@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list2(x1, 77), write)
; [eval] this.next != null
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 3
; [else-branch: 1 | True]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@7@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@6@01 77))
; [exec]
; x2 := new(elem, next)
(declare-const x2@9@01 $Ref)
(assert (not (= x2@9@01 $Ref.null)))
(declare-const elem@10@01 Int)
(declare-const next@11@01 $Ref)
(assert (not (= x2@9@01 x2@5@01)))
(assert (not (= x2@9@01 x1@6@01)))
; [exec]
; x2.next := x1
; [exec]
; fold acc(list2(x2, 77), write)
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x1@6@01 != Null | live]
; [else-branch: 2 | x1@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | x1@6@01 != Null]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77))
; [exec]
; assert foo(x2, 77)
; [eval] foo(x2, 77)
(push) ; 5
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77))
(pop) ; 5
; Joined path conditions
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77))
(push) ; 5
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x2, 77)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x2, 77)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x2, 77)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_foo4 ----------
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
; var x1: Ref
(declare-const x1@12@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@13@01 $Ref)
; [exec]
; var x3: Ref
(declare-const x3@14@01 $Ref)
; [exec]
; var x4: Ref
(declare-const x4@15@01 $Ref)
; [exec]
; x1 := new(elem, next)
(declare-const x1@16@01 $Ref)
(assert (not (= x1@16@01 $Ref.null)))
(declare-const elem@17@01 Int)
(declare-const next@18@01 $Ref)
(assert (not (= x1@16@01 x4@15@01)))
(assert (not (= x1@16@01 x1@12@01)))
(assert (not (= x1@16@01 x2@13@01)))
(assert (not (= x1@16@01 x3@14@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list2(x1, 77), write)
; [eval] this.next != null
; [then-branch: 3 | False | dead]
; [else-branch: 3 | True | live]
(push) ; 3
; [else-branch: 3 | True]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@17@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@16@01 77))
; [exec]
; x2 := new(elem, next)
(declare-const x2@19@01 $Ref)
(assert (not (= x2@19@01 $Ref.null)))
(declare-const elem@20@01 Int)
(declare-const next@21@01 $Ref)
(assert (not (= x2@19@01 x4@15@01)))
(assert (not (= x2@19@01 x1@16@01)))
(assert (not (= x2@19@01 x2@13@01)))
(assert (not (= x2@19@01 x3@14@01)))
; [exec]
; x2.next := x1
; [exec]
; fold acc(list2(x2, 77), write)
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@16@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | x1@16@01 != Null | live]
; [else-branch: 4 | x1@16@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | x1@16@01 != Null]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@20@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@16@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@17@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@19@01 77))
; [exec]
; x3 := new(elem, next)
(declare-const x3@22@01 $Ref)
(assert (not (= x3@22@01 $Ref.null)))
(declare-const elem@23@01 Int)
(declare-const next@24@01 $Ref)
(assert (not (= x3@22@01 x4@15@01)))
(assert (not (= x3@22@01 x1@16@01)))
(assert (not (= x3@22@01 x2@19@01)))
(assert (not (= x3@22@01 x3@14@01)))
; [exec]
; x3.next := x2
; [exec]
; fold acc(list2(x3, 77), write)
; [eval] this.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@19@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | x2@19@01 != Null | live]
; [else-branch: 5 | x2@19@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | x2@19@01 != Null]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@23@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@19@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@20@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x1@16@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))) x3@22@01 77))
; [exec]
; x4 := new(elem, next)
(declare-const x4@25@01 $Ref)
(assert (not (= x4@25@01 $Ref.null)))
(declare-const elem@26@01 Int)
(declare-const next@27@01 $Ref)
(assert (not (= x4@25@01 x4@15@01)))
(assert (not (= x4@25@01 x1@16@01)))
(assert (not (= x4@25@01 x2@19@01)))
(assert (not (= x4@25@01 x3@22@01)))
; [exec]
; x4.next := x3
; [exec]
; fold acc(list2(x4, 77), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@22@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | x3@22@01 != Null | live]
; [else-branch: 6 | x3@22@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | x3@22@01 != Null]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77))
; [exec]
; assert foo(x4, 77)
; [eval] foo(x4, 77)
(push) ; 7
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77))
(pop) ; 7
; Joined path conditions
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77))
(push) ; 7
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77)))
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
; [eval] foo(x4, 77)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77)))
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
; [eval] foo(x4, 77)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77)))
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
; [eval] foo(x4, 77)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77)))
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
; ---------- test_length1 ----------
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
; var x1: Ref
(declare-const x1@28@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@29@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@30@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@31@01 $Ref)
(assert (not (= x1@31@01 $Ref.null)))
(declare-const next@32@01 $Ref)
(assert (not (= x1@31@01 x1@28@01)))
(assert (not (Set_in x1@31@01 xs@29@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 7 | False | dead]
; [else-branch: 7 | True | live]
(push) ; 3
; [else-branch: 7 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@31@01))
; [exec]
; xs := Set(x1)
; [eval] Set(x1)
(declare-const xs@33@01 Set<$Ref>)
(assert (= xs@33@01 (Set_singleton x1@31@01)))
; [exec]
; inhale length_impl(xs, x1, 1, res)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] length_impl(xs, x1, 1, res)
(push) ; 4
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) xs@33@01 x1@31@01 1 res@30@01))
(pop) ; 4
; Joined path conditions
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) xs@33@01 x1@31@01 1 res@30@01))
(assert (length_impl ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) xs@33@01 x1@31@01 1 res@30@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 1
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@30@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@30@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@30@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@30@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_length2 ----------
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
; var x1: Ref
(declare-const x1@35@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@36@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@37@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@38@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@39@01 $Ref)
(assert (not (= x1@39@01 $Ref.null)))
(declare-const next@40@01 $Ref)
(assert (not (= x1@39@01 x1@35@01)))
(assert (not (= x1@39@01 x2@36@01)))
(assert (not (Set_in x1@39@01 xs@37@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 8 | False | dead]
; [else-branch: 8 | True | live]
(push) ; 3
; [else-branch: 8 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@39@01))
; [exec]
; x2 := new(next)
(declare-const x2@41@01 $Ref)
(assert (not (= x2@41@01 $Ref.null)))
(declare-const next@42@01 $Ref)
(assert (not (= x2@41@01 x1@39@01)))
(assert (not (= x2@41@01 x2@36@01)))
(assert (not (Set_in x2@41@01 xs@37@01)))
; [exec]
; x2.next := x1
; [exec]
; fold acc(list(x2), write)
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@39@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | x1@39@01 != Null | live]
; [else-branch: 9 | x1@39@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | x1@39@01 != Null]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@39@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x2@41@01))
; [exec]
; xs := Set(x1, x2)
; [eval] Set(x1, x2)
(declare-const xs@43@01 Set<$Ref>)
(assert (= xs@43@01 (Set_unionone (Set_singleton x1@39@01) x2@41@01)))
; [exec]
; assert (x1 in xs) && (x2 in xs)
; [eval] (x1 in xs)
(push) ; 5
(assert (not (Set_in x1@39@01 xs@43@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x1@39@01 xs@43@01))
; [eval] (x2 in xs)
(push) ; 5
(assert (not (Set_in x2@41@01 xs@43@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x2@41@01 xs@43@01))
; [exec]
; inhale length_impl(xs, x2, 1, res)
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] length_impl(xs, x2, 1, res)
(push) ; 5
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@39@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) xs@43@01 x2@41@01 1 res@38@01))
(pop) ; 5
; Joined path conditions
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@39@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) xs@43@01 x2@41@01 1 res@38@01))
(assert (length_impl ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@39@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) xs@43@01 x2@41@01 1 res@38@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 2
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@38@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@38@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@38@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@38@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_length4 ----------
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
; var x1: Ref
(declare-const x1@45@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@46@01 $Ref)
; [exec]
; var x3: Ref
(declare-const x3@47@01 $Ref)
; [exec]
; var x4: Ref
(declare-const x4@48@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@49@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@50@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@51@01 $Ref)
(assert (not (= x1@51@01 $Ref.null)))
(declare-const next@52@01 $Ref)
(assert (not (= x1@51@01 x2@46@01)))
(assert (not (= x1@51@01 x4@48@01)))
(assert (not (= x1@51@01 x3@47@01)))
(assert (not (= x1@51@01 x1@45@01)))
(assert (not (Set_in x1@51@01 xs@49@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 10 | False | dead]
; [else-branch: 10 | True | live]
(push) ; 3
; [else-branch: 10 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@51@01))
; [exec]
; x2 := new(next)
(declare-const x2@53@01 $Ref)
(assert (not (= x2@53@01 $Ref.null)))
(declare-const next@54@01 $Ref)
(assert (not (= x2@53@01 x2@46@01)))
(assert (not (= x2@53@01 x4@48@01)))
(assert (not (= x2@53@01 x3@47@01)))
(assert (not (= x2@53@01 x1@51@01)))
(assert (not (Set_in x2@53@01 xs@49@01)))
; [exec]
; x2.next := x1
; [exec]
; fold acc(list(x2), write)
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@51@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | x1@51@01 != Null | live]
; [else-branch: 11 | x1@51@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | x1@51@01 != Null]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@51@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x2@53@01))
; [exec]
; x3 := new(next)
(declare-const x3@55@01 $Ref)
(assert (not (= x3@55@01 $Ref.null)))
(declare-const next@56@01 $Ref)
(assert (not (= x3@55@01 x2@53@01)))
(assert (not (= x3@55@01 x4@48@01)))
(assert (not (= x3@55@01 x3@47@01)))
(assert (not (= x3@55@01 x1@51@01)))
(assert (not (Set_in x3@55@01 xs@49@01)))
; [exec]
; x3.next := x2
; [exec]
; fold acc(list(x3), write)
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@53@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | x2@53@01 != Null | live]
; [else-branch: 12 | x2@53@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | x2@53@01 != Null]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x2@53@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@51@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))) x3@55@01))
; [exec]
; x4 := new(next)
(declare-const x4@57@01 $Ref)
(assert (not (= x4@57@01 $Ref.null)))
(declare-const next@58@01 $Ref)
(assert (not (= x4@57@01 x2@53@01)))
(assert (not (= x4@57@01 x3@55@01)))
(assert (not (= x4@57@01 x4@48@01)))
(assert (not (= x4@57@01 x1@51@01)))
(assert (not (Set_in x4@57@01 xs@49@01)))
; [exec]
; x4.next := x3
; [exec]
; fold acc(list(x4), write)
; [eval] x.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@55@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | x3@55@01 != Null | live]
; [else-branch: 13 | x3@55@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | x3@55@01 != Null]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@55@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@53@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@51@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x4@57@01))
; [exec]
; xs := Set(x1, x2, x4, x3)
; [eval] Set(x1, x2, x4, x3)
(declare-const xs@59@01 Set<$Ref>)
(assert (=
  xs@59@01
  (Set_unionone (Set_unionone (Set_unionone (Set_singleton x1@51@01) x2@53@01) x4@57@01) x3@55@01)))
; [exec]
; inhale length_impl(xs, x4, 1, res)
(declare-const $t@60@01 $Snap)
(assert (= $t@60@01 $Snap.unit))
; [eval] length_impl(xs, x4, 1, res)
(push) ; 7
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@55@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@53@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@51@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) xs@59@01 x4@57@01 1 res@50@01))
(pop) ; 7
; Joined path conditions
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@55@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@53@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@51@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) xs@59@01 x4@57@01 1 res@50@01))
(assert (length_impl ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@55@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@53@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@51@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) xs@59@01 x4@57@01 1 res@50@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 4
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@50@01 4)))
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
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@50@01 4)))
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
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@50@01 4)))
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
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@50@01 4)))
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
; ---------- test2_length1 ----------
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
; var x1: Ref
(declare-const x1@61@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@62@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@63@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@64@01 $Ref)
(assert (not (= x1@64@01 $Ref.null)))
(declare-const next@65@01 $Ref)
(assert (not (= x1@64@01 x1@61@01)))
(assert (not (Set_in x1@64@01 xs@62@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 14 | False | dead]
; [else-branch: 14 | True | live]
(push) ; 3
; [else-branch: 14 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@64@01))
(declare-const sm@66@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@64@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
; [exec]
; xs := Set(x1)
; [eval] Set(x1)
(declare-const xs@67@01 Set<$Ref>)
(assert (= xs@67@01 (Set_singleton x1@64@01)))
; [exec]
; inhale length2_impl(xs, x1, 1, res)
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 $Snap.unit))
; [eval] length2_impl(xs, x1, 1, res)
(push) ; 4
(declare-const x@69@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@69@01 xs@67@01))
(declare-const $k@70@01 $Perm)
(assert ($Perm.isReadVar $k@70@01))
(pop) ; 5
(declare-fun inv@71@01 ($Ref) $Ref)
(declare-fun img@72@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@70@01))
; Nested auxiliary terms: non-globals
(push) ; 5
(assert (not (forall ((x@69@01 $Ref)) (!
  (=> (Set_in x@69@01 xs@67@01) (or (= $k@70@01 $Perm.No) (< $Perm.No $k@70@01)))
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@69@01 $Ref) (x2@69@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@69@01 xs@67@01) (< $Perm.No $k@70@01))
      (and (Set_in x2@69@01 xs@67@01) (< $Perm.No $k@70@01))
      (= x1@69@01 x2@69@01))
    (= x1@69@01 x2@69@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@69@01 $Ref)) (!
  (=>
    (and (Set_in x@69@01 xs@67@01) (< $Perm.No $k@70@01))
    (and (= (inv@71@01 x@69@01) x@69@01) (img@72@01 x@69@01)))
  :pattern ((Set_in x@69@01 xs@67@01))
  :pattern ((inv@71@01 x@69@01))
  :pattern ((img@72@01 x@69@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@72@01 x)
      (and (Set_in (inv@71@01 x) xs@67@01) (< $Perm.No $k@70@01)))
    (= (inv@71@01 x) x))
  :pattern ((inv@71@01 x))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@73@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@71@01 x) xs@67@01) (img@72@01 x) (= x (inv@71@01 x)))
    ($Perm.min (ite (= x x1@64@01) $Perm.Write $Perm.No) $k@70@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@70@01
(assert (<
  (ite
    (and
      (Set_in (inv@71@01 x1@64@01) xs@67@01)
      (img@72@01 x1@64@01)
      (= x1@64@01 (inv@71@01 x1@64@01)))
    $k@70@01
    $Perm.No)
  $Perm.Write))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@71@01 x) xs@67@01) (img@72@01 x) (= x (inv@71@01 x)))
    (= (- $k@70@01 (pTaken@73@01 x)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@74@01 $PSF<list>)
(declare-const s@75@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@75@01 $Snap)) (!
  (and
    (=>
      (Set_in s@75@01 ($PSF.domain_list (as sm@74@01  $PSF<list>)))
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@75@01)) xs@67@01)
        (< $Perm.No $k@70@01)
        (img@72@01 ($SortWrappers.$SnapTo$Ref s@75@01))))
    (=>
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@75@01)) xs@67@01)
        (< $Perm.No $k@70@01)
        (img@72@01 ($SortWrappers.$SnapTo$Ref s@75@01)))
      (Set_in s@75@01 ($PSF.domain_list (as sm@74@01  $PSF<list>)))))
  :pattern ((Set_in s@75@01 ($PSF.domain_list (as sm@74@01  $PSF<list>))))
  :qid |qp.psmDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@75@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@75@01)) xs@67@01)
        (< $Perm.No $k@70@01)
        (img@72@01 ($SortWrappers.$SnapTo$Ref s@75@01)))
      (= ($SortWrappers.$SnapTo$Ref s@75@01) x1@64@01))
    (and
      (not (= s@75@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@74@01  $PSF<list>) s@75@01)
        ($PSF.lookup_list (as sm@66@01  $PSF<list>) s@75@01))))
  :pattern (($PSF.lookup_list (as sm@74@01  $PSF<list>) s@75@01))
  :pattern (($PSF.lookup_list (as sm@66@01  $PSF<list>) s@75@01))
  :qid |qp.psmValDef1|)))
(assert (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@74@01  $PSF<list>)) xs@67@01 x1@64@01 1 res@63@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@70@01))
(assert (forall ((x@69@01 $Ref)) (!
  (=>
    (and (Set_in x@69@01 xs@67@01) (< $Perm.No $k@70@01))
    (and (= (inv@71@01 x@69@01) x@69@01) (img@72@01 x@69@01)))
  :pattern ((Set_in x@69@01 xs@67@01))
  :pattern ((inv@71@01 x@69@01))
  :pattern ((img@72@01 x@69@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@72@01 x)
      (and (Set_in (inv@71@01 x) xs@67@01) (< $Perm.No $k@70@01)))
    (= (inv@71@01 x) x))
  :pattern ((inv@71@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@75@01 $Snap)) (!
  (and
    (=>
      (Set_in s@75@01 ($PSF.domain_list (as sm@74@01  $PSF<list>)))
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@75@01)) xs@67@01)
        (< $Perm.No $k@70@01)
        (img@72@01 ($SortWrappers.$SnapTo$Ref s@75@01))))
    (=>
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@75@01)) xs@67@01)
        (< $Perm.No $k@70@01)
        (img@72@01 ($SortWrappers.$SnapTo$Ref s@75@01)))
      (Set_in s@75@01 ($PSF.domain_list (as sm@74@01  $PSF<list>)))))
  :pattern ((Set_in s@75@01 ($PSF.domain_list (as sm@74@01  $PSF<list>))))
  :qid |qp.psmDomDef2|)))
(assert (forall ((s@75@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@75@01)) xs@67@01)
        (< $Perm.No $k@70@01)
        (img@72@01 ($SortWrappers.$SnapTo$Ref s@75@01)))
      (= ($SortWrappers.$SnapTo$Ref s@75@01) x1@64@01))
    (and
      (not (= s@75@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@74@01  $PSF<list>) s@75@01)
        ($PSF.lookup_list (as sm@66@01  $PSF<list>) s@75@01))))
  :pattern (($PSF.lookup_list (as sm@74@01  $PSF<list>) s@75@01))
  :pattern (($PSF.lookup_list (as sm@66@01  $PSF<list>) s@75@01))
  :qid |qp.psmValDef1|)))
(assert (and
  (<
    (ite
      (and
        (Set_in (inv@71@01 x1@64@01) xs@67@01)
        (img@72@01 x1@64@01)
        (= x1@64@01 (inv@71@01 x1@64@01)))
      $k@70@01
      $Perm.No)
    $Perm.Write)
  (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@74@01  $PSF<list>)) xs@67@01 x1@64@01 1 res@63@01)))
(assert (length2_impl ($SortWrappers.$PSF<list>To$Snap (as sm@74@01  $PSF<list>)) xs@67@01 x1@64@01 1 res@63@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 1
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@63@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@63@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@63@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@63@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2_length2 ----------
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
; var x1: Ref
(declare-const x1@76@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@77@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@78@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@79@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@80@01 $Ref)
(assert (not (= x1@80@01 $Ref.null)))
(declare-const next@81@01 $Ref)
(assert (not (= x1@80@01 x1@76@01)))
(assert (not (= x1@80@01 x2@77@01)))
(assert (not (Set_in x1@80@01 xs@78@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), wildcard)
(declare-const $k@82@01 $Perm)
(assert ($Perm.isReadVar $k@82@01))
(assert (< $k@82@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@82@01)))
(assert (<= (- $Perm.Write $k@82@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@82@01)) (not (= x1@80@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@82@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 15 | False | dead]
; [else-branch: 15 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 15 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@80@01))
(declare-const sm@83@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@83@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
; [exec]
; x2 := new(next)
(declare-const x2@84@01 $Ref)
(assert (not (= x2@84@01 $Ref.null)))
(declare-const next@85@01 $Ref)
(assert (not (= x2@84@01 x2@77@01)))
(assert (not (= x2@84@01 x1@80@01)))
(assert (not (Set_in x2@84@01 xs@78@01)))
; [exec]
; x2.next := x1
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@80@01 x2@84@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x2), wildcard)
(declare-const $k@86@01 $Perm)
(assert ($Perm.isReadVar $k@86@01))
(assert (< $k@86@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@86@01)))
(assert (<= (- $Perm.Write $k@86@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@86@01)) (not (= x2@84@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@86@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@80@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | x1@80@01 != Null | live]
; [else-branch: 16 | x1@80@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | x1@80@01 != Null]
; Precomputing data for removing quantified permissions
(define-fun pTaken@87@01 ((x $Ref)) $Perm
  (ite
    (= x x1@80@01)
    ($Perm.min (ite (= x x1@80@01) $k@82@01 $Perm.No) $k@86@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@86@01
(assert (=> (not (= $k@82@01 $Perm.No)) (< $k@86@01 $k@82@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x1@80@01) (= (- $k@86@01 (pTaken@87@01 x)) $Perm.No))
  
  :qid |quant-u-68|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@88@01 $PSF<list>)
(declare-const s@89@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No $k@82@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x1@80@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@88@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01))
      ($PSF.lookup_list (as sm@83@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@80@01)
  ($PSF.lookup_list (as sm@88@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01))) x2@84@01))
(declare-const sm@90@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@90@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@84@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@80@01)
    ($PSF.lookup_list (as sm@88@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01)))))
; [exec]
; xs := Set(x1, x2)
; [eval] Set(x1, x2)
(declare-const xs@91@01 Set<$Ref>)
(assert (= xs@91@01 (Set_unionone (Set_singleton x1@80@01) x2@84@01)))
; [exec]
; assert (x1 in xs) && (x2 in xs)
; [eval] (x1 in xs)
(set-option :timeout 0)
(push) ; 5
(assert (not (Set_in x1@80@01 xs@91@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x1@80@01 xs@91@01))
; [eval] (x2 in xs)
(push) ; 5
(assert (not (Set_in x2@84@01 xs@91@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x2@84@01 xs@91@01))
; [exec]
; inhale length2_impl(xs, x2, 1, res)
(declare-const $t@92@01 $Snap)
(assert (= $t@92@01 $Snap.unit))
; [eval] length2_impl(xs, x2, 1, res)
(push) ; 5
(declare-const x@93@01 $Ref)
(push) ; 6
; [eval] (x in xs)
(assert (Set_in x@93@01 xs@91@01))
(declare-const $k@94@01 $Perm)
(assert ($Perm.isReadVar $k@94@01))
(pop) ; 6
(declare-fun inv@95@01 ($Ref) $Ref)
(declare-fun img@96@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@94@01))
; Nested auxiliary terms: non-globals
(push) ; 6
(assert (not (forall ((x@93@01 $Ref)) (!
  (=> (Set_in x@93@01 xs@91@01) (or (= $k@94@01 $Perm.No) (< $Perm.No $k@94@01)))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((x1@93@01 $Ref) (x2@93@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@93@01 xs@91@01) (< $Perm.No $k@94@01))
      (and (Set_in x2@93@01 xs@91@01) (< $Perm.No $k@94@01))
      (= x1@93@01 x2@93@01))
    (= x1@93@01 x2@93@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@93@01 $Ref)) (!
  (=>
    (and (Set_in x@93@01 xs@91@01) (< $Perm.No $k@94@01))
    (and (= (inv@95@01 x@93@01) x@93@01) (img@96@01 x@93@01)))
  :pattern ((Set_in x@93@01 xs@91@01))
  :pattern ((inv@95@01 x@93@01))
  :pattern ((img@96@01 x@93@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@96@01 x)
      (and (Set_in (inv@95@01 x) xs@91@01) (< $Perm.No $k@94@01)))
    (= (inv@95@01 x) x))
  :pattern ((inv@95@01 x))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@97@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@95@01 x) xs@91@01) (img@96@01 x) (= x (inv@95@01 x)))
    ($Perm.min (ite (= x x2@84@01) $k@86@01 $Perm.No) $k@94@01)
    $Perm.No))
(define-fun pTaken@98@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@95@01 x) xs@91@01) (img@96@01 x) (= x (inv@95@01 x)))
    ($Perm.min
      (ite (= x x1@80@01) (- $k@82@01 (pTaken@87@01 x)) $Perm.No)
      (- $k@94@01 (pTaken@97@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@94@01
(assert (=>
  (not (= $k@86@01 $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@95@01 x2@84@01) xs@91@01)
        (img@96@01 x2@84@01)
        (= x2@84@01 (inv@95@01 x2@84@01)))
      $k@94@01
      $Perm.No)
    $k@86@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@95@01 x) xs@91@01) (img@96@01 x) (= x (inv@95@01 x)))
    (= (- $k@94@01 (pTaken@97@01 x)) $Perm.No))
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@94@01
(assert (=>
  (not (= (- $k@82@01 (pTaken@87@01 x1@80@01)) $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@95@01 x1@80@01) xs@91@01)
        (img@96@01 x1@80@01)
        (= x1@80@01 (inv@95@01 x1@80@01)))
      $k@94@01
      $Perm.No)
    (- $k@82@01 (pTaken@87@01 x1@80@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@95@01 x) xs@91@01) (img@96@01 x) (= x (inv@95@01 x)))
    (= (- (- $k@94@01 (pTaken@97@01 x)) (pTaken@98@01 x)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@99@01 $PSF<list>)
(declare-const s@100@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@100@01 $Snap)) (!
  (and
    (=>
      (Set_in s@100@01 ($PSF.domain_list (as sm@99@01  $PSF<list>)))
      (and
        (Set_in (inv@95@01 ($SortWrappers.$SnapTo$Ref s@100@01)) xs@91@01)
        (< $Perm.No $k@94@01)
        (img@96@01 ($SortWrappers.$SnapTo$Ref s@100@01))))
    (=>
      (and
        (Set_in (inv@95@01 ($SortWrappers.$SnapTo$Ref s@100@01)) xs@91@01)
        (< $Perm.No $k@94@01)
        (img@96@01 ($SortWrappers.$SnapTo$Ref s@100@01)))
      (Set_in s@100@01 ($PSF.domain_list (as sm@99@01  $PSF<list>)))))
  :pattern ((Set_in s@100@01 ($PSF.domain_list (as sm@99@01  $PSF<list>))))
  :qid |qp.psmDomDef9|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@100@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@95@01 ($SortWrappers.$SnapTo$Ref s@100@01)) xs@91@01)
        (< $Perm.No $k@94@01)
        (img@96@01 ($SortWrappers.$SnapTo$Ref s@100@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@100@01) x2@84@01)
        (< $Perm.No $k@86@01)
        false))
    (and
      (not (= s@100@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@99@01  $PSF<list>) s@100@01)
        ($PSF.lookup_list (as sm@90@01  $PSF<list>) s@100@01))))
  :pattern (($PSF.lookup_list (as sm@99@01  $PSF<list>) s@100@01))
  :pattern (($PSF.lookup_list (as sm@90@01  $PSF<list>) s@100@01))
  :qid |qp.psmValDef7|)))
(assert (forall ((s@100@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@95@01 ($SortWrappers.$SnapTo$Ref s@100@01)) xs@91@01)
        (< $Perm.No $k@94@01)
        (img@96@01 ($SortWrappers.$SnapTo$Ref s@100@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@100@01) x1@80@01)
        (<
          $Perm.No
          (- $k@82@01 (pTaken@87@01 ($SortWrappers.$SnapTo$Ref s@100@01))))
        false))
    (and
      (not (= s@100@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@99@01  $PSF<list>) s@100@01)
        ($PSF.lookup_list (as sm@83@01  $PSF<list>) s@100@01))))
  :pattern (($PSF.lookup_list (as sm@99@01  $PSF<list>) s@100@01))
  :pattern (($PSF.lookup_list (as sm@83@01  $PSF<list>) s@100@01))
  :qid |qp.psmValDef8|)))
(assert (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@99@01  $PSF<list>)) xs@91@01 x2@84@01 1 res@79@01))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@94@01))
(assert (forall ((x@93@01 $Ref)) (!
  (=>
    (and (Set_in x@93@01 xs@91@01) (< $Perm.No $k@94@01))
    (and (= (inv@95@01 x@93@01) x@93@01) (img@96@01 x@93@01)))
  :pattern ((Set_in x@93@01 xs@91@01))
  :pattern ((inv@95@01 x@93@01))
  :pattern ((img@96@01 x@93@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@96@01 x)
      (and (Set_in (inv@95@01 x) xs@91@01) (< $Perm.No $k@94@01)))
    (= (inv@95@01 x) x))
  :pattern ((inv@95@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@100@01 $Snap)) (!
  (and
    (=>
      (Set_in s@100@01 ($PSF.domain_list (as sm@99@01  $PSF<list>)))
      (and
        (Set_in (inv@95@01 ($SortWrappers.$SnapTo$Ref s@100@01)) xs@91@01)
        (< $Perm.No $k@94@01)
        (img@96@01 ($SortWrappers.$SnapTo$Ref s@100@01))))
    (=>
      (and
        (Set_in (inv@95@01 ($SortWrappers.$SnapTo$Ref s@100@01)) xs@91@01)
        (< $Perm.No $k@94@01)
        (img@96@01 ($SortWrappers.$SnapTo$Ref s@100@01)))
      (Set_in s@100@01 ($PSF.domain_list (as sm@99@01  $PSF<list>)))))
  :pattern ((Set_in s@100@01 ($PSF.domain_list (as sm@99@01  $PSF<list>))))
  :qid |qp.psmDomDef9|)))
(assert (forall ((s@100@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@95@01 ($SortWrappers.$SnapTo$Ref s@100@01)) xs@91@01)
        (< $Perm.No $k@94@01)
        (img@96@01 ($SortWrappers.$SnapTo$Ref s@100@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@100@01) x2@84@01)
        (< $Perm.No $k@86@01)
        false))
    (and
      (not (= s@100@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@99@01  $PSF<list>) s@100@01)
        ($PSF.lookup_list (as sm@90@01  $PSF<list>) s@100@01))))
  :pattern (($PSF.lookup_list (as sm@99@01  $PSF<list>) s@100@01))
  :pattern (($PSF.lookup_list (as sm@90@01  $PSF<list>) s@100@01))
  :qid |qp.psmValDef7|)))
(assert (forall ((s@100@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@95@01 ($SortWrappers.$SnapTo$Ref s@100@01)) xs@91@01)
        (< $Perm.No $k@94@01)
        (img@96@01 ($SortWrappers.$SnapTo$Ref s@100@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@100@01) x1@80@01)
        (<
          $Perm.No
          (- $k@82@01 (pTaken@87@01 ($SortWrappers.$SnapTo$Ref s@100@01))))
        false))
    (and
      (not (= s@100@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@99@01  $PSF<list>) s@100@01)
        ($PSF.lookup_list (as sm@83@01  $PSF<list>) s@100@01))))
  :pattern (($PSF.lookup_list (as sm@99@01  $PSF<list>) s@100@01))
  :pattern (($PSF.lookup_list (as sm@83@01  $PSF<list>) s@100@01))
  :qid |qp.psmValDef8|)))
(assert (and
  (=>
    (not (= $k@86@01 $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@95@01 x2@84@01) xs@91@01)
          (img@96@01 x2@84@01)
          (= x2@84@01 (inv@95@01 x2@84@01)))
        $k@94@01
        $Perm.No)
      $k@86@01))
  (=>
    (not (= (- $k@82@01 (pTaken@87@01 x1@80@01)) $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@95@01 x1@80@01) xs@91@01)
          (img@96@01 x1@80@01)
          (= x1@80@01 (inv@95@01 x1@80@01)))
        $k@94@01
        $Perm.No)
      (- $k@82@01 (pTaken@87@01 x1@80@01))))
  (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@99@01  $PSF<list>)) xs@91@01 x2@84@01 1 res@79@01)))
(assert (length2_impl ($SortWrappers.$PSF<list>To$Snap (as sm@99@01  $PSF<list>)) xs@91@01 x2@84@01 1 res@79@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 2
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@79@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@84@01 x1@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@84@01 x1@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@86@01) (< $Perm.No (- $k@82@01 (pTaken@87@01 x1@80@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@90@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@84@01))
      ($PSF.lookup_list (as sm@83@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@82@01 (pTaken@87@01 x1@80@01))) (< $Perm.No $k@86@01))
  (not
    (=
      ($PSF.lookup_list (as sm@83@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01))
      ($PSF.lookup_list (as sm@90@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@84@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x2@84@01 x1@80@01)) (not (= x1@80@01 x2@84@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@82@01) (- $Perm.Write $k@86@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@86@01) (- $Perm.Write $k@82@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@82@01))
    (< $Perm.No (- $Perm.Write $k@86@01)))
  (not (= $Ref.null x1@80@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@86@01))
    (< $Perm.No (- $Perm.Write $k@82@01)))
  (not (= x1@80@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x1@80@01 x2@84@01)) (not (= x2@84@01 x1@80@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@79@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@84@01 x1@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@84@01 x1@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@86@01) (< $Perm.No (- $k@82@01 (pTaken@87@01 x1@80@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@90@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@84@01))
      ($PSF.lookup_list (as sm@83@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@82@01 (pTaken@87@01 x1@80@01))) (< $Perm.No $k@86@01))
  (not
    (=
      ($PSF.lookup_list (as sm@83@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01))
      ($PSF.lookup_list (as sm@90@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@84@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x2@84@01 x1@80@01)) (not (= x1@80@01 x2@84@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@82@01) (- $Perm.Write $k@86@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@86@01) (- $Perm.Write $k@82@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@82@01))
    (< $Perm.No (- $Perm.Write $k@86@01)))
  (not (= $Ref.null x1@80@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@86@01))
    (< $Perm.No (- $Perm.Write $k@82@01)))
  (not (= x1@80@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x1@80@01 x2@84@01)) (not (= x2@84@01 x1@80@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@79@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@84@01 x1@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@84@01 x1@80@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@86@01) (< $Perm.No (- $k@82@01 (pTaken@87@01 x1@80@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@90@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@84@01))
      ($PSF.lookup_list (as sm@83@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@82@01 (pTaken@87@01 x1@80@01))) (< $Perm.No $k@86@01))
  (not
    (=
      ($PSF.lookup_list (as sm@83@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@80@01))
      ($PSF.lookup_list (as sm@90@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@84@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x2@84@01 x1@80@01)) (not (= x1@80@01 x2@84@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@82@01) (- $Perm.Write $k@86@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@86@01) (- $Perm.Write $k@82@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@82@01))
    (< $Perm.No (- $Perm.Write $k@86@01)))
  (not (= $Ref.null x1@80@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@86@01))
    (< $Perm.No (- $Perm.Write $k@82@01)))
  (not (= x1@80@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x1@80@01 x2@84@01)) (not (= x2@84@01 x1@80@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@79@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2_length4 ----------
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
; var x1: Ref
(declare-const x1@101@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@102@01 $Ref)
; [exec]
; var x3: Ref
(declare-const x3@103@01 $Ref)
; [exec]
; var x4: Ref
(declare-const x4@104@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@105@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@106@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@107@01 $Ref)
(assert (not (= x1@107@01 $Ref.null)))
(declare-const next@108@01 $Ref)
(assert (not (= x1@107@01 x4@104@01)))
(assert (not (= x1@107@01 x3@103@01)))
(assert (not (= x1@107@01 x1@101@01)))
(assert (not (= x1@107@01 x2@102@01)))
(assert (not (Set_in x1@107@01 xs@105@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), wildcard)
(declare-const $k@109@01 $Perm)
(assert ($Perm.isReadVar $k@109@01))
(assert (< $k@109@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@109@01)))
(assert (<= (- $Perm.Write $k@109@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@109@01)) (not (= x1@107@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@109@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 17 | False | dead]
; [else-branch: 17 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 17 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@107@01))
(declare-const sm@110@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
; [exec]
; x2 := new(next)
(declare-const x2@111@01 $Ref)
(assert (not (= x2@111@01 $Ref.null)))
(declare-const next@112@01 $Ref)
(assert (not (= x2@111@01 x4@104@01)))
(assert (not (= x2@111@01 x3@103@01)))
(assert (not (= x2@111@01 x1@107@01)))
(assert (not (= x2@111@01 x2@102@01)))
(assert (not (Set_in x2@111@01 xs@105@01)))
; [exec]
; x2.next := x1
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@107@01 x2@111@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x2), wildcard)
(declare-const $k@113@01 $Perm)
(assert ($Perm.isReadVar $k@113@01))
(assert (< $k@113@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@113@01)))
(assert (<= (- $Perm.Write $k@113@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@113@01)) (not (= x2@111@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@113@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@107@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | x1@107@01 != Null | live]
; [else-branch: 18 | x1@107@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | x1@107@01 != Null]
; Precomputing data for removing quantified permissions
(define-fun pTaken@114@01 ((x $Ref)) $Perm
  (ite
    (= x x1@107@01)
    ($Perm.min (ite (= x x1@107@01) $k@109@01 $Perm.No) $k@113@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@113@01
(assert (=> (not (= $k@109@01 $Perm.No)) (< $k@113@01 $k@109@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x1@107@01) (= (- $k@113@01 (pTaken@114@01 x)) $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@115@01 $PSF<list>)
(declare-const s@116@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No $k@109@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x1@107@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@107@01)
  ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))) x2@111@01))
(declare-const sm@117@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@107@01)
    ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))
; [exec]
; x3 := new(next)
(declare-const x3@118@01 $Ref)
(assert (not (= x3@118@01 $Ref.null)))
(declare-const next@119@01 $Ref)
(assert (not (= x3@118@01 x4@104@01)))
(assert (not (= x3@118@01 x3@103@01)))
(assert (not (= x3@118@01 x2@111@01)))
(assert (not (= x3@118@01 x1@107@01)))
(assert (not (Set_in x3@118@01 xs@105@01)))
; [exec]
; x3.next := x2
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@111@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@107@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x3), wildcard)
(declare-const $k@120@01 $Perm)
(assert ($Perm.isReadVar $k@120@01))
(assert (< $k@120@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@120@01)))
(assert (<= (- $Perm.Write $k@120@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@120@01)) (not (= x3@118@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@120@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@111@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | x2@111@01 != Null | live]
; [else-branch: 19 | x2@111@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | x2@111@01 != Null]
; Precomputing data for removing quantified permissions
(define-fun pTaken@121@01 ((x $Ref)) $Perm
  (ite
    (= x x2@111@01)
    ($Perm.min (ite (= x x2@111@01) $k@113@01 $Perm.No) $k@120@01)
    $Perm.No))
(define-fun pTaken@122@01 ((x $Ref)) $Perm
  (ite
    (= x x2@111@01)
    ($Perm.min
      (ite (= x x1@107@01) (- $k@109@01 (pTaken@114@01 x)) $Perm.No)
      (- $k@120@01 (pTaken@121@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@120@01
(assert (=> (not (= $k@113@01 $Perm.No)) (< $k@120@01 $k@113@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x2@111@01) (= (- $k@120@01 (pTaken@121@01 x)) $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@123@01 $PSF<list>)
(declare-const s@124@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No $k@113@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x2@111@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))))))
(assert (=>
  (ite
    (= x2@111@01 x1@107@01)
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x2@111@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x2@111@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x2@111@01)
  ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))) x3@118@01))
(declare-const sm@125@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@111@01)
    ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))
; [exec]
; x4 := new(next)
(declare-const x4@126@01 $Ref)
(assert (not (= x4@126@01 $Ref.null)))
(declare-const next@127@01 $Ref)
(assert (not (= x4@126@01 x4@104@01)))
(assert (not (= x4@126@01 x2@111@01)))
(assert (not (= x4@126@01 x3@118@01)))
(assert (not (= x4@126@01 x1@107@01)))
(assert (not (Set_in x4@126@01 xs@105@01)))
; [exec]
; x4.next := x3
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@118@01 x4@126@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x1@107@01 x4@126@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x2@111@01 x4@126@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x4), wildcard)
(declare-const $k@128@01 $Perm)
(assert ($Perm.isReadVar $k@128@01))
(assert (< $k@128@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@128@01)))
(assert (<= (- $Perm.Write $k@128@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@128@01)) (not (= x4@126@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@128@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@118@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | x3@118@01 != Null | live]
; [else-branch: 20 | x3@118@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 20 | x3@118@01 != Null]
; Precomputing data for removing quantified permissions
(define-fun pTaken@129@01 ((x $Ref)) $Perm
  (ite
    (= x x3@118@01)
    ($Perm.min (ite (= x x3@118@01) $k@120@01 $Perm.No) $k@128@01)
    $Perm.No))
(define-fun pTaken@130@01 ((x $Ref)) $Perm
  (ite
    (= x x3@118@01)
    ($Perm.min
      (ite (= x x1@107@01) (- $k@109@01 (pTaken@114@01 x)) $Perm.No)
      (- $k@128@01 (pTaken@129@01 x)))
    $Perm.No))
(define-fun pTaken@131@01 ((x $Ref)) $Perm
  (ite
    (= x x3@118@01)
    ($Perm.min
      (ite (= x x2@111@01) (- $k@113@01 (pTaken@121@01 x)) $Perm.No)
      (- (- $k@128@01 (pTaken@129@01 x)) (pTaken@130@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@128@01
(assert (=> (not (= $k@120@01 $Perm.No)) (< $k@128@01 $k@120@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x3@118@01) (= (- $k@128@01 (pTaken@129@01 x)) $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@132@01 $PSF<list>)
(declare-const s@133@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No $k@120@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@118@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))))))
(assert (=>
  (ite
    (= x3@118@01 x1@107@01)
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x3@118@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@118@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))))))
(assert (=>
  (ite
    (= x3@118@01 x2@111@01)
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x3@118@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@118@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@118@01)
  ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))) x4@126@01))
(declare-const sm@134@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@118@01)
    ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))
; [exec]
; xs := Set(x1, x2, x4, x3)
; [eval] Set(x1, x2, x4, x3)
(declare-const xs@135@01 Set<$Ref>)
(assert (=
  xs@135@01
  (Set_unionone (Set_unionone (Set_unionone (Set_singleton x1@107@01) x2@111@01) x4@126@01) x3@118@01)))
; [exec]
; inhale length2_impl(xs, x4, 1, res)
(declare-const $t@136@01 $Snap)
(assert (= $t@136@01 $Snap.unit))
; [eval] length2_impl(xs, x4, 1, res)
(set-option :timeout 0)
(push) ; 7
(declare-const x@137@01 $Ref)
(push) ; 8
; [eval] (x in xs)
(assert (Set_in x@137@01 xs@135@01))
(declare-const $k@138@01 $Perm)
(assert ($Perm.isReadVar $k@138@01))
(pop) ; 8
(declare-fun inv@139@01 ($Ref) $Ref)
(declare-fun img@140@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@138@01))
; Nested auxiliary terms: non-globals
(push) ; 8
(assert (not (forall ((x@137@01 $Ref)) (!
  (=>
    (Set_in x@137@01 xs@135@01)
    (or (= $k@138@01 $Perm.No) (< $Perm.No $k@138@01)))
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((x1@137@01 $Ref) (x2@137@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@137@01 xs@135@01) (< $Perm.No $k@138@01))
      (and (Set_in x2@137@01 xs@135@01) (< $Perm.No $k@138@01))
      (= x1@137@01 x2@137@01))
    (= x1@137@01 x2@137@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@137@01 $Ref)) (!
  (=>
    (and (Set_in x@137@01 xs@135@01) (< $Perm.No $k@138@01))
    (and (= (inv@139@01 x@137@01) x@137@01) (img@140@01 x@137@01)))
  :pattern ((Set_in x@137@01 xs@135@01))
  :pattern ((inv@139@01 x@137@01))
  :pattern ((img@140@01 x@137@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@140@01 x)
      (and (Set_in (inv@139@01 x) xs@135@01) (< $Perm.No $k@138@01)))
    (= (inv@139@01 x) x))
  :pattern ((inv@139@01 x))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@141@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@139@01 x) xs@135@01) (img@140@01 x) (= x (inv@139@01 x)))
    ($Perm.min (ite (= x x4@126@01) $k@128@01 $Perm.No) $k@138@01)
    $Perm.No))
(define-fun pTaken@142@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@139@01 x) xs@135@01) (img@140@01 x) (= x (inv@139@01 x)))
    ($Perm.min
      (ite (= x x2@111@01) (- $k@113@01 (pTaken@121@01 x)) $Perm.No)
      (- $k@138@01 (pTaken@141@01 x)))
    $Perm.No))
(define-fun pTaken@143@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@139@01 x) xs@135@01) (img@140@01 x) (= x (inv@139@01 x)))
    ($Perm.min
      (ite (= x x1@107@01) (- $k@109@01 (pTaken@114@01 x)) $Perm.No)
      (- (- $k@138@01 (pTaken@141@01 x)) (pTaken@142@01 x)))
    $Perm.No))
(define-fun pTaken@144@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@139@01 x) xs@135@01) (img@140@01 x) (= x (inv@139@01 x)))
    ($Perm.min
      (ite (= x x3@118@01) (- $k@120@01 (pTaken@129@01 x)) $Perm.No)
      (- (- (- $k@138@01 (pTaken@141@01 x)) (pTaken@142@01 x)) (pTaken@143@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@138@01
(assert (=>
  (not (= $k@128@01 $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@139@01 x4@126@01) xs@135@01)
        (img@140@01 x4@126@01)
        (= x4@126@01 (inv@139@01 x4@126@01)))
      $k@138@01
      $Perm.No)
    $k@128@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@139@01 x) xs@135@01) (img@140@01 x) (= x (inv@139@01 x)))
    (= (- $k@138@01 (pTaken@141@01 x)) $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@138@01
(assert (=>
  (not (= (- $k@113@01 (pTaken@121@01 x2@111@01)) $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@139@01 x2@111@01) xs@135@01)
        (img@140@01 x2@111@01)
        (= x2@111@01 (inv@139@01 x2@111@01)))
      $k@138@01
      $Perm.No)
    (- $k@113@01 (pTaken@121@01 x2@111@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@139@01 x) xs@135@01) (img@140@01 x) (= x (inv@139@01 x)))
    (= (- (- $k@138@01 (pTaken@141@01 x)) (pTaken@142@01 x)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@138@01
(assert (=>
  (not (= (- $k@109@01 (pTaken@114@01 x1@107@01)) $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@139@01 x1@107@01) xs@135@01)
        (img@140@01 x1@107@01)
        (= x1@107@01 (inv@139@01 x1@107@01)))
      $k@138@01
      $Perm.No)
    (- $k@109@01 (pTaken@114@01 x1@107@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@139@01 x) xs@135@01) (img@140@01 x) (= x (inv@139@01 x)))
    (=
      (- (- (- $k@138@01 (pTaken@141@01 x)) (pTaken@142@01 x)) (pTaken@143@01 x))
      $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@138@01
(assert (=>
  (not (= (- $k@120@01 (pTaken@129@01 x3@118@01)) $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@139@01 x3@118@01) xs@135@01)
        (img@140@01 x3@118@01)
        (= x3@118@01 (inv@139@01 x3@118@01)))
      $k@138@01
      $Perm.No)
    (- $k@120@01 (pTaken@129@01 x3@118@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@139@01 x) xs@135@01) (img@140@01 x) (= x (inv@139@01 x)))
    (=
      (-
        (-
          (- (- $k@138@01 (pTaken@141@01 x)) (pTaken@142@01 x))
          (pTaken@143@01 x))
        (pTaken@144@01 x))
      $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@145@01 $PSF<list>)
(declare-const s@146@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@146@01 $Snap)) (!
  (and
    (=>
      (Set_in s@146@01 ($PSF.domain_list (as sm@145@01  $PSF<list>)))
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01))))
    (=>
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (Set_in s@146@01 ($PSF.domain_list (as sm@145@01  $PSF<list>)))))
  :pattern ((Set_in s@146@01 ($PSF.domain_list (as sm@145@01  $PSF<list>))))
  :qid |qp.psmDomDef27|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@146@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@146@01) x4@126@01)
        (< $Perm.No $k@128@01)
        false))
    (and
      (not (= s@146@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01)
        ($PSF.lookup_list (as sm@134@01  $PSF<list>) s@146@01))))
  :pattern (($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01))
  :pattern (($PSF.lookup_list (as sm@134@01  $PSF<list>) s@146@01))
  :qid |qp.psmValDef23|)))
(assert (forall ((s@146@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@146@01) x2@111@01)
        (<
          $Perm.No
          (- $k@113@01 (pTaken@121@01 ($SortWrappers.$SnapTo$Ref s@146@01))))
        false))
    (and
      (not (= s@146@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01)
        ($PSF.lookup_list (as sm@117@01  $PSF<list>) s@146@01))))
  :pattern (($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01))
  :pattern (($PSF.lookup_list (as sm@117@01  $PSF<list>) s@146@01))
  :qid |qp.psmValDef24|)))
(assert (forall ((s@146@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@146@01) x1@107@01)
        (<
          $Perm.No
          (- $k@109@01 (pTaken@114@01 ($SortWrappers.$SnapTo$Ref s@146@01))))
        false))
    (and
      (not (= s@146@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01)
        ($PSF.lookup_list (as sm@110@01  $PSF<list>) s@146@01))))
  :pattern (($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01))
  :pattern (($PSF.lookup_list (as sm@110@01  $PSF<list>) s@146@01))
  :qid |qp.psmValDef25|)))
(assert (forall ((s@146@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@146@01) x3@118@01)
        (<
          $Perm.No
          (- $k@120@01 (pTaken@129@01 ($SortWrappers.$SnapTo$Ref s@146@01))))
        false))
    (and
      (not (= s@146@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01)
        ($PSF.lookup_list (as sm@125@01  $PSF<list>) s@146@01))))
  :pattern (($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01))
  :pattern (($PSF.lookup_list (as sm@125@01  $PSF<list>) s@146@01))
  :qid |qp.psmValDef26|)))
(assert (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@145@01  $PSF<list>)) xs@135@01 x4@126@01 1 res@106@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@138@01))
(assert (forall ((x@137@01 $Ref)) (!
  (=>
    (and (Set_in x@137@01 xs@135@01) (< $Perm.No $k@138@01))
    (and (= (inv@139@01 x@137@01) x@137@01) (img@140@01 x@137@01)))
  :pattern ((Set_in x@137@01 xs@135@01))
  :pattern ((inv@139@01 x@137@01))
  :pattern ((img@140@01 x@137@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@140@01 x)
      (and (Set_in (inv@139@01 x) xs@135@01) (< $Perm.No $k@138@01)))
    (= (inv@139@01 x) x))
  :pattern ((inv@139@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@146@01 $Snap)) (!
  (and
    (=>
      (Set_in s@146@01 ($PSF.domain_list (as sm@145@01  $PSF<list>)))
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01))))
    (=>
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (Set_in s@146@01 ($PSF.domain_list (as sm@145@01  $PSF<list>)))))
  :pattern ((Set_in s@146@01 ($PSF.domain_list (as sm@145@01  $PSF<list>))))
  :qid |qp.psmDomDef27|)))
(assert (forall ((s@146@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@146@01) x4@126@01)
        (< $Perm.No $k@128@01)
        false))
    (and
      (not (= s@146@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01)
        ($PSF.lookup_list (as sm@134@01  $PSF<list>) s@146@01))))
  :pattern (($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01))
  :pattern (($PSF.lookup_list (as sm@134@01  $PSF<list>) s@146@01))
  :qid |qp.psmValDef23|)))
(assert (forall ((s@146@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@146@01) x2@111@01)
        (<
          $Perm.No
          (- $k@113@01 (pTaken@121@01 ($SortWrappers.$SnapTo$Ref s@146@01))))
        false))
    (and
      (not (= s@146@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01)
        ($PSF.lookup_list (as sm@117@01  $PSF<list>) s@146@01))))
  :pattern (($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01))
  :pattern (($PSF.lookup_list (as sm@117@01  $PSF<list>) s@146@01))
  :qid |qp.psmValDef24|)))
(assert (forall ((s@146@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@146@01) x1@107@01)
        (<
          $Perm.No
          (- $k@109@01 (pTaken@114@01 ($SortWrappers.$SnapTo$Ref s@146@01))))
        false))
    (and
      (not (= s@146@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01)
        ($PSF.lookup_list (as sm@110@01  $PSF<list>) s@146@01))))
  :pattern (($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01))
  :pattern (($PSF.lookup_list (as sm@110@01  $PSF<list>) s@146@01))
  :qid |qp.psmValDef25|)))
(assert (forall ((s@146@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@139@01 ($SortWrappers.$SnapTo$Ref s@146@01)) xs@135@01)
        (< $Perm.No $k@138@01)
        (img@140@01 ($SortWrappers.$SnapTo$Ref s@146@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@146@01) x3@118@01)
        (<
          $Perm.No
          (- $k@120@01 (pTaken@129@01 ($SortWrappers.$SnapTo$Ref s@146@01))))
        false))
    (and
      (not (= s@146@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01)
        ($PSF.lookup_list (as sm@125@01  $PSF<list>) s@146@01))))
  :pattern (($PSF.lookup_list (as sm@145@01  $PSF<list>) s@146@01))
  :pattern (($PSF.lookup_list (as sm@125@01  $PSF<list>) s@146@01))
  :qid |qp.psmValDef26|)))
(assert (and
  (=>
    (not (= $k@128@01 $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@139@01 x4@126@01) xs@135@01)
          (img@140@01 x4@126@01)
          (= x4@126@01 (inv@139@01 x4@126@01)))
        $k@138@01
        $Perm.No)
      $k@128@01))
  (=>
    (not (= (- $k@113@01 (pTaken@121@01 x2@111@01)) $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@139@01 x2@111@01) xs@135@01)
          (img@140@01 x2@111@01)
          (= x2@111@01 (inv@139@01 x2@111@01)))
        $k@138@01
        $Perm.No)
      (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (=>
    (not (= (- $k@109@01 (pTaken@114@01 x1@107@01)) $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@139@01 x1@107@01) xs@135@01)
          (img@140@01 x1@107@01)
          (= x1@107@01 (inv@139@01 x1@107@01)))
        $k@138@01
        $Perm.No)
      (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (=>
    (not (= (- $k@120@01 (pTaken@129@01 x3@118@01)) $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@139@01 x3@118@01) xs@135@01)
          (img@140@01 x3@118@01)
          (= x3@118@01 (inv@139@01 x3@118@01)))
        $k@138@01
        $Perm.No)
      (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@145@01  $PSF<list>)) xs@135@01 x4@126@01 1 res@106@01)))
(assert (length2_impl ($SortWrappers.$PSF<list>To$Snap (as sm@145@01  $PSF<list>)) xs@135@01 x4@126@01 1 res@106@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 4
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@106@01 4)))
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
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@107@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x2@111@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@107@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x2@111@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@126@01 x2@111@01))
    (not (= x4@126@01 x1@107@01))
    (not (= x4@126@01 x3@118@01)))
  (and
    (not (= x2@111@01 x4@126@01))
    (not (= x2@111@01 x1@107@01))
    (not (= x2@111@01 x3@118@01)))
  (and
    (not (= x1@107@01 x4@126@01))
    (not (= x1@107@01 x2@111@01))
    (not (= x1@107@01 x3@118@01)))
  (and
    (not (= x3@118@01 x4@126@01))
    (not (= x3@118@01 x2@111@01))
    (not (= x3@118@01 x1@107@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x2@111@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= x2@111@01 x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= x2@111@01 x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= $Ref.null x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= $Ref.null x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= $Ref.null x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= x1@107@01 x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x1@107@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= x1@107@01 x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= x3@118@01 x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x3@118@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= x3@118@01 x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x3@118@01 x1@107@01))
    (not (= x3@118@01 x2@111@01))
    (not (= x3@118@01 x4@126@01)))
  (and
    (not (= x1@107@01 x3@118@01))
    (not (= x1@107@01 x2@111@01))
    (not (= x1@107@01 x4@126@01)))
  (and
    (not (= x2@111@01 x3@118@01))
    (not (= x2@111@01 x1@107@01))
    (not (= x2@111@01 x4@126@01)))
  (and
    (not (= x4@126@01 x3@118@01))
    (not (= x4@126@01 x1@107@01))
    (not (= x4@126@01 x2@111@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@106@01 4)))
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
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@107@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x2@111@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@107@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x2@111@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@126@01 x2@111@01))
    (not (= x4@126@01 x1@107@01))
    (not (= x4@126@01 x3@118@01)))
  (and
    (not (= x2@111@01 x4@126@01))
    (not (= x2@111@01 x1@107@01))
    (not (= x2@111@01 x3@118@01)))
  (and
    (not (= x1@107@01 x4@126@01))
    (not (= x1@107@01 x2@111@01))
    (not (= x1@107@01 x3@118@01)))
  (and
    (not (= x3@118@01 x4@126@01))
    (not (= x3@118@01 x2@111@01))
    (not (= x3@118@01 x1@107@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x2@111@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= x2@111@01 x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= x2@111@01 x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= $Ref.null x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= $Ref.null x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= $Ref.null x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= x1@107@01 x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x1@107@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= x1@107@01 x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= x3@118@01 x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x3@118@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= x3@118@01 x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x3@118@01 x1@107@01))
    (not (= x3@118@01 x2@111@01))
    (not (= x3@118@01 x4@126@01)))
  (and
    (not (= x1@107@01 x3@118@01))
    (not (= x1@107@01 x2@111@01))
    (not (= x1@107@01 x4@126@01)))
  (and
    (not (= x2@111@01 x3@118@01))
    (not (= x2@111@01 x1@107@01))
    (not (= x2@111@01 x4@126@01)))
  (and
    (not (= x4@126@01 x3@118@01))
    (not (= x4@126@01 x1@107@01))
    (not (= x4@126@01 x2@111@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@106@01 4)))
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
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@107@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x2@111@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@107@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@111@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x2@111@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x1@107@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@126@01 x3@118@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@128@01)
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01)))
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01)))
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01))
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No $k@128@01))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@134@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@126@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No (- $k@113@01 (pTaken@121@01 x2@111@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@117@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@111@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@120@01 (pTaken@129@01 x3@118@01)))
    (< $Perm.No (- $k@109@01 (pTaken@114@01 x1@107@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@125@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@118@01))
      ($PSF.lookup_list (as sm@110@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@107@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@126@01 x2@111@01))
    (not (= x4@126@01 x1@107@01))
    (not (= x4@126@01 x3@118@01)))
  (and
    (not (= x2@111@01 x4@126@01))
    (not (= x2@111@01 x1@107@01))
    (not (= x2@111@01 x3@118@01)))
  (and
    (not (= x1@107@01 x4@126@01))
    (not (= x1@107@01 x2@111@01))
    (not (= x1@107@01 x3@118@01)))
  (and
    (not (= x3@118@01 x4@126@01))
    (not (= x3@118@01 x2@111@01))
    (not (= x3@118@01 x1@107@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@120@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@109@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@113@01) (- $Perm.Write $k@128@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@120@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@109@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@128@01) (- $Perm.Write $k@113@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x2@111@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= x2@111@01 x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@120@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= x2@111@01 x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= $Ref.null x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= $Ref.null x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@109@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= $Ref.null x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= x1@107@01 x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x1@107@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@113@01))
    (< $Perm.No (- $Perm.Write $k@128@01)))
  (not (= x1@107@01 x3@118@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@120@01)))
  (not (= x3@118@01 x2@111@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@109@01)))
  (not (= x3@118@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@128@01))
    (< $Perm.No (- $Perm.Write $k@113@01)))
  (not (= x3@118@01 x1@107@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x3@118@01 x1@107@01))
    (not (= x3@118@01 x2@111@01))
    (not (= x3@118@01 x4@126@01)))
  (and
    (not (= x1@107@01 x3@118@01))
    (not (= x1@107@01 x2@111@01))
    (not (= x1@107@01 x4@126@01)))
  (and
    (not (= x2@111@01 x3@118@01))
    (not (= x2@111@01 x1@107@01))
    (not (= x2@111@01 x4@126@01)))
  (and
    (not (= x4@126@01 x3@118@01))
    (not (= x4@126@01 x1@107@01))
    (not (= x4@126@01 x2@111@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@106@01 4)))
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
; ---------- test3_length1 ----------
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
; var x1: Ref
(declare-const x1@147@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@148@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@149@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@150@01 $Ref)
(assert (not (= x1@150@01 $Ref.null)))
(declare-const next@151@01 $Ref)
(assert (not (= x1@150@01 x1@147@01)))
(assert (not (Set_in x1@150@01 xs@148@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 21 | False | dead]
; [else-branch: 21 | True | live]
(push) ; 3
; [else-branch: 21 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@150@01))
(declare-const sm@152@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@152@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@150@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
(declare-const sm@153@01 $PSF<list>)
(declare-const s@154@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@154@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@154@01) x1@150@01)
    (and
      (not (= s@154@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@153@01  $PSF<list>) s@154@01)
        ($PSF.lookup_list (as sm@152@01  $PSF<list>) s@154@01))))
  :pattern (($PSF.lookup_list (as sm@153@01  $PSF<list>) s@154@01))
  :pattern (($PSF.lookup_list (as sm@152@01  $PSF<list>) s@154@01))
  :qid |qp.psmValDef28|)))
(assert (forall ((s@154@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@152@01  $PSF<list>) s@154@01) s@154@01)
  :pattern (($PSF.lookup_list (as sm@153@01  $PSF<list>) s@154@01))
  :qid |qp.psmResTrgDef29|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@153@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@150@01)) ($SortWrappers.$RefTo$Snap x1@150@01)))
; [exec]
; xs := Set(x1)
; [eval] Set(x1)
(declare-const xs@155@01 Set<$Ref>)
(assert (= xs@155@01 (Set_singleton x1@150@01)))
; [exec]
; inhale length3_impl(xs, x1, 1, res)
(declare-const $t@156@01 $Snap)
(assert (= $t@156@01 $Snap.unit))
; [eval] length3_impl(xs, x1, 1, res)
(push) ; 4
(declare-const x@157@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@157@01 xs@155@01))
(declare-const $k@158@01 $Perm)
(assert ($Perm.isReadVar $k@158@01))
(pop) ; 5
(declare-fun inv@159@01 ($Ref) $Ref)
(declare-fun img@160@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@158@01))
; Nested auxiliary terms: non-globals
(push) ; 5
(assert (not (forall ((x@157@01 $Ref)) (!
  (=>
    (Set_in x@157@01 xs@155@01)
    (or (= $k@158@01 $Perm.No) (< $Perm.No $k@158@01)))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@157@01 $Ref) (x2@157@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@157@01 xs@155@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@153@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@157@01)) ($SortWrappers.$RefTo$Snap x1@157@01)))
        (< $Perm.No $k@158@01))
      (and
        (and
          (Set_in x2@157@01 xs@155@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@153@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@157@01)) ($SortWrappers.$RefTo$Snap x2@157@01)))
        (< $Perm.No $k@158@01))
      (= x1@157@01 x2@157@01))
    (= x1@157@01 x2@157@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@157@01 $Ref)) (!
  (=>
    (and (Set_in x@157@01 xs@155@01) (< $Perm.No $k@158@01))
    (and (= (inv@159@01 x@157@01) x@157@01) (img@160@01 x@157@01)))
  :pattern ((Set_in x@157@01 xs@155@01))
  :pattern ((inv@159@01 x@157@01))
  :pattern ((img@160@01 x@157@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@160@01 x)
      (and (Set_in (inv@159@01 x) xs@155@01) (< $Perm.No $k@158@01)))
    (= (inv@159@01 x) x))
  :pattern ((inv@159@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@159@01 x) xs@155@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@153@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@159@01 x))
  :qid |quant-u-95|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@161@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@159@01 x) xs@155@01) (img@160@01 x) (= x (inv@159@01 x)))
    ($Perm.min (ite (= x x1@150@01) $Perm.Write $Perm.No) $k@158@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@158@01
(assert (<
  (ite
    (and
      (Set_in (inv@159@01 x1@150@01) xs@155@01)
      (img@160@01 x1@150@01)
      (= x1@150@01 (inv@159@01 x1@150@01)))
    $k@158@01
    $Perm.No)
  $Perm.Write))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@159@01 x) xs@155@01) (img@160@01 x) (= x (inv@159@01 x)))
    (= (- $k@158@01 (pTaken@161@01 x)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@162@01 $PSF<list>)
(declare-const s@163@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@163@01 $Snap)) (!
  (and
    (=>
      (Set_in s@163@01 ($PSF.domain_list (as sm@162@01  $PSF<list>)))
      (and
        (Set_in (inv@159@01 ($SortWrappers.$SnapTo$Ref s@163@01)) xs@155@01)
        (< $Perm.No $k@158@01)
        (img@160@01 ($SortWrappers.$SnapTo$Ref s@163@01))))
    (=>
      (and
        (Set_in (inv@159@01 ($SortWrappers.$SnapTo$Ref s@163@01)) xs@155@01)
        (< $Perm.No $k@158@01)
        (img@160@01 ($SortWrappers.$SnapTo$Ref s@163@01)))
      (Set_in s@163@01 ($PSF.domain_list (as sm@162@01  $PSF<list>)))))
  :pattern ((Set_in s@163@01 ($PSF.domain_list (as sm@162@01  $PSF<list>))))
  :qid |qp.psmDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@163@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@159@01 ($SortWrappers.$SnapTo$Ref s@163@01)) xs@155@01)
        (< $Perm.No $k@158@01)
        (img@160@01 ($SortWrappers.$SnapTo$Ref s@163@01)))
      (= ($SortWrappers.$SnapTo$Ref s@163@01) x1@150@01))
    (and
      (not (= s@163@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@162@01  $PSF<list>) s@163@01)
        ($PSF.lookup_list (as sm@152@01  $PSF<list>) s@163@01))))
  :pattern (($PSF.lookup_list (as sm@162@01  $PSF<list>) s@163@01))
  :pattern (($PSF.lookup_list (as sm@152@01  $PSF<list>) s@163@01))
  :qid |qp.psmValDef31|)))
(assert (forall ((s@163@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@152@01  $PSF<list>) s@163@01) s@163@01)
  :pattern (($PSF.lookup_list (as sm@162@01  $PSF<list>) s@163@01))
  :qid |qp.psmResTrgDef32|)))
(assert (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@162@01  $PSF<list>)) xs@155@01 x1@150@01 1 res@149@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@158@01))
(assert (forall ((x@157@01 $Ref)) (!
  (=>
    (and (Set_in x@157@01 xs@155@01) (< $Perm.No $k@158@01))
    (and (= (inv@159@01 x@157@01) x@157@01) (img@160@01 x@157@01)))
  :pattern ((Set_in x@157@01 xs@155@01))
  :pattern ((inv@159@01 x@157@01))
  :pattern ((img@160@01 x@157@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@160@01 x)
      (and (Set_in (inv@159@01 x) xs@155@01) (< $Perm.No $k@158@01)))
    (= (inv@159@01 x) x))
  :pattern ((inv@159@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@163@01 $Snap)) (!
  (and
    (=>
      (Set_in s@163@01 ($PSF.domain_list (as sm@162@01  $PSF<list>)))
      (and
        (Set_in (inv@159@01 ($SortWrappers.$SnapTo$Ref s@163@01)) xs@155@01)
        (< $Perm.No $k@158@01)
        (img@160@01 ($SortWrappers.$SnapTo$Ref s@163@01))))
    (=>
      (and
        (Set_in (inv@159@01 ($SortWrappers.$SnapTo$Ref s@163@01)) xs@155@01)
        (< $Perm.No $k@158@01)
        (img@160@01 ($SortWrappers.$SnapTo$Ref s@163@01)))
      (Set_in s@163@01 ($PSF.domain_list (as sm@162@01  $PSF<list>)))))
  :pattern ((Set_in s@163@01 ($PSF.domain_list (as sm@162@01  $PSF<list>))))
  :qid |qp.psmDomDef33|)))
(assert (forall ((s@163@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@159@01 ($SortWrappers.$SnapTo$Ref s@163@01)) xs@155@01)
        (< $Perm.No $k@158@01)
        (img@160@01 ($SortWrappers.$SnapTo$Ref s@163@01)))
      (= ($SortWrappers.$SnapTo$Ref s@163@01) x1@150@01))
    (and
      (not (= s@163@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@162@01  $PSF<list>) s@163@01)
        ($PSF.lookup_list (as sm@152@01  $PSF<list>) s@163@01))))
  :pattern (($PSF.lookup_list (as sm@162@01  $PSF<list>) s@163@01))
  :pattern (($PSF.lookup_list (as sm@152@01  $PSF<list>) s@163@01))
  :qid |qp.psmValDef31|)))
(assert (forall ((s@163@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@152@01  $PSF<list>) s@163@01) s@163@01)
  :pattern (($PSF.lookup_list (as sm@162@01  $PSF<list>) s@163@01))
  :qid |qp.psmResTrgDef32|)))
(assert (and
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@159@01 x) xs@155@01)
      ($PSF.loc_list ($PSF.lookup_list (as sm@153@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@159@01 x))
    :qid |quant-u-95|))
  (<
    (ite
      (and
        (Set_in (inv@159@01 x1@150@01) xs@155@01)
        (img@160@01 x1@150@01)
        (= x1@150@01 (inv@159@01 x1@150@01)))
      $k@158@01
      $Perm.No)
    $Perm.Write)
  (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@162@01  $PSF<list>)) xs@155@01 x1@150@01 1 res@149@01)))
(assert (length3_impl ($SortWrappers.$PSF<list>To$Snap (as sm@162@01  $PSF<list>)) xs@155@01 x1@150@01 1 res@149@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 1
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@149@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@149@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@149@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@149@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3_length2 ----------
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
; var x1: Ref
(declare-const x1@164@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@165@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@166@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@167@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@168@01 $Ref)
(assert (not (= x1@168@01 $Ref.null)))
(declare-const next@169@01 $Ref)
(assert (not (= x1@168@01 x2@165@01)))
(assert (not (= x1@168@01 x1@164@01)))
(assert (not (Set_in x1@168@01 xs@166@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), wildcard)
(declare-const $k@170@01 $Perm)
(assert ($Perm.isReadVar $k@170@01))
(assert (< $k@170@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@170@01)))
(assert (<= (- $Perm.Write $k@170@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@170@01)) (not (= x1@168@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@170@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 22 | False | dead]
; [else-branch: 22 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 22 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@168@01))
(declare-const sm@171@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
(declare-const sm@172@01 $PSF<list>)
(declare-const s@173@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@173@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@173@01) x1@168@01)
      (< $Perm.No $k@170@01)
      false)
    (and
      (not (= s@173@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@172@01  $PSF<list>) s@173@01)
        ($PSF.lookup_list (as sm@171@01  $PSF<list>) s@173@01))))
  :pattern (($PSF.lookup_list (as sm@172@01  $PSF<list>) s@173@01))
  :pattern (($PSF.lookup_list (as sm@171@01  $PSF<list>) s@173@01))
  :qid |qp.psmValDef34|)))
(assert (forall ((s@173@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@171@01  $PSF<list>) s@173@01) s@173@01)
  :pattern (($PSF.lookup_list (as sm@172@01  $PSF<list>) s@173@01))
  :qid |qp.psmResTrgDef35|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@172@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01)) ($SortWrappers.$RefTo$Snap x1@168@01)))
; [exec]
; x2 := new(next)
(declare-const x2@174@01 $Ref)
(assert (not (= x2@174@01 $Ref.null)))
(declare-const next@175@01 $Ref)
(assert (not (= x2@174@01 x1@168@01)))
(assert (not (= x2@174@01 x2@165@01)))
(assert (not (Set_in x2@174@01 xs@166@01)))
; [exec]
; x2.next := x1
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@168@01 x2@174@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x2), wildcard)
(declare-const $k@176@01 $Perm)
(assert ($Perm.isReadVar $k@176@01))
(assert (< $k@176@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@176@01)))
(assert (<= (- $Perm.Write $k@176@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@176@01)) (not (= x2@174@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@176@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@168@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | x1@168@01 != Null | live]
; [else-branch: 23 | x1@168@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | x1@168@01 != Null]
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@177@01 ((x $Ref)) $Perm
  (ite
    (= x x1@168@01)
    ($Perm.min (ite (= x x1@168@01) $k@170@01 $Perm.No) $k@176@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@176@01
(assert (=> (not (= $k@170@01 $Perm.No)) (< $k@176@01 $k@170@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x1@168@01) (= (- $k@176@01 (pTaken@177@01 x)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No $k@170@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x1@168@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@172@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01))
      ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01))))))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01)) ($SortWrappers.$RefTo$Snap x1@168@01)))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@168@01)
  ($PSF.lookup_list (as sm@172@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01))) x2@174@01))
(declare-const sm@178@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@178@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@174@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@168@01)
    ($PSF.lookup_list (as sm@172@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01)))))
(declare-const sm@179@01 $PSF<list>)
(declare-const s@180@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@180@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@180@01) x2@174@01)
      (< $Perm.No $k@176@01)
      false)
    (and
      (not (= s@180@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@179@01  $PSF<list>) s@180@01)
        ($PSF.lookup_list (as sm@178@01  $PSF<list>) s@180@01))))
  :pattern (($PSF.lookup_list (as sm@179@01  $PSF<list>) s@180@01))
  :pattern (($PSF.lookup_list (as sm@178@01  $PSF<list>) s@180@01))
  :qid |qp.psmValDef37|)))
(assert (forall ((s@180@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@180@01) x1@168@01)
      (<
        $Perm.No
        (- $k@170@01 (pTaken@177@01 ($SortWrappers.$SnapTo$Ref s@180@01))))
      false)
    (and
      (not (= s@180@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@179@01  $PSF<list>) s@180@01)
        ($PSF.lookup_list (as sm@171@01  $PSF<list>) s@180@01))))
  :pattern (($PSF.lookup_list (as sm@179@01  $PSF<list>) s@180@01))
  :pattern (($PSF.lookup_list (as sm@171@01  $PSF<list>) s@180@01))
  :qid |qp.psmValDef38|)))
(assert (forall ((s@180@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@178@01  $PSF<list>) s@180@01) s@180@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@171@01  $PSF<list>) s@180@01) s@180@01))
  :pattern (($PSF.lookup_list (as sm@179@01  $PSF<list>) s@180@01))
  :qid |qp.psmResTrgDef39|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@179@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@174@01)) ($SortWrappers.$RefTo$Snap x2@174@01)))
; [exec]
; xs := Set(x1, x2)
; [eval] Set(x1, x2)
(declare-const xs@181@01 Set<$Ref>)
(assert (= xs@181@01 (Set_unionone (Set_singleton x1@168@01) x2@174@01)))
; [exec]
; assert (x1 in xs) && (x2 in xs)
; [eval] (x1 in xs)
(set-option :timeout 0)
(push) ; 5
(assert (not (Set_in x1@168@01 xs@181@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x1@168@01 xs@181@01))
; [eval] (x2 in xs)
(push) ; 5
(assert (not (Set_in x2@174@01 xs@181@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x2@174@01 xs@181@01))
; [exec]
; inhale length3_impl(xs, x2, 1, res)
(declare-const $t@182@01 $Snap)
(assert (= $t@182@01 $Snap.unit))
; [eval] length3_impl(xs, x2, 1, res)
(push) ; 5
(declare-const x@183@01 $Ref)
(push) ; 6
; [eval] (x in xs)
(assert (Set_in x@183@01 xs@181@01))
(declare-const $k@184@01 $Perm)
(assert ($Perm.isReadVar $k@184@01))
(pop) ; 6
(declare-fun inv@185@01 ($Ref) $Ref)
(declare-fun img@186@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@184@01))
; Nested auxiliary terms: non-globals
(push) ; 6
(assert (not (forall ((x@183@01 $Ref)) (!
  (=>
    (Set_in x@183@01 xs@181@01)
    (or (= $k@184@01 $Perm.No) (< $Perm.No $k@184@01)))
  
  :qid |quant-u-102|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((x1@183@01 $Ref) (x2@183@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@183@01 xs@181@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@179@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@183@01)) ($SortWrappers.$RefTo$Snap x1@183@01)))
        (< $Perm.No $k@184@01))
      (and
        (and
          (Set_in x2@183@01 xs@181@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@179@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@183@01)) ($SortWrappers.$RefTo$Snap x2@183@01)))
        (< $Perm.No $k@184@01))
      (= x1@183@01 x2@183@01))
    (= x1@183@01 x2@183@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@183@01 $Ref)) (!
  (=>
    (and (Set_in x@183@01 xs@181@01) (< $Perm.No $k@184@01))
    (and (= (inv@185@01 x@183@01) x@183@01) (img@186@01 x@183@01)))
  :pattern ((Set_in x@183@01 xs@181@01))
  :pattern ((inv@185@01 x@183@01))
  :pattern ((img@186@01 x@183@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@186@01 x)
      (and (Set_in (inv@185@01 x) xs@181@01) (< $Perm.No $k@184@01)))
    (= (inv@185@01 x) x))
  :pattern ((inv@185@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@185@01 x) xs@181@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@179@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@185@01 x))
  :qid |quant-u-103|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@187@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@185@01 x) xs@181@01) (img@186@01 x) (= x (inv@185@01 x)))
    ($Perm.min (ite (= x x2@174@01) $k@176@01 $Perm.No) $k@184@01)
    $Perm.No))
(define-fun pTaken@188@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@185@01 x) xs@181@01) (img@186@01 x) (= x (inv@185@01 x)))
    ($Perm.min
      (ite (= x x1@168@01) (- $k@170@01 (pTaken@177@01 x)) $Perm.No)
      (- $k@184@01 (pTaken@187@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@184@01
(assert (=>
  (not (= $k@176@01 $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@185@01 x2@174@01) xs@181@01)
        (img@186@01 x2@174@01)
        (= x2@174@01 (inv@185@01 x2@174@01)))
      $k@184@01
      $Perm.No)
    $k@176@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@185@01 x) xs@181@01) (img@186@01 x) (= x (inv@185@01 x)))
    (= (- $k@184@01 (pTaken@187@01 x)) $Perm.No))
  
  :qid |quant-u-106|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@184@01
(assert (=>
  (not (= (- $k@170@01 (pTaken@177@01 x1@168@01)) $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@185@01 x1@168@01) xs@181@01)
        (img@186@01 x1@168@01)
        (= x1@168@01 (inv@185@01 x1@168@01)))
      $k@184@01
      $Perm.No)
    (- $k@170@01 (pTaken@177@01 x1@168@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@185@01 x) xs@181@01) (img@186@01 x) (= x (inv@185@01 x)))
    (= (- (- $k@184@01 (pTaken@187@01 x)) (pTaken@188@01 x)) $Perm.No))
  
  :qid |quant-u-108|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@189@01 $PSF<list>)
(declare-const s@190@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@190@01 $Snap)) (!
  (and
    (=>
      (Set_in s@190@01 ($PSF.domain_list (as sm@189@01  $PSF<list>)))
      (and
        (Set_in (inv@185@01 ($SortWrappers.$SnapTo$Ref s@190@01)) xs@181@01)
        (< $Perm.No $k@184@01)
        (img@186@01 ($SortWrappers.$SnapTo$Ref s@190@01))))
    (=>
      (and
        (Set_in (inv@185@01 ($SortWrappers.$SnapTo$Ref s@190@01)) xs@181@01)
        (< $Perm.No $k@184@01)
        (img@186@01 ($SortWrappers.$SnapTo$Ref s@190@01)))
      (Set_in s@190@01 ($PSF.domain_list (as sm@189@01  $PSF<list>)))))
  :pattern ((Set_in s@190@01 ($PSF.domain_list (as sm@189@01  $PSF<list>))))
  :qid |qp.psmDomDef45|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@190@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@185@01 ($SortWrappers.$SnapTo$Ref s@190@01)) xs@181@01)
        (< $Perm.No $k@184@01)
        (img@186@01 ($SortWrappers.$SnapTo$Ref s@190@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@190@01) x2@174@01)
        (< $Perm.No $k@176@01)
        false))
    (and
      (not (= s@190@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01)
        ($PSF.lookup_list (as sm@178@01  $PSF<list>) s@190@01))))
  :pattern (($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01))
  :pattern (($PSF.lookup_list (as sm@178@01  $PSF<list>) s@190@01))
  :qid |qp.psmValDef42|)))
(assert (forall ((s@190@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@185@01 ($SortWrappers.$SnapTo$Ref s@190@01)) xs@181@01)
        (< $Perm.No $k@184@01)
        (img@186@01 ($SortWrappers.$SnapTo$Ref s@190@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@190@01) x1@168@01)
        (<
          $Perm.No
          (- $k@170@01 (pTaken@177@01 ($SortWrappers.$SnapTo$Ref s@190@01))))
        false))
    (and
      (not (= s@190@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01)
        ($PSF.lookup_list (as sm@171@01  $PSF<list>) s@190@01))))
  :pattern (($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01))
  :pattern (($PSF.lookup_list (as sm@171@01  $PSF<list>) s@190@01))
  :qid |qp.psmValDef43|)))
(assert (forall ((s@190@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@178@01  $PSF<list>) s@190@01) s@190@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@171@01  $PSF<list>) s@190@01) s@190@01))
  :pattern (($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01))
  :qid |qp.psmResTrgDef44|)))
(assert (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@189@01  $PSF<list>)) xs@181@01 x2@174@01 1 res@167@01))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@184@01))
(assert (forall ((x@183@01 $Ref)) (!
  (=>
    (and (Set_in x@183@01 xs@181@01) (< $Perm.No $k@184@01))
    (and (= (inv@185@01 x@183@01) x@183@01) (img@186@01 x@183@01)))
  :pattern ((Set_in x@183@01 xs@181@01))
  :pattern ((inv@185@01 x@183@01))
  :pattern ((img@186@01 x@183@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@186@01 x)
      (and (Set_in (inv@185@01 x) xs@181@01) (< $Perm.No $k@184@01)))
    (= (inv@185@01 x) x))
  :pattern ((inv@185@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@190@01 $Snap)) (!
  (and
    (=>
      (Set_in s@190@01 ($PSF.domain_list (as sm@189@01  $PSF<list>)))
      (and
        (Set_in (inv@185@01 ($SortWrappers.$SnapTo$Ref s@190@01)) xs@181@01)
        (< $Perm.No $k@184@01)
        (img@186@01 ($SortWrappers.$SnapTo$Ref s@190@01))))
    (=>
      (and
        (Set_in (inv@185@01 ($SortWrappers.$SnapTo$Ref s@190@01)) xs@181@01)
        (< $Perm.No $k@184@01)
        (img@186@01 ($SortWrappers.$SnapTo$Ref s@190@01)))
      (Set_in s@190@01 ($PSF.domain_list (as sm@189@01  $PSF<list>)))))
  :pattern ((Set_in s@190@01 ($PSF.domain_list (as sm@189@01  $PSF<list>))))
  :qid |qp.psmDomDef45|)))
(assert (forall ((s@190@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@185@01 ($SortWrappers.$SnapTo$Ref s@190@01)) xs@181@01)
        (< $Perm.No $k@184@01)
        (img@186@01 ($SortWrappers.$SnapTo$Ref s@190@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@190@01) x2@174@01)
        (< $Perm.No $k@176@01)
        false))
    (and
      (not (= s@190@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01)
        ($PSF.lookup_list (as sm@178@01  $PSF<list>) s@190@01))))
  :pattern (($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01))
  :pattern (($PSF.lookup_list (as sm@178@01  $PSF<list>) s@190@01))
  :qid |qp.psmValDef42|)))
(assert (forall ((s@190@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@185@01 ($SortWrappers.$SnapTo$Ref s@190@01)) xs@181@01)
        (< $Perm.No $k@184@01)
        (img@186@01 ($SortWrappers.$SnapTo$Ref s@190@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@190@01) x1@168@01)
        (<
          $Perm.No
          (- $k@170@01 (pTaken@177@01 ($SortWrappers.$SnapTo$Ref s@190@01))))
        false))
    (and
      (not (= s@190@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01)
        ($PSF.lookup_list (as sm@171@01  $PSF<list>) s@190@01))))
  :pattern (($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01))
  :pattern (($PSF.lookup_list (as sm@171@01  $PSF<list>) s@190@01))
  :qid |qp.psmValDef43|)))
(assert (forall ((s@190@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@178@01  $PSF<list>) s@190@01) s@190@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@171@01  $PSF<list>) s@190@01) s@190@01))
  :pattern (($PSF.lookup_list (as sm@189@01  $PSF<list>) s@190@01))
  :qid |qp.psmResTrgDef44|)))
(assert (and
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@185@01 x) xs@181@01)
      ($PSF.loc_list ($PSF.lookup_list (as sm@179@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@185@01 x))
    :qid |quant-u-103|))
  (=>
    (not (= $k@176@01 $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@185@01 x2@174@01) xs@181@01)
          (img@186@01 x2@174@01)
          (= x2@174@01 (inv@185@01 x2@174@01)))
        $k@184@01
        $Perm.No)
      $k@176@01))
  (=>
    (not (= (- $k@170@01 (pTaken@177@01 x1@168@01)) $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@185@01 x1@168@01) xs@181@01)
          (img@186@01 x1@168@01)
          (= x1@168@01 (inv@185@01 x1@168@01)))
        $k@184@01
        $Perm.No)
      (- $k@170@01 (pTaken@177@01 x1@168@01))))
  (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@189@01  $PSF<list>)) xs@181@01 x2@174@01 1 res@167@01)))
(assert (length3_impl ($SortWrappers.$PSF<list>To$Snap (as sm@189@01  $PSF<list>)) xs@181@01 x2@174@01 1 res@167@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 2
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@167@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@174@01 x1@168@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@174@01 x1@168@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@176@01)
    (< $Perm.No (- $k@170@01 (pTaken@177@01 x1@168@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@178@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@174@01))
      ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@170@01 (pTaken@177@01 x1@168@01)))
    (< $Perm.No $k@176@01))
  (not
    (=
      ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01))
      ($PSF.lookup_list (as sm@178@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@174@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x2@174@01 x1@168@01)) (not (= x1@168@01 x2@174@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@170@01) (- $Perm.Write $k@176@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@176@01) (- $Perm.Write $k@170@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@170@01))
    (< $Perm.No (- $Perm.Write $k@176@01)))
  (not (= $Ref.null x1@168@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@176@01))
    (< $Perm.No (- $Perm.Write $k@170@01)))
  (not (= x1@168@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x1@168@01 x2@174@01)) (not (= x2@174@01 x1@168@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@167@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@174@01 x1@168@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@174@01 x1@168@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@176@01)
    (< $Perm.No (- $k@170@01 (pTaken@177@01 x1@168@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@178@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@174@01))
      ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@170@01 (pTaken@177@01 x1@168@01)))
    (< $Perm.No $k@176@01))
  (not
    (=
      ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01))
      ($PSF.lookup_list (as sm@178@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@174@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x2@174@01 x1@168@01)) (not (= x1@168@01 x2@174@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@170@01) (- $Perm.Write $k@176@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@176@01) (- $Perm.Write $k@170@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@170@01))
    (< $Perm.No (- $Perm.Write $k@176@01)))
  (not (= $Ref.null x1@168@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@176@01))
    (< $Perm.No (- $Perm.Write $k@170@01)))
  (not (= x1@168@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x1@168@01 x2@174@01)) (not (= x2@174@01 x1@168@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@167@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@174@01 x1@168@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@174@01 x1@168@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@176@01)
    (< $Perm.No (- $k@170@01 (pTaken@177@01 x1@168@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@178@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@174@01))
      ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@170@01 (pTaken@177@01 x1@168@01)))
    (< $Perm.No $k@176@01))
  (not
    (=
      ($PSF.lookup_list (as sm@171@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@168@01))
      ($PSF.lookup_list (as sm@178@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@174@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x2@174@01 x1@168@01)) (not (= x1@168@01 x2@174@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@170@01) (- $Perm.Write $k@176@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@176@01) (- $Perm.Write $k@170@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@170@01))
    (< $Perm.No (- $Perm.Write $k@176@01)))
  (not (= $Ref.null x1@168@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@176@01))
    (< $Perm.No (- $Perm.Write $k@170@01)))
  (not (= x1@168@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x1@168@01 x2@174@01)) (not (= x2@174@01 x1@168@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@167@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3_length4 ----------
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
; var x1: Ref
(declare-const x1@191@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@192@01 $Ref)
; [exec]
; var x3: Ref
(declare-const x3@193@01 $Ref)
; [exec]
; var x4: Ref
(declare-const x4@194@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@195@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@196@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@197@01 $Ref)
(assert (not (= x1@197@01 $Ref.null)))
(declare-const next@198@01 $Ref)
(assert (not (= x1@197@01 x3@193@01)))
(assert (not (= x1@197@01 x1@191@01)))
(assert (not (= x1@197@01 x4@194@01)))
(assert (not (= x1@197@01 x2@192@01)))
(assert (not (Set_in x1@197@01 xs@195@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), wildcard)
(declare-const $k@199@01 $Perm)
(assert ($Perm.isReadVar $k@199@01))
(assert (< $k@199@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@199@01)))
(assert (<= (- $Perm.Write $k@199@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@199@01)) (not (= x1@197@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@199@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 24 | False | dead]
; [else-branch: 24 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 24 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@197@01))
(declare-const sm@200@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
(declare-const sm@201@01 $PSF<list>)
(declare-const s@202@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@202@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@202@01) x1@197@01)
      (< $Perm.No $k@199@01)
      false)
    (and
      (not (= s@202@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@201@01  $PSF<list>) s@202@01)
        ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@202@01))))
  :pattern (($PSF.lookup_list (as sm@201@01  $PSF<list>) s@202@01))
  :pattern (($PSF.lookup_list (as sm@200@01  $PSF<list>) s@202@01))
  :qid |qp.psmValDef46|)))
(assert (forall ((s@202@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@202@01) s@202@01)
  :pattern (($PSF.lookup_list (as sm@201@01  $PSF<list>) s@202@01))
  :qid |qp.psmResTrgDef47|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@201@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)) ($SortWrappers.$RefTo$Snap x1@197@01)))
; [exec]
; x2 := new(next)
(declare-const x2@203@01 $Ref)
(assert (not (= x2@203@01 $Ref.null)))
(declare-const next@204@01 $Ref)
(assert (not (= x2@203@01 x3@193@01)))
(assert (not (= x2@203@01 x4@194@01)))
(assert (not (= x2@203@01 x1@197@01)))
(assert (not (= x2@203@01 x2@192@01)))
(assert (not (Set_in x2@203@01 xs@195@01)))
; [exec]
; x2.next := x1
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@197@01 x2@203@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x2), wildcard)
(declare-const $k@205@01 $Perm)
(assert ($Perm.isReadVar $k@205@01))
(assert (< $k@205@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@205@01)))
(assert (<= (- $Perm.Write $k@205@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@205@01)) (not (= x2@203@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@205@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@197@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | x1@197@01 != Null | live]
; [else-branch: 25 | x1@197@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | x1@197@01 != Null]
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@206@01 ((x $Ref)) $Perm
  (ite
    (= x x1@197@01)
    ($Perm.min (ite (= x x1@197@01) $k@199@01 $Perm.No) $k@205@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@205@01
(assert (=> (not (= $k@199@01 $Perm.No)) (< $k@205@01 $k@199@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x1@197@01) (= (- $k@205@01 (pTaken@206@01 x)) $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No $k@199@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x1@197@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@201@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))))))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)) ($SortWrappers.$RefTo$Snap x1@197@01)))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@197@01)
  ($PSF.lookup_list (as sm@201@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))) x2@203@01))
(declare-const sm@207@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@197@01)
    ($PSF.lookup_list (as sm@201@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))
(declare-const sm@208@01 $PSF<list>)
(declare-const s@209@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@209@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@209@01) x2@203@01)
      (< $Perm.No $k@205@01)
      false)
    (and
      (not (= s@209@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) s@209@01)
        ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@209@01))))
  :pattern (($PSF.lookup_list (as sm@208@01  $PSF<list>) s@209@01))
  :pattern (($PSF.lookup_list (as sm@207@01  $PSF<list>) s@209@01))
  :qid |qp.psmValDef49|)))
(assert (forall ((s@209@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@209@01) x1@197@01)
      (<
        $Perm.No
        (- $k@199@01 (pTaken@206@01 ($SortWrappers.$SnapTo$Ref s@209@01))))
      false)
    (and
      (not (= s@209@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) s@209@01)
        ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@209@01))))
  :pattern (($PSF.lookup_list (as sm@208@01  $PSF<list>) s@209@01))
  :pattern (($PSF.lookup_list (as sm@200@01  $PSF<list>) s@209@01))
  :qid |qp.psmValDef50|)))
(assert (forall ((s@209@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@209@01) s@209@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@209@01) s@209@01))
  :pattern (($PSF.lookup_list (as sm@208@01  $PSF<list>) s@209@01))
  :qid |qp.psmResTrgDef51|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)) ($SortWrappers.$RefTo$Snap x2@203@01)))
; [exec]
; x3 := new(next)
(declare-const x3@210@01 $Ref)
(assert (not (= x3@210@01 $Ref.null)))
(declare-const next@211@01 $Ref)
(assert (not (= x3@210@01 x3@193@01)))
(assert (not (= x3@210@01 x2@203@01)))
(assert (not (= x3@210@01 x4@194@01)))
(assert (not (= x3@210@01 x1@197@01)))
(assert (not (Set_in x3@210@01 xs@195@01)))
; [exec]
; x3.next := x2
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@203@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@197@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x3), wildcard)
(declare-const $k@212@01 $Perm)
(assert ($Perm.isReadVar $k@212@01))
(assert (< $k@212@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@212@01)))
(assert (<= (- $Perm.Write $k@212@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@212@01)) (not (= x3@210@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@212@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@203@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | x2@203@01 != Null | live]
; [else-branch: 26 | x2@203@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 26 | x2@203@01 != Null]
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@213@01 ((x $Ref)) $Perm
  (ite
    (= x x2@203@01)
    ($Perm.min (ite (= x x2@203@01) $k@205@01 $Perm.No) $k@212@01)
    $Perm.No))
(define-fun pTaken@214@01 ((x $Ref)) $Perm
  (ite
    (= x x2@203@01)
    ($Perm.min
      (ite (= x x1@197@01) (- $k@199@01 (pTaken@206@01 x)) $Perm.No)
      (- $k@212@01 (pTaken@213@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@212@01
(assert (=> (not (= $k@205@01 $Perm.No)) (< $k@212@01 $k@205@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x2@203@01) (= (- $k@212@01 (pTaken@213@01 x)) $Perm.No))
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No $k@205@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x2@203@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))))))
(assert (=>
  (ite
    (= x2@203@01 x1@197@01)
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x2@203@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x2@203@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))))))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)) ($SortWrappers.$RefTo$Snap x2@203@01))
  ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)) ($SortWrappers.$RefTo$Snap x2@203@01))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x2@203@01)
  ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))) x3@210@01))
(declare-const sm@215@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@203@01)
    ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))
(declare-const sm@216@01 $PSF<list>)
(declare-const s@217@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@217@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@217@01) x3@210@01)
      (< $Perm.No $k@212@01)
      false)
    (and
      (not (= s@217@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@216@01  $PSF<list>) s@217@01)
        ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@217@01))))
  :pattern (($PSF.lookup_list (as sm@216@01  $PSF<list>) s@217@01))
  :pattern (($PSF.lookup_list (as sm@215@01  $PSF<list>) s@217@01))
  :qid |qp.psmValDef53|)))
(assert (forall ((s@217@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@217@01) x1@197@01)
      (<
        $Perm.No
        (- $k@199@01 (pTaken@206@01 ($SortWrappers.$SnapTo$Ref s@217@01))))
      false)
    (and
      (not (= s@217@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@216@01  $PSF<list>) s@217@01)
        ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@217@01))))
  :pattern (($PSF.lookup_list (as sm@216@01  $PSF<list>) s@217@01))
  :pattern (($PSF.lookup_list (as sm@200@01  $PSF<list>) s@217@01))
  :qid |qp.psmValDef54|)))
(assert (forall ((s@217@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@217@01) x2@203@01)
      (<
        $Perm.No
        (- $k@205@01 (pTaken@213@01 ($SortWrappers.$SnapTo$Ref s@217@01))))
      false)
    (and
      (not (= s@217@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@216@01  $PSF<list>) s@217@01)
        ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@217@01))))
  :pattern (($PSF.lookup_list (as sm@216@01  $PSF<list>) s@217@01))
  :pattern (($PSF.lookup_list (as sm@207@01  $PSF<list>) s@217@01))
  :qid |qp.psmValDef55|)))
(assert (forall ((s@217@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@217@01) s@217@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@217@01) s@217@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@217@01) s@217@01))
  :pattern (($PSF.lookup_list (as sm@216@01  $PSF<list>) s@217@01))
  :qid |qp.psmResTrgDef56|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)) ($SortWrappers.$RefTo$Snap x3@210@01)))
; [exec]
; x4 := new(next)
(declare-const x4@218@01 $Ref)
(assert (not (= x4@218@01 $Ref.null)))
(declare-const next@219@01 $Ref)
(assert (not (= x4@218@01 x3@210@01)))
(assert (not (= x4@218@01 x2@203@01)))
(assert (not (= x4@218@01 x4@194@01)))
(assert (not (= x4@218@01 x1@197@01)))
(assert (not (Set_in x4@218@01 xs@195@01)))
; [exec]
; x4.next := x3
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@210@01 x4@218@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x1@197@01 x4@218@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x2@203@01 x4@218@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x4), wildcard)
(declare-const $k@220@01 $Perm)
(assert ($Perm.isReadVar $k@220@01))
(assert (< $k@220@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@220@01)))
(assert (<= (- $Perm.Write $k@220@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@220@01)) (not (= x4@218@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@220@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@210@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | x3@210@01 != Null | live]
; [else-branch: 27 | x3@210@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 27 | x3@210@01 != Null]
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@221@01 ((x $Ref)) $Perm
  (ite
    (= x x3@210@01)
    ($Perm.min (ite (= x x3@210@01) $k@212@01 $Perm.No) $k@220@01)
    $Perm.No))
(define-fun pTaken@222@01 ((x $Ref)) $Perm
  (ite
    (= x x3@210@01)
    ($Perm.min
      (ite (= x x1@197@01) (- $k@199@01 (pTaken@206@01 x)) $Perm.No)
      (- $k@220@01 (pTaken@221@01 x)))
    $Perm.No))
(define-fun pTaken@223@01 ((x $Ref)) $Perm
  (ite
    (= x x3@210@01)
    ($Perm.min
      (ite (= x x2@203@01) (- $k@205@01 (pTaken@213@01 x)) $Perm.No)
      (- (- $k@220@01 (pTaken@221@01 x)) (pTaken@222@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@220@01
(assert (=> (not (= $k@212@01 $Perm.No)) (< $k@220@01 $k@212@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x3@210@01) (= (- $k@220@01 (pTaken@221@01 x)) $Perm.No))
  
  :qid |quant-u-117|))))
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
  (< $Perm.No $k@212@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@210@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))))))
(assert (=>
  (ite
    (= x3@210@01 x1@197@01)
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x3@210@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@210@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))))))
(assert (=>
  (ite
    (= x3@210@01 x2@203@01)
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x3@210@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@210@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))))))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)) ($SortWrappers.$RefTo$Snap x3@210@01))
  ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)) ($SortWrappers.$RefTo$Snap x3@210@01))
  ($PSF.loc_list ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)) ($SortWrappers.$RefTo$Snap x3@210@01))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@210@01)
  ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))) x4@218@01))
(declare-const sm@224@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@210@01)
    ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))
(declare-const sm@225@01 $PSF<list>)
(declare-const s@226@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@226@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@226@01) x4@218@01)
      (< $Perm.No $k@220@01)
      false)
    (and
      (not (= s@226@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01)
        ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@226@01))))
  :pattern (($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01))
  :pattern (($PSF.lookup_list (as sm@224@01  $PSF<list>) s@226@01))
  :qid |qp.psmValDef58|)))
(assert (forall ((s@226@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@226@01) x2@203@01)
      (<
        $Perm.No
        (- $k@205@01 (pTaken@213@01 ($SortWrappers.$SnapTo$Ref s@226@01))))
      false)
    (and
      (not (= s@226@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01)
        ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@226@01))))
  :pattern (($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01))
  :pattern (($PSF.lookup_list (as sm@207@01  $PSF<list>) s@226@01))
  :qid |qp.psmValDef59|)))
(assert (forall ((s@226@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@226@01) x1@197@01)
      (<
        $Perm.No
        (- $k@199@01 (pTaken@206@01 ($SortWrappers.$SnapTo$Ref s@226@01))))
      false)
    (and
      (not (= s@226@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01)
        ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@226@01))))
  :pattern (($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01))
  :pattern (($PSF.lookup_list (as sm@200@01  $PSF<list>) s@226@01))
  :qid |qp.psmValDef60|)))
(assert (forall ((s@226@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@226@01) x3@210@01)
      (<
        $Perm.No
        (- $k@212@01 (pTaken@221@01 ($SortWrappers.$SnapTo$Ref s@226@01))))
      false)
    (and
      (not (= s@226@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01)
        ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@226@01))))
  :pattern (($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01))
  :pattern (($PSF.lookup_list (as sm@215@01  $PSF<list>) s@226@01))
  :qid |qp.psmValDef61|)))
(assert (forall ((s@226@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@226@01) s@226@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@226@01) s@226@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@226@01) s@226@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@226@01) s@226@01))
  :pattern (($PSF.lookup_list (as sm@225@01  $PSF<list>) s@226@01))
  :qid |qp.psmResTrgDef62|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@225@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)) ($SortWrappers.$RefTo$Snap x4@218@01)))
; [exec]
; xs := Set(x1, x2, x4, x3)
; [eval] Set(x1, x2, x4, x3)
(declare-const xs@227@01 Set<$Ref>)
(assert (=
  xs@227@01
  (Set_unionone (Set_unionone (Set_unionone (Set_singleton x1@197@01) x2@203@01) x4@218@01) x3@210@01)))
; [exec]
; inhale length3_impl(xs, x4, 1, res)
(declare-const $t@228@01 $Snap)
(assert (= $t@228@01 $Snap.unit))
; [eval] length3_impl(xs, x4, 1, res)
(set-option :timeout 0)
(push) ; 7
(declare-const x@229@01 $Ref)
(push) ; 8
; [eval] (x in xs)
(assert (Set_in x@229@01 xs@227@01))
(declare-const $k@230@01 $Perm)
(assert ($Perm.isReadVar $k@230@01))
(pop) ; 8
(declare-fun inv@231@01 ($Ref) $Ref)
(declare-fun img@232@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@230@01))
; Nested auxiliary terms: non-globals
(push) ; 8
(assert (not (forall ((x@229@01 $Ref)) (!
  (=>
    (Set_in x@229@01 xs@227@01)
    (or (= $k@230@01 $Perm.No) (< $Perm.No $k@230@01)))
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((x1@229@01 $Ref) (x2@229@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@229@01 xs@227@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@225@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@229@01)) ($SortWrappers.$RefTo$Snap x1@229@01)))
        (< $Perm.No $k@230@01))
      (and
        (and
          (Set_in x2@229@01 xs@227@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@225@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@229@01)) ($SortWrappers.$RefTo$Snap x2@229@01)))
        (< $Perm.No $k@230@01))
      (= x1@229@01 x2@229@01))
    (= x1@229@01 x2@229@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@229@01 $Ref)) (!
  (=>
    (and (Set_in x@229@01 xs@227@01) (< $Perm.No $k@230@01))
    (and (= (inv@231@01 x@229@01) x@229@01) (img@232@01 x@229@01)))
  :pattern ((Set_in x@229@01 xs@227@01))
  :pattern ((inv@231@01 x@229@01))
  :pattern ((img@232@01 x@229@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@232@01 x)
      (and (Set_in (inv@231@01 x) xs@227@01) (< $Perm.No $k@230@01)))
    (= (inv@231@01 x) x))
  :pattern ((inv@231@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@231@01 x) xs@227@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@225@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@231@01 x))
  :qid |quant-u-119|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@233@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@231@01 x) xs@227@01) (img@232@01 x) (= x (inv@231@01 x)))
    ($Perm.min (ite (= x x4@218@01) $k@220@01 $Perm.No) $k@230@01)
    $Perm.No))
(define-fun pTaken@234@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@231@01 x) xs@227@01) (img@232@01 x) (= x (inv@231@01 x)))
    ($Perm.min
      (ite (= x x2@203@01) (- $k@205@01 (pTaken@213@01 x)) $Perm.No)
      (- $k@230@01 (pTaken@233@01 x)))
    $Perm.No))
(define-fun pTaken@235@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@231@01 x) xs@227@01) (img@232@01 x) (= x (inv@231@01 x)))
    ($Perm.min
      (ite (= x x1@197@01) (- $k@199@01 (pTaken@206@01 x)) $Perm.No)
      (- (- $k@230@01 (pTaken@233@01 x)) (pTaken@234@01 x)))
    $Perm.No))
(define-fun pTaken@236@01 ((x $Ref)) $Perm
  (ite
    (and (Set_in (inv@231@01 x) xs@227@01) (img@232@01 x) (= x (inv@231@01 x)))
    ($Perm.min
      (ite (= x x3@210@01) (- $k@212@01 (pTaken@221@01 x)) $Perm.No)
      (- (- (- $k@230@01 (pTaken@233@01 x)) (pTaken@234@01 x)) (pTaken@235@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@230@01
(assert (=>
  (not (= $k@220@01 $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@231@01 x4@218@01) xs@227@01)
        (img@232@01 x4@218@01)
        (= x4@218@01 (inv@231@01 x4@218@01)))
      $k@230@01
      $Perm.No)
    $k@220@01)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@231@01 x) xs@227@01) (img@232@01 x) (= x (inv@231@01 x)))
    (= (- $k@230@01 (pTaken@233@01 x)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@230@01
(assert (=>
  (not (= (- $k@205@01 (pTaken@213@01 x2@203@01)) $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@231@01 x2@203@01) xs@227@01)
        (img@232@01 x2@203@01)
        (= x2@203@01 (inv@231@01 x2@203@01)))
      $k@230@01
      $Perm.No)
    (- $k@205@01 (pTaken@213@01 x2@203@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@231@01 x) xs@227@01) (img@232@01 x) (= x (inv@231@01 x)))
    (= (- (- $k@230@01 (pTaken@233@01 x)) (pTaken@234@01 x)) $Perm.No))
  
  :qid |quant-u-124|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@230@01
(assert (=>
  (not (= (- $k@199@01 (pTaken@206@01 x1@197@01)) $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@231@01 x1@197@01) xs@227@01)
        (img@232@01 x1@197@01)
        (= x1@197@01 (inv@231@01 x1@197@01)))
      $k@230@01
      $Perm.No)
    (- $k@199@01 (pTaken@206@01 x1@197@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@231@01 x) xs@227@01) (img@232@01 x) (= x (inv@231@01 x)))
    (=
      (- (- (- $k@230@01 (pTaken@233@01 x)) (pTaken@234@01 x)) (pTaken@235@01 x))
      $Perm.No))
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@230@01
(assert (=>
  (not (= (- $k@212@01 (pTaken@221@01 x3@210@01)) $Perm.No))
  (<
    (ite
      (and
        (Set_in (inv@231@01 x3@210@01) xs@227@01)
        (img@232@01 x3@210@01)
        (= x3@210@01 (inv@231@01 x3@210@01)))
      $k@230@01
      $Perm.No)
    (- $k@212@01 (pTaken@221@01 x3@210@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@231@01 x) xs@227@01) (img@232@01 x) (= x (inv@231@01 x)))
    (=
      (-
        (-
          (- (- $k@230@01 (pTaken@233@01 x)) (pTaken@234@01 x))
          (pTaken@235@01 x))
        (pTaken@236@01 x))
      $Perm.No))
  
  :qid |quant-u-128|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@237@01 $PSF<list>)
(declare-const s@238@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@238@01 $Snap)) (!
  (and
    (=>
      (Set_in s@238@01 ($PSF.domain_list (as sm@237@01  $PSF<list>)))
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01))))
    (=>
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (Set_in s@238@01 ($PSF.domain_list (as sm@237@01  $PSF<list>)))))
  :pattern ((Set_in s@238@01 ($PSF.domain_list (as sm@237@01  $PSF<list>))))
  :qid |qp.psmDomDef72|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@238@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@238@01) x4@218@01)
        (< $Perm.No $k@220@01)
        false))
    (and
      (not (= s@238@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01)
        ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@238@01))))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :pattern (($PSF.lookup_list (as sm@224@01  $PSF<list>) s@238@01))
  :qid |qp.psmValDef67|)))
(assert (forall ((s@238@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@238@01) x2@203@01)
        (<
          $Perm.No
          (- $k@205@01 (pTaken@213@01 ($SortWrappers.$SnapTo$Ref s@238@01))))
        false))
    (and
      (not (= s@238@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01)
        ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@238@01))))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :pattern (($PSF.lookup_list (as sm@207@01  $PSF<list>) s@238@01))
  :qid |qp.psmValDef68|)))
(assert (forall ((s@238@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@238@01) x1@197@01)
        (<
          $Perm.No
          (- $k@199@01 (pTaken@206@01 ($SortWrappers.$SnapTo$Ref s@238@01))))
        false))
    (and
      (not (= s@238@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01)
        ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@238@01))))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :pattern (($PSF.lookup_list (as sm@200@01  $PSF<list>) s@238@01))
  :qid |qp.psmValDef69|)))
(assert (forall ((s@238@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@238@01) x3@210@01)
        (<
          $Perm.No
          (- $k@212@01 (pTaken@221@01 ($SortWrappers.$SnapTo$Ref s@238@01))))
        false))
    (and
      (not (= s@238@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01)
        ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@238@01))))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :pattern (($PSF.lookup_list (as sm@215@01  $PSF<list>) s@238@01))
  :qid |qp.psmValDef70|)))
(assert (forall ((s@238@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@238@01) s@238@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@238@01) s@238@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@238@01) s@238@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@238@01) s@238@01))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :qid |qp.psmResTrgDef71|)))
(assert (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@237@01  $PSF<list>)) xs@227@01 x4@218@01 1 res@196@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@230@01))
(assert (forall ((x@229@01 $Ref)) (!
  (=>
    (and (Set_in x@229@01 xs@227@01) (< $Perm.No $k@230@01))
    (and (= (inv@231@01 x@229@01) x@229@01) (img@232@01 x@229@01)))
  :pattern ((Set_in x@229@01 xs@227@01))
  :pattern ((inv@231@01 x@229@01))
  :pattern ((img@232@01 x@229@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@232@01 x)
      (and (Set_in (inv@231@01 x) xs@227@01) (< $Perm.No $k@230@01)))
    (= (inv@231@01 x) x))
  :pattern ((inv@231@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@238@01 $Snap)) (!
  (and
    (=>
      (Set_in s@238@01 ($PSF.domain_list (as sm@237@01  $PSF<list>)))
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01))))
    (=>
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (Set_in s@238@01 ($PSF.domain_list (as sm@237@01  $PSF<list>)))))
  :pattern ((Set_in s@238@01 ($PSF.domain_list (as sm@237@01  $PSF<list>))))
  :qid |qp.psmDomDef72|)))
(assert (forall ((s@238@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@238@01) x4@218@01)
        (< $Perm.No $k@220@01)
        false))
    (and
      (not (= s@238@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01)
        ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@238@01))))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :pattern (($PSF.lookup_list (as sm@224@01  $PSF<list>) s@238@01))
  :qid |qp.psmValDef67|)))
(assert (forall ((s@238@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@238@01) x2@203@01)
        (<
          $Perm.No
          (- $k@205@01 (pTaken@213@01 ($SortWrappers.$SnapTo$Ref s@238@01))))
        false))
    (and
      (not (= s@238@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01)
        ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@238@01))))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :pattern (($PSF.lookup_list (as sm@207@01  $PSF<list>) s@238@01))
  :qid |qp.psmValDef68|)))
(assert (forall ((s@238@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@238@01) x1@197@01)
        (<
          $Perm.No
          (- $k@199@01 (pTaken@206@01 ($SortWrappers.$SnapTo$Ref s@238@01))))
        false))
    (and
      (not (= s@238@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01)
        ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@238@01))))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :pattern (($PSF.lookup_list (as sm@200@01  $PSF<list>) s@238@01))
  :qid |qp.psmValDef69|)))
(assert (forall ((s@238@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@231@01 ($SortWrappers.$SnapTo$Ref s@238@01)) xs@227@01)
        (< $Perm.No $k@230@01)
        (img@232@01 ($SortWrappers.$SnapTo$Ref s@238@01)))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@238@01) x3@210@01)
        (<
          $Perm.No
          (- $k@212@01 (pTaken@221@01 ($SortWrappers.$SnapTo$Ref s@238@01))))
        false))
    (and
      (not (= s@238@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01)
        ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@238@01))))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :pattern (($PSF.lookup_list (as sm@215@01  $PSF<list>) s@238@01))
  :qid |qp.psmValDef70|)))
(assert (forall ((s@238@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@238@01) s@238@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@238@01) s@238@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@200@01  $PSF<list>) s@238@01) s@238@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@238@01) s@238@01))
  :pattern (($PSF.lookup_list (as sm@237@01  $PSF<list>) s@238@01))
  :qid |qp.psmResTrgDef71|)))
(assert (and
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@231@01 x) xs@227@01)
      ($PSF.loc_list ($PSF.lookup_list (as sm@225@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@231@01 x))
    :qid |quant-u-119|))
  (=>
    (not (= $k@220@01 $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@231@01 x4@218@01) xs@227@01)
          (img@232@01 x4@218@01)
          (= x4@218@01 (inv@231@01 x4@218@01)))
        $k@230@01
        $Perm.No)
      $k@220@01))
  (=>
    (not (= (- $k@205@01 (pTaken@213@01 x2@203@01)) $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@231@01 x2@203@01) xs@227@01)
          (img@232@01 x2@203@01)
          (= x2@203@01 (inv@231@01 x2@203@01)))
        $k@230@01
        $Perm.No)
      (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (=>
    (not (= (- $k@199@01 (pTaken@206@01 x1@197@01)) $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@231@01 x1@197@01) xs@227@01)
          (img@232@01 x1@197@01)
          (= x1@197@01 (inv@231@01 x1@197@01)))
        $k@230@01
        $Perm.No)
      (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (=>
    (not (= (- $k@212@01 (pTaken@221@01 x3@210@01)) $Perm.No))
    (<
      (ite
        (and
          (Set_in (inv@231@01 x3@210@01) xs@227@01)
          (img@232@01 x3@210@01)
          (= x3@210@01 (inv@231@01 x3@210@01)))
        $k@230@01
        $Perm.No)
      (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@237@01  $PSF<list>)) xs@227@01 x4@218@01 1 res@196@01)))
(assert (length3_impl ($SortWrappers.$PSF<list>To$Snap (as sm@237@01  $PSF<list>)) xs@227@01 x4@218@01 1 res@196@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 4
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@196@01 4)))
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
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@197@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x2@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@197@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x2@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@218@01 x2@203@01))
    (not (= x4@218@01 x1@197@01))
    (not (= x4@218@01 x3@210@01)))
  (and
    (not (= x2@203@01 x4@218@01))
    (not (= x2@203@01 x1@197@01))
    (not (= x2@203@01 x3@210@01)))
  (and
    (not (= x1@197@01 x4@218@01))
    (not (= x1@197@01 x2@203@01))
    (not (= x1@197@01 x3@210@01)))
  (and
    (not (= x3@210@01 x4@218@01))
    (not (= x3@210@01 x2@203@01))
    (not (= x3@210@01 x1@197@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x2@203@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= x2@203@01 x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= x2@203@01 x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= $Ref.null x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= $Ref.null x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= $Ref.null x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= x1@197@01 x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x1@197@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= x1@197@01 x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= x3@210@01 x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x3@210@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= x3@210@01 x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x3@210@01 x1@197@01))
    (not (= x3@210@01 x2@203@01))
    (not (= x3@210@01 x4@218@01)))
  (and
    (not (= x1@197@01 x3@210@01))
    (not (= x1@197@01 x2@203@01))
    (not (= x1@197@01 x4@218@01)))
  (and
    (not (= x2@203@01 x3@210@01))
    (not (= x2@203@01 x1@197@01))
    (not (= x2@203@01 x4@218@01)))
  (and
    (not (= x4@218@01 x3@210@01))
    (not (= x4@218@01 x1@197@01))
    (not (= x4@218@01 x2@203@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@196@01 4)))
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
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@197@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x2@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@197@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x2@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@218@01 x2@203@01))
    (not (= x4@218@01 x1@197@01))
    (not (= x4@218@01 x3@210@01)))
  (and
    (not (= x2@203@01 x4@218@01))
    (not (= x2@203@01 x1@197@01))
    (not (= x2@203@01 x3@210@01)))
  (and
    (not (= x1@197@01 x4@218@01))
    (not (= x1@197@01 x2@203@01))
    (not (= x1@197@01 x3@210@01)))
  (and
    (not (= x3@210@01 x4@218@01))
    (not (= x3@210@01 x2@203@01))
    (not (= x3@210@01 x1@197@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x2@203@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= x2@203@01 x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= x2@203@01 x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= $Ref.null x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= $Ref.null x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= $Ref.null x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= x1@197@01 x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x1@197@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= x1@197@01 x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= x3@210@01 x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x3@210@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= x3@210@01 x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x3@210@01 x1@197@01))
    (not (= x3@210@01 x2@203@01))
    (not (= x3@210@01 x4@218@01)))
  (and
    (not (= x1@197@01 x3@210@01))
    (not (= x1@197@01 x2@203@01))
    (not (= x1@197@01 x4@218@01)))
  (and
    (not (= x2@203@01 x3@210@01))
    (not (= x2@203@01 x1@197@01))
    (not (= x2@203@01 x4@218@01)))
  (and
    (not (= x4@218@01 x3@210@01))
    (not (= x4@218@01 x1@197@01))
    (not (= x4@218@01 x2@203@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@196@01 4)))
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
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@197@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x2@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@197@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@203@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x2@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x1@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x4@218@01 x3@210@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No $k@220@01)
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01)))
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01)))
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01))
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No $k@220@01))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@218@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No (- $k@205@01 (pTaken@213@01 x2@203@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@203@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@212@01 (pTaken@221@01 x3@210@01)))
    (< $Perm.No (- $k@199@01 (pTaken@206@01 x1@197@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@215@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@210@01))
      ($PSF.lookup_list (as sm@200@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@197@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@218@01 x2@203@01))
    (not (= x4@218@01 x1@197@01))
    (not (= x4@218@01 x3@210@01)))
  (and
    (not (= x2@203@01 x4@218@01))
    (not (= x2@203@01 x1@197@01))
    (not (= x2@203@01 x3@210@01)))
  (and
    (not (= x1@197@01 x4@218@01))
    (not (= x1@197@01 x2@203@01))
    (not (= x1@197@01 x3@210@01)))
  (and
    (not (= x3@210@01 x4@218@01))
    (not (= x3@210@01 x2@203@01))
    (not (= x3@210@01 x1@197@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@212@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@199@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@205@01) (- $Perm.Write $k@220@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@212@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@199@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@220@01) (- $Perm.Write $k@205@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x2@203@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= x2@203@01 x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@212@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= x2@203@01 x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= $Ref.null x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= $Ref.null x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@199@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= $Ref.null x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= x1@197@01 x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x1@197@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@205@01))
    (< $Perm.No (- $Perm.Write $k@220@01)))
  (not (= x1@197@01 x3@210@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@212@01)))
  (not (= x3@210@01 x2@203@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@199@01)))
  (not (= x3@210@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@220@01))
    (< $Perm.No (- $Perm.Write $k@205@01)))
  (not (= x3@210@01 x1@197@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x3@210@01 x1@197@01))
    (not (= x3@210@01 x2@203@01))
    (not (= x3@210@01 x4@218@01)))
  (and
    (not (= x1@197@01 x3@210@01))
    (not (= x1@197@01 x2@203@01))
    (not (= x1@197@01 x4@218@01)))
  (and
    (not (= x2@203@01 x3@210@01))
    (not (= x2@203@01 x1@197@01))
    (not (= x2@203@01 x4@218@01)))
  (and
    (not (= x4@218@01 x3@210@01))
    (not (= x4@218@01 x1@197@01))
    (not (= x4@218@01 x2@203@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@196@01 4)))
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
