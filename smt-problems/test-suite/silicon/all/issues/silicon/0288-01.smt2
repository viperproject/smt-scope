(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0288.vpr
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
(declare-fun loc<Ref> (Array_ Int) $Ref)
(declare-fun len<Int> (Array_) Int)
(declare-fun first<Array> ($Ref) Array_)
(declare-fun second<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun g ($Snap Array_) Bool)
(declare-fun g%limited ($Snap Array_) Bool)
(declare-fun g%stateless (Array_) Bool)
(declare-fun g%precondition ($Snap Array_) Bool)
(declare-fun f ($Snap Array_) Bool)
(declare-fun f%limited ($Snap Array_) Bool)
(declare-fun f%stateless (Array_) Bool)
(declare-fun f%precondition ($Snap Array_) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((a Array_) (i Int)) (!
  (and (= (first<Array> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a Array_)) (!
  (>= (len<Int> a) 0)
  :pattern ((len<Int> a))
  :qid |prog.length_nonneg|)))
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
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION g----------
(declare-fun a@0@00 () Array_)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const x@4@00 Int)
(push) ; 2
; [eval] 0 <= x && x < len(a)
; [eval] 0 <= x
(push) ; 3
; [then-branch: 0 | !(0 <= x@4@00) | live]
; [else-branch: 0 | 0 <= x@4@00 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= x@4@00)]
(assert (not (<= 0 x@4@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= x@4@00]
(assert (<= 0 x@4@00))
; [eval] x < len(a)
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@4@00) (not (<= 0 x@4@00))))
(assert (and (<= 0 x@4@00) (< x@4@00 (len<Int> a@0@00))))
; [eval] loc(a, x)
(pop) ; 2
(declare-fun inv@5@00 ($Snap Array_ $Ref) Int)
(declare-fun img@6@00 ($Snap Array_ $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@4@00 Int)) (!
  (=>
    (and (<= 0 x@4@00) (< x@4@00 (len<Int> a@0@00)))
    (or (<= 0 x@4@00) (not (<= 0 x@4@00))))
  :pattern ((loc<Ref> a@0@00 x@4@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@4@00 Int) (x2@4@00 Int)) (!
  (=>
    (and
      (and (<= 0 x1@4@00) (< x1@4@00 (len<Int> a@0@00)))
      (and (<= 0 x2@4@00) (< x2@4@00 (len<Int> a@0@00)))
      (= (loc<Ref> a@0@00 x1@4@00) (loc<Ref> a@0@00 x2@4@00)))
    (= x1@4@00 x2@4@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@4@00 Int)) (!
  (=>
    (and (<= 0 x@4@00) (< x@4@00 (len<Int> a@0@00)))
    (and
      (= (inv@5@00 s@$ a@0@00 (loc<Ref> a@0@00 x@4@00)) x@4@00)
      (img@6@00 s@$ a@0@00 (loc<Ref> a@0@00 x@4@00))))
  :pattern ((loc<Ref> a@0@00 x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@6@00 s@$ a@0@00 r)
      (and
        (<= 0 (inv@5@00 s@$ a@0@00 r))
        (< (inv@5@00 s@$ a@0@00 r) (len<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@5@00 s@$ a@0@00 r)) r))
  :pattern ((inv@5@00 s@$ a@0@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@4@00 Int)) (!
  (=>
    (and (<= 0 x@4@00) (< x@4@00 (len<Int> a@0@00)))
    (not (= (loc<Ref> a@0@00 x@4@00) $Ref.null)))
  :pattern ((loc<Ref> a@0@00 x@4@00))
  :qid |val-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 Array_)) (!
  (= (g%limited s@$ a@0@00) (g s@$ a@0@00))
  :pattern ((g s@$ a@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_)) (!
  (g%stateless a@0@00)
  :pattern ((g%limited s@$ a@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION f----------
(declare-fun a@2@00 () Array_)
(declare-fun result@3@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const x@7@00 Int)
(push) ; 2
; [eval] 0 <= x && x < len(a)
; [eval] 0 <= x
(push) ; 3
; [then-branch: 1 | !(0 <= x@7@00) | live]
; [else-branch: 1 | 0 <= x@7@00 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= x@7@00)]
(assert (not (<= 0 x@7@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= x@7@00]
(assert (<= 0 x@7@00))
; [eval] x < len(a)
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@7@00) (not (<= 0 x@7@00))))
(assert (and (<= 0 x@7@00) (< x@7@00 (len<Int> a@2@00))))
; [eval] loc(a, x)
(pop) ; 2
(declare-fun inv@8@00 ($Snap Array_ $Ref) Int)
(declare-fun img@9@00 ($Snap Array_ $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@7@00 Int)) (!
  (=>
    (and (<= 0 x@7@00) (< x@7@00 (len<Int> a@2@00)))
    (or (<= 0 x@7@00) (not (<= 0 x@7@00))))
  :pattern ((loc<Ref> a@2@00 x@7@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@7@00 Int) (x2@7@00 Int)) (!
  (=>
    (and
      (and (<= 0 x1@7@00) (< x1@7@00 (len<Int> a@2@00)))
      (and (<= 0 x2@7@00) (< x2@7@00 (len<Int> a@2@00)))
      (= (loc<Ref> a@2@00 x1@7@00) (loc<Ref> a@2@00 x2@7@00)))
    (= x1@7@00 x2@7@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@7@00 Int)) (!
  (=>
    (and (<= 0 x@7@00) (< x@7@00 (len<Int> a@2@00)))
    (and
      (= (inv@8@00 s@$ a@2@00 (loc<Ref> a@2@00 x@7@00)) x@7@00)
      (img@9@00 s@$ a@2@00 (loc<Ref> a@2@00 x@7@00))))
  :pattern ((loc<Ref> a@2@00 x@7@00))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ a@2@00 r)
      (and
        (<= 0 (inv@8@00 s@$ a@2@00 r))
        (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00))))
    (= (loc<Ref> a@2@00 (inv@8@00 s@$ a@2@00 r)) r))
  :pattern ((inv@8@00 s@$ a@2@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@7@00 Int)) (!
  (=>
    (and (<= 0 x@7@00) (< x@7@00 (len<Int> a@2@00)))
    (not (= (loc<Ref> a@2@00 x@7@00) $Ref.null)))
  :pattern ((loc<Ref> a@2@00 x@7@00))
  :qid |val-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@2@00 Array_)) (!
  (= (f%limited s@$ a@2@00) (f s@$ a@2@00))
  :pattern ((f s@$ a@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@2@00 Array_)) (!
  (f%stateless a@2@00)
  :pattern ((f%limited s@$ a@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ a@2@00 r)
      (and
        (<= 0 (inv@8@00 s@$ a@2@00 r))
        (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00))))
    (= (loc<Ref> a@2@00 (inv@8@00 s@$ a@2@00 r)) r))
  :pattern ((inv@8@00 s@$ a@2@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((x@7@00 Int)) (!
  (=>
    (and (<= 0 x@7@00) (< x@7@00 (len<Int> a@2@00)))
    (and
      (= (inv@8@00 s@$ a@2@00 (loc<Ref> a@2@00 x@7@00)) x@7@00)
      (img@9@00 s@$ a@2@00 (loc<Ref> a@2@00 x@7@00))))
  :pattern ((loc<Ref> a@2@00 x@7@00))
  :qid |quant-u-7|)))
(assert (forall ((x@7@00 Int)) (!
  (=>
    (and (<= 0 x@7@00) (< x@7@00 (len<Int> a@2@00)))
    (not (= (loc<Ref> a@2@00 x@7@00) $Ref.null)))
  :pattern ((loc<Ref> a@2@00 x@7@00))
  :qid |val-permImpliesNonNull|)))
(assert (forall ((x@7@00 Int)) (!
  (=>
    (and (<= 0 x@7@00) (< x@7@00 (len<Int> a@2@00)))
    (or (<= 0 x@7@00) (not (<= 0 x@7@00))))
  :pattern ((loc<Ref> a@2@00 x@7@00))
  :qid |val-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall k: Int ::0 <= k && k < len(a) ==> g(a))
(declare-const k@10@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= k && k < len(a) ==> g(a)
; [eval] 0 <= k && k < len(a)
; [eval] 0 <= k
(push) ; 3
; [then-branch: 2 | !(0 <= k@10@00) | live]
; [else-branch: 2 | 0 <= k@10@00 | live]
(push) ; 4
; [then-branch: 2 | !(0 <= k@10@00)]
(assert (not (<= 0 k@10@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | 0 <= k@10@00]
(assert (<= 0 k@10@00))
; [eval] k < len(a)
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@10@00) (not (<= 0 k@10@00))))
(push) ; 3
; [then-branch: 3 | 0 <= k@10@00 && k@10@00 < len[Int](a@2@00) | live]
; [else-branch: 3 | !(0 <= k@10@00 && k@10@00 < len[Int](a@2@00)) | live]
(push) ; 4
; [then-branch: 3 | 0 <= k@10@00 && k@10@00 < len[Int](a@2@00)]
(assert (and (<= 0 k@10@00) (< k@10@00 (len<Int> a@2@00))))
; [eval] g(a)
(push) ; 5
(declare-const x@11@00 Int)
(push) ; 6
; [eval] 0 <= x && x < len(a)
; [eval] 0 <= x
(push) ; 7
; [then-branch: 4 | !(0 <= x@11@00) | live]
; [else-branch: 4 | 0 <= x@11@00 | live]
(push) ; 8
; [then-branch: 4 | !(0 <= x@11@00)]
(assert (not (<= 0 x@11@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 4 | 0 <= x@11@00]
(assert (<= 0 x@11@00))
; [eval] x < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@11@00) (not (<= 0 x@11@00))))
(assert (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00))))
; [eval] loc(a, x)
(pop) ; 6
(declare-fun inv@12@00 ($Snap Array_ $Ref) Int)
(declare-fun img@13@00 ($Snap Array_ $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@11@00 Int)) (!
  (=>
    (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00)))
    (or (<= 0 x@11@00) (not (<= 0 x@11@00))))
  :pattern ((loc<Ref> a@2@00 x@11@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((x1@11@00 Int) (x2@11@00 Int)) (!
  (=>
    (and
      (and (<= 0 x1@11@00) (< x1@11@00 (len<Int> a@2@00)))
      (and (<= 0 x2@11@00) (< x2@11@00 (len<Int> a@2@00)))
      (= (loc<Ref> a@2@00 x1@11@00) (loc<Ref> a@2@00 x2@11@00)))
    (= x1@11@00 x2@11@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@11@00 Int)) (!
  (=>
    (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00)))
    (and
      (= (inv@12@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00)) x@11@00)
      (img@13@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00))))
  :pattern ((loc<Ref> a@2@00 x@11@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ a@2@00 r)
      (and
        (<= 0 (inv@12@00 s@$ a@2@00 r))
        (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00))))
    (= (loc<Ref> a@2@00 (inv@12@00 s@$ a@2@00 r)) r))
  :pattern ((inv@12@00 s@$ a@2@00 r))
  :qid |val-fctOfInv|)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@9@00 s@$ a@2@00 r)
          (and
            (<= 0 (inv@8@00 s@$ a@2@00 r))
            (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (<= 0 (inv@12@00 s@$ a@2@00 r))
            (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
          (img@13@00 s@$ a@2@00 r)
          (= r (loc<Ref> a@2@00 (inv@12@00 s@$ a@2@00 r))))
        ($Perm.min
          (ite
            (and
              (img@9@00 s@$ a@2@00 r)
              (and
                (<= 0 (inv@8@00 s@$ a@2@00 r))
                (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00))))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@12@00 s@$ a@2@00 r))
        (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
      (img@13@00 s@$ a@2@00 r)
      (= r (loc<Ref> a@2@00 (inv@12@00 s@$ a@2@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (<= 0 (inv@12@00 s@$ a@2@00 r))
              (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
            (img@13@00 s@$ a@2@00 r)
            (= r (loc<Ref> a@2@00 (inv@12@00 s@$ a@2@00 r))))
          ($Perm.min
            (ite
              (and
                (img@9@00 s@$ a@2@00 r)
                (and
                  (<= 0 (inv@8@00 s@$ a@2@00 r))
                  (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00))))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@14@00 ($Snap Array_) $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r))
      (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r))
      (and
        (img@9@00 s@$ a@2@00 r)
        (and
          (<= 0 (inv@8@00 s@$ a@2@00 r))
          (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00)))))
    (=
      ($FVF.lookup_val (sm@14@00 s@$ a@2@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r)))
  :pattern (($FVF.lookup_val (sm@14@00 s@$ a@2@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r))
  :qid |qp.fvfValDef0|)))
