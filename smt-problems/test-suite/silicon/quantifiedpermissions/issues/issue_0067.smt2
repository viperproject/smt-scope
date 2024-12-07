(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:16:49
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr
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
(declare-sort Set<$Perm> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<k> 0)
(declare-sort $FVF<f> 0)
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
(declare-fun $SortWrappers.Set<$Perm>To$Snap (Set<$Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Perm> ($Snap) Set<$Perm>)
(assert (forall ((x Set<$Perm>)) (!
    (= x ($SortWrappers.$SnapToSet<$Perm>($SortWrappers.Set<$Perm>To$Snap x)))
    :pattern (($SortWrappers.Set<$Perm>To$Snap x))
    :qid |$Snap.$SnapToSet<$Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Perm>To$Snap($SortWrappers.$SnapToSet<$Perm> x)))
    :pattern (($SortWrappers.$SnapToSet<$Perm> x))
    :qid |$Snap.Set<$Perm>To$SnapToSet<$Perm>|
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
(declare-fun $SortWrappers.$FVF<k>To$Snap ($FVF<k>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<k> ($Snap) $FVF<k>)
(assert (forall ((x $FVF<k>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<k>($SortWrappers.$FVF<k>To$Snap x)))
    :pattern (($SortWrappers.$FVF<k>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<k>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<k>To$Snap($SortWrappers.$SnapTo$FVF<k> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<k> x))
    :qid |$Snap.$FVF<k>To$SnapTo$FVF<k>|
    )))
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
(declare-fun Set_card (Set<$Perm>) Int)
(declare-const Set_empty Set<$Perm>)
(declare-fun Set_in ($Perm Set<$Perm>) Bool)
(declare-fun Set_singleton ($Perm) Set<$Perm>)
(declare-fun Set_unionone (Set<$Perm> $Perm) Set<$Perm>)
(declare-fun Set_union (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_intersection (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_difference (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_subset (Set<$Perm> Set<$Perm>) Bool)
(declare-fun Set_equal (Set<$Perm> Set<$Perm>) Bool)
(declare-fun Set_skolem_diff (Set<$Perm> Set<$Perm>) $Perm)
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
; /field_value_functions_declarations.smt2 [k: Perm]
(declare-fun $FVF.domain_k ($FVF<k>) Set<$Ref>)
(declare-fun $FVF.lookup_k ($FVF<k> $Ref) $Perm)
(declare-fun $FVF.after_k ($FVF<k> $FVF<k>) Bool)
(declare-fun $FVF.loc_k ($Perm $Ref) Bool)
(declare-fun $FVF.perm_k ($FPM $Ref) $Perm)
(declare-const $fvfTOP_k $FVF<k>)
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
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
(assert (forall ((s Set<$Perm>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Perm)) (!
  (not (Set_in o (as Set_empty  Set<$Perm>)))
  :pattern ((Set_in o (as Set_empty  Set<$Perm>)))
  )))
(assert (forall ((s Set<$Perm>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Perm>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Perm))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Perm)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Perm) (o $Perm)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Perm)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm) (o $Perm)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm) (y $Perm)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
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
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Perm)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
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
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
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
; /field_value_functions_axioms.smt2 [k: Perm]
(assert (forall ((vs $FVF<k>) (ws $FVF<k>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_k vs) ($FVF.domain_k ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_k vs))
            (= ($FVF.lookup_k vs x) ($FVF.lookup_k ws x)))
          :pattern (($FVF.lookup_k vs x) ($FVF.lookup_k ws x))
          :qid |qp.$FVF<k>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<k>To$Snap vs)
              ($SortWrappers.$FVF<k>To$Snap ws)
              )
    :qid |qp.$FVF<k>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_k pm r))
    :pattern (($FVF.perm_k pm r)))))
(assert (forall ((r $Ref) (f $Perm)) (!
    (= ($FVF.loc_k f r) true)
    :pattern (($FVF.loc_k f r)))))
