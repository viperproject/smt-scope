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
; ---------- FUNCTION foo_ones----------
(declare-fun as@0@00 () Set<$Ref>)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const a@7@00 $Ref)
(push) ; 2
; [eval] (a in as)
(assert (Set_in a@7@00 as@0@00))
(declare-fun sm@8@00 ($Snap Set<$Ref>) $PSF<one>)
(declare-const s@9@00 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@10@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@11@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((a1@7@00 $Ref) (a2@7@00 $Ref)) (!
  (=>
    (and (Set_in a1@7@00 as@0@00) (Set_in a2@7@00 as@0@00) (= a1@7@00 a2@7@00))
    (= a1@7@00 a2@7@00))
  
  :qid |one-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@7@00 $Ref)) (!
  (=>
    (Set_in a@7@00 as@0@00)
    (and
      (= (inv@10@00 s@$ as@0@00 a@7@00) a@7@00)
      (img@11@00 s@$ as@0@00 a@7@00)))
  :pattern (($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> s@$) ($SortWrappers.$RefTo$Snap a@7@00)) ($SortWrappers.$RefTo$Snap a@7@00)))
  :qid |quant-u-7|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@11@00 s@$ as@0@00 a) (Set_in (inv@10@00 s@$ as@0@00 a) as@0@00))
    (= (inv@10@00 s@$ as@0@00 a) a))
  :pattern ((inv@10@00 s@$ as@0@00 a))
  :qid |one-fctOfInv|)))
