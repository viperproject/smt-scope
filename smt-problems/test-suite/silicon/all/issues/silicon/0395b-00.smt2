(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:39
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0395b.vpr
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
(declare-sort $PSF<AWTwo> 0)
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
(declare-fun $SortWrappers.$PSF<AWTwo>To$Snap ($PSF<AWTwo>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<AWTwo> ($Snap) $PSF<AWTwo>)
(assert (forall ((x $PSF<AWTwo>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<AWTwo>($SortWrappers.$PSF<AWTwo>To$Snap x)))
    :pattern (($SortWrappers.$PSF<AWTwo>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<AWTwo>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<AWTwo>To$Snap($SortWrappers.$SnapTo$PSF<AWTwo> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<AWTwo> x))
    :qid |$Snap.$PSF<AWTwo>To$SnapTo$PSF<AWTwo>|
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
; /predicate_snap_functions_declarations.smt2 [AWTwo: Snap]
(declare-fun $PSF.domain_AWTwo ($PSF<AWTwo>) Set<$Snap>)
(declare-fun $PSF.lookup_AWTwo ($PSF<AWTwo> $Snap) $Snap)
(declare-fun $PSF.after_AWTwo ($PSF<AWTwo> $PSF<AWTwo>) Bool)
(declare-fun $PSF.loc_AWTwo ($Snap $Snap) Bool)
(declare-fun $PSF.perm_AWTwo ($PPM $Snap) $Perm)
(declare-const $psfTOP_AWTwo $PSF<AWTwo>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun AWTwo%trigger ($Snap Int Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [AWTwo: Snap]
(assert (forall ((vs $PSF<AWTwo>) (ws $PSF<AWTwo>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_AWTwo vs) ($PSF.domain_AWTwo ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_AWTwo vs))
            (= ($PSF.lookup_AWTwo vs x) ($PSF.lookup_AWTwo ws x)))
          :pattern (($PSF.lookup_AWTwo vs x) ($PSF.lookup_AWTwo ws x))
          :qid |qp.$PSF<AWTwo>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<AWTwo>To$Snap vs)
              ($SortWrappers.$PSF<AWTwo>To$Snap ws)
              )
    :qid |qp.$PSF<AWTwo>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_AWTwo pm s))
    :pattern (($PSF.perm_AWTwo pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_AWTwo f s) true)
    :pattern (($PSF.loc_AWTwo f s)))))
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
; ---------- test_AWTwo ----------
(declare-const last@0@01 Int)
(declare-const last@1@01 Int)
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
; inhale (forall s: Int, a: Int ::
;     { AWTwo(s, a) }
;     s <= last ==> acc(AWTwo(s, a), write))
(declare-const s@2@01 Int)
(declare-const a@3@01 Int)
(push) ; 3
; [eval] s <= last
(assert (<= s@2@01 last@1@01))
(declare-const sm@4@01 $PSF<AWTwo>)
(declare-const s@5@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@6@01 $PSF<AWTwo>)
(declare-fun inv@7@01 (Int Int) Int)
(declare-fun img@8@01 (Int Int) Bool)
(declare-fun inv@9@01 (Int Int) Int)
(declare-fun img@10@01 (Int Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@2@01 Int) (a1@3@01 Int) (s2@2@01 Int) (a2@3@01 Int)) (!
  (=>
    (and
      (<= s1@2@01 last@1@01)
      (<= s2@2@01 last@1@01)
      (and (= s1@2@01 s2@2@01) (= a1@3@01 a2@3@01)))
    (and (= s1@2@01 s2@2@01) (= a1@3@01 a2@3@01)))
  
  :qid |AWTwo-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@2@01 Int) (a@3@01 Int)) (!
  (=>
    (<= s@2@01 last@1@01)
    (and
      (and
        (= (inv@7@01 s@2@01 a@3@01) s@2@01)
        (= (inv@9@01 s@2@01 a@3@01) a@3@01))
      (and (img@8@01 s@2@01 a@3@01) (img@10@01 s@2@01 a@3@01))))
  :pattern (($PSF.loc_AWTwo ($PSF.lookup_AWTwo $t@6@01 ($Snap.combine
    ($SortWrappers.IntTo$Snap s@2@01)
    ($SortWrappers.IntTo$Snap a@3@01))) ($Snap.combine
    ($SortWrappers.IntTo$Snap s@2@01)
    ($SortWrappers.IntTo$Snap a@3@01))))
  :qid |quant-u-1|)))