; /field_value_functions_axioms.smt2 [f: Int]
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
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
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
; ---------- test01 ----------
(declare-const S@0@01 Set<$Ref>)
(declare-const a@1@01 $Ref)
(declare-const S@2@01 Set<$Ref>)
(declare-const a@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const s@5@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@5@01 S@2@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@5@01 $Ref) (s2@5@01 $Ref)) (!
  (=>
    (and (Set_in s1@5@01 S@2@01) (Set_in s2@5@01 S@2@01) (= s1@5@01 s2@5@01))
    (= s1@5@01 s2@5@01))
  
  :qid |k-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@5@01 $Ref)) (!
  (=>
    (Set_in s@5@01 S@2@01)
    (and (= (inv@6@01 s@5@01) s@5@01) (img@7@01 s@5@01)))
  :pattern ((Set_in s@5@01 S@2@01))
  :pattern ((inv@6@01 s@5@01))
  :pattern ((img@7@01 s@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) S@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |k-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@5@01 $Ref)) (!
  (=> (Set_in s@5@01 S@2@01) (not (= s@5@01 $Ref.null)))
  :pattern ((Set_in s@5@01 S@2@01))
  :pattern ((inv@6@01 s@5@01))
  :pattern ((img@7@01 s@5@01))
  :qid |k-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (forall s: Ref :: { (s in S) } (s in S) ==> s.k > none)
(declare-const s@8@01 $Ref)
(push) ; 2
; [eval] (s in S) ==> s.k > none
; [eval] (s in S)
(push) ; 3
; [then-branch: 0 | s@8@01 in S@2@01 | live]
; [else-branch: 0 | !(s@8@01 in S@2@01) | live]
(push) ; 4
; [then-branch: 0 | s@8@01 in S@2@01]
(assert (Set_in s@8@01 S@2@01))
; [eval] s.k > none
(push) ; 5
(assert (not (and (img@7@01 s@8@01) (Set_in (inv@6@01 s@8@01) S@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(s@8@01 in S@2@01)]
(assert (not (Set_in s@8@01 S@2@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in s@8@01 S@2@01)) (Set_in s@8@01 S@2@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s@8@01 $Ref)) (!
  (or (not (Set_in s@8@01 S@2@01)) (Set_in s@8@01 S@2@01))
  :pattern ((Set_in s@8@01 S@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr@9@12@9@50-aux|)))
(assert (forall ((s@8@01 $Ref)) (!
  (=>
    (Set_in s@8@01 S@2@01)
    (>
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@8@01)
      $Perm.No))
  :pattern ((Set_in s@8@01 S@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr@9@12@9@50|)))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(declare-const s@9@01 $Ref)
(push) ; 2
; [eval] (s in S) && s != null
; [eval] (s in S)
(push) ; 3
; [then-branch: 1 | !(s@9@01 in S@2@01) | live]
; [else-branch: 1 | s@9@01 in S@2@01 | live]
(push) ; 4
; [then-branch: 1 | !(s@9@01 in S@2@01)]
(assert (not (Set_in s@9@01 S@2@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | s@9@01 in S@2@01]
(assert (Set_in s@9@01 S@2@01))
; [eval] s != null
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s@9@01 S@2@01) (not (Set_in s@9@01 S@2@01))))
(assert (and (Set_in s@9@01 S@2@01) (not (= s@9@01 $Ref.null))))
(push) ; 3
(assert (not (and (img@7@01 s@9@01) (Set_in (inv@6@01 s@9@01) S@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((s@9@01 $Ref)) (!
  (=>
    (and (Set_in s@9@01 S@2@01) (not (= s@9@01 $Ref.null)))
    (or (Set_in s@9@01 S@2@01) (not (Set_in s@9@01 S@2@01))))
  :pattern ((Set_in s@9@01 S@2@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01))
  :pattern ((inv@10@01 s@9@01))
  :pattern ((img@11@01 s@9@01))
  :qid |f-aux|)))
(push) ; 2
(assert (not (forall ((s@9@01 $Ref)) (!
  (=>
    (and (Set_in s@9@01 S@2@01) (not (= s@9@01 $Ref.null)))
    (or
      (=
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01)
        $Perm.No)
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01))))
  
  :qid |quant-u-2|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@9@01 $Ref) (s2@9@01 $Ref)) (!
  (=>
    (and
      (and
        (and (Set_in s1@9@01 S@2@01) (not (= s1@9@01 $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s1@9@01)))
      (and
        (and (Set_in s2@9@01 S@2@01) (not (= s2@9@01 $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s2@9@01)))
      (= s1@9@01 s2@9@01))
    (= s1@9@01 s2@9@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@9@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s@9@01 S@2@01) (not (= s@9@01 $Ref.null)))
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01)))
    (and (= (inv@10@01 s@9@01) s@9@01) (img@11@01 s@9@01)))
  :pattern ((Set_in s@9@01 S@2@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01))
  :pattern ((inv@10@01 s@9@01))
  :pattern ((img@11@01 s@9@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r)))))
    (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((s@9@01 $Ref)) (!
  (<=
    $Perm.No
    ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01))
  :pattern ((Set_in s@9@01 S@2@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01))
  :pattern ((inv@10@01 s@9@01))
  :pattern ((img@11@01 s@9@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((s@9@01 $Ref)) (!
  (<=
    ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01)
    $Perm.Write)
  :pattern ((Set_in s@9@01 S@2@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01))
  :pattern ((inv@10@01 s@9@01))
  :pattern ((img@11@01 s@9@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((s@9@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s@9@01 S@2@01) (not (= s@9@01 $Ref.null)))
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01)))
    (not (= s@9@01 $Ref.null)))
  :pattern ((Set_in s@9@01 S@2@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) s@9@01))
  :pattern ((inv@10@01 s@9@01))
  :pattern ((img@11@01 s@9@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] (a in S)
(assert (Set_in a@3@01 S@2@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(a.f, a.k)
(push) ; 3
(assert (not (and (img@7@01 a@3@01) (Set_in (inv@6@01 a@3@01) S@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@12@01 ((r $Ref)) $Perm
  (ite
    (= r a@3@01)
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null))))
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r))
        $Perm.No)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) a@3@01))
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
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null))))
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r))
        $Perm.No)
      (pTaken@12@01 r))
    $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@12@01 r) $Perm.No)
  
  :qid |quant-u-6|))))
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
    (= r a@3@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) a@3@01)
        (pTaken@12@01 r))
      $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@13@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@11@01 a@3@01)
      (and
        (Set_in (inv@10@01 a@3@01) S@2@01)
        (not (= (inv@10@01 a@3@01) $Ref.null))))
    (<
      $Perm.No
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 a@3@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@13@01  $FVF<f>) a@3@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) a@3@01))))
; [exec]
; exhale acc(a.f, a.k)
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@7@01 a@3@01) (Set_in (inv@6@01 a@3@01) S@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@14@01 ((r $Ref)) $Perm
  (ite
    (= r a@3@01)
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r))
          (pTaken@12@01 r))
        $Perm.No)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) a@3@01))
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
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r))
          (pTaken@12@01 r))
        $Perm.No)
      (pTaken@14@01 r))
    $Perm.No)
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@14@01 r) $Perm.No)
  
  :qid |quant-u-10|))))
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
    (= r a@3@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) a@3@01)
        (pTaken@14@01 r))
      $Perm.No))
  
  :qid |quant-u-11|))))
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
    (= r a@3@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) a@3@01)
        (pTaken@14@01 r))
      $Perm.No))
  
  :qid |quant-u-11|))))
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
(declare-const sm@15@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null))))
      (<
        $Perm.No
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r))
          (pTaken@12@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@16@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@16@01  $FPM) r)
    (ite
      (and
        (img@11@01 r)
        (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null))))
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r))
        (pTaken@12@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@16@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@16@01  $FPM) r) $Perm.Write)
  :pattern ((inv@10@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@17@01 $FVF<k>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) S@2@01))
    (=
      ($FVF.lookup_k (as sm@17@01  $FVF<k>) r)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_k (as sm@17@01  $FVF<k>) r))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef3|)))
