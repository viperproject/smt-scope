(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/AVLTree.iterative.vpr
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
(declare-fun valid1%trigger ($Snap $Ref) Bool)
(declare-fun valid%trigger ($Snap $Ref) Bool)
(declare-fun validRest%trigger ($Snap $Ref) Bool)
(declare-fun rightValid%trigger ($Snap $Ref) Bool)
(declare-fun leftValid%trigger ($Snap $Ref) Bool)
(declare-fun leftOpen%trigger ($Snap $Ref) Bool)
(declare-fun rightOpen%trigger ($Snap $Ref) Bool)
(declare-fun udParentValid%trigger ($Snap $Ref) Bool)
(declare-fun udValid%trigger ($Snap $Ref) Bool)
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
; ---------- init ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Ref)
(assert (not (= this@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; this.root1 := null
; [exec]
; fold acc(valid1(this), write)
; [eval] this.root1 != null
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 3
; [else-branch: 0 | True]
; [eval] this.root1 != null
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 4
; [else-branch: 1 | True]
; [eval] this.root1 != null ==> this.root1.parent == null
; [eval] this.root1 != null
(push) ; 5
; [then-branch: 2 | False | dead]
; [else-branch: 2 | True | live]
(push) ; 6
; [else-branch: 2 | True]
(pop) ; 6
(pop) ; 5
; Joined path conditions
; [eval] this.root1 != null
; [then-branch: 3 | False | dead]
; [else-branch: 3 | True | live]
(push) ; 5
; [else-branch: 3 | True]
; [eval] this.root1 != null ==> this.root1.root == this.root1
; [eval] this.root1 != null
(push) ; 6
; [then-branch: 4 | False | dead]
; [else-branch: 4 | True | live]
(push) ; 7
; [else-branch: 4 | True]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (valid1%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))) this@1@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- has ----------
(declare-const this@4@01 $Ref)
(declare-const k@5@01 Int)
(declare-const b@6@01 Bool)
(declare-const this@7@01 $Ref)
(declare-const k@8@01 Int)
(declare-const b@9@01 Bool)
(push) ; 1
(declare-const $t@10@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; var n: Ref
(declare-const n@12@01 $Ref)
; [exec]
; var end: Bool
(declare-const end@13@01 Bool)
; [exec]
; var p: Ref
(declare-const p@14@01 $Ref)
; [exec]
; var q: Ref
(declare-const q@15@01 $Ref)
; [exec]
; var r: Ref
(declare-const r@16@01 $Ref)
; [exec]
; unfold acc(valid1(this), write)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (not (= this@7@01 $Ref.null)))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
; [eval] this.root1 != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:($t@10@01) != Null | live]
; [else-branch: 5 | First:($t@10@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | First:($t@10@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@10@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@10@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
; [eval] this.root1 != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:($t@10@01) != Null | live]
; [else-branch: 6 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | First:($t@10@01) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@10@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@10@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@10@01))))
  $Snap.unit))
; [eval] this.root1 != null ==> this.root1.parent == null
; [eval] this.root1 != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:($t@10@01) != Null | live]
; [else-branch: 7 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 7 | First:($t@10@01) != Null]
; [eval] this.root1.parent == null
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@10@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))))
; [eval] this.root1 != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:($t@10@01) != Null | live]
; [else-branch: 8 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | First:($t@10@01) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))
  $Snap.unit))
