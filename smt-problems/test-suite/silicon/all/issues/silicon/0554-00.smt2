(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0554.vpr
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
(declare-fun tree%trigger ($Snap $Ref) Bool)
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
; ---------- treeTest ----------
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
; var t: Ref
(declare-const t@0@01 $Ref)
; [exec]
; var t0: Ref
(declare-const t0@1@01 $Ref)
; [exec]
; var t1: Ref
(declare-const t1@2@01 $Ref)
; [exec]
; var t2: Ref
(declare-const t2@3@01 $Ref)
; [exec]
; var t5: Ref
(declare-const t5@4@01 $Ref)
; [exec]
; var ctr: Ref
(declare-const ctr@5@01 $Ref)
; [exec]
; t := new(data, next_child, next_sibling)
(declare-const t@6@01 $Ref)
(assert (not (= t@6@01 $Ref.null)))
(declare-const data@7@01 Int)
(declare-const next_child@8@01 $Ref)
(declare-const next_sibling@9@01 $Ref)
(assert (not (= t@6@01 t2@3@01)))
(assert (not (= t@6@01 t5@4@01)))
(assert (not (= t@6@01 t@0@01)))
(assert (not (= t@6@01 t1@2@01)))
(assert (not (= t@6@01 ctr@5@01)))
(assert (not (= t@6@01 t0@1@01)))
; [exec]
; t.next_child := null
; [exec]
; t.next_sibling := null
; [exec]
; fold acc(tree(t), write)
; [eval] this.next_child != null
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 3
; [else-branch: 0 | True]
; [eval] this.next_sibling != null
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 4
; [else-branch: 1 | True]
; [eval] this.next_child == null && this.next_sibling == null || this.next_child != null && this.next_sibling != null
; [eval] this.next_child == null && this.next_sibling == null
; [eval] this.next_child == null
(push) ; 5
; [then-branch: 2 | False | live]
; [else-branch: 2 | True | live]
(push) ; 6
; [then-branch: 2 | False]
(assert false)
(pop) ; 6
(push) ; 6
; [else-branch: 2 | True]
; [eval] this.next_sibling == null
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap data@7@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) t@6@01))
; [exec]
; t0 := new(data, next_child, next_sibling)
(declare-const t0@10@01 $Ref)
(assert (not (= t0@10@01 $Ref.null)))
(declare-const data@11@01 Int)
(declare-const next_child@12@01 $Ref)
(declare-const next_sibling@13@01 $Ref)
(assert (not (= t0@10@01 t2@3@01)))
(assert (not (= t0@10@01 t5@4@01)))
(assert (not (= t0@10@01 t@6@01)))
(assert (not (= t0@10@01 t1@2@01)))
(assert (not (= t0@10@01 ctr@5@01)))
(assert (not (= t0@10@01 t0@1@01)))
; [exec]
; t0.next_child := null
; [exec]
; t0.next_sibling := null
; [exec]
; fold acc(tree(t0), write)
; [eval] this.next_child != null
; [then-branch: 3 | False | dead]
; [else-branch: 3 | True | live]
(push) ; 5
; [else-branch: 3 | True]
; [eval] this.next_sibling != null
; [then-branch: 4 | False | dead]
; [else-branch: 4 | True | live]
(push) ; 6
; [else-branch: 4 | True]
; [eval] this.next_child == null && this.next_sibling == null || this.next_child != null && this.next_sibling != null
; [eval] this.next_child == null && this.next_sibling == null
; [eval] this.next_child == null
(push) ; 7
; [then-branch: 5 | False | live]
; [else-branch: 5 | True | live]
(push) ; 8
; [then-branch: 5 | False]
(assert false)
(pop) ; 8
(push) ; 8
; [else-branch: 5 | True]
; [eval] this.next_sibling == null
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap data@11@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) t0@10@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (= t@6@01 t0@10@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; t1 := new(data, next_child, next_sibling)
(declare-const t1@14@01 $Ref)
(assert (not (= t1@14@01 $Ref.null)))
(declare-const data@15@01 Int)
(declare-const next_child@16@01 $Ref)
(declare-const next_sibling@17@01 $Ref)
(assert (not (= t1@14@01 t0@10@01)))
(assert (not (= t1@14@01 t2@3@01)))
(assert (not (= t1@14@01 t5@4@01)))
(assert (not (= t1@14@01 t@6@01)))
(assert (not (= t1@14@01 t1@2@01)))
(assert (not (= t1@14@01 ctr@5@01)))
; [exec]
; t1.next_child := t
; [exec]
; t1.next_sibling := t0
; [exec]
; fold acc(tree(t1), write)
; [eval] this.next_child != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | t@6@01 != Null | live]
; [else-branch: 6 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 6 | t@6@01 != Null]
; [eval] this.next_sibling != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= t0@10@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | t0@10@01 != Null | live]
; [else-branch: 7 | t0@10@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 7 | t0@10@01 != Null]
; [eval] this.next_child == null && this.next_sibling == null || this.next_child != null && this.next_sibling != null
; [eval] this.next_child == null && this.next_sibling == null
; [eval] this.next_child == null
(push) ; 9
; [then-branch: 8 | t@6@01 != Null | live]
; [else-branch: 8 | t@6@01 == Null | live]
(push) ; 10
; [then-branch: 8 | t@6@01 != Null]
(pop) ; 10
(push) ; 10
; [else-branch: 8 | t@6@01 == Null]
(assert (= t@6@01 $Ref.null))
; [eval] this.next_sibling == null
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (= t@6@01 $Ref.null) (not (= t@6@01 $Ref.null))))
(push) ; 9
; [then-branch: 9 | t@6@01 == Null && t0@10@01 == Null | live]
; [else-branch: 9 | !(t@6@01 == Null && t0@10@01 == Null) | live]
(push) ; 10
; [then-branch: 9 | t@6@01 == Null && t0@10@01 == Null]
(assert (and (= t@6@01 $Ref.null) (= t0@10@01 $Ref.null)))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | !(t@6@01 == Null && t0@10@01 == Null)]
(assert (not (and (= t@6@01 $Ref.null) (= t0@10@01 $Ref.null))))
; [eval] this.next_child != null && this.next_sibling != null
; [eval] this.next_child != null
(push) ; 11
; [then-branch: 10 | t@6@01 == Null | live]
; [else-branch: 10 | t@6@01 != Null | live]
(push) ; 12
; [then-branch: 10 | t@6@01 == Null]
(assert (= t@6@01 $Ref.null))
(pop) ; 12
(push) ; 12
; [else-branch: 10 | t@6@01 != Null]
; [eval] this.next_sibling != null
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (= t@6@01 $Ref.null)) (= t@6@01 $Ref.null)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (= t@6@01 $Ref.null) (= t0@10@01 $Ref.null)))
  (and
    (not (and (= t@6@01 $Ref.null) (= t0@10@01 $Ref.null)))
    (or (not (= t@6@01 $Ref.null)) (= t@6@01 $Ref.null)))))
