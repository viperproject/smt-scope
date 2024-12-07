(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:10:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr
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
; ---------- lcp ----------
(declare-const a@0@01 IArray)
(declare-const x@1@01 Int)
(declare-const y@2@01 Int)
(declare-const n@3@01 Int)
(declare-const a@4@01 IArray)
(declare-const x@5@01 Int)
(declare-const y@6@01 Int)
(declare-const n@7@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(declare-const k@9@01 Int)
(push) ; 2
; [eval] 0 <= k && k < len(a)
; [eval] 0 <= k
(push) ; 3
; [then-branch: 0 | !(0 <= k@9@01) | live]
; [else-branch: 0 | 0 <= k@9@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= k@9@01)]
(assert (not (<= 0 k@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= k@9@01]
(assert (<= 0 k@9@01))
; [eval] k < len(a)
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@9@01) (not (<= 0 k@9@01))))
(assert (and (<= 0 k@9@01) (< k@9@01 (len<Int> a@4@01))))
; [eval] loc(a, k)
(pop) ; 2
(declare-fun inv@10@01 ($Ref) Int)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@9@01 Int)) (!
  (=>
    (and (<= 0 k@9@01) (< k@9@01 (len<Int> a@4@01)))
    (or (<= 0 k@9@01) (not (<= 0 k@9@01))))
  :pattern ((loc<Ref> a@4@01 k@9@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@9@01 Int) (k2@9@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@9@01) (< k1@9@01 (len<Int> a@4@01)))
      (and (<= 0 k2@9@01) (< k2@9@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 k1@9@01) (loc<Ref> a@4@01 k2@9@01)))
    (= k1@9@01 k2@9@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@9@01 Int)) (!
  (=>
    (and (<= 0 k@9@01) (< k@9@01 (len<Int> a@4@01)))
    (and
      (= (inv@10@01 (loc<Ref> a@4@01 k@9@01)) k@9@01)
      (img@11@01 (loc<Ref> a@4@01 k@9@01))))
  :pattern ((loc<Ref> a@4@01 k@9@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@9@01 Int)) (!
  (=>
    (and (<= 0 k@9@01) (< k@9@01 (len<Int> a@4@01)))
    (not (= (loc<Ref> a@4@01 k@9@01) $Ref.null)))
  :pattern ((loc<Ref> a@4@01 k@9@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] 0 <= x
(assert (<= 0 x@5@01))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] 0 <= y
(assert (<= 0 y@6@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) $Snap.unit))
; [eval] x < len(a)
; [eval] len(a)
(assert (< x@5@01 (len<Int> a@4@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  $Snap.unit))
; [eval] y < len(a)
; [eval] len(a)
(assert (< y@6@01 (len<Int> a@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(declare-const k$0@13@01 Int)
(push) ; 3
; [eval] 0 <= k$0 && k$0 < len(a)
; [eval] 0 <= k$0
(push) ; 4
; [then-branch: 1 | !(0 <= k$0@13@01) | live]
; [else-branch: 1 | 0 <= k$0@13@01 | live]
(push) ; 5
; [then-branch: 1 | !(0 <= k$0@13@01)]
(assert (not (<= 0 k$0@13@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | 0 <= k$0@13@01]
(assert (<= 0 k$0@13@01))
; [eval] k$0 < len(a)
; [eval] len(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k$0@13@01) (not (<= 0 k$0@13@01))))
(assert (and (<= 0 k$0@13@01) (< k$0@13@01 (len<Int> a@4@01))))
; [eval] loc(a, k$0)
(pop) ; 3
(declare-fun inv@14@01 ($Ref) Int)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k$0@13@01 Int)) (!
  (=>
    (and (<= 0 k$0@13@01) (< k$0@13@01 (len<Int> a@4@01)))
    (or (<= 0 k$0@13@01) (not (<= 0 k$0@13@01))))
  :pattern ((loc<Ref> a@4@01 k$0@13@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k$01@13@01 Int) (k$02@13@01 Int)) (!
  (=>
    (and
      (and (<= 0 k$01@13@01) (< k$01@13@01 (len<Int> a@4@01)))
      (and (<= 0 k$02@13@01) (< k$02@13@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 k$01@13@01) (loc<Ref> a@4@01 k$02@13@01)))
    (= k$01@13@01 k$02@13@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k$0@13@01 Int)) (!
  (=>
    (and (<= 0 k$0@13@01) (< k$0@13@01 (len<Int> a@4@01)))
    (and
      (= (inv@14@01 (loc<Ref> a@4@01 k$0@13@01)) k$0@13@01)
      (img@15@01 (loc<Ref> a@4@01 k$0@13@01))))
  :pattern ((loc<Ref> a@4@01 k$0@13@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k$0@13@01 Int)) (!
  (=>
    (and (<= 0 k$0@13@01) (< k$0@13@01 (len<Int> a@4@01)))
    (not (= (loc<Ref> a@4@01 k$0@13@01) $Ref.null)))
  :pattern ((loc<Ref> a@4@01 k$0@13@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))
; [eval] 0 <= n
(assert (<= 0 n@7@01))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
; [eval] x + n <= len(a)
; [eval] x + n
; [eval] len(a)
(assert (<= (+ x@5@01 n@7@01) (len<Int> a@4@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] y + n <= len(a)
; [eval] y + n
; [eval] len(a)
(assert (<= (+ y@6@01 n@7@01) (len<Int> a@4@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  $Snap.unit))
; [eval] (forall k: Int :: { loc(a, k) } x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val)
(declare-const k@16@01 Int)
(push) ; 3
; [eval] x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val
; [eval] x <= k && k < x + n
; [eval] x <= k
(push) ; 4
; [then-branch: 2 | !(x@5@01 <= k@16@01) | live]
; [else-branch: 2 | x@5@01 <= k@16@01 | live]
(push) ; 5
; [then-branch: 2 | !(x@5@01 <= k@16@01)]
(assert (not (<= x@5@01 k@16@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | x@5@01 <= k@16@01]
(assert (<= x@5@01 k@16@01))
; [eval] k < x + n
; [eval] x + n
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= x@5@01 k@16@01) (not (<= x@5@01 k@16@01))))
(push) ; 4
; [then-branch: 3 | x@5@01 <= k@16@01 && k@16@01 < x@5@01 + n@7@01 | live]
; [else-branch: 3 | !(x@5@01 <= k@16@01 && k@16@01 < x@5@01 + n@7@01) | live]
(push) ; 5
; [then-branch: 3 | x@5@01 <= k@16@01 && k@16@01 < x@5@01 + n@7@01]
(assert (and (<= x@5@01 k@16@01) (< k@16@01 (+ x@5@01 n@7@01))))
; [eval] loc(a, k).val == loc(a, y + k - x).val
; [eval] loc(a, k)
(push) ; 6
(assert (not (and
  (img@15@01 (loc<Ref> a@4@01 k@16@01))
  (and
    (<= 0 (inv@14@01 (loc<Ref> a@4@01 k@16@01)))
    (< (inv@14@01 (loc<Ref> a@4@01 k@16@01)) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + k - x)
; [eval] y + k - x
; [eval] y + k
(push) ; 6
(assert (not (and
  (img@15@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@16@01) x@5@01)))
  (and
    (<= 0 (inv@14@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@16@01) x@5@01))))
    (<
      (inv@14@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@16@01) x@5@01)))
      (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(x@5@01 <= k@16@01 && k@16@01 < x@5@01 + n@7@01)]
(assert (not (and (<= x@5@01 k@16@01) (< k@16@01 (+ x@5@01 n@7@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= x@5@01 k@16@01) (< k@16@01 (+ x@5@01 n@7@01))))
  (and (<= x@5@01 k@16@01) (< k@16@01 (+ x@5@01 n@7@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@16@01 Int)) (!
  (and
    (or (<= x@5@01 k@16@01) (not (<= x@5@01 k@16@01)))
    (or
      (not (and (<= x@5@01 k@16@01) (< k@16@01 (+ x@5@01 n@7@01))))
      (and (<= x@5@01 k@16@01) (< k@16@01 (+ x@5@01 n@7@01)))))
  :pattern ((loc<Ref> a@4@01 k@16@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@19@12@19@91-aux|)))
(assert (forall ((k@16@01 Int)) (!
  (=>
    (and (<= x@5@01 k@16@01) (< k@16@01 (+ x@5@01 n@7@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@4@01 k@16@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@16@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@16@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@19@12@19@91|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  $Snap.unit))
; [eval] x + n < len(a) && y + n < len(a) ==> loc(a, x + n).val != loc(a, y + n).val
; [eval] x + n < len(a) && y + n < len(a)
; [eval] x + n < len(a)
; [eval] x + n
; [eval] len(a)
(push) ; 3
; [then-branch: 4 | !(x@5@01 + n@7@01 < len[Int](a@4@01)) | live]
; [else-branch: 4 | x@5@01 + n@7@01 < len[Int](a@4@01) | live]
(push) ; 4
; [then-branch: 4 | !(x@5@01 + n@7@01 < len[Int](a@4@01))]
(assert (not (< (+ x@5@01 n@7@01) (len<Int> a@4@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | x@5@01 + n@7@01 < len[Int](a@4@01)]
(assert (< (+ x@5@01 n@7@01) (len<Int> a@4@01)))
; [eval] y + n < len(a)
; [eval] y + n
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (< (+ x@5@01 n@7@01) (len<Int> a@4@01))
  (not (< (+ x@5@01 n@7@01) (len<Int> a@4@01)))))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@5@01 n@7@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@7@01) (len<Int> a@4@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (< (+ x@5@01 n@7@01) (len<Int> a@4@01))
  (< (+ y@6@01 n@7@01) (len<Int> a@4@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | x@5@01 + n@7@01 < len[Int](a@4@01) && y@6@01 + n@7@01 < len[Int](a@4@01) | live]
; [else-branch: 5 | !(x@5@01 + n@7@01 < len[Int](a@4@01) && y@6@01 + n@7@01 < len[Int](a@4@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | x@5@01 + n@7@01 < len[Int](a@4@01) && y@6@01 + n@7@01 < len[Int](a@4@01)]
(assert (and
  (< (+ x@5@01 n@7@01) (len<Int> a@4@01))
  (< (+ y@6@01 n@7@01) (len<Int> a@4@01))))
; [eval] loc(a, x + n).val != loc(a, y + n).val
; [eval] loc(a, x + n)
; [eval] x + n
(push) ; 5
(assert (not (and
  (img@15@01 (loc<Ref> a@4@01 (+ x@5@01 n@7@01)))
  (and
    (<= 0 (inv@14@01 (loc<Ref> a@4@01 (+ x@5@01 n@7@01))))
    (< (inv@14@01 (loc<Ref> a@4@01 (+ x@5@01 n@7@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + n)
; [eval] y + n
(push) ; 5
(assert (not (and
  (img@15@01 (loc<Ref> a@4@01 (+ y@6@01 n@7@01)))
  (and
    (<= 0 (inv@14@01 (loc<Ref> a@4@01 (+ y@6@01 n@7@01))))
    (< (inv@14@01 (loc<Ref> a@4@01 (+ y@6@01 n@7@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(x@5@01 + n@7@01 < len[Int](a@4@01) && y@6@01 + n@7@01 < len[Int](a@4@01))]
(assert (not
  (and
    (< (+ x@5@01 n@7@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@7@01) (len<Int> a@4@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (< (+ x@5@01 n@7@01) (len<Int> a@4@01))
      (< (+ y@6@01 n@7@01) (len<Int> a@4@01))))
  (and
    (< (+ x@5@01 n@7@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@7@01) (len<Int> a@4@01)))))
(assert (=>
  (and
    (< (+ x@5@01 n@7@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@7@01) (len<Int> a@4@01)))
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@4@01 (+
        x@5@01
        n@7@01)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@4@01 (+
        y@6@01
        n@7@01)))))))
(pop) ; 2
(push) ; 2
; [exec]
; n := 0
(declare-const n@17@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.first $t@18@01) $Snap.unit))
; [eval] n >= 0
(assert (>= n@17@01 0))
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
(declare-const k$1@19@01 Int)
(push) ; 4
; [eval] 0 <= k$1 && k$1 < len(a)
; [eval] 0 <= k$1
(push) ; 5
; [then-branch: 6 | !(0 <= k$1@19@01) | live]
; [else-branch: 6 | 0 <= k$1@19@01 | live]
(push) ; 6
; [then-branch: 6 | !(0 <= k$1@19@01)]
(assert (not (<= 0 k$1@19@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | 0 <= k$1@19@01]
(assert (<= 0 k$1@19@01))
; [eval] k$1 < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k$1@19@01) (not (<= 0 k$1@19@01))))
(assert (and (<= 0 k$1@19@01) (< k$1@19@01 (len<Int> a@4@01))))
; [eval] loc(a, k$1)
(pop) ; 4
(declare-fun inv@20@01 ($Ref) Int)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k$1@19@01 Int)) (!
  (=>
    (and (<= 0 k$1@19@01) (< k$1@19@01 (len<Int> a@4@01)))
    (or (<= 0 k$1@19@01) (not (<= 0 k$1@19@01))))
  :pattern ((loc<Ref> a@4@01 k$1@19@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k$11@19@01 Int) (k$12@19@01 Int)) (!
  (=>
    (and
      (and (<= 0 k$11@19@01) (< k$11@19@01 (len<Int> a@4@01)))
      (and (<= 0 k$12@19@01) (< k$12@19@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 k$11@19@01) (loc<Ref> a@4@01 k$12@19@01)))
    (= k$11@19@01 k$12@19@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k$1@19@01 Int)) (!
  (=>
    (and (<= 0 k$1@19@01) (< k$1@19@01 (len<Int> a@4@01)))
    (and
      (= (inv@20@01 (loc<Ref> a@4@01 k$1@19@01)) k$1@19@01)
      (img@21@01 (loc<Ref> a@4@01 k$1@19@01))))
  :pattern ((loc<Ref> a@4@01 k$1@19@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@20@01 r)) r))
  :pattern ((inv@20@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k$1@19@01 Int)) (!
  (=>
    (and (<= 0 k$1@19@01) (< k$1@19@01 (len<Int> a@4@01)))
    (not (= (loc<Ref> a@4@01 k$1@19@01) $Ref.null)))
  :pattern ((loc<Ref> a@4@01 k$1@19@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@18@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@18@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@18@01))) $Snap.unit))
; [eval] x + n <= len(a)
; [eval] x + n
; [eval] len(a)
(assert (<= (+ x@5@01 n@17@01) (len<Int> a@4@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@18@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@18@01))))
  $Snap.unit))
; [eval] y + n <= len(a)
; [eval] y + n
; [eval] len(a)
(assert (<= (+ y@6@01 n@17@01) (len<Int> a@4@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))
  $Snap.unit))
; [eval] (forall k: Int :: { loc(a, k) } x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val)
(declare-const k@22@01 Int)
(push) ; 4
; [eval] x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val
; [eval] x <= k && k < x + n
; [eval] x <= k
(push) ; 5
; [then-branch: 7 | !(x@5@01 <= k@22@01) | live]
; [else-branch: 7 | x@5@01 <= k@22@01 | live]
(push) ; 6
; [then-branch: 7 | !(x@5@01 <= k@22@01)]
(assert (not (<= x@5@01 k@22@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | x@5@01 <= k@22@01]
(assert (<= x@5@01 k@22@01))
; [eval] k < x + n
; [eval] x + n
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= x@5@01 k@22@01) (not (<= x@5@01 k@22@01))))
(push) ; 5
; [then-branch: 8 | x@5@01 <= k@22@01 && k@22@01 < x@5@01 + n@17@01 | live]
; [else-branch: 8 | !(x@5@01 <= k@22@01 && k@22@01 < x@5@01 + n@17@01) | live]
(push) ; 6
; [then-branch: 8 | x@5@01 <= k@22@01 && k@22@01 < x@5@01 + n@17@01]
(assert (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01))))
; [eval] loc(a, k).val == loc(a, y + k - x).val
; [eval] loc(a, k)
(push) ; 7
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 k@22@01))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 k@22@01)))
    (< (inv@20@01 (loc<Ref> a@4@01 k@22@01)) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + k - x)
; [eval] y + k - x
; [eval] y + k
(push) ; 7
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@22@01) x@5@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@22@01) x@5@01))))
    (<
      (inv@20@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@22@01) x@5@01)))
      (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 8 | !(x@5@01 <= k@22@01 && k@22@01 < x@5@01 + n@17@01)]
(assert (not (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01))))
  (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@22@01 Int)) (!
  (and
    (or (<= x@5@01 k@22@01) (not (<= x@5@01 k@22@01)))
    (or
      (not (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01))))
      (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01)))))
  :pattern ((loc<Ref> a@4@01 k@22@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95-aux|)))
