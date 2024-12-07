(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:03
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0493b.vpr
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
(declare-sort $FVF<val> 0)
(declare-sort $PSF<one> 0)
(declare-sort $PSF<two> 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<one>To$Snap ($PSF<one>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<one> ($Snap) $PSF<one>)
(assert (forall ((x $PSF<one>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<one>($SortWrappers.$PSF<one>To$Snap x)))
    :pattern (($SortWrappers.$PSF<one>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<one>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<one>To$Snap($SortWrappers.$SnapTo$PSF<one> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<one> x))
    :qid |$Snap.$PSF<one>To$SnapTo$PSF<one>|
    )))
(declare-fun $SortWrappers.$PSF<two>To$Snap ($PSF<two>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<two> ($Snap) $PSF<two>)
(assert (forall ((x $PSF<two>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<two>($SortWrappers.$PSF<two>To$Snap x)))
    :pattern (($SortWrappers.$PSF<two>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<two>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<two>To$Snap($SortWrappers.$SnapTo$PSF<two> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<two> x))
    :qid |$Snap.$PSF<two>To$SnapTo$PSF<two>|
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
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; /predicate_snap_functions_declarations.smt2 [one: Int]
(declare-fun $PSF.domain_one ($PSF<one>) Set<$Snap>)
(declare-fun $PSF.lookup_one ($PSF<one> $Snap) Int)
(declare-fun $PSF.after_one ($PSF<one> $PSF<one>) Bool)
(declare-fun $PSF.loc_one (Int $Snap) Bool)
(declare-fun $PSF.perm_one ($PPM $Snap) $Perm)
(declare-const $psfTOP_one $PSF<one>)
; /predicate_snap_functions_declarations.smt2 [two: Int]
(declare-fun $PSF.domain_two ($PSF<two>) Set<$Snap>)
(declare-fun $PSF.lookup_two ($PSF<two> $Snap) Int)
(declare-fun $PSF.after_two ($PSF<two> $PSF<two>) Bool)
(declare-fun $PSF.loc_two (Int $Snap) Bool)
(declare-fun $PSF.perm_two ($PPM $Snap) $Perm)
(declare-const $psfTOP_two $PSF<two>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun foo_ones ($Snap Set<$Ref>) Int)
(declare-fun foo_ones%limited ($Snap Set<$Ref>) Int)
(declare-fun foo_ones%stateless (Set<$Ref>) Bool)
(declare-fun foo_ones%precondition ($Snap Set<$Ref>) Bool)
(declare-fun foo_twos ($Snap Set<$Ref> Set<Int>) Int)
(declare-fun foo_twos%limited ($Snap Set<$Ref> Set<Int>) Int)
(declare-fun foo_twos%stateless (Set<$Ref> Set<Int>) Bool)
(declare-fun foo_twos%precondition ($Snap Set<$Ref> Set<Int>) Bool)
(declare-fun foo_vals ($Snap Set<$Ref>) Int)
(declare-fun foo_vals%limited ($Snap Set<$Ref>) Int)
(declare-fun foo_vals%stateless (Set<$Ref>) Bool)
(declare-fun foo_vals%precondition ($Snap Set<$Ref>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun one%trigger ($Snap $Ref) Bool)
(declare-fun two%trigger ($Snap $Ref Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [one: Int]
(assert (forall ((vs $PSF<one>) (ws $PSF<one>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_one vs) ($PSF.domain_one ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_one vs))
            (= ($PSF.lookup_one vs x) ($PSF.lookup_one ws x)))
          :pattern (($PSF.lookup_one vs x) ($PSF.lookup_one ws x))
          :qid |qp.$PSF<one>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<one>To$Snap vs)
              ($SortWrappers.$PSF<one>To$Snap ws)
              )
    :qid |qp.$PSF<one>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_one pm s))
    :pattern (($PSF.perm_one pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_one f s) true)
    :pattern (($PSF.loc_one f s)))))
; /predicate_snap_functions_axioms.smt2 [two: Int]
(assert (forall ((vs $PSF<two>) (ws $PSF<two>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_two vs) ($PSF.domain_two ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_two vs))
            (= ($PSF.lookup_two vs x) ($PSF.lookup_two ws x)))
          :pattern (($PSF.lookup_two vs x) ($PSF.lookup_two ws x))
          :qid |qp.$PSF<two>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<two>To$Snap vs)
              ($SortWrappers.$PSF<two>To$Snap ws)
              )
    :qid |qp.$PSF<two>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_two pm s))
    :pattern (($PSF.perm_two pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_two f s) true)
    :pattern (($PSF.loc_two f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@10@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@11@00 ($Snap Set<$Ref> $Ref) Bool)
(declare-fun sm@8@00 ($Snap Set<$Ref>) $PSF<one>)
(declare-fun inv@18@00 ($Snap Set<$Ref> Set<Int> $Ref Int) $Ref)
(declare-fun inv@20@00 ($Snap Set<$Ref> Set<Int> $Ref Int) Int)
(declare-fun img@19@00 ($Snap Set<$Ref> Set<Int> $Ref Int) Bool)
(declare-fun img@21@00 ($Snap Set<$Ref> Set<Int> $Ref Int) Bool)
(declare-fun sm@16@00 ($Snap Set<$Ref> Set<Int>) $PSF<two>)
(declare-fun inv@26@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@27@00 ($Snap Set<$Ref> $Ref) Bool)
(declare-fun sm@25@00 ($Snap Set<$Ref>) $FVF<val>)
(assert (forall ((s@$ $Snap) (as@0@00 Set<$Ref>)) (!
  (= (foo_ones%limited s@$ as@0@00) (foo_ones s@$ as@0@00))
  :pattern ((foo_ones s@$ as@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (as@0@00 Set<$Ref>)) (!
  (foo_ones%stateless as@0@00)
  :pattern ((foo_ones%limited s@$ as@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (as@2@00 Set<$Ref>) (is@3@00 Set<Int>)) (!
  (= (foo_twos%limited s@$ as@2@00 is@3@00) (foo_twos s@$ as@2@00 is@3@00))
  :pattern ((foo_twos s@$ as@2@00 is@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (as@2@00 Set<$Ref>) (is@3@00 Set<Int>)) (!
  (foo_twos%stateless as@2@00 is@3@00)
  :pattern ((foo_twos%limited s@$ as@2@00 is@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (as@5@00 Set<$Ref>)) (!
  (= (foo_vals%limited s@$ as@5@00) (foo_vals s@$ as@5@00))
  :pattern ((foo_vals s@$ as@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (as@5@00 Set<$Ref>)) (!
  (foo_vals%stateless as@5@00)
  :pattern ((foo_vals%limited s@$ as@5@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test_vals ----------
(declare-const as@0@01 Set<$Ref>)
(declare-const as@1@01 Set<$Ref>)
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
; inhale (forall a: Ref :: { a.val } (a in as) ==> acc(a.val, write))
(declare-const a@2@01 $Ref)
(push) ; 3
; [eval] (a in as)
(assert (Set_in a@2@01 as@1@01))
(declare-const sm@3@01 $FVF<val>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@4@01 $FVF<val>)
(declare-fun inv@5@01 ($Ref) $Ref)
(declare-fun img@6@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@2@01 $Ref) (a2@2@01 $Ref)) (!
  (=>
    (and (Set_in a1@2@01 as@1@01) (Set_in a2@2@01 as@1@01) (= a1@2@01 a2@2@01))
    (= a1@2@01 a2@2@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@2@01 $Ref)) (!
  (=>
    (Set_in a@2@01 as@1@01)
    (and (= (inv@5@01 a@2@01) a@2@01) (img@6@01 a@2@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@4@01 a@2@01) a@2@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)) (= (inv@5@01 r) r))
  :pattern ((inv@5@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((a@2@01 $Ref)) (!
  (=> (Set_in a@2@01 as@1@01) (not (= a@2@01 $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@4@01 a@2@01) a@2@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@7@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01))
    (= ($FVF.lookup_val (as sm@7@01  $FVF<val>) r) ($FVF.lookup_val $t@4@01 r)))
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@4@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@4@01 r) r)
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@5@01 r) as@1@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@7@01  $FVF<val>) r) r))
  :pattern ((inv@5@01 r))
  :qid |quant-u-17|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale foo_vals(as) == 0
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] foo_vals(as) == 0
; [eval] foo_vals(as)
(set-option :timeout 0)
(push) ; 3
(declare-const a@9@01 $Ref)
(push) ; 4
; [eval] (a in as)
(assert (Set_in a@9@01 as@1@01))
(pop) ; 4
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@9@01 $Ref) (a2@9@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@9@01 as@1@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@7@01  $FVF<val>) a1@9@01) a1@9@01))
      (and
        (Set_in a2@9@01 as@1@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@7@01  $FVF<val>) a2@9@01) a2@9@01))
      (= a1@9@01 a2@9@01))
    (= a1@9@01 a2@9@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@9@01 $Ref)) (!
  (=>
    (Set_in a@9@01 as@1@01)
    (and (= (inv@10@01 a@9@01) a@9@01) (img@11@01 a@9@01)))
  :pattern ((Set_in a@9@01 as@1@01))
  :pattern ((inv@10@01 a@9@01))
  :pattern ((img@11@01 a@9@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@11@01 r) (Set_in (inv@10@01 r) as@1@01)) (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@10@01 r) as@1@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@7@01  $FVF<val>) r) r))
  :pattern ((inv@10@01 r))
  :qid |quant-u-19|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@12@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@10@01 r) as@1@01) (img@11@01 r) (= r (inv@10@01 r)))
    ($Perm.min
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)) $Perm.Write $Perm.No)
      (pTaken@12@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
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
    (and (Set_in (inv@10@01 r) as@1@01) (img@11@01 r) (= r (inv@10@01 r)))
    (= (- $Perm.Write (pTaken@12@01 r)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@13@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@13@01  $FVF<val>)))
      (and (Set_in (inv@10@01 r) as@1@01) (img@11@01 r)))
    (=>
      (and (Set_in (inv@10@01 r) as@1@01) (img@11@01 r))
      (Set_in r ($FVF.domain_val (as sm@13@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@13@01  $FVF<val>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@10@01 r) as@1@01) (img@11@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)))
    (= ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) ($FVF.lookup_val $t@4@01 r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@4@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@4@01 r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (foo_vals%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@13@01  $FVF<val>)) as@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((a@9@01 $Ref)) (!
  (=>
    (Set_in a@9@01 as@1@01)
    (and (= (inv@10@01 a@9@01) a@9@01) (img@11@01 a@9@01)))
  :pattern ((Set_in a@9@01 as@1@01))
  :pattern ((inv@10@01 a@9@01))
  :pattern ((img@11@01 a@9@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@11@01 r) (Set_in (inv@10@01 r) as@1@01)) (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@13@01  $FVF<val>)))
      (and (Set_in (inv@10@01 r) as@1@01) (img@11@01 r)))
    (=>
      (and (Set_in (inv@10@01 r) as@1@01) (img@11@01 r))
      (Set_in r ($FVF.domain_val (as sm@13@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@13@01  $FVF<val>))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@10@01 r) as@1@01) (img@11@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)))
    (= ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) ($FVF.lookup_val $t@4@01 r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@4@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@4@01 r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@10@01 r) as@1@01)
      ($FVF.loc_val ($FVF.lookup_val (as sm@7@01  $FVF<val>) r) r))
    :pattern ((inv@10@01 r))
    :qid |quant-u-19|))
  (foo_vals%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@13@01  $FVF<val>)) as@1@01)))
(assert (=
  (foo_vals ($SortWrappers.$FVF<val>To$Snap (as sm@13@01  $FVF<val>)) as@1@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale foo_vals(as) == 0
; [eval] foo_vals(as) == 0
; [eval] foo_vals(as)
(set-option :timeout 0)
(push) ; 3
(declare-const a@14@01 $Ref)
(push) ; 4
; [eval] (a in as)
(assert (Set_in a@14@01 as@1@01))
(pop) ; 4
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@17@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01))
    (= ($FVF.lookup_val (as sm@17@01  $FVF<val>) r) ($FVF.lookup_val $t@4@01 r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@4@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@4@01 r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@14@01 $Ref) (a2@14@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@14@01 as@1@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) a1@14@01) a1@14@01))
      (and
        (Set_in a2@14@01 as@1@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) a2@14@01) a2@14@01))
      (= a1@14@01 a2@14@01))
    (= a1@14@01 a2@14@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@14@01 $Ref)) (!
  (=>
    (Set_in a@14@01 as@1@01)
    (and (= (inv@15@01 a@14@01) a@14@01) (img@16@01 a@14@01)))
  :pattern ((Set_in a@14@01 as@1@01))
  :pattern ((inv@15@01 a@14@01))
  :pattern ((img@16@01 a@14@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) as@1@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@15@01 r) as@1@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) r) r))
  :pattern ((inv@15@01 r))
  :qid |quant-u-24|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@15@01 r) as@1@01) (img@16@01 r) (= r (inv@15@01 r)))
    ($Perm.min
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)) $Perm.Write $Perm.No)
      (pTaken@18@01 r))
    $Perm.No)
  
  :qid |quant-u-26|))))
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
    (and (Set_in (inv@15@01 r) as@1@01) (img@16@01 r) (= r (inv@15@01 r)))
    (= (- $Perm.Write (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))
      (and (Set_in (inv@15@01 r) as@1@01) (img@16@01 r)))
    (=>
      (and (Set_in (inv@15@01 r) as@1@01) (img@16@01 r))
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>))))
  :qid |qp.fvfDomDef10|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@15@01 r) as@1@01) (img@16@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)))
    (= ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) ($FVF.lookup_val $t@4@01 r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@4@01 r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@4@01 r) r)
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (foo_vals%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) as@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01))
    (= ($FVF.lookup_val (as sm@17@01  $FVF<val>) r) ($FVF.lookup_val $t@4@01 r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@4@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@4@01 r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (forall ((a@14@01 $Ref)) (!
  (=>
    (Set_in a@14@01 as@1@01)
    (and (= (inv@15@01 a@14@01) a@14@01) (img@16@01 a@14@01)))
  :pattern ((Set_in a@14@01 as@1@01))
  :pattern ((inv@15@01 a@14@01))
  :pattern ((img@16@01 a@14@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) as@1@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))
      (and (Set_in (inv@15@01 r) as@1@01) (img@16@01 r)))
    (=>
      (and (Set_in (inv@15@01 r) as@1@01) (img@16@01 r))
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>))))
  :qid |qp.fvfDomDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@15@01 r) as@1@01) (img@16@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) as@1@01)))
    (= ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) ($FVF.lookup_val $t@4@01 r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@4@01 r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@4@01 r) r)
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@15@01 r) as@1@01)
      ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) r) r))
    :pattern ((inv@15@01 r))
    :qid |quant-u-24|))
  (foo_vals%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) as@1@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (foo_vals ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) as@1@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (foo_vals ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) as@1@01)
  0))
(pop) ; 2
(pop) ; 1
; ---------- test_vals_2 ----------
(declare-const as@20@01 Set<$Ref>)
(declare-const bs@21@01 Set<$Ref>)
(declare-const as@22@01 Set<$Ref>)
(declare-const bs@23@01 Set<$Ref>)
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
; var a1: Ref
(declare-const a1@24@01 $Ref)
; [exec]
; var b1: Ref
(declare-const b1@25@01 $Ref)
; [exec]
; inhale (forall a: Ref :: { a.val } (a in as) ==> acc(a.val, write)) &&
;   (forall a$0: Ref :: { a$0.val } (a$0 in bs) ==> acc(a$0.val, write))
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(declare-const a@27@01 $Ref)
(push) ; 3
; [eval] (a in as)
(assert (Set_in a@27@01 as@22@01))
(declare-const sm@28@01 $FVF<val>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@29@01 ($Ref) $Ref)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@27@01 $Ref) (a2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@27@01 as@22@01)
      (Set_in a2@27@01 as@22@01)
      (= a1@27@01 a2@27@01))
    (= a1@27@01 a2@27@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@27@01 $Ref)) (!
  (=>
    (Set_in a@27@01 as@22@01)
    (and (= (inv@29@01 a@27@01) a@27@01) (img@30@01 a@27@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) a@27@01) a@27@01))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01)) (= (inv@29@01 r) r))
  :pattern ((inv@29@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((a@27@01 $Ref)) (!
  (=> (Set_in a@27@01 as@22@01) (not (= a@27@01 $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) a@27@01) a@27@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@31@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
    (=
      ($FVF.lookup_val (as sm@31@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@29@01 r) as@22@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) r) r))
  :pattern ((inv@29@01 r))
  :qid |quant-u-30|)))
(declare-const a$0@32@01 $Ref)
(push) ; 3
; [eval] (a$0 in bs)
(assert (Set_in a$0@32@01 bs@23@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a$01@32@01 $Ref) (a$02@32@01 $Ref)) (!
  (=>
    (and
      (Set_in a$01@32@01 bs@23@01)
      (Set_in a$02@32@01 bs@23@01)
      (= a$01@32@01 a$02@32@01))
    (= a$01@32@01 a$02@32@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a$0@32@01 $Ref)) (!
  (=>
    (Set_in a$0@32@01 bs@23@01)
    (and (= (inv@33@01 a$0@32@01) a$0@32@01) (img@34@01 a$0@32@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) a$0@32@01) a$0@32@01))
  :qid |quant-u-32|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((a$0@32@01 $Ref)) (!
  (=> (Set_in a$0@32@01 bs@23@01) (not (= a$0@32@01 $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) a$0@32@01) a$0@32@01))
  :qid |val-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= a$0@32@01 a@27@01)
    (=
      (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@35@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@33@01 r) bs@23@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) r) r))
  :pattern ((inv@33@01 r))
  :qid |quant-u-34|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale foo_vals(as) == 0
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] foo_vals(as) == 0
; [eval] foo_vals(as)
(set-option :timeout 0)
(push) ; 3
(declare-const a@37@01 $Ref)
(push) ; 4
; [eval] (a in as)
(assert (Set_in a@37@01 as@22@01))
(pop) ; 4
(declare-fun inv@38@01 ($Ref) $Ref)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@37@01 $Ref) (a2@37@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@37@01 as@22@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) a1@37@01) a1@37@01))
      (and
        (Set_in a2@37@01 as@22@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) a2@37@01) a2@37@01))
      (= a1@37@01 a2@37@01))
    (= a1@37@01 a2@37@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@37@01 $Ref)) (!
  (=>
    (Set_in a@37@01 as@22@01)
    (and (= (inv@38@01 a@37@01) a@37@01) (img@39@01 a@37@01)))
  :pattern ((Set_in a@37@01 as@22@01))
  :pattern ((inv@38@01 a@37@01))
  :pattern ((img@39@01 a@37@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@39@01 r) (Set_in (inv@38@01 r) as@22@01)) (= (inv@38@01 r) r))
  :pattern ((inv@38@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@38@01 r) as@22@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) r) r))
  :pattern ((inv@38@01 r))
  :qid |quant-u-36|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r) (= r (inv@38@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r) (= r (inv@38@01 r)))
    ($Perm.min
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@40@01 r)))
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
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        $Perm.Write
        $Perm.No)
      (pTaken@40@01 r))
    $Perm.No)
  
  :qid |quant-u-38|))))
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
    (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r) (= r (inv@38@01 r)))
    (= (- $Perm.Write (pTaken@40@01 r)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@42@01  $FVF<val>)))
      (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r)))
    (=>
      (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r))
      (Set_in r ($FVF.domain_val (as sm@42@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@42@01  $FVF<val>))))
  :qid |qp.fvfDomDef20|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01)))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r))
      (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01)))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef19|)))
(assert (foo_vals%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@42@01  $FVF<val>)) as@22@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((a@37@01 $Ref)) (!
  (=>
    (Set_in a@37@01 as@22@01)
    (and (= (inv@38@01 a@37@01) a@37@01) (img@39@01 a@37@01)))
  :pattern ((Set_in a@37@01 as@22@01))
  :pattern ((inv@38@01 a@37@01))
  :pattern ((img@39@01 a@37@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@39@01 r) (Set_in (inv@38@01 r) as@22@01)) (= (inv@38@01 r) r))
  :pattern ((inv@38@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@42@01  $FVF<val>)))
      (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r)))
    (=>
      (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r))
      (Set_in r ($FVF.domain_val (as sm@42@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@42@01  $FVF<val>))))
  :qid |qp.fvfDomDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01)))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@38@01 r) as@22@01) (img@39@01 r))
      (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01)))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef19|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@38@01 r) as@22@01)
      ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) r) r))
    :pattern ((inv@38@01 r))
    :qid |quant-u-36|))
  (foo_vals%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@42@01  $FVF<val>)) as@22@01)))
(assert (=
  (foo_vals ($SortWrappers.$FVF<val>To$Snap (as sm@42@01  $FVF<val>)) as@22@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (a1 in as)
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 $Snap.unit))
; [eval] (a1 in as)
(assert (Set_in a1@24@01 as@22@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a1.val := 1 + a1.val - 1
; [eval] 1 + a1.val - 1
; [eval] 1 + a1.val
(declare-const sm@44@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
    (=
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
    (=
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef23|)))
(declare-const pm@45@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@45@01  $FPM) r)
    (+
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@45@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r))
  :pattern (($FVF.perm_val (as pm@45@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) a1@24@01) a1@24@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_val (as pm@45@01  $FPM) a1@24@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (= r a1@24@01)
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@47@01 ((r $Ref)) $Perm
  (ite
    (= r a1@24@01)
    ($Perm.min
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@46@01 r)))
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
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        $Perm.Write
        $Perm.No)
      (pTaken@46@01 r))
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
  (= (pTaken@46@01 r) $Perm.No)
  
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
  (=> (= r a1@24@01) (= (- $Perm.Write (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@48@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@48@01  $FVF<val>) a1@24@01)
  (- (+ 1 ($FVF.lookup_val (as sm@44@01  $FVF<val>) a1@24@01)) 1)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) a1@24@01) a1@24@01))
; [exec]
; inhale (b1 in bs)
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 $Snap.unit))
; [eval] (b1 in bs)
(assert (Set_in b1@25@01 bs@23@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; b1.val := 1
(declare-const sm@50@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r a1@24@01)
    (=
      ($FVF.lookup_val (as sm@50@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@50@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
    (=
      ($FVF.lookup_val (as sm@50@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@50@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
      (< $Perm.No (- $Perm.Write (pTaken@46@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@50@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@50@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@50@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef29|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@50@01  $FVF<val>) b1@25@01) b1@25@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a1@24@01 b1@25@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (= r b1@25@01)
    ($Perm.min
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@52@01 ((r $Ref)) $Perm
  (ite
    (= r b1@25@01)
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        (- $Perm.Write (pTaken@46@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@51@01 r)))
    $Perm.No))
(define-fun pTaken@53@01 ((r $Ref)) $Perm
  (ite
    (= r b1@25@01)
    ($Perm.min
      (ite (= r a1@24@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@51@01 r)) (pTaken@52@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        $Perm.Write
        $Perm.No)
      (pTaken@51@01 r))
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
  (= (pTaken@51@01 r) $Perm.No)
  
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
  (=> (= r b1@25@01) (= (- $Perm.Write (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@54@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@54@01  $FVF<val>) b1@25@01) 1))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) b1@25@01) b1@25@01))
; [exec]
; exhale (forall a$1: Ref :: { a$1.val } (a$1 in bs) ==> acc(a$1.val, write))
(declare-const a$1@55@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (a$1 in bs)
(assert (Set_in a$1@55@01 bs@23@01))
(declare-const sm@56@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b1@25@01)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r a1@24@01)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
      (< $Perm.No (- $Perm.Write (pTaken@46@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
      (< $Perm.No (- $Perm.Write (pTaken@51@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef34|)))
(pop) ; 3
(declare-fun inv@57@01 ($Ref) $Ref)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (= r b1@25@01)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r a1@24@01)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
      (< $Perm.No (- $Perm.Write (pTaken@46@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
      (< $Perm.No (- $Perm.Write (pTaken@51@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef34|)))
; Nested auxiliary terms: non-globals
(declare-const sm@59@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b1@25@01)
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r a1@24@01)
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
      (< $Perm.No (- $Perm.Write (pTaken@46@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
      (< $Perm.No (- $Perm.Write (pTaken@51@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef39|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a$11@55@01 $Ref) (a$12@55@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a$11@55@01 bs@23@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) a$11@55@01) a$11@55@01))
      (and
        (Set_in a$12@55@01 bs@23@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) a$12@55@01) a$12@55@01))
      (= a$11@55@01 a$12@55@01))
    (= a$11@55@01 a$12@55@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a$1@55@01 $Ref)) (!
  (=>
    (Set_in a$1@55@01 bs@23@01)
    (and (= (inv@57@01 a$1@55@01) a$1@55@01) (img@58@01 a$1@55@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@56@01  $FVF<val>) a$1@55@01) a$1@55@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@58@01 r) (Set_in (inv@57@01 r) bs@23@01)) (= (inv@57@01 r) r))
  :pattern ((inv@57@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@57@01 r) bs@23@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) r) r))
  :pattern ((inv@57@01 r))
  :qid |quant-u-49|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@57@01 r) bs@23@01) (img@58@01 r) (= r (inv@57@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        (- $Perm.Write (pTaken@46@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@57@01 r) bs@23@01) (img@58@01 r) (= r (inv@57@01 r)))
    ($Perm.min
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        (- $Perm.Write (pTaken@51@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@60@01 r)))
    $Perm.No))
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@57@01 r) bs@23@01) (img@58@01 r) (= r (inv@57@01 r)))
    ($Perm.min
      (ite (= r b1@25@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)))
    $Perm.No))
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@57@01 r) bs@23@01) (img@58@01 r) (= r (inv@57@01 r)))
    ($Perm.min
      (ite (= r a1@24@01) $Perm.Write $Perm.No)
      (- (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)) (pTaken@62@01 r)))
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
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        (- $Perm.Write (pTaken@46@01 r))
        $Perm.No)
      (pTaken@60@01 r))
    $Perm.No)
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@60@01 r) $Perm.No)
  
  :qid |quant-u-52|))))
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
    (and (Set_in (inv@57@01 r) bs@23@01) (img@58@01 r) (= r (inv@57@01 r)))
    (= (- $Perm.Write (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        (- $Perm.Write (pTaken@51@01 r))
        $Perm.No)
      (pTaken@61@01 r))
    $Perm.No)
  
  :qid |quant-u-54|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@61@01 r) $Perm.No)
  
  :qid |quant-u-55|))))
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
    (and (Set_in (inv@57@01 r) bs@23@01) (img@58@01 r) (= r (inv@57@01 r)))
    (= (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)) $Perm.No))
  
  :qid |quant-u-56|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@62@01 b1@25@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@62@01 r) $Perm.No)
  
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
    (and (Set_in (inv@57@01 r) bs@23@01) (img@58@01 r) (= r (inv@57@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)) (pTaken@62@01 r))
      $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; exhale foo_vals(as) == 0
; [eval] foo_vals(as) == 0
; [eval] foo_vals(as)
(set-option :timeout 0)
(push) ; 3
(declare-const a@64@01 $Ref)
(push) ; 4
; [eval] (a in as)
(assert (Set_in a@64@01 as@22@01))
(pop) ; 4
(declare-fun inv@65@01 ($Ref) $Ref)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@67@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r a1@24@01)
    (=
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r b1@25@01) (< $Perm.No (- $Perm.Write (pTaken@62@01 r))) false)
    (=
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@51@01 r)) (pTaken@61@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@46@01 r)) (pTaken@60@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef44|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@64@01 $Ref) (a2@64@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@64@01 as@22@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@67@01  $FVF<val>) a1@64@01) a1@64@01))
      (and
        (Set_in a2@64@01 as@22@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@67@01  $FVF<val>) a2@64@01) a2@64@01))
      (= a1@64@01 a2@64@01))
    (= a1@64@01 a2@64@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@64@01 $Ref)) (!
  (=>
    (Set_in a@64@01 as@22@01)
    (and (= (inv@65@01 a@64@01) a@64@01) (img@66@01 a@64@01)))
  :pattern ((Set_in a@64@01 as@22@01))
  :pattern ((inv@65@01 a@64@01))
  :pattern ((img@66@01 a@64@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) as@22@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@65@01 r) as@22@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@67@01  $FVF<val>) r) r))
  :pattern ((inv@65@01 r))
  :qid |quant-u-61|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r) (= r (inv@65@01 r)))
    ($Perm.min
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        (- (- $Perm.Write (pTaken@51@01 r)) (pTaken@61@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r) (= r (inv@65@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        (- (- $Perm.Write (pTaken@46@01 r)) (pTaken@60@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@68@01 r)))
    $Perm.No))
(define-fun pTaken@70@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r) (= r (inv@65@01 r)))
    ($Perm.min
      (ite (= r a1@24@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r)))
    $Perm.No))
