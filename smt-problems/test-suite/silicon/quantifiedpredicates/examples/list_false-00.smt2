(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:25:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr
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
(declare-sort $FVF<val> 0)
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
(declare-fun $SortWrappers.$FVF<val>To$Snap ($FVF<val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val> ($Snap) $FVF<val>)
(assert (forall ((x $FVF<val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val>($SortWrappers.$FVF<val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val>To$Snap($SortWrappers.$SnapTo$FVF<val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val> x))
    :qid |$Snap.$FVF<val>To$SnapTo$FVF<val>|
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
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; /predicate_snap_functions_declarations.smt2 [list: Snap]
(declare-fun $PSF.domain_list ($PSF<list>) Set<$Snap>)
(declare-fun $PSF.lookup_list ($PSF<list> $Snap) $Snap)
(declare-fun $PSF.after_list ($PSF<list> $PSF<list>) Bool)
(declare-fun $PSF.loc_list ($Snap $Snap) Bool)
(declare-fun $PSF.perm_list ($PPM $Snap) $Perm)
(declare-const $psfTOP_list $PSF<list>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun allSet ($Snap $Ref Int Int) Bool)
(declare-fun allSet%limited ($Snap $Ref Int Int) Bool)
(declare-fun allSet%stateless ($Ref Int Int) Bool)
(declare-fun allSet%precondition ($Snap $Ref Int Int) Bool)
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
; /field_value_functions_axioms.smt2 [val: Int]
(assert (forall ((vs $FVF<val>) (ws $FVF<val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val vs) ($FVF.domain_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val vs))
            (= ($FVF.lookup_val vs x) ($FVF.lookup_val ws x)))
          :pattern (($FVF.lookup_val vs x) ($FVF.lookup_val ws x))
          :qid |qp.$FVF<val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val>To$Snap vs)
              ($SortWrappers.$FVF<val>To$Snap ws)
              )
    :qid |qp.$FVF<val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val pm r))
    :pattern (($FVF.perm_val pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
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
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int) (v@2@00 Int)) (!
  (= (allSet%limited s@$ r@0@00 i@1@00 v@2@00) (allSet s@$ r@0@00 i@1@00 v@2@00))
  :pattern ((allSet s@$ r@0@00 i@1@00 v@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int) (v@2@00 Int)) (!
  (allSet%stateless r@0@00 i@1@00 v@2@00)
  :pattern ((allSet%limited s@$ r@0@00 i@1@00 v@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int) (v@2@00 Int)) (!
  (=>
    (allSet%precondition s@$ r@0@00 i@1@00 v@2@00)
    (=
      (allSet s@$ r@0@00 i@1@00 v@2@00)
      (ite
        (<= i@1@00 0)
        true
        (and
          (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) v@2@00)
          (allSet%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) (-
            i@1@00
            1) v@2@00)))))
  :pattern ((allSet s@$ r@0@00 i@1@00 v@2@00))
  :pattern ((allSet%stateless r@0@00 i@1@00 v@2@00) (list%trigger s@$ r@0@00 i@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int) (v@2@00 Int)) (!
  (=>
    (allSet%precondition s@$ r@0@00 i@1@00 v@2@00)
    (ite
      (<= i@1@00 0)
      true
      (=>
        (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) v@2@00)
        (allSet%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) (-
          i@1@00
          1) v@2@00))))
  :pattern ((allSet s@$ r@0@00 i@1@00 v@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m1 ----------
(declare-const lists@0@01 Set<$Ref>)
(declare-const length@1@01 Int)
(declare-const v@2@01 Int)
(declare-const lists@3@01 Set<$Ref>)
(declare-const length@4@01 Int)
(declare-const v@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] length > 0
(assert (> length@4@01 0))
(declare-const r@7@01 $Ref)
(push) ; 2
; [eval] (r in lists)
(assert (Set_in r@7@01 lists@3@01))
(pop) ; 2
(declare-fun inv@8@01 ($Ref Int) $Ref)
(declare-fun img@9@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@7@01 $Ref) (r2@7@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@7@01 lists@3@01)
      (Set_in r2@7@01 lists@3@01)
      (= r1@7@01 r2@7@01))
    (= r1@7@01 r2@7@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@7@01 $Ref)) (!
  (=>
    (Set_in r@7@01 lists@3@01)
    (and (= (inv@8@01 r@7@01 length@4@01) r@7@01) (img@9@01 r@7@01 length@4@01)))
  :pattern ((Set_in r@7@01 lists@3@01))
  :pattern ((inv@8@01 r@7@01 length@4@01))
  :pattern ((img@9@01 r@7@01 length@4@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@9@01 r i) (Set_in (inv@8@01 r i) lists@3@01))
    (and (= (inv@8@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@8@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(declare-const r@11@01 $Ref)
(push) ; 3
; [eval] (r in lists)
(assert (Set_in r@11@01 lists@3@01))
(pop) ; 3
(declare-fun inv@12@01 ($Ref Int) $Ref)
(declare-fun img@13@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@11@01 $Ref) (r2@11@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@11@01 lists@3@01)
      (Set_in r2@11@01 lists@3@01)
      (= r1@11@01 r2@11@01))
    (= r1@11@01 r2@11@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@11@01 $Ref)) (!
  (=>
    (Set_in r@11@01 lists@3@01)
    (and
      (= (inv@12@01 r@11@01 length@4@01) r@11@01)
      (img@13@01 r@11@01 length@4@01)))
  :pattern ((Set_in r@11@01 lists@3@01))
  :pattern ((inv@12@01 r@11@01 length@4@01))
  :pattern ((img@13@01 r@11@01 length@4@01))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@13@01 r i) (Set_in (inv@12@01 r i) lists@3@01))
    (and (= (inv@12@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@12@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { allSet(r, length, v) } (r in lists) ==> allSet(r, length, v))
(declare-const r@14@01 $Ref)
(push) ; 3
; [eval] (r in lists) ==> allSet(r, length, v)
; [eval] (r in lists)
(push) ; 4
; [then-branch: 0 | r@14@01 in lists@3@01 | live]
; [else-branch: 0 | !(r@14@01 in lists@3@01) | live]
(push) ; 5
; [then-branch: 0 | r@14@01 in lists@3@01]
(assert (Set_in r@14@01 lists@3@01))
; [eval] allSet(r, length, v)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((r $Ref) (i Int) (r@14@01 $Ref)) $Perm
  (ite
    (and (= r r@14@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and (img@13@01 r i) (Set_in (inv@12@01 r i) lists@3@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@13@01 r i) (Set_in (inv@12@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@15@01 r i r@14@01))
    $Perm.No)
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@15@01 r i r@14@01) $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@14@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@15@01 r i r@14@01)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $PSF<list>)
(declare-const s@17@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@13@01 r@14@01 length@4@01)
    (Set_in (inv@12@01 r@14@01 length@4@01) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@14@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@14@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@10@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@14@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@14@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@14@01 length@4@01 v@5@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@13@01 r@14@01 length@4@01)
      (Set_in (inv@12@01 r@14@01 length@4@01) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@14@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@14@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@10@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@14@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@14@01 length@4@01 v@5@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 0 | !(r@14@01 in lists@3@01)]
(assert (not (Set_in r@14@01 lists@3@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@14@01 lists@3@01)
  (and
    (Set_in r@14@01 lists@3@01)
    (=>
      (and
        (img@13@01 r@14@01 length@4@01)
        (Set_in (inv@12@01 r@14@01 length@4@01) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@14@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@14@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@10@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@14@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@14@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@14@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@14@01 lists@3@01)) (Set_in r@14@01 lists@3@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@14@01 $Ref)) (!
  (and
    (=>
      (Set_in r@14@01 lists@3@01)
      (and
        (Set_in r@14@01 lists@3@01)
        (=>
          (and
            (img@13@01 r@14@01 length@4@01)
            (Set_in (inv@12@01 r@14@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@14@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@14@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@10@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@14@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@14@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@14@01 length@4@01 v@5@01)))
    (or (not (Set_in r@14@01 lists@3@01)) (Set_in r@14@01 lists@3@01)))
  :pattern ((Set_in r@14@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@26@9@26@85-aux|)))
(assert (forall ((r@14@01 $Ref)) (!
  (and
    (=>
      (Set_in r@14@01 lists@3@01)
      (and
        (Set_in r@14@01 lists@3@01)
        (=>
          (and
            (img@13@01 r@14@01 length@4@01)
            (Set_in (inv@12@01 r@14@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@14@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@14@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@10@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@14@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@14@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@14@01 length@4@01 v@5@01)))
    (or (not (Set_in r@14@01 lists@3@01)) (Set_in r@14@01 lists@3@01)))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@14@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@26@9@26@85-aux|)))
(assert (forall ((r@14@01 $Ref)) (!
  (=>
    (Set_in r@14@01 lists@3@01)
    (allSet ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@14@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@14@01 length@4@01 v@5@01))
  :pattern ((Set_in r@14@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@16@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@14@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@26@9@26@85|)))
(pop) ; 2
(push) ; 2
; [exec]
; var s: Set[Ref]
(declare-const s@18@01 Set<$Ref>)
; [exec]
; var sNext: Set[Ref]
(declare-const sNext@19@01 Set<$Ref>)
; [exec]
; s := lists
; [exec]
; sNext := Set[Ref]()
; [eval] Set[Ref]()
(declare-const s@20@01 Set<$Ref>)
(declare-const sNext@21@01 Set<$Ref>)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(declare-const r@23@01 $Ref)
(push) ; 4
; [eval] (r in s)
(assert (Set_in r@23@01 s@20@01))
(pop) ; 4
(declare-fun inv@24@01 ($Ref Int) $Ref)
(declare-fun img@25@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@23@01 $Ref) (r2@23@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@23@01 s@20@01)
      (Set_in r2@23@01 s@20@01)
      (= r1@23@01 r2@23@01))
    (= r1@23@01 r2@23@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@23@01 $Ref)) (!
  (=>
    (Set_in r@23@01 s@20@01)
    (and
      (= (inv@24@01 r@23@01 length@4@01) r@23@01)
      (img@25@01 r@23@01 length@4@01)))
  :pattern ((Set_in r@23@01 s@20@01))
  :pattern ((inv@24@01 r@23@01 length@4@01))
  :pattern ((img@25@01 r@23@01 length@4@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
    (and (= (inv@24@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@24@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(declare-const r@26@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 1 | !(r@26@01 in lists@3@01) | live]
; [else-branch: 1 | r@26@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 1 | !(r@26@01 in lists@3@01)]
(assert (not (Set_in r@26@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | r@26@01 in lists@3@01]
(assert (Set_in r@26@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 lists@3@01))))
(assert (and (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 s@20@01))))
(pop) ; 4
(declare-fun inv@27@01 ($Ref) $Ref)
(declare-fun img@28@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@26@01 $Ref)) (!
  (=>
    (and (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 s@20@01)))
    (or (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 lists@3@01))))
  :pattern ((Set_in r@26@01 lists@3@01))
  :pattern ((Set_in r@26@01 s@20@01))
  :pattern ((inv@27@01 r@26@01))
  :pattern ((img@28@01 r@26@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@26@01 $Ref) (r2@26@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@26@01 lists@3@01) (not (Set_in r1@26@01 s@20@01)))
      (and (Set_in r2@26@01 lists@3@01) (not (Set_in r2@26@01 s@20@01)))
      (= r1@26@01 r2@26@01))
    (= r1@26@01 r2@26@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@26@01 $Ref)) (!
  (=>
    (and (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 s@20@01)))
    (and (= (inv@27@01 r@26@01) r@26@01) (img@28@01 r@26@01)))
  :pattern ((Set_in r@26@01 lists@3@01))
  :pattern ((Set_in r@26@01 s@20@01))
  :pattern ((inv@27@01 r@26@01))
  :pattern ((img@28@01 r@26@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (= (inv@27@01 r) r))
  :pattern ((inv@27@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@26@01 $Ref)) (!
  (=>
    (and (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 s@20@01)))
    (not (= r@26@01 $Ref.null)))
  :pattern ((Set_in r@26@01 lists@3@01))
  :pattern ((Set_in r@26@01 s@20@01))
  :pattern ((inv@27@01 r@26@01))
  :pattern ((img@28@01 r@26@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(declare-const r@29@01 $Ref)
(push) ; 4
; [eval] (r in sNext)
(assert (Set_in r@29@01 sNext@21@01))
; [eval] length - 1
(pop) ; 4
(declare-fun inv@30@01 ($Ref Int) $Ref)
(declare-fun img@31@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@29@01 $Ref) (r2@29@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@29@01 sNext@21@01)
      (Set_in r2@29@01 sNext@21@01)
      (= r1@29@01 r2@29@01))
    (= r1@29@01 r2@29@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@29@01 $Ref)) (!
  (=>
    (Set_in r@29@01 sNext@21@01)
    (and
      (= (inv@30@01 r@29@01 (- length@4@01 1)) r@29@01)
      (img@31@01 r@29@01 (- length@4@01 1))))
  :pattern ((Set_in r@29@01 sNext@21@01))
  :pattern ((inv@30@01 r@29@01 (- length@4@01 1)))
  :pattern ((img@31@01 r@29@01 (- length@4@01 1)))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
    (and (= (inv@30@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@30@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (and
    (= r@29@01 r@23@01)
    (=
      (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
      (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))))
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@22@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
(declare-const r@32@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 2 | !(r@32@01 in lists@3@01) | live]
; [else-branch: 2 | r@32@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 2 | !(r@32@01 in lists@3@01)]
(assert (not (Set_in r@32@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | r@32@01 in lists@3@01]
(assert (Set_in r@32@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 lists@3@01))))
(assert (and (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 s@20@01))))
(pop) ; 4
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (and (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 s@20@01)))
    (or (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 lists@3@01))))
  :pattern ((Set_in r@32@01 lists@3@01))
  :pattern ((Set_in r@32@01 s@20@01))
  :pattern ((inv@33@01 r@32@01))
  :pattern ((img@34@01 r@32@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@32@01 $Ref) (r2@32@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@32@01 lists@3@01) (not (Set_in r1@32@01 s@20@01)))
      (and (Set_in r2@32@01 lists@3@01) (not (Set_in r2@32@01 s@20@01)))
      (= r1@32@01 r2@32@01))
    (= r1@32@01 r2@32@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (and (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 s@20@01)))
    (and (= (inv@33@01 r@32@01) r@32@01) (img@34@01 r@32@01)))
  :pattern ((Set_in r@32@01 lists@3@01))
  :pattern ((Set_in r@32@01 s@20@01))
  :pattern ((inv@33@01 r@32@01))
  :pattern ((img@34@01 r@32@01))
  :qid |quant-u-20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and
        (Set_in (inv@33@01 r) lists@3@01)
        (not (Set_in (inv@33@01 r) s@20@01))))
    (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (and (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 s@20@01)))
    (not (= r@32@01 $Ref.null)))
  :pattern ((Set_in r@32@01 lists@3@01))
  :pattern ((Set_in r@32@01 s@20@01))
  :pattern ((inv@33@01 r@32@01))
  :pattern ((img@34@01 r@32@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } (r in lists) && !((r in s)) ==> r.val == v)
(declare-const r@35@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s)) ==> r.val == v
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 3 | !(r@35@01 in lists@3@01) | live]
; [else-branch: 3 | r@35@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 3 | !(r@35@01 in lists@3@01)]
(assert (not (Set_in r@35@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | r@35@01 in lists@3@01]
(assert (Set_in r@35@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 lists@3@01))))
(push) ; 5
; [then-branch: 4 | r@35@01 in lists@3@01 && !(r@35@01 in s@20@01) | live]
; [else-branch: 4 | !(r@35@01 in lists@3@01 && !(r@35@01 in s@20@01)) | live]
(push) ; 6
; [then-branch: 4 | r@35@01 in lists@3@01 && !(r@35@01 in s@20@01)]
(assert (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01))))
; [eval] r.val == v
(push) ; 7
(assert (not (and
  (img@34@01 r@35@01)
  (and
    (Set_in (inv@33@01 r@35@01) lists@3@01)
    (not (Set_in (inv@33@01 r@35@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 4 | !(r@35@01 in lists@3@01 && !(r@35@01 in s@20@01))]
(assert (not (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01))))
  (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@35@01 $Ref)) (!
  (and
    (or (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 lists@3@01)))
    (or
      (not (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01))))
      (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01)))))
  :pattern ((Set_in r@35@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84-aux|)))
(assert (forall ((r@35@01 $Ref)) (!
  (and
    (or (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 lists@3@01)))
    (or
      (not (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01))))
      (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01)))))
  :pattern ((Set_in r@35@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84-aux|)))
(assert (forall ((r@35@01 $Ref)) (!
  (=>
    (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r@35@01)
      v@5@01))
  :pattern ((Set_in r@35@01 lists@3@01))
  :pattern ((Set_in r@35@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { (r.next in sNext) } (r in lists) && !((r in s)) ==> (r.next in sNext))
(declare-const r@36@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s)) ==> (r.next in sNext)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 5 | !(r@36@01 in lists@3@01) | live]
; [else-branch: 5 | r@36@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 5 | !(r@36@01 in lists@3@01)]
(assert (not (Set_in r@36@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | r@36@01 in lists@3@01]
(assert (Set_in r@36@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 lists@3@01))))
(push) ; 5
; [then-branch: 6 | r@36@01 in lists@3@01 && !(r@36@01 in s@20@01) | live]
; [else-branch: 6 | !(r@36@01 in lists@3@01 && !(r@36@01 in s@20@01)) | live]
(push) ; 6
; [then-branch: 6 | r@36@01 in lists@3@01 && !(r@36@01 in s@20@01)]
(assert (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01))))
; [eval] (r.next in sNext)
(push) ; 7
(assert (not (and
  (img@28@01 r@36@01)
  (and
    (Set_in (inv@27@01 r@36@01) lists@3@01)
    (not (Set_in (inv@27@01 r@36@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(r@36@01 in lists@3@01 && !(r@36@01 in s@20@01))]
(assert (not (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01))))
  (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@36@01 $Ref)) (!
  (and
    (or (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 lists@3@01)))
    (or
      (not (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01))))
      (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))))
  :pattern ((Set_in r@36@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@36@01 $Ref)) (!
  (and
    (or (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 lists@3@01)))
    (or
      (not (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01))))
      (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))))
  :pattern ((Set_in r@36@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@36@01 $Ref)) (!
  (and
    (or (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 lists@3@01)))
    (or
      (not (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01))))
      (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))))
  :pattern ((Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r@36@01) sNext@21@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@36@01 $Ref)) (!
  (=>
    (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r@36@01) sNext@21@01))
  :pattern ((Set_in r@36@01 lists@3@01))
  :pattern ((Set_in r@36@01 s@20@01))
  :pattern ((Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r@36@01) sNext@21@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  $Snap.unit))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in lists), (r2 in lists) } { (r1 in lists), (r2 in s) } { (r1 in s), (r2 in lists) } { (r1 in s), (r2 in s) } (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next)
(declare-const r1@37@01 $Ref)
(declare-const r2@38@01 $Ref)
(push) ; 4
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2)))
; [eval] (r1 in lists)
(push) ; 5
; [then-branch: 7 | !(r1@37@01 in lists@3@01) | live]
; [else-branch: 7 | r1@37@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 7 | !(r1@37@01 in lists@3@01)]
(assert (not (Set_in r1@37@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | r1@37@01 in lists@3@01]
(assert (Set_in r1@37@01 lists@3@01))
; [eval] !((r1 in s))
; [eval] (r1 in s)
(push) ; 7
; [then-branch: 8 | r1@37@01 in s@20@01 | live]
; [else-branch: 8 | !(r1@37@01 in s@20@01) | live]
(push) ; 8
; [then-branch: 8 | r1@37@01 in s@20@01]
(assert (Set_in r1@37@01 s@20@01))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | !(r1@37@01 in s@20@01)]
(assert (not (Set_in r1@37@01 s@20@01)))
; [eval] (r2 in lists)
(push) ; 9
; [then-branch: 9 | !(r2@38@01 in lists@3@01) | live]
; [else-branch: 9 | r2@38@01 in lists@3@01 | live]
(push) ; 10
; [then-branch: 9 | !(r2@38@01 in lists@3@01)]
(assert (not (Set_in r2@38@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | r2@38@01 in lists@3@01]
(assert (Set_in r2@38@01 lists@3@01))
; [eval] !((r2 in s))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 10 | r2@38@01 in s@20@01 | live]
; [else-branch: 10 | !(r2@38@01 in s@20@01) | live]
(push) ; 12
; [then-branch: 10 | r2@38@01 in s@20@01]
(assert (Set_in r2@38@01 s@20@01))
(pop) ; 12
(push) ; 12
; [else-branch: 10 | !(r2@38@01 in s@20@01)]
(assert (not (Set_in r2@38@01 s@20@01)))
; [eval] r1 != r2
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r2@38@01 lists@3@01)
  (and
    (Set_in r2@38@01 lists@3@01)
    (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01)))))
(assert (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in r1@37@01 s@20@01))
  (and
    (not (Set_in r1@37@01 s@20@01))
    (=>
      (Set_in r2@38@01 lists@3@01)
      (and
        (Set_in r2@38@01 lists@3@01)
        (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
    (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01))))))