; Permissions are non-negative
(declare-fun sm@12@00 ($Snap Set<$Ref>) $PSF<one>)
(declare-const s@13@00 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@13@00 $Snap)) (!
  (=>
    (and
      (img@11@00 s@$ as@0@00 ($SortWrappers.$SnapTo$Ref s@13@00))
      (Set_in (inv@10@00 s@$ as@0@00 ($SortWrappers.$SnapTo$Ref s@13@00)) as@0@00))
    (and
      (not (= s@13@00 $Snap.unit))
      (=
        ($PSF.lookup_one (sm@12@00 s@$ as@0@00) s@13@00)
        ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> s@$) s@13@00))))
  :pattern (($PSF.lookup_one (sm@12@00 s@$ as@0@00) s@13@00))
  :pattern (($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> s@$) s@13@00))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@13@00 $Snap)) (!
  ($PSF.loc_one ($PSF.lookup_one ($SortWrappers.$SnapTo$PSF<one> s@$) s@13@00) s@13@00)
  :pattern (($PSF.lookup_one (sm@12@00 s@$ as@0@00) s@13@00))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@10@00 s@$ as@0@00 a) as@0@00)
    ($PSF.loc_one ($PSF.lookup_one (sm@12@00 s@$ as@0@00) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@10@00 s@$ as@0@00 a))
  :qid |quant-u-8|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (as@0@00 Set<$Ref>)) (!
  (= (foo_ones%limited s@$ as@0@00) (foo_ones s@$ as@0@00))
  :pattern ((foo_ones s@$ as@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (as@0@00 Set<$Ref>)) (!
  (foo_ones%stateless as@0@00)
  :pattern ((foo_ones%limited s@$ as@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION foo_twos----------
(declare-fun as@2@00 () Set<$Ref>)
(declare-fun is@3@00 () Set<Int>)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const a@14@00 $Ref)
(declare-const i@15@00 Int)
(push) ; 2
; [eval] (a in as) && (i in is)
; [eval] (a in as)
(push) ; 3
; [then-branch: 0 | !(a@14@00 in as@2@00) | live]
; [else-branch: 0 | a@14@00 in as@2@00 | live]
(push) ; 4
; [then-branch: 0 | !(a@14@00 in as@2@00)]
(assert (not (Set_in a@14@00 as@2@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | a@14@00 in as@2@00]
(assert (Set_in a@14@00 as@2@00))
; [eval] (i in is)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@14@00 as@2@00) (not (Set_in a@14@00 as@2@00))))
(assert (and (Set_in a@14@00 as@2@00) (Set_in i@15@00 is@3@00)))
(declare-fun sm@16@00 ($Snap Set<$Ref> Set<Int>) $PSF<two>)
(declare-const s@17@00 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@18@00 ($Snap Set<$Ref> Set<Int> $Ref Int) $Ref)
(declare-fun img@19@00 ($Snap Set<$Ref> Set<Int> $Ref Int) Bool)
(declare-fun inv@20@00 ($Snap Set<$Ref> Set<Int> $Ref Int) Int)
(declare-fun img@21@00 ($Snap Set<$Ref> Set<Int> $Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@14@00 $Ref) (i@15@00 Int)) (!
  (=>
    (and (Set_in a@14@00 as@2@00) (Set_in i@15@00 is@3@00))
    (or (Set_in a@14@00 as@2@00) (not (Set_in a@14@00 as@2@00))))
  :pattern (($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> s@$) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@14@00)
    ($SortWrappers.IntTo$Snap i@15@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@14@00)
    ($SortWrappers.IntTo$Snap i@15@00))))
  :qid |two-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((a1@14@00 $Ref) (i1@15@00 Int) (a2@14@00 $Ref) (i2@15@00 Int)) (!
  (=>
    (and
      (and (Set_in a1@14@00 as@2@00) (Set_in i1@15@00 is@3@00))
      (and (Set_in a2@14@00 as@2@00) (Set_in i2@15@00 is@3@00))
      (and (= a1@14@00 a2@14@00) (= i1@15@00 i2@15@00)))
    (and (= a1@14@00 a2@14@00) (= i1@15@00 i2@15@00)))
  
  :qid |two-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@14@00 $Ref) (i@15@00 Int)) (!
  (=>
    (and (Set_in a@14@00 as@2@00) (Set_in i@15@00 is@3@00))
    (and
      (and
        (= (inv@18@00 s@$ as@2@00 is@3@00 a@14@00 i@15@00) a@14@00)
        (= (inv@20@00 s@$ as@2@00 is@3@00 a@14@00 i@15@00) i@15@00))
      (and
        (img@19@00 s@$ as@2@00 is@3@00 a@14@00 i@15@00)
        (img@21@00 s@$ as@2@00 is@3@00 a@14@00 i@15@00))))
  :pattern (($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> s@$) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@14@00)
    ($SortWrappers.IntTo$Snap i@15@00))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@14@00)
    ($SortWrappers.IntTo$Snap i@15@00))))
  :qid |quant-u-10|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (and
        (img@19@00 s@$ as@2@00 is@3@00 a i)
        (img@21@00 s@$ as@2@00 is@3@00 a i))
      (and
        (Set_in (inv@18@00 s@$ as@2@00 is@3@00 a i) as@2@00)
        (Set_in (inv@20@00 s@$ as@2@00 is@3@00 a i) is@3@00)))
    (and
      (= (inv@18@00 s@$ as@2@00 is@3@00 a i) a)
      (= (inv@20@00 s@$ as@2@00 is@3@00 a i) i)))
  :pattern ((inv@18@00 s@$ as@2@00 is@3@00 a i))
  :pattern ((inv@20@00 s@$ as@2@00 is@3@00 a i))
  :qid |two-fctOfInv|)))
; Permissions are non-negative
(declare-fun sm@22@00 ($Snap Set<$Ref> Set<Int>) $PSF<two>)
(declare-const s@23@00 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@23@00 $Snap)) (!
  (=>
    (and
      (and
        (img@19@00 s@$ as@2@00 is@3@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@23@00)) ($SortWrappers.$SnapToInt ($Snap.second s@23@00)))
        (img@21@00 s@$ as@2@00 is@3@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@23@00)) ($SortWrappers.$SnapToInt ($Snap.second s@23@00))))
      (and
        (Set_in (inv@18@00 s@$ as@2@00 is@3@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@23@00)) ($SortWrappers.$SnapToInt ($Snap.second s@23@00))) as@2@00)
        (Set_in (inv@20@00 s@$ as@2@00 is@3@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@23@00)) ($SortWrappers.$SnapToInt ($Snap.second s@23@00))) is@3@00)))
    (and
      (not (= s@23@00 $Snap.unit))
      (=
        ($PSF.lookup_two (sm@22@00 s@$ as@2@00 is@3@00) s@23@00)
        ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> s@$) s@23@00))))
  :pattern (($PSF.lookup_two (sm@22@00 s@$ as@2@00 is@3@00) s@23@00))
  :pattern (($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> s@$) s@23@00))
  :qid |qp.psmValDef4|)))