(define-fun pTaken@71@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r) (= r (inv@65@01 r)))
    ($Perm.min
      (ite (= r b1@25@01) (- $Perm.Write (pTaken@62@01 r)) $Perm.No)
      (- (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r)) (pTaken@70@01 r)))
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
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        (- (- $Perm.Write (pTaken@51@01 r)) (pTaken@61@01 r))
        $Perm.No)
      (pTaken@68@01 r))
    $Perm.No)
  
  :qid |quant-u-63|))))
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
    (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r) (= r (inv@65@01 r)))
    (= (- $Perm.Write (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        (- (- $Perm.Write (pTaken@46@01 r)) (pTaken@60@01 r))
        $Perm.No)
      (pTaken@69@01 r))
    $Perm.No)
  
  :qid |quant-u-65|))))
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
    (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r) (= r (inv@65@01 r)))
    (= (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@70@01 a1@24@01)) $Perm.No)))
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
    (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r) (= r (inv@65@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r)) (pTaken@70@01 r))
      $Perm.No))
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- (- $Perm.Write (pTaken@62@01 b1@25@01)) (pTaken@71@01 b1@25@01)) $Perm.No)))
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
    (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r) (= r (inv@65@01 r)))
    (=
      (-
        (-
          (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r))
          (pTaken@70@01 r))
        (pTaken@71@01 r))
      $Perm.No))
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@72@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>)))
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r)))
    (=>
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r))
      (Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>))))
  :qid |qp.fvfDomDef50|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r)) (= r a1@24@01))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r))
      (ite (= r b1@25@01) (< $Perm.No (- $Perm.Write (pTaken@62@01 r))) false))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r))
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@51@01 r)) (pTaken@61@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r))
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@46@01 r)) (pTaken@60@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef49|)))
(assert (foo_vals%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@72@01  $FVF<val>)) as@22@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r a1@24@01)
    (=
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r b1@25@01) (< $Perm.No (- $Perm.Write (pTaken@62@01 r))) false)
    (=
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@51@01 r)) (pTaken@61@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@46@01 r)) (pTaken@60@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef44|)))
(assert (forall ((a@64@01 $Ref)) (!
  (=>
    (Set_in a@64@01 as@22@01)
    (and (= (inv@65@01 a@64@01) a@64@01) (img@66@01 a@64@01)))
  :pattern ((Set_in a@64@01 as@22@01))
  :pattern ((inv@65@01 a@64@01))
  :pattern ((img@66@01 a@64@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) as@22@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>)))
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r)))
    (=>
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r))
      (Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>))))
  :qid |qp.fvfDomDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r)) (= r a1@24@01))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r))
      (ite (= r b1@25@01) (< $Perm.No (- $Perm.Write (pTaken@62@01 r))) false))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r))
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) bs@23@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@51@01 r)) (pTaken@61@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) as@22@01) (img@66@01 r))
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) as@22@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@46@01 r)) (pTaken@60@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@26@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@26@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef49|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@65@01 r) as@22@01)
      ($FVF.loc_val ($FVF.lookup_val (as sm@67@01  $FVF<val>) r) r))
    :pattern ((inv@65@01 r))
    :qid |quant-u-61|))
  (foo_vals%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@72@01  $FVF<val>)) as@22@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (foo_vals ($SortWrappers.$FVF<val>To$Snap (as sm@72@01  $FVF<val>)) as@22@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (foo_vals ($SortWrappers.$FVF<val>To$Snap (as sm@72@01  $FVF<val>)) as@22@01)
  0))
(pop) ; 2
(pop) ; 1
; ---------- test_ones ----------
(declare-const as@73@01 Set<$Ref>)
(declare-const as@74@01 Set<$Ref>)
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
; inhale (forall a: Ref :: { one(a) } (a in as) ==> acc(one(a), write))
(declare-const a@75@01 $Ref)
(push) ; 3
; [eval] (a in as)
(assert (Set_in a@75@01 as@74@01))
(declare-const sm@76@01 $PSF<one>)
(declare-const s@77@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@78@01 $PSF<one>)
(declare-fun inv@79@01 ($Ref) $Ref)
(declare-fun img@80@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@75@01 $Ref) (a2@75@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@75@01 as@74@01)
      (Set_in a2@75@01 as@74@01)
      (= a1@75@01 a2@75@01))
    (= a1@75@01 a2@75@01))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@75@01 $Ref)) (!
  (=>
    (Set_in a@75@01 as@74@01)
    (and (= (inv@79@01 a@75@01) a@75@01) (img@80@01 a@75@01)))
  :pattern (($PSF.loc_one ($PSF.lookup_one $t@78@01 ($SortWrappers.$RefTo$Snap a@75@01)) ($SortWrappers.$RefTo$Snap a@75@01)))
  :qid |quant-u-72|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@80@01 a) (Set_in (inv@79@01 a) as@74@01)) (= (inv@79@01 a) a))
  :pattern ((inv@79@01 a))
  :qid |one-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@81@01 $PSF<one>)
(declare-const s@82@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@82@01 $Snap)) (!
  (=>
    (and
      (img@80@01 ($SortWrappers.$SnapTo$Ref s@82@01))
      (Set_in (inv@79@01 ($SortWrappers.$SnapTo$Ref s@82@01)) as@74@01))
    (and
      (not (= s@82@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@81@01  $PSF<one>) s@82@01)
        ($PSF.lookup_one $t@78@01 s@82@01))))
  :pattern (($PSF.lookup_one (as sm@81@01  $PSF<one>) s@82@01))
  :pattern (($PSF.lookup_one $t@78@01 s@82@01))
  :qid |qp.psmValDef52|)))
(assert (forall ((s@82@01 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one $t@78@01 s@82@01) s@82@01)
  :pattern (($PSF.lookup_one (as sm@81@01  $PSF<one>) s@82@01))
  :qid |qp.psmResTrgDef53|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@79@01 a) as@74@01)
    ($PSF.loc_one ($PSF.lookup_one (as sm@81@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@79@01 a))
  :qid |quant-u-73|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale foo_ones(as) == 0
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 $Snap.unit))
; [eval] foo_ones(as) == 0
; [eval] foo_ones(as)
(set-option :timeout 0)
(push) ; 3
(declare-const a@84@01 $Ref)
(push) ; 4
; [eval] (a in as)
(assert (Set_in a@84@01 as@74@01))
(pop) ; 4
(declare-fun inv@85@01 ($Ref) $Ref)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@84@01 $Ref) (a2@84@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@84@01 as@74@01)
        ($PSF.loc_one ($PSF.lookup_one (as sm@81@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@84@01)) ($SortWrappers.$RefTo$Snap a1@84@01)))
      (and
        (Set_in a2@84@01 as@74@01)
        ($PSF.loc_one ($PSF.lookup_one (as sm@81@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a2@84@01)) ($SortWrappers.$RefTo$Snap a2@84@01)))
      (= a1@84@01 a2@84@01))
    (= a1@84@01 a2@84@01))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@84@01 $Ref)) (!
  (=>
    (Set_in a@84@01 as@74@01)
    (and (= (inv@85@01 a@84@01) a@84@01) (img@86@01 a@84@01)))
  :pattern ((Set_in a@84@01 as@74@01))
  :pattern ((inv@85@01 a@84@01))
  :pattern ((img@86@01 a@84@01))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@86@01 a) (Set_in (inv@85@01 a) as@74@01)) (= (inv@85@01 a) a))
  :pattern ((inv@85@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@85@01 a) as@74@01)
    ($PSF.loc_one ($PSF.lookup_one (as sm@81@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@85@01 a))
  :qid |quant-u-75|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@87@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@85@01 a) as@74@01) (img@86@01 a) (= a (inv@85@01 a)))
    ($Perm.min
      (ite
        (and (img@80@01 a) (Set_in (inv@79@01 a) as@74@01))
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
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 a) (Set_in (inv@79@01 a) as@74@01))
        $Perm.Write
        $Perm.No)
      (pTaken@87@01 a))
    $Perm.No)
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Set_in (inv@85@01 a) as@74@01) (img@86@01 a) (= a (inv@85@01 a)))
    (= (- $Perm.Write (pTaken@87@01 a)) $Perm.No))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@88@01 $PSF<one>)
(declare-const s@89@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@89@01 $Snap)) (!
  (and
    (=>
      (Set_in s@89@01 ($PSF.domain_one (as sm@88@01  $PSF<one>)))
      (and
        (Set_in (inv@85@01 ($SortWrappers.$SnapTo$Ref s@89@01)) as@74@01)
        (img@86@01 ($SortWrappers.$SnapTo$Ref s@89@01))))
    (=>
      (and
        (Set_in (inv@85@01 ($SortWrappers.$SnapTo$Ref s@89@01)) as@74@01)
        (img@86@01 ($SortWrappers.$SnapTo$Ref s@89@01)))
      (Set_in s@89@01 ($PSF.domain_one (as sm@88@01  $PSF<one>)))))
  :pattern ((Set_in s@89@01 ($PSF.domain_one (as sm@88@01  $PSF<one>))))
  :qid |qp.psmDomDef56|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@89@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@85@01 ($SortWrappers.$SnapTo$Ref s@89@01)) as@74@01)
        (img@86@01 ($SortWrappers.$SnapTo$Ref s@89@01)))
      (and
        (img@80@01 ($SortWrappers.$SnapTo$Ref s@89@01))
        (Set_in (inv@79@01 ($SortWrappers.$SnapTo$Ref s@89@01)) as@74@01)))
    (and
      (not (= s@89@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@88@01  $PSF<one>) s@89@01)
        ($PSF.lookup_one $t@78@01 s@89@01))))
  :pattern (($PSF.lookup_one (as sm@88@01  $PSF<one>) s@89@01))
  :pattern (($PSF.lookup_one $t@78@01 s@89@01))
  :qid |qp.psmValDef54|)))
(assert (forall ((s@89@01 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one $t@78@01 s@89@01) s@89@01)
  :pattern (($PSF.lookup_one (as sm@88@01  $PSF<one>) s@89@01))
  :qid |qp.psmResTrgDef55|)))
(assert (foo_ones%precondition ($SortWrappers.$PSF<one>To$Snap (as sm@88@01  $PSF<one>)) as@74@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((a@84@01 $Ref)) (!
  (=>
    (Set_in a@84@01 as@74@01)
    (and (= (inv@85@01 a@84@01) a@84@01) (img@86@01 a@84@01)))
  :pattern ((Set_in a@84@01 as@74@01))
  :pattern ((inv@85@01 a@84@01))
  :pattern ((img@86@01 a@84@01))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@86@01 a) (Set_in (inv@85@01 a) as@74@01)) (= (inv@85@01 a) a))
  :pattern ((inv@85@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((s@89@01 $Snap)) (!
  (and
    (=>
      (Set_in s@89@01 ($PSF.domain_one (as sm@88@01  $PSF<one>)))
      (and
        (Set_in (inv@85@01 ($SortWrappers.$SnapTo$Ref s@89@01)) as@74@01)
        (img@86@01 ($SortWrappers.$SnapTo$Ref s@89@01))))
    (=>
      (and
        (Set_in (inv@85@01 ($SortWrappers.$SnapTo$Ref s@89@01)) as@74@01)
        (img@86@01 ($SortWrappers.$SnapTo$Ref s@89@01)))
      (Set_in s@89@01 ($PSF.domain_one (as sm@88@01  $PSF<one>)))))
  :pattern ((Set_in s@89@01 ($PSF.domain_one (as sm@88@01  $PSF<one>))))
  :qid |qp.psmDomDef56|)))
(assert (forall ((s@89@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@85@01 ($SortWrappers.$SnapTo$Ref s@89@01)) as@74@01)
        (img@86@01 ($SortWrappers.$SnapTo$Ref s@89@01)))
      (and
        (img@80@01 ($SortWrappers.$SnapTo$Ref s@89@01))
        (Set_in (inv@79@01 ($SortWrappers.$SnapTo$Ref s@89@01)) as@74@01)))
    (and
      (not (= s@89@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@88@01  $PSF<one>) s@89@01)
        ($PSF.lookup_one $t@78@01 s@89@01))))
  :pattern (($PSF.lookup_one (as sm@88@01  $PSF<one>) s@89@01))
  :pattern (($PSF.lookup_one $t@78@01 s@89@01))
  :qid |qp.psmValDef54|)))
(assert (forall ((s@89@01 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one $t@78@01 s@89@01) s@89@01)
  :pattern (($PSF.lookup_one (as sm@88@01  $PSF<one>) s@89@01))
  :qid |qp.psmResTrgDef55|)))
(assert (and
  (forall ((a $Ref)) (!
    (=>
      (Set_in (inv@85@01 a) as@74@01)
      ($PSF.loc_one ($PSF.lookup_one (as sm@81@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
    :pattern ((inv@85@01 a))
    :qid |quant-u-75|))
  (foo_ones%precondition ($SortWrappers.$PSF<one>To$Snap (as sm@88@01  $PSF<one>)) as@74@01)))
(assert (=
  (foo_ones ($SortWrappers.$PSF<one>To$Snap (as sm@88@01  $PSF<one>)) as@74@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale foo_ones(as) == 0
; [eval] foo_ones(as) == 0
; [eval] foo_ones(as)
(set-option :timeout 0)
(push) ; 3
(declare-const a@90@01 $Ref)
(push) ; 4
; [eval] (a in as)
(assert (Set_in a@90@01 as@74@01))
(pop) ; 4
(declare-fun inv@91@01 ($Ref) $Ref)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@93@01 $PSF<one>)
(declare-const s@94@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@94@01 $Snap)) (!
  (=>
    (and
      (img@80@01 ($SortWrappers.$SnapTo$Ref s@94@01))
      (Set_in (inv@79@01 ($SortWrappers.$SnapTo$Ref s@94@01)) as@74@01))
    (and
      (not (= s@94@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@93@01  $PSF<one>) s@94@01)
        ($PSF.lookup_one $t@78@01 s@94@01))))
  :pattern (($PSF.lookup_one (as sm@93@01  $PSF<one>) s@94@01))
  :pattern (($PSF.lookup_one $t@78@01 s@94@01))
  :qid |qp.psmValDef57|)))
(assert (forall ((s@94@01 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one $t@78@01 s@94@01) s@94@01)
  :pattern (($PSF.lookup_one (as sm@93@01  $PSF<one>) s@94@01))
  :qid |qp.psmResTrgDef58|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@90@01 $Ref) (a2@90@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@90@01 as@74@01)
        ($PSF.loc_one ($PSF.lookup_one (as sm@93@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@90@01)) ($SortWrappers.$RefTo$Snap a1@90@01)))
      (and
        (Set_in a2@90@01 as@74@01)
        ($PSF.loc_one ($PSF.lookup_one (as sm@93@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a2@90@01)) ($SortWrappers.$RefTo$Snap a2@90@01)))
      (= a1@90@01 a2@90@01))
    (= a1@90@01 a2@90@01))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@90@01 $Ref)) (!
  (=>
    (Set_in a@90@01 as@74@01)
    (and (= (inv@91@01 a@90@01) a@90@01) (img@92@01 a@90@01)))
  :pattern ((Set_in a@90@01 as@74@01))
  :pattern ((inv@91@01 a@90@01))
  :pattern ((img@92@01 a@90@01))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@92@01 a) (Set_in (inv@91@01 a) as@74@01)) (= (inv@91@01 a) a))
  :pattern ((inv@91@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@91@01 a) as@74@01)
    ($PSF.loc_one ($PSF.lookup_one (as sm@93@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@91@01 a))
  :qid |quant-u-80|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@95@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@91@01 a) as@74@01) (img@92@01 a) (= a (inv@91@01 a)))
    ($Perm.min
      (ite
        (and (img@80@01 a) (Set_in (inv@79@01 a) as@74@01))
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
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 a) (Set_in (inv@79@01 a) as@74@01))
        $Perm.Write
        $Perm.No)
      (pTaken@95@01 a))
    $Perm.No)
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Set_in (inv@91@01 a) as@74@01) (img@92@01 a) (= a (inv@91@01 a)))
    (= (- $Perm.Write (pTaken@95@01 a)) $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@96@01 $PSF<one>)
(declare-const s@97@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@97@01 $Snap)) (!
  (and
    (=>
      (Set_in s@97@01 ($PSF.domain_one (as sm@96@01  $PSF<one>)))
      (and
        (Set_in (inv@91@01 ($SortWrappers.$SnapTo$Ref s@97@01)) as@74@01)
        (img@92@01 ($SortWrappers.$SnapTo$Ref s@97@01))))
    (=>
      (and
        (Set_in (inv@91@01 ($SortWrappers.$SnapTo$Ref s@97@01)) as@74@01)
        (img@92@01 ($SortWrappers.$SnapTo$Ref s@97@01)))
      (Set_in s@97@01 ($PSF.domain_one (as sm@96@01  $PSF<one>)))))
  :pattern ((Set_in s@97@01 ($PSF.domain_one (as sm@96@01  $PSF<one>))))
  :qid |qp.psmDomDef61|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@97@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@91@01 ($SortWrappers.$SnapTo$Ref s@97@01)) as@74@01)
        (img@92@01 ($SortWrappers.$SnapTo$Ref s@97@01)))
      (and
        (img@80@01 ($SortWrappers.$SnapTo$Ref s@97@01))
        (Set_in (inv@79@01 ($SortWrappers.$SnapTo$Ref s@97@01)) as@74@01)))
    (and
      (not (= s@97@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@96@01  $PSF<one>) s@97@01)
        ($PSF.lookup_one $t@78@01 s@97@01))))
  :pattern (($PSF.lookup_one (as sm@96@01  $PSF<one>) s@97@01))
  :pattern (($PSF.lookup_one $t@78@01 s@97@01))
  :qid |qp.psmValDef59|)))
(assert (forall ((s@97@01 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one $t@78@01 s@97@01) s@97@01)
  :pattern (($PSF.lookup_one (as sm@96@01  $PSF<one>) s@97@01))
  :qid |qp.psmResTrgDef60|)))
(assert (foo_ones%precondition ($SortWrappers.$PSF<one>To$Snap (as sm@96@01  $PSF<one>)) as@74@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((s@94@01 $Snap)) (!
  (=>
    (and
      (img@80@01 ($SortWrappers.$SnapTo$Ref s@94@01))
      (Set_in (inv@79@01 ($SortWrappers.$SnapTo$Ref s@94@01)) as@74@01))
    (and
      (not (= s@94@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@93@01  $PSF<one>) s@94@01)
        ($PSF.lookup_one $t@78@01 s@94@01))))
  :pattern (($PSF.lookup_one (as sm@93@01  $PSF<one>) s@94@01))
  :pattern (($PSF.lookup_one $t@78@01 s@94@01))
  :qid |qp.psmValDef57|)))
(assert (forall ((s@94@01 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one $t@78@01 s@94@01) s@94@01)
  :pattern (($PSF.lookup_one (as sm@93@01  $PSF<one>) s@94@01))
  :qid |qp.psmResTrgDef58|)))
(assert (forall ((a@90@01 $Ref)) (!
  (=>
    (Set_in a@90@01 as@74@01)
    (and (= (inv@91@01 a@90@01) a@90@01) (img@92@01 a@90@01)))
  :pattern ((Set_in a@90@01 as@74@01))
  :pattern ((inv@91@01 a@90@01))
  :pattern ((img@92@01 a@90@01))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@92@01 a) (Set_in (inv@91@01 a) as@74@01)) (= (inv@91@01 a) a))
  :pattern ((inv@91@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((s@97@01 $Snap)) (!
  (and
    (=>
      (Set_in s@97@01 ($PSF.domain_one (as sm@96@01  $PSF<one>)))
      (and
        (Set_in (inv@91@01 ($SortWrappers.$SnapTo$Ref s@97@01)) as@74@01)
        (img@92@01 ($SortWrappers.$SnapTo$Ref s@97@01))))
    (=>
      (and
        (Set_in (inv@91@01 ($SortWrappers.$SnapTo$Ref s@97@01)) as@74@01)
        (img@92@01 ($SortWrappers.$SnapTo$Ref s@97@01)))
      (Set_in s@97@01 ($PSF.domain_one (as sm@96@01  $PSF<one>)))))
  :pattern ((Set_in s@97@01 ($PSF.domain_one (as sm@96@01  $PSF<one>))))
  :qid |qp.psmDomDef61|)))
(assert (forall ((s@97@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@91@01 ($SortWrappers.$SnapTo$Ref s@97@01)) as@74@01)
        (img@92@01 ($SortWrappers.$SnapTo$Ref s@97@01)))
      (and
        (img@80@01 ($SortWrappers.$SnapTo$Ref s@97@01))
        (Set_in (inv@79@01 ($SortWrappers.$SnapTo$Ref s@97@01)) as@74@01)))
    (and
      (not (= s@97@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@96@01  $PSF<one>) s@97@01)
        ($PSF.lookup_one $t@78@01 s@97@01))))
  :pattern (($PSF.lookup_one (as sm@96@01  $PSF<one>) s@97@01))
  :pattern (($PSF.lookup_one $t@78@01 s@97@01))
  :qid |qp.psmValDef59|)))
(assert (forall ((s@97@01 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one $t@78@01 s@97@01) s@97@01)
  :pattern (($PSF.lookup_one (as sm@96@01  $PSF<one>) s@97@01))
  :qid |qp.psmResTrgDef60|)))
(assert (and
  (forall ((a $Ref)) (!
    (=>
      (Set_in (inv@91@01 a) as@74@01)
      ($PSF.loc_one ($PSF.lookup_one (as sm@93@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
    :pattern ((inv@91@01 a))
    :qid |quant-u-80|))
  (foo_ones%precondition ($SortWrappers.$PSF<one>To$Snap (as sm@96@01  $PSF<one>)) as@74@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (foo_ones ($SortWrappers.$PSF<one>To$Snap (as sm@96@01  $PSF<one>)) as@74@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (foo_ones ($SortWrappers.$PSF<one>To$Snap (as sm@96@01  $PSF<one>)) as@74@01)
  0))
(pop) ; 2
(pop) ; 1
; ---------- test_ones_2 ----------
(declare-const as@98@01 Set<$Ref>)
(declare-const bs@99@01 Set<$Ref>)
(declare-const as@100@01 Set<$Ref>)
(declare-const bs@101@01 Set<$Ref>)
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
; var a1: Ref
(declare-const a1@102@01 $Ref)
; [exec]
; var b1: Ref
(declare-const b1@103@01 $Ref)
; [exec]
; inhale (forall a: Ref :: { one(a) } (a in as) ==> acc(one(a), write)) &&
;   (forall a$0: Ref :: { one(a$0) } (a$0 in bs) ==> acc(one(a$0), write))
(declare-const $t@104@01 $Snap)
(assert (= $t@104@01 ($Snap.combine ($Snap.first $t@104@01) ($Snap.second $t@104@01))))
(declare-const a@105@01 $Ref)
(push) ; 3
; [eval] (a in as)
(assert (Set_in a@105@01 as@100@01))
(declare-const sm@106@01 $PSF<one>)
(declare-const s@107@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@108@01 ($Ref) $Ref)
(declare-fun img@109@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@105@01 $Ref) (a2@105@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@105@01 as@100@01)
      (Set_in a2@105@01 as@100@01)
      (= a1@105@01 a2@105@01))
    (= a1@105@01 a2@105@01))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@105@01 $Ref)) (!
  (=>
    (Set_in a@105@01 as@100@01)
    (and (= (inv@108@01 a@105@01) a@105@01) (img@109@01 a@105@01)))
  :pattern (($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) ($SortWrappers.$RefTo$Snap a@105@01)) ($SortWrappers.$RefTo$Snap a@105@01)))
  :qid |quant-u-85|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
    (= (inv@108@01 a) a))
  :pattern ((inv@108@01 a))
  :qid |one-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@110@01 $PSF<one>)
(declare-const s@111@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@111@01 $Snap)) (!
  (=>
    (and
      (img@109@01 ($SortWrappers.$SnapTo$Ref s@111@01))
      (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@111@01)) as@100@01))
    (and
      (not (= s@111@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@110@01  $PSF<one>) s@111@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@111@01))))
  :pattern (($PSF.lookup_one (as sm@110@01  $PSF<one>) s@111@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@111@01))
  :qid |qp.psmValDef63|)))
(assert (forall ((s@111@01 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@111@01) s@111@01)
  :pattern (($PSF.lookup_one (as sm@110@01  $PSF<one>) s@111@01))
  :qid |qp.psmResTrgDef64|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@108@01 a) as@100@01)
    ($PSF.loc_one ($PSF.lookup_one (as sm@110@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@108@01 a))
  :qid |quant-u-86|)))
(declare-const a$0@112@01 $Ref)
(push) ; 3
; [eval] (a$0 in bs)
(assert (Set_in a$0@112@01 bs@101@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@113@01 ($Ref) $Ref)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a$01@112@01 $Ref) (a$02@112@01 $Ref)) (!
  (=>
    (and
      (Set_in a$01@112@01 bs@101@01)
      (Set_in a$02@112@01 bs@101@01)
      (= a$01@112@01 a$02@112@01))
    (= a$01@112@01 a$02@112@01))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a$0@112@01 $Ref)) (!
  (=>
    (Set_in a$0@112@01 bs@101@01)
    (and (= (inv@113@01 a$0@112@01) a$0@112@01) (img@114@01 a$0@112@01)))
  :pattern (($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) ($SortWrappers.$RefTo$Snap a$0@112@01)) ($SortWrappers.$RefTo$Snap a$0@112@01)))
  :qid |quant-u-88|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
    (= (inv@113@01 a) a))
  :pattern ((inv@113@01 a))
  :qid |one-fctOfInv|)))
; Permissions are non-negative
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (and
    (= a$0@112@01 a@105@01)
    (=
      (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
      (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@115@01 $PSF<one>)
(declare-const s@116@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@116@01 $Snap)) (!
  (=>
    (and
      (img@109@01 ($SortWrappers.$SnapTo$Ref s@116@01))
      (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@116@01)) as@100@01))
    (and
      (not (= s@116@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@115@01  $PSF<one>) s@116@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@116@01))))
  :pattern (($PSF.lookup_one (as sm@115@01  $PSF<one>) s@116@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@116@01))
  :qid |qp.psmValDef65|)))
(assert (forall ((s@116@01 $Snap)) (!
  (=>
    (and
      (img@114@01 ($SortWrappers.$SnapTo$Ref s@116@01))
      (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@116@01)) bs@101@01))
    (and
      (not (= s@116@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@115@01  $PSF<one>) s@116@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@116@01))))
  :pattern (($PSF.lookup_one (as sm@115@01  $PSF<one>) s@116@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@116@01))
  :qid |qp.psmValDef66|)))
