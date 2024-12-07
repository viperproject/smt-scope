(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:24
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0240.vpr
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
(declare-sort $FVF<data> 0)
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
(declare-fun $SortWrappers.$FVF<data>To$Snap ($FVF<data>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<data> ($Snap) $FVF<data>)
(assert (forall ((x $FVF<data>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<data>($SortWrappers.$FVF<data>To$Snap x)))
    :pattern (($SortWrappers.$FVF<data>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<data>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<data>To$Snap($SortWrappers.$SnapTo$FVF<data> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<data> x))
    :qid |$Snap.$FVF<data>To$SnapTo$FVF<data>|
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
; /field_value_functions_declarations.smt2 [data: Int]
(declare-fun $FVF.domain_data ($FVF<data>) Set<$Ref>)
(declare-fun $FVF.lookup_data ($FVF<data> $Ref) Int)
(declare-fun $FVF.after_data ($FVF<data> $FVF<data>) Bool)
(declare-fun $FVF.loc_data (Int $Ref) Bool)
(declare-fun $FVF.perm_data ($FPM $Ref) $Perm)
(declare-const $fvfTOP_data $FVF<data>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun foo ($Snap $Ref) Bool)
(declare-fun foo%limited ($Snap $Ref) Bool)
(declare-fun foo%stateless ($Ref) Bool)
(declare-fun foo%precondition ($Snap $Ref) Bool)
(declare-fun foo_qp ($Snap Set<$Ref>) Bool)
(declare-fun foo_qp%limited ($Snap Set<$Ref>) Bool)
(declare-fun foo_qp%stateless (Set<$Ref>) Bool)
(declare-fun foo_qp%precondition ($Snap Set<$Ref>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list%trigger ($Snap $Ref) Bool)
(declare-fun bla%trigger ($Snap $Ref) Bool)
(declare-fun blabla%trigger ($Snap $Ref) Bool)
(declare-fun bla_qp%trigger ($Snap Set<$Ref>) Bool)
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
; /field_value_functions_axioms.smt2 [data: Int]
(assert (forall ((vs $FVF<data>) (ws $FVF<data>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_data vs) ($FVF.domain_data ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_data vs))
            (= ($FVF.lookup_data vs x) ($FVF.lookup_data ws x)))
          :pattern (($FVF.lookup_data vs x) ($FVF.lookup_data ws x))
          :qid |qp.$FVF<data>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<data>To$Snap vs)
              ($SortWrappers.$FVF<data>To$Snap ws)
              )
    :qid |qp.$FVF<data>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_data pm r))
    :pattern (($FVF.perm_data pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_data f r) true)
    :pattern (($FVF.loc_data f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@5@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@6@00 ($Snap Set<$Ref> $Ref) Bool)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (foo%limited s@$ this@0@00) (foo s@$ this@0@00))
  :pattern ((foo s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (foo%stateless this@0@00)
  :pattern ((foo%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=> (foo%precondition s@$ this@0@00) (= (foo s@$ this@0@00) true))
  :pattern ((foo s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((foo s@$ this@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@2@00 Set<$Ref>)) (!
  (= (foo_qp%limited s@$ xs@2@00) (foo_qp s@$ xs@2@00))
  :pattern ((foo_qp s@$ xs@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@2@00 Set<$Ref>)) (!
  (foo_qp%stateless xs@2@00)
  :pattern ((foo_qp%limited s@$ xs@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@2@00 Set<$Ref>)) (!
  (and
    (forall ((x@4@00 $Ref)) (!
      (=>
        (Set_in x@4@00 xs@2@00)
        (and
          (= (inv@5@00 s@$ xs@2@00 x@4@00) x@4@00)
          (img@6@00 s@$ xs@2@00 x@4@00)))
      :pattern ((Set_in x@4@00 xs@2@00))
      :pattern ((inv@5@00 s@$ xs@2@00 x@4@00))
      :pattern ((img@6@00 s@$ xs@2@00 x@4@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and (img@6@00 s@$ xs@2@00 r) (Set_in (inv@5@00 s@$ xs@2@00 r) xs@2@00))
        (= (inv@5@00 s@$ xs@2@00 r) r))
      :pattern ((inv@5@00 s@$ xs@2@00 r))
      :qid |data-fctOfInv|))
    (=> (foo_qp%precondition s@$ xs@2@00) (= (foo_qp s@$ xs@2@00) true)))
  :pattern ((foo_qp s@$ xs@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@2@00 Set<$Ref>)) (!
  true
  :pattern ((foo_qp s@$ xs@2@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(list(this), 1 / 2)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= this@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@2@01) != Null | live]
; [else-branch: 0 | First:($t@2@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:($t@2@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@2@01))) $Snap.unit))
; [eval] (unfolding acc(list(this.next), write) in this.data <= this.next.data)
(set-option :timeout 0)
(push) ; 4
(assert (list%trigger ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(First:(Second:(Second:($t@2@01)))) != Null | live]
; [else-branch: 1 | First:(First:(Second:(Second:($t@2@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:(First:(Second:(Second:($t@2@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  $Snap.unit))
; [eval] (unfolding acc(list(this.next), write) in this.data <= this.next.data)
(set-option :timeout 0)
(push) ; 6
(assert (list%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(First:(Second:(Second:(First:(Second:(Second:($t@2@01))))))) != Null | live]
; [else-branch: 2 | First:(First:(Second:(Second:(First:(Second:(Second:($t@2@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 2 | First:(First:(Second:(Second:(First:(Second:(Second:($t@2@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
  $Snap.unit))
; [eval] (unfolding acc(list(this.next), write) in this.data <= this.next.data)
(declare-const recunf@3@01 Bool)
(assert (as recunf@3@01  Bool))
; [eval] this.data <= this.next.data
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 2 | First:(First:(Second:(Second:(First:(Second:(Second:($t@2@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
  $Snap.unit))
; [eval] this.data <= this.next.data
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@4@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@4@01  Bool)
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
    $Ref.null)
  (=
    (as joined_unfolding@4@01  Bool)
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
      $Snap.unit)
    (as recunf@3@01  Bool))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
      $Ref.null))))
(assert (as joined_unfolding@4@01  Bool))
; [eval] this.data <= this.next.data
(pop) ; 5
(push) ; 5
; [else-branch: 1 | First:(First:(Second:(Second:($t@2@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
  $Snap.unit))
; [eval] this.data <= this.next.data
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@5@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
      $Ref.null))
  (=
    (as joined_unfolding@5@01  Bool)
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@2@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null)
  (=
    (as joined_unfolding@5@01  Bool)
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@2@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@4@01  Bool)
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
        $Ref.null)
      (=
        (as joined_unfolding@4@01  Bool)
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))))
    (list%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
          $Snap.unit)
        (as recunf@3@01  Bool)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))))
          $Ref.null)))
    (as joined_unfolding@4@01  Bool))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
      $Ref.null))))
(assert (as joined_unfolding@5@01  Bool))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger $t@2@01 this@1@01))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | First:($t@2@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@2@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger $t@2@01 this@1@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const this@6@01 $Ref)
(declare-const this@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(bla(this), 1 / 2)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.second $t@8@01) $Snap.unit))
; [eval] foo(this)
(push) ; 3
(assert (foo%precondition ($Snap.first $t@8@01) this@7@01))
(pop) ; 3
; Joined path conditions
(assert (foo%precondition ($Snap.first $t@8@01) this@7@01))
(assert (foo ($Snap.first $t@8@01) this@7@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (bla%trigger $t@8@01 this@7@01))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const this@9@01 $Ref)
(declare-const this@10@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@11@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(bla(this), 1 / 2)
; [eval] foo(this)
(push) ; 3
(assert (foo%precondition $t@11@01 this@10@01))
(pop) ; 3
; Joined path conditions
(assert (foo%precondition $t@11@01 this@10@01))
(push) ; 3
(assert (not (foo $t@11@01 this@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (foo $t@11@01 this@10@01))
(assert (bla%trigger ($Snap.combine $t@11@01 $Snap.unit) this@10@01))
(pop) ; 2
(pop) ; 1
; ---------- test04a ----------
(declare-const this@12@01 $Ref)
(declare-const this@13@01 $Ref)
(push) ; 1
(declare-const $t@14@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(bla(this), 1 / 2) in true)
; [eval] (unfolding acc(bla(this), 1 / 2) in true)
(push) ; 3
(assert (bla%trigger $t@14@01 this@13@01))
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.second $t@14@01) $Snap.unit))
; [eval] foo(this)
(push) ; 4
(assert (foo%precondition ($Snap.first $t@14@01) this@13@01))
(pop) ; 4
; Joined path conditions
(assert (foo%precondition ($Snap.first $t@14@01) this@13@01))
(assert (foo ($Snap.first $t@14@01) this@13@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (bla%trigger $t@14@01 this@13@01)
  (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01)))
  (= ($Snap.second $t@14@01) $Snap.unit)
  (foo%precondition ($Snap.first $t@14@01) this@13@01)
  (foo ($Snap.first $t@14@01) this@13@01)))
(pop) ; 2
(pop) ; 1
; ---------- test04b ----------
(declare-const this@15@01 $Ref)
(declare-const this@16@01 $Ref)
(push) ; 1
(declare-const $t@17@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(bla(this), 1 / 2) in foo(this))
; [eval] (unfolding acc(bla(this), 1 / 2) in foo(this))
(push) ; 3
(assert (bla%trigger $t@17@01 this@16@01))
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] foo(this)
(push) ; 4
(assert (foo%precondition ($Snap.first $t@17@01) this@16@01))
(pop) ; 4
; Joined path conditions
(assert (foo%precondition ($Snap.first $t@17@01) this@16@01))
(assert (foo ($Snap.first $t@17@01) this@16@01))
; [eval] foo(this)
(push) ; 4
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(bla(this), 1 / 2) in foo(this))
(set-option :timeout 0)
(push) ; 3
(assert (bla%trigger $t@17@01 this@16@01))
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] foo(this)
(push) ; 4
(assert (foo%precondition ($Snap.first $t@17@01) this@16@01))
(pop) ; 4
; Joined path conditions
(assert (foo%precondition ($Snap.first $t@17@01) this@16@01))
(assert (foo ($Snap.first $t@17@01) this@16@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(this)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(bla(this), 1 / 2) in foo(this))
(set-option :timeout 0)
(push) ; 3
(assert (bla%trigger $t@17@01 this@16@01))
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] foo(this)
(push) ; 4
(assert (foo%precondition ($Snap.first $t@17@01) this@16@01))
(pop) ; 4
; Joined path conditions
(assert (foo%precondition ($Snap.first $t@17@01) this@16@01))
(assert (foo ($Snap.first $t@17@01) this@16@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(this)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(bla(this), 1 / 2) in foo(this))
(set-option :timeout 0)
(push) ; 3
(assert (bla%trigger $t@17@01 this@16@01))
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] foo(this)
(push) ; 4
(assert (foo%precondition ($Snap.first $t@17@01) this@16@01))
(pop) ; 4
; Joined path conditions
(assert (foo%precondition ($Snap.first $t@17@01) this@16@01))
(assert (foo ($Snap.first $t@17@01) this@16@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(this)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const this@18@01 $Ref)
(declare-const this@19@01 $Ref)
(push) ; 1
(declare-const $t@20@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(blabla(this), 1 / 3) in
;     (unfolding acc(bla(this), 1 / 5) in true))
; [eval] (unfolding acc(blabla(this), 1 / 3) in (unfolding acc(bla(this), 1 / 5) in true))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (blabla%trigger $t@20@01 this@19@01))
; [eval] (unfolding acc(bla(this), 1 / 5) in true)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (bla%trigger $t@20@01 this@19@01))
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (= ($Snap.second $t@20@01) $Snap.unit))
; [eval] foo(this)
(set-option :timeout 0)
(push) ; 5
(assert (foo%precondition ($Snap.first $t@20@01) this@19@01))
(pop) ; 5
; Joined path conditions
(assert (foo%precondition ($Snap.first $t@20@01) this@19@01))
(assert (foo ($Snap.first $t@20@01) this@19@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (bla%trigger $t@20@01 this@19@01)
  (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01)))
  (= ($Snap.second $t@20@01) $Snap.unit)
  (foo%precondition ($Snap.first $t@20@01) this@19@01)
  (foo ($Snap.first $t@20@01) this@19@01)))
(pop) ; 3
; Joined path conditions
(assert (and
  (blabla%trigger $t@20@01 this@19@01)
  (bla%trigger $t@20@01 this@19@01)
  (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01)))
  (= ($Snap.second $t@20@01) $Snap.unit)
  (foo%precondition ($Snap.first $t@20@01) this@19@01)
  (foo ($Snap.first $t@20@01) this@19@01)))
