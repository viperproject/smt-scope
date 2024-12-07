(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/testHistoryProcesses.vpr
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
; ---------- History__empty ----------
(declare-const diz@0@01 $Ref)
(declare-const diz@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(assert (= ($Snap.second $t@3@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@3@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__incr ----------
(declare-const diz@4@01 $Ref)
(declare-const diz@5@01 $Ref)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@5@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@7@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.second $t@6@01)) 1)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__single ----------
(declare-const diz@8@01 $Ref)
(declare-const n@9@01 Int)
(declare-const diz@10@01 $Ref)
(declare-const n@11@01 Int)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.first $t@12@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@10@01 $Ref.null)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.second ($Snap.second $t@12@01)) $Snap.unit))
; [eval] n >= 0
(assert (>= n@11@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01))) n@11@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@14@01 Bool)
; [eval] n > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> n@11@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> n@11@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | n@11@01 > 0 | live]
; [else-branch: 0 | !(n@11@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | n@11@01 > 0]
(assert (> n@11@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.second $t@15@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@15@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__single(diz, n - 1)
; [eval] n - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 4
(assert (not (>= (- n@11@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (>= (- n@11@01 1) 0))
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.second $t@16@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@16@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first $t@15@01)) (- n@11@01 1))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@16@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01))) n@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@16@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01))) n@11@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(n@11@01 > 0)]
(assert (not (> n@11@01 0)))
(pop) ; 3
; [eval] !(n > 0)
; [eval] n > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (> n@11@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> n@11@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(n@11@01 > 0) | live]
; [else-branch: 1 | n@11@01 > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(n@11@01 > 0)]
(assert (not (> n@11@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@17@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@17@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01))) n@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@17@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01))) n@11@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | n@11@01 > 0]
(assert (> n@11@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- History__dual ----------
(declare-const diz@18@01 $Ref)
(declare-const n@19@01 Int)
(declare-const m@20@01 Int)
(declare-const diz@21@01 $Ref)
(declare-const n@22@01 Int)
(declare-const m@23@01 Int)
(push) ; 1
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (= ($Snap.first $t@24@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@21@01 $Ref.null)))
(assert (=
  ($Snap.second $t@24@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@24@01))
    ($Snap.second ($Snap.second $t@24@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@24@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@24@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@24@01))) $Snap.unit))
; [eval] n >= 0
(assert (>= n@22@01 0))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@24@01))) $Snap.unit))
; [eval] m >= 0
(assert (>= m@23@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.second $t@25@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@25@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@26@01 Bool)
; [exec]
; var __flatten_4: Bool
(declare-const __flatten_4@27@01 Bool)
; [exec]
; var __flatten_5: Bool
(declare-const __flatten_5@28@01 Bool)
; [exec]
; __flatten_5 := History__if_any_random(diz)
; [eval] diz != null
(declare-const sys__result@29@01 Bool)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_4 := __flatten_5
; [exec]
; if_any_bool := __flatten_4
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not sys__result@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not sys__result@29@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | sys__result@29@01 | live]
; [else-branch: 2 | !(sys__result@29@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | sys__result@29@01]
(assert sys__result@29@01)
; [eval] n > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> n@22@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> n@22@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | n@22@01 > 0 | live]
; [else-branch: 3 | !(n@22@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | n@22@01 > 0]
(assert (> n@22@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.second $t@30@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@30@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, n - 1, m)
; [eval] n - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= (- n@22@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- n@22@01 1) 0))
; [eval] m >= 0
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (= ($Snap.second $t@31@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@30@01)) (- n@22@01 1)) m@23@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(n@22@01 > 0)]
(assert (not (> n@22@01 0)))
(pop) ; 4
; [eval] !(n > 0)
; [eval] n > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> n@22@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> n@22@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(n@22@01 > 0) | live]
; [else-branch: 4 | n@22@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | !(n@22@01 > 0)]
(assert (not (> n@22@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@32@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__single(diz, m)
; [eval] diz != null
; [eval] n >= 0
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (= ($Snap.second $t@33@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) m@23@01)))
; State saturation: after contract
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | n@22@01 > 0]
(assert (> n@22@01 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(sys__result@29@01)]
(assert (not sys__result@29@01))
(pop) ; 3
; [eval] !if_any_bool
(push) ; 3
(set-option :timeout 10)
(assert (not sys__result@29@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not sys__result@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(sys__result@29@01) | live]
; [else-branch: 5 | sys__result@29@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | !(sys__result@29@01)]
(assert (not sys__result@29@01))
; [eval] m > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> m@23@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> m@23@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | m@23@01 > 0 | live]
; [else-branch: 6 | !(m@23@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | m@23@01 > 0]
(assert (> m@23@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (= ($Snap.second $t@34@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@34@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, m - 1, n)
; [eval] m - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= (- m@23@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- m@23@01 1) 0))
; [eval] m >= 0
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (= ($Snap.second $t@35@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@35@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@34@01)) (- m@23@01 1)) n@22@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@35@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@35@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(m@23@01 > 0)]
(assert (not (> m@23@01 0)))
(pop) ; 4
; [eval] !(m > 0)
; [eval] m > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> m@23@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> m@23@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(m@23@01 > 0) | live]
; [else-branch: 7 | m@23@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | !(m@23@01 > 0)]
(assert (not (> m@23@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.second $t@36@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@36@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__single(diz, n)
; [eval] diz != null
; [eval] n >= 0
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(assert (= ($Snap.second $t@37@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@37@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first $t@36@01)) n@22@01)))
; State saturation: after contract
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@37@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@37@01))
  (+
    (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@24@01))) n@22@01)
    m@23@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | m@23@01 > 0]