(assert (forall ((s@116@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@116@01) s@116@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@116@01) s@116@01))
  :pattern (($PSF.lookup_one (as sm@115@01  $PSF<one>) s@116@01))
  :qid |qp.psmResTrgDef67|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@113@01 a) bs@101@01)
    ($PSF.loc_one ($PSF.lookup_one (as sm@115@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@113@01 a))
  :qid |quant-u-90|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale foo_ones(as) == 0
(declare-const $t@117@01 $Snap)
(assert (= $t@117@01 $Snap.unit))
; [eval] foo_ones(as) == 0
; [eval] foo_ones(as)
(set-option :timeout 0)
(push) ; 3
(declare-const a@118@01 $Ref)
(push) ; 4
; [eval] (a in as)
(assert (Set_in a@118@01 as@100@01))
(pop) ; 4
(declare-fun inv@119@01 ($Ref) $Ref)
(declare-fun img@120@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@118@01 $Ref) (a2@118@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@118@01 as@100@01)
        ($PSF.loc_one ($PSF.lookup_one (as sm@115@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@118@01)) ($SortWrappers.$RefTo$Snap a1@118@01)))
      (and
        (Set_in a2@118@01 as@100@01)
        ($PSF.loc_one ($PSF.lookup_one (as sm@115@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a2@118@01)) ($SortWrappers.$RefTo$Snap a2@118@01)))
      (= a1@118@01 a2@118@01))
    (= a1@118@01 a2@118@01))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@118@01 $Ref)) (!
  (=>
    (Set_in a@118@01 as@100@01)
    (and (= (inv@119@01 a@118@01) a@118@01) (img@120@01 a@118@01)))
  :pattern ((Set_in a@118@01 as@100@01))
  :pattern ((inv@119@01 a@118@01))
  :pattern ((img@120@01 a@118@01))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@120@01 a) (Set_in (inv@119@01 a) as@100@01))
    (= (inv@119@01 a) a))
  :pattern ((inv@119@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@119@01 a) as@100@01)
    ($PSF.loc_one ($PSF.lookup_one (as sm@115@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@119@01 a))
  :qid |quant-u-92|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@121@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@119@01 a) as@100@01) (img@120@01 a) (= a (inv@119@01 a)))
    ($Perm.min
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@122@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@119@01 a) as@100@01) (img@120@01 a) (= a (inv@119@01 a)))
    ($Perm.min
      (ite
        (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@121@01 a)))
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
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        $Perm.Write
        $Perm.No)
      (pTaken@121@01 a))
    $Perm.No)
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Set_in (inv@119@01 a) as@100@01) (img@120@01 a) (= a (inv@119@01 a)))
    (= (- $Perm.Write (pTaken@121@01 a)) $Perm.No))
  
  :qid |quant-u-95|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@123@01 $PSF<one>)
(declare-const s@124@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@124@01 $Snap)) (!
  (and
    (=>
      (Set_in s@124@01 ($PSF.domain_one (as sm@123@01  $PSF<one>)))
      (and
        (Set_in (inv@119@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)
        (img@120@01 ($SortWrappers.$SnapTo$Ref s@124@01))))
    (=>
      (and
        (Set_in (inv@119@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)
        (img@120@01 ($SortWrappers.$SnapTo$Ref s@124@01)))
      (Set_in s@124@01 ($PSF.domain_one (as sm@123@01  $PSF<one>)))))
  :pattern ((Set_in s@124@01 ($PSF.domain_one (as sm@123@01  $PSF<one>))))
  :qid |qp.psmDomDef71|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@124@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@119@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)
        (img@120@01 ($SortWrappers.$SnapTo$Ref s@124@01)))
      (and
        (img@109@01 ($SortWrappers.$SnapTo$Ref s@124@01))
        (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)))
    (and
      (not (= s@124@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@124@01))))
  :pattern (($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@124@01))
  :qid |qp.psmValDef68|)))
(assert (forall ((s@124@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@119@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)
        (img@120@01 ($SortWrappers.$SnapTo$Ref s@124@01)))
      (and
        (img@114@01 ($SortWrappers.$SnapTo$Ref s@124@01))
        (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@124@01)) bs@101@01)))
    (and
      (not (= s@124@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@124@01))))
  :pattern (($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@124@01))
  :qid |qp.psmValDef69|)))
(assert (forall ((s@124@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@124@01) s@124@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@124@01) s@124@01))
  :pattern (($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01))
  :qid |qp.psmResTrgDef70|)))
(assert (foo_ones%precondition ($SortWrappers.$PSF<one>To$Snap (as sm@123@01  $PSF<one>)) as@100@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((a@118@01 $Ref)) (!
  (=>
    (Set_in a@118@01 as@100@01)
    (and (= (inv@119@01 a@118@01) a@118@01) (img@120@01 a@118@01)))
  :pattern ((Set_in a@118@01 as@100@01))
  :pattern ((inv@119@01 a@118@01))
  :pattern ((img@120@01 a@118@01))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@120@01 a) (Set_in (inv@119@01 a) as@100@01))
    (= (inv@119@01 a) a))
  :pattern ((inv@119@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((s@124@01 $Snap)) (!
  (and
    (=>
      (Set_in s@124@01 ($PSF.domain_one (as sm@123@01  $PSF<one>)))
      (and
        (Set_in (inv@119@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)
        (img@120@01 ($SortWrappers.$SnapTo$Ref s@124@01))))
    (=>
      (and
        (Set_in (inv@119@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)
        (img@120@01 ($SortWrappers.$SnapTo$Ref s@124@01)))
      (Set_in s@124@01 ($PSF.domain_one (as sm@123@01  $PSF<one>)))))
  :pattern ((Set_in s@124@01 ($PSF.domain_one (as sm@123@01  $PSF<one>))))
  :qid |qp.psmDomDef71|)))
(assert (forall ((s@124@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@119@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)
        (img@120@01 ($SortWrappers.$SnapTo$Ref s@124@01)))
      (and
        (img@109@01 ($SortWrappers.$SnapTo$Ref s@124@01))
        (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)))
    (and
      (not (= s@124@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@124@01))))
  :pattern (($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@124@01))
  :qid |qp.psmValDef68|)))
(assert (forall ((s@124@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@119@01 ($SortWrappers.$SnapTo$Ref s@124@01)) as@100@01)
        (img@120@01 ($SortWrappers.$SnapTo$Ref s@124@01)))
      (and
        (img@114@01 ($SortWrappers.$SnapTo$Ref s@124@01))
        (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@124@01)) bs@101@01)))
    (and
      (not (= s@124@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@124@01))))
  :pattern (($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@124@01))
  :qid |qp.psmValDef69|)))
(assert (forall ((s@124@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@124@01) s@124@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@124@01) s@124@01))
  :pattern (($PSF.lookup_one (as sm@123@01  $PSF<one>) s@124@01))
  :qid |qp.psmResTrgDef70|)))
(assert (and
  (forall ((a $Ref)) (!
    (=>
      (Set_in (inv@119@01 a) as@100@01)
      ($PSF.loc_one ($PSF.lookup_one (as sm@115@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
    :pattern ((inv@119@01 a))
    :qid |quant-u-92|))
  (foo_ones%precondition ($SortWrappers.$PSF<one>To$Snap (as sm@123@01  $PSF<one>)) as@100@01)))
(assert (=
  (foo_ones ($SortWrappers.$PSF<one>To$Snap (as sm@123@01  $PSF<one>)) as@100@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (a1 in as)
(declare-const $t@125@01 $Snap)
(assert (= $t@125@01 $Snap.unit))
; [eval] (a1 in as)
(assert (Set_in a1@102@01 as@100@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(one(a1), write)
(declare-const sm@126@01 $PSF<one>)
(declare-const s@127@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@127@01 $Snap)) (!
  (=>
    (and
      (img@109@01 ($SortWrappers.$SnapTo$Ref s@127@01))
      (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@127@01)) as@100@01))
    (and
      (not (= s@127@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@126@01  $PSF<one>) s@127@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@127@01))))
  :pattern (($PSF.lookup_one (as sm@126@01  $PSF<one>) s@127@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@127@01))
  :qid |qp.psmValDef72|)))
(assert (forall ((s@127@01 $Snap)) (!
  (=>
    (and
      (img@114@01 ($SortWrappers.$SnapTo$Ref s@127@01))
      (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@127@01)) bs@101@01))
    (and
      (not (= s@127@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@126@01  $PSF<one>) s@127@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@127@01))))
  :pattern (($PSF.lookup_one (as sm@126@01  $PSF<one>) s@127@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@127@01))
  :qid |qp.psmValDef73|)))
(assert (forall ((s@127@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@127@01) s@127@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@127@01) s@127@01))
  :pattern (($PSF.lookup_one (as sm@126@01  $PSF<one>) s@127@01))
  :qid |qp.psmResTrgDef74|)))
(assert ($PSF.loc_one ($PSF.lookup_one (as sm@126@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@102@01)) ($SortWrappers.$RefTo$Snap a1@102@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@128@01 ((a $Ref)) $Perm
  (ite
    (= a a1@102@01)
    ($Perm.min
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@129@01 ((a $Ref)) $Perm
  (ite
    (= a a1@102@01)
    ($Perm.min
      (ite
        (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@128@01 a)))
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
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        $Perm.Write
        $Perm.No)
      (pTaken@128@01 a))
    $Perm.No)
  
  :qid |quant-u-97|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@128@01 a) $Perm.No)
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a a1@102@01) (= (- $Perm.Write (pTaken@128@01 a)) $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@109@01 a1@102@01) (Set_in (inv@108@01 a1@102@01) as@100@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap a1@102@01) $Snap.unit))
    (=
      ($PSF.lookup_one (as sm@126@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@102@01))
      ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) ($SortWrappers.$RefTo$Snap a1@102@01))))))
(assert (=>
  (and (img@114@01 a1@102@01) (Set_in (inv@113@01 a1@102@01) bs@101@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap a1@102@01) $Snap.unit))
    (=
      ($PSF.lookup_one (as sm@126@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@102@01))
      ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) ($SortWrappers.$RefTo$Snap a1@102@01))))))
(assert (and
  ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) ($SortWrappers.$RefTo$Snap a1@102@01)) ($SortWrappers.$RefTo$Snap a1@102@01))
  ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) ($SortWrappers.$RefTo$Snap a1@102@01)) ($SortWrappers.$RefTo$Snap a1@102@01))))
(assert (not (= a1@102@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (one%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_one (as sm@126@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@102@01))) a1@102@01))
; [exec]
; a1.val := 1 + a1.val - 1
; [eval] 1 + a1.val - 1
; [eval] 1 + a1.val
(declare-const val@130@01 Int)
(assert (=
  val@130@01
  (-
    (+
      1
      ($PSF.lookup_one (as sm@126@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@102@01)))
    1)))
; [exec]
; fold acc(one(a1), write)
(assert (one%trigger ($SortWrappers.IntTo$Snap val@130@01) a1@102@01))
(declare-const sm@131@01 $PSF<one>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_one (as sm@131@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@102@01))
  val@130@01))
(declare-const sm@132@01 $PSF<one>)
(declare-const s@133@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@133@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@133@01) a1@102@01)
    (and
      (not (= s@133@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@132@01  $PSF<one>) s@133@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@133@01))))
  :pattern (($PSF.lookup_one (as sm@132@01  $PSF<one>) s@133@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@133@01))
  :qid |qp.psmValDef75|)))
(assert (forall ((s@133@01 $Snap)) (!
  (=>
    (and
      (img@114@01 ($SortWrappers.$SnapTo$Ref s@133@01))
      (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@133@01)) bs@101@01))
    (and
      (not (= s@133@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@132@01  $PSF<one>) s@133@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@133@01))))
  :pattern (($PSF.lookup_one (as sm@132@01  $PSF<one>) s@133@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@133@01))
  :qid |qp.psmValDef76|)))
(assert (forall ((s@133@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@109@01 ($SortWrappers.$SnapTo$Ref s@133@01))
        (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@133@01)) as@100@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@133@01))))
      false)
    (and
      (not (= s@133@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@132@01  $PSF<one>) s@133@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@133@01))))
  :pattern (($PSF.lookup_one (as sm@132@01  $PSF<one>) s@133@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@133@01))
  :qid |qp.psmValDef77|)))
(assert (forall ((s@133@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@133@01) s@133@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@133@01) s@133@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@133@01) s@133@01))
  :pattern (($PSF.lookup_one (as sm@132@01  $PSF<one>) s@133@01))
  :qid |qp.psmResTrgDef78|)))
(assert ($PSF.loc_one ($PSF.lookup_one (as sm@132@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@102@01)) ($SortWrappers.$RefTo$Snap a1@102@01)))
; [exec]
; inhale (b1 in bs)
(declare-const $t@134@01 $Snap)
(assert (= $t@134@01 $Snap.unit))
; [eval] (b1 in bs)
(assert (Set_in b1@103@01 bs@101@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(one(b1), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($PSF.loc_one ($PSF.lookup_one (as sm@132@01  $PSF<one>) ($SortWrappers.$RefTo$Snap b1@103@01)) ($SortWrappers.$RefTo$Snap b1@103@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a1@102@01 b1@103@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@135@01 ((a $Ref)) $Perm
  (ite
    (= a b1@103@01)
    ($Perm.min
      (ite
        (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@136@01 ((a $Ref)) $Perm
  (ite
    (= a b1@103@01)
    ($Perm.min
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        (- $Perm.Write (pTaken@128@01 a))
        $Perm.No)
      (- $Perm.Write (pTaken@135@01 a)))
    $Perm.No))
(define-fun pTaken@137@01 ((a $Ref)) $Perm
  (ite
    (= a b1@103@01)
    ($Perm.min
      (ite (= a a1@102@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@135@01 a)) (pTaken@136@01 a)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
        $Perm.Write
        $Perm.No)
      (pTaken@135@01 a))
    $Perm.No)
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@135@01 a) $Perm.No)
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a b1@103@01) (= (- $Perm.Write (pTaken@135@01 a)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= b1@103@01 a1@102@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap b1@103@01) $Snap.unit))
    (=
      ($PSF.lookup_one (as sm@132@01  $PSF<one>) ($SortWrappers.$RefTo$Snap b1@103@01))
      ($PSF.lookup_one (as sm@131@01  $PSF<one>) ($SortWrappers.$RefTo$Snap b1@103@01))))))
(assert (=>
  (and (img@114@01 b1@103@01) (Set_in (inv@113@01 b1@103@01) bs@101@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap b1@103@01) $Snap.unit))
    (=
      ($PSF.lookup_one (as sm@132@01  $PSF<one>) ($SortWrappers.$RefTo$Snap b1@103@01))
      ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) ($SortWrappers.$RefTo$Snap b1@103@01))))))
(assert (=>
  (ite
    (and (img@109@01 b1@103@01) (Set_in (inv@108@01 b1@103@01) as@100@01))
    (< $Perm.No (- $Perm.Write (pTaken@128@01 b1@103@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap b1@103@01) $Snap.unit))
    (=
      ($PSF.lookup_one (as sm@132@01  $PSF<one>) ($SortWrappers.$RefTo$Snap b1@103@01))
      ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) ($SortWrappers.$RefTo$Snap b1@103@01))))))
(assert (and
  ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) ($SortWrappers.$RefTo$Snap b1@103@01)) ($SortWrappers.$RefTo$Snap b1@103@01))
  ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) ($SortWrappers.$RefTo$Snap b1@103@01)) ($SortWrappers.$RefTo$Snap b1@103@01))
  ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) ($SortWrappers.$RefTo$Snap b1@103@01)) ($SortWrappers.$RefTo$Snap b1@103@01))))
; [exec]
; exhale (forall a$1: Ref ::
;     { one(a$1) }
;     (a$1 in (bs setminus Set(b1))) ==> acc(one(a$1), write))
(declare-const a$1@138@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (a$1 in (bs setminus Set(b1)))
; [eval] (bs setminus Set(b1))
; [eval] Set(b1)
(assert (Set_in a$1@138@01 (Set_difference bs@101@01 (Set_singleton b1@103@01))))
(declare-const sm@139@01 $PSF<one>)
(declare-const s@140@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@140@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@140@01) a1@102@01)
    (and
      (not (= s@140@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@140@01))))
  :pattern (($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@140@01))
  :qid |qp.psmValDef79|)))
(assert (forall ((s@140@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@109@01 ($SortWrappers.$SnapTo$Ref s@140@01))
        (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@140@01)) as@100@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@140@01))))
      false)
    (and
      (not (= s@140@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@140@01))))
  :pattern (($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@140@01))
  :qid |qp.psmValDef80|)))
(assert (forall ((s@140@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@114@01 ($SortWrappers.$SnapTo$Ref s@140@01))
        (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@140@01)) bs@101@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@135@01 ($SortWrappers.$SnapTo$Ref s@140@01))))
      false)
    (and
      (not (= s@140@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@140@01))))
  :pattern (($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@140@01))
  :qid |qp.psmValDef81|)))
(assert (forall ((s@140@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@140@01) s@140@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@140@01) s@140@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@140@01) s@140@01))
  :pattern (($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01))
  :qid |qp.psmResTrgDef82|)))
(pop) ; 3
(declare-fun inv@141@01 ($Ref) $Ref)
(declare-fun img@142@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((s@140@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@140@01) a1@102@01)
    (and
      (not (= s@140@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@140@01))))
  :pattern (($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@140@01))
  :qid |qp.psmValDef79|)))
(assert (forall ((s@140@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@109@01 ($SortWrappers.$SnapTo$Ref s@140@01))
        (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@140@01)) as@100@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@140@01))))
      false)
    (and
      (not (= s@140@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@140@01))))
  :pattern (($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@140@01))
  :qid |qp.psmValDef80|)))
(assert (forall ((s@140@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@114@01 ($SortWrappers.$SnapTo$Ref s@140@01))
        (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@140@01)) bs@101@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@135@01 ($SortWrappers.$SnapTo$Ref s@140@01))))
      false)
    (and
      (not (= s@140@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@140@01))))
  :pattern (($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@140@01))
  :qid |qp.psmValDef81|)))
(assert (forall ((s@140@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@140@01) s@140@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@140@01) s@140@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@140@01) s@140@01))
  :pattern (($PSF.lookup_one (as sm@139@01  $PSF<one>) s@140@01))
  :qid |qp.psmResTrgDef82|)))
; Nested auxiliary terms: non-globals
(declare-const sm@143@01 $PSF<one>)
(declare-const s@144@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@144@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@144@01) a1@102@01)
    (and
      (not (= s@144@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@143@01  $PSF<one>) s@144@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@144@01))))
  :pattern (($PSF.lookup_one (as sm@143@01  $PSF<one>) s@144@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@144@01))
  :qid |qp.psmValDef83|)))
(assert (forall ((s@144@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@109@01 ($SortWrappers.$SnapTo$Ref s@144@01))
        (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@144@01)) as@100@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@144@01))))
      false)
    (and
      (not (= s@144@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@143@01  $PSF<one>) s@144@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@144@01))))
  :pattern (($PSF.lookup_one (as sm@143@01  $PSF<one>) s@144@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@144@01))
  :qid |qp.psmValDef84|)))
(assert (forall ((s@144@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@114@01 ($SortWrappers.$SnapTo$Ref s@144@01))
        (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@144@01)) bs@101@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@135@01 ($SortWrappers.$SnapTo$Ref s@144@01))))
      false)
    (and
      (not (= s@144@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@143@01  $PSF<one>) s@144@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@144@01))))
  :pattern (($PSF.lookup_one (as sm@143@01  $PSF<one>) s@144@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@144@01))
  :qid |qp.psmValDef85|)))
(assert (forall ((s@144@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@144@01) s@144@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@144@01) s@144@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@144@01) s@144@01))
  :pattern (($PSF.lookup_one (as sm@143@01  $PSF<one>) s@144@01))
  :qid |qp.psmResTrgDef86|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a$11@138@01 $Ref) (a$12@138@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a$11@138@01 (Set_difference bs@101@01 (Set_singleton b1@103@01)))
        ($PSF.loc_one ($PSF.lookup_one (as sm@143@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a$11@138@01)) ($SortWrappers.$RefTo$Snap a$11@138@01)))
      (and
        (Set_in a$12@138@01 (Set_difference bs@101@01 (Set_singleton b1@103@01)))
        ($PSF.loc_one ($PSF.lookup_one (as sm@143@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a$12@138@01)) ($SortWrappers.$RefTo$Snap a$12@138@01)))
      (= a$11@138@01 a$12@138@01))
    (= a$11@138@01 a$12@138@01))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a$1@138@01 $Ref)) (!
  (=>
    (Set_in a$1@138@01 (Set_difference bs@101@01 (Set_singleton b1@103@01)))
    (and (= (inv@141@01 a$1@138@01) a$1@138@01) (img@142@01 a$1@138@01)))
  :pattern (($PSF.loc_one ($PSF.lookup_one (as sm@139@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a$1@138@01)) ($SortWrappers.$RefTo$Snap a$1@138@01)))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and
      (img@142@01 a)
      (Set_in (inv@141@01 a) (Set_difference bs@101@01 (Set_singleton b1@103@01))))
    (= (inv@141@01 a) a))
  :pattern ((inv@141@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@141@01 a) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
    ($PSF.loc_one ($PSF.lookup_one (as sm@143@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@141@01 a))
  :qid |quant-u-105|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@145@01 ((a $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@141@01 a) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
      (img@142@01 a)
      (= a (inv@141@01 a)))
    ($Perm.min
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        (- $Perm.Write (pTaken@128@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@146@01 ((a $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@141@01 a) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
      (img@142@01 a)
      (= a (inv@141@01 a)))
    ($Perm.min
      (ite
        (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
        (- $Perm.Write (pTaken@135@01 a))
        $Perm.No)
      (- $Perm.Write (pTaken@145@01 a)))
    $Perm.No))
(define-fun pTaken@147@01 ((a $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@141@01 a) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
      (img@142@01 a)
      (= a (inv@141@01 a)))
    ($Perm.min
      (ite (= a a1@102@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@145@01 a)) (pTaken@146@01 a)))
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
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        (- $Perm.Write (pTaken@128@01 a))
        $Perm.No)
      (pTaken@145@01 a))
    $Perm.No)
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@145@01 a) $Perm.No)
  
  :qid |quant-u-108|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and
      (Set_in (inv@141@01 a) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
      (img@142@01 a)
      (= a (inv@141@01 a)))
    (= (- $Perm.Write (pTaken@145@01 a)) $Perm.No))
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
        (- $Perm.Write (pTaken@135@01 a))
        $Perm.No)
      (pTaken@146@01 a))
    $Perm.No)
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@146@01 a) $Perm.No)
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and
      (Set_in (inv@141@01 a) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
      (img@142@01 a)
      (= a (inv@141@01 a)))
    (= (- (- $Perm.Write (pTaken@145@01 a)) (pTaken@146@01 a)) $Perm.No))
  
  :qid |quant-u-112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@148@01 $PSF<one>)
(declare-const s@149@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@149@01 $Snap)) (!
  (and
    (=>
      (Set_in s@149@01 ($PSF.domain_one (as sm@148@01  $PSF<one>)))
      (and
        (Set_in (inv@141@01 ($SortWrappers.$SnapTo$Ref s@149@01)) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
        (img@142@01 ($SortWrappers.$SnapTo$Ref s@149@01))))
    (=>
      (and
        (Set_in (inv@141@01 ($SortWrappers.$SnapTo$Ref s@149@01)) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
        (img@142@01 ($SortWrappers.$SnapTo$Ref s@149@01)))
      (Set_in s@149@01 ($PSF.domain_one (as sm@148@01  $PSF<one>)))))
  :pattern ((Set_in s@149@01 ($PSF.domain_one (as sm@148@01  $PSF<one>))))
  :qid |qp.psmDomDef91|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@149@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@141@01 ($SortWrappers.$SnapTo$Ref s@149@01)) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
        (img@142@01 ($SortWrappers.$SnapTo$Ref s@149@01)))
      (= ($SortWrappers.$SnapTo$Ref s@149@01) a1@102@01))
    (and
      (not (= s@149@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@148@01  $PSF<one>) s@149@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@149@01))))
  :pattern (($PSF.lookup_one (as sm@148@01  $PSF<one>) s@149@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@149@01))
  :qid |qp.psmValDef87|)))
(assert (forall ((s@149@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@141@01 ($SortWrappers.$SnapTo$Ref s@149@01)) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
        (img@142@01 ($SortWrappers.$SnapTo$Ref s@149@01)))
      (ite
        (and
          (img@109@01 ($SortWrappers.$SnapTo$Ref s@149@01))
          (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@149@01)) as@100@01))
        (<
          $Perm.No
          (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@149@01))))
        false))
    (and
      (not (= s@149@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@148@01  $PSF<one>) s@149@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@149@01))))
  :pattern (($PSF.lookup_one (as sm@148@01  $PSF<one>) s@149@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@149@01))
  :qid |qp.psmValDef88|)))
(assert (forall ((s@149@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@141@01 ($SortWrappers.$SnapTo$Ref s@149@01)) (Set_difference bs@101@01 (Set_singleton b1@103@01)))
        (img@142@01 ($SortWrappers.$SnapTo$Ref s@149@01)))
      (ite
        (and
          (img@114@01 ($SortWrappers.$SnapTo$Ref s@149@01))
          (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@149@01)) bs@101@01))
        (<
          $Perm.No
          (- $Perm.Write (pTaken@135@01 ($SortWrappers.$SnapTo$Ref s@149@01))))
        false))
    (and
      (not (= s@149@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@148@01  $PSF<one>) s@149@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@149@01))))
  :pattern (($PSF.lookup_one (as sm@148@01  $PSF<one>) s@149@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@149@01))
  :qid |qp.psmValDef89|)))
(assert (forall ((s@149@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@149@01) s@149@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@149@01) s@149@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@149@01) s@149@01))
  :pattern (($PSF.lookup_one (as sm@148@01  $PSF<one>) s@149@01))
  :qid |qp.psmResTrgDef90|)))
; [exec]
; exhale foo_ones(as) == 0
; [eval] foo_ones(as) == 0
; [eval] foo_ones(as)
(set-option :timeout 0)
(push) ; 3
(declare-const a@150@01 $Ref)
(push) ; 4
; [eval] (a in as)
(assert (Set_in a@150@01 as@100@01))
(pop) ; 4
(declare-fun inv@151@01 ($Ref) $Ref)
(declare-fun img@152@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@153@01 $PSF<one>)
(declare-const s@154@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@154@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@154@01) a1@102@01)
    (and
      (not (= s@154@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@154@01))))
  :pattern (($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@154@01))
  :qid |qp.psmValDef92|)))
(assert (forall ((s@154@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@114@01 ($SortWrappers.$SnapTo$Ref s@154@01))
        (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@154@01)) bs@101@01))
      (<
        $Perm.No
        (-
          (- $Perm.Write (pTaken@135@01 ($SortWrappers.$SnapTo$Ref s@154@01)))
          (pTaken@146@01 ($SortWrappers.$SnapTo$Ref s@154@01))))
      false)
    (and
      (not (= s@154@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@154@01))))
  :pattern (($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@154@01))
  :qid |qp.psmValDef93|)))
(assert (forall ((s@154@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@109@01 ($SortWrappers.$SnapTo$Ref s@154@01))
        (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@154@01)) as@100@01))
      (<
        $Perm.No
        (-
          (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@154@01)))
          (pTaken@145@01 ($SortWrappers.$SnapTo$Ref s@154@01))))
      false)
    (and
      (not (= s@154@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@154@01))))
  :pattern (($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@154@01))
  :qid |qp.psmValDef94|)))
(assert (forall ((s@154@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@154@01) s@154@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@154@01) s@154@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@154@01) s@154@01))
  :pattern (($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01))
  :qid |qp.psmResTrgDef95|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@150@01 $Ref) (a2@150@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@150@01 as@100@01)
        ($PSF.loc_one ($PSF.lookup_one (as sm@153@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a1@150@01)) ($SortWrappers.$RefTo$Snap a1@150@01)))
      (and
        (Set_in a2@150@01 as@100@01)
        ($PSF.loc_one ($PSF.lookup_one (as sm@153@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a2@150@01)) ($SortWrappers.$RefTo$Snap a2@150@01)))
      (= a1@150@01 a2@150@01))
    (= a1@150@01 a2@150@01))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@150@01 $Ref)) (!
  (=>
    (Set_in a@150@01 as@100@01)
    (and (= (inv@151@01 a@150@01) a@150@01) (img@152@01 a@150@01)))
  :pattern ((Set_in a@150@01 as@100@01))
  :pattern ((inv@151@01 a@150@01))
  :pattern ((img@152@01 a@150@01))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@152@01 a) (Set_in (inv@151@01 a) as@100@01))
    (= (inv@151@01 a) a))
  :pattern ((inv@151@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@151@01 a) as@100@01)
    ($PSF.loc_one ($PSF.lookup_one (as sm@153@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@151@01 a))
  :qid |quant-u-114|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@155@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@151@01 a) as@100@01) (img@152@01 a) (= a (inv@151@01 a)))
    ($Perm.min
      (ite
        (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
        (- (- $Perm.Write (pTaken@135@01 a)) (pTaken@146@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@156@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@151@01 a) as@100@01) (img@152@01 a) (= a (inv@151@01 a)))
    ($Perm.min
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        (- (- $Perm.Write (pTaken@128@01 a)) (pTaken@145@01 a))
        $Perm.No)
      (- $Perm.Write (pTaken@155@01 a)))
    $Perm.No))
