(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:45
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/new.vpr
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
(declare-fun Node_P%trigger ($Snap $Ref) Bool)
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
; ---------- t1 ----------
(declare-const this@0@01 $Ref)
(declare-const a@1@01 Int)
(declare-const b@2@01 Bool)
(declare-const g@3@01 $Ref)
(declare-const c@4@01 Bool)
(declare-const d@5@01 Int)
(declare-const this@6@01 $Ref)
(declare-const a@7@01 Int)
(declare-const b@8@01 Bool)
(declare-const g@9@01 $Ref)
(declare-const c@10@01 Bool)
(declare-const d@11@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.first $t@12@01) $Snap.unit))
(assert b@8@01)
(assert (not (= this@6@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] d == 1 || d == 2
; [eval] d == 1
(push) ; 3
; [then-branch: 0 | d@11@01 == 1 | live]
; [else-branch: 0 | d@11@01 != 1 | live]
(push) ; 4
; [then-branch: 0 | d@11@01 == 1]
(assert (= d@11@01 1))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | d@11@01 != 1]
(assert (not (= d@11@01 1)))
; [eval] d == 2
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (= d@11@01 1)) (= d@11@01 1)))
(assert (or (= d@11@01 1) (= d@11@01 2)))
(pop) ; 2
(push) ; 2
; [exec]
; var e: Int
(declare-const e@14@01 Int)
; [exec]
; var f1: Ref
(declare-const f1@15@01 $Ref)
; [exec]
; var f2: Ref
(declare-const f2@16@01 $Ref)
; [exec]
; this.value := 1
; [exec]
; f1 := new()
(declare-const f1@17@01 $Ref)
(assert (not (= f1@17@01 $Ref.null)))
(assert (not (= f1@17@01 f1@15@01)))
(assert (not (= f1@17@01 g@9@01)))
(assert (not (= f1@17@01 this@6@01)))
(assert (not (= f1@17@01 f2@16@01)))
; [exec]
; f2 := new()
(declare-const f2@18@01 $Ref)
(assert (not (= f2@18@01 $Ref.null)))
(assert (not (= f2@18@01 f1@17@01)))
(assert (not (= f2@18@01 g@9@01)))
(assert (not (= f2@18@01 this@6@01)))
(assert (not (= f2@18@01 f2@16@01)))
; [eval] g != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= g@9@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= g@9@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | g@9@01 != Null | live]
; [else-branch: 1 | g@9@01 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | g@9@01 != Null]
(assert (not (= g@9@01 $Ref.null)))
; [exec]
; exhale g != f1
; [eval] g != f1
(push) ; 4
(assert (not (not (= g@9@01 f1@17@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= g@9@01 f1@17@01)))
; [exec]
; exhale this.value <= 42
; [eval] this.value <= 42
; [exec]
; exhale f1 != f2
; [eval] f1 != f2
(push) ; 4
(assert (not (not (= f1@17@01 f2@18@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= f1@17@01 f2@18@01)))
; [exec]
; inhale a == -11
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] a == -11
; [eval] -11
(assert (= a@7@01 (- 0 11)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale a < 0
; [eval] a < 0
(set-option :timeout 0)
(push) ; 4
(assert (not (< a@7@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< a@7@01 0))
; [exec]
; d := 2
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@8@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@8@01 | live]
; [else-branch: 2 | !(b@8@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | b@8@01]
; [exec]
; d := 1
; [eval] d == 1 || d == 2
; [eval] d == 1
(pop) ; 4
; [eval] !b
; [then-branch: 3 | !(b@8@01) | dead]
; [else-branch: 3 | b@8@01 | live]
(push) ; 4
; [else-branch: 3 | b@8@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 1 | g@9@01 == Null]
(assert (= g@9@01 $Ref.null))
(pop) ; 3
; [eval] !(g != null)
; [eval] g != null
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= g@9@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= g@9@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | g@9@01 == Null | live]
; [else-branch: 4 | g@9@01 != Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | g@9@01 == Null]
(assert (= g@9@01 $Ref.null))
; [exec]
; exhale this.value <= 42
; [eval] this.value <= 42
; [exec]
; exhale f1 != f2
; [eval] f1 != f2
(push) ; 4
(assert (not (not (= f1@17@01 f2@18@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= f1@17@01 f2@18@01)))
; [exec]
; inhale a == -11
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] a == -11
; [eval] -11
(assert (= a@7@01 (- 0 11)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale a < 0
; [eval] a < 0
(set-option :timeout 0)
(push) ; 4
(assert (not (< a@7@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< a@7@01 0))
; [exec]
; d := 2
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@8@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | b@8@01 | live]
; [else-branch: 5 | !(b@8@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | b@8@01]
; [exec]
; d := 1
; [eval] d == 1 || d == 2
; [eval] d == 1
(pop) ; 4
; [eval] !b
; [then-branch: 6 | !(b@8@01) | dead]
; [else-branch: 6 | b@8@01 | live]
(push) ; 4
; [else-branch: 6 | b@8@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 4 | g@9@01 != Null]
(assert (not (= g@9@01 $Ref.null)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(declare-const a@21@01 $Ref)
(declare-const b@22@01 $Ref)
(declare-const a@23@01 $Ref)
(declare-const b@24@01 $Ref)
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
; var l1: Ref
(declare-const l1@25@01 $Ref)
; [exec]
; var l2: Ref
(declare-const l2@26@01 $Ref)
; [exec]
; l1 := new()
(declare-const l1@27@01 $Ref)
(assert (not (= l1@27@01 $Ref.null)))
(assert (not (= l1@27@01 l1@25@01)))
(assert (not (= l1@27@01 l2@26@01)))
(assert (not (= l1@27@01 a@23@01)))
(assert (not (= l1@27@01 b@24@01)))
; [exec]
; l2 := new()
(declare-const l2@28@01 $Ref)
(assert (not (= l2@28@01 $Ref.null)))
(assert (not (= l2@28@01 l2@26@01)))
(assert (not (= l2@28@01 a@23@01)))
(assert (not (= l2@28@01 b@24@01)))
(assert (not (= l2@28@01 l1@27@01)))
; [exec]
; exhale a != l1
; [eval] a != l1
(push) ; 3
(assert (not (not (= a@23@01 l1@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= a@23@01 l1@27@01)))
; [exec]
; exhale l1 != l2
; [eval] l1 != l2
(push) ; 3
(assert (not (not (= l1@27@01 l2@28@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= l1@27@01 l2@28@01)))
; [exec]
; exhale a != b
; [eval] a != b
(push) ; 3
(assert (not (not (= a@23@01 b@24@01))))
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
; [eval] a != b
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= a@23@01 b@24@01))))
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
; [eval] a != b
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= a@23@01 b@24@01))))
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
; [eval] a != b
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= a@23@01 b@24@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- t3 ----------
(declare-const a@29@01 $Ref)
(declare-const b@30@01 $Ref)
(declare-const a@31@01 $Ref)
(declare-const b@32@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] a == null
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= a@31@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@31@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | a@31@01 == Null | live]
; [else-branch: 7 | a@31@01 != Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | a@31@01 == Null]
(assert (= a@31@01 $Ref.null))
; [eval] b != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= b@32@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= b@32@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b@32@01 != Null | live]
; [else-branch: 8 | b@32@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | b@32@01 != Null]
(assert (not (= b@32@01 $Ref.null)))
; [exec]
; exhale a != b
; [eval] a != b
(push) ; 5
(assert (not (not (= a@31@01 b@32@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= a@31@01 b@32@01)))
; [exec]
; exhale a != b
; [eval] a != b
(pop) ; 4
(push) ; 4
; [else-branch: 8 | b@32@01 == Null]
(assert (= b@32@01 $Ref.null))
(pop) ; 4
; [eval] !(b != null)
; [eval] b != null
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= b@32@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= b@32@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | b@32@01 == Null | live]
; [else-branch: 9 | b@32@01 != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | b@32@01 == Null]
(assert (= b@32@01 $Ref.null))
; [exec]
; exhale a != b
; [eval] a != b
(push) ; 5
(assert (not (not (= a@31@01 b@32@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a != b
(set-option :timeout 0)
(push) ; 5
(assert (not (not (= a@31@01 b@32@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a != b
(set-option :timeout 0)
(push) ; 5
(assert (not (not (= a@31@01 b@32@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a != b
(set-option :timeout 0)
(push) ; 5
(assert (not (not (= a@31@01 b@32@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t4 ----------
(declare-const a@33@01 $Ref)
(declare-const b@34@01 $Ref)
(declare-const a@35@01 $Ref)
(declare-const b@36@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] a == null
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= a@35@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@35@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | a@35@01 == Null | live]
; [else-branch: 10 | a@35@01 != Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | a@35@01 == Null]
(assert (= a@35@01 $Ref.null))
; [eval] b != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= b@36@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= b@36@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b@36@01 != Null | live]
; [else-branch: 11 | b@36@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | b@36@01 != Null]
(assert (not (= b@36@01 $Ref.null)))
; [exec]
; exhale a != b
; [eval] a != b
(push) ; 5
(assert (not (not (= a@35@01 b@36@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= a@35@01 b@36@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | b@36@01 == Null]
(assert (= b@36@01 $Ref.null))
(pop) ; 4
; [eval] !(b != null)
; [eval] b != null
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= b@36@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= b@36@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | b@36@01 == Null | live]
; [else-branch: 12 | b@36@01 != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | b@36@01 == Null]
(assert (= b@36@01 $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | b@36@01 != Null]
(assert (not (= b@36@01 $Ref.null)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 10 | a@35@01 != Null]
(assert (not (= a@35@01 $Ref.null)))
(pop) ; 3
; [eval] !(a == null)
; [eval] a == null
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@35@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= a@35@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | a@35@01 != Null | live]
; [else-branch: 13 | a@35@01 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | a@35@01 != Null]
(assert (not (= a@35@01 $Ref.null)))
(pop) ; 3
(push) ; 3
; [else-branch: 13 | a@35@01 == Null]
(assert (= a@35@01 $Ref.null))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const n@37@01 $Ref)
(declare-const n@38@01 $Ref)
(push) ; 1
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
(assert (= ($Snap.first $t@39@01) $Snap.unit))
; [eval] n != null
(assert (not (= n@38@01 $Ref.null)))
(declare-const $k@40@01 $Perm)
(assert ($Perm.isReadVar $k@40@01))
(assert (<= $Perm.No $k@40@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var m: Ref
(declare-const m@41@01 $Ref)
; [exec]
; m := new()
(declare-const m@42@01 $Ref)
(assert (not (= m@42@01 $Ref.null)))
(assert (not (= m@42@01 m@41@01)))
(assert (not (= m@42@01 n@38@01)))
; [exec]
; assert m != null
; [eval] m != null
; [exec]
; assert m != n
; [eval] m != n
; [exec]
; unfold acc(Node_P(n), wildcard)
(declare-const $k@43@01 $Perm)
(assert ($Perm.isReadVar $k@43@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@40@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@43@01 $k@40@01))
(assert (<= $Perm.No (- $k@40@01 $k@43@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@39@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@39@01))
    ($Snap.second ($Snap.second $t@39@01)))))
(assert (<= $Perm.No $k@43@01))
(assert (<= $k@43@01 $Perm.Write))
(assert (=> (< $Perm.No $k@43@01) (not (= n@38@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@39@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@39@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))
; [eval] this.Node_n != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
  $Ref.null)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:(Second:($t@39@01))) != Null | live]
; [else-branch: 14 | First:(Second:(Second:($t@39@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | First:(Second:(Second:($t@39@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
    $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  n@38@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Node_P%trigger ($Snap.second $t@39@01) n@38@01))
; [exec]
; assert m != n.Node_n
; [eval] m != n.Node_n
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    m@42@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
  n@38@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@40@01 $k@43@01)) (< $Perm.No $k@43@01))
  (not
    (=
      ($Snap.second $t@39@01)
      ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@43@01) (< $Perm.No (- $k@40@01 $k@43@01)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second $t@39@01)))
      ($Snap.second $t@39@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      n@38@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
      n@38@01))))
; [eval] m != n.Node_n
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    m@42@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
  n@38@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@40@01 $k@43@01)) (< $Perm.No $k@43@01))
  (not
    (=
      ($Snap.second $t@39@01)
      ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@43@01) (< $Perm.No (- $k@40@01 $k@43@01)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second $t@39@01)))
      ($Snap.second $t@39@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      n@38@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
      n@38@01))))
; [eval] m != n.Node_n
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    m@42@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
  n@38@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@40@01 $k@43@01)) (< $Perm.No $k@43@01))
  (not
    (=
      ($Snap.second $t@39@01)
      ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@43@01) (< $Perm.No (- $k@40@01 $k@43@01)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second $t@39@01)))
      ($Snap.second $t@39@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      n@38@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
      n@38@01))))
; [eval] m != n.Node_n
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    m@42@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test6 ----------
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
; var m: Ref
(declare-const m@44@01 $Ref)
; [exec]
; m := new(value, Node_v, Node_n)
(declare-const m@45@01 $Ref)
(assert (not (= m@45@01 $Ref.null)))
(declare-const value@46@01 Int)
(declare-const Node_v@47@01 Int)
(declare-const Node_n@48@01 $Ref)
(assert (not (= m@45@01 m@44@01)))
; [exec]
; exhale acc(m.Node_v, write)
; [exec]
; exhale acc(m.Node_n, write)
; [exec]
; exhale acc(m.value, write)
(pop) ; 2
(pop) ; 1
