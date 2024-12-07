(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:53
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0483b.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Array<Ref> 0)
(declare-sort $FVF<val> 0)
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
(declare-fun $SortWrappers.Set<Bool>To$Snap (Set<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Bool> ($Snap) Set<Bool>)
(assert (forall ((x Set<Bool>)) (!
    (= x ($SortWrappers.$SnapToSet<Bool>($SortWrappers.Set<Bool>To$Snap x)))
    :pattern (($SortWrappers.Set<Bool>To$Snap x))
    :qid |$Snap.$SnapToSet<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Bool>To$Snap($SortWrappers.$SnapToSet<Bool> x)))
    :pattern (($SortWrappers.$SnapToSet<Bool> x))
    :qid |$Snap.Set<Bool>To$SnapToSet<Bool>|
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
(declare-fun $SortWrappers.Array<Ref>To$Snap (Array<Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToArray<Ref> ($Snap) Array<Ref>)
(assert (forall ((x Array<Ref>)) (!
    (= x ($SortWrappers.$SnapToArray<Ref>($SortWrappers.Array<Ref>To$Snap x)))
    :pattern (($SortWrappers.Array<Ref>To$Snap x))
    :qid |$Snap.$SnapToArray<Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Array<Ref>To$Snap($SortWrappers.$SnapToArray<Ref> x)))
    :pattern (($SortWrappers.$SnapToArray<Ref> x))
    :qid |$Snap.Array<Ref>To$SnapToArray<Ref>|
    )))
; Declaring additional sort wrappers
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
; ////////// Symbols
(declare-fun Set_card (Set<Bool>) Int)
(declare-const Set_empty Set<Bool>)
(declare-fun Set_in (Bool Set<Bool>) Bool)
(declare-fun Set_singleton (Bool) Set<Bool>)
(declare-fun Set_unionone (Set<Bool> Bool) Set<Bool>)
(declare-fun Set_union (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_intersection (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_difference (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_subset (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_equal (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_skolem_diff (Set<Bool> Set<Bool>) Bool)
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
(declare-fun loc<Ref> (Array<Ref> Int) $Ref)
; /field_value_functions_declarations.smt2 [val: Bool]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Bool)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Bool $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun Property ($Snap Array<Ref> Array<Ref>) Bool)
(declare-fun Property%limited ($Snap Array<Ref> Array<Ref>) Bool)
(declare-fun Property%stateless (Array<Ref> Array<Ref>) Bool)
(declare-fun Property%precondition ($Snap Array<Ref> Array<Ref>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<Bool>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Bool)) (!
  (not (Set_in o (as Set_empty  Set<Bool>)))
  :pattern ((Set_in o (as Set_empty  Set<Bool>)))
  )))
(assert (forall ((s Set<Bool>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Bool>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Bool))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Bool)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Bool) (o Bool)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Bool)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Bool>) (x Bool) (o Bool)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Bool>) (x Bool) (y Bool)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (=
    (Set_subset a b)
    (forall ((o Bool)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Array<Ref>) (i Int) (j Int)) (!
  (=>
    (and (>= i 0) (and (>= j 0) (not (= i j))))
    (not (= (loc<Ref> a i) (loc<Ref> a j))))
  :pattern ((loc<Ref> a i) (loc<Ref> a j))
  :qid |prog.loc_inject|)))