(pop) ; 2
(pop) ; 1
; ---------- test02_qp ----------
(declare-const xs@21@01 Set<$Ref>)
(declare-const xs@22@01 Set<$Ref>)
(push) ; 1
(declare-const $t@23@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(bla_qp(xs), 1 / 2)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(declare-const x@24@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@24@01 xs@22@01))
(pop) ; 3
(declare-fun inv@25@01 ($Ref) $Ref)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@24@01 $Ref) (x2@24@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@24@01 xs@22@01)
      (Set_in x2@24@01 xs@22@01)
      (= x1@24@01 x2@24@01))
    (= x1@24@01 x2@24@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@24@01 $Ref)) (!
  (=>
    (Set_in x@24@01 xs@22@01)
    (and (= (inv@25@01 x@24@01) x@24@01) (img@26@01 x@24@01)))
  :pattern ((Set_in x@24@01 xs@22@01))
  :pattern ((inv@25@01 x@24@01))
  :pattern ((img@26@01 x@24@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@26@01 r) (Set_in (inv@25@01 r) xs@22@01)) (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |data-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@24@01 $Ref)) (!
  (=> (Set_in x@24@01 xs@22@01) (not (= x@24@01 $Ref.null)))
  :pattern ((Set_in x@24@01 xs@22@01))
  :pattern ((inv@25@01 x@24@01))
  :pattern ((img@26@01 x@24@01))
  :qid |data-permImpliesNonNull|)))