(assert (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r1@37@01 lists@3@01)
  (and
    (Set_in r1@37@01 lists@3@01)
    (=>
      (not (Set_in r1@37@01 s@20@01))
      (and
        (not (Set_in r1@37@01 s@20@01))
        (=>
          (Set_in r2@38@01 lists@3@01)
          (and
            (Set_in r2@38@01 lists@3@01)
            (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
        (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
    (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01)))))
(assert (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01))))
(push) ; 5
; [then-branch: 11 | r1@37@01 in lists@3@01 && !(r1@37@01 in s@20@01) && r2@38@01 in lists@3@01 && !(r2@38@01 in s@20@01) && r1@37@01 != r2@38@01 | live]
; [else-branch: 11 | !(r1@37@01 in lists@3@01 && !(r1@37@01 in s@20@01) && r2@38@01 in lists@3@01 && !(r2@38@01 in s@20@01) && r1@37@01 != r2@38@01) | live]
(push) ; 6
; [then-branch: 11 | r1@37@01 in lists@3@01 && !(r1@37@01 in s@20@01) && r2@38@01 in lists@3@01 && !(r2@38@01 in s@20@01) && r1@37@01 != r2@38@01]
(assert (and
  (Set_in r1@37@01 lists@3@01)
  (and
    (not (Set_in r1@37@01 s@20@01))
    (and
      (Set_in r2@38@01 lists@3@01)
      (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
; [eval] r1.next != r2.next
(push) ; 7
(assert (not (and
  (img@28@01 r1@37@01)
  (and
    (Set_in (inv@27@01 r1@37@01) lists@3@01)
    (not (Set_in (inv@27@01 r1@37@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@28@01 r2@38@01)
  (and
    (Set_in (inv@27@01 r2@38@01) lists@3@01)
    (not (Set_in (inv@27@01 r2@38@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(r1@37@01 in lists@3@01 && !(r1@37@01 in s@20@01) && r2@38@01 in lists@3@01 && !(r2@38@01 in s@20@01) && r1@37@01 != r2@38@01)]
(assert (not
  (and
    (Set_in r1@37@01 lists@3@01)
    (and
      (not (Set_in r1@37@01 s@20@01))
      (and
        (Set_in r2@38@01 lists@3@01)
        (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Set_in r1@37@01 lists@3@01)
    (and
      (not (Set_in r1@37@01 s@20@01))
      (and
        (Set_in r2@38@01 lists@3@01)
        (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
  (and
    (Set_in r1@37@01 lists@3@01)
    (not (Set_in r1@37@01 s@20@01))
    (Set_in r2@38@01 lists@3@01)
    (not (Set_in r2@38@01 s@20@01))
    (not (= r1@37@01 r2@38@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in r1@37@01 lists@3@01)
      (and
        (not (Set_in r1@37@01 s@20@01))
        (and
          (Set_in r2@38@01 lists@3@01)
          (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
  (and
    (Set_in r1@37@01 lists@3@01)
    (and
      (not (Set_in r1@37@01 s@20@01))
      (and
        (Set_in r2@38@01 lists@3@01)
        (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@37@01 lists@3@01)
      (and
        (Set_in r1@37@01 lists@3@01)
        (=>
          (not (Set_in r1@37@01 s@20@01))
          (and
            (not (Set_in r1@37@01 s@20@01))
            (=>
              (Set_in r2@38@01 lists@3@01)
              (and
                (Set_in r2@38@01 lists@3@01)
                (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
            (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
        (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01))))
    (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (not (Set_in r1@37@01 s@20@01))
        (Set_in r2@38@01 lists@3@01)
        (not (Set_in r2@38@01 s@20@01))
        (not (= r1@37@01 r2@38@01))))
    (or
      (not
        (and
          (Set_in r1@37@01 lists@3@01)
          (and
            (not (Set_in r1@37@01 s@20@01))
            (and
              (Set_in r2@38@01 lists@3@01)
              (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
  :pattern ((Set_in r1@37@01 lists@3@01) (Set_in r2@38@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@37@01 lists@3@01)
      (and
        (Set_in r1@37@01 lists@3@01)
        (=>
          (not (Set_in r1@37@01 s@20@01))
          (and
            (not (Set_in r1@37@01 s@20@01))
            (=>
              (Set_in r2@38@01 lists@3@01)
              (and
                (Set_in r2@38@01 lists@3@01)
                (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
            (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
        (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01))))
    (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (not (Set_in r1@37@01 s@20@01))
        (Set_in r2@38@01 lists@3@01)
        (not (Set_in r2@38@01 s@20@01))
        (not (= r1@37@01 r2@38@01))))
    (or
      (not
        (and
          (Set_in r1@37@01 lists@3@01)
          (and
            (not (Set_in r1@37@01 s@20@01))
            (and
              (Set_in r2@38@01 lists@3@01)
              (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
  :pattern ((Set_in r1@37@01 lists@3@01) (Set_in r2@38@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@37@01 lists@3@01)
      (and
        (Set_in r1@37@01 lists@3@01)
        (=>
          (not (Set_in r1@37@01 s@20@01))
          (and
            (not (Set_in r1@37@01 s@20@01))
            (=>
              (Set_in r2@38@01 lists@3@01)
              (and
                (Set_in r2@38@01 lists@3@01)
                (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
            (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
        (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01))))
    (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (not (Set_in r1@37@01 s@20@01))
        (Set_in r2@38@01 lists@3@01)
        (not (Set_in r2@38@01 s@20@01))
        (not (= r1@37@01 r2@38@01))))
    (or
      (not
        (and
          (Set_in r1@37@01 lists@3@01)
          (and
            (not (Set_in r1@37@01 s@20@01))
            (and
              (Set_in r2@38@01 lists@3@01)
              (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
  :pattern ((Set_in r1@37@01 s@20@01) (Set_in r2@38@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@37@01 lists@3@01)
      (and
        (Set_in r1@37@01 lists@3@01)
        (=>
          (not (Set_in r1@37@01 s@20@01))
          (and
            (not (Set_in r1@37@01 s@20@01))
            (=>
              (Set_in r2@38@01 lists@3@01)
              (and
                (Set_in r2@38@01 lists@3@01)
                (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
            (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
        (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01))))
    (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (not (Set_in r1@37@01 s@20@01))
        (Set_in r2@38@01 lists@3@01)
        (not (Set_in r2@38@01 s@20@01))
        (not (= r1@37@01 r2@38@01))))
    (or
      (not
        (and
          (Set_in r1@37@01 lists@3@01)
          (and
            (not (Set_in r1@37@01 s@20@01))
            (and
              (Set_in r2@38@01 lists@3@01)
              (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
  :pattern ((Set_in r1@37@01 s@20@01) (Set_in r2@38@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@37@01 lists@3@01)
      (and
        (not (Set_in r1@37@01 s@20@01))
        (and
          (Set_in r2@38@01 lists@3@01)
          (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r1@37@01)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r2@38@01))))
  :pattern ((Set_in r1@37@01 lists@3@01) (Set_in r2@38@01 lists@3@01))
  :pattern ((Set_in r1@37@01 lists@3@01) (Set_in r2@38@01 s@20@01))
  :pattern ((Set_in r1@37@01 s@20@01) (Set_in r2@38@01 lists@3@01))
  :pattern ((Set_in r1@37@01 s@20@01) (Set_in r2@38@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(declare-const r@39@01 $Ref)
(push) ; 4
; [eval] (r in s)
(assert (Set_in r@39@01 lists@3@01))
(pop) ; 4
(declare-fun inv@40@01 ($Ref Int) $Ref)
(declare-fun img@41@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@39@01 $Ref) (r2@39@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@39@01 lists@3@01)
      (Set_in r2@39@01 lists@3@01)
      (= r1@39@01 r2@39@01))
    (= r1@39@01 r2@39@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@39@01 $Ref)) (!
  (=>
    (Set_in r@39@01 lists@3@01)
    (and
      (= (inv@40@01 r@39@01 length@4@01) r@39@01)
      (img@41@01 r@39@01 length@4@01)))
  :pattern ((Set_in r@39@01 lists@3@01))
  :pattern ((inv@40@01 r@39@01 length@4@01))
  :pattern ((img@41@01 r@39@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@41@01 r i) (Set_in (inv@40@01 r i) lists@3@01))
    (and (= (inv@40@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@40@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@42@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@40@01 r i) lists@3@01)
      (img@41@01 r i)
      (and (= r (inv@40@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite
        (and (img@9@01 r i) (Set_in (inv@8@01 r i) lists@3@01))
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
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@9@01 r i) (Set_in (inv@8@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@42@01 r i))
    $Perm.No)
  
  :qid |quant-u-23|))))
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
    (and
      (Set_in (inv@40@01 r i) lists@3@01)
      (img@41@01 r i)
      (and (= r (inv@40@01 r i)) (= i length@4@01)))
    (= (- $Perm.Write (pTaken@42@01 r i)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $PSF<list>)
(declare-const s@44@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@44@01 $Snap)) (!
  (=>
    (and
      (img@9@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
      (Set_in (inv@8@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01))) lists@3@01))
    (and
      (not (= s@44@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@43@01  $PSF<list>) s@44@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second $t@6@01)) s@44@01))))
  :pattern (($PSF.lookup_list (as sm@43@01  $PSF<list>) s@44@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second $t@6@01)) s@44@01))
  :qid |qp.psmValDef1|)))
(declare-const r@45@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 12 | !(r@45@01 in lists@3@01) | live]
; [else-branch: 12 | r@45@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 12 | !(r@45@01 in lists@3@01)]
(assert (not (Set_in r@45@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | r@45@01 in lists@3@01]
(assert (Set_in r@45@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@45@01 lists@3@01) (not (Set_in r@45@01 lists@3@01))))
(assert (and (Set_in r@45@01 lists@3@01) (not (Set_in r@45@01 lists@3@01))))
(pop) ; 4
(declare-fun inv@46@01 ($Ref) $Ref)
(declare-fun img@47@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@45@01 $Ref)) (!
  (=>
    (and (Set_in r@45@01 lists@3@01) (not (Set_in r@45@01 lists@3@01)))
    (or (Set_in r@45@01 lists@3@01) (not (Set_in r@45@01 lists@3@01))))
  :pattern ((Set_in r@45@01 lists@3@01))
  :pattern ((inv@46@01 r@45@01))
  :pattern ((img@47@01 r@45@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@45@01 $Ref) (r2@45@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@45@01 lists@3@01) (not (Set_in r1@45@01 lists@3@01)))
      (and (Set_in r2@45@01 lists@3@01) (not (Set_in r2@45@01 lists@3@01)))
      (= r1@45@01 r2@45@01))
    (= r1@45@01 r2@45@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@45@01 $Ref)) (!
  (=>
    (and (Set_in r@45@01 lists@3@01) (not (Set_in r@45@01 lists@3@01)))
    (and (= (inv@46@01 r@45@01) r@45@01) (img@47@01 r@45@01)))
  :pattern ((Set_in r@45@01 lists@3@01))
  :pattern ((inv@46@01 r@45@01))
  :pattern ((img@47@01 r@45@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@01 r)
      (and
        (Set_in (inv@46@01 r) lists@3@01)
        (not (Set_in (inv@46@01 r) lists@3@01))))
    (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@01 r) lists@3@01)
        (not (Set_in (inv@46@01 r) lists@3@01)))
      (img@47@01 r)
      (= r (inv@46@01 r)))
    false)
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@48@01 $FVF<next>)
; Definitional axioms for snapshot map values
(declare-const r@49@01 $Ref)
(push) ; 4
; [eval] (r in sNext)
(assert (Set_in r@49@01 (as Set_empty  Set<$Ref>)))
; [eval] length - 1
(pop) ; 4
(declare-fun inv@50@01 ($Ref Int) $Ref)
(declare-fun img@51@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@49@01 $Ref) (r2@49@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@49@01 (as Set_empty  Set<$Ref>))
      (Set_in r2@49@01 (as Set_empty  Set<$Ref>))
      (= r1@49@01 r2@49@01))
    (= r1@49@01 r2@49@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@49@01 $Ref)) (!
  (=>
    (Set_in r@49@01 (as Set_empty  Set<$Ref>))
    (and
      (= (inv@50@01 r@49@01 (- length@4@01 1)) r@49@01)
      (img@51@01 r@49@01 (- length@4@01 1))))
  :pattern ((Set_in r@49@01 (as Set_empty  Set<$Ref>)))
  :pattern ((inv@50@01 r@49@01 (- length@4@01 1)))
  :pattern ((img@51@01 r@49@01 (- length@4@01 1)))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@51@01 r i) (Set_in (inv@50@01 r i) (as Set_empty  Set<$Ref>)))
    (and (= (inv@50@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@50@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Set_in (inv@50@01 r i) (as Set_empty  Set<$Ref>))
      (img@51@01 r i)
      (and (= r (inv@50@01 r i)) (= i (- length@4@01 1))))
    false)
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@52@01 $PSF<list>)
(declare-const s@53@01 $Snap)
; Definitional axioms for snapshot map values
(declare-const r@54@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 13 | !(r@54@01 in lists@3@01) | live]
; [else-branch: 13 | r@54@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 13 | !(r@54@01 in lists@3@01)]
(assert (not (Set_in r@54@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | r@54@01 in lists@3@01]
(assert (Set_in r@54@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@54@01 lists@3@01) (not (Set_in r@54@01 lists@3@01))))
(assert (and (Set_in r@54@01 lists@3@01) (not (Set_in r@54@01 lists@3@01))))
(pop) ; 4
(declare-fun inv@55@01 ($Ref) $Ref)
(declare-fun img@56@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@54@01 $Ref)) (!
  (=>
    (and (Set_in r@54@01 lists@3@01) (not (Set_in r@54@01 lists@3@01)))
    (or (Set_in r@54@01 lists@3@01) (not (Set_in r@54@01 lists@3@01))))
  :pattern ((Set_in r@54@01 lists@3@01))
  :pattern ((inv@55@01 r@54@01))
  :pattern ((img@56@01 r@54@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@54@01 $Ref) (r2@54@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@54@01 lists@3@01) (not (Set_in r1@54@01 lists@3@01)))
      (and (Set_in r2@54@01 lists@3@01) (not (Set_in r2@54@01 lists@3@01)))
      (= r1@54@01 r2@54@01))
    (= r1@54@01 r2@54@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@54@01 $Ref)) (!
  (=>
    (and (Set_in r@54@01 lists@3@01) (not (Set_in r@54@01 lists@3@01)))
    (and (= (inv@55@01 r@54@01) r@54@01) (img@56@01 r@54@01)))
  :pattern ((Set_in r@54@01 lists@3@01))
  :pattern ((inv@55@01 r@54@01))
  :pattern ((img@56@01 r@54@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (and
        (Set_in (inv@55@01 r) lists@3@01)
        (not (Set_in (inv@55@01 r) lists@3@01))))
    (= (inv@55@01 r) r))
  :pattern ((inv@55@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@01 r) lists@3@01)
        (not (Set_in (inv@55@01 r) lists@3@01)))
      (img@56@01 r)
      (= r (inv@55@01 r)))
    false)
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@57@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } (r in lists) && !((r in s)) ==> r.val == v)
(declare-const r@58@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s)) ==> r.val == v
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 14 | !(r@58@01 in lists@3@01) | live]
; [else-branch: 14 | r@58@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 14 | !(r@58@01 in lists@3@01)]
(assert (not (Set_in r@58@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | r@58@01 in lists@3@01]
(assert (Set_in r@58@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01))))
(push) ; 5
; [then-branch: 15 | r@58@01 in lists@3@01 && !(r@58@01 in lists@3@01) | live]
; [else-branch: 15 | !(r@58@01 in lists@3@01 && !(r@58@01 in lists@3@01)) | live]
(push) ; 6
; [then-branch: 15 | r@58@01 in lists@3@01 && !(r@58@01 in lists@3@01)]
(assert (and (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01))))
; [eval] r.val == v
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(r@58@01 in lists@3@01 && !(r@58@01 in lists@3@01))]
(assert (not (and (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01))))
  (and (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@58@01 $Ref)) (!
  (and
    (or (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01)))
    (or
      (not (and (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01))))
      (and (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01)))))
  :pattern ((Set_in r@58@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84-aux|)))
(push) ; 4
(assert (not (forall ((r@58@01 $Ref)) (!
  (=>
    (and (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01)))
    (= ($FVF.lookup_val (as sm@57@01  $FVF<val>) r@58@01) v@5@01))
  :pattern ((Set_in r@58@01 lists@3@01))
  :pattern ((Set_in r@58@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@58@01 $Ref)) (!
  (=>
    (and (Set_in r@58@01 lists@3@01) (not (Set_in r@58@01 lists@3@01)))
    (= ($FVF.lookup_val (as sm@57@01  $FVF<val>) r@58@01) v@5@01))
  :pattern ((Set_in r@58@01 lists@3@01))
  :pattern ((Set_in r@58@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { (r.next in sNext) } (r in lists) && !((r in s)) ==> (r.next in sNext))
(declare-const r@59@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s)) ==> (r.next in sNext)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 16 | !(r@59@01 in lists@3@01) | live]
; [else-branch: 16 | r@59@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 16 | !(r@59@01 in lists@3@01)]
(assert (not (Set_in r@59@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | r@59@01 in lists@3@01]
(assert (Set_in r@59@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01))))
(push) ; 5
; [then-branch: 17 | r@59@01 in lists@3@01 && !(r@59@01 in lists@3@01) | live]
; [else-branch: 17 | !(r@59@01 in lists@3@01 && !(r@59@01 in lists@3@01)) | live]
(push) ; 6
; [then-branch: 17 | r@59@01 in lists@3@01 && !(r@59@01 in lists@3@01)]
(assert (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01))))
; [eval] (r.next in sNext)
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 17 | !(r@59@01 in lists@3@01 && !(r@59@01 in lists@3@01))]
(assert (not (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01))))
  (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@59@01 $Ref)) (!
  (and
    (or (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01)))
    (or
      (not (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01))))
      (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01)))))
  :pattern ((Set_in r@59@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@59@01 $Ref)) (!
  (and
    (or (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01)))
    (or
      (not (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01))))
      (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@59@01) (as Set_empty  Set<$Ref>)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(push) ; 4
(assert (not (forall ((r@59@01 $Ref)) (!
  (=>
    (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01)))
    (Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@59@01) (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in r@59@01 lists@3@01))
  :pattern ((Set_in r@59@01 lists@3@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@59@01) (as Set_empty  Set<$Ref>)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@59@01 $Ref)) (!
  (=>
    (and (Set_in r@59@01 lists@3@01) (not (Set_in r@59@01 lists@3@01)))
    (Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@59@01) (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in r@59@01 lists@3@01))
  :pattern ((Set_in r@59@01 lists@3@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@59@01) (as Set_empty  Set<$Ref>)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in lists), (r2 in lists) } { (r1 in lists), (r2 in s) } { (r1 in s), (r2 in lists) } { (r1 in s), (r2 in s) } (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next)
(declare-const r1@60@01 $Ref)
(declare-const r2@61@01 $Ref)
(push) ; 4
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2)))
; [eval] (r1 in lists)
(push) ; 5
; [then-branch: 18 | !(r1@60@01 in lists@3@01) | live]
; [else-branch: 18 | r1@60@01 in lists@3@01 | live]
(push) ; 6
; [then-branch: 18 | !(r1@60@01 in lists@3@01)]
(assert (not (Set_in r1@60@01 lists@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | r1@60@01 in lists@3@01]
(assert (Set_in r1@60@01 lists@3@01))
; [eval] !((r1 in s))
; [eval] (r1 in s)
(push) ; 7
; [then-branch: 19 | r1@60@01 in lists@3@01 | live]
; [else-branch: 19 | !(r1@60@01 in lists@3@01) | live]
(push) ; 8
; [then-branch: 19 | r1@60@01 in lists@3@01]
(pop) ; 8
(push) ; 8
; [else-branch: 19 | !(r1@60@01 in lists@3@01)]
(assert (not (Set_in r1@60@01 lists@3@01)))
; [eval] (r2 in lists)
(push) ; 9
; [then-branch: 20 | !(r2@61@01 in lists@3@01) | live]
; [else-branch: 20 | r2@61@01 in lists@3@01 | live]
(push) ; 10
; [then-branch: 20 | !(r2@61@01 in lists@3@01)]
(assert (not (Set_in r2@61@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 20 | r2@61@01 in lists@3@01]
(assert (Set_in r2@61@01 lists@3@01))
; [eval] !((r2 in s))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 21 | r2@61@01 in lists@3@01 | live]
; [else-branch: 21 | !(r2@61@01 in lists@3@01) | live]
(push) ; 12
; [then-branch: 21 | r2@61@01 in lists@3@01]
(pop) ; 12
(push) ; 12
; [else-branch: 21 | !(r2@61@01 in lists@3@01)]
(assert (not (Set_in r2@61@01 lists@3@01)))
; [eval] r1 != r2
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@61@01 lists@3@01)) (Set_in r2@61@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r2@61@01 lists@3@01)
  (and
    (Set_in r2@61@01 lists@3@01)
    (or (not (Set_in r2@61@01 lists@3@01)) (Set_in r2@61@01 lists@3@01)))))
(assert (or (Set_in r2@61@01 lists@3@01) (not (Set_in r2@61@01 lists@3@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in r1@60@01 lists@3@01))
  (and
    (not (Set_in r1@60@01 lists@3@01))
    (=>
      (Set_in r2@61@01 lists@3@01)
      (and
        (Set_in r2@61@01 lists@3@01)
        (or (not (Set_in r2@61@01 lists@3@01)) (Set_in r2@61@01 lists@3@01))))
    (or (Set_in r2@61@01 lists@3@01) (not (Set_in r2@61@01 lists@3@01))))))
(assert (or (not (Set_in r1@60@01 lists@3@01)) (Set_in r1@60@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r1@60@01 lists@3@01)
  (and
    (Set_in r1@60@01 lists@3@01)
    (=>
      (not (Set_in r1@60@01 lists@3@01))
      (and
        (not (Set_in r1@60@01 lists@3@01))
        (=>
          (Set_in r2@61@01 lists@3@01)
          (and
            (Set_in r2@61@01 lists@3@01)
            (or (not (Set_in r2@61@01 lists@3@01)) (Set_in r2@61@01 lists@3@01))))
        (or (Set_in r2@61@01 lists@3@01) (not (Set_in r2@61@01 lists@3@01)))))
    (or (not (Set_in r1@60@01 lists@3@01)) (Set_in r1@60@01 lists@3@01)))))
(assert (or (Set_in r1@60@01 lists@3@01) (not (Set_in r1@60@01 lists@3@01))))
(push) ; 5
; [then-branch: 22 | r1@60@01 in lists@3@01 && !(r1@60@01 in lists@3@01) && r2@61@01 in lists@3@01 && !(r2@61@01 in lists@3@01) && r1@60@01 != r2@61@01 | live]
; [else-branch: 22 | !(r1@60@01 in lists@3@01 && !(r1@60@01 in lists@3@01) && r2@61@01 in lists@3@01 && !(r2@61@01 in lists@3@01) && r1@60@01 != r2@61@01) | live]
(push) ; 6
; [then-branch: 22 | r1@60@01 in lists@3@01 && !(r1@60@01 in lists@3@01) && r2@61@01 in lists@3@01 && !(r2@61@01 in lists@3@01) && r1@60@01 != r2@61@01]
(assert (and
  (Set_in r1@60@01 lists@3@01)
  (and
    (not (Set_in r1@60@01 lists@3@01))
    (and
      (Set_in r2@61@01 lists@3@01)
      (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01)))))))
; [eval] r1.next != r2.next
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(r1@60@01 in lists@3@01 && !(r1@60@01 in lists@3@01) && r2@61@01 in lists@3@01 && !(r2@61@01 in lists@3@01) && r1@60@01 != r2@61@01)]
(assert (not
  (and
    (Set_in r1@60@01 lists@3@01)
    (and
      (not (Set_in r1@60@01 lists@3@01))
      (and
        (Set_in r2@61@01 lists@3@01)
        (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Set_in r1@60@01 lists@3@01)
    (and
      (not (Set_in r1@60@01 lists@3@01))
      (and
        (Set_in r2@61@01 lists@3@01)
        (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01))))))
  (and
    (Set_in r1@60@01 lists@3@01)
    (not (Set_in r1@60@01 lists@3@01))
    (Set_in r2@61@01 lists@3@01)
    (not (Set_in r2@61@01 lists@3@01))
    (not (= r1@60@01 r2@61@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in r1@60@01 lists@3@01)
      (and
        (not (Set_in r1@60@01 lists@3@01))
        (and
          (Set_in r2@61@01 lists@3@01)
          (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01)))))))
  (and
    (Set_in r1@60@01 lists@3@01)
    (and
      (not (Set_in r1@60@01 lists@3@01))
      (and
        (Set_in r2@61@01 lists@3@01)
        (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@60@01 $Ref) (r2@61@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@60@01 lists@3@01)
      (and
        (Set_in r1@60@01 lists@3@01)
        (=>
          (not (Set_in r1@60@01 lists@3@01))
          (and
            (not (Set_in r1@60@01 lists@3@01))
            (=>
              (Set_in r2@61@01 lists@3@01)
              (and
                (Set_in r2@61@01 lists@3@01)
                (or
                  (not (Set_in r2@61@01 lists@3@01))
                  (Set_in r2@61@01 lists@3@01))))
            (or (Set_in r2@61@01 lists@3@01) (not (Set_in r2@61@01 lists@3@01)))))
        (or (not (Set_in r1@60@01 lists@3@01)) (Set_in r1@60@01 lists@3@01))))
    (or (Set_in r1@60@01 lists@3@01) (not (Set_in r1@60@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@60@01 lists@3@01)
        (and
          (not (Set_in r1@60@01 lists@3@01))
          (and
            (Set_in r2@61@01 lists@3@01)
            (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01))))))
      (and
        (Set_in r1@60@01 lists@3@01)
        (not (Set_in r1@60@01 lists@3@01))
        (Set_in r2@61@01 lists@3@01)
        (not (Set_in r2@61@01 lists@3@01))
        (not (= r1@60@01 r2@61@01))))
    (or
      (not
        (and
          (Set_in r1@60@01 lists@3@01)
          (and
            (not (Set_in r1@60@01 lists@3@01))
            (and
              (Set_in r2@61@01 lists@3@01)
              (and
                (not (Set_in r2@61@01 lists@3@01))
                (not (= r1@60@01 r2@61@01)))))))
      (and
        (Set_in r1@60@01 lists@3@01)
        (and
          (not (Set_in r1@60@01 lists@3@01))
          (and
            (Set_in r2@61@01 lists@3@01)
            (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01))))))))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(push) ; 4
(assert (not (forall ((r1@60@01 $Ref) (r2@61@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@60@01 lists@3@01)
      (and
        (not (Set_in r1@60@01 lists@3@01))
        (and
          (Set_in r2@61@01 lists@3@01)
          (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01))))))
    (not
      (=
        ($FVF.lookup_next (as sm@48@01  $FVF<next>) r1@60@01)
        ($FVF.lookup_next (as sm@48@01  $FVF<next>) r2@61@01))))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r1@60@01 $Ref) (r2@61@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@60@01 lists@3@01)
      (and
        (not (Set_in r1@60@01 lists@3@01))
        (and
          (Set_in r2@61@01 lists@3@01)
          (and (not (Set_in r2@61@01 lists@3@01)) (not (= r1@60@01 r2@61@01))))))
    (not
      (=
        ($FVF.lookup_next (as sm@48@01  $FVF<next>) r1@60@01)
        ($FVF.lookup_next (as sm@48@01  $FVF<next>) r2@61@01))))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :pattern ((Set_in r1@60@01 lists@3@01) (Set_in r2@61@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and
        (Set_in (inv@33@01 r) lists@3@01)
        (not (Set_in (inv@33@01 r) s@20@01))))
    (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (and (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 s@20@01)))
    (and (= (inv@33@01 r@32@01) r@32@01) (img@34@01 r@32@01)))
  :pattern ((Set_in r@32@01 lists@3@01))
  :pattern ((Set_in r@32@01 s@20@01))
  :pattern ((inv@33@01 r@32@01))
  :pattern ((img@34@01 r@32@01))
  :qid |quant-u-20|)))
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (and (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 s@20@01)))
    (not (= r@32@01 $Ref.null)))
  :pattern ((Set_in r@32@01 lists@3@01))
  :pattern ((Set_in r@32@01 s@20@01))
  :pattern ((inv@33@01 r@32@01))
  :pattern ((img@34@01 r@32@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  $Snap.unit))
(assert (forall ((r@35@01 $Ref)) (!
  (and
    (or (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 lists@3@01)))
    (or
      (not (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01))))
      (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01)))))
  :pattern ((Set_in r@35@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84-aux|)))
(assert (forall ((r@35@01 $Ref)) (!
  (and
    (or (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 lists@3@01)))
    (or
      (not (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01))))
      (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01)))))
  :pattern ((Set_in r@35@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84-aux|)))
(assert (forall ((r@35@01 $Ref)) (!
  (=>
    (and (Set_in r@35@01 lists@3@01) (not (Set_in r@35@01 s@20@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r@35@01)
      v@5@01))
  :pattern ((Set_in r@35@01 lists@3@01))
  :pattern ((Set_in r@35@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  $Snap.unit))
(assert (forall ((r@36@01 $Ref)) (!
  (and
    (or (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 lists@3@01)))
    (or
      (not (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01))))
      (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))))
  :pattern ((Set_in r@36@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@36@01 $Ref)) (!
  (and
    (or (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 lists@3@01)))
    (or
      (not (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01))))
      (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))))
  :pattern ((Set_in r@36@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@36@01 $Ref)) (!
  (and
    (or (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 lists@3@01)))
    (or
      (not (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01))))
      (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))))
  :pattern ((Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r@36@01) sNext@21@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@36@01 $Ref)) (!
  (=>
    (and (Set_in r@36@01 lists@3@01) (not (Set_in r@36@01 s@20@01)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r@36@01) sNext@21@01))
  :pattern ((Set_in r@36@01 lists@3@01))
  :pattern ((Set_in r@36@01 s@20@01))
  :pattern ((Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r@36@01) sNext@21@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  $Snap.unit))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@37@01 lists@3@01)
      (and
        (Set_in r1@37@01 lists@3@01)
        (=>
          (not (Set_in r1@37@01 s@20@01))
          (and
            (not (Set_in r1@37@01 s@20@01))
            (=>
              (Set_in r2@38@01 lists@3@01)
              (and
                (Set_in r2@38@01 lists@3@01)
                (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
            (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
        (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01))))
    (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (not (Set_in r1@37@01 s@20@01))
        (Set_in r2@38@01 lists@3@01)
        (not (Set_in r2@38@01 s@20@01))
        (not (= r1@37@01 r2@38@01))))
    (or
      (not
        (and
          (Set_in r1@37@01 lists@3@01)
          (and
            (not (Set_in r1@37@01 s@20@01))
            (and
              (Set_in r2@38@01 lists@3@01)
              (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
  :pattern ((Set_in r1@37@01 lists@3@01) (Set_in r2@38@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@37@01 lists@3@01)
      (and
        (Set_in r1@37@01 lists@3@01)
        (=>
          (not (Set_in r1@37@01 s@20@01))
          (and
            (not (Set_in r1@37@01 s@20@01))
            (=>
              (Set_in r2@38@01 lists@3@01)
              (and
                (Set_in r2@38@01 lists@3@01)
                (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
            (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
        (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01))))
    (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (not (Set_in r1@37@01 s@20@01))
        (Set_in r2@38@01 lists@3@01)
        (not (Set_in r2@38@01 s@20@01))
        (not (= r1@37@01 r2@38@01))))
    (or
      (not
        (and
          (Set_in r1@37@01 lists@3@01)
          (and
            (not (Set_in r1@37@01 s@20@01))
            (and
              (Set_in r2@38@01 lists@3@01)
              (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
  :pattern ((Set_in r1@37@01 lists@3@01) (Set_in r2@38@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@37@01 lists@3@01)
      (and
        (Set_in r1@37@01 lists@3@01)
        (=>
          (not (Set_in r1@37@01 s@20@01))
          (and
            (not (Set_in r1@37@01 s@20@01))
            (=>
              (Set_in r2@38@01 lists@3@01)
              (and
                (Set_in r2@38@01 lists@3@01)
                (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
            (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
        (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01))))
    (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (not (Set_in r1@37@01 s@20@01))
        (Set_in r2@38@01 lists@3@01)
        (not (Set_in r2@38@01 s@20@01))
        (not (= r1@37@01 r2@38@01))))
    (or
      (not
        (and
          (Set_in r1@37@01 lists@3@01)
          (and
            (not (Set_in r1@37@01 s@20@01))
            (and
              (Set_in r2@38@01 lists@3@01)
              (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
  :pattern ((Set_in r1@37@01 s@20@01) (Set_in r2@38@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@37@01 lists@3@01)
      (and
        (Set_in r1@37@01 lists@3@01)
        (=>
          (not (Set_in r1@37@01 s@20@01))
          (and
            (not (Set_in r1@37@01 s@20@01))
            (=>
              (Set_in r2@38@01 lists@3@01)
              (and
                (Set_in r2@38@01 lists@3@01)
                (or (not (Set_in r2@38@01 s@20@01)) (Set_in r2@38@01 s@20@01))))
            (or (Set_in r2@38@01 lists@3@01) (not (Set_in r2@38@01 lists@3@01)))))
        (or (not (Set_in r1@37@01 s@20@01)) (Set_in r1@37@01 s@20@01))))
    (or (Set_in r1@37@01 lists@3@01) (not (Set_in r1@37@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (not (Set_in r1@37@01 s@20@01))
        (Set_in r2@38@01 lists@3@01)
        (not (Set_in r2@38@01 s@20@01))
        (not (= r1@37@01 r2@38@01))))
    (or
      (not
        (and
          (Set_in r1@37@01 lists@3@01)
          (and
            (not (Set_in r1@37@01 s@20@01))
            (and
              (Set_in r2@38@01 lists@3@01)
              (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01)))))))
      (and
        (Set_in r1@37@01 lists@3@01)
        (and
          (not (Set_in r1@37@01 s@20@01))
          (and
            (Set_in r2@38@01 lists@3@01)
            (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))))
  :pattern ((Set_in r1@37@01 s@20@01) (Set_in r2@38@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@37@01 $Ref) (r2@38@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@37@01 lists@3@01)
      (and
        (not (Set_in r1@37@01 s@20@01))
        (and
          (Set_in r2@38@01 lists@3@01)
          (and (not (Set_in r2@38@01 s@20@01)) (not (= r1@37@01 r2@38@01))))))
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r1@37@01)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r2@38@01))))
  :pattern ((Set_in r1@37@01 lists@3@01) (Set_in r2@38@01 lists@3@01))
  :pattern ((Set_in r1@37@01 lists@3@01) (Set_in r2@38@01 s@20@01))
  :pattern ((Set_in r1@37@01 s@20@01) (Set_in r2@38@01 lists@3@01))
  :pattern ((Set_in r1@37@01 s@20@01) (Set_in r2@38@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
    (and (= (inv@30@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@30@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r@29@01 $Ref)) (!
  (=>
    (Set_in r@29@01 sNext@21@01)
    (and
      (= (inv@30@01 r@29@01 (- length@4@01 1)) r@29@01)
      (img@31@01 r@29@01 (- length@4@01 1))))
  :pattern ((Set_in r@29@01 sNext@21@01))
  :pattern ((inv@30@01 r@29@01 (- length@4@01 1)))
  :pattern ((img@31@01 r@29@01 (- length@4@01 1)))
  :qid |quant-u-17|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@22@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (and (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 s@20@01)))
    (or (Set_in r@32@01 lists@3@01) (not (Set_in r@32@01 lists@3@01))))
  :pattern ((Set_in r@32@01 lists@3@01))
  :pattern ((Set_in r@32@01 s@20@01))
  :pattern ((inv@33@01 r@32@01))
  :pattern ((img@34@01 r@32@01))
  :qid |val-aux|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (= (inv@27@01 r) r))
  :pattern ((inv@27@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r@26@01 $Ref)) (!
  (=>
    (and (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 s@20@01)))
    (and (= (inv@27@01 r@26@01) r@26@01) (img@28@01 r@26@01)))
  :pattern ((Set_in r@26@01 lists@3@01))
  :pattern ((Set_in r@26@01 s@20@01))
  :pattern ((inv@27@01 r@26@01))
  :pattern ((img@28@01 r@26@01))
  :qid |quant-u-15|)))
(assert (forall ((r@26@01 $Ref)) (!
  (=>
    (and (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 s@20@01)))
    (not (= r@26@01 $Ref.null)))
  :pattern ((Set_in r@26@01 lists@3@01))
  :pattern ((Set_in r@26@01 s@20@01))
  :pattern ((inv@27@01 r@26@01))
  :pattern ((img@28@01 r@26@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
    (and (= (inv@24@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@24@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r@23@01 $Ref)) (!
  (=>
    (Set_in r@23@01 s@20@01)
    (and
      (= (inv@24@01 r@23@01 length@4@01) r@23@01)
      (img@25@01 r@23@01 length@4@01)))
  :pattern ((Set_in r@23@01 s@20@01))
  :pattern ((inv@24@01 r@23@01 length@4@01))
  :pattern ((img@25@01 r@23@01 length@4@01))
  :qid |quant-u-13|)))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (forall ((r@26@01 $Ref)) (!
  (=>
    (and (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 s@20@01)))
    (or (Set_in r@26@01 lists@3@01) (not (Set_in r@26@01 lists@3@01))))
  :pattern ((Set_in r@26@01 lists@3@01))
  :pattern ((Set_in r@26@01 s@20@01))
  :pattern ((inv@27@01 r@26@01))
  :pattern ((img@28@01 r@26@01))
  :qid |next-aux|)))
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] |s| > 0
; [eval] |s|
(pop) ; 5
(push) ; 5
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] |s| > 0
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (Set_card s@20@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> (Set_card s@20@01) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | |s@20@01| > 0 | live]
; [else-branch: 23 | !(|s@20@01| > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | |s@20@01| > 0]
(assert (> (Set_card s@20@01) 0))
; [exec]
; var l: Ref
(declare-const l@62@01 $Ref)
; [exec]
; inhale (l in s)
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 $Snap.unit))
; [eval] (l in s)
(assert (Set_in l@62@01 s@20@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(list(l, length), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@64@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l@62@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@65@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l@62@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@64@01 r i)))
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
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      (pTaken@64@01 r i))
    $Perm.No)
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@64@01 r i) $Perm.No)
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l@62@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@64@01 r i)) $Perm.No))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@66@01 $PSF<list>)
(declare-const s@67@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@25@01 l@62@01 length@4@01)
    (Set_in (inv@24@01 l@62@01 length@4@01) s@20@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@62@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@62@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@62@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (and
    (img@31@01 l@62@01 length@4@01)
    (Set_in (inv@30@01 l@62@01 length@4@01) sNext@21@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@62@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@62@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@22@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@62@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | length@4@01 > 0 | live]
; [else-branch: 24 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 24 | length@4@01 > 0]
(assert (=
  ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@62@01)
    ($SortWrappers.IntTo$Snap length@4@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@62@01)
      ($SortWrappers.IntTo$Snap length@4@01))))
    ($Snap.second ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@62@01)
      ($SortWrappers.IntTo$Snap length@4@01)))))))
(declare-const sm@68@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@68@01  $FVF<val>) l@62@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@62@01)
    ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (not (= l@62@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@62@01)
    ($SortWrappers.IntTo$Snap length@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@62@01)
      ($SortWrappers.IntTo$Snap length@4@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@62@01)
      ($SortWrappers.IntTo$Snap length@4@01))))))))
(declare-const sm@69@01 $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (as sm@69@01  $FVF<next>) l@62@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@62@01)
    ($SortWrappers.IntTo$Snap length@4@01))))))))
