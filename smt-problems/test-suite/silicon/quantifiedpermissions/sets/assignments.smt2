(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/assignments.vpr
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
; ---------- test01 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const x@1@01 $Ref)
(declare-const xs@2@01 Set<$Ref>)
(declare-const x@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@3@01 xs@2@01))
(declare-const z@5@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@5@01 xs@2@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@5@01 $Ref) (z2@5@01 $Ref)) (!
  (=>
    (and (Set_in z1@5@01 xs@2@01) (Set_in z2@5@01 xs@2@01) (= z1@5@01 z2@5@01))
    (= z1@5@01 z2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@5@01 $Ref)) (!
  (=>
    (Set_in z@5@01 xs@2@01)
    (and (= (inv@6@01 z@5@01) z@5@01) (img@7@01 z@5@01)))
  :pattern ((Set_in z@5@01 xs@2@01))
  :pattern ((inv@6@01 z@5@01))
  :pattern ((img@7@01 z@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@5@01 $Ref)) (!
  (=> (Set_in z@5@01 xs@2@01) (not (= z@5@01 $Ref.null)))
  :pattern ((Set_in z@5@01 xs@2@01))
  :pattern ((inv@6@01 z@5@01))
  :pattern ((img@7@01 z@5@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(declare-const z@9@01 $Ref)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@9@01 xs@2@01))
(pop) ; 3
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@9@01 $Ref) (z2@9@01 $Ref)) (!
  (=>
    (and (Set_in z1@9@01 xs@2@01) (Set_in z2@9@01 xs@2@01) (= z1@9@01 z2@9@01))
    (= z1@9@01 z2@9@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@9@01 $Ref)) (!
  (=>
    (Set_in z@9@01 xs@2@01)
    (and (= (inv@10@01 z@9@01) z@9@01) (img@11@01 z@9@01)))
  :pattern ((Set_in z@9@01 xs@2@01))
  :pattern ((inv@10@01 z@9@01))
  :pattern ((img@11@01 z@9@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@11@01 r) (Set_in (inv@10@01 r) xs@2@01)) (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@9@01 $Ref)) (!
  (=> (Set_in z@9@01 xs@2@01) (not (= z@9@01 $Ref.null)))
  :pattern ((Set_in z@9@01 xs@2@01))
  :pattern ((inv@10@01 z@9@01))
  :pattern ((img@11@01 z@9@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@8@01) $Snap.unit))
; [eval] x.f == x
(push) ; 3
(assert (not (and (img@11@01 x@3@01) (Set_in (inv@10@01 x@3@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@8@01)) x@3@01)
  x@3@01))
(pop) ; 2
(push) ; 2
; [exec]
; x.f := x
; Precomputing data for removing quantified permissions
(define-fun pTaken@12@01 ((r $Ref)) $Perm
  (ite
    (= r x@3@01)
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
      (pTaken@12@01 r))
    $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@12@01 r) $Perm.No)
  
  :qid |quant-u-6|))))
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
  (=> (= r x@3@01) (= (- $Perm.Write (pTaken@12@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@13@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@13@01  $FVF<f>) x@3@01) x@3@01))