(define-fun pTaken@157@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@151@01 a) as@100@01) (img@152@01 a) (= a (inv@151@01 a)))
    ($Perm.min
      (ite (= a a1@102@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@155@01 a)) (pTaken@156@01 a)))
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
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@114@01 a) (Set_in (inv@113@01 a) bs@101@01))
        (- (- $Perm.Write (pTaken@135@01 a)) (pTaken@146@01 a))
        $Perm.No)
      (pTaken@155@01 a))
    $Perm.No)
  
  :qid |quant-u-116|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Set_in (inv@151@01 a) as@100@01) (img@152@01 a) (= a (inv@151@01 a)))
    (= (- $Perm.Write (pTaken@155@01 a)) $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@109@01 a) (Set_in (inv@108@01 a) as@100@01))
        (- (- $Perm.Write (pTaken@128@01 a)) (pTaken@145@01 a))
        $Perm.No)
      (pTaken@156@01 a))
    $Perm.No)
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Set_in (inv@151@01 a) as@100@01) (img@152@01 a) (= a (inv@151@01 a)))
    (= (- (- $Perm.Write (pTaken@155@01 a)) (pTaken@156@01 a)) $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@157@01 a1@102@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Set_in (inv@151@01 a) as@100@01) (img@152@01 a) (= a (inv@151@01 a)))
    (=
      (-
        (- (- $Perm.Write (pTaken@155@01 a)) (pTaken@156@01 a))
        (pTaken@157@01 a))
      $Perm.No))
  
  :qid |quant-u-121|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@158@01 $PSF<one>)
(declare-const s@159@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@159@01 $Snap)) (!
  (and
    (=>
      (Set_in s@159@01 ($PSF.domain_one (as sm@158@01  $PSF<one>)))
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01))))
    (=>
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
      (Set_in s@159@01 ($PSF.domain_one (as sm@158@01  $PSF<one>)))))
  :pattern ((Set_in s@159@01 ($PSF.domain_one (as sm@158@01  $PSF<one>))))
  :qid |qp.psmDomDef100|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@159@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
      (= ($SortWrappers.$SnapTo$Ref s@159@01) a1@102@01))
    (and
      (not (= s@159@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@159@01))))
  :pattern (($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@159@01))
  :qid |qp.psmValDef96|)))
(assert (forall ((s@159@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
      (ite
        (and
          (img@114@01 ($SortWrappers.$SnapTo$Ref s@159@01))
          (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@159@01)) bs@101@01))
        (<
          $Perm.No
          (-
            (- $Perm.Write (pTaken@135@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
            (pTaken@146@01 ($SortWrappers.$SnapTo$Ref s@159@01))))
        false))
    (and
      (not (= s@159@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@159@01))))
  :pattern (($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@159@01))
  :qid |qp.psmValDef97|)))
(assert (forall ((s@159@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
      (ite
        (and
          (img@109@01 ($SortWrappers.$SnapTo$Ref s@159@01))
          (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01))
        (<
          $Perm.No
          (-
            (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
            (pTaken@145@01 ($SortWrappers.$SnapTo$Ref s@159@01))))
        false))
    (and
      (not (= s@159@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@159@01))))
  :pattern (($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@159@01))
  :qid |qp.psmValDef98|)))
(assert (forall ((s@159@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@159@01) s@159@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@159@01) s@159@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@159@01) s@159@01))
  :pattern (($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01))
  :qid |qp.psmResTrgDef99|)))
(assert (foo_ones%precondition ($SortWrappers.$PSF<one>To$Snap (as sm@158@01  $PSF<one>)) as@100@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((s@154@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@154@01) a1@102@01)
    (and
      (not (= s@154@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@154@01))))
  :pattern (($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@154@01))
  :qid |qp.psmValDef92|)))
(assert (forall ((s@154@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@114@01 ($SortWrappers.$SnapTo$Ref s@154@01))
        (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@154@01)) bs@101@01))
      (<
        $Perm.No
        (-
          (- $Perm.Write (pTaken@135@01 ($SortWrappers.$SnapTo$Ref s@154@01)))
          (pTaken@146@01 ($SortWrappers.$SnapTo$Ref s@154@01))))
      false)
    (and
      (not (= s@154@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@154@01))))
  :pattern (($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@154@01))
  :qid |qp.psmValDef93|)))
(assert (forall ((s@154@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@109@01 ($SortWrappers.$SnapTo$Ref s@154@01))
        (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@154@01)) as@100@01))
      (<
        $Perm.No
        (-
          (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@154@01)))
          (pTaken@145@01 ($SortWrappers.$SnapTo$Ref s@154@01))))
      false)
    (and
      (not (= s@154@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@154@01))))
  :pattern (($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@154@01))
  :qid |qp.psmValDef94|)))
(assert (forall ((s@154@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@154@01) s@154@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@154@01) s@154@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@154@01) s@154@01))
  :pattern (($PSF.lookup_one (as sm@153@01  $PSF<one>) s@154@01))
  :qid |qp.psmResTrgDef95|)))
(assert (forall ((a@150@01 $Ref)) (!
  (=>
    (Set_in a@150@01 as@100@01)
    (and (= (inv@151@01 a@150@01) a@150@01) (img@152@01 a@150@01)))
  :pattern ((Set_in a@150@01 as@100@01))
  :pattern ((inv@151@01 a@150@01))
  :pattern ((img@152@01 a@150@01))
  :qid |one-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@152@01 a) (Set_in (inv@151@01 a) as@100@01))
    (= (inv@151@01 a) a))
  :pattern ((inv@151@01 a))
  :qid |one-fctOfInv|)))
(assert (forall ((s@159@01 $Snap)) (!
  (and
    (=>
      (Set_in s@159@01 ($PSF.domain_one (as sm@158@01  $PSF<one>)))
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01))))
    (=>
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
      (Set_in s@159@01 ($PSF.domain_one (as sm@158@01  $PSF<one>)))))
  :pattern ((Set_in s@159@01 ($PSF.domain_one (as sm@158@01  $PSF<one>))))
  :qid |qp.psmDomDef100|)))
(assert (forall ((s@159@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
      (= ($SortWrappers.$SnapTo$Ref s@159@01) a1@102@01))
    (and
      (not (= s@159@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01)
        ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@159@01))))
  :pattern (($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01))
  :pattern (($PSF.lookup_one (as sm@131@01  $PSF<one>) s@159@01))
  :qid |qp.psmValDef96|)))
(assert (forall ((s@159@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
      (ite
        (and
          (img@114@01 ($SortWrappers.$SnapTo$Ref s@159@01))
          (Set_in (inv@113@01 ($SortWrappers.$SnapTo$Ref s@159@01)) bs@101@01))
        (<
          $Perm.No
          (-
            (- $Perm.Write (pTaken@135@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
            (pTaken@146@01 ($SortWrappers.$SnapTo$Ref s@159@01))))
        false))
    (and
      (not (= s@159@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@159@01))))
  :pattern (($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@159@01))
  :qid |qp.psmValDef97|)))
(assert (forall ((s@159@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@151@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01)
        (img@152@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
      (ite
        (and
          (img@109@01 ($SortWrappers.$SnapTo$Ref s@159@01))
          (Set_in (inv@108@01 ($SortWrappers.$SnapTo$Ref s@159@01)) as@100@01))
        (<
          $Perm.No
          (-
            (- $Perm.Write (pTaken@128@01 ($SortWrappers.$SnapTo$Ref s@159@01)))
            (pTaken@145@01 ($SortWrappers.$SnapTo$Ref s@159@01))))
        false))
    (and
      (not (= s@159@01 $Snap.unit))
      (=
        ($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@159@01))))
  :pattern (($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@159@01))
  :qid |qp.psmValDef98|)))
(assert (forall ((s@159@01 $Snap)) (!
  (and
    ($PSF.loc_one ($PSF.lookup_one (as sm@131@01  $PSF<one>) s@159@01) s@159@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.second $t@104@01)) s@159@01) s@159@01)
    ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> ($Snap.first $t@104@01)) s@159@01) s@159@01))
  :pattern (($PSF.lookup_one (as sm@158@01  $PSF<one>) s@159@01))
  :qid |qp.psmResTrgDef99|)))
(assert (and
  (forall ((a $Ref)) (!
    (=>
      (Set_in (inv@151@01 a) as@100@01)
      ($PSF.loc_one ($PSF.lookup_one (as sm@153@01  $PSF<one>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
    :pattern ((inv@151@01 a))
    :qid |quant-u-114|))
  (foo_ones%precondition ($SortWrappers.$PSF<one>To$Snap (as sm@158@01  $PSF<one>)) as@100@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (foo_ones ($SortWrappers.$PSF<one>To$Snap (as sm@158@01  $PSF<one>)) as@100@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (foo_ones ($SortWrappers.$PSF<one>To$Snap (as sm@158@01  $PSF<one>)) as@100@01)
  0))
(pop) ; 2
(pop) ; 1
; ---------- test_twos ----------
(declare-const as@160@01 Set<$Ref>)
(declare-const is@161@01 Set<Int>)
(declare-const as@162@01 Set<$Ref>)
(declare-const is@163@01 Set<Int>)
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
; inhale (forall a: Ref, i: Int ::
;     { two(a, i) }
;     (a in as) && (i in is) ==> acc(two(a, i), write))
(declare-const a@164@01 $Ref)
(declare-const i@165@01 Int)
(push) ; 3
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 4
; [then-branch: 0 | !(a@164@01 in as@162@01) | live]
; [else-branch: 0 | a@164@01 in as@162@01 | live]
(push) ; 5
; [then-branch: 0 | !(a@164@01 in as@162@01)]
(assert (not (Set_in a@164@01 as@162@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | a@164@01 in as@162@01]
(assert (Set_in a@164@01 as@162@01))
; [eval] (i in is)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@164@01 as@162@01) (not (Set_in a@164@01 as@162@01))))
(assert (and (Set_in a@164@01 as@162@01) (Set_in i@165@01 is@163@01)))
(declare-const sm@166@01 $PSF<two>)
(declare-const s@167@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@168@01 $PSF<two>)
(declare-fun inv@169@01 ($Ref Int) $Ref)
(declare-fun img@170@01 ($Ref Int) Bool)
(declare-fun inv@171@01 ($Ref Int) Int)
(declare-fun img@172@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@164@01 $Ref) (i@165@01 Int)) (!
  (=>
    (and (Set_in a@164@01 as@162@01) (Set_in i@165@01 is@163@01))
    (or (Set_in a@164@01 as@162@01) (not (Set_in a@164@01 as@162@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two $t@168@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@164@01)
    ($SortWrappers.IntTo$Snap i@165@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@164@01)
    ($SortWrappers.IntTo$Snap i@165@01))))
  :qid |two-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@164@01 $Ref) (i1@165@01 Int) (a2@164@01 $Ref) (i2@165@01 Int)) (!
  (=>
    (and
      (and (Set_in a1@164@01 as@162@01) (Set_in i1@165@01 is@163@01))
      (and (Set_in a2@164@01 as@162@01) (Set_in i2@165@01 is@163@01))
      (and (= a1@164@01 a2@164@01) (= i1@165@01 i2@165@01)))
    (and (= a1@164@01 a2@164@01) (= i1@165@01 i2@165@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@164@01 $Ref) (i@165@01 Int)) (!
  (=>
    (and (Set_in a@164@01 as@162@01) (Set_in i@165@01 is@163@01))
    (and
      (and
        (= (inv@169@01 a@164@01 i@165@01) a@164@01)
        (= (inv@171@01 a@164@01 i@165@01) i@165@01))
      (and (img@170@01 a@164@01 i@165@01) (img@172@01 a@164@01 i@165@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two $t@168@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@164@01)
    ($SortWrappers.IntTo$Snap i@165@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@164@01)
    ($SortWrappers.IntTo$Snap i@165@01))))
  :qid |quant-u-123|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@170@01 a i) (img@172@01 a i))
      (and
        (Set_in (inv@169@01 a i) as@162@01)
        (Set_in (inv@171@01 a i) is@163@01)))
    (and (= (inv@169@01 a i) a) (= (inv@171@01 a i) i)))
  :pattern ((inv@169@01 a i))
  :pattern ((inv@171@01 a i))
  :qid |two-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@173@01 $PSF<two>)
(declare-const s@174@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@174@01 $Snap)) (!
  (=>
    (and
      (and
        (img@170@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@174@01)) ($SortWrappers.$SnapToInt ($Snap.second s@174@01)))
        (img@172@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@174@01)) ($SortWrappers.$SnapToInt ($Snap.second s@174@01))))
      (and
        (Set_in (inv@169@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@174@01)) ($SortWrappers.$SnapToInt ($Snap.second s@174@01))) as@162@01)
        (Set_in (inv@171@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@174@01)) ($SortWrappers.$SnapToInt ($Snap.second s@174@01))) is@163@01)))
    (and
      (not (= s@174@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@173@01  $PSF<two>) s@174@01)
        ($PSF.lookup_two $t@168@01 s@174@01))))
  :pattern (($PSF.lookup_two (as sm@173@01  $PSF<two>) s@174@01))
  :pattern (($PSF.lookup_two $t@168@01 s@174@01))
  :qid |qp.psmValDef102|)))
(assert (forall ((s@174@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@168@01 s@174@01) s@174@01)
  :pattern (($PSF.lookup_two (as sm@173@01  $PSF<two>) s@174@01))
  :qid |qp.psmResTrgDef103|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@169@01 a i) as@162@01) (Set_in (inv@171@01 a i) is@163@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@173@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@169@01 a i) (inv@171@01 a i))
  :qid |quant-u-124|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale foo_twos(as, is) == 0
(declare-const $t@175@01 $Snap)
(assert (= $t@175@01 $Snap.unit))
; [eval] foo_twos(as, is) == 0
; [eval] foo_twos(as, is)
(set-option :timeout 0)
(push) ; 3
(declare-const a@176@01 $Ref)
(declare-const i@177@01 Int)
(push) ; 4
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 5
; [then-branch: 1 | !(a@176@01 in as@162@01) | live]
; [else-branch: 1 | a@176@01 in as@162@01 | live]
(push) ; 6
; [then-branch: 1 | !(a@176@01 in as@162@01)]
(assert (not (Set_in a@176@01 as@162@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | a@176@01 in as@162@01]
(assert (Set_in a@176@01 as@162@01))
; [eval] (i in is)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@176@01 as@162@01) (not (Set_in a@176@01 as@162@01))))
(assert (and (Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01)))
(pop) ; 4
(declare-fun inv@178@01 ($Ref Int) $Ref)
(declare-fun img@179@01 ($Ref Int) Bool)
(declare-fun inv@180@01 ($Ref Int) Int)
(declare-fun img@181@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@176@01 $Ref) (i@177@01 Int)) (!
  (=>
    (and (Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01))
    (or (Set_in a@176@01 as@162@01) (not (Set_in a@176@01 as@162@01))))
  :pattern ((Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01))
  :pattern ((Set_in a@176@01 as@162@01) (inv@178@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (inv@180@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (img@179@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (img@181@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (inv@178@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (inv@180@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (img@179@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (img@181@01 a@176@01 i@177@01))
  :pattern ((inv@178@01 a@176@01 i@177@01))
  :pattern ((inv@180@01 a@176@01 i@177@01))
  :pattern ((img@179@01 a@176@01 i@177@01))
  :pattern ((img@181@01 a@176@01 i@177@01))
  :qid |two-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@176@01 $Ref) (i1@177@01 Int) (a2@176@01 $Ref) (i2@177@01 Int)) (!
  (=>
    (and
      (and
        (and (Set_in a1@176@01 as@162@01) (Set_in i1@177@01 is@163@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@173@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@176@01)
          ($SortWrappers.IntTo$Snap i1@177@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@176@01)
          ($SortWrappers.IntTo$Snap i1@177@01))))
      (and
        (and (Set_in a2@176@01 as@162@01) (Set_in i2@177@01 is@163@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@173@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@176@01)
          ($SortWrappers.IntTo$Snap i2@177@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@176@01)
          ($SortWrappers.IntTo$Snap i2@177@01))))
      (and (= a1@176@01 a2@176@01) (= i1@177@01 i2@177@01)))
    (and (= a1@176@01 a2@176@01) (= i1@177@01 i2@177@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@176@01 $Ref) (i@177@01 Int)) (!
  (=>
    (and (Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01))
    (and
      (and
        (= (inv@178@01 a@176@01 i@177@01) a@176@01)
        (= (inv@180@01 a@176@01 i@177@01) i@177@01))
      (and (img@179@01 a@176@01 i@177@01) (img@181@01 a@176@01 i@177@01))))
  :pattern ((Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01))
  :pattern ((Set_in a@176@01 as@162@01) (inv@178@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (inv@180@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (img@179@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (img@181@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (inv@178@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (inv@180@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (img@179@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (img@181@01 a@176@01 i@177@01))
  :pattern ((inv@178@01 a@176@01 i@177@01))
  :pattern ((inv@180@01 a@176@01 i@177@01))
  :pattern ((img@179@01 a@176@01 i@177@01))
  :pattern ((img@181@01 a@176@01 i@177@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@179@01 a i) (img@181@01 a i))
      (and
        (Set_in (inv@178@01 a i) as@162@01)
        (Set_in (inv@180@01 a i) is@163@01)))
    (and (= (inv@178@01 a i) a) (= (inv@180@01 a i) i)))
  :pattern ((inv@178@01 a i))
  :pattern ((inv@180@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@178@01 a i) as@162@01) (Set_in (inv@180@01 a i) is@163@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@173@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@178@01 a i) (inv@180@01 a i))
  :qid |quant-u-126|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@182@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@178@01 a i) as@162@01)
        (Set_in (inv@180@01 a i) is@163@01))
      (and (img@179@01 a i) (img@181@01 a i))
      (and (= a (inv@178@01 a i)) (= i (inv@180@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@170@01 a i) (img@172@01 a i))
          (and
            (Set_in (inv@169@01 a i) as@162@01)
            (Set_in (inv@171@01 a i) is@163@01)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@170@01 a i) (img@172@01 a i))
          (and
            (Set_in (inv@169@01 a i) as@162@01)
            (Set_in (inv@171@01 a i) is@163@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@182@01 a i))
    $Perm.No)
  
  :qid |quant-u-128|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@178@01 a i) as@162@01)
        (Set_in (inv@180@01 a i) is@163@01))
      (and (img@179@01 a i) (img@181@01 a i))
      (and (= a (inv@178@01 a i)) (= i (inv@180@01 a i))))
    (= (- $Perm.Write (pTaken@182@01 a i)) $Perm.No))
  
  :qid |quant-u-129|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@183@01 $PSF<two>)
(declare-const s@184@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@184@01 $Snap)) (!
  (and
    (=>
      (Set_in s@184@01 ($PSF.domain_two (as sm@183@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@178@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) as@162@01)
          (Set_in (inv@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) is@163@01))
        (and
          (img@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (img@181@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))))
    (=>
      (and
        (and
          (Set_in (inv@178@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) as@162@01)
          (Set_in (inv@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) is@163@01))
        (and
          (img@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (img@181@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))))
      (Set_in s@184@01 ($PSF.domain_two (as sm@183@01  $PSF<two>)))))
  :pattern ((Set_in s@184@01 ($PSF.domain_two (as sm@183@01  $PSF<two>))))
  :qid |qp.psmDomDef106|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@184@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@178@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) as@162@01)
          (Set_in (inv@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) is@163@01))
        (and
          (img@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (img@181@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))))
      (and
        (and
          (img@170@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (img@172@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
        (and
          (Set_in (inv@169@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) as@162@01)
          (Set_in (inv@171@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) is@163@01))))
    (and
      (not (= s@184@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@183@01  $PSF<two>) s@184@01)
        ($PSF.lookup_two $t@168@01 s@184@01))))
  :pattern (($PSF.lookup_two (as sm@183@01  $PSF<two>) s@184@01))
  :pattern (($PSF.lookup_two $t@168@01 s@184@01))
  :qid |qp.psmValDef104|)))
(assert (forall ((s@184@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@168@01 s@184@01) s@184@01)
  :pattern (($PSF.lookup_two (as sm@183@01  $PSF<two>) s@184@01))
  :qid |qp.psmResTrgDef105|)))
(assert (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@183@01  $PSF<two>)) as@162@01 is@163@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((a@176@01 $Ref) (i@177@01 Int)) (!
  (=>
    (and (Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01))
    (and
      (and
        (= (inv@178@01 a@176@01 i@177@01) a@176@01)
        (= (inv@180@01 a@176@01 i@177@01) i@177@01))
      (and (img@179@01 a@176@01 i@177@01) (img@181@01 a@176@01 i@177@01))))
  :pattern ((Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01))
  :pattern ((Set_in a@176@01 as@162@01) (inv@178@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (inv@180@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (img@179@01 a@176@01 i@177@01))
  :pattern ((Set_in a@176@01 as@162@01) (img@181@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (inv@178@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (inv@180@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (img@179@01 a@176@01 i@177@01))
  :pattern ((Set_in i@177@01 is@163@01) (img@181@01 a@176@01 i@177@01))
  :pattern ((inv@178@01 a@176@01 i@177@01))
  :pattern ((inv@180@01 a@176@01 i@177@01))
  :pattern ((img@179@01 a@176@01 i@177@01))
  :pattern ((img@181@01 a@176@01 i@177@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@179@01 a i) (img@181@01 a i))
      (and
        (Set_in (inv@178@01 a i) as@162@01)
        (Set_in (inv@180@01 a i) is@163@01)))
    (and (= (inv@178@01 a i) a) (= (inv@180@01 a i) i)))
  :pattern ((inv@178@01 a i))
  :pattern ((inv@180@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((s@184@01 $Snap)) (!
  (and
    (=>
      (Set_in s@184@01 ($PSF.domain_two (as sm@183@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@178@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) as@162@01)
          (Set_in (inv@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) is@163@01))
        (and
          (img@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (img@181@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))))
    (=>
      (and
        (and
          (Set_in (inv@178@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) as@162@01)
          (Set_in (inv@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) is@163@01))
        (and
          (img@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (img@181@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))))
      (Set_in s@184@01 ($PSF.domain_two (as sm@183@01  $PSF<two>)))))
  :pattern ((Set_in s@184@01 ($PSF.domain_two (as sm@183@01  $PSF<two>))))
  :qid |qp.psmDomDef106|)))
(assert (forall ((s@184@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@178@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) as@162@01)
          (Set_in (inv@180@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) is@163@01))
        (and
          (img@179@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (img@181@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))))
      (and
        (and
          (img@170@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01)))
          (img@172@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))))
        (and
          (Set_in (inv@169@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) as@162@01)
          (Set_in (inv@171@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@184@01)) ($SortWrappers.$SnapToInt ($Snap.second s@184@01))) is@163@01))))
    (and
      (not (= s@184@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@183@01  $PSF<two>) s@184@01)
        ($PSF.lookup_two $t@168@01 s@184@01))))
  :pattern (($PSF.lookup_two (as sm@183@01  $PSF<two>) s@184@01))
  :pattern (($PSF.lookup_two $t@168@01 s@184@01))
  :qid |qp.psmValDef104|)))
(assert (forall ((s@184@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@168@01 s@184@01) s@184@01)
  :pattern (($PSF.lookup_two (as sm@183@01  $PSF<two>) s@184@01))
  :qid |qp.psmResTrgDef105|)))
(assert (and
  (forall ((a@176@01 $Ref) (i@177@01 Int)) (!
    (=>
      (and (Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01))
      (or (Set_in a@176@01 as@162@01) (not (Set_in a@176@01 as@162@01))))
    :pattern ((Set_in a@176@01 as@162@01) (Set_in i@177@01 is@163@01))
    :pattern ((Set_in a@176@01 as@162@01) (inv@178@01 a@176@01 i@177@01))
    :pattern ((Set_in a@176@01 as@162@01) (inv@180@01 a@176@01 i@177@01))
    :pattern ((Set_in a@176@01 as@162@01) (img@179@01 a@176@01 i@177@01))
    :pattern ((Set_in a@176@01 as@162@01) (img@181@01 a@176@01 i@177@01))
    :pattern ((Set_in i@177@01 is@163@01) (inv@178@01 a@176@01 i@177@01))
    :pattern ((Set_in i@177@01 is@163@01) (inv@180@01 a@176@01 i@177@01))
    :pattern ((Set_in i@177@01 is@163@01) (img@179@01 a@176@01 i@177@01))
    :pattern ((Set_in i@177@01 is@163@01) (img@181@01 a@176@01 i@177@01))
    :pattern ((inv@178@01 a@176@01 i@177@01))
    :pattern ((inv@180@01 a@176@01 i@177@01))
    :pattern ((img@179@01 a@176@01 i@177@01))
    :pattern ((img@181@01 a@176@01 i@177@01))
    :qid |two-aux|))
  (forall ((a $Ref) (i Int)) (!
    (=>
      (and
        (Set_in (inv@178@01 a i) as@162@01)
        (Set_in (inv@180@01 a i) is@163@01))
      ($PSF.loc_two ($PSF.lookup_two (as sm@173@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))))
    :pattern ((inv@178@01 a i) (inv@180@01 a i))
    :qid |quant-u-126|))
  (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@183@01  $PSF<two>)) as@162@01 is@163@01)))
(assert (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@183@01  $PSF<two>)) as@162@01 is@163@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale foo_twos(as, is) == 0
; [eval] foo_twos(as, is) == 0
; [eval] foo_twos(as, is)
(set-option :timeout 0)
(push) ; 3
(declare-const a@185@01 $Ref)
(declare-const i@186@01 Int)
(push) ; 4
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 5
; [then-branch: 2 | !(a@185@01 in as@162@01) | live]
; [else-branch: 2 | a@185@01 in as@162@01 | live]
(push) ; 6
; [then-branch: 2 | !(a@185@01 in as@162@01)]
(assert (not (Set_in a@185@01 as@162@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | a@185@01 in as@162@01]
(assert (Set_in a@185@01 as@162@01))
; [eval] (i in is)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@185@01 as@162@01) (not (Set_in a@185@01 as@162@01))))
(assert (and (Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01)))
(pop) ; 4
(declare-fun inv@187@01 ($Ref Int) $Ref)
(declare-fun img@188@01 ($Ref Int) Bool)
(declare-fun inv@189@01 ($Ref Int) Int)
(declare-fun img@190@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@185@01 $Ref) (i@186@01 Int)) (!
  (=>
    (and (Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01))
    (or (Set_in a@185@01 as@162@01) (not (Set_in a@185@01 as@162@01))))
  :pattern ((Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01))
  :pattern ((Set_in a@185@01 as@162@01) (inv@187@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (inv@189@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (img@188@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (img@190@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (inv@187@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (inv@189@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (img@188@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (img@190@01 a@185@01 i@186@01))
  :pattern ((inv@187@01 a@185@01 i@186@01))
  :pattern ((inv@189@01 a@185@01 i@186@01))
  :pattern ((img@188@01 a@185@01 i@186@01))
  :pattern ((img@190@01 a@185@01 i@186@01))
  :qid |two-aux|)))
(declare-const sm@191@01 $PSF<two>)
(declare-const s@192@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@192@01 $Snap)) (!
  (=>
    (and
      (and
        (img@170@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01)))
        (img@172@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01))))
      (and
        (Set_in (inv@169@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01))) as@162@01)
        (Set_in (inv@171@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01))) is@163@01)))
    (and
      (not (= s@192@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@191@01  $PSF<two>) s@192@01)
        ($PSF.lookup_two $t@168@01 s@192@01))))
  :pattern (($PSF.lookup_two (as sm@191@01  $PSF<two>) s@192@01))
  :pattern (($PSF.lookup_two $t@168@01 s@192@01))
  :qid |qp.psmValDef107|)))
