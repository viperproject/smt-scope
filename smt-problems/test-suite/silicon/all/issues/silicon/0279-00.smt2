(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:00
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0279.vpr
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
(declare-sort $FVF<car> 0)
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
(declare-fun $SortWrappers.$FVF<car>To$Snap ($FVF<car>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<car> ($Snap) $FVF<car>)
(assert (forall ((x $FVF<car>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<car>($SortWrappers.$FVF<car>To$Snap x)))
    :pattern (($SortWrappers.$FVF<car>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<car>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<car>To$Snap($SortWrappers.$SnapTo$FVF<car> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<car> x))
    :qid |$Snap.$FVF<car>To$SnapTo$FVF<car>|
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
; /field_value_functions_declarations.smt2 [car: Ref]
(declare-fun $FVF.domain_car ($FVF<car>) Set<$Ref>)
(declare-fun $FVF.lookup_car ($FVF<car> $Ref) $Ref)
(declare-fun $FVF.after_car ($FVF<car> $FVF<car>) Bool)
(declare-fun $FVF.loc_car ($Ref $Ref) Bool)
(declare-fun $FVF.perm_car ($FPM $Ref) $Perm)
(declare-const $fvfTOP_car $FVF<car>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun f ($Snap $Ref $Ref) Bool)
(declare-fun f%limited ($Snap $Ref $Ref) Bool)
(declare-fun f%stateless ($Ref $Ref) Bool)
(declare-fun f%precondition ($Snap $Ref $Ref) Bool)
(declare-fun $ ($Snap $Ref) Bool)
(declare-fun $%limited ($Snap $Ref) Bool)
(declare-fun $%stateless ($Ref) Bool)
(declare-fun $%precondition ($Snap $Ref) Bool)
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
; /field_value_functions_axioms.smt2 [car: Ref]
(assert (forall ((vs $FVF<car>) (ws $FVF<car>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_car vs) ($FVF.domain_car ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_car vs))
            (= ($FVF.lookup_car vs x) ($FVF.lookup_car ws x)))
          :pattern (($FVF.lookup_car vs x) ($FVF.lookup_car ws x))
          :qid |qp.$FVF<car>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<car>To$Snap vs)
              ($SortWrappers.$FVF<car>To$Snap ws)
              )
    :qid |qp.$FVF<car>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_car pm r))
    :pattern (($FVF.perm_car pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_car f r) true)
    :pattern (($FVF.loc_car f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (uref@0@00 $Ref) (vref@1@00 $Ref)) (!
  (= (f%limited s@$ uref@0@00 vref@1@00) (f s@$ uref@0@00 vref@1@00))
  :pattern ((f s@$ uref@0@00 vref@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (uref@0@00 $Ref) (vref@1@00 $Ref)) (!
  (f%stateless uref@0@00 vref@1@00)
  :pattern ((f%limited s@$ uref@0@00 vref@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (uref@0@00 $Ref) (vref@1@00 $Ref)) (!
  (let ((result@2@00 (f%limited s@$ uref@0@00 vref@1@00))) (=>
    (f%precondition s@$ uref@0@00 vref@1@00)
    (= result@2@00 true)))
  :pattern ((f%limited s@$ uref@0@00 vref@1@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (uref@0@00 $Ref) (vref@1@00 $Ref)) (!
  (let ((result@2@00 (f%limited s@$ uref@0@00 vref@1@00))) true)
  :pattern ((f%limited s@$ uref@0@00 vref@1@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (ref@3@00 $Ref)) (!
  (= ($%limited s@$ ref@3@00) ($ s@$ ref@3@00))
  :pattern (($ s@$ ref@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (ref@3@00 $Ref)) (!
  ($%stateless ref@3@00)
  :pattern (($%limited s@$ ref@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (ref@3@00 $Ref)) (!
  (let ((result@4@00 ($%limited s@$ ref@3@00))) (=>
    ($%precondition s@$ ref@3@00)
    (= result@4@00 true)))
  :pattern (($%limited s@$ ref@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (ref@3@00 $Ref)) (!
  (let ((result@4@00 ($%limited s@$ ref@3@00))) true)
  :pattern (($%limited s@$ ref@3@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- mark ----------
(declare-const g@0@01 Set<$Ref>)
(declare-const g@1@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const n@2@01 $Ref)
(push) ; 2
; [eval] (n in g)
(assert (Set_in n@2@01 g@1@01))
(pop) ; 2
(declare-const $t@3@01 $FVF<car>)
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@2@01 $Ref) (n2@2@01 $Ref)) (!
  (=>
    (and (Set_in n1@2@01 g@1@01) (Set_in n2@2@01 g@1@01) (= n1@2@01 n2@2@01))
    (= n1@2@01 n2@2@01))
  
  :qid |car-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@2@01 $Ref)) (!
  (=>
    (Set_in n@2@01 g@1@01)
    (and (= (inv@4@01 n@2@01) n@2@01) (img@5@01 n@2@01)))
  :pattern ((Set_in n@2@01 g@1@01))
  :pattern ((inv@4@01 n@2@01))
  :pattern ((img@5@01 n@2@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@5@01 r) (Set_in (inv@4@01 r) g@1@01)) (= (inv@4@01 r) r))
  :pattern ((inv@4@01 r))
  :qid |car-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@2@01 $Ref)) (!
  (=> (Set_in n@2@01 g@1@01) (not (= n@2@01 $Ref.null)))
  :pattern ((Set_in n@2@01 g@1@01))
  :pattern ((inv@4@01 n@2@01))
  :pattern ((img@5@01 n@2@01))
  :qid |car-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall n1: Ref, n2: Ref ::
;     { f(n1, n2) }
;     (n1 in g) && (n2 in g) ==> f(n1, n2))
; [eval] (forall n1: Ref, n2: Ref :: { f(n1, n2) } (n1 in g) && (n2 in g) ==> f(n1, n2))
(declare-const n1@6@01 $Ref)
(declare-const n2@7@01 $Ref)
(push) ; 3
; [eval] (n1 in g) && (n2 in g) ==> f(n1, n2)
; [eval] (n1 in g) && (n2 in g)
; [eval] (n1 in g)
(push) ; 4
; [then-branch: 0 | !(n1@6@01 in g@1@01) | live]
; [else-branch: 0 | n1@6@01 in g@1@01 | live]
(push) ; 5
; [then-branch: 0 | !(n1@6@01 in g@1@01)]
(assert (not (Set_in n1@6@01 g@1@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | n1@6@01 in g@1@01]
(assert (Set_in n1@6@01 g@1@01))
; [eval] (n2 in g)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in n1@6@01 g@1@01) (not (Set_in n1@6@01 g@1@01))))
(push) ; 4
; [then-branch: 1 | n1@6@01 in g@1@01 && n2@7@01 in g@1@01 | live]
; [else-branch: 1 | !(n1@6@01 in g@1@01 && n2@7@01 in g@1@01) | live]
(push) ; 5
; [then-branch: 1 | n1@6@01 in g@1@01 && n2@7@01 in g@1@01]
(assert (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01)))
; [eval] f(n1, n2)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@8@01 ((r $Ref) (n1@6@01 $Ref) (n2@7@01 $Ref)) $Perm
  (ite
    (= r n1@6@01)
    ($Perm.min
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) g@1@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) g@1@01)) $Perm.Write $Perm.No)
      (pTaken@8@01 r n1@6@01 n2@7@01))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@8@01 r n1@6@01 n2@7@01) $Perm.No)
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r n1@6@01) (= (- $Perm.Write (pTaken@8@01 r n1@6@01 n2@7@01)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@9@01 $FVF<car>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@5@01 n1@6@01) (Set_in (inv@4@01 n1@6@01) g@1@01))
  (=
    ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01)
    ($FVF.lookup_car $t@3@01 n1@6@01))))
; [eval] uref != vref
; [then-branch: 2 | n1@6@01 != n2@7@01 | live]
; [else-branch: 2 | n1@6@01 == n2@7@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 2 | n1@6@01 != n2@7@01]
(assert (not (= n1@6@01 n2@7@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@10@01 ((r $Ref) (n1@6@01 $Ref) (n2@7@01 $Ref)) $Perm
  (ite
    (= r n2@7@01)
    ($Perm.min
      (ite
        (and (img@5@01 r) (Set_in (inv@4@01 r) g@1@01))
        (- $Perm.Write (pTaken@8@01 r n1@6@01 n2@7@01))
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
        (and (img@5@01 r) (Set_in (inv@4@01 r) g@1@01))
        (- $Perm.Write (pTaken@8@01 r n1@6@01 n2@7@01))
        $Perm.No)
      (pTaken@10@01 r n1@6@01 n2@7@01))
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
  (= (pTaken@10@01 r n1@6@01 n2@7@01) $Perm.No)
  
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
    (= r n2@7@01)
    (= (- $Perm.Write (pTaken@10@01 r n1@6@01 n2@7@01)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@11@01 $FVF<car>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and (img@5@01 n2@7@01) (Set_in (inv@4@01 n2@7@01) g@1@01))
    (< $Perm.No (- $Perm.Write (pTaken@8@01 n2@7@01 n1@6@01 n2@7@01)))
    false)
  (=
    ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01)
    ($FVF.lookup_car $t@3@01 n2@7@01))))
(assert (f%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01))) n1@6@01 n2@7@01))
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 2 | n1@6@01 == n2@7@01]
(assert (= n1@6@01 n2@7@01))
(assert (f%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
  $Snap.unit) n1@6@01 n2@7@01))
