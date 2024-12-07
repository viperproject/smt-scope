(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:35
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr
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
(declare-fun length<Int> (Array_) Int)
(declare-fun inverse_first<Array> ($Ref) Array_)
(declare-fun inverse_second<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
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
  (and
    (= (inverse_first<Array> (loc<Ref> a i)) a)
    (= (inverse_second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a Array_)) (!
  (>= (length<Int> a) 0)
  :pattern ((length<Int> a))
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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- DutchFlag ----------
(declare-const a@0@01 Array_)
(declare-const a@1@01 Array_)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(declare-const i@3@01 Int)
(push) ; 2
; [eval] 0 <= i && i < length(a)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@3@01) | live]
; [else-branch: 0 | 0 <= i@3@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@3@01)]
(assert (not (<= 0 i@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@3@01]
(assert (<= 0 i@3@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@3@01) (not (<= 0 i@3@01))))
(assert (and (<= 0 i@3@01) (< i@3@01 (length<Int> a@1@01))))
; [eval] loc(a, i)
(pop) ; 2
(declare-fun inv@4@01 ($Ref) Int)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@3@01 Int)) (!
  (=>
    (and (<= 0 i@3@01) (< i@3@01 (length<Int> a@1@01)))
    (or (<= 0 i@3@01) (not (<= 0 i@3@01))))
  :pattern ((loc<Ref> a@1@01 i@3@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@3@01 Int) (i2@3@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@3@01) (< i1@3@01 (length<Int> a@1@01)))
      (and (<= 0 i2@3@01) (< i2@3@01 (length<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i1@3@01) (loc<Ref> a@1@01 i2@3@01)))
    (= i1@3@01 i2@3@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@3@01 Int)) (!
  (=>
    (and (<= 0 i@3@01) (< i@3@01 (length<Int> a@1@01)))
    (and
      (= (inv@4@01 (loc<Ref> a@1@01 i@3@01)) i@3@01)
      (img@5@01 (loc<Ref> a@1@01 i@3@01))))
  :pattern ((loc<Ref> a@1@01 i@3@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@5@01 r)
      (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@4@01 r)) r))
  :pattern ((inv@4@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@3@01 Int)) (!
  (=>
    (and (<= 0 i@3@01) (< i@3@01 (length<Int> a@1@01)))
    (not (= (loc<Ref> a@1@01 i@3@01) $Ref.null)))
  :pattern ((loc<Ref> a@1@01 i@3@01))
  :qid |val-permImpliesNonNull|)))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2))
(declare-const i@6@01 Int)
(push) ; 2
; [eval] 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] 0 <= i && i < length(a)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 1 | !(0 <= i@6@01) | live]
; [else-branch: 1 | 0 <= i@6@01 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= i@6@01)]
(assert (not (<= 0 i@6@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= i@6@01]
(assert (<= 0 i@6@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@6@01) (not (<= 0 i@6@01))))
(push) ; 3
; [then-branch: 2 | 0 <= i@6@01 && i@6@01 < length[Int](a@1@01) | live]
; [else-branch: 2 | !(0 <= i@6@01 && i@6@01 < length[Int](a@1@01)) | live]
(push) ; 4
; [then-branch: 2 | 0 <= i@6@01 && i@6@01 < length[Int](a@1@01)]
(assert (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(push) ; 5
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@6@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@6@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@6@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 3 | Lookup(val, First:($t@2@01), loc[Ref](a@1@01, i@6@01)) == 0 | live]
; [else-branch: 3 | Lookup(val, First:($t@2@01), loc[Ref](a@1@01, i@6@01)) != 0 | live]
(push) ; 6
; [then-branch: 3 | Lookup(val, First:($t@2@01), loc[Ref](a@1@01, i@6@01)) == 0]
(assert (=
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
  0))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | Lookup(val, First:($t@2@01), loc[Ref](a@1@01, i@6@01)) != 0]
(assert (not
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
    0)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@6@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@6@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@6@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 4 | Lookup(val, First:($t@2@01), loc[Ref](a@1@01, i@6@01)) == 1 | live]
; [else-branch: 4 | Lookup(val, First:($t@2@01), loc[Ref](a@1@01, i@6@01)) != 1 | live]
(push) ; 8
; [then-branch: 4 | Lookup(val, First:($t@2@01), loc[Ref](a@1@01, i@6@01)) == 1]
(assert (=
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
  1))
(pop) ; 8
(push) ; 8
; [else-branch: 4 | Lookup(val, First:($t@2@01), loc[Ref](a@1@01, i@6@01)) != 1]
(assert (not
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
    1)))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(push) ; 9
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@6@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@6@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@6@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
      1))
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
    1)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
      0))
  (and
    (not
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
        0))
    (or
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
          1))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
        1)))))
(assert (or
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
      0))
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
    0)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(0 <= i@6@01 && i@6@01 < length[Int](a@1@01))]
(assert (not (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01)))
  (and
    (<= 0 i@6@01)
    (< i@6@01 (length<Int> a@1@01))
    (=>
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
          0))
      (and
        (not
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
            0))
        (or
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
              1))
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
            1))))
    (or
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
          0))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
        0)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01))))
  (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@6@01 Int)) (!
  (and
    (or (<= 0 i@6@01) (not (<= 0 i@6@01)))
    (=>
      (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01)))
      (and
        (<= 0 i@6@01)
        (< i@6@01 (length<Int> a@1@01))
        (=>
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
              0))
          (and
            (not
              (=
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
                0))
            (or
              (not
                (=
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
                  1))
              (=
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
                1))))
        (or
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
              0))
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
            0))))
    (or
      (not (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01))))
      (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@14@12@14@126-aux|)))
(assert (forall ((i@6@01 Int)) (!
  (=>
    (and (<= 0 i@6@01) (< i@6@01 (length<Int> a@1@01)))
    (or
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
        0)
      (or
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
          1)
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) (loc<Ref> a@1@01 i@6@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@14@12@14@126|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(declare-const i$0@8@01 Int)
(push) ; 3
; [eval] 0 <= i$0 && i$0 < length(a)
; [eval] 0 <= i$0
(push) ; 4
; [then-branch: 5 | !(0 <= i$0@8@01) | live]
; [else-branch: 5 | 0 <= i$0@8@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i$0@8@01)]
(assert (not (<= 0 i$0@8@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i$0@8@01]
(assert (<= 0 i$0@8@01))
; [eval] i$0 < length(a)
; [eval] length(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$0@8@01) (not (<= 0 i$0@8@01))))
(assert (and (<= 0 i$0@8@01) (< i$0@8@01 (length<Int> a@1@01))))
; [eval] loc(a, i$0)
(pop) ; 3
(declare-fun inv@9@01 ($Ref) Int)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i$0@8@01 Int)) (!
  (=>
    (and (<= 0 i$0@8@01) (< i$0@8@01 (length<Int> a@1@01)))
    (or (<= 0 i$0@8@01) (not (<= 0 i$0@8@01))))
  :pattern ((loc<Ref> a@1@01 i$0@8@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i$01@8@01 Int) (i$02@8@01 Int)) (!
  (=>
    (and
      (and (<= 0 i$01@8@01) (< i$01@8@01 (length<Int> a@1@01)))
      (and (<= 0 i$02@8@01) (< i$02@8@01 (length<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i$01@8@01) (loc<Ref> a@1@01 i$02@8@01)))
    (= i$01@8@01 i$02@8@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$0@8@01 Int)) (!
  (=>
    (and (<= 0 i$0@8@01) (< i$0@8@01 (length<Int> a@1@01)))
    (and
      (= (inv@9@01 (loc<Ref> a@1@01 i$0@8@01)) i$0@8@01)
      (img@10@01 (loc<Ref> a@1@01 i$0@8@01))))
  :pattern ((loc<Ref> a@1@01 i$0@8@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@01 r)
      (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@9@01 r)) r))
  :pattern ((inv@9@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i$0@8@01 Int)) (!
  (=>
    (and (<= 0 i$0@8@01) (< i$0@8@01 (length<Int> a@1@01)))
    (not (= (loc<Ref> a@1@01 i$0@8@01) $Ref.null)))
  :pattern ((loc<Ref> a@1@01 i$0@8@01))
  :qid |val-permImpliesNonNull|)))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { loc(a, i), loc(a, j) } 0 <= i && (i < j && j < length(a)) ==> loc(a, i).val <= loc(a, j).val)
(declare-const i@11@01 Int)
(declare-const j@12@01 Int)
(push) ; 3
; [eval] 0 <= i && (i < j && j < length(a)) ==> loc(a, i).val <= loc(a, j).val
; [eval] 0 <= i && (i < j && j < length(a))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 6 | !(0 <= i@11@01) | live]
; [else-branch: 6 | 0 <= i@11@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 <= i@11@01)]
(assert (not (<= 0 i@11@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 <= i@11@01]
(assert (<= 0 i@11@01))
; [eval] i < j
(push) ; 6
; [then-branch: 7 | !(i@11@01 < j@12@01) | live]
; [else-branch: 7 | i@11@01 < j@12@01 | live]
(push) ; 7
; [then-branch: 7 | !(i@11@01 < j@12@01)]
(assert (not (< i@11@01 j@12@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | i@11@01 < j@12@01]
(assert (< i@11@01 j@12@01))
; [eval] j < length(a)
; [eval] length(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< i@11@01 j@12@01) (not (< i@11@01 j@12@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@11@01)
  (and (<= 0 i@11@01) (or (< i@11@01 j@12@01) (not (< i@11@01 j@12@01))))))
(assert (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
(push) ; 4
; [then-branch: 8 | 0 <= i@11@01 && i@11@01 < j@12@01 && j@12@01 < length[Int](a@1@01) | live]
; [else-branch: 8 | !(0 <= i@11@01 && i@11@01 < j@12@01 && j@12@01 < length[Int](a@1@01)) | live]
(push) ; 5
; [then-branch: 8 | 0 <= i@11@01 && i@11@01 < j@12@01 && j@12@01 < length[Int](a@1@01)]
(assert (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01)))))
; [eval] loc(a, i).val <= loc(a, j).val
; [eval] loc(a, i)
(push) ; 6
(assert (not (and
  (img@10@01 (loc<Ref> a@1@01 i@11@01))
  (and
    (<= 0 (inv@9@01 (loc<Ref> a@1@01 i@11@01)))
    (< (inv@9@01 (loc<Ref> a@1@01 i@11@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(push) ; 6
(assert (not (and
  (img@10@01 (loc<Ref> a@1@01 j@12@01))
  (and
    (<= 0 (inv@9@01 (loc<Ref> a@1@01 j@12@01)))
    (< (inv@9@01 (loc<Ref> a@1@01 j@12@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(0 <= i@11@01 && i@11@01 < j@12@01 && j@12@01 < length[Int](a@1@01))]
(assert (not
  (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01))))
  (and (<= 0 i@11@01) (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@11@01)
      (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01)))))
  (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (<= 0 i@11@01)
      (and (<= 0 i@11@01) (or (< i@11@01 j@12@01) (not (< i@11@01 j@12@01)))))
    (or (<= 0 i@11@01) (not (<= 0 i@11@01)))
    (=>
      (and
        (<= 0 i@11@01)
        (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01))))
      (and (<= 0 i@11@01) (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01))))
    (or
      (not
        (and
          (<= 0 i@11@01)
          (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01)))))
      (and
        (<= 0 i@11@01)
        (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01))))))
  :pattern ((loc<Ref> a@1@01 i@11@01) (loc<Ref> a@1@01 j@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@16@11@16@86-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (=>
    (and
      (<= 0 i@11@01)
      (and (< i@11@01 j@12@01) (< j@12@01 (length<Int> a@1@01))))
    (<=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@7@01)) (loc<Ref> a@1@01 i@11@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@7@01)) (loc<Ref> a@1@01 j@12@01))))
  :pattern ((loc<Ref> a@1@01 i@11@01) (loc<Ref> a@1@01 j@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@16@11@16@86|)))
