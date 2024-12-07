(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0053.vpr
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
(declare-fun valid%trigger ($Snap $Ref) Bool)
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
; ---------- traverse ----------
(declare-const list@0@01 $Ref)
(declare-const list@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var tmp: Ref
(declare-const tmp@3@01 $Ref)
; [exec]
; tmp := list
(declare-const tmp@4@01 $Ref)
(push) ; 3
; Loop head block: Check well-definedness of invariant
; [eval] tmp != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= tmp@4@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= tmp@4@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | tmp@4@01 != Null | live]
; [else-branch: 0 | tmp@4@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | tmp@4@01 != Null]
(assert (not (= tmp@4@01 $Ref.null)))
(declare-const $t@5@01 $Snap)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | tmp@4@01 == Null]
(assert (= tmp@4@01 $Ref.null))
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
(pop) ; 4
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] tmp != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= list@1@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= list@1@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | list@1@01 != Null | live]
; [else-branch: 1 | list@1@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | list@1@01 != Null]
(assert (not (= list@1@01 $Ref.null)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 5
(assert (not (= tmp@4@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 6
; [eval] tmp != null
(pop) ; 6
(push) ; 6
; [eval] !(tmp != null)
; [eval] tmp != null
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [eval] tmp != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= tmp@4@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | tmp@4@01 != Null | live]
; [else-branch: 2 | tmp@4@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | tmp@4@01 != Null]
; [exec]
; unfold acc(valid(tmp), write)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
; [eval] this.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:($t@5@01) != Null | live]
; [else-branch: 3 | First:($t@5@01) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 3 | First:($t@5@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@5@01 tmp@4@01))
; [exec]
; tmp := tmp.next
(declare-const tmp@7@01 $Ref)
(assert (= tmp@7@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01))))
; Loop head block: Re-establish invariant
; [eval] tmp != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= tmp@7@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= tmp@7@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | tmp@7@01 != Null | live]
; [else-branch: 4 | tmp@7@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 4 | tmp@7@01 != Null]
(assert (not (= tmp@7@01 $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) tmp@7@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 3 | First:($t@5@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@5@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@5@01 tmp@4@01))
; [exec]
; tmp := tmp.next
(declare-const tmp@8@01 $Ref)
(assert (= tmp@8@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01))))
; Loop head block: Re-establish invariant
; [eval] tmp != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= tmp@8@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | tmp@8@01 != Null | dead]
; [else-branch: 5 | tmp@8@01 == Null | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 5 | tmp@8@01 == Null]
(assert (= tmp@8@01 $Ref.null))
(pop) ; 8
(pop) ; 7
(pop) ; 6
; [eval] !(tmp != null)
; [eval] tmp != null
; [then-branch: 6 | tmp@4@01 == Null | dead]
; [else-branch: 6 | tmp@4@01 != Null | live]
(push) ; 6
; [else-branch: 6 | tmp@4@01 != Null]
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (= tmp@4@01 $Ref.null))
(assert (= $t@6@01 $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 6
; [eval] tmp != null
(pop) ; 6
(push) ; 6
; [eval] !(tmp != null)
; [eval] tmp != null
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [eval] tmp != null
; [then-branch: 7 | tmp@4@01 != Null | dead]
; [else-branch: 7 | tmp@4@01 == Null | live]
(push) ; 6
; [else-branch: 7 | tmp@4@01 == Null]
(pop) ; 6
; [eval] !(tmp != null)
; [eval] tmp != null
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= tmp@4@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | tmp@4@01 == Null | live]
; [else-branch: 8 | tmp@4@01 != Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 8 | tmp@4@01 == Null]
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 1 | list@1@01 == Null]
(assert (= list@1@01 $Ref.null))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 5
(assert (not (= tmp@4@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 6
; [eval] tmp != null
(pop) ; 6
(push) ; 6
; [eval] !(tmp != null)
; [eval] tmp != null
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [eval] tmp != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= tmp@4@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | tmp@4@01 != Null | live]
; [else-branch: 9 | tmp@4@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 9 | tmp@4@01 != Null]
; [exec]
; unfold acc(valid(tmp), write)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
; [eval] this.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:($t@5@01) != Null | live]
; [else-branch: 10 | First:($t@5@01) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 10 | First:($t@5@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@5@01 tmp@4@01))
; [exec]
; tmp := tmp.next
(declare-const tmp@9@01 $Ref)
(assert (= tmp@9@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01))))
; Loop head block: Re-establish invariant
; [eval] tmp != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= tmp@9@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= tmp@9@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | tmp@9@01 != Null | live]
; [else-branch: 11 | tmp@9@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 11 | tmp@9@01 != Null]
(assert (not (= tmp@9@01 $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) tmp@9@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 10 | First:($t@5@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@5@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@5@01 tmp@4@01))
; [exec]
; tmp := tmp.next
(declare-const tmp@10@01 $Ref)
(assert (= tmp@10@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01))))
; Loop head block: Re-establish invariant
; [eval] tmp != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= tmp@10@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | tmp@10@01 != Null | dead]
; [else-branch: 12 | tmp@10@01 == Null | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 12 | tmp@10@01 == Null]
(assert (= tmp@10@01 $Ref.null))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
(set-option :timeout 10)
(assert (not (= tmp@4@01 list@1@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] !(tmp != null)
; [eval] tmp != null
; [then-branch: 13 | tmp@4@01 == Null | dead]
; [else-branch: 13 | tmp@4@01 != Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 13 | tmp@4@01 != Null]
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (= tmp@4@01 $Ref.null))
(assert (= $t@6@01 $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 6
; [eval] tmp != null
(pop) ; 6
(push) ; 6
; [eval] !(tmp != null)
; [eval] tmp != null
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [eval] tmp != null
; [then-branch: 14 | tmp@4@01 != Null | dead]
; [else-branch: 14 | tmp@4@01 == Null | live]
(push) ; 6
; [else-branch: 14 | tmp@4@01 == Null]
(pop) ; 6
; [eval] !(tmp != null)
; [eval] tmp != null
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= tmp@4@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | tmp@4@01 == Null | live]
; [else-branch: 15 | tmp@4@01 != Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 15 | tmp@4@01 == Null]
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