(declare-const pm@18@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_k (as pm@18@01  $FPM) r)
    (ite (and (img@7@01 r) (Set_in (inv@6@01 r) S@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_k (as pm@18@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
; Assume upper permission bound for field k
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_k (as pm@18@01  $FPM) r) $Perm.Write)
  :pattern ((inv@6@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@7@01 a@3@01) (Set_in (inv@6@01 a@3@01) S@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((r $Ref)) $Perm
  (ite
    (= r a@3@01)
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r))
          (pTaken@12@01 r))
        $Perm.No)
      ($FVF.lookup_k (as sm@17@01  $FVF<k>) a@3@01))
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
          (img@11@01 r)
          (and (Set_in (inv@10@01 r) S@2@01) (not (= (inv@10@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@4@01)) (inv@10@01 r))
          (pTaken@12@01 r))
        $Perm.No)
      (pTaken@19@01 r))
    $Perm.No)
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@19@01 r) $Perm.No)
  
  :qid |quant-u-14|))))
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
    (= r a@3@01)
    (=
      (- ($FVF.lookup_k (as sm@17@01  $FVF<k>) a@3@01) (pTaken@19@01 r))
      $Perm.No))
  
  :qid |quant-u-15|))))
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
    (= r a@3@01)
    (=
      (- ($FVF.lookup_k (as sm@17@01  $FVF<k>) a@3@01) (pTaken@19@01 r))
      $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const S@20@01 Set<$Ref>)