(assert (or
  (not (and (= t@6@01 $Ref.null) (= t0@10@01 $Ref.null)))
  (and (= t@6@01 $Ref.null) (= t0@10@01 $Ref.null))))
(push) ; 9
(assert (not (or
  (and (= t@6@01 $Ref.null) (= t0@10@01 $Ref.null))
  (and (not (= t@6@01 $Ref.null)) (not (= t0@10@01 $Ref.null))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (or
  (and (= t@6@01 $Ref.null) (= t0@10@01 $Ref.null))
  (and (not (= t@6@01 $Ref.null)) (not (= t0@10@01 $Ref.null)))))
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap data@15@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap t@6@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap t0@10@01)
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.IntTo$Snap data@7@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.IntTo$Snap data@11@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))
          $Snap.unit))))) t1@14@01))
; [exec]
; t2 := new(data, next_child, next_sibling)
(declare-const t2@18@01 $Ref)
(assert (not (= t2@18@01 $Ref.null)))
(declare-const data@19@01 Int)
(declare-const next_child@20@01 $Ref)
(declare-const next_sibling@21@01 $Ref)
(assert (not (= t2@18@01 t0@10@01)))
(assert (not (= t2@18@01 t2@3@01)))
(assert (not (= t2@18@01 t1@14@01)))
(assert (not (= t2@18@01 t5@4@01)))
(assert (not (= t2@18@01 t@6@01)))
(assert (not (= t2@18@01 ctr@5@01)))
; [exec]
; t2.next_child := null
; [exec]
; t2.next_sibling := null
; [exec]
; fold acc(tree(t2), write)
; [eval] this.next_child != null
; [then-branch: 11 | False | dead]
; [else-branch: 11 | True | live]
(push) ; 9
; [else-branch: 11 | True]
; [eval] this.next_sibling != null
; [then-branch: 12 | False | dead]
; [else-branch: 12 | True | live]
(push) ; 10
; [else-branch: 12 | True]
; [eval] this.next_child == null && this.next_sibling == null || this.next_child != null && this.next_sibling != null
; [eval] this.next_child == null && this.next_sibling == null
; [eval] this.next_child == null
(push) ; 11
; [then-branch: 13 | False | live]
; [else-branch: 13 | True | live]
(push) ; 12
; [then-branch: 13 | False]
(assert false)
(pop) ; 12
(push) ; 12
; [else-branch: 13 | True]
; [eval] this.next_sibling == null
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap data@19@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) t2@18@01))
(push) ; 11
(set-option :timeout 10)
(assert (not (= t1@14@01 t2@18@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhale acc(tree(t5), write)
(declare-const $t@22@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= t2@18@01 t5@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= t1@14@01 t5@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; ctr := cloneTree(t5)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(declare-const res@23@01 $Ref)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (= $t@22@01 ($Snap.first $t@24@01)))
(assert (=
  ($Snap.second $t@24@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@24@01))
    ($Snap.second ($Snap.second $t@24@01)))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= t5@4@01 res@23@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= t2@18@01 res@23@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= t1@14@01 res@23@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@24@01)) $Snap.unit))
