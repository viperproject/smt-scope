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
; ---------- FUNCTION length3_impl----------
(declare-fun xs@0@00 () Set<$Ref>)
(declare-fun y@1@00 () $Ref)
(declare-fun akk@2@00 () Int)
(declare-fun res@3@00 () Int)
(declare-fun result@4@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const x@18@00 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@18@00 xs@0@00))
(declare-const $k@19@00 $Perm)
(assert ($Perm.isReadVar $k@19@00))
(declare-fun sm@20@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@21@00 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@22@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@23@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@19@00))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@18@00 $Ref)) (!
  (=> (Set_in x@18@00 xs@0@00) (or (= $k@19@00 $Perm.No) (< $Perm.No $k@19@00)))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@18@00 $Ref) (x2@18@00 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@18@00 xs@0@00) (< $Perm.No $k@19@00))
      (and (Set_in x2@18@00 xs@0@00) (< $Perm.No $k@19@00))
      (= x1@18@00 x2@18@00))
    (= x1@18@00 x2@18@00))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@18@00 $Ref)) (!
  (=>
    (and (Set_in x@18@00 xs@0@00) (< $Perm.No $k@19@00))
    (and
      (= (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@18@00) x@18@00)
      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@18@00)))
  :pattern ((Set_in x@18@00 xs@0@00))
  :pattern (($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@18@00)) ($SortWrappers.$RefTo$Snap x@18@00)))
  :qid |quant-u-9|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@19@00)))
    (= (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@18@00 $Ref)) (!
  (<= $Perm.No $k@19@00)
  :pattern ((Set_in x@18@00 xs@0@00))
  :pattern (($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@18@00)) ($SortWrappers.$RefTo$Snap x@18@00)))
  :qid |list-permAtLeastZero|)))
(declare-fun sm@24@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@25@00 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@25@00 $Snap)) (!
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
  :qid |qp.psmValDef1|)))
(assert (forall ((s@25@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@25@00) s@25@00)
  :pattern (($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@25@00))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |quant-u-10|)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@19@00)))
    (= (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@25@00 $Snap)) (!
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
  :qid |qp.psmValDef1|)))
(assert (forall ((s@25@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@25@00) s@25@00)
  :pattern (($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@25@00))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((x@18@00 $Ref)) (!
  (=>
    (and (Set_in x@18@00 xs@0@00) (< $Perm.No $k@19@00))
    (and
      (= (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@18@00) x@18@00)
      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@18@00)))
  :pattern ((Set_in x@18@00 xs@0@00))
  :pattern (($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@18@00)) ($SortWrappers.$RefTo$Snap x@18@00)))
  :qid |quant-u-9|)))
(assert (forall ((x@18@00 $Ref)) (!
  (<= $Perm.No $k@19@00)
  :pattern ((Set_in x@18@00 xs@0@00))
  :pattern (($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@18@00)) ($SortWrappers.$RefTo$Snap x@18@00)))
  :qid |list-permAtLeastZero|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |quant-u-10|)))
(assert ($Perm.isReadVar $k@19@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall x: Ref :: { (x in xs) } { list(x) } { x.next } (x in xs) && x == y ==> (unfolding acc(list(x), wildcard) in (x.next == null ? res == akk : length3_impl(xs, x.next, akk + 1, res))))
(declare-const x@26@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (x in xs) && x == y ==> (unfolding acc(list(x), wildcard) in (x.next == null ? res == akk : length3_impl(xs, x.next, akk + 1, res)))
; [eval] (x in xs) && x == y
; [eval] (x in xs)
(push) ; 3
; [then-branch: 0 | !(x@26@00 in xs@0@00) | live]
; [else-branch: 0 | x@26@00 in xs@0@00 | live]
(push) ; 4
; [then-branch: 0 | !(x@26@00 in xs@0@00)]
(assert (not (Set_in x@26@00 xs@0@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | x@26@00 in xs@0@00]
(assert (Set_in x@26@00 xs@0@00))
; [eval] x == y
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@26@00 xs@0@00) (not (Set_in x@26@00 xs@0@00))))
(push) ; 3
; [then-branch: 1 | x@26@00 in xs@0@00 && x@26@00 == y@1@00 | live]
; [else-branch: 1 | !(x@26@00 in xs@0@00 && x@26@00 == y@1@00) | live]
(push) ; 4
; [then-branch: 1 | x@26@00 in xs@0@00 && x@26@00 == y@1@00]
(assert (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00)))
; [eval] (unfolding acc(list(x), wildcard) in (x.next == null ? res == akk : length3_impl(xs, x.next, akk + 1, res)))
(declare-const $k@27@00 $Perm)
(assert ($Perm.isReadVar $k@27@00))
(push) ; 5
(assert (not (< $Perm.No $k@27@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(declare-const $k@28@00 $Perm)
(assert ($Perm.isReadVar $k@28@00))
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@28@00
(assert (=>
  (not
    (=
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
        $k@19@00
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
    (< $k@28@00 $k@19@00)
    (< $k@28@00 $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@26@00)
    (=
      (-
        $k@28@00
        (ite
          (= x x@26@00)
          ($Perm.min
            (ite
              (and
                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              $k@19@00
              $Perm.No)
            $k@28@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
    (< $Perm.No $k@19@00)
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@26@00) $Snap.unit))
    (=
      ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00))))))
(assert ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00)))
(assert (list%trigger ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) x@26@00))
(assert (=
  ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
    ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))))))
(declare-fun sm@29@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) x@26@00)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))))))
(assert (<= $Perm.No $k@27@00))
(assert (<= $k@27@00 $Perm.Write))
(assert (=> (< $Perm.No $k@27@00) (not (= x@26@00 $Ref.null))))
(declare-fun sm@30@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
  :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
  :qid |qp.fvfResTrgDef5|)))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00))
; [eval] x.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
        ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :qid |qp.fvfResTrgDef5|))))
(set-option :timeout 0)
(push) ; 6
(assert (not (< $Perm.No $k@27@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) != Null | live]
; [else-branch: 2 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) == Null | live]
(push) ; 6
; [then-branch: 2 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) != Null]
(assert (not
  (=
    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
        ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :qid |qp.fvfResTrgDef5|))))
(push) ; 7
(assert (not (< $Perm.No $k@27@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@31@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
  ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
    $k@27@00
    $Perm.No)))
(declare-fun sm@32@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@33@00 $Snap)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list ($PSF.lookup_list (sm@32@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))))
; [eval] (x.next == null ? res == akk : length3_impl(xs, x.next, akk + 1, res))
; [eval] x.next == null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
        ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :qid |qp.fvfResTrgDef5|))))
(push) ; 7
(assert (not (< $Perm.No $k@27@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 3 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) == Null | live]
; [else-branch: 3 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) != Null | live]
(push) ; 8
; [then-branch: 3 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) == Null]
(assert (=
  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
  $Ref.null))
; [eval] res == akk
(pop) ; 8
(push) ; 8
; [else-branch: 3 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) != Null]
; [eval] length3_impl(xs, x.next, akk + 1, res)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
        ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :qid |qp.fvfResTrgDef5|))))
(push) ; 9
(assert (not (< $Perm.No $k@27@00)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] akk + 1
(push) ; 9
(declare-const x@34@00 $Ref)
(push) ; 10
; [eval] (x in xs)
(assert (Set_in x@34@00 xs@0@00))
(declare-const $k@35@00 $Perm)
(assert ($Perm.isReadVar $k@35@00))
(pop) ; 10
(declare-fun inv@36@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@37@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@35@00))
; Nested auxiliary terms: non-globals
(push) ; 10
(assert (not (forall ((x@34@00 $Ref)) (!
  (=> (Set_in x@34@00 xs@0@00) (or (= $k@35@00 $Perm.No) (< $Perm.No $k@35@00)))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@38@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@39@00 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@39@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
      (<
        $Perm.No
        (-
          $k@19@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@39@00) x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      false)
    (and
      (not (= s@39@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))))
  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))
  :qid |qp.psmValDef7|)))
(assert (forall ((s@39@00 $Snap)) (!
  (=>
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref s@39@00)
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
      (< $Perm.No $k@27@00)
      false)
    (and
      (not (= s@39@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
        ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))))
  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
  :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@39@00 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00) s@39@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00) s@39@00))
  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
  :qid |qp.psmResTrgDef9|)))
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((x1@34@00 $Ref) (x2@34@00 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@34@00 xs@0@00)
          ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x1@34@00)) ($SortWrappers.$RefTo$Snap x1@34@00)))
        (< $Perm.No $k@35@00))
      (and
        (and
          (Set_in x2@34@00 xs@0@00)
          ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x2@34@00)) ($SortWrappers.$RefTo$Snap x2@34@00)))
        (< $Perm.No $k@35@00))
      (= x1@34@00 x2@34@00))
    (= x1@34@00 x2@34@00))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@34@00 $Ref)) (!
  (=>
    (and (Set_in x@34@00 xs@0@00) (< $Perm.No $k@35@00))
    (and
      (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00) x@34@00)
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00)))
  :pattern ((Set_in x@34@00 xs@0@00))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@35@00)))
    (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |quant-u-15|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@35@00
(assert (forall ((x $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
          (-
            $k@19@00
            (ite
              (= x x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
      (<
        (ite
          (and
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
          $k@35@00
          $Perm.No)
        (-
          $k@19@00
          (ite
            (= x x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      (<
        (ite
          (and
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
          $k@35@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
  :pattern ((Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |qp.srp10|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
    (=
      (-
        $k@35@00
        (ite
          (and
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
          ($Perm.min
            (ite
              (and
                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              (-
                $k@19@00
                (ite
                  (= x x@26@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      $k@19@00
                      $Perm.No)
                    $k@28@00)
                  $Perm.No))
              $Perm.No)
            $k@35@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@40@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@41@00 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@41@00 $Snap)) (!
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
  :qid |qp.psmDomDef14|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@41@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
        (< $Perm.No $k@35@00)
        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
        (<
          $Perm.No
          (-
            $k@19@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@41@00) x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        false))
    (and
      (not (= s@41@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))))
  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))
  :qid |qp.psmValDef11|)))
(assert (forall ((s@41@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
        (< $Perm.No $k@35@00)
        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref s@41@00)
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
        (< $Perm.No $k@27@00)
        false))
    (and
      (not (= s@41@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
        ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))))
  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
  :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))
  :qid |qp.psmValDef12|)))
(assert (forall ((s@41@00 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00) s@41@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00) s@41@00))
  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
  :qid |qp.psmResTrgDef13|)))
(assert (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
  akk@2@00
  1) res@3@00))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@35@00))
(assert (forall ((x@34@00 $Ref)) (!
  (=>
    (and (Set_in x@34@00 xs@0@00) (< $Perm.No $k@35@00))
    (and
      (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00) x@34@00)
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00)))
  :pattern ((Set_in x@34@00 xs@0@00))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@35@00)))
    (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@41@00 $Snap)) (!
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
  :qid |qp.psmDomDef14|)))
(assert (and
  (forall ((s@39@00 $Snap)) (!
    (=>
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
        (<
          $Perm.No
          (-
            $k@19@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@39@00) x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        false)
      (and
        (not (= s@39@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))))
    :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
    :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))
    :qid |qp.psmValDef7|))
  (forall ((s@39@00 $Snap)) (!
    (=>
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref s@39@00)
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
        (< $Perm.No $k@27@00)
        false)
      (and
        (not (= s@39@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
          ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))))
    :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
    :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))
    :qid |qp.psmValDef8|))
  (forall ((s@39@00 $Snap)) (!
    (and
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00) s@39@00)
      ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00) s@39@00))
    :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
    :qid |qp.psmResTrgDef9|))
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
      ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
    :qid |quant-u-15|))
  (forall ((x $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
            (-
              $k@19@00
              (ite
                (= x x@26@00)
                ($Perm.min
                  (ite
                    (and
                      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                    $k@19@00
                    $Perm.No)
                  $k@28@00)
                $Perm.No))
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
        (<
          (ite
            (and
              (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
              (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
              (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
            $k@35@00
            $Perm.No)
          (-
            $k@19@00
            (ite
              (= x x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        (<
          (ite
            (and
              (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
              (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
              (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
            $k@35@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
    :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
    :pattern ((Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
    :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
    :qid |qp.srp10|))
  (forall ((s@41@00 $Snap)) (!
    (=>
      (and
        (and
          (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
          (< $Perm.No $k@35@00)
          (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
          (<
            $Perm.No
            (-
              $k@19@00
              (ite
                (= ($SortWrappers.$SnapTo$Ref s@41@00) x@26@00)
                ($Perm.min
                  (ite
                    (and
                      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                    $k@19@00
                    $Perm.No)
                  $k@28@00)
                $Perm.No)))
          false))
      (and
        (not (= s@41@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))))
    :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
    :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))
    :qid |qp.psmValDef11|))
  (forall ((s@41@00 $Snap)) (!
    (=>
      (and
        (and
          (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
          (< $Perm.No $k@35@00)
          (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref s@41@00)
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
          (< $Perm.No $k@27@00)
          false))
      (and
        (not (= s@41@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
          ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))))
    :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
    :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))
    :qid |qp.psmValDef12|))
  (forall ((s@41@00 $Snap)) (!
    (and
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00) s@41@00)
      ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00) s@41@00))
    :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
    :qid |qp.psmResTrgDef13|))
  (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
    akk@2@00
    1) res@3@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@35@00))
(assert (forall ((x@34@00 $Ref)) (!
  (=>
    (and (Set_in x@34@00 xs@0@00) (< $Perm.No $k@35@00))
    (and
      (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00) x@34@00)
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00)))
  :pattern ((Set_in x@34@00 xs@0@00))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@35@00)))
    (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@41@00 $Snap)) (!
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
  :qid |qp.psmDomDef14|)))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null))
  (and
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :qid |qp.fvfResTrgDef5|))
    (forall ((s@39@00 $Snap)) (!
      (=>
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
          (<
            $Perm.No
            (-
              $k@19@00
              (ite
                (= ($SortWrappers.$SnapTo$Ref s@39@00) x@26@00)
                ($Perm.min
                  (ite
                    (and
                      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                    $k@19@00
                    $Perm.No)
                  $k@28@00)
                $Perm.No)))
          false)
        (and
          (not (= s@39@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
            ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))))
      :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
      :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))
      :qid |qp.psmValDef7|))
    (forall ((s@39@00 $Snap)) (!
      (=>
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref s@39@00)
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
          (< $Perm.No $k@27@00)
          false)
        (and
          (not (= s@39@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
            ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))))
      :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
      :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))
      :qid |qp.psmValDef8|))
    (forall ((s@39@00 $Snap)) (!
      (and
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00) s@39@00)
        ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00) s@39@00))
      :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
      :qid |qp.psmResTrgDef9|))
    (forall ((x $Ref)) (!
      (=>
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
      :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |quant-u-15|))
    (forall ((x $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              (-
                $k@19@00
                (ite
                  (= x x@26@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      $k@19@00
                      $Perm.No)
                    $k@28@00)
                  $Perm.No))
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
          (<
            (ite
              (and
                (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
              $k@35@00
              $Perm.No)
            (-
              $k@19@00
              (ite
                (= x x@26@00)
                ($Perm.min
                  (ite
                    (and
                      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                    $k@19@00
                    $Perm.No)
                  $k@28@00)
                $Perm.No)))
          (<
            (ite
              (and
                (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
              $k@35@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
      :pattern ((Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
      :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |qp.srp10|))
    (forall ((s@41@00 $Snap)) (!
      (=>
        (and
          (and
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
            (< $Perm.No $k@35@00)
            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
            (<
              $Perm.No
              (-
                $k@19@00
                (ite
                  (= ($SortWrappers.$SnapTo$Ref s@41@00) x@26@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                      $k@19@00
                      $Perm.No)
                    $k@28@00)
                  $Perm.No)))
            false))
        (and
          (not (= s@41@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
            ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))))
      :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
      :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))
      :qid |qp.psmValDef11|))
    (forall ((s@41@00 $Snap)) (!
      (=>
        (and
          (and
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
            (< $Perm.No $k@35@00)
            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
          (ite
            (=
              ($SortWrappers.$SnapTo$Ref s@41@00)
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
            (< $Perm.No $k@27@00)
            false))
        (and
          (not (= s@41@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
            ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))))
      :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
      :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))
      :qid |qp.psmValDef12|))
    (forall ((s@41@00 $Snap)) (!
      (and
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00) s@41@00)
        ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00) s@41@00))
      :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
      :qid |qp.psmResTrgDef13|))
    (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
      akk@2@00
      1) res@3@00))))
(assert (or
  (not
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null))
  (=
    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
    $Ref.null)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 2 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) == Null]
(assert (=
  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
  $Ref.null))
(assert (=
  ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
  $Snap.unit))
; [eval] (x.next == null ? res == akk : length3_impl(xs, x.next, akk + 1, res))
; [eval] x.next == null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
        ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :qid |qp.fvfResTrgDef5|))))
(push) ; 7
(assert (not (< $Perm.No $k@27@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 4 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) == Null | live]
; [else-branch: 4 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) != Null | live]
(push) ; 8
; [then-branch: 4 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) == Null]
; [eval] res == akk
(pop) ; 8
(push) ; 8
; [else-branch: 4 | Lookup(next, sm@30@00(s@$, xs@0@00, y@1@00, akk@2@00, res@3@00), x@26@00) != Null]
(assert (not
  (=
    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
    $Ref.null)))
; [eval] length3_impl(xs, x.next, akk + 1, res)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
        ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :qid |qp.fvfResTrgDef5|))))
(push) ; 9
(assert (not (< $Perm.No $k@27@00)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] akk + 1
(push) ; 9
(declare-const x@42@00 $Ref)
(push) ; 10
; [eval] (x in xs)
(assert (Set_in x@42@00 xs@0@00))
(declare-const $k@43@00 $Perm)
(assert ($Perm.isReadVar $k@43@00))
(pop) ; 10
(declare-fun inv@44@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@45@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@43@00))
; Nested auxiliary terms: non-globals
(push) ; 10
(assert (not (forall ((x@42@00 $Ref)) (!
  (=> (Set_in x@42@00 xs@0@00) (or (= $k@43@00 $Perm.No) (< $Perm.No $k@43@00)))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@46@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@47@00 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@47@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
      (<
        $Perm.No
        (-
          $k@19@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@47@00) x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      false)
    (and
      (not (= s@47@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))))
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))
  :qid |qp.psmValDef15|)))