(assert (= ($Snap.second $t@23@01) $Snap.unit))
; [eval] foo_qp(xs)
(push) ; 3
(declare-const x@27@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@27@01 xs@22@01))
(pop) ; 4
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@27@01 xs@22@01)
      (Set_in x2@27@01 xs@22@01)
      (= x1@27@01 x2@27@01))
    (= x1@27@01 x2@27@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Set_in x@27@01 xs@22@01)
    (and (= (inv@28@01 x@27@01) x@27@01) (img@29@01 x@27@01)))
  :pattern ((Set_in x@27@01 xs@22@01))
  :pattern ((inv@28@01 x@27@01))
  :pattern ((img@29@01 x@27@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@29@01 r) (Set_in (inv@28@01 r) xs@22@01)) (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@28@01 r) xs@22@01) (img@29@01 r) (= r (inv@28@01 r)))
    ($Perm.min
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@22@01))
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
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@22@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@30@01 r))
    $Perm.No)
  
  :qid |quant-u-20|))))
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
    (and (Set_in (inv@28@01 r) xs@22@01) (img@29@01 r) (= r (inv@28@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@30@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@31@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@31@01  $FVF<data>)))
      (and (Set_in (inv@28@01 r) xs@22@01) (img@29@01 r)))
    (=>
      (and (Set_in (inv@28@01 r) xs@22@01) (img@29@01 r))
      (Set_in r ($FVF.domain_data (as sm@31@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@31@01  $FVF<data>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@28@01 r) xs@22@01) (img@29@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@22@01)))
    (=
      ($FVF.lookup_data (as sm@31@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@23@01)) r)))
  :pattern (($FVF.lookup_data (as sm@31@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@23@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@31@01  $FVF<data>)) xs@22@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Set_in x@27@01 xs@22@01)
    (and (= (inv@28@01 x@27@01) x@27@01) (img@29@01 x@27@01)))
  :pattern ((Set_in x@27@01 xs@22@01))
  :pattern ((inv@28@01 x@27@01))
  :pattern ((img@29@01 x@27@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@29@01 r) (Set_in (inv@28@01 r) xs@22@01)) (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@31@01  $FVF<data>)))
      (and (Set_in (inv@28@01 r) xs@22@01) (img@29@01 r)))
    (=>
      (and (Set_in (inv@28@01 r) xs@22@01) (img@29@01 r))
      (Set_in r ($FVF.domain_data (as sm@31@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@31@01  $FVF<data>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@28@01 r) xs@22@01) (img@29@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@22@01)))
    (=
      ($FVF.lookup_data (as sm@31@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@23@01)) r)))
  :pattern (($FVF.lookup_data (as sm@31@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@23@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@31@01  $FVF<data>)) xs@22@01))
(assert (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@31@01  $FVF<data>)) xs@22@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (bla_qp%trigger $t@23@01 xs@22@01))
(pop) ; 2
(pop) ; 1
; ---------- test03_qp ----------
(declare-const xs@32@01 Set<$Ref>)
(declare-const xs@33@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const x@34@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@34@01 xs@33@01))
(pop) ; 2
(declare-const $t@35@01 $FVF<data>)
(declare-fun inv@36@01 ($Ref) $Ref)
(declare-fun img@37@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@34@01 $Ref) (x2@34@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@34@01 xs@33@01)
      (Set_in x2@34@01 xs@33@01)
      (= x1@34@01 x2@34@01))
    (= x1@34@01 x2@34@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@34@01 $Ref)) (!
  (=>
    (Set_in x@34@01 xs@33@01)
    (and (= (inv@36@01 x@34@01) x@34@01) (img@37@01 x@34@01)))
  :pattern ((Set_in x@34@01 xs@33@01))
  :pattern ((inv@36@01 x@34@01))
  :pattern ((img@37@01 x@34@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@37@01 r) (Set_in (inv@36@01 r) xs@33@01)) (= (inv@36@01 r) r))
  :pattern ((inv@36@01 r))
  :qid |data-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@34@01 $Ref)) (!
  (=> (Set_in x@34@01 xs@33@01) (not (= x@34@01 $Ref.null)))
  :pattern ((Set_in x@34@01 xs@33@01))
  :pattern ((inv@36@01 x@34@01))
  :pattern ((img@37@01 x@34@01))
  :qid |data-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(bla_qp(xs), 1 / 2)
(declare-const x@38@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@38@01 xs@33@01))
(pop) ; 3
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@38@01 $Ref) (x2@38@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@38@01 xs@33@01)
      (Set_in x2@38@01 xs@33@01)
      (= x1@38@01 x2@38@01))
    (= x1@38@01 x2@38@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@38@01 $Ref)) (!
  (=>
    (Set_in x@38@01 xs@33@01)
    (and (= (inv@39@01 x@38@01) x@38@01) (img@40@01 x@38@01)))
  :pattern ((Set_in x@38@01 xs@33@01))
  :pattern ((inv@39@01 x@38@01))
  :pattern ((img@40@01 x@38@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@40@01 r) (Set_in (inv@39@01 r) xs@33@01)) (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@39@01 r) xs@33@01) (img@40@01 r) (= r (inv@39@01 r)))
    ($Perm.min
      (ite
        (and (img@37@01 r) (Set_in (inv@36@01 r) xs@33@01))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@37@01 r) (Set_in (inv@36@01 r) xs@33@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@41@01 r))
    $Perm.No)
  
  :qid |quant-u-26|))))
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
    (and (Set_in (inv@39@01 r) xs@33@01) (img@40@01 r) (= r (inv@39@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@42@01  $FVF<data>)))
      (and (Set_in (inv@39@01 r) xs@33@01) (img@40@01 r)))
    (=>
      (and (Set_in (inv@39@01 r) xs@33@01) (img@40@01 r))
      (Set_in r ($FVF.domain_data (as sm@42@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@42@01  $FVF<data>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@39@01 r) xs@33@01) (img@40@01 r))
      (and (img@37@01 r) (Set_in (inv@36@01 r) xs@33@01)))
    (=
      ($FVF.lookup_data (as sm@42@01  $FVF<data>) r)
      ($FVF.lookup_data $t@35@01 r)))
  :pattern (($FVF.lookup_data (as sm@42@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data $t@35@01 r))
  :qid |qp.fvfValDef2|)))
; [eval] foo_qp(xs)
(set-option :timeout 0)
(push) ; 3
(declare-const x@43@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@43@01 xs@33@01))
(pop) ; 4
(declare-fun inv@44@01 ($Ref) $Ref)
(declare-fun img@45@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@43@01 $Ref) (x2@43@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@43@01 xs@33@01)
      (Set_in x2@43@01 xs@33@01)
      (= x1@43@01 x2@43@01))
    (= x1@43@01 x2@43@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@43@01 $Ref)) (!
  (=>
    (Set_in x@43@01 xs@33@01)
    (and (= (inv@44@01 x@43@01) x@43@01) (img@45@01 x@43@01)))
  :pattern ((Set_in x@43@01 xs@33@01))
  :pattern ((inv@44@01 x@43@01))
  :pattern ((img@45@01 x@43@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@45@01 r) (Set_in (inv@44@01 r) xs@33@01)) (= (inv@44@01 r) r))
  :pattern ((inv@44@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@44@01 r) xs@33@01) (img@45@01 r) (= r (inv@44@01 r)))
    ($Perm.min
      (ite
        (and (img@37@01 r) (Set_in (inv@36@01 r) xs@33@01))
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
        (and (img@37@01 r) (Set_in (inv@36@01 r) xs@33@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@46@01 r))
    $Perm.No)
  
  :qid |quant-u-30|))))
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
    (and (Set_in (inv@44@01 r) xs@33@01) (img@45@01 r) (= r (inv@44@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@47@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@47@01  $FVF<data>)))
      (and (Set_in (inv@44@01 r) xs@33@01) (img@45@01 r)))
    (=>
      (and (Set_in (inv@44@01 r) xs@33@01) (img@45@01 r))
      (Set_in r ($FVF.domain_data (as sm@47@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@47@01  $FVF<data>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@44@01 r) xs@33@01) (img@45@01 r))
      (and (img@37@01 r) (Set_in (inv@36@01 r) xs@33@01)))
    (=
      ($FVF.lookup_data (as sm@47@01  $FVF<data>) r)
      ($FVF.lookup_data $t@35@01 r)))
  :pattern (($FVF.lookup_data (as sm@47@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data $t@35@01 r))
  :qid |qp.fvfValDef4|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@47@01  $FVF<data>)) xs@33@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((x@43@01 $Ref)) (!
  (=>
    (Set_in x@43@01 xs@33@01)
    (and (= (inv@44@01 x@43@01) x@43@01) (img@45@01 x@43@01)))
  :pattern ((Set_in x@43@01 xs@33@01))
  :pattern ((inv@44@01 x@43@01))
  :pattern ((img@45@01 x@43@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@45@01 r) (Set_in (inv@44@01 r) xs@33@01)) (= (inv@44@01 r) r))
  :pattern ((inv@44@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@47@01  $FVF<data>)))
      (and (Set_in (inv@44@01 r) xs@33@01) (img@45@01 r)))
    (=>
      (and (Set_in (inv@44@01 r) xs@33@01) (img@45@01 r))
      (Set_in r ($FVF.domain_data (as sm@47@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@47@01  $FVF<data>))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@44@01 r) xs@33@01) (img@45@01 r))
      (and (img@37@01 r) (Set_in (inv@36@01 r) xs@33@01)))
    (=
      ($FVF.lookup_data (as sm@47@01  $FVF<data>) r)
      ($FVF.lookup_data $t@35@01 r)))
  :pattern (($FVF.lookup_data (as sm@47@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data $t@35@01 r))
  :qid |qp.fvfValDef4|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@47@01  $FVF<data>)) xs@33@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@47@01  $FVF<data>)) xs@33@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@47@01  $FVF<data>)) xs@33@01))