(declare-const z@14@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@14@01 xs@2@01))
(pop) ; 3
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@14@01 $Ref) (z2@14@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@14@01 xs@2@01)
      (Set_in z2@14@01 xs@2@01)
      (= z1@14@01 z2@14@01))
    (= z1@14@01 z2@14@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@14@01 $Ref)) (!
  (=>
    (Set_in z@14@01 xs@2@01)
    (and (= (inv@15@01 z@14@01) z@14@01) (img@16@01 z@14@01)))
  :pattern ((Set_in z@14@01 xs@2@01))
  :pattern ((inv@15@01 z@14@01))
  :pattern ((img@16@01 z@14@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) xs@2@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@15@01 r) xs@2@01) (img@16@01 r) (= r (inv@15@01 r)))
    ($Perm.min
      (ite
        (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
        (- $Perm.Write (pTaken@12@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@15@01 r) xs@2@01) (img@16@01 r) (= r (inv@15@01 r)))
    ($Perm.min
      (ite (= r x@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@17@01 r)))
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
        (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
        (- $Perm.Write (pTaken@12@01 r))
        $Perm.No)
      (pTaken@17@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
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
    (and (Set_in (inv@15@01 r) xs@2@01) (img@16@01 r) (= r (inv@15@01 r)))
    (= (- $Perm.Write (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@18@01 x@3@01)) $Perm.No)))
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
    (and (Set_in (inv@15@01 r) xs@2@01) (img@16@01 r) (= r (inv@15@01 r)))
    (= (- (- $Perm.Write (pTaken@17@01 r)) (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@19@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@13@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@13@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
      (< $Perm.No (- $Perm.Write (pTaken@12@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@19@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
; [eval] x.f == x
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@19@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@13@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@13@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
        (< $Perm.No (- $Perm.Write (pTaken@12@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@19@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
    :qid |qp.fvfValDef1|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and (img@7@01 x@3@01) (Set_in (inv@6@01 x@3@01) xs@2@01))
      (- $Perm.Write (pTaken@12@01 x@3@01))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f (as sm@19@01  $FVF<f>) x@3@01) x@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@19@01  $FVF<f>) x@3@01) x@3@01))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const xs@20@01 Set<$Ref>)
(declare-const x@21@01 $Ref)
(declare-const xs@22@01 Set<$Ref>)
(declare-const x@23@01 $Ref)
(push) ; 1
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (= ($Snap.first $t@24@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@23@01 xs@22@01))
(declare-const z@25@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@25@01 xs@22@01))
(pop) ; 2
(declare-fun inv@26@01 ($Ref) $Ref)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@25@01 $Ref) (z2@25@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@25@01 xs@22@01)
      (Set_in z2@25@01 xs@22@01)
      (= z1@25@01 z2@25@01))
    (= z1@25@01 z2@25@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@25@01 $Ref)) (!
  (=>
    (Set_in z@25@01 xs@22@01)
    (and (= (inv@26@01 z@25@01) z@25@01) (img@27@01 z@25@01)))
  :pattern ((Set_in z@25@01 xs@22@01))
  :pattern ((inv@26@01 z@25@01))
  :pattern ((img@27@01 z@25@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@27@01 r) (Set_in (inv@26@01 r) xs@22@01)) (= (inv@26@01 r) r))
  :pattern ((inv@26@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@25@01 $Ref)) (!
  (=> (Set_in z@25@01 xs@22@01) (not (= z@25@01 $Ref.null)))
  :pattern ((Set_in z@25@01 xs@22@01))
  :pattern ((inv@26@01 z@25@01))
  :pattern ((img@27@01 z@25@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.f := x
; Precomputing data for removing quantified permissions
(define-fun pTaken@28@01 ((r $Ref)) $Perm
  (ite
    (= r x@23@01)
    ($Perm.min
      (ite
        (and (img@27@01 r) (Set_in (inv@26@01 r) xs@22@01))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@27@01 r) (Set_in (inv@26@01 r) xs@22@01))
        $Perm.Write
        $Perm.No)
      (pTaken@28@01 r))
    $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@28@01 r) $Perm.No)
  
  :qid |quant-u-18|))))
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
  (=> (= r x@23@01) (= (- $Perm.Write (pTaken@28@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@29@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@29@01  $FVF<f>) x@23@01) x@23@01))