(assert (forall ((s@47@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00) s@47@00)
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :qid |qp.psmResTrgDef16|)))
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((x1@42@00 $Ref) (x2@42@00 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@42@00 xs@0@00)
          ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x1@42@00)) ($SortWrappers.$RefTo$Snap x1@42@00)))
        (< $Perm.No $k@43@00))
      (and
        (and
          (Set_in x2@42@00 xs@0@00)
          ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x2@42@00)) ($SortWrappers.$RefTo$Snap x2@42@00)))
        (< $Perm.No $k@43@00))
      (= x1@42@00 x2@42@00))
    (= x1@42@00 x2@42@00))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@42@00 $Ref)) (!
  (=>
    (and (Set_in x@42@00 xs@0@00) (< $Perm.No $k@43@00))
    (and
      (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00) x@42@00)
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00)))
  :pattern ((Set_in x@42@00 xs@0@00))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@43@00)))
    (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |quant-u-20|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Constrain original permissions $k@43@00
(assert (forall ((x $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
          (-
            $k@19@00
            (ite
              (= x x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
      (<
        (ite
          (and
            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
          $k@43@00
          $Perm.No)
        (-
          $k@19@00
          (ite
            (= x x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      (<
        (ite
          (and
            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
          $k@43@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
  :pattern ((Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |qp.srp17|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
    (=
      (-
        $k@43@00
        (ite
          (and
            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
          ($Perm.min
            (ite
              (and
                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              (-
                $k@19@00
                (ite
                  (= x x@26@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      $k@19@00
                      $Perm.No)
                    $k@28@00)
                  $Perm.No))
              $Perm.No)
            $k@43@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@48@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@49@00 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@49@00 $Snap)) (!
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
  :qid |qp.psmDomDef20|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@49@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00)
        (< $Perm.No $k@43@00)
        (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
        (<
          $Perm.No
          (-
            $k@19@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@49@00) x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        false))
    (and
      (not (= s@49@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))))
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))
  :qid |qp.psmValDef18|)))
(assert (forall ((s@49@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00) s@49@00)
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :qid |qp.psmResTrgDef19|)))
(assert (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
  akk@2@00
  1) res@3@00))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@43@00))
(assert (forall ((s@47@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
      (<
        $Perm.No
        (-
          $k@19@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@47@00) x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      false)
    (and
      (not (= s@47@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))))
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))
  :qid |qp.psmValDef15|)))
(assert (forall ((s@47@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00) s@47@00)
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :qid |qp.psmResTrgDef16|)))
(assert (forall ((x@42@00 $Ref)) (!
  (=>
    (and (Set_in x@42@00 xs@0@00) (< $Perm.No $k@43@00))
    (and
      (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00) x@42@00)
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00)))
  :pattern ((Set_in x@42@00 xs@0@00))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@43@00)))
    (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@49@00 $Snap)) (!
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
  :qid |qp.psmDomDef20|)))
(assert (forall ((s@49@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00)
        (< $Perm.No $k@43@00)
        (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
        (<
          $Perm.No
          (-
            $k@19@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@49@00) x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        false))
    (and
      (not (= s@49@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))))
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))
  :qid |qp.psmValDef18|)))
(assert (forall ((s@49@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00) s@49@00)
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :qid |qp.psmResTrgDef19|)))
(assert (and
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
      ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
    :qid |quant-u-20|))
  (forall ((x $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
            (-
              $k@19@00
              (ite
                (= x x@26@00)
                ($Perm.min
                  (ite
                    (and
                      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                    $k@19@00
                    $Perm.No)
                  $k@28@00)
                $Perm.No))
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
        (<
          (ite
            (and
              (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
              (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
              (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
            $k@43@00
            $Perm.No)
          (-
            $k@19@00
            (ite
              (= x x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        (<
          (ite
            (and
              (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
              (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
              (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
            $k@43@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
    :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
    :pattern ((Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
    :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
    :qid |qp.srp17|))
  (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
    akk@2@00
    1) res@3@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@43@00))
(assert (forall ((s@47@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
      (<
        $Perm.No
        (-
          $k@19@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@47@00) x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      false)
    (and
      (not (= s@47@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))))
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))
  :qid |qp.psmValDef15|)))
(assert (forall ((s@47@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00) s@47@00)
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :qid |qp.psmResTrgDef16|)))
(assert (forall ((x@42@00 $Ref)) (!
  (=>
    (and (Set_in x@42@00 xs@0@00) (< $Perm.No $k@43@00))
    (and
      (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00) x@42@00)
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00)))
  :pattern ((Set_in x@42@00 xs@0@00))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@43@00)))
    (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@49@00 $Snap)) (!
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
  :qid |qp.psmDomDef20|)))
(assert (forall ((s@49@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00)
        (< $Perm.No $k@43@00)
        (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
        (<
          $Perm.No
          (-
            $k@19@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@49@00) x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        false))
    (and
      (not (= s@49@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))))
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))
  :qid |qp.psmValDef18|)))
(assert (forall ((s@49@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00) s@49@00)
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :qid |qp.psmResTrgDef19|)))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null))
  (and
    (not
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :qid |qp.fvfResTrgDef5|))
    (forall ((x $Ref)) (!
      (=>
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
      :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |quant-u-20|))
    (forall ((x $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              (-
                $k@19@00
                (ite
                  (= x x@26@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      $k@19@00
                      $Perm.No)
                    $k@28@00)
                  $Perm.No))
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
          (<
            (ite
              (and
                (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
              $k@43@00
              $Perm.No)
            (-
              $k@19@00
              (ite
                (= x x@26@00)
                ($Perm.min
                  (ite
                    (and
                      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                    $k@19@00
                    $Perm.No)
                  $k@28@00)
                $Perm.No)))
          (<
            (ite
              (and
                (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
              $k@43@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
      :pattern ((Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
      :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |qp.srp17|))
    (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
      akk@2@00
      1) res@3@00))))
(assert (or
  (not
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null))
  (=
    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
    $Ref.null)))
(pop) ; 6
(pop) ; 5
(declare-fun joined_unfolding@50@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null))
  (=
    (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
    (ite
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null)
      (= res@3@00 akk@2@00)
      (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
        akk@2@00
        1) res@3@00)))))
(assert (=>
  (=
    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
    $Ref.null)
  (=
    (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
    (ite
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null)
      (= res@3@00 akk@2@00)
      (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
        akk@2@00
        1) res@3@00)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@28@00))
(assert ($Perm.isReadVar $k@35@00))
(assert (forall ((x@34@00 $Ref)) (!
  (=>
    (and (Set_in x@34@00 xs@0@00) (< $Perm.No $k@35@00))
    (and
      (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00) x@34@00)
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00)))
  :pattern ((Set_in x@34@00 xs@0@00))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@35@00)))
    (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@41@00 $Snap)) (!
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
  :qid |qp.psmDomDef14|)))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
  (=>
    (not
      (=
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
          $k@19@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
      (< $k@28@00 $k@19@00)
      (< $k@28@00 $Perm.No)))
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
      (< $Perm.No $k@19@00)
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@26@00) $Snap.unit))
      (=
        ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)))))
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
  (list%trigger ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) x@26@00)
  (=
    ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
      ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))))
(assert (and
  (=
    ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) x@26@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
  (<= $Perm.No $k@27@00)
  (<= $k@27@00 $Perm.Write)
  (=> (< $Perm.No $k@27@00) (not (= x@26@00 $Ref.null)))
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
        ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :qid |qp.fvfResTrgDef5|))
  ($FVF.loc_next ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00)))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null))
  (and
    (not
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :qid |qp.fvfResTrgDef5|)))))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null))
  (and
    (=
      ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
      ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))))
    (<=
      $Perm.No
      (ite
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
        $k@27@00
        $Perm.No))
    ($PSF.loc_list ($PSF.lookup_list (sm@32@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :qid |qp.fvfResTrgDef5|))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null))
      (and
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
              ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
          :qid |qp.fvfValDef4|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :qid |qp.fvfResTrgDef5|))
        (forall ((s@39@00 $Snap)) (!
          (=>
            (ite
              (and
                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
              (<
                $Perm.No
                (-
                  $k@19@00
                  (ite
                    (= ($SortWrappers.$SnapTo$Ref s@39@00) x@26@00)
                    ($Perm.min
                      (ite
                        (and
                          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                        $k@19@00
                        $Perm.No)
                      $k@28@00)
                    $Perm.No)))
              false)
            (and
              (not (= s@39@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))))
          :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
          :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))
          :qid |qp.psmValDef7|))
        (forall ((s@39@00 $Snap)) (!
          (=>
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref s@39@00)
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
              (< $Perm.No $k@27@00)
              false)
            (and
              (not (= s@39@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))))
          :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
          :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))
          :qid |qp.psmValDef8|))
        (forall ((s@39@00 $Snap)) (!
          (and
            ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00) s@39@00)
            ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00) s@39@00))
          :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
          :qid |qp.psmResTrgDef9|))
        (forall ((x $Ref)) (!
          (=>
            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
          :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
          :qid |quant-u-15|))
        (forall ((x $Ref)) (!
          (=>
            (not
              (=
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  (-
                    $k@19@00
                    (ite
                      (= x x@26@00)
                      ($Perm.min
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                          $k@19@00
                          $Perm.No)
                        $k@28@00)
                      $Perm.No))
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              (<
                (ite
                  (and
                    (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                  $k@35@00
                  $Perm.No)
                (-
                  $k@19@00
                  (ite
                    (= x x@26@00)
                    ($Perm.min
                      (ite
                        (and
                          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                        $k@19@00
                        $Perm.No)
                      $k@28@00)
                    $Perm.No)))
              (<
                (ite
                  (and
                    (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                  $k@35@00
                  $Perm.No)
                $Perm.No)))
          :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
          :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
          :pattern ((Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
          :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
          :qid |qp.srp10|))
        (forall ((s@41@00 $Snap)) (!
          (=>
            (and
              (and
                (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                (< $Perm.No $k@35@00)
                (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                (<
                  $Perm.No
                  (-
                    $k@19@00
                    (ite
                      (= ($SortWrappers.$SnapTo$Ref s@41@00) x@26@00)
                      ($Perm.min
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                          $k@19@00
                          $Perm.No)
                        $k@28@00)
                      $Perm.No)))
                false))
            (and
              (not (= s@41@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))))
          :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
          :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))
          :qid |qp.psmValDef11|))
        (forall ((s@41@00 $Snap)) (!
          (=>
            (and
              (and
                (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                (< $Perm.No $k@35@00)
                (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
              (ite
                (=
                  ($SortWrappers.$SnapTo$Ref s@41@00)
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                (< $Perm.No $k@27@00)
                false))
            (and
              (not (= s@41@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))))
          :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
          :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))
          :qid |qp.psmValDef12|))
        (forall ((s@41@00 $Snap)) (!
          (and
            ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00) s@41@00)
            ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00) s@41@00))
          :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
          :qid |qp.psmResTrgDef13|))
        (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
          akk@2@00
          1) res@3@00)))
    (or
      (not
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null))
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@43@00))
(assert (forall ((s@47@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
      (<
        $Perm.No
        (-
          $k@19@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@47@00) x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      false)
    (and
      (not (= s@47@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))))
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))
  :qid |qp.psmValDef15|)))
(assert (forall ((s@47@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00) s@47@00)
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :qid |qp.psmResTrgDef16|)))
(assert (forall ((x@42@00 $Ref)) (!
  (=>
    (and (Set_in x@42@00 xs@0@00) (< $Perm.No $k@43@00))
    (and
      (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00) x@42@00)
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00)))
  :pattern ((Set_in x@42@00 xs@0@00))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@43@00)))
    (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@49@00 $Snap)) (!
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
  :qid |qp.psmDomDef20|)))
(assert (forall ((s@49@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00)
        (< $Perm.No $k@43@00)
        (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
        (<
          $Perm.No
          (-
            $k@19@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@49@00) x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        false))
    (and
      (not (= s@49@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))))
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))
  :qid |qp.psmValDef18|)))
(assert (forall ((s@49@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00) s@49@00)
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :qid |qp.psmResTrgDef19|)))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
  (=>
    (not
      (=
        (ite
          (and
            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
          $k@19@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
      (< $k@28@00 $k@19@00)
      (< $k@28@00 $Perm.No)))
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
      (< $Perm.No $k@19@00)
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@26@00) $Snap.unit))
      (=
        ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)))))
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
  (list%trigger ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) x@26@00)
  (=
    ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
      ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))))
(assert (and
  (=
    ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) x@26@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
  (<= $Perm.No $k@27@00)
  (<= $k@27@00 $Perm.Write)
  (=> (< $Perm.No $k@27@00) (not (= x@26@00 $Ref.null)))
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
        ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
    :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
    :qid |qp.fvfResTrgDef5|))
  ($FVF.loc_next ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00)))
(assert (=>
  (=
    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
    $Ref.null)
  (and
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null)
    (=
      ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
      $Snap.unit)
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :qid |qp.fvfResTrgDef5|))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null))
      (and
        (not
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
              ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
          :qid |qp.fvfValDef4|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :qid |qp.fvfResTrgDef5|))
        (forall ((x $Ref)) (!
          (=>
            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
            ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
          :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
          :qid |quant-u-20|))
        (forall ((x $Ref)) (!
          (=>
            (not
              (=
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  (-
                    $k@19@00
                    (ite
                      (= x x@26@00)
                      ($Perm.min
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                          $k@19@00
                          $Perm.No)
                        $k@28@00)
                      $Perm.No))
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              (<
                (ite
                  (and
                    (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                  $k@43@00
                  $Perm.No)
                (-
                  $k@19@00
                  (ite
                    (= x x@26@00)
                    ($Perm.min
                      (ite
                        (and
                          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                        $k@19@00
                        $Perm.No)
                      $k@28@00)
                    $Perm.No)))
              (<
                (ite
                  (and
                    (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                  $k@43@00
                  $Perm.No)
                $Perm.No)))
          :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
          :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
          :pattern ((Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
          :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
          :qid |qp.srp17|))
        (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
          akk@2@00
          1) res@3@00)))
    (or
      (not
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null))
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null)))))
(assert (or
  (=
    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
    $Ref.null)
  (not
    (=
      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
      $Ref.null))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | !(x@26@00 in xs@0@00 && x@26@00 == y@1@00)]
(assert (not (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@27@00))
(assert ($Perm.isReadVar $k@28@00))
(assert ($Perm.isReadVar $k@35@00))
(assert (forall ((x@34@00 $Ref)) (!
  (=>
    (and (Set_in x@34@00 xs@0@00) (< $Perm.No $k@35@00))
    (and
      (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00) x@34@00)
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00)))
  :pattern ((Set_in x@34@00 xs@0@00))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@35@00)))
    (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@41@00 $Snap)) (!
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
  :qid |qp.psmDomDef14|)))
(assert ($Perm.isReadVar $k@43@00))
(assert (forall ((s@47@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
      (<
        $Perm.No
        (-
          $k@19@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@47@00) x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      false)
    (and
      (not (= s@47@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))))
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))
  :qid |qp.psmValDef15|)))
(assert (forall ((s@47@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00) s@47@00)
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :qid |qp.psmResTrgDef16|)))
(assert (forall ((x@42@00 $Ref)) (!
  (=>
    (and (Set_in x@42@00 xs@0@00) (< $Perm.No $k@43@00))
    (and
      (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00) x@42@00)
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00)))
  :pattern ((Set_in x@42@00 xs@0@00))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@43@00)))
    (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@49@00 $Snap)) (!
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
  :qid |qp.psmDomDef20|)))
(assert (forall ((s@49@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00)
        (< $Perm.No $k@43@00)
        (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
        (<
          $Perm.No
          (-
            $k@19@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@49@00) x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        false))
    (and
      (not (= s@49@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))))
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))
  :qid |qp.psmValDef18|)))
(assert (forall ((s@49@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00) s@49@00)
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :qid |qp.psmResTrgDef19|)))
(assert (=>
  (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))
  (and
    (Set_in x@26@00 xs@0@00)
    (= x@26@00 y@1@00)
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null))
      (=
        (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
        (ite
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (= res@3@00 akk@2@00)
          (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
            akk@2@00
            1) res@3@00))))
    (=>
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null)
      (=
        (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
        (ite
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (= res@3@00 akk@2@00)
          (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
            akk@2@00
            1) res@3@00))))
    ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
    (=>
      (not
        (=
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
            $k@19@00
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
        (< $k@28@00 $k@19@00)
        (< $k@28@00 $Perm.No)))
    (=>
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
        (< $Perm.No $k@19@00)
        false)
      (and
        (not (= ($SortWrappers.$RefTo$Snap x@26@00) $Snap.unit))
        (=
          ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)))))
    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
    (list%trigger ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) x@26@00)
    (=
      ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
        ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
    (=
      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) x@26@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
    (<= $Perm.No $k@27@00)
    (<= $k@27@00 $Perm.Write)
    (=> (< $Perm.No $k@27@00) (not (= x@26@00 $Ref.null)))
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
      :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :qid |qp.fvfResTrgDef5|))
    ($FVF.loc_next ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00)
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null))
      (and
        (not
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
              ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
          :qid |qp.fvfValDef4|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :qid |qp.fvfResTrgDef5|))))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null))
      (and
        (=
          ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
          ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))))
        (<=
          $Perm.No
          (ite
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
            $k@27@00
            $Perm.No))
        ($PSF.loc_list ($PSF.lookup_list (sm@32@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
              ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
          :qid |qp.fvfValDef4|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :qid |qp.fvfResTrgDef5|))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (and
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))
            (forall ((s@39@00 $Snap)) (!
              (=>
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                  (<
                    $Perm.No
                    (-
                      $k@19@00
                      (ite
                        (= ($SortWrappers.$SnapTo$Ref s@39@00) x@26@00)
                        ($Perm.min
                          (ite
                            (and
                              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                            $k@19@00
                            $Perm.No)
                          $k@28@00)
                        $Perm.No)))
                  false)
                (and
                  (not (= s@39@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                    ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))))
              :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
              :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))
              :qid |qp.psmValDef7|))
            (forall ((s@39@00 $Snap)) (!
              (=>
                (ite
                  (=
                    ($SortWrappers.$SnapTo$Ref s@39@00)
                    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                  (< $Perm.No $k@27@00)
                  false)
                (and
                  (not (= s@39@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                    ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))))
              :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
              :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))
              :qid |qp.psmValDef8|))
            (forall ((s@39@00 $Snap)) (!
              (and
                ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00) s@39@00)
                ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00) s@39@00))
              :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
              :qid |qp.psmResTrgDef9|))
            (forall ((x $Ref)) (!
              (=>
                (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
              :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
              :qid |quant-u-15|))
            (forall ((x $Ref)) (!
              (=>
                (not
                  (=
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      (-
                        $k@19@00
                        (ite
                          (= x x@26@00)
                          ($Perm.min
                            (ite
                              (and
                                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                              $k@19@00
                              $Perm.No)
                            $k@28@00)
                          $Perm.No))
                      $Perm.No)
                    $Perm.No))
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  (<
                    (ite
                      (and
                        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                      $k@35@00
                      $Perm.No)
                    (-
                      $k@19@00
                      (ite
                        (= x x@26@00)
                        ($Perm.min
                          (ite
                            (and
                              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                            $k@19@00
                            $Perm.No)
                          $k@28@00)
                        $Perm.No)))
                  (<
                    (ite
                      (and
                        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (= x (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                      $k@35@00
                      $Perm.No)
                    $Perm.No)))
              :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
              :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              :pattern ((Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
              :qid |qp.srp10|))
            (forall ((s@41@00 $Snap)) (!
              (=>
                (and
                  (and
                    (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                    (< $Perm.No $k@35@00)
                    (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
                  (ite
                    (and
                      (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                      (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                    (<
                      $Perm.No
                      (-
                        $k@19@00
                        (ite
                          (= ($SortWrappers.$SnapTo$Ref s@41@00) x@26@00)
                          ($Perm.min
                            (ite
                              (and
                                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                              $k@19@00
                              $Perm.No)
                            $k@28@00)
                          $Perm.No)))
                    false))
                (and
                  (not (= s@41@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                    ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))))
              :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
              :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))
              :qid |qp.psmValDef11|))
            (forall ((s@41@00 $Snap)) (!
              (=>
                (and
                  (and
                    (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                    (< $Perm.No $k@35@00)
                    (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
                  (ite
                    (=
                      ($SortWrappers.$SnapTo$Ref s@41@00)
                      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                    (< $Perm.No $k@27@00)
                    false))
                (and
                  (not (= s@41@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                    ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))))
              :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
              :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))
              :qid |qp.psmValDef12|))
            (forall ((s@41@00 $Snap)) (!
              (and
                ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00) s@41@00)
                ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00) s@41@00))
              :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
              :qid |qp.psmResTrgDef13|))
            (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
              akk@2@00
              1) res@3@00)))
        (or
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null))))
    (=>
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null)
      (and
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null)
        (=
          ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
              ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
          :qid |qp.fvfValDef4|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :qid |qp.fvfResTrgDef5|))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))
            (forall ((x $Ref)) (!
              (=>
                (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
              :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
              :qid |quant-u-20|))
            (forall ((x $Ref)) (!
              (=>
                (not
                  (=
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      (-
                        $k@19@00
                        (ite
                          (= x x@26@00)
                          ($Perm.min
                            (ite
                              (and
                                (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                              $k@19@00
                              $Perm.No)
                            $k@28@00)
                          $Perm.No))
                      $Perm.No)
                    $Perm.No))
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  (<
                    (ite
                      (and
                        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                        (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                      $k@43@00
                      $Perm.No)
                    (-
                      $k@19@00
                      (ite
                        (= x x@26@00)
                        ($Perm.min
                          (ite
                            (and
                              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                            $k@19@00
                            $Perm.No)
                          $k@28@00)
                        $Perm.No)))
                  (<
                    (ite
                      (and
                        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                        (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (= x (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                      $k@43@00
                      $Perm.No)
                    $Perm.No)))
              :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
              :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              :pattern ((Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
              :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
              :qid |qp.srp17|))
            (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
              akk@2@00
              1) res@3@00)))
        (or
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null))))
    (or
      (=
        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
        $Ref.null)
      (not
        (=
          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
          $Ref.null))))))
; Joined path conditions
(assert (or
  (not (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00)))
  (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))))
; Definitional axioms for snapshot map values
(declare-fun sm@51@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@27@00))
(assert ($Perm.isReadVar $k@28@00))
(assert ($Perm.isReadVar $k@35@00))
(assert (forall ((x@34@00 $Ref)) (!
  (=>
    (and (Set_in x@34@00 xs@0@00) (< $Perm.No $k@35@00))
    (and
      (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00) x@34@00)
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00)))
  :pattern ((Set_in x@34@00 xs@0@00))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@34@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@35@00)))
    (= (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@41@00 $Snap)) (!
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
  :qid |qp.psmDomDef14|)))