(pop) ; 7
(pop) ; 6
(declare-fun joined_f@12@01 ($Ref $Ref) Bool)
(assert (=>
  (not (= n1@6@01 n2@7@01))
  (=
    (joined_f@12@01 n1@6@01 n2@7@01)
    (f ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01))) n1@6@01 n2@7@01))))
(assert (=>
  (= n1@6@01 n2@7@01)
  (=
    (joined_f@12@01 n1@6@01 n2@7@01)
    (f ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
      $Snap.unit) n1@6@01 n2@7@01))))
; Joined path conditions
(assert (=>
  (and (img@5@01 n1@6@01) (Set_in (inv@4@01 n1@6@01) g@1@01))
  (=
    ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01)
    ($FVF.lookup_car $t@3@01 n1@6@01))))
(assert (=>
  (not (= n1@6@01 n2@7@01))
  (and
    (not (= n1@6@01 n2@7@01))
    (=>
      (ite
        (and (img@5@01 n2@7@01) (Set_in (inv@4@01 n2@7@01) g@1@01))
        (< $Perm.No (- $Perm.Write (pTaken@8@01 n2@7@01 n1@6@01 n2@7@01)))
        false)
      (=
        ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01)
        ($FVF.lookup_car $t@3@01 n2@7@01)))
    (f%precondition ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01))) n1@6@01 n2@7@01))))