(assert (> m@23@01 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 5 | sys__result@29@01]
(assert sys__result@29@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- History__triple21 ----------
(declare-const diz@38@01 $Ref)
(declare-const n@39@01 Int)
(declare-const m@40@01 Int)
(declare-const k@41@01 Int)
(declare-const diz@42@01 $Ref)
(declare-const n@43@01 Int)
(declare-const m@44@01 Int)
(declare-const k@45@01 Int)
(push) ; 1
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (= ($Snap.first $t@46@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@42@01 $Ref.null)))
(assert (=
  ($Snap.second $t@46@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@46@01))
    ($Snap.second ($Snap.second $t@46@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@46@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@46@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@46@01))) $Snap.unit))
; [eval] n >= 0
(assert (>= n@43@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@46@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@46@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@46@01))))
  $Snap.unit))
; [eval] m >= 0
(assert (>= m@44@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))
  $Snap.unit))
; [eval] k >= 0
(assert (>= k@45@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 ($Snap.combine ($Snap.first $t@47@01) ($Snap.second $t@47@01))))
(assert (= ($Snap.second $t@47@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@47@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@48@01 Bool)
; [exec]
; var __flatten_14: Bool
(declare-const __flatten_14@49@01 Bool)
; [exec]
; var __flatten_15: Bool
(declare-const __flatten_15@50@01 Bool)
; [exec]
; var __flatten_16: Bool
(declare-const __flatten_16@51@01 Bool)
; [exec]
; var __flatten_17: Bool
(declare-const __flatten_17@52@01 Bool)
; [exec]
; __flatten_15 := History__if_any_random(diz)
; [eval] diz != null
(declare-const sys__result@53@01 Bool)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_14 := __flatten_15
; [exec]
; if_any_bool := __flatten_14
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not sys__result@53@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not sys__result@53@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | sys__result@53@01 | live]
; [else-branch: 8 | !(sys__result@53@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | sys__result@53@01]
(assert sys__result@53@01)
; [exec]
; __flatten_17 := History__if_any_random(diz)
; [eval] diz != null
(declare-const sys__result@54@01 Bool)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_16 := __flatten_17
; [exec]
; if_any_bool := __flatten_16
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not sys__result@54@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not sys__result@54@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | sys__result@54@01 | live]
; [else-branch: 9 | !(sys__result@54@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | sys__result@54@01]
(assert sys__result@54@01)
; [eval] n > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> n@43@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> n@43@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | n@43@01 > 0 | live]
; [else-branch: 10 | !(n@43@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | n@43@01 > 0]
(assert (> n@43@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (= ($Snap.second $t@55@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@55@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__triple21(diz, n - 1, m, k)
; [eval] n - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 6
(assert (not (>= (- n@43@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (>= (- n@43@01 1) 0))
; [eval] m >= 0
; [eval] k >= 0
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 ($Snap.combine ($Snap.first $t@56@01) ($Snap.second $t@56@01))))
(assert (= ($Snap.second $t@56@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@56@01))
  (+
    (+
      (+ ($SortWrappers.$SnapToInt ($Snap.first $t@55@01)) (- n@43@01 1))
      m@44@01)
    k@45@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@56@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@56@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(n@43@01 > 0)]
(assert (not (> n@43@01 0)))
(pop) ; 5
; [eval] !(n > 0)
; [eval] n > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> n@43@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> n@43@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | !(n@43@01 > 0) | live]
; [else-branch: 11 | n@43@01 > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | !(n@43@01 > 0)]
(assert (not (> n@43@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 ($Snap.combine ($Snap.first $t@57@01) ($Snap.second $t@57@01))))
(assert (= ($Snap.second $t@57@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@57@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, m, k)
; [eval] diz != null
; [eval] n >= 0
; [eval] m >= 0
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(assert (= ($Snap.second $t@58@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@58@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@57@01)) m@44@01) k@45@01)))
; State saturation: after contract
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@58@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@58@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | n@43@01 > 0]
(assert (> n@43@01 0))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(sys__result@54@01)]
(assert (not sys__result@54@01))
(pop) ; 4
; [eval] !if_any_bool
(push) ; 4
(set-option :timeout 10)
(assert (not sys__result@54@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not sys__result@54@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | !(sys__result@54@01) | live]
; [else-branch: 12 | sys__result@54@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | !(sys__result@54@01)]
(assert (not sys__result@54@01))
; [eval] m > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> m@44@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> m@44@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | m@44@01 > 0 | live]
; [else-branch: 13 | !(m@44@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | m@44@01 > 0]
(assert (> m@44@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 ($Snap.combine ($Snap.first $t@59@01) ($Snap.second $t@59@01))))
(assert (= ($Snap.second $t@59@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@59@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__triple21(diz, m - 1, n, k)
; [eval] m - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 6
(assert (not (>= (- m@44@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (>= (- m@44@01 1) 0))
; [eval] m >= 0
; [eval] k >= 0
(declare-const $t@60@01 $Snap)
(assert (= $t@60@01 ($Snap.combine ($Snap.first $t@60@01) ($Snap.second $t@60@01))))
(assert (= ($Snap.second $t@60@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@60@01))
  (+
    (+
      (+ ($SortWrappers.$SnapToInt ($Snap.first $t@59@01)) (- m@44@01 1))
      n@43@01)
    k@45@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@60@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@60@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(m@44@01 > 0)]
(assert (not (> m@44@01 0)))
(pop) ; 5
; [eval] !(m > 0)
; [eval] m > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> m@44@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> m@44@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | !(m@44@01 > 0) | live]
; [else-branch: 14 | m@44@01 > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | !(m@44@01 > 0)]
(assert (not (> m@44@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(assert (= ($Snap.second $t@61@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@61@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, n, k)
; [eval] diz != null
; [eval] n >= 0
; [eval] m >= 0
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 ($Snap.combine ($Snap.first $t@62@01) ($Snap.second $t@62@01))))
(assert (= ($Snap.second $t@62@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@62@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@61@01)) n@43@01) k@45@01)))
; State saturation: after contract
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@62@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@62@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | m@44@01 > 0]
(assert (> m@44@01 0))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 12 | sys__result@54@01]
(assert sys__result@54@01)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 8 | !(sys__result@53@01)]
(assert (not sys__result@53@01))
(pop) ; 3
; [eval] !if_any_bool
(push) ; 3
(set-option :timeout 10)
(assert (not sys__result@53@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not sys__result@53@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | !(sys__result@53@01) | live]
; [else-branch: 15 | sys__result@53@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | !(sys__result@53@01)]
(assert (not sys__result@53@01))
; [eval] k > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> k@45@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> k@45@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | k@45@01 > 0 | live]
; [else-branch: 16 | !(k@45@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | k@45@01 > 0]
(assert (> k@45@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (= ($Snap.second $t@63@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@63@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__triple12(diz, k - 1, n, m)
; [eval] k - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= (- k@45@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- k@45@01 1) 0))
; [eval] m >= 0
; [eval] k >= 0
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 ($Snap.combine ($Snap.first $t@64@01) ($Snap.second $t@64@01))))
(assert (= ($Snap.second $t@64@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@64@01))
  (+
    (+
      (+ ($SortWrappers.$SnapToInt ($Snap.first $t@63@01)) (- k@45@01 1))
      n@43@01)
    m@44@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@64@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@64@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | !(k@45@01 > 0)]
(assert (not (> k@45@01 0)))
(pop) ; 4
; [eval] !(k > 0)
; [eval] k > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> k@45@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> k@45@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | !(k@45@01 > 0) | live]
; [else-branch: 17 | k@45@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | !(k@45@01 > 0)]
(assert (not (> k@45@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(assert (= ($Snap.second $t@65@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@65@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, n, m)
; [eval] diz != null
; [eval] n >= 0
; [eval] m >= 0
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 ($Snap.combine ($Snap.first $t@66@01) ($Snap.second $t@66@01))))
(assert (= ($Snap.second $t@66@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@66@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@65@01)) n@43@01) m@44@01)))
; State saturation: after contract
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@66@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@66@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@46@01)))
        n@43@01)
      m@44@01)
    k@45@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 17 | k@45@01 > 0]
(assert (> k@45@01 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 15 | sys__result@53@01]
(assert sys__result@53@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- History__triple12 ----------
(declare-const diz@67@01 $Ref)
(declare-const n@68@01 Int)
(declare-const m@69@01 Int)
(declare-const k@70@01 Int)
(declare-const diz@71@01 $Ref)
(declare-const n@72@01 Int)
(declare-const m@73@01 Int)
(declare-const k@74@01 Int)
(push) ; 1
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 ($Snap.combine ($Snap.first $t@75@01) ($Snap.second $t@75@01))))
(assert (= ($Snap.first $t@75@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@71@01 $Ref.null)))
(assert (=
  ($Snap.second $t@75@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@75@01))
    ($Snap.second ($Snap.second $t@75@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@75@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@75@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@75@01))) $Snap.unit))
; [eval] n >= 0
(assert (>= n@72@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@75@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
  $Snap.unit))
; [eval] m >= 0
(assert (>= m@73@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
  $Snap.unit))
; [eval] k >= 0
(assert (>= k@74@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (= ($Snap.second $t@76@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@76@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@77@01 Bool)
; [exec]
; var __flatten_30: Bool
(declare-const __flatten_30@78@01 Bool)
; [exec]
; var __flatten_31: Bool
(declare-const __flatten_31@79@01 Bool)
; [exec]
; var __flatten_36: Bool
(declare-const __flatten_36@80@01 Bool)
; [exec]
; var __flatten_37: Bool
(declare-const __flatten_37@81@01 Bool)
; [exec]
; __flatten_31 := History__if_any_random(diz)
; [eval] diz != null
(declare-const sys__result@82@01 Bool)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_30 := __flatten_31
; [exec]
; if_any_bool := __flatten_30
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not sys__result@82@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not sys__result@82@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | sys__result@82@01 | live]
; [else-branch: 18 | !(sys__result@82@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 18 | sys__result@82@01]
(assert sys__result@82@01)
; [eval] n > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> n@72@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> n@72@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | n@72@01 > 0 | live]
; [else-branch: 19 | !(n@72@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | n@72@01 > 0]
(assert (> n@72@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 ($Snap.combine ($Snap.first $t@83@01) ($Snap.second $t@83@01))))
(assert (= ($Snap.second $t@83@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@83@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__triple12(diz, n - 1, m, k)
; [eval] n - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= (- n@72@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- n@72@01 1) 0))
; [eval] m >= 0
; [eval] k >= 0
(declare-const $t@84@01 $Snap)
(assert (= $t@84@01 ($Snap.combine ($Snap.first $t@84@01) ($Snap.second $t@84@01))))
(assert (= ($Snap.second $t@84@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@84@01))
  (+
    (+
      (+ ($SortWrappers.$SnapToInt ($Snap.first $t@83@01)) (- n@72@01 1))
      m@73@01)
    k@74@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@84@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@84@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(n@72@01 > 0)]
(assert (not (> n@72@01 0)))
(pop) ; 4
; [eval] !(n > 0)
; [eval] n > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> n@72@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> n@72@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | !(n@72@01 > 0) | live]
; [else-branch: 20 | n@72@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | !(n@72@01 > 0)]
(assert (not (> n@72@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@85@01 $Snap)
(assert (= $t@85@01 ($Snap.combine ($Snap.first $t@85@01) ($Snap.second $t@85@01))))
(assert (= ($Snap.second $t@85@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@85@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, m, k)
; [eval] diz != null
; [eval] n >= 0
; [eval] m >= 0
(declare-const $t@86@01 $Snap)
(assert (= $t@86@01 ($Snap.combine ($Snap.first $t@86@01) ($Snap.second $t@86@01))))
(assert (= ($Snap.second $t@86@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@86@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@85@01)) m@73@01) k@74@01)))
; State saturation: after contract
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@86@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@86@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | n@72@01 > 0]
(assert (> n@72@01 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 18 | !(sys__result@82@01)]
(assert (not sys__result@82@01))
(pop) ; 3
; [eval] !if_any_bool
(push) ; 3
(set-option :timeout 10)
(assert (not sys__result@82@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not sys__result@82@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | !(sys__result@82@01) | live]
; [else-branch: 21 | sys__result@82@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 21 | !(sys__result@82@01)]
(assert (not sys__result@82@01))
; [exec]
; __flatten_37 := History__if_any_random(diz)
; [eval] diz != null
(declare-const sys__result@87@01 Bool)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_36 := __flatten_37
; [exec]
; if_any_bool := __flatten_36
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not sys__result@87@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not sys__result@87@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | sys__result@87@01 | live]
; [else-branch: 22 | !(sys__result@87@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | sys__result@87@01]
(assert sys__result@87@01)
; [eval] m > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> m@73@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> m@73@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | m@73@01 > 0 | live]
; [else-branch: 23 | !(m@73@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | m@73@01 > 0]
(assert (> m@73@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 ($Snap.combine ($Snap.first $t@88@01) ($Snap.second $t@88@01))))
(assert (= ($Snap.second $t@88@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@88@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__triple21(diz, m - 1, k, n)
; [eval] m - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 6
(assert (not (>= (- m@73@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (>= (- m@73@01 1) 0))
; [eval] m >= 0
; [eval] k >= 0
(declare-const $t@89@01 $Snap)
(assert (= $t@89@01 ($Snap.combine ($Snap.first $t@89@01) ($Snap.second $t@89@01))))
(assert (= ($Snap.second $t@89@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@89@01))
  (+
    (+
      (+ ($SortWrappers.$SnapToInt ($Snap.first $t@88@01)) (- m@73@01 1))
      k@74@01)
    n@72@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@89@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@89@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(m@73@01 > 0)]
(assert (not (> m@73@01 0)))
(pop) ; 5
; [eval] !(m > 0)
; [eval] m > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> m@73@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> m@73@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | !(m@73@01 > 0) | live]
; [else-branch: 24 | m@73@01 > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 24 | !(m@73@01 > 0)]
(assert (not (> m@73@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 ($Snap.combine ($Snap.first $t@90@01) ($Snap.second $t@90@01))))
(assert (= ($Snap.second $t@90@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@90@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, k, n)
; [eval] diz != null
; [eval] n >= 0
; [eval] m >= 0
(declare-const $t@91@01 $Snap)
(assert (= $t@91@01 ($Snap.combine ($Snap.first $t@91@01) ($Snap.second $t@91@01))))
(assert (= ($Snap.second $t@91@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@91@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@90@01)) k@74@01) n@72@01)))
; State saturation: after contract
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@91@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@91@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | m@73@01 > 0]
(assert (> m@73@01 0))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 22 | !(sys__result@87@01)]
(assert (not sys__result@87@01))
(pop) ; 4
; [eval] !if_any_bool
(push) ; 4
(set-option :timeout 10)
(assert (not sys__result@87@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not sys__result@87@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | !(sys__result@87@01) | live]
; [else-branch: 25 | sys__result@87@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | !(sys__result@87@01)]
(assert (not sys__result@87@01))
; [eval] k > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> k@74@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> k@74@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | k@74@01 > 0 | live]
; [else-branch: 26 | !(k@74@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 26 | k@74@01 > 0]
(assert (> k@74@01 0))
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@92@01 $Snap)
(assert (= $t@92@01 ($Snap.combine ($Snap.first $t@92@01) ($Snap.second $t@92@01))))
(assert (= ($Snap.second $t@92@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@92@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01))) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__triple21(diz, k - 1, m, n)
; [eval] k - 1
; [eval] diz != null
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 6
(assert (not (>= (- k@74@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (>= (- k@74@01 1) 0))
; [eval] m >= 0
; [eval] k >= 0
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 ($Snap.combine ($Snap.first $t@93@01) ($Snap.second $t@93@01))))
(assert (= ($Snap.second $t@93@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@93@01))
  (+
    (+
      (+ ($SortWrappers.$SnapToInt ($Snap.first $t@92@01)) (- k@74@01 1))
      m@73@01)
    n@72@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@93@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@93@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(k@74@01 > 0)]
(assert (not (> k@74@01 0)))
(pop) ; 5
; [eval] !(k > 0)
; [eval] k > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> k@74@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> k@74@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | !(k@74@01 > 0) | live]
; [else-branch: 27 | k@74@01 > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 27 | !(k@74@01 > 0)]
(assert (not (> k@74@01 0)))
; [exec]
; History__empty(diz)
; [eval] diz != null
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 ($Snap.combine ($Snap.first $t@94@01) ($Snap.second $t@94@01))))
(assert (= ($Snap.second $t@94@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x)
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@94@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, m, n)
; [eval] diz != null
; [eval] n >= 0
; [eval] m >= 0
(declare-const $t@95@01 $Snap)
(assert (= $t@95@01 ($Snap.combine ($Snap.first $t@95@01) ($Snap.second $t@95@01))))
(assert (= ($Snap.second $t@95@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@95@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@94@01)) m@73@01) n@72@01)))
; State saturation: after contract
(check-sat)
; unknown
; [eval] diz.History__x == old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m + k
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@95@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@95@01))
  (+
    (+
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01)))
        n@72@01)
      m@73@01)
    k@74@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | k@74@01 > 0]
(assert (> k@74@01 0))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 25 | sys__result@87@01]
(assert sys__result@87@01)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 21 | sys__result@82@01]
(assert sys__result@82@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- History__destroy_check ----------
(declare-const diz@96@01 $Ref)
(declare-const diz@97@01 $Ref)
(push) ; 1
(declare-const $t@98@01 $Snap)
(assert (= $t@98@01 ($Snap.combine ($Snap.first $t@98@01) ($Snap.second $t@98@01))))
(assert (= ($Snap.first $t@98@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@97@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@99@01 $Snap)
(assert (= $t@99@01 ($Snap.combine ($Snap.first $t@99@01) ($Snap.second $t@99@01))))
(assert (= ($Snap.second $t@99@01) $Snap.unit))
; [eval] old(diz.History__x) == 0 ==> diz.History__x == 1
; [eval] old(diz.History__x) == 0
; [eval] old(diz.History__x)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | Second:($t@98@01) == 0 | live]
; [else-branch: 28 | Second:($t@98@01) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 28 | Second:($t@98@01) == 0]
(assert (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0))
; [eval] diz.History__x == 1
(pop) ; 4
(push) ; 4
; [else-branch: 28 | Second:($t@98@01) != 0]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0))
  (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)))
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@99@01)) 1)))
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@100@01 Bool)
; [eval] 1 > 0
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 29 | True]
; [exec]
; History__incr(diz)
; [eval] diz != null
(declare-const $t@101@01 $Snap)
(assert (= $t@101@01 ($Snap.combine ($Snap.first $t@101@01) ($Snap.second $t@101@01))))
(assert (= ($Snap.second $t@101@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@101@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__single(diz, 1 - 1)
; [eval] 1 - 1
; [eval] diz != null
; [eval] n >= 0
(declare-const $t@102@01 $Snap)
(assert (= $t@102@01 ($Snap.combine ($Snap.first $t@102@01) ($Snap.second $t@102@01))))
(assert (= ($Snap.second $t@102@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@102@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@101@01))))
; State saturation: after contract
(check-sat)
; unknown
; [eval] old(diz.History__x) == 0 ==> diz.History__x == 1
; [eval] old(diz.History__x) == 0
; [eval] old(diz.History__x)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | Second:($t@98@01) == 0 | live]
; [else-branch: 30 | Second:($t@98@01) != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | Second:($t@98@01) == 0]
(assert (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0))
; [eval] diz.History__x == 1
(pop) ; 5
(push) ; 5
; [else-branch: 30 | Second:($t@98@01) != 0]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0))
  (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)))
