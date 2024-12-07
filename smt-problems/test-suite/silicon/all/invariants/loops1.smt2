(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:49
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/invariants/loops1.vpr
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
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
(assert (not (= x@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(assert (= ($Snap.second $t@3@01) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@3@01)) $t@2@01))
(pop) ; 2
(push) ; 2
; [exec]
; var n1: Int
(declare-const n1@4@01 Int)
; [exec]
; var n2: Int
(declare-const n2@5@01 Int)
; Loop head block: Re-establish invariant
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@6@01 $Ref)
(declare-const x@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 Int)
(assert (not (= x@7@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@9@01)) $t@8@01))
(pop) ; 2
(push) ; 2
; [exec]
; var n1: Int
(declare-const n1@10@01 Int)
; [exec]
; var n2: Int
(declare-const n2@11@01 Int)
(declare-const n2@12@01 Int)
(declare-const n1@13@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@14@01 Int)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 4
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label lh1
; [exec]
; assert perm(x.f) == 1 / 2
; [eval] perm(x.f) == 1 / 2
; [eval] perm(x.f)
; Loop head block: Check well-definedness of edge conditions
; Loop head block: Follow loop-internal edges
(declare-const n2@15@01 Int)
(set-option :timeout 0)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@16@01 Int)
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 6
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label lh2
; [exec]
; assert perm(x.f) == 1 / 3
; [eval] perm(x.f) == 1 / 3
; [eval] perm(x.f)
; [exec]
; n2 := n2 + 1
; [eval] n2 + 1
(declare-const n2@17@01 Int)
(assert (= n2@17@01 (+ n2@15@01 1)))
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 7
; [eval] !(n2 == 0)
; [eval] n2 == 0
(pop) ; 7
(push) ; 7
; [eval] n2 == 0
(pop) ; 7
; Loop head block: Follow loop-internal edges
; [eval] !(n2 == 0)
; [eval] n2 == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (= n2@17@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= n2@17@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | n2@17@01 != 0 | live]
; [else-branch: 0 | n2@17@01 == 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 0 | n2@17@01 != 0]
(assert (not (= n2@17@01 0)))
; Loop head block: Re-establish invariant
(pop) ; 7
(push) ; 7
; [else-branch: 0 | n2@17@01 == 0]
(assert (= n2@17@01 0))
(pop) ; 7
(assert (= $t@16@01 $t@14@01))
; [eval] n2 == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= n2@17@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= n2@17@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | n2@17@01 == 0 | live]
; [else-branch: 1 | n2@17@01 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 1 | n2@17@01 == 0]
(assert (= n2@17@01 0))
; [exec]
; label afterl1
; [exec]
; assert perm(x.f) == 1 / 2
; [eval] perm(x.f) == 1 / 2
; [eval] perm(x.f)
; [exec]
; n1 := n1 + 1
; [eval] n1 + 1
(declare-const n1@18@01 Int)
(assert (= n1@18@01 (+ n1@13@01 1)))
; [eval] n1 != 0
(push) ; 8
(set-option :timeout 10)
(assert (not (= n1@18@01 0)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= n1@18@01 0))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | n1@18@01 != 0 | live]
; [else-branch: 2 | n1@18@01 == 0 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 2 | n1@18@01 != 0]
(assert (not (= n1@18@01 0)))
; Loop head block: Re-establish invariant
(pop) ; 8
(push) ; 8
; [else-branch: 2 | n1@18@01 == 0]
(assert (= n1@18@01 0))
(pop) ; 8
(assert (= $t@16@01 $t@8@01))
; [eval] !(n1 != 0)
; [eval] n1 != 0
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= n1@18@01 0))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= n1@18@01 0)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | n1@18@01 == 0 | live]
; [else-branch: 3 | n1@18@01 != 0 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 3 | n1@18@01 == 0]
(assert (= n1@18@01 0))
; [exec]
; assert n1 == 0
; [eval] n1 == 0
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(pop) ; 8
(push) ; 8
; [else-branch: 3 | n1@18@01 != 0]
(assert (not (= n1@18@01 0)))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 1 | n2@17@01 != 0]
(assert (not (= n2@17@01 0)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@19@01 $Ref)
(declare-const x@20@01 $Ref)
(push) ; 1
(declare-const $t@21@01 Int)
(assert (not (= x@20@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (= ($Snap.second $t@22@01) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@22@01)) $t@21@01))
(pop) ; 2
(push) ; 2
; [exec]
; var n1: Int
(declare-const n1@23@01 Int)
; [exec]
; var n2: Int
(declare-const n2@24@01 Int)
; Loop head block: Re-establish invariant
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