(assert (forall ((sender Int) (amount Int)) (!
  (=>
    (and
      (and (img@8@01 sender amount) (img@10@01 sender amount))
      (<= (inv@7@01 sender amount) last@1@01))
    (and (= (inv@7@01 sender amount) sender) (= (inv@9@01 sender amount) amount)))
  :pattern ((inv@7@01 sender amount))
  :pattern ((inv@9@01 sender amount))
  :qid |AWTwo-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@11@01 $PSF<AWTwo>)
(declare-const s@12@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@12@01 $Snap)) (!
  (=>
    (and
      (and
        (img@8@01 ($SortWrappers.$SnapToInt ($Snap.first s@12@01)) ($SortWrappers.$SnapToInt ($Snap.second s@12@01)))
        (img@10@01 ($SortWrappers.$SnapToInt ($Snap.first s@12@01)) ($SortWrappers.$SnapToInt ($Snap.second s@12@01))))
      (<=
        (inv@7@01 ($SortWrappers.$SnapToInt ($Snap.first s@12@01)) ($SortWrappers.$SnapToInt ($Snap.second s@12@01)))
        last@1@01))
    (and
      (not (= s@12@01 $Snap.unit))
      (=
        ($PSF.lookup_AWTwo (as sm@11@01  $PSF<AWTwo>) s@12@01)
        ($PSF.lookup_AWTwo $t@6@01 s@12@01))))
  :pattern (($PSF.lookup_AWTwo (as sm@11@01  $PSF<AWTwo>) s@12@01))
  :pattern (($PSF.lookup_AWTwo $t@6@01 s@12@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@12@01 $Snap)) (!
  ($PSF.loc_AWTwo ($PSF.lookup_AWTwo $t@6@01 s@12@01) s@12@01)
  :pattern (($PSF.lookup_AWTwo (as sm@11@01  $PSF<AWTwo>) s@12@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((sender Int) (amount Int)) (!
  (=>
    (<= (inv@7@01 sender amount) last@1@01)
    ($PSF.loc_AWTwo ($PSF.lookup_AWTwo (as sm@11@01  $PSF<AWTwo>) ($Snap.combine
      ($SortWrappers.IntTo$Snap sender)
      ($SortWrappers.IntTo$Snap amount))) ($Snap.combine
      ($SortWrappers.IntTo$Snap sender)
      ($SortWrappers.IntTo$Snap amount))))
  :pattern ((inv@7@01 sender amount) (inv@9@01 sender amount))
  :qid |quant-u-2|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(AWTwo(last + 1, 0)) == none
; [eval] perm(AWTwo(last + 1, 0)) == none
; [eval] perm(AWTwo(last + 1, 0))
; [eval] last + 1
; Definitional axioms for snapshot map values
(declare-const pm@13@01 $PPM)
(assert (forall ((sender Int) (amount Int)) (!
  (=
    ($PSF.perm_AWTwo (as pm@13@01  $PPM) ($Snap.combine
      ($SortWrappers.IntTo$Snap sender)
      ($SortWrappers.IntTo$Snap amount)))
    (ite
      (and
        (and (img@8@01 sender amount) (img@10@01 sender amount))
        (<= (inv@7@01 sender amount) last@1@01))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_AWTwo (as pm@13@01  $PPM) ($Snap.combine
    ($SortWrappers.IntTo$Snap sender)
    ($SortWrappers.IntTo$Snap amount))))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((sender Int) (amount Int)) (!
  (and
    ($PSF.loc_AWTwo ($PSF.lookup_AWTwo (as sm@11@01  $PSF<AWTwo>) ($Snap.combine
      ($SortWrappers.IntTo$Snap sender)
      ($SortWrappers.IntTo$Snap amount))) ($Snap.combine
      ($SortWrappers.IntTo$Snap sender)
      ($SortWrappers.IntTo$Snap amount)))
    ($PSF.loc_AWTwo ($PSF.lookup_AWTwo $t@6@01 ($Snap.combine
      ($SortWrappers.IntTo$Snap sender)
      ($SortWrappers.IntTo$Snap amount))) ($Snap.combine
      ($SortWrappers.IntTo$Snap sender)
      ($SortWrappers.IntTo$Snap amount))))
  :pattern (($PSF.perm_AWTwo (as pm@13@01  $PPM) ($Snap.combine
    ($SortWrappers.IntTo$Snap sender)
    ($SortWrappers.IntTo$Snap amount))))
  :qid |qp.resTrgDef4|)))
(assert ($PSF.loc_AWTwo ($PSF.lookup_AWTwo (as sm@11@01  $PSF<AWTwo>) ($Snap.combine
  ($SortWrappers.IntTo$Snap (+ last@1@01 1))
  ($SortWrappers.IntTo$Snap 0))) ($Snap.combine
  ($SortWrappers.IntTo$Snap (+ last@1@01 1))
  ($SortWrappers.IntTo$Snap 0))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_AWTwo (as pm@13@01  $PPM) ($Snap.combine
    ($SortWrappers.IntTo$Snap (+ last@1@01 1))
    ($SortWrappers.IntTo$Snap 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_AWTwo (as pm@13@01  $PPM) ($Snap.combine
    ($SortWrappers.IntTo$Snap (+ last@1@01 1))
    ($SortWrappers.IntTo$Snap 0)))
  $Perm.No))
(pop) ; 2
(pop) ; 1
