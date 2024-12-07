(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr
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
(declare-sort IArray 0)
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
(declare-fun $SortWrappers.IArrayTo$Snap (IArray) $Snap)
(declare-fun $SortWrappers.$SnapToIArray ($Snap) IArray)
(assert (forall ((x IArray)) (!
    (= x ($SortWrappers.$SnapToIArray($SortWrappers.IArrayTo$Snap x)))
    :pattern (($SortWrappers.IArrayTo$Snap x))
    :qid |$Snap.$SnapToIArrayTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IArrayTo$Snap($SortWrappers.$SnapToIArray x)))
    :pattern (($SortWrappers.$SnapToIArray x))
    :qid |$Snap.IArrayTo$SnapToIArray|
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
(declare-fun loc<Ref> (IArray Int) $Ref)
(declare-fun len<Int> (IArray) Int)
(declare-fun first<IArray> ($Ref) IArray)
(declare-fun second<Int> ($Ref) Int)
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
(assert (forall ((a IArray) (i Int)) (!
  (and (= (first<IArray> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a IArray)) (!
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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- binary_search ----------
(declare-const a@0@01 IArray)
(declare-const key@1@01 Int)
(declare-const index@2@01 Int)
(declare-const a@3@01 IArray)
(declare-const key@4@01 Int)
(declare-const index@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(declare-const j@7@01 Int)
(push) ; 2
; [eval] 0 <= j && j < len(a)
; [eval] 0 <= j
(push) ; 3
; [then-branch: 0 | !(0 <= j@7@01) | live]
; [else-branch: 0 | 0 <= j@7@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= j@7@01)]
(assert (not (<= 0 j@7@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= j@7@01]
(assert (<= 0 j@7@01))
; [eval] j < len(a)
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@7@01) (not (<= 0 j@7@01))))
(assert (and (<= 0 j@7@01) (< j@7@01 (len<Int> a@3@01))))
; [eval] loc(a, j)
(pop) ; 2
(declare-fun inv@8@01 ($Ref) Int)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@7@01 Int)) (!
  (=>
    (and (<= 0 j@7@01) (< j@7@01 (len<Int> a@3@01)))
    (or (<= 0 j@7@01) (not (<= 0 j@7@01))))
  :pattern ((loc<Ref> a@3@01 j@7@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@7@01 Int) (j2@7@01 Int)) (!
  (=>
    (and
      (and (<= 0 j1@7@01) (< j1@7@01 (len<Int> a@3@01)))
      (and (<= 0 j2@7@01) (< j2@7@01 (len<Int> a@3@01)))
      (= (loc<Ref> a@3@01 j1@7@01) (loc<Ref> a@3@01 j2@7@01)))
    (= j1@7@01 j2@7@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@7@01 Int)) (!
  (=>
    (and (<= 0 j@7@01) (< j@7@01 (len<Int> a@3@01)))
    (and
      (= (inv@8@01 (loc<Ref> a@3@01 j@7@01)) j@7@01)
      (img@9@01 (loc<Ref> a@3@01 j@7@01))))
  :pattern ((loc<Ref> a@3@01 j@7@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@01 r)
      (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@8@01 r)) r))
  :pattern ((inv@8@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@7@01 Int)) (!
  (=>
    (and (<= 0 j@7@01) (< j@7@01 (len<Int> a@3@01)))
    (not (= (loc<Ref> a@3@01 j@7@01) $Ref.null)))
  :pattern ((loc<Ref> a@3@01 j@7@01))
  :qid |val-permImpliesNonNull|)))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { loc(a, i), loc(a, j) } 0 <= i && (j < len(a) && i < j) ==> loc(a, i).val < loc(a, j).val)
(declare-const i@10@01 Int)
(declare-const j@11@01 Int)
(push) ; 2
; [eval] 0 <= i && (j < len(a) && i < j) ==> loc(a, i).val < loc(a, j).val
; [eval] 0 <= i && (j < len(a) && i < j)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 1 | !(0 <= i@10@01) | live]
; [else-branch: 1 | 0 <= i@10@01 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= i@10@01)]
(assert (not (<= 0 i@10@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= i@10@01]
(assert (<= 0 i@10@01))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 5
; [then-branch: 2 | !(j@11@01 < len[Int](a@3@01)) | live]
; [else-branch: 2 | j@11@01 < len[Int](a@3@01) | live]
(push) ; 6
; [then-branch: 2 | !(j@11@01 < len[Int](a@3@01))]
(assert (not (< j@11@01 (len<Int> a@3@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | j@11@01 < len[Int](a@3@01)]
(assert (< j@11@01 (len<Int> a@3@01)))
; [eval] i < j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< j@11@01 (len<Int> a@3@01)) (not (< j@11@01 (len<Int> a@3@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@10@01)
  (and
    (<= 0 i@10@01)
    (or (< j@11@01 (len<Int> a@3@01)) (not (< j@11@01 (len<Int> a@3@01)))))))
(assert (or (<= 0 i@10@01) (not (<= 0 i@10@01))))
(push) ; 3
; [then-branch: 3 | 0 <= i@10@01 && j@11@01 < len[Int](a@3@01) && i@10@01 < j@11@01 | live]
; [else-branch: 3 | !(0 <= i@10@01 && j@11@01 < len[Int](a@3@01) && i@10@01 < j@11@01) | live]
(push) ; 4
; [then-branch: 3 | 0 <= i@10@01 && j@11@01 < len[Int](a@3@01) && i@10@01 < j@11@01]
(assert (and (<= 0 i@10@01) (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01))))
; [eval] loc(a, i).val < loc(a, j).val
; [eval] loc(a, i)
(push) ; 5
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 i@10@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 i@10@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 i@10@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(push) ; 5
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j@11@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j@11@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j@11@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(0 <= i@10@01 && j@11@01 < len[Int](a@3@01) && i@10@01 < j@11@01)]
(assert (not
  (and (<= 0 i@10@01) (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@10@01) (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01)))
  (and (<= 0 i@10@01) (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01))))
; Joined path conditions
(assert (or
  (not
    (and (<= 0 i@10@01) (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01))))
  (and (<= 0 i@10@01) (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@10@01 Int) (j@11@01 Int)) (!
  (and
    (=>
      (<= 0 i@10@01)
      (and
        (<= 0 i@10@01)
        (or (< j@11@01 (len<Int> a@3@01)) (not (< j@11@01 (len<Int> a@3@01))))))
    (or (<= 0 i@10@01) (not (<= 0 i@10@01)))
    (=>
      (and
        (<= 0 i@10@01)
        (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01)))
      (and (<= 0 i@10@01) (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01)))
    (or
      (not
        (and
          (<= 0 i@10@01)
          (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01))))
      (and
        (<= 0 i@10@01)
        (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01)))))
  :pattern ((loc<Ref> a@3@01 i@10@01) (loc<Ref> a@3@01 j@11@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@11@12@11@123-aux|)))