(declare-const sm@70@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfValDef5|)))
(declare-const pm@71@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@71@01  $FPM) r)
    (+
      (ite
        (and
          (img@28@01 r)
          (and
            (Set_in (inv@27@01 r) lists@3@01)
            (not (Set_in (inv@27@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)
      (ite (= r l@62@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_next (as pm@71@01  $FPM) l@62@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] i - 1
(declare-const sm@72@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@72@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1))))
  ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@62@01)
    ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (<=
  $Perm.No
  (ite
    (and
      (=
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01)
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01))
      (= (- length@4@01 1) (- length@4@01 1)))
    $Perm.Write
    $Perm.No)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@62@01)
  ($SortWrappers.IntTo$Snap length@4@01))) l@62@01 length@4@01))
; [exec]
; inhale (forall r: Ref ::
;     { (r in lists) }
;     { (r in s) }
;     (r in lists) && !((r in s)) ==> r.next != l.next)
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } (r in lists) && !((r in s)) ==> r.next != l.next)
(declare-const r@74@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) && !((r in s)) ==> r.next != l.next
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 25 | !(r@74@01 in lists@3@01) | live]
; [else-branch: 25 | r@74@01 in lists@3@01 | live]
(push) ; 9
; [then-branch: 25 | !(r@74@01 in lists@3@01)]
(assert (not (Set_in r@74@01 lists@3@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 25 | r@74@01 in lists@3@01]
(assert (Set_in r@74@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 lists@3@01))))
(push) ; 8
; [then-branch: 26 | r@74@01 in lists@3@01 && !(r@74@01 in s@20@01) | live]
; [else-branch: 26 | !(r@74@01 in lists@3@01 && !(r@74@01 in s@20@01)) | live]
(push) ; 9
; [then-branch: 26 | r@74@01 in lists@3@01 && !(r@74@01 in s@20@01)]
(assert (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01))))
; [eval] r.next != l.next
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@28@01 r)
        (and
          (Set_in (inv@27@01 r) lists@3@01)
          (not (Set_in (inv@27@01 r) s@20@01))))
      (=
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
    :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (= r l@62@01)
      (=
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
    :qid |qp.fvfValDef5|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@28@01 r@74@01)
        (and
          (Set_in (inv@27@01 r@74@01) lists@3@01)
          (not (Set_in (inv@27@01 r@74@01) s@20@01))))
      $Perm.Write
      $Perm.No)
    (ite (= r@74@01 l@62@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@28@01 r)
        (and
          (Set_in (inv@27@01 r) lists@3@01)
          (not (Set_in (inv@27@01 r) s@20@01))))
      (=
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
    :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (= r l@62@01)
      (=
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
    :qid |qp.fvfValDef5|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@28@01 l@62@01)
        (and
          (Set_in (inv@27@01 l@62@01) lists@3@01)
          (not (Set_in (inv@27@01 l@62@01) s@20@01))))
      $Perm.Write
      $Perm.No)
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 26 | !(r@74@01 in lists@3@01 && !(r@74@01 in s@20@01))]
(assert (not (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfValDef5|)))
; Joined path conditions
(assert (or
  (not (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01))))
  (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfValDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@74@01 $Ref)) (!
  (and
    (or (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 lists@3@01)))
    (or
      (not (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01))))
      (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01)))))
  :pattern ((Set_in r@74@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@41@16@41@77-aux|)))
(assert (forall ((r@74@01 $Ref)) (!
  (and
    (or (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 lists@3@01)))
    (or
      (not (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01))))
      (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01)))))
  :pattern ((Set_in r@74@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@41@16@41@77-aux|)))
(assert (forall ((r@74@01 $Ref)) (!
  (=>
    (and (Set_in r@74@01 lists@3@01) (not (Set_in r@74@01 s@20@01)))
    (not
      (=
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) r@74@01)
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01))))
  :pattern ((Set_in r@74@01 lists@3@01))
  :pattern ((Set_in r@74@01 s@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@41@16@41@77|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; s := (s setminus Set(l))
; [eval] (s setminus Set(l))
; [eval] Set(l)
(declare-const s@75@01 Set<$Ref>)
(assert (= s@75@01 (Set_difference s@20@01 (Set_singleton l@62@01))))
; [exec]
; sNext := (sNext union Set(l.next))
; [eval] (sNext union Set(l.next))
; [eval] Set(l.next)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@28@01 r)
        (and
          (Set_in (inv@27@01 r) lists@3@01)
          (not (Set_in (inv@27@01 r) s@20@01))))
      (=
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
    :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (= r l@62@01)
      (=
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@70@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
    :qid |qp.fvfValDef5|))))
(set-option :timeout 0)
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@28@01 l@62@01)
        (and
          (Set_in (inv@27@01 l@62@01) lists@3@01)
          (not (Set_in (inv@27@01 l@62@01) s@20@01))))
      $Perm.Write
      $Perm.No)
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sNext@76@01 Set<$Ref>)
(assert (=
  sNext@76@01
  (Set_union sNext@21@01 (Set_singleton ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01)))))
; [exec]
; l.val := v
; Precomputing data for removing quantified permissions
(define-fun pTaken@77@01 ((r $Ref)) $Perm
  (ite
    (= r l@62@01)
    ($Perm.min (ite (= r l@62@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (= r l@62@01)
    ($Perm.min
      (ite
        (and
          (img@34@01 r)
          (and
            (Set_in (inv@33@01 r) lists@3@01)
            (not (Set_in (inv@33@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@77@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@77@01 l@62@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r l@62@01) (= (- $Perm.Write (pTaken@77@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@79@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@79@01  $FVF<val>) l@62@01) v@5@01))
; Loop head block: Re-establish invariant
(declare-const r@80@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in s)
(assert (Set_in r@80@01 s@75@01))
(pop) ; 7
(declare-fun inv@81@01 ($Ref Int) $Ref)
(declare-fun img@82@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@80@01 $Ref) (r2@80@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@80@01 s@75@01)
      (Set_in r2@80@01 s@75@01)
      (= r1@80@01 r2@80@01))
    (= r1@80@01 r2@80@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@80@01 $Ref)) (!
  (=>
    (Set_in r@80@01 s@75@01)
    (and
      (= (inv@81@01 r@80@01 length@4@01) r@80@01)
      (img@82@01 r@80@01 length@4@01)))
  :pattern ((Set_in r@80@01 s@75@01))
  :pattern ((inv@81@01 r@80@01 length@4@01))
  :pattern ((img@82@01 r@80@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@82@01 r i) (Set_in (inv@81@01 r i) s@75@01))
    (and (= (inv@81@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@81@01 r i))
  :qid |list-fctOfInv|)))
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r@80@01 $Ref)) (!
  (= length@4@01 (- length@4@01 1))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@83@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@81@01 r i) s@75@01)
      (img@82@01 r i)
      (and (= r (inv@81@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        (- $Perm.Write (pTaken@64@01 r i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@84@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@81@01 r i) s@75@01)
      (img@82@01 r i)
      (and (= r (inv@81@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite
        (and
          (= r ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01))
          (= i (- length@4@01 1)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@83@01 r i)))
    $Perm.No))
(define-fun pTaken@85@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@81@01 r i) s@75@01)
      (img@82@01 r i)
      (and (= r (inv@81@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite
        (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@83@01 r i)) (pTaken@84@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        (- $Perm.Write (pTaken@64@01 r i))
        $Perm.No)
      (pTaken@83@01 r i))
    $Perm.No)
  
  :qid |quant-u-41|))))
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
    (and
      (Set_in (inv@81@01 r i) s@75@01)
      (img@82@01 r i)
      (and (= r (inv@81@01 r i)) (= i length@4@01)))
    (= (- $Perm.Write (pTaken@83@01 r i)) $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@86@01 $PSF<list>)
(declare-const s@87@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@87@01))
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01))
      (= ($SortWrappers.$SnapToInt ($Snap.second s@87@01)) (- length@4@01 1)))
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@86@01  $PSF<list>) s@87@01)
        ($PSF.lookup_list (as sm@72@01  $PSF<list>) s@87@01))))
  :pattern (($PSF.lookup_list (as sm@86@01  $PSF<list>) s@87@01))
  :pattern (($PSF.lookup_list (as sm@72@01  $PSF<list>) s@87@01))
  :qid |qp.psmValDef7|)))
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@25@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
        (Set_in (inv@24@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01))) s@20@01))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@64@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))))
      false)
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@86@01  $PSF<list>) s@87@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) s@87@01))))
  :pattern (($PSF.lookup_list (as sm@86@01  $PSF<list>) s@87@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) s@87@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (and
      (img@31@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
      (Set_in (inv@30@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01))) sNext@21@01))
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@86@01  $PSF<list>) s@87@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@22@01)))) s@87@01))))
  :pattern (($PSF.lookup_list (as sm@86@01  $PSF<list>) s@87@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@22@01)))) s@87@01))
  :qid |qp.psmValDef9|)))
(declare-const r@88@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 27 | !(r@88@01 in lists@3@01) | live]
; [else-branch: 27 | r@88@01 in lists@3@01 | live]
(push) ; 9
; [then-branch: 27 | !(r@88@01 in lists@3@01)]
(assert (not (Set_in r@88@01 lists@3@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 27 | r@88@01 in lists@3@01]
(assert (Set_in r@88@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@88@01 lists@3@01) (not (Set_in r@88@01 lists@3@01))))
(assert (and (Set_in r@88@01 lists@3@01) (not (Set_in r@88@01 s@75@01))))
(pop) ; 7
(declare-fun inv@89@01 ($Ref) $Ref)
(declare-fun img@90@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@88@01 $Ref)) (!
  (=>
    (and (Set_in r@88@01 lists@3@01) (not (Set_in r@88@01 s@75@01)))
    (or (Set_in r@88@01 lists@3@01) (not (Set_in r@88@01 lists@3@01))))
  :pattern ((Set_in r@88@01 lists@3@01))
  :pattern ((Set_in r@88@01 s@75@01))
  :pattern ((inv@89@01 r@88@01))
  :pattern ((img@90@01 r@88@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@88@01 $Ref) (r2@88@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@88@01 lists@3@01) (not (Set_in r1@88@01 s@75@01)))
      (and (Set_in r2@88@01 lists@3@01) (not (Set_in r2@88@01 s@75@01)))
      (= r1@88@01 r2@88@01))
    (= r1@88@01 r2@88@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@88@01 $Ref)) (!
  (=>
    (and (Set_in r@88@01 lists@3@01) (not (Set_in r@88@01 s@75@01)))
    (and (= (inv@89@01 r@88@01) r@88@01) (img@90@01 r@88@01)))
  :pattern ((Set_in r@88@01 lists@3@01))
  :pattern ((Set_in r@88@01 s@75@01))
  :pattern ((inv@89@01 r@88@01))
  :pattern ((img@90@01 r@88@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@01 r)
      (and
        (Set_in (inv@89@01 r) lists@3@01)
        (not (Set_in (inv@89@01 r) s@75@01))))
    (= (inv@89@01 r) r))
  :pattern ((inv@89@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@91@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@89@01 r) lists@3@01)
        (not (Set_in (inv@89@01 r) s@75@01)))
      (img@90@01 r)
      (= r (inv@89@01 r)))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and
            (Set_in (inv@27@01 r) lists@3@01)
            (not (Set_in (inv@27@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@92@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@89@01 r) lists@3@01)
        (not (Set_in (inv@89@01 r) s@75@01)))
      (img@90@01 r)
      (= r (inv@89@01 r)))
    ($Perm.min
      (ite (= r l@62@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@91@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@28@01 r)
          (and
            (Set_in (inv@27@01 r) lists@3@01)
            (not (Set_in (inv@27@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@91@01 r))
    $Perm.No)
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@01 r) lists@3@01)
        (not (Set_in (inv@89@01 r) s@75@01)))
      (img@90@01 r)
      (= r (inv@89@01 r)))
    (= (- $Perm.Write (pTaken@91@01 r)) $Perm.No))
  
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
(assert (not (= (- $Perm.Write (pTaken@92@01 l@62@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@92@01 r) $Perm.No)
  
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
    (and
      (and
        (Set_in (inv@89@01 r) lists@3@01)
        (not (Set_in (inv@89@01 r) s@75@01)))
      (img@90@01 r)
      (= r (inv@89@01 r)))
    (= (- (- $Perm.Write (pTaken@91@01 r)) (pTaken@92@01 r)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const r@93@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in sNext)
(assert (Set_in r@93@01 sNext@76@01))
; [eval] length - 1
(pop) ; 7
(declare-fun inv@94@01 ($Ref Int) $Ref)
(declare-fun img@95@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@93@01 $Ref) (r2@93@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@93@01 sNext@76@01)
      (Set_in r2@93@01 sNext@76@01)
      (= r1@93@01 r2@93@01))
    (= r1@93@01 r2@93@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@93@01 $Ref)) (!
  (=>
    (Set_in r@93@01 sNext@76@01)
    (and
      (= (inv@94@01 r@93@01 (- length@4@01 1)) r@93@01)
      (img@95@01 r@93@01 (- length@4@01 1))))
  :pattern ((Set_in r@93@01 sNext@76@01))
  :pattern ((inv@94@01 r@93@01 (- length@4@01 1)))
  :pattern ((img@95@01 r@93@01 (- length@4@01 1)))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@95@01 r i) (Set_in (inv@94@01 r i) sNext@76@01))
    (and (= (inv@94@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@94@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@96@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@94@01 r i) sNext@76@01)
      (img@95@01 r i)
      (and (= r (inv@94@01 r i)) (= i (- length@4@01 1))))
    ($Perm.min
      (ite
        (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@97@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@94@01 r i) sNext@76@01)
      (img@95@01 r i)
      (and (= r (inv@94@01 r i)) (= i (- length@4@01 1))))
    ($Perm.min
      (ite
        (and
          (= r ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01))
          (= i (- length@4@01 1)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@96@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@96@01 r i))
    $Perm.No)
  
  :qid |quant-u-52|))))
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
    (and
      (Set_in (inv@94@01 r i) sNext@76@01)
      (img@95@01 r i)
      (and (= r (inv@94@01 r i)) (= i (- length@4@01 1))))
    (= (- $Perm.Write (pTaken@96@01 r i)) $Perm.No))
  
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
(assert (not (=
  (-
    (ite
      (and
        (=
          ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01)
          ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01))
        (= (- length@4@01 1) (- length@4@01 1)))
      $Perm.Write
      $Perm.No)
    (pTaken@97@01 ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01) (-
      length@4@01
      1)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@97@01 r i) $Perm.No)
  
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Set_in (inv@94@01 r i) sNext@76@01)
      (img@95@01 r i)
      (and (= r (inv@94@01 r i)) (= i (- length@4@01 1))))
    (= (- (- $Perm.Write (pTaken@96@01 r i)) (pTaken@97@01 r i)) $Perm.No))
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@98@01 $PSF<list>)
(declare-const s@99@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@99@01 $Snap)) (!
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01))
        ($FVF.lookup_next (as sm@70@01  $FVF<next>) l@62@01))
      (= ($SortWrappers.$SnapToInt ($Snap.second s@99@01)) (- length@4@01 1)))
    (and
      (not (= s@99@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@98@01  $PSF<list>) s@99@01)
        ($PSF.lookup_list (as sm@72@01  $PSF<list>) s@99@01))))
  :pattern (($PSF.lookup_list (as sm@98@01  $PSF<list>) s@99@01))
  :pattern (($PSF.lookup_list (as sm@72@01  $PSF<list>) s@99@01))
  :qid |qp.psmValDef10|)))
