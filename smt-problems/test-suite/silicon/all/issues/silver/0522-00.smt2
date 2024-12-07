(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:04:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0522.vpr
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
(declare-sort foo 0)
(declare-sort $FVF<f> 0)
(declare-sort $PSF<P> 0)
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
(declare-fun $SortWrappers.fooTo$Snap (foo) $Snap)
(declare-fun $SortWrappers.$SnapTofoo ($Snap) foo)
(assert (forall ((x foo)) (!
    (= x ($SortWrappers.$SnapTofoo($SortWrappers.fooTo$Snap x)))
    :pattern (($SortWrappers.fooTo$Snap x))
    :qid |$Snap.$SnapTofooTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.fooTo$Snap($SortWrappers.$SnapTofoo x)))
    :pattern (($SortWrappers.$SnapTofoo x))
    :qid |$Snap.fooTo$SnapTofoo|
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
(declare-fun $SortWrappers.$PSF<P>To$Snap ($PSF<P>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<P> ($Snap) $PSF<P>)
(assert (forall ((x $PSF<P>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<P>($SortWrappers.$PSF<P>To$Snap x)))
    :pattern (($SortWrappers.$PSF<P>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<P>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<P>To$Snap($SortWrappers.$SnapTo$PSF<P> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<P> x))
    :qid |$Snap.$PSF<P>To$SnapTo$PSF<P>|
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
(declare-fun permfun<Perm> ($Ref) $Perm)
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /predicate_snap_functions_declarations.smt2 [P: Int]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) Int)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P (Int $Snap) Bool)
(declare-fun $PSF.perm_P ($PPM $Snap) $Perm)
(declare-const $psfTOP_P $PSF<P>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun funky ($Snap $Ref) Bool)
(declare-fun funky%limited ($Snap $Ref) Bool)
(declare-fun funky%stateless ($Ref) Bool)
(declare-fun funky%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
(declare-fun Q%trigger ($Snap $Ref $Perm) Bool)
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
; /predicate_snap_functions_axioms.smt2 [P: Int]
(assert (forall ((vs $PSF<P>) (ws $PSF<P>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_P vs) ($PSF.domain_P ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_P vs))
            (= ($PSF.lookup_P vs x) ($PSF.lookup_P ws x)))
          :pattern (($PSF.lookup_P vs x) ($PSF.lookup_P ws x))
          :qid |qp.$PSF<P>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<P>To$Snap vs)
              ($SortWrappers.$PSF<P>To$Snap ws)
              )
    :qid |qp.$PSF<P>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_P pm s))
    :pattern (($PSF.perm_P pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_P f s) true)
    :pattern (($PSF.loc_P f s)))))
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
; ---------- test1 ----------
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
; inhale acc(x.f, -1 / 2)
; [eval] -1
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@2@01 $Ref)
(declare-const x@3@01 $Ref)
(push) ; 1
; [eval] -write
(push) ; 2
(assert (not false))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- test3 ----------
(declare-const x@4@01 $Ref)
(declare-const p@5@01 $Perm)
(declare-const x@6@01 $Ref)
(declare-const p@7@01 $Perm)
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
; inhale acc(x.f, p)
(push) ; 3
(assert (not (or (= p@7@01 $Perm.No) (< $Perm.No p@7@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test3b ----------
(declare-const x@8@01 $Ref)
(declare-const p@9@01 $Perm)
(declare-const x@10@01 $Ref)
(declare-const p@11@01 $Perm)
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
; inhale none <= p ==> acc(x.f, p)
; [eval] none <= p
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= $Perm.No p@11@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= $Perm.No p@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | Z <= p@11@01 | live]
; [else-branch: 0 | !(Z <= p@11@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | Z <= p@11@01]
(assert (<= $Perm.No p@11@01))
(push) ; 4
(assert (not (or (= p@11@01 $Perm.No) (< $Perm.No p@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@12@01 Int)
(assert (<= $Perm.No p@11@01))
(assert (<= p@11@01 $Perm.Write))
(assert (=> (< $Perm.No p@11@01) (not (= x@10@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | !(Z <= p@11@01)]
(assert (not (<= $Perm.No p@11@01)))
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const x@14@01 $Ref)
(declare-const p@15@01 $Perm)
(declare-const x@16@01 $Ref)
(declare-const p@17@01 $Perm)
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
; inhale acc(P(x), write)
(declare-const $t@18@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(P(x), p)
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No p@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const x@19@01 $Ref)
(declare-const p@20@01 $Perm)
(declare-const x@21@01 $Ref)
(declare-const p@22@01 $Perm)
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
; inhale acc(Q(x, p), write)
(declare-const $t@23@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(Q(x, p), write) in x != null)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] (unfolding acc(Q(x, p), write) in x != null)
(set-option :timeout 0)
(push) ; 3
(assert (Q%trigger ($SortWrappers.IntTo$Snap $t@23@01) x@21@01 p@22@01))
(push) ; 4
(assert (not (or (= p@22@01 $Perm.No) (< $Perm.No p@22@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test20 ----------
(declare-const xs@25@01 Set<$Ref>)
(declare-const p@26@01 $Perm)
(declare-const xs@27@01 Set<$Ref>)
(declare-const p@28@01 $Perm)
(push) ; 1
(declare-const x@29@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@29@01 xs@27@01))
(pop) ; 2
(declare-const $t@30@01 $FVF<f>)
(declare-fun inv@31@01 ($Ref) $Ref)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@29@01 $Ref)) (!
  (=> (Set_in x@29@01 xs@27@01) (or (= p@28@01 $Perm.No) (< $Perm.No p@28@01)))
  
  :qid |quant-u-2|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- test21 ----------
(declare-const xs@33@01 Set<$Ref>)
(declare-const p@34@01 $Perm)
(declare-const xs@35@01 Set<$Ref>)
(declare-const p@36@01 $Perm)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const x@37@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@37@01 xs@35@01))
(pop) ; 4
(declare-const $t@38@01 $PSF<P>)
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@37@01 $Ref)) (!
  (=> (Set_in x@37@01 xs@35@01) (or (= p@36@01 $Perm.No) (< $Perm.No p@36@01)))
  
  :qid |quant-u-3|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test22 ----------
(declare-const xs@41@01 Set<$Ref>)
(declare-const p@42@01 $Perm)
(declare-const xs@43@01 Set<$Ref>)
(declare-const p@44@01 $Perm)
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
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, (none <= p ? p : none)))
(declare-const x@45@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@45@01 xs@43@01))
; [eval] (none <= p ? p : none)
; [eval] none <= p
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= $Perm.No p@44@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= $Perm.No p@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | Z <= p@44@01 | live]
; [else-branch: 1 | !(Z <= p@44@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | Z <= p@44@01]
(assert (<= $Perm.No p@44@01))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(Z <= p@44@01)]
(assert (not (<= $Perm.No p@44@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= $Perm.No p@44@01)) (<= $Perm.No p@44@01)))
(pop) ; 3
(declare-const $t@46@01 $FVF<f>)
(declare-fun inv@47@01 ($Ref) $Ref)
(declare-fun img@48@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (Set_in x@45@01 xs@43@01)
    (or (not (<= $Perm.No p@44@01)) (<= $Perm.No p@44@01)))
  :pattern ((Set_in x@45@01 xs@43@01))
  :pattern ((inv@47@01 x@45@01))
  :pattern ((img@48@01 x@45@01))
  :qid |f-aux|)))