(assert ($Perm.isReadVar $k@43@00))
(assert (forall ((s@47@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
      (<
        $Perm.No
        (-
          $k@19@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@47@00) x@26@00)
            ($Perm.min
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00))
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@47@00)) xs@0@00))
                $k@19@00
                $Perm.No)
              $k@28@00)
            $Perm.No)))
      false)
    (and
      (not (= s@47@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))))
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00))
  :qid |qp.psmValDef15|)))
(assert (forall ((s@47@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@47@00) s@47@00)
  :pattern (($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@47@00))
  :qid |qp.psmResTrgDef16|)))
(assert (forall ((x@42@00 $Ref)) (!
  (=>
    (and (Set_in x@42@00 xs@0@00) (< $Perm.No $k@43@00))
    (and
      (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00) x@42@00)
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00)))
  :pattern ((Set_in x@42@00 xs@0@00))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@42@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
        (< $Perm.No $k@43@00)))
    (= (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@49@00 $Snap)) (!
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
  :qid |qp.psmDomDef20|)))
(assert (forall ((s@49@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00)
        (< $Perm.No $k@43@00)
        (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)))
      (ite
        (and
          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
        (<
          $Perm.No
          (-
            $k@19@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@49@00) x@26@00)
              ($Perm.min
                (ite
                  (and
                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00))
                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@49@00)) xs@0@00))
                  $k@19@00
                  $Perm.No)
                $k@28@00)
              $Perm.No)))
        false))
    (and
      (not (= s@49@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))))
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00))
  :qid |qp.psmValDef18|)))
(assert (forall ((s@49@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@49@00) s@49@00)
  :pattern (($PSF.lookup_list (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@49@00))
  :qid |qp.psmResTrgDef19|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@26@00 $Ref)) (!
  (and
    (or (Set_in x@26@00 xs@0@00) (not (Set_in x@26@00 xs@0@00)))
    (=>
      (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))
      (and
        (Set_in x@26@00 xs@0@00)
        (= x@26@00 y@1@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (=
            (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
            (ite
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null)
              (= res@3@00 akk@2@00)
              (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                akk@2@00
                1) res@3@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (=
            (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
            (ite
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null)
              (= res@3@00 akk@2@00)
              (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                akk@2@00
                1) res@3@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
        (=>
          (not
            (=
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
                $k@19@00
                $Perm.No)
              $Perm.No))
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
            (< $k@28@00 $k@19@00)
            (< $k@28@00 $Perm.No)))
        (=>
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
            (< $Perm.No $k@19@00)
            false)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@26@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)))))
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
        (list%trigger ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) x@26@00)
        (=
          ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
            ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
        (=
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) x@26@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
        (<= $Perm.No $k@27@00)
        (<= $k@27@00 $Perm.Write)
        (=> (< $Perm.No $k@27@00) (not (= x@26@00 $Ref.null)))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
              ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
          :qid |qp.fvfValDef4|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :qid |qp.fvfResTrgDef5|))
        ($FVF.loc_next ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
              ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                $k@27@00
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@32@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                    (=
                      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
                  :qid |qp.fvfValDef4|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :qid |qp.fvfResTrgDef5|))
                (forall ((s@39@00 $Snap)) (!
                  (=>
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                      (<
                        $Perm.No
                        (-
                          $k@19@00
                          (ite
                            (= ($SortWrappers.$SnapTo$Ref s@39@00) x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      false)
                    (and
                      (not (= s@39@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))
                  :qid |qp.psmValDef7|))
                (forall ((s@39@00 $Snap)) (!
                  (=>
                    (ite
                      (=
                        ($SortWrappers.$SnapTo$Ref s@39@00)
                        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                      (< $Perm.No $k@27@00)
                      false)
                    (and
                      (not (= s@39@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                        ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))
                  :qid |qp.psmValDef8|))
                (forall ((s@39@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00) s@39@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00) s@39@00))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :qid |qp.psmResTrgDef9|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |quant-u-15|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                          (-
                            $k@19@00
                            (ite
                              (= x x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@35@00
                          $Perm.No)
                        (-
                          $k@19@00
                          (ite
                            (= x x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@35@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |qp.srp10|))
                (forall ((s@41@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                        (< $Perm.No $k@35@00)
                        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
                      (ite
                        (and
                          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                        (<
                          $Perm.No
                          (-
                            $k@19@00
                            (ite
                              (= ($SortWrappers.$SnapTo$Ref s@41@00) x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No)))
                        false))
                    (and
                      (not (= s@41@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))
                  :qid |qp.psmValDef11|))
                (forall ((s@41@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                        (< $Perm.No $k@35@00)
                        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
                      (ite
                        (=
                          ($SortWrappers.$SnapTo$Ref s@41@00)
                          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                        (< $Perm.No $k@27@00)
                        false))
                    (and
                      (not (= s@41@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                        ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))
                  :qid |qp.psmValDef12|))
                (forall ((s@41@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00) s@41@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00) s@41@00))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :qid |qp.psmResTrgDef13|))
                (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                  akk@2@00
                  1) res@3@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                    (=
                      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
                  :qid |qp.fvfValDef4|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :qid |qp.fvfResTrgDef5|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |quant-u-20|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                          (-
                            $k@19@00
                            (ite
                              (= x x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@43@00
                          $Perm.No)
                        (-
                          $k@19@00
                          (ite
                            (= x x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@43@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |qp.srp17|))
                (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                  akk@2@00
                  1) res@3@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00)))
      (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))))
  :pattern ((Set_in x@26@00 xs@0@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@210@3@215@51-aux|)))
(assert (forall ((x@26@00 $Ref)) (!
  (and
    (or (Set_in x@26@00 xs@0@00) (not (Set_in x@26@00 xs@0@00)))
    (=>
      (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))
      (and
        (Set_in x@26@00 xs@0@00)
        (= x@26@00 y@1@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (=
            (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
            (ite
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null)
              (= res@3@00 akk@2@00)
              (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                akk@2@00
                1) res@3@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (=
            (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
            (ite
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null)
              (= res@3@00 akk@2@00)
              (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                akk@2@00
                1) res@3@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
        (=>
          (not
            (=
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
                $k@19@00
                $Perm.No)
              $Perm.No))
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
            (< $k@28@00 $k@19@00)
            (< $k@28@00 $Perm.No)))
        (=>
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
            (< $Perm.No $k@19@00)
            false)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@26@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)))))
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
        (list%trigger ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) x@26@00)
        (=
          ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
            ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
        (=
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) x@26@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
        (<= $Perm.No $k@27@00)
        (<= $k@27@00 $Perm.Write)
        (=> (< $Perm.No $k@27@00) (not (= x@26@00 $Ref.null)))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
              ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
          :qid |qp.fvfValDef4|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :qid |qp.fvfResTrgDef5|))
        ($FVF.loc_next ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
              ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                $k@27@00
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@32@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                    (=
                      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
                  :qid |qp.fvfValDef4|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :qid |qp.fvfResTrgDef5|))
                (forall ((s@39@00 $Snap)) (!
                  (=>
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                      (<
                        $Perm.No
                        (-
                          $k@19@00
                          (ite
                            (= ($SortWrappers.$SnapTo$Ref s@39@00) x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      false)
                    (and
                      (not (= s@39@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))
                  :qid |qp.psmValDef7|))
                (forall ((s@39@00 $Snap)) (!
                  (=>
                    (ite
                      (=
                        ($SortWrappers.$SnapTo$Ref s@39@00)
                        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                      (< $Perm.No $k@27@00)
                      false)
                    (and
                      (not (= s@39@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                        ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))
                  :qid |qp.psmValDef8|))
                (forall ((s@39@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00) s@39@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00) s@39@00))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :qid |qp.psmResTrgDef9|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |quant-u-15|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                          (-
                            $k@19@00
                            (ite
                              (= x x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@35@00
                          $Perm.No)
                        (-
                          $k@19@00
                          (ite
                            (= x x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@35@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |qp.srp10|))
                (forall ((s@41@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                        (< $Perm.No $k@35@00)
                        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
                      (ite
                        (and
                          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                        (<
                          $Perm.No
                          (-
                            $k@19@00
                            (ite
                              (= ($SortWrappers.$SnapTo$Ref s@41@00) x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No)))
                        false))
                    (and
                      (not (= s@41@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))
                  :qid |qp.psmValDef11|))
                (forall ((s@41@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                        (< $Perm.No $k@35@00)
                        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
                      (ite
                        (=
                          ($SortWrappers.$SnapTo$Ref s@41@00)
                          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                        (< $Perm.No $k@27@00)
                        false))
                    (and
                      (not (= s@41@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                        ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))
                  :qid |qp.psmValDef12|))
                (forall ((s@41@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00) s@41@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00) s@41@00))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :qid |qp.psmResTrgDef13|))
                (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                  akk@2@00
                  1) res@3@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                    (=
                      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
                  :qid |qp.fvfValDef4|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :qid |qp.fvfResTrgDef5|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |quant-u-20|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                          (-
                            $k@19@00
                            (ite
                              (= x x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@43@00
                          $Perm.No)
                        (-
                          $k@19@00
                          (ite
                            (= x x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@43@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |qp.srp17|))
                (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                  akk@2@00
                  1) res@3@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00)))
      (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))))
  :pattern (($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@210@3@215@51-aux|)))
(assert (forall ((x@26@00 $Ref)) (!
  (and
    (or (Set_in x@26@00 xs@0@00) (not (Set_in x@26@00 xs@0@00)))
    (=>
      (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))
      (and
        (Set_in x@26@00 xs@0@00)
        (= x@26@00 y@1@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (=
            (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
            (ite
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null)
              (= res@3@00 akk@2@00)
              (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                akk@2@00
                1) res@3@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (=
            (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
            (ite
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null)
              (= res@3@00 akk@2@00)
              (length3_impl ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                akk@2@00
                1) res@3@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
        (=>
          (not
            (=
              (ite
                (and
                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
                $k@19@00
                $Perm.No)
              $Perm.No))
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
            (< $k@28@00 $k@19@00)
            (< $k@28@00 $Perm.No)))
        (=>
          (ite
            (and
              (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00)
              (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) xs@0@00))
            (< $Perm.No $k@19@00)
            false)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@26@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)))))
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00))
        (list%trigger ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) x@26@00)
        (=
          ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
            ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
        (=
          ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) x@26@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))))
        (<= $Perm.No $k@27@00)
        (<= $k@27@00 $Perm.Write)
        (=> (< $Perm.No $k@27@00) (not (= x@26@00 $Ref.null)))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
              ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
          :qid |qp.fvfValDef4|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
          :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
          :qid |qp.fvfResTrgDef5|))
        ($FVF.loc_next ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
              ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                $k@27@00
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@32@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                    (=
                      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
                  :qid |qp.fvfValDef4|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :qid |qp.fvfResTrgDef5|))
                (forall ((s@39@00 $Snap)) (!
                  (=>
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                      (<
                        $Perm.No
                        (-
                          $k@19@00
                          (ite
                            (= ($SortWrappers.$SnapTo$Ref s@39@00) x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00))
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      false)
                    (and
                      (not (= s@39@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00))
                  :qid |qp.psmValDef7|))
                (forall ((s@39@00 $Snap)) (!
                  (=>
                    (ite
                      (=
                        ($SortWrappers.$SnapTo$Ref s@39@00)
                        ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                      (< $Perm.No $k@27@00)
                      false)
                    (and
                      (not (= s@39@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00)
                        ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00))
                  :qid |qp.psmValDef8|))
                (forall ((s@39@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@39@00) s@39@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@39@00) s@39@00))
                  :pattern (($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@39@00))
                  :qid |qp.psmResTrgDef9|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |quant-u-15|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                          (-
                            $k@19@00
                            (ite
                              (= x x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@35@00
                          $Perm.No)
                        (-
                          $k@19@00
                          (ite
                            (= x x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@35@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |qp.srp10|))
                (forall ((s@41@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                        (< $Perm.No $k@35@00)
                        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
                      (ite
                        (and
                          (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                        (<
                          $Perm.No
                          (-
                            $k@19@00
                            (ite
                              (= ($SortWrappers.$SnapTo$Ref s@41@00) x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00))
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No)))
                        false))
                    (and
                      (not (= s@41@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00))
                  :qid |qp.psmValDef11|))
                (forall ((s@41@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@36@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)) xs@0@00)
                        (< $Perm.No $k@35@00)
                        (img@37@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@41@00)))
                      (ite
                        (=
                          ($SortWrappers.$SnapTo$Ref s@41@00)
                          ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00))
                        (< $Perm.No $k@27@00)
                        false))
                    (and
                      (not (= s@41@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00)
                        ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :pattern (($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00))
                  :qid |qp.psmValDef12|))
                (forall ((s@41@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@41@00) s@41@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@31@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) s@41@00) s@41@00))
                  :pattern (($PSF.lookup_list (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@41@00))
                  :qid |qp.psmResTrgDef13|))
                (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@40@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                  akk@2@00
                  1) res@3@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
              :qid |qp.fvfValDef4|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
              :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
              :qid |qp.fvfResTrgDef5|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@26@00) (< $Perm.No $k@27@00) false)
                    (=
                      ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r)
                      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r)))
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r))
                  :qid |qp.fvfValDef4|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00) r) r)
                  :pattern (($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
                  :qid |qp.fvfResTrgDef5|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@46@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |quant-u-20|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                          (-
                            $k@19@00
                            (ite
                              (= x x@26@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                    (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                  $k@19@00
                                  $Perm.No)
                                $k@28@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                        (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@43@00
                          $Perm.No)
                        (-
                          $k@19@00
                          (ite
                            (= x x@26@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                                  (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                                $k@19@00
                                $Perm.No)
                              $k@28@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
                            (img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)
                            (=
                              x
                              (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x)))
                          $k@43@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :pattern ((Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((Set_in (inv@44@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00))
                  :pattern ((img@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
                  :qid |qp.srp17|))
                (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)) xs@0@00 ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) (+
                  akk@2@00
                  1) res@3@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@30@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00)))
      (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@210@3@215@51-aux|)))
(assert (=
  result@4@00
  (forall ((x@26@00 $Ref)) (!
    (=>
      (and (Set_in x@26@00 xs@0@00) (= x@26@00 y@1@00))
      (joined_unfolding@50@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@26@00))
    :pattern ((Set_in x@26@00 xs@0@00))
    :pattern (($PSF.loc_list ($PSF.lookup_list (sm@24@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x@26@00)) ($SortWrappers.$RefTo$Snap x@26@00)))
    :pattern (($FVF.loc_next ($FVF.lookup_next (sm@51@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x@26@00) x@26@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@210@3@215@51|))))
(pop) ; 1
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
; ---------- FUNCTION length_impl----------
(declare-fun xs@5@00 () Set<$Ref>)
(declare-fun y@6@00 () $Ref)
(declare-fun akk@7@00 () Int)
(declare-fun res@8@00 () Int)
(declare-fun result@9@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-fun sm@52@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap y@6@00))
  s@$))
(declare-fun sm@53@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@54@00 $Snap)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap y@6@00)) ($SortWrappers.$RefTo$Snap y@6@00)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (=
  ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap y@6@00))
  s@$))
(assert ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap y@6@00)) ($SortWrappers.$RefTo$Snap y@6@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall x: Ref :: { (x in xs) } { list(x) } { x.next } (x in xs) && x == y ==> (unfolding acc(list(x), write) in (x.next == null ? res == akk : length_impl(xs, x.next, akk + 1, res))))
(declare-const x@55@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (x in xs) && x == y ==> (unfolding acc(list(x), write) in (x.next == null ? res == akk : length_impl(xs, x.next, akk + 1, res)))
; [eval] (x in xs) && x == y
; [eval] (x in xs)
(push) ; 3
; [then-branch: 5 | !(x@55@00 in xs@5@00) | live]
; [else-branch: 5 | x@55@00 in xs@5@00 | live]
(push) ; 4
; [then-branch: 5 | !(x@55@00 in xs@5@00)]
(assert (not (Set_in x@55@00 xs@5@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | x@55@00 in xs@5@00]
(assert (Set_in x@55@00 xs@5@00))
; [eval] x == y
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@55@00 xs@5@00) (not (Set_in x@55@00 xs@5@00))))
(push) ; 3
; [then-branch: 6 | x@55@00 in xs@5@00 && x@55@00 == y@6@00 | live]
; [else-branch: 6 | !(x@55@00 in xs@5@00 && x@55@00 == y@6@00) | live]
(push) ; 4
; [then-branch: 6 | x@55@00 in xs@5@00 && x@55@00 == y@6@00]
(assert (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00)))
; [eval] (unfolding acc(list(x), write) in (x.next == null ? res == akk : length_impl(xs, x.next, akk + 1, res)))
(push) ; 5
(declare-fun sm@56@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@57@00 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@57@00 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@57@00) y@6@00)
    (and
      (not (= s@57@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00)
        ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))))
  :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :pattern (($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :qid |qp.psmValDef23|)))
(assert (forall ((s@57@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00) s@57@00)
  :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :qid |qp.psmResTrgDef24|)))
(assert ($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00)))
(push) ; 6
(set-option :timeout 10)
(assert (not (= y@6@00 x@55@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (ite (= y@6@00 x@55@00) $Perm.Write $Perm.No)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@55@00)
    (=
      (-
        $Perm.Write
        (ite
          (= x x@55@00)
          ($Perm.min (ite (= x y@6@00) $Perm.Write $Perm.No) $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= x@55@00 y@6@00)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@55@00) $Snap.unit))
    (=
      ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
      ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))))))