(assert (forall ((s@99@01 $Snap)) (!
  (=>
    (and
      (img@31@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01)))
      (Set_in (inv@30@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))) sNext@21@01))
    (and
      (not (= s@99@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@98@01  $PSF<list>) s@99@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@22@01)))) s@99@01))))
  :pattern (($PSF.lookup_list (as sm@98@01  $PSF<list>) s@99@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@22@01)))) s@99@01))
  :qid |qp.psmValDef11|)))
(declare-const r@100@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 28 | !(r@100@01 in lists@3@01) | live]
; [else-branch: 28 | r@100@01 in lists@3@01 | live]
(push) ; 9
; [then-branch: 28 | !(r@100@01 in lists@3@01)]
(assert (not (Set_in r@100@01 lists@3@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 28 | r@100@01 in lists@3@01]
(assert (Set_in r@100@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@100@01 lists@3@01) (not (Set_in r@100@01 lists@3@01))))
(assert (and (Set_in r@100@01 lists@3@01) (not (Set_in r@100@01 s@75@01))))
(pop) ; 7
(declare-fun inv@101@01 ($Ref) $Ref)
(declare-fun img@102@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@100@01 $Ref)) (!
  (=>
    (and (Set_in r@100@01 lists@3@01) (not (Set_in r@100@01 s@75@01)))
    (or (Set_in r@100@01 lists@3@01) (not (Set_in r@100@01 lists@3@01))))
  :pattern ((Set_in r@100@01 lists@3@01))
  :pattern ((Set_in r@100@01 s@75@01))
  :pattern ((inv@101@01 r@100@01))
  :pattern ((img@102@01 r@100@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@100@01 $Ref) (r2@100@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@100@01 lists@3@01) (not (Set_in r1@100@01 s@75@01)))
      (and (Set_in r2@100@01 lists@3@01) (not (Set_in r2@100@01 s@75@01)))
      (= r1@100@01 r2@100@01))
    (= r1@100@01 r2@100@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@100@01 $Ref)) (!
  (=>
    (and (Set_in r@100@01 lists@3@01) (not (Set_in r@100@01 s@75@01)))
    (and (= (inv@101@01 r@100@01) r@100@01) (img@102@01 r@100@01)))
  :pattern ((Set_in r@100@01 lists@3@01))
  :pattern ((Set_in r@100@01 s@75@01))
  :pattern ((inv@101@01 r@100@01))
  :pattern ((img@102@01 r@100@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@102@01 r)
      (and
        (Set_in (inv@101@01 r) lists@3@01)
        (not (Set_in (inv@101@01 r) s@75@01))))
    (= (inv@101@01 r) r))
  :pattern ((inv@101@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@103@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@101@01 r) lists@3@01)
        (not (Set_in (inv@101@01 r) s@75@01)))
      (img@102@01 r)
      (= r (inv@101@01 r)))
    ($Perm.min
      (ite
        (and
          (img@34@01 r)
          (and
            (Set_in (inv@33@01 r) lists@3@01)
            (not (Set_in (inv@33@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@101@01 r) lists@3@01)
        (not (Set_in (inv@101@01 r) s@75@01)))
      (img@102@01 r)
      (= r (inv@101@01 r)))
    ($Perm.min
      (ite (= r l@62@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@103@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@34@01 r)
          (and
            (Set_in (inv@33@01 r) lists@3@01)
            (not (Set_in (inv@33@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@103@01 r))
    $Perm.No)
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@101@01 r) lists@3@01)
        (not (Set_in (inv@101@01 r) s@75@01)))
      (img@102@01 r)
      (= r (inv@101@01 r)))
    (= (- $Perm.Write (pTaken@103@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@104@01 l@62@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@104@01 r) $Perm.No)
  
  :qid |quant-u-62|))))
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
    (and
      (and
        (Set_in (inv@101@01 r) lists@3@01)
        (not (Set_in (inv@101@01 r) s@75@01)))
      (img@102@01 r)
      (= r (inv@101@01 r)))
    (= (- (- $Perm.Write (pTaken@103@01 r)) (pTaken@104@01 r)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@105@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and
        (Set_in (inv@33@01 r) lists@3@01)
        (not (Set_in (inv@33@01 r) s@20@01))))
    (=
      ($FVF.lookup_val (as sm@105@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@105@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_val (as sm@105@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@79@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@105@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@79@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } (r in lists) && !((r in s)) ==> r.val == v)
(declare-const r@106@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) && !((r in s)) ==> r.val == v
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 29 | !(r@106@01 in lists@3@01) | live]
; [else-branch: 29 | r@106@01 in lists@3@01 | live]
(push) ; 9
; [then-branch: 29 | !(r@106@01 in lists@3@01)]
(assert (not (Set_in r@106@01 lists@3@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 29 | r@106@01 in lists@3@01]
(assert (Set_in r@106@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 lists@3@01))))
(push) ; 8
; [then-branch: 30 | r@106@01 in lists@3@01 && !(r@106@01 in s@75@01) | live]
; [else-branch: 30 | !(r@106@01 in lists@3@01 && !(r@106@01 in s@75@01)) | live]
(push) ; 9
; [then-branch: 30 | r@106@01 in lists@3@01 && !(r@106@01 in s@75@01)]
(assert (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01))))
; [eval] r.val == v
(declare-const sm@107@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@79@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@79@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and
        (Set_in (inv@33@01 r) lists@3@01)
        (not (Set_in (inv@33@01 r) s@20@01))))
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r))
  :qid |qp.fvfValDef15|)))
(declare-const pm@108@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@108@01  $FPM) r)
    (+
      (ite (= r l@62@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@34@01 r)
          (and
            (Set_in (inv@33@01 r) lists@3@01)
            (not (Set_in (inv@33@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@108@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_val (as pm@108@01  $FPM) r@106@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 30 | !(r@106@01 in lists@3@01 && !(r@106@01 in s@75@01))]
(assert (not (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@79@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@79@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and
        (Set_in (inv@33@01 r) lists@3@01)
        (not (Set_in (inv@33@01 r) s@20@01))))
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@108@01  $FPM) r)
    (+
      (ite (= r l@62@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@34@01 r)
          (and
            (Set_in (inv@33@01 r) lists@3@01)
            (not (Set_in (inv@33@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@108@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
; Joined path conditions
(assert (or
  (not (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01))))
  (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@79@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@79@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and
        (Set_in (inv@33@01 r) lists@3@01)
        (not (Set_in (inv@33@01 r) s@20@01))))
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@108@01  $FPM) r)
    (+
      (ite (= r l@62@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@34@01 r)
          (and
            (Set_in (inv@33@01 r) lists@3@01)
            (not (Set_in (inv@33@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@108@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@106@01 $Ref)) (!
  (and
    (or (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 lists@3@01)))
    (or
      (not (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01))))
      (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01)))))
  :pattern ((Set_in r@106@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84-aux|)))
(assert (forall ((r@106@01 $Ref)) (!
  (and
    (or (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 lists@3@01)))
    (or
      (not (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01))))
      (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01)))))
  :pattern ((Set_in r@106@01 s@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84-aux|)))
(push) ; 7
(assert (not (forall ((r@106@01 $Ref)) (!
  (=>
    (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01)))
    (= ($FVF.lookup_val (as sm@107@01  $FVF<val>) r@106@01) v@5@01))
  :pattern ((Set_in r@106@01 lists@3@01))
  :pattern ((Set_in r@106@01 s@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@106@01 $Ref)) (!
  (=>
    (and (Set_in r@106@01 lists@3@01) (not (Set_in r@106@01 s@75@01)))
    (= ($FVF.lookup_val (as sm@107@01  $FVF<val>) r@106@01) v@5@01))
  :pattern ((Set_in r@106@01 lists@3@01))
  :pattern ((Set_in r@106@01 s@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@34@15@34@84|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { (r.next in sNext) } (r in lists) && !((r in s)) ==> (r.next in sNext))
(declare-const r@109@01 $Ref)
(push) ; 7
; [eval] (r in lists) && !((r in s)) ==> (r.next in sNext)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 31 | !(r@109@01 in lists@3@01) | live]
; [else-branch: 31 | r@109@01 in lists@3@01 | live]
(push) ; 9
; [then-branch: 31 | !(r@109@01 in lists@3@01)]
(assert (not (Set_in r@109@01 lists@3@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 31 | r@109@01 in lists@3@01]
(assert (Set_in r@109@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 lists@3@01))))
(push) ; 8
; [then-branch: 32 | r@109@01 in lists@3@01 && !(r@109@01 in s@75@01) | live]
; [else-branch: 32 | !(r@109@01 in lists@3@01 && !(r@109@01 in s@75@01)) | live]
(push) ; 9
; [then-branch: 32 | r@109@01 in lists@3@01 && !(r@109@01 in s@75@01)]
(assert (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01))))
; [eval] (r.next in sNext)
(declare-const sm@110@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef18|)))
(declare-const pm@111@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@111@01  $FPM) r)
    (+
      (ite (= r l@62@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@28@01 r)
          (and
            (Set_in (inv@27@01 r) lists@3@01)
            (not (Set_in (inv@27@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@111@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_next (as pm@111@01  $FPM) r@109@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 32 | !(r@109@01 in lists@3@01 && !(r@109@01 in s@75@01))]
(assert (not (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@111@01  $FPM) r)
    (+
      (ite (= r l@62@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@28@01 r)
          (and
            (Set_in (inv@27@01 r) lists@3@01)
            (not (Set_in (inv@27@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@111@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
; Joined path conditions
(assert (or
  (not (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01))))
  (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@111@01  $FPM) r)
    (+
      (ite (= r l@62@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@28@01 r)
          (and
            (Set_in (inv@27@01 r) lists@3@01)
            (not (Set_in (inv@27@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@111@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@109@01 $Ref)) (!
  (and
    (or (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 lists@3@01)))
    (or
      (not (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01))))
      (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01)))))
  :pattern ((Set_in r@109@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@109@01 $Ref)) (!
  (and
    (or (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 lists@3@01)))
    (or
      (not (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01))))
      (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01)))))
  :pattern ((Set_in r@109@01 s@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(assert (forall ((r@109@01 $Ref)) (!
  (and
    (or (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 lists@3@01)))
    (or
      (not (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01))))
      (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@110@01  $FVF<next>) r@109@01) sNext@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75-aux|)))
(push) ; 7
(assert (not (forall ((r@109@01 $Ref)) (!
  (=>
    (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01)))
    (Set_in ($FVF.lookup_next (as sm@110@01  $FVF<next>) r@109@01) sNext@76@01))
  :pattern ((Set_in r@109@01 lists@3@01))
  :pattern ((Set_in r@109@01 s@75@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@110@01  $FVF<next>) r@109@01) sNext@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@109@01 $Ref)) (!
  (=>
    (and (Set_in r@109@01 lists@3@01) (not (Set_in r@109@01 s@75@01)))
    (Set_in ($FVF.lookup_next (as sm@110@01  $FVF<next>) r@109@01) sNext@76@01))
  :pattern ((Set_in r@109@01 lists@3@01))
  :pattern ((Set_in r@109@01 s@75@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@110@01  $FVF<next>) r@109@01) sNext@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@35@15@35@75|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in lists), (r2 in lists) } { (r1 in lists), (r2 in s) } { (r1 in s), (r2 in lists) } { (r1 in s), (r2 in s) } (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next)
(declare-const r1@112@01 $Ref)
(declare-const r2@113@01 $Ref)
(push) ; 7
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2)))
; [eval] (r1 in lists)
(push) ; 8
; [then-branch: 33 | !(r1@112@01 in lists@3@01) | live]
; [else-branch: 33 | r1@112@01 in lists@3@01 | live]
(push) ; 9
; [then-branch: 33 | !(r1@112@01 in lists@3@01)]
(assert (not (Set_in r1@112@01 lists@3@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 33 | r1@112@01 in lists@3@01]
(assert (Set_in r1@112@01 lists@3@01))
; [eval] !((r1 in s))
; [eval] (r1 in s)
(push) ; 10
; [then-branch: 34 | r1@112@01 in s@75@01 | live]
; [else-branch: 34 | !(r1@112@01 in s@75@01) | live]
(push) ; 11
; [then-branch: 34 | r1@112@01 in s@75@01]
(assert (Set_in r1@112@01 s@75@01))
(pop) ; 11
(push) ; 11
; [else-branch: 34 | !(r1@112@01 in s@75@01)]
(assert (not (Set_in r1@112@01 s@75@01)))
; [eval] (r2 in lists)
(push) ; 12
; [then-branch: 35 | !(r2@113@01 in lists@3@01) | live]
; [else-branch: 35 | r2@113@01 in lists@3@01 | live]
(push) ; 13
; [then-branch: 35 | !(r2@113@01 in lists@3@01)]
(assert (not (Set_in r2@113@01 lists@3@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 35 | r2@113@01 in lists@3@01]
(assert (Set_in r2@113@01 lists@3@01))
; [eval] !((r2 in s))
; [eval] (r2 in s)
(push) ; 14
; [then-branch: 36 | r2@113@01 in s@75@01 | live]
; [else-branch: 36 | !(r2@113@01 in s@75@01) | live]
(push) ; 15
; [then-branch: 36 | r2@113@01 in s@75@01]
(assert (Set_in r2@113@01 s@75@01))
(pop) ; 15
(push) ; 15
; [else-branch: 36 | !(r2@113@01 in s@75@01)]
(assert (not (Set_in r2@113@01 s@75@01)))
; [eval] r1 != r2
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@113@01 s@75@01)) (Set_in r2@113@01 s@75@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r2@113@01 lists@3@01)
  (and
    (Set_in r2@113@01 lists@3@01)
    (or (not (Set_in r2@113@01 s@75@01)) (Set_in r2@113@01 s@75@01)))))
(assert (or (Set_in r2@113@01 lists@3@01) (not (Set_in r2@113@01 lists@3@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in r1@112@01 s@75@01))
  (and
    (not (Set_in r1@112@01 s@75@01))
    (=>
      (Set_in r2@113@01 lists@3@01)
      (and
        (Set_in r2@113@01 lists@3@01)
        (or (not (Set_in r2@113@01 s@75@01)) (Set_in r2@113@01 s@75@01))))
    (or (Set_in r2@113@01 lists@3@01) (not (Set_in r2@113@01 lists@3@01))))))
(assert (or (not (Set_in r1@112@01 s@75@01)) (Set_in r1@112@01 s@75@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r1@112@01 lists@3@01)
  (and
    (Set_in r1@112@01 lists@3@01)
    (=>
      (not (Set_in r1@112@01 s@75@01))
      (and
        (not (Set_in r1@112@01 s@75@01))
        (=>
          (Set_in r2@113@01 lists@3@01)
          (and
            (Set_in r2@113@01 lists@3@01)
            (or (not (Set_in r2@113@01 s@75@01)) (Set_in r2@113@01 s@75@01))))
        (or (Set_in r2@113@01 lists@3@01) (not (Set_in r2@113@01 lists@3@01)))))
    (or (not (Set_in r1@112@01 s@75@01)) (Set_in r1@112@01 s@75@01)))))
(assert (or (Set_in r1@112@01 lists@3@01) (not (Set_in r1@112@01 lists@3@01))))
(push) ; 8
; [then-branch: 37 | r1@112@01 in lists@3@01 && !(r1@112@01 in s@75@01) && r2@113@01 in lists@3@01 && !(r2@113@01 in s@75@01) && r1@112@01 != r2@113@01 | live]
; [else-branch: 37 | !(r1@112@01 in lists@3@01 && !(r1@112@01 in s@75@01) && r2@113@01 in lists@3@01 && !(r2@113@01 in s@75@01) && r1@112@01 != r2@113@01) | live]
(push) ; 9
; [then-branch: 37 | r1@112@01 in lists@3@01 && !(r1@112@01 in s@75@01) && r2@113@01 in lists@3@01 && !(r2@113@01 in s@75@01) && r1@112@01 != r2@113@01]
(assert (and
  (Set_in r1@112@01 lists@3@01)
  (and
    (not (Set_in r1@112@01 s@75@01))
    (and
      (Set_in r2@113@01 lists@3@01)
      (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01)))))))
; [eval] r1.next != r2.next
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r l@62@01)
      (=
        ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@28@01 r)
        (and
          (Set_in (inv@27@01 r) lists@3@01)
          (not (Set_in (inv@27@01 r) s@20@01))))
      (=
        ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
    :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
    :qid |qp.fvfValDef18|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite (= r1@112@01 l@62@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@28@01 r1@112@01)
        (and
          (Set_in (inv@27@01 r1@112@01) lists@3@01)
          (not (Set_in (inv@27@01 r1@112@01) s@20@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r l@62@01)
      (=
        ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
        ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
    :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@28@01 r)
        (and
          (Set_in (inv@27@01 r) lists@3@01)
          (not (Set_in (inv@27@01 r) s@20@01))))
      (=
        ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
    :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
    :qid |qp.fvfValDef18|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite (= r2@113@01 l@62@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@28@01 r2@113@01)
        (and
          (Set_in (inv@27@01 r2@113@01) lists@3@01)
          (not (Set_in (inv@27@01 r2@113@01) s@20@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 37 | !(r1@112@01 in lists@3@01 && !(r1@112@01 in s@75@01) && r2@113@01 in lists@3@01 && !(r2@113@01 in s@75@01) && r1@112@01 != r2@113@01)]
(assert (not
  (and
    (Set_in r1@112@01 lists@3@01)
    (and
      (not (Set_in r1@112@01 s@75@01))
      (and
        (Set_in r2@113@01 lists@3@01)
        (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef18|)))
(assert (=>
  (and
    (Set_in r1@112@01 lists@3@01)
    (and
      (not (Set_in r1@112@01 s@75@01))
      (and
        (Set_in r2@113@01 lists@3@01)
        (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))
  (and
    (Set_in r1@112@01 lists@3@01)
    (not (Set_in r1@112@01 s@75@01))
    (Set_in r2@113@01 lists@3@01)
    (not (Set_in r2@113@01 s@75@01))
    (not (= r1@112@01 r2@113@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in r1@112@01 lists@3@01)
      (and
        (not (Set_in r1@112@01 s@75@01))
        (and
          (Set_in r2@113@01 lists@3@01)
          (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01)))))))
  (and
    (Set_in r1@112@01 lists@3@01)
    (and
      (not (Set_in r1@112@01 s@75@01))
      (and
        (Set_in r2@113@01 lists@3@01)
        (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@62@01)
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@110@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@110@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@112@01 $Ref) (r2@113@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@112@01 lists@3@01)
      (and
        (Set_in r1@112@01 lists@3@01)
        (=>
          (not (Set_in r1@112@01 s@75@01))
          (and
            (not (Set_in r1@112@01 s@75@01))
            (=>
              (Set_in r2@113@01 lists@3@01)
              (and
                (Set_in r2@113@01 lists@3@01)
                (or (not (Set_in r2@113@01 s@75@01)) (Set_in r2@113@01 s@75@01))))
            (or
              (Set_in r2@113@01 lists@3@01)
              (not (Set_in r2@113@01 lists@3@01)))))
        (or (not (Set_in r1@112@01 s@75@01)) (Set_in r1@112@01 s@75@01))))
    (or (Set_in r1@112@01 lists@3@01) (not (Set_in r1@112@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@112@01 lists@3@01)
        (and
          (not (Set_in r1@112@01 s@75@01))
          (and
            (Set_in r2@113@01 lists@3@01)
            (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))
      (and
        (Set_in r1@112@01 lists@3@01)
        (not (Set_in r1@112@01 s@75@01))
        (Set_in r2@113@01 lists@3@01)
        (not (Set_in r2@113@01 s@75@01))
        (not (= r1@112@01 r2@113@01))))
    (or
      (not
        (and
          (Set_in r1@112@01 lists@3@01)
          (and
            (not (Set_in r1@112@01 s@75@01))
            (and
              (Set_in r2@113@01 lists@3@01)
              (and
                (not (Set_in r2@113@01 s@75@01))
                (not (= r1@112@01 r2@113@01)))))))
      (and
        (Set_in r1@112@01 lists@3@01)
        (and
          (not (Set_in r1@112@01 s@75@01))
          (and
            (Set_in r2@113@01 lists@3@01)
            (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))))
  :pattern ((Set_in r1@112@01 lists@3@01) (Set_in r2@113@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@112@01 $Ref) (r2@113@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@112@01 lists@3@01)
      (and
        (Set_in r1@112@01 lists@3@01)
        (=>
          (not (Set_in r1@112@01 s@75@01))
          (and
            (not (Set_in r1@112@01 s@75@01))
            (=>
              (Set_in r2@113@01 lists@3@01)
              (and
                (Set_in r2@113@01 lists@3@01)
                (or (not (Set_in r2@113@01 s@75@01)) (Set_in r2@113@01 s@75@01))))
            (or
              (Set_in r2@113@01 lists@3@01)
              (not (Set_in r2@113@01 lists@3@01)))))
        (or (not (Set_in r1@112@01 s@75@01)) (Set_in r1@112@01 s@75@01))))
    (or (Set_in r1@112@01 lists@3@01) (not (Set_in r1@112@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@112@01 lists@3@01)
        (and
          (not (Set_in r1@112@01 s@75@01))
          (and
            (Set_in r2@113@01 lists@3@01)
            (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))
      (and
        (Set_in r1@112@01 lists@3@01)
        (not (Set_in r1@112@01 s@75@01))
        (Set_in r2@113@01 lists@3@01)
        (not (Set_in r2@113@01 s@75@01))
        (not (= r1@112@01 r2@113@01))))
    (or
      (not
        (and
          (Set_in r1@112@01 lists@3@01)
          (and
            (not (Set_in r1@112@01 s@75@01))
            (and
              (Set_in r2@113@01 lists@3@01)
              (and
                (not (Set_in r2@113@01 s@75@01))
                (not (= r1@112@01 r2@113@01)))))))
      (and
        (Set_in r1@112@01 lists@3@01)
        (and
          (not (Set_in r1@112@01 s@75@01))
          (and
            (Set_in r2@113@01 lists@3@01)
            (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))))
  :pattern ((Set_in r1@112@01 lists@3@01) (Set_in r2@113@01 s@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@112@01 $Ref) (r2@113@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@112@01 lists@3@01)
      (and
        (Set_in r1@112@01 lists@3@01)
        (=>
          (not (Set_in r1@112@01 s@75@01))
          (and
            (not (Set_in r1@112@01 s@75@01))
            (=>
              (Set_in r2@113@01 lists@3@01)
              (and
                (Set_in r2@113@01 lists@3@01)
                (or (not (Set_in r2@113@01 s@75@01)) (Set_in r2@113@01 s@75@01))))
            (or
              (Set_in r2@113@01 lists@3@01)
              (not (Set_in r2@113@01 lists@3@01)))))
        (or (not (Set_in r1@112@01 s@75@01)) (Set_in r1@112@01 s@75@01))))
    (or (Set_in r1@112@01 lists@3@01) (not (Set_in r1@112@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@112@01 lists@3@01)
        (and
          (not (Set_in r1@112@01 s@75@01))
          (and
            (Set_in r2@113@01 lists@3@01)
            (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))
      (and
        (Set_in r1@112@01 lists@3@01)
        (not (Set_in r1@112@01 s@75@01))
        (Set_in r2@113@01 lists@3@01)
        (not (Set_in r2@113@01 s@75@01))
        (not (= r1@112@01 r2@113@01))))
    (or
      (not
        (and
          (Set_in r1@112@01 lists@3@01)
          (and
            (not (Set_in r1@112@01 s@75@01))
            (and
              (Set_in r2@113@01 lists@3@01)
              (and
                (not (Set_in r2@113@01 s@75@01))
                (not (= r1@112@01 r2@113@01)))))))
      (and
        (Set_in r1@112@01 lists@3@01)
        (and
          (not (Set_in r1@112@01 s@75@01))
          (and
            (Set_in r2@113@01 lists@3@01)
            (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))))
  :pattern ((Set_in r1@112@01 s@75@01) (Set_in r2@113@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(assert (forall ((r1@112@01 $Ref) (r2@113@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@112@01 lists@3@01)
      (and
        (Set_in r1@112@01 lists@3@01)
        (=>
          (not (Set_in r1@112@01 s@75@01))
          (and
            (not (Set_in r1@112@01 s@75@01))
            (=>
              (Set_in r2@113@01 lists@3@01)
              (and
                (Set_in r2@113@01 lists@3@01)
                (or (not (Set_in r2@113@01 s@75@01)) (Set_in r2@113@01 s@75@01))))
            (or
              (Set_in r2@113@01 lists@3@01)
              (not (Set_in r2@113@01 lists@3@01)))))
        (or (not (Set_in r1@112@01 s@75@01)) (Set_in r1@112@01 s@75@01))))
    (or (Set_in r1@112@01 lists@3@01) (not (Set_in r1@112@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@112@01 lists@3@01)
        (and
          (not (Set_in r1@112@01 s@75@01))
          (and
            (Set_in r2@113@01 lists@3@01)
            (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))
      (and
        (Set_in r1@112@01 lists@3@01)
        (not (Set_in r1@112@01 s@75@01))
        (Set_in r2@113@01 lists@3@01)
        (not (Set_in r2@113@01 s@75@01))
        (not (= r1@112@01 r2@113@01))))
    (or
      (not
        (and
          (Set_in r1@112@01 lists@3@01)
          (and
            (not (Set_in r1@112@01 s@75@01))
            (and
              (Set_in r2@113@01 lists@3@01)
              (and
                (not (Set_in r2@113@01 s@75@01))
                (not (= r1@112@01 r2@113@01)))))))
      (and
        (Set_in r1@112@01 lists@3@01)
        (and
          (not (Set_in r1@112@01 s@75@01))
          (and
            (Set_in r2@113@01 lists@3@01)
            (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))))
  :pattern ((Set_in r1@112@01 s@75@01) (Set_in r2@113@01 s@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131-aux|)))
(push) ; 7
(assert (not (forall ((r1@112@01 $Ref) (r2@113@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@112@01 lists@3@01)
      (and
        (not (Set_in r1@112@01 s@75@01))
        (and
          (Set_in r2@113@01 lists@3@01)
          (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))
    (not
      (=
        ($FVF.lookup_next (as sm@110@01  $FVF<next>) r1@112@01)
        ($FVF.lookup_next (as sm@110@01  $FVF<next>) r2@113@01))))
  :pattern ((Set_in r1@112@01 lists@3@01) (Set_in r2@113@01 lists@3@01))
  :pattern ((Set_in r1@112@01 lists@3@01) (Set_in r2@113@01 s@75@01))
  :pattern ((Set_in r1@112@01 s@75@01) (Set_in r2@113@01 lists@3@01))
  :pattern ((Set_in r1@112@01 s@75@01) (Set_in r2@113@01 s@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r1@112@01 $Ref) (r2@113@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@112@01 lists@3@01)
      (and
        (not (Set_in r1@112@01 s@75@01))
        (and
          (Set_in r2@113@01 lists@3@01)
          (and (not (Set_in r2@113@01 s@75@01)) (not (= r1@112@01 r2@113@01))))))
    (not
      (=
        ($FVF.lookup_next (as sm@110@01  $FVF<next>) r1@112@01)
        ($FVF.lookup_next (as sm@110@01  $FVF<next>) r2@113@01))))
  :pattern ((Set_in r1@112@01 lists@3@01) (Set_in r2@113@01 lists@3@01))
  :pattern ((Set_in r1@112@01 lists@3@01) (Set_in r2@113@01 s@75@01))
  :pattern ((Set_in r1@112@01 s@75@01) (Set_in r2@113@01 lists@3@01))
  :pattern ((Set_in r1@112@01 s@75@01) (Set_in r2@113@01 s@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@36@15@36@131|)))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(|s@20@01| > 0)]
(assert (not (> (Set_card s@20@01) 0)))
(pop) ; 5
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (> (Set_card s@20@01) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (Set_card s@20@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | !(|s@20@01| > 0) | live]
; [else-branch: 38 | |s@20@01| > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | !(|s@20@01| > 0)]
(assert (not (> (Set_card s@20@01) 0)))
; [eval] length - 1 > 0
; [eval] length - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> (- length@4@01 1) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (> (- length@4@01 1) 0)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | length@4@01 - 1 > 0 | live]
; [else-branch: 39 | !(length@4@01 - 1 > 0) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 39 | length@4@01 - 1 > 0]
(assert (> (- length@4@01 1) 0))
; [exec]
; m1(sNext, length - 1, v)
; [eval] length - 1
; [eval] length > 0
(declare-const r@114@01 $Ref)
(push) ; 7
; [eval] (r in lists)
(assert (Set_in r@114@01 sNext@21@01))
(pop) ; 7
(declare-fun inv@115@01 ($Ref Int) $Ref)
(declare-fun img@116@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@114@01 $Ref) (r2@114@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@114@01 sNext@21@01)
      (Set_in r2@114@01 sNext@21@01)
      (= r1@114@01 r2@114@01))
    (= r1@114@01 r2@114@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@114@01 $Ref)) (!
  (=>
    (Set_in r@114@01 sNext@21@01)
    (and
      (= (inv@115@01 r@114@01 (- length@4@01 1)) r@114@01)
      (img@116@01 r@114@01 (- length@4@01 1))))
  :pattern ((Set_in r@114@01 sNext@21@01))
  :pattern ((inv@115@01 r@114@01 (- length@4@01 1)))
  :pattern ((img@116@01 r@114@01 (- length@4@01 1)))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@116@01 r i) (Set_in (inv@115@01 r i) sNext@21@01))
    (and (= (inv@115@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@115@01 r i))
  :qid |list-fctOfInv|)))
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r@114@01 $Ref)) (!
  (= (- length@4@01 1) length@4@01)
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@117@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@115@01 r i) sNext@21@01)
      (img@116@01 r i)
      (and (= r (inv@115@01 r i)) (= i (- length@4@01 1))))
    ($Perm.min
      (ite
        (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@118@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@115@01 r i) sNext@21@01)
      (img@116@01 r i)
      (and (= r (inv@115@01 r i)) (= i (- length@4@01 1))))
    ($Perm.min
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@117@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@31@01 r i) (Set_in (inv@30@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@117@01 r i))
    $Perm.No)
  
  :qid |quant-u-67|))))
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
    (and
      (Set_in (inv@115@01 r i) sNext@21@01)
      (img@116@01 r i)
      (and (= r (inv@115@01 r i)) (= i (- length@4@01 1))))
    (= (- $Perm.Write (pTaken@117@01 r i)) $Perm.No))
  
  :qid |quant-u-68|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@119@01 $PSF<list>)
(declare-const s@120@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@120@01 $Snap)) (!
  (=>
    (and
      (img@25@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@120@01)) ($SortWrappers.$SnapToInt ($Snap.second s@120@01)))
      (Set_in (inv@24@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@120@01)) ($SortWrappers.$SnapToInt ($Snap.second s@120@01))) s@20@01))
    (and
      (not (= s@120@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@119@01  $PSF<list>) s@120@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) s@120@01))))
  :pattern (($PSF.lookup_list (as sm@119@01  $PSF<list>) s@120@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) s@120@01))
  :qid |qp.psmValDef20|)))
(assert (forall ((s@120@01 $Snap)) (!
  (=>
    (and
      (img@31@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@120@01)) ($SortWrappers.$SnapToInt ($Snap.second s@120@01)))
      (Set_in (inv@30@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@120@01)) ($SortWrappers.$SnapToInt ($Snap.second s@120@01))) sNext@21@01))
    (and
      (not (= s@120@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@119@01  $PSF<list>) s@120@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@22@01)))) s@120@01))))
  :pattern (($PSF.lookup_list (as sm@119@01  $PSF<list>) s@120@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@22@01)))) s@120@01))
  :qid |qp.psmValDef21|)))