(assert (forall ((k@22@01 Int)) (!
  (=>
    (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 k@22@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@22@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@22@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] n >= 0
(declare-const k$1@23@01 Int)
(push) ; 4
; [eval] 0 <= k$1 && k$1 < len(a)
; [eval] 0 <= k$1
(push) ; 5
; [then-branch: 9 | !(0 <= k$1@23@01) | live]
; [else-branch: 9 | 0 <= k$1@23@01 | live]
(push) ; 6
; [then-branch: 9 | !(0 <= k$1@23@01)]
(assert (not (<= 0 k$1@23@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | 0 <= k$1@23@01]
(assert (<= 0 k$1@23@01))
; [eval] k$1 < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k$1@23@01) (not (<= 0 k$1@23@01))))
(assert (and (<= 0 k$1@23@01) (< k$1@23@01 (len<Int> a@4@01))))
; [eval] loc(a, k$1)
(pop) ; 4
(declare-fun inv@24@01 ($Ref) Int)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k$1@23@01 Int)) (!
  (=>
    (and (<= 0 k$1@23@01) (< k$1@23@01 (len<Int> a@4@01)))
    (or (<= 0 k$1@23@01) (not (<= 0 k$1@23@01))))
  :pattern ((loc<Ref> a@4@01 k$1@23@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k$11@23@01 Int) (k$12@23@01 Int)) (!
  (=>
    (and
      (and (<= 0 k$11@23@01) (< k$11@23@01 (len<Int> a@4@01)))
      (and (<= 0 k$12@23@01) (< k$12@23@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 k$11@23@01) (loc<Ref> a@4@01 k$12@23@01)))
    (= k$11@23@01 k$12@23@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k$1@23@01 Int)) (!
  (=>
    (and (<= 0 k$1@23@01) (< k$1@23@01 (len<Int> a@4@01)))
    (and
      (= (inv@24@01 (loc<Ref> a@4@01 k$1@23@01)) k$1@23@01)
      (img@25@01 (loc<Ref> a@4@01 k$1@23@01))))
  :pattern ((loc<Ref> a@4@01 k$1@23@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@01 r)
      (and (<= 0 (inv@24@01 r)) (< (inv@24@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@24@01 r)) r))
  :pattern ((inv@24@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@24@01 r)) (< (inv@24@01 r) (len<Int> a@4@01)))
      (img@25@01 r)
      (= r (loc<Ref> a@4@01 (inv@24@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (len<Int> a@4@01))))
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
          (img@11@01 r)
          (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@26@01 r))
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
      (and (<= 0 (inv@24@01 r)) (< (inv@24@01 r) (len<Int> a@4@01)))
      (img@25@01 r)
      (= r (loc<Ref> a@4@01 (inv@24@01 r))))
    (= (- $Perm.Write (pTaken@26@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@27@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (len<Int> a@4@01))))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@8@01)) r))
  :qid |qp.fvfValDef0|)))
