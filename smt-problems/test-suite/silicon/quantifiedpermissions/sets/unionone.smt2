(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/unionone.vpr
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
(declare-sort $FVF<left> 0)
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
(declare-fun $SortWrappers.$FVF<left>To$Snap ($FVF<left>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<left> ($Snap) $FVF<left>)
(assert (forall ((x $FVF<left>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<left>($SortWrappers.$FVF<left>To$Snap x)))
    :pattern (($SortWrappers.$FVF<left>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<left>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<left>To$Snap($SortWrappers.$SnapTo$FVF<left> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<left> x))
    :qid |$Snap.$FVF<left>To$SnapTo$FVF<left>|
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
; /field_value_functions_declarations.smt2 [left: Ref]
(declare-fun $FVF.domain_left ($FVF<left>) Set<$Ref>)
(declare-fun $FVF.lookup_left ($FVF<left> $Ref) $Ref)
(declare-fun $FVF.after_left ($FVF<left> $FVF<left>) Bool)
(declare-fun $FVF.loc_left ($Ref $Ref) Bool)
(declare-fun $FVF.perm_left ($FPM $Ref) $Perm)
(declare-const $fvfTOP_left $FVF<left>)
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
; /field_value_functions_axioms.smt2 [left: Ref]
(assert (forall ((vs $FVF<left>) (ws $FVF<left>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_left vs) ($FVF.domain_left ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_left vs))
            (= ($FVF.lookup_left vs x) ($FVF.lookup_left ws x)))
          :pattern (($FVF.lookup_left vs x) ($FVF.lookup_left ws x))
          :qid |qp.$FVF<left>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<left>To$Snap vs)
              ($SortWrappers.$FVF<left>To$Snap ws)
              )
    :qid |qp.$FVF<left>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_left pm r))
    :pattern (($FVF.perm_left pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_left f r) true)
    :pattern (($FVF.loc_left f r)))))
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
; ---------- test ----------
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
; var a: Ref
(declare-const a@0@01 $Ref)
; [exec]
; var b: Ref
(declare-const b@1@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@2@01 Set<$Ref>)
; [exec]
; inhale xs == Set(a, b)
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] xs == Set(a, b)
; [eval] Set(a, b)
(assert (Set_equal xs@2@01 (Set_unionone (Set_singleton a@0@01) b@1@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall n: Ref ::(n in xs) ==> acc(n.left, write))
(declare-const n@4@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n in xs)
(assert (Set_in n@4@01 xs@2@01))
(pop) ; 3
(declare-const $t@5@01 $FVF<left>)
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@4@01 $Ref) (n2@4@01 $Ref)) (!
  (=>
    (and (Set_in n1@4@01 xs@2@01) (Set_in n2@4@01 xs@2@01) (= n1@4@01 n2@4@01))
    (= n1@4@01 n2@4@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@4@01 $Ref)) (!
  (=>
    (Set_in n@4@01 xs@2@01)
    (and (= (inv@6@01 n@4@01) n@4@01) (img@7@01 n@4@01)))
  :pattern ((Set_in n@4@01 xs@2@01))
  :pattern ((inv@6@01 n@4@01))
  :pattern ((img@7@01 n@4@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |left-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@4@01 $Ref)) (!
  (=> (Set_in n@4@01 xs@2@01) (not (= n@4@01 $Ref.null)))
  :pattern ((Set_in n@4@01 xs@2@01))
  :pattern ((inv@6@01 n@4@01))
  :pattern ((img@7@01 n@4@01))
  :qid |left-permImpliesNonNull|)))