(declare-const $t@121@01 $Snap)
(assert (= $t@121@01 ($Snap.combine ($Snap.first $t@121@01) ($Snap.second $t@121@01))))
(declare-const r@122@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists)
(assert (Set_in r@122@01 sNext@21@01))
(pop) ; 7
(declare-fun inv@123@01 ($Ref Int) $Ref)
(declare-fun img@124@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@122@01 $Ref) (r2@122@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@122@01 sNext@21@01)
      (Set_in r2@122@01 sNext@21@01)
      (= r1@122@01 r2@122@01))
    (= r1@122@01 r2@122@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@122@01 $Ref)) (!
  (=>
    (Set_in r@122@01 sNext@21@01)
    (and
      (= (inv@123@01 r@122@01 (- length@4@01 1)) r@122@01)
      (img@124@01 r@122@01 (- length@4@01 1))))
  :pattern ((Set_in r@122@01 sNext@21@01))
  :pattern ((inv@123@01 r@122@01 (- length@4@01 1)))
  :pattern ((img@124@01 r@122@01 (- length@4@01 1)))
  :qid |quant-u-70|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
    (and (= (inv@123@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@123@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (and
    (= r@122@01 r@23@01)
    (=
      (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
      (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))))
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@121@01) $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { allSet(r, length, v) } (r in lists) ==> allSet(r, length, v))
(declare-const r@125@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) ==> allSet(r, length, v)
; [eval] (r in lists)
(push) ; 8
; [then-branch: 40 | r@125@01 in sNext@21@01 | live]
; [else-branch: 40 | !(r@125@01 in sNext@21@01) | live]
(push) ; 9
; [then-branch: 40 | r@125@01 in sNext@21@01]
(assert (Set_in r@125@01 sNext@21@01))
; [eval] allSet(r, length, v)
(push) ; 10
; Precomputing data for removing quantified permissions
(define-fun pTaken@126@01 ((r $Ref) (i Int) (r@125@01 $Ref)) $Perm
  (ite
    (and (= r r@125@01) (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@127@01 ((r $Ref) (i Int) (r@125@01 $Ref)) $Perm
  (ite
    (and (= r r@125@01) (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@126@01 r i r@125@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      (pTaken@126@01 r i r@125@01))
    $Perm.No)
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@125@01) (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@126@01 r i r@125@01)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@127@01 r i r@125@01))
    $Perm.No)
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@127@01 r i r@125@01) $Perm.No)
  
  :qid |quant-u-76|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@125@01) (= i (- length@4@01 1)))
    (=
      (-
        (- $Perm.Write (pTaken@126@01 r i r@125@01))
        (pTaken@127@01 r i r@125@01))
      $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@128@01 $PSF<list>)
(declare-const s@129@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@25@01 r@125@01 (- length@4@01 1))
    (Set_in (inv@24@01 r@125@01 (- length@4@01 1)) s@20@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@125@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@125@01)
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@125@01)
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (img@124@01 r@125@01 (- length@4@01 1))
    (Set_in (inv@123@01 r@125@01 (- length@4@01 1)) sNext@21@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@125@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@125@01)
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@125@01)
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@125@01)
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@125@01 (- length@4@01 1) v@5@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (=>
    (and
      (img@25@01 r@125@01 (- length@4@01 1))
      (Set_in (inv@24@01 r@125@01 (- length@4@01 1)) s@20@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@125@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@125@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@125@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (and
      (img@124@01 r@125@01 (- length@4@01 1))
      (Set_in (inv@123@01 r@125@01 (- length@4@01 1)) sNext@21@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@125@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@125@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@125@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@125@01)
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@125@01 (- length@4@01 1) v@5@01)))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 40 | !(r@125@01 in sNext@21@01)]
(assert (not (Set_in r@125@01 sNext@21@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (Set_in r@125@01 sNext@21@01)
  (and
    (Set_in r@125@01 sNext@21@01)
    (=>
      (and
        (img@25@01 r@125@01 (- length@4@01 1))
        (Set_in (inv@24@01 r@125@01 (- length@4@01 1)) s@20@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@125@01)
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@125@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@125@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (and
        (img@124@01 r@125@01 (- length@4@01 1))
        (Set_in (inv@123@01 r@125@01 (- length@4@01 1)) sNext@21@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@125@01)
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@125@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@125@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@125@01)
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@125@01 (- length@4@01 1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@125@01 sNext@21@01)) (Set_in r@125@01 sNext@21@01)))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@125@01 $Ref)) (!
  (and
    (=>
      (Set_in r@125@01 sNext@21@01)
      (and
        (Set_in r@125@01 sNext@21@01)
        (=>
          (and
            (img@25@01 r@125@01 (- length@4@01 1))
            (Set_in (inv@24@01 r@125@01 (- length@4@01 1)) s@20@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@125@01)
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@125@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@125@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (img@124@01 r@125@01 (- length@4@01 1))
            (Set_in (inv@123@01 r@125@01 (- length@4@01 1)) sNext@21@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@125@01)
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@125@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@125@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@125@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@125@01 (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@125@01 sNext@21@01)) (Set_in r@125@01 sNext@21@01)))
  :pattern ((Set_in r@125@01 sNext@21@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@26@9@26@85-aux|)))
(assert (forall ((r@125@01 $Ref)) (!
  (and
    (=>
      (Set_in r@125@01 sNext@21@01)
      (and
        (Set_in r@125@01 sNext@21@01)
        (=>
          (and
            (img@25@01 r@125@01 (- length@4@01 1))
            (Set_in (inv@24@01 r@125@01 (- length@4@01 1)) s@20@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@125@01)
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@125@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@125@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (img@124@01 r@125@01 (- length@4@01 1))
            (Set_in (inv@123@01 r@125@01 (- length@4@01 1)) sNext@21@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@125@01)
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@125@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@125@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@125@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@125@01 (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@125@01 sNext@21@01)) (Set_in r@125@01 sNext@21@01)))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@125@01)
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@125@01 (- length@4@01 1) v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@26@9@26@85-aux|)))
(assert (forall ((r@125@01 $Ref)) (!
  (=>
    (Set_in r@125@01 sNext@21@01)
    (allSet ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@125@01)
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@125@01 (- length@4@01 1) v@5@01))
  :pattern ((Set_in r@125@01 sNext@21@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@125@01)
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@125@01 (- length@4@01 1) v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@26@9@26@85|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; s := lists
(declare-const s@130@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 7
; Loop head block: Check well-definedness of invariant
(declare-const $t@131@01 $Snap)
(assert (= $t@131@01 ($Snap.combine ($Snap.first $t@131@01) ($Snap.second $t@131@01))))
(declare-const r@132@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 41 | !(r@132@01 in lists@3@01) | live]
; [else-branch: 41 | r@132@01 in lists@3@01 | live]
(push) ; 10
; [then-branch: 41 | !(r@132@01 in lists@3@01)]
(assert (not (Set_in r@132@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 41 | r@132@01 in lists@3@01]
(assert (Set_in r@132@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@132@01 lists@3@01) (not (Set_in r@132@01 lists@3@01))))
(assert (and (Set_in r@132@01 lists@3@01) (not (Set_in r@132@01 s@130@01))))
(pop) ; 8
(declare-fun inv@133@01 ($Ref Int) $Ref)
(declare-fun img@134@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@132@01 $Ref)) (!
  (=>
    (and (Set_in r@132@01 lists@3@01) (not (Set_in r@132@01 s@130@01)))
    (or (Set_in r@132@01 lists@3@01) (not (Set_in r@132@01 lists@3@01))))
  :pattern ((Set_in r@132@01 lists@3@01))
  :pattern ((Set_in r@132@01 s@130@01))
  :pattern ((inv@133@01 r@132@01 length@4@01))
  :pattern ((img@134@01 r@132@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@132@01 $Ref) (r2@132@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@132@01 lists@3@01) (not (Set_in r1@132@01 s@130@01)))
      (and (Set_in r2@132@01 lists@3@01) (not (Set_in r2@132@01 s@130@01)))
      (= r1@132@01 r2@132@01))
    (= r1@132@01 r2@132@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@132@01 $Ref)) (!
  (=>
    (and (Set_in r@132@01 lists@3@01) (not (Set_in r@132@01 s@130@01)))
    (and
      (= (inv@133@01 r@132@01 length@4@01) r@132@01)
      (img@134@01 r@132@01 length@4@01)))
  :pattern ((Set_in r@132@01 lists@3@01))
  :pattern ((Set_in r@132@01 s@130@01))
  :pattern ((inv@133@01 r@132@01 length@4@01))
  :pattern ((img@134@01 r@132@01 length@4@01))
  :qid |quant-u-79|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (img@134@01 r i)
      (and
        (Set_in (inv@133@01 r i) lists@3@01)
        (not (Set_in (inv@133@01 r i) s@130@01))))
    (and (= (inv@133@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@133@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@131@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@131@01))
    ($Snap.second ($Snap.second $t@131@01)))))
(assert (= ($Snap.first ($Snap.second $t@131@01)) $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@135@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 42 | !(r@135@01 in lists@3@01) | live]
; [else-branch: 42 | r@135@01 in lists@3@01 | live]
(push) ; 10
; [then-branch: 42 | !(r@135@01 in lists@3@01)]
(assert (not (Set_in r@135@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 42 | r@135@01 in lists@3@01]
(assert (Set_in r@135@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 lists@3@01))))
(push) ; 9
; [then-branch: 43 | r@135@01 in lists@3@01 && !(r@135@01 in s@130@01) | live]
; [else-branch: 43 | !(r@135@01 in lists@3@01 && !(r@135@01 in s@130@01)) | live]
(push) ; 10
; [then-branch: 43 | r@135@01 in lists@3@01 && !(r@135@01 in s@130@01)]
(assert (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01))))
; [eval] allSet(r, length, v)
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@136@01 ((r $Ref) (i Int) (r@135@01 $Ref)) $Perm
  (ite
    (and (= r r@135@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
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
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@136@01 r i r@135@01))
    $Perm.No)
  
  :qid |quant-u-81|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@136@01 r i r@135@01) $Perm.No)
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@135@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@136@01 r i r@135@01)) $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@137@01 $PSF<list>)
(declare-const s@138@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@134@01 r@135@01 length@4@01)
    (and
      (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
      (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@135@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@135@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@135@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (=>
    (and
      (img@134@01 r@135@01 length@4@01)
      (and
        (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
        (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@135@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@135@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 43 | !(r@135@01 in lists@3@01 && !(r@135@01 in s@130@01))]
(assert (not (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
  (and
    (Set_in r@135@01 lists@3@01)
    (not (Set_in r@135@01 s@130@01))
    (=>
      (and
        (img@134@01 r@135@01 length@4@01)
        (and
          (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
          (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@135@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@135@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@135@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@135@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01))))
  (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@135@01 $Ref)) (!
  (and
    (or (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 lists@3@01)))
    (=>
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
      (and
        (Set_in r@135@01 lists@3@01)
        (not (Set_in r@135@01 s@130@01))
        (=>
          (and
            (img@134@01 r@135@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@135@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01))))
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))))
  :pattern ((Set_in r@135@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@135@01 $Ref)) (!
  (and
    (or (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 lists@3@01)))
    (=>
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
      (and
        (Set_in r@135@01 lists@3@01)
        (not (Set_in r@135@01 s@130@01))
        (=>
          (and
            (img@134@01 r@135@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@135@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01))))
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))))
  :pattern ((Set_in r@135@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@135@01 $Ref)) (!
  (and
    (or (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 lists@3@01)))
    (=>
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
      (and
        (Set_in r@135@01 lists@3@01)
        (not (Set_in r@135@01 s@130@01))
        (=>
          (and
            (img@134@01 r@135@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@135@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01))))
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@135@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@135@01 $Ref)) (!
  (=>
    (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
    (allSet ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@135@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01))
  :pattern ((Set_in r@135@01 lists@3@01))
  :pattern ((Set_in r@135@01 s@130@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@135@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85|)))
(assert (=
  ($Snap.second ($Snap.second $t@131@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@131@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
(declare-const r@139@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@139@01 s@130@01))
(pop) ; 8
(declare-fun inv@140@01 ($Ref) $Ref)
(declare-fun img@141@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@139@01 $Ref) (r2@139@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@139@01 s@130@01)
      (Set_in r2@139@01 s@130@01)
      (= r1@139@01 r2@139@01))
    (= r1@139@01 r2@139@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@139@01 $Ref)) (!
  (=>
    (Set_in r@139@01 s@130@01)
    (and (= (inv@140@01 r@139@01) r@139@01) (img@141@01 r@139@01)))
  :pattern ((Set_in r@139@01 s@130@01))
  :pattern ((inv@140@01 r@139@01))
  :pattern ((img@141@01 r@139@01))
  :qid |quant-u-85|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01)) (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@139@01 $Ref)) (!
  (=> (Set_in r@139@01 s@130@01) (not (= r@139@01 $Ref.null)))
  :pattern ((Set_in r@139@01 s@130@01))
  :pattern ((inv@140@01 r@139@01))
  :pattern ((img@141@01 r@139@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@131@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@142@01 $Ref)
(push) ; 8
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 9
; [then-branch: 44 | r@142@01 in s@130@01 | live]
; [else-branch: 44 | !(r@142@01 in s@130@01) | live]
(push) ; 10
; [then-branch: 44 | r@142@01 in s@130@01]
(assert (Set_in r@142@01 s@130@01))
; [eval] r.val == v
(push) ; 11
(assert (not (and (img@141@01 r@142@01) (Set_in (inv@140@01 r@142@01) s@130@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 44 | !(r@142@01 in s@130@01)]
(assert (not (Set_in r@142@01 s@130@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@142@01 s@130@01)) (Set_in r@142@01 s@130@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@142@01 $Ref)) (!
  (or (not (Set_in r@142@01 s@130@01)) (Set_in r@142@01 s@130@01))
  :pattern ((Set_in r@142@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86-aux|)))
(assert (forall ((r@142@01 $Ref)) (!
  (=>
    (Set_in r@142@01 s@130@01)
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) r@142@01)
      v@5@01))
  :pattern ((Set_in r@142@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))))
(declare-const r@143@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@143@01 s@130@01))
(pop) ; 8
(declare-fun inv@144@01 ($Ref) $Ref)
(declare-fun img@145@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@143@01 $Ref) (r2@143@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@143@01 s@130@01)
      (Set_in r2@143@01 s@130@01)
      (= r1@143@01 r2@143@01))
    (= r1@143@01 r2@143@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@143@01 $Ref)) (!
  (=>
    (Set_in r@143@01 s@130@01)
    (and (= (inv@144@01 r@143@01) r@143@01) (img@145@01 r@143@01)))
  :pattern ((Set_in r@143@01 s@130@01))
  :pattern ((inv@144@01 r@143@01))
  :pattern ((img@145@01 r@143@01))
  :qid |quant-u-87|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01)) (= (inv@144@01 r) r))
  :pattern ((inv@144@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@143@01 $Ref)) (!
  (=> (Set_in r@143@01 s@130@01) (not (= r@143@01 $Ref.null)))
  :pattern ((Set_in r@143@01 s@130@01))
  :pattern ((inv@144@01 r@143@01))
  :pattern ((img@145@01 r@143@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
  $Snap.unit))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@146@01 $Ref)
(declare-const r2@147@01 $Ref)
(push) ; 8
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 9
; [then-branch: 45 | !(r1@146@01 in s@130@01) | live]
; [else-branch: 45 | r1@146@01 in s@130@01 | live]
(push) ; 10
; [then-branch: 45 | !(r1@146@01 in s@130@01)]
(assert (not (Set_in r1@146@01 s@130@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 45 | r1@146@01 in s@130@01]
(assert (Set_in r1@146@01 s@130@01))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 46 | !(r2@147@01 in s@130@01) | live]
; [else-branch: 46 | r2@147@01 in s@130@01 | live]
(push) ; 12
; [then-branch: 46 | !(r2@147@01 in s@130@01)]
(assert (not (Set_in r2@147@01 s@130@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 46 | r2@147@01 in s@130@01]
(assert (Set_in r2@147@01 s@130@01))
; [eval] r1 != r2
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r2@147@01 s@130@01) (not (Set_in r2@147@01 s@130@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r1@146@01 s@130@01)
  (and
    (Set_in r1@146@01 s@130@01)
    (or (Set_in r2@147@01 s@130@01) (not (Set_in r2@147@01 s@130@01))))))
(assert (or (Set_in r1@146@01 s@130@01) (not (Set_in r1@146@01 s@130@01))))
(push) ; 9
; [then-branch: 47 | r1@146@01 in s@130@01 && r2@147@01 in s@130@01 && r1@146@01 != r2@147@01 | live]
; [else-branch: 47 | !(r1@146@01 in s@130@01 && r2@147@01 in s@130@01 && r1@146@01 != r2@147@01) | live]
(push) ; 10
; [then-branch: 47 | r1@146@01 in s@130@01 && r2@147@01 in s@130@01 && r1@146@01 != r2@147@01]
(assert (and
  (Set_in r1@146@01 s@130@01)
  (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01)))))
; [eval] r1.next != r2.next
(push) ; 11
(assert (not (and (img@145@01 r1@146@01) (Set_in (inv@144@01 r1@146@01) s@130@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (and (img@145@01 r2@147@01) (Set_in (inv@144@01 r2@147@01) s@130@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 47 | !(r1@146@01 in s@130@01 && r2@147@01 in s@130@01 && r1@146@01 != r2@147@01)]
(assert (not
  (and
    (Set_in r1@146@01 s@130@01)
    (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (Set_in r1@146@01 s@130@01)
    (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))
  (and
    (Set_in r1@146@01 s@130@01)
    (Set_in r2@147@01 s@130@01)
    (not (= r1@146@01 r2@147@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in r1@146@01 s@130@01)
      (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01)))))
  (and
    (Set_in r1@146@01 s@130@01)
    (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@146@01 $Ref) (r2@147@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@146@01 s@130@01)
      (and
        (Set_in r1@146@01 s@130@01)
        (or (Set_in r2@147@01 s@130@01) (not (Set_in r2@147@01 s@130@01)))))
    (or (Set_in r1@146@01 s@130@01) (not (Set_in r1@146@01 s@130@01)))
    (=>
      (and
        (Set_in r1@146@01 s@130@01)
        (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))
      (and
        (Set_in r1@146@01 s@130@01)
        (Set_in r2@147@01 s@130@01)
        (not (= r1@146@01 r2@147@01))))
    (or
      (not
        (and
          (Set_in r1@146@01 s@130@01)
          (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01)))))
      (and
        (Set_in r1@146@01 s@130@01)
        (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))))
  :pattern ((Set_in r1@146@01 s@130@01) (Set_in r2@147@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99-aux|)))
(assert (forall ((r1@146@01 $Ref) (r2@147@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@146@01 s@130@01)
      (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r1@146@01)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r2@147@01))))
  :pattern ((Set_in r1@146@01 s@130@01) (Set_in r2@147@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))))))
(declare-const r@148@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@148@01 s@130@01))
(push) ; 9
(assert (not (and (img@145@01 r@148@01) (Set_in (inv@144@01 r@148@01) s@130@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 8
(declare-fun inv@149@01 ($Ref Int) $Ref)
(declare-fun img@150@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@148@01 $Ref) (r2@148@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@148@01 s@130@01)
      (Set_in r2@148@01 s@130@01)
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r1@148@01)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r2@148@01)))
    (= r1@148@01 r2@148@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@148@01 $Ref)) (!
  (=>
    (Set_in r@148@01 s@130@01)
    (and
      (=
        (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01) (-
          length@4@01
          1))
        r@148@01)
      (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01) (-
        length@4@01
        1))))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01))
  :qid |quant-u-89|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
    (and
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) (inv@149@01 r i))
        r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@149@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (and
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01)
      r@132@01)
    (=
      (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
      (and
        (img@134@01 r i)
        (and
          (Set_in (inv@133@01 r i) lists@3@01)
          (not (Set_in (inv@133@01 r i) s@130@01))))))
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@151@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 9
; [then-branch: 48 | r@151@01 in s@130@01 | live]
; [else-branch: 48 | !(r@151@01 in s@130@01) | live]
(push) ; 10
; [then-branch: 48 | r@151@01 in s@130@01]
(assert (Set_in r@151@01 s@130@01))
; [eval] allSet(r.next, length - 1, v)
(push) ; 11
(assert (not (and (img@145@01 r@151@01) (Set_in (inv@144@01 r@151@01) s@130@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@152@01 ((r $Ref) (i Int) (r@151@01 $Ref)) $Perm
  (ite
    (and
      (=
        r
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@153@01 ((r $Ref) (i Int) (r@151@01 $Ref)) $Perm
  (ite
    (and
      (=
        r
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@152@01 r i r@151@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@152@01 r i r@151@01))
    $Perm.No)
  
  :qid |quant-u-92|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@152@01 r i r@151@01) $Perm.No)
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (=
        r
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@152@01 r i r@151@01)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        $Perm.Write
        $Perm.No)
      (pTaken@153@01 r i r@151@01))
    $Perm.No)
  
  :qid |quant-u-95|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@153@01 r i r@151@01) $Perm.No)
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (=
        r
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
      (= i (- length@4@01 1)))
    (=
      (-
        (- $Perm.Write (pTaken@152@01 r i r@151@01))
        (pTaken@153@01 r i r@151@01))
      $Perm.No))
  
  :qid |quant-u-97|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@154@01 $PSF<list>)
