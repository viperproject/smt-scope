(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permission_introspection/forpermFields.vpr
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
; ---------- noFields ----------
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
; var r1: Ref
(declare-const r1@0@01 $Ref)
; [exec]
; var r2: Ref
(declare-const r2@1@01 $Ref)
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f1 > 0)
; [eval] (forperm r: Ref [r.f1] :: r.f1 > 0)
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f1 > 0)
; [eval] (forperm r: Ref [r.f2] :: r.f1 > 0)
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f2 > 0)
; [eval] (forperm r: Ref [r.f1] :: r.f2 > 0)
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f2 > 0)
; [eval] (forperm r: Ref [r.f2] :: r.f2 > 0)
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f1 > 0 && r.f2 > 0)
; [eval] (forperm r: Ref [r.f1] :: r.f1 > 0 && r.f2 > 0)
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f1 > 0 && r.f2 > 0)
; [eval] (forperm r: Ref [r.f2] :: r.f1 > 0 && r.f2 > 0)
(pop) ; 2
(pop) ; 1
; ---------- noFields2 ----------
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
; var r1: Ref
(declare-const r1@2@01 $Ref)
; [exec]
; var r2: Ref
(declare-const r2@3@01 $Ref)
; [exec]
; inhale acc(r1.f3, write)
(declare-const $t@4@01 Int)
(assert (not (= r1@2@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f1 > 0)
; [eval] (forperm r: Ref [r.f1] :: r.f1 > 0)
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f1 > 0)
; [eval] (forperm r: Ref [r.f2] :: r.f1 > 0)
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f2 > 0)
; [eval] (forperm r: Ref [r.f1] :: r.f2 > 0)
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f2 > 0)
; [eval] (forperm r: Ref [r.f2] :: r.f2 > 0)
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f1 > 0 && r.f2 > 0)
; [eval] (forperm r: Ref [r.f1] :: r.f1 > 0 && r.f2 > 0)
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f1 > 0 && r.f2 > 0)
; [eval] (forperm r: Ref [r.f2] :: r.f1 > 0 && r.f2 > 0)
(pop) ; 2
(pop) ; 1
; ---------- permOnlyOneField ----------
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
; var r1: Ref
(declare-const r1@5@01 $Ref)
; [exec]
; var r2: Ref
(declare-const r2@6@01 $Ref)
; [exec]
; inhale acc(r1.f1, write) && r1.f1 > 0
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (not (= r1@5@01 $Ref.null)))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] r1.f1 > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f1 > 0)
; [eval] (forperm r: Ref [r.f1] :: r.f1 > 0)
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
; [eval] r.f1 > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f2 > 0)
; [eval] (forperm r: Ref [r.f2] :: r.f2 > 0)
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f1 > 0)
; [eval] (forperm r: Ref [r.f2] :: r.f1 > 0)
(pop) ; 2
(pop) ; 1
; ---------- permOnlyOneField1 ----------
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
; var r1: Ref
(declare-const r1@8@01 $Ref)
; [exec]
; var r2: Ref
(declare-const r2@9@01 $Ref)
; [exec]
; inhale acc(r1.f1, write) && r1.f1 > 0
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (not (= r1@8@01 $Ref.null)))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] r1.f1 > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f2 >= r.f2)
; [eval] (forperm r: Ref [r.f1] :: r.f2 >= r.f2)
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
; [eval] r.f2 >= r.f2
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
; [eval] (forperm r: Ref [r.f1] :: r.f2 >= r.f2)
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
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.f2 >= r.f2
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
; [eval] (forperm r: Ref [r.f1] :: r.f2 >= r.f2)
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
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.f2 >= r.f2
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
; [eval] (forperm r: Ref [r.f1] :: r.f2 >= r.f2)
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
; [then-branch: 4 | True | live]
; [else-branch: 4 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.f2 >= r.f2
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
; ---------- permOnlyOneField2 ----------
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
; var r1: Ref
(declare-const r1@11@01 $Ref)
; [exec]
; var r2: Ref
(declare-const r2@12@01 $Ref)
; [exec]
; inhale acc(r1.f1, write) && r1.f1 > 0
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (not (= r1@11@01 $Ref.null)))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; [eval] r1.f1 > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm r: Ref [r.f1] :: r.f1 > 0 && r.f2 >= r.f2)
; [eval] (forperm r: Ref [r.f1] :: r.f1 > 0 && r.f2 >= r.f2)
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
; [eval] r.f1 > 0 && r.f2 >= r.f2
; [eval] r.f1 > 0
(push) ; 5
; [then-branch: 6 | !(First:($t@13@01) > 0) | live]
; [else-branch: 6 | First:($t@13@01) > 0 | live]
(push) ; 6
; [then-branch: 6 | !(First:($t@13@01) > 0)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | First:($t@13@01) > 0]
; [eval] r.f2 >= r.f2
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
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0)))
; [exec]
; assert (forperm r: Ref [r.f2] :: r.f1 > 0 && r.f2 >= r.f2)
; [eval] (forperm r: Ref [r.f2] :: r.f1 > 0 && r.f2 >= r.f2)
(pop) ; 2
(pop) ; 1
; ---------- permCheck1 ----------
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
; var r1: Ref
(declare-const r1@14@01 $Ref)
; [exec]
; var r2: Ref
(declare-const r2@15@01 $Ref)
; [exec]
; assert (forperm r: Ref [r.f1] :: false)
; [eval] (forperm r: Ref [r.f1] :: false)
; [exec]
; assert (forperm r: Ref [r.f2] :: false)
; [eval] (forperm r: Ref [r.f2] :: false)
(pop) ; 2
(pop) ; 1
; ---------- permCheck2 ----------
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
; var r1: Ref
(declare-const r1@16@01 $Ref)
; [exec]
; var r2: Ref
(declare-const r2@17@01 $Ref)
; [exec]
; inhale acc(r1.f1, write)
(declare-const $t@18@01 Int)
(assert (not (= r1@16@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm r: Ref [r.f1] :: false)
; [eval] (forperm r: Ref [r.f1] :: false)
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
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not false))
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
; [eval] (forperm r: Ref [r.f1] :: false)
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
; [then-branch: 8 | True | live]
; [else-branch: 8 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not false))
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
; [eval] (forperm r: Ref [r.f1] :: false)
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
; [then-branch: 9 | True | live]
; [else-branch: 9 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not false))
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
; [eval] (forperm r: Ref [r.f1] :: false)
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
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- permCheck3 ----------
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
; var r1: Ref
(declare-const r1@19@01 $Ref)
; [exec]
; var r2: Ref
(declare-const r2@20@01 $Ref)
; [exec]
; inhale acc(r1.f1, write)
(declare-const $t@21@01 Int)
(assert (not (= r1@19@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r1.f1, write)
; [exec]
; assert (forperm r: Ref [r.f1] :: false)
; [eval] (forperm r: Ref [r.f1] :: false)
; [exec]
; assert (forperm r: Ref [r.f2] :: false)
; [eval] (forperm r: Ref [r.f2] :: false)
(pop) ; 2
(pop) ; 1
