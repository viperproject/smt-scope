(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:17
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testPVLLocks.vpr
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
(declare-fun Worker__joinToken%trigger ($Snap $Ref) Bool)
(declare-fun Queue__lock_held%trigger ($Snap $Ref) Bool)
(declare-fun Queue__lock_invariant%trigger ($Snap $Ref) Bool)
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
; ---------- Main__Main ----------
(declare-const current_thread_id@0@01 Int)
(declare-const sys__result@1@01 $Ref)
(declare-const current_thread_id@2@01 Int)
(declare-const sys__result@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@2@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.first $t@5@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (<= $Perm.No $k@6@01))
(assert (<= $k@6@01 $Perm.Write))
(assert (=> (< $Perm.No $k@6@01) (not (= sys__result@3@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@5@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@5@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@5@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@5@01))) $Snap.unit))
; [eval] sys__result.Main__q1 != null
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@5@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@5@01)))))))
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (<= $Perm.No $k@7@01))
(assert (<= $k@7@01 $Perm.Write))
(assert (=> (< $Perm.No $k@7@01) (not (= sys__result@3@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@5@01))))
  $Snap.unit))
; [eval] sys__result.Main__q2 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@01)))))
    $Ref.null)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@8@01 $Ref)
; [exec]
; var __flatten_1: Ref
(declare-const __flatten_1@9@01 $Ref)
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@10@01 $Ref)
; [exec]
; var __flatten_3: Ref
(declare-const __flatten_3@11@01 $Ref)
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@12@01 $Ref)
; [exec]
; var __flatten_24: Ref
(declare-const __flatten_24@13@01 $Ref)
; [exec]
; var __flatten_26: Ref
(declare-const __flatten_26@14@01 $Ref)
; [exec]
; diz := new(Main__q1, Main__q2)
(declare-const diz@15@01 $Ref)
(assert (not (= diz@15@01 $Ref.null)))
(declare-const Main__q1@16@01 $Ref)
(declare-const Main__q2@17@01 $Ref)
(assert (not (= diz@15@01 __flatten_1@9@01)))
(assert (not (= diz@15@01 __flatten_2@10@01)))
(assert (not (= diz@15@01 __flatten_24@13@01)))
(assert (not (= diz@15@01 __flatten_26@14@01)))
(assert (not (= diz@15@01 diz@8@01)))
(assert (not (= diz@15@01 __flatten_4@12@01)))
(assert (not (= diz@15@01 sys__result@3@01)))
(assert (not (= diz@15@01 __flatten_3@11@01)))
; [exec]
; __flatten_2 := Queue__Queue(current_thread_id)
; [eval] current_thread_id >= 0
(declare-const sys__result@18@01 $Ref)
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@18@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_1 := __flatten_2
; [exec]
; __flatten_24 := __flatten_1
; [exec]
; diz.Main__q1 := __flatten_24
; [exec]
; __flatten_4 := Queue__Queue(current_thread_id)
; [eval] current_thread_id >= 0
(declare-const sys__result@20@01 $Ref)
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@20@01 $Ref.null)))
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __flatten_3 := __flatten_4
; [exec]
; __flatten_26 := __flatten_3
; [exec]
; diz.Main__q2 := __flatten_26
; [exec]
; Queue__put(diz.Main__q1, current_thread_id, 1)
; [eval] diz != null
; [eval] current_thread_id >= 0
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; Queue__put(diz.Main__q2, current_thread_id, 2)
; [eval] diz != null
; [eval] current_thread_id >= 0
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Main__q1, wildcard) &&
;   (sys__result.Main__q1 != null &&
;   (acc(sys__result.Main__q2, wildcard) && sys__result.Main__q2 != null)))
; [eval] sys__result != null
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(assert (< $k@22@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@22@01)))
(assert (<= (- $Perm.Write $k@22@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@22@01)) (not (= diz@15@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sys__result.Main__q1 != null
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(assert (< $k@23@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@23@01)))
(assert (<= (- $Perm.Write $k@23@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@23@01)) (not (= diz@15@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sys__result.Main__q2 != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Main__main ----------
(declare-const diz@24@01 $Ref)
(declare-const current_thread_id@25@01 Int)
(declare-const diz@26@01 $Ref)
(declare-const current_thread_id@27@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(assert (= ($Snap.first $t@28@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@26@01 $Ref.null)))
(assert (=
  ($Snap.second $t@28@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@28@01))
    ($Snap.second ($Snap.second $t@28@01)))))
(assert (= ($Snap.first ($Snap.second $t@28@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@27@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@28@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@28@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
(declare-const $k@29@01 $Perm)
(assert ($Perm.isReadVar $k@29@01))
(assert (<= $Perm.No $k@29@01))
(assert (<= $k@29@01 $Perm.Write))
(assert (=> (< $Perm.No $k@29@01) (not (= diz@26@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@28@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))
  $Snap.unit))
; [eval] diz.Main__q1 != null
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(declare-const $k@30@01 $Perm)
(assert ($Perm.isReadVar $k@30@01))
(assert (<= $Perm.No $k@30@01))
(assert (<= $k@30@01 $Perm.Write))
(assert (=> (< $Perm.No $k@30@01) (not (= diz@26@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Snap.unit))
; [eval] diz.Main__q2 != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@30@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
    $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var w1: Ref
(declare-const w1@31@01 $Ref)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@32@01 $Ref)
; [exec]
; var w2: Ref
(declare-const w2@33@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@34@01 $Ref)
; [exec]
; __flatten_7 := Worker__Worker(current_thread_id, diz.Main__q1, diz.Main__q2)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@30@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] current_thread_id >= 0
(declare-const sys__result@35@01 $Ref)
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.first $t@36@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@35@01 $Ref.null)))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(assert (<= $Perm.No $k@37@01))
(assert (<= $k@37@01 $Perm.Write))
(assert (=> (< $Perm.No $k@37@01) (not (= sys__result@35@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@36@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@36@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@36@01))) $Snap.unit))
; [eval] sys__result.Worker__q1 == q1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@36@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
(declare-const $k@38@01 $Perm)
(assert ($Perm.isReadVar $k@38@01))
(assert (<= $Perm.No $k@38@01))
(assert (<= $k@38@01 $Perm.Write))
(assert (=> (< $Perm.No $k@38@01) (not (= sys__result@35@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  $Snap.unit))
; [eval] sys__result.Worker__q2 == q2
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@38@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; w1 := __flatten_7
; [exec]
; __flatten_8 := Worker__Worker(current_thread_id, diz.Main__q2, diz.Main__q1)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@30@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] current_thread_id >= 0
(declare-const sys__result@39@01 $Ref)
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 ($Snap.combine ($Snap.first $t@40@01) ($Snap.second $t@40@01))))
(assert (= ($Snap.first $t@40@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@39@01 $Ref.null)))
(assert (=
  ($Snap.second $t@40@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@40@01))
    ($Snap.second ($Snap.second $t@40@01)))))
(declare-const $k@41@01 $Perm)
(assert ($Perm.isReadVar $k@41@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= sys__result@35@01 sys__result@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@41@01))
(assert (<= $k@41@01 $Perm.Write))
(assert (=> (< $Perm.No $k@41@01) (not (= sys__result@39@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@40@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@40@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@40@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@40@01))) $Snap.unit))
; [eval] sys__result.Worker__q1 == q1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@41@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@40@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@40@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@40@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))))
(declare-const $k@42@01 $Perm)
(assert ($Perm.isReadVar $k@42@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= sys__result@35@01 sys__result@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@42@01))
(assert (<= $k@42@01 $Perm.Write))
(assert (=> (< $Perm.No $k@42@01) (not (= sys__result@39@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01))))
  $Snap.unit))