(declare-const a@21@01 $Ref)
(declare-const b@22@01 $Ref)
(declare-const S@23@01 Set<$Ref>)
(declare-const a@24@01 $Ref)
(declare-const b@25@01 $Ref)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(declare-const s@27@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@27@01 S@23@01))
(pop) ; 2
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@27@01 $Ref) (s2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@27@01 S@23@01)
      (Set_in s2@27@01 S@23@01)
      (= s1@27@01 s2@27@01))
    (= s1@27@01 s2@27@01))
  
  :qid |k-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@27@01 $Ref)) (!
  (=>
    (Set_in s@27@01 S@23@01)
    (and (= (inv@28@01 s@27@01) s@27@01) (img@29@01 s@27@01)))
  :pattern ((Set_in s@27@01 S@23@01))
  :pattern ((inv@28@01 s@27@01))
  :pattern ((img@29@01 s@27@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@29@01 r) (Set_in (inv@28@01 r) S@23@01)) (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |k-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@27@01 $Ref)) (!
  (=> (Set_in s@27@01 S@23@01) (not (= s@27@01 $Ref.null)))
  :pattern ((Set_in s@27@01 S@23@01))
  :pattern ((inv@28@01 s@27@01))
  :pattern ((img@29@01 s@27@01))
  :qid |k-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(assert (= ($Snap.first ($Snap.second $t@26@01)) $Snap.unit))
; [eval] (forall s: Ref :: { (s in S) } (s in S) ==> s.k > none)
(declare-const s@30@01 $Ref)
(push) ; 2
; [eval] (s in S) ==> s.k > none
; [eval] (s in S)
(push) ; 3
; [then-branch: 2 | s@30@01 in S@23@01 | live]
; [else-branch: 2 | !(s@30@01 in S@23@01) | live]
(push) ; 4
; [then-branch: 2 | s@30@01 in S@23@01]
(assert (Set_in s@30@01 S@23@01))
; [eval] s.k > none
(push) ; 5
(assert (not (and (img@29@01 s@30@01) (Set_in (inv@28@01 s@30@01) S@23@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(s@30@01 in S@23@01)]
(assert (not (Set_in s@30@01 S@23@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in s@30@01 S@23@01)) (Set_in s@30@01 S@23@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s@30@01 $Ref)) (!
  (or (not (Set_in s@30@01 S@23@01)) (Set_in s@30@01 S@23@01))
  :pattern ((Set_in s@30@01 S@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr@20@12@20@50-aux|)))
(assert (forall ((s@30@01 $Ref)) (!
  (=>
    (Set_in s@30@01 S@23@01)
    (>
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@30@01)
      $Perm.No))
  :pattern ((Set_in s@30@01 S@23@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr@20@12@20@50|)))
(assert (=
  ($Snap.second ($Snap.second $t@26@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))
(declare-const s@31@01 $Ref)
(push) ; 2
; [eval] (s in S) && s != null
; [eval] (s in S)
(push) ; 3
; [then-branch: 3 | !(s@31@01 in S@23@01) | live]
; [else-branch: 3 | s@31@01 in S@23@01 | live]
(push) ; 4
; [then-branch: 3 | !(s@31@01 in S@23@01)]
(assert (not (Set_in s@31@01 S@23@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | s@31@01 in S@23@01]
(assert (Set_in s@31@01 S@23@01))
; [eval] s != null
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s@31@01 S@23@01) (not (Set_in s@31@01 S@23@01))))
(assert (and (Set_in s@31@01 S@23@01) (not (= s@31@01 $Ref.null))))
(push) ; 3
(assert (not (and (img@29@01 s@31@01) (Set_in (inv@28@01 s@31@01) S@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@32@01 ($Ref) $Ref)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((s@31@01 $Ref)) (!
  (=>
    (and (Set_in s@31@01 S@23@01) (not (= s@31@01 $Ref.null)))
    (or (Set_in s@31@01 S@23@01) (not (Set_in s@31@01 S@23@01))))
  :pattern ((Set_in s@31@01 S@23@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01))
  :pattern ((inv@32@01 s@31@01))
  :pattern ((img@33@01 s@31@01))
  :qid |f-aux|)))
(push) ; 2
(assert (not (forall ((s@31@01 $Ref)) (!
  (=>
    (and (Set_in s@31@01 S@23@01) (not (= s@31@01 $Ref.null)))
    (or
      (=
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01)
        $Perm.No)
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01))))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@31@01 $Ref) (s2@31@01 $Ref)) (!
  (=>
    (and
      (and
        (and (Set_in s1@31@01 S@23@01) (not (= s1@31@01 $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s1@31@01)))
      (and
        (and (Set_in s2@31@01 S@23@01) (not (= s2@31@01 $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s2@31@01)))
      (= s1@31@01 s2@31@01))
    (= s1@31@01 s2@31@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@31@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s@31@01 S@23@01) (not (= s@31@01 $Ref.null)))
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01)))
    (and (= (inv@32@01 s@31@01) s@31@01) (img@33@01 s@31@01)))
  :pattern ((Set_in s@31@01 S@23@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01))
  :pattern ((inv@32@01 s@31@01))
  :pattern ((img@33@01 s@31@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (and
        (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r)))))
    (= (inv@32@01 r) r))
  :pattern ((inv@32@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((s@31@01 $Ref)) (!
  (<=
    $Perm.No
    ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01))
  :pattern ((Set_in s@31@01 S@23@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01))
  :pattern ((inv@32@01 s@31@01))
  :pattern ((img@33@01 s@31@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((s@31@01 $Ref)) (!
  (<=
    ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01)
    $Perm.Write)
  :pattern ((Set_in s@31@01 S@23@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01))
  :pattern ((inv@32@01 s@31@01))
  :pattern ((img@33@01 s@31@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((s@31@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s@31@01 S@23@01) (not (= s@31@01 $Ref.null)))
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01)))
    (not (= s@31@01 $Ref.null)))
  :pattern ((Set_in s@31@01 S@23@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) s@31@01))
  :pattern ((inv@32@01 s@31@01))
  :pattern ((img@33@01 s@31@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@26@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
  $Snap.unit))
; [eval] (a in S)
(assert (Set_in a@24@01 S@23@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
  $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@25@01 S@23@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(a.f, a.k)
(push) ; 3
(assert (not (and (img@29@01 a@24@01) (Set_in (inv@28@01 a@24@01) S@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (= r a@24@01)
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null))))
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r))
        $Perm.No)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) a@24@01))
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
          (img@33@01 r)
          (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null))))
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r))
        $Perm.No)
      (pTaken@34@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@34@01 r) $Perm.No)
  
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
    (= r a@24@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) a@24@01)
        (pTaken@34@01 r))
      $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@35@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@33@01 a@24@01)
      (and
        (Set_in (inv@32@01 a@24@01) S@23@01)
        (not (= (inv@32@01 a@24@01) $Ref.null))))
    (<
      $Perm.No
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 a@24@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@35@01  $FVF<f>) a@24@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@26@01)))) a@24@01))))
; [exec]
; exhale acc(b.f, a.k)
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@29@01 a@24@01) (Set_in (inv@28@01 a@24@01) S@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref)) $Perm
  (ite
    (= r b@25@01)
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r))
          (pTaken@34@01 r))
        $Perm.No)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) a@24@01))
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
          (img@33@01 r)
          (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r))
          (pTaken@34@01 r))
        $Perm.No)
      (pTaken@36@01 r))
    $Perm.No)
  
  :qid |quant-u-25|))))
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
  
  :qid |quant-u-26|))))
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
    (= r b@25@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) a@24@01)
        (pTaken@36@01 r))
      $Perm.No))
  
  :qid |quant-u-27|))))
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
    (= r b@25@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) a@24@01)
        (pTaken@36@01 r))
      $Perm.No))
  
  :qid |quant-u-27|))))
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
(declare-const sm@37@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@33@01 r)
        (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null))))
      (<
        $Perm.No
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r))
          (pTaken@34@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@37@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@26@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@26@01)))) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@38@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@38@01  $FPM) r)
    (ite
      (and
        (img@33@01 r)
        (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null))))
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r))
        (pTaken@34@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@38@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@38@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@39@01 $FVF<k>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (Set_in (inv@28@01 r) S@23@01))
    (=
      ($FVF.lookup_k (as sm@39@01  $FVF<k>) r)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_k (as sm@39@01  $FVF<k>) r))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@40@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_k (as pm@40@01  $FPM) r)
    (ite (and (img@29@01 r) (Set_in (inv@28@01 r) S@23@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_k (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
; Assume upper permission bound for field k
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_k (as pm@40@01  $FPM) r) $Perm.Write)
  :pattern ((inv@28@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@29@01 a@24@01) (Set_in (inv@28@01 a@24@01) S@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (= r b@25@01)
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r))
          (pTaken@34@01 r))
        $Perm.No)
      ($FVF.lookup_k (as sm@39@01  $FVF<k>) a@24@01))
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
          (img@33@01 r)
          (and (Set_in (inv@32@01 r) S@23@01) (not (= (inv@32@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@26@01)) (inv@32@01 r))
          (pTaken@34@01 r))
        $Perm.No)
      (pTaken@41@01 r))
    $Perm.No)
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@41@01 r) $Perm.No)
  
  :qid |quant-u-30|))))
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
    (= r b@25@01)
    (=
      (- ($FVF.lookup_k (as sm@39@01  $FVF<k>) a@24@01) (pTaken@41@01 r))
      $Perm.No))
  
  :qid |quant-u-31|))))
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
    (= r b@25@01)
    (=
      (- ($FVF.lookup_k (as sm@39@01  $FVF<k>) a@24@01) (pTaken@41@01 r))
      $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const S@42@01 Set<$Ref>)
