(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/constraining_permissions.vpr
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
(declare-sort Set<$Snap> 0)
(declare-sort Foo 0)
(declare-sort $FVF<f> 0)
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
(declare-fun $SortWrappers.FooTo$Snap (Foo) $Snap)
(declare-fun $SortWrappers.$SnapToFoo ($Snap) Foo)
(assert (forall ((x Foo)) (!
    (= x ($SortWrappers.$SnapToFoo($SortWrappers.FooTo$Snap x)))
    :pattern (($SortWrappers.FooTo$Snap x))
    :qid |$Snap.$SnapToFooTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FooTo$Snap($SortWrappers.$SnapToFoo x)))
    :pattern (($SortWrappers.$SnapToFoo x))
    :qid |$Snap.FooTo$SnapToFoo|
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
(declare-fun foo<Perm> ($Ref) $Perm)
; /field_value_functions_declarations.smt2 [f: Ref]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) $Ref)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f ($Ref $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((x $Ref)) (!
  (> (foo<Perm> x) $Perm.No)
  :pattern ((foo<Perm> x))
  :qid |prog.foo_not_none|)))
; /field_value_functions_axioms.smt2 [f: Ref]
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
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
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
; ---------- test00 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const xs@1@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const x@2@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@2@01 xs@1@01))
(declare-const $k@3@01 $Perm)
(assert ($Perm.isReadVar $k@3@01))
(pop) ; 2
(declare-const $t@4@01 $FVF<f>)
(declare-fun inv@5@01 ($Ref) $Ref)
(declare-fun img@6@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@3@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@2@01 $Ref)) (!
  (=> (Set_in x@2@01 xs@1@01) (or (= $k@3@01 $Perm.No) (< $Perm.No $k@3@01)))
  
  :qid |quant-u-0|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@2@01 $Ref) (x2@2@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@2@01 xs@1@01) (< $Perm.No $k@3@01))
      (and (Set_in x2@2@01 xs@1@01) (< $Perm.No $k@3@01))
      (= x1@2@01 x2@2@01))
    (= x1@2@01 x2@2@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@2@01 $Ref)) (!
  (=>
    (and (Set_in x@2@01 xs@1@01) (< $Perm.No $k@3@01))
    (and (= (inv@5@01 x@2@01) x@2@01) (img@6@01 x@2@01)))
  :pattern ((Set_in x@2@01 xs@1@01))
  :pattern ((inv@5@01 x@2@01))
  :pattern ((img@6@01 x@2@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (and (Set_in (inv@5@01 r) xs@1@01) (< $Perm.No $k@3@01)))
    (= (inv@5@01 r) r))
  :pattern ((inv@5@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@2@01 $Ref)) (!
  (<= $Perm.No $k@3@01)
  :pattern ((Set_in x@2@01 xs@1@01))
  :pattern ((inv@5@01 x@2@01))
  :pattern ((img@6@01 x@2@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@2@01 $Ref)) (!
  (<= $k@3@01 $Perm.Write)
  :pattern ((Set_in x@2@01 xs@1@01))
  :pattern ((inv@5@01 x@2@01))
  :pattern ((img@6@01 x@2@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@2@01 $Ref)) (!
  (=>
    (and (Set_in x@2@01 xs@1@01) (< $Perm.No $k@3@01))
    (not (= x@2@01 $Ref.null)))
  :pattern ((Set_in x@2@01 xs@1@01))
  :pattern ((inv@5@01 x@2@01))
  :pattern ((img@6@01 x@2@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@7@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@7@01 xs@1@01))
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(pop) ; 3
(declare-const $t@9@01 $FVF<f>)
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@8@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@7@01 $Ref)) (!
  (=> (Set_in x@7@01 xs@1@01) (or (= $k@8@01 $Perm.No) (< $Perm.No $k@8@01)))
  
  :qid |quant-u-2|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@7@01 $Ref) (x2@7@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@7@01 xs@1@01) (< $Perm.No $k@8@01))
      (and (Set_in x2@7@01 xs@1@01) (< $Perm.No $k@8@01))
      (= x1@7@01 x2@7@01))
    (= x1@7@01 x2@7@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@7@01 $Ref)) (!
  (=>
    (and (Set_in x@7@01 xs@1@01) (< $Perm.No $k@8@01))
    (and (= (inv@10@01 x@7@01) x@7@01) (img@11@01 x@7@01)))
  :pattern ((Set_in x@7@01 xs@1@01))
  :pattern ((inv@10@01 x@7@01))
  :pattern ((img@11@01 x@7@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (and (Set_in (inv@10@01 r) xs@1@01) (< $Perm.No $k@8@01)))
    (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@7@01 $Ref)) (!
  (<= $Perm.No $k@8@01)
  :pattern ((Set_in x@7@01 xs@1@01))
  :pattern ((inv@10@01 x@7@01))
  :pattern ((img@11@01 x@7@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@7@01 $Ref)) (!
  (<= $k@8@01 $Perm.Write)
  :pattern ((Set_in x@7@01 xs@1@01))
  :pattern ((inv@10@01 x@7@01))
  :pattern ((img@11@01 x@7@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@7@01 $Ref)) (!
  (=>
    (and (Set_in x@7@01 xs@1@01) (< $Perm.No $k@8@01))
    (not (= x@7@01 $Ref.null)))
  :pattern ((Set_in x@7@01 xs@1@01))
  :pattern ((inv@10@01 x@7@01))
  :pattern ((img@11@01 x@7@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@12@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@12@01 xs@1@01))
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(pop) ; 3
(declare-fun inv@14@01 ($Ref) $Ref)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@13@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@12@01 $Ref)) (!
  (=> (Set_in x@12@01 xs@1@01) (or (= $k@13@01 $Perm.No) (< $Perm.No $k@13@01)))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@12@01 $Ref) (x2@12@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@12@01 xs@1@01) (< $Perm.No $k@13@01))
      (and (Set_in x2@12@01 xs@1@01) (< $Perm.No $k@13@01))
      (= x1@12@01 x2@12@01))
    (= x1@12@01 x2@12@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (and (Set_in x@12@01 xs@1@01) (< $Perm.No $k@13@01))
    (and (= (inv@14@01 x@12@01) x@12@01) (img@15@01 x@12@01)))
  :pattern ((Set_in x@12@01 xs@1@01))
  :pattern ((inv@14@01 x@12@01))
  :pattern ((img@15@01 x@12@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (Set_in (inv@14@01 r) xs@1@01) (< $Perm.No $k@13@01)))
    (= (inv@14@01 r) r))
  :pattern ((inv@14@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@16@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@14@01 r) xs@1@01) (img@15@01 r) (= r (inv@14@01 r)))
    ($Perm.min
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) xs@1@01)) $k@3@01 $Perm.No)
      $k@13@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@13@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite (and (img@6@01 r) (Set_in (inv@5@01 r) xs@1@01)) $k@3@01 $Perm.No)
        $Perm.No))
    (ite
      (and (img@6@01 r) (Set_in (inv@5@01 r) xs@1@01))
      (<
        (ite
          (and (Set_in (inv@14@01 r) xs@1@01) (img@15@01 r) (= r (inv@14@01 r)))
          $k@13@01
          $Perm.No)
        $k@3@01)
      (<
        (ite
          (and (Set_in (inv@14@01 r) xs@1@01) (img@15@01 r) (= r (inv@14@01 r)))
          $k@13@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@6@01 r))
  :pattern ((Set_in (inv@5@01 r) xs@1@01))
  :pattern ((Set_in (inv@14@01 r) xs@1@01))
  :pattern ((img@15@01 r))
  :qid |qp.srp0|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@14@01 r) xs@1@01) (img@15@01 r) (= r (inv@14@01 r)))
    (= (- $k@13@01 (pTaken@16@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@17@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@6@01 r) (Set_in (inv@5@01 r) xs@1@01))
      (< $Perm.No $k@3@01)
      false)
    (= ($FVF.lookup_f (as sm@17@01  $FVF<f>) r) ($FVF.lookup_f $t@4@01 r)))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@4@01 r))
  :qid |qp.fvfValDef1|)))
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const xs@18@01 Set<$Ref>)
(declare-const ys@19@01 Set<$Ref>)
(declare-const xs@20@01 Set<$Ref>)
(declare-const ys@21@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(declare-const x@23@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@23@01 xs@20@01))
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(pop) ; 2
(declare-fun inv@25@01 ($Ref) $Ref)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@24@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@23@01 $Ref)) (!
  (=> (Set_in x@23@01 xs@20@01) (or (= $k@24@01 $Perm.No) (< $Perm.No $k@24@01)))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@23@01 $Ref) (x2@23@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@23@01 xs@20@01) (< $Perm.No $k@24@01))
      (and (Set_in x2@23@01 xs@20@01) (< $Perm.No $k@24@01))
      (= x1@23@01 x2@23@01))
    (= x1@23@01 x2@23@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@23@01 $Ref)) (!
  (=>
    (and (Set_in x@23@01 xs@20@01) (< $Perm.No $k@24@01))
    (and (= (inv@25@01 x@23@01) x@23@01) (img@26@01 x@23@01)))
  :pattern ((Set_in x@23@01 xs@20@01))
  :pattern ((inv@25@01 x@23@01))
  :pattern ((img@26@01 x@23@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@26@01 r)
      (and (Set_in (inv@25@01 r) xs@20@01) (< $Perm.No $k@24@01)))
    (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@23@01 $Ref)) (!
  (<= $Perm.No $k@24@01)
  :pattern ((Set_in x@23@01 xs@20@01))
  :pattern ((inv@25@01 x@23@01))
  :pattern ((img@26@01 x@23@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@23@01 $Ref)) (!
  (<= $k@24@01 $Perm.Write)
  :pattern ((Set_in x@23@01 xs@20@01))
  :pattern ((inv@25@01 x@23@01))
  :pattern ((img@26@01 x@23@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@23@01 $Ref)) (!
  (=>
    (and (Set_in x@23@01 xs@20@01) (< $Perm.No $k@24@01))
    (not (= x@23@01 $Ref.null)))
  :pattern ((Set_in x@23@01 xs@20@01))
  :pattern ((inv@25@01 x@23@01))
  :pattern ((img@26@01 x@23@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@27@01 $Ref)
(push) ; 2
; [eval] (x in ys)
(assert (Set_in x@27@01 ys@21@01))
(declare-const $k@28@01 $Perm)
(assert ($Perm.isReadVar $k@28@01))
(pop) ; 2
(declare-fun inv@29@01 ($Ref) $Ref)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@28@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@27@01 $Ref)) (!
  (=> (Set_in x@27@01 ys@21@01) (or (= $k@28@01 $Perm.No) (< $Perm.No $k@28@01)))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@27@01 ys@21@01) (< $Perm.No $k@28@01))
      (and (Set_in x2@27@01 ys@21@01) (< $Perm.No $k@28@01))
      (= x1@27@01 x2@27@01))
    (= x1@27@01 x2@27@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (and (Set_in x@27@01 ys@21@01) (< $Perm.No $k@28@01))
    (and (= (inv@29@01 x@27@01) x@27@01) (img@30@01 x@27@01)))
  :pattern ((Set_in x@27@01 ys@21@01))
  :pattern ((inv@29@01 x@27@01))
  :pattern ((img@30@01 x@27@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (Set_in (inv@29@01 r) ys@21@01) (< $Perm.No $k@28@01)))
    (= (inv@29@01 r) r))
  :pattern ((inv@29@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@27@01 $Ref)) (!
  (<= $Perm.No $k@28@01)
  :pattern ((Set_in x@27@01 ys@21@01))
  :pattern ((inv@29@01 x@27@01))
  :pattern ((img@30@01 x@27@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@27@01 $Ref)) (!
  (<= $k@28@01 $Perm.Write)
  :pattern ((Set_in x@27@01 ys@21@01))
  :pattern ((inv@29@01 x@27@01))
  :pattern ((img@30@01 x@27@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (and (Set_in x@27@01 ys@21@01) (< $Perm.No $k@28@01))
    (not (= x@27@01 $Ref.null)))
  :pattern ((Set_in x@27@01 ys@21@01))
  :pattern ((inv@29@01 x@27@01))
  :pattern ((img@30@01 x@27@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= x@27@01 x@23@01)
    (=
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@21@01))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@20@01))))
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@31@01 $Ref)
(push) ; 3
; [eval] (x in (xs union ys))
; [eval] (xs union ys)
(assert (Set_in x@31@01 (Set_union xs@20@01 ys@21@01)))
(declare-const $k@32@01 $Perm)
(assert ($Perm.isReadVar $k@32@01))
(pop) ; 3
(declare-const $t@33@01 $FVF<f>)
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@32@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@31@01 $Ref)) (!
  (=>
    (Set_in x@31@01 (Set_union xs@20@01 ys@21@01))
    (or (= $k@32@01 $Perm.No) (< $Perm.No $k@32@01)))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@31@01 $Ref) (x2@31@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@31@01 (Set_union xs@20@01 ys@21@01)) (< $Perm.No $k@32@01))
      (and (Set_in x2@31@01 (Set_union xs@20@01 ys@21@01)) (< $Perm.No $k@32@01))
      (= x1@31@01 x2@31@01))
    (= x1@31@01 x2@31@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@31@01 $Ref)) (!
  (=>
    (and (Set_in x@31@01 (Set_union xs@20@01 ys@21@01)) (< $Perm.No $k@32@01))
    (and (= (inv@34@01 x@31@01) x@31@01) (img@35@01 x@31@01)))
  :pattern ((Set_in x@31@01 (Set_union xs@20@01 ys@21@01)))
  :pattern ((inv@34@01 x@31@01))
  :pattern ((img@35@01 x@31@01))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@01 r)
      (and
        (Set_in (inv@34@01 r) (Set_union xs@20@01 ys@21@01))
        (< $Perm.No $k@32@01)))
    (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@31@01 $Ref)) (!
  (<= $Perm.No $k@32@01)
  :pattern ((Set_in x@31@01 (Set_union xs@20@01 ys@21@01)))
  :pattern ((inv@34@01 x@31@01))
  :pattern ((img@35@01 x@31@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@31@01 $Ref)) (!
  (<= $k@32@01 $Perm.Write)
  :pattern ((Set_in x@31@01 (Set_union xs@20@01 ys@21@01)))
  :pattern ((inv@34@01 x@31@01))
  :pattern ((img@35@01 x@31@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@31@01 $Ref)) (!
  (=>
    (and (Set_in x@31@01 (Set_union xs@20@01 ys@21@01)) (< $Perm.No $k@32@01))
    (not (= x@31@01 $Ref.null)))
  :pattern ((Set_in x@31@01 (Set_union xs@20@01 ys@21@01)))
  :pattern ((inv@34@01 x@31@01))
  :pattern ((img@35@01 x@31@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@36@01 $Ref)
(push) ; 3
; [eval] (x in (xs union ys))
; [eval] (xs union ys)
(assert (Set_in x@36@01 (Set_union xs@20@01 ys@21@01)))
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(pop) ; 3
(declare-fun inv@38@01 ($Ref) $Ref)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@37@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@36@01 $Ref)) (!
  (=>
    (Set_in x@36@01 (Set_union xs@20@01 ys@21@01))
    (or (= $k@37@01 $Perm.No) (< $Perm.No $k@37@01)))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@36@01 $Ref) (x2@36@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@36@01 (Set_union xs@20@01 ys@21@01)) (< $Perm.No $k@37@01))
      (and (Set_in x2@36@01 (Set_union xs@20@01 ys@21@01)) (< $Perm.No $k@37@01))
      (= x1@36@01 x2@36@01))
    (= x1@36@01 x2@36@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@36@01 $Ref)) (!
  (=>
    (and (Set_in x@36@01 (Set_union xs@20@01 ys@21@01)) (< $Perm.No $k@37@01))
    (and (= (inv@38@01 x@36@01) x@36@01) (img@39@01 x@36@01)))
  :pattern ((Set_in x@36@01 (Set_union xs@20@01 ys@21@01)))
  :pattern ((inv@38@01 x@36@01))
  :pattern ((img@39@01 x@36@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@01 r)
      (and
        (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
        (< $Perm.No $k@37@01)))
    (= (inv@38@01 r) r))
  :pattern ((inv@38@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
      (img@39@01 r)
      (= r (inv@38@01 r)))
    ($Perm.min
      (ite (and (img@26@01 r) (Set_in (inv@25@01 r) xs@20@01)) $k@24@01 $Perm.No)
      $k@37@01)
    $Perm.No))
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
      (img@39@01 r)
      (= r (inv@38@01 r)))
    ($Perm.min
      (ite (and (img@30@01 r) (Set_in (inv@29@01 r) ys@21@01)) $k@28@01 $Perm.No)
      (- $k@37@01 (pTaken@40@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@37@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@26@01 r) (Set_in (inv@25@01 r) xs@20@01))
          $k@24@01
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@20@01))
      (<
        (ite
          (and
            (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
            (img@39@01 r)
            (= r (inv@38@01 r)))
          $k@37@01
          $Perm.No)
        $k@24@01)
      (<
        (ite
          (and
            (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
            (img@39@01 r)
            (= r (inv@38@01 r)))
          $k@37@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@26@01 r))
  :pattern ((Set_in (inv@25@01 r) xs@20@01))
  :pattern ((Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01)))
  :pattern ((img@39@01 r))
  :qid |qp.srp2|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
      (img@39@01 r)
      (= r (inv@38@01 r)))
    (= (- $k@37@01 (pTaken@40@01 r)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@37@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@30@01 r) (Set_in (inv@29@01 r) ys@21@01))
          $k@28@01
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@21@01))
      (<
        (ite
          (and
            (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
            (img@39@01 r)
            (= r (inv@38@01 r)))
          $k@37@01
          $Perm.No)
        $k@28@01)
      (<
        (ite
          (and
            (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
            (img@39@01 r)
            (= r (inv@38@01 r)))
          $k@37@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@30@01 r))
  :pattern ((Set_in (inv@29@01 r) ys@21@01))
  :pattern ((Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01)))
  :pattern ((img@39@01 r))
  :qid |qp.srp3|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@38@01 r) (Set_union xs@20@01 ys@21@01))
      (img@39@01 r)
      (= r (inv@38@01 r)))
    (= (- (- $k@37@01 (pTaken@40@01 r)) (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@20@01))
      (< $Perm.No $k@24@01)
      false)
    (=
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@22@01)) r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@22@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@21@01))
      (< $Perm.No $k@28@01)
      false)
    (=
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@22@01)) r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@22@01)) r))
  :qid |qp.fvfValDef5|)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@43@01 Set<$Ref>)