; Joined path conditions
(assert (=>
  (= n1@6@01 n2@7@01)
  (and
    (= n1@6@01 n2@7@01)
    (f%precondition ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
      $Snap.unit) n1@6@01 n2@7@01))))
(assert (or (= n1@6@01 n2@7@01) (not (= n1@6@01 n2@7@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(n1@6@01 in g@1@01 && n2@7@01 in g@1@01)]
(assert (not (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01))
  (and
    (Set_in n1@6@01 g@1@01)
    (Set_in n2@7@01 g@1@01)
    (=>
      (not (= n1@6@01 n2@7@01))
      (=
        (joined_f@12@01 n1@6@01 n2@7@01)
        (f ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01))) n1@6@01 n2@7@01)))
    (=>
      (= n1@6@01 n2@7@01)
      (=
        (joined_f@12@01 n1@6@01 n2@7@01)
        (f ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
          $Snap.unit) n1@6@01 n2@7@01)))
    (=>
      (and (img@5@01 n1@6@01) (Set_in (inv@4@01 n1@6@01) g@1@01))
      (=
        ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01)
        ($FVF.lookup_car $t@3@01 n1@6@01)))
    (=>
      (not (= n1@6@01 n2@7@01))
      (and
        (not (= n1@6@01 n2@7@01))
        (=>
          (ite
            (and (img@5@01 n2@7@01) (Set_in (inv@4@01 n2@7@01) g@1@01))
            (< $Perm.No (- $Perm.Write (pTaken@8@01 n2@7@01 n1@6@01 n2@7@01)))
            false)
          (=
            ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01)
            ($FVF.lookup_car $t@3@01 n2@7@01)))
        (f%precondition ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01))) n1@6@01 n2@7@01)))
    (=>
      (= n1@6@01 n2@7@01)
      (and
        (= n1@6@01 n2@7@01)
        (f%precondition ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
          $Snap.unit) n1@6@01 n2@7@01)))
    (or (= n1@6@01 n2@7@01) (not (= n1@6@01 n2@7@01))))))
