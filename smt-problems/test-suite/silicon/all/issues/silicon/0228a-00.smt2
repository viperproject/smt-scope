(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:03
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0228a.vpr
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
(declare-sort Set<Ptr> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Ptr 0)
(declare-sort $FVF<pval> 0)
(declare-sort $FVF<Int__v> 0)
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
(declare-fun $SortWrappers.Set<Ptr>To$Snap (Set<Ptr>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Ptr> ($Snap) Set<Ptr>)
(assert (forall ((x Set<Ptr>)) (!
    (= x ($SortWrappers.$SnapToSet<Ptr>($SortWrappers.Set<Ptr>To$Snap x)))
    :pattern (($SortWrappers.Set<Ptr>To$Snap x))
    :qid |$Snap.$SnapToSet<Ptr>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Ptr>To$Snap($SortWrappers.$SnapToSet<Ptr> x)))
    :pattern (($SortWrappers.$SnapToSet<Ptr> x))
    :qid |$Snap.Set<Ptr>To$SnapToSet<Ptr>|
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
(declare-fun $SortWrappers.PtrTo$Snap (Ptr) $Snap)
(declare-fun $SortWrappers.$SnapToPtr ($Snap) Ptr)
(assert (forall ((x Ptr)) (!
    (= x ($SortWrappers.$SnapToPtr($SortWrappers.PtrTo$Snap x)))
    :pattern (($SortWrappers.PtrTo$Snap x))
    :qid |$Snap.$SnapToPtrTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PtrTo$Snap($SortWrappers.$SnapToPtr x)))
    :pattern (($SortWrappers.$SnapToPtr x))
    :qid |$Snap.PtrTo$SnapToPtr|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<pval>To$Snap ($FVF<pval>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<pval> ($Snap) $FVF<pval>)
(assert (forall ((x $FVF<pval>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<pval>($SortWrappers.$FVF<pval>To$Snap x)))
    :pattern (($SortWrappers.$FVF<pval>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<pval>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<pval>To$Snap($SortWrappers.$SnapTo$FVF<pval> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<pval> x))
    :qid |$Snap.$FVF<pval>To$SnapTo$FVF<pval>|
    )))
(declare-fun $SortWrappers.$FVF<Int__v>To$Snap ($FVF<Int__v>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Int__v> ($Snap) $FVF<Int__v>)
(assert (forall ((x $FVF<Int__v>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Int__v>($SortWrappers.$FVF<Int__v>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Int__v>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Int__v>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Int__v>To$Snap($SortWrappers.$SnapTo$FVF<Int__v> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Int__v> x))
    :qid |$Snap.$FVF<Int__v>To$SnapTo$FVF<Int__v>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Ptr>) Int)
(declare-const Set_empty Set<Ptr>)
(declare-fun Set_in (Ptr Set<Ptr>) Bool)
(declare-fun Set_singleton (Ptr) Set<Ptr>)
(declare-fun Set_unionone (Set<Ptr> Ptr) Set<Ptr>)
(declare-fun Set_union (Set<Ptr> Set<Ptr>) Set<Ptr>)
(declare-fun Set_intersection (Set<Ptr> Set<Ptr>) Set<Ptr>)
(declare-fun Set_difference (Set<Ptr> Set<Ptr>) Set<Ptr>)
(declare-fun Set_subset (Set<Ptr> Set<Ptr>) Bool)
(declare-fun Set_equal (Set<Ptr> Set<Ptr>) Bool)
(declare-fun Set_skolem_diff (Set<Ptr> Set<Ptr>) Ptr)
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
(declare-fun loc<Ref> (Ptr Int) $Ref)
; /field_value_functions_declarations.smt2 [pval: Ref]
(declare-fun $FVF.domain_pval ($FVF<pval>) Set<$Ref>)
(declare-fun $FVF.lookup_pval ($FVF<pval> $Ref) $Ref)
(declare-fun $FVF.after_pval ($FVF<pval> $FVF<pval>) Bool)
(declare-fun $FVF.loc_pval ($Ref $Ref) Bool)
(declare-fun $FVF.perm_pval ($FPM $Ref) $Perm)
(declare-const $fvfTOP_pval $FVF<pval>)
; /field_value_functions_declarations.smt2 [Int__v: Int]
(declare-fun $FVF.domain_Int__v ($FVF<Int__v>) Set<$Ref>)
(declare-fun $FVF.lookup_Int__v ($FVF<Int__v> $Ref) Int)
(declare-fun $FVF.after_Int__v ($FVF<Int__v> $FVF<Int__v>) Bool)
(declare-fun $FVF.loc_Int__v (Int $Ref) Bool)
(declare-fun $FVF.perm_Int__v ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Int__v $FVF<Int__v>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid__Array%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<Ptr>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Ptr)) (!
  (not (Set_in o (as Set_empty  Set<Ptr>)))
  :pattern ((Set_in o (as Set_empty  Set<Ptr>)))
  )))
(assert (forall ((s Set<Ptr>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Ptr>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Ptr))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Ptr)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Ptr) (o Ptr)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Ptr)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Ptr>) (x Ptr) (o Ptr)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Ptr>) (x Ptr)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Ptr>) (x Ptr) (y Ptr)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Ptr>) (x Ptr)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Ptr>) (x Ptr)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>) (o Ptr)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>) (y Ptr)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>) (y Ptr)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>) (o Ptr)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>) (o Ptr)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>) (y Ptr)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
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
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
  (=
    (Set_subset a b)
    (forall ((o Ptr)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
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
(assert (forall ((a Set<Ptr>) (b Set<Ptr>)) (!
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
(assert (forall ((a Ptr) (i Int) (j Int)) (!
  (=>
    (and (>= i 0) (and (>= j 0) (not (= i j))))
    (not (= (loc<Ref> a i) (loc<Ref> a j))))
  :pattern ((loc<Ref> a i) (loc<Ref> a j))
  :qid |prog.loc_inject|)))
; /field_value_functions_axioms.smt2 [pval: Ref]
(assert (forall ((vs $FVF<pval>) (ws $FVF<pval>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_pval vs) ($FVF.domain_pval ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_pval vs))
            (= ($FVF.lookup_pval vs x) ($FVF.lookup_pval ws x)))
          :pattern (($FVF.lookup_pval vs x) ($FVF.lookup_pval ws x))
          :qid |qp.$FVF<pval>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<pval>To$Snap vs)
              ($SortWrappers.$FVF<pval>To$Snap ws)
              )
    :qid |qp.$FVF<pval>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_pval pm r))
    :pattern (($FVF.perm_pval pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_pval f r) true)
    :pattern (($FVF.loc_pval f r)))))