; [eval] x + n <= len(a)
; [eval] x + n
; [eval] len(a)
(set-option :timeout 0)
(push) ; 4
(assert (not (<= x@5@01 (len<Int> a@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= x@5@01 (len<Int> a@4@01)))
; [eval] y + n <= len(a)
; [eval] y + n
; [eval] len(a)
(push) ; 4
(assert (not (<= y@6@01 (len<Int> a@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= y@6@01 (len<Int> a@4@01)))
; [eval] (forall k: Int :: { loc(a, k) } x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val)
(declare-const k@28@01 Int)
(push) ; 4
; [eval] x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val
; [eval] x <= k && k < x + n
; [eval] x <= k
(push) ; 5
; [then-branch: 10 | !(x@5@01 <= k@28@01) | live]
; [else-branch: 10 | x@5@01 <= k@28@01 | live]
(push) ; 6
; [then-branch: 10 | !(x@5@01 <= k@28@01)]
(assert (not (<= x@5@01 k@28@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | x@5@01 <= k@28@01]
(assert (<= x@5@01 k@28@01))
; [eval] k < x + n
; [eval] x + n
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= x@5@01 k@28@01) (not (<= x@5@01 k@28@01))))
(push) ; 5
; [then-branch: 11 | x@5@01 <= k@28@01 && k@28@01 < x@5@01 | live]
; [else-branch: 11 | !(x@5@01 <= k@28@01 && k@28@01 < x@5@01) | live]
(push) ; 6
; [then-branch: 11 | x@5@01 <= k@28@01 && k@28@01 < x@5@01]
(assert (and (<= x@5@01 k@28@01) (< k@28@01 x@5@01)))
; [eval] loc(a, k).val == loc(a, y + k - x).val
; [eval] loc(a, k)
(push) ; 7
(assert (not (and
  (img@11@01 (loc<Ref> a@4@01 k@28@01))
  (and
    (<= 0 (inv@10@01 (loc<Ref> a@4@01 k@28@01)))
    (< (inv@10@01 (loc<Ref> a@4@01 k@28@01)) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + k - x)
; [eval] y + k - x
; [eval] y + k
(push) ; 7
(assert (not (and
  (img@11@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@28@01) x@5@01)))
  (and
    (<= 0 (inv@10@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@28@01) x@5@01))))
    (<
      (inv@10@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@28@01) x@5@01)))
      (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(x@5@01 <= k@28@01 && k@28@01 < x@5@01)]
(assert (not (and (<= x@5@01 k@28@01) (< k@28@01 x@5@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= x@5@01 k@28@01) (< k@28@01 x@5@01)))
  (and (<= x@5@01 k@28@01) (< k@28@01 x@5@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@28@01 Int)) (!
  (and
    (or (<= x@5@01 k@28@01) (not (<= x@5@01 k@28@01)))
    (or
      (not (and (<= x@5@01 k@28@01) (< k@28@01 x@5@01)))
      (and (<= x@5@01 k@28@01) (< k@28@01 x@5@01))))
  :pattern ((loc<Ref> a@4@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95-aux|)))
(push) ; 4
(assert (not (forall ((k@28@01 Int)) (!
  (=>
    (and (<= x@5@01 k@28@01) (< k@28@01 x@5@01))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> a@4@01 k@28@01))
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@28@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@28@01 Int)) (!
  (=>
    (and (<= x@5@01 k@28@01) (< k@28@01 x@5@01))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> a@4@01 k@28@01))
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@28@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@20@01 r)) r))
  :pattern ((inv@20@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((k$1@19@01 Int)) (!
  (=>
    (and (<= 0 k$1@19@01) (< k$1@19@01 (len<Int> a@4@01)))
    (and
      (= (inv@20@01 (loc<Ref> a@4@01 k$1@19@01)) k$1@19@01)
      (img@21@01 (loc<Ref> a@4@01 k$1@19@01))))
  :pattern ((loc<Ref> a@4@01 k$1@19@01))
  :qid |quant-u-5|)))
(assert (forall ((k$1@19@01 Int)) (!
  (=>
    (and (<= 0 k$1@19@01) (< k$1@19@01 (len<Int> a@4@01)))
    (not (= (loc<Ref> a@4@01 k$1@19@01) $Ref.null)))
  :pattern ((loc<Ref> a@4@01 k$1@19@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@18@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@18@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@18@01))) $Snap.unit))
(assert (<= (+ x@5@01 n@17@01) (len<Int> a@4@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@18@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@18@01))))
  $Snap.unit))
