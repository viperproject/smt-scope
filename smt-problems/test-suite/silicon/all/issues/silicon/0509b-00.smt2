(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0509b.vpr
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
; Declaring symbols related to program functions (from program analysis)
(declare-fun lookup2 ($Snap $Ref Int) Int)
(declare-fun lookup2%limited ($Snap $Ref Int) Int)
(declare-fun lookup2%stateless ($Ref Int) Bool)
(declare-fun lookup2%precondition ($Snap $Ref Int) Bool)
(declare-fun lookup ($Snap $Ref Int) Int)
(declare-fun lookup%limited ($Snap $Ref Int) Int)
(declare-fun lookup%stateless ($Ref Int) Bool)
(declare-fun lookup%precondition ($Snap $Ref Int) Bool)
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
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int)) (!
  (= (lookup2%limited s@$ r@0@00 i@1@00) (lookup2 s@$ r@0@00 i@1@00))
  :pattern ((lookup2 s@$ r@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int)) (!
  (lookup2%stateless r@0@00 i@1@00)
  :pattern ((lookup2%limited s@$ r@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@3@00 $Ref) (i@4@00 Int)) (!
  (= (lookup%limited s@$ r@3@00 i@4@00) (lookup s@$ r@3@00 i@4@00))
  :pattern ((lookup s@$ r@3@00 i@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@3@00 $Ref) (i@4@00 Int)) (!
  (lookup%stateless r@3@00 i@4@00)
  :pattern ((lookup%limited s@$ r@3@00 i@4@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- main ----------
(declare-const r1@0@01 $Ref)
(declare-const r2@1@01 $Ref)
(declare-const r1@2@01 $Ref)
(declare-const r2@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= r1@2@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@2@01 r2@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@3@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var s: Set[Ref]
(declare-const s@5@01 Set<$Ref>)
; [exec]
; inhale r1.f == 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] r1.f == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r1.f, write) && acc(r2.f, write)
; [exec]
; inhale acc(r1.f, write) && acc(r2.f, write)
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@2@01 r2@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale r1.f == 3
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] r1.f == 3
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; s := Set(r1, r2)
; [eval] Set(r1, r2)
(declare-const s@9@01 Set<$Ref>)
(assert (= s@9@01 (Set_unionone (Set_singleton r1@2@01) r2@3@01)))
; [exec]
; inhale lookup(r1, 5) > 3
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] lookup(r1, 5) > 3
; [eval] lookup(r1, 5)
(set-option :timeout 0)
(push) ; 3
(assert (lookup%precondition ($Snap.first $t@7@01) r1@2@01 5))
(pop) ; 3
; Joined path conditions
(assert (lookup%precondition ($Snap.first $t@7@01) r1@2@01 5))
(assert (> (lookup ($Snap.first $t@7@01) r1@2@01 5) 3))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label before
; [exec]
; exhale acc(r1.f, write) && acc(r2.f, write)
; [exec]
; inhale acc(r1.f, write) && acc(r2.f, write)
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@2@01 r2@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale r1.f == 4
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] r1.f == 4
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@11@01)) 4))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { old[before](lookup(r1, i)) }
;     lookup2(r1, i) == old[before](lookup(r1, i)))
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] (forall i: Int :: { old[before](lookup(r1, i)) } lookup2(r1, i) == old[before](lookup(r1, i)))
(declare-const i@14@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] lookup2(r1, i) == old[before](lookup(r1, i))
; [eval] lookup2(r1, i)
(push) ; 4
(assert (lookup2%precondition ($Snap.first $t@11@01) r1@2@01 i@14@01))
(pop) ; 4
; Joined path conditions
(assert (lookup2%precondition ($Snap.first $t@11@01) r1@2@01 i@14@01))
; [eval] old[before](lookup(r1, i))
; [eval] lookup(r1, i)
(push) ; 4
(assert (lookup%precondition ($Snap.first $t@7@01) r1@2@01 i@14@01))
(pop) ; 4
; Joined path conditions
(assert (lookup%precondition ($Snap.first $t@7@01) r1@2@01 i@14@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@01 Int)) (!
  (and
    (lookup2%precondition ($Snap.first $t@11@01) r1@2@01 i@14@01)
    (lookup%precondition ($Snap.first $t@7@01) r1@2@01 i@14@01))
  :pattern ((lookup%limited ($Snap.first $t@7@01) r1@2@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509b.vpr@27@10@27@102-aux|)))