; [eval] this.root1 != null ==> this.root1.root == this.root1
; [eval] this.root1 != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:($t@10@01) != Null | live]
; [else-branch: 9 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 9 | First:($t@10@01) != Null]
; [eval] this.root1.root == this.root1
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid1%trigger $t@10@01 this@7@01))
; [eval] this.root1 == null
; [then-branch: 10 | First:($t@10@01) == Null | dead]
; [else-branch: 10 | First:($t@10@01) != Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 10 | First:($t@10@01) != Null]
(pop) ; 6
; [eval] !(this.root1 == null)
; [eval] this.root1 == null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:($t@10@01) != Null | live]
; [else-branch: 11 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 11 | First:($t@10@01) != Null]
; [exec]
; n := this.root1
(declare-const n@17@01 $Ref)
(assert (= n@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01))))
; [exec]
; b := false
; [exec]
; end := false
; [exec]
; fold acc(udParentValid(n), write)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] this.parent != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@10@01))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(Second:($t@10@01))) != Null | dead]
; [else-branch: 12 | First:(Second:(Second:($t@10@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 12 | First:(Second:(Second:($t@10@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@10@01))))
  $Ref.null))
; [eval] this.parent != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(Second:($t@10@01))) != Null | dead]
; [else-branch: 13 | First:(Second:(Second:($t@10@01))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 13 | First:(Second:(Second:($t@10@01))) == Null]
; [eval] this.parent != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:(Second:($t@10@01))) != Null | dead]
; [else-branch: 14 | First:(Second:(Second:($t@10@01))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 14 | First:(Second:(Second:($t@10@01))) == Null]
; [eval] this.parent != null ==> this.parent.leftDown == (this.parent.left == this)
; [eval] this.parent != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
; [then-branch: 15 | First:(Second:(Second:($t@10@01))) != Null | dead]
; [else-branch: 15 | First:(Second:(Second:($t@10@01))) == Null | live]
(push) ; 11
; [else-branch: 15 | First:(Second:(Second:($t@10@01))) == Null]
(pop) ; 11
(pop) ; 10
; Joined path conditions
; [eval] this.parent != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:(Second:($t@10@01))) != Null | dead]
; [else-branch: 16 | First:(Second:(Second:($t@10@01))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 16 | First:(Second:(Second:($t@10@01))) == Null]
; [eval] this.parent != null ==> !this.parent.leftDown == (this.parent.right == this)
; [eval] this.parent != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
; [then-branch: 17 | First:(Second:(Second:($t@10@01))) != Null | dead]
; [else-branch: 17 | First:(Second:(Second:($t@10@01))) == Null | live]
(push) ; 12
; [else-branch: 17 | First:(Second:(Second:($t@10@01))) == Null]
(pop) ; 12
(pop) ; 11
; Joined path conditions
; [eval] this.parent != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | First:(Second:(Second:($t@10@01))) != Null | dead]
; [else-branch: 18 | First:(Second:(Second:($t@10@01))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 18 | First:(Second:(Second:($t@10@01))) == Null]
; [eval] this.parent != null ==> this.root == this.parent.root
; [eval] this.parent != null
(push) ; 12
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
; [then-branch: 19 | First:(Second:(Second:($t@10@01))) != Null | dead]
; [else-branch: 19 | First:(Second:(Second:($t@10@01))) == Null | live]
(push) ; 13
; [else-branch: 19 | First:(Second:(Second:($t@10@01))) == Null]
(pop) ; 13
(pop) ; 12
; Joined path conditions
; [eval] this.parent == null ==> this.root == this
; [eval] this.parent == null
(push) ; 12
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@10@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:(Second:($t@10@01))) == Null | live]
; [else-branch: 20 | First:(Second:(Second:($t@10@01))) != Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 20 | First:(Second:(Second:($t@10@01))) == Null]
; [eval] this.root == this
(push) ; 14
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(pop) ; 13
(pop) ; 12
; Joined path conditions
(set-option :timeout 0)
(push) ; 12
(assert (not (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@10@01))))
    $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
    n@17@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@10@01))))
    $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
    n@17@01)))
(assert (udParentValid%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@10@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))))))) n@17@01))
(declare-const b@18@01 Bool)
(declare-const end@19@01 Bool)
(declare-const p@20@01 $Ref)
(declare-const n@21@01 $Ref)
(declare-const q@22@01 $Ref)
(push) ; 12
; Loop head block: Check well-definedness of invariant
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(assert (= ($Snap.first ($Snap.second $t@23@01)) $Snap.unit))
; [eval] this.root1 != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@23@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@23@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@23@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
  $Snap.unit))
; [eval] n != null
(assert (not (= n@21@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
  $Snap.unit))
; [eval] (unfolding acc(valid(n), write) in n.root == this.root1)
(push) ; 13
(assert (valid%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))) n@21@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))
; [eval] n.root == this.root1
(pop) ; 13
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))) n@21@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
  $Snap.unit))
