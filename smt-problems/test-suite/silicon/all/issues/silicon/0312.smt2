(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:47
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0312.vpr
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
; ---------- test0 ----------
(declare-const k@0@01 $Perm)
(declare-const x@1@01 $Ref)
(declare-const k@2@01 $Perm)
(declare-const x@3@01 $Ref)
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
; inhale k > none
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] k > none
(assert (> k@2@01 $Perm.No))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.c, k) && (acc(x.d, k) && acc(x.b, k))
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@2@01 $Perm.No) (< $Perm.No k@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No k@2@01))
(assert (<= k@2@01 $Perm.Write))
(assert (=> (< $Perm.No k@2@01) (not (= x@3@01 $Ref.null))))
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
(push) ; 3
(assert (not (or (= k@2@01 $Perm.No) (< $Perm.No k@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (or (= k@2@01 $Perm.No) (< $Perm.No k@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.b == (x.c == x.d)
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] x.b == (x.c == x.d)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.c == x.d
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01)))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@01))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.c.f, k) && acc(x.d.f, write)
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@2@01 $Perm.No) (< $Perm.No k@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No k@2@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)) $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@01))) $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label succeeds2_end_label
; [exec]
; exhale acc(old[succeeds2_end_label](x.c).f, k)
; [eval] old[succeeds2_end_label](x.c)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@2@01 $Perm.No) (< $Perm.No k@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old[succeeds2_end_label](x.b)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | Second:(Second:($t@5@01)) | live]
; [else-branch: 0 | !(Second:(Second:($t@5@01))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | Second:(Second:($t@5@01))]
(assert ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01))))
; [exec]
; exhale old[succeeds2_end_label](x.c.f == x.d.f)
; [eval] old[succeeds2_end_label](x.c.f == x.d.f)
; [eval] x.c.f == x.d.f
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@7@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@7@01)))))
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
; [eval] old[succeeds2_end_label](x.c.f == x.d.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No k@2@01)
  (=
    ($SortWrappers.$SnapToInt ($Snap.second $t@7@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)))))
(assert (<= $Perm.No (+ $Perm.Write k@2@01)))
(assert (<= (+ $Perm.Write k@2@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ $Perm.Write k@2@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@01)))
      $Ref.null))))
; [eval] x.c.f == x.d.f
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@5@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ $Perm.Write k@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ $Perm.Write k@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | !(Second:(Second:($t@5@01)))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01)))))
(pop) ; 3
; [eval] !old[succeeds2_end_label](x.b)
; [eval] old[succeeds2_end_label](x.b)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(Second:(Second:($t@5@01))) | live]
; [else-branch: 1 | Second:(Second:($t@5@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(Second:(Second:($t@5@01)))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01)))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | Second:(Second:($t@5@01))]
(assert ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@5@01))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const k@8@01 $Perm)
(declare-const x@9@01 $Ref)
(declare-const k@10@01 $Perm)
(declare-const x@11@01 $Ref)
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
; inhale k > none
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] k > none
(assert (> k@10@01 $Perm.No))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.c, k) && (acc(x.d, k) && acc(x.b, k))
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@10@01 $Perm.No) (< $Perm.No k@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No k@10@01))
(assert (<= k@10@01 $Perm.Write))
(assert (=> (< $Perm.No k@10@01) (not (= x@11@01 $Ref.null))))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(push) ; 3
(assert (not (or (= k@10@01 $Perm.No) (< $Perm.No k@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (or (= k@10@01 $Perm.No) (< $Perm.No k@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.b == (x.c == x.d)
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] x.b == (x.c == x.d)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.c == x.d
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01)))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.c.f, k) && acc(x.d.f, write)
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@10@01 $Perm.No) (< $Perm.No k@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No k@10@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label succeeds2_end_label
; [exec]
; exhale acc(old[succeeds2_end_label](x.c).f, k)
; [eval] old[succeeds2_end_label](x.c)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@10@01 $Perm.No) (< $Perm.No k@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale old[succeeds2_end_label](x.b) ==>
;   old[succeeds2_end_label](x.c.f) == old[succeeds2_end_label](x.d.f)
; [eval] old[succeeds2_end_label](x.b) ==> old[succeeds2_end_label](x.c.f) == old[succeeds2_end_label](x.d.f)
; [eval] old[succeeds2_end_label](x.b)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | Second:(Second:($t@13@01)) | live]
; [else-branch: 2 | !(Second:(Second:($t@13@01))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | Second:(Second:($t@13@01))]
(assert ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01))))
; [eval] old[succeeds2_end_label](x.c.f) == old[succeeds2_end_label](x.d.f)
; [eval] old[succeeds2_end_label](x.c.f)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] old[succeeds2_end_label](x.d.f)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | !(Second:(Second:($t@13@01)))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01))))
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01)))))
(push) ; 3
(assert (not (=>
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01)))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@15@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@15@01))))))
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
; [eval] old[succeeds2_end_label](x.b) ==> old[succeeds2_end_label](x.c.f) == old[succeeds2_end_label](x.d.f)
; [eval] old[succeeds2_end_label](x.b)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ k@10@01 $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $Perm.Write k@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No k@10@01)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first $t@15@01))
      ($SortWrappers.$SnapToInt ($Snap.second $t@15@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No k@10@01)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.second $t@15@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@15@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | Second:(Second:($t@13@01)) | dead]
