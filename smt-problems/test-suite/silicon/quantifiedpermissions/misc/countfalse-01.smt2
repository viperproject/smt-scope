(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/countfalse.vpr
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
(declare-sort Array_ 0)
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
(declare-fun $SortWrappers.Array_To$Snap (Array_) $Snap)
(declare-fun $SortWrappers.$SnapToArray_ ($Snap) Array_)
(assert (forall ((x Array_)) (!
    (= x ($SortWrappers.$SnapToArray_($SortWrappers.Array_To$Snap x)))
    :pattern (($SortWrappers.Array_To$Snap x))
    :qid |$Snap.$SnapToArray_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Array_To$Snap($SortWrappers.$SnapToArray_ x)))
    :pattern (($SortWrappers.$SnapToArray_ x))
    :qid |$Snap.Array_To$SnapToArray_|
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
(declare-fun loc<Ref> (Array_ Int) $Ref)
(declare-fun length<Int> (Array_) Int)
(declare-fun first<Array> ($Ref) Array_)
(declare-fun second<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [val: Bool]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Bool)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Bool $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun countFalseX ($Snap Array_ Int) Int)
(declare-fun countFalseX%limited ($Snap Array_ Int) Int)
(declare-fun countFalseX%stateless (Array_ Int) Bool)
(declare-fun countFalseX%precondition ($Snap Array_ Int) Bool)
(declare-fun countFalse ($Snap Array_ Int Int) Int)
(declare-fun countFalse%limited ($Snap Array_ Int Int) Int)
(declare-fun countFalse%stateless (Array_ Int Int) Bool)
(declare-fun countFalse%precondition ($Snap Array_ Int Int) Bool)
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
(assert (forall ((a Array_) (i Int)) (!
  (and (= (first<Array> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a Array_)) (!
  (>= (length<Int> a) 0)
  :pattern ((length<Int> a))
  :qid |prog.length_nonneg|)))
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
; ---------- FUNCTION countFalseX----------
(declare-fun a@0@00 () Array_)
(declare-fun from@1@00 () Int)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= from
(assert (<= 0 from@1@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] from <= length(a)
; [eval] length(a)
(assert (<= from@1@00 (length<Int> a@0@00)))
(declare-const z@7@00 Int)
(push) ; 2
; [eval] from <= z && z < length(a)
; [eval] from <= z
(push) ; 3
; [then-branch: 0 | !(from@1@00 <= z@7@00) | live]
; [else-branch: 0 | from@1@00 <= z@7@00 | live]
(push) ; 4
; [then-branch: 0 | !(from@1@00 <= z@7@00)]
(assert (not (<= from@1@00 z@7@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | from@1@00 <= z@7@00]
(assert (<= from@1@00 z@7@00))
; [eval] z < length(a)
; [eval] length(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= from@1@00 z@7@00) (not (<= from@1@00 z@7@00))))
(assert (and (<= from@1@00 z@7@00) (< z@7@00 (length<Int> a@0@00))))
; [eval] loc(a, z)
(pop) ; 2
(declare-fun inv@8@00 ($Snap Array_ Int $Ref) Int)
(declare-fun img@9@00 ($Snap Array_ Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@7@00 Int)) (!
  (=>
    (and (<= from@1@00 z@7@00) (< z@7@00 (length<Int> a@0@00)))
    (or (<= from@1@00 z@7@00) (not (<= from@1@00 z@7@00))))
  :pattern ((loc<Ref> a@0@00 z@7@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@7@00 Int) (z2@7@00 Int)) (!
  (=>
    (and
      (and (<= from@1@00 z1@7@00) (< z1@7@00 (length<Int> a@0@00)))
      (and (<= from@1@00 z2@7@00) (< z2@7@00 (length<Int> a@0@00)))
      (= (loc<Ref> a@0@00 z1@7@00) (loc<Ref> a@0@00 z2@7@00)))
    (= z1@7@00 z2@7@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@7@00 Int)) (!
  (=>
    (and (<= from@1@00 z@7@00) (< z@7@00 (length<Int> a@0@00)))
    (and
      (= (inv@8@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@7@00)) z@7@00)
      (img@9@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@7@00))))
  :pattern ((loc<Ref> a@0@00 z@7@00))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ a@0@00 from@1@00 r)
      (and
        (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
        (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@8@00 s@$ a@0@00 from@1@00 r)) r))
  :pattern ((inv@8@00 s@$ a@0@00 from@1@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@7@00 Int)) (!
  (=>
    (and (<= from@1@00 z@7@00) (< z@7@00 (length<Int> a@0@00)))
    (not (= (loc<Ref> a@0@00 z@7@00) $Ref.null)))
  :pattern ((loc<Ref> a@0@00 z@7@00))
  :qid |val-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (from@1@00 Int)) (!
  (=
    (countFalseX%limited s@$ a@0@00 from@1@00)
    (countFalseX s@$ a@0@00 from@1@00))
  :pattern ((countFalseX s@$ a@0@00 from@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (from@1@00 Int)) (!
  (countFalseX%stateless a@0@00 from@1@00)
  :pattern ((countFalseX%limited s@$ a@0@00 from@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ a@0@00 from@1@00 r)
      (and
        (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
        (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@8@00 s@$ a@0@00 from@1@00 r)) r))
  :pattern ((inv@8@00 s@$ a@0@00 from@1@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((z@7@00 Int)) (!
  (=>
    (and (<= from@1@00 z@7@00) (< z@7@00 (length<Int> a@0@00)))
    (and
      (= (inv@8@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@7@00)) z@7@00)
      (img@9@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@7@00))))
  :pattern ((loc<Ref> a@0@00 z@7@00))
  :qid |quant-u-5|)))
(assert (forall ((z@7@00 Int)) (!
  (=>
    (and (<= from@1@00 z@7@00) (< z@7@00 (length<Int> a@0@00)))
    (not (= (loc<Ref> a@0@00 z@7@00) $Ref.null)))
  :pattern ((loc<Ref> a@0@00 z@7@00))
  :qid |val-permImpliesNonNull|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 from@1@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= from@1@00 (length<Int> a@0@00)))
(assert (forall ((z@7@00 Int)) (!
  (=>
    (and (<= from@1@00 z@7@00) (< z@7@00 (length<Int> a@0@00)))
    (or (<= from@1@00 z@7@00) (not (<= from@1@00 z@7@00))))
  :pattern ((loc<Ref> a@0@00 z@7@00))
  :qid |val-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (from == length(a) ? 0 : countFalseX(a, from + 1))
; [eval] from == length(a)
; [eval] length(a)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= from@1@00 (length<Int> a@0@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= from@1@00 (length<Int> a@0@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | from@1@00 == length[Int](a@0@00) | live]
; [else-branch: 1 | from@1@00 != length[Int](a@0@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | from@1@00 == length[Int](a@0@00)]
(assert (= from@1@00 (length<Int> a@0@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | from@1@00 != length[Int](a@0@00)]
(assert (not (= from@1@00 (length<Int> a@0@00))))
; [eval] countFalseX(a, from + 1)
; [eval] from + 1
(push) ; 4
; [eval] 0 <= from
(push) ; 5
(assert (not (<= 0 (+ from@1@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ from@1@00 1)))
; [eval] from <= length(a)
; [eval] length(a)
(push) ; 5
(assert (not (<= (+ from@1@00 1) (length<Int> a@0@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ from@1@00 1) (length<Int> a@0@00)))
(declare-const z@10@00 Int)
(push) ; 5
; [eval] from <= z && z < length(a)
; [eval] from <= z
(push) ; 6
; [then-branch: 2 | !(from@1@00 + 1 <= z@10@00) | live]
; [else-branch: 2 | from@1@00 + 1 <= z@10@00 | live]
(push) ; 7
; [then-branch: 2 | !(from@1@00 + 1 <= z@10@00)]
(assert (not (<= (+ from@1@00 1) z@10@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | from@1@00 + 1 <= z@10@00]
(assert (<= (+ from@1@00 1) z@10@00))
; [eval] z < length(a)
; [eval] length(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= (+ from@1@00 1) z@10@00) (not (<= (+ from@1@00 1) z@10@00))))
(assert (and (<= (+ from@1@00 1) z@10@00) (< z@10@00 (length<Int> a@0@00))))
; [eval] loc(a, z)
(pop) ; 5
(declare-fun inv@11@00 ($Snap Array_ Int $Ref) Int)
(declare-fun img@12@00 ($Snap Array_ Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@10@00 Int)) (!
  (=>
    (and (<= (+ from@1@00 1) z@10@00) (< z@10@00 (length<Int> a@0@00)))
    (or (<= (+ from@1@00 1) z@10@00) (not (<= (+ from@1@00 1) z@10@00))))
  :pattern ((loc<Ref> a@0@00 z@10@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((z1@10@00 Int) (z2@10@00 Int)) (!
  (=>
    (and
      (and (<= (+ from@1@00 1) z1@10@00) (< z1@10@00 (length<Int> a@0@00)))
      (and (<= (+ from@1@00 1) z2@10@00) (< z2@10@00 (length<Int> a@0@00)))
      (= (loc<Ref> a@0@00 z1@10@00) (loc<Ref> a@0@00 z2@10@00)))
    (= z1@10@00 z2@10@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@10@00 Int)) (!
  (=>
    (and (<= (+ from@1@00 1) z@10@00) (< z@10@00 (length<Int> a@0@00)))
    (and
      (= (inv@11@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@10@00)) z@10@00)
      (img@12@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@10@00))))
  :pattern ((loc<Ref> a@0@00 z@10@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ a@0@00 from@1@00 r)
      (and
        (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
        (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@11@00 s@$ a@0@00 from@1@00 r)) r))
  :pattern ((inv@11@00 s@$ a@0@00 from@1@00 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@9@00 s@$ a@0@00 from@1@00 r)
          (and
            (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
            (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
            (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
          (img@12@00 s@$ a@0@00 from@1@00 r)
          (= r (loc<Ref> a@0@00 (inv@11@00 s@$ a@0@00 from@1@00 r))))
        ($Perm.min
          (ite
            (and
              (img@9@00 s@$ a@0@00 from@1@00 r)
              (and
                (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
                (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-8|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r)
        (= r (loc<Ref> a@0@00 (inv@11@00 s@$ a@0@00 from@1@00 r))))
      ($Perm.min
        (ite
          (and
            (img@9@00 s@$ a@0@00 from@1@00 r)
            (and
              (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
              (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
          $Perm.Write
          $Perm.No)
        $Perm.Write)
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
        (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
      (img@12@00 s@$ a@0@00 from@1@00 r)
      (= r (loc<Ref> a@0@00 (inv@11@00 s@$ a@0@00 from@1@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
              (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
            (img@12@00 s@$ a@0@00 from@1@00 r)
            (= r (loc<Ref> a@0@00 (inv@11@00 s@$ a@0@00 from@1@00 r))))
          ($Perm.min
            (ite
              (and
                (img@9@00 s@$ a@0@00 from@1@00 r)
                (and
                  (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
                  (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@13@00 ($Snap Array_ Int) $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00)))
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r)))
    (=>
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r))
      (Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r))
      (and
        (img@9@00 s@$ a@0@00 from@1@00 r)
        (and
          (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
          (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))))
    (=
      ($FVF.lookup_val (sm@13@00 s@$ a@0@00 from@1@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_val (sm@13@00 s@$ a@0@00 from@1@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second s@$))) r))
  :qid |qp.fvfValDef0|)))
(assert (countFalseX%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<val>To$Snap (sm@13@00 s@$ a@0@00 from@1@00)))) a@0@00 (+
  from@1@00
  1)))
(pop) ; 4
; Joined path conditions
(assert (forall ((z@10@00 Int)) (!
  (=>
    (and (<= (+ from@1@00 1) z@10@00) (< z@10@00 (length<Int> a@0@00)))
    (and
      (= (inv@11@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@10@00)) z@10@00)
      (img@12@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@10@00))))
  :pattern ((loc<Ref> a@0@00 z@10@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ a@0@00 from@1@00 r)
      (and
        (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
        (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@11@00 s@$ a@0@00 from@1@00 r)) r))
  :pattern ((inv@11@00 s@$ a@0@00 from@1@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00)))
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r)))
    (=>
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r))
      (Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r))
      (and
        (img@9@00 s@$ a@0@00 from@1@00 r)
        (and
          (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
          (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))))
    (=
      ($FVF.lookup_val (sm@13@00 s@$ a@0@00 from@1@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_val (sm@13@00 s@$ a@0@00 from@1@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second s@$))) r))
  :qid |qp.fvfValDef0|)))
(assert (and
  (<= 0 (+ from@1@00 1))
  (<= (+ from@1@00 1) (length<Int> a@0@00))
  (forall ((z@10@00 Int)) (!
    (=>
      (and (<= (+ from@1@00 1) z@10@00) (< z@10@00 (length<Int> a@0@00)))
      (or (<= (+ from@1@00 1) z@10@00) (not (<= (+ from@1@00 1) z@10@00))))
    :pattern ((loc<Ref> a@0@00 z@10@00))
    :qid |val-aux|))
  (countFalseX%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<val>To$Snap (sm@13@00 s@$ a@0@00 from@1@00)))) a@0@00 (+
    from@1@00
    1))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (forall ((z@10@00 Int)) (!
  (=>
    (and (<= (+ from@1@00 1) z@10@00) (< z@10@00 (length<Int> a@0@00)))
    (and
      (= (inv@11@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@10@00)) z@10@00)
      (img@12@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@10@00))))
  :pattern ((loc<Ref> a@0@00 z@10@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@00 s@$ a@0@00 from@1@00 r)
      (and
        (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
        (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@11@00 s@$ a@0@00 from@1@00 r)) r))
  :pattern ((inv@11@00 s@$ a@0@00 from@1@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00)))
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r)))
    (=>
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r))
      (Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
          (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
        (img@12@00 s@$ a@0@00 from@1@00 r))
      (and
        (img@9@00 s@$ a@0@00 from@1@00 r)
        (and
          (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
          (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))))
    (=
      ($FVF.lookup_val (sm@13@00 s@$ a@0@00 from@1@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_val (sm@13@00 s@$ a@0@00 from@1@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second s@$))) r))
  :qid |qp.fvfValDef0|)))
(assert (=>
  (not (= from@1@00 (length<Int> a@0@00)))
  (and
    (not (= from@1@00 (length<Int> a@0@00)))
    (<= 0 (+ from@1@00 1))
    (<= (+ from@1@00 1) (length<Int> a@0@00))
    (forall ((z@10@00 Int)) (!
      (=>
        (and (<= (+ from@1@00 1) z@10@00) (< z@10@00 (length<Int> a@0@00)))
        (or (<= (+ from@1@00 1) z@10@00) (not (<= (+ from@1@00 1) z@10@00))))
      :pattern ((loc<Ref> a@0@00 z@10@00))
      :qid |val-aux|))
    (countFalseX%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<val>To$Snap (sm@13@00 s@$ a@0@00 from@1@00)))) a@0@00 (+
      from@1@00
      1)))))
(assert (or (not (= from@1@00 (length<Int> a@0@00))) (= from@1@00 (length<Int> a@0@00))))
(assert (=
  result@2@00
  (ite
    (= from@1@00 (length<Int> a@0@00))
    0
    (countFalseX ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<val>To$Snap (sm@13@00 s@$ a@0@00 from@1@00)))) a@0@00 (+
      from@1@00
      1)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (from@1@00 Int)) (!
  (and
    (forall ((z@7@00 Int)) (!
      (=>
        (and (<= from@1@00 z@7@00) (< z@7@00 (length<Int> a@0@00)))
        (and
          (= (inv@8@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@7@00)) z@7@00)
          (img@9@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@7@00))))
      :pattern ((loc<Ref> a@0@00 z@7@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@9@00 s@$ a@0@00 from@1@00 r)
          (and
            (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
            (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
        (= (loc<Ref> a@0@00 (inv@8@00 s@$ a@0@00 from@1@00 r)) r))
      :pattern ((inv@8@00 s@$ a@0@00 from@1@00 r))
      :qid |val-fctOfInv|))
    (forall ((z@10@00 Int)) (!
      (=>
        (and (<= (+ from@1@00 1) z@10@00) (< z@10@00 (length<Int> a@0@00)))
        (and
          (= (inv@11@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@10@00)) z@10@00)
          (img@12@00 s@$ a@0@00 from@1@00 (loc<Ref> a@0@00 z@10@00))))
      :pattern ((loc<Ref> a@0@00 z@10@00))
      :qid |val-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@12@00 s@$ a@0@00 from@1@00 r)
          (and
            (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
            (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00))))
        (= (loc<Ref> a@0@00 (inv@11@00 s@$ a@0@00 from@1@00 r)) r))
      :pattern ((inv@11@00 s@$ a@0@00 from@1@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00)))
          (and
            (and
              (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
              (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
            (img@12@00 s@$ a@0@00 from@1@00 r)))
        (=>
          (and
            (and
              (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
              (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
            (img@12@00 s@$ a@0@00 from@1@00 r))
          (Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00)))))
      :pattern ((Set_in r ($FVF.domain_val (sm@13@00 s@$ a@0@00 from@1@00))))
      :qid |qp.fvfDomDef1|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= (+ from@1@00 1) (inv@11@00 s@$ a@0@00 from@1@00 r))
              (< (inv@11@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))
            (img@12@00 s@$ a@0@00 from@1@00 r))
          (and
            (img@9@00 s@$ a@0@00 from@1@00 r)
            (and
              (<= from@1@00 (inv@8@00 s@$ a@0@00 from@1@00 r))
              (< (inv@8@00 s@$ a@0@00 from@1@00 r) (length<Int> a@0@00)))))
        (=
          ($FVF.lookup_val (sm@13@00 s@$ a@0@00 from@1@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_val (sm@13@00 s@$ a@0@00 from@1@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second s@$))) r))
      :qid |qp.fvfValDef0|))
    (=>
      (countFalseX%precondition s@$ a@0@00 from@1@00)
      (=
        (countFalseX s@$ a@0@00 from@1@00)
        (ite
          (= from@1@00 (length<Int> a@0@00))
          0
          (countFalseX%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (sm@13@00 s@$ a@0@00 from@1@00)))) a@0@00 (+
            from@1@00
            1))))))
  :pattern ((countFalseX s@$ a@0@00 from@1@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (from@1@00 Int)) (!
  (=>
    (countFalseX%precondition s@$ a@0@00 from@1@00)
    (ite
      (= from@1@00 (length<Int> a@0@00))
      true
      (countFalseX%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (sm@13@00 s@$ a@0@00 from@1@00)))) a@0@00 (+
        from@1@00
        1))))
  :pattern ((countFalseX s@$ a@0@00 from@1@00))
  :qid |quant-u-12|)))