; [eval] sys__result.Worker__q2 == q2
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@42@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; w2 := __flatten_8
; [exec]
; Worker__forkOperator(w1, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $k@43@01 $Perm)
(assert ($Perm.isReadVar $k@43@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@37@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@43@01 $k@37@01))
(assert (<= $Perm.No (- $k@37@01 $k@43@01)))
(assert (<= (- $k@37@01 $k@43@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@37@01 $k@43@01)) (not (= sys__result@35@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__q1 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))) $Ref.null)))
(declare-const $k@44@01 $Perm)
(assert ($Perm.isReadVar $k@44@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@38@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@44@01 $k@38@01))
(assert (<= $Perm.No (- $k@38@01 $k@44@01)))
(assert (<= (- $k@38@01 $k@44@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@38@01 $k@44@01)) (not (= sys__result@35@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@44@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__q2 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@38@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
    $Ref.null)))
(declare-const $t@45@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Worker__forkOperator(w2, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $k@46@01 $Perm)
(assert ($Perm.isReadVar $k@46@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@41@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@46@01 $k@41@01))
(assert (<= $Perm.No (- $k@41@01 $k@46@01)))
(assert (<= (- $k@41@01 $k@46@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@41@01 $k@46@01)) (not (= sys__result@39@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__q1 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@41@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@40@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@40@01))) $Ref.null)))
(declare-const $k@47@01 $Perm)
(assert ($Perm.isReadVar $k@47@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@42@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@47@01 $k@42@01))
(assert (<= $Perm.No (- $k@42@01 $k@47@01)))
(assert (<= (- $k@42@01 $k@47@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@42@01 $k@47@01)) (not (= sys__result@39@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@47@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__q2 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@42@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))
    $Ref.null)))