(assert (forall ((i@10@01 Int) (j@11@01 Int)) (!
  (=>
    (and (<= 0 i@10@01) (and (< j@11@01 (len<Int> a@3@01)) (< i@10@01 j@11@01)))
    (<
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 i@10@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j@11@01))))
  :pattern ((loc<Ref> a@3@01 i@10@01) (loc<Ref> a@3@01 j@11@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@11@12@11@123|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(declare-const j$0@13@01 Int)
(push) ; 3
; [eval] 0 <= j$0 && j$0 < len(a)
; [eval] 0 <= j$0
(push) ; 4
; [then-branch: 4 | !(0 <= j$0@13@01) | live]
; [else-branch: 4 | 0 <= j$0@13@01 | live]
(push) ; 5
; [then-branch: 4 | !(0 <= j$0@13@01)]
(assert (not (<= 0 j$0@13@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | 0 <= j$0@13@01]
(assert (<= 0 j$0@13@01))
; [eval] j$0 < len(a)
; [eval] len(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$0@13@01) (not (<= 0 j$0@13@01))))
(assert (and (<= 0 j$0@13@01) (< j$0@13@01 (len<Int> a@3@01))))
; [eval] loc(a, j$0)
(pop) ; 3
(declare-fun inv@14@01 ($Ref) Int)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j$0@13@01 Int)) (!
  (=>
    (and (<= 0 j$0@13@01) (< j$0@13@01 (len<Int> a@3@01)))
    (or (<= 0 j$0@13@01) (not (<= 0 j$0@13@01))))
  :pattern ((loc<Ref> a@3@01 j$0@13@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j$01@13@01 Int) (j$02@13@01 Int)) (!
  (=>
    (and
      (and (<= 0 j$01@13@01) (< j$01@13@01 (len<Int> a@3@01)))
      (and (<= 0 j$02@13@01) (< j$02@13@01 (len<Int> a@3@01)))
      (= (loc<Ref> a@3@01 j$01@13@01) (loc<Ref> a@3@01 j$02@13@01)))
    (= j$01@13@01 j$02@13@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j$0@13@01 Int)) (!
  (=>
    (and (<= 0 j$0@13@01) (< j$0@13@01 (len<Int> a@3@01)))
    (and
      (= (inv@14@01 (loc<Ref> a@3@01 j$0@13@01)) j$0@13@01)
      (img@15@01 (loc<Ref> a@3@01 j$0@13@01))))
  :pattern ((loc<Ref> a@3@01 j$0@13@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j$0@13@01 Int)) (!
  (=>
    (and (<= 0 j$0@13@01) (< j$0@13@01 (len<Int> a@3@01)))
    (not (= (loc<Ref> a@3@01 j$0@13@01) $Ref.null)))
  :pattern ((loc<Ref> a@3@01 j$0@13@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))
; [eval] (forall j$1: Int :: { old(loc(a, j$1)) } 0 <= j$1 && j$1 < len(a) ==> loc(a, j$1).val == old(loc(a, j$1).val))
(declare-const j$1@16@01 Int)
(push) ; 3
; [eval] 0 <= j$1 && j$1 < len(a) ==> loc(a, j$1).val == old(loc(a, j$1).val)
; [eval] 0 <= j$1 && j$1 < len(a)
; [eval] 0 <= j$1
(push) ; 4
; [then-branch: 5 | !(0 <= j$1@16@01) | live]
; [else-branch: 5 | 0 <= j$1@16@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= j$1@16@01)]
(assert (not (<= 0 j$1@16@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= j$1@16@01]
(assert (<= 0 j$1@16@01))
; [eval] j$1 < len(a)
; [eval] len(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$1@16@01) (not (<= 0 j$1@16@01))))
(push) ; 4
; [then-branch: 6 | 0 <= j$1@16@01 && j$1@16@01 < len[Int](a@3@01) | live]
; [else-branch: 6 | !(0 <= j$1@16@01 && j$1@16@01 < len[Int](a@3@01)) | live]
(push) ; 5
; [then-branch: 6 | 0 <= j$1@16@01 && j$1@16@01 < len[Int](a@3@01)]
(assert (and (<= 0 j$1@16@01) (< j$1@16@01 (len<Int> a@3@01))))
; [eval] loc(a, j$1).val == old(loc(a, j$1).val)
; [eval] loc(a, j$1)
(push) ; 6
(assert (not (and
  (img@15@01 (loc<Ref> a@3@01 j$1@16@01))
  (and
    (<= 0 (inv@14@01 (loc<Ref> a@3@01 j$1@16@01)))
    (< (inv@14@01 (loc<Ref> a@3@01 j$1@16@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, j$1).val)
; [eval] loc(a, j$1)
(push) ; 6
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j$1@16@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j$1@16@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j$1@16@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(0 <= j$1@16@01 && j$1@16@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 j$1@16@01) (< j$1@16@01 (len<Int> a@3@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 j$1@16@01) (< j$1@16@01 (len<Int> a@3@01))))
  (and (<= 0 j$1@16@01) (< j$1@16@01 (len<Int> a@3@01)))))
; [eval] old(loc(a, j$1))
; [eval] loc(a, j$1)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j$1@16@01 Int)) (!
  (and
    (or (<= 0 j$1@16@01) (not (<= 0 j$1@16@01)))
    (or
      (not (and (<= 0 j$1@16@01) (< j$1@16@01 (len<Int> a@3@01))))
      (and (<= 0 j$1@16@01) (< j$1@16@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 j$1@16@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@12@25@12@37-aux|)))
(assert (forall ((j$1@16@01 Int)) (!
  (=>
    (and (<= 0 j$1@16@01) (< j$1@16@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@3@01 j$1@16@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$1@16@01))))
  :pattern ((loc<Ref> a@3@01 j$1@16@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@12@25@12@37|)))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
; [eval] -1 <= index
; [eval] -1
(assert (<= (- 0 1) index@5@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] index < len(a)
; [eval] len(a)
(assert (< index@5@01 (len<Int> a@3@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  $Snap.unit))
; [eval] 0 <= index ==> loc(a, index).val == key
; [eval] 0 <= index
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (<= 0 index@5@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<= 0 index@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | 0 <= index@5@01 | live]
; [else-branch: 7 | !(0 <= index@5@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | 0 <= index@5@01]
(assert (<= 0 index@5@01))
; [eval] loc(a, index).val == key
; [eval] loc(a, index)
(push) ; 5
(assert (not (and
  (img@15@01 (loc<Ref> a@3@01 index@5@01))
  (and
    (<= 0 (inv@14@01 (loc<Ref> a@3@01 index@5@01)))
    (< (inv@14@01 (loc<Ref> a@3@01 index@5@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(0 <= index@5@01)]
(assert (not (<= 0 index@5@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 index@5@01)) (<= 0 index@5@01)))
(assert (=>
  (<= 0 index@5@01)
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@3@01 index@5@01))
    key@4@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  $Snap.unit))
; [eval] -1 == index ==> (forall i: Int :: { loc(a, i) } 0 <= i && i < len(a) ==> loc(a, i).val != key)
; [eval] -1 == index
; [eval] -1
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (- 0 1) index@5@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- 0 1) index@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | -1 == index@5@01 | live]
; [else-branch: 8 | -1 != index@5@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | -1 == index@5@01]
(assert (= (- 0 1) index@5@01))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < len(a) ==> loc(a, i).val != key)
(declare-const i@17@01 Int)
(push) ; 5
; [eval] 0 <= i && i < len(a) ==> loc(a, i).val != key
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 9 | !(0 <= i@17@01) | live]
; [else-branch: 9 | 0 <= i@17@01 | live]
(push) ; 7
; [then-branch: 9 | !(0 <= i@17@01)]
(assert (not (<= 0 i@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 9 | 0 <= i@17@01]
(assert (<= 0 i@17@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@17@01) (not (<= 0 i@17@01))))
(push) ; 6
; [then-branch: 10 | 0 <= i@17@01 && i@17@01 < len[Int](a@3@01) | live]
; [else-branch: 10 | !(0 <= i@17@01 && i@17@01 < len[Int](a@3@01)) | live]
(push) ; 7
; [then-branch: 10 | 0 <= i@17@01 && i@17@01 < len[Int](a@3@01)]
(assert (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01))))
; [eval] loc(a, i).val != key
; [eval] loc(a, i)
(push) ; 8
(assert (not (and
  (img@15@01 (loc<Ref> a@3@01 i@17@01))
  (and
    (<= 0 (inv@14@01 (loc<Ref> a@3@01 i@17@01)))
    (< (inv@14@01 (loc<Ref> a@3@01 i@17@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 10 | !(0 <= i@17@01 && i@17@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01))))
  (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@17@01 Int)) (!
  (and
    (or (<= 0 i@17@01) (not (<= 0 i@17@01)))
    (or
      (not (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01))))
      (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 i@17@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@15@29@15@90-aux|)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | -1 != index@5@01]
(assert (not (= (- 0 1) index@5@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= (- 0 1) index@5@01)
  (and
    (= (- 0 1) index@5@01)
    (forall ((i@17@01 Int)) (!
      (and
        (or (<= 0 i@17@01) (not (<= 0 i@17@01)))
        (or
          (not (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01))))
          (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01)))))
      :pattern ((loc<Ref> a@3@01 i@17@01))
      :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@15@29@15@90-aux|)))))
; Joined path conditions
(assert (or (not (= (- 0 1) index@5@01)) (= (- 0 1) index@5@01)))
(assert (=>
  (= (- 0 1) index@5@01)
  (forall ((i@17@01 Int)) (!
    (=>
      (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@3@01)))
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@3@01 i@17@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@17@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@15@29@15@90|))))
(pop) ; 2
(push) ; 2
; [exec]
; var low: Int
(declare-const low@18@01 Int)
; [exec]
; var high: Int
(declare-const high@19@01 Int)
; [exec]
; low := 0
; [exec]
; high := len(a)
; [eval] len(a)
(declare-const high@20@01 Int)
(assert (= high@20@01 (len<Int> a@3@01)))
; [exec]
; index := -1
; [eval] -1
(declare-const mid@21@01 Int)
(declare-const low@22@01 Int)
(declare-const high@23@01 Int)
(declare-const index@24@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(declare-const j$2@26@01 Int)
(push) ; 4
; [eval] 0 <= j$2 && j$2 < len(a)
; [eval] 0 <= j$2
(push) ; 5
; [then-branch: 11 | !(0 <= j$2@26@01) | live]
; [else-branch: 11 | 0 <= j$2@26@01 | live]
(push) ; 6
; [then-branch: 11 | !(0 <= j$2@26@01)]
(assert (not (<= 0 j$2@26@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | 0 <= j$2@26@01]
(assert (<= 0 j$2@26@01))
; [eval] j$2 < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$2@26@01) (not (<= 0 j$2@26@01))))
(assert (and (<= 0 j$2@26@01) (< j$2@26@01 (len<Int> a@3@01))))
; [eval] loc(a, j$2)
(pop) ; 4
(declare-fun inv@27@01 ($Ref) Int)
(declare-fun img@28@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j$2@26@01 Int)) (!
  (=>
    (and (<= 0 j$2@26@01) (< j$2@26@01 (len<Int> a@3@01)))
    (or (<= 0 j$2@26@01) (not (<= 0 j$2@26@01))))
  :pattern ((loc<Ref> a@3@01 j$2@26@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j$21@26@01 Int) (j$22@26@01 Int)) (!
  (=>
    (and
      (and (<= 0 j$21@26@01) (< j$21@26@01 (len<Int> a@3@01)))
      (and (<= 0 j$22@26@01) (< j$22@26@01 (len<Int> a@3@01)))
      (= (loc<Ref> a@3@01 j$21@26@01) (loc<Ref> a@3@01 j$22@26@01)))
    (= j$21@26@01 j$22@26@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j$2@26@01 Int)) (!
  (=>
    (and (<= 0 j$2@26@01) (< j$2@26@01 (len<Int> a@3@01)))
    (and
      (= (inv@27@01 (loc<Ref> a@3@01 j$2@26@01)) j$2@26@01)
      (img@28@01 (loc<Ref> a@3@01 j$2@26@01))))
  :pattern ((loc<Ref> a@3@01 j$2@26@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@27@01 r)) r))
  :pattern ((inv@27@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j$2@26@01 Int)) (!
  (=>
    (and (<= 0 j$2@26@01) (< j$2@26@01 (len<Int> a@3@01)))
    (not (= (loc<Ref> a@3@01 j$2@26@01) $Ref.null)))
  :pattern ((loc<Ref> a@3@01 j$2@26@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.first ($Snap.second $t@25@01)) $Snap.unit))
; [eval] (forall j$3: Int :: { old(loc(a, j$3)) } 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val))
(declare-const j$3@29@01 Int)
(push) ; 4
; [eval] 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] 0 <= j$3 && j$3 < len(a)
; [eval] 0 <= j$3
(push) ; 5
; [then-branch: 12 | !(0 <= j$3@29@01) | live]
; [else-branch: 12 | 0 <= j$3@29@01 | live]
(push) ; 6
; [then-branch: 12 | !(0 <= j$3@29@01)]
(assert (not (<= 0 j$3@29@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | 0 <= j$3@29@01]
(assert (<= 0 j$3@29@01))
; [eval] j$3 < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$3@29@01) (not (<= 0 j$3@29@01))))
(push) ; 5
; [then-branch: 13 | 0 <= j$3@29@01 && j$3@29@01 < len[Int](a@3@01) | live]
; [else-branch: 13 | !(0 <= j$3@29@01 && j$3@29@01 < len[Int](a@3@01)) | live]
(push) ; 6
; [then-branch: 13 | 0 <= j$3@29@01 && j$3@29@01 < len[Int](a@3@01)]
(assert (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01))))
; [eval] loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 7
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 j$3@29@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 j$3@29@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 j$3@29@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 7
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j$3@29@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j$3@29@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j$3@29@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 13 | !(0 <= j$3@29@01 && j$3@29@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01))))
  (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01)))))
; [eval] old(loc(a, j$3))
; [eval] loc(a, j$3)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j$3@29@01 Int)) (!
  (and
    (or (<= 0 j$3@29@01) (not (<= 0 j$3@29@01)))
    (or
      (not (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01))))
      (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 j$3@29@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40-aux|)))
(assert (forall ((j$3@29@01 Int)) (!
  (=>
    (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 j$3@29@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$3@29@01))))
  :pattern ((loc<Ref> a@3@01 j$3@29@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40|)))
(assert (=
  ($Snap.second ($Snap.second $t@25@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@25@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@25@01))) $Snap.unit))
; [eval] 0 <= low
(assert (<= 0 low@22@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@25@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
  $Snap.unit))
; [eval] low <= high
(assert (<= low@22@01 high@23@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))
  $Snap.unit))