(assert (<= (+ y@6@01 n@17@01) (len<Int> a@4@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))
  $Snap.unit))
(assert (forall ((k@22@01 Int)) (!
  (and
    (or (<= x@5@01 k@22@01) (not (<= x@5@01 k@22@01)))
    (or
      (not (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01))))
      (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01)))))
  :pattern ((loc<Ref> a@4@01 k@22@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95-aux|)))
(assert (forall ((k@22@01 Int)) (!
  (=>
    (and (<= x@5@01 k@22@01) (< k@22@01 (+ x@5@01 n@17@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 k@22@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@22@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@22@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95|)))
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.first $t@18@01) $Snap.unit))
(assert (>= n@17@01 0))
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
(assert (forall ((k$1@19@01 Int)) (!
  (=>
    (and (<= 0 k$1@19@01) (< k$1@19@01 (len<Int> a@4@01)))
    (or (<= 0 k$1@19@01) (not (<= 0 k$1@19@01))))
  :pattern ((loc<Ref> a@4@01 k$1@19@01))
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
; [eval] x + n < len(a) && (y + n < len(a) && loc(a, x + n).val == loc(a, y + n).val)
; [eval] x + n < len(a)
; [eval] x + n
; [eval] len(a)
(push) ; 6
; [then-branch: 12 | !(x@5@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 12 | x@5@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 7
; [then-branch: 12 | !(x@5@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ x@5@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 12 | x@5@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ x@5@01 n@17@01) (len<Int> a@4@01)))
; [eval] y + n < len(a)
; [eval] y + n
; [eval] len(a)
(push) ; 8
; [then-branch: 13 | !(y@6@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 13 | y@6@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 9
; [then-branch: 13 | !(y@6@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 13 | y@6@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))
; [eval] loc(a, x + n).val == loc(a, y + n).val
; [eval] loc(a, x + n)
; [eval] x + n
(push) ; 10
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + n)
; [eval] y + n
(push) ; 10
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
  (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (or
      (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
      (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))))
(assert (or
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (not (< (+ x@5@01 n@17@01) (len<Int> a@4@01)))))
(pop) ; 5
(push) ; 5
; [eval] !(x + n < len(a) && (y + n < len(a) && loc(a, x + n).val == loc(a, y + n).val))
; [eval] x + n < len(a) && (y + n < len(a) && loc(a, x + n).val == loc(a, y + n).val)
; [eval] x + n < len(a)
; [eval] x + n
; [eval] len(a)
(push) ; 6
; [then-branch: 14 | !(x@5@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 14 | x@5@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 7
; [then-branch: 14 | !(x@5@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ x@5@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 14 | x@5@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ x@5@01 n@17@01) (len<Int> a@4@01)))
; [eval] y + n < len(a)
; [eval] y + n
; [eval] len(a)
(push) ; 8
; [then-branch: 15 | !(y@6@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 15 | y@6@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 9
; [then-branch: 15 | !(y@6@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 15 | y@6@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))
; [eval] loc(a, x + n).val == loc(a, y + n).val
; [eval] loc(a, x + n)
; [eval] x + n
(push) ; 10
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + n)
; [eval] y + n
(push) ; 10
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
  (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (or
      (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
      (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))))
(assert (or
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (not (< (+ x@5@01 n@17@01) (len<Int> a@4@01)))))
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] x + n < len(a) && (y + n < len(a) && loc(a, x + n).val == loc(a, y + n).val)
; [eval] x + n < len(a)
; [eval] x + n
; [eval] len(a)
(push) ; 5
; [then-branch: 16 | !(x@5@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 16 | x@5@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 6
; [then-branch: 16 | !(x@5@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ x@5@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | x@5@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ x@5@01 n@17@01) (len<Int> a@4@01)))
; [eval] y + n < len(a)
; [eval] y + n
; [eval] len(a)
(push) ; 7
; [then-branch: 17 | !(y@6@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 17 | y@6@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 8
; [then-branch: 17 | !(y@6@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | y@6@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))
; [eval] loc(a, x + n).val == loc(a, y + n).val
; [eval] loc(a, x + n)
; [eval] x + n
(push) ; 9
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + n)
; [eval] y + n
(push) ; 9
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))) (len<Int> a@4@01))))))
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
  (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
  (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (or
      (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
      (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))))
(assert (or
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (not (< (+ x@5@01 n@17@01) (len<Int> a@4@01)))))
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (and
      (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
          x@5@01
          n@17@01)))
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
          y@6@01
          n@17@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (and
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
        x@5@01
        n@17@01)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
        y@6@01
        n@17@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) && Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, x@5@01 + n@17@01)) == Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, y@6@01 + n@17@01)) | live]
