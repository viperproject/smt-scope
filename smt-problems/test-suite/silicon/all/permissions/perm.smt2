(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:58
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permissions/perm.vpr
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
; ---------- test01a ----------
(declare-const c1@0@01 $Ref)
(declare-const c2@1@01 $Ref)
(declare-const c1@2@01 $Ref)
(declare-const c2@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= c1@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@2@01 c2@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@3@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
; [eval] c1 == c2
(assert (= c1@2@01 c2@3@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale perm(c1.val) >= 1 / 1
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] perm(c1.val) >= 1 / 1
; [eval] perm(c1.val)
(assert (>=
  (+
    (ite (= c1@2@01 c2@3@01) (/ (to_real 1) (to_real 2)) $Perm.No)
    (/ (to_real 1) (to_real 2)))
  $Perm.Write))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@3@01 c1@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))
  ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test01b ----------
(declare-const c1@6@01 $Ref)
(declare-const c2@7@01 $Ref)
(declare-const c3@8@01 $Ref)
(declare-const c1@9@01 $Ref)
(declare-const c2@10@01 $Ref)
(declare-const c3@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (not (= c1@9@01 $Ref.null)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@9@01 c2@10@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@10@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@12@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
; [eval] c3 == c1 || c3 == c2
; [eval] c3 == c1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | c3@11@01 == c1@9@01 | live]
; [else-branch: 0 | c3@11@01 != c1@9@01 | live]
(push) ; 3
; [then-branch: 0 | c3@11@01 == c1@9@01]
(assert (= c3@11@01 c1@9@01))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | c3@11@01 != c1@9@01]
(assert (not (= c3@11@01 c1@9@01)))
; [eval] c3 == c2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= c3@11@01 c1@9@01)) (= c3@11@01 c1@9@01)))
(assert (or (= c3@11@01 c1@9@01) (= c3@11@01 c2@10@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale perm(c3.val) >= 1 / 1
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] perm(c3.val) >= 1 / 1
; [eval] perm(c3.val)
(assert (>=
  (+
    (ite (= c3@11@01 c2@10@01) $Perm.Write $Perm.No)
    (ite (= c3@11@01 c1@9@01) (/ (to_real 1) (to_real 2)) $Perm.No))
  $Perm.Write))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@10@01 c1@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@12@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@12@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@9@01 c2@10@01)) (not (= c2@10@01 c1@9@01))))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test01c ----------