(assert (g%precondition ($SortWrappers.$FVF<val>To$Snap (sm@14@00 s@$ a@2@00)) a@2@00))
(pop) ; 5
; Joined path conditions
(assert (forall ((x@11@00 Int)) (!
  (=>
    (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00)))
    (and
      (= (inv@12@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00)) x@11@00)
      (img@13@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00))))
  :pattern ((loc<Ref> a@2@00 x@11@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ a@2@00 r)
      (and
        (<= 0 (inv@12@00 s@$ a@2@00 r))
        (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00))))
    (= (loc<Ref> a@2@00 (inv@12@00 s@$ a@2@00 r)) r))
  :pattern ((inv@12@00 s@$ a@2@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r))
      (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r))
      (and
        (img@9@00 s@$ a@2@00 r)
        (and
          (<= 0 (inv@8@00 s@$ a@2@00 r))
          (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00)))))
    (=
      ($FVF.lookup_val (sm@14@00 s@$ a@2@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r)))
  :pattern (($FVF.lookup_val (sm@14@00 s@$ a@2@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r))
  :qid |qp.fvfValDef0|)))
(assert (and
  (forall ((x@11@00 Int)) (!
    (=>
      (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00)))
      (or (<= 0 x@11@00) (not (<= 0 x@11@00))))
    :pattern ((loc<Ref> a@2@00 x@11@00))
    :qid |val-aux|))
  (g%precondition ($SortWrappers.$FVF<val>To$Snap (sm@14@00 s@$ a@2@00)) a@2@00)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | !(0 <= k@10@00 && k@10@00 < len[Int](a@2@00))]