; Joined path conditions
(assert (or
  (not (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01)))
  (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n1@6@01 $Ref) (n2@7@01 $Ref)) (!
  (and
    (or (Set_in n1@6@01 g@1@01) (not (Set_in n1@6@01 g@1@01)))
    (=>
      (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01))
      (and
        (Set_in n1@6@01 g@1@01)
        (Set_in n2@7@01 g@1@01)
        (=>
          (not (= n1@6@01 n2@7@01))
          (=
            (joined_f@12@01 n1@6@01 n2@7@01)
            (f ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01))) n1@6@01 n2@7@01)))
        (=>
          (= n1@6@01 n2@7@01)
          (=
            (joined_f@12@01 n1@6@01 n2@7@01)
            (f ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
              $Snap.unit) n1@6@01 n2@7@01)))
        (=>
          (and (img@5@01 n1@6@01) (Set_in (inv@4@01 n1@6@01) g@1@01))
          (=
            ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01)
            ($FVF.lookup_car $t@3@01 n1@6@01)))
        (=>
          (not (= n1@6@01 n2@7@01))
          (and
            (not (= n1@6@01 n2@7@01))
            (=>
              (ite
                (and (img@5@01 n2@7@01) (Set_in (inv@4@01 n2@7@01) g@1@01))
                (<
                  $Perm.No
                  (- $Perm.Write (pTaken@8@01 n2@7@01 n1@6@01 n2@7@01)))
                false)
              (=
                ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01)
                ($FVF.lookup_car $t@3@01 n2@7@01)))
            (f%precondition ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@11@01  $FVF<car>) n2@7@01))) n1@6@01 n2@7@01)))
        (=>
          (= n1@6@01 n2@7@01)
          (and
            (= n1@6@01 n2@7@01)
            (f%precondition ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@9@01  $FVF<car>) n1@6@01))
              $Snap.unit) n1@6@01 n2@7@01)))
        (or (= n1@6@01 n2@7@01) (not (= n1@6@01 n2@7@01)))))
    (or
      (not (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01)))
      (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01))))
  :pattern ((joined_f@12@01 n1@6@01 n2@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@14@10@14@79-aux|)))
