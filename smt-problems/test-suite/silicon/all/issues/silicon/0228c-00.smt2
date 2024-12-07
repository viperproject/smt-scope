(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:08
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr
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
(declare-sort $FVF<f> 0)
(declare-sort $PSF<pred> 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<pred>To$Snap ($PSF<pred>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<pred> ($Snap) $PSF<pred>)
(assert (forall ((x $PSF<pred>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<pred>($SortWrappers.$PSF<pred>To$Snap x)))
    :pattern (($SortWrappers.$PSF<pred>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<pred>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<pred>To$Snap($SortWrappers.$SnapTo$PSF<pred> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<pred> x))
    :qid |$Snap.$PSF<pred>To$SnapTo$PSF<pred>|
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /predicate_snap_functions_declarations.smt2 [pred: Snap]
(declare-fun $PSF.domain_pred ($PSF<pred>) Set<$Snap>)
(declare-fun $PSF.lookup_pred ($PSF<pred> $Snap) $Snap)
(declare-fun $PSF.after_pred ($PSF<pred> $PSF<pred>) Bool)
(declare-fun $PSF.loc_pred ($Snap $Snap) Bool)
(declare-fun $PSF.perm_pred ($PPM $Snap) $Perm)
(declare-const $psfTOP_pred $PSF<pred>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun ($Snap Int Int) Bool)
(declare-fun fun%limited ($Snap Int Int) Bool)
(declare-fun fun%stateless (Int Int) Bool)
(declare-fun fun%precondition ($Snap Int Int) Bool)
(declare-fun get ($Snap $Ref) Int)
(declare-fun get%limited ($Snap $Ref) Int)
(declare-fun get%stateless ($Ref) Bool)
(declare-fun get%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun pred%trigger ($Snap $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [pred: Snap]
(assert (forall ((vs $PSF<pred>) (ws $PSF<pred>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_pred vs) ($PSF.domain_pred ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_pred vs))
            (= ($PSF.lookup_pred vs x) ($PSF.lookup_pred ws x)))
          :pattern (($PSF.lookup_pred vs x) ($PSF.lookup_pred ws x))
          :qid |qp.$PSF<pred>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<pred>To$Snap vs)
              ($SortWrappers.$PSF<pred>To$Snap ws)
              )
    :qid |qp.$PSF<pred>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_pred pm s))
    :pattern (($PSF.perm_pred pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_pred f s) true)
    :pattern (($PSF.loc_pred f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (v@0@00 Int) (i@1@00 Int)) (!
  (= (fun%limited s@$ v@0@00 i@1@00) (fun s@$ v@0@00 i@1@00))
  :pattern ((fun s@$ v@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (v@0@00 Int) (i@1@00 Int)) (!
  (fun%stateless v@0@00 i@1@00)
  :pattern ((fun%limited s@$ v@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  (= (get%limited s@$ x@3@00) (get s@$ x@3@00))
  :pattern ((get s@$ x@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  (get%stateless x@3@00)
  :pattern ((get%limited s@$ x@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  (=>
    (get%precondition s@$ x@3@00)
    (= (get s@$ x@3@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((get s@$ x@3@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  true
  :pattern ((get s@$ x@3@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
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
; inhale acc(pred(x), write)
(declare-const $t@2@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { fun((unfolding acc(pred(x), write) in x.f), i) }
;     0 <= i && i < 10 ==> fun((unfolding acc(pred(x), write) in x.f), i))
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (forall i: Int :: { fun((unfolding acc(pred(x), write) in x.f), i) } 0 <= i && i < 10 ==> fun((unfolding acc(pred(x), write) in x.f), i))
(declare-const i@4@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 10 ==> fun((unfolding acc(pred(x), write) in x.f), i)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | !(0 <= i@4@01) | live]
; [else-branch: 0 | 0 <= i@4@01 | live]
(push) ; 5
; [then-branch: 0 | !(0 <= i@4@01)]
(assert (not (<= 0 i@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | 0 <= i@4@01]
(assert (<= 0 i@4@01))
; [eval] i < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@4@01) (not (<= 0 i@4@01))))
(push) ; 4
; [then-branch: 1 | 0 <= i@4@01 && i@4@01 < 10 | live]
; [else-branch: 1 | !(0 <= i@4@01 && i@4@01 < 10) | live]
(push) ; 5
; [then-branch: 1 | 0 <= i@4@01 && i@4@01 < 10]
(assert (and (<= 0 i@4@01) (< i@4@01 10)))
; [eval] fun((unfolding acc(pred(x), write) in x.f), i)
; [eval] (unfolding acc(pred(x), write) in x.f)
(push) ; 6
(assert (pred%trigger $t@2@01 x@1@01))
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))))
(pop) ; 6
; Joined path conditions
(assert (and
  (pred%trigger $t@2@01 x@1@01)
  (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
  (not (= x@1@01 $Ref.null))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@2@01)))))
(push) ; 6
(assert (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@4@01))
(pop) ; 6
; Joined path conditions
(assert (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@4@01))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(0 <= i@4@01 && i@4@01 < 10)]
(assert (not (and (<= 0 i@4@01) (< i@4@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@4@01) (< i@4@01 10))
  (and
    (<= 0 i@4@01)
    (< i@4@01 10)
    (pred%trigger $t@2@01 x@1@01)
    (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
    (not (= x@1@01 $Ref.null))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))
      ($SortWrappers.$SnapToInt ($Snap.second $t@2@01)))
    (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@4@01))))
; Joined path conditions
(assert (or (not (and (<= 0 i@4@01) (< i@4@01 10))) (and (<= 0 i@4@01) (< i@4@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@4@01 Int)) (!
  (and
    (or (<= 0 i@4@01) (not (<= 0 i@4@01)))
    (=>
      (and (<= 0 i@4@01) (< i@4@01 10))
      (and
        (<= 0 i@4@01)
        (< i@4@01 10)
        (pred%trigger $t@2@01 x@1@01)
        (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
        (not (= x@1@01 $Ref.null))
        (=
          ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))
          ($SortWrappers.$SnapToInt ($Snap.second $t@2@01)))
        (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@4@01)))
    (or
      (not (and (<= 0 i@4@01) (< i@4@01 10)))
      (and (<= 0 i@4@01) (< i@4@01 10))))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@13@10@13@85-aux|)))
(assert (forall ((i@4@01 Int)) (!
  (=>
    (and (<= 0 i@4@01) (< i@4@01 10))
    (fun $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@4@01))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@13@10@13@85|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int ::
;     { fun((unfolding acc(pred(x), write) in x.f), i) }
;     0 <= i && i < 10 ==> fun((unfolding acc(pred(x), write) in x.f), i))
; [eval] (forall i: Int :: { fun((unfolding acc(pred(x), write) in x.f), i) } 0 <= i && i < 10 ==> fun((unfolding acc(pred(x), write) in x.f), i))
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 10 ==> fun((unfolding acc(pred(x), write) in x.f), i)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 4
; [then-branch: 2 | !(0 <= i@5@01) | live]
; [else-branch: 2 | 0 <= i@5@01 | live]
(push) ; 5
; [then-branch: 2 | !(0 <= i@5@01)]
(assert (not (<= 0 i@5@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | 0 <= i@5@01]
(assert (<= 0 i@5@01))
; [eval] i < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
(push) ; 4
; [then-branch: 3 | 0 <= i@5@01 && i@5@01 < 10 | live]
; [else-branch: 3 | !(0 <= i@5@01 && i@5@01 < 10) | live]
(push) ; 5
; [then-branch: 3 | 0 <= i@5@01 && i@5@01 < 10]
(assert (and (<= 0 i@5@01) (< i@5@01 10)))
; [eval] fun((unfolding acc(pred(x), write) in x.f), i)
; [eval] (unfolding acc(pred(x), write) in x.f)
(push) ; 6
(assert (pred%trigger $t@2@01 x@1@01))
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))))
(pop) ; 6
; Joined path conditions
(assert (and
  (pred%trigger $t@2@01 x@1@01)
  (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
  (not (= x@1@01 $Ref.null))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@2@01)))))
(push) ; 6
(assert (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
(pop) ; 6
; Joined path conditions
(assert (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(0 <= i@5@01 && i@5@01 < 10)]
(assert (not (and (<= 0 i@5@01) (< i@5@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@5@01) (< i@5@01 10))
  (and
    (<= 0 i@5@01)
    (< i@5@01 10)
    (pred%trigger $t@2@01 x@1@01)
    (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
    (not (= x@1@01 $Ref.null))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))
      ($SortWrappers.$SnapToInt ($Snap.second $t@2@01)))
    (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))))
; Joined path conditions
(assert (or (not (and (<= 0 i@5@01) (< i@5@01 10))) (and (<= 0 i@5@01) (< i@5@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@5@01 Int)) (!
  (and
    (or (<= 0 i@5@01) (not (<= 0 i@5@01)))
    (=>
      (and (<= 0 i@5@01) (< i@5@01 10))
      (and
        (<= 0 i@5@01)
        (< i@5@01 10)
        (pred%trigger $t@2@01 x@1@01)
        (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
        (not (= x@1@01 $Ref.null))
        (=
          ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))
          ($SortWrappers.$SnapToInt ($Snap.second $t@2@01)))
        (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01)))
    (or
      (not (and (<= 0 i@5@01) (< i@5@01 10)))
      (and (<= 0 i@5@01) (< i@5@01 10))))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@14@10@14@85-aux|)))
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 10))
    (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@14@10@14@85_precondition|)))
(push) ; 3
(assert (not (forall ((i@5@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 i@5@01) (< i@5@01 10))
        (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
      (and (<= 0 i@5@01) (< i@5@01 10)))
    (fun $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@14@10@14@85|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 10))
    (fun $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) i@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@14@10@14@85|)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@6@01 $Ref)
(declare-const x@7@01 $Ref)
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
; inhale acc(pred(x), write)
(declare-const $t@8@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { fun(get(x), i) }
;     0 <= i && i < 10 ==> fun(get(x), i))
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] (forall i: Int :: { fun(get(x), i) } 0 <= i && i < 10 ==> fun(get(x), i))
(declare-const i@10@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 10 ==> fun(get(x), i)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 4
; [then-branch: 4 | !(0 <= i@10@01) | live]
; [else-branch: 4 | 0 <= i@10@01 | live]
(push) ; 5
; [then-branch: 4 | !(0 <= i@10@01)]
(assert (not (<= 0 i@10@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | 0 <= i@10@01]
(assert (<= 0 i@10@01))
; [eval] i < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@10@01) (not (<= 0 i@10@01))))
(push) ; 4
; [then-branch: 5 | 0 <= i@10@01 && i@10@01 < 10 | live]
; [else-branch: 5 | !(0 <= i@10@01 && i@10@01 < 10) | live]
(push) ; 5
; [then-branch: 5 | 0 <= i@10@01 && i@10@01 < 10]
(assert (and (<= 0 i@10@01) (< i@10@01 10)))
; [eval] fun(get(x), i)
; [eval] get(x)
(push) ; 6
(assert (get%precondition $t@8@01 x@7@01))
(pop) ; 6
; Joined path conditions
(assert (get%precondition $t@8@01 x@7@01))
(push) ; 6
(assert (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@10@01))
(pop) ; 6
; Joined path conditions
(assert (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@10@01))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(0 <= i@10@01 && i@10@01 < 10)]
(assert (not (and (<= 0 i@10@01) (< i@10@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@10@01) (< i@10@01 10))
  (and
    (<= 0 i@10@01)
    (< i@10@01 10)
    (get%precondition $t@8@01 x@7@01)
    (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@10@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@10@01) (< i@10@01 10)))
  (and (<= 0 i@10@01) (< i@10@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@10@01 Int)) (!
  (and
    (or (<= 0 i@10@01) (not (<= 0 i@10@01)))
    (=>
      (and (<= 0 i@10@01) (< i@10@01 10))
      (and
        (<= 0 i@10@01)
        (< i@10@01 10)
        (get%precondition $t@8@01 x@7@01)
        (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@10@01)))
    (or
      (not (and (<= 0 i@10@01) (< i@10@01 10)))
      (and (<= 0 i@10@01) (< i@10@01 10))))
  :pattern ((fun%limited $Snap.unit (get $t@8@01 x@7@01) i@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@25@10@25@62-aux|)))
(assert (forall ((i@10@01 Int)) (!
  (=>
    (and (<= 0 i@10@01) (< i@10@01 10))
    (fun $Snap.unit (get $t@8@01 x@7@01) i@10@01))
  :pattern ((fun%limited $Snap.unit (get $t@8@01 x@7@01) i@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@25@10@25@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int ::
;     { fun(get(x), i) }
;     0 <= i && i < 10 ==> fun(get(x), i))
; [eval] (forall i: Int :: { fun(get(x), i) } 0 <= i && i < 10 ==> fun(get(x), i))
(declare-const i@11@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 10 ==> fun(get(x), i)
; [eval] 0 <= i && i < 10
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
; [eval] i < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
(push) ; 4
; [then-branch: 7 | 0 <= i@11@01 && i@11@01 < 10 | live]
; [else-branch: 7 | !(0 <= i@11@01 && i@11@01 < 10) | live]
(push) ; 5
; [then-branch: 7 | 0 <= i@11@01 && i@11@01 < 10]
(assert (and (<= 0 i@11@01) (< i@11@01 10)))
; [eval] fun(get(x), i)
; [eval] get(x)
(push) ; 6
(assert (get%precondition $t@8@01 x@7@01))
(pop) ; 6
; Joined path conditions
(assert (get%precondition $t@8@01 x@7@01))
(push) ; 6
(assert (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@11@01))
(pop) ; 6
; Joined path conditions
(assert (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@11@01))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(0 <= i@11@01 && i@11@01 < 10)]
(assert (not (and (<= 0 i@11@01) (< i@11@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@11@01) (< i@11@01 10))
  (and
    (<= 0 i@11@01)
    (< i@11@01 10)
    (get%precondition $t@8@01 x@7@01)
    (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@11@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@11@01) (< i@11@01 10)))
  (and (<= 0 i@11@01) (< i@11@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@11@01 Int)) (!
  (and
    (or (<= 0 i@11@01) (not (<= 0 i@11@01)))
    (=>
      (and (<= 0 i@11@01) (< i@11@01 10))
      (and
        (<= 0 i@11@01)
        (< i@11@01 10)
        (get%precondition $t@8@01 x@7@01)
        (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@11@01)))
    (or
      (not (and (<= 0 i@11@01) (< i@11@01 10)))
      (and (<= 0 i@11@01) (< i@11@01 10))))
  :pattern ((fun%limited $Snap.unit (get $t@8@01 x@7@01) i@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@26@10@26@62-aux|)))
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 10))
    (and
      (get%precondition $t@8@01 x@7@01)
      (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@11@01)))
  :pattern ((fun%limited $Snap.unit (get $t@8@01 x@7@01) i@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@26@10@26@62_precondition|)))
(push) ; 3
(assert (not (forall ((i@11@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 i@11@01) (< i@11@01 10))
        (and
          (get%precondition $t@8@01 x@7@01)
          (fun%precondition $Snap.unit (get $t@8@01 x@7@01) i@11@01)))
      (and (<= 0 i@11@01) (< i@11@01 10)))
    (fun $Snap.unit (get $t@8@01 x@7@01) i@11@01))
  :pattern ((fun%limited $Snap.unit (get $t@8@01 x@7@01) i@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@26@10@26@62|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 10))
    (fun $Snap.unit (get $t@8@01 x@7@01) i@11@01))
  :pattern ((fun%limited $Snap.unit (get $t@8@01 x@7@01) i@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@26@10@26@62|)))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@12@01 $Ref)
(declare-const x@13@01 $Ref)
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
; var v: Int
(declare-const v@14@01 Int)
; [exec]
; inhale acc(pred(x), write)
(declare-const $t@15@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; v := (unfolding acc(pred(x), write) in x.f)
; [eval] (unfolding acc(pred(x), write) in x.f)
(set-option :timeout 0)
(push) ; 3
(assert (pred%trigger $t@15@01 x@13@01))
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (not (= x@13@01 $Ref.null)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@15@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@15@01))))
(pop) ; 3
; Joined path conditions
(assert (and
  (pred%trigger $t@15@01 x@13@01)
  (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01)))
  (not (= x@13@01 $Ref.null))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@15@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@15@01)))))