; /field_value_functions_axioms.smt2 [Int__v: Int]
(assert (forall ((vs $FVF<Int__v>) (ws $FVF<Int__v>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Int__v vs) ($FVF.domain_Int__v ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Int__v vs))
            (= ($FVF.lookup_Int__v vs x) ($FVF.lookup_Int__v ws x)))
          :pattern (($FVF.lookup_Int__v vs x) ($FVF.lookup_Int__v ws x))
          :qid |qp.$FVF<Int__v>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Int__v>To$Snap vs)
              ($SortWrappers.$FVF<Int__v>To$Snap ws)
              )
    :qid |qp.$FVF<Int__v>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Int__v pm r))
    :pattern (($FVF.perm_Int__v pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_Int__v f r) true)
    :pattern (($FVF.loc_Int__v f r)))))
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
; ---------- ok ----------
(declare-const self$1@0@01 $Ref)
(declare-const len@1@01 Int)
(declare-const rd$1@2@01 $Perm)
(declare-const res$1@3@01 $Ref)
(declare-const self$1@4@01 $Ref)
(declare-const len@5@01 Int)
(declare-const rd$1@6@01 $Perm)
(declare-const res$1@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] none < rd$1
(assert (< $Perm.No rd$1@6@01))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] rd$1 < write
(assert (< rd$1@6@01 $Perm.Write))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] len > 0
(assert (> len@5@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
; [eval] rd$1 / 2
(push) ; 2
(assert (not (or
  (= (/ rd$1@6@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@6@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (/ rd$1@6@01 (to_real 2))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(declare-const j@9@01 Int)
(push) ; 2
; [eval] 0 <= j && j < len
; [eval] 0 <= j
(push) ; 3
; [then-branch: 0 | !(0 <= j@9@01) | live]
; [else-branch: 0 | 0 <= j@9@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= j@9@01)]
(assert (not (<= 0 j@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= j@9@01]
(assert (<= 0 j@9@01))
; [eval] j < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@9@01) (not (<= 0 j@9@01))))
(assert (and (<= 0 j@9@01) (< j@9@01 len@5@01)))
; [eval] loc((unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__ptr), j)
; [eval] (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__ptr)
; [eval] rd$1 / 2
(push) ; 3
(assert (not (< $Perm.No (/ rd$1@6@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [eval] rd$1 / 2
(push) ; 4
(assert (not (or
  (= (/ rd$1@6@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@6@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@6@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) self$1@4@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (<= (/ rd$1@6@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@6@01 (to_real 2))) (not (= self$1@4@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@6@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) self$1@4@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  (<= (/ rd$1@6@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@6@01 (to_real 2))) (not (= self$1@4@01 $Ref.null)))))
(pop) ; 2
(declare-fun inv@10@01 ($Ref) Int)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@9@01 Int)) (!
  (=>
    (and (<= 0 j@9@01) (< j@9@01 len@5@01))
    (and
      (or (<= 0 j@9@01) (not (<= 0 j@9@01)))
      (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) self$1@4@01)
      (=
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
      (<= (/ rd$1@6@01 (to_real 2)) $Perm.Write)
      (=> (< $Perm.No (/ rd$1@6@01 (to_real 2))) (not (= self$1@4@01 $Ref.null)))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@9@01))
  :qid |pval-aux|)))
; Check receiver injectivity
(set-option :timeout 0)
(push) ; 2
(assert (not (forall ((j1@9@01 Int) (j2@9@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@9@01) (< j1@9@01 len@5@01))
      (and (<= 0 j2@9@01) (< j2@9@01 len@5@01))
      (=
        (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j1@9@01)
        (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j2@9@01)))
    (= j1@9@01 j2@9@01))
  
  :qid |pval-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@9@01 Int)) (!
  (=>
    (and (<= 0 j@9@01) (< j@9@01 len@5@01))
    (and
      (=
        (inv@10@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@9@01))
        j@9@01)
      (img@11@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@9@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@9@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) len@5@01)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) (inv@10@01 r))
      r))
  :pattern ((inv@10@01 r))
  :qid |pval-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@9@01 Int)) (!
  (=>
    (and (<= 0 j@9@01) (< j@9@01 len@5@01))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@9@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@9@01))
  :qid |pval-permImpliesNonNull|)))