(declare-const $t@48@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (= sys__result@35@01 sys__result@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Worker__joinOperator(w1, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; Worker__joinOperator(w2, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
; State saturation: after contract
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- Worker__Worker ----------
(declare-const current_thread_id@49@01 Int)
(declare-const q1@50@01 $Ref)
(declare-const q2@51@01 $Ref)
(declare-const sys__result@52@01 $Ref)
(declare-const current_thread_id@53@01 Int)
(declare-const q1@54@01 $Ref)
(declare-const q2@55@01 $Ref)
(declare-const sys__result@56@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@53@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(assert (= ($Snap.first $t@58@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@56@01 $Ref.null)))
(assert (=
  ($Snap.second $t@58@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@58@01))
    ($Snap.second ($Snap.second $t@58@01)))))
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(assert (<= $Perm.No $k@59@01))
(assert (<= $k@59@01 $Perm.Write))
(assert (=> (< $Perm.No $k@59@01) (not (= sys__result@56@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@58@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@58@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@58@01))) $Snap.unit))
; [eval] sys__result.Worker__q1 == q1
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@59@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@58@01))) q1@54@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@58@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))
(declare-const $k@60@01 $Perm)
(assert ($Perm.isReadVar $k@60@01))
(assert (<= $Perm.No $k@60@01))
(assert (<= $k@60@01 $Perm.Write))
(assert (=> (< $Perm.No $k@60@01) (not (= sys__result@56@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
  $Snap.unit))
; [eval] sys__result.Worker__q2 == q2
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))
  q2@55@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@61@01 $Ref)
