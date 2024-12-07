(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0484.vpr
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
(declare-fun treePerm_simpler%trigger ($Snap $Ref) Bool)
(declare-fun treePerm%trigger ($Snap $Ref) Bool)
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
; ---------- insert_simpler ----------
(declare-const current@0@01 $Ref)
(declare-const bool_val@1@01 Bool)
(declare-const current@2@01 $Ref)
(declare-const bool_val@3@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
(assert bool_val@3@01)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(current.left, write)
(declare-const $t@5@01 $Ref)
(assert (not (= current@2@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(treePerm_simpler(current), write)
; [eval] current != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= current@2@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | current@2@01 != Null | live]
; [else-branch: 0 | current@2@01 == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | current@2@01 != Null]
(assert (treePerm_simpler%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $t@5@01)
  $Snap.unit) current@2@01))
; [exec]
; assert current != null ||
;   (unfolding acc(treePerm_simpler(current), write) in true)
; [eval] current != null || (unfolding acc(treePerm_simpler(current), write) in true)
; [eval] current != null
(push) ; 4
; [then-branch: 1 | current@2@01 != Null | live]
; [else-branch: 1 | current@2@01 == Null | live]
(push) ; 5
; [then-branch: 1 | current@2@01 != Null]
(pop) ; 5
(push) ; 5
; [else-branch: 1 | current@2@01 == Null]
(assert (= current@2@01 $Ref.null))
; [eval] (unfolding acc(treePerm_simpler(current), write) in true)
(push) ; 6
; [eval] current != null
; [then-branch: 2 | current@2@01 != Null | dead]
; [else-branch: 2 | current@2@01 == Null | live]
(push) ; 7
; [else-branch: 2 | current@2@01 == Null]
(assert (= ($Snap.combine ($SortWrappers.$RefTo$Snap $t@5@01) $Snap.unit) $Snap.unit))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (= current@2@01 $Ref.null)
  (= ($Snap.combine ($SortWrappers.$RefTo$Snap $t@5@01) $Snap.unit) $Snap.unit)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (= current@2@01 $Ref.null)
  (and
    (= current@2@01 $Ref.null)
    (=>
      (= current@2@01 $Ref.null)
      (=
        ($Snap.combine ($SortWrappers.$RefTo$Snap $t@5@01) $Snap.unit)
        $Snap.unit)))))
(assert (or (= current@2@01 $Ref.null) (not (= current@2@01 $Ref.null))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- insert ----------
(declare-const current@6@01 $Ref)
(declare-const bool_val@7@01 Bool)
(declare-const current@8@01 $Ref)
(declare-const bool_val@9@01 Bool)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] bool_val == true
(assert (= bool_val@9@01 true))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(treePerm(current), write)
; [eval] current != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= current@8@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= current@8@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | current@8@01 != Null | live]
; [else-branch: 3 | current@8@01 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | current@8@01 != Null]
(assert (not (= current@8@01 $Ref.null)))
(assert (=
  ($Snap.first $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@10@01))
    ($Snap.second ($Snap.first $t@10@01)))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (treePerm%trigger ($Snap.first $t@10@01) current@8@01))
; [exec]
; fold acc(treePerm(current), write)
; [eval] current != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= current@8@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | current@8@01 != Null | live]
; [else-branch: 4 | current@8@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | current@8@01 != Null]
(assert (treePerm%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@10@01))
  ($Snap.second ($Snap.first $t@10@01))) current@8@01))
; [exec]
; assert bool_val == true ||
;   (unfolding acc(treePerm(current), write) in true)
; [eval] bool_val == true || (unfolding acc(treePerm(current), write) in true)
; [eval] bool_val == true
(push) ; 5
; [then-branch: 5 | bool_val@9@01 == True | live]
; [else-branch: 5 | bool_val@9@01 != True | live]
(push) ; 6
; [then-branch: 5 | bool_val@9@01 == True]
(pop) ; 6
(push) ; 6
; [else-branch: 5 | bool_val@9@01 != True]
(assert (not (= bool_val@9@01 true)))
; [eval] (unfolding acc(treePerm(current), write) in true)
(push) ; 7
; [eval] current != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= current@8@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | current@8@01 != Null | dead]
; [else-branch: 6 | current@8@01 == Null | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 6 | current@8@01 == Null]
(assert (= current@8@01 $Ref.null))
(assert (=
  ($Snap.combine
    ($Snap.first ($Snap.first $t@10@01))
    ($Snap.second ($Snap.first $t@10@01)))
  $Snap.unit))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (= current@8@01 $Ref.null)
  (and
    (= current@8@01 $Ref.null)
    (=
      ($Snap.combine
        ($Snap.first ($Snap.first $t@10@01))
        ($Snap.second ($Snap.first $t@10@01)))
      $Snap.unit))))
(assert (= current@8@01 $Ref.null))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= bool_val@9@01 true))
  (and
    (not (= bool_val@9@01 true))
    (=>
      (= current@8@01 $Ref.null)
      (and
        (= current@8@01 $Ref.null)
        (=
          ($Snap.combine
            ($Snap.first ($Snap.first $t@10@01))
            ($Snap.second ($Snap.first $t@10@01)))
          $Snap.unit)))
    (= current@8@01 $Ref.null))))
(assert (or (not (= bool_val@9@01 true)) (= bool_val@9@01 true)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 3 | current@8@01 == Null]
(assert (= current@8@01 $Ref.null))
(assert (= ($Snap.first $t@10@01) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (treePerm%trigger ($Snap.first $t@10@01) current@8@01))
; [exec]
; fold acc(treePerm(current), write)
; [eval] current != null
; [then-branch: 7 | current@8@01 != Null | dead]
; [else-branch: 7 | current@8@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 7 | current@8@01 == Null]
(assert (treePerm%trigger $Snap.unit current@8@01))
; [exec]
; assert bool_val == true ||
;   (unfolding acc(treePerm(current), write) in true)
; [eval] bool_val == true || (unfolding acc(treePerm(current), write) in true)
; [eval] bool_val == true
(push) ; 5
; [then-branch: 8 | bool_val@9@01 == True | live]
; [else-branch: 8 | bool_val@9@01 != True | live]
(push) ; 6
; [then-branch: 8 | bool_val@9@01 == True]
(pop) ; 6
(push) ; 6
; [else-branch: 8 | bool_val@9@01 != True]
(assert (not (= bool_val@9@01 true)))
; [eval] (unfolding acc(treePerm(current), write) in true)
(push) ; 7
; [eval] current != null
; [then-branch: 9 | current@8@01 != Null | dead]
; [else-branch: 9 | current@8@01 == Null | live]
(push) ; 8
; [else-branch: 9 | current@8@01 == Null]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= bool_val@9@01 true)) (= bool_val@9@01 true)))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