(declare-const a@43@01 $Ref)
(declare-const b@44@01 $Ref)
(declare-const S@45@01 Set<$Ref>)
(declare-const a@46@01 $Ref)
(declare-const b@47@01 $Ref)
(push) ; 1
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(declare-const s@49@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@49@01 S@45@01))
(pop) ; 2
(declare-fun inv@50@01 ($Ref) $Ref)
(declare-fun img@51@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@49@01 $Ref) (s2@49@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@49@01 S@45@01)
      (Set_in s2@49@01 S@45@01)
      (= s1@49@01 s2@49@01))
    (= s1@49@01 s2@49@01))
  
  :qid |k-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@49@01 $Ref)) (!
  (=>
    (Set_in s@49@01 S@45@01)
    (and (= (inv@50@01 s@49@01) s@49@01) (img@51@01 s@49@01)))
  :pattern ((Set_in s@49@01 S@45@01))
  :pattern ((inv@50@01 s@49@01))
  :pattern ((img@51@01 s@49@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@51@01 r) (Set_in (inv@50@01 r) S@45@01)) (= (inv@50@01 r) r))
  :pattern ((inv@50@01 r))
  :qid |k-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@49@01 $Ref)) (!
  (=> (Set_in s@49@01 S@45@01) (not (= s@49@01 $Ref.null)))
  :pattern ((Set_in s@49@01 S@45@01))
  :pattern ((inv@50@01 s@49@01))
  :pattern ((img@51@01 s@49@01))
  :qid |k-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@48@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@48@01))
    ($Snap.second ($Snap.second $t@48@01)))))