(assert ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00)))
(assert (list%trigger ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) x@55@00))
(assert (=
  ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
    ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))))))
(declare-fun sm@58@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) x@55@00)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))))))
(assert (not (= x@55@00 $Ref.null)))
(declare-fun sm@59@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@55@00)
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
      ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
  :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
  :qid |qp.fvfResTrgDef26|)))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00))
; [eval] x.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@55@00)
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
        ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :qid |qp.fvfResTrgDef26|))))
; [then-branch: 7 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) != Null | live]
; [else-branch: 7 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 7 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) != Null]
(assert (not
  (=
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@55@00)
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
        ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :qid |qp.fvfResTrgDef26|))))
(declare-fun sm@60@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
  ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
    $Perm.Write
    $Perm.No)))
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))
; [eval] (x.next == null ? res == akk : length_impl(xs, x.next, akk + 1, res))
; [eval] x.next == null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@55@00)
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
        ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :qid |qp.fvfResTrgDef26|))))
(push) ; 7
; [then-branch: 8 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) == Null | live]
; [else-branch: 8 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) != Null | live]
(push) ; 8
; [then-branch: 8 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) == Null]
(assert (=
  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
  $Ref.null))
; [eval] res == akk
(pop) ; 8
(push) ; 8
; [else-branch: 8 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) != Null]
; [eval] length_impl(xs, x.next, akk + 1, res)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@55@00)
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
        ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :qid |qp.fvfResTrgDef26|))))
; [eval] akk + 1
(push) ; 9
(declare-fun sm@61@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@62@00 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@62@00 $Snap)) (!
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref s@62@00)
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
    (and
      (not (= s@62@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00)
        ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))))
  :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
  :pattern (($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))
  :qid |qp.psmValDef27|)))
(assert (forall ((s@62@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00) s@62@00)
  :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
  :qid |qp.psmResTrgDef28|)))
(assert ($PSF.loc_list ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))
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
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
      ($Perm.min
        (ite
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
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
(assert (not (forall ((x $Ref)) (!
  (=>
    (=
      x
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
    (=
      (-
        $Perm.Write
        (ite
          (=
            x
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
          ($Perm.min
            (ite
              (=
                x
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-31|))))
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
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
  (and
    (not
      (=
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
        $Snap.unit))
    (=
      ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
      ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))))))
(assert ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))
(assert (length_impl%precondition ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
  akk@7@00
  1) res@8@00))
(pop) ; 9
; Joined path conditions
(assert (and
  (forall ((s@62@00 $Snap)) (!
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref s@62@00)
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
      (and
        (not (= s@62@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00)
          ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))))
    :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
    :pattern (($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))
    :qid |qp.psmValDef27|))
  (forall ((s@62@00 $Snap)) (!
    ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00) s@62@00)
    :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
    :qid |qp.psmResTrgDef28|))
  ($PSF.loc_list ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
  (=>
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
    (and
      (not
        (=
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
          $Snap.unit))
      (=
        ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
        ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))))
  ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
  (length_impl%precondition ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
    akk@7@00
    1) res@8@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null))
  (and
    (forall ((r $Ref)) (!
      (=>
        (= r x@55@00)
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
      :qid |qp.fvfValDef25|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :qid |qp.fvfResTrgDef26|))
    (forall ((s@62@00 $Snap)) (!
      (=>
        (=
          ($SortWrappers.$SnapTo$Ref s@62@00)
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
        (and
          (not (= s@62@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00)
            ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))))
      :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
      :pattern (($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))
      :qid |qp.psmValDef27|))
    (forall ((s@62@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00) s@62@00)
      :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
      :qid |qp.psmResTrgDef28|))
    ($PSF.loc_list ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
    (=>
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
      (and
        (not
          (=
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
            $Snap.unit))
        (=
          ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
          ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))))
    ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
    (length_impl%precondition ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
      akk@7@00
      1) res@8@00))))
(assert (or
  (not
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null))
  (=
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
    $Ref.null)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 7 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) == Null]
(assert (=
  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
  $Ref.null))
(assert (=
  ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
  $Snap.unit))
; [eval] (x.next == null ? res == akk : length_impl(xs, x.next, akk + 1, res))
; [eval] x.next == null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@55@00)
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
        ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :qid |qp.fvfResTrgDef26|))))
(push) ; 7
; [then-branch: 9 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) == Null | live]
; [else-branch: 9 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) != Null | live]
(push) ; 8
; [then-branch: 9 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) == Null]
; [eval] res == akk
(pop) ; 8
(push) ; 8
; [else-branch: 9 | Lookup(next, sm@59@00(s@$, xs@5@00, y@6@00, akk@7@00, res@8@00), x@55@00) != Null]
(assert (not
  (=
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
    $Ref.null)))
; [eval] length_impl(xs, x.next, akk + 1, res)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@55@00)
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
        ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :qid |qp.fvfResTrgDef26|))))
; [eval] akk + 1
(push) ; 9
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 10
(assert (not (forall ((x $Ref)) (!
  (=>
    (=
      x
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
    false)
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (length_impl%precondition ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
  akk@7@00
  1) res@8@00))
(pop) ; 9
; Joined path conditions
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
  (length_impl%precondition ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
    akk@7@00
    1) res@8@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null))
  (and
    (not
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (= r x@55@00)
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
      :qid |qp.fvfValDef25|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :qid |qp.fvfResTrgDef26|))
    ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
    (length_impl%precondition ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
      akk@7@00
      1) res@8@00))))
(assert (or
  (not
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null))
  (=
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
    $Ref.null)))
(pop) ; 6
(pop) ; 5
(declare-fun joined_unfolding@63@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null))
  (=
    (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
    (ite
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null)
      (= res@8@00 akk@7@00)
      (length_impl ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
        akk@7@00
        1) res@8@00)))))
(assert (=>
  (=
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
    $Ref.null)
  (=
    (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
    (ite
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null)
      (= res@8@00 akk@7@00)
      (length_impl ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
        akk@7@00
        1) res@8@00)))))
; Joined path conditions
(assert (forall ((s@57@00 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@57@00) y@6@00)
    (and
      (not (= s@57@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00)
        ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))))
  :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :pattern (($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :qid |qp.psmValDef23|)))
(assert (forall ((s@57@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00) s@57@00)
  :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :qid |qp.psmResTrgDef24|)))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
  (=>
    (= x@55@00 y@6@00)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@55@00) $Snap.unit))
      (=
        ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
        ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
  ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
  (list%trigger ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) x@55@00)
  (=
    ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
      ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))))
(assert (and
  (=
    ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) x@55@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
  (not (= x@55@00 $Ref.null))
  (forall ((r $Ref)) (!
    (=>
      (= r x@55@00)
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
        ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :qid |qp.fvfResTrgDef26|))
  ($FVF.loc_next ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00)))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null))
  (and
    (not
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (= r x@55@00)
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
      :qid |qp.fvfValDef25|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :qid |qp.fvfResTrgDef26|)))))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null))
  (and
    (=
      ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
      ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))))
    (<=
      $Perm.No
      (ite
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
        $Perm.Write
        $Perm.No))
    ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
    (forall ((r $Ref)) (!
      (=>
        (= r x@55@00)
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
      :qid |qp.fvfValDef25|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :qid |qp.fvfResTrgDef26|))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null))
      (and
        (forall ((r $Ref)) (!
          (=>
            (= r x@55@00)
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
              ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
          :qid |qp.fvfValDef25|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :qid |qp.fvfResTrgDef26|))
        (forall ((s@62@00 $Snap)) (!
          (=>
            (=
              ($SortWrappers.$SnapTo$Ref s@62@00)
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
            (and
              (not (= s@62@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00)
                ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))))
          :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
          :pattern (($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))
          :qid |qp.psmValDef27|))
        (forall ((s@62@00 $Snap)) (!
          ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00) s@62@00)
          :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
          :qid |qp.psmResTrgDef28|))
        ($PSF.loc_list ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
        (=>
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
          (and
            (not
              (=
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                $Snap.unit))
            (=
              ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
              ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))))
        ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
        (length_impl%precondition ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
          akk@7@00
          1) res@8@00)))
    (or
      (not
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null))
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null)))))
; Joined path conditions
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
  (=>
    (= x@55@00 y@6@00)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@55@00) $Snap.unit))
      (=
        ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
        ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
  ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
  (list%trigger ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) x@55@00)
  (=
    ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
      ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))))
(assert (and
  (=
    ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) x@55@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
  (not (= x@55@00 $Ref.null))
  (forall ((r $Ref)) (!
    (=>
      (= r x@55@00)
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
        ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
    :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
    :qid |qp.fvfResTrgDef26|))
  ($FVF.loc_next ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00)))
(assert (=>
  (=
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
    $Ref.null)
  (and
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null)
    (=
      ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
      $Snap.unit)
    (forall ((r $Ref)) (!
      (=>
        (= r x@55@00)
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
      :qid |qp.fvfValDef25|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :qid |qp.fvfResTrgDef26|))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null))
      (and
        (not
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (= r x@55@00)
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
              ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
          :qid |qp.fvfValDef25|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :qid |qp.fvfResTrgDef26|))
        ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
        (length_impl%precondition ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
          akk@7@00
          1) res@8@00)))
    (or
      (not
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null))
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null)))))
(assert (or
  (=
    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
    $Ref.null)
  (not
    (=
      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
      $Ref.null))))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(x@55@00 in xs@5@00 && x@55@00 == y@6@00)]
(assert (not (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((s@57@00 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@57@00) y@6@00)
    (and
      (not (= s@57@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00)
        ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))))
  :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :pattern (($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :qid |qp.psmValDef23|)))
(assert (forall ((s@57@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00) s@57@00)
  :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :qid |qp.psmResTrgDef24|)))
(assert (=>
  (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))
  (and
    (Set_in x@55@00 xs@5@00)
    (= x@55@00 y@6@00)
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null))
      (=
        (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
        (ite
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (= res@8@00 akk@7@00)
          (length_impl ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
            akk@7@00
            1) res@8@00))))
    (=>
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null)
      (=
        (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
        (ite
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (= res@8@00 akk@7@00)
          (length_impl ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
            akk@7@00
            1) res@8@00))))
    ($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
    (=>
      (= x@55@00 y@6@00)
      (and
        (not (= ($SortWrappers.$RefTo$Snap x@55@00) $Snap.unit))
        (=
          ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
          ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
    ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
    (list%trigger ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) x@55@00)
    (=
      ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
        ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
    (=
      ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) x@55@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
    (not (= x@55@00 $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (= r x@55@00)
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
      :qid |qp.fvfValDef25|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
      :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :qid |qp.fvfResTrgDef26|))
    ($FVF.loc_next ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00)
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null))
      (and
        (not
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (= r x@55@00)
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
              ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
          :qid |qp.fvfValDef25|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :qid |qp.fvfResTrgDef26|))))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null))
      (and
        (=
          ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
          ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))))
        (<=
          $Perm.No
          (ite
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
            $Perm.Write
            $Perm.No))
        ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
        (forall ((r $Ref)) (!
          (=>
            (= r x@55@00)
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
              ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
          :qid |qp.fvfValDef25|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :qid |qp.fvfResTrgDef26|))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (and
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))
            (forall ((s@62@00 $Snap)) (!
              (=>
                (=
                  ($SortWrappers.$SnapTo$Ref s@62@00)
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                (and
                  (not (= s@62@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00)
                    ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))))
              :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
              :pattern (($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))
              :qid |qp.psmValDef27|))
            (forall ((s@62@00 $Snap)) (!
              ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00) s@62@00)
              :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
              :qid |qp.psmResTrgDef28|))
            ($PSF.loc_list ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
            (=>
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
              (and
                (not
                  (=
                    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                    $Snap.unit))
                (=
                  ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                  ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))))
            ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
            (length_impl%precondition ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
              akk@7@00
              1) res@8@00)))
        (or
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null))))
    (=>
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null)
      (and
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null)
        (=
          ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (= r x@55@00)
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
              ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
          :qid |qp.fvfValDef25|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :qid |qp.fvfResTrgDef26|))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))
            ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
            (length_impl%precondition ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
              akk@7@00
              1) res@8@00)))
        (or
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null))))
    (or
      (=
        ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
        $Ref.null)
      (not
        (=
          ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
          $Ref.null))))))
; Joined path conditions
(assert (or
  (not (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00)))
  (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))))
; Definitional axioms for snapshot map values
(declare-fun sm@64@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((s@57@00 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@57@00) y@6@00)
    (and
      (not (= s@57@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00)
        ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))))
  :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :pattern (($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :qid |qp.psmValDef23|)))
(assert (forall ((s@57@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00) s@57@00)
  :pattern (($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@57@00))
  :qid |qp.psmResTrgDef24|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@55@00 $Ref)) (!
  (and
    (or (Set_in x@55@00 xs@5@00) (not (Set_in x@55@00 xs@5@00)))
    (=>
      (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))
      (and
        (Set_in x@55@00 xs@5@00)
        (= x@55@00 y@6@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (=
            (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
            (ite
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null)
              (= res@8@00 akk@7@00)
              (length_impl ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                akk@7@00
                1) res@8@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (=
            (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
            (ite
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null)
              (= res@8@00 akk@7@00)
              (length_impl ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                akk@7@00
                1) res@8@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
        (=>
          (= x@55@00 y@6@00)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@55@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
              ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
        (list%trigger ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) x@55@00)
        (=
          ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
            ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        (=
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) x@55@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        (not (= x@55@00 $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (= r x@55@00)
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
              ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
          :qid |qp.fvfValDef25|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :qid |qp.fvfResTrgDef26|))
        ($FVF.loc_next ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
              ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                $Perm.Write
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (= r x@55@00)
                    (=
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                      ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
                  :qid |qp.fvfValDef25|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :qid |qp.fvfResTrgDef26|))
                (forall ((s@62@00 $Snap)) (!
                  (=>
                    (=
                      ($SortWrappers.$SnapTo$Ref s@62@00)
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                    (and
                      (not (= s@62@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00)
                        ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))))
                  :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
                  :pattern (($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))
                  :qid |qp.psmValDef27|))
                (forall ((s@62@00 $Snap)) (!
                  ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00) s@62@00)
                  :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
                  :qid |qp.psmResTrgDef28|))
                ($PSF.loc_list ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (=>
                  (=
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                  (and
                    (not
                      (=
                        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                        $Snap.unit))
                    (=
                      ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                      ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))))
                ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (length_impl%precondition ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                  akk@7@00
                  1) res@8@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (= r x@55@00)
                    (=
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                      ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
                  :qid |qp.fvfValDef25|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :qid |qp.fvfResTrgDef26|))
                ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (length_impl%precondition ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                  akk@7@00
                  1) res@8@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00)))
      (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))))
  :pattern ((Set_in x@55@00 xs@5@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@75@3@80@50-aux|)))
(assert (forall ((x@55@00 $Ref)) (!
  (and
    (or (Set_in x@55@00 xs@5@00) (not (Set_in x@55@00 xs@5@00)))
    (=>
      (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))
      (and
        (Set_in x@55@00 xs@5@00)
        (= x@55@00 y@6@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (=
            (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
            (ite
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null)
              (= res@8@00 akk@7@00)
              (length_impl ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                akk@7@00
                1) res@8@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (=
            (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
            (ite
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null)
              (= res@8@00 akk@7@00)
              (length_impl ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                akk@7@00
                1) res@8@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
        (=>
          (= x@55@00 y@6@00)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@55@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
              ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
        (list%trigger ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) x@55@00)
        (=
          ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
            ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        (=
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) x@55@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        (not (= x@55@00 $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (= r x@55@00)
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
              ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
          :qid |qp.fvfValDef25|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :qid |qp.fvfResTrgDef26|))
        ($FVF.loc_next ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
              ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                $Perm.Write
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (= r x@55@00)
                    (=
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                      ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
                  :qid |qp.fvfValDef25|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :qid |qp.fvfResTrgDef26|))
                (forall ((s@62@00 $Snap)) (!
                  (=>
                    (=
                      ($SortWrappers.$SnapTo$Ref s@62@00)
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                    (and
                      (not (= s@62@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00)
                        ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))))
                  :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
                  :pattern (($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))
                  :qid |qp.psmValDef27|))
                (forall ((s@62@00 $Snap)) (!
                  ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00) s@62@00)
                  :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
                  :qid |qp.psmResTrgDef28|))
                ($PSF.loc_list ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (=>
                  (=
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                  (and
                    (not
                      (=
                        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                        $Snap.unit))
                    (=
                      ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                      ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))))
                ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (length_impl%precondition ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                  akk@7@00
                  1) res@8@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (= r x@55@00)
                    (=
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                      ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
                  :qid |qp.fvfValDef25|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :qid |qp.fvfResTrgDef26|))
                ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (length_impl%precondition ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                  akk@7@00
                  1) res@8@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00)))
      (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))))
  :pattern (($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@75@3@80@50-aux|)))
(assert (forall ((x@55@00 $Ref)) (!
  (and
    (or (Set_in x@55@00 xs@5@00) (not (Set_in x@55@00 xs@5@00)))
    (=>
      (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))
      (and
        (Set_in x@55@00 xs@5@00)
        (= x@55@00 y@6@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (=
            (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
            (ite
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null)
              (= res@8@00 akk@7@00)
              (length_impl ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                akk@7@00
                1) res@8@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (=
            (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00)
            (ite
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null)
              (= res@8@00 akk@7@00)
              (length_impl ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                akk@7@00
                1) res@8@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
        (=>
          (= x@55@00 y@6@00)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@55@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
              ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        ($PSF.loc_list ($PSF.lookup_list (sm@52@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00))
        (list%trigger ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) x@55@00)
        (=
          ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
            ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        (=
          ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) x@55@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))))
        (not (= x@55@00 $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (= r x@55@00)
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
              ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
          :qid |qp.fvfValDef25|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
          :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
          :qid |qp.fvfResTrgDef26|))
        ($FVF.loc_next ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
              ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                $Perm.Write
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (= r x@55@00)
                    (=
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                      ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
                  :qid |qp.fvfValDef25|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :qid |qp.fvfResTrgDef26|))
                (forall ((s@62@00 $Snap)) (!
                  (=>
                    (=
                      ($SortWrappers.$SnapTo$Ref s@62@00)
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                    (and
                      (not (= s@62@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00)
                        ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))))
                  :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
                  :pattern (($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00))
                  :qid |qp.psmValDef27|))
                (forall ((s@62@00 $Snap)) (!
                  ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) s@62@00) s@62@00)
                  :pattern (($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@62@00))
                  :qid |qp.psmResTrgDef28|))
                ($PSF.loc_list ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (=>
                  (=
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                  (and
                    (not
                      (=
                        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))
                        $Snap.unit))
                    (=
                      ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                      ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))))))
                ($PSF.loc_list ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (length_impl%precondition ($PSF.lookup_list (sm@61@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                  akk@7@00
                  1) res@8@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (= r x@55@00)
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                  ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
              :qid |qp.fvfValDef25|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
              :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
              :qid |qp.fvfResTrgDef26|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (= r x@55@00)
                    (=
                      ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r)
                      ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r)))
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :pattern (($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r))
                  :qid |qp.fvfValDef25|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@58@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00) r) r)
                  :pattern (($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
                  :qid |qp.fvfResTrgDef26|))
                ($PSF.loc_list ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)))
                (length_impl%precondition ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00))) xs@5@00 ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) (+
                  akk@7@00
                  1) res@8@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@59@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00)))
      (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (sm@64@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@75@3@80@50-aux|)))