; [exec]
; var __flatten_13: Ref
(declare-const __flatten_13@62@01 $Ref)
; [exec]
; var __flatten_14: Ref
(declare-const __flatten_14@63@01 $Ref)
; [exec]
; var __flatten_35: Ref
(declare-const __flatten_35@64@01 $Ref)
; [exec]
; var __flatten_36: Ref
(declare-const __flatten_36@65@01 $Ref)
; [exec]
; diz := new(Worker__q1, Worker__q2)
(declare-const diz@66@01 $Ref)
(assert (not (= diz@66@01 $Ref.null)))
(declare-const Worker__q1@67@01 $Ref)
(declare-const Worker__q2@68@01 $Ref)
(assert (not (= diz@66@01 diz@61@01)))
(assert (not (= diz@66@01 __flatten_36@65@01)))
(assert (not (= diz@66@01 __flatten_14@63@01)))
(assert (not (= diz@66@01 sys__result@56@01)))
(assert (not (= diz@66@01 __flatten_13@62@01)))
(assert (not (= diz@66@01 q1@54@01)))
(assert (not (= diz@66@01 q2@55@01)))
(assert (not (= diz@66@01 __flatten_35@64@01)))
; [exec]
; __flatten_13 := q1
; [exec]
; __flatten_35 := __flatten_13
; [exec]
; diz.Worker__q1 := __flatten_35
; [exec]
; __flatten_14 := q2
; [exec]
; __flatten_36 := __flatten_14
; [exec]
; diz.Worker__q2 := __flatten_36
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Worker__q1, wildcard) &&
;   (sys__result.Worker__q1 == q1 &&
;   (acc(sys__result.Worker__q2, wildcard) && sys__result.Worker__q2 == q2)))
; [eval] sys__result != null
(declare-const $k@69@01 $Perm)
(assert ($Perm.isReadVar $k@69@01))
(assert (< $k@69@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@69@01)))
(assert (<= (- $Perm.Write $k@69@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@69@01)) (not (= diz@66@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@69@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sys__result.Worker__q1 == q1
(declare-const $k@70@01 $Perm)
(assert ($Perm.isReadVar $k@70@01))
(assert (< $k@70@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@70@01)))
(assert (<= (- $Perm.Write $k@70@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@70@01)) (not (= diz@66@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sys__result.Worker__q2 == q2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__forkOperator ----------
(declare-const diz@71@01 $Ref)
(declare-const current_thread_id@72@01 Int)
(declare-const diz@73@01 $Ref)
(declare-const current_thread_id@74@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 ($Snap.combine ($Snap.first $t@75@01) ($Snap.second $t@75@01))))
(assert (= ($Snap.first $t@75@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@73@01 $Ref.null)))
(assert (=
  ($Snap.second $t@75@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@75@01))
    ($Snap.second ($Snap.second $t@75@01)))))
(assert (= ($Snap.first ($Snap.second $t@75@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@74@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@75@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@75@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
(declare-const $k@76@01 $Perm)
(assert ($Perm.isReadVar $k@76@01))
(assert (<= $Perm.No $k@76@01))
(assert (<= $k@76@01 $Perm.Write))
(assert (=> (< $Perm.No $k@76@01) (not (= diz@73@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@75@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
  $Snap.unit))
; [eval] diz.Worker__q1 != null
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@76@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@75@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))
(declare-const $k@77@01 $Perm)
(assert ($Perm.isReadVar $k@77@01))
(assert (<= $Perm.No $k@77@01))
(assert (<= $k@77@01 $Perm.Write))
(assert (=> (< $Perm.No $k@77@01) (not (= diz@73@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
  $Snap.unit))
; [eval] diz.Worker__q2 != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@77@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
    $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@78@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__joinOperator ----------
(declare-const diz@79@01 $Ref)
(declare-const current_thread_id@80@01 Int)
(declare-const diz@81@01 $Ref)
(declare-const current_thread_id@82@01 Int)
(push) ; 1
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 ($Snap.combine ($Snap.first $t@83@01) ($Snap.second $t@83@01))))
(assert (= ($Snap.first $t@83@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@81@01 $Ref.null)))
(assert (=
  ($Snap.second $t@83@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@83@01))
    ($Snap.second ($Snap.second $t@83@01)))))
(assert (= ($Snap.first ($Snap.second $t@83@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@82@01 0))
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
; ---------- Worker__run ----------
(declare-const diz@84@01 $Ref)
(declare-const current_thread_id@85@01 Int)
(declare-const diz@86@01 $Ref)
(declare-const current_thread_id@87@01 Int)
(push) ; 1
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 ($Snap.combine ($Snap.first $t@88@01) ($Snap.second $t@88@01))))
(assert (= ($Snap.first $t@88@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@86@01 $Ref.null)))
(assert (=
  ($Snap.second $t@88@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@88@01))
    ($Snap.second ($Snap.second $t@88@01)))))
(assert (= ($Snap.first ($Snap.second $t@88@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@87@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@88@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@88@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))
(declare-const $k@89@01 $Perm)
(assert ($Perm.isReadVar $k@89@01))
(assert (<= $Perm.No $k@89@01))
(assert (<= $k@89@01 $Perm.Write))
(assert (=> (< $Perm.No $k@89@01) (not (= diz@86@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@88@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@88@01))))
  $Snap.unit))
; [eval] diz.Worker__q1 != null
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@89@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@88@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))))
(declare-const $k@90@01 $Perm)
(assert ($Perm.isReadVar $k@90@01))
(assert (<= $Perm.No $k@90@01))
(assert (<= $k@90@01 $Perm.Write))
(assert (=> (< $Perm.No $k@90@01) (not (= diz@86@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01)))))
  $Snap.unit))