(pop) ; 2
(push) ; 2
; [exec]
; var unsorted: Int
(declare-const unsorted@13@01 Int)
; [exec]
; var white: Int
(declare-const white@14@01 Int)
; [exec]
; var blue: Int
(declare-const blue@15@01 Int)
; [exec]
; unsorted := 0
; [exec]
; white := 0
; [exec]
; blue := length(a)
; [eval] length(a)
(declare-const blue@16@01 Int)
(assert (= blue@16@01 (length<Int> a@1@01)))
(declare-const tmp@17@01 Int)
(declare-const unsorted@18@01 Int)
(declare-const white@19@01 Int)
(declare-const blue@20@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(declare-const i$1@22@01 Int)
(push) ; 4
; [eval] 0 <= i$1 && i$1 < length(a)
; [eval] 0 <= i$1
(push) ; 5
; [then-branch: 9 | !(0 <= i$1@22@01) | live]
; [else-branch: 9 | 0 <= i$1@22@01 | live]
(push) ; 6
; [then-branch: 9 | !(0 <= i$1@22@01)]
(assert (not (<= 0 i$1@22@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | 0 <= i$1@22@01]
(assert (<= 0 i$1@22@01))
; [eval] i$1 < length(a)
; [eval] length(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$1@22@01) (not (<= 0 i$1@22@01))))
(assert (and (<= 0 i$1@22@01) (< i$1@22@01 (length<Int> a@1@01))))
; [eval] loc(a, i$1)
(pop) ; 4
(declare-fun inv@23@01 ($Ref) Int)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i$1@22@01 Int)) (!
  (=>
    (and (<= 0 i$1@22@01) (< i$1@22@01 (length<Int> a@1@01)))
    (or (<= 0 i$1@22@01) (not (<= 0 i$1@22@01))))
  :pattern ((loc<Ref> a@1@01 i$1@22@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i$11@22@01 Int) (i$12@22@01 Int)) (!
  (=>
    (and
      (and (<= 0 i$11@22@01) (< i$11@22@01 (length<Int> a@1@01)))
      (and (<= 0 i$12@22@01) (< i$12@22@01 (length<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i$11@22@01) (loc<Ref> a@1@01 i$12@22@01)))
    (= i$11@22@01 i$12@22@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$1@22@01 Int)) (!
  (=>
    (and (<= 0 i$1@22@01) (< i$1@22@01 (length<Int> a@1@01)))
    (and
      (= (inv@23@01 (loc<Ref> a@1@01 i$1@22@01)) i$1@22@01)
      (img@24@01 (loc<Ref> a@1@01 i$1@22@01))))
  :pattern ((loc<Ref> a@1@01 i$1@22@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@23@01 r)) r))
  :pattern ((inv@23@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i$1@22@01 Int)) (!
  (=>
    (and (<= 0 i$1@22@01) (< i$1@22@01 (length<Int> a@1@01)))
    (not (= (loc<Ref> a@1@01 i$1@22@01) $Ref.null)))
  :pattern ((loc<Ref> a@1@01 i$1@22@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.first ($Snap.second $t@21@01)) $Snap.unit))
; [eval] 0 <= white
(assert (<= 0 white@19@01))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@21@01))) $Snap.unit))
; [eval] white <= unsorted
(assert (<= white@19@01 unsorted@18@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
; [eval] unsorted <= blue
(assert (<= unsorted@18@01 blue@20@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
  $Snap.unit))
; [eval] blue <= length(a)
; [eval] length(a)
(assert (<= blue@20@01 (length<Int> a@1@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  $Snap.unit))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2))
(declare-const i@25@01 Int)
(push) ; 4
; [eval] 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] 0 <= i && i < length(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 10 | !(0 <= i@25@01) | live]
; [else-branch: 10 | 0 <= i@25@01 | live]
(push) ; 6
; [then-branch: 10 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
(push) ; 5
; [then-branch: 11 | 0 <= i@25@01 && i@25@01 < length[Int](a@1@01) | live]
; [else-branch: 11 | !(0 <= i@25@01 && i@25@01 < length[Int](a@1@01)) | live]
(push) ; 6
; [then-branch: 11 | 0 <= i@25@01 && i@25@01 < length[Int](a@1@01)]
(assert (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@25@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@25@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@25@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 12 | Lookup(val, First:($t@21@01), loc[Ref](a@1@01, i@25@01)) == 0 | live]
; [else-branch: 12 | Lookup(val, First:($t@21@01), loc[Ref](a@1@01, i@25@01)) != 0 | live]
(push) ; 8
; [then-branch: 12 | Lookup(val, First:($t@21@01), loc[Ref](a@1@01, i@25@01)) == 0]
(assert (=
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
  0))
(pop) ; 8
(push) ; 8
; [else-branch: 12 | Lookup(val, First:($t@21@01), loc[Ref](a@1@01, i@25@01)) != 0]
(assert (not
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
    0)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(push) ; 9
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@25@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@25@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@25@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
; [then-branch: 13 | Lookup(val, First:($t@21@01), loc[Ref](a@1@01, i@25@01)) == 1 | live]
; [else-branch: 13 | Lookup(val, First:($t@21@01), loc[Ref](a@1@01, i@25@01)) != 1 | live]
(push) ; 10
; [then-branch: 13 | Lookup(val, First:($t@21@01), loc[Ref](a@1@01, i@25@01)) == 1]
(assert (=
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
  1))
(pop) ; 10
(push) ; 10
; [else-branch: 13 | Lookup(val, First:($t@21@01), loc[Ref](a@1@01, i@25@01)) != 1]
(assert (not
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
    1)))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(push) ; 11
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@25@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@25@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@25@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
      1))
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
    1)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
      0))
  (and
    (not
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
        0))
    (or
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
          1))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
        1)))))
(assert (or
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
      0))
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(0 <= i@25@01 && i@25@01 < length[Int](a@1@01))]
(assert (not (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))
  (and
    (<= 0 i@25@01)
    (< i@25@01 (length<Int> a@1@01))
    (=>
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
          0))
      (and
        (not
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
            0))
        (or
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
              1))
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
            1))))
    (or
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
          0))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
        0)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01))))
  (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@25@01 Int)) (!
  (and
    (or (<= 0 i@25@01) (not (<= 0 i@25@01)))
    (=>
      (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))
      (and
        (<= 0 i@25@01)
        (< i@25@01 (length<Int> a@1@01))
        (=>
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
              0))
          (and
            (not
              (=
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
                0))
            (or
              (not
                (=
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
                  1))
              (=
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
                1))))
        (or
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
              0))
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
            0))))
    (or
      (not (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01))))
      (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127-aux|)))
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))
    (or
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
        0)
      (or
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
          1)
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
  $Snap.unit))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < white ==> loc(a, i).val == 0)
(declare-const i@26@01 Int)
(push) ; 4
; [eval] 0 <= i && i < white ==> loc(a, i).val == 0
; [eval] 0 <= i && i < white
; [eval] 0 <= i
(push) ; 5
; [then-branch: 14 | !(0 <= i@26@01) | live]
; [else-branch: 14 | 0 <= i@26@01 | live]
(push) ; 6
; [then-branch: 14 | !(0 <= i@26@01)]
(assert (not (<= 0 i@26@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | 0 <= i@26@01]
(assert (<= 0 i@26@01))
; [eval] i < white
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@26@01) (not (<= 0 i@26@01))))
(push) ; 5
; [then-branch: 15 | 0 <= i@26@01 && i@26@01 < white@19@01 | live]
; [else-branch: 15 | !(0 <= i@26@01 && i@26@01 < white@19@01) | live]
(push) ; 6
; [then-branch: 15 | 0 <= i@26@01 && i@26@01 < white@19@01]
(assert (and (<= 0 i@26@01) (< i@26@01 white@19@01)))
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@26@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@26@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@26@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(0 <= i@26@01 && i@26@01 < white@19@01)]
(assert (not (and (<= 0 i@26@01) (< i@26@01 white@19@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@26@01) (< i@26@01 white@19@01)))
  (and (<= 0 i@26@01) (< i@26@01 white@19@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int)) (!
  (and
    (or (<= 0 i@26@01) (not (<= 0 i@26@01)))
    (or
      (not (and (<= 0 i@26@01) (< i@26@01 white@19@01)))
      (and (<= 0 i@26@01) (< i@26@01 white@19@01))))
  :pattern ((loc<Ref> a@1@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73-aux|)))
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (<= 0 i@26@01) (< i@26@01 white@19@01))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@26@01))
      0))
  :pattern ((loc<Ref> a@1@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { loc(a, i) } white <= i && i < unsorted ==> loc(a, i).val == 1)
(declare-const i@27@01 Int)
(push) ; 4
; [eval] white <= i && i < unsorted ==> loc(a, i).val == 1
; [eval] white <= i && i < unsorted
; [eval] white <= i
(push) ; 5
; [then-branch: 16 | !(white@19@01 <= i@27@01) | live]
; [else-branch: 16 | white@19@01 <= i@27@01 | live]
(push) ; 6
; [then-branch: 16 | !(white@19@01 <= i@27@01)]
(assert (not (<= white@19@01 i@27@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | white@19@01 <= i@27@01]
(assert (<= white@19@01 i@27@01))
; [eval] i < unsorted
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= white@19@01 i@27@01) (not (<= white@19@01 i@27@01))))
(push) ; 5
; [then-branch: 17 | white@19@01 <= i@27@01 && i@27@01 < unsorted@18@01 | live]
; [else-branch: 17 | !(white@19@01 <= i@27@01 && i@27@01 < unsorted@18@01) | live]
(push) ; 6
; [then-branch: 17 | white@19@01 <= i@27@01 && i@27@01 < unsorted@18@01]
(assert (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@27@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@27@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@27@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 17 | !(white@19@01 <= i@27@01 && i@27@01 < unsorted@18@01)]
(assert (not (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01)))
  (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@27@01 Int)) (!
  (and
    (or (<= white@19@01 i@27@01) (not (<= white@19@01 i@27@01)))
    (or
      (not (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01)))
      (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01))))
  :pattern ((loc<Ref> a@1@01 i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82-aux|)))
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@27@01))
      1))
  :pattern ((loc<Ref> a@1@01 i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { loc(a, i) } blue <= i && i < length(a) ==> loc(a, i).val == 2)
(declare-const i@28@01 Int)
(push) ; 4
; [eval] blue <= i && i < length(a) ==> loc(a, i).val == 2
; [eval] blue <= i && i < length(a)
; [eval] blue <= i
(push) ; 5
; [then-branch: 18 | !(blue@20@01 <= i@28@01) | live]
; [else-branch: 18 | blue@20@01 <= i@28@01 | live]
(push) ; 6
; [then-branch: 18 | !(blue@20@01 <= i@28@01)]
(assert (not (<= blue@20@01 i@28@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | blue@20@01 <= i@28@01]
(assert (<= blue@20@01 i@28@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= blue@20@01 i@28@01) (not (<= blue@20@01 i@28@01))))
(push) ; 5
; [then-branch: 19 | blue@20@01 <= i@28@01 && i@28@01 < length[Int](a@1@01) | live]
; [else-branch: 19 | !(blue@20@01 <= i@28@01 && i@28@01 < length[Int](a@1@01)) | live]
(push) ; 6
; [then-branch: 19 | blue@20@01 <= i@28@01 && i@28@01 < length[Int](a@1@01)]
(assert (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@28@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@28@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@28@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 19 | !(blue@20@01 <= i@28@01 && i@28@01 < length[Int](a@1@01))]
(assert (not (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01))))
  (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@28@01 Int)) (!
  (and
    (or (<= blue@20@01 i@28@01) (not (<= blue@20@01 i@28@01)))
    (or
      (not (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01))))
      (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81-aux|)))
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@28@01))
      2))
  :pattern ((loc<Ref> a@1@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(declare-const i$1@29@01 Int)
(push) ; 4
; [eval] 0 <= i$1 && i$1 < length(a)
; [eval] 0 <= i$1
(push) ; 5
; [then-branch: 20 | !(0 <= i$1@29@01) | live]
; [else-branch: 20 | 0 <= i$1@29@01 | live]
(push) ; 6
; [then-branch: 20 | !(0 <= i$1@29@01)]
(assert (not (<= 0 i$1@29@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 20 | 0 <= i$1@29@01]
(assert (<= 0 i$1@29@01))
; [eval] i$1 < length(a)
; [eval] length(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$1@29@01) (not (<= 0 i$1@29@01))))
(assert (and (<= 0 i$1@29@01) (< i$1@29@01 (length<Int> a@1@01))))
; [eval] loc(a, i$1)
(pop) ; 4
(declare-fun inv@30@01 ($Ref) Int)
(declare-fun img@31@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i$1@29@01 Int)) (!
  (=>
    (and (<= 0 i$1@29@01) (< i$1@29@01 (length<Int> a@1@01)))
    (or (<= 0 i$1@29@01) (not (<= 0 i$1@29@01))))
  :pattern ((loc<Ref> a@1@01 i$1@29@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i$11@29@01 Int) (i$12@29@01 Int)) (!
  (=>
    (and
      (and (<= 0 i$11@29@01) (< i$11@29@01 (length<Int> a@1@01)))
      (and (<= 0 i$12@29@01) (< i$12@29@01 (length<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i$11@29@01) (loc<Ref> a@1@01 i$12@29@01)))
    (= i$11@29@01 i$12@29@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$1@29@01 Int)) (!
  (=>
    (and (<= 0 i$1@29@01) (< i$1@29@01 (length<Int> a@1@01)))
    (and
      (= (inv@30@01 (loc<Ref> a@1@01 i$1@29@01)) i$1@29@01)
      (img@31@01 (loc<Ref> a@1@01 i$1@29@01))))
  :pattern ((loc<Ref> a@1@01 i$1@29@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@01 r)
      (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@32@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (length<Int> a@1@01)))
      (img@31@01 r)
      (= r (loc<Ref> a@1@01 (inv@30@01 r))))
    ($Perm.min
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (length<Int> a@1@01))))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (length<Int> a@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@32@01 r))
    $Perm.No)
  
  :qid |quant-u-8|))))
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
      (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (length<Int> a@1@01)))
      (img@31@01 r)
      (= r (loc<Ref> a@1@01 (inv@30@01 r))))
    (= (- $Perm.Write (pTaken@32@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@33@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@5@01 r)
      (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (length<Int> a@1@01))))
    (=
      ($FVF.lookup_val (as sm@33@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) r)))
  :pattern (($FVF.lookup_val (as sm@33@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@2@01)) r))
  :qid |qp.fvfValDef0|)))