(assert (=
  result@9@00
  (forall ((x@55@00 $Ref)) (!
    (=>
      (and (Set_in x@55@00 xs@5@00) (= x@55@00 y@6@00))
      (joined_unfolding@63@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00 x@55@00))
    :pattern ((Set_in x@55@00 xs@5@00))
    :pattern (($PSF.loc_list ($PSF.lookup_list (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x@55@00)) ($SortWrappers.$RefTo$Snap x@55@00)))
    :pattern (($FVF.loc_next ($FVF.lookup_next (sm@64@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x@55@00) x@55@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@75@3@80@50|))))
(pop) ; 1
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
; ---------- FUNCTION length2_impl----------
(declare-fun xs@10@00 () Set<$Ref>)
(declare-fun y@11@00 () $Ref)
(declare-fun akk@12@00 () Int)
(declare-fun res@13@00 () Int)
(declare-fun result@14@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const x@65@00 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@65@00 xs@10@00))
(declare-const $k@66@00 $Perm)
(assert ($Perm.isReadVar $k@66@00))
(pop) ; 2
(declare-fun inv@67@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@68@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@66@00))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@65@00 $Ref)) (!
  (=> (Set_in x@65@00 xs@10@00) (or (= $k@66@00 $Perm.No) (< $Perm.No $k@66@00)))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@65@00 $Ref) (x2@65@00 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@65@00 xs@10@00) (< $Perm.No $k@66@00))
      (and (Set_in x2@65@00 xs@10@00) (< $Perm.No $k@66@00))
      (= x1@65@00 x2@65@00))
    (= x1@65@00 x2@65@00))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@65@00 $Ref)) (!
  (=>
    (and (Set_in x@65@00 xs@10@00) (< $Perm.No $k@66@00))
    (and
      (= (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00) x@65@00)
      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00)))
  :pattern ((Set_in x@65@00 xs@10@00))
  :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
  :qid |quant-u-36|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@66@00)))
    (= (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@65@00 $Ref)) (!
  (<= $Perm.No $k@66@00)
  :pattern ((Set_in x@65@00 xs@10@00))
  :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
  :qid |list-permAtLeastZero|)))
(declare-fun sm@69@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@70@00 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@70@00 $Snap)) (!
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
  :qid |qp.psmValDef30|)))
(assert (forall ((s@70@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@70@00) s@70@00)
  :pattern (($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@70@00))
  :qid |qp.psmResTrgDef31|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |quant-u-37|)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@66@00)))
    (= (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@70@00 $Snap)) (!
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
  :qid |qp.psmValDef30|)))
(assert (forall ((s@70@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@70@00) s@70@00)
  :pattern (($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@70@00))
  :qid |qp.psmResTrgDef31|)))
(assert (forall ((x@65@00 $Ref)) (!
  (=>
    (and (Set_in x@65@00 xs@10@00) (< $Perm.No $k@66@00))
    (and
      (= (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00) x@65@00)
      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00)))
  :pattern ((Set_in x@65@00 xs@10@00))
  :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
  :qid |quant-u-36|)))
(assert (forall ((x@65@00 $Ref)) (!
  (<= $Perm.No $k@66@00)
  :pattern ((Set_in x@65@00 xs@10@00))
  :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@65@00))
  :qid |list-permAtLeastZero|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |quant-u-37|)))
(assert ($Perm.isReadVar $k@66@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall x: Ref :: { (x in xs) } { list(x) } { x.next } (x in xs) && x == y ==> (unfolding acc(list(x), wildcard) in (x.next == null ? res == akk : length2_impl(xs, x.next, akk + 1, res))))
(declare-const x@71@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (x in xs) && x == y ==> (unfolding acc(list(x), wildcard) in (x.next == null ? res == akk : length2_impl(xs, x.next, akk + 1, res)))
; [eval] (x in xs) && x == y
; [eval] (x in xs)
(push) ; 3
; [then-branch: 10 | !(x@71@00 in xs@10@00) | live]
; [else-branch: 10 | x@71@00 in xs@10@00 | live]
(push) ; 4
; [then-branch: 10 | !(x@71@00 in xs@10@00)]
(assert (not (Set_in x@71@00 xs@10@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | x@71@00 in xs@10@00]
(assert (Set_in x@71@00 xs@10@00))
; [eval] x == y
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@71@00 xs@10@00) (not (Set_in x@71@00 xs@10@00))))
(push) ; 3
; [then-branch: 11 | x@71@00 in xs@10@00 && x@71@00 == y@11@00 | live]
; [else-branch: 11 | !(x@71@00 in xs@10@00 && x@71@00 == y@11@00) | live]
(push) ; 4
; [then-branch: 11 | x@71@00 in xs@10@00 && x@71@00 == y@11@00]
(assert (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00)))
; [eval] (unfolding acc(list(x), wildcard) in (x.next == null ? res == akk : length2_impl(xs, x.next, akk + 1, res)))
(declare-const $k@72@00 $Perm)
(assert ($Perm.isReadVar $k@72@00))
(push) ; 5
(assert (not (< $Perm.No $k@72@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(declare-const $k@73@00 $Perm)
(assert ($Perm.isReadVar $k@73@00))
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@73@00
(assert (=>
  (not
    (=
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
        $k@66@00
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
    (< $k@73@00 $k@66@00)
    (< $k@73@00 $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@71@00)
    (=
      (-
        $k@73@00
        (ite
          (= x x@71@00)
          ($Perm.min
            (ite
              (and
                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              $k@66@00
              $Perm.No)
            $k@73@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
    (< $Perm.No $k@66@00)
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@71@00) $Snap.unit))
    (=
      ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00))))))
(assert ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00)))
(assert (list%trigger ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) x@71@00))
(assert (=
  ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
    ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))))))
(declare-fun sm@74@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) x@71@00)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))))))
(assert (<= $Perm.No $k@72@00))
(assert (<= $k@72@00 $Perm.Write))
(assert (=> (< $Perm.No $k@72@00) (not (= x@71@00 $Ref.null))))
(declare-fun sm@75@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
      ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
  :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
  :qid |qp.fvfResTrgDef34|)))
(assert ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00))
; [eval] x.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
        ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :qid |qp.fvfResTrgDef34|))))
(set-option :timeout 0)
(push) ; 6
(assert (not (< $Perm.No $k@72@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) != Null | live]
; [else-branch: 12 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) == Null | live]
(push) ; 6
; [then-branch: 12 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) != Null]
(assert (not
  (=
    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
        ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :qid |qp.fvfResTrgDef34|))))
(push) ; 7
(assert (not (< $Perm.No $k@72@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@76@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
  ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
    $k@72@00
    $Perm.No)))
(declare-fun sm@77@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@78@00 $Snap)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list ($PSF.lookup_list (sm@77@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))))
; [eval] (x.next == null ? res == akk : length2_impl(xs, x.next, akk + 1, res))
; [eval] x.next == null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
        ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :qid |qp.fvfResTrgDef34|))))
(push) ; 7
(assert (not (< $Perm.No $k@72@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 13 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) == Null | live]
; [else-branch: 13 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) != Null | live]
(push) ; 8
; [then-branch: 13 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) == Null]
(assert (=
  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
  $Ref.null))
; [eval] res == akk
(pop) ; 8
(push) ; 8
; [else-branch: 13 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) != Null]
; [eval] length2_impl(xs, x.next, akk + 1, res)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
        ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :qid |qp.fvfResTrgDef34|))))
(push) ; 9
(assert (not (< $Perm.No $k@72@00)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] akk + 1
(push) ; 9
(declare-const x@79@00 $Ref)
(push) ; 10
; [eval] (x in xs)
(assert (Set_in x@79@00 xs@10@00))
(declare-const $k@80@00 $Perm)
(assert ($Perm.isReadVar $k@80@00))
(pop) ; 10
(declare-fun inv@81@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@82@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@80@00))
; Nested auxiliary terms: non-globals
(push) ; 10
(assert (not (forall ((x@79@00 $Ref)) (!
  (=> (Set_in x@79@00 xs@10@00) (or (= $k@80@00 $Perm.No) (< $Perm.No $k@80@00)))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@83@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@84@00 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@84@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
      (<
        $Perm.No
        (-
          $k@66@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@84@00) x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      false)
    (and
      (not (= s@84@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))))
  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))
  :qid |qp.psmValDef36|)))
(assert (forall ((s@84@00 $Snap)) (!
  (=>
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref s@84@00)
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
      (< $Perm.No $k@72@00)
      false)
    (and
      (not (= s@84@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
        ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))))
  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
  :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))
  :qid |qp.psmValDef37|)))
(assert (forall ((s@84@00 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00) s@84@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00) s@84@00))
  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
  :qid |qp.psmResTrgDef38|)))
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((x1@79@00 $Ref) (x2@79@00 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@79@00 xs@10@00)
          ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x1@79@00)) ($SortWrappers.$RefTo$Snap x1@79@00)))
        (< $Perm.No $k@80@00))
      (and
        (and
          (Set_in x2@79@00 xs@10@00)
          ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x2@79@00)) ($SortWrappers.$RefTo$Snap x2@79@00)))
        (< $Perm.No $k@80@00))
      (= x1@79@00 x2@79@00))
    (= x1@79@00 x2@79@00))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@79@00 $Ref)) (!
  (=>
    (and (Set_in x@79@00 xs@10@00) (< $Perm.No $k@80@00))
    (and
      (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00) x@79@00)
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00)))
  :pattern ((Set_in x@79@00 xs@10@00))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@80@00)))
    (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |quant-u-42|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@80@00
(assert (forall ((x $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
          (-
            $k@66@00
            (ite
              (= x x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
      (<
        (ite
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
          $k@80@00
          $Perm.No)
        (-
          $k@66@00
          (ite
            (= x x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      (<
        (ite
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
          $k@80@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
  :pattern ((Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |qp.srp39|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
    (=
      (-
        $k@80@00
        (ite
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
          ($Perm.min
            (ite
              (and
                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              (-
                $k@66@00
                (ite
                  (= x x@71@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      $k@66@00
                      $Perm.No)
                    $k@73@00)
                  $Perm.No))
              $Perm.No)
            $k@80@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@85@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@86@00 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@86@00 $Snap)) (!
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
  :qid |qp.psmDomDef43|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@86@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
        (< $Perm.No $k@80@00)
        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
        (<
          $Perm.No
          (-
            $k@66@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@86@00) x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        false))
    (and
      (not (= s@86@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))))
  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))
  :qid |qp.psmValDef40|)))
(assert (forall ((s@86@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
        (< $Perm.No $k@80@00)
        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref s@86@00)
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
        (< $Perm.No $k@72@00)
        false))
    (and
      (not (= s@86@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
        ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))))
  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
  :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))
  :qid |qp.psmValDef41|)))
(assert (forall ((s@86@00 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00) s@86@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00) s@86@00))
  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
  :qid |qp.psmResTrgDef42|)))
(assert (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
  akk@12@00
  1) res@13@00))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@80@00))
(assert (forall ((x@79@00 $Ref)) (!
  (=>
    (and (Set_in x@79@00 xs@10@00) (< $Perm.No $k@80@00))
    (and
      (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00) x@79@00)
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00)))
  :pattern ((Set_in x@79@00 xs@10@00))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@80@00)))
    (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@86@00 $Snap)) (!
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
  :qid |qp.psmDomDef43|)))
(assert (and
  (forall ((s@84@00 $Snap)) (!
    (=>
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
        (<
          $Perm.No
          (-
            $k@66@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@84@00) x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        false)
      (and
        (not (= s@84@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))))
    :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
    :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))
    :qid |qp.psmValDef36|))
  (forall ((s@84@00 $Snap)) (!
    (=>
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref s@84@00)
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
        (< $Perm.No $k@72@00)
        false)
      (and
        (not (= s@84@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
          ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))))
    :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
    :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))
    :qid |qp.psmValDef37|))
  (forall ((s@84@00 $Snap)) (!
    (and
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00) s@84@00)
      ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00) s@84@00))
    :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
    :qid |qp.psmResTrgDef38|))
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
      ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
    :qid |quant-u-42|))
  (forall ((x $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
            (-
              $k@66@00
              (ite
                (= x x@71@00)
                ($Perm.min
                  (ite
                    (and
                      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                    $k@66@00
                    $Perm.No)
                  $k@73@00)
                $Perm.No))
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
        (<
          (ite
            (and
              (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
              (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
              (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
            $k@80@00
            $Perm.No)
          (-
            $k@66@00
            (ite
              (= x x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        (<
          (ite
            (and
              (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
              (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
              (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
            $k@80@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
    :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
    :pattern ((Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
    :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
    :qid |qp.srp39|))
  (forall ((s@86@00 $Snap)) (!
    (=>
      (and
        (and
          (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
          (< $Perm.No $k@80@00)
          (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
          (<
            $Perm.No
            (-
              $k@66@00
              (ite
                (= ($SortWrappers.$SnapTo$Ref s@86@00) x@71@00)
                ($Perm.min
                  (ite
                    (and
                      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                    $k@66@00
                    $Perm.No)
                  $k@73@00)
                $Perm.No)))
          false))
      (and
        (not (= s@86@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))))
    :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
    :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))
    :qid |qp.psmValDef40|))
  (forall ((s@86@00 $Snap)) (!
    (=>
      (and
        (and
          (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
          (< $Perm.No $k@80@00)
          (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref s@86@00)
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
          (< $Perm.No $k@72@00)
          false))
      (and
        (not (= s@86@00 $Snap.unit))
        (=
          ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
          ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))))
    :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
    :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))
    :qid |qp.psmValDef41|))
  (forall ((s@86@00 $Snap)) (!
    (and
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00) s@86@00)
      ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00) s@86@00))
    :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
    :qid |qp.psmResTrgDef42|))
  (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
    akk@12@00
    1) res@13@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@80@00))
(assert (forall ((x@79@00 $Ref)) (!
  (=>
    (and (Set_in x@79@00 xs@10@00) (< $Perm.No $k@80@00))
    (and
      (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00) x@79@00)
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00)))
  :pattern ((Set_in x@79@00 xs@10@00))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@80@00)))
    (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@86@00 $Snap)) (!
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
  :qid |qp.psmDomDef43|)))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null))
  (and
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
      :qid |qp.fvfValDef33|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :qid |qp.fvfResTrgDef34|))
    (forall ((s@84@00 $Snap)) (!
      (=>
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
          (<
            $Perm.No
            (-
              $k@66@00
              (ite
                (= ($SortWrappers.$SnapTo$Ref s@84@00) x@71@00)
                ($Perm.min
                  (ite
                    (and
                      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                    $k@66@00
                    $Perm.No)
                  $k@73@00)
                $Perm.No)))
          false)
        (and
          (not (= s@84@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
            ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))))
      :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
      :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))
      :qid |qp.psmValDef36|))
    (forall ((s@84@00 $Snap)) (!
      (=>
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref s@84@00)
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
          (< $Perm.No $k@72@00)
          false)
        (and
          (not (= s@84@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
            ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))))
      :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
      :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))
      :qid |qp.psmValDef37|))
    (forall ((s@84@00 $Snap)) (!
      (and
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00) s@84@00)
        ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00) s@84@00))
      :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
      :qid |qp.psmResTrgDef38|))
    (forall ((x $Ref)) (!
      (=>
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
      :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |quant-u-42|))
    (forall ((x $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              (-
                $k@66@00
                (ite
                  (= x x@71@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      $k@66@00
                      $Perm.No)
                    $k@73@00)
                  $Perm.No))
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
          (<
            (ite
              (and
                (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
              $k@80@00
              $Perm.No)
            (-
              $k@66@00
              (ite
                (= x x@71@00)
                ($Perm.min
                  (ite
                    (and
                      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                    $k@66@00
                    $Perm.No)
                  $k@73@00)
                $Perm.No)))
          (<
            (ite
              (and
                (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
              $k@80@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
      :pattern ((Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
      :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |qp.srp39|))
    (forall ((s@86@00 $Snap)) (!
      (=>
        (and
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
            (< $Perm.No $k@80@00)
            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
            (<
              $Perm.No
              (-
                $k@66@00
                (ite
                  (= ($SortWrappers.$SnapTo$Ref s@86@00) x@71@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                      $k@66@00
                      $Perm.No)
                    $k@73@00)
                  $Perm.No)))
            false))
        (and
          (not (= s@86@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
            ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))))
      :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
      :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))
      :qid |qp.psmValDef40|))
    (forall ((s@86@00 $Snap)) (!
      (=>
        (and
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
            (< $Perm.No $k@80@00)
            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
          (ite
            (=
              ($SortWrappers.$SnapTo$Ref s@86@00)
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
            (< $Perm.No $k@72@00)
            false))
        (and
          (not (= s@86@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
            ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))))
      :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
      :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))
      :qid |qp.psmValDef41|))
    (forall ((s@86@00 $Snap)) (!
      (and
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00) s@86@00)
        ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00) s@86@00))
      :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
      :qid |qp.psmResTrgDef42|))
    (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
      akk@12@00
      1) res@13@00))))
(assert (or
  (not
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null))
  (=
    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
    $Ref.null)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 12 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) == Null]
(assert (=
  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
  $Ref.null))
(assert (=
  ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
  $Snap.unit))
; [eval] (x.next == null ? res == akk : length2_impl(xs, x.next, akk + 1, res))
; [eval] x.next == null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
        ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :qid |qp.fvfResTrgDef34|))))
(push) ; 7
(assert (not (< $Perm.No $k@72@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 14 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) == Null | live]
; [else-branch: 14 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) != Null | live]
(push) ; 8
; [then-branch: 14 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) == Null]
; [eval] res == akk
(pop) ; 8
(push) ; 8
; [else-branch: 14 | Lookup(next, sm@75@00(s@$, xs@10@00, y@11@00, akk@12@00, res@13@00), x@71@00) != Null]
(assert (not
  (=
    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
    $Ref.null)))
; [eval] length2_impl(xs, x.next, akk + 1, res)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
        ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :qid |qp.fvfResTrgDef34|))))
(push) ; 9
(assert (not (< $Perm.No $k@72@00)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] akk + 1
(push) ; 9
(declare-const x@87@00 $Ref)
(push) ; 10
; [eval] (x in xs)
(assert (Set_in x@87@00 xs@10@00))
(declare-const $k@88@00 $Perm)
(assert ($Perm.isReadVar $k@88@00))
(pop) ; 10
(declare-fun inv@89@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun img@90@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@88@00))
; Nested auxiliary terms: non-globals
(push) ; 10
(assert (not (forall ((x@87@00 $Ref)) (!
  (=> (Set_in x@87@00 xs@10@00) (or (= $k@88@00 $Perm.No) (< $Perm.No $k@88@00)))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@91@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@92@00 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@92@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
      (<
        $Perm.No
        (-
          $k@66@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@92@00) x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      false)
    (and
      (not (= s@92@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))))
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))
  :qid |qp.psmValDef44|)))