(assert (forall ((s@192@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@168@01 s@192@01) s@192@01)
  :pattern (($PSF.lookup_two (as sm@191@01  $PSF<two>) s@192@01))
  :qid |qp.psmResTrgDef108|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@185@01 $Ref) (i1@186@01 Int) (a2@185@01 $Ref) (i2@186@01 Int)) (!
  (=>
    (and
      (and
        (and (Set_in a1@185@01 as@162@01) (Set_in i1@186@01 is@163@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@191@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@185@01)
          ($SortWrappers.IntTo$Snap i1@186@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@185@01)
          ($SortWrappers.IntTo$Snap i1@186@01))))
      (and
        (and (Set_in a2@185@01 as@162@01) (Set_in i2@186@01 is@163@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@191@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@185@01)
          ($SortWrappers.IntTo$Snap i2@186@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@185@01)
          ($SortWrappers.IntTo$Snap i2@186@01))))
      (and (= a1@185@01 a2@185@01) (= i1@186@01 i2@186@01)))
    (and (= a1@185@01 a2@185@01) (= i1@186@01 i2@186@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@185@01 $Ref) (i@186@01 Int)) (!
  (=>
    (and (Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01))
    (and
      (and
        (= (inv@187@01 a@185@01 i@186@01) a@185@01)
        (= (inv@189@01 a@185@01 i@186@01) i@186@01))
      (and (img@188@01 a@185@01 i@186@01) (img@190@01 a@185@01 i@186@01))))
  :pattern ((Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01))
  :pattern ((Set_in a@185@01 as@162@01) (inv@187@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (inv@189@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (img@188@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (img@190@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (inv@187@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (inv@189@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (img@188@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (img@190@01 a@185@01 i@186@01))
  :pattern ((inv@187@01 a@185@01 i@186@01))
  :pattern ((inv@189@01 a@185@01 i@186@01))
  :pattern ((img@188@01 a@185@01 i@186@01))
  :pattern ((img@190@01 a@185@01 i@186@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@188@01 a i) (img@190@01 a i))
      (and
        (Set_in (inv@187@01 a i) as@162@01)
        (Set_in (inv@189@01 a i) is@163@01)))
    (and (= (inv@187@01 a i) a) (= (inv@189@01 a i) i)))
  :pattern ((inv@187@01 a i))
  :pattern ((inv@189@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@187@01 a i) as@162@01) (Set_in (inv@189@01 a i) is@163@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@191@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@187@01 a i) (inv@189@01 a i))
  :qid |quant-u-131|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@193@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@187@01 a i) as@162@01)
        (Set_in (inv@189@01 a i) is@163@01))
      (and (img@188@01 a i) (img@190@01 a i))
      (and (= a (inv@187@01 a i)) (= i (inv@189@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@170@01 a i) (img@172@01 a i))
          (and
            (Set_in (inv@169@01 a i) as@162@01)
            (Set_in (inv@171@01 a i) is@163@01)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@170@01 a i) (img@172@01 a i))
          (and
            (Set_in (inv@169@01 a i) as@162@01)
            (Set_in (inv@171@01 a i) is@163@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@193@01 a i))
    $Perm.No)
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@187@01 a i) as@162@01)
        (Set_in (inv@189@01 a i) is@163@01))
      (and (img@188@01 a i) (img@190@01 a i))
      (and (= a (inv@187@01 a i)) (= i (inv@189@01 a i))))
    (= (- $Perm.Write (pTaken@193@01 a i)) $Perm.No))
  
  :qid |quant-u-134|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@194@01 $PSF<two>)
(declare-const s@195@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@195@01 $Snap)) (!
  (and
    (=>
      (Set_in s@195@01 ($PSF.domain_two (as sm@194@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@187@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) as@162@01)
          (Set_in (inv@189@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) is@163@01))
        (and
          (img@188@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))
          (img@190@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))))))
    (=>
      (and
        (and
          (Set_in (inv@187@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) as@162@01)
          (Set_in (inv@189@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) is@163@01))
        (and
          (img@188@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))
          (img@190@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))))
      (Set_in s@195@01 ($PSF.domain_two (as sm@194@01  $PSF<two>)))))
  :pattern ((Set_in s@195@01 ($PSF.domain_two (as sm@194@01  $PSF<two>))))
  :qid |qp.psmDomDef111|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@195@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@187@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) as@162@01)
          (Set_in (inv@189@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) is@163@01))
        (and
          (img@188@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))
          (img@190@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))))
      (and
        (and
          (img@170@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))
          (img@172@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))))
        (and
          (Set_in (inv@169@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) as@162@01)
          (Set_in (inv@171@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) is@163@01))))
    (and
      (not (= s@195@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@194@01  $PSF<two>) s@195@01)
        ($PSF.lookup_two $t@168@01 s@195@01))))
  :pattern (($PSF.lookup_two (as sm@194@01  $PSF<two>) s@195@01))
  :pattern (($PSF.lookup_two $t@168@01 s@195@01))
  :qid |qp.psmValDef109|)))
(assert (forall ((s@195@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@168@01 s@195@01) s@195@01)
  :pattern (($PSF.lookup_two (as sm@194@01  $PSF<two>) s@195@01))
  :qid |qp.psmResTrgDef110|)))
(assert (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@194@01  $PSF<two>)) as@162@01 is@163@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((s@192@01 $Snap)) (!
  (=>
    (and
      (and
        (img@170@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01)))
        (img@172@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01))))
      (and
        (Set_in (inv@169@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01))) as@162@01)
        (Set_in (inv@171@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01))) is@163@01)))
    (and
      (not (= s@192@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@191@01  $PSF<two>) s@192@01)
        ($PSF.lookup_two $t@168@01 s@192@01))))
  :pattern (($PSF.lookup_two (as sm@191@01  $PSF<two>) s@192@01))
  :pattern (($PSF.lookup_two $t@168@01 s@192@01))
  :qid |qp.psmValDef107|)))
(assert (forall ((s@192@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@168@01 s@192@01) s@192@01)
  :pattern (($PSF.lookup_two (as sm@191@01  $PSF<two>) s@192@01))
  :qid |qp.psmResTrgDef108|)))
(assert (forall ((a@185@01 $Ref) (i@186@01 Int)) (!
  (=>
    (and (Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01))
    (and
      (and
        (= (inv@187@01 a@185@01 i@186@01) a@185@01)
        (= (inv@189@01 a@185@01 i@186@01) i@186@01))
      (and (img@188@01 a@185@01 i@186@01) (img@190@01 a@185@01 i@186@01))))
  :pattern ((Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01))
  :pattern ((Set_in a@185@01 as@162@01) (inv@187@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (inv@189@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (img@188@01 a@185@01 i@186@01))
  :pattern ((Set_in a@185@01 as@162@01) (img@190@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (inv@187@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (inv@189@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (img@188@01 a@185@01 i@186@01))
  :pattern ((Set_in i@186@01 is@163@01) (img@190@01 a@185@01 i@186@01))
  :pattern ((inv@187@01 a@185@01 i@186@01))
  :pattern ((inv@189@01 a@185@01 i@186@01))
  :pattern ((img@188@01 a@185@01 i@186@01))
  :pattern ((img@190@01 a@185@01 i@186@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@188@01 a i) (img@190@01 a i))
      (and
        (Set_in (inv@187@01 a i) as@162@01)
        (Set_in (inv@189@01 a i) is@163@01)))
    (and (= (inv@187@01 a i) a) (= (inv@189@01 a i) i)))
  :pattern ((inv@187@01 a i))
  :pattern ((inv@189@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((s@195@01 $Snap)) (!
  (and
    (=>
      (Set_in s@195@01 ($PSF.domain_two (as sm@194@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@187@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) as@162@01)
          (Set_in (inv@189@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) is@163@01))
        (and
          (img@188@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))
          (img@190@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))))))
    (=>
      (and
        (and
          (Set_in (inv@187@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) as@162@01)
          (Set_in (inv@189@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) is@163@01))
        (and
          (img@188@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))
          (img@190@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))))
      (Set_in s@195@01 ($PSF.domain_two (as sm@194@01  $PSF<two>)))))
  :pattern ((Set_in s@195@01 ($PSF.domain_two (as sm@194@01  $PSF<two>))))
  :qid |qp.psmDomDef111|)))
(assert (forall ((s@195@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@187@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) as@162@01)
          (Set_in (inv@189@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) is@163@01))
        (and
          (img@188@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))
          (img@190@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))))
      (and
        (and
          (img@170@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01)))
          (img@172@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))))
        (and
          (Set_in (inv@169@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) as@162@01)
          (Set_in (inv@171@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@195@01)) ($SortWrappers.$SnapToInt ($Snap.second s@195@01))) is@163@01))))
    (and
      (not (= s@195@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@194@01  $PSF<two>) s@195@01)
        ($PSF.lookup_two $t@168@01 s@195@01))))
  :pattern (($PSF.lookup_two (as sm@194@01  $PSF<two>) s@195@01))
  :pattern (($PSF.lookup_two $t@168@01 s@195@01))
  :qid |qp.psmValDef109|)))
(assert (forall ((s@195@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@168@01 s@195@01) s@195@01)
  :pattern (($PSF.lookup_two (as sm@194@01  $PSF<two>) s@195@01))
  :qid |qp.psmResTrgDef110|)))
(assert (and
  (forall ((a@185@01 $Ref) (i@186@01 Int)) (!
    (=>
      (and (Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01))
      (or (Set_in a@185@01 as@162@01) (not (Set_in a@185@01 as@162@01))))
    :pattern ((Set_in a@185@01 as@162@01) (Set_in i@186@01 is@163@01))
    :pattern ((Set_in a@185@01 as@162@01) (inv@187@01 a@185@01 i@186@01))
    :pattern ((Set_in a@185@01 as@162@01) (inv@189@01 a@185@01 i@186@01))
    :pattern ((Set_in a@185@01 as@162@01) (img@188@01 a@185@01 i@186@01))
    :pattern ((Set_in a@185@01 as@162@01) (img@190@01 a@185@01 i@186@01))
    :pattern ((Set_in i@186@01 is@163@01) (inv@187@01 a@185@01 i@186@01))
    :pattern ((Set_in i@186@01 is@163@01) (inv@189@01 a@185@01 i@186@01))
    :pattern ((Set_in i@186@01 is@163@01) (img@188@01 a@185@01 i@186@01))
    :pattern ((Set_in i@186@01 is@163@01) (img@190@01 a@185@01 i@186@01))
    :pattern ((inv@187@01 a@185@01 i@186@01))
    :pattern ((inv@189@01 a@185@01 i@186@01))
    :pattern ((img@188@01 a@185@01 i@186@01))
    :pattern ((img@190@01 a@185@01 i@186@01))
    :qid |two-aux|))
  (forall ((a $Ref) (i Int)) (!
    (=>
      (and
        (Set_in (inv@187@01 a i) as@162@01)
        (Set_in (inv@189@01 a i) is@163@01))
      ($PSF.loc_two ($PSF.lookup_two (as sm@191@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))))
    :pattern ((inv@187@01 a i) (inv@189@01 a i))
    :qid |quant-u-131|))
  (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@194@01  $PSF<two>)) as@162@01 is@163@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@194@01  $PSF<two>)) as@162@01 is@163@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@194@01  $PSF<two>)) as@162@01 is@163@01)
  0))
(pop) ; 2
(pop) ; 1
; ---------- test_twos_2 ----------
(declare-const as@196@01 Set<$Ref>)
(declare-const is@197@01 Set<Int>)
(declare-const as@198@01 Set<$Ref>)
(declare-const is@199@01 Set<Int>)
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
; var a1: Ref
(declare-const a1@200@01 $Ref)
; [exec]
; var i1: Int
(declare-const i1@201@01 Int)
; [exec]
; inhale (forall a: Ref, i: Int ::
;     { two(a, i) }
;     (a in as) && (i in is) ==> acc(two(a, i), write))
(declare-const a@202@01 $Ref)
(declare-const i@203@01 Int)
(push) ; 3
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 4
; [then-branch: 3 | !(a@202@01 in as@198@01) | live]
; [else-branch: 3 | a@202@01 in as@198@01 | live]
(push) ; 5
; [then-branch: 3 | !(a@202@01 in as@198@01)]
(assert (not (Set_in a@202@01 as@198@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | a@202@01 in as@198@01]
(assert (Set_in a@202@01 as@198@01))
; [eval] (i in is)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@202@01 as@198@01) (not (Set_in a@202@01 as@198@01))))
(assert (and (Set_in a@202@01 as@198@01) (Set_in i@203@01 is@199@01)))
(declare-const sm@204@01 $PSF<two>)
(declare-const s@205@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@206@01 $PSF<two>)
(declare-fun inv@207@01 ($Ref Int) $Ref)
(declare-fun img@208@01 ($Ref Int) Bool)
(declare-fun inv@209@01 ($Ref Int) Int)
(declare-fun img@210@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@202@01 $Ref) (i@203@01 Int)) (!
  (=>
    (and (Set_in a@202@01 as@198@01) (Set_in i@203@01 is@199@01))
    (or (Set_in a@202@01 as@198@01) (not (Set_in a@202@01 as@198@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two $t@206@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@202@01)
    ($SortWrappers.IntTo$Snap i@203@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@202@01)
    ($SortWrappers.IntTo$Snap i@203@01))))
  :qid |two-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@202@01 $Ref) (i1@203@01 Int) (a2@202@01 $Ref) (i2@203@01 Int)) (!
  (=>
    (and
      (and (Set_in a1@202@01 as@198@01) (Set_in i1@203@01 is@199@01))
      (and (Set_in a2@202@01 as@198@01) (Set_in i2@203@01 is@199@01))
      (and (= a1@202@01 a2@202@01) (= i1@203@01 i2@203@01)))
    (and (= a1@202@01 a2@202@01) (= i1@203@01 i2@203@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@202@01 $Ref) (i@203@01 Int)) (!
  (=>
    (and (Set_in a@202@01 as@198@01) (Set_in i@203@01 is@199@01))
    (and
      (and
        (= (inv@207@01 a@202@01 i@203@01) a@202@01)
        (= (inv@209@01 a@202@01 i@203@01) i@203@01))
      (and (img@208@01 a@202@01 i@203@01) (img@210@01 a@202@01 i@203@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two $t@206@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@202@01)
    ($SortWrappers.IntTo$Snap i@203@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@202@01)
    ($SortWrappers.IntTo$Snap i@203@01))))
  :qid |quant-u-136|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@208@01 a i) (img@210@01 a i))
      (and
        (Set_in (inv@207@01 a i) as@198@01)
        (Set_in (inv@209@01 a i) is@199@01)))
    (and (= (inv@207@01 a i) a) (= (inv@209@01 a i) i)))
  :pattern ((inv@207@01 a i))
  :pattern ((inv@209@01 a i))
  :qid |two-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@211@01 $PSF<two>)
(declare-const s@212@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@212@01 $Snap)) (!
  (=>
    (and
      (and
        (img@208@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@212@01)) ($SortWrappers.$SnapToInt ($Snap.second s@212@01)))
        (img@210@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@212@01)) ($SortWrappers.$SnapToInt ($Snap.second s@212@01))))
      (and
        (Set_in (inv@207@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@212@01)) ($SortWrappers.$SnapToInt ($Snap.second s@212@01))) as@198@01)
        (Set_in (inv@209@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@212@01)) ($SortWrappers.$SnapToInt ($Snap.second s@212@01))) is@199@01)))
    (and
      (not (= s@212@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@211@01  $PSF<two>) s@212@01)
        ($PSF.lookup_two $t@206@01 s@212@01))))
  :pattern (($PSF.lookup_two (as sm@211@01  $PSF<two>) s@212@01))
  :pattern (($PSF.lookup_two $t@206@01 s@212@01))
  :qid |qp.psmValDef113|)))
(assert (forall ((s@212@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@206@01 s@212@01) s@212@01)
  :pattern (($PSF.lookup_two (as sm@211@01  $PSF<two>) s@212@01))
  :qid |qp.psmResTrgDef114|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@207@01 a i) as@198@01) (Set_in (inv@209@01 a i) is@199@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@211@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@207@01 a i) (inv@209@01 a i))
  :qid |quant-u-137|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale foo_twos(as, is) == 0
(declare-const $t@213@01 $Snap)
(assert (= $t@213@01 $Snap.unit))
; [eval] foo_twos(as, is) == 0
; [eval] foo_twos(as, is)
(set-option :timeout 0)
(push) ; 3
(declare-const a@214@01 $Ref)
(declare-const i@215@01 Int)
(push) ; 4
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 5
; [then-branch: 4 | !(a@214@01 in as@198@01) | live]
; [else-branch: 4 | a@214@01 in as@198@01 | live]
(push) ; 6
; [then-branch: 4 | !(a@214@01 in as@198@01)]
(assert (not (Set_in a@214@01 as@198@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | a@214@01 in as@198@01]
(assert (Set_in a@214@01 as@198@01))
; [eval] (i in is)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@214@01 as@198@01) (not (Set_in a@214@01 as@198@01))))
(assert (and (Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01)))
(pop) ; 4
(declare-fun inv@216@01 ($Ref Int) $Ref)
(declare-fun img@217@01 ($Ref Int) Bool)
(declare-fun inv@218@01 ($Ref Int) Int)
(declare-fun img@219@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@214@01 $Ref) (i@215@01 Int)) (!
  (=>
    (and (Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01))
    (or (Set_in a@214@01 as@198@01) (not (Set_in a@214@01 as@198@01))))
  :pattern ((Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01))
  :pattern ((Set_in a@214@01 as@198@01) (inv@216@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (inv@218@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (img@217@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (img@219@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (inv@216@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (inv@218@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (img@217@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (img@219@01 a@214@01 i@215@01))
  :pattern ((inv@216@01 a@214@01 i@215@01))
  :pattern ((inv@218@01 a@214@01 i@215@01))
  :pattern ((img@217@01 a@214@01 i@215@01))
  :pattern ((img@219@01 a@214@01 i@215@01))
  :qid |two-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@214@01 $Ref) (i1@215@01 Int) (a2@214@01 $Ref) (i2@215@01 Int)) (!
  (=>
    (and
      (and
        (and (Set_in a1@214@01 as@198@01) (Set_in i1@215@01 is@199@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@211@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@214@01)
          ($SortWrappers.IntTo$Snap i1@215@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@214@01)
          ($SortWrappers.IntTo$Snap i1@215@01))))
      (and
        (and (Set_in a2@214@01 as@198@01) (Set_in i2@215@01 is@199@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@211@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@214@01)
          ($SortWrappers.IntTo$Snap i2@215@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@214@01)
          ($SortWrappers.IntTo$Snap i2@215@01))))
      (and (= a1@214@01 a2@214@01) (= i1@215@01 i2@215@01)))
    (and (= a1@214@01 a2@214@01) (= i1@215@01 i2@215@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@214@01 $Ref) (i@215@01 Int)) (!
  (=>
    (and (Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01))
    (and
      (and
        (= (inv@216@01 a@214@01 i@215@01) a@214@01)
        (= (inv@218@01 a@214@01 i@215@01) i@215@01))
      (and (img@217@01 a@214@01 i@215@01) (img@219@01 a@214@01 i@215@01))))
  :pattern ((Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01))
  :pattern ((Set_in a@214@01 as@198@01) (inv@216@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (inv@218@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (img@217@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (img@219@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (inv@216@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (inv@218@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (img@217@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (img@219@01 a@214@01 i@215@01))
  :pattern ((inv@216@01 a@214@01 i@215@01))
  :pattern ((inv@218@01 a@214@01 i@215@01))
  :pattern ((img@217@01 a@214@01 i@215@01))
  :pattern ((img@219@01 a@214@01 i@215@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@217@01 a i) (img@219@01 a i))
      (and
        (Set_in (inv@216@01 a i) as@198@01)
        (Set_in (inv@218@01 a i) is@199@01)))
    (and (= (inv@216@01 a i) a) (= (inv@218@01 a i) i)))
  :pattern ((inv@216@01 a i))
  :pattern ((inv@218@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@216@01 a i) as@198@01) (Set_in (inv@218@01 a i) is@199@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@211@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@216@01 a i) (inv@218@01 a i))
  :qid |quant-u-139|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@220@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@216@01 a i) as@198@01)
        (Set_in (inv@218@01 a i) is@199@01))
      (and (img@217@01 a i) (img@219@01 a i))
      (and (= a (inv@216@01 a i)) (= i (inv@218@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@208@01 a i) (img@210@01 a i))
          (and
            (Set_in (inv@207@01 a i) as@198@01)
            (Set_in (inv@209@01 a i) is@199@01)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@208@01 a i) (img@210@01 a i))
          (and
            (Set_in (inv@207@01 a i) as@198@01)
            (Set_in (inv@209@01 a i) is@199@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@220@01 a i))
    $Perm.No)
  
  :qid |quant-u-141|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@216@01 a i) as@198@01)
        (Set_in (inv@218@01 a i) is@199@01))
      (and (img@217@01 a i) (img@219@01 a i))
      (and (= a (inv@216@01 a i)) (= i (inv@218@01 a i))))
    (= (- $Perm.Write (pTaken@220@01 a i)) $Perm.No))
  
  :qid |quant-u-142|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@221@01 $PSF<two>)
(declare-const s@222@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@222@01 $Snap)) (!
  (and
    (=>
      (Set_in s@222@01 ($PSF.domain_two (as sm@221@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@216@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) as@198@01)
          (Set_in (inv@218@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) is@199@01))
        (and
          (img@217@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))
          (img@219@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))))))
    (=>
      (and
        (and
          (Set_in (inv@216@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) as@198@01)
          (Set_in (inv@218@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) is@199@01))
        (and
          (img@217@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))
          (img@219@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))))
      (Set_in s@222@01 ($PSF.domain_two (as sm@221@01  $PSF<two>)))))
  :pattern ((Set_in s@222@01 ($PSF.domain_two (as sm@221@01  $PSF<two>))))
  :qid |qp.psmDomDef117|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@222@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@216@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) as@198@01)
          (Set_in (inv@218@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) is@199@01))
        (and
          (img@217@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))
          (img@219@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))))
      (and
        (and
          (img@208@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))
          (img@210@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))))
        (and
          (Set_in (inv@207@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) as@198@01)
          (Set_in (inv@209@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) is@199@01))))
    (and
      (not (= s@222@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@221@01  $PSF<two>) s@222@01)
        ($PSF.lookup_two $t@206@01 s@222@01))))
  :pattern (($PSF.lookup_two (as sm@221@01  $PSF<two>) s@222@01))
  :pattern (($PSF.lookup_two $t@206@01 s@222@01))
  :qid |qp.psmValDef115|)))
(assert (forall ((s@222@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@206@01 s@222@01) s@222@01)
  :pattern (($PSF.lookup_two (as sm@221@01  $PSF<two>) s@222@01))
  :qid |qp.psmResTrgDef116|)))
(assert (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@221@01  $PSF<two>)) as@198@01 is@199@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((a@214@01 $Ref) (i@215@01 Int)) (!
  (=>
    (and (Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01))
    (and
      (and
        (= (inv@216@01 a@214@01 i@215@01) a@214@01)
        (= (inv@218@01 a@214@01 i@215@01) i@215@01))
      (and (img@217@01 a@214@01 i@215@01) (img@219@01 a@214@01 i@215@01))))
  :pattern ((Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01))
  :pattern ((Set_in a@214@01 as@198@01) (inv@216@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (inv@218@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (img@217@01 a@214@01 i@215@01))
  :pattern ((Set_in a@214@01 as@198@01) (img@219@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (inv@216@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (inv@218@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (img@217@01 a@214@01 i@215@01))
  :pattern ((Set_in i@215@01 is@199@01) (img@219@01 a@214@01 i@215@01))
  :pattern ((inv@216@01 a@214@01 i@215@01))
  :pattern ((inv@218@01 a@214@01 i@215@01))
  :pattern ((img@217@01 a@214@01 i@215@01))
  :pattern ((img@219@01 a@214@01 i@215@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@217@01 a i) (img@219@01 a i))
      (and
        (Set_in (inv@216@01 a i) as@198@01)
        (Set_in (inv@218@01 a i) is@199@01)))
    (and (= (inv@216@01 a i) a) (= (inv@218@01 a i) i)))
  :pattern ((inv@216@01 a i))
  :pattern ((inv@218@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((s@222@01 $Snap)) (!
  (and
    (=>
      (Set_in s@222@01 ($PSF.domain_two (as sm@221@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@216@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) as@198@01)
          (Set_in (inv@218@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) is@199@01))
        (and
          (img@217@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))
          (img@219@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))))))
    (=>
      (and
        (and
          (Set_in (inv@216@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) as@198@01)
          (Set_in (inv@218@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) is@199@01))
        (and
          (img@217@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))
          (img@219@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))))
      (Set_in s@222@01 ($PSF.domain_two (as sm@221@01  $PSF<two>)))))
  :pattern ((Set_in s@222@01 ($PSF.domain_two (as sm@221@01  $PSF<two>))))
  :qid |qp.psmDomDef117|)))
(assert (forall ((s@222@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@216@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) as@198@01)
          (Set_in (inv@218@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) is@199@01))
        (and
          (img@217@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))
          (img@219@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))))
      (and
        (and
          (img@208@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01)))
          (img@210@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))))
        (and
          (Set_in (inv@207@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) as@198@01)
          (Set_in (inv@209@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@222@01)) ($SortWrappers.$SnapToInt ($Snap.second s@222@01))) is@199@01))))
    (and
      (not (= s@222@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@221@01  $PSF<two>) s@222@01)
        ($PSF.lookup_two $t@206@01 s@222@01))))
  :pattern (($PSF.lookup_two (as sm@221@01  $PSF<two>) s@222@01))
  :pattern (($PSF.lookup_two $t@206@01 s@222@01))
  :qid |qp.psmValDef115|)))
(assert (forall ((s@222@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@206@01 s@222@01) s@222@01)
  :pattern (($PSF.lookup_two (as sm@221@01  $PSF<two>) s@222@01))
  :qid |qp.psmResTrgDef116|)))
(assert (and
  (forall ((a@214@01 $Ref) (i@215@01 Int)) (!
    (=>
      (and (Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01))
      (or (Set_in a@214@01 as@198@01) (not (Set_in a@214@01 as@198@01))))
    :pattern ((Set_in a@214@01 as@198@01) (Set_in i@215@01 is@199@01))
    :pattern ((Set_in a@214@01 as@198@01) (inv@216@01 a@214@01 i@215@01))
    :pattern ((Set_in a@214@01 as@198@01) (inv@218@01 a@214@01 i@215@01))
    :pattern ((Set_in a@214@01 as@198@01) (img@217@01 a@214@01 i@215@01))
    :pattern ((Set_in a@214@01 as@198@01) (img@219@01 a@214@01 i@215@01))
    :pattern ((Set_in i@215@01 is@199@01) (inv@216@01 a@214@01 i@215@01))
    :pattern ((Set_in i@215@01 is@199@01) (inv@218@01 a@214@01 i@215@01))
    :pattern ((Set_in i@215@01 is@199@01) (img@217@01 a@214@01 i@215@01))
    :pattern ((Set_in i@215@01 is@199@01) (img@219@01 a@214@01 i@215@01))
    :pattern ((inv@216@01 a@214@01 i@215@01))
    :pattern ((inv@218@01 a@214@01 i@215@01))
    :pattern ((img@217@01 a@214@01 i@215@01))
    :pattern ((img@219@01 a@214@01 i@215@01))
    :qid |two-aux|))
  (forall ((a $Ref) (i Int)) (!
    (=>
      (and
        (Set_in (inv@216@01 a i) as@198@01)
        (Set_in (inv@218@01 a i) is@199@01))
      ($PSF.loc_two ($PSF.lookup_two (as sm@211@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))))
    :pattern ((inv@216@01 a i) (inv@218@01 a i))
    :qid |quant-u-139|))
  (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@221@01  $PSF<two>)) as@198@01 is@199@01)))