(assert (not (and (<= 0 k@10@00) (< k@10@00 (len<Int> a@2@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((x@11@00 Int)) (!
  (=>
    (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00)))
    (and
      (= (inv@12@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00)) x@11@00)
      (img@13@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00))))
  :pattern ((loc<Ref> a@2@00 x@11@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ a@2@00 r)
      (and
        (<= 0 (inv@12@00 s@$ a@2@00 r))
        (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00))))
    (= (loc<Ref> a@2@00 (inv@12@00 s@$ a@2@00 r)) r))
  :pattern ((inv@12@00 s@$ a@2@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r))
      (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r))
      (and
        (img@9@00 s@$ a@2@00 r)
        (and
          (<= 0 (inv@8@00 s@$ a@2@00 r))
          (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00)))))
    (=
      ($FVF.lookup_val (sm@14@00 s@$ a@2@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r)))
  :pattern (($FVF.lookup_val (sm@14@00 s@$ a@2@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r))
  :qid |qp.fvfValDef0|)))
(assert (=>
  (and (<= 0 k@10@00) (< k@10@00 (len<Int> a@2@00)))
  (and
    (<= 0 k@10@00)
    (< k@10@00 (len<Int> a@2@00))
    (forall ((x@11@00 Int)) (!
      (=>
        (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00)))
        (or (<= 0 x@11@00) (not (<= 0 x@11@00))))
      :pattern ((loc<Ref> a@2@00 x@11@00))
      :qid |val-aux|))
    (g%precondition ($SortWrappers.$FVF<val>To$Snap (sm@14@00 s@$ a@2@00)) a@2@00))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@10@00) (< k@10@00 (len<Int> a@2@00))))
  (and (<= 0 k@10@00) (< k@10@00 (len<Int> a@2@00)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((x@11@00 Int)) (!
  (=>
    (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00)))
    (and
      (= (inv@12@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00)) x@11@00)
      (img@13@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00))))
  :pattern ((loc<Ref> a@2@00 x@11@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ a@2@00 r)
      (and
        (<= 0 (inv@12@00 s@$ a@2@00 r))
        (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00))))
    (= (loc<Ref> a@2@00 (inv@12@00 s@$ a@2@00 r)) r))
  :pattern ((inv@12@00 s@$ a@2@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r))
      (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@12@00 s@$ a@2@00 r))
          (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
        (img@13@00 s@$ a@2@00 r))
      (and
        (img@9@00 s@$ a@2@00 r)
        (and
          (<= 0 (inv@8@00 s@$ a@2@00 r))
          (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00)))))
    (=
      ($FVF.lookup_val (sm@14@00 s@$ a@2@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r)))
  :pattern (($FVF.lookup_val (sm@14@00 s@$ a@2@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r))
  :qid |qp.fvfValDef0|)))