; [eval] 0 <= white
; [eval] white <= unsorted
; [eval] unsorted <= blue
(set-option :timeout 0)
(push) ; 4
(assert (not (<= 0 blue@16@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 blue@16@01))
; [eval] blue <= length(a)
; [eval] length(a)
(push) ; 4
(assert (not (<= blue@16@01 (length<Int> a@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= blue@16@01 (length<Int> a@1@01)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2))
(declare-const i@34@01 Int)
(push) ; 4
; [eval] 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] 0 <= i && i < length(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 21 | !(0 <= i@34@01) | live]
; [else-branch: 21 | 0 <= i@34@01 | live]
(push) ; 6
; [then-branch: 21 | !(0 <= i@34@01)]
(assert (not (<= 0 i@34@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 21 | 0 <= i@34@01]
(assert (<= 0 i@34@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@34@01) (not (<= 0 i@34@01))))
(push) ; 5
; [then-branch: 22 | 0 <= i@34@01 && i@34@01 < length[Int](a@1@01) | live]
; [else-branch: 22 | !(0 <= i@34@01 && i@34@01 < length[Int](a@1@01)) | live]
(push) ; 6
; [then-branch: 22 | 0 <= i@34@01 && i@34@01 < length[Int](a@1@01)]
(assert (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@34@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@34@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@34@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 23 | Lookup(val, sm@33@01, loc[Ref](a@1@01, i@34@01)) == 0 | live]
; [else-branch: 23 | Lookup(val, sm@33@01, loc[Ref](a@1@01, i@34@01)) != 0 | live]
(push) ; 8
; [then-branch: 23 | Lookup(val, sm@33@01, loc[Ref](a@1@01, i@34@01)) == 0]
(assert (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | Lookup(val, sm@33@01, loc[Ref](a@1@01, i@34@01)) != 0]
(assert (not (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(push) ; 9
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@34@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@34@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@34@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
; [then-branch: 24 | Lookup(val, sm@33@01, loc[Ref](a@1@01, i@34@01)) == 1 | live]
; [else-branch: 24 | Lookup(val, sm@33@01, loc[Ref](a@1@01, i@34@01)) != 1 | live]
(push) ; 10
; [then-branch: 24 | Lookup(val, sm@33@01, loc[Ref](a@1@01, i@34@01)) == 1]
(assert (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 1))
(pop) ; 10
(push) ; 10
; [else-branch: 24 | Lookup(val, sm@33@01, loc[Ref](a@1@01, i@34@01)) != 1]
(assert (not (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 1)))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(push) ; 11
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@34@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@34@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@34@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 1))
  (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 1)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0))
  (and
    (not
      (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0))
    (or
      (not
        (=
          ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
          1))
      (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 1)))))
(assert (or
  (not
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0))
  (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(0 <= i@34@01 && i@34@01 < length[Int](a@1@01))]
(assert (not (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01)))
  (and
    (<= 0 i@34@01)
    (< i@34@01 (length<Int> a@1@01))
    (=>
      (not
        (=
          ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
          0))
      (and
        (not
          (=
            ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
            0))
        (or
          (not
            (=
              ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
              1))
          (=
            ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
            1))))
    (or
      (not
        (=
          ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
          0))
      (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01))))
  (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@34@01 Int)) (!
  (and
    (or (<= 0 i@34@01) (not (<= 0 i@34@01)))
    (=>
      (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01)))
      (and
        (<= 0 i@34@01)
        (< i@34@01 (length<Int> a@1@01))
        (=>
          (not
            (=
              ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
              0))
          (and
            (not
              (=
                ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
                0))
            (or
              (not
                (=
                  ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
                  1))
              (=
                ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
                1))))
        (or
          (not
            (=
              ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
              0))
          (=
            ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
            0))))
    (or
      (not (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01))))
      (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@34@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127-aux|)))
(push) ; 4
(assert (not (forall ((i@34@01 Int)) (!
  (=>
    (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01)))
    (or
      (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0)
      (or
        (=
          ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
          1)
        (=
          ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@34@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@34@01 Int)) (!
  (=>
    (and (<= 0 i@34@01) (< i@34@01 (length<Int> a@1@01)))
    (or
      (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01)) 0)
      (or
        (=
          ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
          1)
        (=
          ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@34@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@34@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < white ==> loc(a, i).val == 0)
(declare-const i@35@01 Int)
(push) ; 4
; [eval] 0 <= i && i < white ==> loc(a, i).val == 0
; [eval] 0 <= i && i < white
; [eval] 0 <= i
(push) ; 5
; [then-branch: 25 | !(0 <= i@35@01) | live]
; [else-branch: 25 | 0 <= i@35@01 | live]
(push) ; 6
; [then-branch: 25 | !(0 <= i@35@01)]
(assert (not (<= 0 i@35@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | 0 <= i@35@01]
(assert (<= 0 i@35@01))
; [eval] i < white
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@35@01) (not (<= 0 i@35@01))))
(push) ; 5
; [then-branch: 26 | 0 <= i@35@01 && i@35@01 < 0 | live]
; [else-branch: 26 | !(0 <= i@35@01 && i@35@01 < 0) | live]
(push) ; 6
; [then-branch: 26 | 0 <= i@35@01 && i@35@01 < 0]
(assert (and (<= 0 i@35@01) (< i@35@01 0)))
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@35@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@35@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@35@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 26 | !(0 <= i@35@01 && i@35@01 < 0)]
(assert (not (and (<= 0 i@35@01) (< i@35@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (and (<= 0 i@35@01) (< i@35@01 0))) (and (<= 0 i@35@01) (< i@35@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@35@01 Int)) (!
  (and
    (or (<= 0 i@35@01) (not (<= 0 i@35@01)))
    (or
      (not (and (<= 0 i@35@01) (< i@35@01 0)))
      (and (<= 0 i@35@01) (< i@35@01 0))))
  :pattern ((loc<Ref> a@1@01 i@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73-aux|)))
(push) ; 4
(assert (not (forall ((i@35@01 Int)) (!
  (=>
    (and (<= 0 i@35@01) (< i@35@01 0))
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@35@01)) 0))
  :pattern ((loc<Ref> a@1@01 i@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (<= 0 i@35@01) (< i@35@01 0))
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@35@01)) 0))
  :pattern ((loc<Ref> a@1@01 i@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|)))
; [eval] (forall i: Int :: { loc(a, i) } white <= i && i < unsorted ==> loc(a, i).val == 1)
(declare-const i@36@01 Int)
(push) ; 4
; [eval] white <= i && i < unsorted ==> loc(a, i).val == 1
; [eval] white <= i && i < unsorted
; [eval] white <= i
(push) ; 5
; [then-branch: 27 | !(0 <= i@36@01) | live]
; [else-branch: 27 | 0 <= i@36@01 | live]
(push) ; 6
; [then-branch: 27 | !(0 <= i@36@01)]
(assert (not (<= 0 i@36@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | 0 <= i@36@01]
(assert (<= 0 i@36@01))
; [eval] i < unsorted
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@36@01) (not (<= 0 i@36@01))))
(push) ; 5
; [then-branch: 28 | 0 <= i@36@01 && i@36@01 < 0 | live]
; [else-branch: 28 | !(0 <= i@36@01 && i@36@01 < 0) | live]
(push) ; 6
; [then-branch: 28 | 0 <= i@36@01 && i@36@01 < 0]
(assert (and (<= 0 i@36@01) (< i@36@01 0)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@36@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@36@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@36@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 28 | !(0 <= i@36@01 && i@36@01 < 0)]
(assert (not (and (<= 0 i@36@01) (< i@36@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (and (<= 0 i@36@01) (< i@36@01 0))) (and (<= 0 i@36@01) (< i@36@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@36@01 Int)) (!
  (and
    (or (<= 0 i@36@01) (not (<= 0 i@36@01)))
    (or
      (not (and (<= 0 i@36@01) (< i@36@01 0)))
      (and (<= 0 i@36@01) (< i@36@01 0))))
  :pattern ((loc<Ref> a@1@01 i@36@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82-aux|)))
(push) ; 4
(assert (not (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 0 i@36@01) (< i@36@01 0))
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@36@01)) 1))
  :pattern ((loc<Ref> a@1@01 i@36@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 0 i@36@01) (< i@36@01 0))
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@36@01)) 1))
  :pattern ((loc<Ref> a@1@01 i@36@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|)))
; [eval] (forall i: Int :: { loc(a, i) } blue <= i && i < length(a) ==> loc(a, i).val == 2)
(declare-const i@37@01 Int)
(push) ; 4
; [eval] blue <= i && i < length(a) ==> loc(a, i).val == 2
; [eval] blue <= i && i < length(a)
; [eval] blue <= i
(push) ; 5
; [then-branch: 29 | !(blue@16@01 <= i@37@01) | live]
; [else-branch: 29 | blue@16@01 <= i@37@01 | live]
(push) ; 6
; [then-branch: 29 | !(blue@16@01 <= i@37@01)]
(assert (not (<= blue@16@01 i@37@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 29 | blue@16@01 <= i@37@01]
(assert (<= blue@16@01 i@37@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= blue@16@01 i@37@01) (not (<= blue@16@01 i@37@01))))
(push) ; 5
; [then-branch: 30 | blue@16@01 <= i@37@01 && i@37@01 < length[Int](a@1@01) | live]
; [else-branch: 30 | !(blue@16@01 <= i@37@01 && i@37@01 < length[Int](a@1@01)) | live]
(push) ; 6
; [then-branch: 30 | blue@16@01 <= i@37@01 && i@37@01 < length[Int](a@1@01)]
(assert (and (<= blue@16@01 i@37@01) (< i@37@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(push) ; 7
(assert (not (and
  (img@5@01 (loc<Ref> a@1@01 i@37@01))
  (and
    (<= 0 (inv@4@01 (loc<Ref> a@1@01 i@37@01)))
    (< (inv@4@01 (loc<Ref> a@1@01 i@37@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 30 | !(blue@16@01 <= i@37@01 && i@37@01 < length[Int](a@1@01))]
(assert (not (and (<= blue@16@01 i@37@01) (< i@37@01 (length<Int> a@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= blue@16@01 i@37@01) (< i@37@01 (length<Int> a@1@01))))
  (and (<= blue@16@01 i@37@01) (< i@37@01 (length<Int> a@1@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@37@01 Int)) (!
  (and
    (or (<= blue@16@01 i@37@01) (not (<= blue@16@01 i@37@01)))
    (or
      (not (and (<= blue@16@01 i@37@01) (< i@37@01 (length<Int> a@1@01))))
      (and (<= blue@16@01 i@37@01) (< i@37@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81-aux|)))
(push) ; 4
(assert (not (forall ((i@37@01 Int)) (!
  (=>
    (and (<= blue@16@01 i@37@01) (< i@37@01 (length<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@37@01)) 2))
  :pattern ((loc<Ref> a@1@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (<= blue@16@01 i@37@01) (< i@37@01 (length<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@33@01  $FVF<val>) (loc<Ref> a@1@01 i@37@01)) 2))
  :pattern ((loc<Ref> a@1@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@23@01 r)) r))
  :pattern ((inv@23@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((i$1@22@01 Int)) (!
  (=>
    (and (<= 0 i$1@22@01) (< i$1@22@01 (length<Int> a@1@01)))
    (and
      (= (inv@23@01 (loc<Ref> a@1@01 i$1@22@01)) i$1@22@01)
      (img@24@01 (loc<Ref> a@1@01 i$1@22@01))))
  :pattern ((loc<Ref> a@1@01 i$1@22@01))
  :qid |quant-u-5|)))
(assert (forall ((i$1@22@01 Int)) (!
  (=>
    (and (<= 0 i$1@22@01) (< i$1@22@01 (length<Int> a@1@01)))
    (not (= (loc<Ref> a@1@01 i$1@22@01) $Ref.null)))
  :pattern ((loc<Ref> a@1@01 i$1@22@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.first ($Snap.second $t@21@01)) $Snap.unit))
(assert (<= 0 white@19@01))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@21@01))) $Snap.unit))
(assert (<= white@19@01 unsorted@18@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
(assert (<= unsorted@18@01 blue@20@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
  $Snap.unit))
(assert (<= blue@20@01 (length<Int> a@1@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  $Snap.unit))
(assert (forall ((i@25@01 Int)) (!
  (and
    (or (<= 0 i@25@01) (not (<= 0 i@25@01)))
    (=>
      (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))
      (and
        (<= 0 i@25@01)
        (< i@25@01 (length<Int> a@1@01))
        (=>
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
              0))
          (and
            (not
              (=
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
                0))
            (or
              (not
                (=
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
                  1))
              (=
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
                1))))
        (or
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
              0))
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
            0))))
    (or
      (not (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01))))
      (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127-aux|)))
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (length<Int> a@1@01)))
    (or
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
        0)
      (or
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
          1)
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@25@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
  $Snap.unit))
(assert (forall ((i@26@01 Int)) (!
  (and
    (or (<= 0 i@26@01) (not (<= 0 i@26@01)))
    (or
      (not (and (<= 0 i@26@01) (< i@26@01 white@19@01)))
      (and (<= 0 i@26@01) (< i@26@01 white@19@01))))
  :pattern ((loc<Ref> a@1@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73-aux|)))
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (<= 0 i@26@01) (< i@26@01 white@19@01))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@26@01))
      0))
  :pattern ((loc<Ref> a@1@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
  $Snap.unit))
(assert (forall ((i@27@01 Int)) (!
  (and
    (or (<= white@19@01 i@27@01) (not (<= white@19@01 i@27@01)))
    (or
      (not (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01)))
      (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01))))
  :pattern ((loc<Ref> a@1@01 i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82-aux|)))
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= white@19@01 i@27@01) (< i@27@01 unsorted@18@01))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@27@01))
      1))
  :pattern ((loc<Ref> a@1@01 i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
  $Snap.unit))