(assert (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@221@01  $PSF<two>)) as@198@01 is@199@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (a1 in as)
(declare-const $t@223@01 $Snap)
(assert (= $t@223@01 $Snap.unit))
; [eval] (a1 in as)
(assert (Set_in a1@200@01 as@198@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (i1 in is)
(declare-const $t@224@01 $Snap)
(assert (= $t@224@01 $Snap.unit))
; [eval] (i1 in is)
(assert (Set_in i1@201@01 is@199@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(two(a1, i1), write)
(declare-const sm@225@01 $PSF<two>)
(declare-const s@226@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@226@01 $Snap)) (!
  (=>
    (and
      (and
        (img@208@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@226@01)) ($SortWrappers.$SnapToInt ($Snap.second s@226@01)))
        (img@210@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@226@01)) ($SortWrappers.$SnapToInt ($Snap.second s@226@01))))
      (and
        (Set_in (inv@207@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@226@01)) ($SortWrappers.$SnapToInt ($Snap.second s@226@01))) as@198@01)
        (Set_in (inv@209@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@226@01)) ($SortWrappers.$SnapToInt ($Snap.second s@226@01))) is@199@01)))
    (and
      (not (= s@226@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@225@01  $PSF<two>) s@226@01)
        ($PSF.lookup_two $t@206@01 s@226@01))))
  :pattern (($PSF.lookup_two (as sm@225@01  $PSF<two>) s@226@01))
  :pattern (($PSF.lookup_two $t@206@01 s@226@01))
  :qid |qp.psmValDef118|)))
(assert (forall ((s@226@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two $t@206@01 s@226@01) s@226@01)
  :pattern (($PSF.lookup_two (as sm@225@01  $PSF<two>) s@226@01))
  :qid |qp.psmResTrgDef119|)))
(assert ($PSF.loc_two ($PSF.lookup_two (as sm@225@01  $PSF<two>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@200@01)
  ($SortWrappers.IntTo$Snap i1@201@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@200@01)
  ($SortWrappers.IntTo$Snap i1@201@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@227@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and (= a a1@200@01) (= i i1@201@01))
    ($Perm.min
      (ite
        (and
          (and (img@208@01 a i) (img@210@01 a i))
          (and
            (Set_in (inv@207@01 a i) as@198@01)
            (Set_in (inv@209@01 a i) is@199@01)))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@208@01 a i) (img@210@01 a i))
          (and
            (Set_in (inv@207@01 a i) as@198@01)
            (Set_in (inv@209@01 a i) is@199@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@227@01 a i))
    $Perm.No)
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@227@01 a i) $Perm.No)
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and (= a a1@200@01) (= i i1@201@01))
    (= (- $Perm.Write (pTaken@227@01 a i)) $Perm.No))
  
  :qid |quant-u-146|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (and (img@208@01 a1@200@01 i1@201@01) (img@210@01 a1@200@01 i1@201@01))
    (and
      (Set_in (inv@207@01 a1@200@01 i1@201@01) as@198@01)
      (Set_in (inv@209@01 a1@200@01 i1@201@01) is@199@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@200@01)
          ($SortWrappers.IntTo$Snap i1@201@01))
        $Snap.unit))
    (=
      ($PSF.lookup_two (as sm@225@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a1@200@01)
        ($SortWrappers.IntTo$Snap i1@201@01)))
      ($PSF.lookup_two $t@206@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a1@200@01)
        ($SortWrappers.IntTo$Snap i1@201@01)))))))
(assert ($PSF.loc_two ($PSF.lookup_two $t@206@01 ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@200@01)
  ($SortWrappers.IntTo$Snap i1@201@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@200@01)
  ($SortWrappers.IntTo$Snap i1@201@01))))
(assert (not (= a1@200@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (two%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_two (as sm@225@01  $PSF<two>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@200@01)
  ($SortWrappers.IntTo$Snap i1@201@01)))) a1@200@01 i1@201@01))
; [exec]
; fold acc(two(a1, i1), write)
(declare-const sm@228@01 $PSF<two>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_two (as sm@228@01  $PSF<two>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a1@200@01)
    ($SortWrappers.IntTo$Snap i1@201@01)))
  ($PSF.lookup_two (as sm@225@01  $PSF<two>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a1@200@01)
    ($SortWrappers.IntTo$Snap i1@201@01)))))
(declare-const sm@229@01 $PSF<two>)
(declare-const s@230@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@230@01 $Snap)) (!
  (=>
    (and
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@230@01)) a1@200@01)
      (= ($SortWrappers.$SnapToInt ($Snap.second s@230@01)) i1@201@01))
    (and
      (not (= s@230@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@229@01  $PSF<two>) s@230@01)
        ($PSF.lookup_two (as sm@228@01  $PSF<two>) s@230@01))))
  :pattern (($PSF.lookup_two (as sm@229@01  $PSF<two>) s@230@01))
  :pattern (($PSF.lookup_two (as sm@228@01  $PSF<two>) s@230@01))
  :qid |qp.psmValDef120|)))
(assert (forall ((s@230@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@208@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@230@01)) ($SortWrappers.$SnapToInt ($Snap.second s@230@01)))
          (img@210@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@230@01)) ($SortWrappers.$SnapToInt ($Snap.second s@230@01))))
        (and
          (Set_in (inv@207@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@230@01)) ($SortWrappers.$SnapToInt ($Snap.second s@230@01))) as@198@01)
          (Set_in (inv@209@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@230@01)) ($SortWrappers.$SnapToInt ($Snap.second s@230@01))) is@199@01)))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@227@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@230@01)) ($SortWrappers.$SnapToInt ($Snap.second s@230@01)))))
      false)
    (and
      (not (= s@230@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@229@01  $PSF<two>) s@230@01)
        ($PSF.lookup_two $t@206@01 s@230@01))))
  :pattern (($PSF.lookup_two (as sm@229@01  $PSF<two>) s@230@01))
  :pattern (($PSF.lookup_two $t@206@01 s@230@01))
  :qid |qp.psmValDef121|)))
(assert (forall ((s@230@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@228@01  $PSF<two>) s@230@01) s@230@01)
    ($PSF.loc_two ($PSF.lookup_two $t@206@01 s@230@01) s@230@01))
  :pattern (($PSF.lookup_two (as sm@229@01  $PSF<two>) s@230@01))
  :qid |qp.psmResTrgDef122|)))
(assert ($PSF.loc_two ($PSF.lookup_two (as sm@229@01  $PSF<two>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@200@01)
  ($SortWrappers.IntTo$Snap i1@201@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@200@01)
  ($SortWrappers.IntTo$Snap i1@201@01))))
; [exec]
; exhale foo_twos(as, is) == 0
; [eval] foo_twos(as, is) == 0
; [eval] foo_twos(as, is)
(set-option :timeout 0)
(push) ; 3
(declare-const a@231@01 $Ref)
(declare-const i@232@01 Int)
(push) ; 4
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 5
; [then-branch: 5 | !(a@231@01 in as@198@01) | live]
; [else-branch: 5 | a@231@01 in as@198@01 | live]
(push) ; 6
; [then-branch: 5 | !(a@231@01 in as@198@01)]
(assert (not (Set_in a@231@01 as@198@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | a@231@01 in as@198@01]
(assert (Set_in a@231@01 as@198@01))
; [eval] (i in is)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@231@01 as@198@01) (not (Set_in a@231@01 as@198@01))))
(assert (and (Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01)))
(pop) ; 4
(declare-fun inv@233@01 ($Ref Int) $Ref)
(declare-fun img@234@01 ($Ref Int) Bool)
(declare-fun inv@235@01 ($Ref Int) Int)
(declare-fun img@236@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@231@01 $Ref) (i@232@01 Int)) (!
  (=>
    (and (Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01))
    (or (Set_in a@231@01 as@198@01) (not (Set_in a@231@01 as@198@01))))
  :pattern ((Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01))
  :pattern ((Set_in a@231@01 as@198@01) (inv@233@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (inv@235@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (img@234@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (img@236@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (inv@233@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (inv@235@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (img@234@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (img@236@01 a@231@01 i@232@01))
  :pattern ((inv@233@01 a@231@01 i@232@01))
  :pattern ((inv@235@01 a@231@01 i@232@01))
  :pattern ((img@234@01 a@231@01 i@232@01))
  :pattern ((img@236@01 a@231@01 i@232@01))
  :qid |two-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@231@01 $Ref) (i1@232@01 Int) (a2@231@01 $Ref) (i2@232@01 Int)) (!
  (=>
    (and
      (and
        (and (Set_in a1@231@01 as@198@01) (Set_in i1@232@01 is@199@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@229@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@231@01)
          ($SortWrappers.IntTo$Snap i1@232@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@231@01)
          ($SortWrappers.IntTo$Snap i1@232@01))))
      (and
        (and (Set_in a2@231@01 as@198@01) (Set_in i2@232@01 is@199@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@229@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@231@01)
          ($SortWrappers.IntTo$Snap i2@232@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@231@01)
          ($SortWrappers.IntTo$Snap i2@232@01))))
      (and (= a1@231@01 a2@231@01) (= i1@232@01 i2@232@01)))
    (and (= a1@231@01 a2@231@01) (= i1@232@01 i2@232@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@231@01 $Ref) (i@232@01 Int)) (!
  (=>
    (and (Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01))
    (and
      (and
        (= (inv@233@01 a@231@01 i@232@01) a@231@01)
        (= (inv@235@01 a@231@01 i@232@01) i@232@01))
      (and (img@234@01 a@231@01 i@232@01) (img@236@01 a@231@01 i@232@01))))
  :pattern ((Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01))
  :pattern ((Set_in a@231@01 as@198@01) (inv@233@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (inv@235@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (img@234@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (img@236@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (inv@233@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (inv@235@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (img@234@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (img@236@01 a@231@01 i@232@01))
  :pattern ((inv@233@01 a@231@01 i@232@01))
  :pattern ((inv@235@01 a@231@01 i@232@01))
  :pattern ((img@234@01 a@231@01 i@232@01))
  :pattern ((img@236@01 a@231@01 i@232@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@234@01 a i) (img@236@01 a i))
      (and
        (Set_in (inv@233@01 a i) as@198@01)
        (Set_in (inv@235@01 a i) is@199@01)))
    (and (= (inv@233@01 a i) a) (= (inv@235@01 a i) i)))
  :pattern ((inv@233@01 a i))
  :pattern ((inv@235@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@233@01 a i) as@198@01) (Set_in (inv@235@01 a i) is@199@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@229@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@233@01 a i) (inv@235@01 a i))
  :qid |quant-u-148|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@237@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@233@01 a i) as@198@01)
        (Set_in (inv@235@01 a i) is@199@01))
      (and (img@234@01 a i) (img@236@01 a i))
      (and (= a (inv@233@01 a i)) (= i (inv@235@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@208@01 a i) (img@210@01 a i))
          (and
            (Set_in (inv@207@01 a i) as@198@01)
            (Set_in (inv@209@01 a i) is@199@01)))
        (- $Perm.Write (pTaken@227@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@238@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@233@01 a i) as@198@01)
        (Set_in (inv@235@01 a i) is@199@01))
      (and (img@234@01 a i) (img@236@01 a i))
      (and (= a (inv@233@01 a i)) (= i (inv@235@01 a i))))
    ($Perm.min
      (ite (and (= a a1@200@01) (= i i1@201@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@237@01 a i)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@208@01 a i) (img@210@01 a i))
          (and
            (Set_in (inv@207@01 a i) as@198@01)
            (Set_in (inv@209@01 a i) is@199@01)))
        (- $Perm.Write (pTaken@227@01 a i))
        $Perm.No)
      (pTaken@237@01 a i))
    $Perm.No)
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@233@01 a i) as@198@01)
        (Set_in (inv@235@01 a i) is@199@01))
      (and (img@234@01 a i) (img@236@01 a i))
      (and (= a (inv@233@01 a i)) (= i (inv@235@01 a i))))
    (= (- $Perm.Write (pTaken@237@01 a i)) $Perm.No))
  
  :qid |quant-u-151|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@238@01 a1@200@01 i1@201@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@233@01 a i) as@198@01)
        (Set_in (inv@235@01 a i) is@199@01))
      (and (img@234@01 a i) (img@236@01 a i))
      (and (= a (inv@233@01 a i)) (= i (inv@235@01 a i))))
    (= (- (- $Perm.Write (pTaken@237@01 a i)) (pTaken@238@01 a i)) $Perm.No))
  
  :qid |quant-u-153|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@239@01 $PSF<two>)
(declare-const s@240@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@240@01 $Snap)) (!
  (and
    (=>
      (Set_in s@240@01 ($PSF.domain_two (as sm@239@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@233@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
          (Set_in (inv@235@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01))
        (and
          (img@234@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
          (img@236@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))))))
    (=>
      (and
        (and
          (Set_in (inv@233@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
          (Set_in (inv@235@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01))
        (and
          (img@234@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
          (img@236@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))))
      (Set_in s@240@01 ($PSF.domain_two (as sm@239@01  $PSF<two>)))))
  :pattern ((Set_in s@240@01 ($PSF.domain_two (as sm@239@01  $PSF<two>))))
  :qid |qp.psmDomDef126|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@240@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@233@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
          (Set_in (inv@235@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01))
        (and
          (img@234@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
          (img@236@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) a1@200@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@240@01)) i1@201@01)))
    (and
      (not (= s@240@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01)
        ($PSF.lookup_two (as sm@228@01  $PSF<two>) s@240@01))))
  :pattern (($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01))
  :pattern (($PSF.lookup_two (as sm@228@01  $PSF<two>) s@240@01))
  :qid |qp.psmValDef123|)))
(assert (forall ((s@240@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@233@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
          (Set_in (inv@235@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01))
        (and
          (img@234@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
          (img@236@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))))
      (ite
        (and
          (and
            (img@208@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
            (img@210@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))))
          (and
            (Set_in (inv@207@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
            (Set_in (inv@209@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01)))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@227@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))))
        false))
    (and
      (not (= s@240@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01)
        ($PSF.lookup_two $t@206@01 s@240@01))))
  :pattern (($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01))
  :pattern (($PSF.lookup_two $t@206@01 s@240@01))
  :qid |qp.psmValDef124|)))
(assert (forall ((s@240@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@228@01  $PSF<two>) s@240@01) s@240@01)
    ($PSF.loc_two ($PSF.lookup_two $t@206@01 s@240@01) s@240@01))
  :pattern (($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01))
  :qid |qp.psmResTrgDef125|)))
(assert (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@239@01  $PSF<two>)) as@198@01 is@199@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((a@231@01 $Ref) (i@232@01 Int)) (!
  (=>
    (and (Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01))
    (and
      (and
        (= (inv@233@01 a@231@01 i@232@01) a@231@01)
        (= (inv@235@01 a@231@01 i@232@01) i@232@01))
      (and (img@234@01 a@231@01 i@232@01) (img@236@01 a@231@01 i@232@01))))
  :pattern ((Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01))
  :pattern ((Set_in a@231@01 as@198@01) (inv@233@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (inv@235@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (img@234@01 a@231@01 i@232@01))
  :pattern ((Set_in a@231@01 as@198@01) (img@236@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (inv@233@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (inv@235@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (img@234@01 a@231@01 i@232@01))
  :pattern ((Set_in i@232@01 is@199@01) (img@236@01 a@231@01 i@232@01))
  :pattern ((inv@233@01 a@231@01 i@232@01))
  :pattern ((inv@235@01 a@231@01 i@232@01))
  :pattern ((img@234@01 a@231@01 i@232@01))
  :pattern ((img@236@01 a@231@01 i@232@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@234@01 a i) (img@236@01 a i))
      (and
        (Set_in (inv@233@01 a i) as@198@01)
        (Set_in (inv@235@01 a i) is@199@01)))
    (and (= (inv@233@01 a i) a) (= (inv@235@01 a i) i)))
  :pattern ((inv@233@01 a i))
  :pattern ((inv@235@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((s@240@01 $Snap)) (!
  (and
    (=>
      (Set_in s@240@01 ($PSF.domain_two (as sm@239@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@233@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
          (Set_in (inv@235@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01))
        (and
          (img@234@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
          (img@236@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))))))
    (=>
      (and
        (and
          (Set_in (inv@233@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
          (Set_in (inv@235@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01))
        (and
          (img@234@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
          (img@236@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))))
      (Set_in s@240@01 ($PSF.domain_two (as sm@239@01  $PSF<two>)))))
  :pattern ((Set_in s@240@01 ($PSF.domain_two (as sm@239@01  $PSF<two>))))
  :qid |qp.psmDomDef126|)))
(assert (forall ((s@240@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@233@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
          (Set_in (inv@235@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01))
        (and
          (img@234@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
          (img@236@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) a1@200@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@240@01)) i1@201@01)))
    (and
      (not (= s@240@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01)
        ($PSF.lookup_two (as sm@228@01  $PSF<two>) s@240@01))))
  :pattern (($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01))
  :pattern (($PSF.lookup_two (as sm@228@01  $PSF<two>) s@240@01))
  :qid |qp.psmValDef123|)))
(assert (forall ((s@240@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@233@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
          (Set_in (inv@235@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01))
        (and
          (img@234@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
          (img@236@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))))
      (ite
        (and
          (and
            (img@208@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))
            (img@210@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))))
          (and
            (Set_in (inv@207@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) as@198@01)
            (Set_in (inv@209@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01))) is@199@01)))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@227@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@240@01)) ($SortWrappers.$SnapToInt ($Snap.second s@240@01)))))
        false))
    (and
      (not (= s@240@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01)
        ($PSF.lookup_two $t@206@01 s@240@01))))
  :pattern (($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01))
  :pattern (($PSF.lookup_two $t@206@01 s@240@01))
  :qid |qp.psmValDef124|)))
(assert (forall ((s@240@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@228@01  $PSF<two>) s@240@01) s@240@01)
    ($PSF.loc_two ($PSF.lookup_two $t@206@01 s@240@01) s@240@01))
  :pattern (($PSF.lookup_two (as sm@239@01  $PSF<two>) s@240@01))
  :qid |qp.psmResTrgDef125|)))
(assert (and
  (forall ((a@231@01 $Ref) (i@232@01 Int)) (!
    (=>
      (and (Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01))
      (or (Set_in a@231@01 as@198@01) (not (Set_in a@231@01 as@198@01))))
    :pattern ((Set_in a@231@01 as@198@01) (Set_in i@232@01 is@199@01))
    :pattern ((Set_in a@231@01 as@198@01) (inv@233@01 a@231@01 i@232@01))
    :pattern ((Set_in a@231@01 as@198@01) (inv@235@01 a@231@01 i@232@01))
    :pattern ((Set_in a@231@01 as@198@01) (img@234@01 a@231@01 i@232@01))
    :pattern ((Set_in a@231@01 as@198@01) (img@236@01 a@231@01 i@232@01))
    :pattern ((Set_in i@232@01 is@199@01) (inv@233@01 a@231@01 i@232@01))
    :pattern ((Set_in i@232@01 is@199@01) (inv@235@01 a@231@01 i@232@01))
    :pattern ((Set_in i@232@01 is@199@01) (img@234@01 a@231@01 i@232@01))
    :pattern ((Set_in i@232@01 is@199@01) (img@236@01 a@231@01 i@232@01))
    :pattern ((inv@233@01 a@231@01 i@232@01))
    :pattern ((inv@235@01 a@231@01 i@232@01))
    :pattern ((img@234@01 a@231@01 i@232@01))
    :pattern ((img@236@01 a@231@01 i@232@01))
    :qid |two-aux|))
  (forall ((a $Ref) (i Int)) (!
    (=>
      (and
        (Set_in (inv@233@01 a i) as@198@01)
        (Set_in (inv@235@01 a i) is@199@01))
      ($PSF.loc_two ($PSF.lookup_two (as sm@229@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))))
    :pattern ((inv@233@01 a i) (inv@235@01 a i))
    :qid |quant-u-148|))
  (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@239@01  $PSF<two>)) as@198@01 is@199@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@239@01  $PSF<two>)) as@198@01 is@199@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@239@01  $PSF<two>)) as@198@01 is@199@01)
  0))
(pop) ; 2
(pop) ; 1
; ---------- test_twos_3 ----------
(declare-const as@241@01 Set<$Ref>)
(declare-const is@242@01 Set<Int>)
(declare-const bs@243@01 Set<$Ref>)
(declare-const js@244@01 Set<Int>)
(declare-const as@245@01 Set<$Ref>)
(declare-const is@246@01 Set<Int>)
(declare-const bs@247@01 Set<$Ref>)
(declare-const js@248@01 Set<Int>)
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
; var b1: Ref
(declare-const b1@249@01 $Ref)
; [exec]
; var j1: Int
(declare-const j1@250@01 Int)
; [exec]
; var a1: Ref
(declare-const a1@251@01 $Ref)
; [exec]
; var i1: Int
(declare-const i1@252@01 Int)
; [exec]
; inhale (forall a: Ref, i: Int ::
;     { two(a, i) }
;     (a in as) && (i in is) ==> acc(two(a, i), write)) &&
;   (forall a$0: Ref, i$0: Int ::
;     { two(a$0, i$0) }
;     (a$0 in bs) && (i$0 in js) ==> acc(two(a$0, i$0), write))
(declare-const $t@253@01 $Snap)
(assert (= $t@253@01 ($Snap.combine ($Snap.first $t@253@01) ($Snap.second $t@253@01))))
(declare-const a@254@01 $Ref)
(declare-const i@255@01 Int)
(push) ; 3
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 4
; [then-branch: 6 | !(a@254@01 in as@245@01) | live]
; [else-branch: 6 | a@254@01 in as@245@01 | live]
(push) ; 5
; [then-branch: 6 | !(a@254@01 in as@245@01)]
(assert (not (Set_in a@254@01 as@245@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | a@254@01 in as@245@01]
(assert (Set_in a@254@01 as@245@01))
; [eval] (i in is)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@254@01 as@245@01) (not (Set_in a@254@01 as@245@01))))
(assert (and (Set_in a@254@01 as@245@01) (Set_in i@255@01 is@246@01)))
(declare-const sm@256@01 $PSF<two>)
(declare-const s@257@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@258@01 ($Ref Int) $Ref)
(declare-fun img@259@01 ($Ref Int) Bool)
(declare-fun inv@260@01 ($Ref Int) Int)
(declare-fun img@261@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@254@01 $Ref) (i@255@01 Int)) (!
  (=>
    (and (Set_in a@254@01 as@245@01) (Set_in i@255@01 is@246@01))
    (or (Set_in a@254@01 as@245@01) (not (Set_in a@254@01 as@245@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@254@01)
    ($SortWrappers.IntTo$Snap i@255@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@254@01)
    ($SortWrappers.IntTo$Snap i@255@01))))
  :qid |two-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@254@01 $Ref) (i1@255@01 Int) (a2@254@01 $Ref) (i2@255@01 Int)) (!
  (=>
    (and
      (and (Set_in a1@254@01 as@245@01) (Set_in i1@255@01 is@246@01))
      (and (Set_in a2@254@01 as@245@01) (Set_in i2@255@01 is@246@01))
      (and (= a1@254@01 a2@254@01) (= i1@255@01 i2@255@01)))
    (and (= a1@254@01 a2@254@01) (= i1@255@01 i2@255@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@254@01 $Ref) (i@255@01 Int)) (!
  (=>
    (and (Set_in a@254@01 as@245@01) (Set_in i@255@01 is@246@01))
    (and
      (and
        (= (inv@258@01 a@254@01 i@255@01) a@254@01)
        (= (inv@260@01 a@254@01 i@255@01) i@255@01))
      (and (img@259@01 a@254@01 i@255@01) (img@261@01 a@254@01 i@255@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@254@01)
    ($SortWrappers.IntTo$Snap i@255@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@254@01)
    ($SortWrappers.IntTo$Snap i@255@01))))
  :qid |quant-u-155|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@259@01 a i) (img@261@01 a i))
      (and
        (Set_in (inv@258@01 a i) as@245@01)
        (Set_in (inv@260@01 a i) is@246@01)))
    (and (= (inv@258@01 a i) a) (= (inv@260@01 a i) i)))
  :pattern ((inv@258@01 a i))
  :pattern ((inv@260@01 a i))
  :qid |two-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@262@01 $PSF<two>)
(declare-const s@263@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@263@01 $Snap)) (!
  (=>
    (and
      (and
        (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@263@01)) ($SortWrappers.$SnapToInt ($Snap.second s@263@01)))
        (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@263@01)) ($SortWrappers.$SnapToInt ($Snap.second s@263@01))))
      (and
        (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@263@01)) ($SortWrappers.$SnapToInt ($Snap.second s@263@01))) as@245@01)
        (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@263@01)) ($SortWrappers.$SnapToInt ($Snap.second s@263@01))) is@246@01)))
    (and
      (not (= s@263@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@262@01  $PSF<two>) s@263@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@263@01))))
  :pattern (($PSF.lookup_two (as sm@262@01  $PSF<two>) s@263@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@263@01))
  :qid |qp.psmValDef128|)))
(assert (forall ((s@263@01 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@263@01) s@263@01)
  :pattern (($PSF.lookup_two (as sm@262@01  $PSF<two>) s@263@01))
  :qid |qp.psmResTrgDef129|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@258@01 a i) as@245@01) (Set_in (inv@260@01 a i) is@246@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@262@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@258@01 a i) (inv@260@01 a i))
  :qid |quant-u-156|)))
(declare-const a$0@264@01 $Ref)
(declare-const i$0@265@01 Int)
(push) ; 3
; [eval] (a$0 in bs) && (i$0 in js)
; [eval] (a$0 in bs)
(push) ; 4
; [then-branch: 7 | !(a$0@264@01 in bs@247@01) | live]
; [else-branch: 7 | a$0@264@01 in bs@247@01 | live]
(push) ; 5
; [then-branch: 7 | !(a$0@264@01 in bs@247@01)]
(assert (not (Set_in a$0@264@01 bs@247@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | a$0@264@01 in bs@247@01]
(assert (Set_in a$0@264@01 bs@247@01))
; [eval] (i$0 in js)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a$0@264@01 bs@247@01) (not (Set_in a$0@264@01 bs@247@01))))
(assert (and (Set_in a$0@264@01 bs@247@01) (Set_in i$0@265@01 js@248@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@266@01 ($Ref Int) $Ref)
(declare-fun img@267@01 ($Ref Int) Bool)
(declare-fun inv@268@01 ($Ref Int) Int)
(declare-fun img@269@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a$0@264@01 $Ref) (i$0@265@01 Int)) (!
  (=>
    (and (Set_in a$0@264@01 bs@247@01) (Set_in i$0@265@01 js@248@01))
    (or (Set_in a$0@264@01 bs@247@01) (not (Set_in a$0@264@01 bs@247@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a$0@264@01)
    ($SortWrappers.IntTo$Snap i$0@265@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a$0@264@01)
    ($SortWrappers.IntTo$Snap i$0@265@01))))
  :qid |two-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a$01@264@01 $Ref) (i$01@265@01 Int) (a$02@264@01 $Ref) (i$02@265@01 Int)) (!
  (=>
    (and
      (and (Set_in a$01@264@01 bs@247@01) (Set_in i$01@265@01 js@248@01))
      (and (Set_in a$02@264@01 bs@247@01) (Set_in i$02@265@01 js@248@01))
      (and (= a$01@264@01 a$02@264@01) (= i$01@265@01 i$02@265@01)))
    (and (= a$01@264@01 a$02@264@01) (= i$01@265@01 i$02@265@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a$0@264@01 $Ref) (i$0@265@01 Int)) (!
  (=>
    (and (Set_in a$0@264@01 bs@247@01) (Set_in i$0@265@01 js@248@01))
    (and
      (and
        (= (inv@266@01 a$0@264@01 i$0@265@01) a$0@264@01)
        (= (inv@268@01 a$0@264@01 i$0@265@01) i$0@265@01))
      (and (img@267@01 a$0@264@01 i$0@265@01) (img@269@01 a$0@264@01 i$0@265@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a$0@264@01)
    ($SortWrappers.IntTo$Snap i$0@265@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a$0@264@01)
    ($SortWrappers.IntTo$Snap i$0@265@01))))
  :qid |quant-u-158|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@267@01 a i) (img@269@01 a i))
      (and
        (Set_in (inv@266@01 a i) bs@247@01)
        (Set_in (inv@268@01 a i) js@248@01)))
    (and (= (inv@266@01 a i) a) (= (inv@268@01 a i) i)))
  :pattern ((inv@266@01 a i))
  :pattern ((inv@268@01 a i))
  :qid |two-fctOfInv|)))