(declare-const y@44@01 $Ref)
(declare-const z@45@01 $Ref)
(declare-const xs@46@01 Set<$Ref>)
(declare-const y@47@01 $Ref)
(declare-const z@48@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 ($Snap.combine ($Snap.first $t@49@01) ($Snap.second $t@49@01))))
(declare-const x@50@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@50@01 xs@46@01))
(declare-const $k@51@01 $Perm)
(assert ($Perm.isReadVar $k@51@01))
(pop) ; 2
(declare-fun inv@52@01 ($Ref) $Ref)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@51@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@50@01 $Ref)) (!
  (=> (Set_in x@50@01 xs@46@01) (or (= $k@51@01 $Perm.No) (< $Perm.No $k@51@01)))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@50@01 $Ref) (x2@50@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@50@01 xs@46@01) (< $Perm.No $k@51@01))
      (and (Set_in x2@50@01 xs@46@01) (< $Perm.No $k@51@01))
      (= x1@50@01 x2@50@01))
    (= x1@50@01 x2@50@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@50@01 $Ref)) (!
  (=>
    (and (Set_in x@50@01 xs@46@01) (< $Perm.No $k@51@01))
    (and (= (inv@52@01 x@50@01) x@50@01) (img@53@01 x@50@01)))
  :pattern ((Set_in x@50@01 xs@46@01))
  :pattern ((inv@52@01 x@50@01))
  :pattern ((img@53@01 x@50@01))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (Set_in (inv@52@01 r) xs@46@01) (< $Perm.No $k@51@01)))
    (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@50@01 $Ref)) (!
  (<= $Perm.No $k@51@01)
  :pattern ((Set_in x@50@01 xs@46@01))
  :pattern ((inv@52@01 x@50@01))
  :pattern ((img@53@01 x@50@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@50@01 $Ref)) (!
  (<= $k@51@01 $Perm.Write)
  :pattern ((Set_in x@50@01 xs@46@01))
  :pattern ((inv@52@01 x@50@01))
  :pattern ((img@53@01 x@50@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@50@01 $Ref)) (!
  (=>
    (and (Set_in x@50@01 xs@46@01) (< $Perm.No $k@51@01))
    (not (= x@50@01 $Ref.null)))
  :pattern ((Set_in x@50@01 xs@46@01))
  :pattern ((inv@52@01 x@50@01))
  :pattern ((img@53@01 x@50@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@49@01) $Snap.unit))
; [eval] (z in xs)
(assert (Set_in z@48@01 xs@46@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var k0: Perm
(declare-const k0@54@01 $Perm)
; [eval] (y in xs)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (Set_in y@47@01 xs@46@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (Set_in y@47@01 xs@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | y@47@01 in xs@46@01 | live]
; [else-branch: 0 | !(y@47@01 in xs@46@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | y@47@01 in xs@46@01]
(assert (Set_in y@47@01 xs@46@01))
; [exec]
; exhale acc(y.f, wildcard)
(declare-const $k@55@01 $Perm)
(assert ($Perm.isReadVar $k@55@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (= r y@47@01)
    ($Perm.min
      (ite (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01)) $k@51@01 $Perm.No)
      $k@55@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@55@01
(assert (=>
  (not
    (=
      (ite
        (and (img@53@01 y@47@01) (Set_in (inv@52@01 y@47@01) xs@46@01))
        $k@51@01
        $Perm.No)
      $Perm.No))
  (ite
    (and (img@53@01 y@47@01) (Set_in (inv@52@01 y@47@01) xs@46@01))
    (< $k@55@01 $k@51@01)
    (< $k@55@01 $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@47@01) (= (- $k@55@01 (pTaken@56@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@57@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and (img@53@01 y@47@01) (Set_in (inv@52@01 y@47@01) xs@46@01))
    (< $Perm.No $k@51@01)
    false)
  (=
    ($FVF.lookup_f (as sm@57@01  $FVF<f>) y@47@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@49@01)) y@47@01))))
; [exec]
; exhale (forall x: Ref ::(x in (xs setminus Set(y))) ==> acc(x.f, wildcard))
(declare-const x@58@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in (xs setminus Set(y)))
; [eval] (xs setminus Set(y))
; [eval] Set(y)
(assert (Set_in x@58@01 (Set_difference xs@46@01 (Set_singleton y@47@01))))
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(pop) ; 4
(declare-fun inv@60@01 ($Ref) $Ref)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@59@01))
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@58@01 $Ref)) (!
  (=>
    (Set_in x@58@01 (Set_difference xs@46@01 (Set_singleton y@47@01)))
    (or (= $k@59@01 $Perm.No) (< $Perm.No $k@59@01)))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@58@01 $Ref) (x2@58@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@58@01 (Set_difference xs@46@01 (Set_singleton y@47@01)))
        (< $Perm.No $k@59@01))
      (and
        (Set_in x2@58@01 (Set_difference xs@46@01 (Set_singleton y@47@01)))
        (< $Perm.No $k@59@01))
      (= x1@58@01 x2@58@01))
    (= x1@58@01 x2@58@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@58@01 $Ref)) (!
  (=>
    (and
      (Set_in x@58@01 (Set_difference xs@46@01 (Set_singleton y@47@01)))
      (< $Perm.No $k@59@01))
    (and (= (inv@60@01 x@58@01) x@58@01) (img@61@01 x@58@01)))
  :pattern ((Set_in x@58@01 (Set_difference xs@46@01 (Set_singleton y@47@01))))
  :pattern ((inv@60@01 x@58@01))
  :pattern ((img@61@01 x@58@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@01 r)
      (and
        (Set_in (inv@60@01 r) (Set_difference xs@46@01 (Set_singleton y@47@01)))
        (< $Perm.No $k@59@01)))
    (= (inv@60@01 r) r))
  :pattern ((inv@60@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@60@01 r) (Set_difference xs@46@01 (Set_singleton y@47@01)))
      (img@61@01 r)
      (= r (inv@60@01 r)))
    ($Perm.min
      (ite
        (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
        (- $k@51@01 (pTaken@56@01 r))
        $Perm.No)
      $k@59@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@59@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
          (- $k@51@01 (pTaken@56@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
      (<
        (ite
          (and
            (Set_in (inv@60@01 r) (Set_difference xs@46@01 (Set_singleton y@47@01)))
            (img@61@01 r)
            (= r (inv@60@01 r)))
          $k@59@01
          $Perm.No)
        (- $k@51@01 (pTaken@56@01 r)))
      (<
        (ite
          (and
            (Set_in (inv@60@01 r) (Set_difference xs@46@01 (Set_singleton y@47@01)))
            (img@61@01 r)
            (= r (inv@60@01 r)))
          $k@59@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@53@01 r))
  :pattern ((Set_in (inv@52@01 r) xs@46@01))
  :pattern ((Set_in (inv@60@01 r) (Set_difference xs@46@01 (Set_singleton y@47@01))))
  :pattern ((img@61@01 r))
  :qid |qp.srp8|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@60@01 r) (Set_difference xs@46@01 (Set_singleton y@47@01)))
      (img@61@01 r)
      (= r (inv@60@01 r)))
    (= (- $k@59@01 (pTaken@62@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
      (< $Perm.No (- $k@51@01 (pTaken@56@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@49@01)) r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@49@01)) r))
  :qid |qp.fvfValDef9|)))
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(x.f, wildcard))
(declare-const x@64@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@64@01 xs@46@01))
(declare-const $k@65@01 $Perm)
(assert ($Perm.isReadVar $k@65@01))
(pop) ; 4
(declare-fun inv@66@01 ($Ref) $Ref)
(declare-fun img@67@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@65@01))
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@64@01 $Ref)) (!
  (=> (Set_in x@64@01 xs@46@01) (or (= $k@65@01 $Perm.No) (< $Perm.No $k@65@01)))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@64@01 $Ref) (x2@64@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@64@01 xs@46@01) (< $Perm.No $k@65@01))
      (and (Set_in x2@64@01 xs@46@01) (< $Perm.No $k@65@01))
      (= x1@64@01 x2@64@01))
    (= x1@64@01 x2@64@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@64@01 $Ref)) (!
  (=>
    (and (Set_in x@64@01 xs@46@01) (< $Perm.No $k@65@01))
    (and (= (inv@66@01 x@64@01) x@64@01) (img@67@01 x@64@01)))
  :pattern ((Set_in x@64@01 xs@46@01))
  :pattern ((inv@66@01 x@64@01))
  :pattern ((img@67@01 x@64@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@67@01 r)
      (and (Set_in (inv@66@01 r) xs@46@01) (< $Perm.No $k@65@01)))
    (= (inv@66@01 r) r))
  :pattern ((inv@66@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@66@01 r) xs@46@01) (img@67@01 r) (= r (inv@66@01 r)))
    ($Perm.min
      (ite
        (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
        (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r))
        $Perm.No)
      $k@65@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@65@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
          (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
      (<
        (ite
          (and (Set_in (inv@66@01 r) xs@46@01) (img@67@01 r) (= r (inv@66@01 r)))
          $k@65@01
          $Perm.No)
        (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r)))
      (<
        (ite
          (and (Set_in (inv@66@01 r) xs@46@01) (img@67@01 r) (= r (inv@66@01 r)))
          $k@65@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@53@01 r))
  :pattern ((Set_in (inv@52@01 r) xs@46@01))
  :pattern ((Set_in (inv@66@01 r) xs@46@01))
  :pattern ((img@67@01 r))
  :qid |qp.srp10|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@66@01 r) xs@46@01) (img@67@01 r) (= r (inv@66@01 r)))
    (= (- $k@65@01 (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@69@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
      (< $Perm.No (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@49@01)) r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@49@01)) r))
  :qid |qp.fvfValDef11|)))
