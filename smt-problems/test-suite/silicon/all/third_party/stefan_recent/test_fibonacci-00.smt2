(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/test_fibonacci.vpr
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
(declare-fun Fib__fib ($Snap Int) Int)
(declare-fun Fib__fib%limited ($Snap Int) Int)
(declare-fun Fib__fib%stateless (Int) Bool)
(declare-fun Fib__fib%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Fib__joinToken%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (= (Fib__fib%limited s@$ n@0@00) (Fib__fib s@$ n@0@00))
  :pattern ((Fib__fib s@$ n@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (Fib__fib%stateless n@0@00)
  :pattern ((Fib__fib%limited s@$ n@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (=>
    (Fib__fib%precondition s@$ n@0@00)
    (=
      (Fib__fib s@$ n@0@00)
      (ite
        (< n@0@00 2)
        1
        (+
          (Fib__fib%limited $Snap.unit (- n@0@00 1))
          (Fib__fib%limited $Snap.unit (- n@0@00 2))))))
  :pattern ((Fib__fib s@$ n@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (=>
    (Fib__fib%precondition s@$ n@0@00)
    (ite
      (< n@0@00 2)
      true
      (and
        (Fib__fib%precondition $Snap.unit (- n@0@00 1))
        (Fib__fib%precondition $Snap.unit (- n@0@00 2)))))
  :pattern ((Fib__fib s@$ n@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Fib__forkOperator ----------
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
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Fib__joinOperator ----------
(declare-const diz@6@01 $Ref)
(declare-const current_thread_id@7@01 Int)
(declare-const diz@8@01 $Ref)
(declare-const current_thread_id@9@01 Int)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.first $t@10@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@8@01 $Ref.null)))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (= ($Snap.first ($Snap.second $t@10@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@9@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (=
  ($Snap.second $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.second ($Snap.second $t@11@01)))))
(assert (= ($Snap.second ($Snap.second $t@11@01)) $Snap.unit))
; [eval] diz.Fib__output == Fib__fib(diz.Fib__input)
; [eval] Fib__fib(diz.Fib__input)
(push) ; 3
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@11@01))))
(pop) ; 3
; Joined path conditions
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@11@01))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@11@01)))
  (Fib__fib $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@11@01)))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Fib__run ----------
(declare-const diz@12@01 $Ref)
(declare-const current_thread_id@13@01 Int)
(declare-const diz@14@01 $Ref)
(declare-const current_thread_id@15@01 Int)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@14@01 $Ref.null)))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@15@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (= ($Snap.second ($Snap.second $t@17@01)) $Snap.unit))
; [eval] diz.Fib__output == Fib__fib(diz.Fib__input)
; [eval] Fib__fib(diz.Fib__input)
(push) ; 3
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@17@01))))
(pop) ; 3
; Joined path conditions
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@17@01))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@17@01)))
  (Fib__fib $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@17@01)))))
(pop) ; 2
(push) ; 2
; [exec]
; var f2: Ref
(declare-const f2@18@01 $Ref)
; [exec]
; var f1: Ref
(declare-const f1@19@01 $Ref)
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@20@01 Int)
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@21@01 $Ref)
; [exec]
; var __flatten_3: Ref
(declare-const __flatten_3@22@01 $Ref)
; [exec]
; var __flatten_8: Int
(declare-const __flatten_8@23@01 Int)
; [exec]
; var __flatten_10: Int
(declare-const __flatten_10@24@01 Int)
; [exec]
; var __flatten_17: Int
(declare-const __flatten_17@25@01 Int)
; [eval] diz.Fib__input < 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (<
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  2)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(Second:($t@16@01))) < 2 | live]
; [else-branch: 0 | !(First:(Second:(Second:($t@16@01))) < 2) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(Second:($t@16@01))) < 2]
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  2))
; [exec]
; __flatten_1 := 1
; [exec]
; __flatten_10 := __flatten_1
; [exec]
; diz.Fib__output := __flatten_10
; [eval] diz.Fib__output == Fib__fib(diz.Fib__input)
; [eval] Fib__fib(diz.Fib__input)
(push) ; 4
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
(pop) ; 4
; Joined path conditions
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
(push) ; 4
(assert (not (=
  1
  (Fib__fib $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  1
  (Fib__fib $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(First:(Second:(Second:($t@16@01))) < 2)]
(assert (not
  (<
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    2)))
(pop) ; 3
; [eval] !(diz.Fib__input < 2)
; [eval] diz.Fib__input < 2
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  2)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (<
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(First:(Second:(Second:($t@16@01))) < 2) | live]
; [else-branch: 1 | First:(Second:(Second:($t@16@01))) < 2 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(First:(Second:(Second:($t@16@01))) < 2)]
(assert (not
  (<
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    2)))
; [exec]
; __flatten_2 := Fib__Fib(current_thread_id, diz.Fib__input - 1)
; [eval] diz.Fib__input - 1
; [eval] current_thread_id >= 0
(declare-const sys__result@26@01 $Ref)
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (= ($Snap.first $t@27@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@26@01 $Ref.null)))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= diz@14@01 sys__result@26@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= diz@14@01 sys__result@26@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
; [eval] sys__result.Fib__input == n
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
  (-
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; f1 := __flatten_2
; [exec]
; __flatten_3 := Fib__Fib(current_thread_id, diz.Fib__input - 2)
; [eval] diz.Fib__input - 2
; [eval] current_thread_id >= 0
(declare-const sys__result@28@01 $Ref)
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(assert (= ($Snap.first $t@29@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@28@01 $Ref.null)))
(assert (=
  ($Snap.second $t@29@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@29@01))
    ($Snap.second ($Snap.second $t@29@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= sys__result@26@01 sys__result@28@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= diz@14@01 sys__result@28@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@29@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@29@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@29@01))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= sys__result@26@01 sys__result@28@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= diz@14@01 sys__result@28@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@29@01))) $Snap.unit))
