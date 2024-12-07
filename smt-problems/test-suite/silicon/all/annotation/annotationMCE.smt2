(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:34
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/annotation/annotationMCE.vpr
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
; ---------- disjAlias ----------
(declare-const r1@0@01 $Ref)
(declare-const r2@1@01 $Ref)
(declare-const r3@2@01 $Ref)
(declare-const r1@3@01 $Ref)
(declare-const r2@4@01 $Ref)
(declare-const r3@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (not (= r1@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@3@01 r2@4@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@4@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@6@01)) $Snap.unit))
; [eval] r3 == r1 || r3 == r2
; [eval] r3 == r1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | r3@5@01 == r1@3@01 | live]
; [else-branch: 0 | r3@5@01 != r1@3@01 | live]
(push) ; 3
; [then-branch: 0 | r3@5@01 == r1@3@01]
(assert (= r3@5@01 r1@3@01))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | r3@5@01 != r1@3@01]
(assert (not (= r3@5@01 r1@3@01)))
; [eval] r3 == r2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= r3@5@01 r1@3@01)) (= r3@5@01 r1@3@01)))
(assert (or (= r3@5@01 r1@3@01) (= r3@5@01 r2@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r3.f := 4
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@4@01 r3@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@3@01 r3@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
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
(assert (not (= r2@4@01 r1@3@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@3@01 r2@4@01)) (not (= r2@4@01 r1@3@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@3@01 r3@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@4@01 r3@5@01)))
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
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- disjAlias1 ----------
(declare-const r1@7@01 $Ref)
(declare-const r2@8@01 $Ref)
(declare-const r3@9@01 $Ref)
(declare-const r1@10@01 $Ref)
(declare-const r2@11@01 $Ref)
(declare-const r3@12@01 $Ref)
(push) ; 1
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (not (= r1@10@01 $Ref.null)))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@10@01 r2@11@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@11@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@13@01)) $Snap.unit))
; [eval] r3 == r1 || r3 == r2
; [eval] r3 == r1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 1 | r3@12@01 == r1@10@01 | live]
; [else-branch: 1 | r3@12@01 != r1@10@01 | live]
(push) ; 3
; [then-branch: 1 | r3@12@01 == r1@10@01]
(assert (= r3@12@01 r1@10@01))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | r3@12@01 != r1@10@01]
(assert (not (= r3@12@01 r1@10@01)))
; [eval] r3 == r2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= r3@12@01 r1@10@01)) (= r3@12@01 r1@10@01)))
(assert (or (= r3@12@01 r1@10@01) (= r3@12@01 r2@11@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r3.f := 4
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@11@01 r3@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@10@01 r3@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(define-fun mce_pTaken@14@01 () $Perm
  (ite (= r2@11@01 r3@12@01) $Perm.Write $Perm.No))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (or
  (= (- $Perm.Write (as mce_pTaken@14@01  $Perm)) $Perm.No)
  (< (- $Perm.Write (as mce_pTaken@14@01  $Perm)) $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (as mce_pTaken@14@01  $Perm)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(define-fun mce_pTaken@15@01 () $Perm
  (ite
    (= r1@10@01 r3@12@01)
    ($Perm.min $Perm.Write (- $Perm.Write (as mce_pTaken@14@01  $Perm)))
    $Perm.No))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (or
  (= (- $Perm.Write (as mce_pTaken@15@01  $Perm)) $Perm.No)
  (< (- $Perm.Write (as mce_pTaken@15@01  $Perm)) $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (- (- $Perm.Write (as mce_pTaken@14@01  $Perm)) (as mce_pTaken@15@01  $Perm))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write (as mce_pTaken@14@01  $Perm))))
(assert (<= (- $Perm.Write (as mce_pTaken@14@01  $Perm)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write (as mce_pTaken@14@01  $Perm)))
  (not (= r2@11@01 $Ref.null))))
(assert (<= $Perm.No (- $Perm.Write (as mce_pTaken@15@01  $Perm))))
(assert (<= (- $Perm.Write (as mce_pTaken@15@01  $Perm)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write (as mce_pTaken@15@01  $Perm)))
  (not (= r1@10@01 $Ref.null))))
(declare-const ss@16@01 Int)
(assert (and
  (=>
    (= r2@11@01 r3@12@01)
    (=
      (as ss@16@01  Int)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@13@01)))))
  (=>
    (= r1@10@01 r3@12@01)
    (= (as ss@16@01  Int) ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@11@01 r3@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@10@01 r3@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= r3@12@01 $Ref.null)))