(assert (bla_qp%trigger ($Snap.combine
  ($SortWrappers.$FVF<data>To$Snap (as sm@42@01  $FVF<data>))
  $Snap.unit) xs@33@01))
(pop) ; 2
(pop) ; 1
; ---------- test04a_qp ----------
(declare-const xs@48@01 Set<$Ref>)
(declare-const xs@49@01 Set<$Ref>)
(push) ; 1
(declare-const $t@50@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(bla_qp(xs), 1 / 2) in true)
; [eval] (unfolding acc(bla_qp(xs), 1 / 2) in true)
(push) ; 3
(assert (bla_qp%trigger $t@50@01 xs@49@01))
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(declare-const x@51@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@51@01 xs@49@01))
(pop) ; 4
(declare-fun inv@52@01 ($Ref) $Ref)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@51@01 $Ref) (x2@51@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@51@01 xs@49@01)
      (Set_in x2@51@01 xs@49@01)
      (= x1@51@01 x2@51@01))
    (= x1@51@01 x2@51@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@51@01 $Ref)) (!
  (=>
    (Set_in x@51@01 xs@49@01)
    (and (= (inv@52@01 x@51@01) x@51@01) (img@53@01 x@51@01)))
  :pattern ((Set_in x@51@01 xs@49@01))
  :pattern ((inv@52@01 x@51@01))
  :pattern ((img@53@01 x@51@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@53@01 r) (Set_in (inv@52@01 r) xs@49@01)) (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |data-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@51@01 $Ref)) (!
  (=> (Set_in x@51@01 xs@49@01) (not (= x@51@01 $Ref.null)))
  :pattern ((Set_in x@51@01 xs@49@01))
  :pattern ((inv@52@01 x@51@01))
  :pattern ((img@53@01 x@51@01))
  :qid |data-permImpliesNonNull|)))
(assert (= ($Snap.second $t@50@01) $Snap.unit))
; [eval] foo_qp(xs)
(push) ; 4
(declare-const x@54@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@54@01 xs@49@01))
(pop) ; 5
(declare-fun inv@55@01 ($Ref) $Ref)
(declare-fun img@56@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@54@01 $Ref) (x2@54@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@54@01 xs@49@01)
      (Set_in x2@54@01 xs@49@01)
      (= x1@54@01 x2@54@01))
    (= x1@54@01 x2@54@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@54@01 $Ref)) (!
  (=>
    (Set_in x@54@01 xs@49@01)
    (and (= (inv@55@01 x@54@01) x@54@01) (img@56@01 x@54@01)))
  :pattern ((Set_in x@54@01 xs@49@01))
  :pattern ((inv@55@01 x@54@01))
  :pattern ((img@56@01 x@54@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@56@01 r) (Set_in (inv@55@01 r) xs@49@01)) (= (inv@55@01 r) r))
  :pattern ((inv@55@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@57@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r) (= r (inv@55@01 r)))
    ($Perm.min
      (ite
        (and (img@53@01 r) (Set_in (inv@52@01 r) xs@49@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@53@01 r) (Set_in (inv@52@01 r) xs@49@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@57@01 r))
    $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r) (= r (inv@55@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@57@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@58@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>)))
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r)))
    (=>
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r))
      (Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>))))
  :qid |qp.fvfDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r))
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@49@01)))
    (=
      ($FVF.lookup_data (as sm@58@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@50@01)) r)))
  :pattern (($FVF.lookup_data (as sm@58@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@50@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@58@01  $FVF<data>)) xs@49@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@54@01 $Ref)) (!
  (=>
    (Set_in x@54@01 xs@49@01)
    (and (= (inv@55@01 x@54@01) x@54@01) (img@56@01 x@54@01)))
  :pattern ((Set_in x@54@01 xs@49@01))
  :pattern ((inv@55@01 x@54@01))
  :pattern ((img@56@01 x@54@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@56@01 r) (Set_in (inv@55@01 r) xs@49@01)) (= (inv@55@01 r) r))
  :pattern ((inv@55@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>)))
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r)))
    (=>
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r))
      (Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r))
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@49@01)))
    (=
      ($FVF.lookup_data (as sm@58@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@50@01)) r)))
  :pattern (($FVF.lookup_data (as sm@58@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@50@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@58@01  $FVF<data>)) xs@49@01))
(assert (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@58@01  $FVF<data>)) xs@49@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=> (and (img@53@01 r) (Set_in (inv@52@01 r) xs@49@01)) (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((x@54@01 $Ref)) (!
  (=>
    (Set_in x@54@01 xs@49@01)
    (and (= (inv@55@01 x@54@01) x@54@01) (img@56@01 x@54@01)))
  :pattern ((Set_in x@54@01 xs@49@01))
  :pattern ((inv@55@01 x@54@01))
  :pattern ((img@56@01 x@54@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@56@01 r) (Set_in (inv@55@01 r) xs@49@01)) (= (inv@55@01 r) r))
  :pattern ((inv@55@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>)))
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r)))
    (=>
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r))
      (Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@58@01  $FVF<data>))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@55@01 r) xs@49@01) (img@56@01 r))
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@49@01)))
    (=
      ($FVF.lookup_data (as sm@58@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@50@01)) r)))
  :pattern (($FVF.lookup_data (as sm@58@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@50@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (and
  (bla_qp%trigger $t@50@01 xs@49@01)
  (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01)))))
(assert (and
  (forall ((x@51@01 $Ref)) (!
    (=>
      (Set_in x@51@01 xs@49@01)
      (and (= (inv@52@01 x@51@01) x@51@01) (img@53@01 x@51@01)))
    :pattern ((Set_in x@51@01 xs@49@01))
    :pattern ((inv@52@01 x@51@01))
    :pattern ((img@53@01 x@51@01))
    :qid |quant-u-33|))
  (forall ((x@51@01 $Ref)) (!
    (=> (Set_in x@51@01 xs@49@01) (not (= x@51@01 $Ref.null)))
    :pattern ((Set_in x@51@01 xs@49@01))
    :pattern ((inv@52@01 x@51@01))
    :pattern ((img@53@01 x@51@01))
    :qid |data-permImpliesNonNull|))
  (= ($Snap.second $t@50@01) $Snap.unit)
  (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@58@01  $FVF<data>)) xs@49@01)
  (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@58@01  $FVF<data>)) xs@49@01)))