(assert (forall ((i@28@01 Int)) (!
  (and
    (or (<= blue@20@01 i@28@01) (not (<= blue@20@01 i@28@01)))
    (or
      (not (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01))))
      (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81-aux|)))
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= blue@20@01 i@28@01) (< i@28@01 (length<Int> a@1@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 i@28@01))
      2))
  :pattern ((loc<Ref> a@1@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|)))
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (forall ((i$1@22@01 Int)) (!
  (=>
    (and (<= 0 i$1@22@01) (< i$1@22@01 (length<Int> a@1@01)))
    (or (<= 0 i$1@22@01) (not (<= 0 i$1@22@01))))
  :pattern ((loc<Ref> a@1@01 i$1@22@01))
  :qid |val-aux|)))
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
; [eval] unsorted < blue
(pop) ; 5
(push) ; 5
; [eval] !(unsorted < blue)
; [eval] unsorted < blue
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] unsorted < blue
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< unsorted@18@01 blue@20@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< unsorted@18@01 blue@20@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | unsorted@18@01 < blue@20@01 | live]
; [else-branch: 31 | !(unsorted@18@01 < blue@20@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 31 | unsorted@18@01 < blue@20@01]
(assert (< unsorted@18@01 blue@20@01))
; [exec]
; var tmp: Int
(declare-const tmp@38@01 Int)
; [exec]
; tmp := loc(a, unsorted).val
; [eval] loc(a, unsorted)
(push) ; 6
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 unsorted@18@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 unsorted@18@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 unsorted@18@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const tmp@39@01 Int)
(assert (=
  tmp@39@01
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 unsorted@18@01))))
; [eval] tmp == 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= tmp@39@01 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= tmp@39@01 1)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | tmp@39@01 == 1 | live]
; [else-branch: 32 | tmp@39@01 != 1 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 32 | tmp@39@01 == 1]
(assert (= tmp@39@01 1))
; [exec]
; unsorted := unsorted + 1
; [eval] unsorted + 1
(declare-const unsorted@40@01 Int)
(assert (= unsorted@40@01 (+ unsorted@18@01 1)))
; Loop head block: Re-establish invariant
(declare-const i$1@41@01 Int)
(push) ; 7
; [eval] 0 <= i$1 && i$1 < length(a)
; [eval] 0 <= i$1
(push) ; 8
; [then-branch: 33 | !(0 <= i$1@41@01) | live]
; [else-branch: 33 | 0 <= i$1@41@01 | live]
(push) ; 9
; [then-branch: 33 | !(0 <= i$1@41@01)]
(assert (not (<= 0 i$1@41@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 33 | 0 <= i$1@41@01]
(assert (<= 0 i$1@41@01))
; [eval] i$1 < length(a)
; [eval] length(a)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$1@41@01) (not (<= 0 i$1@41@01))))
(assert (and (<= 0 i$1@41@01) (< i$1@41@01 (length<Int> a@1@01))))
; [eval] loc(a, i$1)
(pop) ; 7
(declare-fun inv@42@01 ($Ref) Int)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i$1@41@01 Int)) (!
  (=>
    (and (<= 0 i$1@41@01) (< i$1@41@01 (length<Int> a@1@01)))
    (or (<= 0 i$1@41@01) (not (<= 0 i$1@41@01))))
  :pattern ((loc<Ref> a@1@01 i$1@41@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((i$11@41@01 Int) (i$12@41@01 Int)) (!
  (=>
    (and
      (and (<= 0 i$11@41@01) (< i$11@41@01 (length<Int> a@1@01)))
      (and (<= 0 i$12@41@01) (< i$12@41@01 (length<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i$11@41@01) (loc<Ref> a@1@01 i$12@41@01)))
    (= i$11@41@01 i$12@41@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$1@41@01 Int)) (!
  (=>
    (and (<= 0 i$1@41@01) (< i$1@41@01 (length<Int> a@1@01)))
    (and
      (= (inv@42@01 (loc<Ref> a@1@01 i$1@41@01)) i$1@41@01)
      (img@43@01 (loc<Ref> a@1@01 i$1@41@01))))
  :pattern ((loc<Ref> a@1@01 i$1@41@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@01 r)
      (and (<= 0 (inv@42@01 r)) (< (inv@42@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@42@01 r)) r))
  :pattern ((inv@42@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@44@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@42@01 r)) (< (inv@42@01 r) (length<Int> a@1@01)))
      (img@43@01 r)
      (= r (loc<Ref> a@1@01 (inv@42@01 r))))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@44@01 r))
    $Perm.No)
  
  :qid |quant-u-12|))))
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
      (and (<= 0 (inv@42@01 r)) (< (inv@42@01 r) (length<Int> a@1@01)))
      (img@43@01 r)
      (= r (loc<Ref> a@1@01 (inv@42@01 r))))
    (= (- $Perm.Write (pTaken@44@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@45@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef1|)))
; [eval] 0 <= white
; [eval] white <= unsorted
(set-option :timeout 0)
(push) ; 7
(assert (not (<= white@19@01 unsorted@40@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= white@19@01 unsorted@40@01))
; [eval] unsorted <= blue
(push) ; 7
(assert (not (<= unsorted@40@01 blue@20@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= unsorted@40@01 blue@20@01))
; [eval] blue <= length(a)
; [eval] length(a)
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2))
(declare-const i@46@01 Int)
(push) ; 7
; [eval] 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] 0 <= i && i < length(a)
; [eval] 0 <= i
(push) ; 8
; [then-branch: 34 | !(0 <= i@46@01) | live]
; [else-branch: 34 | 0 <= i@46@01 | live]
(push) ; 9
; [then-branch: 34 | !(0 <= i@46@01)]
(assert (not (<= 0 i@46@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 34 | 0 <= i@46@01]
(assert (<= 0 i@46@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@46@01) (not (<= 0 i@46@01))))
(push) ; 8
; [then-branch: 35 | 0 <= i@46@01 && i@46@01 < length[Int](a@1@01) | live]
; [else-branch: 35 | !(0 <= i@46@01 && i@46@01 < length[Int](a@1@01)) | live]
(push) ; 9
; [then-branch: 35 | 0 <= i@46@01 && i@46@01 < length[Int](a@1@01)]
(assert (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(push) ; 10
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@46@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@46@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@46@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 36 | Lookup(val, sm@45@01, loc[Ref](a@1@01, i@46@01)) == 0 | live]
; [else-branch: 36 | Lookup(val, sm@45@01, loc[Ref](a@1@01, i@46@01)) != 0 | live]
(push) ; 11
; [then-branch: 36 | Lookup(val, sm@45@01, loc[Ref](a@1@01, i@46@01)) == 0]
(assert (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0))
(pop) ; 11
(push) ; 11
; [else-branch: 36 | Lookup(val, sm@45@01, loc[Ref](a@1@01, i@46@01)) != 0]
(assert (not (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(push) ; 12
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@46@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@46@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@46@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(push) ; 12
; [then-branch: 37 | Lookup(val, sm@45@01, loc[Ref](a@1@01, i@46@01)) == 1 | live]
; [else-branch: 37 | Lookup(val, sm@45@01, loc[Ref](a@1@01, i@46@01)) != 1 | live]
(push) ; 13
; [then-branch: 37 | Lookup(val, sm@45@01, loc[Ref](a@1@01, i@46@01)) == 1]
(assert (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 1))
(pop) ; 13
(push) ; 13
; [else-branch: 37 | Lookup(val, sm@45@01, loc[Ref](a@1@01, i@46@01)) != 1]
(assert (not (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 1)))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(push) ; 14
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@46@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@46@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@46@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 1))
  (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 1)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0))
  (and
    (not
      (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0))
    (or
      (not
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
          1))
      (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 1)))))
(assert (or
  (not
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0))
  (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 35 | !(0 <= i@46@01 && i@46@01 < length[Int](a@1@01))]
(assert (not (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01)))
  (and
    (<= 0 i@46@01)
    (< i@46@01 (length<Int> a@1@01))
    (=>
      (not
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
          0))
      (and
        (not
          (=
            ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
            0))
        (or
          (not
            (=
              ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
              1))
          (=
            ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
            1))))
    (or
      (not
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
          0))
      (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01))))
  (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@46@01 Int)) (!
  (and
    (or (<= 0 i@46@01) (not (<= 0 i@46@01)))
    (=>
      (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01)))
      (and
        (<= 0 i@46@01)
        (< i@46@01 (length<Int> a@1@01))
        (=>
          (not
            (=
              ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
              0))
          (and
            (not
              (=
                ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
                0))
            (or
              (not
                (=
                  ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
                  1))
              (=
                ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
                1))))
        (or
          (not
            (=
              ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
              0))
          (=
            ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
            0))))
    (or
      (not (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01))))
      (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127-aux|)))
(push) ; 7
(assert (not (forall ((i@46@01 Int)) (!
  (=>
    (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01)))
    (or
      (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0)
      (or
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
          1)
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@46@01 Int)) (!
  (=>
    (and (<= 0 i@46@01) (< i@46@01 (length<Int> a@1@01)))
    (or
      (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01)) 0)
      (or
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
          1)
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@46@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < white ==> loc(a, i).val == 0)
(declare-const i@47@01 Int)
(push) ; 7
; [eval] 0 <= i && i < white ==> loc(a, i).val == 0
; [eval] 0 <= i && i < white
; [eval] 0 <= i
(push) ; 8
; [then-branch: 38 | !(0 <= i@47@01) | live]
; [else-branch: 38 | 0 <= i@47@01 | live]
(push) ; 9
; [then-branch: 38 | !(0 <= i@47@01)]
(assert (not (<= 0 i@47@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 38 | 0 <= i@47@01]
(assert (<= 0 i@47@01))
; [eval] i < white
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@47@01) (not (<= 0 i@47@01))))
(push) ; 8
; [then-branch: 39 | 0 <= i@47@01 && i@47@01 < white@19@01 | live]
; [else-branch: 39 | !(0 <= i@47@01 && i@47@01 < white@19@01) | live]
(push) ; 9
; [then-branch: 39 | 0 <= i@47@01 && i@47@01 < white@19@01]
(assert (and (<= 0 i@47@01) (< i@47@01 white@19@01)))
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(push) ; 10
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@47@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@47@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@47@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 39 | !(0 <= i@47@01 && i@47@01 < white@19@01)]
(assert (not (and (<= 0 i@47@01) (< i@47@01 white@19@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@47@01) (< i@47@01 white@19@01)))
  (and (<= 0 i@47@01) (< i@47@01 white@19@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@47@01 Int)) (!
  (and
    (or (<= 0 i@47@01) (not (<= 0 i@47@01)))
    (or
      (not (and (<= 0 i@47@01) (< i@47@01 white@19@01)))
      (and (<= 0 i@47@01) (< i@47@01 white@19@01))))
  :pattern ((loc<Ref> a@1@01 i@47@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73-aux|)))
(push) ; 7
(assert (not (forall ((i@47@01 Int)) (!
  (=>
    (and (<= 0 i@47@01) (< i@47@01 white@19@01))
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@47@01)) 0))
  :pattern ((loc<Ref> a@1@01 i@47@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and (<= 0 i@47@01) (< i@47@01 white@19@01))
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@47@01)) 0))
  :pattern ((loc<Ref> a@1@01 i@47@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|)))
; [eval] (forall i: Int :: { loc(a, i) } white <= i && i < unsorted ==> loc(a, i).val == 1)
(declare-const i@48@01 Int)
(push) ; 7
; [eval] white <= i && i < unsorted ==> loc(a, i).val == 1
; [eval] white <= i && i < unsorted
; [eval] white <= i
(push) ; 8
; [then-branch: 40 | !(white@19@01 <= i@48@01) | live]
; [else-branch: 40 | white@19@01 <= i@48@01 | live]
(push) ; 9
; [then-branch: 40 | !(white@19@01 <= i@48@01)]
(assert (not (<= white@19@01 i@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 40 | white@19@01 <= i@48@01]
(assert (<= white@19@01 i@48@01))
; [eval] i < unsorted
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= white@19@01 i@48@01) (not (<= white@19@01 i@48@01))))
(push) ; 8
; [then-branch: 41 | white@19@01 <= i@48@01 && i@48@01 < unsorted@40@01 | live]
; [else-branch: 41 | !(white@19@01 <= i@48@01 && i@48@01 < unsorted@40@01) | live]
(push) ; 9
; [then-branch: 41 | white@19@01 <= i@48@01 && i@48@01 < unsorted@40@01]
(assert (and (<= white@19@01 i@48@01) (< i@48@01 unsorted@40@01)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(push) ; 10
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@48@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@48@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@48@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 41 | !(white@19@01 <= i@48@01 && i@48@01 < unsorted@40@01)]
(assert (not (and (<= white@19@01 i@48@01) (< i@48@01 unsorted@40@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= white@19@01 i@48@01) (< i@48@01 unsorted@40@01)))
  (and (<= white@19@01 i@48@01) (< i@48@01 unsorted@40@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@48@01 Int)) (!
  (and
    (or (<= white@19@01 i@48@01) (not (<= white@19@01 i@48@01)))
    (or
      (not (and (<= white@19@01 i@48@01) (< i@48@01 unsorted@40@01)))
      (and (<= white@19@01 i@48@01) (< i@48@01 unsorted@40@01))))
  :pattern ((loc<Ref> a@1@01 i@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82-aux|)))
(push) ; 7
(assert (not (forall ((i@48@01 Int)) (!
  (=>
    (and (<= white@19@01 i@48@01) (< i@48@01 unsorted@40@01))
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@48@01)) 1))
  :pattern ((loc<Ref> a@1@01 i@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and (<= white@19@01 i@48@01) (< i@48@01 unsorted@40@01))
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@48@01)) 1))
  :pattern ((loc<Ref> a@1@01 i@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|)))
