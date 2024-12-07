(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:17:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0081b.vpr
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
(declare-const ys@1@01 Set<$Ref>)
(declare-const xs@2@01 Set<$Ref>)
(declare-const ys@3@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const x@5@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@5@01 xs@2@01))
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(pop) ; 2
(declare-fun inv@7@01 ($Ref) $Ref)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@6@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@5@01 $Ref)) (!
  (=> (Set_in x@5@01 xs@2@01) (or (= $k@6@01 $Perm.No) (< $Perm.No $k@6@01)))
  
  :qid |quant-u-0|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@5@01 $Ref) (x2@5@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@5@01 xs@2@01) (< $Perm.No $k@6@01))
      (and (Set_in x2@5@01 xs@2@01) (< $Perm.No $k@6@01))
      (= x1@5@01 x2@5@01))
    (= x1@5@01 x2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@5@01 $Ref)) (!
  (=>
    (and (Set_in x@5@01 xs@2@01) (< $Perm.No $k@6@01))
    (and (= (inv@7@01 x@5@01) x@5@01) (img@8@01 x@5@01)))
  :pattern ((Set_in x@5@01 xs@2@01))
  :pattern ((inv@7@01 x@5@01))
  :pattern ((img@8@01 x@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (Set_in (inv@7@01 r) xs@2@01) (< $Perm.No $k@6@01)))
    (= (inv@7@01 r) r))
  :pattern ((inv@7@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@5@01 $Ref)) (!
  (<= $Perm.No $k@6@01)
  :pattern ((Set_in x@5@01 xs@2@01))
  :pattern ((inv@7@01 x@5@01))
  :pattern ((img@8@01 x@5@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@5@01 $Ref)) (!
  (<= $k@6@01 $Perm.Write)
  :pattern ((Set_in x@5@01 xs@2@01))
  :pattern ((inv@7@01 x@5@01))
  :pattern ((img@8@01 x@5@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@5@01 $Ref)) (!
  (=>
    (and (Set_in x@5@01 xs@2@01) (< $Perm.No $k@6@01))
    (not (= x@5@01 $Ref.null)))
  :pattern ((Set_in x@5@01 xs@2@01))
  :pattern ((inv@7@01 x@5@01))
  :pattern ((img@8@01 x@5@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@9@01 $Ref)
(push) ; 2
; [eval] (x in ys)
(assert (Set_in x@9@01 ys@3@01))
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(pop) ; 2
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@10@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@9@01 $Ref)) (!
  (=> (Set_in x@9@01 ys@3@01) (or (= $k@10@01 $Perm.No) (< $Perm.No $k@10@01)))
  
  :qid |quant-u-2|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@9@01 $Ref) (x2@9@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@9@01 ys@3@01) (< $Perm.No $k@10@01))
      (and (Set_in x2@9@01 ys@3@01) (< $Perm.No $k@10@01))
      (= x1@9@01 x2@9@01))
    (= x1@9@01 x2@9@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (and (Set_in x@9@01 ys@3@01) (< $Perm.No $k@10@01))
    (and (= (inv@11@01 x@9@01) x@9@01) (img@12@01 x@9@01)))
  :pattern ((Set_in x@9@01 ys@3@01))
  :pattern ((inv@11@01 x@9@01))
  :pattern ((img@12@01 x@9@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (Set_in (inv@11@01 r) ys@3@01) (< $Perm.No $k@10@01)))
    (= (inv@11@01 r) r))
  :pattern ((inv@11@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@9@01 $Ref)) (!
  (<= $Perm.No $k@10@01)
  :pattern ((Set_in x@9@01 ys@3@01))
  :pattern ((inv@11@01 x@9@01))
  :pattern ((img@12@01 x@9@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@9@01 $Ref)) (!
  (<= $k@10@01 $Perm.Write)
  :pattern ((Set_in x@9@01 ys@3@01))
  :pattern ((inv@11@01 x@9@01))
  :pattern ((img@12@01 x@9@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (and (Set_in x@9@01 ys@3@01) (< $Perm.No $k@10@01))
    (not (= x@9@01 $Ref.null)))
  :pattern ((Set_in x@9@01 ys@3@01))
  :pattern ((inv@11@01 x@9@01))
  :pattern ((img@12@01 x@9@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= x@9@01 x@5@01)
    (=
      (and (img@12@01 r) (Set_in (inv@11@01 r) ys@3@01))
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01))))
  
  :qid |quant-u-4|))))
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
(declare-const x@13@01 $Ref)
(push) ; 3
; [eval] (x in (xs union ys))
; [eval] (xs union ys)
(assert (Set_in x@13@01 (Set_union xs@2@01 ys@3@01)))
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(pop) ; 3
(declare-const $t@15@01 $FVF<f>)
(declare-fun inv@16@01 ($Ref) $Ref)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@14@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@13@01 $Ref)) (!
  (=>
    (Set_in x@13@01 (Set_union xs@2@01 ys@3@01))
    (or (= $k@14@01 $Perm.No) (< $Perm.No $k@14@01)))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@13@01 $Ref) (x2@13@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@13@01 (Set_union xs@2@01 ys@3@01)) (< $Perm.No $k@14@01))
      (and (Set_in x2@13@01 (Set_union xs@2@01 ys@3@01)) (< $Perm.No $k@14@01))
      (= x1@13@01 x2@13@01))
    (= x1@13@01 x2@13@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@13@01 $Ref)) (!
  (=>
    (and (Set_in x@13@01 (Set_union xs@2@01 ys@3@01)) (< $Perm.No $k@14@01))
    (and (= (inv@16@01 x@13@01) x@13@01) (img@17@01 x@13@01)))
  :pattern ((Set_in x@13@01 (Set_union xs@2@01 ys@3@01)))
  :pattern ((inv@16@01 x@13@01))
  :pattern ((img@17@01 x@13@01))
  :qid |quant-u-6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@01 r)
      (and
        (Set_in (inv@16@01 r) (Set_union xs@2@01 ys@3@01))
        (< $Perm.No $k@14@01)))
    (= (inv@16@01 r) r))
  :pattern ((inv@16@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@13@01 $Ref)) (!
  (<= $Perm.No $k@14@01)
  :pattern ((Set_in x@13@01 (Set_union xs@2@01 ys@3@01)))
  :pattern ((inv@16@01 x@13@01))
  :pattern ((img@17@01 x@13@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@13@01 $Ref)) (!
  (<= $k@14@01 $Perm.Write)
  :pattern ((Set_in x@13@01 (Set_union xs@2@01 ys@3@01)))
  :pattern ((inv@16@01 x@13@01))
  :pattern ((img@17@01 x@13@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@13@01 $Ref)) (!
  (=>
    (and (Set_in x@13@01 (Set_union xs@2@01 ys@3@01)) (< $Perm.No $k@14@01))
    (not (= x@13@01 $Ref.null)))
  :pattern ((Set_in x@13@01 (Set_union xs@2@01 ys@3@01)))
  :pattern ((inv@16@01 x@13@01))
  :pattern ((img@17@01 x@13@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@18@01 $Ref)
(push) ; 3
; [eval] (x in (xs union ys))
; [eval] (xs union ys)
(assert (Set_in x@18@01 (Set_union xs@2@01 ys@3@01)))
(declare-const $k@19@01 $Perm)
(assert ($Perm.isReadVar $k@19@01))
(pop) ; 3
(declare-fun inv@20@01 ($Ref) $Ref)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@19@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@18@01 $Ref)) (!
  (=>
    (Set_in x@18@01 (Set_union xs@2@01 ys@3@01))
    (or (= $k@19@01 $Perm.No) (< $Perm.No $k@19@01)))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@18@01 $Ref) (x2@18@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@18@01 (Set_union xs@2@01 ys@3@01)) (< $Perm.No $k@19@01))
      (and (Set_in x2@18@01 (Set_union xs@2@01 ys@3@01)) (< $Perm.No $k@19@01))
      (= x1@18@01 x2@18@01))
    (= x1@18@01 x2@18@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@18@01 $Ref)) (!
  (=>
    (and (Set_in x@18@01 (Set_union xs@2@01 ys@3@01)) (< $Perm.No $k@19@01))
    (and (= (inv@20@01 x@18@01) x@18@01) (img@21@01 x@18@01)))
  :pattern ((Set_in x@18@01 (Set_union xs@2@01 ys@3@01)))
  :pattern ((inv@20@01 x@18@01))
  :pattern ((img@21@01 x@18@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@01 r)
      (and
        (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
        (< $Perm.No $k@19@01)))
    (= (inv@20@01 r) r))
  :pattern ((inv@20@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@22@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
      (img@21@01 r)
      (= r (inv@20@01 r)))
    ($Perm.min
      (ite (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01)) $k@6@01 $Perm.No)
      $k@19@01)
    $Perm.No))
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
      (img@21@01 r)
      (= r (inv@20@01 r)))
    ($Perm.min
      (ite (and (img@12@01 r) (Set_in (inv@11@01 r) ys@3@01)) $k@10@01 $Perm.No)
      (- $k@19@01 (pTaken@22@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@19@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01)) $k@6@01 $Perm.No)
        $Perm.No))
    (ite
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01))
      (<
        (ite
          (and
            (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
            (img@21@01 r)
            (= r (inv@20@01 r)))
          $k@19@01
          $Perm.No)
        $k@6@01)
      (<
        (ite
          (and
            (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
            (img@21@01 r)
            (= r (inv@20@01 r)))
          $k@19@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@8@01 r))
  :pattern ((Set_in (inv@7@01 r) xs@2@01))
  :pattern ((Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01)))
  :pattern ((img@21@01 r))
  :qid |qp.srp0|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
      (img@21@01 r)
      (= r (inv@20@01 r)))
    (= (- $k@19@01 (pTaken@22@01 r)) $Perm.No))
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@19@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@12@01 r) (Set_in (inv@11@01 r) ys@3@01))
          $k@10@01
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@12@01 r) (Set_in (inv@11@01 r) ys@3@01))
      (<
        (ite
          (and
            (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
            (img@21@01 r)
            (= r (inv@20@01 r)))
          $k@19@01
          $Perm.No)
        $k@10@01)
      (<
        (ite
          (and
            (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
            (img@21@01 r)
            (= r (inv@20@01 r)))
          $k@19@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@12@01 r))
  :pattern ((Set_in (inv@11@01 r) ys@3@01))
  :pattern ((Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01)))
  :pattern ((img@21@01 r))
  :qid |qp.srp1|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@20@01 r) (Set_union xs@2@01 ys@3@01))
      (img@21@01 r)
      (= r (inv@20@01 r)))
    (= (- (- $k@19@01 (pTaken@22@01 r)) (pTaken@23@01 r)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01))
      (< $Perm.No $k@6@01)
      false)
    (=
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@12@01 r) (Set_in (inv@11@01 r) ys@3@01))
      (< $Perm.No $k@10@01)
      false)
    (=
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef3|)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@25@01 Set<$Ref>)
(declare-const y@26@01 $Ref)
(declare-const z@27@01 $Ref)
(declare-const xs@28@01 Set<$Ref>)
(declare-const y@29@01 $Ref)
(declare-const z@30@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(declare-const x@32@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@32@01 xs@28@01))
(declare-const $k@33@01 $Perm)
(assert ($Perm.isReadVar $k@33@01))
(pop) ; 2
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@33@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@32@01 $Ref)) (!
  (=> (Set_in x@32@01 xs@28@01) (or (= $k@33@01 $Perm.No) (< $Perm.No $k@33@01)))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@32@01 $Ref) (x2@32@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@32@01 xs@28@01) (< $Perm.No $k@33@01))
      (and (Set_in x2@32@01 xs@28@01) (< $Perm.No $k@33@01))
      (= x1@32@01 x2@32@01))
    (= x1@32@01 x2@32@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@32@01 $Ref)) (!
  (=>
    (and (Set_in x@32@01 xs@28@01) (< $Perm.No $k@33@01))
    (and (= (inv@34@01 x@32@01) x@32@01) (img@35@01 x@32@01)))
  :pattern ((Set_in x@32@01 xs@28@01))
  :pattern ((inv@34@01 x@32@01))
  :pattern ((img@35@01 x@32@01))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@01 r)
      (and (Set_in (inv@34@01 r) xs@28@01) (< $Perm.No $k@33@01)))
    (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@32@01 $Ref)) (!
  (<= $Perm.No $k@33@01)
  :pattern ((Set_in x@32@01 xs@28@01))
  :pattern ((inv@34@01 x@32@01))
  :pattern ((img@35@01 x@32@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@32@01 $Ref)) (!
  (<= $k@33@01 $Perm.Write)
  :pattern ((Set_in x@32@01 xs@28@01))
  :pattern ((inv@34@01 x@32@01))
  :pattern ((img@35@01 x@32@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@32@01 $Ref)) (!
  (=>
    (and (Set_in x@32@01 xs@28@01) (< $Perm.No $k@33@01))
    (not (= x@32@01 $Ref.null)))
  :pattern ((Set_in x@32@01 xs@28@01))
  :pattern ((inv@34@01 x@32@01))
  :pattern ((img@35@01 x@32@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@31@01) $Snap.unit))
; [eval] (z in xs)
(assert (Set_in z@30@01 xs@28@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@36@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@36@01 xs@28@01))
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(pop) ; 3
(declare-const $t@38@01 $FVF<f>)
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@37@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@36@01 $Ref)) (!
  (=> (Set_in x@36@01 xs@28@01) (or (= $k@37@01 $Perm.No) (< $Perm.No $k@37@01)))
  
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
      (and (Set_in x1@36@01 xs@28@01) (< $Perm.No $k@37@01))
      (and (Set_in x2@36@01 xs@28@01) (< $Perm.No $k@37@01))
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
    (and (Set_in x@36@01 xs@28@01) (< $Perm.No $k@37@01))
    (and (= (inv@39@01 x@36@01) x@36@01) (img@40@01 x@36@01)))
  :pattern ((Set_in x@36@01 xs@28@01))
  :pattern ((inv@39@01 x@36@01))
  :pattern ((img@40@01 x@36@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@40@01 r)
      (and (Set_in (inv@39@01 r) xs@28@01) (< $Perm.No $k@37@01)))
    (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@36@01 $Ref)) (!
  (<= $Perm.No $k@37@01)
  :pattern ((Set_in x@36@01 xs@28@01))
  :pattern ((inv@39@01 x@36@01))
  :pattern ((img@40@01 x@36@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@36@01 $Ref)) (!
  (<= $k@37@01 $Perm.Write)
  :pattern ((Set_in x@36@01 xs@28@01))
  :pattern ((inv@39@01 x@36@01))
  :pattern ((img@40@01 x@36@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@36@01 $Ref)) (!
  (=>
    (and (Set_in x@36@01 xs@28@01) (< $Perm.No $k@37@01))
    (not (= x@36@01 $Ref.null)))
  :pattern ((Set_in x@36@01 xs@28@01))
  :pattern ((inv@39@01 x@36@01))
  :pattern ((img@40@01 x@36@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
; [eval] (y in xs)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (Set_in y@29@01 xs@28@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (Set_in y@29@01 xs@28@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | y@29@01 in xs@28@01 | live]
; [else-branch: 0 | !(y@29@01 in xs@28@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | y@29@01 in xs@28@01]
(assert (Set_in y@29@01 xs@28@01))
; [exec]
; exhale acc(y.f, wildcard)
(declare-const $k@41@01 $Perm)
(assert ($Perm.isReadVar $k@41@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@42@01 ((r $Ref)) $Perm
  (ite
    (= r y@29@01)
    ($Perm.min
      (ite (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01)) $k@33@01 $Perm.No)
      $k@41@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@41@01
(assert (=>
  (not
    (=
      (ite
        (and (img@35@01 y@29@01) (Set_in (inv@34@01 y@29@01) xs@28@01))
        $k@33@01
        $Perm.No)
      $Perm.No))
  (ite
    (and (img@35@01 y@29@01) (Set_in (inv@34@01 y@29@01) xs@28@01))
    (< $k@41@01 $k@33@01)
    (< $k@41@01 $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@29@01) (= (- $k@41@01 (pTaken@42@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and (img@35@01 y@29@01) (Set_in (inv@34@01 y@29@01) xs@28@01))
    (< $Perm.No $k@33@01)
    false)
  (=
    ($FVF.lookup_f (as sm@43@01  $FVF<f>) y@29@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) y@29@01))))
; [exec]
; exhale (forall x: Ref ::(x in (xs setminus Set(y))) ==> acc(x.f, wildcard))
(declare-const x@44@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in (xs setminus Set(y)))
; [eval] (xs setminus Set(y))
; [eval] Set(y)
(assert (Set_in x@44@01 (Set_difference xs@28@01 (Set_singleton y@29@01))))
(declare-const $k@45@01 $Perm)
(assert ($Perm.isReadVar $k@45@01))
(pop) ; 4
(declare-fun inv@46@01 ($Ref) $Ref)
(declare-fun img@47@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@45@01))
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@44@01 $Ref)) (!
  (=>
    (Set_in x@44@01 (Set_difference xs@28@01 (Set_singleton y@29@01)))
    (or (= $k@45@01 $Perm.No) (< $Perm.No $k@45@01)))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@44@01 $Ref) (x2@44@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@44@01 (Set_difference xs@28@01 (Set_singleton y@29@01)))
        (< $Perm.No $k@45@01))
      (and
        (Set_in x2@44@01 (Set_difference xs@28@01 (Set_singleton y@29@01)))
        (< $Perm.No $k@45@01))
      (= x1@44@01 x2@44@01))
    (= x1@44@01 x2@44@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@44@01 $Ref)) (!
  (=>
    (and
      (Set_in x@44@01 (Set_difference xs@28@01 (Set_singleton y@29@01)))
      (< $Perm.No $k@45@01))
    (and (= (inv@46@01 x@44@01) x@44@01) (img@47@01 x@44@01)))
  :pattern ((Set_in x@44@01 (Set_difference xs@28@01 (Set_singleton y@29@01))))
  :pattern ((inv@46@01 x@44@01))
  :pattern ((img@47@01 x@44@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@01 r)
      (and
        (Set_in (inv@46@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
        (< $Perm.No $k@45@01)))
    (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@46@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
      (img@47@01 r)
      (= r (inv@46@01 r)))
    ($Perm.min
      (ite
        (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
        (- $k@33@01 (pTaken@42@01 r))
        $Perm.No)
      $k@45@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@45@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
          (- $k@33@01 (pTaken@42@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (<
        (ite
          (and
            (Set_in (inv@46@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
            (img@47@01 r)
            (= r (inv@46@01 r)))
          $k@45@01
          $Perm.No)
        (- $k@33@01 (pTaken@42@01 r)))
      (<
        (ite
          (and
            (Set_in (inv@46@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
            (img@47@01 r)
            (= r (inv@46@01 r)))
          $k@45@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@35@01 r))
  :pattern ((Set_in (inv@34@01 r) xs@28@01))
  :pattern ((Set_in (inv@46@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01))))
  :pattern ((img@47@01 r))
  :qid |qp.srp6|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@46@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
      (img@47@01 r)
      (= r (inv@46@01 r)))
    (= (- $k@45@01 (pTaken@48@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (< $Perm.No (- $k@33@01 (pTaken@42@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r))
  :qid |qp.fvfValDef7|)))
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(x.f, wildcard))
(declare-const x@50@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@50@01 xs@28@01))
(declare-const $k@51@01 $Perm)
(assert ($Perm.isReadVar $k@51@01))
(pop) ; 4
(declare-fun inv@52@01 ($Ref) $Ref)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@51@01))
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@50@01 $Ref)) (!
  (=> (Set_in x@50@01 xs@28@01) (or (= $k@51@01 $Perm.No) (< $Perm.No $k@51@01)))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@50@01 $Ref) (x2@50@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@50@01 xs@28@01) (< $Perm.No $k@51@01))
      (and (Set_in x2@50@01 xs@28@01) (< $Perm.No $k@51@01))
      (= x1@50@01 x2@50@01))
    (= x1@50@01 x2@50@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@50@01 $Ref)) (!
  (=>
    (and (Set_in x@50@01 xs@28@01) (< $Perm.No $k@51@01))
    (and (= (inv@52@01 x@50@01) x@50@01) (img@53@01 x@50@01)))
  :pattern ((Set_in x@50@01 xs@28@01))
  :pattern ((inv@52@01 x@50@01))
  :pattern ((img@53@01 x@50@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and (Set_in (inv@52@01 r) xs@28@01) (< $Perm.No $k@51@01)))
    (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@52@01 r) xs@28@01) (img@53@01 r) (= r (inv@52@01 r)))
    ($Perm.min
      (ite
        (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
        (- (- $k@33@01 (pTaken@42@01 r)) (pTaken@48@01 r))
        $Perm.No)
      $k@51@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@51@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
          (- (- $k@33@01 (pTaken@42@01 r)) (pTaken@48@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (<
        (ite
          (and (Set_in (inv@52@01 r) xs@28@01) (img@53@01 r) (= r (inv@52@01 r)))
          $k@51@01
          $Perm.No)
        (- (- $k@33@01 (pTaken@42@01 r)) (pTaken@48@01 r)))
      (<
        (ite
          (and (Set_in (inv@52@01 r) xs@28@01) (img@53@01 r) (= r (inv@52@01 r)))
          $k@51@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@35@01 r))
  :pattern ((Set_in (inv@34@01 r) xs@28@01))
  :pattern ((Set_in (inv@52@01 r) xs@28@01))
  :pattern ((img@53@01 r))
  :qid |qp.srp8|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@52@01 r) xs@28@01) (img@53@01 r) (= r (inv@52@01 r)))
    (= (- $k@51@01 (pTaken@54@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@55@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (< $Perm.No (- (- $k@33@01 (pTaken@42@01 r)) (pTaken@48@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@55@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r)))
  :pattern (($FVF.lookup_f (as sm@55@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r))
  :qid |qp.fvfValDef9|)))
(declare-const x@56@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@56@01 xs@28@01))
(declare-const $k@57@01 $Perm)
(assert ($Perm.isReadVar $k@57@01))
(pop) ; 4
(declare-fun inv@58@01 ($Ref) $Ref)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@57@01))
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@56@01 $Ref)) (!
  (=> (Set_in x@56@01 xs@28@01) (or (= $k@57@01 $Perm.No) (< $Perm.No $k@57@01)))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@56@01 $Ref) (x2@56@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@56@01 xs@28@01) (< $Perm.No $k@57@01))
      (and (Set_in x2@56@01 xs@28@01) (< $Perm.No $k@57@01))
      (= x1@56@01 x2@56@01))
    (= x1@56@01 x2@56@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@56@01 $Ref)) (!
  (=>
    (and (Set_in x@56@01 xs@28@01) (< $Perm.No $k@57@01))
    (and (= (inv@58@01 x@56@01) x@56@01) (img@59@01 x@56@01)))
  :pattern ((Set_in x@56@01 xs@28@01))
  :pattern ((inv@58@01 x@56@01))
  :pattern ((img@59@01 x@56@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@59@01 r)
      (and (Set_in (inv@58@01 r) xs@28@01) (< $Perm.No $k@57@01)))
    (= (inv@58@01 r) r))
  :pattern ((inv@58@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@58@01 r) xs@28@01) (img@59@01 r) (= r (inv@58@01 r)))
    ($Perm.min
      (ite
        (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
        (- (- (- $k@33@01 (pTaken@42@01 r)) (pTaken@48@01 r)) (pTaken@54@01 r))
        $Perm.No)
      $k@57@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@57@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
          (- (- (- $k@33@01 (pTaken@42@01 r)) (pTaken@48@01 r)) (pTaken@54@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (<
        (ite
          (and (Set_in (inv@58@01 r) xs@28@01) (img@59@01 r) (= r (inv@58@01 r)))
          $k@57@01
          $Perm.No)
        (- (- (- $k@33@01 (pTaken@42@01 r)) (pTaken@48@01 r)) (pTaken@54@01 r)))
      (<
        (ite
          (and (Set_in (inv@58@01 r) xs@28@01) (img@59@01 r) (= r (inv@58@01 r)))
          $k@57@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@35@01 r))
  :pattern ((Set_in (inv@34@01 r) xs@28@01))
  :pattern ((Set_in (inv@58@01 r) xs@28@01))
  :pattern ((img@59@01 r))
  :qid |qp.srp10|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@58@01 r) xs@28@01) (img@59@01 r) (= r (inv@58@01 r)))
    (= (- $k@57@01 (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@61@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (<
        $Perm.No
        (- (- (- $k@33@01 (pTaken@42@01 r)) (pTaken@48@01 r)) (pTaken@54@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@61@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r))
  :qid |qp.fvfValDef11|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | !(y@29@01 in xs@28@01)]
(assert (not (Set_in y@29@01 xs@28@01)))
(pop) ; 3
; [eval] !((y in xs))
; [eval] (y in xs)
(push) ; 3
(set-option :timeout 10)
(assert (not (Set_in y@29@01 xs@28@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (Set_in y@29@01 xs@28@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(y@29@01 in xs@28@01) | live]
; [else-branch: 1 | y@29@01 in xs@28@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(y@29@01 in xs@28@01)]
(assert (not (Set_in y@29@01 xs@28@01)))
; [exec]
; exhale (forall x: Ref ::(x in (xs setminus Set(y))) ==> acc(x.f, wildcard))
(declare-const x@62@01 $Ref)
(push) ; 4
; [eval] (x in (xs setminus Set(y)))
; [eval] (xs setminus Set(y))
; [eval] Set(y)
(assert (Set_in x@62@01 (Set_difference xs@28@01 (Set_singleton y@29@01))))
(declare-const $k@63@01 $Perm)
(assert ($Perm.isReadVar $k@63@01))
(pop) ; 4
(declare-fun inv@64@01 ($Ref) $Ref)
(declare-fun img@65@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@63@01))
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@62@01 $Ref)) (!
  (=>
    (Set_in x@62@01 (Set_difference xs@28@01 (Set_singleton y@29@01)))
    (or (= $k@63@01 $Perm.No) (< $Perm.No $k@63@01)))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@62@01 $Ref) (x2@62@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@62@01 (Set_difference xs@28@01 (Set_singleton y@29@01)))
        (< $Perm.No $k@63@01))
      (and
        (Set_in x2@62@01 (Set_difference xs@28@01 (Set_singleton y@29@01)))
        (< $Perm.No $k@63@01))
      (= x1@62@01 x2@62@01))
    (= x1@62@01 x2@62@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@62@01 $Ref)) (!
  (=>
    (and
      (Set_in x@62@01 (Set_difference xs@28@01 (Set_singleton y@29@01)))
      (< $Perm.No $k@63@01))
    (and (= (inv@64@01 x@62@01) x@62@01) (img@65@01 x@62@01)))
  :pattern ((Set_in x@62@01 (Set_difference xs@28@01 (Set_singleton y@29@01))))
  :pattern ((inv@64@01 x@62@01))
  :pattern ((img@65@01 x@62@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (and
        (Set_in (inv@64@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
        (< $Perm.No $k@63@01)))
    (= (inv@64@01 r) r))
  :pattern ((inv@64@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@66@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@64@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
      (img@65@01 r)
      (= r (inv@64@01 r)))
    ($Perm.min
      (ite (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01)) $k@33@01 $Perm.No)
      $k@63@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@63@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
          $k@33@01
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (<
        (ite
          (and
            (Set_in (inv@64@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
            (img@65@01 r)
            (= r (inv@64@01 r)))
          $k@63@01
          $Perm.No)
        $k@33@01)
      (<
        (ite
          (and
            (Set_in (inv@64@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
            (img@65@01 r)
            (= r (inv@64@01 r)))
          $k@63@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@35@01 r))
  :pattern ((Set_in (inv@34@01 r) xs@28@01))
  :pattern ((Set_in (inv@64@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01))))
  :pattern ((img@65@01 r))
  :qid |qp.srp12|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@64@01 r) (Set_difference xs@28@01 (Set_singleton y@29@01)))
      (img@65@01 r)
      (= r (inv@64@01 r)))
    (= (- $k@63@01 (pTaken@66@01 r)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@67@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (< $Perm.No $k@33@01)
      false)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r))
  :qid |qp.fvfValDef13|)))
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(x.f, wildcard))
(declare-const x@68@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@68@01 xs@28@01))
(declare-const $k@69@01 $Perm)
(assert ($Perm.isReadVar $k@69@01))
(pop) ; 4
(declare-fun inv@70@01 ($Ref) $Ref)
(declare-fun img@71@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@69@01))
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@68@01 $Ref)) (!
  (=> (Set_in x@68@01 xs@28@01) (or (= $k@69@01 $Perm.No) (< $Perm.No $k@69@01)))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@68@01 $Ref) (x2@68@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@68@01 xs@28@01) (< $Perm.No $k@69@01))
      (and (Set_in x2@68@01 xs@28@01) (< $Perm.No $k@69@01))
      (= x1@68@01 x2@68@01))
    (= x1@68@01 x2@68@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@68@01 $Ref)) (!
  (=>
    (and (Set_in x@68@01 xs@28@01) (< $Perm.No $k@69@01))
    (and (= (inv@70@01 x@68@01) x@68@01) (img@71@01 x@68@01)))
  :pattern ((Set_in x@68@01 xs@28@01))
  :pattern ((inv@70@01 x@68@01))
  :pattern ((img@71@01 x@68@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (and (Set_in (inv@70@01 r) xs@28@01) (< $Perm.No $k@69@01)))
    (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@70@01 r) xs@28@01) (img@71@01 r) (= r (inv@70@01 r)))
    ($Perm.min
      (ite
        (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
        (- $k@33@01 (pTaken@66@01 r))
        $Perm.No)
      $k@69@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@69@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
          (- $k@33@01 (pTaken@66@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (<
        (ite
          (and (Set_in (inv@70@01 r) xs@28@01) (img@71@01 r) (= r (inv@70@01 r)))
          $k@69@01
          $Perm.No)
        (- $k@33@01 (pTaken@66@01 r)))
      (<
        (ite
          (and (Set_in (inv@70@01 r) xs@28@01) (img@71@01 r) (= r (inv@70@01 r)))
          $k@69@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@35@01 r))
  :pattern ((Set_in (inv@34@01 r) xs@28@01))
  :pattern ((Set_in (inv@70@01 r) xs@28@01))
  :pattern ((img@71@01 r))
  :qid |qp.srp14|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@70@01 r) xs@28@01) (img@71@01 r) (= r (inv@70@01 r)))
    (= (- $k@69@01 (pTaken@72@01 r)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@73@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (< $Perm.No (- $k@33@01 (pTaken@66@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r))
  :qid |qp.fvfValDef15|)))
(declare-const x@74@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@74@01 xs@28@01))
(declare-const $k@75@01 $Perm)
(assert ($Perm.isReadVar $k@75@01))
(pop) ; 4
(declare-fun inv@76@01 ($Ref) $Ref)
(declare-fun img@77@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@75@01))
; Nested auxiliary terms: non-globals
(push) ; 4
(assert (not (forall ((x@74@01 $Ref)) (!
  (=> (Set_in x@74@01 xs@28@01) (or (= $k@75@01 $Perm.No) (< $Perm.No $k@75@01)))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@74@01 $Ref) (x2@74@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@74@01 xs@28@01) (< $Perm.No $k@75@01))
      (and (Set_in x2@74@01 xs@28@01) (< $Perm.No $k@75@01))
      (= x1@74@01 x2@74@01))
    (= x1@74@01 x2@74@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@74@01 $Ref)) (!
  (=>
    (and (Set_in x@74@01 xs@28@01) (< $Perm.No $k@75@01))
    (and (= (inv@76@01 x@74@01) x@74@01) (img@77@01 x@74@01)))
  :pattern ((Set_in x@74@01 xs@28@01))
  :pattern ((inv@76@01 x@74@01))
  :pattern ((img@77@01 x@74@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@77@01 r)
      (and (Set_in (inv@76@01 r) xs@28@01) (< $Perm.No $k@75@01)))
    (= (inv@76@01 r) r))
  :pattern ((inv@76@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@76@01 r) xs@28@01) (img@77@01 r) (= r (inv@76@01 r)))
    ($Perm.min
      (ite
        (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
        (- (- $k@33@01 (pTaken@66@01 r)) (pTaken@72@01 r))
        $Perm.No)
      $k@75@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@75@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
          (- (- $k@33@01 (pTaken@66@01 r)) (pTaken@72@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (<
        (ite
          (and (Set_in (inv@76@01 r) xs@28@01) (img@77@01 r) (= r (inv@76@01 r)))
          $k@75@01
          $Perm.No)
        (- (- $k@33@01 (pTaken@66@01 r)) (pTaken@72@01 r)))
      (<
        (ite
          (and (Set_in (inv@76@01 r) xs@28@01) (img@77@01 r) (= r (inv@76@01 r)))
          $k@75@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@35@01 r))
  :pattern ((Set_in (inv@34@01 r) xs@28@01))
  :pattern ((Set_in (inv@76@01 r) xs@28@01))
  :pattern ((img@77@01 r))
  :qid |qp.srp16|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@76@01 r) xs@28@01) (img@77@01 r) (= r (inv@76@01 r)))
    (= (- $k@75@01 (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@79@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
      (< $Perm.No (- (- $k@33@01 (pTaken@66@01 r)) (pTaken@72@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@31@01)) r))
  :qid |qp.fvfValDef17|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 1 | y@29@01 in xs@28@01]
(assert (Set_in y@29@01 xs@28@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