; Permissions are non-negative
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (and
    (= a$0@264@01 a@254@01)
    (=
      (and
        (and (img@267@01 a i) (img@269@01 a i))
        (and
          (Set_in (inv@266@01 a i) bs@247@01)
          (Set_in (inv@268@01 a i) js@248@01)))
      (and
        (and (img@259@01 a i) (img@261@01 a i))
        (and
          (Set_in (inv@258@01 a i) as@245@01)
          (Set_in (inv@260@01 a i) is@246@01)))))
  
  :qid |quant-u-159|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@270@01 $PSF<two>)
(declare-const s@271@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@271@01 $Snap)) (!
  (=>
    (and
      (and
        (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@271@01)) ($SortWrappers.$SnapToInt ($Snap.second s@271@01)))
        (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@271@01)) ($SortWrappers.$SnapToInt ($Snap.second s@271@01))))
      (and
        (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@271@01)) ($SortWrappers.$SnapToInt ($Snap.second s@271@01))) as@245@01)
        (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@271@01)) ($SortWrappers.$SnapToInt ($Snap.second s@271@01))) is@246@01)))
    (and
      (not (= s@271@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@270@01  $PSF<two>) s@271@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@271@01))))
  :pattern (($PSF.lookup_two (as sm@270@01  $PSF<two>) s@271@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@271@01))
  :qid |qp.psmValDef130|)))
(assert (forall ((s@271@01 $Snap)) (!
  (=>
    (and
      (and
        (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@271@01)) ($SortWrappers.$SnapToInt ($Snap.second s@271@01)))
        (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@271@01)) ($SortWrappers.$SnapToInt ($Snap.second s@271@01))))
      (and
        (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@271@01)) ($SortWrappers.$SnapToInt ($Snap.second s@271@01))) bs@247@01)
        (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@271@01)) ($SortWrappers.$SnapToInt ($Snap.second s@271@01))) js@248@01)))
    (and
      (not (= s@271@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@270@01  $PSF<two>) s@271@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@271@01))))
  :pattern (($PSF.lookup_two (as sm@270@01  $PSF<two>) s@271@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@271@01))
  :qid |qp.psmValDef131|)))
(assert (forall ((s@271@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@271@01) s@271@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@271@01) s@271@01))
  :pattern (($PSF.lookup_two (as sm@270@01  $PSF<two>) s@271@01))
  :qid |qp.psmResTrgDef132|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@266@01 a i) bs@247@01) (Set_in (inv@268@01 a i) js@248@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@270@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@266@01 a i) (inv@268@01 a i))
  :qid |quant-u-160|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale foo_twos(as, is) == 0
(declare-const $t@272@01 $Snap)
(assert (= $t@272@01 $Snap.unit))
; [eval] foo_twos(as, is) == 0
; [eval] foo_twos(as, is)
(set-option :timeout 0)
(push) ; 3
(declare-const a@273@01 $Ref)
(declare-const i@274@01 Int)
(push) ; 4
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 5
; [then-branch: 8 | !(a@273@01 in as@245@01) | live]
; [else-branch: 8 | a@273@01 in as@245@01 | live]
(push) ; 6
; [then-branch: 8 | !(a@273@01 in as@245@01)]
(assert (not (Set_in a@273@01 as@245@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | a@273@01 in as@245@01]
(assert (Set_in a@273@01 as@245@01))
; [eval] (i in is)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@273@01 as@245@01) (not (Set_in a@273@01 as@245@01))))
(assert (and (Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01)))
(pop) ; 4
(declare-fun inv@275@01 ($Ref Int) $Ref)
(declare-fun img@276@01 ($Ref Int) Bool)
(declare-fun inv@277@01 ($Ref Int) Int)
(declare-fun img@278@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@273@01 $Ref) (i@274@01 Int)) (!
  (=>
    (and (Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01))
    (or (Set_in a@273@01 as@245@01) (not (Set_in a@273@01 as@245@01))))
  :pattern ((Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01))
  :pattern ((Set_in a@273@01 as@245@01) (inv@275@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (inv@277@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (img@276@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (img@278@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (inv@275@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (inv@277@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (img@276@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (img@278@01 a@273@01 i@274@01))
  :pattern ((inv@275@01 a@273@01 i@274@01))
  :pattern ((inv@277@01 a@273@01 i@274@01))
  :pattern ((img@276@01 a@273@01 i@274@01))
  :pattern ((img@278@01 a@273@01 i@274@01))
  :qid |two-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@273@01 $Ref) (i1@274@01 Int) (a2@273@01 $Ref) (i2@274@01 Int)) (!
  (=>
    (and
      (and
        (and (Set_in a1@273@01 as@245@01) (Set_in i1@274@01 is@246@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@270@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@273@01)
          ($SortWrappers.IntTo$Snap i1@274@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@273@01)
          ($SortWrappers.IntTo$Snap i1@274@01))))
      (and
        (and (Set_in a2@273@01 as@245@01) (Set_in i2@274@01 is@246@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@270@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@273@01)
          ($SortWrappers.IntTo$Snap i2@274@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@273@01)
          ($SortWrappers.IntTo$Snap i2@274@01))))
      (and (= a1@273@01 a2@273@01) (= i1@274@01 i2@274@01)))
    (and (= a1@273@01 a2@273@01) (= i1@274@01 i2@274@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@273@01 $Ref) (i@274@01 Int)) (!
  (=>
    (and (Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01))
    (and
      (and
        (= (inv@275@01 a@273@01 i@274@01) a@273@01)
        (= (inv@277@01 a@273@01 i@274@01) i@274@01))
      (and (img@276@01 a@273@01 i@274@01) (img@278@01 a@273@01 i@274@01))))
  :pattern ((Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01))
  :pattern ((Set_in a@273@01 as@245@01) (inv@275@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (inv@277@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (img@276@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (img@278@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (inv@275@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (inv@277@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (img@276@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (img@278@01 a@273@01 i@274@01))
  :pattern ((inv@275@01 a@273@01 i@274@01))
  :pattern ((inv@277@01 a@273@01 i@274@01))
  :pattern ((img@276@01 a@273@01 i@274@01))
  :pattern ((img@278@01 a@273@01 i@274@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@276@01 a i) (img@278@01 a i))
      (and
        (Set_in (inv@275@01 a i) as@245@01)
        (Set_in (inv@277@01 a i) is@246@01)))
    (and (= (inv@275@01 a i) a) (= (inv@277@01 a i) i)))
  :pattern ((inv@275@01 a i))
  :pattern ((inv@277@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@275@01 a i) as@245@01) (Set_in (inv@277@01 a i) is@246@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@270@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@275@01 a i) (inv@277@01 a i))
  :qid |quant-u-162|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@279@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@275@01 a i) as@245@01)
        (Set_in (inv@277@01 a i) is@246@01))
      (and (img@276@01 a i) (img@278@01 a i))
      (and (= a (inv@275@01 a i)) (= i (inv@277@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@280@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@275@01 a i) as@245@01)
        (Set_in (inv@277@01 a i) is@246@01))
      (and (img@276@01 a i) (img@278@01 a i))
      (and (= a (inv@275@01 a i)) (= i (inv@277@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@279@01 a i)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@279@01 a i))
    $Perm.No)
  
  :qid |quant-u-164|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@275@01 a i) as@245@01)
        (Set_in (inv@277@01 a i) is@246@01))
      (and (img@276@01 a i) (img@278@01 a i))
      (and (= a (inv@275@01 a i)) (= i (inv@277@01 a i))))
    (= (- $Perm.Write (pTaken@279@01 a i)) $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@281@01 $PSF<two>)
(declare-const s@282@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@282@01 $Snap)) (!
  (and
    (=>
      (Set_in s@282@01 ($PSF.domain_two (as sm@281@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@275@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@277@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))
        (and
          (img@276@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@278@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))))))
    (=>
      (and
        (and
          (Set_in (inv@275@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@277@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))
        (and
          (img@276@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@278@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))))
      (Set_in s@282@01 ($PSF.domain_two (as sm@281@01  $PSF<two>)))))
  :pattern ((Set_in s@282@01 ($PSF.domain_two (as sm@281@01  $PSF<two>))))
  :qid |qp.psmDomDef136|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@282@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@275@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@277@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))
        (and
          (img@276@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@278@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))))
      (and
        (and
          (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))))
        (and
          (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))))
    (and
      (not (= s@282@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@282@01))))
  :pattern (($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@282@01))
  :qid |qp.psmValDef133|)))
(assert (forall ((s@282@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@275@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@277@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))
        (and
          (img@276@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@278@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))))
      (and
        (and
          (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))))
        (and
          (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) bs@247@01)
          (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) js@248@01))))
    (and
      (not (= s@282@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@282@01))))
  :pattern (($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@282@01))
  :qid |qp.psmValDef134|)))
(assert (forall ((s@282@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@282@01) s@282@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@282@01) s@282@01))
  :pattern (($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01))
  :qid |qp.psmResTrgDef135|)))
(assert (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@281@01  $PSF<two>)) as@245@01 is@246@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((a@273@01 $Ref) (i@274@01 Int)) (!
  (=>
    (and (Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01))
    (and
      (and
        (= (inv@275@01 a@273@01 i@274@01) a@273@01)
        (= (inv@277@01 a@273@01 i@274@01) i@274@01))
      (and (img@276@01 a@273@01 i@274@01) (img@278@01 a@273@01 i@274@01))))
  :pattern ((Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01))
  :pattern ((Set_in a@273@01 as@245@01) (inv@275@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (inv@277@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (img@276@01 a@273@01 i@274@01))
  :pattern ((Set_in a@273@01 as@245@01) (img@278@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (inv@275@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (inv@277@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (img@276@01 a@273@01 i@274@01))
  :pattern ((Set_in i@274@01 is@246@01) (img@278@01 a@273@01 i@274@01))
  :pattern ((inv@275@01 a@273@01 i@274@01))
  :pattern ((inv@277@01 a@273@01 i@274@01))
  :pattern ((img@276@01 a@273@01 i@274@01))
  :pattern ((img@278@01 a@273@01 i@274@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@276@01 a i) (img@278@01 a i))
      (and
        (Set_in (inv@275@01 a i) as@245@01)
        (Set_in (inv@277@01 a i) is@246@01)))
    (and (= (inv@275@01 a i) a) (= (inv@277@01 a i) i)))
  :pattern ((inv@275@01 a i))
  :pattern ((inv@277@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((s@282@01 $Snap)) (!
  (and
    (=>
      (Set_in s@282@01 ($PSF.domain_two (as sm@281@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@275@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@277@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))
        (and
          (img@276@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@278@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))))))
    (=>
      (and
        (and
          (Set_in (inv@275@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@277@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))
        (and
          (img@276@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@278@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))))
      (Set_in s@282@01 ($PSF.domain_two (as sm@281@01  $PSF<two>)))))
  :pattern ((Set_in s@282@01 ($PSF.domain_two (as sm@281@01  $PSF<two>))))
  :qid |qp.psmDomDef136|)))
(assert (forall ((s@282@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@275@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@277@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))
        (and
          (img@276@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@278@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))))
      (and
        (and
          (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))))
        (and
          (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))))
    (and
      (not (= s@282@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@282@01))))
  :pattern (($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@282@01))
  :qid |qp.psmValDef133|)))
(assert (forall ((s@282@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@275@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) as@245@01)
          (Set_in (inv@277@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) is@246@01))
        (and
          (img@276@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@278@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))))
      (and
        (and
          (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01)))
          (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))))
        (and
          (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) bs@247@01)
          (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@282@01)) ($SortWrappers.$SnapToInt ($Snap.second s@282@01))) js@248@01))))
    (and
      (not (= s@282@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@282@01))))
  :pattern (($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@282@01))
  :qid |qp.psmValDef134|)))
(assert (forall ((s@282@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@282@01) s@282@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@282@01) s@282@01))
  :pattern (($PSF.lookup_two (as sm@281@01  $PSF<two>) s@282@01))
  :qid |qp.psmResTrgDef135|)))
(assert (and
  (forall ((a@273@01 $Ref) (i@274@01 Int)) (!
    (=>
      (and (Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01))
      (or (Set_in a@273@01 as@245@01) (not (Set_in a@273@01 as@245@01))))
    :pattern ((Set_in a@273@01 as@245@01) (Set_in i@274@01 is@246@01))
    :pattern ((Set_in a@273@01 as@245@01) (inv@275@01 a@273@01 i@274@01))
    :pattern ((Set_in a@273@01 as@245@01) (inv@277@01 a@273@01 i@274@01))
    :pattern ((Set_in a@273@01 as@245@01) (img@276@01 a@273@01 i@274@01))
    :pattern ((Set_in a@273@01 as@245@01) (img@278@01 a@273@01 i@274@01))
    :pattern ((Set_in i@274@01 is@246@01) (inv@275@01 a@273@01 i@274@01))
    :pattern ((Set_in i@274@01 is@246@01) (inv@277@01 a@273@01 i@274@01))
    :pattern ((Set_in i@274@01 is@246@01) (img@276@01 a@273@01 i@274@01))
    :pattern ((Set_in i@274@01 is@246@01) (img@278@01 a@273@01 i@274@01))
    :pattern ((inv@275@01 a@273@01 i@274@01))
    :pattern ((inv@277@01 a@273@01 i@274@01))
    :pattern ((img@276@01 a@273@01 i@274@01))
    :pattern ((img@278@01 a@273@01 i@274@01))
    :qid |two-aux|))
  (forall ((a $Ref) (i Int)) (!
    (=>
      (and
        (Set_in (inv@275@01 a i) as@245@01)
        (Set_in (inv@277@01 a i) is@246@01))
      ($PSF.loc_two ($PSF.lookup_two (as sm@270@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))))
    :pattern ((inv@275@01 a i) (inv@277@01 a i))
    :qid |quant-u-162|))
  (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@281@01  $PSF<two>)) as@245@01 is@246@01)))
(assert (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@281@01  $PSF<two>)) as@245@01 is@246@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (b1 in bs)
(declare-const $t@283@01 $Snap)
(assert (= $t@283@01 $Snap.unit))
; [eval] (b1 in bs)
(assert (Set_in b1@249@01 bs@247@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (j1 in js)
(declare-const $t@284@01 $Snap)
(assert (= $t@284@01 $Snap.unit))
; [eval] (j1 in js)
(assert (Set_in j1@250@01 js@248@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(two(b1, j1), write)
(declare-const sm@285@01 $PSF<two>)
(declare-const s@286@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@286@01 $Snap)) (!
  (=>
    (and
      (and
        (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@286@01)) ($SortWrappers.$SnapToInt ($Snap.second s@286@01)))
        (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@286@01)) ($SortWrappers.$SnapToInt ($Snap.second s@286@01))))
      (and
        (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@286@01)) ($SortWrappers.$SnapToInt ($Snap.second s@286@01))) as@245@01)
        (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@286@01)) ($SortWrappers.$SnapToInt ($Snap.second s@286@01))) is@246@01)))
    (and
      (not (= s@286@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@285@01  $PSF<two>) s@286@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@286@01))))
  :pattern (($PSF.lookup_two (as sm@285@01  $PSF<two>) s@286@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@286@01))
  :qid |qp.psmValDef137|)))
(assert (forall ((s@286@01 $Snap)) (!
  (=>
    (and
      (and
        (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@286@01)) ($SortWrappers.$SnapToInt ($Snap.second s@286@01)))
        (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@286@01)) ($SortWrappers.$SnapToInt ($Snap.second s@286@01))))
      (and
        (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@286@01)) ($SortWrappers.$SnapToInt ($Snap.second s@286@01))) bs@247@01)
        (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@286@01)) ($SortWrappers.$SnapToInt ($Snap.second s@286@01))) js@248@01)))
    (and
      (not (= s@286@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@285@01  $PSF<two>) s@286@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@286@01))))
  :pattern (($PSF.lookup_two (as sm@285@01  $PSF<two>) s@286@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@286@01))
  :qid |qp.psmValDef138|)))
(assert (forall ((s@286@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@286@01) s@286@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@286@01) s@286@01))
  :pattern (($PSF.lookup_two (as sm@285@01  $PSF<two>) s@286@01))
  :qid |qp.psmResTrgDef139|)))
(assert ($PSF.loc_two ($PSF.lookup_two (as sm@285@01  $PSF<two>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap b1@249@01)
  ($SortWrappers.IntTo$Snap j1@250@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap b1@249@01)
  ($SortWrappers.IntTo$Snap j1@250@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@287@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and (= a b1@249@01) (= i j1@250@01))
    ($Perm.min
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@288@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and (= a b1@249@01) (= i j1@250@01))
    ($Perm.min
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@287@01 a i)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@287@01 a i))
    $Perm.No)
  
  :qid |quant-u-167|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@287@01 a i) $Perm.No)
  
  :qid |quant-u-168|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and (= a b1@249@01) (= i j1@250@01))
    (= (- $Perm.Write (pTaken@287@01 a i)) $Perm.No))
  
  :qid |quant-u-169|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@288@01 a i))
    $Perm.No)
  
  :qid |quant-u-170|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@288@01 a i) $Perm.No)
  
  :qid |quant-u-171|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and (= a b1@249@01) (= i j1@250@01))
    (= (- (- $Perm.Write (pTaken@287@01 a i)) (pTaken@288@01 a i)) $Perm.No))
  
  :qid |quant-u-172|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (and (img@259@01 b1@249@01 j1@250@01) (img@261@01 b1@249@01 j1@250@01))
    (and
      (Set_in (inv@258@01 b1@249@01 j1@250@01) as@245@01)
      (Set_in (inv@260@01 b1@249@01 j1@250@01) is@246@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap b1@249@01)
          ($SortWrappers.IntTo$Snap j1@250@01))
        $Snap.unit))
    (=
      ($PSF.lookup_two (as sm@285@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap b1@249@01)
        ($SortWrappers.IntTo$Snap j1@250@01)))
      ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap b1@249@01)
        ($SortWrappers.IntTo$Snap j1@250@01)))))))
(assert (=>
  (and
    (and (img@267@01 b1@249@01 j1@250@01) (img@269@01 b1@249@01 j1@250@01))
    (and
      (Set_in (inv@266@01 b1@249@01 j1@250@01) bs@247@01)
      (Set_in (inv@268@01 b1@249@01 j1@250@01) js@248@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap b1@249@01)
          ($SortWrappers.IntTo$Snap j1@250@01))
        $Snap.unit))
    (=
      ($PSF.lookup_two (as sm@285@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap b1@249@01)
        ($SortWrappers.IntTo$Snap j1@250@01)))
      ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap b1@249@01)
        ($SortWrappers.IntTo$Snap j1@250@01)))))))
(assert (and
  ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap b1@249@01)
    ($SortWrappers.IntTo$Snap j1@250@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap b1@249@01)
    ($SortWrappers.IntTo$Snap j1@250@01)))
  ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap b1@249@01)
    ($SortWrappers.IntTo$Snap j1@250@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap b1@249@01)
    ($SortWrappers.IntTo$Snap j1@250@01)))))
; [exec]
; inhale (a1 in as)
(declare-const $t@289@01 $Snap)
(assert (= $t@289@01 $Snap.unit))
; [eval] (a1 in as)
(assert (Set_in a1@251@01 as@245@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (i1 in is)
(declare-const $t@290@01 $Snap)
(assert (= $t@290@01 $Snap.unit))
; [eval] (i1 in is)
(assert (Set_in i1@252@01 is@246@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(two(a1, i1), write)
(declare-const sm@291@01 $PSF<two>)
(declare-const s@292@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@292@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01)))
          (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01))))
        (and
          (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01))) bs@247@01)
          (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01))) js@248@01)))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@288@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01)))))
      false)
    (and
      (not (= s@292@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@291@01  $PSF<two>) s@292@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@292@01))))
  :pattern (($PSF.lookup_two (as sm@291@01  $PSF<two>) s@292@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@292@01))
  :qid |qp.psmValDef140|)))
(assert (forall ((s@292@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01)))
          (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01))))
        (and
          (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01))) as@245@01)
          (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01))) is@246@01)))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@287@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@292@01)) ($SortWrappers.$SnapToInt ($Snap.second s@292@01)))))
      false)
    (and
      (not (= s@292@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@291@01  $PSF<two>) s@292@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@292@01))))
  :pattern (($PSF.lookup_two (as sm@291@01  $PSF<two>) s@292@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@292@01))
  :qid |qp.psmValDef141|)))
(assert (forall ((s@292@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@292@01) s@292@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@292@01) s@292@01))
  :pattern (($PSF.lookup_two (as sm@291@01  $PSF<two>) s@292@01))
  :qid |qp.psmResTrgDef142|)))
(assert ($PSF.loc_two ($PSF.lookup_two (as sm@291@01  $PSF<two>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@251@01)
  ($SortWrappers.IntTo$Snap i1@252@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@251@01)
  ($SortWrappers.IntTo$Snap i1@252@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@293@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and (= a a1@251@01) (= i i1@252@01))
    ($Perm.min
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        (- $Perm.Write (pTaken@288@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@294@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and (= a a1@251@01) (= i i1@252@01))
    ($Perm.min
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        (- $Perm.Write (pTaken@287@01 a i))
        $Perm.No)
      (- $Perm.Write (pTaken@293@01 a i)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        (- $Perm.Write (pTaken@288@01 a i))
        $Perm.No)
      (pTaken@293@01 a i))
    $Perm.No)
  
  :qid |quant-u-174|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@293@01 a i) $Perm.No)
  
  :qid |quant-u-175|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and (= a a1@251@01) (= i i1@252@01))
    (= (- $Perm.Write (pTaken@293@01 a i)) $Perm.No))
  
  :qid |quant-u-176|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        (- $Perm.Write (pTaken@287@01 a i))
        $Perm.No)
      (pTaken@294@01 a i))
    $Perm.No)
  
  :qid |quant-u-177|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@294@01 a i) $Perm.No)
  
  :qid |quant-u-178|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and (= a a1@251@01) (= i i1@252@01))
    (= (- (- $Perm.Write (pTaken@293@01 a i)) (pTaken@294@01 a i)) $Perm.No))
  
  :qid |quant-u-179|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (and (img@267@01 a1@251@01 i1@252@01) (img@269@01 a1@251@01 i1@252@01))
      (and
        (Set_in (inv@266@01 a1@251@01 i1@252@01) bs@247@01)
        (Set_in (inv@268@01 a1@251@01 i1@252@01) js@248@01)))
    (< $Perm.No (- $Perm.Write (pTaken@288@01 a1@251@01 i1@252@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@251@01)
          ($SortWrappers.IntTo$Snap i1@252@01))
        $Snap.unit))
    (=
      ($PSF.lookup_two (as sm@291@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a1@251@01)
        ($SortWrappers.IntTo$Snap i1@252@01)))
      ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a1@251@01)
        ($SortWrappers.IntTo$Snap i1@252@01)))))))
(assert (=>
  (ite
    (and
      (and (img@259@01 a1@251@01 i1@252@01) (img@261@01 a1@251@01 i1@252@01))
      (and
        (Set_in (inv@258@01 a1@251@01 i1@252@01) as@245@01)
        (Set_in (inv@260@01 a1@251@01 i1@252@01) is@246@01)))
    (< $Perm.No (- $Perm.Write (pTaken@287@01 a1@251@01 i1@252@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@251@01)
          ($SortWrappers.IntTo$Snap i1@252@01))
        $Snap.unit))
    (=
      ($PSF.lookup_two (as sm@291@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a1@251@01)
        ($SortWrappers.IntTo$Snap i1@252@01)))
      ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a1@251@01)
        ($SortWrappers.IntTo$Snap i1@252@01)))))))
(assert (and
  ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a1@251@01)
    ($SortWrappers.IntTo$Snap i1@252@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a1@251@01)
    ($SortWrappers.IntTo$Snap i1@252@01)))
  ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a1@251@01)
    ($SortWrappers.IntTo$Snap i1@252@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a1@251@01)
    ($SortWrappers.IntTo$Snap i1@252@01)))))
(assert (not (= a1@251@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (two%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_two (as sm@291@01  $PSF<two>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@251@01)
  ($SortWrappers.IntTo$Snap i1@252@01)))) a1@251@01 i1@252@01))
; [exec]
; a1.val := 1 + a1.val - 1
; [eval] 1 + a1.val - 1
; [eval] 1 + a1.val
(declare-const val@295@01 Int)
(assert (=
  val@295@01
  (-
    (+
      1
      ($PSF.lookup_two (as sm@291@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a1@251@01)
        ($SortWrappers.IntTo$Snap i1@252@01))))
    1)))
; [exec]
; fold acc(two(a1, i1), write)
(assert (two%trigger ($SortWrappers.IntTo$Snap val@295@01) a1@251@01 i1@252@01))
(declare-const sm@296@01 $PSF<two>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_two (as sm@296@01  $PSF<two>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a1@251@01)
    ($SortWrappers.IntTo$Snap i1@252@01)))
  val@295@01))
(declare-const sm@297@01 $PSF<two>)
(declare-const s@298@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@298@01 $Snap)) (!
  (=>
    (and
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) a1@251@01)
      (= ($SortWrappers.$SnapToInt ($Snap.second s@298@01)) i1@252@01))
    (and
      (not (= s@298@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@297@01  $PSF<two>) s@298@01)
        ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@298@01))))
  :pattern (($PSF.lookup_two (as sm@297@01  $PSF<two>) s@298@01))
  :pattern (($PSF.lookup_two (as sm@296@01  $PSF<two>) s@298@01))
  :qid |qp.psmValDef143|)))
(assert (forall ((s@298@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01)))
          (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01))))
        (and
          (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01))) as@245@01)
          (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01))) is@246@01)))
      (<
        $Perm.No
        (-
          (-
            $Perm.Write
            (pTaken@287@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01))))
          (pTaken@294@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01)))))
      false)
    (and
      (not (= s@298@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@297@01  $PSF<two>) s@298@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@298@01))))
  :pattern (($PSF.lookup_two (as sm@297@01  $PSF<two>) s@298@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@298@01))
  :qid |qp.psmValDef144|)))
(assert (forall ((s@298@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01)))
          (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01))))
        (and
          (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01))) bs@247@01)
          (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01))) js@248@01)))
      (<
        $Perm.No
        (-
          (-
            $Perm.Write
            (pTaken@288@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01))))
          (pTaken@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@298@01)) ($SortWrappers.$SnapToInt ($Snap.second s@298@01)))))
      false)
    (and
      (not (= s@298@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@297@01  $PSF<two>) s@298@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@298@01))))
  :pattern (($PSF.lookup_two (as sm@297@01  $PSF<two>) s@298@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@298@01))
  :qid |qp.psmValDef145|)))
(assert (forall ((s@298@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@298@01) s@298@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@298@01) s@298@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@298@01) s@298@01))
  :pattern (($PSF.lookup_two (as sm@297@01  $PSF<two>) s@298@01))
  :qid |qp.psmResTrgDef146|)))
(assert ($PSF.loc_two ($PSF.lookup_two (as sm@297@01  $PSF<two>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@251@01)
  ($SortWrappers.IntTo$Snap i1@252@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap a1@251@01)
  ($SortWrappers.IntTo$Snap i1@252@01))))
; [exec]
; exhale (forall a$1: Ref, i$1: Int ::
;     { two(a$1, i$1) }
;     (a$1 in (bs setminus Set(b1))) && (i$1 in (js setminus Set(j1))) ==>
;     acc(two(a$1, i$1), write))
(declare-const a$1@299@01 $Ref)
(declare-const i$1@300@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (a$1 in (bs setminus Set(b1))) && (i$1 in (js setminus Set(j1)))
; [eval] (a$1 in (bs setminus Set(b1)))
; [eval] (bs setminus Set(b1))
; [eval] Set(b1)
(push) ; 4
; [then-branch: 9 | !(a$1@299@01 in bs@247@01 \ {b1@249@01}) | live]
; [else-branch: 9 | a$1@299@01 in bs@247@01 \ {b1@249@01} | live]
(push) ; 5
; [then-branch: 9 | !(a$1@299@01 in bs@247@01 \ {b1@249@01})]
(assert (not (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | a$1@299@01 in bs@247@01 \ {b1@249@01}]
(assert (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01))))
; [eval] (i$1 in (js setminus Set(j1)))
; [eval] (js setminus Set(j1))
; [eval] Set(j1)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01)))
  (not (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01))))))
