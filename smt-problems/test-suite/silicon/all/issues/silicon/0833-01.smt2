(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:37
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0833.vpr
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
(declare-sort ShStruct2<Ref~_Ref> 0)
(declare-sort $FVF<Intint$$$$_E_$$$> 0)
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
(declare-fun $SortWrappers.ShStruct2<Ref~_Ref>To$Snap (ShStruct2<Ref~_Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap) ShStruct2<Ref~_Ref>)
(assert (forall ((x ShStruct2<Ref~_Ref>)) (!
    (= x ($SortWrappers.$SnapToShStruct2<Ref~_Ref>($SortWrappers.ShStruct2<Ref~_Ref>To$Snap x)))
    :pattern (($SortWrappers.ShStruct2<Ref~_Ref>To$Snap x))
    :qid |$Snap.$SnapToShStruct2<Ref~_Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap($SortWrappers.$SnapToShStruct2<Ref~_Ref> x)))
    :pattern (($SortWrappers.$SnapToShStruct2<Ref~_Ref> x))
    :qid |$Snap.ShStruct2<Ref~_Ref>To$SnapToShStruct2<Ref~_Ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<Intint$$$$_E_$$$>To$Snap ($FVF<Intint$$$$_E_$$$>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Intint$$$$_E_$$$> ($Snap) $FVF<Intint$$$$_E_$$$>)
(assert (forall ((x $FVF<Intint$$$$_E_$$$>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Intint$$$$_E_$$$>($SortWrappers.$FVF<Intint$$$$_E_$$$>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Intint$$$$_E_$$$>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Intint$$$$_E_$$$>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Intint$$$$_E_$$$>To$Snap($SortWrappers.$SnapTo$FVF<Intint$$$$_E_$$$> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Intint$$$$_E_$$$> x))
    :qid |$Snap.$FVF<Intint$$$$_E_$$$>To$SnapTo$FVF<Intint$$$$_E_$$$>|
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
(declare-fun ShStructget1of2<Ref> (ShStruct2<Ref~_Ref>) $Ref)
(declare-fun ShStructget0of2<Ref> (ShStruct2<Ref~_Ref>) $Ref)
(declare-fun ShStructrev1of2<ShStruct2<Ref~_Ref>> ($Ref) ShStruct2<Ref~_Ref>)
(declare-fun ShStructrev0of2<ShStruct2<Ref~_Ref>> ($Ref) ShStruct2<Ref~_Ref>)
; /field_value_functions_declarations.smt2 [Intint$$$$_E_$$$: Int]
(declare-fun $FVF.domain_Intint$$$$_E_$$$ ($FVF<Intint$$$$_E_$$$>) Set<$Ref>)
(declare-fun $FVF.lookup_Intint$$$$_E_$$$ ($FVF<Intint$$$$_E_$$$> $Ref) Int)
(declare-fun $FVF.after_Intint$$$$_E_$$$ ($FVF<Intint$$$$_E_$$$> $FVF<Intint$$$$_E_$$$>) Bool)
(declare-fun $FVF.loc_Intint$$$$_E_$$$ (Int $Ref) Bool)
(declare-fun $FVF.perm_Intint$$$$_E_$$$ ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Intint$$$$_E_$$$ $FVF<Intint$$$$_E_$$$>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun witness_rev ($Snap ShStruct2<Ref~_Ref>) Int)
(declare-fun witness_rev%limited ($Snap ShStruct2<Ref~_Ref>) Int)
(declare-fun witness_rev%stateless (ShStruct2<Ref~_Ref>) Bool)
(declare-fun witness_rev%precondition ($Snap ShStruct2<Ref~_Ref>) Bool)
(declare-fun witness_4e2a3fe_F ($Snap Int) ShStruct2<Ref~_Ref>)
(declare-fun witness_4e2a3fe_F%limited ($Snap Int) ShStruct2<Ref~_Ref>)
(declare-fun witness_4e2a3fe_F%stateless (Int) Bool)
(declare-fun witness_4e2a3fe_F%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun SharedInv_4e2a3fe_F%trigger ($Snap) Bool)
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
(assert (forall ((x ShStruct2<Ref~_Ref>)) (!
  (= (ShStructrev1of2<ShStruct2<Ref~_Ref>> (ShStructget1of2<Ref> x)) x)
  :pattern ((ShStructget1of2<Ref> x))
  )))
(assert (forall ((x ShStruct2<Ref~_Ref>)) (!
  (= (ShStructrev0of2<ShStruct2<Ref~_Ref>> (ShStructget0of2<Ref> x)) x)
  :pattern ((ShStructget0of2<Ref> x))
  )))
; /field_value_functions_axioms.smt2 [Intint$$$$_E_$$$: Int]
(assert (forall ((vs $FVF<Intint$$$$_E_$$$>) (ws $FVF<Intint$$$$_E_$$$>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Intint$$$$_E_$$$ vs) ($FVF.domain_Intint$$$$_E_$$$ ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Intint$$$$_E_$$$ vs))
            (= ($FVF.lookup_Intint$$$$_E_$$$ vs x) ($FVF.lookup_Intint$$$$_E_$$$ ws x)))
          :pattern (($FVF.lookup_Intint$$$$_E_$$$ vs x) ($FVF.lookup_Intint$$$$_E_$$$ ws x))
          :qid |qp.$FVF<Intint$$$$_E_$$$>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Intint$$$$_E_$$$>To$Snap vs)
              ($SortWrappers.$FVF<Intint$$$$_E_$$$>To$Snap ws)
              )
    :qid |qp.$FVF<Intint$$$$_E_$$$>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Intint$$$$_E_$$$ pm r))
    :pattern (($FVF.perm_Intint$$$$_E_$$$ pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_Intint$$$$_E_$$$ f r) true)
    :pattern (($FVF.loc_Intint$$$$_E_$$$ f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION witness_rev----------
(declare-fun s@0@00 () ShStruct2<Ref~_Ref>)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@0@00 ShStruct2<Ref~_Ref>)) (!
  (= (witness_rev%limited s@$ s@0@00) (witness_rev s@$ s@0@00))
  :pattern ((witness_rev s@$ s@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (s@0@00 ShStruct2<Ref~_Ref>)) (!
  (witness_rev%stateless s@0@00)
  :pattern ((witness_rev%limited s@$ s@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION witness_4e2a3fe_F----------
(declare-fun P0_PI0@2@00 () Int)
(declare-fun result@3@00 () ShStruct2<Ref~_Ref>)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@4@00 $Snap)
(assert (= $t@4@00 $Snap.unit))
; [eval] witness_rev(result) == P0_PI0
; [eval] witness_rev(result)
(push) ; 2
(assert (witness_rev%precondition $Snap.unit result@3@00))
(pop) ; 2
; Joined path conditions
(assert (witness_rev%precondition $Snap.unit result@3@00))
(assert (= (witness_rev $Snap.unit result@3@00) P0_PI0@2@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (P0_PI0@2@00 Int)) (!
  (=
    (witness_4e2a3fe_F%limited s@$ P0_PI0@2@00)
    (witness_4e2a3fe_F s@$ P0_PI0@2@00))
  :pattern ((witness_4e2a3fe_F s@$ P0_PI0@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (P0_PI0@2@00 Int)) (!
  (witness_4e2a3fe_F%stateless P0_PI0@2@00)
  :pattern ((witness_4e2a3fe_F%limited s@$ P0_PI0@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (P0_PI0@2@00 Int)) (!
  (let ((result@3@00 (witness_4e2a3fe_F%limited s@$ P0_PI0@2@00))) (=>
    (witness_4e2a3fe_F%precondition s@$ P0_PI0@2@00)
    (= (witness_rev $Snap.unit result@3@00) P0_PI0@2@00)))
  :pattern ((witness_4e2a3fe_F%limited s@$ P0_PI0@2@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (P0_PI0@2@00 Int)) (!
  (let ((result@3@00 (witness_4e2a3fe_F%limited s@$ P0_PI0@2@00))) (=>
    (witness_4e2a3fe_F%precondition s@$ P0_PI0@2@00)
    (witness_rev%precondition $Snap.unit result@3@00)))
  :pattern ((witness_4e2a3fe_F%limited s@$ P0_PI0@2@00))
  :qid |quant-u-5|)))
; ---------- SharedInv_4e2a3fe_F ----------
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 ($Snap.combine ($Snap.first $t@5@00) ($Snap.second $t@5@00))))
(declare-const i_V0@6@00 Int)
(push) ; 2
; [eval] true && (let fn$$0 == (witness_4e2a3fe_F(i_V0)) in true)
(push) ; 3
; [then-branch: 0 | False | live]
; [else-branch: 0 | True | live]
(push) ; 4
; [then-branch: 0 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | True]
; [eval] (let fn$$0 == (witness_4e2a3fe_F(i_V0)) in true)
; [eval] witness_4e2a3fe_F(i_V0)
(push) ; 5
(assert (witness_4e2a3fe_F%precondition $Snap.unit i_V0@6@00))
(pop) ; 5
; Joined path conditions
(assert (witness_4e2a3fe_F%precondition $Snap.unit i_V0@6@00))
(declare-fun letvar@7@00 (Int) ShStruct2<Ref~_Ref>)
(assert (= (letvar@7@00 i_V0@6@00) (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (and
  (witness_4e2a3fe_F%precondition $Snap.unit i_V0@6@00)
  (= (letvar@7@00 i_V0@6@00) (witness_4e2a3fe_F $Snap.unit i_V0@6@00))))
; [eval] (ShStructget0of2(witness_4e2a3fe_F(i_V0)): Ref)
; [eval] witness_4e2a3fe_F(i_V0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(pop) ; 2
(declare-fun inv@8@00 ($Ref) Int)
(declare-fun img@9@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i_V0@6@00 Int)) (!
  (and
    (witness_4e2a3fe_F%precondition $Snap.unit i_V0@6@00)
    (= (letvar@7@00 i_V0@6@00) (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
  :pattern ((ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
  :qid |Intint$$$$_E_$$$-aux|)))
; Check receiver injectivity
(assert (forall ((i_V01@6@00 Int) (i_V02@6@00 Int)) (!
  (and
    (witness_4e2a3fe_F%precondition $Snap.unit i_V01@6@00)
    (witness_4e2a3fe_F%precondition $Snap.unit i_V02@6@00))
  
  :qid |Intint$$$$_E_$$$-rcvrInj|)))
(push) ; 2
(assert (not (forall ((i_V01@6@00 Int) (i_V02@6@00 Int)) (!
  (=>
    (=
      (ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V01@6@00))
      (ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V02@6@00)))
    (= i_V01@6@00 i_V02@6@00))
  
  :qid |Intint$$$$_E_$$$-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i_V0@6@00 Int)) (!
  (and
    (witness_4e2a3fe_F%precondition $Snap.unit i_V0@6@00)
    (=>
      (=
        (inv@8@00 (ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
        i_V0@6@00)
      (witness_4e2a3fe_F%precondition $Snap.unit i_V0@6@00)))
  :pattern ((ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=> (img@9@00 r) (witness_4e2a3fe_F%precondition $Snap.unit (inv@8@00 r)))
  :pattern ((inv@8@00 r))
  :qid |Intint$$$$_E_$$$-fctOfInv|)))
(assert (forall ((i_V0@6@00 Int)) (!
  (and
    (=
      (inv@8@00 (ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
      i_V0@6@00)
    (img@9@00 (ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00))))
  :pattern ((ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (img@9@00 r)
    (= (ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit (inv@8@00 r))) r))
  :pattern ((inv@8@00 r))
  :qid |Intint$$$$_E_$$$-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i_V0@6@00 Int)) (!
  (not
    (= (ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00)) $Ref.null))
  :pattern ((ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
  :qid |Intint$$$$_E_$$$-permImpliesNonNull|)))
(declare-const i_V0@10@00 Int)
(push) ; 2
; [eval] true && (let fn$$0 == (witness_4e2a3fe_F(i_V0)) in true)
(push) ; 3
; [then-branch: 1 | False | live]
; [else-branch: 1 | True | live]
(push) ; 4
; [then-branch: 1 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | True]
; [eval] (let fn$$0 == (witness_4e2a3fe_F(i_V0)) in true)
; [eval] witness_4e2a3fe_F(i_V0)
(push) ; 5
(assert (witness_4e2a3fe_F%precondition $Snap.unit i_V0@10@00))
(pop) ; 5
; Joined path conditions
(assert (witness_4e2a3fe_F%precondition $Snap.unit i_V0@10@00))
(declare-fun letvar@11@00 (Int) ShStruct2<Ref~_Ref>)
(assert (= (letvar@11@00 i_V0@10@00) (witness_4e2a3fe_F $Snap.unit i_V0@10@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (and
  (witness_4e2a3fe_F%precondition $Snap.unit i_V0@10@00)
  (= (letvar@11@00 i_V0@10@00) (witness_4e2a3fe_F $Snap.unit i_V0@10@00))))
; [eval] (ShStructget1of2(witness_4e2a3fe_F(i_V0)): Ref)
; [eval] witness_4e2a3fe_F(i_V0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(pop) ; 2
(declare-fun inv@12@00 ($Ref) Int)
(declare-fun img@13@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i_V0@10@00 Int)) (!
  (and
    (witness_4e2a3fe_F%precondition $Snap.unit i_V0@10@00)
    (= (letvar@11@00 i_V0@10@00) (witness_4e2a3fe_F $Snap.unit i_V0@10@00)))
  :pattern ((ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00)))
  :qid |Intint$$$$_E_$$$-aux|)))
; Check receiver injectivity
(assert (forall ((i_V01@10@00 Int) (i_V02@10@00 Int)) (!
  (and
    (witness_4e2a3fe_F%precondition $Snap.unit i_V01@10@00)
    (witness_4e2a3fe_F%precondition $Snap.unit i_V02@10@00))
  
  :qid |Intint$$$$_E_$$$-rcvrInj|)))
(push) ; 2
(assert (not (forall ((i_V01@10@00 Int) (i_V02@10@00 Int)) (!
  (=>
    (=
      (ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V01@10@00))
      (ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V02@10@00)))
    (= i_V01@10@00 i_V02@10@00))
  
  :qid |Intint$$$$_E_$$$-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i_V0@10@00 Int)) (!
  (and
    (witness_4e2a3fe_F%precondition $Snap.unit i_V0@10@00)
    (=>
      (=
        (inv@12@00 (ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00)))
        i_V0@10@00)
      (witness_4e2a3fe_F%precondition $Snap.unit i_V0@10@00)))
  :pattern ((ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00)))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=> (img@13@00 r) (witness_4e2a3fe_F%precondition $Snap.unit (inv@12@00 r)))
  :pattern ((inv@12@00 r))
  :qid |Intint$$$$_E_$$$-fctOfInv|)))
(assert (forall ((i_V0@10@00 Int)) (!
  (and
    (=
      (inv@12@00 (ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00)))
      i_V0@10@00)
    (img@13@00 (ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00))))
  :pattern ((ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00)))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (img@13@00 r)
    (= (ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit (inv@12@00 r))) r))
  :pattern ((inv@12@00 r))
  :qid |Intint$$$$_E_$$$-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i_V0@10@00 Int)) (!
  (not
    (=
      (ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00))
      $Ref.null))
  :pattern ((ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00)))
  :qid |Intint$$$$_E_$$$-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (ShStructget1of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@10@00))
      (ShStructget0of2<Ref> (witness_4e2a3fe_F $Snap.unit i_V0@6@00)))
    (= (img@13@00 r) (img@9@00 r)))
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