; [eval] diz.Worker__q2 != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@90@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))
    $Ref.null)))
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
(declare-const tmp@91@01 Int)
; [exec]
; var i: Int
(declare-const i@92@01 Int)
; [exec]
; var __flatten_15: Int
(declare-const __flatten_15@93@01 Int)
; [exec]
; i := 0
(declare-const __flatten_15@94@01 Int)
(declare-const tmp@95@01 Int)
(declare-const i@96@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@97@01 $Snap)
(assert (= $t@97@01 ($Snap.combine ($Snap.first $t@97@01) ($Snap.second $t@97@01))))
(assert (= ($Snap.first $t@97@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@96@01))
(assert (=
  ($Snap.second $t@97@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@97@01))
    ($Snap.second ($Snap.second $t@97@01)))))
(assert (= ($Snap.first ($Snap.second $t@97@01)) $Snap.unit))
; [eval] i <= 4
(assert (<= i@96@01 4))
(assert (=
  ($Snap.second ($Snap.second $t@97@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@97@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
(declare-const $k@98@01 $Perm)
(assert ($Perm.isReadVar $k@98@01))
(assert (<= $Perm.No $k@98@01))
(assert (<= $k@98@01 $Perm.Write))
(assert (=> (< $Perm.No $k@98@01) (not (= diz@86@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@97@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
  $Snap.unit))
; [eval] diz.Worker__q1 != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@98@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@97@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))
(declare-const $k@99@01 $Perm)
(assert ($Perm.isReadVar $k@99@01))
(assert (<= $Perm.No $k@99@01))
(assert (<= $k@99@01 $Perm.Write))
(assert (=> (< $Perm.No $k@99@01) (not (= diz@86@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
  $Snap.unit))
; [eval] diz.Worker__q2 != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@99@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
    $Ref.null)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i <= 4
(declare-const $k@100@01 $Perm)
(assert ($Perm.isReadVar $k@100@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@89@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@100@01 $k@89@01))
(assert (<= $Perm.No (- $k@89@01 $k@100@01)))
(assert (<= (- $k@89@01 $k@100@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@89@01 $k@100@01)) (not (= diz@86@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@100@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__q1 != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@89@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@101@01 $Perm)
(assert ($Perm.isReadVar $k@101@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@90@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@101@01 $k@90@01))
(assert (<= $Perm.No (- $k@90@01 $k@101@01)))
(assert (<= (- $k@90@01 $k@101@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@90@01 $k@101@01)) (not (= diz@86@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@101@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__q2 != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@90@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 4
(assert ($Perm.isReadVar $k@98@01))
(assert ($Perm.isReadVar $k@99@01))
(assert (= $t@97@01 ($Snap.combine ($Snap.first $t@97@01) ($Snap.second $t@97@01))))
(assert (= ($Snap.first $t@97@01) $Snap.unit))
(assert (<= 0 i@96@01))
(assert (=
  ($Snap.second $t@97@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@97@01))
    ($Snap.second ($Snap.second $t@97@01)))))
(assert (= ($Snap.first ($Snap.second $t@97@01)) $Snap.unit))
(assert (<= i@96@01 4))
(assert (=
  ($Snap.second ($Snap.second $t@97@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@97@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
(assert (<= $Perm.No $k@98@01))
(assert (<= $k@98@01 $Perm.Write))
(assert (=> (< $Perm.No $k@98@01) (not (= diz@86@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@97@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
  $Snap.unit))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@97@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))
(assert (<= $Perm.No $k@99@01))
(assert (<= $k@99@01 $Perm.Write))
(assert (=> (< $Perm.No $k@99@01) (not (= diz@86@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
  $Snap.unit))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
    $Ref.null)))
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
; [eval] i < 4
(pop) ; 5
(push) ; 5
; [eval] !(i < 4)
; [eval] i < 4
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@96@01 4))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@96@01 4)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@96@01 < 4 | live]
; [else-branch: 0 | !(i@96@01 < 4) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | i@96@01 < 4]
(assert (< i@96@01 4))
; [exec]
; __flatten_15 := Queue__take(diz.Worker__q1, current_thread_id)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@98@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const sys__result@102@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; tmp := __flatten_15
; [exec]
; tmp := tmp + 2
; [eval] tmp + 2
(declare-const tmp@103@01 Int)
(assert (= tmp@103@01 (+ sys__result@102@01 2)))
; [exec]
; Queue__put(diz.Worker__q2, current_thread_id, tmp)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@99@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] diz != null
; [eval] current_thread_id >= 0
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@104@01 Int)
(assert (= i@104@01 (+ i@96@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@104@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@104@01))
; [eval] i <= 4
(push) ; 6
(assert (not (<= i@104@01 4)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@104@01 4))
(declare-const $k@105@01 $Perm)
(assert ($Perm.isReadVar $k@105@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $k@98@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< $k@105@01 $k@98@01))
(assert (<= $Perm.No (- $k@98@01 $k@105@01)))
(assert (<= (- $k@98@01 $k@105@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@98@01 $k@105@01)) (not (= diz@86@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@105@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__q1 != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@98@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const $k@106@01 $Perm)
(assert ($Perm.isReadVar $k@106@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $k@99@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< $k@106@01 $k@99@01))
(assert (<= $Perm.No (- $k@99@01 $k@106@01)))
(assert (<= (- $k@99@01 $k@106@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@99@01 $k@106@01)) (not (= diz@86@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@106@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__q2 != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@99@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 0 | !(i@96@01 < 4)]
(assert (not (< i@96@01 4)))
(pop) ; 5
(declare-const $t@107@01 $Ref)
(declare-const $t@108@01 $Ref)
(assert (and
  (=>
    (< $Perm.No $k@98@01)
    (=
      $t@107@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@97@01))))))
  (=>
    (< $Perm.No (- $k@89@01 $k@100@01))
    (=
      $t@107@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@88@01))))))))
(assert (and
  (=>
    (< $Perm.No $k@99@01)
    (=
      $t@108@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))
  (=>
    (< $Perm.No (- $k@90@01 $k@101@01))
    (=
      $t@108@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))))))