; [else-branch: 3 | !(Second:(Second:($t@13@01))) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | !(Second:(Second:($t@13@01)))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@13@01)))))
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const k@16@01 $Perm)
(declare-const x@17@01 $Ref)
(declare-const k@18@01 $Perm)
(declare-const x@19@01 $Ref)
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
; inhale k > none
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] k > none
(assert (> k@18@01 $Perm.No))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.c, k) && (acc(x.d, k) && acc(x.b, k))
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@18@01 $Perm.No) (< $Perm.No k@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No k@18@01))
(assert (<= k@18@01 $Perm.Write))
(assert (=> (< $Perm.No k@18@01) (not (= x@19@01 $Ref.null))))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(push) ; 3
(assert (not (or (= k@18@01 $Perm.No) (< $Perm.No k@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (or (= k@18@01 $Perm.No) (< $Perm.No k@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.b == (x.c == x.d)
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
; [eval] x.b == (x.c == x.d)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.c == x.d
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01)))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.c.f, k) && acc(x.d.f, write)
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@18@01 $Perm.No) (< $Perm.No k@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No k@18@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01)) $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01))) $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label succeeds2_end_label
; [exec]
; exhale acc(old[succeeds2_end_label](x.c).f, k)
; [eval] old[succeeds2_end_label](x.c)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= k@18@01 $Perm.No) (< $Perm.No k@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale old[succeeds2_end_label](x.b) ==>
;   old[succeeds2_end_label](x.c.f == x.d.f)
; [eval] old[succeeds2_end_label](x.b) ==> old[succeeds2_end_label](x.c.f == x.d.f)
; [eval] old[succeeds2_end_label](x.b)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | Second:(Second:($t@21@01)) | live]
; [else-branch: 4 | !(Second:(Second:($t@21@01))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | Second:(Second:($t@21@01))]
(assert ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01))))
; [eval] old[succeeds2_end_label](x.c.f == x.d.f)
; [eval] x.c.f == x.d.f
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | !(Second:(Second:($t@21@01)))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01))))
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01)))))
(push) ; 3
(assert (not (=>
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01)))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@23@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@23@01))))))
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
; [eval] old[succeeds2_end_label](x.b) ==> old[succeeds2_end_label](x.c.f == x.d.f)
; [eval] old[succeeds2_end_label](x.b)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ k@18@01 $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $Perm.Write k@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No k@18@01)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first $t@23@01))
      ($SortWrappers.$SnapToInt ($Snap.second $t@23@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No k@18@01)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.second $t@23@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@23@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01)))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No k@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | Second:(Second:($t@21@01)) | dead]
; [else-branch: 5 | !(Second:(Second:($t@21@01))) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | !(Second:(Second:($t@21@01)))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second $t@21@01)))))
(pop) ; 2
(pop) ; 1