(declare-const sm@8@01 $FVF<left>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
    (=
      ($FVF.lookup_left (as sm@8@01  $FVF<left>) r)
      ($FVF.lookup_left $t@5@01 r)))
  :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left $t@5@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@5@01 r) r)
  :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@6@01 r) xs@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@8@01  $FVF<left>) r) r))
  :pattern ((inv@6@01 r))
  :qid |quant-u-2|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale a.left == b
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] a.left == b
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
      (=
        ($FVF.lookup_left (as sm@8@01  $FVF<left>) r)
        ($FVF.lookup_left $t@5@01 r)))
    :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
    :pattern (($FVF.lookup_left $t@5@01 r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_left ($FVF.lookup_left $t@5@01 r) r)
    :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_left ($FVF.lookup_left (as sm@8@01  $FVF<left>) a@0@01) a@0@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@7@01 a@0@01) (Set_in (inv@6@01 a@0@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_left (as sm@8@01  $FVF<left>) a@0@01) b@1@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; exhale (forall n: Ref ::(n in xs) ==> acc(n.left, write))
(declare-const n@10@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n in xs)
(assert (Set_in n@10@01 xs@2@01))
(pop) ; 3
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@10@01 $Ref) (n2@10@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@10@01 xs@2@01)
        ($FVF.loc_left ($FVF.lookup_left (as sm@8@01  $FVF<left>) n1@10@01) n1@10@01))
      (and
        (Set_in n2@10@01 xs@2@01)
        ($FVF.loc_left ($FVF.lookup_left (as sm@8@01  $FVF<left>) n2@10@01) n2@10@01))
      (= n1@10@01 n2@10@01))
    (= n1@10@01 n2@10@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@10@01 $Ref)) (!
  (=>
    (Set_in n@10@01 xs@2@01)
    (and (= (inv@11@01 n@10@01) n@10@01) (img@12@01 n@10@01)))
  :pattern ((Set_in n@10@01 xs@2@01))
  :pattern ((inv@11@01 n@10@01))
  :pattern ((img@12@01 n@10@01))
  :qid |left-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@12@01 r) (Set_in (inv@11@01 r) xs@2@01)) (= (inv@11@01 r) r))
  :pattern ((inv@11@01 r))
  :qid |left-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@11@01 r) xs@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@8@01  $FVF<left>) r) r))
  :pattern ((inv@11@01 r))
  :qid |quant-u-4|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r) (= r (inv@11@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@13@01 r))
    $Perm.No)
  
  :qid |quant-u-6|))))
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
    (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r) (= r (inv@11@01 r)))
    (= (- $Perm.Write (pTaken@13@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; inhale (forall n: Ref ::(n in xs) ==> acc(n.left, write))
(declare-const n@14@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n in xs)
(assert (Set_in n@14@01 xs@2@01))
(pop) ; 3
(declare-const $t@15@01 $FVF<left>)
(declare-fun inv@16@01 ($Ref) $Ref)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@14@01 $Ref) (n2@14@01 $Ref)) (!
  (=>
    (and
      (Set_in n1@14@01 xs@2@01)
      (Set_in n2@14@01 xs@2@01)
      (= n1@14@01 n2@14@01))
    (= n1@14@01 n2@14@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@14@01 $Ref)) (!
  (=>
    (Set_in n@14@01 xs@2@01)
    (and (= (inv@16@01 n@14@01) n@14@01) (img@17@01 n@14@01)))
  :pattern ((Set_in n@14@01 xs@2@01))
  :pattern ((inv@16@01 n@14@01))
  :pattern ((img@17@01 n@14@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@17@01 r) (Set_in (inv@16@01 r) xs@2@01)) (= (inv@16@01 r) r))
  :pattern ((inv@16@01 r))
  :qid |left-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@14@01 $Ref)) (!
  (=> (Set_in n@14@01 xs@2@01) (not (= n@14@01 $Ref.null)))
  :pattern ((Set_in n@14@01 xs@2@01))
  :pattern ((inv@16@01 n@14@01))
  :pattern ((img@17@01 n@14@01))
  :qid |left-permImpliesNonNull|)))
(declare-const sm@18@01 $FVF<left>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Set_in (inv@16@01 r) xs@2@01))
    (=
      ($FVF.lookup_left (as sm@18@01  $FVF<left>) r)
      ($FVF.lookup_left $t@15@01 r)))
  :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left $t@15@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@15@01 r) r)
  :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@16@01 r) xs@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@18@01  $FVF<left>) r) r))
  :pattern ((inv@16@01 r))
  :qid |quant-u-10|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall n: Ref ::
;     { (n in xs), n.left }
;     (n in xs) ==> n.left == old[pre](n.left))
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] (forall n: Ref :: { (n in xs), n.left } (n in xs) ==> n.left == old[pre](n.left))
(declare-const n@20@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n in xs) ==> n.left == old[pre](n.left)
; [eval] (n in xs)
(push) ; 4
; [then-branch: 0 | n@20@01 in xs@2@01 | live]
; [else-branch: 0 | !(n@20@01 in xs@2@01) | live]
(push) ; 5
; [then-branch: 0 | n@20@01 in xs@2@01]
(assert (Set_in n@20@01 xs@2@01))
; [eval] n.left == old[pre](n.left)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@17@01 r) (Set_in (inv@16@01 r) xs@2@01))
      (=
        ($FVF.lookup_left (as sm@18@01  $FVF<left>) r)
        ($FVF.lookup_left $t@15@01 r)))
    :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
    :pattern (($FVF.lookup_left $t@15@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_left ($FVF.lookup_left $t@15@01 r) r)
    :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_left ($FVF.lookup_left (as sm@18@01  $FVF<left>) n@20@01) n@20@01))
