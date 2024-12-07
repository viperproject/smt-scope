(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:05:36
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/macros/define.vpr
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
(declare-fun fun01 ($Snap Bool) Bool)
(declare-fun fun01%limited ($Snap Bool) Bool)
(declare-fun fun01%stateless (Bool) Bool)
(declare-fun fun01%precondition ($Snap Bool) Bool)
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
(assert (forall ((s@$ $Snap) (b@0@00 Bool)) (!
  (= (fun01%limited s@$ b@0@00) (fun01 s@$ b@0@00))
  :pattern ((fun01 s@$ b@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (b@0@00 Bool)) (!
  (fun01%stateless b@0@00)
  :pattern ((fun01%limited s@$ b@0@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
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
; exhale true ==> true
; [eval] true ==> true
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
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
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
; inhale true ==> true
(declare-const $t@0@01 $Snap)
(assert (= $t@0@01 $Snap.unit))
; [eval] true ==> true
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
(pop) ; 4
(pop) ; 3
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale true ==> true
; [eval] true ==> true
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
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@1@01 $Ref)
(declare-const x@2@01 $Ref)
(push) ; 1
(declare-const $t@3@01 $Ref)
(assert (not (= x@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(x.f, write) && true
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= $t@3@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01))))
(assert false)
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; exhale acc(x.f, write)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@5@01 $Ref)
(declare-const x@6@01 $Ref)
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
; var y: Ref
(declare-const y@7@01 $Ref)
; [exec]
; var z: Ref
(declare-const z@8@01 $Ref)
; [exec]
; inhale acc(x.f, write) && x.f == null
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (not (= x@6@01 $Ref.null)))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] x.f == null
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@01)) $Ref.null))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; y := x
; [exec]
; z := new(f)
(declare-const z@10@01 $Ref)
(assert (not (= z@10@01 $Ref.null)))
(declare-const f@11@01 $Ref)
(assert (not (= z@10@01 x@6@01)))
(assert (not (= z@10@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@01)))))
(assert (not (= z@10@01 z@8@01)))
; [exec]
; y.f := z
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@10@01 x@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale acc(y.f, write) && y.f == z && acc(y.f.f, write)
; [eval] y.f == z
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@12@01 Int)
(declare-const x@13@01 Int)
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
; var i: Int
(declare-const i@14@01 Int)
; [exec]
; inhale fun01(x != i)
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] fun01(x != i)
; [eval] x != i
(push) ; 3
(assert (fun01%precondition $Snap.unit (not (= x@13@01 i@14@01))))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition $Snap.unit (not (= x@13@01 i@14@01))))
(assert (fun01 $Snap.unit (not (= x@13@01 i@14@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(declare-const i@16@01 Int)
(set-option :timeout 0)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] fun01(x != i)
; [eval] x != i
(push) ; 4
(assert (fun01%precondition $Snap.unit (not (= x@13@01 i@16@01))))
(pop) ; 4
; Joined path conditions
(assert (fun01%precondition $Snap.unit (not (= x@13@01 i@16@01))))
(assert (fun01 $Snap.unit (not (= x@13@01 i@16@01))))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] fun01(x != i)
; [eval] x != i
(push) ; 4
(pop) ; 4
; Joined path conditions
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@17@01 $Snap.unit))
(assert (fun01%precondition $Snap.unit (not (= x@13@01 i@16@01))))
(assert (fun01 $Snap.unit (not (= x@13@01 i@16@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] i < 0
(pop) ; 5
(push) ; 5
; [eval] !(i < 0)
; [eval] i < 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@16@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@16@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | i@16@01 < 0 | live]
; [else-branch: 3 | !(i@16@01 < 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | i@16@01 < 0]
(assert (< i@16@01 0))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@18@01 Int)
(assert (= i@18@01 (+ i@16@01 1)))
; [exec]
; inhale false
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(i@16@01 < 0)]
(assert (not (< i@16@01 0)))
(pop) ; 5
; [eval] !(i < 0)
; [eval] i < 0
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@16@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@16@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(i@16@01 < 0) | live]
; [else-branch: 4 | i@16@01 < 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | !(i@16@01 < 0)]
(assert (not (< i@16@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i@16@01 < 0]
(assert (< i@16@01 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
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
; var x: Ref
(declare-const x@19@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@20@01 $Ref)
; [exec]
; var t: Ref
(declare-const t@21@01 $Ref)
; [exec]
; inhale acc(x.g, write)
(declare-const $t@22@01 Int)
(assert (not (= x@19@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; x.g := 1
; [exec]
; inhale acc(y.g, write)
(declare-const $t@23@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 y@20@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@20@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; y.g := 2
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 y@20@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhale acc(t.g, write)
(declare-const $t@24@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@20@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= t@21@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; t.g := x.g
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@20@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.g := y.g
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t@21@01 x@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@20@01 x@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; y.g := t.g
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 y@20@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t@21@01 y@20@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert x.g == 2 && (y.g == 1 && t.g == 1)
; [eval] x.g == 2
; [eval] y.g == 1
; [eval] t.g == 1
; [exec]
; x.g := y.g
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@20@01 x@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t@21@01 x@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; y.g := t.g
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 y@20@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t@21@01 y@20@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; t.g := x.g
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@20@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert x.g == 1 && (y.g == 1 && t.g == 1)
; [eval] x.g == 1
; [eval] y.g == 1
; [eval] t.g == 1
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const x@25@01 $Ref)
(declare-const x@26@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@27@01 Int)
(assert (not (= x@26@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.g := 1
; [eval] x.g <= 5
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | True]
; [exec]
; inhale false
(pop) ; 3
; [eval] !(x.g <= 5)
; [eval] x.g <= 5
; [then-branch: 6 | False | dead]
; [else-branch: 6 | True | live]
(push) ; 3
; [else-branch: 6 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