(assert (forall ((s@23@00 $Snap)) (!
  ($PSF.loc_two ($PSF.lookup_two ($SortWrappers.$SnapTo$PSF<two> s@$) s@23@00) s@23@00)
  :pattern (($PSF.lookup_two (sm@22@00 s@$ as@2@00 is@3@00) s@23@00))
  :qid |qp.psmResTrgDef5|)))
(assert (forall ((a $Ref) (i Int)) (!
  (=>
    (and
      (Set_in (inv@18@00 s@$ as@2@00 is@3@00 a i) as@2@00)
      (Set_in (inv@20@00 s@$ as@2@00 is@3@00 a i) is@3@00))
    ($PSF.loc_two ($PSF.lookup_two (sm@22@00 s@$ as@2@00 is@3@00) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a)
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@18@00 s@$ as@2@00 is@3@00 a i) (inv@20@00 s@$ as@2@00 is@3@00 a i))
  :qid |quant-u-11|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (as@2@00 Set<$Ref>) (is@3@00 Set<Int>)) (!
  (= (foo_twos%limited s@$ as@2@00 is@3@00) (foo_twos s@$ as@2@00 is@3@00))
  :pattern ((foo_twos s@$ as@2@00 is@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (as@2@00 Set<$Ref>) (is@3@00 Set<Int>)) (!
  (foo_twos%stateless as@2@00 is@3@00)
  :pattern ((foo_twos%limited s@$ as@2@00 is@3@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION foo_vals----------
(declare-fun as@5@00 () Set<$Ref>)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const a@24@00 $Ref)
(push) ; 2
; [eval] (a in as)
(assert (Set_in a@24@00 as@5@00))
(declare-fun sm@25@00 ($Snap Set<$Ref>) $FVF<val>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@26@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@27@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((a1@24@00 $Ref) (a2@24@00 $Ref)) (!
  (=>
    (and
      (Set_in a1@24@00 as@5@00)
      (Set_in a2@24@00 as@5@00)
      (= a1@24@00 a2@24@00))
    (= a1@24@00 a2@24@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@24@00 $Ref)) (!
  (=>
    (Set_in a@24@00 as@5@00)
    (and
      (= (inv@26@00 s@$ as@5@00 a@24@00) a@24@00)
      (img@27@00 s@$ as@5@00 a@24@00)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) a@24@00) a@24@00))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@00 s@$ as@5@00 r) (Set_in (inv@26@00 s@$ as@5@00 r) as@5@00))
    (= (inv@26@00 s@$ as@5@00 r) r))
  :pattern ((inv@26@00 s@$ as@5@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((a@24@00 $Ref)) (!
  (=> (Set_in a@24@00 as@5@00) (not (= a@24@00 $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) a@24@00) a@24@00))
  :qid |val-permImpliesNonNull|)))
(declare-fun sm@28@00 ($Snap Set<$Ref>) $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@00 s@$ as@5@00 r) (Set_in (inv@26@00 s@$ as@5@00 r) as@5@00))
    (=
      ($FVF.lookup_val (sm@28@00 s@$ as@5@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r)))
  :pattern (($FVF.lookup_val (sm@28@00 s@$ as@5@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r) r)
  :pattern (($FVF.lookup_val (sm@28@00 s@$ as@5@00) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@26@00 s@$ as@5@00 r) as@5@00)
    ($FVF.loc_val ($FVF.lookup_val (sm@28@00 s@$ as@5@00) r) r))
  :pattern ((inv@26@00 s@$ as@5@00 r))
  :qid |quant-u-14|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (as@5@00 Set<$Ref>)) (!
  (= (foo_vals%limited s@$ as@5@00) (foo_vals s@$ as@5@00))
  :pattern ((foo_vals s@$ as@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (as@5@00 Set<$Ref>)) (!
  (foo_vals%stateless as@5@00)
  :pattern ((foo_vals%limited s@$ as@5@00))
  :qid |quant-u-5|)))
; ---------- one ----------
(declare-const a@29@00 $Ref)
(push) ; 1
(declare-const $t@30@00 Int)
(assert (not (= a@29@00 $Ref.null)))
(pop) ; 1
; ---------- two ----------
(declare-const a@31@00 $Ref)
(declare-const i@32@00 Int)
(push) ; 1
(declare-const $t@33@00 Int)
(assert (not (= a@31@00 $Ref.null)))
(pop) ; 1