; [eval] (forall i: Int :: { loc(a, i) } blue <= i && i < length(a) ==> loc(a, i).val == 2)
(declare-const i@49@01 Int)
(push) ; 7
; [eval] blue <= i && i < length(a) ==> loc(a, i).val == 2
; [eval] blue <= i && i < length(a)
; [eval] blue <= i
(push) ; 8
; [then-branch: 42 | !(blue@20@01 <= i@49@01) | live]
; [else-branch: 42 | blue@20@01 <= i@49@01 | live]
(push) ; 9
; [then-branch: 42 | !(blue@20@01 <= i@49@01)]
(assert (not (<= blue@20@01 i@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 42 | blue@20@01 <= i@49@01]
(assert (<= blue@20@01 i@49@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= blue@20@01 i@49@01) (not (<= blue@20@01 i@49@01))))
(push) ; 8
; [then-branch: 43 | blue@20@01 <= i@49@01 && i@49@01 < length[Int](a@1@01) | live]
; [else-branch: 43 | !(blue@20@01 <= i@49@01 && i@49@01 < length[Int](a@1@01)) | live]
(push) ; 9
; [then-branch: 43 | blue@20@01 <= i@49@01 && i@49@01 < length[Int](a@1@01)]
(assert (and (<= blue@20@01 i@49@01) (< i@49@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(push) ; 10
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@49@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@49@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@49@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 43 | !(blue@20@01 <= i@49@01 && i@49@01 < length[Int](a@1@01))]
(assert (not (and (<= blue@20@01 i@49@01) (< i@49@01 (length<Int> a@1@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= blue@20@01 i@49@01) (< i@49@01 (length<Int> a@1@01))))
  (and (<= blue@20@01 i@49@01) (< i@49@01 (length<Int> a@1@01)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@49@01 Int)) (!
  (and
    (or (<= blue@20@01 i@49@01) (not (<= blue@20@01 i@49@01)))
    (or
      (not (and (<= blue@20@01 i@49@01) (< i@49@01 (length<Int> a@1@01))))
      (and (<= blue@20@01 i@49@01) (< i@49@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81-aux|)))
(push) ; 7
(assert (not (forall ((i@49@01 Int)) (!
  (=>
    (and (<= blue@20@01 i@49@01) (< i@49@01 (length<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@49@01)) 2))
  :pattern ((loc<Ref> a@1@01 i@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= blue@20@01 i@49@01) (< i@49@01 (length<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@1@01 i@49@01)) 2))
  :pattern ((loc<Ref> a@1@01 i@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|)))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | tmp@39@01 != 1]
(assert (not (= tmp@39@01 1)))
(pop) ; 6
; [eval] !(tmp == 1)
; [eval] tmp == 1
(push) ; 6
(set-option :timeout 10)
(assert (not (= tmp@39@01 1)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= tmp@39@01 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | tmp@39@01 != 1 | live]
; [else-branch: 44 | tmp@39@01 == 1 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 44 | tmp@39@01 != 1]
(assert (not (= tmp@39@01 1)))
; [eval] tmp == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= tmp@39@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= tmp@39@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | tmp@39@01 == 0 | live]
; [else-branch: 45 | tmp@39@01 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 45 | tmp@39@01 == 0]
(assert (= tmp@39@01 0))
; [exec]
; loc(a, unsorted).val := loc(a, white).val
; [eval] loc(a, unsorted)
; [eval] loc(a, white)
(push) ; 8
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 white@19@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 white@19@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 white@19@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@1@01 unsorted@18@01))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
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
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@50@01 r) $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 unsorted@18@01))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@51@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@51@01  $FVF<val>) (loc<Ref> a@1@01 unsorted@18@01))
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 white@19@01))))
; [exec]
; loc(a, white).val := tmp
; [eval] loc(a, white)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@1@01 unsorted@18@01) (loc<Ref> a@1@01 white@19@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@52@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@1@01 white@19@01))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (- $Perm.Write (pTaken@50@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@53@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@1@01 white@19@01))
    ($Perm.min
      (ite (= r (loc<Ref> a@1@01 unsorted@18@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@52@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (- $Perm.Write (pTaken@50@01 r))
        $Perm.No)
      (pTaken@52@01 r))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@52@01 r) $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (= (- $Perm.Write (pTaken@52@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@1@01 unsorted@18@01) (loc<Ref> a@1@01 unsorted@18@01))
      $Perm.Write
      $Perm.No)
    (pTaken@53@01 (loc<Ref> a@1@01 unsorted@18@01)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@53@01 r) $Perm.No)
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (= (- (- $Perm.Write (pTaken@52@01 r)) (pTaken@53@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@54@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@54@01  $FVF<val>) (loc<Ref> a@1@01 white@19@01))
  tmp@39@01))
; [exec]
; white := white + 1
; [eval] white + 1
(declare-const white@55@01 Int)
(assert (= white@55@01 (+ white@19@01 1)))
; [exec]
; unsorted := unsorted + 1
; [eval] unsorted + 1
(declare-const unsorted@56@01 Int)
(assert (= unsorted@56@01 (+ unsorted@18@01 1)))
; Loop head block: Re-establish invariant
(declare-const i$1@57@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] 0 <= i$1 && i$1 < length(a)
; [eval] 0 <= i$1
(push) ; 9
; [then-branch: 46 | !(0 <= i$1@57@01) | live]
; [else-branch: 46 | 0 <= i$1@57@01 | live]
(push) ; 10
; [then-branch: 46 | !(0 <= i$1@57@01)]
(assert (not (<= 0 i$1@57@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 46 | 0 <= i$1@57@01]
(assert (<= 0 i$1@57@01))
; [eval] i$1 < length(a)
; [eval] length(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$1@57@01) (not (<= 0 i$1@57@01))))
(assert (and (<= 0 i$1@57@01) (< i$1@57@01 (length<Int> a@1@01))))
; [eval] loc(a, i$1)
(pop) ; 8
(declare-fun inv@58@01 ($Ref) Int)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i$1@57@01 Int)) (!
  (=>
    (and (<= 0 i$1@57@01) (< i$1@57@01 (length<Int> a@1@01)))
    (or (<= 0 i$1@57@01) (not (<= 0 i$1@57@01))))
  :pattern ((loc<Ref> a@1@01 i$1@57@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((i$11@57@01 Int) (i$12@57@01 Int)) (!
  (=>
    (and
      (and (<= 0 i$11@57@01) (< i$11@57@01 (length<Int> a@1@01)))
      (and (<= 0 i$12@57@01) (< i$12@57@01 (length<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i$11@57@01) (loc<Ref> a@1@01 i$12@57@01)))
    (= i$11@57@01 i$12@57@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$1@57@01 Int)) (!
  (=>
    (and (<= 0 i$1@57@01) (< i$1@57@01 (length<Int> a@1@01)))
    (and
      (= (inv@58@01 (loc<Ref> a@1@01 i$1@57@01)) i$1@57@01)
      (img@59@01 (loc<Ref> a@1@01 i$1@57@01))))
  :pattern ((loc<Ref> a@1@01 i$1@57@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@01 r)
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@58@01 r)) r))
  :pattern ((inv@58@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (length<Int> a@1@01)))
      (img@59@01 r)
      (= r (loc<Ref> a@1@01 (inv@58@01 r))))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (length<Int> a@1@01)))
      (img@59@01 r)
      (= r (loc<Ref> a@1@01 (inv@58@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@1@01 white@19@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@60@01 r)))
    $Perm.No))
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (length<Int> a@1@01)))
      (img@59@01 r)
      (= r (loc<Ref> a@1@01 (inv@58@01 r))))
    ($Perm.min
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@53@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)))
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
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r))
        $Perm.No)
      (pTaken@60@01 r))
    $Perm.No)
  
  :qid |quant-u-27|))))
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
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (length<Int> a@1@01)))
      (img@59@01 r)
      (= r (loc<Ref> a@1@01 (inv@58@01 r))))
    (= (- $Perm.Write (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@1@01 white@19@01) (loc<Ref> a@1@01 white@19@01))
      $Perm.Write
      $Perm.No)
    (pTaken@61@01 (loc<Ref> a@1@01 white@19@01)))
  $Perm.No)))
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
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (length<Int> a@1@01)))
      (img@59@01 r)
      (= r (loc<Ref> a@1@01 (inv@58@01 r))))
    (= (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@1@01 unsorted@18@01) (loc<Ref> a@1@01 unsorted@18@01))
      (- $Perm.Write (pTaken@53@01 (loc<Ref> a@1@01 unsorted@18@01)))
      $Perm.No)
    (pTaken@62@01 (loc<Ref> a@1@01 unsorted@18@01)))
  $Perm.No)))
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
    (and
      (and (<= 0 (inv@58@01 r)) (< (inv@58@01 r) (length<Int> a@1@01)))
      (img@59@01 r)
      (= r (loc<Ref> a@1@01 (inv@58@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)) (pTaken@62@01 r))
      $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
; [eval] 0 <= white
(set-option :timeout 0)
(push) ; 8
(assert (not (<= 0 white@55@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 white@55@01))
; [eval] white <= unsorted
(push) ; 8
(assert (not (<= white@55@01 unsorted@56@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= white@55@01 unsorted@56@01))
; [eval] unsorted <= blue
(push) ; 8
(assert (not (<= unsorted@56@01 blue@20@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= unsorted@56@01 blue@20@01))
; [eval] blue <= length(a)
; [eval] length(a)
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2))
(declare-const i@64@01 Int)
(push) ; 8
; [eval] 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] 0 <= i && i < length(a)
; [eval] 0 <= i
(push) ; 9
; [then-branch: 47 | !(0 <= i@64@01) | live]
; [else-branch: 47 | 0 <= i@64@01 | live]
(push) ; 10
; [then-branch: 47 | !(0 <= i@64@01)]
(assert (not (<= 0 i@64@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 47 | 0 <= i@64@01]
(assert (<= 0 i@64@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@64@01) (not (<= 0 i@64@01))))
(push) ; 9
; [then-branch: 48 | 0 <= i@64@01 && i@64@01 < length[Int](a@1@01) | live]
; [else-branch: 48 | !(0 <= i@64@01 && i@64@01 < length[Int](a@1@01)) | live]
(push) ; 10
; [then-branch: 48 | 0 <= i@64@01 && i@64@01 < length[Int](a@1@01)]
(assert (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 white@19@01))
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@64@01) (loc<Ref> a@1@01 white@19@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@64@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@53@01 (loc<Ref> a@1@01 i@64@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@64@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@64@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@64@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@50@01 (loc<Ref> a@1@01 i@64@01)))
        (pTaken@52@01 (loc<Ref> a@1@01 i@64@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
; [then-branch: 49 | Lookup(val, sm@63@01, loc[Ref](a@1@01, i@64@01)) == 0 | live]
; [else-branch: 49 | Lookup(val, sm@63@01, loc[Ref](a@1@01, i@64@01)) != 0 | live]
(push) ; 12
; [then-branch: 49 | Lookup(val, sm@63@01, loc[Ref](a@1@01, i@64@01)) == 0]
(assert (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0))
(pop) ; 12
(push) ; 12
; [else-branch: 49 | Lookup(val, sm@63@01, loc[Ref](a@1@01, i@64@01)) != 0]
(assert (not (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 white@19@01))
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 13
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@64@01) (loc<Ref> a@1@01 white@19@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@64@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@53@01 (loc<Ref> a@1@01 i@64@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@64@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@64@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@64@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@50@01 (loc<Ref> a@1@01 i@64@01)))
        (pTaken@52@01 (loc<Ref> a@1@01 i@64@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(push) ; 13
; [then-branch: 50 | Lookup(val, sm@63@01, loc[Ref](a@1@01, i@64@01)) == 1 | live]
; [else-branch: 50 | Lookup(val, sm@63@01, loc[Ref](a@1@01, i@64@01)) != 1 | live]
(push) ; 14
; [then-branch: 50 | Lookup(val, sm@63@01, loc[Ref](a@1@01, i@64@01)) == 1]
(assert (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 1))
(pop) ; 14
(push) ; 14
; [else-branch: 50 | Lookup(val, sm@63@01, loc[Ref](a@1@01, i@64@01)) != 1]
(assert (not (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 1)))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 white@19@01))
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 15
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@64@01) (loc<Ref> a@1@01 white@19@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@64@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@53@01 (loc<Ref> a@1@01 i@64@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@64@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@64@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@64@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@50@01 (loc<Ref> a@1@01 i@64@01)))
        (pTaken@52@01 (loc<Ref> a@1@01 i@64@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (or
  (not
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 1))
  (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 1)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (not
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0))
  (and
    (not
      (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0))
    (or
      (not
        (=
          ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
          1))
      (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 1)))))
(assert (or
  (not
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0))
  (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 48 | !(0 <= i@64@01 && i@64@01 < length[Int](a@1@01))]
(assert (not (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01)))
  (and
    (<= 0 i@64@01)
    (< i@64@01 (length<Int> a@1@01))
    (=>
      (not
        (=
          ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
          0))
      (and
        (not
          (=
            ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
            0))
        (or
          (not
            (=
              ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
              1))
          (=
            ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
            1))))
    (or
      (not
        (=
          ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
          0))
      (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01))))
  (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@64@01 Int)) (!
  (and
    (or (<= 0 i@64@01) (not (<= 0 i@64@01)))
    (=>
      (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01)))
      (and
        (<= 0 i@64@01)
        (< i@64@01 (length<Int> a@1@01))
        (=>
          (not
            (=
              ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
              0))
          (and
            (not
              (=
                ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
                0))
            (or
              (not
                (=
                  ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
                  1))
              (=
                ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
                1))))
        (or
          (not
            (=
              ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
              0))
          (=
            ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
            0))))
    (or
      (not (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01))))
      (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@64@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127-aux|)))