(assert (= ($Snap.first ($Snap.second $t@48@01)) $Snap.unit))
; [eval] (forall s: Ref :: { (s in S) } (s in S) ==> s.k > none)
(declare-const s@52@01 $Ref)
(push) ; 2
; [eval] (s in S) ==> s.k > none
; [eval] (s in S)
(push) ; 3
; [then-branch: 4 | s@52@01 in S@45@01 | live]
; [else-branch: 4 | !(s@52@01 in S@45@01) | live]
(push) ; 4
; [then-branch: 4 | s@52@01 in S@45@01]
(assert (Set_in s@52@01 S@45@01))
; [eval] s.k > none
(push) ; 5
(assert (not (and (img@51@01 s@52@01) (Set_in (inv@50@01 s@52@01) S@45@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(s@52@01 in S@45@01)]
(assert (not (Set_in s@52@01 S@45@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in s@52@01 S@45@01)) (Set_in s@52@01 S@45@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s@52@01 $Ref)) (!
  (or (not (Set_in s@52@01 S@45@01)) (Set_in s@52@01 S@45@01))
  :pattern ((Set_in s@52@01 S@45@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr@31@12@31@50-aux|)))
(assert (forall ((s@52@01 $Ref)) (!
  (=>
    (Set_in s@52@01 S@45@01)
    (>
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@52@01)
      $Perm.No))
  :pattern ((Set_in s@52@01 S@45@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr@31@12@31@50|)))
(assert (=
  ($Snap.second ($Snap.second $t@48@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@48@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))
(declare-const s@53@01 $Ref)
(push) ; 2
; [eval] (s in S) && s != null
; [eval] (s in S)
(push) ; 3
; [then-branch: 5 | !(s@53@01 in S@45@01) | live]
; [else-branch: 5 | s@53@01 in S@45@01 | live]
(push) ; 4
; [then-branch: 5 | !(s@53@01 in S@45@01)]
(assert (not (Set_in s@53@01 S@45@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | s@53@01 in S@45@01]
(assert (Set_in s@53@01 S@45@01))
; [eval] s != null
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s@53@01 S@45@01) (not (Set_in s@53@01 S@45@01))))
(assert (and (Set_in s@53@01 S@45@01) (not (= s@53@01 $Ref.null))))
(push) ; 3
(assert (not (and (img@51@01 s@53@01) (Set_in (inv@50@01 s@53@01) S@45@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@54@01 ($Ref) $Ref)
(declare-fun img@55@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((s@53@01 $Ref)) (!
  (=>
    (and (Set_in s@53@01 S@45@01) (not (= s@53@01 $Ref.null)))
    (or (Set_in s@53@01 S@45@01) (not (Set_in s@53@01 S@45@01))))
  :pattern ((Set_in s@53@01 S@45@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01))
  :pattern ((inv@54@01 s@53@01))
  :pattern ((img@55@01 s@53@01))
  :qid |f-aux|)))
(push) ; 2
(assert (not (forall ((s@53@01 $Ref)) (!
  (=>
    (and (Set_in s@53@01 S@45@01) (not (= s@53@01 $Ref.null)))
    (or
      (=
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01)
        $Perm.No)
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01))))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@53@01 $Ref) (s2@53@01 $Ref)) (!
  (=>
    (and
      (and
        (and (Set_in s1@53@01 S@45@01) (not (= s1@53@01 $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s1@53@01)))
      (and
        (and (Set_in s2@53@01 S@45@01) (not (= s2@53@01 $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s2@53@01)))
      (= s1@53@01 s2@53@01))
    (= s1@53@01 s2@53@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@53@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s@53@01 S@45@01) (not (= s@53@01 $Ref.null)))
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01)))
    (and (= (inv@54@01 s@53@01) s@53@01) (img@55@01 s@53@01)))
  :pattern ((Set_in s@53@01 S@45@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01))
  :pattern ((inv@54@01 s@53@01))
  :pattern ((img@55@01 s@53@01))
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@01 r)
      (and
        (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r)))))
    (= (inv@54@01 r) r))
  :pattern ((inv@54@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((s@53@01 $Ref)) (!
  (<=
    $Perm.No
    ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01))
  :pattern ((Set_in s@53@01 S@45@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01))
  :pattern ((inv@54@01 s@53@01))
  :pattern ((img@55@01 s@53@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((s@53@01 $Ref)) (!
  (<=
    ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01)
    $Perm.Write)
  :pattern ((Set_in s@53@01 S@45@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01))
  :pattern ((inv@54@01 s@53@01))
  :pattern ((img@55@01 s@53@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((s@53@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s@53@01 S@45@01) (not (= s@53@01 $Ref.null)))
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01)))
    (not (= s@53@01 $Ref.null)))
  :pattern ((Set_in s@53@01 S@45@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) s@53@01))
  :pattern ((inv@54@01 s@53@01))
  :pattern ((img@55@01 s@53@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@48@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
  $Snap.unit))
; [eval] (a in S)
(assert (Set_in a@46@01 S@45@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
  $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@47@01 S@45@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(a.f, a.k)
(push) ; 3
(assert (not (and (img@51@01 a@46@01) (Set_in (inv@50@01 a@46@01) S@45@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (= r a@46@01)
    ($Perm.min
      (ite
        (and
          (img@55@01 r)
          (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null))))
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r))
        $Perm.No)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) a@46@01))
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
          (img@55@01 r)
          (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null))))
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r))
        $Perm.No)
      (pTaken@56@01 r))
    $Perm.No)
  
  :qid |quant-u-37|))))
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
  
  :qid |quant-u-38|))))
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
    (= r a@46@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) a@46@01)
        (pTaken@56@01 r))
      $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@57@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@55@01 a@46@01)
      (and
        (Set_in (inv@54@01 a@46@01) S@45@01)
        (not (= (inv@54@01 a@46@01) $Ref.null))))
    (<
      $Perm.No
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 a@46@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@57@01  $FVF<f>) a@46@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@48@01)))) a@46@01))))
; [exec]
; exhale acc(b.f, b.k)
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@51@01 b@47@01) (Set_in (inv@50@01 b@47@01) S@45@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((r $Ref)) $Perm
  (ite
    (= r b@47@01)
    ($Perm.min
      (ite
        (and
          (img@55@01 r)
          (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r))
          (pTaken@56@01 r))
        $Perm.No)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) b@47@01))
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
          (img@55@01 r)
          (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r))
          (pTaken@56@01 r))
        $Perm.No)
      (pTaken@58@01 r))
    $Perm.No)
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@58@01 r) $Perm.No)
  
  :qid |quant-u-42|))))
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
    (= r b@47@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) b@47@01)
        (pTaken@58@01 r))
      $Perm.No))
  
  :qid |quant-u-43|))))
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
    (= r b@47@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) b@47@01)
        (pTaken@58@01 r))
      $Perm.No))
  
  :qid |quant-u-43|))))
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
(declare-const sm@59@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@55@01 r)
        (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null))))
      (<
        $Perm.No
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r))
          (pTaken@56@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@59@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@48@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@48@01)))) r))
  :qid |qp.fvfValDef11|)))
(declare-const pm@60@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@60@01  $FPM) r)
    (ite
      (and
        (img@55@01 r)
        (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null))))
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r))
        (pTaken@56@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@60@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@60@01  $FPM) r) $Perm.Write)
  :pattern ((inv@54@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@61@01 $FVF<k>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@51@01 r) (Set_in (inv@50@01 r) S@45@01))
    (=
      ($FVF.lookup_k (as sm@61@01  $FVF<k>) r)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) r)))
  :pattern (($FVF.lookup_k (as sm@61@01  $FVF<k>) r))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) r))
  :qid |qp.fvfValDef13|)))
(declare-const pm@62@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_k (as pm@62@01  $FPM) r)
    (ite (and (img@51@01 r) (Set_in (inv@50@01 r) S@45@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_k (as pm@62@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
; Assume upper permission bound for field k
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_k (as pm@62@01  $FPM) r) $Perm.Write)
  :pattern ((inv@50@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@51@01 b@47@01) (Set_in (inv@50@01 b@47@01) S@45@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (= r b@47@01)
    ($Perm.min
      (ite
        (and
          (img@55@01 r)
          (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r))
          (pTaken@56@01 r))
        $Perm.No)
      ($FVF.lookup_k (as sm@61@01  $FVF<k>) b@47@01))
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
          (img@55@01 r)
          (and (Set_in (inv@54@01 r) S@45@01) (not (= (inv@54@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@48@01)) (inv@54@01 r))
          (pTaken@56@01 r))
        $Perm.No)
      (pTaken@63@01 r))
    $Perm.No)
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@63@01 r) $Perm.No)
  
  :qid |quant-u-46|))))
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
    (= r b@47@01)
    (=
      (- ($FVF.lookup_k (as sm@61@01  $FVF<k>) b@47@01) (pTaken@63@01 r))
      $Perm.No))
  
  :qid |quant-u-47|))))
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
    (= r b@47@01)
    (=
      (- ($FVF.lookup_k (as sm@61@01  $FVF<k>) b@47@01) (pTaken@63@01 r))
      $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const S@64@01 Set<$Ref>)