(push) ; 3
(assert (not (forall ((n1@6@01 $Ref) (n2@7@01 $Ref)) (!
  (=>
    (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01))
    (joined_f@12@01 n1@6@01 n2@7@01))
  :pattern ((joined_f@12@01 n1@6@01 n2@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@14@10@14@79|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n1@6@01 $Ref) (n2@7@01 $Ref)) (!
  (=>
    (and (Set_in n1@6@01 g@1@01) (Set_in n2@7@01 g@1@01))
    (joined_f@12@01 n1@6@01 n2@7@01))
  :pattern ((joined_f@12@01 n1@6@01 n2@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@14@10@14@79|)))
(pop) ; 2
(pop) ; 1
; ---------- mark2 ----------
(declare-const g@13@01 Set<$Ref>)
(declare-const g@14@01 Set<$Ref>)
(push) ; 1
(declare-const n@15@01 $Ref)
(push) ; 2
; [eval] (n in g)
(assert (Set_in n@15@01 g@14@01))
(pop) ; 2
(declare-const $t@16@01 $FVF<car>)
(declare-fun inv@17@01 ($Ref) $Ref)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@15@01 $Ref) (n2@15@01 $Ref)) (!
  (=>
    (and
      (Set_in n1@15@01 g@14@01)
      (Set_in n2@15@01 g@14@01)
      (= n1@15@01 n2@15@01))
    (= n1@15@01 n2@15@01))
  
  :qid |car-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@15@01 $Ref)) (!
  (=>
    (Set_in n@15@01 g@14@01)
    (and (= (inv@17@01 n@15@01) n@15@01) (img@18@01 n@15@01)))
  :pattern ((Set_in n@15@01 g@14@01))
  :pattern ((inv@17@01 n@15@01))
  :pattern ((img@18@01 n@15@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@18@01 r) (Set_in (inv@17@01 r) g@14@01)) (= (inv@17@01 r) r))
  :pattern ((inv@17@01 r))
  :qid |car-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@15@01 $Ref)) (!
  (=> (Set_in n@15@01 g@14@01) (not (= n@15@01 $Ref.null)))
  :pattern ((Set_in n@15@01 g@14@01))
  :pattern ((inv@17@01 n@15@01))
  :pattern ((img@18@01 n@15@01))
  :qid |car-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall n1: Ref, n2: Ref ::
;     { (n1 in g), (n2 in g) }
;     { (n1 in g), $(n2) }
;     { (n2 in g), $(n1) }
;     { $(n1), $(n2) }
;     (n1 in g) && (n2 in g) ==> $(n1) && $(n2))
; [eval] (forall n1: Ref, n2: Ref :: { (n1 in g), (n2 in g) } { (n1 in g), $(n2) } { (n2 in g), $(n1) } { $(n1), $(n2) } (n1 in g) && (n2 in g) ==> $(n1) && $(n2))
(declare-const n1@19@01 $Ref)
(declare-const n2@20@01 $Ref)
(push) ; 3
; [eval] (n1 in g) && (n2 in g) ==> $(n1) && $(n2)
; [eval] (n1 in g) && (n2 in g)
; [eval] (n1 in g)
(push) ; 4
; [then-branch: 3 | !(n1@19@01 in g@14@01) | live]
; [else-branch: 3 | n1@19@01 in g@14@01 | live]
(push) ; 5
; [then-branch: 3 | !(n1@19@01 in g@14@01)]
(assert (not (Set_in n1@19@01 g@14@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | n1@19@01 in g@14@01]
(assert (Set_in n1@19@01 g@14@01))
; [eval] (n2 in g)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in n1@19@01 g@14@01) (not (Set_in n1@19@01 g@14@01))))
(push) ; 4
; [then-branch: 4 | n1@19@01 in g@14@01 && n2@20@01 in g@14@01 | live]
; [else-branch: 4 | !(n1@19@01 in g@14@01 && n2@20@01 in g@14@01) | live]
(push) ; 5
; [then-branch: 4 | n1@19@01 in g@14@01 && n2@20@01 in g@14@01]
(assert (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01)))
; [eval] $(n1) && $(n2)
; [eval] $(n1)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref) (n1@19@01 $Ref) (n2@20@01 $Ref)) $Perm
  (ite
    (= r n1@19@01)
    ($Perm.min
      (ite
        (and (img@18@01 r) (Set_in (inv@17@01 r) g@14@01))
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
        (and (img@18@01 r) (Set_in (inv@17@01 r) g@14@01))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 r n1@19@01 n2@20@01))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@21@01 r n1@19@01 n2@20@01) $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r n1@19@01)
    (= (- $Perm.Write (pTaken@21@01 r n1@19@01 n2@20@01)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $FVF<car>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@18@01 n1@19@01) (Set_in (inv@17@01 n1@19@01) g@14@01))
  (=
    ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)
    ($FVF.lookup_car $t@16@01 n1@19@01))))
(assert ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and (img@18@01 n1@19@01) (Set_in (inv@17@01 n1@19@01) g@14@01))
    (=
      ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)
      ($FVF.lookup_car $t@16@01 n1@19@01)))
  ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 5 | !($(Lookup(car, sm@22@01, n1@19@01), n1@19@01)) | live]