(push) ; 8
(assert (not (forall ((i@64@01 Int)) (!
  (=>
    (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01)))
    (or
      (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0)
      (or
        (=
          ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
          1)
        (=
          ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@64@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@64@01 Int)) (!
  (=>
    (and (<= 0 i@64@01) (< i@64@01 (length<Int> a@1@01)))
    (or
      (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01)) 0)
      (or
        (=
          ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
          1)
        (=
          ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@64@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@64@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < white ==> loc(a, i).val == 0)
(declare-const i@65@01 Int)
(push) ; 8
; [eval] 0 <= i && i < white ==> loc(a, i).val == 0
; [eval] 0 <= i && i < white
; [eval] 0 <= i
(push) ; 9
; [then-branch: 51 | !(0 <= i@65@01) | live]
; [else-branch: 51 | 0 <= i@65@01 | live]
(push) ; 10
; [then-branch: 51 | !(0 <= i@65@01)]
(assert (not (<= 0 i@65@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 51 | 0 <= i@65@01]
(assert (<= 0 i@65@01))
; [eval] i < white
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@65@01) (not (<= 0 i@65@01))))
(push) ; 9
; [then-branch: 52 | 0 <= i@65@01 && i@65@01 < white@55@01 | live]
; [else-branch: 52 | !(0 <= i@65@01 && i@65@01 < white@55@01) | live]
(push) ; 10
; [then-branch: 52 | 0 <= i@65@01 && i@65@01 < white@55@01]
(assert (and (<= 0 i@65@01) (< i@65@01 white@55@01)))
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 white@19@01))
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@65@01) (loc<Ref> a@1@01 white@19@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@65@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@53@01 (loc<Ref> a@1@01 i@65@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@65@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@65@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@65@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@50@01 (loc<Ref> a@1@01 i@65@01)))
        (pTaken@52@01 (loc<Ref> a@1@01 i@65@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 52 | !(0 <= i@65@01 && i@65@01 < white@55@01)]
(assert (not (and (<= 0 i@65@01) (< i@65@01 white@55@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@65@01) (< i@65@01 white@55@01)))
  (and (<= 0 i@65@01) (< i@65@01 white@55@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@65@01 Int)) (!
  (and
    (or (<= 0 i@65@01) (not (<= 0 i@65@01)))
    (or
      (not (and (<= 0 i@65@01) (< i@65@01 white@55@01)))
      (and (<= 0 i@65@01) (< i@65@01 white@55@01))))
  :pattern ((loc<Ref> a@1@01 i@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73-aux|)))
(push) ; 8
(assert (not (forall ((i@65@01 Int)) (!
  (=>
    (and (<= 0 i@65@01) (< i@65@01 white@55@01))
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@65@01)) 0))
  :pattern ((loc<Ref> a@1@01 i@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@65@01 Int)) (!
  (=>
    (and (<= 0 i@65@01) (< i@65@01 white@55@01))
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@65@01)) 0))
  :pattern ((loc<Ref> a@1@01 i@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|)))
; [eval] (forall i: Int :: { loc(a, i) } white <= i && i < unsorted ==> loc(a, i).val == 1)
(declare-const i@66@01 Int)
(push) ; 8
; [eval] white <= i && i < unsorted ==> loc(a, i).val == 1
; [eval] white <= i && i < unsorted
; [eval] white <= i
(push) ; 9
; [then-branch: 53 | !(white@55@01 <= i@66@01) | live]
; [else-branch: 53 | white@55@01 <= i@66@01 | live]
(push) ; 10
; [then-branch: 53 | !(white@55@01 <= i@66@01)]
(assert (not (<= white@55@01 i@66@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 53 | white@55@01 <= i@66@01]
(assert (<= white@55@01 i@66@01))
; [eval] i < unsorted
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= white@55@01 i@66@01) (not (<= white@55@01 i@66@01))))
(push) ; 9
; [then-branch: 54 | white@55@01 <= i@66@01 && i@66@01 < unsorted@56@01 | live]
; [else-branch: 54 | !(white@55@01 <= i@66@01 && i@66@01 < unsorted@56@01) | live]
(push) ; 10
; [then-branch: 54 | white@55@01 <= i@66@01 && i@66@01 < unsorted@56@01]
(assert (and (<= white@55@01 i@66@01) (< i@66@01 unsorted@56@01)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 white@19@01))
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@66@01) (loc<Ref> a@1@01 white@19@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@66@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@53@01 (loc<Ref> a@1@01 i@66@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@66@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@66@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@66@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@50@01 (loc<Ref> a@1@01 i@66@01)))
        (pTaken@52@01 (loc<Ref> a@1@01 i@66@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 54 | !(white@55@01 <= i@66@01 && i@66@01 < unsorted@56@01)]
(assert (not (and (<= white@55@01 i@66@01) (< i@66@01 unsorted@56@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not (and (<= white@55@01 i@66@01) (< i@66@01 unsorted@56@01)))
  (and (<= white@55@01 i@66@01) (< i@66@01 unsorted@56@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@66@01 Int)) (!
  (and
    (or (<= white@55@01 i@66@01) (not (<= white@55@01 i@66@01)))
    (or
      (not (and (<= white@55@01 i@66@01) (< i@66@01 unsorted@56@01)))
      (and (<= white@55@01 i@66@01) (< i@66@01 unsorted@56@01))))
  :pattern ((loc<Ref> a@1@01 i@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82-aux|)))
(push) ; 8
(assert (not (forall ((i@66@01 Int)) (!
  (=>
    (and (<= white@55@01 i@66@01) (< i@66@01 unsorted@56@01))
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@66@01)) 1))
  :pattern ((loc<Ref> a@1@01 i@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@66@01 Int)) (!
  (=>
    (and (<= white@55@01 i@66@01) (< i@66@01 unsorted@56@01))
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@66@01)) 1))
  :pattern ((loc<Ref> a@1@01 i@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|)))
; [eval] (forall i: Int :: { loc(a, i) } blue <= i && i < length(a) ==> loc(a, i).val == 2)
(declare-const i@67@01 Int)
(push) ; 8
; [eval] blue <= i && i < length(a) ==> loc(a, i).val == 2
; [eval] blue <= i && i < length(a)
; [eval] blue <= i
(push) ; 9
; [then-branch: 55 | !(blue@20@01 <= i@67@01) | live]
; [else-branch: 55 | blue@20@01 <= i@67@01 | live]
(push) ; 10
; [then-branch: 55 | !(blue@20@01 <= i@67@01)]
(assert (not (<= blue@20@01 i@67@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 55 | blue@20@01 <= i@67@01]
(assert (<= blue@20@01 i@67@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= blue@20@01 i@67@01) (not (<= blue@20@01 i@67@01))))
(push) ; 9
; [then-branch: 56 | blue@20@01 <= i@67@01 && i@67@01 < length[Int](a@1@01) | live]
; [else-branch: 56 | !(blue@20@01 <= i@67@01 && i@67@01 < length[Int](a@1@01)) | live]
(push) ; 10
; [then-branch: 56 | blue@20@01 <= i@67@01 && i@67@01 < length[Int](a@1@01)]
(assert (and (<= blue@20@01 i@67@01) (< i@67@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 white@19@01))
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@67@01) (loc<Ref> a@1@01 white@19@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@67@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@53@01 (loc<Ref> a@1@01 i@67@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@67@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@67@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@67@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@50@01 (loc<Ref> a@1@01 i@67@01)))
        (pTaken@52@01 (loc<Ref> a@1@01 i@67@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 56 | !(blue@20@01 <= i@67@01 && i@67@01 < length[Int](a@1@01))]
(assert (not (and (<= blue@20@01 i@67@01) (< i@67@01 (length<Int> a@1@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not (and (<= blue@20@01 i@67@01) (< i@67@01 (length<Int> a@1@01))))
  (and (<= blue@20@01 i@67@01) (< i@67@01 (length<Int> a@1@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 white@19@01))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@52@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@67@01 Int)) (!
  (and
    (or (<= blue@20@01 i@67@01) (not (<= blue@20@01 i@67@01)))
    (or
      (not (and (<= blue@20@01 i@67@01) (< i@67@01 (length<Int> a@1@01))))
      (and (<= blue@20@01 i@67@01) (< i@67@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81-aux|)))
(push) ; 8
(assert (not (forall ((i@67@01 Int)) (!
  (=>
    (and (<= blue@20@01 i@67@01) (< i@67@01 (length<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@67@01)) 2))
  :pattern ((loc<Ref> a@1@01 i@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@67@01 Int)) (!
  (=>
    (and (<= blue@20@01 i@67@01) (< i@67@01 (length<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@63@01  $FVF<val>) (loc<Ref> a@1@01 i@67@01)) 2))
  :pattern ((loc<Ref> a@1@01 i@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|)))
(pop) ; 7
(push) ; 7
; [else-branch: 45 | tmp@39@01 != 0]
(assert (not (= tmp@39@01 0)))
(pop) ; 7
; [eval] !(tmp == 0)
; [eval] tmp == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (= tmp@39@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= tmp@39@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | tmp@39@01 != 0 | live]
; [else-branch: 57 | tmp@39@01 == 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 57 | tmp@39@01 != 0]
(assert (not (= tmp@39@01 0)))
; [exec]
; loc(a, unsorted).val := loc(a, blue - 1).val
; [eval] loc(a, unsorted)
; [eval] loc(a, blue - 1)
; [eval] blue - 1
(push) ; 8
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 (- blue@20@01 1)))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 (- blue@20@01 1))))
    (< (inv@23@01 (loc<Ref> a@1@01 (- blue@20@01 1))) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@1@01 unsorted@18@01))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
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
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@68@01 r))
    $Perm.No)
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@68@01 r) $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 unsorted@18@01))
    (= (- $Perm.Write (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@69@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@69@01  $FVF<val>) (loc<Ref> a@1@01 unsorted@18@01))
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) (loc<Ref> a@1@01 (-
    blue@20@01
    1)))))
; [exec]
; blue := blue - 1
; [eval] blue - 1
(declare-const blue@70@01 Int)
(assert (= blue@70@01 (- blue@20@01 1)))
; [exec]
; loc(a, blue).val := tmp
; [eval] loc(a, blue)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@1@01 unsorted@18@01) (loc<Ref> a@1@01 blue@70@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@71@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@1@01 blue@70@01))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (- $Perm.Write (pTaken@68@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@72@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@1@01 blue@70@01))
    ($Perm.min
      (ite (= r (loc<Ref> a@1@01 unsorted@18@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@71@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (- $Perm.Write (pTaken@68@01 r))
        $Perm.No)
      (pTaken@71@01 r))
    $Perm.No)
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@71@01 r) $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (= (- $Perm.Write (pTaken@71@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@1@01 unsorted@18@01) (loc<Ref> a@1@01 unsorted@18@01))
      $Perm.Write
      $Perm.No)
    (pTaken@72@01 (loc<Ref> a@1@01 unsorted@18@01)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@72@01 r) $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (= (- (- $Perm.Write (pTaken@71@01 r)) (pTaken@72@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@73@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@73@01  $FVF<val>) (loc<Ref> a@1@01 blue@70@01))
  tmp@39@01))