(declare-const a@65@01 $Ref)
(declare-const b@66@01 $Ref)
(declare-const S@67@01 Set<$Ref>)
(declare-const a@68@01 $Ref)
(declare-const b@69@01 $Ref)
(push) ; 1
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 ($Snap.combine ($Snap.first $t@70@01) ($Snap.second $t@70@01))))
(declare-const s@71@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@71@01 S@67@01))
(pop) ; 2
(declare-fun inv@72@01 ($Ref) $Ref)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@71@01 $Ref) (s2@71@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@71@01 S@67@01)
      (Set_in s2@71@01 S@67@01)
      (= s1@71@01 s2@71@01))
    (= s1@71@01 s2@71@01))
  
  :qid |k-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@71@01 $Ref)) (!
  (=>
    (Set_in s@71@01 S@67@01)
    (and (= (inv@72@01 s@71@01) s@71@01) (img@73@01 s@71@01)))
  :pattern ((Set_in s@71@01 S@67@01))
  :pattern ((inv@72@01 s@71@01))
  :pattern ((img@73@01 s@71@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@73@01 r) (Set_in (inv@72@01 r) S@67@01)) (= (inv@72@01 r) r))
  :pattern ((inv@72@01 r))
  :qid |k-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@71@01 $Ref)) (!
  (=> (Set_in s@71@01 S@67@01) (not (= s@71@01 $Ref.null)))
  :pattern ((Set_in s@71@01 S@67@01))
  :pattern ((inv@72@01 s@71@01))
  :pattern ((img@73@01 s@71@01))
  :qid |k-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@70@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@70@01))
    ($Snap.second ($Snap.second $t@70@01)))))
(assert (= ($Snap.first ($Snap.second $t@70@01)) $Snap.unit))
; [eval] (forall s: Ref :: { (s in S) } (s in S) ==> s.k > none)
(declare-const s@74@01 $Ref)
(push) ; 2
; [eval] (s in S) ==> s.k > none
; [eval] (s in S)
(push) ; 3
; [then-branch: 6 | s@74@01 in S@67@01 | live]
; [else-branch: 6 | !(s@74@01 in S@67@01) | live]
(push) ; 4
; [then-branch: 6 | s@74@01 in S@67@01]
(assert (Set_in s@74@01 S@67@01))
; [eval] s.k > none
(push) ; 5
(assert (not (and (img@73@01 s@74@01) (Set_in (inv@72@01 s@74@01) S@67@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(s@74@01 in S@67@01)]
(assert (not (Set_in s@74@01 S@67@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in s@74@01 S@67@01)) (Set_in s@74@01 S@67@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s@74@01 $Ref)) (!
  (or (not (Set_in s@74@01 S@67@01)) (Set_in s@74@01 S@67@01))
  :pattern ((Set_in s@74@01 S@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr@42@12@42@50-aux|)))
(assert (forall ((s@74@01 $Ref)) (!
  (=>
    (Set_in s@74@01 S@67@01)
    (>
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@74@01)
      $Perm.No))
  :pattern ((Set_in s@74@01 S@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0067.vpr@42@12@42@50|)))
(assert (=
  ($Snap.second ($Snap.second $t@70@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@70@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
(declare-const s@75@01 $Ref)
(push) ; 2
; [eval] (s in S) && s != null
; [eval] (s in S)
(push) ; 3
; [then-branch: 7 | !(s@75@01 in S@67@01) | live]
; [else-branch: 7 | s@75@01 in S@67@01 | live]
(push) ; 4
; [then-branch: 7 | !(s@75@01 in S@67@01)]
(assert (not (Set_in s@75@01 S@67@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | s@75@01 in S@67@01]
(assert (Set_in s@75@01 S@67@01))
; [eval] s != null
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s@75@01 S@67@01) (not (Set_in s@75@01 S@67@01))))
(assert (and (Set_in s@75@01 S@67@01) (not (= s@75@01 $Ref.null))))
(push) ; 3
(assert (not (and (img@73@01 s@75@01) (Set_in (inv@72@01 s@75@01) S@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@76@01 ($Ref) $Ref)
(declare-fun img@77@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((s@75@01 $Ref)) (!
  (=>
    (and (Set_in s@75@01 S@67@01) (not (= s@75@01 $Ref.null)))
    (or (Set_in s@75@01 S@67@01) (not (Set_in s@75@01 S@67@01))))
  :pattern ((Set_in s@75@01 S@67@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01))
  :pattern ((inv@76@01 s@75@01))
  :pattern ((img@77@01 s@75@01))
  :qid |f-aux|)))
(push) ; 2
(assert (not (forall ((s@75@01 $Ref)) (!
  (=>
    (and (Set_in s@75@01 S@67@01) (not (= s@75@01 $Ref.null)))
    (or
      (=
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01)
        $Perm.No)
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01))))
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@75@01 $Ref) (s2@75@01 $Ref)) (!
  (=>
    (and
      (and
        (and (Set_in s1@75@01 S@67@01) (not (= s1@75@01 $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s1@75@01)))
      (and
        (and (Set_in s2@75@01 S@67@01) (not (= s2@75@01 $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s2@75@01)))
      (= s1@75@01 s2@75@01))
    (= s1@75@01 s2@75@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@75@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s@75@01 S@67@01) (not (= s@75@01 $Ref.null)))
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01)))
    (and (= (inv@76@01 s@75@01) s@75@01) (img@77@01 s@75@01)))
  :pattern ((Set_in s@75@01 S@67@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01))
  :pattern ((inv@76@01 s@75@01))
  :pattern ((img@77@01 s@75@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@77@01 r)
      (and
        (and (Set_in (inv@76@01 r) S@67@01) (not (= (inv@76@01 r) $Ref.null)))
        (<
          $Perm.No
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 r)))))
    (= (inv@76@01 r) r))
  :pattern ((inv@76@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((s@75@01 $Ref)) (!
  (<=
    $Perm.No
    ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01))
  :pattern ((Set_in s@75@01 S@67@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01))
  :pattern ((inv@76@01 s@75@01))
  :pattern ((img@77@01 s@75@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((s@75@01 $Ref)) (!
  (<=
    ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01)
    $Perm.Write)
  :pattern ((Set_in s@75@01 S@67@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01))
  :pattern ((inv@76@01 s@75@01))
  :pattern ((img@77@01 s@75@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((s@75@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s@75@01 S@67@01) (not (= s@75@01 $Ref.null)))
      (<
        $Perm.No
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01)))
    (not (= s@75@01 $Ref.null)))
  :pattern ((Set_in s@75@01 S@67@01))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) s@75@01))
  :pattern ((inv@76@01 s@75@01))
  :pattern ((img@77@01 s@75@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@70@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
  $Snap.unit))
; [eval] (a in S)
(assert (Set_in a@68@01 S@67@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))
  $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@69@01 S@67@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))
  $Snap.unit))