(push) ; 4
(assert (not (=>
  (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@102@01)) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.second $t@98@01)) 0)
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@102@01)) 1)))
(pop) ; 3
; [eval] !(1 > 0)
; [eval] 1 > 0
; [then-branch: 31 | False | dead]
; [else-branch: 31 | True | live]
(push) ; 3
; [else-branch: 31 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- History__History ----------
(declare-const sys__result@103@01 $Ref)
(declare-const sys__result@104@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@105@01 $Snap)
(assert (= $t@105@01 ($Snap.combine ($Snap.first $t@105@01) ($Snap.second $t@105@01))))
(assert (= ($Snap.first $t@105@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@104@01 $Ref.null)))
(assert (=
  ($Snap.second $t@105@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@105@01))
    ($Snap.second ($Snap.second $t@105@01)))))
(assert (= ($Snap.second ($Snap.second $t@105@01)) $Snap.unit))
; [eval] sys__result.History__x == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@105@01))) 0))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@106@01 $Ref)
; [exec]
; var __flatten_92: Ref
(declare-const __flatten_92@107@01 $Ref)
; [exec]
; __flatten_92 := new(History__x, History__x_old, History__Integer_value)
(declare-const __flatten_92@108@01 $Ref)
(assert (not (= __flatten_92@108@01 $Ref.null)))
(declare-const History__x@109@01 Int)
(declare-const History__x_old@110@01 Int)
(declare-const History__Integer_value@111@01 Int)
(assert (not (= __flatten_92@108@01 sys__result@104@01)))
(assert (not (= __flatten_92@108@01 diz@106@01)))
(assert (not (= __flatten_92@108@01 __flatten_92@107@01)))
; [exec]
; diz := __flatten_92
; [exec]
; diz.History__x := 0
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.History__x, write) && sys__result.History__x == 0)
; [eval] sys__result != null
; [eval] sys__result.History__x == 0
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__empty_begin ----------
(declare-const diz@112@01 $Ref)
(declare-const diz@113@01 $Ref)
(push) ; 1
(declare-const $t@114@01 $Snap)
(assert (= $t@114@01 $Snap.unit))
; [eval] diz != null
(assert (not (= diz@113@01 $Ref.null)))
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
; ---------- History__empty_commit ----------
(declare-const diz@115@01 $Ref)
(declare-const diz@116@01 $Ref)
(push) ; 1
(declare-const $t@117@01 $Snap)
(assert (= $t@117@01 $Snap.unit))
; [eval] diz != null
(assert (not (= diz@116@01 $Ref.null)))
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
; ---------- History__incr_begin ----------
(declare-const diz@118@01 $Ref)
(declare-const diz@119@01 $Ref)
(push) ; 1
(declare-const $t@120@01 $Snap)
(assert (= $t@120@01 $Snap.unit))
; [eval] diz != null
(assert (not (= diz@119@01 $Ref.null)))
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
; ---------- History__incr_commit ----------
(declare-const diz@121@01 $Ref)
(declare-const diz@122@01 $Ref)
(push) ; 1
(declare-const $t@123@01 $Snap)
(assert (= $t@123@01 $Snap.unit))
; [eval] diz != null
(assert (not (= diz@122@01 $Ref.null)))
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
; ---------- History__if_any_random ----------
(declare-const diz@124@01 $Ref)
(declare-const sys__result@125@01 Bool)
(declare-const diz@126@01 $Ref)
(declare-const sys__result@127@01 Bool)
(push) ; 1
(declare-const $t@128@01 $Snap)
(assert (= $t@128@01 $Snap.unit))
; [eval] diz != null
(assert (not (= diz@126@01 $Ref.null)))
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