(assert (forall ((i@14@01 Int)) (!
  (=
    (lookup2 ($Snap.first $t@11@01) r1@2@01 i@14@01)
    (lookup ($Snap.first $t@7@01) r1@2@01 i@14@01))
  :pattern ((lookup%limited ($Snap.first $t@7@01) r1@2@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509b.vpr@27@10@27@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(assert (lookup2%precondition ($Snap.first $t@11@01) r1@2@01 5))
(pop) ; 3
; Joined path conditions
(assert (lookup2%precondition ($Snap.first $t@11@01) r1@2@01 5))
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@11@01) r1@2@01 5) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (lookup2 ($Snap.first $t@11@01) r1@2@01 5) 2))
(pop) ; 2
(pop) ; 1
; ---------- main_fail_1 ----------
(declare-const r1@15@01 $Ref)
(declare-const r2@16@01 $Ref)
(declare-const r1@17@01 $Ref)
(declare-const r2@18@01 $Ref)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (not (= r1@17@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@17@01 r2@18@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@18@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var s: Set[Ref]
(declare-const s@20@01 Set<$Ref>)
; [exec]
; inhale r1.f == 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 $Snap.unit))
; [eval] r1.f == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@19@01)) 1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r1.f, write) && acc(r2.f, write)
; [exec]
; inhale acc(r1.f, write) && acc(r2.f, write)
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@17@01 r2@18@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale r1.f == 3
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] r1.f == 3
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; s := Set(r1, r2)
; [eval] Set(r1, r2)
(declare-const s@24@01 Set<$Ref>)
(assert (= s@24@01 (Set_unionone (Set_singleton r1@17@01) r2@18@01)))
; [exec]
; inhale lookup(r1, 5) > 3
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] lookup(r1, 5) > 3
; [eval] lookup(r1, 5)
(set-option :timeout 0)
(push) ; 3
(assert (lookup%precondition ($Snap.first $t@22@01) r1@17@01 5))
(pop) ; 3
; Joined path conditions
(assert (lookup%precondition ($Snap.first $t@22@01) r1@17@01 5))
(assert (> (lookup ($Snap.first $t@22@01) r1@17@01 5) 3))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label before
; [exec]
; exhale acc(r1.f, write) && acc(r2.f, write)
; [exec]
; inhale acc(r1.f, write) && acc(r2.f, write)
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@17@01 r2@18@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale r1.f == 4
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] r1.f == 4
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)) 4))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { lookup(r1, i) }
;     lookup2(r1, i) == old[before](lookup(r1, i)))
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] (forall i: Int :: { lookup(r1, i) } lookup2(r1, i) == old[before](lookup(r1, i)))
(declare-const i@29@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] lookup2(r1, i) == old[before](lookup(r1, i))
; [eval] lookup2(r1, i)
(push) ; 4
(assert (lookup2%precondition ($Snap.first $t@26@01) r1@17@01 i@29@01))
(pop) ; 4
; Joined path conditions
(assert (lookup2%precondition ($Snap.first $t@26@01) r1@17@01 i@29@01))
; [eval] old[before](lookup(r1, i))
; [eval] lookup(r1, i)
(push) ; 4
(assert (lookup%precondition ($Snap.first $t@22@01) r1@17@01 i@29@01))
(pop) ; 4
; Joined path conditions
(assert (lookup%precondition ($Snap.first $t@22@01) r1@17@01 i@29@01))
; [eval] lookup(r1, i)
(push) ; 4
(assert (lookup%precondition ($Snap.first $t@26@01) r1@17@01 i@29@01))
(pop) ; 4
; Joined path conditions
(assert (lookup%precondition ($Snap.first $t@26@01) r1@17@01 i@29@01))
(assert (lookup%precondition ($Snap.first $t@26@01) r1@17@01 i@29@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@29@01 Int)) (!
  (and
    (lookup2%precondition ($Snap.first $t@26@01) r1@17@01 i@29@01)
    (lookup%precondition ($Snap.first $t@22@01) r1@17@01 i@29@01)
    (lookup%precondition ($Snap.first $t@26@01) r1@17@01 i@29@01))
  :pattern ((lookup ($Snap.first $t@26@01) r1@17@01 i@29@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509b.vpr@46@10@46@89-aux|)))