(assert (and
  (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01)))
  (Set_in i$1@300@01 (Set_difference js@248@01 (Set_singleton j1@250@01)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@301@01 ($Ref Int) $Ref)
(declare-fun img@302@01 ($Ref Int) Bool)
(declare-fun inv@303@01 ($Ref Int) Int)
(declare-fun img@304@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a$1@299@01 $Ref) (i$1@300@01 Int)) (!
  (=>
    (and
      (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01)))
      (Set_in i$1@300@01 (Set_difference js@248@01 (Set_singleton j1@250@01))))
    (or
      (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01)))
      (not
        (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01))))))
  :pattern (($PSF.loc_two ($PSF.lookup_two (as sm@297@01  $PSF<two>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a$1@299@01)
    ($SortWrappers.IntTo$Snap i$1@300@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a$1@299@01)
    ($SortWrappers.IntTo$Snap i$1@300@01))))
  :qid |two-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a$11@299@01 $Ref) (i$11@300@01 Int) (a$12@299@01 $Ref) (i$12@300@01 Int)) (!
  (=>
    (and
      (and
        (and
          (Set_in a$11@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01)))
          (Set_in i$11@300@01 (Set_difference js@248@01 (Set_singleton j1@250@01))))
        ($PSF.loc_two ($PSF.lookup_two (as sm@297@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a$11@299@01)
          ($SortWrappers.IntTo$Snap i$11@300@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a$11@299@01)
          ($SortWrappers.IntTo$Snap i$11@300@01))))
      (and
        (and
          (Set_in a$12@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01)))
          (Set_in i$12@300@01 (Set_difference js@248@01 (Set_singleton j1@250@01))))
        ($PSF.loc_two ($PSF.lookup_two (as sm@297@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a$12@299@01)
          ($SortWrappers.IntTo$Snap i$12@300@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a$12@299@01)
          ($SortWrappers.IntTo$Snap i$12@300@01))))
      (and (= a$11@299@01 a$12@299@01) (= i$11@300@01 i$12@300@01)))
    (and (= a$11@299@01 a$12@299@01) (= i$11@300@01 i$12@300@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a$1@299@01 $Ref) (i$1@300@01 Int)) (!
  (=>
    (and
      (Set_in a$1@299@01 (Set_difference bs@247@01 (Set_singleton b1@249@01)))
      (Set_in i$1@300@01 (Set_difference js@248@01 (Set_singleton j1@250@01))))
    (and
      (and
        (= (inv@301@01 a$1@299@01 i$1@300@01) a$1@299@01)
        (= (inv@303@01 a$1@299@01 i$1@300@01) i$1@300@01))
      (and (img@302@01 a$1@299@01 i$1@300@01) (img@304@01 a$1@299@01 i$1@300@01))))
  :pattern (($PSF.loc_two ($PSF.lookup_two (as sm@297@01  $PSF<two>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a$1@299@01)
    ($SortWrappers.IntTo$Snap i$1@300@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a$1@299@01)
    ($SortWrappers.IntTo$Snap i$1@300@01))))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@302@01 a i) (img@304@01 a i))
      (and
        (Set_in (inv@301@01 a i) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
        (Set_in (inv@303@01 a i) (Set_difference js@248@01 (Set_singleton j1@250@01)))))
    (and (= (inv@301@01 a i) a) (= (inv@303@01 a i) i)))
  :pattern ((inv@301@01 a i))
  :pattern ((inv@303@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (Set_in (inv@301@01 a i) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
      (Set_in (inv@303@01 a i) (Set_difference js@248@01 (Set_singleton j1@250@01))))
    ($PSF.loc_two ($PSF.lookup_two (as sm@297@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@301@01 a i) (inv@303@01 a i))
  :qid |quant-u-181|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@305@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@301@01 a i) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
        (Set_in (inv@303@01 a i) (Set_difference js@248@01 (Set_singleton j1@250@01))))
      (and (img@302@01 a i) (img@304@01 a i))
      (and (= a (inv@301@01 a i)) (= i (inv@303@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        (- (- $Perm.Write (pTaken@287@01 a i)) (pTaken@294@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@306@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@301@01 a i) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
        (Set_in (inv@303@01 a i) (Set_difference js@248@01 (Set_singleton j1@250@01))))
      (and (img@302@01 a i) (img@304@01 a i))
      (and (= a (inv@301@01 a i)) (= i (inv@303@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        (- (- $Perm.Write (pTaken@288@01 a i)) (pTaken@293@01 a i))
        $Perm.No)
      (- $Perm.Write (pTaken@305@01 a i)))
    $Perm.No))
(define-fun pTaken@307@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@301@01 a i) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
        (Set_in (inv@303@01 a i) (Set_difference js@248@01 (Set_singleton j1@250@01))))
      (and (img@302@01 a i) (img@304@01 a i))
      (and (= a (inv@301@01 a i)) (= i (inv@303@01 a i))))
    ($Perm.min
      (ite (and (= a a1@251@01) (= i i1@252@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@305@01 a i)) (pTaken@306@01 a i)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        (- (- $Perm.Write (pTaken@287@01 a i)) (pTaken@294@01 a i))
        $Perm.No)
      (pTaken@305@01 a i))
    $Perm.No)
  
  :qid |quant-u-183|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@305@01 a i) $Perm.No)
  
  :qid |quant-u-184|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@301@01 a i) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
        (Set_in (inv@303@01 a i) (Set_difference js@248@01 (Set_singleton j1@250@01))))
      (and (img@302@01 a i) (img@304@01 a i))
      (and (= a (inv@301@01 a i)) (= i (inv@303@01 a i))))
    (= (- $Perm.Write (pTaken@305@01 a i)) $Perm.No))
  
  :qid |quant-u-185|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        (- (- $Perm.Write (pTaken@288@01 a i)) (pTaken@293@01 a i))
        $Perm.No)
      (pTaken@306@01 a i))
    $Perm.No)
  
  :qid |quant-u-186|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@306@01 a i) $Perm.No)
  
  :qid |quant-u-187|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@301@01 a i) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
        (Set_in (inv@303@01 a i) (Set_difference js@248@01 (Set_singleton j1@250@01))))
      (and (img@302@01 a i) (img@304@01 a i))
      (and (= a (inv@301@01 a i)) (= i (inv@303@01 a i))))
    (= (- (- $Perm.Write (pTaken@305@01 a i)) (pTaken@306@01 a i)) $Perm.No))
  
  :qid |quant-u-188|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@308@01 $PSF<two>)
(declare-const s@309@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@309@01 $Snap)) (!
  (and
    (=>
      (Set_in s@309@01 ($PSF.domain_two (as sm@308@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@301@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
          (Set_in (inv@303@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference js@248@01 (Set_singleton j1@250@01))))
        (and
          (img@302@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))
          (img@304@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))))))
    (=>
      (and
        (and
          (Set_in (inv@301@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
          (Set_in (inv@303@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference js@248@01 (Set_singleton j1@250@01))))
        (and
          (img@302@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))
          (img@304@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))))
      (Set_in s@309@01 ($PSF.domain_two (as sm@308@01  $PSF<two>)))))
  :pattern ((Set_in s@309@01 ($PSF.domain_two (as sm@308@01  $PSF<two>))))
  :qid |qp.psmDomDef151|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@309@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@301@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
          (Set_in (inv@303@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference js@248@01 (Set_singleton j1@250@01))))
        (and
          (img@302@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))
          (img@304@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) a1@251@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@309@01)) i1@252@01)))
    (and
      (not (= s@309@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@308@01  $PSF<two>) s@309@01)
        ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@309@01))))
  :pattern (($PSF.lookup_two (as sm@308@01  $PSF<two>) s@309@01))
  :pattern (($PSF.lookup_two (as sm@296@01  $PSF<two>) s@309@01))
  :qid |qp.psmValDef147|)))
(assert (forall ((s@309@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@301@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
          (Set_in (inv@303@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference js@248@01 (Set_singleton j1@250@01))))
        (and
          (img@302@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))
          (img@304@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))))
      (ite
        (and
          (and
            (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))
            (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))))
          (and
            (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) as@245@01)
            (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) is@246@01)))
        (<
          $Perm.No
          (-
            (-
              $Perm.Write
              (pTaken@287@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))))
            (pTaken@294@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))))
        false))
    (and
      (not (= s@309@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@308@01  $PSF<two>) s@309@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@309@01))))
  :pattern (($PSF.lookup_two (as sm@308@01  $PSF<two>) s@309@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@309@01))
  :qid |qp.psmValDef148|)))
(assert (forall ((s@309@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@301@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference bs@247@01 (Set_singleton b1@249@01)))
          (Set_in (inv@303@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) (Set_difference js@248@01 (Set_singleton j1@250@01))))
        (and
          (img@302@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))
          (img@304@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))))
      (ite
        (and
          (and
            (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))
            (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))))
          (and
            (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) bs@247@01)
            (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))) js@248@01)))
        (<
          $Perm.No
          (-
            (-
              $Perm.Write
              (pTaken@288@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01))))
            (pTaken@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@309@01)) ($SortWrappers.$SnapToInt ($Snap.second s@309@01)))))
        false))
    (and
      (not (= s@309@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@308@01  $PSF<two>) s@309@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@309@01))))
  :pattern (($PSF.lookup_two (as sm@308@01  $PSF<two>) s@309@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@309@01))
  :qid |qp.psmValDef149|)))
(assert (forall ((s@309@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@309@01) s@309@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@309@01) s@309@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@309@01) s@309@01))
  :pattern (($PSF.lookup_two (as sm@308@01  $PSF<two>) s@309@01))
  :qid |qp.psmResTrgDef150|)))
; [exec]
; exhale foo_twos(as, is) == 0
; [eval] foo_twos(as, is) == 0
; [eval] foo_twos(as, is)
(set-option :timeout 0)
(push) ; 3
(declare-const a@310@01 $Ref)
(declare-const i@311@01 Int)
(push) ; 4
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 5
; [then-branch: 10 | !(a@310@01 in as@245@01) | live]
; [else-branch: 10 | a@310@01 in as@245@01 | live]
(push) ; 6
; [then-branch: 10 | !(a@310@01 in as@245@01)]
(assert (not (Set_in a@310@01 as@245@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | a@310@01 in as@245@01]
(assert (Set_in a@310@01 as@245@01))
; [eval] (i in is)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@310@01 as@245@01) (not (Set_in a@310@01 as@245@01))))
(assert (and (Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01)))
(pop) ; 4
(declare-fun inv@312@01 ($Ref Int) $Ref)
(declare-fun img@313@01 ($Ref Int) Bool)
(declare-fun inv@314@01 ($Ref Int) Int)
(declare-fun img@315@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@310@01 $Ref) (i@311@01 Int)) (!
  (=>
    (and (Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01))
    (or (Set_in a@310@01 as@245@01) (not (Set_in a@310@01 as@245@01))))
  :pattern ((Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01))
  :pattern ((Set_in a@310@01 as@245@01) (inv@312@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (inv@314@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (img@313@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (img@315@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (inv@312@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (inv@314@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (img@313@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (img@315@01 a@310@01 i@311@01))
  :pattern ((inv@312@01 a@310@01 i@311@01))
  :pattern ((inv@314@01 a@310@01 i@311@01))
  :pattern ((img@313@01 a@310@01 i@311@01))
  :pattern ((img@315@01 a@310@01 i@311@01))
  :qid |two-aux|)))
(declare-const sm@316@01 $PSF<two>)
(declare-const s@317@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@317@01 $Snap)) (!
  (=>
    (and
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) a1@251@01)
      (= ($SortWrappers.$SnapToInt ($Snap.second s@317@01)) i1@252@01))
    (and
      (not (= s@317@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01)
        ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@317@01))))
  :pattern (($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01))
  :pattern (($PSF.lookup_two (as sm@296@01  $PSF<two>) s@317@01))
  :qid |qp.psmValDef152|)))
(assert (forall ((s@317@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01)))
          (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
        (and
          (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))) bs@247@01)
          (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))) js@248@01)))
      (<
        $Perm.No
        (-
          (-
            (-
              $Perm.Write
              (pTaken@288@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
            (pTaken@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
          (pTaken@306@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01)))))
      false)
    (and
      (not (= s@317@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@317@01))))
  :pattern (($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@317@01))
  :qid |qp.psmValDef153|)))
(assert (forall ((s@317@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01)))
          (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
        (and
          (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))) as@245@01)
          (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))) is@246@01)))
      (<
        $Perm.No
        (-
          (-
            (-
              $Perm.Write
              (pTaken@287@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
            (pTaken@294@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
          (pTaken@305@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01)))))
      false)
    (and
      (not (= s@317@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@317@01))))
  :pattern (($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@317@01))
  :qid |qp.psmValDef154|)))
(assert (forall ((s@317@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@317@01) s@317@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@317@01) s@317@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@317@01) s@317@01))
  :pattern (($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01))
  :qid |qp.psmResTrgDef155|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@310@01 $Ref) (i1@311@01 Int) (a2@310@01 $Ref) (i2@311@01 Int)) (!
  (=>
    (and
      (and
        (and (Set_in a1@310@01 as@245@01) (Set_in i1@311@01 is@246@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@316@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@310@01)
          ($SortWrappers.IntTo$Snap i1@311@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a1@310@01)
          ($SortWrappers.IntTo$Snap i1@311@01))))
      (and
        (and (Set_in a2@310@01 as@245@01) (Set_in i2@311@01 is@246@01))
        ($PSF.loc_two ($PSF.lookup_two (as sm@316@01  $PSF<two>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@310@01)
          ($SortWrappers.IntTo$Snap i2@311@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a2@310@01)
          ($SortWrappers.IntTo$Snap i2@311@01))))
      (and (= a1@310@01 a2@310@01) (= i1@311@01 i2@311@01)))
    (and (= a1@310@01 a2@310@01) (= i1@311@01 i2@311@01)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@310@01 $Ref) (i@311@01 Int)) (!
  (=>
    (and (Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01))
    (and
      (and
        (= (inv@312@01 a@310@01 i@311@01) a@310@01)
        (= (inv@314@01 a@310@01 i@311@01) i@311@01))
      (and (img@313@01 a@310@01 i@311@01) (img@315@01 a@310@01 i@311@01))))
  :pattern ((Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01))
  :pattern ((Set_in a@310@01 as@245@01) (inv@312@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (inv@314@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (img@313@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (img@315@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (inv@312@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (inv@314@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (img@313@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (img@315@01 a@310@01 i@311@01))
  :pattern ((inv@312@01 a@310@01 i@311@01))
  :pattern ((inv@314@01 a@310@01 i@311@01))
  :pattern ((img@313@01 a@310@01 i@311@01))
  :pattern ((img@315@01 a@310@01 i@311@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@313@01 a i) (img@315@01 a i))
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01)))
    (and (= (inv@312@01 a i) a) (= (inv@314@01 a i) i)))
  :pattern ((inv@312@01 a i))
  :pattern ((inv@314@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and (Set_in (inv@312@01 a i) as@245@01) (Set_in (inv@314@01 a i) is@246@01))
    ($PSF.loc_two ($PSF.lookup_two (as sm@316@01  $PSF<two>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@312@01 a i) (inv@314@01 a i))
  :qid |quant-u-190|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@318@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01))
      (and (img@313@01 a i) (img@315@01 a i))
      (and (= a (inv@312@01 a i)) (= i (inv@314@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        (-
          (- (- $Perm.Write (pTaken@288@01 a i)) (pTaken@293@01 a i))
          (pTaken@306@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@319@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01))
      (and (img@313@01 a i) (img@315@01 a i))
      (and (= a (inv@312@01 a i)) (= i (inv@314@01 a i))))
    ($Perm.min
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        (-
          (- (- $Perm.Write (pTaken@287@01 a i)) (pTaken@294@01 a i))
          (pTaken@305@01 a i))
        $Perm.No)
      (- $Perm.Write (pTaken@318@01 a i)))
    $Perm.No))
(define-fun pTaken@320@01 ((a $Ref) (i Int)) $Perm
  (ite
    (and
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01))
      (and (img@313@01 a i) (img@315@01 a i))
      (and (= a (inv@312@01 a i)) (= i (inv@314@01 a i))))
    ($Perm.min
      (ite (and (= a a1@251@01) (= i i1@252@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@318@01 a i)) (pTaken@319@01 a i)))
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
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@267@01 a i) (img@269@01 a i))
          (and
            (Set_in (inv@266@01 a i) bs@247@01)
            (Set_in (inv@268@01 a i) js@248@01)))
        (-
          (- (- $Perm.Write (pTaken@288@01 a i)) (pTaken@293@01 a i))
          (pTaken@306@01 a i))
        $Perm.No)
      (pTaken@318@01 a i))
    $Perm.No)
  
  :qid |quant-u-192|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@318@01 a i) $Perm.No)
  
  :qid |quant-u-193|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01))
      (and (img@313@01 a i) (img@315@01 a i))
      (and (= a (inv@312@01 a i)) (= i (inv@314@01 a i))))
    (= (- $Perm.Write (pTaken@318@01 a i)) $Perm.No))
  
  :qid |quant-u-194|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@259@01 a i) (img@261@01 a i))
          (and
            (Set_in (inv@258@01 a i) as@245@01)
            (Set_in (inv@260@01 a i) is@246@01)))
        (-
          (- (- $Perm.Write (pTaken@287@01 a i)) (pTaken@294@01 a i))
          (pTaken@305@01 a i))
        $Perm.No)
      (pTaken@319@01 a i))
    $Perm.No)
  
  :qid |quant-u-195|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@319@01 a i) $Perm.No)
  
  :qid |quant-u-196|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01))
      (and (img@313@01 a i) (img@315@01 a i))
      (and (= a (inv@312@01 a i)) (= i (inv@314@01 a i))))
    (= (- (- $Perm.Write (pTaken@318@01 a i)) (pTaken@319@01 a i)) $Perm.No))
  
  :qid |quant-u-197|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@320@01 a1@251@01 i1@252@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((a $Ref) (i Int)) (!
  (= (pTaken@320@01 a i) $Perm.No)
  
  :qid |quant-u-199|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01))
      (and (img@313@01 a i) (img@315@01 a i))
      (and (= a (inv@312@01 a i)) (= i (inv@314@01 a i))))
    (=
      (-
        (- (- $Perm.Write (pTaken@318@01 a i)) (pTaken@319@01 a i))
        (pTaken@320@01 a i))
      $Perm.No))
  
  :qid |quant-u-200|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@321@01 $PSF<two>)
(declare-const s@322@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@322@01 $Snap)) (!
  (and
    (=>
      (Set_in s@322@01 ($PSF.domain_two (as sm@321@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))))
    (=>
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
      (Set_in s@322@01 ($PSF.domain_two (as sm@321@01  $PSF<two>)))))
  :pattern ((Set_in s@322@01 ($PSF.domain_two (as sm@321@01  $PSF<two>))))
  :qid |qp.psmDomDef160|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@322@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) a1@251@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@322@01)) i1@252@01)))
    (and
      (not (= s@322@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01)
        ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@322@01))))
  :pattern (($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01))
  :pattern (($PSF.lookup_two (as sm@296@01  $PSF<two>) s@322@01))
  :qid |qp.psmValDef156|)))
(assert (forall ((s@322@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
      (ite
        (and
          (and
            (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
            (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
          (and
            (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) bs@247@01)
            (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) js@248@01)))
        (<
          $Perm.No
          (-
            (-
              (-
                $Perm.Write
                (pTaken@288@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
              (pTaken@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
            (pTaken@306@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
        false))
    (and
      (not (= s@322@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@322@01))))
  :pattern (($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@322@01))
  :qid |qp.psmValDef157|)))
(assert (forall ((s@322@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
      (ite
        (and
          (and
            (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
            (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
          (and
            (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
            (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01)))
        (<
          $Perm.No
          (-
            (-
              (-
                $Perm.Write
                (pTaken@287@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
              (pTaken@294@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
            (pTaken@305@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
        false))
    (and
      (not (= s@322@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@322@01))))
  :pattern (($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@322@01))
  :qid |qp.psmValDef158|)))
(assert (forall ((s@322@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@322@01) s@322@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@322@01) s@322@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@322@01) s@322@01))
  :pattern (($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01))
  :qid |qp.psmResTrgDef159|)))
(assert (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@321@01  $PSF<two>)) as@245@01 is@246@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((s@317@01 $Snap)) (!
  (=>
    (and
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) a1@251@01)
      (= ($SortWrappers.$SnapToInt ($Snap.second s@317@01)) i1@252@01))
    (and
      (not (= s@317@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01)
        ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@317@01))))
  :pattern (($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01))
  :pattern (($PSF.lookup_two (as sm@296@01  $PSF<two>) s@317@01))
  :qid |qp.psmValDef152|)))
(assert (forall ((s@317@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01)))
          (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
        (and
          (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))) bs@247@01)
          (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))) js@248@01)))
      (<
        $Perm.No
        (-
          (-
            (-
              $Perm.Write
              (pTaken@288@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
            (pTaken@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
          (pTaken@306@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01)))))
      false)
    (and
      (not (= s@317@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@317@01))))
  :pattern (($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@317@01))
  :qid |qp.psmValDef153|)))
(assert (forall ((s@317@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01)))
          (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
        (and
          (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))) as@245@01)
          (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))) is@246@01)))
      (<
        $Perm.No
        (-
          (-
            (-
              $Perm.Write
              (pTaken@287@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
            (pTaken@294@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01))))
          (pTaken@305@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@317@01)) ($SortWrappers.$SnapToInt ($Snap.second s@317@01)))))
      false)
    (and
      (not (= s@317@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@317@01))))
  :pattern (($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@317@01))
  :qid |qp.psmValDef154|)))
(assert (forall ((s@317@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@317@01) s@317@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@317@01) s@317@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@317@01) s@317@01))
  :pattern (($PSF.lookup_two (as sm@316@01  $PSF<two>) s@317@01))
  :qid |qp.psmResTrgDef155|)))
(assert (forall ((a@310@01 $Ref) (i@311@01 Int)) (!
  (=>
    (and (Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01))
    (and
      (and
        (= (inv@312@01 a@310@01 i@311@01) a@310@01)
        (= (inv@314@01 a@310@01 i@311@01) i@311@01))
      (and (img@313@01 a@310@01 i@311@01) (img@315@01 a@310@01 i@311@01))))
  :pattern ((Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01))
  :pattern ((Set_in a@310@01 as@245@01) (inv@312@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (inv@314@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (img@313@01 a@310@01 i@311@01))
  :pattern ((Set_in a@310@01 as@245@01) (img@315@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (inv@312@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (inv@314@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (img@313@01 a@310@01 i@311@01))
  :pattern ((Set_in i@311@01 is@246@01) (img@315@01 a@310@01 i@311@01))
  :pattern ((inv@312@01 a@310@01 i@311@01))
  :pattern ((inv@314@01 a@310@01 i@311@01))
  :pattern ((img@313@01 a@310@01 i@311@01))
  :pattern ((img@315@01 a@310@01 i@311@01))
  :qid |two-invOfFct|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and (img@313@01 a i) (img@315@01 a i))
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01)))
    (and (= (inv@312@01 a i) a) (= (inv@314@01 a i) i)))
  :pattern ((inv@312@01 a i))
  :pattern ((inv@314@01 a i))
  :qid |two-fctOfInv|)))
(assert (forall ((s@322@01 $Snap)) (!
  (and
    (=>
      (Set_in s@322@01 ($PSF.domain_two (as sm@321@01  $PSF<two>)))
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))))
    (=>
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
      (Set_in s@322@01 ($PSF.domain_two (as sm@321@01  $PSF<two>)))))
  :pattern ((Set_in s@322@01 ($PSF.domain_two (as sm@321@01  $PSF<two>))))
  :qid |qp.psmDomDef160|)))
(assert (forall ((s@322@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) a1@251@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@322@01)) i1@252@01)))
    (and
      (not (= s@322@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01)
        ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@322@01))))
  :pattern (($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01))
  :pattern (($PSF.lookup_two (as sm@296@01  $PSF<two>) s@322@01))
  :qid |qp.psmValDef156|)))
(assert (forall ((s@322@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
      (ite
        (and
          (and
            (img@267@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
            (img@269@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
          (and
            (Set_in (inv@266@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) bs@247@01)
            (Set_in (inv@268@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) js@248@01)))
        (<
          $Perm.No
          (-
            (-
              (-
                $Perm.Write
                (pTaken@288@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
              (pTaken@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
            (pTaken@306@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
        false))
    (and
      (not (= s@322@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@322@01))))
  :pattern (($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@322@01))
  :qid |qp.psmValDef157|)))
(assert (forall ((s@322@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Set_in (inv@312@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
          (Set_in (inv@314@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01))
        (and
          (img@313@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
          (img@315@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
      (ite
        (and
          (and
            (img@259@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))
            (img@261@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
          (and
            (Set_in (inv@258@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) as@245@01)
            (Set_in (inv@260@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))) is@246@01)))
        (<
          $Perm.No
          (-
            (-
              (-
                $Perm.Write
                (pTaken@287@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
              (pTaken@294@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01))))
            (pTaken@305@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@322@01)) ($SortWrappers.$SnapToInt ($Snap.second s@322@01)))))
        false))
    (and
      (not (= s@322@01 $Snap.unit))
      (=
        ($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@322@01))))
  :pattern (($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@322@01))
  :qid |qp.psmValDef158|)))
(assert (forall ((s@322@01 $Snap)) (!
  (and
    ($PSF.loc_two ($PSF.lookup_two (as sm@296@01  $PSF<two>) s@322@01) s@322@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.second $t@253@01)) s@322@01) s@322@01)
    ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> ($Snap.first $t@253@01)) s@322@01) s@322@01))
  :pattern (($PSF.lookup_two (as sm@321@01  $PSF<two>) s@322@01))
  :qid |qp.psmResTrgDef159|)))
(assert (and
  (forall ((a@310@01 $Ref) (i@311@01 Int)) (!
    (=>
      (and (Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01))
      (or (Set_in a@310@01 as@245@01) (not (Set_in a@310@01 as@245@01))))
    :pattern ((Set_in a@310@01 as@245@01) (Set_in i@311@01 is@246@01))
    :pattern ((Set_in a@310@01 as@245@01) (inv@312@01 a@310@01 i@311@01))
    :pattern ((Set_in a@310@01 as@245@01) (inv@314@01 a@310@01 i@311@01))
    :pattern ((Set_in a@310@01 as@245@01) (img@313@01 a@310@01 i@311@01))
    :pattern ((Set_in a@310@01 as@245@01) (img@315@01 a@310@01 i@311@01))
    :pattern ((Set_in i@311@01 is@246@01) (inv@312@01 a@310@01 i@311@01))
    :pattern ((Set_in i@311@01 is@246@01) (inv@314@01 a@310@01 i@311@01))
    :pattern ((Set_in i@311@01 is@246@01) (img@313@01 a@310@01 i@311@01))
    :pattern ((Set_in i@311@01 is@246@01) (img@315@01 a@310@01 i@311@01))
    :pattern ((inv@312@01 a@310@01 i@311@01))
    :pattern ((inv@314@01 a@310@01 i@311@01))
    :pattern ((img@313@01 a@310@01 i@311@01))
    :pattern ((img@315@01 a@310@01 i@311@01))
    :qid |two-aux|))
  (forall ((a $Ref) (i Int)) (!
    (=>
      (and
        (Set_in (inv@312@01 a i) as@245@01)
        (Set_in (inv@314@01 a i) is@246@01))
      ($PSF.loc_two ($PSF.lookup_two (as sm@316@01  $PSF<two>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a)
        ($SortWrappers.IntTo$Snap i))))
    :pattern ((inv@312@01 a i) (inv@314@01 a i))
    :qid |quant-u-190|))
  (foo_twos%precondition ($SortWrappers.$PSF<two>To$Snap (as sm@321@01  $PSF<two>)) as@245@01 is@246@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@321@01  $PSF<two>)) as@245@01 is@246@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,06s
; (get-info :all-statistics)
(assert (=
  (foo_twos ($SortWrappers.$PSF<two>To$Snap (as sm@321@01  $PSF<two>)) as@245@01 is@246@01)
  0))
(pop) ; 2
(pop) ; 1