(assert (forall ((s@92@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00) s@92@00)
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :qid |qp.psmResTrgDef45|)))
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((x1@87@00 $Ref) (x2@87@00 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@87@00 xs@10@00)
          ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x1@87@00)) ($SortWrappers.$RefTo$Snap x1@87@00)))
        (< $Perm.No $k@88@00))
      (and
        (and
          (Set_in x2@87@00 xs@10@00)
          ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x2@87@00)) ($SortWrappers.$RefTo$Snap x2@87@00)))
        (< $Perm.No $k@88@00))
      (= x1@87@00 x2@87@00))
    (= x1@87@00 x2@87@00))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@87@00 $Ref)) (!
  (=>
    (and (Set_in x@87@00 xs@10@00) (< $Perm.No $k@88@00))
    (and
      (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00) x@87@00)
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00)))
  :pattern ((Set_in x@87@00 xs@10@00))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@88@00)))
    (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
    ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |quant-u-47|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Constrain original permissions $k@88@00
(assert (forall ((x $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
          (-
            $k@66@00
            (ite
              (= x x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
      (<
        (ite
          (and
            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
          $k@88@00
          $Perm.No)
        (-
          $k@66@00
          (ite
            (= x x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      (<
        (ite
          (and
            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
          $k@88@00
          $Perm.No)
        $Perm.No)))
  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
  :pattern ((Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |qp.srp46|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
    (=
      (-
        $k@88@00
        (ite
          (and
            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
          ($Perm.min
            (ite
              (and
                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              (-
                $k@66@00
                (ite
                  (= x x@71@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      $k@66@00
                      $Perm.No)
                    $k@73@00)
                  $Perm.No))
              $Perm.No)
            $k@88@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@93@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-const s@94@00 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@94@00 $Snap)) (!
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
  :qid |qp.psmDomDef49|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@94@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00)
        (< $Perm.No $k@88@00)
        (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
        (<
          $Perm.No
          (-
            $k@66@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@94@00) x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        false))
    (and
      (not (= s@94@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))))
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))
  :qid |qp.psmValDef47|)))
(assert (forall ((s@94@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00) s@94@00)
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :qid |qp.psmResTrgDef48|)))
(assert (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
  akk@12@00
  1) res@13@00))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@88@00))
(assert (forall ((s@92@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
      (<
        $Perm.No
        (-
          $k@66@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@92@00) x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      false)
    (and
      (not (= s@92@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))))
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))
  :qid |qp.psmValDef44|)))
(assert (forall ((s@92@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00) s@92@00)
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :qid |qp.psmResTrgDef45|)))
(assert (forall ((x@87@00 $Ref)) (!
  (=>
    (and (Set_in x@87@00 xs@10@00) (< $Perm.No $k@88@00))
    (and
      (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00) x@87@00)
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00)))
  :pattern ((Set_in x@87@00 xs@10@00))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@88@00)))
    (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@94@00 $Snap)) (!
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
  :qid |qp.psmDomDef49|)))
(assert (forall ((s@94@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00)
        (< $Perm.No $k@88@00)
        (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
        (<
          $Perm.No
          (-
            $k@66@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@94@00) x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        false))
    (and
      (not (= s@94@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))))
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))
  :qid |qp.psmValDef47|)))
(assert (forall ((s@94@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00) s@94@00)
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :qid |qp.psmResTrgDef48|)))
(assert (and
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
      ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
    :qid |quant-u-47|))
  (forall ((x $Ref)) (!
    (=>
      (not
        (=
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
            (-
              $k@66@00
              (ite
                (= x x@71@00)
                ($Perm.min
                  (ite
                    (and
                      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                    $k@66@00
                    $Perm.No)
                  $k@73@00)
                $Perm.No))
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
        (<
          (ite
            (and
              (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
              (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
              (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
            $k@88@00
            $Perm.No)
          (-
            $k@66@00
            (ite
              (= x x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        (<
          (ite
            (and
              (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
              (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
              (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
            $k@88@00
            $Perm.No)
          $Perm.No)))
    :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
    :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
    :pattern ((Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
    :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
    :qid |qp.srp46|))
  (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
    akk@12@00
    1) res@13@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@88@00))
(assert (forall ((s@92@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
      (<
        $Perm.No
        (-
          $k@66@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@92@00) x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      false)
    (and
      (not (= s@92@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))))
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))
  :qid |qp.psmValDef44|)))
(assert (forall ((s@92@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00) s@92@00)
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :qid |qp.psmResTrgDef45|)))
(assert (forall ((x@87@00 $Ref)) (!
  (=>
    (and (Set_in x@87@00 xs@10@00) (< $Perm.No $k@88@00))
    (and
      (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00) x@87@00)
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00)))
  :pattern ((Set_in x@87@00 xs@10@00))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@88@00)))
    (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@94@00 $Snap)) (!
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
  :qid |qp.psmDomDef49|)))
(assert (forall ((s@94@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00)
        (< $Perm.No $k@88@00)
        (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
        (<
          $Perm.No
          (-
            $k@66@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@94@00) x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        false))
    (and
      (not (= s@94@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))))
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))
  :qid |qp.psmValDef47|)))
(assert (forall ((s@94@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00) s@94@00)
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :qid |qp.psmResTrgDef48|)))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null))
  (and
    (not
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
      :qid |qp.fvfValDef33|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :qid |qp.fvfResTrgDef34|))
    (forall ((x $Ref)) (!
      (=>
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
      :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |quant-u-47|))
    (forall ((x $Ref)) (!
      (=>
        (not
          (=
            (ite
              (and
                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              (-
                $k@66@00
                (ite
                  (= x x@71@00)
                  ($Perm.min
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      $k@66@00
                      $Perm.No)
                    $k@73@00)
                  $Perm.No))
              $Perm.No)
            $Perm.No))
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
          (<
            (ite
              (and
                (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
              $k@88@00
              $Perm.No)
            (-
              $k@66@00
              (ite
                (= x x@71@00)
                ($Perm.min
                  (ite
                    (and
                      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                    $k@66@00
                    $Perm.No)
                  $k@73@00)
                $Perm.No)))
          (<
            (ite
              (and
                (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
              $k@88@00
              $Perm.No)
            $Perm.No)))
      :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
      :pattern ((Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
      :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |qp.srp46|))
    (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
      akk@12@00
      1) res@13@00))))
(assert (or
  (not
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null))
  (=
    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
    $Ref.null)))
(pop) ; 6
(pop) ; 5
(declare-fun joined_unfolding@95@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null))
  (=
    (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
    (ite
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null)
      (= res@13@00 akk@12@00)
      (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
        akk@12@00
        1) res@13@00)))))
(assert (=>
  (=
    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
    $Ref.null)
  (=
    (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
    (ite
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null)
      (= res@13@00 akk@12@00)
      (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
        akk@12@00
        1) res@13@00)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@73@00))
(assert ($Perm.isReadVar $k@80@00))
(assert (forall ((x@79@00 $Ref)) (!
  (=>
    (and (Set_in x@79@00 xs@10@00) (< $Perm.No $k@80@00))
    (and
      (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00) x@79@00)
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00)))
  :pattern ((Set_in x@79@00 xs@10@00))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@80@00)))
    (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@86@00 $Snap)) (!
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
  :qid |qp.psmDomDef43|)))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
  (=>
    (not
      (=
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
          $k@66@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
      (< $k@73@00 $k@66@00)
      (< $k@73@00 $Perm.No)))
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
      (< $Perm.No $k@66@00)
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@71@00) $Snap.unit))
      (=
        ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)))))
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
  (list%trigger ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) x@71@00)
  (=
    ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
      ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))))
(assert (and
  (=
    ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) x@71@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
  (<= $Perm.No $k@72@00)
  (<= $k@72@00 $Perm.Write)
  (=> (< $Perm.No $k@72@00) (not (= x@71@00 $Ref.null)))
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
        ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :qid |qp.fvfResTrgDef34|))
  ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00)))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null))
  (and
    (not
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null))
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
      :qid |qp.fvfValDef33|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :qid |qp.fvfResTrgDef34|)))))
(assert (=>
  (not
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null))
  (and
    (=
      ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
      ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))))
    (<=
      $Perm.No
      (ite
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
        $k@72@00
        $Perm.No))
    ($PSF.loc_list ($PSF.lookup_list (sm@77@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
      :qid |qp.fvfValDef33|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :qid |qp.fvfResTrgDef34|))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null))
      (and
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
              ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
          :qid |qp.fvfValDef33|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :qid |qp.fvfResTrgDef34|))
        (forall ((s@84@00 $Snap)) (!
          (=>
            (ite
              (and
                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
              (<
                $Perm.No
                (-
                  $k@66@00
                  (ite
                    (= ($SortWrappers.$SnapTo$Ref s@84@00) x@71@00)
                    ($Perm.min
                      (ite
                        (and
                          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                        $k@66@00
                        $Perm.No)
                      $k@73@00)
                    $Perm.No)))
              false)
            (and
              (not (= s@84@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))))
          :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
          :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))
          :qid |qp.psmValDef36|))
        (forall ((s@84@00 $Snap)) (!
          (=>
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref s@84@00)
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
              (< $Perm.No $k@72@00)
              false)
            (and
              (not (= s@84@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))))
          :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
          :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))
          :qid |qp.psmValDef37|))
        (forall ((s@84@00 $Snap)) (!
          (and
            ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00) s@84@00)
            ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00) s@84@00))
          :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
          :qid |qp.psmResTrgDef38|))
        (forall ((x $Ref)) (!
          (=>
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
          :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
          :qid |quant-u-42|))
        (forall ((x $Ref)) (!
          (=>
            (not
              (=
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  (-
                    $k@66@00
                    (ite
                      (= x x@71@00)
                      ($Perm.min
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                          $k@66@00
                          $Perm.No)
                        $k@73@00)
                      $Perm.No))
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              (<
                (ite
                  (and
                    (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                  $k@80@00
                  $Perm.No)
                (-
                  $k@66@00
                  (ite
                    (= x x@71@00)
                    ($Perm.min
                      (ite
                        (and
                          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                        $k@66@00
                        $Perm.No)
                      $k@73@00)
                    $Perm.No)))
              (<
                (ite
                  (and
                    (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (= x (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                  $k@80@00
                  $Perm.No)
                $Perm.No)))
          :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
          :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
          :pattern ((Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
          :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
          :qid |qp.srp39|))
        (forall ((s@86@00 $Snap)) (!
          (=>
            (and
              (and
                (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                (< $Perm.No $k@80@00)
                (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                (<
                  $Perm.No
                  (-
                    $k@66@00
                    (ite
                      (= ($SortWrappers.$SnapTo$Ref s@86@00) x@71@00)
                      ($Perm.min
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                          $k@66@00
                          $Perm.No)
                        $k@73@00)
                      $Perm.No)))
                false))
            (and
              (not (= s@86@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))))
          :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
          :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))
          :qid |qp.psmValDef40|))
        (forall ((s@86@00 $Snap)) (!
          (=>
            (and
              (and
                (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                (< $Perm.No $k@80@00)
                (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
              (ite
                (=
                  ($SortWrappers.$SnapTo$Ref s@86@00)
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                (< $Perm.No $k@72@00)
                false))
            (and
              (not (= s@86@00 $Snap.unit))
              (=
                ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))))
          :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
          :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))
          :qid |qp.psmValDef41|))
        (forall ((s@86@00 $Snap)) (!
          (and
            ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00) s@86@00)
            ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00) s@86@00))
          :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
          :qid |qp.psmResTrgDef42|))
        (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
          akk@12@00
          1) res@13@00)))
    (or
      (not
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null))
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@88@00))
(assert (forall ((s@92@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
      (<
        $Perm.No
        (-
          $k@66@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@92@00) x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      false)
    (and
      (not (= s@92@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))))
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))
  :qid |qp.psmValDef44|)))
(assert (forall ((s@92@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00) s@92@00)
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :qid |qp.psmResTrgDef45|)))
(assert (forall ((x@87@00 $Ref)) (!
  (=>
    (and (Set_in x@87@00 xs@10@00) (< $Perm.No $k@88@00))
    (and
      (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00) x@87@00)
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00)))
  :pattern ((Set_in x@87@00 xs@10@00))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@88@00)))
    (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@94@00 $Snap)) (!
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
  :qid |qp.psmDomDef49|)))
(assert (forall ((s@94@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00)
        (< $Perm.No $k@88@00)
        (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
        (<
          $Perm.No
          (-
            $k@66@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@94@00) x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        false))
    (and
      (not (= s@94@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))))
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))
  :qid |qp.psmValDef47|)))
(assert (forall ((s@94@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00) s@94@00)
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :qid |qp.psmResTrgDef48|)))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
  (=>
    (not
      (=
        (ite
          (and
            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
          $k@66@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
      (< $k@73@00 $k@66@00)
      (< $k@73@00 $Perm.No)))
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
      (< $Perm.No $k@66@00)
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@71@00) $Snap.unit))
      (=
        ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)))))
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
  (list%trigger ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) x@71@00)
  (=
    ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
      ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))))
(assert (and
  (=
    ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) x@71@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
  (<= $Perm.No $k@72@00)
  (<= $k@72@00 $Perm.Write)
  (=> (< $Perm.No $k@72@00) (not (= x@71@00 $Ref.null)))
  (forall ((r $Ref)) (!
    (=>
      (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
        ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
    :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
    :qid |qp.fvfResTrgDef34|))
  ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00)))
(assert (=>
  (=
    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
    $Ref.null)
  (and
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null)
    (=
      ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
      $Snap.unit)
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
      :qid |qp.fvfValDef33|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :qid |qp.fvfResTrgDef34|))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null))
      (and
        (not
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
              ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
          :qid |qp.fvfValDef33|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :qid |qp.fvfResTrgDef34|))
        (forall ((x $Ref)) (!
          (=>
            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
            ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
          :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
          :qid |quant-u-47|))
        (forall ((x $Ref)) (!
          (=>
            (not
              (=
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  (-
                    $k@66@00
                    (ite
                      (= x x@71@00)
                      ($Perm.min
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                          $k@66@00
                          $Perm.No)
                        $k@73@00)
                      $Perm.No))
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              (<
                (ite
                  (and
                    (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                  $k@88@00
                  $Perm.No)
                (-
                  $k@66@00
                  (ite
                    (= x x@71@00)
                    ($Perm.min
                      (ite
                        (and
                          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                        $k@66@00
                        $Perm.No)
                      $k@73@00)
                    $Perm.No)))
              (<
                (ite
                  (and
                    (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (= x (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                  $k@88@00
                  $Perm.No)
                $Perm.No)))
          :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
          :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
          :pattern ((Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
          :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
          :qid |qp.srp46|))
        (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
          akk@12@00
          1) res@13@00)))
    (or
      (not
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null))
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null)))))
(assert (or
  (=
    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
    $Ref.null)
  (not
    (=
      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
      $Ref.null))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(x@71@00 in xs@10@00 && x@71@00 == y@11@00)]
(assert (not (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@72@00))
(assert ($Perm.isReadVar $k@73@00))
(assert ($Perm.isReadVar $k@80@00))
(assert (forall ((x@79@00 $Ref)) (!
  (=>
    (and (Set_in x@79@00 xs@10@00) (< $Perm.No $k@80@00))
    (and
      (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00) x@79@00)
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00)))
  :pattern ((Set_in x@79@00 xs@10@00))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@80@00)))
    (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@86@00 $Snap)) (!
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
  :qid |qp.psmDomDef43|)))
(assert ($Perm.isReadVar $k@88@00))
(assert (forall ((s@92@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
      (<
        $Perm.No
        (-
          $k@66@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@92@00) x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      false)
    (and
      (not (= s@92@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))))
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))
  :qid |qp.psmValDef44|)))
(assert (forall ((s@92@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00) s@92@00)
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :qid |qp.psmResTrgDef45|)))
(assert (forall ((x@87@00 $Ref)) (!
  (=>
    (and (Set_in x@87@00 xs@10@00) (< $Perm.No $k@88@00))
    (and
      (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00) x@87@00)
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00)))
  :pattern ((Set_in x@87@00 xs@10@00))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@88@00)))
    (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@94@00 $Snap)) (!
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
  :qid |qp.psmDomDef49|)))
(assert (forall ((s@94@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00)
        (< $Perm.No $k@88@00)
        (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
        (<
          $Perm.No
          (-
            $k@66@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@94@00) x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        false))
    (and
      (not (= s@94@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))))
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))
  :qid |qp.psmValDef47|)))
(assert (forall ((s@94@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00) s@94@00)
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :qid |qp.psmResTrgDef48|)))
(assert (=>
  (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))
  (and
    (Set_in x@71@00 xs@10@00)
    (= x@71@00 y@11@00)
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null))
      (=
        (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
        (ite
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (= res@13@00 akk@12@00)
          (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
            akk@12@00
            1) res@13@00))))
    (=>
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null)
      (=
        (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
        (ite
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (= res@13@00 akk@12@00)
          (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
            akk@12@00
            1) res@13@00))))
    ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
    (=>
      (not
        (=
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
            $k@66@00
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
        (< $k@73@00 $k@66@00)
        (< $k@73@00 $Perm.No)))
    (=>
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
        (< $Perm.No $k@66@00)
        false)
      (and
        (not (= ($SortWrappers.$RefTo$Snap x@71@00) $Snap.unit))
        (=
          ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)))))
    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
    (list%trigger ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) x@71@00)
    (=
      ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
        ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
    (=
      ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) x@71@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
    (<= $Perm.No $k@72@00)
    (<= $k@72@00 $Perm.Write)
    (=> (< $Perm.No $k@72@00) (not (= x@71@00 $Ref.null)))
    (forall ((r $Ref)) (!
      (=>
        (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
      :qid |qp.fvfValDef33|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :qid |qp.fvfResTrgDef34|))
    ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00)
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null))
      (and
        (not
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
              ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
          :qid |qp.fvfValDef33|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :qid |qp.fvfResTrgDef34|))))
    (=>
      (not
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null))
      (and
        (=
          ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
          ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))))
        (<=
          $Perm.No
          (ite
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
            $k@72@00
            $Perm.No))
        ($PSF.loc_list ($PSF.lookup_list (sm@77@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
              ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
          :qid |qp.fvfValDef33|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :qid |qp.fvfResTrgDef34|))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (and
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))
            (forall ((s@84@00 $Snap)) (!
              (=>
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                  (<
                    $Perm.No
                    (-
                      $k@66@00
                      (ite
                        (= ($SortWrappers.$SnapTo$Ref s@84@00) x@71@00)
                        ($Perm.min
                          (ite
                            (and
                              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                            $k@66@00
                            $Perm.No)
                          $k@73@00)
                        $Perm.No)))
                  false)
                (and
                  (not (= s@84@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                    ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))))
              :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
              :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))
              :qid |qp.psmValDef36|))
            (forall ((s@84@00 $Snap)) (!
              (=>
                (ite
                  (=
                    ($SortWrappers.$SnapTo$Ref s@84@00)
                    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                  (< $Perm.No $k@72@00)
                  false)
                (and
                  (not (= s@84@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                    ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))))
              :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
              :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))
              :qid |qp.psmValDef37|))
            (forall ((s@84@00 $Snap)) (!
              (and
                ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00) s@84@00)
                ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00) s@84@00))
              :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
              :qid |qp.psmResTrgDef38|))
            (forall ((x $Ref)) (!
              (=>
                (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
              :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
              :qid |quant-u-42|))
            (forall ((x $Ref)) (!
              (=>
                (not
                  (=
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      (-
                        $k@66@00
                        (ite
                          (= x x@71@00)
                          ($Perm.min
                            (ite
                              (and
                                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                              $k@66@00
                              $Perm.No)
                            $k@73@00)
                          $Perm.No))
                      $Perm.No)
                    $Perm.No))
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  (<
                    (ite
                      (and
                        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (=
                          x
                          (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                      $k@80@00
                      $Perm.No)
                    (-
                      $k@66@00
                      (ite
                        (= x x@71@00)
                        ($Perm.min
                          (ite
                            (and
                              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                            $k@66@00
                            $Perm.No)
                          $k@73@00)
                        $Perm.No)))
                  (<
                    (ite
                      (and
                        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (=
                          x
                          (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                      $k@80@00
                      $Perm.No)
                    $Perm.No)))
              :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
              :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              :pattern ((Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
              :qid |qp.srp39|))
            (forall ((s@86@00 $Snap)) (!
              (=>
                (and
                  (and
                    (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                    (< $Perm.No $k@80@00)
                    (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
                  (ite
                    (and
                      (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                      (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                    (<
                      $Perm.No
                      (-
                        $k@66@00
                        (ite
                          (= ($SortWrappers.$SnapTo$Ref s@86@00) x@71@00)
                          ($Perm.min
                            (ite
                              (and
                                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                              $k@66@00
                              $Perm.No)
                            $k@73@00)
                          $Perm.No)))
                    false))
                (and
                  (not (= s@86@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                    ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))))
              :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
              :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))
              :qid |qp.psmValDef40|))
            (forall ((s@86@00 $Snap)) (!
              (=>
                (and
                  (and
                    (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                    (< $Perm.No $k@80@00)
                    (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
                  (ite
                    (=
                      ($SortWrappers.$SnapTo$Ref s@86@00)
                      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                    (< $Perm.No $k@72@00)
                    false))
                (and
                  (not (= s@86@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                    ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))))
              :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
              :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))
              :qid |qp.psmValDef41|))
            (forall ((s@86@00 $Snap)) (!
              (and
                ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00) s@86@00)
                ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00) s@86@00))
              :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
              :qid |qp.psmResTrgDef42|))
            (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
              akk@12@00
              1) res@13@00)))
        (or
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null))))
    (=>
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null)
      (and
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null)
        (=
          ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
              ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
          :qid |qp.fvfValDef33|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :qid |qp.fvfResTrgDef34|))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))
            (forall ((x $Ref)) (!
              (=>
                (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
              :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
              :qid |quant-u-47|))
            (forall ((x $Ref)) (!
              (=>
                (not
                  (=
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      (-
                        $k@66@00
                        (ite
                          (= x x@71@00)
                          ($Perm.min
                            (ite
                              (and
                                (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                              $k@66@00
                              $Perm.No)
                            $k@73@00)
                          $Perm.No))
                      $Perm.No)
                    $Perm.No))
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  (<
                    (ite
                      (and
                        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                        (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (=
                          x
                          (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                      $k@88@00
                      $Perm.No)
                    (-
                      $k@66@00
                      (ite
                        (= x x@71@00)
                        ($Perm.min
                          (ite
                            (and
                              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                            $k@66@00
                            $Perm.No)
                          $k@73@00)
                        $Perm.No)))
                  (<
                    (ite
                      (and
                        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                        (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (=
                          x
                          (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                      $k@88@00
                      $Perm.No)
                    $Perm.No)))
              :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
              :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              :pattern ((Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
              :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
              :qid |qp.srp46|))
            (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
              akk@12@00
              1) res@13@00)))
        (or
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null))))
    (or
      (=
        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
        $Ref.null)
      (not
        (=
          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
          $Ref.null))))))
; Joined path conditions
(assert (or
  (not (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00)))
  (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))))
; Definitional axioms for snapshot map values
(declare-fun sm@96@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@72@00))
(assert ($Perm.isReadVar $k@73@00))
(assert ($Perm.isReadVar $k@80@00))
(assert (forall ((x@79@00 $Ref)) (!
  (=>
    (and (Set_in x@79@00 xs@10@00) (< $Perm.No $k@80@00))
    (and
      (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00) x@79@00)
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00)))
  :pattern ((Set_in x@79@00 xs@10@00))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@80@00)))
    (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@86@00 $Snap)) (!
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
  :qid |qp.psmDomDef43|)))