(pop) ; 2
(pop) ; 1
; ---------- disjAlias2 ----------
(declare-const r1@17@01 $Ref)
(declare-const r2@18@01 $Ref)
(declare-const r3@19@01 $Ref)
(declare-const r1@20@01 $Ref)
(declare-const r2@21@01 $Ref)
(declare-const r3@22@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (not (= r1@20@01 $Ref.null)))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@20@01 r2@21@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@21@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@23@01)) $Snap.unit))
; [eval] r3 == r1 || r3 == r2
; [eval] r3 == r1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 2 | r3@22@01 == r1@20@01 | live]
; [else-branch: 2 | r3@22@01 != r1@20@01 | live]
(push) ; 3
; [then-branch: 2 | r3@22@01 == r1@20@01]
(assert (= r3@22@01 r1@20@01))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | r3@22@01 != r1@20@01]
(assert (not (= r3@22@01 r1@20@01)))
; [eval] r3 == r2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= r3@22@01 r1@20@01)) (= r3@22@01 r1@20@01)))
(assert (or (= r3@22@01 r1@20@01) (= r3@22@01 r2@21@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r3.f := 4
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@21@01 r3@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@20@01 r3@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
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
(assert (not (= r2@21@01 r1@20@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@23@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@23@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@23@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@23@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@20@01 r2@21@01)) (not (= r2@21@01 r1@20@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@20@01 r3@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@21@01 r3@22@01)))
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
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- disjAlias3 ----------
(declare-const r1@24@01 $Ref)
(declare-const r2@25@01 $Ref)
(declare-const r3@26@01 $Ref)
(declare-const r1@27@01 $Ref)
(declare-const r2@28@01 $Ref)
(declare-const r3@29@01 $Ref)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (not (= r1@27@01 $Ref.null)))
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@27@01 r2@28@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@28@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@30@01)) $Snap.unit))
; [eval] r3 == r1 || r3 == r2
; [eval] r3 == r1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 3 | r3@29@01 == r1@27@01 | live]
; [else-branch: 3 | r3@29@01 != r1@27@01 | live]
(push) ; 3
; [then-branch: 3 | r3@29@01 == r1@27@01]
(assert (= r3@29@01 r1@27@01))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | r3@29@01 != r1@27@01]
(assert (not (= r3@29@01 r1@27@01)))
; [eval] r3 == r2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= r3@29@01 r1@27@01)) (= r3@29@01 r1@27@01)))
(assert (or (= r3@29@01 r1@27@01) (= r3@29@01 r2@28@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r3.f := 4
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@28@01 r3@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@27@01 r3@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(define-fun mce_pTaken@31@01 () $Perm
  (ite (= r2@28@01 r3@29@01) $Perm.Write $Perm.No))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (or
  (= (- $Perm.Write (as mce_pTaken@31@01  $Perm)) $Perm.No)
  (< (- $Perm.Write (as mce_pTaken@31@01  $Perm)) $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (as mce_pTaken@31@01  $Perm)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(define-fun mce_pTaken@32@01 () $Perm
  (ite
    (= r1@27@01 r3@29@01)
    ($Perm.min $Perm.Write (- $Perm.Write (as mce_pTaken@31@01  $Perm)))
    $Perm.No))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (or
  (= (- $Perm.Write (as mce_pTaken@32@01  $Perm)) $Perm.No)
  (< (- $Perm.Write (as mce_pTaken@32@01  $Perm)) $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (- (- $Perm.Write (as mce_pTaken@31@01  $Perm)) (as mce_pTaken@32@01  $Perm))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write (as mce_pTaken@31@01  $Perm))))
(assert (<= (- $Perm.Write (as mce_pTaken@31@01  $Perm)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write (as mce_pTaken@31@01  $Perm)))
  (not (= r2@28@01 $Ref.null))))
(assert (<= $Perm.No (- $Perm.Write (as mce_pTaken@32@01  $Perm))))
(assert (<= (- $Perm.Write (as mce_pTaken@32@01  $Perm)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write (as mce_pTaken@32@01  $Perm)))
  (not (= r1@27@01 $Ref.null))))
(declare-const ss@33@01 Int)
(assert (and
  (=>
    (= r2@28@01 r3@29@01)
    (=
      (as ss@33@01  Int)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@30@01)))))
  (=>
    (= r1@27@01 r3@29@01)
    (= (as ss@33@01  Int) ($SortWrappers.$SnapToInt ($Snap.first $t@30@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@28@01 r3@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@27@01 r3@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= r3@29@01 $Ref.null)))
(pop) ; 2
(pop) ; 1
; ---------- disjAlias4 ----------
(declare-const r1@34@01 $Ref)
(declare-const r2@35@01 $Ref)
(declare-const r3@36@01 $Ref)
(declare-const r1@37@01 $Ref)
(declare-const r2@38@01 $Ref)
(declare-const r3@39@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 ($Snap.combine ($Snap.first $t@40@01) ($Snap.second $t@40@01))))
(assert (not (= r1@37@01 $Ref.null)))
(assert (=
  ($Snap.second $t@40@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@40@01))
    ($Snap.second ($Snap.second $t@40@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@37@01 r2@38@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@38@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@40@01)) $Snap.unit))