; Loop head block: Re-establish invariant
(declare-const i$1@74@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] 0 <= i$1 && i$1 < length(a)
; [eval] 0 <= i$1
(push) ; 9
; [then-branch: 58 | !(0 <= i$1@74@01) | live]
; [else-branch: 58 | 0 <= i$1@74@01 | live]
(push) ; 10
; [then-branch: 58 | !(0 <= i$1@74@01)]
(assert (not (<= 0 i$1@74@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 58 | 0 <= i$1@74@01]
(assert (<= 0 i$1@74@01))
; [eval] i$1 < length(a)
; [eval] length(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$1@74@01) (not (<= 0 i$1@74@01))))
(assert (and (<= 0 i$1@74@01) (< i$1@74@01 (length<Int> a@1@01))))
; [eval] loc(a, i$1)
(pop) ; 8
(declare-fun inv@75@01 ($Ref) Int)
(declare-fun img@76@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i$1@74@01 Int)) (!
  (=>
    (and (<= 0 i$1@74@01) (< i$1@74@01 (length<Int> a@1@01)))
    (or (<= 0 i$1@74@01) (not (<= 0 i$1@74@01))))
  :pattern ((loc<Ref> a@1@01 i$1@74@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((i$11@74@01 Int) (i$12@74@01 Int)) (!
  (=>
    (and
      (and (<= 0 i$11@74@01) (< i$11@74@01 (length<Int> a@1@01)))
      (and (<= 0 i$12@74@01) (< i$12@74@01 (length<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i$11@74@01) (loc<Ref> a@1@01 i$12@74@01)))
    (= i$11@74@01 i$12@74@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$1@74@01 Int)) (!
  (=>
    (and (<= 0 i$1@74@01) (< i$1@74@01 (length<Int> a@1@01)))
    (and
      (= (inv@75@01 (loc<Ref> a@1@01 i$1@74@01)) i$1@74@01)
      (img@76@01 (loc<Ref> a@1@01 i$1@74@01))))
  :pattern ((loc<Ref> a@1@01 i$1@74@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@76@01 r)
      (and (<= 0 (inv@75@01 r)) (< (inv@75@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@75@01 r)) r))
  :pattern ((inv@75@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@77@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@75@01 r)) (< (inv@75@01 r) (length<Int> a@1@01)))
      (img@76@01 r)
      (= r (loc<Ref> a@1@01 (inv@75@01 r))))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@75@01 r)) (< (inv@75@01 r) (length<Int> a@1@01)))
      (img@76@01 r)
      (= r (loc<Ref> a@1@01 (inv@75@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@1@01 blue@70@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@77@01 r)))
    $Perm.No))
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@75@01 r)) (< (inv@75@01 r) (length<Int> a@1@01)))
      (img@76@01 r)
      (= r (loc<Ref> a@1@01 (inv@75@01 r))))
    ($Perm.min
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@72@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@77@01 r)) (pTaken@78@01 r)))
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
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r))
        $Perm.No)
      (pTaken@77@01 r))
    $Perm.No)
  
  :qid |quant-u-46|))))
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
    (and
      (and (<= 0 (inv@75@01 r)) (< (inv@75@01 r) (length<Int> a@1@01)))
      (img@76@01 r)
      (= r (loc<Ref> a@1@01 (inv@75@01 r))))
    (= (- $Perm.Write (pTaken@77@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@1@01 blue@70@01) (loc<Ref> a@1@01 blue@70@01))
      $Perm.Write
      $Perm.No)
    (pTaken@78@01 (loc<Ref> a@1@01 blue@70@01)))
  $Perm.No)))
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
    (and
      (and (<= 0 (inv@75@01 r)) (< (inv@75@01 r) (length<Int> a@1@01)))
      (img@76@01 r)
      (= r (loc<Ref> a@1@01 (inv@75@01 r))))
    (= (- (- $Perm.Write (pTaken@77@01 r)) (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@1@01 unsorted@18@01) (loc<Ref> a@1@01 unsorted@18@01))
      (- $Perm.Write (pTaken@72@01 (loc<Ref> a@1@01 unsorted@18@01)))
      $Perm.No)
    (pTaken@79@01 (loc<Ref> a@1@01 unsorted@18@01)))
  $Perm.No)))
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
    (and
      (and (<= 0 (inv@75@01 r)) (< (inv@75@01 r) (length<Int> a@1@01)))
      (img@76@01 r)
      (= r (loc<Ref> a@1@01 (inv@75@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@77@01 r)) (pTaken@78@01 r)) (pTaken@79@01 r))
      $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@80@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
; [eval] 0 <= white
; [eval] white <= unsorted
; [eval] unsorted <= blue
(set-option :timeout 0)
(push) ; 8
(assert (not (<= unsorted@18@01 blue@70@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= unsorted@18@01 blue@70@01))
; [eval] blue <= length(a)
; [eval] length(a)
(push) ; 8
(assert (not (<= blue@70@01 (length<Int> a@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= blue@70@01 (length<Int> a@1@01)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2))
(declare-const i@81@01 Int)
(push) ; 8
; [eval] 0 <= i && i < length(a) ==> loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] 0 <= i && i < length(a)
; [eval] 0 <= i
(push) ; 9
; [then-branch: 59 | !(0 <= i@81@01) | live]
; [else-branch: 59 | 0 <= i@81@01 | live]
(push) ; 10
; [then-branch: 59 | !(0 <= i@81@01)]
(assert (not (<= 0 i@81@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 59 | 0 <= i@81@01]
(assert (<= 0 i@81@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@81@01) (not (<= 0 i@81@01))))
(push) ; 9
; [then-branch: 60 | 0 <= i@81@01 && i@81@01 < length[Int](a@1@01) | live]
; [else-branch: 60 | !(0 <= i@81@01 && i@81@01 < length[Int](a@1@01)) | live]
(push) ; 10
; [then-branch: 60 | 0 <= i@81@01 && i@81@01 < length[Int](a@1@01)]
(assert (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 0 || (loc(a, i).val == 1 || loc(a, i).val == 2)
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 blue@70@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef7|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@81@01) (loc<Ref> a@1@01 blue@70@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@81@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@72@01 (loc<Ref> a@1@01 i@81@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@81@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@81@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@81@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@68@01 (loc<Ref> a@1@01 i@81@01)))
        (pTaken@71@01 (loc<Ref> a@1@01 i@81@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
; [then-branch: 61 | Lookup(val, sm@80@01, loc[Ref](a@1@01, i@81@01)) == 0 | live]
; [else-branch: 61 | Lookup(val, sm@80@01, loc[Ref](a@1@01, i@81@01)) != 0 | live]
(push) ; 12
; [then-branch: 61 | Lookup(val, sm@80@01, loc[Ref](a@1@01, i@81@01)) == 0]
(assert (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0))
(pop) ; 12
(push) ; 12
; [else-branch: 61 | Lookup(val, sm@80@01, loc[Ref](a@1@01, i@81@01)) != 0]
(assert (not (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 blue@70@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef7|))))
(push) ; 13
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@81@01) (loc<Ref> a@1@01 blue@70@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@81@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@72@01 (loc<Ref> a@1@01 i@81@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@81@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@81@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@81@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@68@01 (loc<Ref> a@1@01 i@81@01)))
        (pTaken@71@01 (loc<Ref> a@1@01 i@81@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(push) ; 13
; [then-branch: 62 | Lookup(val, sm@80@01, loc[Ref](a@1@01, i@81@01)) == 1 | live]
; [else-branch: 62 | Lookup(val, sm@80@01, loc[Ref](a@1@01, i@81@01)) != 1 | live]
(push) ; 14
; [then-branch: 62 | Lookup(val, sm@80@01, loc[Ref](a@1@01, i@81@01)) == 1]
(assert (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 1))
(pop) ; 14
(push) ; 14
; [else-branch: 62 | Lookup(val, sm@80@01, loc[Ref](a@1@01, i@81@01)) != 1]
(assert (not (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 1)))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 blue@70@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef7|))))
(push) ; 15
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@81@01) (loc<Ref> a@1@01 blue@70@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@81@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@72@01 (loc<Ref> a@1@01 i@81@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@81@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@81@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@81@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@68@01 (loc<Ref> a@1@01 i@81@01)))
        (pTaken@71@01 (loc<Ref> a@1@01 i@81@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (or
  (not
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 1))
  (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 1)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (=>
  (not
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0))
  (and
    (not
      (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0))
    (or
      (not
        (=
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
          1))
      (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 1)))))
(assert (or
  (not
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0))
  (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 60 | !(0 <= i@81@01 && i@81@01 < length[Int](a@1@01))]
(assert (not (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (=>
  (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01)))
  (and
    (<= 0 i@81@01)
    (< i@81@01 (length<Int> a@1@01))
    (=>
      (not
        (=
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
          0))
      (and
        (not
          (=
            ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
            0))
        (or
          (not
            (=
              ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
              1))
          (=
            ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
            1))))
    (or
      (not
        (=
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
          0))
      (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01))))
  (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@81@01 Int)) (!
  (and
    (or (<= 0 i@81@01) (not (<= 0 i@81@01)))
    (=>
      (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01)))
      (and
        (<= 0 i@81@01)
        (< i@81@01 (length<Int> a@1@01))
        (=>
          (not
            (=
              ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
              0))
          (and
            (not
              (=
                ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
                0))
            (or
              (not
                (=
                  ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
                  1))
              (=
                ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
                1))))
        (or
          (not
            (=
              ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
              0))
          (=
            ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
            0))))
    (or
      (not (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01))))
      (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127-aux|)))
(push) ; 8
(assert (not (forall ((i@81@01 Int)) (!
  (=>
    (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01)))
    (or
      (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0)
      (or
        (=
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
          1)
        (=
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@81@01 Int)) (!
  (=>
    (and (<= 0 i@81@01) (< i@81@01 (length<Int> a@1@01)))
    (or
      (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01)) 0)
      (or
        (=
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
          1)
        (=
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@81@01))
          2))))
  :pattern ((loc<Ref> a@1@01 i@81@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@25@13@25@127|)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < white ==> loc(a, i).val == 0)
(declare-const i@82@01 Int)
(push) ; 8
; [eval] 0 <= i && i < white ==> loc(a, i).val == 0
; [eval] 0 <= i && i < white
; [eval] 0 <= i
(push) ; 9
; [then-branch: 63 | !(0 <= i@82@01) | live]
; [else-branch: 63 | 0 <= i@82@01 | live]
(push) ; 10
; [then-branch: 63 | !(0 <= i@82@01)]
(assert (not (<= 0 i@82@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 63 | 0 <= i@82@01]
(assert (<= 0 i@82@01))
; [eval] i < white
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@82@01) (not (<= 0 i@82@01))))
(push) ; 9
; [then-branch: 64 | 0 <= i@82@01 && i@82@01 < white@19@01 | live]
; [else-branch: 64 | !(0 <= i@82@01 && i@82@01 < white@19@01) | live]
(push) ; 10
; [then-branch: 64 | 0 <= i@82@01 && i@82@01 < white@19@01]
(assert (and (<= 0 i@82@01) (< i@82@01 white@19@01)))
; [eval] loc(a, i).val == 0
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 blue@70@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef7|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@82@01) (loc<Ref> a@1@01 blue@70@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@82@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@72@01 (loc<Ref> a@1@01 i@82@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@82@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@82@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@82@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@68@01 (loc<Ref> a@1@01 i@82@01)))
        (pTaken@71@01 (loc<Ref> a@1@01 i@82@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 64 | !(0 <= i@82@01 && i@82@01 < white@19@01)]
(assert (not (and (<= 0 i@82@01) (< i@82@01 white@19@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@82@01) (< i@82@01 white@19@01)))
  (and (<= 0 i@82@01) (< i@82@01 white@19@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@82@01 Int)) (!
  (and
    (or (<= 0 i@82@01) (not (<= 0 i@82@01)))
    (or
      (not (and (<= 0 i@82@01) (< i@82@01 white@19@01)))
      (and (<= 0 i@82@01) (< i@82@01 white@19@01))))
  :pattern ((loc<Ref> a@1@01 i@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73-aux|)))
(push) ; 8
(assert (not (forall ((i@82@01 Int)) (!
  (=>
    (and (<= 0 i@82@01) (< i@82@01 white@19@01))
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@82@01)) 0))
  :pattern ((loc<Ref> a@1@01 i@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@82@01 Int)) (!
  (=>
    (and (<= 0 i@82@01) (< i@82@01 white@19@01))
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@82@01)) 0))
  :pattern ((loc<Ref> a@1@01 i@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@26@13@26@73|)))