(assert ($Perm.isReadVar $k@88@00))
(assert (forall ((s@92@00 $Snap)) (!
  (=>
    (ite
      (and
        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
      (<
        $Perm.No
        (-
          $k@66@00
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@92@00) x@71@00)
            ($Perm.min
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00))
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00))
                $k@66@00
                $Perm.No)
              $k@73@00)
            $Perm.No)))
      false)
    (and
      (not (= s@92@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))))
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00))
  :qid |qp.psmValDef44|)))
(assert (forall ((s@92@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00) s@92@00)
  :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
  :qid |qp.psmResTrgDef45|)))
(assert (forall ((x@87@00 $Ref)) (!
  (=>
    (and (Set_in x@87@00 xs@10@00) (< $Perm.No $k@88@00))
    (and
      (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00) x@87@00)
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00)))
  :pattern ((Set_in x@87@00 xs@10@00))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@87@00))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
        (< $Perm.No $k@88@00)))
    (= (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@94@00 $Snap)) (!
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
  :qid |qp.psmDomDef49|)))
(assert (forall ((s@94@00 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00)
        (< $Perm.No $k@88@00)
        (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)))
      (ite
        (and
          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
        (<
          $Perm.No
          (-
            $k@66@00
            (ite
              (= ($SortWrappers.$SnapTo$Ref s@94@00) x@71@00)
              ($Perm.min
                (ite
                  (and
                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00))
                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@94@00)) xs@10@00))
                  $k@66@00
                  $Perm.No)
                $k@73@00)
              $Perm.No)))
        false))
    (and
      (not (= s@94@00 $Snap.unit))
      (=
        ($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))))
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00))
  :qid |qp.psmValDef47|)))
(assert (forall ((s@94@00 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@94@00) s@94@00)
  :pattern (($PSF.lookup_list (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@94@00))
  :qid |qp.psmResTrgDef48|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@71@00 $Ref)) (!
  (and
    (or (Set_in x@71@00 xs@10@00) (not (Set_in x@71@00 xs@10@00)))
    (=>
      (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))
      (and
        (Set_in x@71@00 xs@10@00)
        (= x@71@00 y@11@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (=
            (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
            (ite
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null)
              (= res@13@00 akk@12@00)
              (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                akk@12@00
                1) res@13@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (=
            (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
            (ite
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null)
              (= res@13@00 akk@12@00)
              (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                akk@12@00
                1) res@13@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
        (=>
          (not
            (=
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
                $k@66@00
                $Perm.No)
              $Perm.No))
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
            (< $k@73@00 $k@66@00)
            (< $k@73@00 $Perm.No)))
        (=>
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
            (< $Perm.No $k@66@00)
            false)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@71@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)))))
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
        (list%trigger ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) x@71@00)
        (=
          ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
            ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
        (=
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) x@71@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
        (<= $Perm.No $k@72@00)
        (<= $k@72@00 $Perm.Write)
        (=> (< $Perm.No $k@72@00) (not (= x@71@00 $Ref.null)))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
              ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
          :qid |qp.fvfValDef33|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :qid |qp.fvfResTrgDef34|))
        ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
              ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                $k@72@00
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@77@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                    (=
                      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                      ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
                  :qid |qp.fvfValDef33|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :qid |qp.fvfResTrgDef34|))
                (forall ((s@84@00 $Snap)) (!
                  (=>
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                      (<
                        $Perm.No
                        (-
                          $k@66@00
                          (ite
                            (= ($SortWrappers.$SnapTo$Ref s@84@00) x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      false)
                    (and
                      (not (= s@84@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))
                  :qid |qp.psmValDef36|))
                (forall ((s@84@00 $Snap)) (!
                  (=>
                    (ite
                      (=
                        ($SortWrappers.$SnapTo$Ref s@84@00)
                        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                      (< $Perm.No $k@72@00)
                      false)
                    (and
                      (not (= s@84@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                        ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))
                  :qid |qp.psmValDef37|))
                (forall ((s@84@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00) s@84@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00) s@84@00))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :qid |qp.psmResTrgDef38|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |quant-u-42|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                          (-
                            $k@66@00
                            (ite
                              (= x x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@80@00
                          $Perm.No)
                        (-
                          $k@66@00
                          (ite
                            (= x x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@80@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |qp.srp39|))
                (forall ((s@86@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                        (< $Perm.No $k@80@00)
                        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
                      (ite
                        (and
                          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                        (<
                          $Perm.No
                          (-
                            $k@66@00
                            (ite
                              (= ($SortWrappers.$SnapTo$Ref s@86@00) x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No)))
                        false))
                    (and
                      (not (= s@86@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))
                  :qid |qp.psmValDef40|))
                (forall ((s@86@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                        (< $Perm.No $k@80@00)
                        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
                      (ite
                        (=
                          ($SortWrappers.$SnapTo$Ref s@86@00)
                          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                        (< $Perm.No $k@72@00)
                        false))
                    (and
                      (not (= s@86@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                        ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))
                  :qid |qp.psmValDef41|))
                (forall ((s@86@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00) s@86@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00) s@86@00))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :qid |qp.psmResTrgDef42|))
                (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                  akk@12@00
                  1) res@13@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                    (=
                      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                      ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
                  :qid |qp.fvfValDef33|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :qid |qp.fvfResTrgDef34|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |quant-u-47|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                          (-
                            $k@66@00
                            (ite
                              (= x x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@88@00
                          $Perm.No)
                        (-
                          $k@66@00
                          (ite
                            (= x x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@88@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |qp.srp46|))
                (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                  akk@12@00
                  1) res@13@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00)))
      (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))))
  :pattern ((Set_in x@71@00 xs@10@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@143@3@148@51-aux|)))
(assert (forall ((x@71@00 $Ref)) (!
  (and
    (or (Set_in x@71@00 xs@10@00) (not (Set_in x@71@00 xs@10@00)))
    (=>
      (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))
      (and
        (Set_in x@71@00 xs@10@00)
        (= x@71@00 y@11@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (=
            (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
            (ite
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null)
              (= res@13@00 akk@12@00)
              (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                akk@12@00
                1) res@13@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (=
            (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
            (ite
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null)
              (= res@13@00 akk@12@00)
              (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                akk@12@00
                1) res@13@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
        (=>
          (not
            (=
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
                $k@66@00
                $Perm.No)
              $Perm.No))
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
            (< $k@73@00 $k@66@00)
            (< $k@73@00 $Perm.No)))
        (=>
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
            (< $Perm.No $k@66@00)
            false)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@71@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)))))
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
        (list%trigger ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) x@71@00)
        (=
          ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
            ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
        (=
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) x@71@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
        (<= $Perm.No $k@72@00)
        (<= $k@72@00 $Perm.Write)
        (=> (< $Perm.No $k@72@00) (not (= x@71@00 $Ref.null)))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
              ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
          :qid |qp.fvfValDef33|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :qid |qp.fvfResTrgDef34|))
        ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
              ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                $k@72@00
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@77@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                    (=
                      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                      ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
                  :qid |qp.fvfValDef33|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :qid |qp.fvfResTrgDef34|))
                (forall ((s@84@00 $Snap)) (!
                  (=>
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                      (<
                        $Perm.No
                        (-
                          $k@66@00
                          (ite
                            (= ($SortWrappers.$SnapTo$Ref s@84@00) x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      false)
                    (and
                      (not (= s@84@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))
                  :qid |qp.psmValDef36|))
                (forall ((s@84@00 $Snap)) (!
                  (=>
                    (ite
                      (=
                        ($SortWrappers.$SnapTo$Ref s@84@00)
                        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                      (< $Perm.No $k@72@00)
                      false)
                    (and
                      (not (= s@84@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                        ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))
                  :qid |qp.psmValDef37|))
                (forall ((s@84@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00) s@84@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00) s@84@00))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :qid |qp.psmResTrgDef38|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |quant-u-42|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                          (-
                            $k@66@00
                            (ite
                              (= x x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@80@00
                          $Perm.No)
                        (-
                          $k@66@00
                          (ite
                            (= x x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@80@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |qp.srp39|))
                (forall ((s@86@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                        (< $Perm.No $k@80@00)
                        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
                      (ite
                        (and
                          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                        (<
                          $Perm.No
                          (-
                            $k@66@00
                            (ite
                              (= ($SortWrappers.$SnapTo$Ref s@86@00) x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No)))
                        false))
                    (and
                      (not (= s@86@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))
                  :qid |qp.psmValDef40|))
                (forall ((s@86@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                        (< $Perm.No $k@80@00)
                        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
                      (ite
                        (=
                          ($SortWrappers.$SnapTo$Ref s@86@00)
                          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                        (< $Perm.No $k@72@00)
                        false))
                    (and
                      (not (= s@86@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                        ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))
                  :qid |qp.psmValDef41|))
                (forall ((s@86@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00) s@86@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00) s@86@00))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :qid |qp.psmResTrgDef42|))
                (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                  akk@12@00
                  1) res@13@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                    (=
                      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                      ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
                  :qid |qp.fvfValDef33|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :qid |qp.fvfResTrgDef34|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |quant-u-47|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                          (-
                            $k@66@00
                            (ite
                              (= x x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@88@00
                          $Perm.No)
                        (-
                          $k@66@00
                          (ite
                            (= x x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@88@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |qp.srp46|))
                (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                  akk@12@00
                  1) res@13@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00)))
      (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))))
  :pattern (($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@143@3@148@51-aux|)))
(assert (forall ((x@71@00 $Ref)) (!
  (and
    (or (Set_in x@71@00 xs@10@00) (not (Set_in x@71@00 xs@10@00)))
    (=>
      (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))
      (and
        (Set_in x@71@00 xs@10@00)
        (= x@71@00 y@11@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (=
            (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
            (ite
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null)
              (= res@13@00 akk@12@00)
              (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                akk@12@00
                1) res@13@00))))
        (=>
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (=
            (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
            (ite
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null)
              (= res@13@00 akk@12@00)
              (length2_impl ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                akk@12@00
                1) res@13@00))))
        ($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
        (=>
          (not
            (=
              (ite
                (and
                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
                $k@66@00
                $Perm.No)
              $Perm.No))
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
            (< $k@73@00 $k@66@00)
            (< $k@73@00 $Perm.No)))
        (=>
          (ite
            (and
              (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00)
              (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) xs@10@00))
            (< $Perm.No $k@66@00)
            false)
          (and
            (not (= ($SortWrappers.$RefTo$Snap x@71@00) $Snap.unit))
            (=
              ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)))))
        ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00))
        (list%trigger ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) x@71@00)
        (=
          ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
            ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
        (=
          ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) x@71@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))))
        (<= $Perm.No $k@72@00)
        (<= $k@72@00 $Perm.Write)
        (=> (< $Perm.No $k@72@00) (not (= x@71@00 $Ref.null)))
        (forall ((r $Ref)) (!
          (=>
            (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
              ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
          :qid |qp.fvfValDef33|))
        (forall ((r $Ref)) (!
          ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
          :qid |qp.fvfResTrgDef34|))
        ($FVF.loc_next ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00)
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (and
            (not
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))))
        (=>
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
              ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00))))
            (<=
              $Perm.No
              (ite
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                $k@72@00
                $Perm.No))
            ($PSF.loc_list ($PSF.lookup_list (sm@77@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)))
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (and
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                    (=
                      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                      ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
                  :qid |qp.fvfValDef33|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :qid |qp.fvfResTrgDef34|))
                (forall ((s@84@00 $Snap)) (!
                  (=>
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                      (<
                        $Perm.No
                        (-
                          $k@66@00
                          (ite
                            (= ($SortWrappers.$SnapTo$Ref s@84@00) x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00))
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@84@00)) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      false)
                    (and
                      (not (= s@84@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00))
                  :qid |qp.psmValDef36|))
                (forall ((s@84@00 $Snap)) (!
                  (=>
                    (ite
                      (=
                        ($SortWrappers.$SnapTo$Ref s@84@00)
                        ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                      (< $Perm.No $k@72@00)
                      false)
                    (and
                      (not (= s@84@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00)
                        ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00))
                  :qid |qp.psmValDef37|))
                (forall ((s@84@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@84@00) s@84@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@84@00) s@84@00))
                  :pattern (($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@84@00))
                  :qid |qp.psmResTrgDef38|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@83@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |quant-u-42|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                          (-
                            $k@66@00
                            (ite
                              (= x x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@80@00
                          $Perm.No)
                        (-
                          $k@66@00
                          (ite
                            (= x x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@80@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |qp.srp39|))
                (forall ((s@86@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                        (< $Perm.No $k@80@00)
                        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
                      (ite
                        (and
                          (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                          (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                        (<
                          $Perm.No
                          (-
                            $k@66@00
                            (ite
                              (= ($SortWrappers.$SnapTo$Ref s@86@00) x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00))
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No)))
                        false))
                    (and
                      (not (= s@86@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00))
                  :qid |qp.psmValDef40|))
                (forall ((s@86@00 $Snap)) (!
                  (=>
                    (and
                      (and
                        (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)) xs@10@00)
                        (< $Perm.No $k@80@00)
                        (img@82@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@86@00)))
                      (ite
                        (=
                          ($SortWrappers.$SnapTo$Ref s@86@00)
                          ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00))
                        (< $Perm.No $k@72@00)
                        false))
                    (and
                      (not (= s@86@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00)
                        ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :pattern (($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00))
                  :qid |qp.psmValDef41|))
                (forall ((s@86@00 $Snap)) (!
                  (and
                    ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@86@00) s@86@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@76@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) s@86@00) s@86@00))
                  :pattern (($PSF.lookup_list (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@86@00))
                  :qid |qp.psmResTrgDef42|))
                (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@85@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                  akk@12@00
                  1) res@13@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))))
        (=>
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (and
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null)
            (=
              ($Snap.second ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)))
              $Snap.unit)
            (forall ((r $Ref)) (!
              (=>
                (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                  ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
              :qid |qp.fvfValDef33|))
            (forall ((r $Ref)) (!
              ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
              :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
              :qid |qp.fvfResTrgDef34|))
            (=>
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                    $Ref.null))
                (forall ((r $Ref)) (!
                  (=>
                    (ite (= r x@71@00) (< $Perm.No $k@72@00) false)
                    (=
                      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r)
                      ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r)))
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :pattern (($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r))
                  :qid |qp.fvfValDef33|))
                (forall ((r $Ref)) (!
                  ($FVF.loc_next ($FVF.lookup_next (sm@74@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00) r) r)
                  :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
                  :qid |qp.fvfResTrgDef34|))
                (forall ((x $Ref)) (!
                  (=>
                    (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                    ($PSF.loc_list ($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
                  :pattern ((inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |quant-u-47|))
                (forall ((x $Ref)) (!
                  (=>
                    (not
                      (=
                        (ite
                          (and
                            (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                          (-
                            $k@66@00
                            (ite
                              (= x x@71@00)
                              ($Perm.min
                                (ite
                                  (and
                                    (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                    (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                  $k@66@00
                                  $Perm.No)
                                $k@73@00)
                              $Perm.No))
                          $Perm.No)
                        $Perm.No))
                    (ite
                      (and
                        (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                        (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                      (<
                        (ite
                          (and
                            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@88@00
                          $Perm.No)
                        (-
                          $k@66@00
                          (ite
                            (= x x@71@00)
                            ($Perm.min
                              (ite
                                (and
                                  (img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                                  (Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                                $k@66@00
                                $Perm.No)
                              $k@73@00)
                            $Perm.No)))
                      (<
                        (ite
                          (and
                            (Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
                            (img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)
                            (=
                              x
                              (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x)))
                          $k@88@00
                          $Perm.No)
                        $Perm.No)))
                  :pattern ((img@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :pattern ((Set_in (inv@67@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((Set_in (inv@89@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00))
                  :pattern ((img@90@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
                  :qid |qp.srp46|))
                (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (sm@93@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) (+
                  akk@12@00
                  1) res@13@00)))
            (or
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
                $Ref.null))))
        (or
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00)
              $Ref.null)))))
    (or
      (not (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00)))
      (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (sm@96@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@143@3@148@51-aux|)))
(assert (=
  result@14@00
  (forall ((x@71@00 $Ref)) (!
    (=>
      (and (Set_in x@71@00 xs@10@00) (= x@71@00 y@11@00))
      (joined_unfolding@95@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@71@00))
    :pattern ((Set_in x@71@00 xs@10@00))
    :pattern (($PSF.loc_list ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x@71@00)) ($SortWrappers.$RefTo$Snap x@71@00)))
    :pattern (($FVF.loc_next ($FVF.lookup_next (sm@96@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x@71@00) x@71@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@143@3@148@51|))))
(pop) ; 1
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
; ---------- FUNCTION foo----------
(declare-fun l@15@00 () $Ref)
(declare-fun i@16@00 () Int)
(declare-fun result@17@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-fun sm@97@00 ($Snap $Ref Int) $PSF<list2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap i@16@00)))
  s@$))
(declare-fun sm@98@00 ($Snap $Ref Int) $PSF<list2>)
(declare-const s@99@00 $Snap)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap i@16@00))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap i@16@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (= (foo%limited s@$ l@15@00 i@16@00) (foo s@$ l@15@00 i@16@00))
  :pattern ((foo s@$ l@15@00 i@16@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (foo%stateless l@15@00 i@16@00)
  :pattern ((foo%limited s@$ l@15@00 i@16@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (=
  ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap i@16@00)))
  s@$))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap i@16@00))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap i@16@00))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall j: Int :: { list2(l, j) } { foo(l.next, j) } i == j ==> (unfolding acc(list2(l, j), write) in (l.next == null ? true : foo(l.next, j))))
(declare-const j@100@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] i == j ==> (unfolding acc(list2(l, j), write) in (l.next == null ? true : foo(l.next, j)))
; [eval] i == j
(push) ; 3
; [then-branch: 15 | i@16@00 == j@100@00 | live]
; [else-branch: 15 | i@16@00 != j@100@00 | live]
(push) ; 4
; [then-branch: 15 | i@16@00 == j@100@00]
(assert (= i@16@00 j@100@00))
; [eval] (unfolding acc(list2(l, j), write) in (l.next == null ? true : foo(l.next, j)))
(push) ; 5
(declare-fun sm@101@00 ($Snap $Ref Int) $PSF<list2>)
(declare-const s@102@00 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@102@00 $Snap)) (!
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
  :qid |qp.psmValDef52|)))
(assert (forall ((s@102@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) s@102@00) s@102@00)
  :pattern (($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) s@102@00))
  :qid |qp.psmResTrgDef53|)))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap j@100@00))))
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
(assert (not (= (- $Perm.Write (ite (= i@16@00 j@100@00) $Perm.Write $Perm.No)) $Perm.No)))
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
    (and (= this l@15@00) (= i j@100@00))
    (=
      (-
        $Perm.Write
        (ite
          (and (= this l@15@00) (= i j@100@00))
          ($Perm.min
            (ite (and (= this l@15@00) (= i i@16@00)) $Perm.Write $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= j@100@00 i@16@00)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))
        $Snap.unit))
    (=
      ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))
      ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap j@100@00))))