; [exec]
; exhale acc(x.f, write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (= r x@23@01)
    ($Perm.min (ite (= r x@23@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (= r x@23@01)
    ($Perm.min
      (ite
        (and (img@27@01 r) (Set_in (inv@26@01 r) xs@22@01))
        (- $Perm.Write (pTaken@28@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@30@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@30@01 x@23@01)) $Perm.No)))
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
  (=> (= r x@23@01) (= (- $Perm.Write (pTaken@30@01 r)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@32@01  $FVF<f>) x@23@01)
  ($FVF.lookup_f (as sm@29@01  $FVF<f>) x@23@01)))
(assert (=>
  (ite
    (and (img@27@01 x@23@01) (Set_in (inv@26@01 x@23@01) xs@22@01))
    (< $Perm.No (- $Perm.Write (pTaken@28@01 x@23@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@32@01  $FVF<f>) x@23@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@24@01)) x@23@01))))
; [exec]
; assert x.f == x
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@27@01 x@23@01) (Set_in (inv@26@01 x@23@01) xs@22@01))
  (< $Perm.No (- $Perm.Write (pTaken@28@01 x@23@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@33@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@27@01 r) (Set_in (inv@26@01 r) xs@22@01))
      (< $Perm.No (- $Perm.Write (pTaken@28@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@33@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@24@01)) r)))
  :pattern (($FVF.lookup_f (as sm@33@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@24@01)) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@34@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@34@01  $FPM) r)
    (ite
      (and (img@27@01 r) (Set_in (inv@26@01 r) xs@22@01))
      (- $Perm.Write (pTaken@28@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@34@01  $FPM) r) $Perm.Write)
  :pattern ((inv@26@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@27@01 x@23@01) (Set_in (inv@26@01 x@23@01) xs@22@01))
  (< $Perm.No (- $Perm.Write (pTaken@28@01 x@23@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@35@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@27@01 r) (Set_in (inv@26@01 r) xs@22@01))
      (< $Perm.No (- $Perm.Write (pTaken@28@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@24@01)) r)))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@24@01)) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@36@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@36@01  $FPM) r)
    (ite
      (and (img@27@01 r) (Set_in (inv@26@01 r) xs@22@01))
      (- $Perm.Write (pTaken@28@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@36@01  $FPM) r) $Perm.Write)
  :pattern ((inv@26@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@27@01 x@23@01) (Set_in (inv@26@01 x@23@01) xs@22@01))
  (< $Perm.No (- $Perm.Write (pTaken@28@01 x@23@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@27@01 x@23@01) (Set_in (inv@26@01 x@23@01) xs@22@01))
  (< $Perm.No (- $Perm.Write (pTaken@28@01 x@23@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const xs@37@01 Set<$Ref>)
(declare-const x@38@01 $Ref)
(declare-const y@39@01 $Ref)
(declare-const xs@40@01 Set<$Ref>)
(declare-const x@41@01 $Ref)
(declare-const y@42@01 $Ref)
(push) ; 1
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 ($Snap.combine ($Snap.first $t@43@01) ($Snap.second $t@43@01))))
(assert (= ($Snap.first $t@43@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@41@01 xs@40@01))
(assert (=
  ($Snap.second $t@43@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@43@01))
    ($Snap.second ($Snap.second $t@43@01)))))
(assert (= ($Snap.first ($Snap.second $t@43@01)) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@42@01 xs@40@01))
(assert (=
  ($Snap.second ($Snap.second $t@43@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@43@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@43@01))))))
(declare-const z@44@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@44@01 xs@40@01))
(pop) ; 2
(declare-fun inv@45@01 ($Ref) $Ref)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@44@01 $Ref) (z2@44@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@44@01 xs@40@01)
      (Set_in z2@44@01 xs@40@01)
      (= z1@44@01 z2@44@01))
    (= z1@44@01 z2@44@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@44@01 $Ref)) (!
  (=>
    (Set_in z@44@01 xs@40@01)
    (and (= (inv@45@01 z@44@01) z@44@01) (img@46@01 z@44@01)))
  :pattern ((Set_in z@44@01 xs@40@01))
  :pattern ((inv@45@01 z@44@01))
  :pattern ((img@46@01 z@44@01))
  :qid |quant-u-24|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@46@01 r) (Set_in (inv@45@01 r) xs@40@01)) (= (inv@45@01 r) r))
  :pattern ((inv@45@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@44@01 $Ref)) (!
  (=> (Set_in z@44@01 xs@40@01) (not (= z@44@01 $Ref.null)))
  :pattern ((Set_in z@44@01 xs@40@01))
  :pattern ((inv@45@01 z@44@01))
  :pattern ((img@46@01 z@44@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@43@01))) $Snap.unit))
; [eval] y.f == y
(push) ; 2
(assert (not (and (img@46@01 y@42@01) (Set_in (inv@45@01 y@42@01) xs@40@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@43@01)))) y@42@01)
  y@42@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale x != y
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@41@01 y@42@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; x.f := x
; Precomputing data for removing quantified permissions
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (= r x@41@01)
    ($Perm.min
      (ite
        (and (img@46@01 r) (Set_in (inv@45@01 r) xs@40@01))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@46@01 r) (Set_in (inv@45@01 r) xs@40@01))
        $Perm.Write
        $Perm.No)
      (pTaken@48@01 r))
    $Perm.No)
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@48@01 r) $Perm.No)
  
  :qid |quant-u-27|))))
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
  (=> (= r x@41@01) (= (- $Perm.Write (pTaken@48@01 r)) $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@49@01  $FVF<f>) x@41@01) x@41@01))
