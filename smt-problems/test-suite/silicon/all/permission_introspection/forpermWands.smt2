(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:35
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permission_introspection/forpermWands.vpr
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
(declare-sort $MWSF 0)
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
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
    )))
; ////////// Symbols
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
; ---------- m1 ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const y@3@01 $Ref)
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
; inhale acc(x.f, write)
(declare-const $t@4@01 Int)
(assert (not (= x@2@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.f > 0
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] x.f > 0
(assert (> $t@4@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(x.f, write) --* acc(y.f, write)
(declare-const $t@6@01 $MWSF)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forperm
;     a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: a.f > 0)
; [eval] (forperm a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: a.f > 0)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | True]
; [eval] a.f > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [exec]
; apply acc(x.f, write) --* acc(y.f, write)
(assert (not (= y@3@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert (forperm
;     a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: false)
; [eval] (forperm a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: false)
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const x@7@01 $Ref)
(declare-const y@8@01 $Ref)
(declare-const z@9@01 $Ref)
(declare-const x@10@01 $Ref)
(declare-const y@11@01 $Ref)
(declare-const z@12@01 $Ref)
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
; inhale acc(x.f, write)
(declare-const $t@13@01 Int)
(assert (not (= x@10@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(y.f, write)
(declare-const $t@14@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@10@01 y@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@11@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(z.f, write)
(declare-const $t@15@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@11@01 z@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@10@01 z@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@12@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.f, write) --* acc(y.f, write)
(declare-const $t@16@01 $MWSF)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(z.f, write) --* acc(y.f, write)
(declare-const $t@17@01 $MWSF)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forperm
;     a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: a.f > 0 &&
;     b.f < 0)
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 $Snap.unit))
; [eval] (forperm a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: a.f > 0 && b.f < 0)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | True]
; [eval] a.f > 0 && b.f < 0
; [eval] a.f > 0
(push) ; 5
; [then-branch: 2 | !($t@15@01 > 0) | live]
; [else-branch: 2 | $t@15@01 > 0 | live]
(push) ; 6
; [then-branch: 2 | !($t@15@01 > 0)]
(assert (not (> $t@15@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | $t@15@01 > 0]
(assert (> $t@15@01 0))
; [eval] b.f < 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (> $t@15@01 0) (not (> $t@15@01 0))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (> $t@15@01 0) (not (> $t@15@01 0))))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | True]
; [eval] a.f > 0 && b.f < 0
; [eval] a.f > 0
(push) ; 5
; [then-branch: 4 | !($t@13@01 > 0) | live]
; [else-branch: 4 | $t@13@01 > 0 | live]
(push) ; 6
; [then-branch: 4 | !($t@13@01 > 0)]
(assert (not (> $t@13@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | $t@13@01 > 0]
(assert (> $t@13@01 0))
; [eval] b.f < 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (> $t@13@01 0) (not (> $t@13@01 0))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (> $t@13@01 0) (not (> $t@13@01 0))))
(assert (and (and (> $t@15@01 0) (< $t@14@01 0)) (and (> $t@13@01 0) (< $t@14@01 0))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x.f > 0
; [eval] x.f > 0
; [exec]
; assert y.f < 0
; [eval] y.f < 0
; [exec]
; inhale (forperm
;     a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: a == x)
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] (forperm a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: a == x)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | True]
; [eval] a == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | True]
; [eval] a == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (= z@12@01 x@10@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x == z
; [eval] x == z
(set-option :timeout 0)
(push) ; 3
(assert (not (= x@10@01 z@12@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@10@01 z@12@01))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const x@20@01 $Ref)
(declare-const y@21@01 $Ref)
(declare-const z@22@01 $Ref)
(declare-const x@23@01 $Ref)
(declare-const y@24@01 $Ref)
(declare-const z@25@01 $Ref)
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
; inhale (let p == (write) in acc(x.f, p)) --* acc(y.f, write)
(declare-const $t@26@01 $MWSF)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(y.f, write) --* acc(z.f, write)
(declare-const $t@27@01 $MWSF)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forperm
;     a: Ref, b: Ref [(let p == (write) in acc(a.f, p)) --* acc(b.f, write)] :: a ==
;     x &&
;     b == y)
; [eval] (forperm a: Ref, b: Ref [(let p == (write) in acc(a.f, p)) --* acc(b.f, write)] :: a == x && b == y)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | True | live]
; [else-branch: 7 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | True]
; [eval] a == x && b == y
; [eval] a == x
(push) ; 5
; [then-branch: 8 | False | live]
; [else-branch: 8 | True | live]
(push) ; 6
; [then-branch: 8 | False]
(assert false)
(pop) ; 6
(push) ; 6
; [else-branch: 8 | True]
; [eval] b == y
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