; ---------- FUNCTION countFalse----------
(declare-fun a@3@00 () Array_)
(declare-fun from@4@00 () Int)
(declare-fun to@5@00 () Int)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= from
(assert (<= 0 from@4@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] from <= to
(assert (<= from@4@00 to@5@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] to <= length(a)
; [eval] length(a)
(assert (<= to@5@00 (length<Int> a@3@00)))
(declare-const z@14@00 Int)
(push) ; 2
; [eval] from <= z && z < to
; [eval] from <= z
(push) ; 3
; [then-branch: 3 | !(from@4@00 <= z@14@00) | live]
; [else-branch: 3 | from@4@00 <= z@14@00 | live]
(push) ; 4
; [then-branch: 3 | !(from@4@00 <= z@14@00)]
(assert (not (<= from@4@00 z@14@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | from@4@00 <= z@14@00]
(assert (<= from@4@00 z@14@00))
; [eval] z < to
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= from@4@00 z@14@00) (not (<= from@4@00 z@14@00))))
(assert (and (<= from@4@00 z@14@00) (< z@14@00 to@5@00)))
; [eval] loc(a, z)
(pop) ; 2
(declare-fun inv@15@00 ($Snap Array_ Int Int $Ref) Int)
(declare-fun img@16@00 ($Snap Array_ Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@14@00 Int)) (!
  (=>
    (and (<= from@4@00 z@14@00) (< z@14@00 to@5@00))
    (or (<= from@4@00 z@14@00) (not (<= from@4@00 z@14@00))))
  :pattern ((loc<Ref> a@3@00 z@14@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@14@00 Int) (z2@14@00 Int)) (!
  (=>
    (and
      (and (<= from@4@00 z1@14@00) (< z1@14@00 to@5@00))
      (and (<= from@4@00 z2@14@00) (< z2@14@00 to@5@00))
      (= (loc<Ref> a@3@00 z1@14@00) (loc<Ref> a@3@00 z2@14@00)))
    (= z1@14@00 z2@14@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@14@00 Int)) (!
  (=>
    (and (<= from@4@00 z@14@00) (< z@14@00 to@5@00))
    (and
      (=
        (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@14@00))
        z@14@00)
      (img@16@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@14@00))))
  :pattern ((loc<Ref> a@3@00 z@14@00))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
      (and
        (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
        (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
    (= (loc<Ref> a@3@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r)) r))
  :pattern ((inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@14@00 Int)) (!
  (=>
    (and (<= from@4@00 z@14@00) (< z@14@00 to@5@00))
    (not (= (loc<Ref> a@3@00 z@14@00) $Ref.null)))
  :pattern ((loc<Ref> a@3@00 z@14@00))
  :qid |val-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@3@00 Array_) (from@4@00 Int) (to@5@00 Int)) (!
  (=
    (countFalse%limited s@$ a@3@00 from@4@00 to@5@00)
    (countFalse s@$ a@3@00 from@4@00 to@5@00))
  :pattern ((countFalse s@$ a@3@00 from@4@00 to@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@3@00 Array_) (from@4@00 Int) (to@5@00 Int)) (!
  (countFalse%stateless a@3@00 from@4@00 to@5@00)
  :pattern ((countFalse%limited s@$ a@3@00 from@4@00 to@5@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
      (and
        (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
        (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
    (= (loc<Ref> a@3@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r)) r))
  :pattern ((inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((z@14@00 Int)) (!
  (=>
    (and (<= from@4@00 z@14@00) (< z@14@00 to@5@00))
    (and
      (=
        (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@14@00))
        z@14@00)
      (img@16@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@14@00))))
  :pattern ((loc<Ref> a@3@00 z@14@00))
  :qid |quant-u-14|)))
(assert (forall ((z@14@00 Int)) (!
  (=>
    (and (<= from@4@00 z@14@00) (< z@14@00 to@5@00))
    (not (= (loc<Ref> a@3@00 z@14@00) $Ref.null)))
  :pattern ((loc<Ref> a@3@00 z@14@00))
  :qid |val-permImpliesNonNull|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 from@4@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= from@4@00 to@5@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= to@5@00 (length<Int> a@3@00)))
(assert (forall ((z@14@00 Int)) (!
  (=>
    (and (<= from@4@00 z@14@00) (< z@14@00 to@5@00))
    (or (<= from@4@00 z@14@00) (not (<= from@4@00 z@14@00))))
  :pattern ((loc<Ref> a@3@00 z@14@00))
  :qid |val-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (from == to ? 0 : (loc(a, from).val ? 0 : 1) + countFalse(a, from + 1, to))
; [eval] from == to
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= from@4@00 to@5@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= from@4@00 to@5@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | from@4@00 == to@5@00 | live]
; [else-branch: 4 | from@4@00 != to@5@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | from@4@00 == to@5@00]
(assert (= from@4@00 to@5@00))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | from@4@00 != to@5@00]
(assert (not (= from@4@00 to@5@00)))
; [eval] (loc(a, from).val ? 0 : 1) + countFalse(a, from + 1, to)
; [eval] (loc(a, from).val ? 0 : 1)
; [eval] loc(a, from)
(push) ; 4
(assert (not (and
  (img@16@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 from@4@00))
  (and
    (<=
      from@4@00
      (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 from@4@00)))
    (<
      (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 from@4@00))
      to@5@00)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | Lookup(val, Second:(Second:(Second:(s@$))), loc[Ref](a@3@00, from@4@00)) | live]
; [else-branch: 5 | !(Lookup(val, Second:(Second:(Second:(s@$))), loc[Ref](a@3@00, from@4@00))) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | Lookup(val, Second:(Second:(Second:(s@$))), loc[Ref](a@3@00, from@4@00))]
(assert ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(Lookup(val, Second:(Second:(Second:(s@$))), loc[Ref](a@3@00, from@4@00)))]
(assert (not
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00)))
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00))))
; [eval] countFalse(a, from + 1, to)
; [eval] from + 1
(push) ; 4
; [eval] 0 <= from
(push) ; 5
(assert (not (<= 0 (+ from@4@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ from@4@00 1)))
; [eval] from <= to
(push) ; 5
(assert (not (<= (+ from@4@00 1) to@5@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ from@4@00 1) to@5@00))
; [eval] to <= length(a)
; [eval] length(a)
(declare-const z@17@00 Int)
(push) ; 5
; [eval] from <= z && z < to
; [eval] from <= z
(push) ; 6
; [then-branch: 6 | !(from@4@00 + 1 <= z@17@00) | live]
; [else-branch: 6 | from@4@00 + 1 <= z@17@00 | live]
(push) ; 7
; [then-branch: 6 | !(from@4@00 + 1 <= z@17@00)]
(assert (not (<= (+ from@4@00 1) z@17@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | from@4@00 + 1 <= z@17@00]
(assert (<= (+ from@4@00 1) z@17@00))
; [eval] z < to
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= (+ from@4@00 1) z@17@00) (not (<= (+ from@4@00 1) z@17@00))))
(assert (and (<= (+ from@4@00 1) z@17@00) (< z@17@00 to@5@00)))
; [eval] loc(a, z)
(pop) ; 5
(declare-fun inv@18@00 ($Snap Array_ Int Int $Ref) Int)
(declare-fun img@19@00 ($Snap Array_ Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((z@17@00 Int)) (!
  (=>
    (and (<= (+ from@4@00 1) z@17@00) (< z@17@00 to@5@00))
    (or (<= (+ from@4@00 1) z@17@00) (not (<= (+ from@4@00 1) z@17@00))))
  :pattern ((loc<Ref> a@3@00 z@17@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((z1@17@00 Int) (z2@17@00 Int)) (!
  (=>
    (and
      (and (<= (+ from@4@00 1) z1@17@00) (< z1@17@00 to@5@00))
      (and (<= (+ from@4@00 1) z2@17@00) (< z2@17@00 to@5@00))
      (= (loc<Ref> a@3@00 z1@17@00) (loc<Ref> a@3@00 z2@17@00)))
    (= z1@17@00 z2@17@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@17@00 Int)) (!
  (=>
    (and (<= (+ from@4@00 1) z@17@00) (< z@17@00 to@5@00))
    (and
      (=
        (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@17@00))
        z@17@00)
      (img@19@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@17@00))))
  :pattern ((loc<Ref> a@3@00 z@17@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)
      (and
        (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
        (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
    (= (loc<Ref> a@3@00 (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r)) r))
  :pattern ((inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
          (and
            (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
            (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
            (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
          (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)
          (= r (loc<Ref> a@3@00 (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))))
        ($Perm.min
          (ite
            (and
              (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
              (and
                (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
                (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)
        (= r (loc<Ref> a@3@00 (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))))
      ($Perm.min
        (ite
          (and
            (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
            (and
              (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
              (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
          $Perm.Write
          $Perm.No)
        $Perm.Write)
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
        (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
      (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)
      (= r (loc<Ref> a@3@00 (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
              (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
            (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)
            (= r (loc<Ref> a@3@00 (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))))
          ($Perm.min
            (ite
              (and
                (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
                (and
                  (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
                  (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@20@00 ($Snap Array_ Int Int) $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00)))
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)))
    (=>
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r))
      (Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r))
      (and
        (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
        (and
          (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))))
    (=
      ($FVF.lookup_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef2|)))
(assert (countFalse%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<val>To$Snap (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))) a@3@00 (+
  from@4@00
  1) to@5@00))
(pop) ; 4
; Joined path conditions
(assert (forall ((z@17@00 Int)) (!
  (=>
    (and (<= (+ from@4@00 1) z@17@00) (< z@17@00 to@5@00))
    (and
      (=
        (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@17@00))
        z@17@00)
      (img@19@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@17@00))))
  :pattern ((loc<Ref> a@3@00 z@17@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)
      (and
        (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
        (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
    (= (loc<Ref> a@3@00 (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r)) r))
  :pattern ((inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00)))
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)))
    (=>
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r))
      (Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r))
      (and
        (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
        (and
          (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))))
    (=
      ($FVF.lookup_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef2|)))
(assert (and
  (<= 0 (+ from@4@00 1))
  (<= (+ from@4@00 1) to@5@00)
  (forall ((z@17@00 Int)) (!
    (=>
      (and (<= (+ from@4@00 1) z@17@00) (< z@17@00 to@5@00))
      (or (<= (+ from@4@00 1) z@17@00) (not (<= (+ from@4@00 1) z@17@00))))
    :pattern ((loc<Ref> a@3@00 z@17@00))
    :qid |val-aux|))
  (countFalse%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<val>To$Snap (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))) a@3@00 (+
    from@4@00
    1) to@5@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (forall ((z@17@00 Int)) (!
  (=>
    (and (<= (+ from@4@00 1) z@17@00) (< z@17@00 to@5@00))
    (and
      (=
        (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@17@00))
        z@17@00)
      (img@19@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@17@00))))
  :pattern ((loc<Ref> a@3@00 z@17@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)
      (and
        (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
        (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
    (= (loc<Ref> a@3@00 (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r)) r))
  :pattern ((inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00)))
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)))
    (=>
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r))
      (Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
        (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r))
      (and
        (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
        (and
          (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))))
    (=
      ($FVF.lookup_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) r)))
  :pattern (($FVF.lookup_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (not (= from@4@00 to@5@00))
  (and
    (not (= from@4@00 to@5@00))
    (or
      (not
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00)))
    (<= 0 (+ from@4@00 1))
    (<= (+ from@4@00 1) to@5@00)
    (forall ((z@17@00 Int)) (!
      (=>
        (and (<= (+ from@4@00 1) z@17@00) (< z@17@00 to@5@00))
        (or (<= (+ from@4@00 1) z@17@00) (not (<= (+ from@4@00 1) z@17@00))))
      :pattern ((loc<Ref> a@3@00 z@17@00))
      :qid |val-aux|))
    (countFalse%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))) a@3@00 (+
      from@4@00
      1) to@5@00))))
(assert (or (not (= from@4@00 to@5@00)) (= from@4@00 to@5@00)))
(assert (=
  result@6@00
  (ite
    (= from@4@00 to@5@00)
    0
    (+
      (ite
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00))
        0
        1)
      (countFalse ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))) a@3@00 (+
        from@4@00
        1) to@5@00)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@3@00 Array_) (from@4@00 Int) (to@5@00 Int)) (!
  (and
    (forall ((z@14@00 Int)) (!
      (=>
        (and (<= from@4@00 z@14@00) (< z@14@00 to@5@00))
        (and
          (=
            (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@14@00))
            z@14@00)
          (img@16@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@14@00))))
      :pattern ((loc<Ref> a@3@00 z@14@00))
      :qid |quant-u-14|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
          (and
            (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
            (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
        (= (loc<Ref> a@3@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r)) r))
      :pattern ((inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
      :qid |val-fctOfInv|))
    (forall ((z@17@00 Int)) (!
      (=>
        (and (<= (+ from@4@00 1) z@17@00) (< z@17@00 to@5@00))
        (and
          (=
            (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@17@00))
            z@17@00)
          (img@19@00 s@$ a@3@00 from@4@00 to@5@00 (loc<Ref> a@3@00 z@17@00))))
      :pattern ((loc<Ref> a@3@00 z@17@00))
      :qid |val-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)
          (and
            (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
            (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00)))
        (= (loc<Ref> a@3@00 (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r)) r))
      :pattern ((inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00)))
          (and
            (and
              (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
              (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
            (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r)))
        (=>
          (and
            (and
              (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
              (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
            (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00)))))
      :pattern ((Set_in r ($FVF.domain_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))
      :qid |qp.fvfDomDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= (+ from@4@00 1) (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r))
              (< (inv@18@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))
            (img@19@00 s@$ a@3@00 from@4@00 to@5@00 r))
          (and
            (img@16@00 s@$ a@3@00 from@4@00 to@5@00 r)
            (and
              (<= from@4@00 (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r))
              (< (inv@15@00 s@$ a@3@00 from@4@00 to@5@00 r) to@5@00))))
        (=
          ($FVF.lookup_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_val (sm@20@00 s@$ a@3@00 from@4@00 to@5@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef2|))
    (=>
      (countFalse%precondition s@$ a@3@00 from@4@00 to@5@00)
      (=
        (countFalse s@$ a@3@00 from@4@00 to@5@00)
        (ite
          (= from@4@00 to@5@00)
          0
          (+
            (ite
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second s@$)))) (loc<Ref> a@3@00 from@4@00))
              0
              1)
            (countFalse%limited ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))) a@3@00 (+
              from@4@00
              1) to@5@00))))))
  :pattern ((countFalse s@$ a@3@00 from@4@00 to@5@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (a@3@00 Array_) (from@4@00 Int) (to@5@00 Int)) (!
  (=>
    (countFalse%precondition s@$ a@3@00 from@4@00 to@5@00)
    (ite
      (= from@4@00 to@5@00)
      true
      (countFalse%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (sm@20@00 s@$ a@3@00 from@4@00 to@5@00))))) a@3@00 (+
        from@4@00
        1) to@5@00)))
  :pattern ((countFalse s@$ a@3@00 from@4@00 to@5@00))
  :qid |quant-u-21|)))