(declare-const v@16@01 Int)
(assert (= v@16@01 ($SortWrappers.$SnapToInt ($Snap.first $t@15@01))))
; [exec]
; inhale (forall i: Int :: { fun(v, i) } 0 <= i && i < 10 ==> fun(v, i))
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] (forall i: Int :: { fun(v, i) } 0 <= i && i < 10 ==> fun(v, i))
(declare-const i@18@01 Int)
(push) ; 3
; [eval] 0 <= i && i < 10 ==> fun(v, i)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 4
; [then-branch: 8 | !(0 <= i@18@01) | live]
; [else-branch: 8 | 0 <= i@18@01 | live]
(push) ; 5
; [then-branch: 8 | !(0 <= i@18@01)]
(assert (not (<= 0 i@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 0 <= i@18@01]
(assert (<= 0 i@18@01))
; [eval] i < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@18@01) (not (<= 0 i@18@01))))
(push) ; 4
; [then-branch: 9 | 0 <= i@18@01 && i@18@01 < 10 | live]
; [else-branch: 9 | !(0 <= i@18@01 && i@18@01 < 10) | live]
(push) ; 5
; [then-branch: 9 | 0 <= i@18@01 && i@18@01 < 10]
(assert (and (<= 0 i@18@01) (< i@18@01 10)))
; [eval] fun(v, i)
(push) ; 6
(assert (fun%precondition $Snap.unit v@16@01 i@18@01))
(pop) ; 6
; Joined path conditions
(assert (fun%precondition $Snap.unit v@16@01 i@18@01))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(0 <= i@18@01 && i@18@01 < 10)]
(assert (not (and (<= 0 i@18@01) (< i@18@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@18@01) (< i@18@01 10))
  (and
    (<= 0 i@18@01)
    (< i@18@01 10)
    (fun%precondition $Snap.unit v@16@01 i@18@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@18@01) (< i@18@01 10)))
  (and (<= 0 i@18@01) (< i@18@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@18@01 Int)) (!
  (and
    (or (<= 0 i@18@01) (not (<= 0 i@18@01)))
    (=>
      (and (<= 0 i@18@01) (< i@18@01 10))
      (and
        (<= 0 i@18@01)
        (< i@18@01 10)
        (fun%precondition $Snap.unit v@16@01 i@18@01)))
    (or
      (not (and (<= 0 i@18@01) (< i@18@01 10)))
      (and (<= 0 i@18@01) (< i@18@01 10))))
  :pattern ((fun%limited $Snap.unit v@16@01 i@18@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@32@10@32@57-aux|)))
(assert (forall ((i@18@01 Int)) (!
  (=> (and (<= 0 i@18@01) (< i@18@01 10)) (fun $Snap.unit v@16@01 i@18@01))
  :pattern ((fun%limited $Snap.unit v@16@01 i@18@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@32@10@32@57|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int :: { fun(v, i) } 0 <= i && i < 10 ==> fun(v, i))
; [eval] (forall i: Int :: { fun(v, i) } 0 <= i && i < 10 ==> fun(v, i))
(declare-const i@19@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 10 ==> fun(v, i)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 4
; [then-branch: 10 | !(0 <= i@19@01) | live]
; [else-branch: 10 | 0 <= i@19@01 | live]
(push) ; 5
; [then-branch: 10 | !(0 <= i@19@01)]
(assert (not (<= 0 i@19@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | 0 <= i@19@01]
(assert (<= 0 i@19@01))
; [eval] i < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
(push) ; 4
; [then-branch: 11 | 0 <= i@19@01 && i@19@01 < 10 | live]
; [else-branch: 11 | !(0 <= i@19@01 && i@19@01 < 10) | live]
(push) ; 5
; [then-branch: 11 | 0 <= i@19@01 && i@19@01 < 10]
(assert (and (<= 0 i@19@01) (< i@19@01 10)))
; [eval] fun(v, i)
(push) ; 6
(assert (fun%precondition $Snap.unit v@16@01 i@19@01))
(pop) ; 6
; Joined path conditions
(assert (fun%precondition $Snap.unit v@16@01 i@19@01))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(0 <= i@19@01 && i@19@01 < 10)]
(assert (not (and (<= 0 i@19@01) (< i@19@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@19@01) (< i@19@01 10))
  (and
    (<= 0 i@19@01)
    (< i@19@01 10)
    (fun%precondition $Snap.unit v@16@01 i@19@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@19@01) (< i@19@01 10)))
  (and (<= 0 i@19@01) (< i@19@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@19@01 Int)) (!
  (and
    (or (<= 0 i@19@01) (not (<= 0 i@19@01)))
    (=>
      (and (<= 0 i@19@01) (< i@19@01 10))
      (and
        (<= 0 i@19@01)
        (< i@19@01 10)
        (fun%precondition $Snap.unit v@16@01 i@19@01)))
    (or
      (not (and (<= 0 i@19@01) (< i@19@01 10)))
      (and (<= 0 i@19@01) (< i@19@01 10))))
  :pattern ((fun%limited $Snap.unit v@16@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@33@10@33@57-aux|)))
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 10))
    (fun%precondition $Snap.unit v@16@01 i@19@01))
  :pattern ((fun%limited $Snap.unit v@16@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@33@10@33@57_precondition|)))
(push) ; 3
(assert (not (forall ((i@19@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 i@19@01) (< i@19@01 10))
        (fun%precondition $Snap.unit v@16@01 i@19@01))
      (and (<= 0 i@19@01) (< i@19@01 10)))
    (fun $Snap.unit v@16@01 i@19@01))
  :pattern ((fun%limited $Snap.unit v@16@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@33@10@33@57|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@19@01 Int)) (!
  (=> (and (<= 0 i@19@01) (< i@19@01 10)) (fun $Snap.unit v@16@01 i@19@01))
  :pattern ((fun%limited $Snap.unit v@16@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@33@10@33@57|)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@20@01 $Ref)
(declare-const x@21@01 $Ref)
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
; inhale acc(pred(x), write)
(declare-const $t@22@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(pred(x), write)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (not (= x@21@01 $Ref.null)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@22@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@22@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred%trigger $t@22@01 x@21@01))
; [exec]
; inhale (forall i: Int :: { fun(x.f, i) } 0 <= i && i < 10 ==> fun(x.f, i))
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] (forall i: Int :: { fun(x.f, i) } 0 <= i && i < 10 ==> fun(x.f, i))
(declare-const i@24@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 10 ==> fun(x.f, i)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 4
; [then-branch: 12 | !(0 <= i@24@01) | live]
; [else-branch: 12 | 0 <= i@24@01 | live]
(push) ; 5
; [then-branch: 12 | !(0 <= i@24@01)]
(assert (not (<= 0 i@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | 0 <= i@24@01]
(assert (<= 0 i@24@01))
; [eval] i < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@24@01) (not (<= 0 i@24@01))))
(push) ; 4
; [then-branch: 13 | 0 <= i@24@01 && i@24@01 < 10 | live]
; [else-branch: 13 | !(0 <= i@24@01 && i@24@01 < 10) | live]
(push) ; 5
; [then-branch: 13 | 0 <= i@24@01 && i@24@01 < 10]
(assert (and (<= 0 i@24@01) (< i@24@01 10)))
; [eval] fun(x.f, i)
(push) ; 6
(assert (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@24@01))
(pop) ; 6
; Joined path conditions
(assert (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@24@01))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(0 <= i@24@01 && i@24@01 < 10)]
(assert (not (and (<= 0 i@24@01) (< i@24@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@24@01) (< i@24@01 10))
  (and
    (<= 0 i@24@01)
    (< i@24@01 10)
    (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@24@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@24@01) (< i@24@01 10)))
  (and (<= 0 i@24@01) (< i@24@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@24@01 Int)) (!
  (and
    (or (<= 0 i@24@01) (not (<= 0 i@24@01)))
    (=>
      (and (<= 0 i@24@01) (< i@24@01 10))
      (and
        (<= 0 i@24@01)
        (< i@24@01 10)
        (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@24@01)))
    (or
      (not (and (<= 0 i@24@01) (< i@24@01 10)))
      (and (<= 0 i@24@01) (< i@24@01 10))))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@39@10@39@59-aux|)))
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (<= 0 i@24@01) (< i@24@01 10))
    (fun $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@24@01))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@39@10@39@59|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int :: { fun(x.f, i) } 0 <= i && i < 10 ==> fun(x.f, i))