(pop) ; 2
(pop) ; 1
; ---------- test04b_qp ----------
(declare-const xs@59@01 Set<$Ref>)
(declare-const xs@60@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@61@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(bla_qp(xs), 1 / 2) in foo_qp(xs))
; [eval] (unfolding acc(bla_qp(xs), 1 / 2) in foo_qp(xs))
(push) ; 3
(assert (bla_qp%trigger $t@61@01 xs@60@01))
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(declare-const x@62@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@62@01 xs@60@01))
(pop) ; 4
(declare-fun inv@63@01 ($Ref) $Ref)
(declare-fun img@64@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@62@01 $Ref) (x2@62@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@62@01 xs@60@01)
      (Set_in x2@62@01 xs@60@01)
      (= x1@62@01 x2@62@01))
    (= x1@62@01 x2@62@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@62@01 $Ref)) (!
  (=>
    (Set_in x@62@01 xs@60@01)
    (and (= (inv@63@01 x@62@01) x@62@01) (img@64@01 x@62@01)))
  :pattern ((Set_in x@62@01 xs@60@01))
  :pattern ((inv@63@01 x@62@01))
  :pattern ((img@64@01 x@62@01))
  :qid |quant-u-39|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |data-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@62@01 $Ref)) (!
  (=> (Set_in x@62@01 xs@60@01) (not (= x@62@01 $Ref.null)))
  :pattern ((Set_in x@62@01 xs@60@01))
  :pattern ((inv@63@01 x@62@01))
  :pattern ((img@64@01 x@62@01))
  :qid |data-permImpliesNonNull|)))
(assert (= ($Snap.second $t@61@01) $Snap.unit))
; [eval] foo_qp(xs)
(push) ; 4
(declare-const x@65@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@65@01 xs@60@01))
(pop) ; 5
(declare-fun inv@66@01 ($Ref) $Ref)
(declare-fun img@67@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@65@01 $Ref) (x2@65@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@65@01 xs@60@01)
      (Set_in x2@65@01 xs@60@01)
      (= x1@65@01 x2@65@01))
    (= x1@65@01 x2@65@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@65@01 $Ref)) (!
  (=>
    (Set_in x@65@01 xs@60@01)
    (and (= (inv@66@01 x@65@01) x@65@01) (img@67@01 x@65@01)))
  :pattern ((Set_in x@65@01 xs@60@01))
  :pattern ((inv@66@01 x@65@01))
  :pattern ((img@67@01 x@65@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@67@01 r) (Set_in (inv@66@01 r) xs@60@01)) (= (inv@66@01 r) r))
  :pattern ((inv@66@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@66@01 r) xs@60@01) (img@67@01 r) (= r (inv@66@01 r)))
    ($Perm.min
      (ite
        (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@68@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@66@01 r) xs@60@01) (img@67@01 r) (= r (inv@66@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@69@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@69@01  $FVF<data>)))
      (and (Set_in (inv@66@01 r) xs@60@01) (img@67@01 r)))
    (=>
      (and (Set_in (inv@66@01 r) xs@60@01) (img@67@01 r))
      (Set_in r ($FVF.domain_data (as sm@69@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@69@01  $FVF<data>))))
  :qid |qp.fvfDomDef9|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@66@01 r) xs@60@01) (img@67@01 r))
      (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01)))
    (=
      ($FVF.lookup_data (as sm@69@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@69@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef8|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@69@01  $FVF<data>)) xs@60@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@65@01 $Ref)) (!
  (=>
    (Set_in x@65@01 xs@60@01)
    (and (= (inv@66@01 x@65@01) x@65@01) (img@67@01 x@65@01)))
  :pattern ((Set_in x@65@01 xs@60@01))
  :pattern ((inv@66@01 x@65@01))
  :pattern ((img@67@01 x@65@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@67@01 r) (Set_in (inv@66@01 r) xs@60@01)) (= (inv@66@01 r) r))
  :pattern ((inv@66@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@69@01  $FVF<data>)))
      (and (Set_in (inv@66@01 r) xs@60@01) (img@67@01 r)))
    (=>
      (and (Set_in (inv@66@01 r) xs@60@01) (img@67@01 r))
      (Set_in r ($FVF.domain_data (as sm@69@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@69@01  $FVF<data>))))
  :qid |qp.fvfDomDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@66@01 r) xs@60@01) (img@67@01 r))
      (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01)))
    (=
      ($FVF.lookup_data (as sm@69@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@69@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef8|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@69@01  $FVF<data>)) xs@60@01))
(assert (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@69@01  $FVF<data>)) xs@60@01))
; [eval] foo_qp(xs)
(set-option :timeout 0)
(push) ; 4
(declare-const x@70@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@70@01 xs@60@01))
(pop) ; 5
(declare-fun inv@71@01 ($Ref) $Ref)
(declare-fun img@72@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@70@01 $Ref) (x2@70@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@70@01 xs@60@01)
      (Set_in x2@70@01 xs@60@01)
      (= x1@70@01 x2@70@01))
    (= x1@70@01 x2@70@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@70@01 $Ref)) (!
  (=>
    (Set_in x@70@01 xs@60@01)
    (and (= (inv@71@01 x@70@01) x@70@01) (img@72@01 x@70@01)))
  :pattern ((Set_in x@70@01 xs@60@01))
  :pattern ((inv@71@01 x@70@01))
  :pattern ((img@72@01 x@70@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@72@01 r) (Set_in (inv@71@01 r) xs@60@01)) (= (inv@71@01 r) r))
  :pattern ((inv@71@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@73@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@71@01 r) xs@60@01) (img@72@01 r) (= r (inv@71@01 r)))
    ($Perm.min
      (ite
        (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@73@01 r))
    $Perm.No)
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@71@01 r) xs@60@01) (img@72@01 r) (= r (inv@71@01 r)))
    (= (- $Perm.Write (pTaken@73@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 5
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@71@01 r) xs@60@01) (img@72@01 r) (= r (inv@71@01 r)))
    (= (- $Perm.Write (pTaken@73@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@74@01 $FVF<data>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01))
    (=
      ($FVF.lookup_data (as sm@74@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@74@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@75@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_data (as pm@75@01  $FPM) r)
    (ite
      (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No))
  :pattern (($FVF.perm_data (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
; Assume upper permission bound for field data
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_data (as pm@75@01  $FPM) r) $Perm.Write)
  :pattern ((inv@63@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const x@76@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@76@01 xs@60@01))
(pop) ; 5
(declare-fun inv@77@01 ($Ref) $Ref)
(declare-fun img@78@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@76@01 $Ref) (x2@76@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@76@01 xs@60@01)
      (Set_in x2@76@01 xs@60@01)
      (= x1@76@01 x2@76@01))
    (= x1@76@01 x2@76@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@76@01 $Ref)) (!
  (=>
    (Set_in x@76@01 xs@60@01)
    (and (= (inv@77@01 x@76@01) x@76@01) (img@78@01 x@76@01)))
  :pattern ((Set_in x@76@01 xs@60@01))
  :pattern ((inv@77@01 x@76@01))
  :pattern ((img@78@01 x@76@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@78@01 r) (Set_in (inv@77@01 r) xs@60@01)) (= (inv@77@01 r) r))
  :pattern ((inv@77@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@77@01 r) xs@60@01) (img@78@01 r) (= r (inv@77@01 r)))
    ($Perm.min
      (ite
        (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@64@01 r) (Set_in (inv@63@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@79@01 r))
    $Perm.No)
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@77@01 r) xs@60@01) (img@78@01 r) (= r (inv@77@01 r)))
    (= (- $Perm.Write (pTaken@79@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 5
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@77@01 r) xs@60@01) (img@78@01 r) (= r (inv@77@01 r)))
    (= (- $Perm.Write (pTaken@79@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(bla_qp(xs), 1 / 2) in foo_qp(xs))
(set-option :timeout 0)
(push) ; 3
(assert (bla_qp%trigger $t@61@01 xs@60@01))
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(declare-const x@80@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@80@01 xs@60@01))
(pop) ; 4
(declare-fun inv@81@01 ($Ref) $Ref)
(declare-fun img@82@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@80@01 $Ref) (x2@80@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@80@01 xs@60@01)
      (Set_in x2@80@01 xs@60@01)
      (= x1@80@01 x2@80@01))
    (= x1@80@01 x2@80@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@80@01 $Ref)) (!
  (=>
    (Set_in x@80@01 xs@60@01)
    (and (= (inv@81@01 x@80@01) x@80@01) (img@82@01 x@80@01)))
  :pattern ((Set_in x@80@01 xs@60@01))
  :pattern ((inv@81@01 x@80@01))
  :pattern ((img@82@01 x@80@01))
  :qid |quant-u-53|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01)) (= (inv@81@01 r) r))
  :pattern ((inv@81@01 r))
  :qid |data-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@80@01 $Ref)) (!
  (=> (Set_in x@80@01 xs@60@01) (not (= x@80@01 $Ref.null)))
  :pattern ((Set_in x@80@01 xs@60@01))
  :pattern ((inv@81@01 x@80@01))
  :pattern ((img@82@01 x@80@01))
  :qid |data-permImpliesNonNull|)))