; [eval] a != b
(assert (not (= a@68@01 b@69@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(a.f, a.k)
(push) ; 3
(assert (not (and (img@73@01 a@68@01) (Set_in (inv@72@01 a@68@01) S@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (= r a@68@01)
    ($Perm.min
      (ite
        (and
          (img@77@01 r)
          (and (Set_in (inv@76@01 r) S@67@01) (not (= (inv@76@01 r) $Ref.null))))
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 r))
        $Perm.No)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) a@68@01))
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
          (img@77@01 r)
          (and (Set_in (inv@76@01 r) S@67@01) (not (= (inv@76@01 r) $Ref.null))))
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 r))
        $Perm.No)
      (pTaken@78@01 r))
    $Perm.No)
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@78@01 r) $Perm.No)
  
  :qid |quant-u-54|))))
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
    (= r a@68@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) a@68@01)
        (pTaken@78@01 r))
      $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@79@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@77@01 a@68@01)
      (and
        (Set_in (inv@76@01 a@68@01) S@67@01)
        (not (= (inv@76@01 a@68@01) $Ref.null))))
    (<
      $Perm.No
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 a@68@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@79@01  $FVF<f>) a@68@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@70@01)))) a@68@01))))
; [exec]
; exhale acc(b.f, b.k)
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@73@01 b@69@01) (Set_in (inv@72@01 b@69@01) S@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@80@01 ((r $Ref)) $Perm
  (ite
    (= r b@69@01)
    ($Perm.min
      (ite
        (and
          (img@77@01 r)
          (and (Set_in (inv@76@01 r) S@67@01) (not (= (inv@76@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 r))
          (pTaken@78@01 r))
        $Perm.No)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) b@69@01))
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
          (img@77@01 r)
          (and (Set_in (inv@76@01 r) S@67@01) (not (= (inv@76@01 r) $Ref.null))))
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 r))
          (pTaken@78@01 r))
        $Perm.No)
      (pTaken@80@01 r))
    $Perm.No)
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@80@01 r) $Perm.No)
  
  :qid |quant-u-58|))))
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
    (= r b@69@01)
    (=
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) b@69@01)
        (pTaken@80@01 r))
      $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@81@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@77@01 b@69@01)
      (and
        (Set_in (inv@76@01 b@69@01) S@67@01)
        (not (= (inv@76@01 b@69@01) $Ref.null))))
    (<
      $Perm.No
      (-
        ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 b@69@01))
        (pTaken@78@01 b@69@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@81@01  $FVF<f>) b@69@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@70@01)))) b@69@01))))
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@82@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@77@01 r)
        (and (Set_in (inv@76@01 r) S@67@01) (not (= (inv@76@01 r) $Ref.null))))
      (<
        $Perm.No
        (-
          (-
            ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 r))
            (pTaken@78@01 r))
          (pTaken@80@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@82@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@70@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@82@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@70@01)))) r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@83@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@83@01  $FPM) r)
    (ite
      (and
        (img@77@01 r)
        (and (Set_in (inv@76@01 r) S@67@01) (not (= (inv@76@01 r) $Ref.null))))
      (-
        (-
          ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) (inv@76@01 r))
          (pTaken@78@01 r))
        (pTaken@80@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@83@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@83@01  $FPM) r) $Perm.Write)
  :pattern ((inv@76@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@84@01 $FVF<k>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@73@01 r) (Set_in (inv@72@01 r) S@67@01))
    (=
      ($FVF.lookup_k (as sm@84@01  $FVF<k>) r)
      ($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) r)))
  :pattern (($FVF.lookup_k (as sm@84@01  $FVF<k>) r))
  :pattern (($FVF.lookup_k ($SortWrappers.$SnapTo$FVF<k> ($Snap.first $t@70@01)) r))
  :qid |qp.fvfValDef19|)))
(declare-const pm@85@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_k (as pm@85@01  $FPM) r)
    (ite (and (img@73@01 r) (Set_in (inv@72@01 r) S@67@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_k (as pm@85@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
; Assume upper permission bound for field k
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_k (as pm@85@01  $FPM) r) $Perm.Write)
  :pattern ((inv@72@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