(declare-const j@12@01 Int)
(push) ; 2
; [eval] 0 <= j && j < len
; [eval] 0 <= j
(push) ; 3
; [then-branch: 1 | !(0 <= j@12@01) | live]
; [else-branch: 1 | 0 <= j@12@01 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= j@12@01)]
(assert (not (<= 0 j@12@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= j@12@01]
(assert (<= 0 j@12@01))
; [eval] j < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@12@01) (not (<= 0 j@12@01))))
(assert (and (<= 0 j@12@01) (< j@12@01 len@5@01)))
; [eval] loc((unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__ptr), j)
; [eval] (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__ptr)
; [eval] rd$1 / 2
(push) ; 3
(assert (not (< $Perm.No (/ rd$1@6@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [eval] rd$1 / 2
(push) ; 4
(assert (not (or
  (= (/ rd$1@6@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@6@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@6@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) self$1@4@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (<= (/ rd$1@6@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@6@01 (to_real 2))) (not (= self$1@4@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@6@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) self$1@4@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  (<= (/ rd$1@6@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@6@01 (to_real 2))) (not (= self$1@4@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@11@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@12@01))
  (and
    (<=
      0
      (inv@10@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@12@01)))
    (<
      (inv@10@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@12@01))
      len@5@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@13@01 ($Ref) Int)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@12@01 Int)) (!
  (=>
    (and (<= 0 j@12@01) (< j@12@01 len@5@01))
    (and
      (or (<= 0 j@12@01) (not (<= 0 j@12@01)))
      (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) self$1@4@01)
      (=
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
      (<= (/ rd$1@6@01 (to_real 2)) $Perm.Write)
      (=> (< $Perm.No (/ rd$1@6@01 (to_real 2))) (not (= self$1@4@01 $Ref.null)))))
  :pattern (($FVF.lookup_pval ($SortWrappers.$SnapTo$FVF<pval> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j@12@01)))
  :qid |Int__v-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@12@01 Int) (j2@12@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@12@01) (< j1@12@01 len@5@01))
      (and (<= 0 j2@12@01) (< j2@12@01 len@5@01))
      (=
        ($FVF.lookup_pval ($SortWrappers.$SnapTo$FVF<pval> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j1@12@01))
        ($FVF.lookup_pval ($SortWrappers.$SnapTo$FVF<pval> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) j2@12@01))))
    (= j1@12@01 j2@12@01))
  
  :qid |Int__v-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- not_ok ----------
(declare-const self$1@15@01 $Ref)
(declare-const rd$1@16@01 $Perm)
(declare-const res$1@17@01 $Ref)
(declare-const self$1@18@01 $Ref)
(declare-const rd$1@19@01 $Perm)
(declare-const res$1@20@01 $Ref)
(push) ; 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
; [eval] none < rd$1
(assert (< $Perm.No rd$1@19@01))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.first ($Snap.second $t@21@01)) $Snap.unit))
; [eval] rd$1 < write
(assert (< rd$1@19@01 $Perm.Write))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
; [eval] rd$1 / 2
(push) ; 2
(assert (not (or
  (= (/ rd$1@19@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@19@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (/ rd$1@19@01 (to_real 2))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
(declare-const j@22@01 Int)
(push) ; 2
; [eval] 0 <= j && j < (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__len)
; [eval] 0 <= j
(push) ; 3
; [then-branch: 2 | !(0 <= j@22@01) | live]
; [else-branch: 2 | 0 <= j@22@01 | live]
(push) ; 4
; [then-branch: 2 | !(0 <= j@22@01)]
(assert (not (<= 0 j@22@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | 0 <= j@22@01]
(assert (<= 0 j@22@01))
; [eval] j < (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__len)
; [eval] (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__len)
; [eval] rd$1 / 2
(push) ; 5
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [eval] rd$1 / 2
(push) ; 6
(assert (not (or
  (= (/ rd$1@19@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@19@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
(assert (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
; Joined path conditions
(assert (and
  (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
  (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@22@01)
  (and
    (<= 0 j@22@01)
    (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
    (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
    (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null))))))
(assert (or (<= 0 j@22@01) (not (<= 0 j@22@01))))
(assert (and
  (<= 0 j@22@01)
  (<
    j@22@01
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))))
; [eval] loc((unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__ptr), j)
; [eval] (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__ptr)
; [eval] rd$1 / 2
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [eval] rd$1 / 2
(push) ; 4
(assert (not (or
  (= (/ rd$1@19@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@19@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
(assert (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
  (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null)))))
(pop) ; 2
(declare-fun inv@23@01 ($Ref) Int)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@22@01 Int)) (!
  (=>
    (and
      (<= 0 j@22@01)
      (<
        j@22@01
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
    (and
      (=>
        (<= 0 j@22@01)
        (and
          (<= 0 j@22@01)
          (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
          (=
            ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
            ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
          (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
          (=>
            (< $Perm.No (/ rd$1@19@01 (to_real 2)))
            (not (= self$1@18@01 $Ref.null)))))
      (or (<= 0 j@22@01) (not (<= 0 j@22@01)))
      (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
      (=
        ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
      (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
      (=>
        (< $Perm.No (/ rd$1@19@01 (to_real 2)))
        (not (= self$1@18@01 $Ref.null)))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@22@01))
  :qid |pval-aux|)))
; Check receiver injectivity
(set-option :timeout 0)
(push) ; 2
(assert (not (forall ((j1@22@01 Int) (j2@22@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 j1@22@01)
        (<
          j1@22@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
      (and
        (<= 0 j2@22@01)
        (<
          j2@22@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
      (=
        (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j1@22@01)
        (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j2@22@01)))
    (= j1@22@01 j2@22@01))
  
  :qid |pval-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@22@01 Int)) (!
  (=>
    (and
      (<= 0 j@22@01)
      (<
        j@22@01
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
    (and
      (=
        (inv@23@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@22@01))
        j@22@01)
      (img@24@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@22@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@22@01))
  :qid |quant-u-4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (and
        (<= 0 (inv@23@01 r))
        (<
          (inv@23@01 r)
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))))
    (=
      (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) (inv@23@01 r))
      r))
  :pattern ((inv@23@01 r))
  :qid |pval-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@22@01 Int)) (!
  (=>
    (and
      (<= 0 j@22@01)
      (<
        j@22@01
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@22@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@22@01))
  :qid |pval-permImpliesNonNull|)))
(declare-const j@25@01 Int)
(push) ; 2
; [eval] 0 <= j && j < (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__len)
; [eval] 0 <= j
(push) ; 3
; [then-branch: 3 | !(0 <= j@25@01) | live]
; [else-branch: 3 | 0 <= j@25@01 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= j@25@01)]
(assert (not (<= 0 j@25@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= j@25@01]
(assert (<= 0 j@25@01))
; [eval] j < (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__len)
; [eval] (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__len)
; [eval] rd$1 / 2
(push) ; 5
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [eval] rd$1 / 2
(push) ; 6
(assert (not (or
  (= (/ rd$1@19@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@19@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
(assert (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
; Joined path conditions
(assert (and
  (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
  (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@25@01)
  (and
    (<= 0 j@25@01)
    (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
    (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
    (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null))))))
(assert (or (<= 0 j@25@01) (not (<= 0 j@25@01))))
(assert (and
  (<= 0 j@25@01)
  (<
    j@25@01
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))))
; [eval] loc((unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__ptr), j)
; [eval] (unfolding acc(valid__Array(self$1), rd$1 / 2) in self$1.Array__ptr)
; [eval] rd$1 / 2
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [eval] rd$1 / 2
(push) ; 4
(assert (not (or
  (= (/ rd$1@19@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@19@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
(assert (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@19@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
  (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@19@01 (to_real 2))) (not (= self$1@18@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@24@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@25@01))
  (and
    (<=
      0
      (inv@23@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@25@01)))
    (<
      (inv@23@01 (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@25@01))
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@26@01 ($Ref) Int)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@25@01 Int)) (!
  (=>
    (and
      (<= 0 j@25@01)
      (<
        j@25@01
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
    (and
      (=>
        (<= 0 j@25@01)
        (and
          (<= 0 j@25@01)
          (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
          (=
            ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
            ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
          (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
          (=>
            (< $Perm.No (/ rd$1@19@01 (to_real 2)))
            (not (= self$1@18@01 $Ref.null)))))
      (or (<= 0 j@25@01) (not (<= 0 j@25@01)))
      (valid__Array%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@01))) self$1@18@01)
      (=
        ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01))))))
      (<= (/ rd$1@19@01 (to_real 2)) $Perm.Write)
      (=>
        (< $Perm.No (/ rd$1@19@01 (to_real 2)))
        (not (= self$1@18@01 $Ref.null)))))
  :pattern (($FVF.lookup_pval ($SortWrappers.$SnapTo$FVF<pval> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))) (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j@25@01)))
  :qid |Int__v-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@25@01 Int) (j2@25@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 j1@25@01)
        (<
          j1@25@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
      (and
        (<= 0 j2@25@01)
        (<
          j2@25@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@01)))))))
      (=
        ($FVF.lookup_pval ($SortWrappers.$SnapTo$FVF<pval> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))) (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j1@25@01))
        ($FVF.lookup_pval ($SortWrappers.$SnapTo$FVF<pval> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))) (loc<Ref> ($SortWrappers.$SnapToPtr ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@01))))) j2@25@01))))
    (= j1@25@01 j2@25@01))
  
  :qid |Int__v-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