(declare-const c1@14@01 $Ref)
(declare-const c2@15@01 $Ref)
(declare-const c1@16@01 $Ref)
(declare-const c2@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (not (= c1@16@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@16@01 c2@17@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@17@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale perm(c1.val) >= 1 / 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] perm(c1.val) >= 1 / 1
; [eval] perm(c1.val)
(assert (>=
  (+
    (ite (= c1@16@01 c2@17@01) (/ (to_real 1) (to_real 2)) $Perm.No)
    (/ (to_real 1) (to_real 2)))
  $Perm.Write))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale c1 == c2
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] c1 == c2
(assert (= c1@16@01 c2@17@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@17@01 c1@16@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second $t@18@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@18@01))))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test01d ----------
(declare-const c1@21@01 $Ref)
(declare-const c2@22@01 $Ref)
(declare-const c1@23@01 $Ref)
(declare-const c2@24@01 $Ref)
(push) ; 1
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (not (= c1@23@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@23@01 c2@24@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@24@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale perm(c1.val) >= 1 / 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] perm(c1.val) >= 1 / 1
; [eval] perm(c1.val)
(assert (>=
  (+
    (ite (= c1@23@01 c2@24@01) (/ (to_real 1) (to_real 2)) $Perm.No)
    (/ (to_real 1) (to_real 2)))
  $Perm.Write))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(c1.val, 1 / 2)
; [exec]
; inhale c1 == c2
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] c1 == c2
(assert (= c1@23@01 c2@24@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
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
(pop) ; 2
(pop) ; 1
; ---------- test02a ----------
(declare-const c1@28@01 $Ref)
(declare-const c2@29@01 $Ref)
(declare-const c1@30@01 $Ref)
(declare-const c2@31@01 $Ref)
(push) ; 1
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (not (= c1@30@01 $Ref.null)))
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@30@01 c2@31@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@31@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@32@01)) $Snap.unit))
; [eval] c1 == c2
(assert (= c1@30@01 c2@31@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert perm(c1.val) <= 1 / 2
; [eval] perm(c1.val) <= 1 / 2
; [eval] perm(c1.val)
(push) ; 3
(assert (not (<=
  (+
    (ite (= c1@30@01 c2@31@01) (/ (to_real 1) (to_real 2)) $Perm.No)
    (/ (to_real 1) (to_real 2)))
  (/ (to_real 1) (to_real 2)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@31@01 c1@30@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@32@01)))
  ($SortWrappers.$SnapToInt ($Snap.first $t@32@01))))
; [eval] perm(c1.val) <= 1 / 2
; [eval] perm(c1.val)
(set-option :timeout 0)
(push) ; 3
(assert (not (<= (ite (= c1@30@01 c2@31@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@31@01 c1@30@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] perm(c1.val) <= 1 / 2
; [eval] perm(c1.val)
(set-option :timeout 0)
(push) ; 3
(assert (not (<=
  (+
    (ite (= c1@30@01 c2@31@01) (/ (to_real 1) (to_real 2)) $Perm.No)
    (/ (to_real 1) (to_real 2)))
  (/ (to_real 1) (to_real 2)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@31@01 c1@30@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] perm(c1.val) <= 1 / 2
; [eval] perm(c1.val)
(set-option :timeout 0)
(push) ; 3
(assert (not (<= (ite (= c1@30@01 c2@31@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02b ----------
(declare-const c1@33@01 $Ref)
(declare-const c2@34@01 $Ref)
(declare-const c3@35@01 $Ref)
(declare-const c1@36@01 $Ref)
(declare-const c2@37@01 $Ref)
(declare-const c3@38@01 $Ref)
(push) ; 1
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
(assert (not (= c1@36@01 $Ref.null)))
(assert (=
  ($Snap.second $t@39@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@39@01))
    ($Snap.second ($Snap.second $t@39@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@36@01 c2@37@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@37@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@39@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@39@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= c2@37@01 c3@38@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@36@01 c3@38@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c3@38@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@39@01))) $Snap.unit))
; [eval] c3 == c1 || c3 == c2
; [eval] c3 == c1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 1 | c3@38@01 == c1@36@01 | live]
; [else-branch: 1 | c3@38@01 != c1@36@01 | live]
(push) ; 3
; [then-branch: 1 | c3@38@01 == c1@36@01]
(assert (= c3@38@01 c1@36@01))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | c3@38@01 != c1@36@01]
(assert (not (= c3@38@01 c1@36@01)))
; [eval] c3 == c2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= c3@38@01 c1@36@01)) (= c3@38@01 c1@36@01)))
(assert (or (= c3@38@01 c1@36@01) (= c3@38@01 c2@37@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert perm(c3.val) <= 1 / 2
; [eval] perm(c3.val) <= 1 / 2
; [eval] perm(c3.val)
(push) ; 3
(assert (not (<=
  (+
    (+
      (/ (to_real 1) (to_real 2))
      (ite (= c3@38@01 c2@37@01) (/ (to_real 1) (to_real 2)) $Perm.No))
    (ite (= c3@38@01 c1@36@01) (/ (to_real 1) (to_real 2)) $Perm.No))
  (/ (to_real 1) (to_real 2)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c3@38@01 c2@37@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@37@01 c1@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c3@38@01 c1@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] perm(c3.val) <= 1 / 2
; [eval] perm(c3.val)
(set-option :timeout 0)
(push) ; 3
(assert (not (<=
  (+
    (+
      (ite (= c3@38@01 c1@36@01) (/ (to_real 1) (to_real 2)) $Perm.No)
      (ite (= c3@38@01 c2@37@01) (/ (to_real 1) (to_real 2)) $Perm.No))
    (/ (to_real 1) (to_real 2)))
  (/ (to_real 1) (to_real 2)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c3@38@01 c2@37@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@37@01 c1@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c3@38@01 c1@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] perm(c3.val) <= 1 / 2
; [eval] perm(c3.val)
(set-option :timeout 0)
(push) ; 3
(assert (not (<=
  (+
    (+
      (/ (to_real 1) (to_real 2))
      (ite (= c3@38@01 c2@37@01) (/ (to_real 1) (to_real 2)) $Perm.No))
    (ite (= c3@38@01 c1@36@01) (/ (to_real 1) (to_real 2)) $Perm.No))
  (/ (to_real 1) (to_real 2)))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c3@38@01 c2@37@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c2@37@01 c1@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c3@38@01 c1@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
    ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@39@01))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@39@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] perm(c3.val) <= 1 / 2
; [eval] perm(c3.val)
(set-option :timeout 0)
(push) ; 3
(assert (not (<=
  (+
    (+
      (ite (= c3@38@01 c1@36@01) (/ (to_real 1) (to_real 2)) $Perm.No)
      (ite (= c3@38@01 c2@37@01) (/ (to_real 1) (to_real 2)) $Perm.No))
    (/ (to_real 1) (to_real 2)))
  (/ (to_real 1) (to_real 2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03a ----------
(declare-const c1@40@01 $Ref)
(declare-const c2@41@01 $Ref)
(declare-const c1@42@01 $Ref)
(declare-const c2@43@01 $Ref)
(push) ; 1
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (not (= c1@42@01 $Ref.null)))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@42@01 c2@43@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@43@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@44@01)) $Snap.unit))
; [eval] c1 == c2
(assert (= c1@42@01 c2@43@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert perm(c1.val) >= 1 / 1
; [eval] perm(c1.val) >= 1 / 1
; [eval] perm(c1.val)
(push) ; 3
(assert (not (>=
  (+
    (ite (= c1@42@01 c2@43@01) (/ (to_real 1) (to_real 2)) $Perm.No)
    (/ (to_real 1) (to_real 2)))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>=
  (+
    (ite (= c1@42@01 c2@43@01) (/ (to_real 1) (to_real 2)) $Perm.No)
    (/ (to_real 1) (to_real 2)))
  $Perm.Write))
(pop) ; 2
(pop) ; 1
; ---------- test03b ----------
(declare-const c1@45@01 $Ref)
(declare-const c2@46@01 $Ref)
(declare-const c3@47@01 $Ref)
(declare-const c1@48@01 $Ref)
(declare-const c2@49@01 $Ref)
(declare-const c3@50@01 $Ref)
(push) ; 1
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (not (= c1@48@01 $Ref.null)))
(assert (=
  ($Snap.second $t@51@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@48@01 c2@49@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@49@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@51@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@51@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= c2@49@01 c3@50@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@48@01 c3@50@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c3@50@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@51@01))) $Snap.unit))
; [eval] c3 == c1 || c3 == c2
; [eval] c3 == c1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 2 | c3@50@01 == c1@48@01 | live]
; [else-branch: 2 | c3@50@01 != c1@48@01 | live]
(push) ; 3
; [then-branch: 2 | c3@50@01 == c1@48@01]
(assert (= c3@50@01 c1@48@01))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | c3@50@01 != c1@48@01]
(assert (not (= c3@50@01 c1@48@01)))
; [eval] c3 == c2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= c3@50@01 c1@48@01)) (= c3@50@01 c1@48@01)))
(assert (or (= c3@50@01 c1@48@01) (= c3@50@01 c2@49@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert perm(c3.val) >= 1 / 1
; [eval] perm(c3.val) >= 1 / 1
; [eval] perm(c3.val)
(push) ; 3
(assert (not (>=
  (+
    (+
      (/ (to_real 1) (to_real 2))
      (ite (= c3@50@01 c2@49@01) (/ (to_real 1) (to_real 2)) $Perm.No))
    (ite (= c3@50@01 c1@48@01) (/ (to_real 1) (to_real 2)) $Perm.No))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>=
  (+
    (+
      (/ (to_real 1) (to_real 2))
      (ite (= c3@50@01 c2@49@01) (/ (to_real 1) (to_real 2)) $Perm.No))
    (ite (= c3@50@01 c1@48@01) (/ (to_real 1) (to_real 2)) $Perm.No))
  $Perm.Write))
(pop) ; 2
(pop) ; 1