(assert (= ($Snap.second $t@61@01) $Snap.unit))
; [eval] foo_qp(xs)
(push) ; 4
(declare-const x@83@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@83@01 xs@60@01))
(pop) ; 5
(declare-fun inv@84@01 ($Ref) $Ref)
(declare-fun img@85@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@83@01 $Ref) (x2@83@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@83@01 xs@60@01)
      (Set_in x2@83@01 xs@60@01)
      (= x1@83@01 x2@83@01))
    (= x1@83@01 x2@83@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@83@01 $Ref)) (!
  (=>
    (Set_in x@83@01 xs@60@01)
    (and (= (inv@84@01 x@83@01) x@83@01) (img@85@01 x@83@01)))
  :pattern ((Set_in x@83@01 xs@60@01))
  :pattern ((inv@84@01 x@83@01))
  :pattern ((img@85@01 x@83@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@85@01 r) (Set_in (inv@84@01 r) xs@60@01)) (= (inv@84@01 r) r))
  :pattern ((inv@84@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@86@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@84@01 r) xs@60@01) (img@85@01 r) (= r (inv@84@01 r)))
    ($Perm.min
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@86@01 r))
    $Perm.No)
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@84@01 r) xs@60@01) (img@85@01 r) (= r (inv@84@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@86@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@87@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@87@01  $FVF<data>)))
      (and (Set_in (inv@84@01 r) xs@60@01) (img@85@01 r)))
    (=>
      (and (Set_in (inv@84@01 r) xs@60@01) (img@85@01 r))
      (Set_in r ($FVF.domain_data (as sm@87@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@87@01  $FVF<data>))))
  :qid |qp.fvfDomDef13|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@84@01 r) xs@60@01) (img@85@01 r))
      (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01)))
    (=
      ($FVF.lookup_data (as sm@87@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@87@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@87@01  $FVF<data>)) xs@60@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@83@01 $Ref)) (!
  (=>
    (Set_in x@83@01 xs@60@01)
    (and (= (inv@84@01 x@83@01) x@83@01) (img@85@01 x@83@01)))
  :pattern ((Set_in x@83@01 xs@60@01))
  :pattern ((inv@84@01 x@83@01))
  :pattern ((img@85@01 x@83@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@85@01 r) (Set_in (inv@84@01 r) xs@60@01)) (= (inv@84@01 r) r))
  :pattern ((inv@84@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@87@01  $FVF<data>)))
      (and (Set_in (inv@84@01 r) xs@60@01) (img@85@01 r)))
    (=>
      (and (Set_in (inv@84@01 r) xs@60@01) (img@85@01 r))
      (Set_in r ($FVF.domain_data (as sm@87@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@87@01  $FVF<data>))))
  :qid |qp.fvfDomDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@84@01 r) xs@60@01) (img@85@01 r))
      (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01)))
    (=
      ($FVF.lookup_data (as sm@87@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@87@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@87@01  $FVF<data>)) xs@60@01))
(assert (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@87@01  $FVF<data>)) xs@60@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@88@01 $FVF<data>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01))
    (=
      ($FVF.lookup_data (as sm@88@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@88@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef14|)))
(declare-const pm@89@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_data (as pm@89@01  $FPM) r)
    (ite
      (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No))
  :pattern (($FVF.perm_data (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
; Assume upper permission bound for field data
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_data (as pm@89@01  $FPM) r) $Perm.Write)
  :pattern ((inv@81@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] foo_qp(xs)
(set-option :timeout 0)
(push) ; 4
(declare-const x@90@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@90@01 xs@60@01))
(pop) ; 5
(declare-fun inv@91@01 ($Ref) $Ref)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@90@01 $Ref) (x2@90@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@90@01 xs@60@01)
      (Set_in x2@90@01 xs@60@01)
      (= x1@90@01 x2@90@01))
    (= x1@90@01 x2@90@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@90@01 $Ref)) (!
  (=>
    (Set_in x@90@01 xs@60@01)
    (and (= (inv@91@01 x@90@01) x@90@01) (img@92@01 x@90@01)))
  :pattern ((Set_in x@90@01 xs@60@01))
  :pattern ((inv@91@01 x@90@01))
  :pattern ((img@92@01 x@90@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@92@01 r) (Set_in (inv@91@01 r) xs@60@01)) (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@91@01 r) xs@60@01) (img@92@01 r) (= r (inv@91@01 r)))
    ($Perm.min
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@93@01 r))
    $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@91@01 r) xs@60@01) (img@92@01 r) (= r (inv@91@01 r)))
    (= (- $Perm.Write (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 5
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@91@01 r) xs@60@01) (img@92@01 r) (= r (inv@91@01 r)))
    (= (- $Perm.Write (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field data
(declare-const x@94@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@94@01 xs@60@01))
(pop) ; 5
(declare-fun inv@95@01 ($Ref) $Ref)
(declare-fun img@96@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@94@01 $Ref) (x2@94@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@94@01 xs@60@01)
      (Set_in x2@94@01 xs@60@01)
      (= x1@94@01 x2@94@01))
    (= x1@94@01 x2@94@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@94@01 $Ref)) (!
  (=>
    (Set_in x@94@01 xs@60@01)
    (and (= (inv@95@01 x@94@01) x@94@01) (img@96@01 x@94@01)))
  :pattern ((Set_in x@94@01 xs@60@01))
  :pattern ((inv@95@01 x@94@01))
  :pattern ((img@96@01 x@94@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@96@01 r) (Set_in (inv@95@01 r) xs@60@01)) (= (inv@95@01 r) r))
  :pattern ((inv@95@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@97@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@95@01 r) xs@60@01) (img@96@01 r) (= r (inv@95@01 r)))
    ($Perm.min
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@97@01 r))
    $Perm.No)
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@95@01 r) xs@60@01) (img@96@01 r) (= r (inv@95@01 r)))
    (= (- $Perm.Write (pTaken@97@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 5
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@95@01 r) xs@60@01) (img@96@01 r) (= r (inv@95@01 r)))
    (= (- $Perm.Write (pTaken@97@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(bla_qp(xs), 1 / 2) in foo_qp(xs))
(set-option :timeout 0)
(push) ; 3
(assert (bla_qp%trigger $t@61@01 xs@60@01))
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(declare-const x@98@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@98@01 xs@60@01))
(pop) ; 4
(declare-fun inv@99@01 ($Ref) $Ref)
(declare-fun img@100@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@98@01 $Ref) (x2@98@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@98@01 xs@60@01)
      (Set_in x2@98@01 xs@60@01)
      (= x1@98@01 x2@98@01))
    (= x1@98@01 x2@98@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@98@01 $Ref)) (!
  (=>
    (Set_in x@98@01 xs@60@01)
    (and (= (inv@99@01 x@98@01) x@98@01) (img@100@01 x@98@01)))
  :pattern ((Set_in x@98@01 xs@60@01))
  :pattern ((inv@99@01 x@98@01))
  :pattern ((img@100@01 x@98@01))
  :qid |quant-u-67|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01)) (= (inv@99@01 r) r))
  :pattern ((inv@99@01 r))
  :qid |data-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@98@01 $Ref)) (!
  (=> (Set_in x@98@01 xs@60@01) (not (= x@98@01 $Ref.null)))
  :pattern ((Set_in x@98@01 xs@60@01))
  :pattern ((inv@99@01 x@98@01))
  :pattern ((img@100@01 x@98@01))
  :qid |data-permImpliesNonNull|)))