; Nested auxiliary terms: non-globals (aux)
(assert (=
  result@3@00
  (forall ((k@10@00 Int)) (!
    (=>
      (and (<= 0 k@10@00) (< k@10@00 (len<Int> a@2@00)))
      (g ($SortWrappers.$FVF<val>To$Snap (sm@14@00 s@$ a@2@00)) a@2@00))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0288.vpr@7@5@7@51|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@2@00 Array_)) (!
  (and
    (forall ((x@7@00 Int)) (!
      (=>
        (and (<= 0 x@7@00) (< x@7@00 (len<Int> a@2@00)))
        (and
          (= (inv@8@00 s@$ a@2@00 (loc<Ref> a@2@00 x@7@00)) x@7@00)
          (img@9@00 s@$ a@2@00 (loc<Ref> a@2@00 x@7@00))))
      :pattern ((loc<Ref> a@2@00 x@7@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@9@00 s@$ a@2@00 r)
          (and
            (<= 0 (inv@8@00 s@$ a@2@00 r))
            (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00))))
        (= (loc<Ref> a@2@00 (inv@8@00 s@$ a@2@00 r)) r))
      :pattern ((inv@8@00 s@$ a@2@00 r))
      :qid |val-fctOfInv|))
    (forall ((x@11@00 Int)) (!
      (=>
        (and (<= 0 x@11@00) (< x@11@00 (len<Int> a@2@00)))
        (and
          (= (inv@12@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00)) x@11@00)
          (img@13@00 s@$ a@2@00 (loc<Ref> a@2@00 x@11@00))))
      :pattern ((loc<Ref> a@2@00 x@11@00))
      :qid |val-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ a@2@00 r)
          (and
            (<= 0 (inv@12@00 s@$ a@2@00 r))
            (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00))))
        (= (loc<Ref> a@2@00 (inv@12@00 s@$ a@2@00 r)) r))
      :pattern ((inv@12@00 s@$ a@2@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))
          (and
            (and
              (<= 0 (inv@12@00 s@$ a@2@00 r))
              (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
            (img@13@00 s@$ a@2@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@12@00 s@$ a@2@00 r))
              (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
            (img@13@00 s@$ a@2@00 r))
          (Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00)))))
      :pattern ((Set_in r ($FVF.domain_val (sm@14@00 s@$ a@2@00))))
      :qid |qp.fvfDomDef1|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@12@00 s@$ a@2@00 r))
              (< (inv@12@00 s@$ a@2@00 r) (len<Int> a@2@00)))
            (img@13@00 s@$ a@2@00 r))
          (and
            (img@9@00 s@$ a@2@00 r)
            (and
              (<= 0 (inv@8@00 s@$ a@2@00 r))
              (< (inv@8@00 s@$ a@2@00 r) (len<Int> a@2@00)))))
        (=
          ($FVF.lookup_val (sm@14@00 s@$ a@2@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r)))
      :pattern (($FVF.lookup_val (sm@14@00 s@$ a@2@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r))
      :qid |qp.fvfValDef0|))
    (=>
      (f%precondition s@$ a@2@00)
      (=
        (f s@$ a@2@00)
        (forall ((k Int)) 
          (=>
            (and (<= 0 k) (< k (len<Int> a@2@00)))
            (g ($SortWrappers.$FVF<val>To$Snap (sm@14@00 s@$ a@2@00)) a@2@00))))))
  :pattern ((f s@$ a@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (a@2@00 Array_)) (!
  (=>
    (f%precondition s@$ a@2@00)
    (forall ((k Int)) 
      (=>
        (and (<= 0 k) (< k (len<Int> a@2@00)))
        (g%precondition ($SortWrappers.$FVF<val>To$Snap (sm@14@00 s@$ a@2@00)) a@2@00))))
  :pattern ((f s@$ a@2@00))
  :qid |quant-u-13|)))