; [exec]
; inhale k0 >= none
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 $Snap.unit))
; [eval] k0 >= none
(assert (>= k0@54@01 $Perm.No))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(x.f, k0))
(declare-const x@71@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@71@01 xs@46@01))
(pop) ; 4
(declare-fun inv@72@01 ($Ref) $Ref)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@71@01 $Ref)) (!
  (=> (Set_in x@71@01 xs@46@01) (or (= k0@54@01 $Perm.No) (< $Perm.No k0@54@01)))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@71@01 $Ref) (x2@71@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@71@01 xs@46@01) (< $Perm.No k0@54@01))
      (and (Set_in x2@71@01 xs@46@01) (< $Perm.No k0@54@01))
      (= x1@71@01 x2@71@01))
    (= x1@71@01 x2@71@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@71@01 $Ref)) (!
  (=>
    (and (Set_in x@71@01 xs@46@01) (< $Perm.No k0@54@01))
    (and (= (inv@72@01 x@71@01) x@71@01) (img@73@01 x@71@01)))
  :pattern ((Set_in x@71@01 xs@46@01))
  :pattern ((inv@72@01 x@71@01))
  :pattern ((img@73@01 x@71@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@01 r)
      (and (Set_in (inv@72@01 r) xs@46@01) (< $Perm.No k0@54@01)))
    (= (inv@72@01 r) r))
  :pattern ((inv@72@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@74@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@72@01 r) xs@46@01) (img@73@01 r) (= r (inv@72@01 r)))
    ($Perm.min
      (ite
        (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
        (- (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r)) (pTaken@68@01 r))
        $Perm.No)
      k0@54@01)
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
        (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
        (- (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r)) (pTaken@68@01 r))
        $Perm.No)
      (pTaken@74@01 r))
    $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@74@01 r) $Perm.No)
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@72@01 r) xs@46@01) (img@73@01 r) (= r (inv@72@01 r)))
    (= (- k0@54@01 (pTaken@74@01 r)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@72@01 r) xs@46@01) (img@73@01 r) (= r (inv@72@01 r)))
    (= (- k0@54@01 (pTaken@74@01 r)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@75@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
      (<
        $Perm.No
        (- (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r)) (pTaken@68@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@75@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@49@01)) r)))
  :pattern (($FVF.lookup_f (as sm@75@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@49@01)) r))
  :qid |qp.fvfValDef12|)))