(declare-const s@155@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
      length@4@01
      1))
    (and
      (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
        length@4@01
        1)) lists@3@01)
      (not
        (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
          length@4@01
          1)) s@130@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
      length@4@01
      1))
    (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
      length@4@01
      1)) s@130@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (=>
    (and
      (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
        length@4@01
        1))
      (and
        (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
          length@4@01
          1)) lists@3@01)
        (not
          (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
            length@4@01
            1)) s@130@01))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (and
      (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
        length@4@01
        1))
      (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
        length@4@01
        1)) s@130@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 48 | !(r@151@01 in s@130@01)]
(assert (not (Set_in r@151@01 s@130@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r@151@01 s@130@01)
  (and
    (Set_in r@151@01 s@130@01)
    (=>
      (and
        (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
          length@4@01
          1))
        (and
          (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
            length@4@01
            1)) lists@3@01)
          (not
            (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
              length@4@01
              1)) s@130@01))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (and
        (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
          length@4@01
          1))
        (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
          length@4@01
          1)) s@130@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@151@01 s@130@01)) (Set_in r@151@01 s@130@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@151@01 $Ref)) (!
  (and
    (=>
      (Set_in r@151@01 s@130@01)
      (and
        (Set_in r@151@01 s@130@01)
        (=>
          (and
            (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
              length@4@01
              1))
            (and
              (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
                length@4@01
                1)) lists@3@01)
              (not
                (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
                  length@4@01
                  1)) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
              length@4@01
              1))
            (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
              length@4@01
              1)) s@130@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@151@01 s@130@01)) (Set_in r@151@01 s@130@01)))
  :pattern ((Set_in r@151@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75-aux|)))
(assert (forall ((r@151@01 $Ref)) (!
  (=>
    (Set_in r@151@01 s@130@01)
    (allSet ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@151@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75|)))
(pop) ; 7
(push) ; 7
; Loop head block: Establish invariant
(declare-const r@156@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 49 | !(r@156@01 in lists@3@01) | live]
; [else-branch: 49 | r@156@01 in lists@3@01 | live]
(push) ; 10
; [then-branch: 49 | !(r@156@01 in lists@3@01)]
(assert (not (Set_in r@156@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 49 | r@156@01 in lists@3@01]
(assert (Set_in r@156@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@156@01 lists@3@01) (not (Set_in r@156@01 lists@3@01))))
(assert (and (Set_in r@156@01 lists@3@01) (not (Set_in r@156@01 lists@3@01))))
(pop) ; 8
(declare-fun inv@157@01 ($Ref Int) $Ref)
(declare-fun img@158@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@156@01 $Ref)) (!
  (=>
    (and (Set_in r@156@01 lists@3@01) (not (Set_in r@156@01 lists@3@01)))
    (or (Set_in r@156@01 lists@3@01) (not (Set_in r@156@01 lists@3@01))))
  :pattern ((Set_in r@156@01 lists@3@01))
  :pattern ((inv@157@01 r@156@01 length@4@01))
  :pattern ((img@158@01 r@156@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@156@01 $Ref) (r2@156@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@156@01 lists@3@01) (not (Set_in r1@156@01 lists@3@01)))
      (and (Set_in r2@156@01 lists@3@01) (not (Set_in r2@156@01 lists@3@01)))
      (= r1@156@01 r2@156@01))
    (= r1@156@01 r2@156@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@156@01 $Ref)) (!
  (=>
    (and (Set_in r@156@01 lists@3@01) (not (Set_in r@156@01 lists@3@01)))
    (and
      (= (inv@157@01 r@156@01 length@4@01) r@156@01)
      (img@158@01 r@156@01 length@4@01)))
  :pattern ((Set_in r@156@01 lists@3@01))
  :pattern ((inv@157@01 r@156@01 length@4@01))
  :pattern ((img@158@01 r@156@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (img@158@01 r i)
      (and
        (Set_in (inv@157@01 r i) lists@3@01)
        (not (Set_in (inv@157@01 r i) lists@3@01))))
    (and (= (inv@157@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@157@01 r i))
  :qid |list-fctOfInv|)))
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r@156@01 $Ref)) (!
  (= length@4@01 (- length@4@01 1))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@159@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@157@01 r i) lists@3@01)
        (not (Set_in (inv@157@01 r i) lists@3@01)))
      (img@158@01 r i)
      (and (= r (inv@157@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@160@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@157@01 r i) lists@3@01)
        (not (Set_in (inv@157@01 r i) lists@3@01)))
      (img@158@01 r i)
      (and (= r (inv@157@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite
        (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@159@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      (pTaken@159@01 r i))
    $Perm.No)
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@157@01 r i) lists@3@01)
        (not (Set_in (inv@157@01 r i) lists@3@01)))
      (img@158@01 r i)
      (and (= r (inv@157@01 r i)) (= i length@4@01)))
    (= (- $Perm.Write (pTaken@159@01 r i)) $Perm.No))
  
  :qid |quant-u-102|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(assert (forall ((s@129@01 $Snap)) (!
  (=>
    (and
      (img@25@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@129@01)) ($SortWrappers.$SnapToInt ($Snap.second s@129@01)))
      (Set_in (inv@24@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@129@01)) ($SortWrappers.$SnapToInt ($Snap.second s@129@01))) s@20@01))
    (and
      (not (= s@129@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@128@01  $PSF<list>) s@129@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) s@129@01))))
  :pattern (($PSF.lookup_list (as sm@128@01  $PSF<list>) s@129@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) s@129@01))
  :qid |qp.psmValDef22|)))
(assert (forall ((s@129@01 $Snap)) (!
  (=>
    (and
      (img@124@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@129@01)) ($SortWrappers.$SnapToInt ($Snap.second s@129@01)))
      (Set_in (inv@123@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@129@01)) ($SortWrappers.$SnapToInt ($Snap.second s@129@01))) sNext@21@01))
    (and
      (not (= s@129@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@128@01  $PSF<list>) s@129@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) s@129@01))))
  :pattern (($PSF.lookup_list (as sm@128@01  $PSF<list>) s@129@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) s@129@01))
  :qid |qp.psmValDef23|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@161@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 50 | !(r@161@01 in lists@3@01) | live]
; [else-branch: 50 | r@161@01 in lists@3@01 | live]
(push) ; 10
; [then-branch: 50 | !(r@161@01 in lists@3@01)]
(assert (not (Set_in r@161@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 50 | r@161@01 in lists@3@01]
(assert (Set_in r@161@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01))))
(push) ; 9
; [then-branch: 51 | r@161@01 in lists@3@01 && !(r@161@01 in lists@3@01) | live]
; [else-branch: 51 | !(r@161@01 in lists@3@01 && !(r@161@01 in lists@3@01)) | live]
(push) ; 10
; [then-branch: 51 | r@161@01 in lists@3@01 && !(r@161@01 in lists@3@01)]
(assert (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01))))
; [eval] allSet(r, length, v)
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@162@01 ((r $Ref) (i Int) (r@161@01 $Ref)) $Perm
  (ite
    (and (= r r@161@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@163@01 ((r $Ref) (i Int) (r@161@01 $Ref)) $Perm
  (ite
    (and (= r r@161@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@162@01 r i r@161@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      (pTaken@162@01 r i r@161@01))
    $Perm.No)
  
  :qid |quant-u-104|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@161@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@162@01 r i r@161@01)) $Perm.No))
  
  :qid |quant-u-105|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@25@01 r@161@01 length@4@01)
    (Set_in (inv@24@01 r@161@01 length@4@01) s@20@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@161@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@161@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (and
    (img@124@01 r@161@01 length@4@01)
    (Set_in (inv@123@01 r@161@01 length@4@01) sNext@21@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@161@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@161@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@161@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (=>
    (and
      (img@25@01 r@161@01 length@4@01)
      (Set_in (inv@24@01 r@161@01 length@4@01) s@20@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@161@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (and
      (img@124@01 r@161@01 length@4@01)
      (Set_in (inv@123@01 r@161@01 length@4@01) sNext@21@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@161@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@161@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 51 | !(r@161@01 in lists@3@01 && !(r@161@01 in lists@3@01))]
(assert (not (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))
  (and
    (Set_in r@161@01 lists@3@01)
    (not (Set_in r@161@01 lists@3@01))
    (=>
      (and
        (img@25@01 r@161@01 length@4@01)
        (Set_in (inv@24@01 r@161@01 length@4@01) s@20@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@161@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@161@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@161@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (and
        (img@124@01 r@161@01 length@4@01)
        (Set_in (inv@123@01 r@161@01 length@4@01) sNext@21@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@161@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@161@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@161@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@161@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01))))
  (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@161@01 $Ref)) (!
  (and
    (or (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))
    (=>
      (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))
      (and
        (Set_in r@161@01 lists@3@01)
        (not (Set_in r@161@01 lists@3@01))
        (=>
          (and
            (img@25@01 r@161@01 length@4@01)
            (Set_in (inv@24@01 r@161@01 length@4@01) s@20@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@161@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@161@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@161@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (img@124@01 r@161@01 length@4@01)
            (Set_in (inv@123@01 r@161@01 length@4@01) sNext@21@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@161@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@161@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@161@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01))))
      (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))))
  :pattern ((Set_in r@161@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@161@01 $Ref)) (!
  (and
    (or (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))
    (=>
      (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))
      (and
        (Set_in r@161@01 lists@3@01)
        (not (Set_in r@161@01 lists@3@01))
        (=>
          (and
            (img@25@01 r@161@01 length@4@01)
            (Set_in (inv@24@01 r@161@01 length@4@01) s@20@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@161@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@161@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@161@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (img@124@01 r@161@01 length@4@01)
            (Set_in (inv@123@01 r@161@01 length@4@01) sNext@21@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@161@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@161@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@161@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01))))
      (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@161@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@161@01 $Ref)) (!
  (=>
    (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))
    (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@161@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
  :pattern ((Set_in r@161@01 lists@3@01))
  :pattern ((Set_in r@161@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@161@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85_precondition|)))
(push) ; 8
(assert (not (forall ((r@161@01 $Ref)) (!
  (=>
    (and
      (=>
        (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))
        (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@161@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
      (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01))))
    (allSet ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@161@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
  :pattern ((Set_in r@161@01 lists@3@01))
  :pattern ((Set_in r@161@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@161@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@161@01 $Ref)) (!
  (=>
    (and (Set_in r@161@01 lists@3@01) (not (Set_in r@161@01 lists@3@01)))
    (allSet ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@161@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
  :pattern ((Set_in r@161@01 lists@3@01))
  :pattern ((Set_in r@161@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@161@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@161@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85|)))
(declare-const r@164@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@164@01 lists@3@01))
(pop) ; 8
(declare-fun inv@165@01 ($Ref) $Ref)
(declare-fun img@166@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@164@01 $Ref) (r2@164@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@164@01 lists@3@01)
      (Set_in r2@164@01 lists@3@01)
      (= r1@164@01 r2@164@01))
    (= r1@164@01 r2@164@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@164@01 $Ref)) (!
  (=>
    (Set_in r@164@01 lists@3@01)
    (and (= (inv@165@01 r@164@01) r@164@01) (img@166@01 r@164@01)))
  :pattern ((Set_in r@164@01 lists@3@01))
  :pattern ((inv@165@01 r@164@01))
  :pattern ((img@166@01 r@164@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@166@01 r) (Set_in (inv@165@01 r) lists@3@01))
    (= (inv@165@01 r) r))
  :pattern ((inv@165@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@167@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@165@01 r) lists@3@01) (img@166@01 r) (= r (inv@165@01 r)))
    ($Perm.min
      (ite
        (and
          (img@34@01 r)
          (and
            (Set_in (inv@33@01 r) lists@3@01)
            (not (Set_in (inv@33@01 r) s@20@01))))
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
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@34@01 r)
          (and
            (Set_in (inv@33@01 r) lists@3@01)
            (not (Set_in (inv@33@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@167@01 r))
    $Perm.No)
  
  :qid |quant-u-108|))))
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
    (and (Set_in (inv@165@01 r) lists@3@01) (img@166@01 r) (= r (inv@165@01 r)))
    (= (- $Perm.Write (pTaken@167@01 r)) $Perm.No))
  
  :qid |quant-u-109|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@168@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (and
        (Set_in (inv@33@01 r) lists@3@01)
        (not (Set_in (inv@33@01 r) s@20@01))))
    (=
      ($FVF.lookup_val (as sm@168@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@168@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))) r))
  :qid |qp.fvfValDef27|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@169@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 9
; [then-branch: 52 | r@169@01 in lists@3@01 | live]
; [else-branch: 52 | !(r@169@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 52 | r@169@01 in lists@3@01]
(assert (Set_in r@169@01 lists@3@01))
; [eval] r.val == v
(push) ; 11
(assert (not (and
  (img@34@01 r@169@01)
  (and
    (Set_in (inv@33@01 r@169@01) lists@3@01)
    (not (Set_in (inv@33@01 r@169@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 52 | !(r@169@01 in lists@3@01)]
(assert (not (Set_in r@169@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@169@01 lists@3@01)) (Set_in r@169@01 lists@3@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@169@01 $Ref)) (!
  (or (not (Set_in r@169@01 lists@3@01)) (Set_in r@169@01 lists@3@01))
  :pattern ((Set_in r@169@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86-aux|)))
(push) ; 8
(assert (not (forall ((r@169@01 $Ref)) (!
  (=>
    (Set_in r@169@01 lists@3@01)
    (= ($FVF.lookup_val (as sm@168@01  $FVF<val>) r@169@01) v@5@01))
  :pattern ((Set_in r@169@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@169@01 $Ref)) (!
  (=>
    (Set_in r@169@01 lists@3@01)
    (= ($FVF.lookup_val (as sm@168@01  $FVF<val>) r@169@01) v@5@01))
  :pattern ((Set_in r@169@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86|)))
(declare-const r@170@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@170@01 lists@3@01))
(pop) ; 8
(declare-fun inv@171@01 ($Ref) $Ref)
(declare-fun img@172@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@170@01 $Ref) (r2@170@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@170@01 lists@3@01)
      (Set_in r2@170@01 lists@3@01)
      (= r1@170@01 r2@170@01))
    (= r1@170@01 r2@170@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@170@01 $Ref)) (!
  (=>
    (Set_in r@170@01 lists@3@01)
    (and (= (inv@171@01 r@170@01) r@170@01) (img@172@01 r@170@01)))
  :pattern ((Set_in r@170@01 lists@3@01))
  :pattern ((inv@171@01 r@170@01))
  :pattern ((img@172@01 r@170@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@172@01 r) (Set_in (inv@171@01 r) lists@3@01))
    (= (inv@171@01 r) r))
  :pattern ((inv@171@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@173@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@171@01 r) lists@3@01) (img@172@01 r) (= r (inv@171@01 r)))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and
            (Set_in (inv@27@01 r) lists@3@01)
            (not (Set_in (inv@27@01 r) s@20@01))))
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
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@28@01 r)
          (and
            (Set_in (inv@27@01 r) lists@3@01)
            (not (Set_in (inv@27@01 r) s@20@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@173@01 r))
    $Perm.No)
  
  :qid |quant-u-112|))))
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
    (and (Set_in (inv@171@01 r) lists@3@01) (img@172@01 r) (= r (inv@171@01 r)))
    (= (- $Perm.Write (pTaken@173@01 r)) $Perm.No))
  
  :qid |quant-u-113|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@174@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and
        (Set_in (inv@27@01 r) lists@3@01)
        (not (Set_in (inv@27@01 r) s@20@01))))
    (=
      ($FVF.lookup_next (as sm@174@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r)))
  :pattern (($FVF.lookup_next (as sm@174@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@22@01))) r))
  :qid |qp.fvfValDef28|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@175@01 $Ref)
(declare-const r2@176@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 9
; [then-branch: 53 | !(r1@175@01 in lists@3@01) | live]
; [else-branch: 53 | r1@175@01 in lists@3@01 | live]
(push) ; 10
; [then-branch: 53 | !(r1@175@01 in lists@3@01)]
(assert (not (Set_in r1@175@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 53 | r1@175@01 in lists@3@01]
(assert (Set_in r1@175@01 lists@3@01))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 54 | !(r2@176@01 in lists@3@01) | live]
; [else-branch: 54 | r2@176@01 in lists@3@01 | live]
(push) ; 12
; [then-branch: 54 | !(r2@176@01 in lists@3@01)]
(assert (not (Set_in r2@176@01 lists@3@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 54 | r2@176@01 in lists@3@01]
(assert (Set_in r2@176@01 lists@3@01))
; [eval] r1 != r2
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r2@176@01 lists@3@01) (not (Set_in r2@176@01 lists@3@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r1@175@01 lists@3@01)
  (and
    (Set_in r1@175@01 lists@3@01)
    (or (Set_in r2@176@01 lists@3@01) (not (Set_in r2@176@01 lists@3@01))))))
(assert (or (Set_in r1@175@01 lists@3@01) (not (Set_in r1@175@01 lists@3@01))))
(push) ; 9
; [then-branch: 55 | r1@175@01 in lists@3@01 && r2@176@01 in lists@3@01 && r1@175@01 != r2@176@01 | live]
; [else-branch: 55 | !(r1@175@01 in lists@3@01 && r2@176@01 in lists@3@01 && r1@175@01 != r2@176@01) | live]
(push) ; 10
; [then-branch: 55 | r1@175@01 in lists@3@01 && r2@176@01 in lists@3@01 && r1@175@01 != r2@176@01]
(assert (and
  (Set_in r1@175@01 lists@3@01)
  (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01)))))
; [eval] r1.next != r2.next
(push) ; 11
(assert (not (and
  (img@28@01 r1@175@01)
  (and
    (Set_in (inv@27@01 r1@175@01) lists@3@01)
    (not (Set_in (inv@27@01 r1@175@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (and
  (img@28@01 r2@176@01)
  (and
    (Set_in (inv@27@01 r2@176@01) lists@3@01)
    (not (Set_in (inv@27@01 r2@176@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 55 | !(r1@175@01 in lists@3@01 && r2@176@01 in lists@3@01 && r1@175@01 != r2@176@01)]
(assert (not
  (and
    (Set_in r1@175@01 lists@3@01)
    (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01))))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (Set_in r1@175@01 lists@3@01)
    (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01))))
  (and
    (Set_in r1@175@01 lists@3@01)
    (Set_in r2@176@01 lists@3@01)
    (not (= r1@175@01 r2@176@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in r1@175@01 lists@3@01)
      (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01)))))
  (and
    (Set_in r1@175@01 lists@3@01)
    (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01))))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@175@01 $Ref) (r2@176@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@175@01 lists@3@01)
      (and
        (Set_in r1@175@01 lists@3@01)
        (or (Set_in r2@176@01 lists@3@01) (not (Set_in r2@176@01 lists@3@01)))))
    (or (Set_in r1@175@01 lists@3@01) (not (Set_in r1@175@01 lists@3@01)))
    (=>
      (and
        (Set_in r1@175@01 lists@3@01)
        (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01))))
      (and
        (Set_in r1@175@01 lists@3@01)
        (Set_in r2@176@01 lists@3@01)
        (not (= r1@175@01 r2@176@01))))
    (or
      (not
        (and
          (Set_in r1@175@01 lists@3@01)
          (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01)))))
      (and
        (Set_in r1@175@01 lists@3@01)
        (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01))))))
  :pattern ((Set_in r1@175@01 lists@3@01) (Set_in r2@176@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99-aux|)))
(push) ; 8
(assert (not (forall ((r1@175@01 $Ref) (r2@176@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@175@01 lists@3@01)
      (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01))))
    (not
      (=
        ($FVF.lookup_next (as sm@174@01  $FVF<next>) r1@175@01)
        ($FVF.lookup_next (as sm@174@01  $FVF<next>) r2@176@01))))
  :pattern ((Set_in r1@175@01 lists@3@01) (Set_in r2@176@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r1@175@01 $Ref) (r2@176@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@175@01 lists@3@01)
      (and (Set_in r2@176@01 lists@3@01) (not (= r1@175@01 r2@176@01))))
    (not
      (=
        ($FVF.lookup_next (as sm@174@01  $FVF<next>) r1@175@01)
        ($FVF.lookup_next (as sm@174@01  $FVF<next>) r2@176@01))))
  :pattern ((Set_in r1@175@01 lists@3@01) (Set_in r2@176@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99|)))
(declare-const r@177@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@177@01 lists@3@01))
(push) ; 9
(assert (not (and
  (img@28@01 r@177@01)
  (and
    (Set_in (inv@27@01 r@177@01) lists@3@01)
    (not (Set_in (inv@27@01 r@177@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 8
(declare-fun inv@178@01 ($Ref Int) $Ref)
(declare-fun img@179@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@177@01 $Ref) (r2@177@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@177@01 lists@3@01)
      (Set_in r2@177@01 lists@3@01)
      (=
        ($FVF.lookup_next (as sm@174@01  $FVF<next>) r1@177@01)
        ($FVF.lookup_next (as sm@174@01  $FVF<next>) r2@177@01)))
    (= r1@177@01 r2@177@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@177@01 $Ref)) (!
  (=>
    (Set_in r@177@01 lists@3@01)
    (and
      (=
        (inv@178@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@177@01) (-
          length@4@01
          1))
        r@177@01)
      (img@179@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@177@01) (-
        length@4@01
        1))))
  :pattern (($FVF.lookup_next (as sm@174@01  $FVF<next>) r@177@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@179@01 r i) (Set_in (inv@178@01 r i) lists@3@01))
    (and
      (= ($FVF.lookup_next (as sm@174@01  $FVF<next>) (inv@178@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@178@01 r i))
  :qid |list-fctOfInv|)))
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r@177@01 $Ref)) (!
  (= ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@177@01) r@177@01)
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@180@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@178@01 r i) lists@3@01)
      (img@179@01 r i)
      (and
        (= r ($FVF.lookup_next (as sm@174@01  $FVF<next>) (inv@178@01 r i)))
        (= i (- length@4@01 1))))
    ($Perm.min
      (ite
        (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@180@01 r i))
    $Perm.No)
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@180@01 r i) $Perm.No)
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Set_in (inv@178@01 r i) lists@3@01)
      (img@179@01 r i)
      (and
        (= r ($FVF.lookup_next (as sm@174@01  $FVF<next>) (inv@178@01 r i)))
        (= i (- length@4@01 1))))
    (= (- $Perm.Write (pTaken@180@01 r i)) $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@181@01 $PSF<list>)
(declare-const s@182@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@182@01 $Snap)) (!
  (=>
    (and
      (img@124@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@182@01)) ($SortWrappers.$SnapToInt ($Snap.second s@182@01)))
      (Set_in (inv@123@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@182@01)) ($SortWrappers.$SnapToInt ($Snap.second s@182@01))) sNext@21@01))
    (and
      (not (= s@182@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@181@01  $PSF<list>) s@182@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) s@182@01))))
  :pattern (($PSF.lookup_list (as sm@181@01  $PSF<list>) s@182@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) s@182@01))
  :qid |qp.psmValDef29|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@183@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 9