; [eval] (unfolding acc(tree(this), 1 / 2) in (unfolding acc(tree(res), write) in this.next_child == res.next_child && this.next_sibling == res.next_sibling))
(set-option :timeout 0)
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (tree%trigger $t@22@01 t5@4@01))
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (not (= t5@4@01 $Ref.null)))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@22@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
; [eval] this.next_child != null
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:($t@22@01)) != Null | live]
; [else-branch: 14 | First:(Second:($t@22@01)) == Null | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 14 | First:(Second:($t@22@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)))
(push) ; 13
(set-option :timeout 10)
(assert (not (= res@23@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= t2@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= t1@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= t5@4@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
; [eval] this.next_sibling != null
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:(Second:($t@22@01))) != Null | live]
; [else-branch: 15 | First:(Second:(Second:($t@22@01))) == Null | live]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 15 | First:(Second:(Second:($t@22@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
    $Ref.null)))
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res@23@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  t2@18@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  t1@14@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  t5@4@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  $Snap.unit))
; [eval] this.next_child == null && this.next_sibling == null || this.next_child != null && this.next_sibling != null
; [eval] this.next_child == null && this.next_sibling == null
; [eval] this.next_child == null
(set-option :timeout 0)
(push) ; 14
; [then-branch: 16 | First:(Second:($t@22@01)) != Null | live]
; [else-branch: 16 | First:(Second:($t@22@01)) == Null | live]
(push) ; 15
; [then-branch: 16 | First:(Second:($t@22@01)) != Null]
(pop) ; 15
(push) ; 15
; [else-branch: 16 | First:(Second:($t@22@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null))
; [eval] this.next_sibling == null
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null))))
(push) ; 14
; [then-branch: 17 | First:(Second:($t@22@01)) == Null && First:(Second:(Second:($t@22@01))) == Null | live]
; [else-branch: 17 | !(First:(Second:($t@22@01)) == Null && First:(Second:(Second:($t@22@01))) == Null) | live]
(push) ; 15
; [then-branch: 17 | First:(Second:($t@22@01)) == Null && First:(Second:(Second:($t@22@01))) == Null]
(assert (and
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
    $Ref.null)))