(declare-const pm@76@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@76@01  $FPM) r)
    (ite
      (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
      (- (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r)) (pTaken@68@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@76@01  $FPM) r) $Perm.Write)
  :pattern ((inv@52@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const x@77@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@77@01 xs@46@01))
(pop) ; 4
(declare-fun inv@78@01 ($Ref) $Ref)
(declare-fun img@79@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@77@01 $Ref)) (!
  (=> (Set_in x@77@01 xs@46@01) (or (= k0@54@01 $Perm.No) (< $Perm.No k0@54@01)))
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@77@01 $Ref) (x2@77@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@77@01 xs@46@01) (< $Perm.No k0@54@01))
      (and (Set_in x2@77@01 xs@46@01) (< $Perm.No k0@54@01))
      (= x1@77@01 x2@77@01))
    (= x1@77@01 x2@77@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@77@01 $Ref)) (!
  (=>
    (and (Set_in x@77@01 xs@46@01) (< $Perm.No k0@54@01))
    (and (= (inv@78@01 x@77@01) x@77@01) (img@79@01 x@77@01)))
  :pattern ((Set_in x@77@01 xs@46@01))
  :pattern ((inv@78@01 x@77@01))
  :pattern ((img@79@01 x@77@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@79@01 r)
      (and (Set_in (inv@78@01 r) xs@46@01) (< $Perm.No k0@54@01)))
    (= (inv@78@01 r) r))
  :pattern ((inv@78@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@80@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@78@01 r) xs@46@01) (img@79@01 r) (= r (inv@78@01 r)))
    ($Perm.min
      (ite
        (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
        (- (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r)) (pTaken@68@01 r))
        $Perm.No)
      k0@54@01)
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
        (and (img@53@01 r) (Set_in (inv@52@01 r) xs@46@01))
        (- (- (- $k@51@01 (pTaken@56@01 r)) (pTaken@62@01 r)) (pTaken@68@01 r))
        $Perm.No)
      (pTaken@80@01 r))
    $Perm.No)
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@80@01 r) $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@78@01 r) xs@46@01) (img@79@01 r) (= r (inv@78@01 r)))
    (= (- k0@54@01 (pTaken@80@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@78@01 r) xs@46@01) (img@79@01 r) (= r (inv@78@01 r)))
    (= (- k0@54@01 (pTaken@80@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