(assert (forall ((i@29@01 Int)) (!
  (=
    (lookup2 ($Snap.first $t@26@01) r1@17@01 i@29@01)
    (lookup ($Snap.first $t@22@01) r1@17@01 i@29@01))
  :pattern ((lookup ($Snap.first $t@26@01) r1@17@01 i@29@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509b.vpr@46@10@46@89|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(assert (lookup2%precondition ($Snap.first $t@26@01) r1@17@01 5))
(pop) ; 3
; Joined path conditions
(assert (lookup2%precondition ($Snap.first $t@26@01) r1@17@01 5))
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@26@01) r1@17@01 5) 2)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@18@01 r1@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@26@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second $t@26@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@17@01 r2@18@01)) (not (= r2@18@01 r1@17@01))))
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@26@01) r1@17@01 5) 2)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@18@01 r1@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@26@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second $t@26@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@17@01 r2@18@01)) (not (= r2@18@01 r1@17@01))))
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@26@01) r1@17@01 5) 2)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@18@01 r1@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@26@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second $t@26@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@17@01 r2@18@01)) (not (= r2@18@01 r1@17@01))))
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@26@01) r1@17@01 5) 2)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- main_fail_2 ----------
(declare-const r1@30@01 $Ref)
(declare-const r2@31@01 $Ref)
(declare-const r1@32@01 $Ref)
(declare-const r2@33@01 $Ref)
(push) ; 1
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (not (= r1@32@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@32@01 r2@33@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@33@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var s: Set[Ref]
(declare-const s@35@01 Set<$Ref>)
; [exec]
; inhale r1.f == 1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] r1.f == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@34@01)) 1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r1.f, write) && acc(r2.f, write)
; [exec]
; inhale acc(r1.f, write) && acc(r2.f, write)
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@32@01 r2@33@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale r1.f == 3
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 $Snap.unit))
; [eval] r1.f == 3
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@37@01)) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; s := Set(r1, r2)
; [eval] Set(r1, r2)
(declare-const s@39@01 Set<$Ref>)
(assert (= s@39@01 (Set_unionone (Set_singleton r1@32@01) r2@33@01)))
; [exec]
; inhale lookup(r1, 5) > 3
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 $Snap.unit))
; [eval] lookup(r1, 5) > 3
; [eval] lookup(r1, 5)
(set-option :timeout 0)
(push) ; 3
(assert (lookup%precondition ($Snap.first $t@37@01) r1@32@01 5))
(pop) ; 3
; Joined path conditions
(assert (lookup%precondition ($Snap.first $t@37@01) r1@32@01 5))
(assert (> (lookup ($Snap.first $t@37@01) r1@32@01 5) 3))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label before
; [exec]
; exhale acc(r1.f, write) && acc(r2.f, write)
; [exec]
; inhale acc(r1.f, write) && acc(r2.f, write)
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 ($Snap.combine ($Snap.first $t@41@01) ($Snap.second $t@41@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@32@01 r2@33@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale r1.f == 4
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [eval] r1.f == 4
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@41@01)) 4))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { old(lookup(r1, i)) }
;     lookup2(r1, i) == old[before](lookup(r1, i)))
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 $Snap.unit))
; [eval] (forall i: Int :: { old(lookup(r1, i)) } lookup2(r1, i) == old[before](lookup(r1, i)))
(declare-const i@44@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] lookup2(r1, i) == old[before](lookup(r1, i))
; [eval] lookup2(r1, i)
(push) ; 4
(assert (lookup2%precondition ($Snap.first $t@41@01) r1@32@01 i@44@01))
(pop) ; 4
; Joined path conditions
(assert (lookup2%precondition ($Snap.first $t@41@01) r1@32@01 i@44@01))
; [eval] old[before](lookup(r1, i))
; [eval] lookup(r1, i)
(push) ; 4
(assert (lookup%precondition ($Snap.first $t@37@01) r1@32@01 i@44@01))
(pop) ; 4
; Joined path conditions
(assert (lookup%precondition ($Snap.first $t@37@01) r1@32@01 i@44@01))
; [eval] old(lookup(r1, i))
; [eval] lookup(r1, i)
(push) ; 4
(assert (lookup%precondition ($Snap.first $t@34@01) r1@32@01 i@44@01))
(pop) ; 4
; Joined path conditions
(assert (lookup%precondition ($Snap.first $t@34@01) r1@32@01 i@44@01))
(assert (lookup%precondition ($Snap.first $t@34@01) r1@32@01 i@44@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@44@01 Int)) (!
  (and
    (lookup2%precondition ($Snap.first $t@41@01) r1@32@01 i@44@01)
    (lookup%precondition ($Snap.first $t@37@01) r1@32@01 i@44@01)
    (lookup%precondition ($Snap.first $t@34@01) r1@32@01 i@44@01))
  :pattern ((lookup ($Snap.first $t@34@01) r1@32@01 i@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509b.vpr@66@10@66@94-aux|)))
(assert (forall ((i@44@01 Int)) (!
  (=
    (lookup2 ($Snap.first $t@41@01) r1@32@01 i@44@01)
    (lookup ($Snap.first $t@37@01) r1@32@01 i@44@01))
  :pattern ((lookup ($Snap.first $t@34@01) r1@32@01 i@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509b.vpr@66@10@66@94|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(assert (lookup2%precondition ($Snap.first $t@41@01) r1@32@01 5))
(pop) ; 3
; Joined path conditions
(assert (lookup2%precondition ($Snap.first $t@41@01) r1@32@01 5))
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@41@01) r1@32@01 5) 2)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@33@01 r1@32@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@32@01 r2@33@01)) (not (= r2@33@01 r1@32@01))))
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@41@01) r1@32@01 5) 2)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@33@01 r1@32@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@32@01 r2@33@01)) (not (= r2@33@01 r1@32@01))))
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@41@01) r1@32@01 5) 2)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@33@01 r1@32@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@32@01 r2@33@01)) (not (= r2@33@01 r1@32@01))))
; [eval] lookup2(r1, 5) > 2
; [eval] lookup2(r1, 5)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (lookup2 ($Snap.first $t@41@01) r1@32@01 5) 2)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
