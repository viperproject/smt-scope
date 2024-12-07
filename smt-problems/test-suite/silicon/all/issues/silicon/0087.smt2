(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:48
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0087.vpr
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
(declare-const b@0@01 Bool)
(declare-const b@1@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] b ==> true
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@1@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@1@01 | live]
; [else-branch: 0 | !(b@1@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b@1@01]
(assert b@1@01)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b@1@01)]
(assert (not b@1@01))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not b@1@01) b@1@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (b ? true : !b)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@1@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@1@01 | live]
; [else-branch: 1 | !(b@1@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | b@1@01]
(assert b@1@01)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(b@1@01)]
(assert (not b@1@01))
; [eval] !b
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (ite b@1@01 true (not b@1@01)))
(pop) ; 2
(push) ; 2
; [eval] (b ? b : true)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@1@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@1@01 | live]
; [else-branch: 2 | !(b@1@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | b@1@01]
(assert b@1@01)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(b@1@01)]
(assert (not b@1@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (ite b@1@01 b@1@01 true)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (ite b@1@01 b@1@01 true))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const b1@4@01 Bool)
(declare-const b2@5@01 Bool)
(declare-const x@6@01 $Ref)
(declare-const b1@7@01 Bool)
(declare-const b2@8@01 Bool)
(declare-const x@9@01 $Ref)
(push) ; 1
(push) ; 2
(set-option :timeout 10)
(assert (not (not b1@7@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not b1@7@01))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | b1@7@01 | live]
; [else-branch: 3 | !(b1@7@01) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 3 | b1@7@01]
(assert b1@7@01)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b2@8@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b2@8@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | b2@8@01 | live]
; [else-branch: 4 | !(b2@8@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | b2@8@01]
(assert b2@8@01)
(declare-const $t@10@01 Int)
(assert (not (= x@9@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@11@01 Int)
(pop) ; 4
(push) ; 4
; [eval] !b1 || !b2
; [eval] !b1
(push) ; 5
; [then-branch: 5 | !(b1@7@01) | live]
; [else-branch: 5 | b1@7@01 | live]
(push) ; 6
; [then-branch: 5 | !(b1@7@01)]
(assert (not b1@7@01))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | b1@7@01]
; [eval] !b2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or b1@7@01 (not b1@7@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (or (not b1@7@01) (not b2@8@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(b1@7@01) || !(b2@8@01) | dead]
; [else-branch: 6 | !(!(b1@7@01) || !(b2@8@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 6 | !(!(b1@7@01) || !(b2@8@01))]
(assert (not (or (not b1@7@01) (not b2@8@01))))
(pop) ; 5
; [eval] !(!b1 || !b2)
; [eval] !b1 || !b2
; [eval] !b1
(push) ; 5
; [then-branch: 7 | !(b1@7@01) | live]
; [else-branch: 7 | b1@7@01 | live]
(push) ; 6
; [then-branch: 7 | !(b1@7@01)]
(assert (not b1@7@01))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | b1@7@01]
; [eval] !b2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (or (not b1@7@01) (not b2@8@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (or (not b1@7@01) (not b2@8@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | !(!(b1@7@01) || !(b2@8@01)) | live]
; [else-branch: 8 | !(b1@7@01) || !(b2@8@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | !(!(b1@7@01) || !(b2@8@01))]
(assert (not (or (not b1@7@01) (not b2@8@01))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 4 | !(b2@8@01)]
(assert (not b2@8@01))
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@13@01 Int)
(assert (not (= x@9@01 $Ref.null)))
(pop) ; 4
(push) ; 4
; [eval] !b1 || !b2
; [eval] !b1
(push) ; 5
; [then-branch: 9 | !(b1@7@01) | live]
; [else-branch: 9 | b1@7@01 | live]
(push) ; 6
; [then-branch: 9 | !(b1@7@01)]
(assert (not b1@7@01))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | b1@7@01]
; [eval] !b2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or b1@7@01 (not b1@7@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (or (not b1@7@01) (not b2@8@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (or (not b1@7@01) (not b2@8@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | !(b1@7@01) || !(b2@8@01) | live]
; [else-branch: 10 | !(!(b1@7@01) || !(b2@8@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | !(b1@7@01) || !(b2@8@01)]
(assert (or (not b1@7@01) (not b2@8@01)))
; [exec]
; inhale acc(x.f, write)
(declare-const $t@14@01 Int)
(assert (not (= x@9@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 5
; [eval] !(!b1 || !b2)
; [eval] !b1 || !b2
; [eval] !b1
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | !(b1@7@01) | live]
; [else-branch: 11 | b1@7@01 | live]
(push) ; 6
; [then-branch: 11 | !(b1@7@01)]
(assert (not b1@7@01))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | b1@7@01]
; [eval] !b2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (or (not b1@7@01) (not b2@8@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | !(!(b1@7@01) || !(b2@8@01)) | dead]
; [else-branch: 12 | !(b1@7@01) || !(b2@8@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 12 | !(b1@7@01) || !(b2@8@01)]
(assert (or (not b1@7@01) (not b2@8@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 3 | !(b1@7@01)]
(assert (not b1@7@01))
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@16@01 Int)
(assert (not (= x@9@01 $Ref.null)))
(pop) ; 3
(push) ; 3
; [eval] !b1 || !b2
; [eval] !b1
(push) ; 4
; [then-branch: 13 | !(b1@7@01) | live]
; [else-branch: 13 | b1@7@01 | live]
(push) ; 5
; [then-branch: 13 | !(b1@7@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 13 | b1@7@01]
(assert b1@7@01)
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@7@01 (not b1@7@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not b1@7@01) (not b2@8@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not b1@7@01) (not b2@8@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | !(b1@7@01) || !(b2@8@01) | live]
; [else-branch: 14 | !(!(b1@7@01) || !(b2@8@01)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 14 | !(b1@7@01) || !(b2@8@01)]
(assert (or (not b1@7@01) (not b2@8@01)))
; [exec]
; inhale acc(x.f, write)
(declare-const $t@17@01 Int)
(assert (not (= x@9@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 4
; [eval] !(!b1 || !b2)
; [eval] !b1 || !b2
; [eval] !b1
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | !(b1@7@01) | live]
; [else-branch: 15 | b1@7@01 | live]
(push) ; 5
; [then-branch: 15 | !(b1@7@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 15 | b1@7@01]
(assert b1@7@01)
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not b1@7@01) (not b2@8@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | !(!(b1@7@01) || !(b2@8@01)) | dead]
; [else-branch: 16 | !(b1@7@01) || !(b2@8@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 16 | !(b1@7@01) || !(b2@8@01)]
(assert (or (not b1@7@01) (not b2@8@01)))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@18@01 $Ref)
(declare-const b@19@01 Bool)
(declare-const b1@20@01 Bool)
(declare-const b2@21@01 Bool)
(declare-const x@22@01 $Ref)
(declare-const b@23@01 Bool)
(declare-const b1@24@01 Bool)
(declare-const b2@25@01 Bool)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@23@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@23@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | b@23@01 | live]
; [else-branch: 17 | !(b@23@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | b@23@01]
(assert b@23@01)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@26@01 Int)
(assert (not (= x@22@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; test02(b1, b2, x)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@24@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@24@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | b1@24@01 | live]
; [else-branch: 18 | !(b1@24@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | b1@24@01]
(assert b1@24@01)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b2@25@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@25@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | b2@25@01 | live]
; [else-branch: 19 | !(b2@25@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | b2@25@01]
(assert b2@25@01)
(declare-const $t@27@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert acc(x.f, 1 / 2) && acc(x.f, 1 / 2)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 19 | !(b2@25@01)]
(assert (not b2@25@01))
(declare-const $t@28@01 Int)
(assert (= $t@26@01 $t@28@01))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
; [exec]
; assert acc(x.f, 1 / 2) && acc(x.f, 1 / 2)
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 18 | !(b1@24@01)]
(assert (not b1@24@01))
(declare-const $t@29@01 Int)
(assert (= $t@26@01 $t@29@01))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
; [exec]
; assert acc(x.f, 1 / 2) && acc(x.f, 1 / 2)
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 17 | !(b@23@01)]
(assert (not b@23@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@23@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@23@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | !(b@23@01) | live]
; [else-branch: 20 | b@23@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 20 | !(b@23@01)]
(assert (not b@23@01))
; [exec]
; inhale acc(x.f, 1 / 2) && acc(x.f, 1 / 2)
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (not (= x@22@01 $Ref.null)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@30@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@30@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; test02(b1, b2, x)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@24@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@24@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | b1@24@01 | live]
; [else-branch: 21 | !(b1@24@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | b1@24@01]
(assert b1@24@01)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b2@25@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@25@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | b2@25@01 | live]
; [else-branch: 22 | !(b2@25@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | b2@25@01]
(assert b2@25@01)
(declare-const $t@31@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert acc(x.f, 1 / 2) && acc(x.f, 1 / 2)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 22 | !(b2@25@01)]
(assert (not b2@25@01))
(declare-const $t@32@01 Int)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@30@01)) $t@32@01))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
; [exec]
; assert acc(x.f, 1 / 2) && acc(x.f, 1 / 2)
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 21 | !(b1@24@01)]
(assert (not b1@24@01))
(declare-const $t@33@01 Int)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@30@01)) $t@33@01))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
; [exec]
; assert acc(x.f, 1 / 2) && acc(x.f, 1 / 2)
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 20 | b@23@01]
(assert b@23@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
