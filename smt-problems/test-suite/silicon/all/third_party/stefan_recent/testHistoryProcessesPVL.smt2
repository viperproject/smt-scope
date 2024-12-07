(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testHistoryProcessesPVL.vpr
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
; ---------- History__incr ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const diz@2@01 $Ref)
(declare-const current_thread_id@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@3@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@5@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@4@01))) 1)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__single ----------
(declare-const diz@6@01 $Ref)
(declare-const current_thread_id@7@01 Int)
(declare-const n@8@01 Int)
(declare-const diz@9@01 $Ref)
(declare-const current_thread_id@10@01 Int)
(declare-const n@11@01 Int)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.first $t@12@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@9@01 $Ref.null)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@10@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
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
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
    n@11@01)))
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
; History__incr(diz, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.second $t@15@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@15@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__single(diz, current_thread_id, n - 1)
; [eval] n - 1
; [eval] diz != null
; [eval] current_thread_id >= 0
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
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
    n@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@16@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
    n@11@01)))
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
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
    n@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
    n@11@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | n@11@01 > 0]
(assert (> n@11@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- History__dual ----------
(declare-const diz@17@01 $Ref)
(declare-const current_thread_id@18@01 Int)
(declare-const n@19@01 Int)
(declare-const m@20@01 Int)
(declare-const diz@21@01 $Ref)
(declare-const current_thread_id@22@01 Int)
(declare-const n@23@01 Int)
(declare-const m@24@01 Int)
(push) ; 1
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@21@01 $Ref.null)))
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.first ($Snap.second $t@25@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@22@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@25@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@25@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@25@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
  $Snap.unit))
; [eval] n >= 0
(assert (>= n@23@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
  $Snap.unit))
; [eval] m >= 0
(assert (>= m@24@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.second $t@26@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@26@01))
  (+
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@27@01 Bool)
; [exec]
; var __flatten_3: Bool
(declare-const __flatten_3@28@01 Bool)
; [exec]
; __flatten_3 := History__if_any_random(diz, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const sys__result@29@01 Bool)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; if_any_bool := __flatten_3
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
(assert (not (not (> n@23@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> n@23@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | n@23@01 > 0 | live]
; [else-branch: 3 | !(n@23@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | n@23@01 > 0]
(assert (> n@23@01 0))
; [exec]
; History__incr(diz, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.second $t@30@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@30@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, current_thread_id, n - 1, m)
; [eval] n - 1
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= (- n@23@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- n@23@01 1) 0))
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
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@30@01)) (- n@23@01 1)) m@24@01)))
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
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))
  (+
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(n@23@01 > 0)]
(assert (not (> n@23@01 0)))
(pop) ; 4
; [eval] !(n > 0)
; [eval] n > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> n@23@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> n@23@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(n@23@01 > 0) | live]
; [else-branch: 4 | n@23@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | !(n@23@01 > 0)]
(assert (not (> n@23@01 0)))
; [exec]
; History__single(diz, current_thread_id, m)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] n >= 0
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@32@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
    m@24@01)))
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
  ($SortWrappers.$SnapToInt ($Snap.first $t@32@01))
  (+
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@32@01))
  (+
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | n@23@01 > 0]
(assert (> n@23@01 0))
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
(assert (not (not (> m@24@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> m@24@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | m@24@01 > 0 | live]
; [else-branch: 6 | !(m@24@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | m@24@01 > 0]
(assert (> m@24@01 0))
; [exec]
; History__incr(diz, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (= ($Snap.second $t@33@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + 1
; [eval] old(diz.History__x) + 1
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__dual(diz, current_thread_id, m - 1, n)
; [eval] m - 1
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] n >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= (- m@24@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- m@24@01 1) 0))
; [eval] m >= 0
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (= ($Snap.second $t@34@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n + m
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@34@01))
  (+ (+ ($SortWrappers.$SnapToInt ($Snap.first $t@33@01)) (- m@24@01 1)) n@23@01)))
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
  ($SortWrappers.$SnapToInt ($Snap.first $t@34@01))
  (+
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@34@01))
  (+
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(m@24@01 > 0)]
(assert (not (> m@24@01 0)))
(pop) ; 4
; [eval] !(m > 0)
; [eval] m > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> m@24@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> m@24@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(m@24@01 > 0) | live]
; [else-branch: 7 | m@24@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | !(m@24@01 > 0)]
(assert (not (> m@24@01 0)))
; [exec]
; History__single(diz, current_thread_id, n)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] n >= 0
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (= ($Snap.second $t@35@01) $Snap.unit))
; [eval] diz.History__x == old(diz.History__x) + n
; [eval] old(diz.History__x) + n
; [eval] old(diz.History__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@35@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
    n@23@01)))
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
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@35@01))
  (+
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@25@01))))
      n@23@01)
    m@24@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | m@24@01 > 0]
(assert (> m@24@01 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 5 | sys__result@29@01]
(assert sys__result@29@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- History__if_any_random ----------
(declare-const diz@36@01 $Ref)
(declare-const current_thread_id@37@01 Int)
(declare-const sys__result@38@01 Bool)
(declare-const diz@39@01 $Ref)
(declare-const current_thread_id@40@01 Int)
(declare-const sys__result@41@01 Bool)
(push) ; 1
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01))))
(assert (= ($Snap.first $t@42@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@39@01 $Ref.null)))
(assert (= ($Snap.second $t@42@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@40@01 0))
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