; [eval] this.root1 != null
(pop) ; 12
(push) ; 12
; Loop head block: Establish invariant
; [eval] this.root1 != null
; [eval] n != null
(push) ; 13
(assert (not (not (= n@17@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (not (= n@17@01 $Ref.null)))
(push) ; 13
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [eval] (unfolding acc(valid(n), write) in n.root == this.root1)
(set-option :timeout 0)
(push) ; 13
(push) ; 14
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(assert (valid%trigger ($Snap.first ($Snap.second $t@10@01)) n@17@01))
(assert (=
  ($Snap.first ($Snap.second $t@10@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@10@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@10@01))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@10@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@10@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@10@01)))))))
; [eval] n.root == this.root1
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) n@17@01)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(pop) ; 13
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second $t@10@01)) n@17@01)
  (=
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@10@01)))
      ($Snap.second ($Snap.first ($Snap.second $t@10@01)))))
  (=
    ($Snap.second ($Snap.first ($Snap.second $t@10@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@10@01))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@10@01))))))))
(set-option :timeout 0)
(push) ; 13
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01))))
; [eval] this.root1 != null
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 13
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(assert (= ($Snap.first ($Snap.second $t@23@01)) $Snap.unit))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@23@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@23@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@23@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
  $Snap.unit))
(assert (not (= n@21@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
  $Snap.unit))
(assert (valid%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))) n@21@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 14
; [eval] !end
(pop) ; 14
(push) ; 14
; [eval] !!end
; [eval] !end
(pop) ; 14
; Loop head block: Follow loop-internal edges
; [eval] !end
(push) ; 14
(set-option :timeout 10)
(assert (not end@19@01))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not end@19@01)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | !(end@19@01) | live]
; [else-branch: 21 | end@19@01 | live]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 21 | !(end@19@01)]
(assert (not end@19@01))
; [exec]
; unfold acc(valid(n), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; unfold acc(validRest(n), write)
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
    ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
  $Snap.unit))
; [eval] this.right != this.left || this.right == null
; [eval] this.right != this.left
(set-option :timeout 0)
(push) ; 15
; [then-branch: 22 | First:(Second:(Second:(Second:(First:(First:(Second:(Second:(Second:(Second:($t@23@01)))))))))) != First:(Second:(Second:(First:(First:(Second:(Second:(Second:(Second:($t@23@01))))))))) | live]
; [else-branch: 22 | First:(Second:(Second:(Second:(First:(First:(Second:(Second:(Second:(Second:($t@23@01)))))))))) == First:(Second:(Second:(First:(First:(Second:(Second:(Second:(Second:($t@23@01))))))))) | live]
(push) ; 16
; [then-branch: 22 | First:(Second:(Second:(Second:(First:(First:(Second:(Second:(Second:(Second:($t@23@01)))))))))) != First:(Second:(Second:(First:(First:(Second:(Second:(Second:(Second:($t@23@01)))))))))]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))))
(pop) ; 16
(push) ; 16
; [else-branch: 22 | First:(Second:(Second:(Second:(First:(First:(Second:(Second:(Second:(Second:($t@23@01)))))))))) == First:(Second:(Second:(First:(First:(Second:(Second:(Second:(Second:($t@23@01)))))))))]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))))
; [eval] this.right == null
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))))))
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))))))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (validRest%trigger ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))) n@21@01))
; [eval] n.key == k
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
    k@8@01))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
  k@8@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | First:(First:(First:(Second:(Second:(Second:(Second:($t@23@01))))))) == k@8@01 | live]
; [else-branch: 23 | First:(First:(First:(Second:(Second:(Second:(Second:($t@23@01))))))) != k@8@01 | live]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 23 | First:(First:(First:(Second:(Second:(Second:(Second:($t@23@01))))))) == k@8@01]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
  k@8@01))
; [exec]
; b := true
; [exec]
; fold acc(validRest(n), write)
(push) ; 16
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [eval] this.right != this.left || this.right == null
; [eval] this.right != this.left
; ---------- init_2 ----------
(declare-const this@24@01 $Ref)
(declare-const k@25@01 Int)
(declare-const this@26@01 $Ref)
(declare-const k@27@01 Int)
(set-option :timeout 0)
