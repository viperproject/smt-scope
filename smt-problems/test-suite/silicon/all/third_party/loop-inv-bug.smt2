(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:39
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/loop-inv-bug.vpr
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
; ---------- test05 ----------
(declare-const n@0@01 Int)
(declare-const n@1@01 Int)
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
(declare-const i@2@01 Int)
; [exec]
; var res: Int
(declare-const res@3@01 Int)
; [exec]
; inhale i == n
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] i == n
(assert (= i@2@01 n@1@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale res == i * n
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] res == i * n
; [eval] i * n
(assert (= res@3@01 (* i@2@01 n@1@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert res == n * n
; [eval] res == n * n
; [eval] n * n
(set-option :timeout 0)
(push) ; 3
(assert (not (= res@3@01 (* n@1@01 n@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= res@3@01 (* n@1@01 n@1@01)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__Mul ----------
(declare-const diz@6@01 $Ref)
(declare-const n@7@01 Int)
(declare-const sys__result@8@01 Int)
(declare-const diz@9@01 $Ref)
(declare-const n@10@01 Int)
(declare-const sys__result@11@01 Int)
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
; [eval] n > 0
(assert (> n@10@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
; [eval] diz.Ref__res == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(assert (= ($Snap.first ($Snap.second $t@13@01)) $Snap.unit))
; [eval] diz.Ref__res == n * n
; [eval] n * n
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) (* n@10@01 n@10@01)))
(assert (= ($Snap.second ($Snap.second $t@13@01)) $Snap.unit))
; [eval] n > 0
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@14@01 Int)
; [exec]
; i := 0
; [exec]
; diz.Ref__res := 0
(declare-const i@15@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
; [eval] i <= n
(assert (<= i@15@01 n@10@01))
(assert (= ($Snap.second ($Snap.second $t@16@01)) $Snap.unit))
; [eval] diz.Ref__res == i * n
; [eval] i * n
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@16@01)) (* i@15@01 n@10@01)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] i <= n
(push) ; 4
(assert (not (<= 0 n@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 n@10@01))
; [eval] diz.Ref__res == i * n
; [eval] i * n
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
(assert (<= i@15@01 n@10@01))
(assert (= ($Snap.second ($Snap.second $t@16@01)) $Snap.unit))
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@16@01)) (* i@15@01 n@10@01)))
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
; [eval] i < n
(pop) ; 5
(push) ; 5
; [eval] !(i < n)
; [eval] i < n
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < n
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@15@01 n@10@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@15@01 n@10@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@15@01 < n@10@01 | live]
; [else-branch: 0 | !(i@15@01 < n@10@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | i@15@01 < n@10@01]
(assert (< i@15@01 n@10@01))
; [exec]
; diz.Ref__res := diz.Ref__res + n
; [eval] diz.Ref__res + n
(declare-const Ref__res@17@01 Int)
(assert (= Ref__res@17@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@16@01)) n@10@01)))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@18@01 Int)
(assert (= i@18@01 (+ i@15@01 1)))
; Loop head block: Re-establish invariant
; [eval] i <= n
(push) ; 6
(assert (not (<= i@18@01 n@10@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@18@01 n@10@01))
; [eval] diz.Ref__res == i * n
; [eval] i * n
(push) ; 6
(assert (not (= Ref__res@17@01 (* i@18@01 n@10@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= Ref__res@17@01 (* i@18@01 n@10@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(i@15@01 < n@10@01)]
(assert (not (< i@15@01 n@10@01)))
(pop) ; 5
; [eval] !(i < n)
; [eval] i < n
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@15@01 n@10@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@15@01 n@10@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(i@15@01 < n@10@01) | live]
; [else-branch: 1 | i@15@01 < n@10@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(i@15@01 < n@10@01)]
(assert (not (< i@15@01 n@10@01)))
; [exec]
; assert i == n
; [eval] i == n
(push) ; 6
(assert (not (= i@15@01 n@10@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= i@15@01 n@10@01))
; [exec]
; assert diz.Ref__res == i * n
; [eval] diz.Ref__res == i * n
; [eval] i * n
; [exec]
; assert diz.Ref__res == n * n
; [eval] diz.Ref__res == n * n
; [eval] n * n
(push) ; 6
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@16@01)) (* n@10@01 n@10@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@16@01)) (* n@10@01 n@10@01)))
; [eval] diz.Ref__res == n * n
; [eval] n * n
; [eval] n > 0
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i@15@01 < n@10@01]
(assert (< i@15@01 n@10@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