(assert (= ($Snap.second $t@61@01) $Snap.unit))
; [eval] foo_qp(xs)
(push) ; 4
(declare-const x@101@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@101@01 xs@60@01))
(pop) ; 5
(declare-fun inv@102@01 ($Ref) $Ref)
(declare-fun img@103@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@101@01 $Ref) (x2@101@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@101@01 xs@60@01)
      (Set_in x2@101@01 xs@60@01)
      (= x1@101@01 x2@101@01))
    (= x1@101@01 x2@101@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@101@01 $Ref)) (!
  (=>
    (Set_in x@101@01 xs@60@01)
    (and (= (inv@102@01 x@101@01) x@101@01) (img@103@01 x@101@01)))
  :pattern ((Set_in x@101@01 xs@60@01))
  :pattern ((inv@102@01 x@101@01))
  :pattern ((img@103@01 x@101@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@103@01 r) (Set_in (inv@102@01 r) xs@60@01)) (= (inv@102@01 r) r))
  :pattern ((inv@102@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@102@01 r) xs@60@01) (img@103@01 r) (= r (inv@102@01 r)))
    ($Perm.min
      (ite
        (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@104@01 r))
    $Perm.No)
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@102@01 r) xs@60@01) (img@103@01 r) (= r (inv@102@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@104@01 r)) $Perm.No))
  
  :qid |quant-u-71|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@105@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@105@01  $FVF<data>)))
      (and (Set_in (inv@102@01 r) xs@60@01) (img@103@01 r)))
    (=>
      (and (Set_in (inv@102@01 r) xs@60@01) (img@103@01 r))
      (Set_in r ($FVF.domain_data (as sm@105@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@105@01  $FVF<data>))))
  :qid |qp.fvfDomDef17|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@102@01 r) xs@60@01) (img@103@01 r))
      (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01)))
    (=
      ($FVF.lookup_data (as sm@105@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@105@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef16|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@105@01  $FVF<data>)) xs@60@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@101@01 $Ref)) (!
  (=>
    (Set_in x@101@01 xs@60@01)
    (and (= (inv@102@01 x@101@01) x@101@01) (img@103@01 x@101@01)))
  :pattern ((Set_in x@101@01 xs@60@01))
  :pattern ((inv@102@01 x@101@01))
  :pattern ((img@103@01 x@101@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@103@01 r) (Set_in (inv@102@01 r) xs@60@01)) (= (inv@102@01 r) r))
  :pattern ((inv@102@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@105@01  $FVF<data>)))
      (and (Set_in (inv@102@01 r) xs@60@01) (img@103@01 r)))
    (=>
      (and (Set_in (inv@102@01 r) xs@60@01) (img@103@01 r))
      (Set_in r ($FVF.domain_data (as sm@105@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@105@01  $FVF<data>))))
  :qid |qp.fvfDomDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@102@01 r) xs@60@01) (img@103@01 r))
      (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01)))
    (=
      ($FVF.lookup_data (as sm@105@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@105@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef16|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@105@01  $FVF<data>)) xs@60@01))
(assert (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@105@01  $FVF<data>)) xs@60@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@106@01 $FVF<data>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01))
    (=
      ($FVF.lookup_data (as sm@106@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@106@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef18|)))
(declare-const pm@107@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_data (as pm@107@01  $FPM) r)
    (ite
      (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No))
  :pattern (($FVF.perm_data (as pm@107@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
; Assume upper permission bound for field data
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_data (as pm@107@01  $FPM) r) $Perm.Write)
  :pattern ((inv@99@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] foo_qp(xs)
(set-option :timeout 0)
(push) ; 4
(declare-const x@108@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@108@01 xs@60@01))
(pop) ; 5
(declare-fun inv@109@01 ($Ref) $Ref)
(declare-fun img@110@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@108@01 $Ref) (x2@108@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@108@01 xs@60@01)
      (Set_in x2@108@01 xs@60@01)
      (= x1@108@01 x2@108@01))
    (= x1@108@01 x2@108@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@108@01 $Ref)) (!
  (=>
    (Set_in x@108@01 xs@60@01)
    (and (= (inv@109@01 x@108@01) x@108@01) (img@110@01 x@108@01)))
  :pattern ((Set_in x@108@01 xs@60@01))
  :pattern ((inv@109@01 x@108@01))
  :pattern ((img@110@01 x@108@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@110@01 r) (Set_in (inv@109@01 r) xs@60@01)) (= (inv@109@01 r) r))
  :pattern ((inv@109@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@111@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@109@01 r) xs@60@01) (img@110@01 r) (= r (inv@109@01 r)))
    ($Perm.min
      (ite
        (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@111@01 r))
    $Perm.No)
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@109@01 r) xs@60@01) (img@110@01 r) (= r (inv@109@01 r)))
    (= (- $Perm.Write (pTaken@111@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 5
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@109@01 r) xs@60@01) (img@110@01 r) (= r (inv@109@01 r)))
    (= (- $Perm.Write (pTaken@111@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field data
(declare-const x@112@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@112@01 xs@60@01))
(pop) ; 5
(declare-fun inv@113@01 ($Ref) $Ref)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@112@01 $Ref) (x2@112@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@112@01 xs@60@01)
      (Set_in x2@112@01 xs@60@01)
      (= x1@112@01 x2@112@01))
    (= x1@112@01 x2@112@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@112@01 $Ref)) (!
  (=>
    (Set_in x@112@01 xs@60@01)
    (and (= (inv@113@01 x@112@01) x@112@01) (img@114@01 x@112@01)))
  :pattern ((Set_in x@112@01 xs@60@01))
  :pattern ((inv@113@01 x@112@01))
  :pattern ((img@114@01 x@112@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@114@01 r) (Set_in (inv@113@01 r) xs@60@01)) (= (inv@113@01 r) r))
  :pattern ((inv@113@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@113@01 r) xs@60@01) (img@114@01 r) (= r (inv@113@01 r)))
    ($Perm.min
      (ite
        (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@100@01 r) (Set_in (inv@99@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@115@01 r))
    $Perm.No)
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@113@01 r) xs@60@01) (img@114@01 r) (= r (inv@113@01 r)))
    (= (- $Perm.Write (pTaken@115@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 5
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@113@01 r) xs@60@01) (img@114@01 r) (= r (inv@113@01 r)))
    (= (- $Perm.Write (pTaken@115@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(bla_qp(xs), 1 / 2) in foo_qp(xs))
(set-option :timeout 0)
(push) ; 3
(assert (bla_qp%trigger $t@61@01 xs@60@01))
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(declare-const x@116@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@116@01 xs@60@01))
(pop) ; 4
(declare-fun inv@117@01 ($Ref) $Ref)
(declare-fun img@118@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@116@01 $Ref) (x2@116@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@116@01 xs@60@01)
      (Set_in x2@116@01 xs@60@01)
      (= x1@116@01 x2@116@01))
    (= x1@116@01 x2@116@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@116@01 $Ref)) (!
  (=>
    (Set_in x@116@01 xs@60@01)
    (and (= (inv@117@01 x@116@01) x@116@01) (img@118@01 x@116@01)))
  :pattern ((Set_in x@116@01 xs@60@01))
  :pattern ((inv@117@01 x@116@01))
  :pattern ((img@118@01 x@116@01))
  :qid |quant-u-81|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01)) (= (inv@117@01 r) r))
  :pattern ((inv@117@01 r))
  :qid |data-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@116@01 $Ref)) (!
  (=> (Set_in x@116@01 xs@60@01) (not (= x@116@01 $Ref.null)))
  :pattern ((Set_in x@116@01 xs@60@01))
  :pattern ((inv@117@01 x@116@01))
  :pattern ((img@118@01 x@116@01))
  :qid |data-permImpliesNonNull|)))