; /field_value_functions_axioms.smt2 [val: Bool]
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
(assert (forall ((r $Ref) (f Bool)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@4@00 ($Snap Array<Ref> Array<Ref> $Ref) Int)
(declare-fun img@5@00 ($Snap Array<Ref> Array<Ref> $Ref) Bool)
(declare-fun inv@7@00 ($Snap Array<Ref> Array<Ref> $Ref) Int)
(declare-fun img@8@00 ($Snap Array<Ref> Array<Ref> $Ref) Bool)
(declare-fun sm@10@00 ($Snap Array<Ref> Array<Ref>) $FVF<val>)
(assert (forall ((s@$ $Snap) (a@0@00 Array<Ref>) (b@1@00 Array<Ref>)) (!
  (= (Property%limited s@$ a@0@00 b@1@00) (Property s@$ a@0@00 b@1@00))
  :pattern ((Property s@$ a@0@00 b@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array<Ref>) (b@1@00 Array<Ref>)) (!
  (Property%stateless a@0@00 b@1@00)
  :pattern ((Property%limited s@$ a@0@00 b@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array<Ref>) (b@1@00 Array<Ref>)) (!
  (and
    (forall ((i$0@3@00 Int)) (!
      (=>
        (<= 0 i$0@3@00)
        (and
          (= (inv@4@00 s@$ a@0@00 b@1@00 (loc<Ref> a@0@00 i$0@3@00)) i$0@3@00)
          (img@5@00 s@$ a@0@00 b@1@00 (loc<Ref> a@0@00 i$0@3@00))))
      :pattern ((loc<Ref> a@0@00 i$0@3@00))
      :qid |quant-u-3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@5@00 s@$ a@0@00 b@1@00 r)
          (<= 0 (inv@4@00 s@$ a@0@00 b@1@00 r)))
        (= (loc<Ref> a@0@00 (inv@4@00 s@$ a@0@00 b@1@00 r)) r))
      :pattern ((inv@4@00 s@$ a@0@00 b@1@00 r))
      :qid |val-fctOfInv|))
    (forall ((i$1@6@00 Int)) (!
      (=>
        (<= 0 i$1@6@00)
        (and
          (= (inv@7@00 s@$ a@0@00 b@1@00 (loc<Ref> b@1@00 i$1@6@00)) i$1@6@00)
          (img@8@00 s@$ a@0@00 b@1@00 (loc<Ref> b@1@00 i$1@6@00))))
      :pattern ((loc<Ref> b@1@00 i$1@6@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@8@00 s@$ a@0@00 b@1@00 r)
          (<= 0 (inv@7@00 s@$ a@0@00 b@1@00 r)))
        (= (loc<Ref> b@1@00 (inv@7@00 s@$ a@0@00 b@1@00 r)) r))
      :pattern ((inv@7@00 s@$ a@0@00 b@1@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@5@00 s@$ a@0@00 b@1@00 r)
          (<= 0 (inv@4@00 s@$ a@0@00 b@1@00 r)))
        (=
          ($FVF.lookup_val (sm@10@00 s@$ a@0@00 b@1@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_val (sm@10@00 s@$ a@0@00 b@1@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@8@00 s@$ a@0@00 b@1@00 r)
          (<= 0 (inv@7@00 s@$ a@0@00 b@1@00 r)))
        (=
          ($FVF.lookup_val (sm@10@00 s@$ a@0@00 b@1@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_val (sm@10@00 s@$ a@0@00 b@1@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef1|))
    (=>
      (Property%precondition s@$ a@0@00 b@1@00)
      (=
        (Property s@$ a@0@00 b@1@00)
        (forall ((i Int)) (!
          (=>
            (<= 0 i)
            ($FVF.lookup_val (sm@10@00 s@$ a@0@00 b@1@00) (loc<Ref> b@1@00 i)))
          :pattern ((loc<Ref> b@1@00 i))
          )))))
  :pattern ((Property s@$ a@0@00 b@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array<Ref>) (b@1@00 Array<Ref>)) (!
  true
  :pattern ((Property s@$ a@0@00 b@1@00))
  :qid |quant-u-8|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Test ----------
(declare-const a@0@01 Array<Ref>)
(declare-const b@1@01 Array<Ref>)
(declare-const a@2@01 Array<Ref>)
(declare-const b@3@01 Array<Ref>)
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
; var tmp1: Bool
(declare-const tmp1@4@01 Bool)
; [exec]
; var tmp2: Bool
(declare-const tmp2@5@01 Bool)
; [exec]
; inhale (forall i: Int ::
;     { (loc(a, i): Ref) }
;     0 <= i ==> acc((loc(a, i): Ref).val, 1 / 2))
(declare-const i@6@01 Int)
(push) ; 3
; [eval] 0 <= i
(assert (<= 0 i@6@01))
; [eval] (loc(a, i): Ref)
(pop) ; 3
(declare-const $t@7@01 $FVF<val>)
(declare-fun inv@8@01 ($Ref) Int)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@6@01 Int) (i2@6@01 Int)) (!
  (=>
    (and
      (<= 0 i1@6@01)
      (<= 0 i2@6@01)
      (= (loc<Ref> a@2@01 i1@6@01) (loc<Ref> a@2@01 i2@6@01)))
    (= i1@6@01 i2@6@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@6@01 Int)) (!
  (=>
    (<= 0 i@6@01)
    (and
      (= (inv@8@01 (loc<Ref> a@2@01 i@6@01)) i@6@01)
      (img@9@01 (loc<Ref> a@2@01 i@6@01))))
  :pattern ((loc<Ref> a@2@01 i@6@01))
  :qid |quant-u-10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (<= 0 (inv@8@01 r)))
    (= (loc<Ref> a@2@01 (inv@8@01 r)) r))
  :pattern ((inv@8@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@6@01 Int)) (!
  (=> (<= 0 i@6@01) (not (= (loc<Ref> a@2@01 i@6@01) $Ref.null)))
  :pattern ((loc<Ref> a@2@01 i@6@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i$0: Int ::
;     { (loc(b, i$0): Ref) }
;     0 <= i$0 ==> acc((loc(b, i$0): Ref).val, 1 / 2))
(declare-const i$0@10@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i$0
(assert (<= 0 i$0@10@01))
; [eval] (loc(b, i$0): Ref)
(pop) ; 3
(declare-const $t@11@01 $FVF<val>)
(declare-fun inv@12@01 ($Ref) Int)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i$01@10@01 Int) (i$02@10@01 Int)) (!
  (=>
    (and
      (<= 0 i$01@10@01)
      (<= 0 i$02@10@01)
      (= (loc<Ref> b@3@01 i$01@10@01) (loc<Ref> b@3@01 i$02@10@01)))
    (= i$01@10@01 i$02@10@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$0@10@01 Int)) (!
  (=>
    (<= 0 i$0@10@01)
    (and
      (= (inv@12@01 (loc<Ref> b@3@01 i$0@10@01)) i$0@10@01)
      (img@13@01 (loc<Ref> b@3@01 i$0@10@01))))
  :pattern ((loc<Ref> b@3@01 i$0@10@01))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (<= 0 (inv@12@01 r)))
    (= (loc<Ref> b@3@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i$0@10@01 Int)) (!
  (=> (<= 0 i$0@10@01) (not (= (loc<Ref> b@3@01 i$0@10@01) $Ref.null)))
  :pattern ((loc<Ref> b@3@01 i$0@10@01))
  :qid |val-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (loc<Ref> b@3@01 i$0@10@01) (loc<Ref> a@2@01 i@6@01))
    (=
      (and (img@13@01 r) (<= 0 (inv@12@01 r)))
      (and (img@9@01 r) (<= 0 (inv@8@01 r)))))
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp1 := Property(a, b)
; [eval] Property(a, b)
(set-option :timeout 0)
(push) ; 3
(declare-const i$0@14@01 Int)
(push) ; 4
; [eval] 0 <= i$0
(assert (<= 0 i$0@14@01))
; [eval] (loc(a, i$0): Ref)
(pop) ; 4
(declare-fun inv@15@01 ($Ref) Int)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i$01@14@01 Int) (i$02@14@01 Int)) (!
  (=>
    (and
      (<= 0 i$01@14@01)
      (<= 0 i$02@14@01)
      (= (loc<Ref> a@2@01 i$01@14@01) (loc<Ref> a@2@01 i$02@14@01)))
    (= i$01@14@01 i$02@14@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$0@14@01 Int)) (!
  (=>
    (<= 0 i$0@14@01)
    (and
      (= (inv@15@01 (loc<Ref> a@2@01 i$0@14@01)) i$0@14@01)
      (img@16@01 (loc<Ref> a@2@01 i$0@14@01))))
  :pattern ((loc<Ref> a@2@01 i$0@14@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (<= 0 (inv@15@01 r)))
    (= (loc<Ref> a@2@01 (inv@15@01 r)) r))
  :pattern ((inv@15@01 r))
  :qid |val-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i$0@14@01 Int)) (!
  (= (loc<Ref> a@2@01 i$0@14@01) (loc<Ref> b@3@01 i$0@14@01))
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (and
      (<= 0 (inv@15@01 r))
      (img@16@01 r)
      (= r (loc<Ref> a@2@01 (inv@15@01 r))))
    ($Perm.min
      (ite
        (and (img@9@01 r) (<= 0 (inv@8@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and
      (<= 0 (inv@15@01 r))
      (img@16@01 r)
      (= r (loc<Ref> a@2@01 (inv@15@01 r))))
    ($Perm.min
      (ite
        (and (img@13@01 r) (<= 0 (inv@12@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@17@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@9@01 r) (<= 0 (inv@8@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@17@01 r))
    $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@15@01 r))
      (img@16@01 r)
      (= r (loc<Ref> a@2@01 (inv@15@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))
      (and (<= 0 (inv@15@01 r)) (img@16@01 r)))
    (=>
      (and (<= 0 (inv@15@01 r)) (img@16@01 r))
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>))))
  :qid |qp.fvfDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@15@01 r)) (img@16@01 r))
      (and (img@9@01 r) (<= 0 (inv@8@01 r))))
    (= ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) ($FVF.lookup_val $t@7@01 r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@7@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@15@01 r)) (img@16@01 r))
      (and (img@13@01 r) (<= 0 (inv@12@01 r))))
    (= ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef1|)))
(declare-const i$1@20@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i$1
(assert (<= 0 i$1@20@01))
; [eval] (loc(b, i$1): Ref)
(pop) ; 4
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i$11@20@01 Int) (i$12@20@01 Int)) (!
  (=>
    (and
      (<= 0 i$11@20@01)
      (<= 0 i$12@20@01)
      (= (loc<Ref> b@3@01 i$11@20@01) (loc<Ref> b@3@01 i$12@20@01)))
    (= i$11@20@01 i$12@20@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$1@20@01 Int)) (!
  (=>
    (<= 0 i$1@20@01)
    (and
      (= (inv@21@01 (loc<Ref> b@3@01 i$1@20@01)) i$1@20@01)
      (img@22@01 (loc<Ref> b@3@01 i$1@20@01))))
  :pattern ((loc<Ref> b@3@01 i$1@20@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (<= 0 (inv@21@01 r)))
    (= (loc<Ref> b@3@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (and
      (<= 0 (inv@21@01 r))
      (img@22@01 r)
      (= r (loc<Ref> b@3@01 (inv@21@01 r))))
    ($Perm.min
      (ite
        (and (img@13@01 r) (<= 0 (inv@12@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@13@01 r) (<= 0 (inv@12@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@23@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@21@01 r))
      (img@22@01 r)
      (= r (loc<Ref> b@3@01 (inv@21@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@23@01 r)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@24@01  $FVF<val>)))
      (and (<= 0 (inv@21@01 r)) (img@22@01 r)))
    (=>
      (and (<= 0 (inv@21@01 r)) (img@22@01 r))
      (Set_in r ($FVF.domain_val (as sm@24@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@24@01  $FVF<val>))))
  :qid |qp.fvfDomDef4|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@21@01 r)) (img@22@01 r))
      (and (img@13@01 r) (<= 0 (inv@12@01 r))))
    (= ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef3|)))
(assert (Property%precondition ($Snap.combine
  ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>))
  ($SortWrappers.$FVF<val>To$Snap (as sm@24@01  $FVF<val>))) a@2@01 b@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i$0@14@01 Int)) (!
  (=>
    (<= 0 i$0@14@01)
    (and
      (= (inv@15@01 (loc<Ref> a@2@01 i$0@14@01)) i$0@14@01)
      (img@16@01 (loc<Ref> a@2@01 i$0@14@01))))
  :pattern ((loc<Ref> a@2@01 i$0@14@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (<= 0 (inv@15@01 r)))
    (= (loc<Ref> a@2@01 (inv@15@01 r)) r))
  :pattern ((inv@15@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))
      (and (<= 0 (inv@15@01 r)) (img@16@01 r)))
    (=>
      (and (<= 0 (inv@15@01 r)) (img@16@01 r))
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>))))
  :qid |qp.fvfDomDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@15@01 r)) (img@16@01 r))
      (and (img@9@01 r) (<= 0 (inv@8@01 r))))
    (= ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) ($FVF.lookup_val $t@7@01 r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@7@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@15@01 r)) (img@16@01 r))
      (and (img@13@01 r) (<= 0 (inv@12@01 r))))
    (= ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((i$1@20@01 Int)) (!
  (=>
    (<= 0 i$1@20@01)
    (and
      (= (inv@21@01 (loc<Ref> b@3@01 i$1@20@01)) i$1@20@01)
      (img@22@01 (loc<Ref> b@3@01 i$1@20@01))))
  :pattern ((loc<Ref> b@3@01 i$1@20@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (<= 0 (inv@21@01 r)))
    (= (loc<Ref> b@3@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@24@01  $FVF<val>)))
      (and (<= 0 (inv@21@01 r)) (img@22@01 r)))
    (=>
      (and (<= 0 (inv@21@01 r)) (img@22@01 r))
      (Set_in r ($FVF.domain_val (as sm@24@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@24@01  $FVF<val>))))
  :qid |qp.fvfDomDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@21@01 r)) (img@22@01 r))
      (and (img@13@01 r) (<= 0 (inv@12@01 r))))
    (= ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef3|)))
