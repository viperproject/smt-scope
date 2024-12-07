(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:04:21
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0463.vpr
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
(declare-sort Inverse_0 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Inverse_0To$Snap (Inverse_0) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_0 ($Snap) Inverse_0)
(assert (forall ((x Inverse_0)) (!
    (= x ($SortWrappers.$SnapToInverse_0($SortWrappers.Inverse_0To$Snap x)))
    :pattern (($SortWrappers.Inverse_0To$Snap x))
    :qid |$Snap.$SnapToInverse_0To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_0To$Snap($SortWrappers.$SnapToInverse_0 x)))
    :pattern (($SortWrappers.$SnapToInverse_0 x))
    :qid |$Snap.Inverse_0To$SnapToInverse_0|
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
(declare-fun inv_0<Ref> ($Ref) $Ref)
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
; ---------- m ----------
(declare-const s@0@01 Set<$Ref>)
(declare-const s@1@01 Set<$Ref>)
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
; inhale (forall r: Ref ::
;     { (r in s) }
;     { inv_0(r) }
;     (r in s) ==> true && inv_0(r) == r)
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } { inv_0(r) } (r in s) ==> true && inv_0(r) == r)
(declare-const r@3@01 $Ref)
(push) ; 3
; [eval] (r in s) ==> true && inv_0(r) == r
; [eval] (r in s)
(push) ; 4
; [then-branch: 0 | r@3@01 in s@1@01 | live]
; [else-branch: 0 | !(r@3@01 in s@1@01) | live]
(push) ; 5
; [then-branch: 0 | r@3@01 in s@1@01]
(assert (Set_in r@3@01 s@1@01))
; [eval] true && inv_0(r) == r
(push) ; 6
; [then-branch: 1 | False | live]
; [else-branch: 1 | True | live]
(push) ; 7
; [then-branch: 1 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 1 | True]
; [eval] inv_0(r) == r
; [eval] inv_0(r)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(r@3@01 in s@1@01)]
(assert (not (Set_in r@3@01 s@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@3@01 s@1@01)) (Set_in r@3@01 s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@3@01 $Ref)) (!
  (or (not (Set_in r@3@01 s@1@01)) (Set_in r@3@01 s@1@01))
  :pattern ((Set_in r@3@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0463.vpr@7@11@7@48-aux|)))
(assert (forall ((r@3@01 $Ref)) (!
  (or (not (Set_in r@3@01 s@1@01)) (Set_in r@3@01 s@1@01))
  :pattern ((inv_0<Ref> r@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0463.vpr@7@11@7@48-aux|)))
(assert (forall ((r@3@01 $Ref)) (!
  (=> (Set_in r@3@01 s@1@01) (= (inv_0<Ref> r@3@01) r@3@01))
  :pattern ((Set_in r@3@01 s@1@01))
  :pattern ((inv_0<Ref> r@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0463.vpr@7@11@7@48|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_0(r) } (inv_0(r) in s) ==> inv_0(r) == r)
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_0(r) } (inv_0(r) in s) ==> inv_0(r) == r)
(declare-const r@5@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_0(r) in s) ==> inv_0(r) == r
; [eval] (inv_0(r) in s)
; [eval] inv_0(r)
(push) ; 4
; [then-branch: 2 | inv_0[Ref](r@5@01) in s@1@01 | live]
; [else-branch: 2 | !(inv_0[Ref](r@5@01) in s@1@01) | live]
(push) ; 5
; [then-branch: 2 | inv_0[Ref](r@5@01) in s@1@01]
(assert (Set_in (inv_0<Ref> r@5@01) s@1@01))
; [eval] inv_0(r) == r
; [eval] inv_0(r)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(inv_0[Ref](r@5@01) in s@1@01)]
(assert (not (Set_in (inv_0<Ref> r@5@01) s@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_0<Ref> r@5@01) s@1@01))
  (Set_in (inv_0<Ref> r@5@01) s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@5@01 $Ref)) (!
  (or
    (not (Set_in (inv_0<Ref> r@5@01) s@1@01))
    (Set_in (inv_0<Ref> r@5@01) s@1@01))
  :pattern ((inv_0<Ref> r@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0463.vpr@7@11@7@48-aux|)))
(assert (forall ((r@5@01 $Ref)) (!
  (=> (Set_in (inv_0<Ref> r@5@01) s@1@01) (= (inv_0<Ref> r@5@01) r@5@01))
  :pattern ((inv_0<Ref> r@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0463.vpr@7@11@7@48|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_0(r) }
;     (inv_0(r) in s) ==> perm(r.f) >= write)
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_0(r) } (inv_0(r) in s) ==> perm(r.f) >= write)
(declare-const r@7@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_0(r) in s) ==> perm(r.f) >= write
; [eval] (inv_0(r) in s)
; [eval] inv_0(r)
(push) ; 4
; [then-branch: 3 | inv_0[Ref](r@7@01) in s@1@01 | live]
; [else-branch: 3 | !(inv_0[Ref](r@7@01) in s@1@01) | live]
(push) ; 5
; [then-branch: 3 | inv_0[Ref](r@7@01) in s@1@01]
(assert (Set_in (inv_0<Ref> r@7@01) s@1@01))
; [eval] perm(r.f) >= write
; [eval] perm(r.f)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(inv_0[Ref](r@7@01) in s@1@01)]
(assert (not (Set_in (inv_0<Ref> r@7@01) s@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_0<Ref> r@7@01) s@1@01))
  (Set_in (inv_0<Ref> r@7@01) s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@7@01 $Ref)) (!
  (or
    (not (Set_in (inv_0<Ref> r@7@01) s@1@01))
    (Set_in (inv_0<Ref> r@7@01) s@1@01))
  :pattern ((inv_0<Ref> r@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0463.vpr@7@11@7@48-aux|)))
(assert (forall ((r@7@01 $Ref)) (!
  (=> (Set_in (inv_0<Ref> r@7@01) s@1@01) false)
  :pattern ((inv_0<Ref> r@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0463.vpr@7@11@7@48|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