(assert (= ($Snap.second $t@61@01) $Snap.unit))
; [eval] foo_qp(xs)
(push) ; 4
(declare-const x@119@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@119@01 xs@60@01))
(pop) ; 5
(declare-fun inv@120@01 ($Ref) $Ref)
(declare-fun img@121@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@119@01 $Ref) (x2@119@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@119@01 xs@60@01)
      (Set_in x2@119@01 xs@60@01)
      (= x1@119@01 x2@119@01))
    (= x1@119@01 x2@119@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@119@01 $Ref)) (!
  (=>
    (Set_in x@119@01 xs@60@01)
    (and (= (inv@120@01 x@119@01) x@119@01) (img@121@01 x@119@01)))
  :pattern ((Set_in x@119@01 xs@60@01))
  :pattern ((inv@120@01 x@119@01))
  :pattern ((img@121@01 x@119@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@121@01 r) (Set_in (inv@120@01 r) xs@60@01)) (= (inv@120@01 r) r))
  :pattern ((inv@120@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@120@01 r) xs@60@01) (img@121@01 r) (= r (inv@120@01 r)))
    ($Perm.min
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@122@01 r))
    $Perm.No)
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@120@01 r) xs@60@01) (img@121@01 r) (= r (inv@120@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@122@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@123@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@123@01  $FVF<data>)))
      (and (Set_in (inv@120@01 r) xs@60@01) (img@121@01 r)))
    (=>
      (and (Set_in (inv@120@01 r) xs@60@01) (img@121@01 r))
      (Set_in r ($FVF.domain_data (as sm@123@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@123@01  $FVF<data>))))
  :qid |qp.fvfDomDef21|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@120@01 r) xs@60@01) (img@121@01 r))
      (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01)))
    (=
      ($FVF.lookup_data (as sm@123@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@123@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef20|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@123@01  $FVF<data>)) xs@60@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@119@01 $Ref)) (!
  (=>
    (Set_in x@119@01 xs@60@01)
    (and (= (inv@120@01 x@119@01) x@119@01) (img@121@01 x@119@01)))
  :pattern ((Set_in x@119@01 xs@60@01))
  :pattern ((inv@120@01 x@119@01))
  :pattern ((img@121@01 x@119@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@121@01 r) (Set_in (inv@120@01 r) xs@60@01)) (= (inv@120@01 r) r))
  :pattern ((inv@120@01 r))
  :qid |data-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@123@01  $FVF<data>)))
      (and (Set_in (inv@120@01 r) xs@60@01) (img@121@01 r)))
    (=>
      (and (Set_in (inv@120@01 r) xs@60@01) (img@121@01 r))
      (Set_in r ($FVF.domain_data (as sm@123@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@123@01  $FVF<data>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@120@01 r) xs@60@01) (img@121@01 r))
      (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01)))
    (=
      ($FVF.lookup_data (as sm@123@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@123@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef20|)))
(assert (foo_qp%precondition ($SortWrappers.$FVF<data>To$Snap (as sm@123@01  $FVF<data>)) xs@60@01))
(assert (foo_qp ($SortWrappers.$FVF<data>To$Snap (as sm@123@01  $FVF<data>)) xs@60@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@124@01 $FVF<data>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01))
    (=
      ($FVF.lookup_data (as sm@124@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r)))
  :pattern (($FVF.lookup_data (as sm@124@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first $t@61@01)) r))
  :qid |qp.fvfValDef22|)))
(declare-const pm@125@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_data (as pm@125@01  $FPM) r)
    (ite
      (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No))
  :pattern (($FVF.perm_data (as pm@125@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
; Assume upper permission bound for field data
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_data (as pm@125@01  $FPM) r) $Perm.Write)
  :pattern ((inv@117@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] foo_qp(xs)
(set-option :timeout 0)
(push) ; 4
(declare-const x@126@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@126@01 xs@60@01))
(pop) ; 5
(declare-fun inv@127@01 ($Ref) $Ref)
(declare-fun img@128@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@126@01 $Ref) (x2@126@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@126@01 xs@60@01)
      (Set_in x2@126@01 xs@60@01)
      (= x1@126@01 x2@126@01))
    (= x1@126@01 x2@126@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@126@01 $Ref)) (!
  (=>
    (Set_in x@126@01 xs@60@01)
    (and (= (inv@127@01 x@126@01) x@126@01) (img@128@01 x@126@01)))
  :pattern ((Set_in x@126@01 xs@60@01))
  :pattern ((inv@127@01 x@126@01))
  :pattern ((img@128@01 x@126@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@128@01 r) (Set_in (inv@127@01 r) xs@60@01)) (= (inv@127@01 r) r))
  :pattern ((inv@127@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@129@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@127@01 r) xs@60@01) (img@128@01 r) (= r (inv@127@01 r)))
    ($Perm.min
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@129@01 r))
    $Perm.No)
  
  :qid |quant-u-88|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@127@01 r) xs@60@01) (img@128@01 r) (= r (inv@127@01 r)))
    (= (- $Perm.Write (pTaken@129@01 r)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 5
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@127@01 r) xs@60@01) (img@128@01 r) (= r (inv@127@01 r)))
    (= (- $Perm.Write (pTaken@129@01 r)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field data
(declare-const x@130@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@130@01 xs@60@01))
(pop) ; 5
(declare-fun inv@131@01 ($Ref) $Ref)
(declare-fun img@132@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@130@01 $Ref) (x2@130@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@130@01 xs@60@01)
      (Set_in x2@130@01 xs@60@01)
      (= x1@130@01 x2@130@01))
    (= x1@130@01 x2@130@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@130@01 $Ref)) (!
  (=>
    (Set_in x@130@01 xs@60@01)
    (and (= (inv@131@01 x@130@01) x@130@01) (img@132@01 x@130@01)))
  :pattern ((Set_in x@130@01 xs@60@01))
  :pattern ((inv@131@01 x@130@01))
  :pattern ((img@132@01 x@130@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@132@01 r) (Set_in (inv@131@01 r) xs@60@01)) (= (inv@131@01 r) r))
  :pattern ((inv@131@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@133@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@131@01 r) xs@60@01) (img@132@01 r) (= r (inv@131@01 r)))
    ($Perm.min
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) xs@60@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@133@01 r))
    $Perm.No)
  
  :qid |quant-u-92|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@131@01 r) xs@60@01) (img@132@01 r) (= r (inv@131@01 r)))
    (= (- $Perm.Write (pTaken@133@01 r)) $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 5
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@131@01 r) xs@60@01) (img@132@01 r) (= r (inv@131@01 r)))
    (= (- $Perm.Write (pTaken@133@01 r)) $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
