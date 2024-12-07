(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:49
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permissions/forperm.vpr
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
; ////////// Symbols
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
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const b@1@01 Bool)
(declare-const x@2@01 $Ref)
(declare-const b@3@01 Bool)
(set-option :timeout 0)
(push) ; 1
; [eval] (b ? write : none)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@3@01 | live]
; [else-branch: 0 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b@3@01]
(assert b@3@01)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b@3@01)]
(assert (not b@3@01))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not b@3@01) b@3@01))
(push) ; 2
(assert (not (or (= (ite b@3@01 $Perm.Write $Perm.No) $Perm.No) b@3@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $t@4@01 Int)
(assert (<= $Perm.No (ite b@3@01 $Perm.Write $Perm.No)))
(assert (<= (ite b@3@01 $Perm.Write $Perm.No) $Perm.Write))
(assert (=> b@3@01 (not (= x@2@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert b || (forperm y: Ref [y.f] :: false)
; [eval] b || (forperm y: Ref [y.f] :: false)
(push) ; 3
; [then-branch: 1 | b@3@01 | live]
; [else-branch: 1 | !(b@3@01) | live]
(push) ; 4
; [then-branch: 1 | b@3@01]
(assert b@3@01)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(b@3@01)]
(assert (not b@3@01))
; [eval] (forperm y: Ref [y.f] :: false)
(push) ; 5
; [then-branch: 2 | b@3@01 | dead]
; [else-branch: 2 | !(b@3@01) | live]
(push) ; 6
; [else-branch: 2 | !(b@3@01)]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
; [exec]
; assert (forperm y: Ref [y.f] :: false) ==> (forperm y: Ref [y.f] :: true)
; [eval] (forperm y: Ref [y.f] :: false) ==> (forperm y: Ref [y.f] :: true)
; [eval] (forperm y: Ref [y.f] :: false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | b@3@01 | live]
; [else-branch: 3 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | b@3@01]
(assert b@3@01)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(b@3@01)]
(assert (not b@3@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (=> b@3@01 false))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=> b@3@01 false)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | b@3@01 ==> False | live]
; [else-branch: 4 | !(b@3@01 ==> False) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | b@3@01 ==> False]
(assert (=> b@3@01 false))
; [eval] (forperm y: Ref [y.f] :: true)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | b@3@01 | dead]
; [else-branch: 5 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 5 | !(b@3@01)]
(assert (not b@3@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (not b@3@01))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(b@3@01 ==> False)]
(assert (not (=> b@3@01 false)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> (=> b@3@01 false) (and (=> b@3@01 false) (not b@3@01))))
; Joined path conditions
(assert (or (not (=> b@3@01 false)) (=> b@3@01 false)))
; [exec]
; assert (forperm y: Ref [y.f] :: false) ==> !b
; [eval] (forperm y: Ref [y.f] :: false) ==> !b
; [eval] (forperm y: Ref [y.f] :: false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | b@3@01 | live]
; [else-branch: 6 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | b@3@01]
(assert b@3@01)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(b@3@01)]
(assert (not b@3@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (=> b@3@01 false))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=> b@3@01 false)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | b@3@01 ==> False | live]
; [else-branch: 7 | !(b@3@01 ==> False) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | b@3@01 ==> False]
(assert (=> b@3@01 false))
; [eval] !b
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(b@3@01 ==> False)]
(assert (not (=> b@3@01 false)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> (and (=> b@3@01 false) b@3@01) false))
; Joined path conditions
(push) ; 3
(assert (not (=> (=> b@3@01 false) (not b@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (=> b@3@01 false) (not b@3@01)))
; [exec]
; assert (forperm y: Ref [y.f] :: false)
; [eval] (forperm y: Ref [y.f] :: false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b@3@01 | live]
; [else-branch: 8 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | b@3@01]
(assert b@3@01)
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(b@3@01)]
(assert (not b@3@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> b@3@01 false)))
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
; [eval] (forperm y: Ref [y.f] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | b@3@01 | live]
; [else-branch: 9 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | b@3@01]
(assert b@3@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 9 | !(b@3@01)]
(assert (not b@3@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> b@3@01 false)))
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
; [eval] (forperm y: Ref [y.f] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | b@3@01 | live]
; [else-branch: 10 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | b@3@01]
(assert b@3@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 10 | !(b@3@01)]
(assert (not b@3@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> b@3@01 false)))
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
; [eval] (forperm y: Ref [y.f] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b@3@01 | live]
; [else-branch: 11 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | b@3@01]
(assert b@3@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(b@3@01)]
(assert (not b@3@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> b@3@01 false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test01b ----------
(declare-const x@5@01 $Ref)
(declare-const b@6@01 Bool)
(declare-const x@7@01 $Ref)
(declare-const b@8@01 Bool)
(push) ; 1
(push) ; 2
(set-option :timeout 10)
(assert (not (not b@8@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not b@8@01))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | b@8@01 | live]
; [else-branch: 12 | !(b@8@01) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 12 | b@8@01]
(assert b@8@01)
(declare-const $t@9@01 Int)
(assert (not (= x@7@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
(push) ; 3
; [exec]
; assert b || (forperm y: Ref [y.f] :: false)
; [eval] b || (forperm y: Ref [y.f] :: false)
(push) ; 4
; [then-branch: 13 | b@8@01 | live]
; [else-branch: 13 | !(b@8@01) | live]
(push) ; 5
; [then-branch: 13 | b@8@01]
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(b@8@01)]
(assert (not b@8@01))
; [eval] (forperm y: Ref [y.f] :: false)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | True | dead]
; [else-branch: 14 | False | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 14 | False]
(assert false)
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert false)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b@8@01) false))
(assert (or (not b@8@01) b@8@01))
; [exec]
; assert (forperm y: Ref [y.f] :: false) ==> (forperm y: Ref [y.f] :: true)
; [eval] (forperm y: Ref [y.f] :: false) ==> (forperm y: Ref [y.f] :: true)
; [eval] (forperm y: Ref [y.f] :: false)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | True | live]
; [else-branch: 15 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
; [then-branch: 16 | False | dead]
; [else-branch: 16 | True | live]
(push) ; 5
; [else-branch: 16 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert (forperm y: Ref [y.f] :: false) ==> !b
; [eval] (forperm y: Ref [y.f] :: false) ==> !b
; [eval] (forperm y: Ref [y.f] :: false)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | True | live]
; [else-branch: 17 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
; [then-branch: 18 | False | dead]
; [else-branch: 18 | True | live]
(push) ; 5
; [else-branch: 18 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert (forperm y: Ref [y.f] :: false)
; [eval] (forperm y: Ref [y.f] :: false)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | True | live]
; [else-branch: 19 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm y: Ref [y.f] :: false)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 20 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm y: Ref [y.f] :: false)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm y: Ref [y.f] :: false)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@10@01 $Ref)
(declare-const b1@11@01 Bool)
(declare-const b2@12@01 Bool)
(declare-const x@13@01 $Ref)
(declare-const b1@14@01 Bool)
(declare-const b2@15@01 Bool)
(push) ; 1
(declare-const $t@16@01 Int)
(assert (not (= x@13@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forperm y: Ref [y.f] :: y != null)
; [eval] (forperm y: Ref [y.f] :: y != null)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | True]
; [eval] y != null
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [exec]
; assert (forperm y: Ref [y.g] :: y != null)
; [eval] (forperm y: Ref [y.g] :: y != null)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@17@01 $Ref)
(declare-const b1@18@01 Bool)
(declare-const b2@19@01 Bool)
(declare-const x@20@01 $Ref)
(declare-const b1@21@01 Bool)
(declare-const b2@22@01 Bool)
(push) ; 1
(declare-const $t@23@01 Int)
(assert (not (= x@20@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a1: Int
(declare-const a1@24@01 Int)
; [exec]
; a1 := x.f
; [exec]
; inhale acc(x.f, 4 / 5)
(declare-const $t@25@01 Int)
(assert (= $t@23@01 $t@25@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; x.f := a1 + 1
; [eval] a1 + 1
(declare-const f@26@01 Int)
(assert (= f@26@01 (+ $t@23@01 1)))
; [exec]
; assert (forperm y: Ref [y.g] :: y.f > a1)
; [eval] (forperm y: Ref [y.g] :: y.f > a1)
; [exec]
; assert (forperm y: Ref [y.f] :: y.g > y.g - 1)
; [eval] (forperm y: Ref [y.f] :: y.g > y.g - 1)
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
; [then-branch: 24 | True | live]
; [else-branch: 24 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 24 | True]
; [eval] y.g > y.g - 1
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm y: Ref [y.f] :: y.g > y.g - 1)
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
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y.g > y.g - 1
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm y: Ref [y.f] :: y.g > y.g - 1)
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
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 26 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y.g > y.g - 1
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm y: Ref [y.f] :: y.g > y.g - 1)
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
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 27 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y.g > y.g - 1
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@27@01 $Ref)
(declare-const b1@28@01 Bool)
(declare-const b2@29@01 Bool)
(declare-const x@30@01 $Ref)
(declare-const b1@31@01 Bool)
(declare-const b2@32@01 Bool)
(push) ; 1
(declare-const $t@33@01 Int)
(assert (not (= x@30@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a1: Int
(declare-const a1@34@01 Int)
; [exec]
; a1 := x.f
; [exec]
; inhale acc(x.f, 4 / 5)
(declare-const $t@35@01 Int)
(assert (= $t@33@01 $t@35@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; x.f := a1 + 1
; [eval] a1 + 1
(declare-const f@36@01 Int)
(assert (= f@36@01 (+ $t@33@01 1)))
; [exec]
; assert (forperm y: Ref [y.f] :: y.f > a1)
; [eval] (forperm y: Ref [y.f] :: y.f > a1)
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
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 28 | True]
; [eval] y.f > a1
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> f@36@01 $t@33@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> f@36@01 $t@33@01))
; [exec]
; assert (forperm y: Ref [y.f] :: y.f > old(y.f))
; [eval] (forperm y: Ref [y.f] :: y.f > old(y.f))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 29 | True]
; [eval] y.f > old(y.f)
; [eval] old(y.f)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [exec]
; assert (forperm y: Ref [y.f] :: old(y.f) <= old(y.f))
; [eval] (forperm y: Ref [y.f] :: old(y.f) <= old(y.f))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | True | live]
; [else-branch: 30 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 30 | True]
; [eval] old(y.f) <= old(y.f)
; [eval] old(y.f)
; [eval] old(y.f)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [exec]
; assert (forperm y: Ref [y.g] :: old(y.f) <= old(y.f))
; [eval] (forperm y: Ref [y.g] :: old(y.f) <= old(y.f))
(pop) ; 2
(pop) ; 1