(pop) ; 15
(push) ; 15
; [else-branch: 17 | !(First:(Second:($t@22@01)) == Null && First:(Second:(Second:($t@22@01))) == Null)]
(assert (not
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
      $Ref.null))))
; [eval] this.next_child != null && this.next_sibling != null
; [eval] this.next_child != null
(push) ; 16
; [then-branch: 18 | First:(Second:($t@22@01)) == Null | live]
; [else-branch: 18 | First:(Second:($t@22@01)) != Null | live]
(push) ; 17
; [then-branch: 18 | First:(Second:($t@22@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null))
(pop) ; 17
(push) ; 17
; [else-branch: 18 | First:(Second:($t@22@01)) != Null]
; [eval] this.next_sibling != null
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null))
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
        $Ref.null)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
        $Ref.null)))
  (and
    (not
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
          $Ref.null)))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
          $Ref.null))
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
        $Ref.null)))))
(assert (or
  (not
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
        $Ref.null)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
        $Ref.null)))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
      $Ref.null))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
        $Ref.null)))))
; [eval] (unfolding acc(tree(res), write) in this.next_child == res.next_child && this.next_sibling == res.next_sibling)
(push) ; 14
(assert (tree%trigger ($Snap.first ($Snap.second $t@24@01)) res@23@01))
(assert (=
  ($Snap.first ($Snap.second $t@24@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@24@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= t5@4@01 res@23@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (not (= res@23@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@24@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= t5@4@01 res@23@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))))
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= t5@4@01 res@23@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))))
; [eval] this.next_child != null
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:(First:(Second:($t@24@01)))) != Null | live]
; [else-branch: 19 | First:(Second:(First:(Second:($t@24@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 19 | First:(Second:(First:(Second:($t@24@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
    $Ref.null)))
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  t2@18@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  t1@14@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  t5@4@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))))))
; [eval] this.next_sibling != null
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:(Second:(First:(Second:($t@24@01))))) != Null | live]
; [else-branch: 20 | First:(Second:(Second:(First:(Second:($t@24@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 20 | First:(Second:(Second:(First:(Second:($t@24@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))
    $Ref.null)))
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  t2@18@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  t1@14@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  t5@4@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))))
  $Snap.unit))
; [eval] this.next_child == null && this.next_sibling == null || this.next_child != null && this.next_sibling != null
; [eval] this.next_child == null && this.next_sibling == null
; [eval] this.next_child == null
(set-option :timeout 0)
(push) ; 17
; [then-branch: 21 | First:(Second:(First:(Second:($t@24@01)))) != Null | live]
; [else-branch: 21 | First:(Second:(First:(Second:($t@24@01)))) == Null | live]
(push) ; 18
; [then-branch: 21 | First:(Second:(First:(Second:($t@24@01)))) != Null]
(pop) ; 18
(push) ; 18
; [else-branch: 21 | First:(Second:(First:(Second:($t@24@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
  $Ref.null))
; [eval] this.next_sibling == null
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
      $Ref.null))))
(push) ; 17
; [then-branch: 22 | First:(Second:(First:(Second:($t@24@01)))) == Null && First:(Second:(Second:(First:(Second:($t@24@01))))) == Null | live]
; [else-branch: 22 | !(First:(Second:(First:(Second:($t@24@01)))) == Null && First:(Second:(Second:(First:(Second:($t@24@01))))) == Null) | live]
(push) ; 18
; [then-branch: 22 | First:(Second:(First:(Second:($t@24@01)))) == Null && First:(Second:(Second:(First:(Second:($t@24@01))))) == Null]
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
    $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))
    $Ref.null)))
(pop) ; 18
(push) ; 18
; [else-branch: 22 | !(First:(Second:(First:(Second:($t@24@01)))) == Null && First:(Second:(Second:(First:(Second:($t@24@01))))) == Null)]
(assert (not
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@24@01)))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@24@01))))))
      $Ref.null))))
; [eval] this.next_child != null && this.next_sibling != null
; [eval] this.next_child != null
; ---------- cloneTree ----------