; [exec]
; exhale acc(x.f, write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (= r x@41@01)
    ($Perm.min (ite (= r x@41@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (= r x@41@01)
    ($Perm.min
      (ite
        (and (img@46@01 r) (Set_in (inv@45@01 r) xs@40@01))
        (- $Perm.Write (pTaken@48@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@50@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@50@01 x@41@01)) $Perm.No)))
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
  (=> (= r x@41@01) (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@52@01  $FVF<f>) x@41@01)
  ($FVF.lookup_f (as sm@49@01  $FVF<f>) x@41@01)))
(assert (=>
  (ite
    (and (img@46@01 x@41@01) (Set_in (inv@45@01 x@41@01) xs@40@01))
    (< $Perm.No (- $Perm.Write (pTaken@48@01 x@41@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@52@01  $FVF<f>) x@41@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@43@01)))) x@41@01))))
; [exec]
; assert x.f == x
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@46@01 x@41@01) (Set_in (inv@45@01 x@41@01) xs@40@01))
  (< $Perm.No (- $Perm.Write (pTaken@48@01 x@41@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@53@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@46@01 r) (Set_in (inv@45@01 r) xs@40@01))
      (< $Perm.No (- $Perm.Write (pTaken@48@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@43@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@43@01)))) r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@54@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@54@01  $FPM) r)
    (ite
      (and (img@46@01 r) (Set_in (inv@45@01 r) xs@40@01))
      (- $Perm.Write (pTaken@48@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@54@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@54@01  $FPM) r) $Perm.Write)
  :pattern ((inv@45@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@46@01 x@41@01) (Set_in (inv@45@01 x@41@01) xs@40@01))
  (< $Perm.No (- $Perm.Write (pTaken@48@01 x@41@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@55@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@46@01 r) (Set_in (inv@45@01 r) xs@40@01))
      (< $Perm.No (- $Perm.Write (pTaken@48@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@55@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@43@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@55@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@43@01)))) r))
  :qid |qp.fvfValDef12|)))
(declare-const pm@56@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@56@01  $FPM) r)
    (ite
      (and (img@46@01 r) (Set_in (inv@45@01 r) xs@40@01))
      (- $Perm.Write (pTaken@48@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@56@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@56@01  $FPM) r) $Perm.Write)
  :pattern ((inv@45@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@46@01 x@41@01) (Set_in (inv@45@01 x@41@01) xs@40@01))
  (< $Perm.No (- $Perm.Write (pTaken@48@01 x@41@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@46@01 x@41@01) (Set_in (inv@45@01 x@41@01) xs@40@01))
  (< $Perm.No (- $Perm.Write (pTaken@48@01 x@41@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@57@01 Set<$Ref>)
(declare-const x@58@01 $Ref)
(declare-const y@59@01 $Ref)
(declare-const xs@60@01 Set<$Ref>)
(declare-const x@61@01 $Ref)
(declare-const y@62@01 $Ref)
(push) ; 1
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (= ($Snap.first $t@63@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@61@01 xs@60@01))
(assert (=
  ($Snap.second $t@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@63@01))
    ($Snap.second ($Snap.second $t@63@01)))))
(assert (= ($Snap.first ($Snap.second $t@63@01)) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@62@01 xs@60@01))
(assert (=
  ($Snap.second ($Snap.second $t@63@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@63@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@63@01))))))
(declare-const z@64@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@64@01 xs@60@01))
(pop) ; 2
(declare-fun inv@65@01 ($Ref) $Ref)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@64@01 $Ref) (z2@64@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@64@01 xs@60@01)
      (Set_in z2@64@01 xs@60@01)
      (= z1@64@01 z2@64@01))
    (= z1@64@01 z2@64@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@64@01 $Ref)) (!
  (=>
    (Set_in z@64@01 xs@60@01)
    (and (= (inv@65@01 z@64@01) z@64@01) (img@66@01 z@64@01)))
  :pattern ((Set_in z@64@01 xs@60@01))
  :pattern ((inv@65@01 z@64@01))
  :pattern ((img@66@01 z@64@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@64@01 $Ref)) (!
  (=> (Set_in z@64@01 xs@60@01) (not (= z@64@01 $Ref.null)))
  :pattern ((Set_in z@64@01 xs@60@01))
  :pattern ((inv@65@01 z@64@01))
  :pattern ((img@66@01 z@64@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@63@01))) $Snap.unit))