(assert (<= $Perm.No (+ $k@99@01 (- $k@90@01 $k@101@01))))
(assert (<= (+ $k@99@01 (- $k@90@01 $k@101@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (+ $k@99@01 (- $k@90@01 $k@101@01)))
  (not (= diz@86@01 $Ref.null))))
(assert (<= $Perm.No (+ $k@98@01 (- $k@89@01 $k@100@01))))
(assert (<= (+ $k@98@01 (- $k@89@01 $k@100@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (+ $k@98@01 (- $k@89@01 $k@100@01)))
  (not (= diz@86@01 $Ref.null))))
; [eval] !(i < 4)
; [eval] i < 4
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@96@01 4)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@96@01 4))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(i@96@01 < 4) | live]
; [else-branch: 1 | i@96@01 < 4 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(i@96@01 < 4)]
(assert (not (< i@96@01 4)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i@96@01 < 4]
(assert (< i@96@01 4))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Queue__Queue ----------
(declare-const current_thread_id@109@01 Int)
(declare-const sys__result@110@01 $Ref)
(declare-const current_thread_id@111@01 Int)
(declare-const sys__result@112@01 $Ref)
(push) ; 1
(declare-const $t@113@01 $Snap)
(assert (= $t@113@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@111@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@114@01 $Snap)
(assert (= $t@114@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@112@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@115@01 $Ref)
; [exec]
; var __flatten_17: Int
(declare-const __flatten_17@116@01 Int)
; [exec]
; var __flatten_18: Bool
(declare-const __flatten_18@117@01 Bool)
; [exec]
; var __flatten_39: Int
(declare-const __flatten_39@118@01 Int)
; [exec]
; var __flatten_40: Bool
(declare-const __flatten_40@119@01 Bool)
; [exec]
; diz := new(Queue__data, Queue__used)
(declare-const diz@120@01 $Ref)
(assert (not (= diz@120@01 $Ref.null)))
(declare-const Queue__data@121@01 Int)
(declare-const Queue__used@122@01 Bool)
(assert (not (= diz@120@01 sys__result@112@01)))
(assert (not (= diz@120@01 diz@115@01)))
; [exec]
; __flatten_17 := 37
; [exec]
; __flatten_39 := __flatten_17
; [exec]
; diz.Queue__data := __flatten_39
; [exec]
; __flatten_18 := false
; [exec]
; __flatten_40 := __flatten_18
; [exec]
; diz.Queue__used := __flatten_40
; [exec]
; fold acc(Queue__lock_invariant(diz), write)
(assert (Queue__lock_invariant%trigger ($Snap.combine
  ($SortWrappers.BoolTo$Snap false)
  ($SortWrappers.IntTo$Snap 37)) diz@120@01))
; [exec]
; exhale acc(Queue__lock_invariant(diz), write)
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Queue__put ----------
(declare-const diz@123@01 $Ref)
(declare-const current_thread_id@124@01 Int)
(declare-const x@125@01 Int)
(declare-const diz@126@01 $Ref)
(declare-const current_thread_id@127@01 Int)
(declare-const x@128@01 Int)
(push) ; 1
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 ($Snap.combine ($Snap.first $t@129@01) ($Snap.second $t@129@01))))
(assert (= ($Snap.first $t@129@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@126@01 $Ref.null)))
(assert (= ($Snap.second $t@129@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@127@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_19: Bool
(declare-const __flatten_19@130@01 Bool)
; [exec]
; var __flatten_20: Int
(declare-const __flatten_20@131@01 Int)
; [exec]
; var __flatten_41: Bool
(declare-const __flatten_41@132@01 Bool)
; [exec]
; var __flatten_42: Int
(declare-const __flatten_42@133@01 Int)
; [exec]
; inhale acc(Queue__lock_invariant(diz), write)
(declare-const $t@134@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(Queue__lock_invariant(diz), write)
(assert (= $t@134@01 ($Snap.combine ($Snap.first $t@134@01) ($Snap.second $t@134@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Queue__lock_invariant%trigger $t@134@01 diz@126@01))
; [exec]
; inhale acc(Queue__lock_held(diz), write)
(declare-const $t@135@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@136@01 $Snap)
(assert (= $t@136@01 ($Snap.combine ($Snap.first $t@136@01) ($Snap.second $t@136@01))))
(assert (=
  ($Snap.second $t@136@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@136@01))
    ($Snap.second ($Snap.second $t@136@01)))))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@136@01 ($Snap.combine ($Snap.first $t@136@01) ($Snap.second $t@136@01))))
(assert (=
  ($Snap.second $t@136@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@136@01))
    ($Snap.second ($Snap.second $t@136@01)))))
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
(pop) ; 5
(push) ; 5
; [eval] !diz.Queue__used
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@136@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@136@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:($t@136@01) | live]
; [else-branch: 2 | !(First:($t@136@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:($t@136@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@136@01)))
; [exec]
; fold acc(Queue__lock_invariant(diz), write)
(assert (Queue__lock_invariant%trigger ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.first ($Snap.second $t@136@01))) diz@126@01))
; [exec]
; exhale acc(Queue__lock_invariant(diz), write)
; [exec]
; assert acc(Queue__lock_held(diz), write)
; [exec]
; inhale acc(Queue__lock_invariant(diz), write)
(declare-const $t@137@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(Queue__lock_invariant(diz), write)
(assert (= $t@137@01 ($Snap.combine ($Snap.first $t@137@01) ($Snap.second $t@137@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Queue__lock_invariant%trigger $t@137@01 diz@126@01))
; Loop head block: Re-establish invariant
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | !(First:($t@136@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@136@01))))
(pop) ; 5
; [eval] !diz.Queue__used
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@136@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@136@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(First:($t@136@01)) | live]
; [else-branch: 3 | First:($t@136@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | !(First:($t@136@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@136@01))))
; [exec]
; __flatten_19 := true
; [exec]
; __flatten_41 := __flatten_19
; [exec]
; diz.Queue__used := __flatten_41
; [exec]
; __flatten_20 := x
; [exec]
; __flatten_42 := __flatten_20
; [exec]
; diz.Queue__data := __flatten_42
; [exec]
; assert acc(Queue__lock_held(diz), write)
; [exec]
; exhale acc(Queue__lock_held(diz), write)
; [exec]
; fold acc(Queue__lock_invariant(diz), write)
(assert (Queue__lock_invariant%trigger ($Snap.combine
  ($SortWrappers.BoolTo$Snap true)
  ($SortWrappers.IntTo$Snap x@128@01)) diz@126@01))
