(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:27:51
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/refute/complex.vpr
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
(declare-fun foo ($Snap $Ref) Bool)
(declare-fun foo%limited ($Snap $Ref) Bool)
(declare-fun foo%stateless ($Ref) Bool)
(declare-fun foo%precondition ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (foo%limited s@$ x@0@00) (foo s@$ x@0@00))
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (foo%stateless x@0@00)
  :pattern ((foo%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=> (foo%precondition s@$ x@0@00) (= (foo s@$ x@0@00) true))
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- bar ----------
(declare-const y@0@01 Int)
(declare-const y@1@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] y > 10
(assert (> y@1@01 10))
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
(declare-const x@3@01 $Ref)
; [exec]
; var z: Int
(declare-const z@4@01 Int)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@5@01 Int)
(assert (not (= x@3@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l
(set-option :timeout 0)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] old[l](x.f >= y) ==> x.f >= y
; [eval] old[l](x.f >= y)
; [eval] x.f >= y
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= $t@5@01 y@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= $t@5@01 y@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | $t@5@01 >= y@1@01 | live]
; [else-branch: 0 | !($t@5@01 >= y@1@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | $t@5@01 >= y@1@01]
(assert (>= $t@5@01 y@1@01))
; [eval] x.f >= y
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !($t@5@01 >= y@1@01)]
(assert (not (>= $t@5@01 y@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (>= $t@5@01 y@1@01)) (>= $t@5@01 y@1@01)))
(assert (=>
  (>= $t@5@01 y@1@01)
  (>= ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] old[l](x.f >= y) ==> x.f >= y
; [eval] old[l](x.f >= y)
; [eval] x.f >= y
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= $t@5@01 y@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= $t@5@01 y@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | $t@5@01 >= y@1@01 | live]
; [else-branch: 1 | !($t@5@01 >= y@1@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | $t@5@01 >= y@1@01]
(assert (>= $t@5@01 y@1@01))
; [eval] x.f >= y
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !($t@5@01 >= y@1@01)]
(assert (not (>= $t@5@01 y@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (>= $t@5@01 y@1@01)) (>= $t@5@01 y@1@01)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
(assert (=>
  (>= $t@5@01 y@1@01)
  (>= ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
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
; [eval] x.f > y
(pop) ; 5
(push) ; 5
; [eval] !(x.f > y)
; [eval] x.f > y
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] x.f > y
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:($t@6@01) > y@1@01 | live]
; [else-branch: 2 | !(First:($t@6@01) > y@1@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:($t@6@01) > y@1@01]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01))
; [exec]
; var __plugin_refute_nondet1: Bool
(declare-const __plugin_refute_nondet1@7@01 Bool)
(push) ; 6
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@7@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@7@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | __plugin_refute_nondet1@7@01 | live]
; [else-branch: 3 | !(__plugin_refute_nondet1@7@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | __plugin_refute_nondet1@7@01]
(assert __plugin_refute_nondet1@7@01)
; [exec]
; assert x.f < y
; [eval] x.f < y
(push) ; 7
(assert (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f < y
(set-option :timeout 0)
(push) ; 7
(assert (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f < y
(set-option :timeout 0)
(push) ; 7
(assert (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f < y
(set-option :timeout 0)
(push) ; 7
(assert (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01))
; [exec]
; inhale false
(pop) ; 6
(push) ; 6
; [else-branch: 3 | !(__plugin_refute_nondet1@7@01)]
(assert (not __plugin_refute_nondet1@7@01))
(pop) ; 6
; [eval] !__plugin_refute_nondet1
(push) ; 6
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@7@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@7@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(__plugin_refute_nondet1@7@01) | live]
; [else-branch: 4 | __plugin_refute_nondet1@7@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | !(__plugin_refute_nondet1@7@01)]
(assert (not __plugin_refute_nondet1@7@01))
; [exec]
; x.f := x.f - 1
; [eval] x.f - 1
(declare-const f@8@01 Int)
(assert (= f@8@01 (- ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) 1)))
; [exec]
; var __plugin_refute_nondet2: Bool
(declare-const __plugin_refute_nondet2@9@01 Bool)
(push) ; 7
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet2@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not __plugin_refute_nondet2@9@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | __plugin_refute_nondet2@9@01 | live]
; [else-branch: 5 | !(__plugin_refute_nondet2@9@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | __plugin_refute_nondet2@9@01]
(assert __plugin_refute_nondet2@9@01)
; [exec]
; assert foo(x)
; [eval] foo(x)
(push) ; 8
(assert (foo%precondition ($SortWrappers.IntTo$Snap f@8@01) x@3@01))
(pop) ; 8
; Joined path conditions
(assert (foo%precondition ($SortWrappers.IntTo$Snap f@8@01) x@3@01))
(push) ; 8
(assert (not (foo ($SortWrappers.IntTo$Snap f@8@01) x@3@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (foo ($SortWrappers.IntTo$Snap f@8@01) x@3@01))
; [exec]
; inhale false
(pop) ; 7
(push) ; 7
; [else-branch: 5 | !(__plugin_refute_nondet2@9@01)]
(assert (not __plugin_refute_nondet2@9@01))
(pop) ; 7
; [eval] !__plugin_refute_nondet2
(push) ; 7
(set-option :timeout 10)
(assert (not __plugin_refute_nondet2@9@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet2@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(__plugin_refute_nondet2@9@01) | live]
; [else-branch: 6 | __plugin_refute_nondet2@9@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 6 | !(__plugin_refute_nondet2@9@01)]
(assert (not __plugin_refute_nondet2@9@01))
; Loop head block: Re-establish invariant
; [eval] old[l](x.f >= y) ==> x.f >= y
; [eval] old[l](x.f >= y)
; [eval] x.f >= y
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (>= $t@5@01 y@1@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (>= $t@5@01 y@1@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | $t@5@01 >= y@1@01 | live]
; [else-branch: 7 | !($t@5@01 >= y@1@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 7 | $t@5@01 >= y@1@01]
(assert (>= $t@5@01 y@1@01))
; [eval] x.f >= y
(pop) ; 9
(push) ; 9
; [else-branch: 7 | !($t@5@01 >= y@1@01)]
(assert (not (>= $t@5@01 y@1@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(push) ; 8
(assert (not (=> (>= $t@5@01 y@1@01) (>= f@8@01 y@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=> (>= $t@5@01 y@1@01) (>= f@8@01 y@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | __plugin_refute_nondet2@9@01]
(assert __plugin_refute_nondet2@9@01)
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 4 | __plugin_refute_nondet1@7@01]
(assert __plugin_refute_nondet1@7@01)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(First:($t@6@01) > y@1@01)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(pop) ; 5
; [eval] !(x.f > y)
; [eval] x.f > y
(push) ; 5
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | !(First:($t@6@01) > y@1@01) | live]
; [else-branch: 8 | First:($t@6@01) > y@1@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | !(First:($t@6@01) > y@1@01)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
; [exec]
; var __plugin_refute_nondet3: Bool
(declare-const __plugin_refute_nondet3@10@01 Bool)
(push) ; 6
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet3@10@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not __plugin_refute_nondet3@10@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | __plugin_refute_nondet3@10@01 | live]
; [else-branch: 9 | !(__plugin_refute_nondet3@10@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 9 | __plugin_refute_nondet3@10@01]
(assert __plugin_refute_nondet3@10@01)
; [exec]
; assert x.f == y
; [eval] x.f == y
(push) ; 7
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == y
(set-option :timeout 0)
(push) ; 7
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == y
(set-option :timeout 0)
(push) ; 7
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == y
(set-option :timeout 0)
(push) ; 7
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01))
; [exec]
; inhale false
(pop) ; 6
(push) ; 6
; [else-branch: 9 | !(__plugin_refute_nondet3@10@01)]
(assert (not __plugin_refute_nondet3@10@01))
(pop) ; 6
; [eval] !__plugin_refute_nondet3
(push) ; 6
(set-option :timeout 10)
(assert (not __plugin_refute_nondet3@10@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet3@10@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | !(__plugin_refute_nondet3@10@01) | live]
; [else-branch: 10 | __plugin_refute_nondet3@10@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 10 | !(__plugin_refute_nondet3@10@01)]
(assert (not __plugin_refute_nondet3@10@01))
; [eval] z > 10
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> z@4@01 10))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (> z@4@01 10)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | z@4@01 > 10 | live]
; [else-branch: 11 | !(z@4@01 > 10) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 11 | z@4@01 > 10]
(assert (> z@4@01 10))
; [exec]
; z := z + 1
; [eval] z + 1
(declare-const z@11@01 Int)
(assert (= z@11@01 (+ z@4@01 1)))
; [eval] z < -10
; [eval] -10
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< z@11@01 (- 0 10)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | z@11@01 < -10 | dead]
; [else-branch: 12 | !(z@11@01 < -10) | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 12 | !(z@11@01 < -10)]
(assert (not (< z@11@01 (- 0 10))))
(pop) ; 8
; [eval] !(z < -10)
; [eval] z < -10
; [eval] -10
(push) ; 8
(set-option :timeout 10)
(assert (not (< z@11@01 (- 0 10))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< z@11@01 (- 0 10)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(z@11@01 < -10) | live]
; [else-branch: 13 | z@11@01 < -10 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 13 | !(z@11@01 < -10)]
(assert (not (< z@11@01 (- 0 10))))
; [exec]
; z := z - 1
; [eval] z - 1
(declare-const z@12@01 Int)
(assert (= z@12@01 (- z@11@01 1)))
; [exec]
; var __plugin_refute_nondet4: Bool
(declare-const __plugin_refute_nondet4@13@01 Bool)
(push) ; 9
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet4@13@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not __plugin_refute_nondet4@13@01))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | __plugin_refute_nondet4@13@01 | live]
; [else-branch: 14 | !(__plugin_refute_nondet4@13@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 14 | __plugin_refute_nondet4@13@01]
(assert __plugin_refute_nondet4@13@01)
; [exec]
; assert z == 10
; [eval] z == 10
(push) ; 10
(assert (not (= z@12@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@12@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@12@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@12@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (= z@12@01 10))
; [exec]
; inhale false
(pop) ; 9
(push) ; 9
; [else-branch: 14 | !(__plugin_refute_nondet4@13@01)]
(assert (not __plugin_refute_nondet4@13@01))
(pop) ; 9
; [eval] !__plugin_refute_nondet4
(push) ; 9
(set-option :timeout 10)
(assert (not __plugin_refute_nondet4@13@01))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet4@13@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | !(__plugin_refute_nondet4@13@01) | live]
; [else-branch: 15 | __plugin_refute_nondet4@13@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 15 | !(__plugin_refute_nondet4@13@01)]
(assert (not __plugin_refute_nondet4@13@01))
; [exec]
; var __plugin_refute_nondet5: Bool
(declare-const __plugin_refute_nondet5@14@01 Bool)
(push) ; 10
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet5@14@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not __plugin_refute_nondet5@14@01))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | __plugin_refute_nondet5@14@01 | live]
; [else-branch: 16 | !(__plugin_refute_nondet5@14@01) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 16 | __plugin_refute_nondet5@14@01]
(assert __plugin_refute_nondet5@14@01)
; [exec]
; assert z < 9 || z > 10
; [eval] z < 9 || z > 10
; [eval] z < 9
(push) ; 11
; [then-branch: 17 | z@12@01 < 9 | live]
; [else-branch: 17 | !(z@12@01 < 9) | live]
(push) ; 12
; [then-branch: 17 | z@12@01 < 9]
(assert (< z@12@01 9))
(pop) ; 12
(push) ; 12
; [else-branch: 17 | !(z@12@01 < 9)]
(assert (not (< z@12@01 9)))
; [eval] z > 10
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< z@12@01 9)) (< z@12@01 9)))
(push) ; 11
(assert (not (or (< z@12@01 9) (> z@12@01 10))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (or (< z@12@01 9) (> z@12@01 10)))
; [exec]
; inhale false
(pop) ; 10
(push) ; 10
; [else-branch: 16 | !(__plugin_refute_nondet5@14@01)]
(assert (not __plugin_refute_nondet5@14@01))
(pop) ; 10
; [eval] !__plugin_refute_nondet5
(push) ; 10
(set-option :timeout 10)
(assert (not __plugin_refute_nondet5@14@01))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet5@14@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | !(__plugin_refute_nondet5@14@01) | live]
; [else-branch: 18 | __plugin_refute_nondet5@14@01 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 18 | !(__plugin_refute_nondet5@14@01)]
(assert (not __plugin_refute_nondet5@14@01))
(pop) ; 10
(push) ; 10
; [else-branch: 18 | __plugin_refute_nondet5@14@01]
(assert __plugin_refute_nondet5@14@01)
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 15 | __plugin_refute_nondet4@13@01]
(assert __plugin_refute_nondet4@13@01)
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 11 | !(z@4@01 > 10)]
(assert (not (> z@4@01 10)))
(pop) ; 7
; [eval] !(z > 10)
; [eval] z > 10
(push) ; 7
(set-option :timeout 10)
(assert (not (> z@4@01 10)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> z@4@01 10))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | !(z@4@01 > 10) | live]
; [else-branch: 19 | z@4@01 > 10 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 19 | !(z@4@01 > 10)]
(assert (not (> z@4@01 10)))
; [exec]
; z := z - 1
; [eval] z - 1
(declare-const z@15@01 Int)
(assert (= z@15@01 (- z@4@01 1)))
; [eval] z < -10
; [eval] -10
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< z@15@01 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< z@15@01 (- 0 10))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | z@15@01 < -10 | live]
; [else-branch: 20 | !(z@15@01 < -10) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 20 | z@15@01 < -10]
(assert (< z@15@01 (- 0 10)))
; [exec]
; z := z + 1
; [eval] z + 1
(declare-const z@16@01 Int)
(assert (= z@16@01 (+ z@15@01 1)))
; [exec]
; var __plugin_refute_nondet4: Bool
(declare-const __plugin_refute_nondet4@17@01 Bool)
(push) ; 9
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet4@17@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not __plugin_refute_nondet4@17@01))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | __plugin_refute_nondet4@17@01 | live]
; [else-branch: 21 | !(__plugin_refute_nondet4@17@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 21 | __plugin_refute_nondet4@17@01]
(assert __plugin_refute_nondet4@17@01)
; [exec]
; assert z == 10
; [eval] z == 10
(push) ; 10
(assert (not (= z@16@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@16@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@16@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@16@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (= z@16@01 10))
; [exec]
; inhale false
(pop) ; 9
(push) ; 9
; [else-branch: 21 | !(__plugin_refute_nondet4@17@01)]
(assert (not __plugin_refute_nondet4@17@01))
(pop) ; 9
; [eval] !__plugin_refute_nondet4
(push) ; 9
(set-option :timeout 10)
(assert (not __plugin_refute_nondet4@17@01))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet4@17@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | !(__plugin_refute_nondet4@17@01) | live]
; [else-branch: 22 | __plugin_refute_nondet4@17@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 22 | !(__plugin_refute_nondet4@17@01)]
(assert (not __plugin_refute_nondet4@17@01))
; [exec]
; var __plugin_refute_nondet5: Bool
(declare-const __plugin_refute_nondet5@18@01 Bool)
(push) ; 10
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet5@18@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not __plugin_refute_nondet5@18@01))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | __plugin_refute_nondet5@18@01 | live]
; [else-branch: 23 | !(__plugin_refute_nondet5@18@01) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 23 | __plugin_refute_nondet5@18@01]
(assert __plugin_refute_nondet5@18@01)
; [exec]
; assert z < 9 || z > 10
; [eval] z < 9 || z > 10
; [eval] z < 9
(push) ; 11
; [then-branch: 24 | z@16@01 < 9 | live]
; [else-branch: 24 | !(z@16@01 < 9) | live]
(push) ; 12
; [then-branch: 24 | z@16@01 < 9]
(assert (< z@16@01 9))
(pop) ; 12
(push) ; 12
; [else-branch: 24 | !(z@16@01 < 9)]
(assert (not (< z@16@01 9)))
; [eval] z > 10
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< z@16@01 9)) (< z@16@01 9)))
(push) ; 11
(assert (not (or (< z@16@01 9) (> z@16@01 10))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (or (< z@16@01 9) (> z@16@01 10)))
; [exec]
; inhale false
(pop) ; 10
(push) ; 10
; [else-branch: 23 | !(__plugin_refute_nondet5@18@01)]
(assert (not __plugin_refute_nondet5@18@01))
(pop) ; 10
; [eval] !__plugin_refute_nondet5
(push) ; 10
(set-option :timeout 10)
(assert (not __plugin_refute_nondet5@18@01))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet5@18@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | !(__plugin_refute_nondet5@18@01) | live]
; [else-branch: 25 | __plugin_refute_nondet5@18@01 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 25 | !(__plugin_refute_nondet5@18@01)]
(assert (not __plugin_refute_nondet5@18@01))
(pop) ; 10
(push) ; 10
; [else-branch: 25 | __plugin_refute_nondet5@18@01]
(assert __plugin_refute_nondet5@18@01)
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 22 | __plugin_refute_nondet4@17@01]
(assert __plugin_refute_nondet4@17@01)
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 20 | !(z@15@01 < -10)]
(assert (not (< z@15@01 (- 0 10))))
(pop) ; 8
; [eval] !(z < -10)
; [eval] z < -10
; [eval] -10
(push) ; 8
(set-option :timeout 10)
(assert (not (< z@15@01 (- 0 10))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< z@15@01 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | !(z@15@01 < -10) | live]
; [else-branch: 26 | z@15@01 < -10 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 26 | !(z@15@01 < -10)]
(assert (not (< z@15@01 (- 0 10))))
; [exec]
; z := z - 1
; [eval] z - 1
(declare-const z@19@01 Int)
(assert (= z@19@01 (- z@15@01 1)))
; [exec]
; var __plugin_refute_nondet4: Bool
(declare-const __plugin_refute_nondet4@20@01 Bool)
(push) ; 9
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet4@20@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not __plugin_refute_nondet4@20@01))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | __plugin_refute_nondet4@20@01 | live]
; [else-branch: 27 | !(__plugin_refute_nondet4@20@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 27 | __plugin_refute_nondet4@20@01]
(assert __plugin_refute_nondet4@20@01)
; [exec]
; assert z == 10
; [eval] z == 10
(push) ; 10
(assert (not (= z@19@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@19@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@19@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z == 10
(set-option :timeout 0)
(push) ; 10
(assert (not (= z@19@01 10)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (= z@19@01 10))
; [exec]
; inhale false
(pop) ; 9
(push) ; 9
; [else-branch: 27 | !(__plugin_refute_nondet4@20@01)]
(assert (not __plugin_refute_nondet4@20@01))
(pop) ; 9
; [eval] !__plugin_refute_nondet4
(push) ; 9
(set-option :timeout 10)
(assert (not __plugin_refute_nondet4@20@01))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet4@20@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | !(__plugin_refute_nondet4@20@01) | live]
; [else-branch: 28 | __plugin_refute_nondet4@20@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 28 | !(__plugin_refute_nondet4@20@01)]
(assert (not __plugin_refute_nondet4@20@01))
; [exec]
; var __plugin_refute_nondet5: Bool
(declare-const __plugin_refute_nondet5@21@01 Bool)
(push) ; 10
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet5@21@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not __plugin_refute_nondet5@21@01))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | __plugin_refute_nondet5@21@01 | live]
; [else-branch: 29 | !(__plugin_refute_nondet5@21@01) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 29 | __plugin_refute_nondet5@21@01]
(assert __plugin_refute_nondet5@21@01)
; [exec]
; assert z < 9 || z > 10
; [eval] z < 9 || z > 10
; [eval] z < 9
(push) ; 11
; [then-branch: 30 | z@19@01 < 9 | live]
; [else-branch: 30 | !(z@19@01 < 9) | live]
(push) ; 12
; [then-branch: 30 | z@19@01 < 9]
(assert (< z@19@01 9))
(pop) ; 12
(push) ; 12
; [else-branch: 30 | !(z@19@01 < 9)]
(assert (not (< z@19@01 9)))
; [eval] z > 10
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< z@19@01 9)) (< z@19@01 9)))
(push) ; 11
(assert (not (or (< z@19@01 9) (> z@19@01 10))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (or (< z@19@01 9) (> z@19@01 10)))
; [exec]
; inhale false
(pop) ; 10
(push) ; 10
; [else-branch: 29 | !(__plugin_refute_nondet5@21@01)]
(assert (not __plugin_refute_nondet5@21@01))
(pop) ; 10
; [eval] !__plugin_refute_nondet5
(push) ; 10
(set-option :timeout 10)
(assert (not __plugin_refute_nondet5@21@01))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet5@21@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | !(__plugin_refute_nondet5@21@01) | live]
; [else-branch: 31 | __plugin_refute_nondet5@21@01 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 31 | !(__plugin_refute_nondet5@21@01)]
(assert (not __plugin_refute_nondet5@21@01))
(pop) ; 10
(push) ; 10
; [else-branch: 31 | __plugin_refute_nondet5@21@01]
(assert __plugin_refute_nondet5@21@01)
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 28 | __plugin_refute_nondet4@20@01]
(assert __plugin_refute_nondet4@20@01)
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 26 | z@15@01 < -10]
(assert (< z@15@01 (- 0 10)))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 19 | z@4@01 > 10]
(assert (> z@4@01 10))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 10 | __plugin_refute_nondet3@10@01]
(assert __plugin_refute_nondet3@10@01)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 8 | First:($t@6@01) > y@1@01]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)) y@1@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