; [then-branch: 56 | r@183@01 in lists@3@01 | live]
; [else-branch: 56 | !(r@183@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 56 | r@183@01 in lists@3@01]
(assert (Set_in r@183@01 lists@3@01))
; [eval] allSet(r.next, length - 1, v)
(push) ; 11
(assert (not (and
  (img@28@01 r@183@01)
  (and
    (Set_in (inv@27@01 r@183@01) lists@3@01)
    (not (Set_in (inv@27@01 r@183@01) s@20@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@184@01 ((r $Ref) (i Int) (r@183@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@185@01 ((r $Ref) (i Int) (r@183@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@184@01 r i r@183@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@25@01 r i) (Set_in (inv@24@01 r i) s@20@01))
        $Perm.Write
        $Perm.No)
      (pTaken@184@01 r i r@183@01))
    $Perm.No)
  
  :qid |quant-u-121|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@184@01 r i r@183@01)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@185@01 r i r@183@01))
    $Perm.No)
  
  :qid |quant-u-123|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@185@01 r i r@183@01) $Perm.No)
  
  :qid |quant-u-124|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
      (= i (- length@4@01 1)))
    (=
      (-
        (- $Perm.Write (pTaken@184@01 r i r@183@01))
        (pTaken@185@01 r i r@183@01))
      $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@25@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
      length@4@01
      1))
    (Set_in (inv@24@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
      length@4@01
      1)) s@20@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (img@124@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
      length@4@01
      1))
    (Set_in (inv@123@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
      length@4@01
      1)) sNext@21@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (=>
    (and
      (img@25@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
        length@4@01
        1))
      (Set_in (inv@24@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
        length@4@01
        1)) s@20@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (and
      (img@124@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
        length@4@01
        1))
      (Set_in (inv@123@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
        length@4@01
        1)) sNext@21@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 56 | !(r@183@01 in lists@3@01)]
(assert (not (Set_in r@183@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r@183@01 lists@3@01)
  (and
    (Set_in r@183@01 lists@3@01)
    (=>
      (and
        (img@25@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
          length@4@01
          1))
        (Set_in (inv@24@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
          length@4@01
          1)) s@20@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (and
        (img@124@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
          length@4@01
          1))
        (Set_in (inv@123@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
          length@4@01
          1)) sNext@21@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@183@01 lists@3@01)) (Set_in r@183@01 lists@3@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@183@01 $Ref)) (!
  (and
    (=>
      (Set_in r@183@01 lists@3@01)
      (and
        (Set_in r@183@01 lists@3@01)
        (=>
          (and
            (img@25@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
              length@4@01
              1))
            (Set_in (inv@24@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
              length@4@01
              1)) s@20@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@22@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (img@124@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
              length@4@01
              1))
            (Set_in (inv@123@01 ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
              length@4@01
              1)) sNext@21@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@121@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@183@01 lists@3@01)) (Set_in r@183@01 lists@3@01)))
  :pattern ((Set_in r@183@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75-aux|)))
(assert (forall ((r@183@01 $Ref)) (!
  (=>
    (Set_in r@183@01 lists@3@01)
    (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@183@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75_precondition|)))
(push) ; 8
(assert (not (forall ((r@183@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in r@183@01 lists@3@01)
        (allSet%precondition ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
          length@4@01
          1) v@5@01))
      (Set_in r@183@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@183@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@183@01 $Ref)) (!
  (=>
    (Set_in r@183@01 lists@3@01)
    (allSet ($PSF.lookup_list (as sm@128@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@174@01  $FVF<next>) r@183@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@183@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
    (and
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) (inv@149@01 r i))
        r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@149@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r@148@01 $Ref)) (!
  (=>
    (Set_in r@148@01 s@130@01)
    (and
      (=
        (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01) (-
          length@4@01
          1))
        r@148@01)
      (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01) (-
        length@4@01
        1))))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01))
  :qid |quant-u-89|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))
  $Snap.unit))
(assert (forall ((r@151@01 $Ref)) (!
  (and
    (=>
      (Set_in r@151@01 s@130@01)
      (and
        (Set_in r@151@01 s@130@01)
        (=>
          (and
            (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
              length@4@01
              1))
            (and
              (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
                length@4@01
                1)) lists@3@01)
              (not
                (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
                  length@4@01
                  1)) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
              length@4@01
              1))
            (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
              length@4@01
              1)) s@130@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@151@01 s@130@01)) (Set_in r@151@01 s@130@01)))
  :pattern ((Set_in r@151@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75-aux|)))
(assert (forall ((r@151@01 $Ref)) (!
  (=>
    (Set_in r@151@01 s@130@01)
    (allSet ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@151@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@151@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01)) (= (inv@144@01 r) r))
  :pattern ((inv@144@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r@143@01 $Ref)) (!
  (=>
    (Set_in r@143@01 s@130@01)
    (and (= (inv@144@01 r@143@01) r@143@01) (img@145@01 r@143@01)))
  :pattern ((Set_in r@143@01 s@130@01))
  :pattern ((inv@144@01 r@143@01))
  :pattern ((img@145@01 r@143@01))
  :qid |quant-u-87|)))
(assert (forall ((r@143@01 $Ref)) (!
  (=> (Set_in r@143@01 s@130@01) (not (= r@143@01 $Ref.null)))
  :pattern ((Set_in r@143@01 s@130@01))
  :pattern ((inv@144@01 r@143@01))
  :pattern ((img@145@01 r@143@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
  $Snap.unit))
(assert (forall ((r1@146@01 $Ref) (r2@147@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@146@01 s@130@01)
      (and
        (Set_in r1@146@01 s@130@01)
        (or (Set_in r2@147@01 s@130@01) (not (Set_in r2@147@01 s@130@01)))))
    (or (Set_in r1@146@01 s@130@01) (not (Set_in r1@146@01 s@130@01)))
    (=>
      (and
        (Set_in r1@146@01 s@130@01)
        (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))
      (and
        (Set_in r1@146@01 s@130@01)
        (Set_in r2@147@01 s@130@01)
        (not (= r1@146@01 r2@147@01))))
    (or
      (not
        (and
          (Set_in r1@146@01 s@130@01)
          (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01)))))
      (and
        (Set_in r1@146@01 s@130@01)
        (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))))
  :pattern ((Set_in r1@146@01 s@130@01) (Set_in r2@147@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99-aux|)))
(assert (forall ((r1@146@01 $Ref) (r2@147@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@146@01 s@130@01)
      (and (Set_in r2@147@01 s@130@01) (not (= r1@146@01 r2@147@01))))
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r1@146@01)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r2@147@01))))
  :pattern ((Set_in r1@146@01 s@130@01) (Set_in r2@147@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))))))
(assert (forall ((r $Ref)) (!
  (=> (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01)) (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r@139@01 $Ref)) (!
  (=>
    (Set_in r@139@01 s@130@01)
    (and (= (inv@140@01 r@139@01) r@139@01) (img@141@01 r@139@01)))
  :pattern ((Set_in r@139@01 s@130@01))
  :pattern ((inv@140@01 r@139@01))
  :pattern ((img@141@01 r@139@01))
  :qid |quant-u-85|)))
(assert (forall ((r@139@01 $Ref)) (!
  (=> (Set_in r@139@01 s@130@01) (not (= r@139@01 $Ref.null)))
  :pattern ((Set_in r@139@01 s@130@01))
  :pattern ((inv@140@01 r@139@01))
  :pattern ((img@141@01 r@139@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@131@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
  $Snap.unit))
(assert (forall ((r@142@01 $Ref)) (!
  (or (not (Set_in r@142@01 s@130@01)) (Set_in r@142@01 s@130@01))
  :pattern ((Set_in r@142@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86-aux|)))
(assert (forall ((r@142@01 $Ref)) (!
  (=>
    (Set_in r@142@01 s@130@01)
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) r@142@01)
      v@5@01))
  :pattern ((Set_in r@142@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (img@134@01 r i)
      (and
        (Set_in (inv@133@01 r i) lists@3@01)
        (not (Set_in (inv@133@01 r i) s@130@01))))
    (and (= (inv@133@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@133@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r@132@01 $Ref)) (!
  (=>
    (and (Set_in r@132@01 lists@3@01) (not (Set_in r@132@01 s@130@01)))
    (and
      (= (inv@133@01 r@132@01 length@4@01) r@132@01)
      (img@134@01 r@132@01 length@4@01)))
  :pattern ((Set_in r@132@01 lists@3@01))
  :pattern ((Set_in r@132@01 s@130@01))
  :pattern ((inv@133@01 r@132@01 length@4@01))
  :pattern ((img@134@01 r@132@01 length@4@01))
  :qid |quant-u-79|)))
(assert (=
  ($Snap.second $t@131@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@131@01))
    ($Snap.second ($Snap.second $t@131@01)))))
(assert (= ($Snap.first ($Snap.second $t@131@01)) $Snap.unit))
(assert (forall ((r@135@01 $Ref)) (!
  (and
    (or (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 lists@3@01)))
    (=>
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
      (and
        (Set_in r@135@01 lists@3@01)
        (not (Set_in r@135@01 s@130@01))
        (=>
          (and
            (img@134@01 r@135@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@135@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01))))
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))))
  :pattern ((Set_in r@135@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@135@01 $Ref)) (!
  (and
    (or (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 lists@3@01)))
    (=>
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
      (and
        (Set_in r@135@01 lists@3@01)
        (not (Set_in r@135@01 s@130@01))
        (=>
          (and
            (img@134@01 r@135@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@135@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01))))
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))))
  :pattern ((Set_in r@135@01 s@130@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@135@01 $Ref)) (!
  (and
    (or (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 lists@3@01)))
    (=>
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
      (and
        (Set_in r@135@01 lists@3@01)
        (not (Set_in r@135@01 s@130@01))
        (=>
          (and
            (img@134@01 r@135@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@135@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@135@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@135@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@135@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@135@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01))))
      (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@135@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@135@01 $Ref)) (!
  (=>
    (and (Set_in r@135@01 lists@3@01) (not (Set_in r@135@01 s@130@01)))
    (allSet ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@135@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01))
  :pattern ((Set_in r@135@01 lists@3@01))
  :pattern ((Set_in r@135@01 s@130@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@137@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@135@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@135@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85|)))
(assert (=
  ($Snap.second ($Snap.second $t@131@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@131@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@131@01))))))
(assert (= $t@131@01 ($Snap.combine ($Snap.first $t@131@01) ($Snap.second $t@131@01))))
(assert (forall ((r@132@01 $Ref)) (!
  (=>
    (and (Set_in r@132@01 lists@3@01) (not (Set_in r@132@01 s@130@01)))
    (or (Set_in r@132@01 lists@3@01) (not (Set_in r@132@01 lists@3@01))))
  :pattern ((Set_in r@132@01 lists@3@01))
  :pattern ((Set_in r@132@01 s@130@01))
  :pattern ((inv@133@01 r@132@01 length@4@01))
  :pattern ((img@134@01 r@132@01 length@4@01))
  :qid |list-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 9
; [eval] |s| > 0
; [eval] |s|
(pop) ; 9
(push) ; 9
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(pop) ; 9
; Loop head block: Follow loop-internal edges
; [eval] |s| > 0
; [eval] |s|
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> (Set_card s@130@01) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (> (Set_card s@130@01) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | |s@130@01| > 0 | live]
; [else-branch: 57 | !(|s@130@01| > 0) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 57 | |s@130@01| > 0]
(assert (> (Set_card s@130@01) 0))
; [exec]
; var l2: Ref
(declare-const l2@186@01 $Ref)
; [exec]
; inhale (l2 in s)
(declare-const $t@187@01 $Snap)
(assert (= $t@187@01 $Snap.unit))
; [eval] (l2 in s)
(assert (Set_in l2@186@01 s@130@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(list(l2, length), write)
; [eval] i > 0
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | length@4@01 > 0 | live]
; [else-branch: 58 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 58 | length@4@01 > 0]
; Precomputing data for removing quantified permissions
(define-fun pTaken@188@01 ((r $Ref)) $Perm
  (ite
    (= r l2@186@01)
    ($Perm.min
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01))
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
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01))
        $Perm.Write
        $Perm.No)
      (pTaken@188@01 r))
    $Perm.No)
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@188@01 r) $Perm.No)
  
  :qid |quant-u-128|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r l2@186@01) (= (- $Perm.Write (pTaken@188@01 r)) $Perm.No))
  
  :qid |quant-u-129|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@189@01 $FVF<val>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@141@01 l2@186@01) (Set_in (inv@140@01 l2@186@01) s@130@01))
  (=
    ($FVF.lookup_val (as sm@189@01  $FVF<val>) l2@186@01)
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) l2@186@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@190@01 ((r $Ref)) $Perm
  (ite
    (= r l2@186@01)
    ($Perm.min
      (ite
        (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01))
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
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01))
        $Perm.Write
        $Perm.No)
      (pTaken@190@01 r))
    $Perm.No)
  
  :qid |quant-u-131|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@190@01 r) $Perm.No)
  
  :qid |quant-u-132|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r l2@186@01) (= (- $Perm.Write (pTaken@190@01 r)) $Perm.No))
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@191@01 $FVF<next>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@145@01 l2@186@01) (Set_in (inv@144@01 l2@186@01) s@130@01))
  (=
    ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01)
    ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) l2@186@01))))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01))
    (=
      ($FVF.lookup_next (as sm@191@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r))
  :qid |qp.fvfValDef31|)))
(set-option :timeout 0)
(push) ; 11
(assert (not (and (img@145@01 l2@186@01) (Set_in (inv@144@01 l2@186@01) s@130@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] i - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@192@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@193@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@192@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@192@01 r i))
    $Perm.No)
  
  :qid |quant-u-135|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@192@01 r i) $Perm.No)
  
  :qid |quant-u-136|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@192@01 r i)) $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        $Perm.Write
        $Perm.No)
      (pTaken@193@01 r i))
    $Perm.No)
  
  :qid |quant-u-138|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@193@01 r i) $Perm.No)
  
  :qid |quant-u-139|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
      (= i (- length@4@01 1)))
    (= (- (- $Perm.Write (pTaken@192@01 r i)) (pTaken@193@01 r i)) $Perm.No))
  
  :qid |quant-u-140|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@134@01 ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01) (-
      length@4@01
      1))
    (and
      (Set_in (inv@133@01 ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01) (-
        length@4@01
        1)) lists@3@01)
      (not
        (Set_in (inv@133@01 ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01) (-
          length@4@01
          1)) s@130@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (img@150@01 ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01) (-
      length@4@01
      1))
    (Set_in (inv@149@01 ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01) (-
      length@4@01
      1)) s@130@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@189@01  $FVF<val>) l2@186@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
    ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))))) l2@186@01 length@4@01))
(declare-const sm@194@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l2@186@01)
    ($SortWrappers.IntTo$Snap length@4@01)))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@189@01  $FVF<val>) l2@186@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
      ($PSF.lookup_list (as sm@154@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@191@01  $FVF<next>) l2@186@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
; [exec]
; s := (s setminus Set(l2))
; [eval] (s setminus Set(l2))
; [eval] Set(l2)
(declare-const s@195@01 Set<$Ref>)
(assert (= s@195@01 (Set_difference s@130@01 (Set_singleton l2@186@01))))
; Loop head block: Re-establish invariant
(declare-const r@196@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 12
; [then-branch: 59 | !(r@196@01 in lists@3@01) | live]
; [else-branch: 59 | r@196@01 in lists@3@01 | live]
(push) ; 13
; [then-branch: 59 | !(r@196@01 in lists@3@01)]
(assert (not (Set_in r@196@01 lists@3@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 59 | r@196@01 in lists@3@01]
(assert (Set_in r@196@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@196@01 lists@3@01) (not (Set_in r@196@01 lists@3@01))))
(assert (and (Set_in r@196@01 lists@3@01) (not (Set_in r@196@01 s@195@01))))
(pop) ; 11
(declare-fun inv@197@01 ($Ref Int) $Ref)
(declare-fun img@198@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@196@01 $Ref)) (!
  (=>
    (and (Set_in r@196@01 lists@3@01) (not (Set_in r@196@01 s@195@01)))
    (or (Set_in r@196@01 lists@3@01) (not (Set_in r@196@01 lists@3@01))))
  :pattern ((Set_in r@196@01 lists@3@01))
  :pattern ((Set_in r@196@01 s@195@01))
  :pattern ((inv@197@01 r@196@01 length@4@01))
  :pattern ((img@198@01 r@196@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@196@01 $Ref) (r2@196@01 $Ref)) (!
  (=>
    (and
      (and (Set_in r1@196@01 lists@3@01) (not (Set_in r1@196@01 s@195@01)))
      (and (Set_in r2@196@01 lists@3@01) (not (Set_in r2@196@01 s@195@01)))
      (= r1@196@01 r2@196@01))
    (= r1@196@01 r2@196@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@196@01 $Ref)) (!
  (=>
    (and (Set_in r@196@01 lists@3@01) (not (Set_in r@196@01 s@195@01)))
    (and
      (= (inv@197@01 r@196@01 length@4@01) r@196@01)
      (img@198@01 r@196@01 length@4@01)))
  :pattern ((Set_in r@196@01 lists@3@01))
  :pattern ((Set_in r@196@01 s@195@01))
  :pattern ((inv@197@01 r@196@01 length@4@01))
  :pattern ((img@198@01 r@196@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (img@198@01 r i)
      (and
        (Set_in (inv@197@01 r i) lists@3@01)
        (not (Set_in (inv@197@01 r i) s@195@01))))
    (and (= (inv@197@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@197@01 r i))
  :qid |list-fctOfInv|)))
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r@196@01 $Ref)) (!
  (=
    r@196@01
    ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@196@01))
  
  :qid |quant-u-142|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@199@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@197@01 r i) lists@3@01)
        (not (Set_in (inv@197@01 r i) s@195@01)))
      (img@198@01 r i)
      (and (= r (inv@197@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@200@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@197@01 r i) lists@3@01)
        (not (Set_in (inv@197@01 r i) s@195@01)))
      (img@198@01 r i)
      (and (= r (inv@197@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite (and (= r l2@186@01) (= i length@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@199@01 r i)))
    $Perm.No))
(define-fun pTaken@201@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@197@01 r i) lists@3@01)
        (not (Set_in (inv@197@01 r i) s@195@01)))
      (img@198@01 r i)
      (and (= r (inv@197@01 r i)) (= i length@4@01)))
    ($Perm.min
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        (- $Perm.Write (pTaken@193@01 r i))
        $Perm.No)
      (- (- $Perm.Write (pTaken@199@01 r i)) (pTaken@200@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@199@01 r i))
    $Perm.No)
  
  :qid |quant-u-144|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@197@01 r i) lists@3@01)
        (not (Set_in (inv@197@01 r i) s@195@01)))
      (img@198@01 r i)
      (and (= r (inv@197@01 r i)) (= i length@4@01)))
    (= (- $Perm.Write (pTaken@199@01 r i)) $Perm.No))
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@200@01 l2@186@01 length@4@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@200@01 r i) $Perm.No)
  
  :qid |quant-u-147|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@197@01 r i) lists@3@01)
        (not (Set_in (inv@197@01 r i) s@195@01)))
      (img@198@01 r i)
      (and (= r (inv@197@01 r i)) (= i length@4@01)))
    (= (- (- $Perm.Write (pTaken@199@01 r i)) (pTaken@200@01 r i)) $Perm.No))
  
  :qid |quant-u-148|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@202@01 $PSF<list>)
(declare-const s@203@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@203@01 $Snap)) (!
  (and
    (=>
      (Set_in s@203@01 ($PSF.domain_list (as sm@202@01  $PSF<list>)))
      (and
        (and
          (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) lists@3@01)
          (not
            (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) s@195@01)))
        (img@198@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01)))))
    (=>
      (and
        (and
          (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) lists@3@01)
          (not
            (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) s@195@01)))
        (img@198@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))))
      (Set_in s@203@01 ($PSF.domain_list (as sm@202@01  $PSF<list>)))))
  :pattern ((Set_in s@203@01 ($PSF.domain_list (as sm@202@01  $PSF<list>))))
  :qid |qp.psmDomDef35|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@203@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) lists@3@01)
          (not
            (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) s@195@01)))
        (img@198@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) l2@186@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@203@01)) length@4@01)))
    (and
      (not (= s@203@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@202@01  $PSF<list>) s@203@01)
        ($PSF.lookup_list (as sm@194@01  $PSF<list>) s@203@01))))
  :pattern (($PSF.lookup_list (as sm@202@01  $PSF<list>) s@203@01))
  :pattern (($PSF.lookup_list (as sm@194@01  $PSF<list>) s@203@01))
  :qid |qp.psmValDef32|)))
(assert (forall ((s@203@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) lists@3@01)
          (not
            (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) s@195@01)))
        (img@198@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))))
      (ite
        (and
          (img@150@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01)))
          (Set_in (inv@149@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) s@130@01))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@193@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01)))))
        false))
    (and
      (not (= s@203@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@202@01  $PSF<list>) s@203@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) s@203@01))))
  :pattern (($PSF.lookup_list (as sm@202@01  $PSF<list>) s@203@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) s@203@01))
  :qid |qp.psmValDef33|)))
(assert (forall ((s@203@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) lists@3@01)
          (not
            (Set_in (inv@197@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) s@195@01)))
        (img@198@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))))
      (and
        (img@134@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01)))
        (and
          (Set_in (inv@133@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) lists@3@01)
          (not
            (Set_in (inv@133@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@203@01)) ($SortWrappers.$SnapToInt ($Snap.second s@203@01))) s@130@01)))))
    (and
      (not (= s@203@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@202@01  $PSF<list>) s@203@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) s@203@01))))
  :pattern (($PSF.lookup_list (as sm@202@01  $PSF<list>) s@203@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) s@203@01))
  :qid |qp.psmValDef34|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@204@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 12
; [then-branch: 60 | !(r@204@01 in lists@3@01) | live]
; [else-branch: 60 | r@204@01 in lists@3@01 | live]
(push) ; 13
; [then-branch: 60 | !(r@204@01 in lists@3@01)]
(assert (not (Set_in r@204@01 lists@3@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 60 | r@204@01 in lists@3@01]
(assert (Set_in r@204@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 lists@3@01))))
(push) ; 12
; [then-branch: 61 | r@204@01 in lists@3@01 && !(r@204@01 in s@195@01) | live]
; [else-branch: 61 | !(r@204@01 in lists@3@01 && !(r@204@01 in s@195@01)) | live]
(push) ; 13
; [then-branch: 61 | r@204@01 in lists@3@01 && !(r@204@01 in s@195@01)]
(assert (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01))))
; [eval] allSet(r, length, v)
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (= l2@186@01 r@204@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,01s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@205@01 ((r $Ref) (i Int) (r@204@01 $Ref)) $Perm
  (ite
    (and (= r r@204@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        (- $Perm.Write (pTaken@193@01 r i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@206@01 ((r $Ref) (i Int) (r@204@01 $Ref)) $Perm
  (ite
    (and (= r r@204@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@205@01 r i r@204@01)))
    $Perm.No))
(define-fun pTaken@207@01 ((r $Ref) (i Int) (r@204@01 $Ref)) $Perm
  (ite
    (and (= r r@204@01) (= i length@4@01))
    ($Perm.min
      (ite (and (= r l2@186@01) (= i length@4@01)) $Perm.Write $Perm.No)
      (-
        (- $Perm.Write (pTaken@205@01 r i r@204@01))
        (pTaken@206@01 r i r@204@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        (- $Perm.Write (pTaken@193@01 r i))
        $Perm.No)
      (pTaken@205@01 r i r@204@01))
    $Perm.No)
  
  :qid |quant-u-150|))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@205@01 r i r@204@01) $Perm.No)
  
  :qid |quant-u-151|))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@204@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@205@01 r i r@204@01)) $Perm.No))
  
  :qid |quant-u-152|))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@206@01 r i r@204@01))
    $Perm.No)
  
  :qid |quant-u-153|))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@206@01 r i r@204@01) $Perm.No)
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@204@01) (= i length@4@01))
    (=
      (-
        (- $Perm.Write (pTaken@205@01 r i r@204@01))
        (pTaken@206@01 r i r@204@01))
      $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@207@01 l2@186@01 length@4@01 r@204@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@207@01 r i r@204@01) $Perm.No)
  
  :qid |quant-u-157|))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@204@01) (= i length@4@01))
    (=
      (-
        (-
          (- $Perm.Write (pTaken@205@01 r i r@204@01))
          (pTaken@206@01 r i r@204@01))
        (pTaken@207@01 r i r@204@01))
      $Perm.No))
  
  :qid |quant-u-158|))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@208@01 $PSF<list>)