(assert (Property%precondition ($Snap.combine
  ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>))
  ($SortWrappers.$FVF<val>To$Snap (as sm@24@01  $FVF<val>))) a@2@01 b@3@01))
(declare-const tmp1@25@01 Bool)
(assert (=
  tmp1@25@01
  (Property ($Snap.combine
    ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>))
    ($SortWrappers.$FVF<val>To$Snap (as sm@24@01  $FVF<val>))) a@2@01 b@3@01)))
; [exec]
; tmp2 := (forall i: Int ::
;     { (loc(b, i): Ref) }
;     0 <= i ==> (loc(b, i): Ref).val)
; [eval] (forall i: Int :: { (loc(b, i): Ref) } 0 <= i ==> (loc(b, i): Ref).val)
(declare-const i@26@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i ==> (loc(b, i): Ref).val
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | 0 <= i@26@01 | live]
; [else-branch: 0 | !(0 <= i@26@01) | live]
(push) ; 5
; [then-branch: 0 | 0 <= i@26@01]
(assert (<= 0 i@26@01))
; [eval] (loc(b, i): Ref)
(declare-const sm@27@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (<= 0 (inv@8@01 r)))
    (= ($FVF.lookup_val (as sm@27@01  $FVF<val>) r) ($FVF.lookup_val $t@7@01 r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (<= 0 (inv@12@01 r)))
    (= ($FVF.lookup_val (as sm@27@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@28@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@28@01  $FPM) r)
    (+
      (ite
        (and (img@9@01 r) (<= 0 (inv@8@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and (img@13@01 r) (<= 0 (inv@12@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@28@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_val (as pm@28@01  $FPM) (loc<Ref> b@3@01 i@26@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(0 <= i@26@01)]
(assert (not (<= 0 i@26@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (<= 0 (inv@8@01 r)))
    (= ($FVF.lookup_val (as sm@27@01  $FVF<val>) r) ($FVF.lookup_val $t@7@01 r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (<= 0 (inv@12@01 r)))
    (= ($FVF.lookup_val (as sm@27@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@28@01  $FPM) r)
    (+
      (ite
        (and (img@9@01 r) (<= 0 (inv@8@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and (img@13@01 r) (<= 0 (inv@12@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@28@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Joined path conditions
(assert (or (not (<= 0 i@26@01)) (<= 0 i@26@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (<= 0 (inv@8@01 r)))
    (= ($FVF.lookup_val (as sm@27@01  $FVF<val>) r) ($FVF.lookup_val $t@7@01 r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (<= 0 (inv@12@01 r)))
    (= ($FVF.lookup_val (as sm@27@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@28@01  $FPM) r)
    (+
      (ite
        (and (img@9@01 r) (<= 0 (inv@8@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and (img@13@01 r) (<= 0 (inv@12@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@28@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int)) (!
  (or (not (<= 0 i@26@01)) (<= 0 i@26@01))
  :pattern ((loc<Ref> b@3@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483b.vpr@29@22@29@75-aux|)))
(declare-const tmp2@29@01 Bool)
(assert (=
  tmp2@29@01
  (forall ((i@26@01 Int)) (!
    (=>
      (<= 0 i@26@01)
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> b@3@01 i@26@01)))
    :pattern ((loc<Ref> b@3@01 i@26@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0483b.vpr@29@22@29@75|))))
; [exec]
; assert tmp1 == tmp2
; [eval] tmp1 == tmp2
(push) ; 3
(assert (not (= tmp1@25@01 tmp2@29@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp1@25@01 tmp2@29@01))
(pop) ; 2
(pop) ; 1