; [exec]
; exhale acc(Queue__lock_invariant(diz), write)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | First:($t@136@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@136@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Queue__take ----------
(declare-const diz@138@01 $Ref)
(declare-const current_thread_id@139@01 Int)
(declare-const sys__result@140@01 Int)
(declare-const diz@141@01 $Ref)
(declare-const current_thread_id@142@01 Int)
(declare-const sys__result@143@01 Int)
(push) ; 1
(declare-const $t@144@01 $Snap)
(assert (= $t@144@01 ($Snap.combine ($Snap.first $t@144@01) ($Snap.second $t@144@01))))
(assert (= ($Snap.first $t@144@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@141@01 $Ref.null)))
(assert (= ($Snap.second $t@144@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@142@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var res: Int
(declare-const res@145@01 Int)
; [exec]
; var __flatten_21: Bool
(declare-const __flatten_21@146@01 Bool)
; [exec]
; var __flatten_22: Int
(declare-const __flatten_22@147@01 Int)
; [exec]
; var __flatten_43: Bool
(declare-const __flatten_43@148@01 Bool)
; [exec]
; inhale acc(Queue__lock_invariant(diz), write)
(declare-const $t@149@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(Queue__lock_invariant(diz), write)
(assert (= $t@149@01 ($Snap.combine ($Snap.first $t@149@01) ($Snap.second $t@149@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Queue__lock_invariant%trigger $t@149@01 diz@141@01))
; [exec]
; inhale acc(Queue__lock_held(diz), write)
(declare-const $t@150@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@151@01 $Snap)
(assert (= $t@151@01 ($Snap.combine ($Snap.first $t@151@01) ($Snap.second $t@151@01))))
(assert (=
  ($Snap.second $t@151@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@151@01))
    ($Snap.second ($Snap.second $t@151@01)))))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@151@01 ($Snap.combine ($Snap.first $t@151@01) ($Snap.second $t@151@01))))
(assert (=
  ($Snap.second $t@151@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@151@01))
    ($Snap.second ($Snap.second $t@151@01)))))
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
; [eval] !diz.Queue__used
(pop) ; 5
(push) ; 5
; [eval] !!diz.Queue__used
; [eval] !diz.Queue__used
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] !diz.Queue__used
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@151@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@151@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(First:($t@151@01)) | live]
; [else-branch: 4 | First:($t@151@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | !(First:($t@151@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@151@01))))
; [exec]
; fold acc(Queue__lock_invariant(diz), write)
(assert (Queue__lock_invariant%trigger ($Snap.combine
  ($Snap.first $t@151@01)
  ($Snap.first ($Snap.second $t@151@01))) diz@141@01))