; [else-branch: 5 | $(Lookup(car, sm@22@01, n1@19@01), n1@19@01) | live]
(push) ; 7
; [then-branch: 5 | !($(Lookup(car, sm@22@01, n1@19@01), n1@19@01))]
(assert (not
  ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | $(Lookup(car, sm@22@01, n1@19@01), n1@19@01)]
(assert ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01))
; [eval] $(n2)
(push) ; 8
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((r $Ref) (n1@19@01 $Ref) (n2@20@01 $Ref)) $Perm
  (ite
    (= r n2@20@01)
    ($Perm.min
      (ite
        (and (img@18@01 r) (Set_in (inv@17@01 r) g@14@01))
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
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@18@01 r) (Set_in (inv@17@01 r) g@14@01))
        $Perm.Write
        $Perm.No)
      (pTaken@23@01 r n1@19@01 n2@20@01))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@23@01 r n1@19@01 n2@20@01) $Perm.No)
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r n2@20@01)
    (= (- $Perm.Write (pTaken@23@01 r n1@19@01 n2@20@01)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@18@01 n2@20@01) (Set_in (inv@17@01 n2@20@01) g@14@01))
  (=
    ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)
    ($FVF.lookup_car $t@16@01 n2@20@01))))
(assert ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
(pop) ; 8
; Joined path conditions
(assert (and
  (=>
    (and (img@18@01 n2@20@01) (Set_in (inv@17@01 n2@20@01) g@14@01))
    (=
      ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)
      ($FVF.lookup_car $t@16@01 n2@20@01)))
  ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
  (and
    ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
    (=>
      (and (img@18@01 n2@20@01) (Set_in (inv@17@01 n2@20@01) g@14@01))
      (=
        ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)
        ($FVF.lookup_car $t@16@01 n2@20@01)))
    ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))))
(assert (or
  ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
  (not
    ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | !(n1@19@01 in g@14@01 && n2@20@01 in g@14@01)]
(assert (not (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
  (and
    (Set_in n1@19@01 g@14@01)
    (Set_in n2@20@01 g@14@01)
    (=>
      (and (img@18@01 n1@19@01) (Set_in (inv@17@01 n1@19@01) g@14@01))
      (=
        ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)
        ($FVF.lookup_car $t@16@01 n1@19@01)))
    ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
    (=>
      ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
      (and
        ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
        (=>
          (and (img@18@01 n2@20@01) (Set_in (inv@17@01 n2@20@01) g@14@01))
          (=
            ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)
            ($FVF.lookup_car $t@16@01 n2@20@01)))
        ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01)))
    (or
      ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
      (not
        ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01))))))
; Joined path conditions
(assert (or
  (not (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01)))
  (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n1@19@01 $Ref) (n2@20@01 $Ref)) (!
  (and
    (or (Set_in n1@19@01 g@14@01) (not (Set_in n1@19@01 g@14@01)))
    (=>
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
      (and
        (Set_in n1@19@01 g@14@01)
        (Set_in n2@20@01 g@14@01)
        (=>
          (and (img@18@01 n1@19@01) (Set_in (inv@17@01 n1@19@01) g@14@01))
          (=
            ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)
            ($FVF.lookup_car $t@16@01 n1@19@01)))
        ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
        (=>
          ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (and
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
            (=>
              (and (img@18@01 n2@20@01) (Set_in (inv@17@01 n2@20@01) g@14@01))
              (=
                ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)
                ($FVF.lookup_car $t@16@01 n2@20@01)))
            ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01)))
        (or
          ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (not
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)))))
    (or
      (not (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01)))
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))))
  :pattern ((Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@26@10@26@72-aux|)))