(declare-const s@209@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= r@204@01 l2@186@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@204@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@204@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (ite
    (and
      (img@150@01 r@204@01 length@4@01)
      (Set_in (inv@149@01 r@204@01 length@4@01) s@130@01))
    (< $Perm.No (- $Perm.Write (pTaken@193@01 r@204@01 length@4@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@204@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@204@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (and
    (img@134@01 r@204@01 length@4@01)
    (and
      (Set_in (inv@133@01 r@204@01 length@4@01) lists@3@01)
      (not (Set_in (inv@133@01 r@204@01 length@4@01) s@130@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@204@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@204@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@204@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
(pop) ; 14
; Joined path conditions
(assert (and
  (=>
    (= r@204@01 l2@186@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (ite
      (and
        (img@150@01 r@204@01 length@4@01)
        (Set_in (inv@149@01 r@204@01 length@4@01) s@130@01))
      (< $Perm.No (- $Perm.Write (pTaken@193@01 r@204@01 length@4@01)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (and
      (img@134@01 r@204@01 length@4@01)
      (and
        (Set_in (inv@133@01 r@204@01 length@4@01) lists@3@01)
        (not (Set_in (inv@133@01 r@204@01 length@4@01) s@130@01))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@204@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01)))
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 61 | !(r@204@01 in lists@3@01 && !(r@204@01 in s@195@01))]
(assert (not (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))
  (and
    (Set_in r@204@01 lists@3@01)
    (not (Set_in r@204@01 s@195@01))
    (=>
      (= r@204@01 l2@186@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@204@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (ite
        (and
          (img@150@01 r@204@01 length@4@01)
          (Set_in (inv@149@01 r@204@01 length@4@01) s@130@01))
        (< $Perm.No (- $Perm.Write (pTaken@193@01 r@204@01 length@4@01)))
        false)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@204@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (and
        (img@134@01 r@204@01 length@4@01)
        (and
          (Set_in (inv@133@01 r@204@01 length@4@01) lists@3@01)
          (not (Set_in (inv@133@01 r@204@01 length@4@01) s@130@01))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@204@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@204@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@204@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01))))
  (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@204@01 $Ref)) (!
  (and
    (or (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 lists@3@01)))
    (=>
      (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))
      (and
        (Set_in r@204@01 lists@3@01)
        (not (Set_in r@204@01 s@195@01))
        (=>
          (= r@204@01 l2@186@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (ite
            (and
              (img@150@01 r@204@01 length@4@01)
              (Set_in (inv@149@01 r@204@01 length@4@01) s@130@01))
            (< $Perm.No (- $Perm.Write (pTaken@193@01 r@204@01 length@4@01)))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (img@134@01 r@204@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@204@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@204@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01))))
      (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))))
  :pattern ((Set_in r@204@01 lists@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@204@01 $Ref)) (!
  (and
    (or (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 lists@3@01)))
    (=>
      (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))
      (and
        (Set_in r@204@01 lists@3@01)
        (not (Set_in r@204@01 s@195@01))
        (=>
          (= r@204@01 l2@186@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (ite
            (and
              (img@150@01 r@204@01 length@4@01)
              (Set_in (inv@149@01 r@204@01 length@4@01) s@130@01))
            (< $Perm.No (- $Perm.Write (pTaken@193@01 r@204@01 length@4@01)))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (img@134@01 r@204@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@204@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@204@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01))))
      (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))))
  :pattern ((Set_in r@204@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@204@01 $Ref)) (!
  (and
    (or (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 lists@3@01)))
    (=>
      (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))
      (and
        (Set_in r@204@01 lists@3@01)
        (not (Set_in r@204@01 s@195@01))
        (=>
          (= r@204@01 l2@186@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (ite
            (and
              (img@150@01 r@204@01 length@4@01)
              (Set_in (inv@149@01 r@204@01 length@4@01) s@130@01))
            (< $Perm.No (- $Perm.Write (pTaken@193@01 r@204@01 length@4@01)))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (img@134@01 r@204@01 length@4@01)
            (and
              (Set_in (inv@133@01 r@204@01 length@4@01) lists@3@01)
              (not (Set_in (inv@133@01 r@204@01 length@4@01) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@204@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@204@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01)))
    (or
      (not (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01))))
      (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@204@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85-aux|)))
(assert (forall ((r@204@01 $Ref)) (!
  (=>
    (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))
    (allSet%precondition ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@204@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
  :pattern ((Set_in r@204@01 lists@3@01))
  :pattern ((Set_in r@204@01 s@195@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@204@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85_precondition|)))
(push) ; 11
(assert (not (forall ((r@204@01 $Ref)) (!
  (=>
    (and
      (=>
        (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))
        (allSet%precondition ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@204@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
      (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01))))
    (allSet ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@204@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
  :pattern ((Set_in r@204@01 lists@3@01))
  :pattern ((Set_in r@204@01 s@195@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@204@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@204@01 $Ref)) (!
  (=>
    (and (Set_in r@204@01 lists@3@01) (not (Set_in r@204@01 s@195@01)))
    (allSet ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@204@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
  :pattern ((Set_in r@204@01 lists@3@01))
  :pattern ((Set_in r@204@01 s@195@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@204@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@204@01 length@4@01 v@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@53@19@53@85|)))
(declare-const r@210@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@210@01 s@195@01))
(pop) ; 11
(declare-fun inv@211@01 ($Ref) $Ref)
(declare-fun img@212@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@210@01 $Ref) (r2@210@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@210@01 s@195@01)
      (Set_in r2@210@01 s@195@01)
      (= r1@210@01 r2@210@01))
    (= r1@210@01 r2@210@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@210@01 $Ref)) (!
  (=>
    (Set_in r@210@01 s@195@01)
    (and (= (inv@211@01 r@210@01) r@210@01) (img@212@01 r@210@01)))
  :pattern ((Set_in r@210@01 s@195@01))
  :pattern ((inv@211@01 r@210@01))
  :pattern ((img@212@01 r@210@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@212@01 r) (Set_in (inv@211@01 r) s@195@01)) (= (inv@211@01 r) r))
  :pattern ((inv@211@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@213@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@211@01 r) s@195@01) (img@212@01 r) (= r (inv@211@01 r)))
    ($Perm.min
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01))
        (- $Perm.Write (pTaken@188@01 r))
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
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01))
        (- $Perm.Write (pTaken@188@01 r))
        $Perm.No)
      (pTaken@213@01 r))
    $Perm.No)
  
  :qid |quant-u-161|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@211@01 r) s@195@01) (img@212@01 r) (= r (inv@211@01 r)))
    (= (- $Perm.Write (pTaken@213@01 r)) $Perm.No))
  
  :qid |quant-u-162|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@214@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@214@01  $FVF<val>)))
      (and (Set_in (inv@211@01 r) s@195@01) (img@212@01 r)))
    (=>
      (and (Set_in (inv@211@01 r) s@195@01) (img@212@01 r))
      (Set_in r ($FVF.domain_val (as sm@214@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@214@01  $FVF<val>))))
  :qid |qp.fvfDomDef40|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@211@01 r) s@195@01) (img@212@01 r))
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01))
        (< $Perm.No (- $Perm.Write (pTaken@188@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@214@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@214@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) r))
  :qid |qp.fvfValDef39|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@215@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 12
; [then-branch: 62 | r@215@01 in s@195@01 | live]
; [else-branch: 62 | !(r@215@01 in s@195@01) | live]
(push) ; 13
; [then-branch: 62 | r@215@01 in s@195@01]
(assert (Set_in r@215@01 s@195@01))
; [eval] r.val == v
(push) ; 14
(assert (not (ite
  (and (img@141@01 r@215@01) (Set_in (inv@140@01 r@215@01) s@130@01))
  (< $Perm.No (- $Perm.Write (pTaken@188@01 r@215@01)))
  false)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(pop) ; 13
(push) ; 13
; [else-branch: 62 | !(r@215@01 in s@195@01)]
(assert (not (Set_in r@215@01 s@195@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@215@01 s@195@01)) (Set_in r@215@01 s@195@01)))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@215@01 $Ref)) (!
  (or (not (Set_in r@215@01 s@195@01)) (Set_in r@215@01 s@195@01))
  :pattern ((Set_in r@215@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86-aux|)))
(push) ; 11
(assert (not (forall ((r@215@01 $Ref)) (!
  (=>
    (Set_in r@215@01 s@195@01)
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) r@215@01)
      v@5@01))
  :pattern ((Set_in r@215@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@215@01 $Ref)) (!
  (=>
    (Set_in r@215@01 s@195@01)
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) r@215@01)
      v@5@01))
  :pattern ((Set_in r@215@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@54@19@54@86|)))
(declare-const r@216@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@216@01 s@195@01))
(pop) ; 11
(declare-fun inv@217@01 ($Ref) $Ref)
(declare-fun img@218@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@216@01 $Ref) (r2@216@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@216@01 s@195@01)
      (Set_in r2@216@01 s@195@01)
      (= r1@216@01 r2@216@01))
    (= r1@216@01 r2@216@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@216@01 $Ref)) (!
  (=>
    (Set_in r@216@01 s@195@01)
    (and (= (inv@217@01 r@216@01) r@216@01) (img@218@01 r@216@01)))
  :pattern ((Set_in r@216@01 s@195@01))
  :pattern ((inv@217@01 r@216@01))
  :pattern ((img@218@01 r@216@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@218@01 r) (Set_in (inv@217@01 r) s@195@01)) (= (inv@217@01 r) r))
  :pattern ((inv@217@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@219@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@217@01 r) s@195@01) (img@218@01 r) (= r (inv@217@01 r)))
    ($Perm.min
      (ite
        (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01))
        (- $Perm.Write (pTaken@190@01 r))
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
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01))
        (- $Perm.Write (pTaken@190@01 r))
        $Perm.No)
      (pTaken@219@01 r))
    $Perm.No)
  
  :qid |quant-u-165|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@217@01 r) s@195@01) (img@218@01 r) (= r (inv@217@01 r)))
    (= (- $Perm.Write (pTaken@219@01 r)) $Perm.No))
  
  :qid |quant-u-166|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@220@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@220@01  $FVF<next>)))
      (and (Set_in (inv@217@01 r) s@195@01) (img@218@01 r)))
    (=>
      (and (Set_in (inv@217@01 r) s@195@01) (img@218@01 r))
      (Set_in r ($FVF.domain_next (as sm@220@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@220@01  $FVF<next>))))
  :qid |qp.fvfDomDef42|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@217@01 r) s@195@01) (img@218@01 r))
      (ite
        (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01))
        (< $Perm.No (- $Perm.Write (pTaken@190@01 r)))
        false))
    (=
      ($FVF.lookup_next (as sm@220@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@220@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r))
  :qid |qp.fvfValDef41|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@221@01 $Ref)
(declare-const r2@222@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 12
; [then-branch: 63 | !(r1@221@01 in s@195@01) | live]
; [else-branch: 63 | r1@221@01 in s@195@01 | live]
(push) ; 13
; [then-branch: 63 | !(r1@221@01 in s@195@01)]
(assert (not (Set_in r1@221@01 s@195@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 63 | r1@221@01 in s@195@01]
(assert (Set_in r1@221@01 s@195@01))
; [eval] (r2 in s)
(push) ; 14
; [then-branch: 64 | !(r2@222@01 in s@195@01) | live]
; [else-branch: 64 | r2@222@01 in s@195@01 | live]
(push) ; 15
; [then-branch: 64 | !(r2@222@01 in s@195@01)]
(assert (not (Set_in r2@222@01 s@195@01)))
(pop) ; 15
(push) ; 15
; [else-branch: 64 | r2@222@01 in s@195@01]
(assert (Set_in r2@222@01 s@195@01))
; [eval] r1 != r2
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r2@222@01 s@195@01) (not (Set_in r2@222@01 s@195@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in r1@221@01 s@195@01)
  (and
    (Set_in r1@221@01 s@195@01)
    (or (Set_in r2@222@01 s@195@01) (not (Set_in r2@222@01 s@195@01))))))
(assert (or (Set_in r1@221@01 s@195@01) (not (Set_in r1@221@01 s@195@01))))
(push) ; 12
; [then-branch: 65 | r1@221@01 in s@195@01 && r2@222@01 in s@195@01 && r1@221@01 != r2@222@01 | live]
; [else-branch: 65 | !(r1@221@01 in s@195@01 && r2@222@01 in s@195@01 && r1@221@01 != r2@222@01) | live]
(push) ; 13
; [then-branch: 65 | r1@221@01 in s@195@01 && r2@222@01 in s@195@01 && r1@221@01 != r2@222@01]
(assert (and
  (Set_in r1@221@01 s@195@01)
  (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01)))))
; [eval] r1.next != r2.next
(push) ; 14
(assert (not (ite
  (and (img@145@01 r1@221@01) (Set_in (inv@144@01 r1@221@01) s@130@01))
  (< $Perm.No (- $Perm.Write (pTaken@190@01 r1@221@01)))
  false)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(push) ; 14
(assert (not (ite
  (and (img@145@01 r2@222@01) (Set_in (inv@144@01 r2@222@01) s@130@01))
  (< $Perm.No (- $Perm.Write (pTaken@190@01 r2@222@01)))
  false)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(pop) ; 13
(push) ; 13
; [else-branch: 65 | !(r1@221@01 in s@195@01 && r2@222@01 in s@195@01 && r1@221@01 != r2@222@01)]
(assert (not
  (and
    (Set_in r1@221@01 s@195@01)
    (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01))))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (and
    (Set_in r1@221@01 s@195@01)
    (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01))))
  (and
    (Set_in r1@221@01 s@195@01)
    (Set_in r2@222@01 s@195@01)
    (not (= r1@221@01 r2@222@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in r1@221@01 s@195@01)
      (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01)))))
  (and
    (Set_in r1@221@01 s@195@01)
    (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01))))))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@221@01 $Ref) (r2@222@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@221@01 s@195@01)
      (and
        (Set_in r1@221@01 s@195@01)
        (or (Set_in r2@222@01 s@195@01) (not (Set_in r2@222@01 s@195@01)))))
    (or (Set_in r1@221@01 s@195@01) (not (Set_in r1@221@01 s@195@01)))
    (=>
      (and
        (Set_in r1@221@01 s@195@01)
        (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01))))
      (and
        (Set_in r1@221@01 s@195@01)
        (Set_in r2@222@01 s@195@01)
        (not (= r1@221@01 r2@222@01))))
    (or
      (not
        (and
          (Set_in r1@221@01 s@195@01)
          (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01)))))
      (and
        (Set_in r1@221@01 s@195@01)
        (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01))))))
  :pattern ((Set_in r1@221@01 s@195@01) (Set_in r2@222@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99-aux|)))
(push) ; 11
(assert (not (forall ((r1@221@01 $Ref) (r2@222@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@221@01 s@195@01)
      (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01))))
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r1@221@01)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r2@222@01))))
  :pattern ((Set_in r1@221@01 s@195@01) (Set_in r2@222@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r1@221@01 $Ref) (r2@222@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@221@01 s@195@01)
      (and (Set_in r2@222@01 s@195@01) (not (= r1@221@01 r2@222@01))))
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r1@221@01)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r2@222@01))))
  :pattern ((Set_in r1@221@01 s@195@01) (Set_in r2@222@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@55@19@55@99|)))
(declare-const r@223@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@223@01 s@195@01))
(push) ; 12
(assert (not (ite
  (and (img@145@01 r@223@01) (Set_in (inv@144@01 r@223@01) s@130@01))
  (< $Perm.No (- $Perm.Write (pTaken@190@01 r@223@01)))
  false)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 11
(declare-fun inv@224@01 ($Ref Int) $Ref)
(declare-fun img@225@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@223@01 $Ref) (r2@223@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@223@01 s@195@01)
      (Set_in r2@223@01 s@195@01)
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r1@223@01)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r2@223@01)))
    (= r1@223@01 r2@223@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@223@01 $Ref)) (!
  (=>
    (Set_in r@223@01 s@195@01)
    (and
      (=
        (inv@224@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@223@01) (-
          length@4@01
          1))
        r@223@01)
      (img@225@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@223@01) (-
        length@4@01
        1))))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@223@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@225@01 r i) (Set_in (inv@224@01 r i) s@195@01))
    (and
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) (inv@224@01 r i))
        r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@224@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@226@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@224@01 r i) s@195@01)
      (img@225@01 r i)
      (and
        (=
          r
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) (inv@224@01 r i)))
        (= i (- length@4@01 1))))
    ($Perm.min
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        (- $Perm.Write (pTaken@193@01 r i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@227@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (Set_in (inv@224@01 r i) s@195@01)
      (img@225@01 r i)
      (and
        (=
          r
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) (inv@224@01 r i)))
        (= i (- length@4@01 1))))
    ($Perm.min
      (ite
        (and (= r l2@186@01) (= i length@4@01))
        (- $Perm.Write (pTaken@200@01 r i))
        $Perm.No)
      (- $Perm.Write (pTaken@226@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        (- $Perm.Write (pTaken@193@01 r i))
        $Perm.No)
      (pTaken@226@01 r i))
    $Perm.No)
  
  :qid |quant-u-169|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (Set_in (inv@224@01 r i) s@195@01)
      (img@225@01 r i)
      (and
        (=
          r
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) (inv@224@01 r i)))
        (= i (- length@4@01 1))))
    (= (- $Perm.Write (pTaken@226@01 r i)) $Perm.No))
  
  :qid |quant-u-170|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@228@01 $PSF<list>)
(declare-const s@229@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@229@01 $Snap)) (!
  (and
    (=>
      (Set_in s@229@01 ($PSF.domain_list (as sm@228@01  $PSF<list>)))
      (and
        (Set_in (inv@224@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01))) s@195@01)
        (img@225@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01)))))
    (=>
      (and
        (Set_in (inv@224@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01))) s@195@01)
        (img@225@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01))))
      (Set_in s@229@01 ($PSF.domain_list (as sm@228@01  $PSF<list>)))))
  :pattern ((Set_in s@229@01 ($PSF.domain_list (as sm@228@01  $PSF<list>))))
  :qid |qp.psmDomDef45|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@229@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@224@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01))) s@195@01)
        (img@225@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01))))
      (ite
        (and
          (img@150@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01)))
          (Set_in (inv@149@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01))) s@130@01))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@193@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01)))))
        false))
    (and
      (not (= s@229@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@228@01  $PSF<list>) s@229@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) s@229@01))))
  :pattern (($PSF.lookup_list (as sm@228@01  $PSF<list>) s@229@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) s@229@01))
  :qid |qp.psmValDef43|)))
(assert (forall ((s@229@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@224@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01))) s@195@01)
        (img@225@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01))))
      (ite
        (and
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) l2@186@01)
          (= ($SortWrappers.$SnapToInt ($Snap.second s@229@01)) length@4@01))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@200@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@229@01)) ($SortWrappers.$SnapToInt ($Snap.second s@229@01)))))
        false))
    (and
      (not (= s@229@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@228@01  $PSF<list>) s@229@01)
        ($PSF.lookup_list (as sm@194@01  $PSF<list>) s@229@01))))
  :pattern (($PSF.lookup_list (as sm@228@01  $PSF<list>) s@229@01))
  :pattern (($PSF.lookup_list (as sm@194@01  $PSF<list>) s@229@01))
  :qid |qp.psmValDef44|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@230@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 12
; [then-branch: 66 | r@230@01 in s@195@01 | live]
; [else-branch: 66 | !(r@230@01 in s@195@01) | live]
(push) ; 13
; [then-branch: 66 | r@230@01 in s@195@01]
(assert (Set_in r@230@01 s@195@01))
; [eval] allSet(r.next, length - 1, v)
(push) ; 14
(assert (not (ite
  (and (img@145@01 r@230@01) (Set_in (inv@144@01 r@230@01) s@130@01))
  (< $Perm.No (- $Perm.Write (pTaken@190@01 r@230@01)))
  false)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  l2@186@01
  ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))))
(check-sat)
; unknown
(pop) ; 15
; 0,01s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@231@01 ((r $Ref) (i Int) (r@230@01 $Ref)) $Perm
  (ite
    (and
      (=
        r
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        (- $Perm.Write (pTaken@193@01 r i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@232@01 ((r $Ref) (i Int) (r@230@01 $Ref)) $Perm
  (ite
    (and
      (=
        r
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (img@134@01 r i)
          (and
            (Set_in (inv@133@01 r i) lists@3@01)
            (not (Set_in (inv@133@01 r i) s@130@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@231@01 r i r@230@01)))
    $Perm.No))
(define-fun pTaken@233@01 ((r $Ref) (i Int) (r@230@01 $Ref)) $Perm
  (ite
    (and
      (=
        r
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (and (= r l2@186@01) (= i length@4@01)) $Perm.Write $Perm.No)
      (-
        (- $Perm.Write (pTaken@231@01 r i r@230@01))
        (pTaken@232@01 r i r@230@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
        (- $Perm.Write (pTaken@193@01 r i))
        $Perm.No)
      (pTaken@231@01 r i r@230@01))
    $Perm.No)
  
  :qid |quant-u-172|))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@231@01 r i r@230@01) $Perm.No)
  
  :qid |quant-u-173|))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (=
        r
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@231@01 r i r@230@01)) $Perm.No))
  
  :qid |quant-u-174|))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@234@01 $PSF<list>)
(declare-const s@235@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01)
      l2@186@01)
    (= (- length@4@01 1) length@4@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (ite
    (and
      (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
        length@4@01
        1))
      (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
        length@4@01
        1)) s@130@01))
    (<
      $Perm.No
      (-
        $Perm.Write
        (pTaken@193@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
          length@4@01
          1))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
      length@4@01
      1))
    (and
      (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
        length@4@01
        1)) lists@3@01)
      (not
        (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
          length@4@01
          1)) s@130@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 14
; Joined path conditions
(assert (and
  (=>
    (and
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01)
        l2@186@01)
      (= (- length@4@01 1) length@4@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (ite
      (and
        (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
          length@4@01
          1))
        (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
          length@4@01
          1)) s@130@01))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@193@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
            length@4@01
            1))))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (and
      (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
        length@4@01
        1))
      (and
        (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
          length@4@01
          1)) lists@3@01)
        (not
          (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
            length@4@01
            1)) s@130@01))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 66 | !(r@230@01 in s@195@01)]
(assert (not (Set_in r@230@01 s@195@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (Set_in r@230@01 s@195@01)
  (and
    (Set_in r@230@01 s@195@01)
    (=>
      (and
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01)
          l2@186@01)
        (= (- length@4@01 1) length@4@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (ite
        (and
          (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
            length@4@01
            1))
          (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
            length@4@01
            1)) s@130@01))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@193@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
              length@4@01
              1))))
        false)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (and
        (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
          length@4@01
          1))
        (and
          (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
            length@4@01
            1)) lists@3@01)
          (not
            (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
              length@4@01
              1)) s@130@01))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@230@01 s@195@01)) (Set_in r@230@01 s@195@01)))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@230@01 $Ref)) (!
  (and
    (=>
      (Set_in r@230@01 s@195@01)
      (and
        (Set_in r@230@01 s@195@01)
        (=>
          (and
            (=
              ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01)
              l2@186@01)
            (= (- length@4@01 1) length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list (as sm@194@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (ite
            (and
              (img@150@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
                length@4@01
                1))
              (Set_in (inv@149@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
                length@4@01
                1)) s@130@01))
            (<
              $Perm.No
              (-
                $Perm.Write
                (pTaken@193@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
                  length@4@01
                  1))))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (img@134@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
              length@4@01
              1))
            (and
              (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
                length@4@01
                1)) lists@3@01)
              (not
                (Set_in (inv@133@01 ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
                  length@4@01
                  1)) s@130@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@131@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@230@01 s@195@01)) (Set_in r@230@01 s@195@01)))
  :pattern ((Set_in r@230@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75-aux|)))
(assert (forall ((r@230@01 $Ref)) (!
  (=>
    (Set_in r@230@01 s@195@01)
    (allSet%precondition ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@230@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75_precondition|)))
(push) ; 11
(assert (not (forall ((r@230@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in r@230@01 s@195@01)
        (allSet%precondition ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
          length@4@01
          1) v@5@01))
      (Set_in r@230@01 s@195@01))
    (allSet ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@230@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@230@01 $Ref)) (!
  (=>
    (Set_in r@230@01 s@195@01)
    (allSet ($PSF.lookup_list (as sm@234@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@230@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@230@01 s@195@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/list_false.vpr@57@19@57@75|)))
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 57 | !(|s@130@01| > 0)]
(assert (not (> (Set_card s@130@01) 0)))
(pop) ; 9
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (and
    (=
      r@122@01
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01))
    (=
      (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
      (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))))
  
  :qid |quant-u-175|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (and
    (= r@122@01 r@132@01)
    (=
      (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))
      (and
        (img@134@01 r i)
        (and
          (Set_in (inv@133@01 r i) lists@3@01)
          (not (Set_in (inv@133@01 r i) s@130@01))))))
  
  :qid |quant-u-176|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (> (Set_card s@130@01) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> (Set_card s@130@01) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 67 | !(|s@130@01| > 0) | live]
; [else-branch: 67 | |s@130@01| > 0 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 67 | !(|s@130@01| > 0)]
(assert (not (> (Set_card s@130@01) 0)))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (and
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01)
      r@122@01)
    (=
      (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))
      (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))))
  
  :qid |quant-u-177|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (and
    (=
      r@132@01
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r@148@01))
    (=
      (and
        (img@134@01 r i)
        (and
          (Set_in (inv@133@01 r i) lists@3@01)
          (not (Set_in (inv@133@01 r i) s@130@01))))
      (and (img@150@01 r i) (Set_in (inv@149@01 r i) s@130@01))))
  
  :qid |quant-u-178|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (and
    (= r@132@01 r@122@01)
    (=
      (and
        (img@134@01 r i)
        (and
          (Set_in (inv@133@01 r i) lists@3@01)
          (not (Set_in (inv@133@01 r i) s@130@01))))
      (and (img@124@01 r i) (Set_in (inv@123@01 r i) sNext@21@01))))
  
  :qid |quant-u-179|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@236@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01))
    (=
      ($FVF.lookup_next (as sm@236@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@236@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@131@01)))))) r))
  :qid |qp.fvfValDef49|)))
(declare-const pm@237@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@237@01  $FPM) r)
    (ite
      (and (img@145@01 r) (Set_in (inv@144@01 r) s@130@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@237@01  $FPM) r))
  :qid |qp.resPrmSumDef50|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@237@01  $FPM) r) $Perm.Write)
  :pattern ((inv@144@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@238@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01))
    (=
      ($FVF.lookup_val (as sm@238@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@238@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@131@01)))) r))
  :qid |qp.fvfValDef51|)))
(declare-const pm@239@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@239@01  $FPM) r)
    (ite
      (and (img@141@01 r) (Set_in (inv@140@01 r) s@130@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@239@01  $FPM) r))
  :qid |qp.resPrmSumDef52|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@239@01  $FPM) r) $Perm.Write)
  :pattern ((inv@140@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