; [eval] (forall i: Int :: { loc(a, i) } white <= i && i < unsorted ==> loc(a, i).val == 1)
(declare-const i@83@01 Int)
(push) ; 8
; [eval] white <= i && i < unsorted ==> loc(a, i).val == 1
; [eval] white <= i && i < unsorted
; [eval] white <= i
(push) ; 9
; [then-branch: 65 | !(white@19@01 <= i@83@01) | live]
; [else-branch: 65 | white@19@01 <= i@83@01 | live]
(push) ; 10
; [then-branch: 65 | !(white@19@01 <= i@83@01)]
(assert (not (<= white@19@01 i@83@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 65 | white@19@01 <= i@83@01]
(assert (<= white@19@01 i@83@01))
; [eval] i < unsorted
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= white@19@01 i@83@01) (not (<= white@19@01 i@83@01))))
(push) ; 9
; [then-branch: 66 | white@19@01 <= i@83@01 && i@83@01 < unsorted@18@01 | live]
; [else-branch: 66 | !(white@19@01 <= i@83@01 && i@83@01 < unsorted@18@01) | live]
(push) ; 10
; [then-branch: 66 | white@19@01 <= i@83@01 && i@83@01 < unsorted@18@01]
(assert (and (<= white@19@01 i@83@01) (< i@83@01 unsorted@18@01)))
; [eval] loc(a, i).val == 1
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 blue@70@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef7|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@83@01) (loc<Ref> a@1@01 blue@70@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@83@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@72@01 (loc<Ref> a@1@01 i@83@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@83@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@83@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@83@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@68@01 (loc<Ref> a@1@01 i@83@01)))
        (pTaken@71@01 (loc<Ref> a@1@01 i@83@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 66 | !(white@19@01 <= i@83@01 && i@83@01 < unsorted@18@01)]
(assert (not (and (<= white@19@01 i@83@01) (< i@83@01 unsorted@18@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
; Joined path conditions
(assert (or
  (not (and (<= white@19@01 i@83@01) (< i@83@01 unsorted@18@01)))
  (and (<= white@19@01 i@83@01) (< i@83@01 unsorted@18@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@83@01 Int)) (!
  (and
    (or (<= white@19@01 i@83@01) (not (<= white@19@01 i@83@01)))
    (or
      (not (and (<= white@19@01 i@83@01) (< i@83@01 unsorted@18@01)))
      (and (<= white@19@01 i@83@01) (< i@83@01 unsorted@18@01))))
  :pattern ((loc<Ref> a@1@01 i@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82-aux|)))
(push) ; 8
(assert (not (forall ((i@83@01 Int)) (!
  (=>
    (and (<= white@19@01 i@83@01) (< i@83@01 unsorted@18@01))
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@83@01)) 1))
  :pattern ((loc<Ref> a@1@01 i@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and (<= white@19@01 i@83@01) (< i@83@01 unsorted@18@01))
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@83@01)) 1))
  :pattern ((loc<Ref> a@1@01 i@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@27@13@27@82|)))
; [eval] (forall i: Int :: { loc(a, i) } blue <= i && i < length(a) ==> loc(a, i).val == 2)
(declare-const i@84@01 Int)
(push) ; 8
; [eval] blue <= i && i < length(a) ==> loc(a, i).val == 2
; [eval] blue <= i && i < length(a)
; [eval] blue <= i
(push) ; 9
; [then-branch: 67 | !(blue@70@01 <= i@84@01) | live]
; [else-branch: 67 | blue@70@01 <= i@84@01 | live]
(push) ; 10
; [then-branch: 67 | !(blue@70@01 <= i@84@01)]
(assert (not (<= blue@70@01 i@84@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 67 | blue@70@01 <= i@84@01]
(assert (<= blue@70@01 i@84@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= blue@70@01 i@84@01) (not (<= blue@70@01 i@84@01))))
(push) ; 9
; [then-branch: 68 | blue@70@01 <= i@84@01 && i@84@01 < length[Int](a@1@01) | live]
; [else-branch: 68 | !(blue@70@01 <= i@84@01 && i@84@01 < length[Int](a@1@01)) | live]
(push) ; 10
; [then-branch: 68 | blue@70@01 <= i@84@01 && i@84@01 < length[Int](a@1@01)]
(assert (and (<= blue@70@01 i@84@01) (< i@84@01 (length<Int> a@1@01))))
; [eval] loc(a, i).val == 2
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@1@01 blue@70@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (= r (loc<Ref> a@1@01 unsorted@18@01))
        (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
    :qid |qp.fvfValDef7|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (loc<Ref> a@1@01 i@84@01) (loc<Ref> a@1@01 blue@70@01))
        $Perm.Write
        $Perm.No)
      (ite
        (= (loc<Ref> a@1@01 i@84@01) (loc<Ref> a@1@01 unsorted@18@01))
        (- $Perm.Write (pTaken@72@01 (loc<Ref> a@1@01 i@84@01)))
        $Perm.No))
    (ite
      (and
        (img@24@01 (loc<Ref> a@1@01 i@84@01))
        (and
          (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@84@01)))
          (< (inv@23@01 (loc<Ref> a@1@01 i@84@01)) (length<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@68@01 (loc<Ref> a@1@01 i@84@01)))
        (pTaken@71@01 (loc<Ref> a@1@01 i@84@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 68 | !(blue@70@01 <= i@84@01 && i@84@01 < length[Int](a@1@01))]
(assert (not (and (<= blue@70@01 i@84@01) (< i@84@01 (length<Int> a@1@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
; Joined path conditions
(assert (or
  (not (and (<= blue@70@01 i@84@01) (< i@84@01 (length<Int> a@1@01))))
  (and (<= blue@70@01 i@84@01) (< i@84@01 (length<Int> a@1@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 blue@70@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (loc<Ref> a@1@01 unsorted@18@01))
      (< $Perm.No (- $Perm.Write (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@71@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@84@01 Int)) (!
  (and
    (or (<= blue@70@01 i@84@01) (not (<= blue@70@01 i@84@01)))
    (or
      (not (and (<= blue@70@01 i@84@01) (< i@84@01 (length<Int> a@1@01))))
      (and (<= blue@70@01 i@84@01) (< i@84@01 (length<Int> a@1@01)))))
  :pattern ((loc<Ref> a@1@01 i@84@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81-aux|)))
(push) ; 8
(assert (not (forall ((i@84@01 Int)) (!
  (=>
    (and (<= blue@70@01 i@84@01) (< i@84@01 (length<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@84@01)) 2))
  :pattern ((loc<Ref> a@1@01 i@84@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@84@01 Int)) (!
  (=>
    (and (<= blue@70@01 i@84@01) (< i@84@01 (length<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> a@1@01 i@84@01)) 2))
  :pattern ((loc<Ref> a@1@01 i@84@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@28@13@28@81|)))
(pop) ; 7
(push) ; 7
; [else-branch: 57 | tmp@39@01 == 0]
(assert (= tmp@39@01 0))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 44 | tmp@39@01 == 1]
(assert (= tmp@39@01 1))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 31 | !(unsorted@18@01 < blue@20@01)]
(assert (not (< unsorted@18@01 blue@20@01)))
(pop) ; 5
; [eval] !(unsorted < blue)
; [eval] unsorted < blue
(push) ; 5
(set-option :timeout 10)
(assert (not (< unsorted@18@01 blue@20@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< unsorted@18@01 blue@20@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 69 | !(unsorted@18@01 < blue@20@01) | live]
; [else-branch: 69 | unsorted@18@01 < blue@20@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 69 | !(unsorted@18@01 < blue@20@01)]
(assert (not (< unsorted@18@01 blue@20@01)))
(declare-const i$0@85@01 Int)
(push) ; 6
; [eval] 0 <= i$0 && i$0 < length(a)
; [eval] 0 <= i$0
(push) ; 7
; [then-branch: 70 | !(0 <= i$0@85@01) | live]
; [else-branch: 70 | 0 <= i$0@85@01 | live]
(push) ; 8
; [then-branch: 70 | !(0 <= i$0@85@01)]
(assert (not (<= 0 i$0@85@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 70 | 0 <= i$0@85@01]
(assert (<= 0 i$0@85@01))
; [eval] i$0 < length(a)
; [eval] length(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$0@85@01) (not (<= 0 i$0@85@01))))
(assert (and (<= 0 i$0@85@01) (< i$0@85@01 (length<Int> a@1@01))))
; [eval] loc(a, i$0)
(pop) ; 6
(declare-fun inv@86@01 ($Ref) Int)
(declare-fun img@87@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i$0@85@01 Int)) (!
  (=>
    (and (<= 0 i$0@85@01) (< i$0@85@01 (length<Int> a@1@01)))
    (or (<= 0 i$0@85@01) (not (<= 0 i$0@85@01))))
  :pattern ((loc<Ref> a@1@01 i$0@85@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i$01@85@01 Int) (i$02@85@01 Int)) (!
  (=>
    (and
      (and (<= 0 i$01@85@01) (< i$01@85@01 (length<Int> a@1@01)))
      (and (<= 0 i$02@85@01) (< i$02@85@01 (length<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i$01@85@01) (loc<Ref> a@1@01 i$02@85@01)))
    (= i$01@85@01 i$02@85@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$0@85@01 Int)) (!
  (=>
    (and (<= 0 i$0@85@01) (< i$0@85@01 (length<Int> a@1@01)))
    (and
      (= (inv@86@01 (loc<Ref> a@1@01 i$0@85@01)) i$0@85@01)
      (img@87@01 (loc<Ref> a@1@01 i$0@85@01))))
  :pattern ((loc<Ref> a@1@01 i$0@85@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@87@01 r)
      (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) (length<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@86@01 r)) r))
  :pattern ((inv@86@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@88@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) (length<Int> a@1@01)))
      (img@87@01 r)
      (= r (loc<Ref> a@1@01 (inv@86@01 r))))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@24@01 r)
          (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@88@01 r))
    $Perm.No)
  
  :qid |quant-u-54|))))
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
      (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) (length<Int> a@1@01)))
      (img@87@01 r)
      (= r (loc<Ref> a@1@01 (inv@86@01 r))))
    (= (- $Perm.Write (pTaken@88@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@89@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) (length<Int> a@1@01))))
    (=
      ($FVF.lookup_val (as sm@89@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_val (as sm@89@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef8|)))
; [eval] (forall i: Int, j: Int :: { loc(a, i), loc(a, j) } 0 <= i && (i < j && j < length(a)) ==> loc(a, i).val <= loc(a, j).val)
(declare-const i@90@01 Int)
(declare-const j@91@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= i && (i < j && j < length(a)) ==> loc(a, i).val <= loc(a, j).val
; [eval] 0 <= i && (i < j && j < length(a))
; [eval] 0 <= i
(push) ; 7
; [then-branch: 71 | !(0 <= i@90@01) | live]
; [else-branch: 71 | 0 <= i@90@01 | live]
(push) ; 8
; [then-branch: 71 | !(0 <= i@90@01)]
(assert (not (<= 0 i@90@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 71 | 0 <= i@90@01]
(assert (<= 0 i@90@01))
; [eval] i < j
(push) ; 9
; [then-branch: 72 | !(i@90@01 < j@91@01) | live]
; [else-branch: 72 | i@90@01 < j@91@01 | live]
(push) ; 10
; [then-branch: 72 | !(i@90@01 < j@91@01)]
(assert (not (< i@90@01 j@91@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 72 | i@90@01 < j@91@01]
(assert (< i@90@01 j@91@01))
; [eval] j < length(a)
; [eval] length(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< i@90@01 j@91@01) (not (< i@90@01 j@91@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@90@01)
  (and (<= 0 i@90@01) (or (< i@90@01 j@91@01) (not (< i@90@01 j@91@01))))))
(assert (or (<= 0 i@90@01) (not (<= 0 i@90@01))))
(push) ; 7
; [then-branch: 73 | 0 <= i@90@01 && i@90@01 < j@91@01 && j@91@01 < length[Int](a@1@01) | live]
; [else-branch: 73 | !(0 <= i@90@01 && i@90@01 < j@91@01 && j@91@01 < length[Int](a@1@01)) | live]
(push) ; 8
; [then-branch: 73 | 0 <= i@90@01 && i@90@01 < j@91@01 && j@91@01 < length[Int](a@1@01)]
(assert (and (<= 0 i@90@01) (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01)))))
; [eval] loc(a, i).val <= loc(a, j).val
; [eval] loc(a, i)
(push) ; 9
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 i@90@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 i@90@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 i@90@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(push) ; 9
(assert (not (and
  (img@24@01 (loc<Ref> a@1@01 j@91@01))
  (and
    (<= 0 (inv@23@01 (loc<Ref> a@1@01 j@91@01)))
    (< (inv@23@01 (loc<Ref> a@1@01 j@91@01)) (length<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 73 | !(0 <= i@90@01 && i@90@01 < j@91@01 && j@91@01 < length[Int](a@1@01))]
(assert (not
  (and (<= 0 i@90@01) (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (<= 0 i@90@01) (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01))))
  (and (<= 0 i@90@01) (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@90@01)
      (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01)))))
  (and (<= 0 i@90@01) (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@90@01 Int) (j@91@01 Int)) (!
  (and
    (=>
      (<= 0 i@90@01)
      (and (<= 0 i@90@01) (or (< i@90@01 j@91@01) (not (< i@90@01 j@91@01)))))
    (or (<= 0 i@90@01) (not (<= 0 i@90@01)))
    (=>
      (and
        (<= 0 i@90@01)
        (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01))))
      (and (<= 0 i@90@01) (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01))))
    (or
      (not
        (and
          (<= 0 i@90@01)
          (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01)))))
      (and
        (<= 0 i@90@01)
        (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01))))))
  :pattern ((loc<Ref> a@1@01 i@90@01) (loc<Ref> a@1@01 j@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@16@11@16@86-aux|)))
(push) ; 6
(assert (not (forall ((i@90@01 Int) (j@91@01 Int)) (!
  (=>
    (and
      (<= 0 i@90@01)
      (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01))))
    (<=
      ($FVF.lookup_val (as sm@89@01  $FVF<val>) (loc<Ref> a@1@01 i@90@01))
      ($FVF.lookup_val (as sm@89@01  $FVF<val>) (loc<Ref> a@1@01 j@91@01))))
  :pattern ((loc<Ref> a@1@01 i@90@01) (loc<Ref> a@1@01 j@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@16@11@16@86|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@90@01 Int) (j@91@01 Int)) (!
  (=>
    (and
      (<= 0 i@90@01)
      (and (< i@90@01 j@91@01) (< j@91@01 (length<Int> a@1@01))))
    (<=
      ($FVF.lookup_val (as sm@89@01  $FVF<val>) (loc<Ref> a@1@01 i@90@01))
      ($FVF.lookup_val (as sm@89@01  $FVF<val>) (loc<Ref> a@1@01 j@91@01))))
  :pattern ((loc<Ref> a@1@01 i@90@01) (loc<Ref> a@1@01 j@91@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/dutch-flag.vpr@16@11@16@86|)))
(pop) ; 5
(push) ; 5
; [else-branch: 69 | unsorted@18@01 < blue@20@01]
(assert (< unsorted@18@01 blue@20@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