; [eval] high <= len(a)
; [eval] len(a)
(assert (<= high@23@01 (len<Int> a@3@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
  $Snap.unit))
; [eval] index == -1 ==> (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
; [eval] index == -1
; [eval] -1
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= index@24@01 (- 0 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= index@24@01 (- 0 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | index@24@01 == -1 | live]
; [else-branch: 14 | index@24@01 != -1 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | index@24@01 == -1]
(assert (= index@24@01 (- 0 1)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
(declare-const i@30@01 Int)
(push) ; 6
; [eval] 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key
; [eval] 0 <= i && (i < len(a) && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 7
; [then-branch: 15 | !(0 <= i@30@01) | live]
; [else-branch: 15 | 0 <= i@30@01 | live]
(push) ; 8
; [then-branch: 15 | !(0 <= i@30@01)]
(assert (not (<= 0 i@30@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 15 | 0 <= i@30@01]
(assert (<= 0 i@30@01))
; [eval] i < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 16 | !(i@30@01 < len[Int](a@3@01)) | live]
; [else-branch: 16 | i@30@01 < len[Int](a@3@01) | live]
(push) ; 10
; [then-branch: 16 | !(i@30@01 < len[Int](a@3@01))]
(assert (not (< i@30@01 (len<Int> a@3@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 16 | i@30@01 < len[Int](a@3@01)]
(assert (< i@30@01 (len<Int> a@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 11
; [then-branch: 17 | !(low@22@01 <= i@30@01) | live]
; [else-branch: 17 | low@22@01 <= i@30@01 | live]
(push) ; 12
; [then-branch: 17 | !(low@22@01 <= i@30@01)]
(assert (not (<= low@22@01 i@30@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 17 | low@22@01 <= i@30@01]
(assert (<= low@22@01 i@30@01))
; [eval] i < high
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (<= low@22@01 i@30@01) (not (<= low@22@01 i@30@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@30@01 (len<Int> a@3@01))
  (and
    (< i@30@01 (len<Int> a@3@01))
    (or (<= low@22@01 i@30@01) (not (<= low@22@01 i@30@01))))))
(assert (or (< i@30@01 (len<Int> a@3@01)) (not (< i@30@01 (len<Int> a@3@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@30@01)
  (and
    (<= 0 i@30@01)
    (=>
      (< i@30@01 (len<Int> a@3@01))
      (and
        (< i@30@01 (len<Int> a@3@01))
        (or (<= low@22@01 i@30@01) (not (<= low@22@01 i@30@01)))))
    (or (< i@30@01 (len<Int> a@3@01)) (not (< i@30@01 (len<Int> a@3@01)))))))
(assert (or (<= 0 i@30@01) (not (<= 0 i@30@01))))
(push) ; 7
; [then-branch: 18 | 0 <= i@30@01 && i@30@01 < len[Int](a@3@01) && !(low@22@01 <= i@30@01 && i@30@01 < high@23@01) | live]
; [else-branch: 18 | !(0 <= i@30@01 && i@30@01 < len[Int](a@3@01) && !(low@22@01 <= i@30@01 && i@30@01 < high@23@01)) | live]
(push) ; 8
; [then-branch: 18 | 0 <= i@30@01 && i@30@01 < len[Int](a@3@01) && !(low@22@01 <= i@30@01 && i@30@01 < high@23@01)]
(assert (and
  (<= 0 i@30@01)
  (and
    (< i@30@01 (len<Int> a@3@01))
    (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01))))))
; [eval] loc(a, i).val != key
; [eval] loc(a, i)
(push) ; 9
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 i@30@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 i@30@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 i@30@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 18 | !(0 <= i@30@01 && i@30@01 < len[Int](a@3@01) && !(low@22@01 <= i@30@01 && i@30@01 < high@23@01))]
(assert (not
  (and
    (<= 0 i@30@01)
    (and
      (< i@30@01 (len<Int> a@3@01))
      (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@30@01)
    (and
      (< i@30@01 (len<Int> a@3@01))
      (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
  (and
    (<= 0 i@30@01)
    (< i@30@01 (len<Int> a@3@01))
    (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@30@01)
      (and
        (< i@30@01 (len<Int> a@3@01))
        (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01))))))
  (and
    (<= 0 i@30@01)
    (and
      (< i@30@01 (len<Int> a@3@01))
      (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@30@01 Int)) (!
  (and
    (=>
      (<= 0 i@30@01)
      (and
        (<= 0 i@30@01)
        (=>
          (< i@30@01 (len<Int> a@3@01))
          (and
            (< i@30@01 (len<Int> a@3@01))
            (or (<= low@22@01 i@30@01) (not (<= low@22@01 i@30@01)))))
        (or (< i@30@01 (len<Int> a@3@01)) (not (< i@30@01 (len<Int> a@3@01))))))
    (or (<= 0 i@30@01) (not (<= 0 i@30@01)))
    (=>
      (and
        (<= 0 i@30@01)
        (and
          (< i@30@01 (len<Int> a@3@01))
          (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
      (and
        (<= 0 i@30@01)
        (< i@30@01 (len<Int> a@3@01))
        (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
    (or
      (not
        (and
          (<= 0 i@30@01)
          (and
            (< i@30@01 (len<Int> a@3@01))
            (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01))))))
      (and
        (<= 0 i@30@01)
        (and
          (< i@30@01 (len<Int> a@3@01))
          (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))))
  :pattern ((loc<Ref> a@3@01 i@30@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | index@24@01 != -1]
(assert (not (= index@24@01 (- 0 1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (= index@24@01 (- 0 1))
  (and
    (= index@24@01 (- 0 1))
    (forall ((i@30@01 Int)) (!
      (and
        (=>
          (<= 0 i@30@01)
          (and
            (<= 0 i@30@01)
            (=>
              (< i@30@01 (len<Int> a@3@01))
              (and
                (< i@30@01 (len<Int> a@3@01))
                (or (<= low@22@01 i@30@01) (not (<= low@22@01 i@30@01)))))
            (or
              (< i@30@01 (len<Int> a@3@01))
              (not (< i@30@01 (len<Int> a@3@01))))))
        (or (<= 0 i@30@01) (not (<= 0 i@30@01)))
        (=>
          (and
            (<= 0 i@30@01)
            (and
              (< i@30@01 (len<Int> a@3@01))
              (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
          (and
            (<= 0 i@30@01)
            (< i@30@01 (len<Int> a@3@01))
            (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
        (or
          (not
            (and
              (<= 0 i@30@01)
              (and
                (< i@30@01 (len<Int> a@3@01))
                (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01))))))
          (and
            (<= 0 i@30@01)
            (and
              (< i@30@01 (len<Int> a@3@01))
              (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))))
      :pattern ((loc<Ref> a@3@01 i@30@01))
      :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))))
; Joined path conditions
(assert (or (not (= index@24@01 (- 0 1))) (= index@24@01 (- 0 1))))
(assert (=>
  (= index@24@01 (- 0 1))
  (forall ((i@30@01 Int)) (!
    (=>
      (and
        (<= 0 i@30@01)
        (and
          (< i@30@01 (len<Int> a@3@01))
          (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 i@30@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@30@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133|))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
  $Snap.unit))
; [eval] -1 <= index
; [eval] -1
(assert (<= (- 0 1) index@24@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))
  $Snap.unit))
; [eval] index < len(a)
; [eval] len(a)
(assert (< index@24@01 (len<Int> a@3@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))
  $Snap.unit))
; [eval] 0 <= index ==> loc(a, index).val == key
; [eval] 0 <= index
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= 0 index@24@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= 0 index@24@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | 0 <= index@24@01 | live]
; [else-branch: 19 | !(0 <= index@24@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | 0 <= index@24@01]
(assert (<= 0 index@24@01))
; [eval] loc(a, index).val == key
; [eval] loc(a, index)
(push) ; 6
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 index@24@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 index@24@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 index@24@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 19 | !(0 <= index@24@01)]
(assert (not (<= 0 index@24@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 index@24@01)) (<= 0 index@24@01)))
(assert (=>
  (<= 0 index@24@01)
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 index@24@01))
    key@4@01)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(declare-const j$2@31@01 Int)
(push) ; 4
; [eval] 0 <= j$2 && j$2 < len(a)
; [eval] 0 <= j$2
(push) ; 5
; [then-branch: 20 | !(0 <= j$2@31@01) | live]
; [else-branch: 20 | 0 <= j$2@31@01 | live]
(push) ; 6
; [then-branch: 20 | !(0 <= j$2@31@01)]
(assert (not (<= 0 j$2@31@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 20 | 0 <= j$2@31@01]
(assert (<= 0 j$2@31@01))
; [eval] j$2 < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$2@31@01) (not (<= 0 j$2@31@01))))
(assert (and (<= 0 j$2@31@01) (< j$2@31@01 (len<Int> a@3@01))))
; [eval] loc(a, j$2)
(pop) ; 4
(declare-fun inv@32@01 ($Ref) Int)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j$2@31@01 Int)) (!
  (=>
    (and (<= 0 j$2@31@01) (< j$2@31@01 (len<Int> a@3@01)))
    (or (<= 0 j$2@31@01) (not (<= 0 j$2@31@01))))
  :pattern ((loc<Ref> a@3@01 j$2@31@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j$21@31@01 Int) (j$22@31@01 Int)) (!
  (=>
    (and
      (and (<= 0 j$21@31@01) (< j$21@31@01 (len<Int> a@3@01)))
      (and (<= 0 j$22@31@01) (< j$22@31@01 (len<Int> a@3@01)))
      (= (loc<Ref> a@3@01 j$21@31@01) (loc<Ref> a@3@01 j$22@31@01)))
    (= j$21@31@01 j$22@31@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j$2@31@01 Int)) (!
  (=>
    (and (<= 0 j$2@31@01) (< j$2@31@01 (len<Int> a@3@01)))
    (and
      (= (inv@32@01 (loc<Ref> a@3@01 j$2@31@01)) j$2@31@01)
      (img@33@01 (loc<Ref> a@3@01 j$2@31@01))))
  :pattern ((loc<Ref> a@3@01 j$2@31@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@32@01 r)) r))
  :pattern ((inv@32@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (len<Int> a@3@01)))
      (img@33@01 r)
      (= r (loc<Ref> a@3@01 (inv@32@01 r))))
    ($Perm.min
      (ite
        (and
          (img@9@01 r)
          (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) (len<Int> a@3@01))))
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
          (img@9@01 r)
          (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) (len<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@34@01 r))
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
      (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) (len<Int> a@3@01)))
      (img@33@01 r)
      (= r (loc<Ref> a@3@01 (inv@32@01 r))))
    (= (- $Perm.Write (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@35@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@01 r)
      (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) (len<Int> a@3@01))))
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef0|)))
; [eval] (forall j$3: Int :: { old(loc(a, j$3)) } 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val))
(declare-const j$3@36@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] 0 <= j$3 && j$3 < len(a)
; [eval] 0 <= j$3
(push) ; 5
; [then-branch: 21 | !(0 <= j$3@36@01) | live]
; [else-branch: 21 | 0 <= j$3@36@01 | live]
(push) ; 6
; [then-branch: 21 | !(0 <= j$3@36@01)]
(assert (not (<= 0 j$3@36@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 21 | 0 <= j$3@36@01]
(assert (<= 0 j$3@36@01))
; [eval] j$3 < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$3@36@01) (not (<= 0 j$3@36@01))))
(push) ; 5
; [then-branch: 22 | 0 <= j$3@36@01 && j$3@36@01 < len[Int](a@3@01) | live]
; [else-branch: 22 | !(0 <= j$3@36@01 && j$3@36@01 < len[Int](a@3@01)) | live]
(push) ; 6
; [then-branch: 22 | 0 <= j$3@36@01 && j$3@36@01 < len[Int](a@3@01)]
(assert (and (<= 0 j$3@36@01) (< j$3@36@01 (len<Int> a@3@01))))
; [eval] loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 7
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j$3@36@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j$3@36@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j$3@36@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 7
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j$3@36@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j$3@36@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j$3@36@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(0 <= j$3@36@01 && j$3@36@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 j$3@36@01) (< j$3@36@01 (len<Int> a@3@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 j$3@36@01) (< j$3@36@01 (len<Int> a@3@01))))
  (and (<= 0 j$3@36@01) (< j$3@36@01 (len<Int> a@3@01)))))
; [eval] old(loc(a, j$3))
; [eval] loc(a, j$3)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j$3@36@01 Int)) (!
  (and
    (or (<= 0 j$3@36@01) (not (<= 0 j$3@36@01)))
    (or
      (not (and (<= 0 j$3@36@01) (< j$3@36@01 (len<Int> a@3@01))))
      (and (<= 0 j$3@36@01) (< j$3@36@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 j$3@36@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40-aux|)))
; [eval] 0 <= low
; [eval] low <= high
(push) ; 4
(assert (not (<= 0 high@20@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 high@20@01))
; [eval] high <= len(a)
; [eval] len(a)
(push) ; 4
(assert (not (<= high@20@01 (len<Int> a@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= high@20@01 (len<Int> a@3@01)))
; [eval] index == -1 ==> (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
; [eval] index == -1
; [eval] -1
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | True]
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
(declare-const i@37@01 Int)
(push) ; 6
; [eval] 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key
; [eval] 0 <= i && (i < len(a) && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 7
; [then-branch: 24 | !(0 <= i@37@01) | live]
; [else-branch: 24 | 0 <= i@37@01 | live]
(push) ; 8
; [then-branch: 24 | !(0 <= i@37@01)]
(assert (not (<= 0 i@37@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 24 | 0 <= i@37@01]
(assert (<= 0 i@37@01))
; [eval] i < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 25 | !(i@37@01 < len[Int](a@3@01)) | live]
; [else-branch: 25 | i@37@01 < len[Int](a@3@01) | live]
(push) ; 10
; [then-branch: 25 | !(i@37@01 < len[Int](a@3@01))]
(assert (not (< i@37@01 (len<Int> a@3@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 25 | i@37@01 < len[Int](a@3@01)]
(assert (< i@37@01 (len<Int> a@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 11
; [then-branch: 26 | !(0 <= i@37@01) | live]
; [else-branch: 26 | 0 <= i@37@01 | live]
(push) ; 12
; [then-branch: 26 | !(0 <= i@37@01)]
(assert (not (<= 0 i@37@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 26 | 0 <= i@37@01]
; [eval] i < high
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@37@01 (len<Int> a@3@01))
  (and (< i@37@01 (len<Int> a@3@01)) (or (<= 0 i@37@01) (not (<= 0 i@37@01))))))
(assert (or (< i@37@01 (len<Int> a@3@01)) (not (< i@37@01 (len<Int> a@3@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@37@01)
  (and
    (<= 0 i@37@01)
    (=>
      (< i@37@01 (len<Int> a@3@01))
      (and
        (< i@37@01 (len<Int> a@3@01))
        (or (<= 0 i@37@01) (not (<= 0 i@37@01)))))
    (or (< i@37@01 (len<Int> a@3@01)) (not (< i@37@01 (len<Int> a@3@01)))))))
(assert (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
(push) ; 7
; [then-branch: 27 | 0 <= i@37@01 && i@37@01 < len[Int](a@3@01) && !(0 <= i@37@01 && i@37@01 < high@20@01) | live]
; [else-branch: 27 | !(0 <= i@37@01 && i@37@01 < len[Int](a@3@01) && !(0 <= i@37@01 && i@37@01 < high@20@01)) | live]
(push) ; 8
; [then-branch: 27 | 0 <= i@37@01 && i@37@01 < len[Int](a@3@01) && !(0 <= i@37@01 && i@37@01 < high@20@01)]
(assert (and
  (<= 0 i@37@01)
  (and
    (< i@37@01 (len<Int> a@3@01))
    (not (and (<= 0 i@37@01) (< i@37@01 high@20@01))))))
; [eval] loc(a, i).val != key
; [eval] loc(a, i)
(push) ; 9
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 i@37@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 i@37@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 i@37@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 27 | !(0 <= i@37@01 && i@37@01 < len[Int](a@3@01) && !(0 <= i@37@01 && i@37@01 < high@20@01))]
(assert (not
  (and
    (<= 0 i@37@01)
    (and
      (< i@37@01 (len<Int> a@3@01))
      (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@37@01)
    (and
      (< i@37@01 (len<Int> a@3@01))
      (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))
  (and
    (<= 0 i@37@01)
    (< i@37@01 (len<Int> a@3@01))
    (not (and (<= 0 i@37@01) (< i@37@01 high@20@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@37@01)
      (and
        (< i@37@01 (len<Int> a@3@01))
        (not (and (<= 0 i@37@01) (< i@37@01 high@20@01))))))
  (and
    (<= 0 i@37@01)
    (and
      (< i@37@01 (len<Int> a@3@01))
      (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@37@01 Int)) (!
  (and
    (=>
      (<= 0 i@37@01)
      (and
        (<= 0 i@37@01)
        (=>
          (< i@37@01 (len<Int> a@3@01))
          (and
            (< i@37@01 (len<Int> a@3@01))
            (or (<= 0 i@37@01) (not (<= 0 i@37@01)))))
        (or (< i@37@01 (len<Int> a@3@01)) (not (< i@37@01 (len<Int> a@3@01))))))
    (or (<= 0 i@37@01) (not (<= 0 i@37@01)))
    (=>
      (and
        (<= 0 i@37@01)
        (and
          (< i@37@01 (len<Int> a@3@01))
          (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))
      (and
        (<= 0 i@37@01)
        (< i@37@01 (len<Int> a@3@01))
        (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))
    (or
      (not
        (and
          (<= 0 i@37@01)
          (and
            (< i@37@01 (len<Int> a@3@01))
            (not (and (<= 0 i@37@01) (< i@37@01 high@20@01))))))
      (and
        (<= 0 i@37@01)
        (and
          (< i@37@01 (len<Int> a@3@01))
          (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))))
  :pattern ((loc<Ref> a@3@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((i@37@01 Int)) (!
  (and
    (=>
      (<= 0 i@37@01)
      (and
        (<= 0 i@37@01)
        (=>
          (< i@37@01 (len<Int> a@3@01))
          (and
            (< i@37@01 (len<Int> a@3@01))
            (or (<= 0 i@37@01) (not (<= 0 i@37@01)))))
        (or (< i@37@01 (len<Int> a@3@01)) (not (< i@37@01 (len<Int> a@3@01))))))
    (or (<= 0 i@37@01) (not (<= 0 i@37@01)))
    (=>
      (and
        (<= 0 i@37@01)
        (and
          (< i@37@01 (len<Int> a@3@01))
          (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))
      (and
        (<= 0 i@37@01)
        (< i@37@01 (len<Int> a@3@01))
        (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))
    (or
      (not
        (and
          (<= 0 i@37@01)
          (and
            (< i@37@01 (len<Int> a@3@01))
            (not (and (<= 0 i@37@01) (< i@37@01 high@20@01))))))
      (and
        (<= 0 i@37@01)
        (and
          (< i@37@01 (len<Int> a@3@01))
          (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))))
  :pattern ((loc<Ref> a@3@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))
(push) ; 4
(assert (not (forall ((i@37@01 Int)) (!
  (=>
    (and
      (<= 0 i@37@01)
      (and
        (< i@37@01 (len<Int> a@3@01))
        (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))
    (not
      (=
        ($FVF.lookup_val (as sm@35@01  $FVF<val>) (loc<Ref> a@3@01 i@37@01))
        key@4@01)))
  :pattern ((loc<Ref> a@3@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and
      (<= 0 i@37@01)
      (and
        (< i@37@01 (len<Int> a@3@01))
        (not (and (<= 0 i@37@01) (< i@37@01 high@20@01)))))
    (not
      (=
        ($FVF.lookup_val (as sm@35@01  $FVF<val>) (loc<Ref> a@3@01 i@37@01))
        key@4@01)))
  :pattern ((loc<Ref> a@3@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133|)))
; [eval] -1 <= index
; [eval] -1
; [eval] index < len(a)
; [eval] len(a)
(push) ; 4
(assert (not (< (- 0 1) (len<Int> a@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (- 0 1) (len<Int> a@3@01)))
; [eval] 0 <= index ==> loc(a, index).val == key
; [eval] 0 <= index
(push) ; 4
; [then-branch: 28 | False | dead]
; [else-branch: 28 | True | live]
(push) ; 5
; [else-branch: 28 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@27@01 r)) r))
  :pattern ((inv@27@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((j$2@26@01 Int)) (!
  (=>
    (and (<= 0 j$2@26@01) (< j$2@26@01 (len<Int> a@3@01)))
    (and
      (= (inv@27@01 (loc<Ref> a@3@01 j$2@26@01)) j$2@26@01)
      (img@28@01 (loc<Ref> a@3@01 j$2@26@01))))
  :pattern ((loc<Ref> a@3@01 j$2@26@01))
  :qid |quant-u-5|)))
(assert (forall ((j$2@26@01 Int)) (!
  (=>
    (and (<= 0 j$2@26@01) (< j$2@26@01 (len<Int> a@3@01)))
    (not (= (loc<Ref> a@3@01 j$2@26@01) $Ref.null)))
  :pattern ((loc<Ref> a@3@01 j$2@26@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.first ($Snap.second $t@25@01)) $Snap.unit))
(assert (forall ((j$3@29@01 Int)) (!
  (and
    (or (<= 0 j$3@29@01) (not (<= 0 j$3@29@01)))
    (or
      (not (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01))))
      (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 j$3@29@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40-aux|)))
(assert (forall ((j$3@29@01 Int)) (!
  (=>
    (and (<= 0 j$3@29@01) (< j$3@29@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 j$3@29@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$3@29@01))))
  :pattern ((loc<Ref> a@3@01 j$3@29@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40|)))
(assert (=
  ($Snap.second ($Snap.second $t@25@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@25@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@25@01))) $Snap.unit))
(assert (<= 0 low@22@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@25@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
  $Snap.unit))
(assert (<= low@22@01 high@23@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))
  $Snap.unit))
(assert (<= high@23@01 (len<Int> a@3@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
  $Snap.unit))
(assert (=>
  (= index@24@01 (- 0 1))
  (and
    (= index@24@01 (- 0 1))
    (forall ((i@30@01 Int)) (!
      (and
        (=>
          (<= 0 i@30@01)
          (and
            (<= 0 i@30@01)
            (=>
              (< i@30@01 (len<Int> a@3@01))
              (and
                (< i@30@01 (len<Int> a@3@01))
                (or (<= low@22@01 i@30@01) (not (<= low@22@01 i@30@01)))))
            (or
              (< i@30@01 (len<Int> a@3@01))
              (not (< i@30@01 (len<Int> a@3@01))))))
        (or (<= 0 i@30@01) (not (<= 0 i@30@01)))
        (=>
          (and
            (<= 0 i@30@01)
            (and
              (< i@30@01 (len<Int> a@3@01))
              (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
          (and
            (<= 0 i@30@01)
            (< i@30@01 (len<Int> a@3@01))
            (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
        (or
          (not
            (and
              (<= 0 i@30@01)
              (and
                (< i@30@01 (len<Int> a@3@01))
                (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01))))))
          (and
            (<= 0 i@30@01)
            (and
              (< i@30@01 (len<Int> a@3@01))
              (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))))
      :pattern ((loc<Ref> a@3@01 i@30@01))
      :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))))
(assert (or (not (= index@24@01 (- 0 1))) (= index@24@01 (- 0 1))))
(assert (=>
  (= index@24@01 (- 0 1))
  (forall ((i@30@01 Int)) (!
    (=>
      (and
        (<= 0 i@30@01)
        (and
          (< i@30@01 (len<Int> a@3@01))
          (not (and (<= low@22@01 i@30@01) (< i@30@01 high@23@01)))))
      (not
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 i@30@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@30@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133|))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
  $Snap.unit))
(assert (<= (- 0 1) index@24@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))
  $Snap.unit))
(assert (< index@24@01 (len<Int> a@3@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))))
  $Snap.unit))
(assert (or (not (<= 0 index@24@01)) (<= 0 index@24@01)))
(assert (=>
  (<= 0 index@24@01)
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 index@24@01))
    key@4@01)))
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (forall ((j$2@26@01 Int)) (!
  (=>
    (and (<= 0 j$2@26@01) (< j$2@26@01 (len<Int> a@3@01)))
    (or (<= 0 j$2@26@01) (not (<= 0 j$2@26@01))))
  :pattern ((loc<Ref> a@3@01 j$2@26@01))
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
; [eval] low < high
(pop) ; 5
(push) ; 5
; [eval] !(low < high)
; [eval] low < high
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] low < high
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< low@22@01 high@23@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< low@22@01 high@23@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | low@22@01 < high@23@01 | live]
; [else-branch: 29 | !(low@22@01 < high@23@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 29 | low@22@01 < high@23@01]
(assert (< low@22@01 high@23@01))
; [exec]
; var mid: Int
(declare-const mid@38@01 Int)
; [exec]
; mid := (low + high) / 2
; [eval] (low + high) / 2
; [eval] low + high
(declare-const mid@39@01 Int)
(assert (= mid@39@01 (div (+ low@22@01 high@23@01) 2)))
; [eval] loc(a, mid).val < key
; [eval] loc(a, mid)
(push) ; 6
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 mid@39@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 mid@39@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 mid@39@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (<
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))
    key@4@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))
  key@4@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) < key@4@01 | live]
; [else-branch: 30 | !(Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) < key@4@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 30 | Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) < key@4@01]
(assert (<
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))
  key@4@01))
; [exec]
; low := mid + 1
; [eval] mid + 1
(declare-const low@40@01 Int)
(assert (= low@40@01 (+ mid@39@01 1)))
; Loop head block: Re-establish invariant
(declare-const j$2@41@01 Int)
(push) ; 7
; [eval] 0 <= j$2 && j$2 < len(a)
; [eval] 0 <= j$2
(push) ; 8
; [then-branch: 31 | !(0 <= j$2@41@01) | live]
; [else-branch: 31 | 0 <= j$2@41@01 | live]
(push) ; 9
; [then-branch: 31 | !(0 <= j$2@41@01)]
(assert (not (<= 0 j$2@41@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 31 | 0 <= j$2@41@01]
(assert (<= 0 j$2@41@01))
; [eval] j$2 < len(a)
; [eval] len(a)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$2@41@01) (not (<= 0 j$2@41@01))))
(assert (and (<= 0 j$2@41@01) (< j$2@41@01 (len<Int> a@3@01))))
; [eval] loc(a, j$2)
(pop) ; 7
(declare-fun inv@42@01 ($Ref) Int)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j$2@41@01 Int)) (!
  (=>
    (and (<= 0 j$2@41@01) (< j$2@41@01 (len<Int> a@3@01)))
    (or (<= 0 j$2@41@01) (not (<= 0 j$2@41@01))))
  :pattern ((loc<Ref> a@3@01 j$2@41@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((j$21@41@01 Int) (j$22@41@01 Int)) (!
  (=>
    (and
      (and (<= 0 j$21@41@01) (< j$21@41@01 (len<Int> a@3@01)))
      (and (<= 0 j$22@41@01) (< j$22@41@01 (len<Int> a@3@01)))
      (= (loc<Ref> a@3@01 j$21@41@01) (loc<Ref> a@3@01 j$22@41@01)))
    (= j$21@41@01 j$22@41@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j$2@41@01 Int)) (!
  (=>
    (and (<= 0 j$2@41@01) (< j$2@41@01 (len<Int> a@3@01)))
    (and
      (= (inv@42@01 (loc<Ref> a@3@01 j$2@41@01)) j$2@41@01)
      (img@43@01 (loc<Ref> a@3@01 j$2@41@01))))
  :pattern ((loc<Ref> a@3@01 j$2@41@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@01 r)
      (and (<= 0 (inv@42@01 r)) (< (inv@42@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@42@01 r)) r))
  :pattern ((inv@42@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@44@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@42@01 r)) (< (inv@42@01 r) (len<Int> a@3@01)))
      (img@43@01 r)
      (= r (loc<Ref> a@3@01 (inv@42@01 r))))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
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
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
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
      (and (<= 0 (inv@42@01 r)) (< (inv@42@01 r) (len<Int> a@3@01)))
      (img@43@01 r)
      (= r (loc<Ref> a@3@01 (inv@42@01 r))))
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
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) r))
  :qid |qp.fvfValDef1|)))
; [eval] (forall j$3: Int :: { old(loc(a, j$3)) } 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val))
(declare-const j$3@46@01 Int)
(set-option :timeout 0)
(push) ; 7
; [eval] 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] 0 <= j$3 && j$3 < len(a)
; [eval] 0 <= j$3
(push) ; 8
; [then-branch: 32 | !(0 <= j$3@46@01) | live]
; [else-branch: 32 | 0 <= j$3@46@01 | live]
(push) ; 9
; [then-branch: 32 | !(0 <= j$3@46@01)]
(assert (not (<= 0 j$3@46@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 32 | 0 <= j$3@46@01]
(assert (<= 0 j$3@46@01))
; [eval] j$3 < len(a)
; [eval] len(a)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$3@46@01) (not (<= 0 j$3@46@01))))
(push) ; 8
; [then-branch: 33 | 0 <= j$3@46@01 && j$3@46@01 < len[Int](a@3@01) | live]
; [else-branch: 33 | !(0 <= j$3@46@01 && j$3@46@01 < len[Int](a@3@01)) | live]
(push) ; 9
; [then-branch: 33 | 0 <= j$3@46@01 && j$3@46@01 < len[Int](a@3@01)]
(assert (and (<= 0 j$3@46@01) (< j$3@46@01 (len<Int> a@3@01))))
; [eval] loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 10
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 j$3@46@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 j$3@46@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 j$3@46@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 10
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j$3@46@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j$3@46@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j$3@46@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 33 | !(0 <= j$3@46@01 && j$3@46@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 j$3@46@01) (< j$3@46@01 (len<Int> a@3@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 j$3@46@01) (< j$3@46@01 (len<Int> a@3@01))))
  (and (<= 0 j$3@46@01) (< j$3@46@01 (len<Int> a@3@01)))))
; [eval] old(loc(a, j$3))
; [eval] loc(a, j$3)
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j$3@46@01 Int)) (!
  (and
    (or (<= 0 j$3@46@01) (not (<= 0 j$3@46@01)))
    (or
      (not (and (<= 0 j$3@46@01) (< j$3@46@01 (len<Int> a@3@01))))
      (and (<= 0 j$3@46@01) (< j$3@46@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 j$3@46@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40-aux|)))
(push) ; 7
(assert (not (forall ((j$3@46@01 Int)) (!
  (=>
    (and (<= 0 j$3@46@01) (< j$3@46@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@3@01 j$3@46@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$3@46@01))))
  :pattern ((loc<Ref> a@3@01 j$3@46@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j$3@46@01 Int)) (!
  (=>
    (and (<= 0 j$3@46@01) (< j$3@46@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@3@01 j$3@46@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$3@46@01))))
  :pattern ((loc<Ref> a@3@01 j$3@46@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40|)))
; [eval] 0 <= low
(push) ; 7
(assert (not (<= 0 low@40@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 low@40@01))
; [eval] low <= high
(push) ; 7
(assert (not (<= low@40@01 high@23@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= low@40@01 high@23@01))
; [eval] high <= len(a)
; [eval] len(a)
; [eval] index == -1 ==> (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
; [eval] index == -1
; [eval] -1
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= index@24@01 (- 0 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= index@24@01 (- 0 1))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | index@24@01 == -1 | live]
; [else-branch: 34 | index@24@01 != -1 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 34 | index@24@01 == -1]
(assert (= index@24@01 (- 0 1)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
(declare-const i@47@01 Int)
(push) ; 9
; [eval] 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key
; [eval] 0 <= i && (i < len(a) && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 10
; [then-branch: 35 | !(0 <= i@47@01) | live]
; [else-branch: 35 | 0 <= i@47@01 | live]
(push) ; 11
; [then-branch: 35 | !(0 <= i@47@01)]
(assert (not (<= 0 i@47@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 35 | 0 <= i@47@01]
(assert (<= 0 i@47@01))
; [eval] i < len(a)
; [eval] len(a)
(push) ; 12
; [then-branch: 36 | !(i@47@01 < len[Int](a@3@01)) | live]
; [else-branch: 36 | i@47@01 < len[Int](a@3@01) | live]
(push) ; 13
; [then-branch: 36 | !(i@47@01 < len[Int](a@3@01))]
(assert (not (< i@47@01 (len<Int> a@3@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 36 | i@47@01 < len[Int](a@3@01)]
(assert (< i@47@01 (len<Int> a@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 14
; [then-branch: 37 | !(low@40@01 <= i@47@01) | live]
; [else-branch: 37 | low@40@01 <= i@47@01 | live]
(push) ; 15
; [then-branch: 37 | !(low@40@01 <= i@47@01)]
(assert (not (<= low@40@01 i@47@01)))
(pop) ; 15
(push) ; 15
; [else-branch: 37 | low@40@01 <= i@47@01]
(assert (<= low@40@01 i@47@01))
; [eval] i < high
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (<= low@40@01 i@47@01) (not (<= low@40@01 i@47@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@47@01 (len<Int> a@3@01))
  (and
    (< i@47@01 (len<Int> a@3@01))
    (or (<= low@40@01 i@47@01) (not (<= low@40@01 i@47@01))))))
(assert (or (< i@47@01 (len<Int> a@3@01)) (not (< i@47@01 (len<Int> a@3@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@47@01)
  (and
    (<= 0 i@47@01)
    (=>
      (< i@47@01 (len<Int> a@3@01))
      (and
        (< i@47@01 (len<Int> a@3@01))
        (or (<= low@40@01 i@47@01) (not (<= low@40@01 i@47@01)))))
    (or (< i@47@01 (len<Int> a@3@01)) (not (< i@47@01 (len<Int> a@3@01)))))))
(assert (or (<= 0 i@47@01) (not (<= 0 i@47@01))))
(push) ; 10
; [then-branch: 38 | 0 <= i@47@01 && i@47@01 < len[Int](a@3@01) && !(low@40@01 <= i@47@01 && i@47@01 < high@23@01) | live]
; [else-branch: 38 | !(0 <= i@47@01 && i@47@01 < len[Int](a@3@01) && !(low@40@01 <= i@47@01 && i@47@01 < high@23@01)) | live]
(push) ; 11
; [then-branch: 38 | 0 <= i@47@01 && i@47@01 < len[Int](a@3@01) && !(low@40@01 <= i@47@01 && i@47@01 < high@23@01)]
(assert (and
  (<= 0 i@47@01)
  (and
    (< i@47@01 (len<Int> a@3@01))
    (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01))))))
; [eval] loc(a, i).val != key
; [eval] loc(a, i)
(push) ; 12
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 i@47@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 i@47@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 i@47@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 38 | !(0 <= i@47@01 && i@47@01 < len[Int](a@3@01) && !(low@40@01 <= i@47@01 && i@47@01 < high@23@01))]
(assert (not
  (and
    (<= 0 i@47@01)
    (and
      (< i@47@01 (len<Int> a@3@01))
      (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@47@01)
    (and
      (< i@47@01 (len<Int> a@3@01))
      (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))
  (and
    (<= 0 i@47@01)
    (< i@47@01 (len<Int> a@3@01))
    (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@47@01)
      (and
        (< i@47@01 (len<Int> a@3@01))
        (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01))))))
  (and
    (<= 0 i@47@01)
    (and
      (< i@47@01 (len<Int> a@3@01))
      (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@47@01 Int)) (!
  (and
    (=>
      (<= 0 i@47@01)
      (and
        (<= 0 i@47@01)
        (=>
          (< i@47@01 (len<Int> a@3@01))
          (and
            (< i@47@01 (len<Int> a@3@01))
            (or (<= low@40@01 i@47@01) (not (<= low@40@01 i@47@01)))))
        (or (< i@47@01 (len<Int> a@3@01)) (not (< i@47@01 (len<Int> a@3@01))))))
    (or (<= 0 i@47@01) (not (<= 0 i@47@01)))
    (=>
      (and
        (<= 0 i@47@01)
        (and
          (< i@47@01 (len<Int> a@3@01))
          (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))
      (and
        (<= 0 i@47@01)
        (< i@47@01 (len<Int> a@3@01))
        (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))
    (or
      (not
        (and
          (<= 0 i@47@01)
          (and
            (< i@47@01 (len<Int> a@3@01))
            (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01))))))
      (and
        (<= 0 i@47@01)
        (and
          (< i@47@01 (len<Int> a@3@01))
          (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))))
  :pattern ((loc<Ref> a@3@01 i@47@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))
(pop) ; 8
(push) ; 8
; [else-branch: 34 | index@24@01 != -1]
(assert (not (= index@24@01 (- 0 1))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (= index@24@01 (- 0 1))
  (and
    (= index@24@01 (- 0 1))
    (forall ((i@47@01 Int)) (!
      (and
        (=>
          (<= 0 i@47@01)
          (and
            (<= 0 i@47@01)
            (=>
              (< i@47@01 (len<Int> a@3@01))
              (and
                (< i@47@01 (len<Int> a@3@01))
                (or (<= low@40@01 i@47@01) (not (<= low@40@01 i@47@01)))))
            (or
              (< i@47@01 (len<Int> a@3@01))
              (not (< i@47@01 (len<Int> a@3@01))))))
        (or (<= 0 i@47@01) (not (<= 0 i@47@01)))
        (=>
          (and
            (<= 0 i@47@01)
            (and
              (< i@47@01 (len<Int> a@3@01))
              (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))
          (and
            (<= 0 i@47@01)
            (< i@47@01 (len<Int> a@3@01))
            (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))
        (or
          (not
            (and
              (<= 0 i@47@01)
              (and
                (< i@47@01 (len<Int> a@3@01))
                (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01))))))
          (and
            (<= 0 i@47@01)
            (and
              (< i@47@01 (len<Int> a@3@01))
              (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))))
      :pattern ((loc<Ref> a@3@01 i@47@01))
      :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))))
; Joined path conditions
(push) ; 7
(assert (not (=>
  (= index@24@01 (- 0 1))
  (forall ((i@47@01 Int)) (!
    (=>
      (and
        (<= 0 i@47@01)
        (and
          (< i@47@01 (len<Int> a@3@01))
          (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))
      (not
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@3@01 i@47@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@47@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133|)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= index@24@01 (- 0 1))
  (forall ((i@47@01 Int)) (!
    (=>
      (and
        (<= 0 i@47@01)
        (and
          (< i@47@01 (len<Int> a@3@01))
          (not (and (<= low@40@01 i@47@01) (< i@47@01 high@23@01)))))
      (not
        (=
          ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@3@01 i@47@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@47@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133|))))
; [eval] -1 <= index
; [eval] -1
; [eval] index < len(a)
; [eval] len(a)
; [eval] 0 <= index ==> loc(a, index).val == key
; [eval] 0 <= index
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (<= 0 index@24@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<= 0 index@24@01)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | 0 <= index@24@01 | live]
; [else-branch: 39 | !(0 <= index@24@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 39 | 0 <= index@24@01]
(assert (<= 0 index@24@01))
; [eval] loc(a, index).val == key
; [eval] loc(a, index)
(push) ; 9
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 index@24@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 index@24@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 index@24@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 39 | !(0 <= index@24@01)]
(assert (not (<= 0 index@24@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(assert (not (=>
  (<= 0 index@24@01)
  (=
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@3@01 index@24@01))
    key@4@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= 0 index@24@01)
  (=
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) (loc<Ref> a@3@01 index@24@01))
    key@4@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 30 | !(Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) < key@4@01)]
(assert (not
  (<
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))
    key@4@01)))
(pop) ; 6
; [eval] !(loc(a, mid).val < key)
; [eval] loc(a, mid).val < key
; [eval] loc(a, mid)
(push) ; 6
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 mid@39@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 mid@39@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 mid@39@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))
  key@4@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (<
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))
    key@4@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | !(Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) < key@4@01) | live]
; [else-branch: 40 | Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) < key@4@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 40 | !(Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) < key@4@01)]
(assert (not
  (<
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))
    key@4@01)))
; [eval] key < loc(a, mid).val
; [eval] loc(a, mid)
(push) ; 7
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 mid@39@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 mid@39@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 mid@39@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (<
    key@4@01
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  key@4@01
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | key@4@01 < Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) | live]
; [else-branch: 41 | !(key@4@01 < Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01))) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 41 | key@4@01 < Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01))]
(assert (<
  key@4@01
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))))
; [exec]
; high := mid
; Loop head block: Re-establish invariant
(declare-const j$2@48@01 Int)
(push) ; 8
; [eval] 0 <= j$2 && j$2 < len(a)
; [eval] 0 <= j$2
(push) ; 9
; [then-branch: 42 | !(0 <= j$2@48@01) | live]
; [else-branch: 42 | 0 <= j$2@48@01 | live]
(push) ; 10
; [then-branch: 42 | !(0 <= j$2@48@01)]
(assert (not (<= 0 j$2@48@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 42 | 0 <= j$2@48@01]
(assert (<= 0 j$2@48@01))
; [eval] j$2 < len(a)
; [eval] len(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$2@48@01) (not (<= 0 j$2@48@01))))
(assert (and (<= 0 j$2@48@01) (< j$2@48@01 (len<Int> a@3@01))))
; [eval] loc(a, j$2)
(pop) ; 8
(declare-fun inv@49@01 ($Ref) Int)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j$2@48@01 Int)) (!
  (=>
    (and (<= 0 j$2@48@01) (< j$2@48@01 (len<Int> a@3@01)))
    (or (<= 0 j$2@48@01) (not (<= 0 j$2@48@01))))
  :pattern ((loc<Ref> a@3@01 j$2@48@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((j$21@48@01 Int) (j$22@48@01 Int)) (!
  (=>
    (and
      (and (<= 0 j$21@48@01) (< j$21@48@01 (len<Int> a@3@01)))
      (and (<= 0 j$22@48@01) (< j$22@48@01 (len<Int> a@3@01)))
      (= (loc<Ref> a@3@01 j$21@48@01) (loc<Ref> a@3@01 j$22@48@01)))
    (= j$21@48@01 j$22@48@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j$2@48@01 Int)) (!
  (=>
    (and (<= 0 j$2@48@01) (< j$2@48@01 (len<Int> a@3@01)))
    (and
      (= (inv@49@01 (loc<Ref> a@3@01 j$2@48@01)) j$2@48@01)
      (img@50@01 (loc<Ref> a@3@01 j$2@48@01))))
  :pattern ((loc<Ref> a@3@01 j$2@48@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@49@01 r)) r))
  :pattern ((inv@49@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) (len<Int> a@3@01)))
      (img@50@01 r)
      (= r (loc<Ref> a@3@01 (inv@49@01 r))))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
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
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@51@01 r))
    $Perm.No)
  
  :qid |quant-u-16|))))
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
      (and (<= 0 (inv@49@01 r)) (< (inv@49@01 r) (len<Int> a@3@01)))
      (img@50@01 r)
      (= r (loc<Ref> a@3@01 (inv@49@01 r))))
    (= (- $Perm.Write (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) r))
  :qid |qp.fvfValDef2|)))
; [eval] (forall j$3: Int :: { old(loc(a, j$3)) } 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val))
(declare-const j$3@53@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] 0 <= j$3 && j$3 < len(a)
; [eval] 0 <= j$3
(push) ; 9
; [then-branch: 43 | !(0 <= j$3@53@01) | live]
; [else-branch: 43 | 0 <= j$3@53@01 | live]
(push) ; 10
; [then-branch: 43 | !(0 <= j$3@53@01)]
(assert (not (<= 0 j$3@53@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 43 | 0 <= j$3@53@01]
(assert (<= 0 j$3@53@01))
; [eval] j$3 < len(a)
; [eval] len(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$3@53@01) (not (<= 0 j$3@53@01))))
(push) ; 9
; [then-branch: 44 | 0 <= j$3@53@01 && j$3@53@01 < len[Int](a@3@01) | live]
; [else-branch: 44 | !(0 <= j$3@53@01 && j$3@53@01 < len[Int](a@3@01)) | live]
(push) ; 10
; [then-branch: 44 | 0 <= j$3@53@01 && j$3@53@01 < len[Int](a@3@01)]
(assert (and (<= 0 j$3@53@01) (< j$3@53@01 (len<Int> a@3@01))))
; [eval] loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 11
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 j$3@53@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 j$3@53@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 j$3@53@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 11
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j$3@53@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j$3@53@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j$3@53@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 44 | !(0 <= j$3@53@01 && j$3@53@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 j$3@53@01) (< j$3@53@01 (len<Int> a@3@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 j$3@53@01) (< j$3@53@01 (len<Int> a@3@01))))
  (and (<= 0 j$3@53@01) (< j$3@53@01 (len<Int> a@3@01)))))
; [eval] old(loc(a, j$3))
; [eval] loc(a, j$3)
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j$3@53@01 Int)) (!
  (and
    (or (<= 0 j$3@53@01) (not (<= 0 j$3@53@01)))
    (or
      (not (and (<= 0 j$3@53@01) (< j$3@53@01 (len<Int> a@3@01))))
      (and (<= 0 j$3@53@01) (< j$3@53@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 j$3@53@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40-aux|)))
(push) ; 8
(assert (not (forall ((j$3@53@01 Int)) (!
  (=>
    (and (<= 0 j$3@53@01) (< j$3@53@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) (loc<Ref> a@3@01 j$3@53@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$3@53@01))))
  :pattern ((loc<Ref> a@3@01 j$3@53@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j$3@53@01 Int)) (!
  (=>
    (and (<= 0 j$3@53@01) (< j$3@53@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) (loc<Ref> a@3@01 j$3@53@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$3@53@01))))
  :pattern ((loc<Ref> a@3@01 j$3@53@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40|)))
; [eval] 0 <= low
; [eval] low <= high
(push) ; 8
(assert (not (<= low@22@01 mid@39@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= low@22@01 mid@39@01))
; [eval] high <= len(a)
; [eval] len(a)
(push) ; 8
(assert (not (<= mid@39@01 (len<Int> a@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= mid@39@01 (len<Int> a@3@01)))
; [eval] index == -1 ==> (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
; [eval] index == -1
; [eval] -1
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= index@24@01 (- 0 1)))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= index@24@01 (- 0 1))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | index@24@01 == -1 | live]
; [else-branch: 45 | index@24@01 != -1 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 45 | index@24@01 == -1]
(assert (= index@24@01 (- 0 1)))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
(declare-const i@54@01 Int)
(push) ; 10
; [eval] 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key
; [eval] 0 <= i && (i < len(a) && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 11
; [then-branch: 46 | !(0 <= i@54@01) | live]
; [else-branch: 46 | 0 <= i@54@01 | live]
(push) ; 12
; [then-branch: 46 | !(0 <= i@54@01)]
(assert (not (<= 0 i@54@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 46 | 0 <= i@54@01]
(assert (<= 0 i@54@01))
; [eval] i < len(a)
; [eval] len(a)
(push) ; 13
; [then-branch: 47 | !(i@54@01 < len[Int](a@3@01)) | live]
; [else-branch: 47 | i@54@01 < len[Int](a@3@01) | live]
(push) ; 14
; [then-branch: 47 | !(i@54@01 < len[Int](a@3@01))]
(assert (not (< i@54@01 (len<Int> a@3@01))))
(pop) ; 14
(push) ; 14
; [else-branch: 47 | i@54@01 < len[Int](a@3@01)]
(assert (< i@54@01 (len<Int> a@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 15
; [then-branch: 48 | !(low@22@01 <= i@54@01) | live]
; [else-branch: 48 | low@22@01 <= i@54@01 | live]
(push) ; 16
; [then-branch: 48 | !(low@22@01 <= i@54@01)]
(assert (not (<= low@22@01 i@54@01)))
(pop) ; 16
(push) ; 16
; [else-branch: 48 | low@22@01 <= i@54@01]
(assert (<= low@22@01 i@54@01))
; [eval] i < high
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (or (<= low@22@01 i@54@01) (not (<= low@22@01 i@54@01))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@54@01 (len<Int> a@3@01))
  (and
    (< i@54@01 (len<Int> a@3@01))
    (or (<= low@22@01 i@54@01) (not (<= low@22@01 i@54@01))))))
(assert (or (< i@54@01 (len<Int> a@3@01)) (not (< i@54@01 (len<Int> a@3@01)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@54@01)
  (and
    (<= 0 i@54@01)
    (=>
      (< i@54@01 (len<Int> a@3@01))
      (and
        (< i@54@01 (len<Int> a@3@01))
        (or (<= low@22@01 i@54@01) (not (<= low@22@01 i@54@01)))))
    (or (< i@54@01 (len<Int> a@3@01)) (not (< i@54@01 (len<Int> a@3@01)))))))
(assert (or (<= 0 i@54@01) (not (<= 0 i@54@01))))
(push) ; 11
; [then-branch: 49 | 0 <= i@54@01 && i@54@01 < len[Int](a@3@01) && !(low@22@01 <= i@54@01 && i@54@01 < mid@39@01) | live]
; [else-branch: 49 | !(0 <= i@54@01 && i@54@01 < len[Int](a@3@01) && !(low@22@01 <= i@54@01 && i@54@01 < mid@39@01)) | live]
(push) ; 12
; [then-branch: 49 | 0 <= i@54@01 && i@54@01 < len[Int](a@3@01) && !(low@22@01 <= i@54@01 && i@54@01 < mid@39@01)]
(assert (and
  (<= 0 i@54@01)
  (and
    (< i@54@01 (len<Int> a@3@01))
    (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01))))))
; [eval] loc(a, i).val != key
; [eval] loc(a, i)
(push) ; 13
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 i@54@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 i@54@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 i@54@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(pop) ; 12
(push) ; 12
; [else-branch: 49 | !(0 <= i@54@01 && i@54@01 < len[Int](a@3@01) && !(low@22@01 <= i@54@01 && i@54@01 < mid@39@01))]
(assert (not
  (and
    (<= 0 i@54@01)
    (and
      (< i@54@01 (len<Int> a@3@01))
      (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@54@01)
    (and
      (< i@54@01 (len<Int> a@3@01))
      (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))
  (and
    (<= 0 i@54@01)
    (< i@54@01 (len<Int> a@3@01))
    (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@54@01)
      (and
        (< i@54@01 (len<Int> a@3@01))
        (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01))))))
  (and
    (<= 0 i@54@01)
    (and
      (< i@54@01 (len<Int> a@3@01))
      (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@54@01 Int)) (!
  (and
    (=>
      (<= 0 i@54@01)
      (and
        (<= 0 i@54@01)
        (=>
          (< i@54@01 (len<Int> a@3@01))
          (and
            (< i@54@01 (len<Int> a@3@01))
            (or (<= low@22@01 i@54@01) (not (<= low@22@01 i@54@01)))))
        (or (< i@54@01 (len<Int> a@3@01)) (not (< i@54@01 (len<Int> a@3@01))))))
    (or (<= 0 i@54@01) (not (<= 0 i@54@01)))
    (=>
      (and
        (<= 0 i@54@01)
        (and
          (< i@54@01 (len<Int> a@3@01))
          (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))
      (and
        (<= 0 i@54@01)
        (< i@54@01 (len<Int> a@3@01))
        (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))
    (or
      (not
        (and
          (<= 0 i@54@01)
          (and
            (< i@54@01 (len<Int> a@3@01))
            (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01))))))
      (and
        (<= 0 i@54@01)
        (and
          (< i@54@01 (len<Int> a@3@01))
          (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))))
  :pattern ((loc<Ref> a@3@01 i@54@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))
(pop) ; 9
(push) ; 9
; [else-branch: 45 | index@24@01 != -1]
(assert (not (= index@24@01 (- 0 1))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (= index@24@01 (- 0 1))
  (and
    (= index@24@01 (- 0 1))
    (forall ((i@54@01 Int)) (!
      (and
        (=>
          (<= 0 i@54@01)
          (and
            (<= 0 i@54@01)
            (=>
              (< i@54@01 (len<Int> a@3@01))
              (and
                (< i@54@01 (len<Int> a@3@01))
                (or (<= low@22@01 i@54@01) (not (<= low@22@01 i@54@01)))))
            (or
              (< i@54@01 (len<Int> a@3@01))
              (not (< i@54@01 (len<Int> a@3@01))))))
        (or (<= 0 i@54@01) (not (<= 0 i@54@01)))
        (=>
          (and
            (<= 0 i@54@01)
            (and
              (< i@54@01 (len<Int> a@3@01))
              (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))
          (and
            (<= 0 i@54@01)
            (< i@54@01 (len<Int> a@3@01))
            (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))
        (or
          (not
            (and
              (<= 0 i@54@01)
              (and
                (< i@54@01 (len<Int> a@3@01))
                (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01))))))
          (and
            (<= 0 i@54@01)
            (and
              (< i@54@01 (len<Int> a@3@01))
              (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))))
      :pattern ((loc<Ref> a@3@01 i@54@01))
      :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133-aux|)))))
; Joined path conditions
(push) ; 8
(assert (not (=>
  (= index@24@01 (- 0 1))
  (forall ((i@54@01 Int)) (!
    (=>
      (and
        (<= 0 i@54@01)
        (and
          (< i@54@01 (len<Int> a@3@01))
          (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))
      (not
        (=
          ($FVF.lookup_val (as sm@52@01  $FVF<val>) (loc<Ref> a@3@01 i@54@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@54@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133|)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= index@24@01 (- 0 1))
  (forall ((i@54@01 Int)) (!
    (=>
      (and
        (<= 0 i@54@01)
        (and
          (< i@54@01 (len<Int> a@3@01))
          (not (and (<= low@22@01 i@54@01) (< i@54@01 mid@39@01)))))
      (not
        (=
          ($FVF.lookup_val (as sm@52@01  $FVF<val>) (loc<Ref> a@3@01 i@54@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@54@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@24@31@24@133|))))
; [eval] -1 <= index
; [eval] -1
; [eval] index < len(a)
; [eval] len(a)
; [eval] 0 <= index ==> loc(a, index).val == key
; [eval] 0 <= index
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (<= 0 index@24@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<= 0 index@24@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | 0 <= index@24@01 | live]
; [else-branch: 50 | !(0 <= index@24@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 50 | 0 <= index@24@01]
(assert (<= 0 index@24@01))
; [eval] loc(a, index).val == key
; [eval] loc(a, index)
(push) ; 10
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 index@24@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 index@24@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 index@24@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 50 | !(0 <= index@24@01)]
(assert (not (<= 0 index@24@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(push) ; 8
(assert (not (=>
  (<= 0 index@24@01)
  (=
    ($FVF.lookup_val (as sm@52@01  $FVF<val>) (loc<Ref> a@3@01 index@24@01))
    key@4@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= 0 index@24@01)
  (=
    ($FVF.lookup_val (as sm@52@01  $FVF<val>) (loc<Ref> a@3@01 index@24@01))
    key@4@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 41 | !(key@4@01 < Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)))]
(assert (not
  (<
    key@4@01
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01)))))
(pop) ; 7
; [eval] !(key < loc(a, mid).val)
; [eval] key < loc(a, mid).val
; [eval] loc(a, mid)
(push) ; 7
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 mid@39@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 mid@39@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 mid@39@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  key@4@01
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (<
    key@4@01
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | !(key@4@01 < Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01))) | live]
; [else-branch: 51 | key@4@01 < Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 51 | !(key@4@01 < Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)))]
(assert (not
  (<
    key@4@01
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01)))))
; [exec]
; index := mid
; [exec]
; high := mid
; Loop head block: Re-establish invariant
(declare-const j$2@55@01 Int)
(push) ; 8
; [eval] 0 <= j$2 && j$2 < len(a)
; [eval] 0 <= j$2
(push) ; 9
; [then-branch: 52 | !(0 <= j$2@55@01) | live]
; [else-branch: 52 | 0 <= j$2@55@01 | live]
(push) ; 10
; [then-branch: 52 | !(0 <= j$2@55@01)]
(assert (not (<= 0 j$2@55@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 52 | 0 <= j$2@55@01]
(assert (<= 0 j$2@55@01))
; [eval] j$2 < len(a)
; [eval] len(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$2@55@01) (not (<= 0 j$2@55@01))))
(assert (and (<= 0 j$2@55@01) (< j$2@55@01 (len<Int> a@3@01))))
; [eval] loc(a, j$2)
(pop) ; 8
(declare-fun inv@56@01 ($Ref) Int)
(declare-fun img@57@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j$2@55@01 Int)) (!
  (=>
    (and (<= 0 j$2@55@01) (< j$2@55@01 (len<Int> a@3@01)))
    (or (<= 0 j$2@55@01) (not (<= 0 j$2@55@01))))
  :pattern ((loc<Ref> a@3@01 j$2@55@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((j$21@55@01 Int) (j$22@55@01 Int)) (!
  (=>
    (and
      (and (<= 0 j$21@55@01) (< j$21@55@01 (len<Int> a@3@01)))
      (and (<= 0 j$22@55@01) (< j$22@55@01 (len<Int> a@3@01)))
      (= (loc<Ref> a@3@01 j$21@55@01) (loc<Ref> a@3@01 j$22@55@01)))
    (= j$21@55@01 j$22@55@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j$2@55@01 Int)) (!
  (=>
    (and (<= 0 j$2@55@01) (< j$2@55@01 (len<Int> a@3@01)))
    (and
      (= (inv@56@01 (loc<Ref> a@3@01 j$2@55@01)) j$2@55@01)
      (img@57@01 (loc<Ref> a@3@01 j$2@55@01))))
  :pattern ((loc<Ref> a@3@01 j$2@55@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@57@01 r)
      (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@56@01 r)) r))
  :pattern ((inv@56@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) (len<Int> a@3@01)))
      (img@57@01 r)
      (= r (loc<Ref> a@3@01 (inv@56@01 r))))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
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
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@58@01 r))
    $Perm.No)
  
  :qid |quant-u-20|))))
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
      (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) (len<Int> a@3@01)))
      (img@57@01 r)
      (= r (loc<Ref> a@3@01 (inv@56@01 r))))
    (= (- $Perm.Write (pTaken@58@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@59@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) r))
  :qid |qp.fvfValDef3|)))
; [eval] (forall j$3: Int :: { old(loc(a, j$3)) } 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val))
(declare-const j$3@60@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] 0 <= j$3 && j$3 < len(a) ==> loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] 0 <= j$3 && j$3 < len(a)
; [eval] 0 <= j$3
(push) ; 9
; [then-branch: 53 | !(0 <= j$3@60@01) | live]
; [else-branch: 53 | 0 <= j$3@60@01 | live]
(push) ; 10
; [then-branch: 53 | !(0 <= j$3@60@01)]
(assert (not (<= 0 j$3@60@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 53 | 0 <= j$3@60@01]
(assert (<= 0 j$3@60@01))
; [eval] j$3 < len(a)
; [eval] len(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$3@60@01) (not (<= 0 j$3@60@01))))
(push) ; 9
; [then-branch: 54 | 0 <= j$3@60@01 && j$3@60@01 < len[Int](a@3@01) | live]
; [else-branch: 54 | !(0 <= j$3@60@01 && j$3@60@01 < len[Int](a@3@01)) | live]
(push) ; 10
; [then-branch: 54 | 0 <= j$3@60@01 && j$3@60@01 < len[Int](a@3@01)]
(assert (and (<= 0 j$3@60@01) (< j$3@60@01 (len<Int> a@3@01))))
; [eval] loc(a, j$3).val == old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 11
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 j$3@60@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 j$3@60@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 j$3@60@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, j$3).val)
; [eval] loc(a, j$3)
(push) ; 11
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j$3@60@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j$3@60@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j$3@60@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 54 | !(0 <= j$3@60@01 && j$3@60@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 j$3@60@01) (< j$3@60@01 (len<Int> a@3@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 j$3@60@01) (< j$3@60@01 (len<Int> a@3@01))))
  (and (<= 0 j$3@60@01) (< j$3@60@01 (len<Int> a@3@01)))))
; [eval] old(loc(a, j$3))
; [eval] loc(a, j$3)
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j$3@60@01 Int)) (!
  (and
    (or (<= 0 j$3@60@01) (not (<= 0 j$3@60@01)))
    (or
      (not (and (<= 0 j$3@60@01) (< j$3@60@01 (len<Int> a@3@01))))
      (and (<= 0 j$3@60@01) (< j$3@60@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 j$3@60@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40-aux|)))
(push) ; 8
(assert (not (forall ((j$3@60@01 Int)) (!
  (=>
    (and (<= 0 j$3@60@01) (< j$3@60@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@3@01 j$3@60@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$3@60@01))))
  :pattern ((loc<Ref> a@3@01 j$3@60@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j$3@60@01 Int)) (!
  (=>
    (and (<= 0 j$3@60@01) (< j$3@60@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@3@01 j$3@60@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$3@60@01))))
  :pattern ((loc<Ref> a@3@01 j$3@60@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@22@28@22@40|)))
; [eval] 0 <= low
; [eval] low <= high
(push) ; 8
(assert (not (<= low@22@01 mid@39@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= low@22@01 mid@39@01))
; [eval] high <= len(a)
; [eval] len(a)
(push) ; 8
(assert (not (<= mid@39@01 (len<Int> a@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= mid@39@01 (len<Int> a@3@01)))
; [eval] index == -1 ==> (forall i: Int :: { loc(a, i) } 0 <= i && (i < len(a) && !(low <= i && i < high)) ==> loc(a, i).val != key)
; [eval] index == -1
; [eval] -1
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= mid@39@01 (- 0 1)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 55 | mid@39@01 == -1 | dead]
; [else-branch: 55 | mid@39@01 != -1 | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 55 | mid@39@01 != -1]
(assert (not (= mid@39@01 (- 0 1))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (not (= mid@39@01 (- 0 1))))
; [eval] -1 <= index
; [eval] -1
(push) ; 8
(assert (not (<= (- 0 1) mid@39@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= (- 0 1) mid@39@01))
; [eval] index < len(a)
; [eval] len(a)
(push) ; 8
(assert (not (< mid@39@01 (len<Int> a@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (< mid@39@01 (len<Int> a@3@01)))
; [eval] 0 <= index ==> loc(a, index).val == key
; [eval] 0 <= index
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (<= 0 mid@39@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<= 0 mid@39@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 56 | 0 <= mid@39@01 | live]
; [else-branch: 56 | !(0 <= mid@39@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 56 | 0 <= mid@39@01]
(assert (<= 0 mid@39@01))
; [eval] loc(a, index).val == key
; [eval] loc(a, index)
(push) ; 10
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 mid@39@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 mid@39@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 mid@39@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (<= 0 mid@39@01))
(push) ; 8
(assert (not (=>
  (<= 0 mid@39@01)
  (=
    ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@3@01 mid@39@01))
    key@4@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= 0 mid@39@01)
  (=
    ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@3@01 mid@39@01))
    key@4@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 51 | key@4@01 < Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01))]
(assert (<
  key@4@01
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 40 | Lookup(val, First:($t@25@01), loc[Ref](a@3@01, mid@39@01)) < key@4@01]
(assert (<
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) (loc<Ref> a@3@01 mid@39@01))
  key@4@01))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 29 | !(low@22@01 < high@23@01)]
(assert (not (< low@22@01 high@23@01)))
(pop) ; 5
; [eval] !(low < high)
; [eval] low < high
(push) ; 5
(set-option :timeout 10)
(assert (not (< low@22@01 high@23@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< low@22@01 high@23@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | !(low@22@01 < high@23@01) | live]
; [else-branch: 57 | low@22@01 < high@23@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 57 | !(low@22@01 < high@23@01)]
(assert (not (< low@22@01 high@23@01)))
(declare-const j$0@61@01 Int)
(push) ; 6
; [eval] 0 <= j$0 && j$0 < len(a)
; [eval] 0 <= j$0
(push) ; 7
; [then-branch: 58 | !(0 <= j$0@61@01) | live]
; [else-branch: 58 | 0 <= j$0@61@01 | live]
(push) ; 8
; [then-branch: 58 | !(0 <= j$0@61@01)]
(assert (not (<= 0 j$0@61@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 58 | 0 <= j$0@61@01]
(assert (<= 0 j$0@61@01))
; [eval] j$0 < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$0@61@01) (not (<= 0 j$0@61@01))))
(assert (and (<= 0 j$0@61@01) (< j$0@61@01 (len<Int> a@3@01))))
; [eval] loc(a, j$0)
(pop) ; 6
(declare-fun inv@62@01 ($Ref) Int)
(declare-fun img@63@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j$0@61@01 Int)) (!
  (=>
    (and (<= 0 j$0@61@01) (< j$0@61@01 (len<Int> a@3@01)))
    (or (<= 0 j$0@61@01) (not (<= 0 j$0@61@01))))
  :pattern ((loc<Ref> a@3@01 j$0@61@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j$01@61@01 Int) (j$02@61@01 Int)) (!
  (=>
    (and
      (and (<= 0 j$01@61@01) (< j$01@61@01 (len<Int> a@3@01)))
      (and (<= 0 j$02@61@01) (< j$02@61@01 (len<Int> a@3@01)))
      (= (loc<Ref> a@3@01 j$01@61@01) (loc<Ref> a@3@01 j$02@61@01)))
    (= j$01@61@01 j$02@61@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j$0@61@01 Int)) (!
  (=>
    (and (<= 0 j$0@61@01) (< j$0@61@01 (len<Int> a@3@01)))
    (and
      (= (inv@62@01 (loc<Ref> a@3@01 j$0@61@01)) j$0@61@01)
      (img@63@01 (loc<Ref> a@3@01 j$0@61@01))))
  :pattern ((loc<Ref> a@3@01 j$0@61@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@63@01 r)
      (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) (len<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@62@01 r)) r))
  :pattern ((inv@62@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) (len<Int> a@3@01)))
      (img@63@01 r)
      (= r (loc<Ref> a@3@01 (inv@62@01 r))))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
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
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@64@01 r))
    $Perm.No)
  
  :qid |quant-u-24|))))
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
      (and (<= 0 (inv@62@01 r)) (< (inv@62@01 r) (len<Int> a@3@01)))
      (img@63@01 r)
      (= r (loc<Ref> a@3@01 (inv@62@01 r))))
    (= (- $Perm.Write (pTaken@64@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@65@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (len<Int> a@3@01))))
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@25@01)) r))
  :qid |qp.fvfValDef4|)))
; [eval] (forall j$1: Int :: { old(loc(a, j$1)) } 0 <= j$1 && j$1 < len(a) ==> loc(a, j$1).val == old(loc(a, j$1).val))
(declare-const j$1@66@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= j$1 && j$1 < len(a) ==> loc(a, j$1).val == old(loc(a, j$1).val)
; [eval] 0 <= j$1 && j$1 < len(a)
; [eval] 0 <= j$1
(push) ; 7
; [then-branch: 59 | !(0 <= j$1@66@01) | live]
; [else-branch: 59 | 0 <= j$1@66@01 | live]
(push) ; 8
; [then-branch: 59 | !(0 <= j$1@66@01)]
(assert (not (<= 0 j$1@66@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 59 | 0 <= j$1@66@01]
(assert (<= 0 j$1@66@01))
; [eval] j$1 < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j$1@66@01) (not (<= 0 j$1@66@01))))
(push) ; 7
; [then-branch: 60 | 0 <= j$1@66@01 && j$1@66@01 < len[Int](a@3@01) | live]
; [else-branch: 60 | !(0 <= j$1@66@01 && j$1@66@01 < len[Int](a@3@01)) | live]
(push) ; 8
; [then-branch: 60 | 0 <= j$1@66@01 && j$1@66@01 < len[Int](a@3@01)]
(assert (and (<= 0 j$1@66@01) (< j$1@66@01 (len<Int> a@3@01))))
; [eval] loc(a, j$1).val == old(loc(a, j$1).val)
; [eval] loc(a, j$1)
(push) ; 9
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 j$1@66@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 j$1@66@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 j$1@66@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old(loc(a, j$1).val)
; [eval] loc(a, j$1)
(push) ; 9
(assert (not (and
  (img@9@01 (loc<Ref> a@3@01 j$1@66@01))
  (and
    (<= 0 (inv@8@01 (loc<Ref> a@3@01 j$1@66@01)))
    (< (inv@8@01 (loc<Ref> a@3@01 j$1@66@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 60 | !(0 <= j$1@66@01 && j$1@66@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 j$1@66@01) (< j$1@66@01 (len<Int> a@3@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 j$1@66@01) (< j$1@66@01 (len<Int> a@3@01))))
  (and (<= 0 j$1@66@01) (< j$1@66@01 (len<Int> a@3@01)))))
; [eval] old(loc(a, j$1))
; [eval] loc(a, j$1)
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j$1@66@01 Int)) (!
  (and
    (or (<= 0 j$1@66@01) (not (<= 0 j$1@66@01)))
    (or
      (not (and (<= 0 j$1@66@01) (< j$1@66@01 (len<Int> a@3@01))))
      (and (<= 0 j$1@66@01) (< j$1@66@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 j$1@66@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@12@25@12@37-aux|)))
(push) ; 6
(assert (not (forall ((j$1@66@01 Int)) (!
  (=>
    (and (<= 0 j$1@66@01) (< j$1@66@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) (loc<Ref> a@3@01 j$1@66@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$1@66@01))))
  :pattern ((loc<Ref> a@3@01 j$1@66@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@12@25@12@37|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j$1@66@01 Int)) (!
  (=>
    (and (<= 0 j$1@66@01) (< j$1@66@01 (len<Int> a@3@01)))
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) (loc<Ref> a@3@01 j$1@66@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 j$1@66@01))))
  :pattern ((loc<Ref> a@3@01 j$1@66@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@12@25@12@37|)))
; [eval] -1 <= index
; [eval] -1
; [eval] index < len(a)
; [eval] len(a)
; [eval] 0 <= index ==> loc(a, index).val == key
; [eval] 0 <= index
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (<= 0 index@24@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<= 0 index@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 61 | 0 <= index@24@01 | live]
; [else-branch: 61 | !(0 <= index@24@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 61 | 0 <= index@24@01]
(assert (<= 0 index@24@01))
; [eval] loc(a, index).val == key
; [eval] loc(a, index)
(push) ; 8
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 index@24@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 index@24@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 index@24@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 61 | !(0 <= index@24@01)]
(assert (not (<= 0 index@24@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(push) ; 6
(assert (not (=>
  (<= 0 index@24@01)
  (=
    ($FVF.lookup_val (as sm@65@01  $FVF<val>) (loc<Ref> a@3@01 index@24@01))
    key@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= 0 index@24@01)
  (=
    ($FVF.lookup_val (as sm@65@01  $FVF<val>) (loc<Ref> a@3@01 index@24@01))
    key@4@01)))
; [eval] -1 == index ==> (forall i: Int :: { loc(a, i) } 0 <= i && i < len(a) ==> loc(a, i).val != key)
; [eval] -1 == index
; [eval] -1
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (- 0 1) index@24@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (- 0 1) index@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 62 | -1 == index@24@01 | live]
; [else-branch: 62 | -1 != index@24@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 62 | -1 == index@24@01]
(assert (= (- 0 1) index@24@01))
; [eval] (forall i: Int :: { loc(a, i) } 0 <= i && i < len(a) ==> loc(a, i).val != key)
(declare-const i@67@01 Int)
(push) ; 8
; [eval] 0 <= i && i < len(a) ==> loc(a, i).val != key
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 9
; [then-branch: 63 | !(0 <= i@67@01) | live]
; [else-branch: 63 | 0 <= i@67@01 | live]
(push) ; 10
; [then-branch: 63 | !(0 <= i@67@01)]
(assert (not (<= 0 i@67@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 63 | 0 <= i@67@01]
(assert (<= 0 i@67@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@67@01) (not (<= 0 i@67@01))))
(push) ; 9
; [then-branch: 64 | 0 <= i@67@01 && i@67@01 < len[Int](a@3@01) | live]
; [else-branch: 64 | !(0 <= i@67@01 && i@67@01 < len[Int](a@3@01)) | live]
(push) ; 10
; [then-branch: 64 | 0 <= i@67@01 && i@67@01 < len[Int](a@3@01)]
(assert (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01))))
; [eval] loc(a, i).val != key
; [eval] loc(a, i)
(push) ; 11
(assert (not (and
  (img@28@01 (loc<Ref> a@3@01 i@67@01))
  (and
    (<= 0 (inv@27@01 (loc<Ref> a@3@01 i@67@01)))
    (< (inv@27@01 (loc<Ref> a@3@01 i@67@01)) (len<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 64 | !(0 <= i@67@01 && i@67@01 < len[Int](a@3@01))]
(assert (not (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01))))
  (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@67@01 Int)) (!
  (and
    (or (<= 0 i@67@01) (not (<= 0 i@67@01)))
    (or
      (not (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01))))
      (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01)))))
  :pattern ((loc<Ref> a@3@01 i@67@01))
  :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@15@29@15@90-aux|)))
(pop) ; 7
(push) ; 7
; [else-branch: 62 | -1 != index@24@01]
(assert (not (= (- 0 1) index@24@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (= (- 0 1) index@24@01)
  (and
    (= (- 0 1) index@24@01)
    (forall ((i@67@01 Int)) (!
      (and
        (or (<= 0 i@67@01) (not (<= 0 i@67@01)))
        (or
          (not (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01))))
          (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01)))))
      :pattern ((loc<Ref> a@3@01 i@67@01))
      :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@15@29@15@90-aux|)))))
; Joined path conditions
(assert (or (not (= (- 0 1) index@24@01)) (= (- 0 1) index@24@01)))
(push) ; 6
(assert (not (=>
  (= (- 0 1) index@24@01)
  (forall ((i@67@01 Int)) (!
    (=>
      (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01)))
      (not
        (=
          ($FVF.lookup_val (as sm@65@01  $FVF<val>) (loc<Ref> a@3@01 i@67@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@67@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@15@29@15@90|)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= (- 0 1) index@24@01)
  (forall ((i@67@01 Int)) (!
    (=>
      (and (<= 0 i@67@01) (< i@67@01 (len<Int> a@3@01)))
      (not
        (=
          ($FVF.lookup_val (as sm@65@01  $FVF<val>) (loc<Ref> a@3@01 i@67@01))
          key@4@01)))
    :pattern ((loc<Ref> a@3@01 i@67@01))
    :qid |prog./silicon/silver/src/test/resources/examples/binary-search/binary-search-array.vpr@15@29@15@90|))))
(pop) ; 5
(push) ; 5
; [else-branch: 57 | low@22@01 < high@23@01]
(assert (< low@22@01 high@23@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
