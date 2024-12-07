(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/test_example2.vpr
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
; ---------- Loop__incr ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const c@2@01 $Ref)
(declare-const y@3@01 Int)
(declare-const diz@4@01 $Ref)
(declare-const current_thread_id@5@01 Int)
(declare-const c@6@01 $Ref)
(declare-const y@7@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@4@01 $Ref.null)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@5@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] c != null
(assert (not (= c@6@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  $Snap.unit))
; [eval] y >= 0
(assert (>= y@7@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] c != null
(assert (=
  ($Snap.second $t@9@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@01))
    ($Snap.second ($Snap.second $t@9@01)))))
(assert (= ($Snap.second ($Snap.second $t@9@01)) $Snap.unit))
; [eval] c.Counter__x == old(c.Counter__x) + y
; [eval] old(c.Counter__x) + y
; [eval] old(c.Counter__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@9@01)))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    y@7@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@10@01 Int)
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@11@01 Int)
; [exec]
; var __flatten_4: Int
(declare-const __flatten_4@12@01 Int)
; [exec]
; i := 0
(declare-const __flatten_1@13@01 Int)
(declare-const __flatten_4@14@01 Int)
(declare-const i@15@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@15@01))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
; [eval] i <= y
(assert (<= i@15@01 y@7@01))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [eval] c != null
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
  $Snap.unit))
; [eval] c.Counter__x == old(c.Counter__x) + i
; [eval] old(c.Counter__x) + i
; [eval] old(c.Counter__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    i@15@01)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i <= y
(push) ; 4
(assert (not (<= 0 y@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 y@7@01))
; [eval] c != null
; [eval] c.Counter__x == old(c.Counter__x) + i
; [eval] old(c.Counter__x) + i
; [eval] old(c.Counter__x)
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
(assert (<= 0 i@15@01))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
(assert (<= i@15@01 y@7@01))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
  $Snap.unit))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    i@15@01)))
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
; [eval] i < y
(pop) ; 5
(push) ; 5
; [eval] !(i < y)
; [eval] i < y
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < y
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@15@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@15@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@15@01 < y@7@01 | live]
; [else-branch: 0 | !(i@15@01 < y@7@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | i@15@01 < y@7@01]
(assert (< i@15@01 y@7@01))
; [exec]
; __flatten_1 := c.Counter__x + 1
; [eval] c.Counter__x + 1
(declare-const __flatten_1@17@01 Int)
(assert (=
  __flatten_1@17@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
    1)))
; [exec]
; __flatten_4 := __flatten_1
; [exec]
; c.Counter__x := __flatten_4
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@18@01 Int)
(assert (= i@18@01 (+ i@15@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(push) ; 6
(assert (not (<= 0 i@18@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@18@01))
; [eval] i <= y
(push) ; 6
(assert (not (<= i@18@01 y@7@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@18@01 y@7@01))
; [eval] c != null
; [eval] c.Counter__x == old(c.Counter__x) + i
; [eval] old(c.Counter__x) + i
; [eval] old(c.Counter__x)
(push) ; 6
(assert (not (=
  __flatten_1@17@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    i@18@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  __flatten_1@17@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    i@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(i@15@01 < y@7@01)]
(assert (not (< i@15@01 y@7@01)))
(pop) ; 5
; [eval] !(i < y)
; [eval] i < y
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@15@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@15@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(i@15@01 < y@7@01) | live]
; [else-branch: 1 | i@15@01 < y@7@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(i@15@01 < y@7@01)]
(assert (not (< i@15@01 y@7@01)))
; [eval] c != null
; [eval] c.Counter__x == old(c.Counter__x) + y
; [eval] old(c.Counter__x) + y
; [eval] old(c.Counter__x)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    y@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    y@7@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i@15@01 < y@7@01]
(assert (< i@15@01 y@7@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Loop__Loop ----------
(declare-const current_thread_id@19@01 Int)
(declare-const sys__result@20@01 $Ref)
(declare-const current_thread_id@21@01 Int)
(declare-const sys__result@22@01 $Ref)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@21@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@22@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@25@01 $Ref)
; [exec]
; diz := new()
(declare-const diz@26@01 $Ref)
(assert (not (= diz@26@01 $Ref.null)))
(assert (not (= diz@26@01 sys__result@22@01)))
(assert (not (= diz@26@01 diz@25@01)))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Counter__incr ----------
(declare-const diz@27@01 $Ref)
(declare-const current_thread_id@28@01 Int)
(declare-const diz@29@01 $Ref)
(declare-const current_thread_id@30@01 Int)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (= ($Snap.first $t@31@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@29@01 $Ref.null)))
(assert (=
  ($Snap.second $t@31@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@01))
    ($Snap.second ($Snap.second $t@31@01)))))
(assert (= ($Snap.first ($Snap.second $t@31@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@30@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] diz.Counter__x == old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@32@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))) 1)))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_2: Int
(declare-const __flatten_2@33@01 Int)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@34@01 Int)
; [exec]
; __flatten_2 := diz.Counter__x + 1
; [eval] diz.Counter__x + 1
(declare-const __flatten_2@35@01 Int)
(assert (=
  __flatten_2@35@01
  (+ ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))) 1)))
; [exec]
; __flatten_5 := __flatten_2
; [exec]
; diz.Counter__x := __flatten_5
; [eval] diz.Counter__x == old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x)
(pop) ; 2
(pop) ; 1
; ---------- Counter__Counter ----------
(declare-const current_thread_id@36@01 Int)
(declare-const sys__result@37@01 $Ref)
(declare-const current_thread_id@38@01 Int)
(declare-const sys__result@39@01 $Ref)
(push) ; 1
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@38@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 ($Snap.combine ($Snap.first $t@41@01) ($Snap.second $t@41@01))))
(assert (= ($Snap.first $t@41@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@39@01 $Ref.null)))
(assert (=
  ($Snap.second $t@41@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@41@01))
    ($Snap.second ($Snap.second $t@41@01)))))
(assert (= ($Snap.second ($Snap.second $t@41@01)) $Snap.unit))
; [eval] sys__result.Counter__x == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@41@01))) 0))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@42@01 $Ref)
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@43@01 Int)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@44@01 Int)
; [exec]
; diz := new(Counter__x)
(declare-const diz@45@01 $Ref)
(assert (not (= diz@45@01 $Ref.null)))
(declare-const Counter__x@46@01 Int)
(assert (not (= diz@45@01 diz@42@01)))
(assert (not (= diz@45@01 sys__result@39@01)))
; [exec]
; __flatten_3 := 0
; [exec]
; __flatten_6 := __flatten_3
; [exec]
; diz.Counter__x := __flatten_6
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Counter__x, write) && sys__result.Counter__x == 0)
; [eval] sys__result != null
; [eval] sys__result.Counter__x == 0
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