(push) ; 3
(assert (not (forall ((x@45@01 $Ref)) (!
  (=>
    (Set_in x@45@01 xs@43@01)
    (or
      (= (ite (<= $Perm.No p@44@01) p@44@01 $Perm.No) $Perm.No)
      (ite (<= $Perm.No p@44@01) (< $Perm.No p@44@01) false)))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@45@01 $Ref) (x2@45@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@45@01 xs@43@01)
        (ite (<= $Perm.No p@44@01) (< $Perm.No p@44@01) false))
      (and
        (Set_in x2@45@01 xs@43@01)
        (ite (<= $Perm.No p@44@01) (< $Perm.No p@44@01) false))
      (= x1@45@01 x2@45@01))
    (= x1@45@01 x2@45@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (and
      (Set_in x@45@01 xs@43@01)
      (ite (<= $Perm.No p@44@01) (< $Perm.No p@44@01) false))
    (and (= (inv@47@01 x@45@01) x@45@01) (img@48@01 x@45@01)))
  :pattern ((Set_in x@45@01 xs@43@01))
  :pattern ((inv@47@01 x@45@01))
  :pattern ((img@48@01 x@45@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and
        (Set_in (inv@47@01 r) xs@43@01)
        (ite (<= $Perm.No p@44@01) (< $Perm.No p@44@01) false)))
    (= (inv@47@01 r) r))
  :pattern ((inv@47@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@45@01 $Ref)) (!
  (<= $Perm.No (ite (<= $Perm.No p@44@01) p@44@01 $Perm.No))
  :pattern ((Set_in x@45@01 xs@43@01))
  :pattern ((inv@47@01 x@45@01))
  :pattern ((img@48@01 x@45@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@45@01 $Ref)) (!
  (<= (ite (<= $Perm.No p@44@01) p@44@01 $Perm.No) $Perm.Write)
  :pattern ((Set_in x@45@01 xs@43@01))
  :pattern ((inv@47@01 x@45@01))
  :pattern ((img@48@01 x@45@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (and
      (Set_in x@45@01 xs@43@01)
      (ite (<= $Perm.No p@44@01) (< $Perm.No p@44@01) false))
    (not (= x@45@01 $Ref.null)))
  :pattern ((Set_in x@45@01 xs@43@01))
  :pattern ((inv@47@01 x@45@01))
  :pattern ((img@48@01 x@45@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test23 ----------
(declare-const p@49@01 $Perm)
(declare-const y@50@01 $Ref)
(declare-const p@51@01 $Perm)
(declare-const y@52@01 $Ref)
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
; var xs: Set[Ref]
(declare-const xs@53@01 Set<$Ref>)
; [exec]
; inhale (forall x: Ref ::
;     { (x in xs) }
;     { permfun(x) }
;     (x in xs) ==> none <= permfun(x))
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } { permfun(x) } (x in xs) ==> none <= permfun(x))
(declare-const x@55@01 $Ref)
(push) ; 3
; [eval] (x in xs) ==> none <= permfun(x)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 2 | x@55@01 in xs@53@01 | live]
; [else-branch: 2 | !(x@55@01 in xs@53@01) | live]
(push) ; 5
; [then-branch: 2 | x@55@01 in xs@53@01]
(assert (Set_in x@55@01 xs@53@01))
; [eval] none <= permfun(x)
; [eval] permfun(x)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(x@55@01 in xs@53@01)]
(assert (not (Set_in x@55@01 xs@53@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@55@01 xs@53@01)) (Set_in x@55@01 xs@53@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@55@01 $Ref)) (!
  (or (not (Set_in x@55@01 xs@53@01)) (Set_in x@55@01 xs@53@01))
  :pattern ((Set_in x@55@01 xs@53@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@76@10@76@57-aux|)))
(assert (forall ((x@55@01 $Ref)) (!
  (or (not (Set_in x@55@01 xs@53@01)) (Set_in x@55@01 xs@53@01))
  :pattern ((permfun<Perm> x@55@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@76@10@76@57-aux|)))
(assert (forall ((x@55@01 $Ref)) (!
  (=> (Set_in x@55@01 xs@53@01) (<= $Perm.No (permfun<Perm> x@55@01)))
  :pattern ((Set_in x@55@01 xs@53@01))
  :pattern ((permfun<Perm> x@55@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@76@10@76@57|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; xs := (xs union Set(y))
; [eval] (xs union Set(y))
; [eval] Set(y)
(declare-const xs@56@01 Set<$Ref>)
(assert (= xs@56@01 (Set_union xs@53@01 (Set_singleton y@52@01))))
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, permfun(x)))
(declare-const x@57@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@57@01 xs@56@01))
; [eval] permfun(x)
(pop) ; 3
(declare-const $t@58@01 $FVF<f>)
(declare-fun inv@59@01 ($Ref) $Ref)
(declare-fun img@60@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@57@01 $Ref)) (!
  (=>
    (Set_in x@57@01 xs@56@01)
    (or
      (= (permfun<Perm> x@57@01) $Perm.No)
      (< $Perm.No (permfun<Perm> x@57@01))))
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test23b ----------
(declare-const p@61@01 $Perm)
(declare-const y@62@01 $Ref)
(declare-const p@63@01 $Perm)
(declare-const y@64@01 $Ref)
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
; var xs: Set[Ref]
(declare-const xs@65@01 Set<$Ref>)
; [exec]
; inhale (y in xs)
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@64@01 xs@65@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref ::
;     { (x in xs) }
;     { permfun(x) }
;     (x in xs) ==> none <= permfun(x))
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } { permfun(x) } (x in xs) ==> none <= permfun(x))
(declare-const x@68@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> none <= permfun(x)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 3 | x@68@01 in xs@65@01 | live]
; [else-branch: 3 | !(x@68@01 in xs@65@01) | live]
(push) ; 5
; [then-branch: 3 | x@68@01 in xs@65@01]
(assert (Set_in x@68@01 xs@65@01))
; [eval] none <= permfun(x)
; [eval] permfun(x)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(x@68@01 in xs@65@01)]
(assert (not (Set_in x@68@01 xs@65@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@68@01 xs@65@01)) (Set_in x@68@01 xs@65@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@68@01 $Ref)) (!
  (or (not (Set_in x@68@01 xs@65@01)) (Set_in x@68@01 xs@65@01))
  :pattern ((Set_in x@68@01 xs@65@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@87@10@87@57-aux|)))
(assert (forall ((x@68@01 $Ref)) (!
  (or (not (Set_in x@68@01 xs@65@01)) (Set_in x@68@01 xs@65@01))
  :pattern ((permfun<Perm> x@68@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@87@10@87@57-aux|)))
(assert (forall ((x@68@01 $Ref)) (!
  (=> (Set_in x@68@01 xs@65@01) (<= $Perm.No (permfun<Perm> x@68@01)))
  :pattern ((Set_in x@68@01 xs@65@01))
  :pattern ((permfun<Perm> x@68@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@87@10@87@57|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; xs := (xs union Set(y))
; [eval] (xs union Set(y))
; [eval] Set(y)
(declare-const xs@69@01 Set<$Ref>)
(assert (= xs@69@01 (Set_union xs@65@01 (Set_singleton y@64@01))))
; [exec]
; assert (forall x: Ref ::
;     { (x in xs) }
;     { permfun(x) }
;     (x in xs) ==> none <= permfun(x))
; [eval] (forall x: Ref :: { (x in xs) } { permfun(x) } (x in xs) ==> none <= permfun(x))
(declare-const x@70@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> none <= permfun(x)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 4 | x@70@01 in xs@69@01 | live]
; [else-branch: 4 | !(x@70@01 in xs@69@01) | live]
(push) ; 5
; [then-branch: 4 | x@70@01 in xs@69@01]
(assert (Set_in x@70@01 xs@69@01))
; [eval] none <= permfun(x)
; [eval] permfun(x)
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(x@70@01 in xs@69@01)]
(assert (not (Set_in x@70@01 xs@69@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@70@01 xs@69@01)) (Set_in x@70@01 xs@69@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@70@01 $Ref)) (!
  (or (not (Set_in x@70@01 xs@69@01)) (Set_in x@70@01 xs@69@01))
  :pattern ((Set_in x@70@01 xs@69@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@91@10@91@57-aux|)))
(assert (forall ((x@70@01 $Ref)) (!
  (or (not (Set_in x@70@01 xs@69@01)) (Set_in x@70@01 xs@69@01))
  :pattern ((permfun<Perm> x@70@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@91@10@91@57-aux|)))
(push) ; 3
(assert (not (forall ((x@70@01 $Ref)) (!
  (=> (Set_in x@70@01 xs@69@01) (<= $Perm.No (permfun<Perm> x@70@01)))
  :pattern ((Set_in x@70@01 xs@69@01))
  :pattern ((permfun<Perm> x@70@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@91@10@91@57|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@70@01 $Ref)) (!
  (=> (Set_in x@70@01 xs@69@01) (<= $Perm.No (permfun<Perm> x@70@01)))
  :pattern ((Set_in x@70@01 xs@69@01))
  :pattern ((permfun<Perm> x@70@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0522.vpr@91@10@91@57|)))
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, permfun(x)))
(declare-const x@71@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@71@01 xs@69@01))
; [eval] permfun(x)
(pop) ; 3
(declare-const $t@72@01 $FVF<f>)
(declare-fun inv@73@01 ($Ref) $Ref)
(declare-fun img@74@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@71@01 $Ref)) (!
  (=>
    (Set_in x@71@01 xs@69@01)
    (or
      (= (permfun<Perm> x@71@01) $Perm.No)
      (< $Perm.No (permfun<Perm> x@71@01))))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@71@01 $Ref) (x2@71@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@71@01 xs@69@01) (< $Perm.No (permfun<Perm> x1@71@01)))
      (and (Set_in x2@71@01 xs@69@01) (< $Perm.No (permfun<Perm> x2@71@01)))
      (= x1@71@01 x2@71@01))
    (= x1@71@01 x2@71@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@71@01 $Ref)) (!
  (=>
    (and (Set_in x@71@01 xs@69@01) (< $Perm.No (permfun<Perm> x@71@01)))
    (and (= (inv@73@01 x@71@01) x@71@01) (img@74@01 x@71@01)))
  :pattern ((Set_in x@71@01 xs@69@01))
  :pattern ((permfun<Perm> x@71@01))
  :pattern ((inv@73@01 x@71@01))
  :pattern ((img@74@01 x@71@01))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@74@01 r)
      (and
        (Set_in (inv@73@01 r) xs@69@01)
        (< $Perm.No (permfun<Perm> (inv@73@01 r)))))
    (= (inv@73@01 r) r))
  :pattern ((inv@73@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@71@01 $Ref)) (!
  (<= $Perm.No (permfun<Perm> x@71@01))
  :pattern ((Set_in x@71@01 xs@69@01))
  :pattern ((permfun<Perm> x@71@01))
  :pattern ((inv@73@01 x@71@01))
  :pattern ((img@74@01 x@71@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@71@01 $Ref)) (!
  (<= (permfun<Perm> x@71@01) $Perm.Write)
  :pattern ((Set_in x@71@01 xs@69@01))
  :pattern ((permfun<Perm> x@71@01))
  :pattern ((inv@73@01 x@71@01))
  :pattern ((img@74@01 x@71@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@71@01 $Ref)) (!
  (=>
    (and (Set_in x@71@01 xs@69@01) (< $Perm.No (permfun<Perm> x@71@01)))
    (not (= x@71@01 $Ref.null)))
  :pattern ((Set_in x@71@01 xs@69@01))
  :pattern ((permfun<Perm> x@71@01))
  :pattern ((inv@73@01 x@71@01))
  :pattern ((img@74@01 x@71@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test31 ----------
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
; inhale (forall r: Ref :: { r.f } acc(r.f, wildcard))
(declare-const r@75@01 $Ref)
(push) ; 3
(declare-const $k@76@01 $Perm)
(assert ($Perm.isReadVar $k@76@01))
(declare-const sm@77@01 $FVF<f>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@78@01 $FVF<f>)
(declare-fun inv@79@01 ($Ref) $Ref)
(declare-fun img@80@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@76@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((r@75@01 $Ref)) (!
  (or (= $k@76@01 $Perm.No) (< $Perm.No $k@76@01))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@75@01 $Ref) (r2@75@01 $Ref)) (!
  (=> (and (< $Perm.No $k@76@01) (= r1@75@01 r2@75@01)) (= r1@75@01 r2@75@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@75@01 $Ref)) (!
  (=>
    (< $Perm.No $k@76@01)
    (and (= (inv@79@01 r@75@01) r@75@01) (img@80@01 r@75@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@78@01 r@75@01) r@75@01))
  :qid |quant-u-10|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@80@01 r) (< $Perm.No $k@76@01)) (= (inv@79@01 r) r))
  :pattern ((inv@79@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((r@75@01 $Ref)) (!
  (<= $Perm.No $k@76@01)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@78@01 r@75@01) r@75@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((r@75@01 $Ref)) (!
  (<= $k@76@01 $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@78@01 r@75@01) r@75@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((r@75@01 $Ref)) (!
  (=> (< $Perm.No $k@76@01) (not (= r@75@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@78@01 r@75@01) r@75@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@81@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (img@80@01 r) (< $Perm.No $k@76@01) false)
    (= ($FVF.lookup_f (as sm@81@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@78@01 r) r)
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@81@01  $FVF<f>) r) r)
  :pattern ((inv@79@01 r))
  :qid |quant-u-11|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test32 ----------
(declare-const r@82@01 $Ref)
(declare-const r@83@01 $Ref)
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
; inhale acc(r.f, wildcard)
(declare-const $k@84@01 $Perm)
(assert ($Perm.isReadVar $k@84@01))
(declare-const $t@85@01 Int)
(assert (<= $Perm.No $k@84@01))
(assert (<= $k@84@01 $Perm.Write))
(assert (=> (< $Perm.No $k@84@01) (not (= r@83@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test40 ----------
(declare-const x@86@01 $Ref)
(declare-const x@87@01 $Ref)
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
; inhale (forall r: Ref ::false ==> acc(r.f, none))
(declare-const r@88@01 $Ref)
(push) ; 3
(assert false)
(pop) ; 3
(declare-const $t@89@01 $FVF<f>)
(declare-fun inv@90@01 ($Ref) $Ref)
(declare-fun img@91@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.f, -1 / 2)
; [eval] -1
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