; [else-branch: 18 | !(x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) && Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, x@5@01 + n@17@01)) == Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, y@6@01 + n@17@01))) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) && Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, x@5@01 + n@17@01)) == Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, y@6@01 + n@17@01))]
(assert (and
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (and
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
        x@5@01
        n@17@01)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
        y@6@01
        n@17@01)))))))
; [exec]
; n := n + 1
; [eval] n + 1
(declare-const n@29@01 Int)
(assert (= n@29@01 (+ n@17@01 1)))
; Loop head block: Re-establish invariant
; [eval] n >= 0
(push) ; 6
(assert (not (>= n@29@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (>= n@29@01 0))
(declare-const k$1@30@01 Int)
(push) ; 6
; [eval] 0 <= k$1 && k$1 < len(a)
; [eval] 0 <= k$1
(push) ; 7
; [then-branch: 19 | !(0 <= k$1@30@01) | live]
; [else-branch: 19 | 0 <= k$1@30@01 | live]
(push) ; 8
; [then-branch: 19 | !(0 <= k$1@30@01)]
(assert (not (<= 0 k$1@30@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | 0 <= k$1@30@01]
(assert (<= 0 k$1@30@01))
; [eval] k$1 < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k$1@30@01) (not (<= 0 k$1@30@01))))
(assert (and (<= 0 k$1@30@01) (< k$1@30@01 (len<Int> a@4@01))))
; [eval] loc(a, k$1)
(pop) ; 6
(declare-fun inv@31@01 ($Ref) Int)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k$1@30@01 Int)) (!
  (=>
    (and (<= 0 k$1@30@01) (< k$1@30@01 (len<Int> a@4@01)))
    (or (<= 0 k$1@30@01) (not (<= 0 k$1@30@01))))
  :pattern ((loc<Ref> a@4@01 k$1@30@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((k$11@30@01 Int) (k$12@30@01 Int)) (!
  (=>
    (and
      (and (<= 0 k$11@30@01) (< k$11@30@01 (len<Int> a@4@01)))
      (and (<= 0 k$12@30@01) (< k$12@30@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 k$11@30@01) (loc<Ref> a@4@01 k$12@30@01)))
    (= k$11@30@01 k$12@30@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k$1@30@01 Int)) (!
  (=>
    (and (<= 0 k$1@30@01) (< k$1@30@01 (len<Int> a@4@01)))
    (and
      (= (inv@31@01 (loc<Ref> a@4@01 k$1@30@01)) k$1@30@01)
      (img@32@01 (loc<Ref> a@4@01 k$1@30@01))))
  :pattern ((loc<Ref> a@4@01 k$1@30@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@01 r)
      (and (<= 0 (inv@31@01 r)) (< (inv@31@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@31@01 r)) (< (inv@31@01 r) (len<Int> a@4@01)))
      (img@32@01 r)
      (= r (loc<Ref> a@4@01 (inv@31@01 r))))
    ($Perm.min
      (ite
        (and
          (img@21@01 r)
          (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) (len<Int> a@4@01))))
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
          (img@21@01 r)
          (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@33@01 r))
    $Perm.No)
  
  :qid |quant-u-12|))))
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
      (and (<= 0 (inv@31@01 r)) (< (inv@31@01 r) (len<Int> a@4@01)))
      (img@32@01 r)
      (= r (loc<Ref> a@4@01 (inv@31@01 r))))
    (= (- $Perm.Write (pTaken@33@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@34@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) (len<Int> a@4@01))))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) r))
  :qid |qp.fvfValDef1|)))
