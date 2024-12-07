(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:38
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/multi_initialization.vpr
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
(declare-fun P%trigger ($Snap $Ref) Bool)
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
; ---------- get_refs ----------
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
(declare-const $t@4@01 $Ref)
(assert (not (= x@2@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
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
; var a: Ref
(declare-const a@5@01 $Ref)
; [exec]
; var b: Ref
(declare-const b@6@01 $Ref)
; [exec]
; var c: Ref
(declare-const c@7@01 $Ref)
; [exec]
; var d: Ref
(declare-const d@8@01 $Ref)
; [exec]
; var e: Ref
(declare-const e@9@01 $Ref)
; [exec]
; c, d := get_refs()
(declare-const x@10@01 $Ref)
(declare-const y@11@01 $Ref)
(declare-const $t@12@01 $Ref)
(assert (not (= x@10@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; e := new(n)
(declare-const e@13@01 $Ref)
(assert (not (= e@13@01 $Ref.null)))
(declare-const n@14@01 $Ref)
(assert (not (= e@13@01 a@5@01)))
(assert (not (= e@13@01 $t@12@01)))
(assert (not (= e@13@01 y@11@01)))
(assert (not (= e@13@01 x@10@01)))
(assert (not (= e@13@01 b@6@01)))
(assert (not (= e@13@01 e@9@01)))
; [exec]
; var _receiver0: Ref
(declare-const _receiver0@15@01 $Ref)
; [exec]
; var _target0: Ref
(declare-const _target0@16@01 $Ref)
; [exec]
; _receiver0 := c
; [exec]
; _target0, e := get_refs()
(declare-const x@17@01 $Ref)
(declare-const y@18@01 $Ref)
(declare-const $t@19@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@10@01 x@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= e@13@01 x@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= x@17@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _receiver0.n := _target0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@17@01 x@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= e@13@01 x@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; var _receiver0: Ref
(declare-const _receiver0@20@01 $Ref)
; [exec]
; var _target0: Ref
(declare-const _target0@21@01 $Ref)
; [exec]
; _receiver0 := c.n
; [exec]
; _target0 := new(n)
(declare-const _target0@22@01 $Ref)
(assert (not (= _target0@22@01 $Ref.null)))
(declare-const n@23@01 $Ref)
(assert (not (= _target0@22@01 $t@19@01)))
(assert (not (= _target0@22@01 a@5@01)))
(assert (not (= _target0@22@01 y@11@01)))
(assert (not (= _target0@22@01 x@10@01)))
(assert (not (= _target0@22@01 n@14@01)))
(assert (not (= _target0@22@01 x@17@01)))
(assert (not (= _target0@22@01 b@6@01)))
(assert (not (= _target0@22@01 e@13@01)))
(assert (not (= _target0@22@01 y@18@01)))
(assert (not (= _target0@22@01 _target0@21@01)))
; [exec]
; _receiver0.n := _target0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@10@01 x@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= e@13@01 x@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _target0@22@01 x@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- foo ----------
(declare-const x@24@01 $Ref)
(declare-const a@25@01 $Ref)
(declare-const b@26@01 $Ref)
(declare-const x@27@01 $Ref)
(declare-const a@28@01 $Ref)
(declare-const b@29@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@30@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@31@01 $Ref)
(declare-const x@32@01 $Ref)
(push) ; 1
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (=
  ($Snap.second $t@33@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@33@01))
    ($Snap.second ($Snap.second $t@33@01)))))
; [eval] (unfolding acc(P(x), write) in x.n)
(push) ; 2
(assert (P%trigger ($Snap.first $t@33@01) x@32@01))
(assert (not (= x@32@01 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and (P%trigger ($Snap.first $t@33@01) x@32@01) (not (= x@32@01 $Ref.null))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@33@01)) $Ref.null)))
; [eval] (unfolding acc(P(x), write) in x.n)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@33@01)) x@32@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var _receiver0: Ref
(declare-const _receiver0@34@01 $Ref)
; [exec]
; var _target0: Ref
(declare-const _target0@35@01 $Ref)
; [exec]
; var _receiver1: Ref
(declare-const _receiver1@36@01 $Ref)
; [exec]
; var _target1: Ref
(declare-const _target1@37@01 $Ref)
; [exec]
; _receiver0 := (unfolding acc(P(x), write) in x.n)
; [eval] (unfolding acc(P(x), write) in x.n)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@33@01)) x@32@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(declare-const _receiver0@38@01 $Ref)
(assert (= _receiver0@38@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@33@01))))
; [exec]
; _receiver1 := (unfolding acc(P(x), write) in x.n)
; [eval] (unfolding acc(P(x), write) in x.n)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@33@01)) x@32@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(declare-const _receiver1@39@01 $Ref)
(assert (= _receiver1@39@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@33@01))))
; [exec]
; _target0, _target1 := foo(x)
(declare-const a@40@01 $Ref)
(declare-const b@41@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _receiver0.n := _target0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@33@01)) _receiver0@38@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= _receiver0@38@01 $Ref.null)))
; [exec]
; _receiver1.m := _target1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@33@01)) _receiver1@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= _receiver1@39@01 $Ref.null)))
(pop) ; 2
(pop) ; 1
; ---------- bar ----------
(declare-const x@42@01 $Ref)
(declare-const a@43@01 $Ref)
(declare-const x@44@01 $Ref)
(declare-const a@45@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@46@01 $Ref)
(assert (not (= x@44@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const x@47@01 $Ref)
(declare-const x@48@01 $Ref)
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
; var _receiver0: Ref
(declare-const _receiver0@49@01 $Ref)
; [exec]
; var _target0: Ref
(declare-const _target0@50@01 $Ref)
; [exec]
; _receiver0 := x
; [exec]
; _target0 := bar(x)
(declare-const a@51@01 $Ref)
(declare-const $t@52@01 $Ref)
(assert (not (= x@48@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _receiver0.n := _target0
(pop) ; 2
(pop) ; 1
; ---------- baz ----------
(declare-const x@53@01 $Ref)
(declare-const a@54@01 $Ref)
(declare-const x@55@01 $Ref)
(declare-const a@56@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@57@01 $Ref)
(assert (not (= x@55@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const x@58@01 $Ref)
(declare-const x@59@01 $Ref)
(push) ; 1
(declare-const $t@60@01 $Ref)
(assert (not (= x@59@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var _receiver0: Ref
(declare-const _receiver0@61@01 $Ref)
; [exec]
; var _target0: Ref
(declare-const _target0@62@01 $Ref)
; [exec]
; _receiver0 := x
; [exec]
; _target0 := baz(x)
(declare-const a@63@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _receiver0.n := _target0
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
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
; var a: Ref
(declare-const a@64@01 $Ref)
; [exec]
; var b: Ref
(declare-const b@65@01 $Ref)
; [exec]
; var c: Ref
(declare-const c@66@01 $Ref)
; [exec]
; var d: Ref
(declare-const d@67@01 $Ref)
; [exec]
; inhale acc(a.n, write) && acc(b.m, write)
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 ($Snap.combine ($Snap.first $t@68@01) ($Snap.second $t@68@01))))
(assert (not (= a@64@01 $Ref.null)))
(assert (not (= b@65@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; var _receiver0: Ref
(declare-const _receiver0@69@01 $Ref)
; [exec]
; var _target0: Ref
(declare-const _target0@70@01 $Ref)
; [exec]
; var _receiver1: Ref
(declare-const _receiver1@71@01 $Ref)
; [exec]
; var _target1: Ref
(declare-const _target1@72@01 $Ref)
; [exec]
; _receiver0 := a
; [exec]
; _receiver1 := b
; [exec]
; _target0, _target1 := get_refs()
(declare-const x@73@01 $Ref)
(declare-const y@74@01 $Ref)
(declare-const $t@75@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@64@01 x@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= x@73@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _receiver0.n := _target0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@73@01 a@64@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; _receiver1.m := _target1
; [exec]
; c, d := get_refs()
(declare-const x@76@01 $Ref)
(declare-const y@77@01 $Ref)
(declare-const $t@78@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@64@01 x@76@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@73@01 x@76@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= x@76@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