; [eval] r3 == r1 || r3 == r2
; [eval] r3 == r1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 4 | r3@39@01 == r1@37@01 | live]
; [else-branch: 4 | r3@39@01 != r1@37@01 | live]
(push) ; 3
; [then-branch: 4 | r3@39@01 == r1@37@01]
(assert (= r3@39@01 r1@37@01))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | r3@39@01 != r1@37@01]
(assert (not (= r3@39@01 r1@37@01)))
; [eval] r3 == r2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= r3@39@01 r1@37@01)) (= r3@39@01 r1@37@01)))
(assert (or (= r3@39@01 r1@37@01) (= r3@39@01 r2@38@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r3.f := 4
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@38@01 r3@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@37@01 r3@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
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
(assert (not (= r2@38@01 r1@37@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@40@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@40@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@40@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@40@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@37@01 r2@38@01)) (not (= r2@38@01 r1@37@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@37@01 r3@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@38@01 r3@39@01)))
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
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- disjAlias5 ----------
(declare-const r1@41@01 $Ref)
(declare-const r2@42@01 $Ref)
(declare-const r3@43@01 $Ref)
(declare-const r1@44@01 $Ref)
(declare-const r2@45@01 $Ref)
(declare-const r3@46@01 $Ref)
(push) ; 1
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 ($Snap.combine ($Snap.first $t@47@01) ($Snap.second $t@47@01))))
(assert (not (= r1@44@01 $Ref.null)))
(assert (=
  ($Snap.second $t@47@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@47@01))
    ($Snap.second ($Snap.second $t@47@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r1@44@01 r2@45@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@45@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@47@01)) $Snap.unit))
; [eval] r3 == r1 || r3 == r2
; [eval] r3 == r1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 5 | r3@46@01 == r1@44@01 | live]
; [else-branch: 5 | r3@46@01 != r1@44@01 | live]
(push) ; 3
; [then-branch: 5 | r3@46@01 == r1@44@01]
(assert (= r3@46@01 r1@44@01))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | r3@46@01 != r1@44@01]
(assert (not (= r3@46@01 r1@44@01)))
; [eval] r3 == r2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= r3@46@01 r1@44@01)) (= r3@46@01 r1@44@01)))
(assert (or (= r3@46@01 r1@44@01) (= r3@46@01 r2@45@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r3.f := 4
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@45@01 r3@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@44@01 r3@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
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
(assert (not (= r2@45@01 r1@44@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@47@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@47@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@47@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@47@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@44@01 r2@45@01)) (not (= r2@45@01 r1@44@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@44@01 r3@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r2@45@01 r3@46@01)))
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
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