; [eval] x + n <= len(a)
; [eval] x + n
; [eval] len(a)
(set-option :timeout 0)
(push) ; 6
(assert (not (<= (+ x@5@01 n@29@01) (len<Int> a@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ x@5@01 n@29@01) (len<Int> a@4@01)))
; [eval] y + n <= len(a)
; [eval] y + n
; [eval] len(a)
(push) ; 6
(assert (not (<= (+ y@6@01 n@29@01) (len<Int> a@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ y@6@01 n@29@01) (len<Int> a@4@01)))
; [eval] (forall k: Int :: { loc(a, k) } x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val)
(declare-const k@35@01 Int)
(push) ; 6
; [eval] x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val
; [eval] x <= k && k < x + n
; [eval] x <= k
(push) ; 7
; [then-branch: 20 | !(x@5@01 <= k@35@01) | live]
; [else-branch: 20 | x@5@01 <= k@35@01 | live]
(push) ; 8
; [then-branch: 20 | !(x@5@01 <= k@35@01)]
(assert (not (<= x@5@01 k@35@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | x@5@01 <= k@35@01]
(assert (<= x@5@01 k@35@01))
; [eval] k < x + n
; [eval] x + n
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= x@5@01 k@35@01) (not (<= x@5@01 k@35@01))))
(push) ; 7
; [then-branch: 21 | x@5@01 <= k@35@01 && k@35@01 < x@5@01 + n@29@01 | live]
; [else-branch: 21 | !(x@5@01 <= k@35@01 && k@35@01 < x@5@01 + n@29@01) | live]
(push) ; 8
; [then-branch: 21 | x@5@01 <= k@35@01 && k@35@01 < x@5@01 + n@29@01]
(assert (and (<= x@5@01 k@35@01) (< k@35@01 (+ x@5@01 n@29@01))))
; [eval] loc(a, k).val == loc(a, y + k - x).val
; [eval] loc(a, k)
(push) ; 9
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 k@35@01))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 k@35@01)))
    (< (inv@20@01 (loc<Ref> a@4@01 k@35@01)) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + k - x)
; [eval] y + k - x
; [eval] y + k
(push) ; 9
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@35@01) x@5@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@35@01) x@5@01))))
    (<
      (inv@20@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@35@01) x@5@01)))
      (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 21 | !(x@5@01 <= k@35@01 && k@35@01 < x@5@01 + n@29@01)]
(assert (not (and (<= x@5@01 k@35@01) (< k@35@01 (+ x@5@01 n@29@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= x@5@01 k@35@01) (< k@35@01 (+ x@5@01 n@29@01))))
  (and (<= x@5@01 k@35@01) (< k@35@01 (+ x@5@01 n@29@01)))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@35@01 Int)) (!
  (and
    (or (<= x@5@01 k@35@01) (not (<= x@5@01 k@35@01)))
    (or
      (not (and (<= x@5@01 k@35@01) (< k@35@01 (+ x@5@01 n@29@01))))
      (and (<= x@5@01 k@35@01) (< k@35@01 (+ x@5@01 n@29@01)))))
  :pattern ((loc<Ref> a@4@01 k@35@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95-aux|)))
