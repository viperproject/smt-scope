(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:24
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0773.vpr
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
(declare-fun pre ($Snap) Bool)
(declare-fun pre%limited ($Snap) Bool)
(declare-const pre%stateless Bool)
(declare-fun pre%precondition ($Snap) Bool)
(declare-fun needsPre ($Snap) Bool)
(declare-fun needsPre%limited ($Snap) Bool)
(declare-const needsPre%stateless Bool)
(declare-fun needsPre%precondition ($Snap) Bool)
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
(assert (forall ((s@$ $Snap)) (!
  (= (pre%limited s@$) (pre s@$))
  :pattern ((pre s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as pre%stateless  Bool)
  :pattern ((pre%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (= (needsPre%limited s@$) (needsPre s@$))
  :pattern ((needsPre s@$))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap)) (!
  (as needsPre%stateless  Bool)
  :pattern ((needsPre%limited s@$))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
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
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@0@01 $Snap)
(assert (= $t@0@01 $Snap.unit))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@0@01 $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label l0
; [exec]
; var __plugin_refute_nondet1: Bool
(declare-const __plugin_refute_nondet1@1@01 Bool)
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
(push) ; 5
; [eval] !__plugin_refute_nondet1
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@1@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | __plugin_refute_nondet1@1@01 | live]
; [else-branch: 0 | !(__plugin_refute_nondet1@1@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | __plugin_refute_nondet1@1@01]
(assert __plugin_refute_nondet1@1@01)
; [exec]
; assert false
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
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(__plugin_refute_nondet1@1@01)]
(assert (not __plugin_refute_nondet1@1@01))
(pop) ; 5
; [eval] !__plugin_refute_nondet1
(push) ; 5
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@1@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(__plugin_refute_nondet1@1@01) | live]
; [else-branch: 1 | __plugin_refute_nondet1@1@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(__plugin_refute_nondet1@1@01)]
(assert (not __plugin_refute_nondet1@1@01))
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 1 | __plugin_refute_nondet1@1@01]
(assert __plugin_refute_nondet1@1@01)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
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
; Loop head block: Check well-definedness of invariant
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label l0
; [exec]
; var __plugin_refute_nondet1: Bool
(declare-const __plugin_refute_nondet1@2@01 Bool)
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
(push) ; 5
; [eval] !__plugin_refute_nondet1
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@2@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | __plugin_refute_nondet1@2@01 | live]
; [else-branch: 2 | !(__plugin_refute_nondet1@2@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | __plugin_refute_nondet1@2@01]
(assert __plugin_refute_nondet1@2@01)
; [exec]
; assert false
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
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(__plugin_refute_nondet1@2@01)]
(assert (not __plugin_refute_nondet1@2@01))
(pop) ; 5
; [eval] !__plugin_refute_nondet1
(push) ; 5
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@2@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(__plugin_refute_nondet1@2@01) | live]
; [else-branch: 3 | __plugin_refute_nondet1@2@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | !(__plugin_refute_nondet1@2@01)]
(assert (not __plugin_refute_nondet1@2@01))
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 3 | __plugin_refute_nondet1@2@01]
(assert __plugin_refute_nondet1@2@01)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
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
; var tmp: Int
(declare-const tmp@3@01 Int)
(declare-const tmp@4@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label l1
; [exec]
; inhale pre()
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] pre()
(set-option :timeout 0)
(push) ; 5
(assert (pre%precondition $Snap.unit))
(pop) ; 5
; Joined path conditions
(assert (pre%precondition $Snap.unit))
(assert (pre $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] needsPre()
(push) ; 6
; [eval] pre()
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (needsPre%precondition $Snap.unit))
(pop) ; 6
; Joined path conditions
(assert (needsPre%precondition $Snap.unit))
(pop) ; 5
(push) ; 5
; [eval] !needsPre()
; [eval] needsPre()
(push) ; 6
; [eval] pre()
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (needsPre%precondition $Snap.unit))
(pop) ; 6
; Joined path conditions
(assert (needsPre%precondition $Snap.unit))
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] needsPre()
(push) ; 5
; [eval] pre()
(push) ; 6
(pop) ; 6
; Joined path conditions
(assert (needsPre%precondition $Snap.unit))
(pop) ; 5
; Joined path conditions
(assert (needsPre%precondition $Snap.unit))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (needsPre $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (needsPre $Snap.unit)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | needsPre(_) | live]
; [else-branch: 4 | !(needsPre(_)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | needsPre(_)]
(assert (needsPre $Snap.unit))
; [exec]
; tmp := 3
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(needsPre(_))]
(assert (not (needsPre $Snap.unit)))
(pop) ; 5
; [eval] !needsPre()
; [eval] needsPre()
(push) ; 5
; [eval] pre()
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (needsPre $Snap.unit)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (needsPre $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(needsPre(_)) | live]
; [else-branch: 5 | needsPre(_) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(needsPre(_))]
(assert (not (needsPre $Snap.unit)))
; [exec]
; tmp := 4
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 5 | needsPre(_)]
(assert (needsPre $Snap.unit))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3fail ----------
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
; var tmp: Int
(declare-const tmp@6@01 Int)
(declare-const tmp@7@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label l1
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] needsPre()
(push) ; 6
; [eval] pre()
(push) ; 7
(assert (pre%precondition $Snap.unit))
(pop) ; 7
; Joined path conditions
(assert (pre%precondition $Snap.unit))
(push) ; 7
(assert (not (pre $Snap.unit)))
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
; [eval] pre()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (pre $Snap.unit)))
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
; [eval] pre()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (pre $Snap.unit)))
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
; [eval] pre()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (pre $Snap.unit)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Loop head block: Follow loop-internal edges
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
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
; Loop head block: Check well-definedness of invariant
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label l0
; [exec]
; var __plugin_refute_nondet1: Bool
(declare-const __plugin_refute_nondet1@8@01 Bool)
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
(push) ; 5
; [eval] !__plugin_refute_nondet1
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@8@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@8@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | __plugin_refute_nondet1@8@01 | live]
; [else-branch: 6 | !(__plugin_refute_nondet1@8@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | __plugin_refute_nondet1@8@01]
(assert __plugin_refute_nondet1@8@01)
; [exec]
; assert false
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
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