; [exec]
; exhale acc(Queue__lock_invariant(diz), write)
; [exec]
; assert acc(Queue__lock_held(diz), write)
; [exec]
; inhale acc(Queue__lock_invariant(diz), write)
(declare-const $t@152@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(Queue__lock_invariant(diz), write)
(assert (= $t@152@01 ($Snap.combine ($Snap.first $t@152@01) ($Snap.second $t@152@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Queue__lock_invariant%trigger $t@152@01 diz@141@01))
; Loop head block: Re-establish invariant
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | First:($t@151@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@151@01)))
(pop) ; 5
; [eval] !!diz.Queue__used
; [eval] !diz.Queue__used
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@151@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@151@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:($t@151@01) | live]
; [else-branch: 5 | !(First:($t@151@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | First:($t@151@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@151@01)))
; [exec]
; res := diz.Queue__data
(declare-const res@153@01 Int)
(assert (= res@153@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@151@01)))))
; [exec]
; __flatten_21 := false
; [exec]
; __flatten_43 := __flatten_21
; [exec]
; diz.Queue__used := __flatten_43
; [exec]
; assert acc(Queue__lock_held(diz), write)
; [exec]
; exhale acc(Queue__lock_held(diz), write)
; [exec]
; fold acc(Queue__lock_invariant(diz), write)
(assert (Queue__lock_invariant%trigger ($Snap.combine
  ($SortWrappers.BoolTo$Snap false)
  ($Snap.first ($Snap.second $t@151@01))) diz@141@01))
; [exec]
; exhale acc(Queue__lock_invariant(diz), write)
; [exec]
; __flatten_22 := res
; [exec]
; sys__result := __flatten_22
; [exec]
; assert true
; [exec]
; inhale false
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(First:($t@151@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@151@01))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