(push) ; 6
(assert (not (forall ((k@35@01 Int)) (!
  (=>
    (and (<= x@5@01 k@35@01) (< k@35@01 (+ x@5@01 n@29@01)))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) (loc<Ref> a@4@01 k@35@01))
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@35@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@35@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@35@01 Int)) (!
  (=>
    (and (<= x@5@01 k@35@01) (< k@35@01 (+ x@5@01 n@29@01)))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) (loc<Ref> a@4@01 k@35@01))
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@35@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@35@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@32@16@32@95|)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) && Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, x@5@01 + n@17@01)) == Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, y@6@01 + n@17@01)))]
(assert (not
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (and
      (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
          x@5@01
          n@17@01)))
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
          y@6@01
          n@17@01))))))))
(pop) ; 5
; [eval] !(x + n < len(a) && (y + n < len(a) && loc(a, x + n).val == loc(a, y + n).val))
; [eval] x + n < len(a) && (y + n < len(a) && loc(a, x + n).val == loc(a, y + n).val)
; [eval] x + n < len(a)
; [eval] x + n
; [eval] len(a)
(push) ; 5
; [then-branch: 22 | !(x@5@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 22 | x@5@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 6
; [then-branch: 22 | !(x@5@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ x@5@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | x@5@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ x@5@01 n@17@01) (len<Int> a@4@01)))
; [eval] y + n < len(a)
; [eval] y + n
; [eval] len(a)
(push) ; 7
; [then-branch: 23 | !(y@6@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 23 | y@6@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 8
; [then-branch: 23 | !(y@6@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | y@6@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))
; [eval] loc(a, x + n).val == loc(a, y + n).val
; [eval] loc(a, x + n)
; [eval] x + n
(push) ; 9
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + n)
; [eval] y + n
(push) ; 9
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))) (len<Int> a@4@01))))))
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
  (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
  (not (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (and
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
        x@5@01
        n@17@01)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
        y@6@01
        n@17@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (and
      (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
          x@5@01
          n@17@01)))
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
          y@6@01
          n@17@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | !(x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) && Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, x@5@01 + n@17@01)) == Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, y@6@01 + n@17@01))) | live]
; [else-branch: 24 | x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) && Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, x@5@01 + n@17@01)) == Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, y@6@01 + n@17@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 24 | !(x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) && Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, x@5@01 + n@17@01)) == Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, y@6@01 + n@17@01)))]
(assert (not
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (and
      (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
          x@5@01
          n@17@01)))
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
          y@6@01
          n@17@01))))))))
(declare-const k$0@36@01 Int)
(push) ; 6
; [eval] 0 <= k$0 && k$0 < len(a)
; [eval] 0 <= k$0
(push) ; 7
; [then-branch: 25 | !(0 <= k$0@36@01) | live]
; [else-branch: 25 | 0 <= k$0@36@01 | live]
(push) ; 8
; [then-branch: 25 | !(0 <= k$0@36@01)]
(assert (not (<= 0 k$0@36@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 25 | 0 <= k$0@36@01]
(assert (<= 0 k$0@36@01))
; [eval] k$0 < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k$0@36@01) (not (<= 0 k$0@36@01))))
(assert (and (<= 0 k$0@36@01) (< k$0@36@01 (len<Int> a@4@01))))
; [eval] loc(a, k$0)
(pop) ; 6
(declare-fun inv@37@01 ($Ref) Int)
(declare-fun img@38@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k$0@36@01 Int)) (!
  (=>
    (and (<= 0 k$0@36@01) (< k$0@36@01 (len<Int> a@4@01)))
    (or (<= 0 k$0@36@01) (not (<= 0 k$0@36@01))))
  :pattern ((loc<Ref> a@4@01 k$0@36@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((k$01@36@01 Int) (k$02@36@01 Int)) (!
  (=>
    (and
      (and (<= 0 k$01@36@01) (< k$01@36@01 (len<Int> a@4@01)))
      (and (<= 0 k$02@36@01) (< k$02@36@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 k$01@36@01) (loc<Ref> a@4@01 k$02@36@01)))
    (= k$01@36@01 k$02@36@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k$0@36@01 Int)) (!
  (=>
    (and (<= 0 k$0@36@01) (< k$0@36@01 (len<Int> a@4@01)))
    (and
      (= (inv@37@01 (loc<Ref> a@4@01 k$0@36@01)) k$0@36@01)
      (img@38@01 (loc<Ref> a@4@01 k$0@36@01))))
  :pattern ((loc<Ref> a@4@01 k$0@36@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@38@01 r)
      (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@37@01 r)) r))
  :pattern ((inv@37@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@39@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) (len<Int> a@4@01)))
      (img@38@01 r)
      (= r (loc<Ref> a@4@01 (inv@37@01 r))))
    ($Perm.min
      (ite
        (and
          (img@21@01 r)
          (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) (len<Int> a@4@01))))
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
          (img@21@01 r)
          (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@39@01 r))
    $Perm.No)
  
  :qid |quant-u-16|))))
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
      (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) (len<Int> a@4@01)))
      (img@38@01 r)
      (= r (loc<Ref> a@4@01 (inv@37@01 r))))
    (= (- $Perm.Write (pTaken@39@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@40@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) (len<Int> a@4@01))))
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) r)))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) r))
  :qid |qp.fvfValDef2|)))