(assert (forall ((n1@19@01 $Ref) (n2@20@01 $Ref)) (!
  (and
    (or (Set_in n1@19@01 g@14@01) (not (Set_in n1@19@01 g@14@01)))
    (=>
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
      (and
        (Set_in n1@19@01 g@14@01)
        (Set_in n2@20@01 g@14@01)
        (=>
          (and (img@18@01 n1@19@01) (Set_in (inv@17@01 n1@19@01) g@14@01))
          (=
            ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)
            ($FVF.lookup_car $t@16@01 n1@19@01)))
        ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
        (=>
          ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (and
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
            (=>
              (and (img@18@01 n2@20@01) (Set_in (inv@17@01 n2@20@01) g@14@01))
              (=
                ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)
                ($FVF.lookup_car $t@16@01 n2@20@01)))
            ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01)))
        (or
          ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (not
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)))))
    (or
      (not (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01)))
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))))
  :pattern ((Set_in n1@19@01 g@14@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@26@10@26@72-aux|)))
(assert (forall ((n1@19@01 $Ref) (n2@20@01 $Ref)) (!
  (and
    (or (Set_in n1@19@01 g@14@01) (not (Set_in n1@19@01 g@14@01)))
    (=>
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
      (and
        (Set_in n1@19@01 g@14@01)
        (Set_in n2@20@01 g@14@01)
        (=>
          (and (img@18@01 n1@19@01) (Set_in (inv@17@01 n1@19@01) g@14@01))
          (=
            ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)
            ($FVF.lookup_car $t@16@01 n1@19@01)))
        ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
        (=>
          ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (and
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
            (=>
              (and (img@18@01 n2@20@01) (Set_in (inv@17@01 n2@20@01) g@14@01))
              (=
                ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)
                ($FVF.lookup_car $t@16@01 n2@20@01)))
            ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01)))
        (or
          ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (not
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)))))
    (or
      (not (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01)))
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))))
  :pattern ((Set_in n2@20@01 g@14@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@26@10@26@72-aux|)))
(assert (forall ((n1@19@01 $Ref) (n2@20@01 $Ref)) (!
  (and
    (or (Set_in n1@19@01 g@14@01) (not (Set_in n1@19@01 g@14@01)))
    (=>
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
      (and
        (Set_in n1@19@01 g@14@01)
        (Set_in n2@20@01 g@14@01)
        (=>
          (and (img@18@01 n1@19@01) (Set_in (inv@17@01 n1@19@01) g@14@01))
          (=
            ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)
            ($FVF.lookup_car $t@16@01 n1@19@01)))
        ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
        (=>
          ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (and
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
            (=>
              (and (img@18@01 n2@20@01) (Set_in (inv@17@01 n2@20@01) g@14@01))
              (=
                ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)
                ($FVF.lookup_car $t@16@01 n2@20@01)))
            ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01)))
        (or
          ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (not
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)))))
    (or
      (not (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01)))
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))))
  :pattern (($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@26@10@26@72-aux|)))
(assert (forall ((n1@19@01 $Ref) (n2@20@01 $Ref)) (!
  (=>
    (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
    (and
      ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
      (=>
        ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
        ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))))
  :pattern ((Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
  :pattern ((Set_in n1@19@01 g@14@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
  :pattern ((Set_in n2@20@01 g@14@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01))
  :pattern (($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@26@10@26@72_precondition|)))
(push) ; 3
(assert (not (forall ((n1@19@01 $Ref) (n2@20@01 $Ref)) (!
  (=>
    (and
      (=>
        (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
        (and
          ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
          (=>
            ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
            ($%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))))
      (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01)))
    (and
      ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
      ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01)))
  :pattern ((Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
  :pattern ((Set_in n1@19@01 g@14@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
  :pattern ((Set_in n2@20@01 g@14@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01))
  :pattern (($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@26@10@26@72|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n1@19@01 $Ref) (n2@20@01 $Ref)) (!
  (=>
    (and (Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
    (and
      ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01)
      ($ ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01)))
  :pattern ((Set_in n1@19@01 g@14@01) (Set_in n2@20@01 g@14@01))
  :pattern ((Set_in n1@19@01 g@14@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
  :pattern ((Set_in n2@20@01 g@14@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01))
  :pattern (($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n1@19@01)) n1@19@01) ($%limited ($SortWrappers.$RefTo$Snap ($FVF.lookup_car (as sm@22@01  $FVF<car>) n2@20@01)) n2@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0279.vpr@26@10@26@72|)))
(pop) ; 2
(pop) ; 1