; [eval] y.f == y
(push) ; 2
(assert (not (and (img@66@01 y@62@01) (Set_in (inv@65@01 y@62@01) xs@60@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@63@01)))) y@62@01)
  y@62@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale x != y
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@61@01 y@62@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; x.f := x
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (= r x@61@01)
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
        $Perm.Write
        $Perm.No)
      (pTaken@68@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@68@01 r) $Perm.No)
  
  :qid |quant-u-36|))))
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
  (=> (= r x@61@01) (= (- $Perm.Write (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@69@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) x@61@01) x@61@01))
; [exec]
; assert y.f == y
; [eval] y.f == y
(declare-const sm@70@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@61@01)
    (=
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
      (< $Perm.No (- $Perm.Write (pTaken@68@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@63@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@63@01)))) r))
  :qid |qp.fvfValDef15|)))
(declare-const pm@71@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@71@01  $FPM) r)
    (+
      (ite (= r x@61@01) $Perm.Write $Perm.No)
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
        (- $Perm.Write (pTaken@68@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@71@01  $FPM) y@62@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f (as sm@70@01  $FVF<f>) y@62@01) y@62@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@70@01  $FVF<f>) y@62@01) y@62@01))
; [exec]
; exhale acc(x.f, write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((r $Ref)) $Perm
  (ite
    (= r x@61@01)
    ($Perm.min (ite (= r x@61@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@73@01 ((r $Ref)) $Perm
  (ite
    (= r x@61@01)
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
        (- $Perm.Write (pTaken@68@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@72@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@72@01 x@61@01)) $Perm.No)))
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
  (=> (= r x@61@01) (= (- $Perm.Write (pTaken@72@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@70@01  $FVF<f>) x@61@01)
  ($FVF.lookup_f (as sm@69@01  $FVF<f>) x@61@01)))
(assert (=>
  (ite
    (and (img@66@01 x@61@01) (Set_in (inv@65@01 x@61@01) xs@60@01))
    (< $Perm.No (- $Perm.Write (pTaken@68@01 x@61@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@70@01  $FVF<f>) x@61@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@63@01)))) x@61@01))))
; [exec]
; assert y.f == y
; [eval] y.f == y
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@66@01 y@62@01) (Set_in (inv@65@01 y@62@01) xs@60@01))
  (< $Perm.No (- $Perm.Write (pTaken@68@01 y@62@01)))
  false)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert x.f == x
; [eval] x.f == x
(push) ; 3
(assert (not (ite
  (and (img@66@01 x@61@01) (Set_in (inv@65@01 x@61@01) xs@60@01))
  (< $Perm.No (- $Perm.Write (pTaken@68@01 x@61@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@74@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
      (< $Perm.No (- $Perm.Write (pTaken@68@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@74@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@63@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@74@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@63@01)))) r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@75@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@75@01  $FPM) r)
    (ite
      (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
      (- $Perm.Write (pTaken@68@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@66@01 x@61@01) (Set_in (inv@65@01 x@61@01) xs@60@01))
  (< $Perm.No (- $Perm.Write (pTaken@68@01 x@61@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@76@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
      (< $Perm.No (- $Perm.Write (pTaken@68@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@63@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@63@01)))) r))
  :qid |qp.fvfValDef19|)))
(declare-const pm@77@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@77@01  $FPM) r)
    (ite
      (and (img@66@01 r) (Set_in (inv@65@01 r) xs@60@01))
      (- $Perm.Write (pTaken@68@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@77@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@66@01 x@61@01) (Set_in (inv@65@01 x@61@01) xs@60@01))
  (< $Perm.No (- $Perm.Write (pTaken@68@01 x@61@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] x.f == x
(set-option :timeout 0)
(push) ; 3
(assert (not (ite
  (and (img@66@01 x@61@01) (Set_in (inv@65@01 x@61@01) xs@60@01))
  (< $Perm.No (- $Perm.Write (pTaken@68@01 x@61@01)))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