; [eval] 0 <= n
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 n@17@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 n@17@01))
; [eval] x + n <= len(a)
; [eval] x + n
; [eval] len(a)
; [eval] y + n <= len(a)
; [eval] y + n
; [eval] len(a)
; [eval] (forall k: Int :: { loc(a, k) } x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val)
(declare-const k@41@01 Int)
(push) ; 6
; [eval] x <= k && k < x + n ==> loc(a, k).val == loc(a, y + k - x).val
; [eval] x <= k && k < x + n
; [eval] x <= k
(push) ; 7
; [then-branch: 26 | !(x@5@01 <= k@41@01) | live]
; [else-branch: 26 | x@5@01 <= k@41@01 | live]
(push) ; 8
; [then-branch: 26 | !(x@5@01 <= k@41@01)]
(assert (not (<= x@5@01 k@41@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 26 | x@5@01 <= k@41@01]
(assert (<= x@5@01 k@41@01))
; [eval] k < x + n
; [eval] x + n
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= x@5@01 k@41@01) (not (<= x@5@01 k@41@01))))
(push) ; 7
; [then-branch: 27 | x@5@01 <= k@41@01 && k@41@01 < x@5@01 + n@17@01 | live]
; [else-branch: 27 | !(x@5@01 <= k@41@01 && k@41@01 < x@5@01 + n@17@01) | live]
(push) ; 8
; [then-branch: 27 | x@5@01 <= k@41@01 && k@41@01 < x@5@01 + n@17@01]
(assert (and (<= x@5@01 k@41@01) (< k@41@01 (+ x@5@01 n@17@01))))
; [eval] loc(a, k).val == loc(a, y + k - x).val
; [eval] loc(a, k)
(push) ; 9
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 k@41@01))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 k@41@01)))
    (< (inv@20@01 (loc<Ref> a@4@01 k@41@01)) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + k - x)
; [eval] y + k - x
; [eval] y + k
(push) ; 9
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@41@01) x@5@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@41@01) x@5@01))))
    (<
      (inv@20@01 (loc<Ref> a@4@01 (- (+ y@6@01 k@41@01) x@5@01)))
      (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 27 | !(x@5@01 <= k@41@01 && k@41@01 < x@5@01 + n@17@01)]
(assert (not (and (<= x@5@01 k@41@01) (< k@41@01 (+ x@5@01 n@17@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= x@5@01 k@41@01) (< k@41@01 (+ x@5@01 n@17@01))))
  (and (<= x@5@01 k@41@01) (< k@41@01 (+ x@5@01 n@17@01)))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@41@01 Int)) (!
  (and
    (or (<= x@5@01 k@41@01) (not (<= x@5@01 k@41@01)))
    (or
      (not (and (<= x@5@01 k@41@01) (< k@41@01 (+ x@5@01 n@17@01))))
      (and (<= x@5@01 k@41@01) (< k@41@01 (+ x@5@01 n@17@01)))))
  :pattern ((loc<Ref> a@4@01 k@41@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@19@12@19@91-aux|)))
(push) ; 6
(assert (not (forall ((k@41@01 Int)) (!
  (=>
    (and (<= x@5@01 k@41@01) (< k@41@01 (+ x@5@01 n@17@01)))
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) (loc<Ref> a@4@01 k@41@01))
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@41@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@41@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@19@12@19@91|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@41@01 Int)) (!
  (=>
    (and (<= x@5@01 k@41@01) (< k@41@01 (+ x@5@01 n@17@01)))
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) (loc<Ref> a@4@01 k@41@01))
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) (loc<Ref> a@4@01 (-
        (+ y@6@01 k@41@01)
        x@5@01)))))
  :pattern ((loc<Ref> a@4@01 k@41@01))
  :qid |prog./silicon/silver/src/test/resources/examples/longest-common-prefix/longest-common-prefix.vpr@19@12@19@91|)))
; [eval] x + n < len(a) && y + n < len(a) ==> loc(a, x + n).val != loc(a, y + n).val
; [eval] x + n < len(a) && y + n < len(a)
; [eval] x + n < len(a)
; [eval] x + n
; [eval] len(a)
(push) ; 6
; [then-branch: 28 | !(x@5@01 + n@17@01 < len[Int](a@4@01)) | live]
; [else-branch: 28 | x@5@01 + n@17@01 < len[Int](a@4@01) | live]
(push) ; 7
; [then-branch: 28 | !(x@5@01 + n@17@01 < len[Int](a@4@01))]
(assert (not (< (+ x@5@01 n@17@01) (len<Int> a@4@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | x@5@01 + n@17@01 < len[Int](a@4@01)]
(assert (< (+ x@5@01 n@17@01) (len<Int> a@4@01)))
; [eval] y + n < len(a)
; [eval] y + n
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) | live]
; [else-branch: 29 | !(x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 29 | x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01)]
(assert (and
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (< (+ y@6@01 n@17@01) (len<Int> a@4@01))))
; [eval] loc(a, x + n).val != loc(a, y + n).val
; [eval] loc(a, x + n)
; [eval] x + n
(push) ; 8
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ x@5@01 n@17@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + n)
; [eval] y + n
(push) ; 8
(assert (not (and
  (img@21@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01)))
  (and
    (<= 0 (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))))
    (< (inv@20@01 (loc<Ref> a@4@01 (+ y@6@01 n@17@01))) (len<Int> a@4@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 29 | !(x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01))]
(assert (not
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
      (< (+ y@6@01 n@17@01) (len<Int> a@4@01))))
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))))
(push) ; 6
(assert (not (=>
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) (loc<Ref> a@4@01 (+
        x@5@01
        n@17@01)))
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) (loc<Ref> a@4@01 (+
        y@6@01
        n@17@01))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and
    (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) (loc<Ref> a@4@01 (+
        x@5@01
        n@17@01)))
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) (loc<Ref> a@4@01 (+
        y@6@01
        n@17@01)))))))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | x@5@01 + n@17@01 < len[Int](a@4@01) && y@6@01 + n@17@01 < len[Int](a@4@01) && Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, x@5@01 + n@17@01)) == Lookup(val, First:(Second:($t@18@01)), loc[Ref](a@4@01, y@6@01 + n@17@01))]
(assert (and
  (< (+ x@5@01 n@17@01) (len<Int> a@4@01))
  (and
    (< (+ y@6@01 n@17@01) (len<Int> a@4@01))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
        x@5@01
        n@17@01)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@18@01))) (loc<Ref> a@4@01 (+
        y@6@01
        n@17@01)))))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