(assert (list2%trigger ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap j@100@00))) l@15@00 j@100@00))
(assert (=
  ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))
    ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))))
(assert (not (= l@15@00 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))))
; [eval] this.next != null
; [then-branch: 16 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) != Null | live]
; [else-branch: 16 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))
    $Ref.null)))
(declare-fun sm@103@00 ($Snap $Ref Int Int) $PSF<list2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00)))
  ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))))
    $Perm.Write
    $Perm.No)))
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))))
; [eval] (l.next == null ? true : foo(l.next, j))
; [eval] l.next == null
(push) ; 7
; [then-branch: 17 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) == Null | live]
; [else-branch: 17 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) != Null | live]
(push) ; 8
; [then-branch: 17 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))))))
  $Ref.null))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) != Null]
; [eval] foo(l.next, j)
(push) ; 9
(declare-fun sm@104@00 ($Snap $Ref Int) $PSF<list2>)
(declare-const s@105@00 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@105@00 $Snap)) (!
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@105@00))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))))
      (= ($SortWrappers.$SnapToInt ($Snap.second s@105@00)) j@100@00))
    (and
      (not (= s@105@00 $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00)
        ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))))
  :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
  :pattern (($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))
  :qid |qp.psmValDef54|)))
(assert (forall ((s@105@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00) s@105@00)
  :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
  :qid |qp.psmResTrgDef55|)))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))))
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
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))))
      ($Perm.min
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))))
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
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))))
      (= i j@100@00))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (=
              this
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))))
            (= i j@100@00))
          ($Perm.min
            (ite
              (and
                (=
                  this
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))))
                (= i j@100@00))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-58|))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00))
        $Snap.unit))
    (=
      ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))
        ($SortWrappers.IntTo$Snap j@100@00)))
      ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))
        ($SortWrappers.IntTo$Snap j@100@00)))))))
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))))
(assert (foo%precondition ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))
(pop) ; 9
; Joined path conditions
(assert (and
  (forall ((s@105@00 $Snap)) (!
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first s@105@00))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))))
        (= ($SortWrappers.$SnapToInt ($Snap.second s@105@00)) j@100@00))
      (and
        (not (= s@105@00 $Snap.unit))
        (=
          ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00)
          ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))))
    :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
    :pattern (($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))
    :qid |qp.psmValDef54|))
  (forall ((s@105@00 $Snap)) (!
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00) s@105@00)
    :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
    :qid |qp.psmResTrgDef55|))
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00)))
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))
            ($SortWrappers.IntTo$Snap j@100@00))
          $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00)))
        ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00))))))
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00)))
  (foo%precondition ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      $Ref.null))
  (and
    (forall ((s@105@00 $Snap)) (!
      (=>
        (and
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first s@105@00))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))))
          (= ($SortWrappers.$SnapToInt ($Snap.second s@105@00)) j@100@00))
        (and
          (not (= s@105@00 $Snap.unit))
          (=
            ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00)
            ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))))
      :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
      :pattern (($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))
      :qid |qp.psmValDef54|))
    (forall ((s@105@00 $Snap)) (!
      ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00) s@105@00)
      :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
      :qid |qp.psmResTrgDef55|))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00))
            $Snap.unit))
        (=
          ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))
            ($SortWrappers.IntTo$Snap j@100@00)))
          ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))
            ($SortWrappers.IntTo$Snap j@100@00))))))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00)))
    (foo%precondition ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))))
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))
    $Ref.null)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 16 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  $Snap.unit))
; [eval] (l.next == null ? true : foo(l.next, j))
; [eval] l.next == null
(push) ; 7
; [then-branch: 18 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) == Null | live]
; [else-branch: 18 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) != Null | live]
(push) ; 8
; [then-branch: 18 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) == Null]
(pop) ; 8
(push) ; 8
; [else-branch: 18 | First:(Second:(PredicateLookup(list2, sm@101@00(s@$, l@15@00, i@16@00), List(l@15@00, j@100@00)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))
    $Ref.null)))
; [eval] foo(l.next, j)
(push) ; 9
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))))
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
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))))
      (= i j@100@00))
    false)
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (foo%precondition ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))
  ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@15@00)
  ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))
(pop) ; 9
; Joined path conditions
(assert (and
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00)))
  (foo%precondition ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        $Ref.null))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00)))
    (foo%precondition ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))))
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))
    $Ref.null)))
(pop) ; 6
(pop) ; 5
(declare-fun joined_unfolding@106@00 ($Snap $Ref Int Int) Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      $Ref.null))
  (=
    (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        $Ref.null)
      true
      (foo ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))
        ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))
    $Ref.null)
  (=
    (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        $Ref.null)
      true
      (foo ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))
        ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))))
; Joined path conditions
(assert (forall ((s@102@00 $Snap)) (!
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
  :qid |qp.psmValDef52|)))
(assert (forall ((s@102@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) s@102@00) s@102@00)
  :pattern (($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) s@102@00))
  :qid |qp.psmResTrgDef53|)))
(assert (and
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))
  (=>
    (= j@100@00 i@16@00)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))
          $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))
        ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))
  (list2%trigger ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))) l@15@00 j@100@00)
  (=
    ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))
      ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
  (not (= l@15@00 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      $Ref.null))
  (and
    (=
      ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))
        ($SortWrappers.IntTo$Snap j@100@00)))
      ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
    (<=
      $Perm.No
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))))
        $Perm.Write
        $Perm.No))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          $Ref.null))
      (and
        (forall ((s@105@00 $Snap)) (!
          (=>
            (and
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first s@105@00))
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))))
              (= ($SortWrappers.$SnapToInt ($Snap.second s@105@00)) j@100@00))
            (and
              (not (= s@105@00 $Snap.unit))
              (=
                ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00)
                ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))))
          :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
          :pattern (($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))
          :qid |qp.psmValDef54|))
        (forall ((s@105@00 $Snap)) (!
          ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00) s@105@00)
          :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
          :qid |qp.psmResTrgDef55|))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))
                $Snap.unit))
            (=
              ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))
                ($SortWrappers.IntTo$Snap j@100@00)))
              ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))
                ($SortWrappers.IntTo$Snap j@100@00))))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00)))
        (foo%precondition ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          $Ref.null))
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        $Ref.null)))))
; Joined path conditions
(assert (and
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))
  (=>
    (= j@100@00 i@16@00)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))
          $Snap.unit))
      (=
        ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))
        ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))
  (list2%trigger ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))) l@15@00 j@100@00)
  (=
    ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))
      ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
  (not (= l@15@00 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00)))
        (foo%precondition ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          $Ref.null))
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        $Ref.null)))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))))
      $Ref.null))))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | i@16@00 != j@100@00]
(assert (not (= i@16@00 j@100@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((s@102@00 $Snap)) (!
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
  :qid |qp.psmValDef52|)))
(assert (forall ((s@102@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) s@102@00) s@102@00)
  :pattern (($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) s@102@00))
  :qid |qp.psmResTrgDef53|)))
(assert (=>
  (= i@16@00 j@100@00)
  (and
    (= i@16@00 j@100@00)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          $Ref.null))
      (=
        (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null)
          true
          (foo ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))
            ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        $Ref.null)
      (=
        (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null)
          true
          (foo ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))
            ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))
    (=>
      (= j@100@00 i@16@00)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))
            $Snap.unit))
        (=
          ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))
          ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
    ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))
    (list2%trigger ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))) l@15@00 j@100@00)
    (=
      ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))
        ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
    (not (= l@15@00 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))
        ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          $Ref.null))
      (and
        (=
          ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))
            ($SortWrappers.IntTo$Snap j@100@00)))
          ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
        (<=
          $Perm.No
          (ite
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))))
            $Perm.Write
            $Perm.No))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          ($SortWrappers.IntTo$Snap j@100@00)))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null))
          (and
            (forall ((s@105@00 $Snap)) (!
              (=>
                (and
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first s@105@00))
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00)))))))
                  (= ($SortWrappers.$SnapToInt ($Snap.second s@105@00)) j@100@00))
                (and
                  (not (= s@105@00 $Snap.unit))
                  (=
                    ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00)
                    ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))))
              :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
              :pattern (($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))
              :qid |qp.psmValDef54|))
            (forall ((s@105@00 $Snap)) (!
              ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00) s@105@00)
              :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
              :qid |qp.psmResTrgDef55|))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00)))
            (=>
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))))
              (and
                (not
                  (=
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                        ($SortWrappers.$RefTo$Snap l@15@00)
                        ($SortWrappers.IntTo$Snap j@100@00)))))
                      ($SortWrappers.IntTo$Snap j@100@00))
                    $Snap.unit))
                (=
                  ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00)))))
                    ($SortWrappers.IntTo$Snap j@100@00)))
                  ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
                    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00)))))
                    ($SortWrappers.IntTo$Snap j@100@00))))))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00)))
            (foo%precondition ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))))
          $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00)))
            (foo%precondition ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null))))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))))
          $Ref.null))))))
; Joined path conditions
(assert (or (not (= i@16@00 j@100@00)) (= i@16@00 j@100@00)))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((s@102@00 $Snap)) (!
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
  :qid |qp.psmValDef52|)))
(assert (forall ((s@102@00 $Snap)) (!
  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) s@102@00) s@102@00)
  :pattern (($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) s@102@00))
  :qid |qp.psmResTrgDef53|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@100@00 Int)) (!
  (and
    (=>
      (= i@16@00 j@100@00)
      (and
        (= i@16@00 j@100@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null))
          (=
            (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null)
              true
              (foo ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))
                ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null)
          (=
            (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null)
              true
              (foo ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))
                ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))
        (=>
          (= j@100@00 i@16@00)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))
                $Snap.unit))
            (=
              ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))
              ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))
        (list2%trigger ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))) l@15@00 j@100@00)
        (=
          ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))
            ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
        (not (= l@15@00 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))
            ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))
                ($SortWrappers.IntTo$Snap j@100@00)))
              ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
            (<=
              $Perm.No
              (ite
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))))
                $Perm.Write
                $Perm.No))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00)))
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  $Ref.null))
              (and
                (forall ((s@105@00 $Snap)) (!
                  (=>
                    (and
                      (=
                        ($SortWrappers.$SnapTo$Ref ($Snap.first s@105@00))
                        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@15@00)
                          ($SortWrappers.IntTo$Snap j@100@00)))))))
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.second s@105@00))
                        j@100@00))
                    (and
                      (not (= s@105@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00)
                        ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))))
                  :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
                  :pattern (($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))
                  :qid |qp.psmValDef54|))
                (forall ((s@105@00 $Snap)) (!
                  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00) s@105@00)
                  :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
                  :qid |qp.psmResTrgDef55|))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00)))
                (=>
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00))))))
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00)))))))
                  (and
                    (not
                      (=
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                            ($SortWrappers.$RefTo$Snap l@15@00)
                            ($SortWrappers.IntTo$Snap j@100@00)))))
                          ($SortWrappers.IntTo$Snap j@100@00))
                        $Snap.unit))
                    (=
                      ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@15@00)
                          ($SortWrappers.IntTo$Snap j@100@00)))))
                        ($SortWrappers.IntTo$Snap j@100@00)))
                      ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
                        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@15@00)
                          ($SortWrappers.IntTo$Snap j@100@00)))))
                        ($SortWrappers.IntTo$Snap j@100@00))))))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00)))
                (foo%precondition ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  $Ref.null))
              (and
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00))))))
                    $Ref.null))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00)))
                (foo%precondition ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null))))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null)))))
    (or (not (= i@16@00 j@100@00)) (= i@16@00 j@100@00)))
  :pattern (($PSF.loc_list2 ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@15@3@16@82-aux|)))
(assert (forall ((j@100@00 Int)) (!
  (and
    (=>
      (= i@16@00 j@100@00)
      (and
        (= i@16@00 j@100@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null))
          (=
            (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null)
              true
              (foo ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))
                ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null)
          (=
            (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null)
              true
              (foo ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))
                ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))
        (=>
          (= j@100@00 i@16@00)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))
                $Snap.unit))
            (=
              ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))
              ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
        ($PSF.loc_list2 ($PSF.lookup_list2 (sm@97@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00)))
        (list2%trigger ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@15@00)
          ($SortWrappers.IntTo$Snap j@100@00))) l@15@00 j@100@00)
        (=
          ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))
            ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
        (not (= l@15@00 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j@100@00))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))
            ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00)))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null))
          (and
            (=
              ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
                ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))
                ($SortWrappers.IntTo$Snap j@100@00)))
              ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
            (<=
              $Perm.No
              (ite
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))))
                $Perm.Write
                $Perm.No))
            ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              ($SortWrappers.IntTo$Snap j@100@00)))
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  $Ref.null))
              (and
                (forall ((s@105@00 $Snap)) (!
                  (=>
                    (and
                      (=
                        ($SortWrappers.$SnapTo$Ref ($Snap.first s@105@00))
                        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@15@00)
                          ($SortWrappers.IntTo$Snap j@100@00)))))))
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.second s@105@00))
                        j@100@00))
                    (and
                      (not (= s@105@00 $Snap.unit))
                      (=
                        ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00)
                        ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))))
                  :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
                  :pattern (($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00))
                  :qid |qp.psmValDef54|))
                (forall ((s@105@00 $Snap)) (!
                  ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) s@105@00) s@105@00)
                  :pattern (($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) s@105@00))
                  :qid |qp.psmResTrgDef55|))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00)))
                (=>
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00))))))
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00)))))))
                  (and
                    (not
                      (=
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                            ($SortWrappers.$RefTo$Snap l@15@00)
                            ($SortWrappers.IntTo$Snap j@100@00)))))
                          ($SortWrappers.IntTo$Snap j@100@00))
                        $Snap.unit))
                    (=
                      ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@15@00)
                          ($SortWrappers.IntTo$Snap j@100@00)))))
                        ($SortWrappers.IntTo$Snap j@100@00)))
                      ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
                        ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                          ($SortWrappers.$RefTo$Snap l@15@00)
                          ($SortWrappers.IntTo$Snap j@100@00)))))
                        ($SortWrappers.IntTo$Snap j@100@00))))))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@103@00 s@$ l@15@00 i@16@00 j@100@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00)))
                (foo%precondition ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00)))))
              $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  $Ref.null))
              (and
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j@100@00))))))
                    $Ref.null))
                ($PSF.loc_list2 ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00)))
                (foo%precondition ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00)))))
                  ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00)))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j@100@00))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j@100@00))))))
                $Ref.null))))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j@100@00))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j@100@00))))))
              $Ref.null)))))
    (or (not (= i@16@00 j@100@00)) (= i@16@00 j@100@00)))
  :pattern ((foo%limited ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))
    ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@15@00)
    ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@15@3@16@82-aux|)))
(assert (=
  result@17@00
  (forall ((j@100@00 Int)) (!
    (=>
      (= i@16@00 j@100@00)
      (joined_unfolding@106@00 s@$ l@15@00 i@16@00 j@100@00))
    :pattern (($PSF.loc_list2 ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00))))
    :pattern ((foo%limited ($PSF.lookup_list2 (sm@98@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j@100@00)))))
      ($SortWrappers.IntTo$Snap j@100@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@101@00 s@$ l@15@00 i@16@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@15@00)
      ($SortWrappers.IntTo$Snap j@100@00)))))) j@100@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0455.vpr@15@3@16@82|))))
(pop) ; 1
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
; WARNING: (14916,11): 'not' cannot be used in patterns.
; WARNING: (14916,11): 'if' cannot be used in patterns.
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
; WARNING: (14973,7): 'not' cannot be used in patterns.
; WARNING: (14973,7): 'if' cannot be used in patterns.
; ---------- list2 ----------
(declare-const this@107@00 $Ref)
(declare-const i@108@00 Int)
(push) ; 1
(declare-const $t@109@00 $Snap)
(assert (= $t@109@00 ($Snap.combine ($Snap.first $t@109@00) ($Snap.second $t@109@00))))
(assert (not (= this@107@00 $Ref.null)))
(assert (=
  ($Snap.second $t@109@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@109@00))
    ($Snap.second ($Snap.second $t@109@00)))))
; [eval] this.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@109@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@109@00)))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:($t@109@00)) != Null | live]
; [else-branch: 19 | First:(Second:($t@109@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 19 | First:(Second:($t@109@00)) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@109@00)))
    $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 19 | First:(Second:($t@109@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@109@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@109@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- list ----------
(declare-const x@110@00 $Ref)
(push) ; 1
(declare-const $t@111@00 $Snap)
(assert (= $t@111@00 ($Snap.combine ($Snap.first $t@111@00) ($Snap.second $t@111@00))))
(assert (not (= x@110@00 $Ref.null)))
; [eval] x.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@111@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@111@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:($t@111@00) != Null | live]
; [else-branch: 20 | First:($t@111@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 20 | First:($t@111@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@111@00)) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 20 | First:($t@111@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@111@00)) $Ref.null))
(assert (= ($Snap.second $t@111@00) $Snap.unit))
(pop) ; 2
(pop) ; 1