(push) ; 6
(assert (not (and (img@17@01 n@20@01) (Set_in (inv@16@01 n@20@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old[pre](n.left)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
      (=
        ($FVF.lookup_left (as sm@8@01  $FVF<left>) r)
        ($FVF.lookup_left $t@5@01 r)))
    :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
    :pattern (($FVF.lookup_left $t@5@01 r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_left ($FVF.lookup_left $t@5@01 r) r)
    :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_left ($FVF.lookup_left (as sm@8@01  $FVF<left>) n@20@01) n@20@01))
(push) ; 6
(assert (not (and (img@7@01 n@20@01) (Set_in (inv@6@01 n@20@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(n@20@01 in xs@2@01)]
(assert (not (Set_in n@20@01 xs@2@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Set_in (inv@16@01 r) xs@2@01))
    (=
      ($FVF.lookup_left (as sm@18@01  $FVF<left>) r)
      ($FVF.lookup_left $t@15@01 r)))
  :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left $t@15@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@15@01 r) r)
  :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
    (=
      ($FVF.lookup_left (as sm@8@01  $FVF<left>) r)
      ($FVF.lookup_left $t@5@01 r)))
  :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left $t@5@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@5@01 r) r)
  :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (Set_in n@20@01 xs@2@01)
  (and
    (Set_in n@20@01 xs@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@18@01  $FVF<left>) n@20@01) n@20@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@8@01  $FVF<left>) n@20@01) n@20@01))))
; Joined path conditions
(assert (or (not (Set_in n@20@01 xs@2@01)) (Set_in n@20@01 xs@2@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Set_in (inv@16@01 r) xs@2@01))
    (=
      ($FVF.lookup_left (as sm@18@01  $FVF<left>) r)
      ($FVF.lookup_left $t@15@01 r)))
  :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left $t@15@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@15@01 r) r)
  :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
    (=
      ($FVF.lookup_left (as sm@8@01  $FVF<left>) r)
      ($FVF.lookup_left $t@5@01 r)))
  :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left $t@5@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@5@01 r) r)
  :pattern (($FVF.lookup_left (as sm@8@01  $FVF<left>) r))
  :qid |qp.fvfResTrgDef1|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@20@01 $Ref)) (!
  (and
    (=>
      (Set_in n@20@01 xs@2@01)
      (and
        (Set_in n@20@01 xs@2@01)
        ($FVF.loc_left ($FVF.lookup_left (as sm@18@01  $FVF<left>) n@20@01) n@20@01)
        ($FVF.loc_left ($FVF.lookup_left (as sm@8@01  $FVF<left>) n@20@01) n@20@01)))
    (or (not (Set_in n@20@01 xs@2@01)) (Set_in n@20@01 xs@2@01)))
  :pattern ((Set_in n@20@01 xs@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@18@01  $FVF<left>) n@20@01) n@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionone.vpr@18@10@18@83-aux|)))
(assert (forall ((n@20@01 $Ref)) (!
  (=>
    (Set_in n@20@01 xs@2@01)
    (=
      ($FVF.lookup_left (as sm@18@01  $FVF<left>) n@20@01)
      ($FVF.lookup_left (as sm@8@01  $FVF<left>) n@20@01)))
  :pattern ((Set_in n@20@01 xs@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@18@01  $FVF<left>) n@20@01) n@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/unionone.vpr@18@10@18@83|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert a.left == b
; [eval] a.left == b
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@17@01 r) (Set_in (inv@16@01 r) xs@2@01))
      (=
        ($FVF.lookup_left (as sm@18@01  $FVF<left>) r)
        ($FVF.lookup_left $t@15@01 r)))
    :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
    :pattern (($FVF.lookup_left $t@15@01 r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_left ($FVF.lookup_left $t@15@01 r) r)
    :pattern (($FVF.lookup_left (as sm@18@01  $FVF<left>) r))
    :qid |qp.fvfResTrgDef3|))))
(assert ($FVF.loc_left ($FVF.lookup_left (as sm@18@01  $FVF<left>) a@0@01) a@0@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@17@01 a@0@01) (Set_in (inv@16@01 a@0@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_left (as sm@18@01  $FVF<left>) a@0@01) b@1@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_left (as sm@18@01  $FVF<left>) a@0@01) b@1@01))
(pop) ; 2
(pop) ; 1