; [eval] (forall i: Int :: { fun(x.f, i) } 0 <= i && i < 10 ==> fun(x.f, i))
(declare-const i@25@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 10 ==> fun(x.f, i)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 4
; [then-branch: 14 | !(0 <= i@25@01) | live]
; [else-branch: 14 | 0 <= i@25@01 | live]
(push) ; 5
; [then-branch: 14 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
(push) ; 4
; [then-branch: 15 | 0 <= i@25@01 && i@25@01 < 10 | live]
; [else-branch: 15 | !(0 <= i@25@01 && i@25@01 < 10) | live]
(push) ; 5
; [then-branch: 15 | 0 <= i@25@01 && i@25@01 < 10]
(assert (and (<= 0 i@25@01) (< i@25@01 10)))
; [eval] fun(x.f, i)
(push) ; 6
(assert (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
(pop) ; 6
; Joined path conditions
(assert (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(0 <= i@25@01 && i@25@01 < 10)]
(assert (not (and (<= 0 i@25@01) (< i@25@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@25@01) (< i@25@01 10))
  (and
    (<= 0 i@25@01)
    (< i@25@01 10)
    (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@25@01) (< i@25@01 10)))
  (and (<= 0 i@25@01) (< i@25@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@25@01 Int)) (!
  (and
    (or (<= 0 i@25@01) (not (<= 0 i@25@01)))
    (=>
      (and (<= 0 i@25@01) (< i@25@01 10))
      (and
        (<= 0 i@25@01)
        (< i@25@01 10)
        (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01)))
    (or
      (not (and (<= 0 i@25@01) (< i@25@01 10)))
      (and (<= 0 i@25@01) (< i@25@01 10))))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@40@10@40@59-aux|)))
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 10))
    (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@40@10@40@59_precondition|)))
(push) ; 3
(assert (not (forall ((i@25@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 i@25@01) (< i@25@01 10))
        (fun%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
      (and (<= 0 i@25@01) (< i@25@01 10)))
    (fun $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@40@10@40@59|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 10))
    (fun $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
  :pattern ((fun%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) i@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0228c.vpr@40@10@40@59|)))
(pop) ; 2
(pop) ; 1