; [eval] sys__result.Fib__input == n
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@29@01)))
  (-
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    2)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; f2 := __flatten_3
; [exec]
; Fib__forkOperator(f1, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@30@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Fib__forkOperator(f2, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@31@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= sys__result@26@01 sys__result@28@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Fib__joinOperator(f1, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
  ($SortWrappers.$SnapToInt ($Snap.first $t@32@01))))
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= diz@14@01 sys__result@26@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@32@01)) $Snap.unit))
; [eval] diz.Fib__output == Fib__fib(diz.Fib__input)
; [eval] Fib__fib(diz.Fib__input)
(set-option :timeout 0)
(push) ; 4
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))
(pop) ; 4
; Joined path conditions
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@32@01)))
  (Fib__fib $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Fib__joinOperator(f2, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@29@01)))
  ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))))
(assert (=
  ($Snap.second $t@33@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@33@01))
    ($Snap.second ($Snap.second $t@33@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= sys__result@26@01 sys__result@28@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= diz@14@01 sys__result@28@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@33@01)) $Snap.unit))
; [eval] diz.Fib__output == Fib__fib(diz.Fib__input)
; [eval] Fib__fib(diz.Fib__input)
(set-option :timeout 0)
(push) ; 4
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@29@01)))))
(pop) ; 4
; Joined path conditions
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@29@01)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@33@01)))
  (Fib__fib $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@29@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_8 := f1.Fib__output + f2.Fib__output
; [eval] f1.Fib__output + f2.Fib__output
(declare-const __flatten_8@34@01 Int)
(assert (=
  __flatten_8@34@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@32@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@33@01))))))
; [exec]
; __flatten_17 := __flatten_8
; [exec]
; diz.Fib__output := __flatten_17
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= sys__result@28@01 diz@14@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= sys__result@26@01 diz@14@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Fib__output == Fib__fib(diz.Fib__input)
; [eval] Fib__fib(diz.Fib__input)
(set-option :timeout 0)
(push) ; 4
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
(pop) ; 4
; Joined path conditions
(assert (Fib__fib%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
(push) ; 4
(assert (not (=
  __flatten_8@34@01
  (Fib__fib $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  __flatten_8@34@01
  (Fib__fib $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | First:(Second:(Second:($t@16@01))) < 2]
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  2))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Fib__Fib ----------
(declare-const current_thread_id@35@01 Int)
(declare-const n@36@01 Int)
(declare-const sys__result@37@01 $Ref)
(declare-const current_thread_id@38@01 Int)
(declare-const n@39@01 Int)
(declare-const sys__result@40@01 $Ref)
(push) ; 1
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@38@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01))))
(assert (= ($Snap.first $t@42@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@40@01 $Ref.null)))
(assert (=
  ($Snap.second $t@42@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@42@01))
    ($Snap.second ($Snap.second $t@42@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@42@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@42@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@42@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@42@01))) $Snap.unit))
; [eval] sys__result.Fib__input == n
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@42@01))) n@39@01))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@43@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@44@01 Int)
; [exec]
; var __flatten_18: Int
(declare-const __flatten_18@45@01 Int)
; [exec]
; diz := new(Fib__input, Fib__output)
(declare-const diz@46@01 $Ref)
(assert (not (= diz@46@01 $Ref.null)))
(declare-const Fib__input@47@01 Int)
(declare-const Fib__output@48@01 Int)
(assert (not (= diz@46@01 sys__result@40@01)))
(assert (not (= diz@46@01 diz@43@01)))
; [exec]
; __flatten_9 := n
; [exec]
; __flatten_18 := __flatten_9
; [exec]
; diz.Fib__input := __flatten_18
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Fib__input, write) &&
;   (acc(sys__result.Fib__output, write) && sys__result.Fib__input == n))
; [eval] sys__result != null
; [eval] sys__result.Fib__input == n
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
