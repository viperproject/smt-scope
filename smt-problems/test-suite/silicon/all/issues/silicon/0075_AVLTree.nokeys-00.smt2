(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:40
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0075_AVLTree.nokeys.vpr
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
(declare-fun headvalid%trigger ($Snap $Ref) Bool)
(declare-fun valid%trigger ($Snap $Ref) Bool)
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
; ---------- headinit ----------
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
; this.root := null
; [exec]
; fold acc(headvalid(this), write)
; [eval] this.root != null
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 3
; [else-branch: 0 | True]
; [eval] this.root != null
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 4
; [else-branch: 1 | True]
; [eval] this.root != null
; [then-branch: 2 | False | dead]
; [else-branch: 2 | True | live]
(push) ; 5
; [else-branch: 2 | True]
(assert (headvalid%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) this@1@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- headhas ----------
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
; var bb: Bool
(declare-const bb@12@01 Bool)
; [exec]
; unfold acc(headvalid(this), write)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (not (= this@7@01 $Ref.null)))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
; [eval] this.root != null
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
; [then-branch: 3 | First:($t@10@01) != Null | live]
; [else-branch: 3 | First:($t@10@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:($t@10@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@10@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@10@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
; [eval] this.root != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:($t@10@01) != Null | live]
; [else-branch: 4 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:($t@10@01) != Null]
; [eval] this.root != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:($t@10@01) != Null | live]
; [else-branch: 5 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | First:($t@10@01) != Null]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (headvalid%trigger $t@10@01 this@7@01))
; [eval] this.root == null
; [then-branch: 6 | First:($t@10@01) == Null | dead]
; [else-branch: 6 | First:($t@10@01) != Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 6 | First:($t@10@01) != Null]
(pop) ; 6
; [eval] !(this.root == null)
; [eval] this.root == null
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
; [exec]
; bb := has(this.root, k)
(declare-const b@13@01 Bool)
(declare-const $t@14@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; b := bb
; [exec]
; fold acc(headvalid(this), write)
; [eval] this.root != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:($t@10@01) != Null | live]
; [else-branch: 8 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 8 | First:($t@10@01) != Null]
; [eval] this.root != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:($t@10@01) != Null | live]
; [else-branch: 9 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 9 | First:($t@10@01) != Null]
; [eval] this.root != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:($t@10@01) != Null | live]
; [else-branch: 10 | First:($t@10@01) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 10 | First:($t@10@01) != Null]
(assert (headvalid%trigger ($Snap.combine
  ($Snap.first $t@10@01)
  ($Snap.combine
    $t@14@01
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@10@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))) this@7@01))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 3 | First:($t@10@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null))
(assert (= ($Snap.first ($Snap.second $t@10@01)) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second $t@10@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@10@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
; [eval] this.root != null
; [then-branch: 11 | First:($t@10@01) != Null | dead]
; [else-branch: 11 | First:($t@10@01) == Null | live]
(push) ; 4
; [else-branch: 11 | First:($t@10@01) == Null]
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@10@01))) $Snap.unit))
; [eval] this.root != null
; [then-branch: 12 | First:($t@10@01) != Null | dead]
; [else-branch: 12 | First:($t@10@01) == Null | live]
(push) ; 5
; [else-branch: 12 | First:($t@10@01) == Null]
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@10@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (headvalid%trigger $t@10@01 this@7@01))
; [eval] this.root == null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:($t@10@01) == Null | live]
; [else-branch: 13 | First:($t@10@01) != Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | First:($t@10@01) == Null]
; [exec]
; b := false
; [exec]
; fold acc(headvalid(this), write)
; [eval] this.root != null
; [then-branch: 14 | First:($t@10@01) != Null | dead]
; [else-branch: 14 | First:($t@10@01) == Null | live]
(push) ; 7
; [else-branch: 14 | First:($t@10@01) == Null]
; [eval] this.root != null
; [then-branch: 15 | First:($t@10@01) != Null | dead]
; [else-branch: 15 | First:($t@10@01) == Null | live]
(push) ; 8
; [else-branch: 15 | First:($t@10@01) == Null]
; [eval] this.root != null
; [then-branch: 16 | First:($t@10@01) != Null | dead]
; [else-branch: 16 | First:($t@10@01) == Null | live]
(push) ; 9
; [else-branch: 16 | First:($t@10@01) == Null]
(assert (headvalid%trigger ($Snap.combine
  ($Snap.first $t@10@01)
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) this@7@01))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
; [eval] !(this.root == null)
; [eval] this.root == null
; [then-branch: 17 | First:($t@10@01) != Null | dead]
; [else-branch: 17 | First:($t@10@01) == Null | live]
(push) ; 6
; [else-branch: 17 | First:($t@10@01) == Null]
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- init ----------
(declare-const this@15@01 $Ref)
(declare-const k@16@01 Int)
(declare-const this@17@01 $Ref)
(declare-const k@18@01 Int)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (not (= this@17@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@20@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@20@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@20@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
  $Snap.unit))
; [eval] this.height == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@01))) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
  $Snap.unit))
; [eval] this.balanceFactor == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@01))))
  0))
(pop) ; 2
(push) ; 2
; [exec]
; this.left := null
; [exec]
; this.right := null
; [exec]
; this.key := k
; [exec]
; close(this)
; [eval] this.left != null
; [then-branch: 18 | False | dead]
; [else-branch: 18 | True | live]
(push) ; 3
; [else-branch: 18 | True]
; [eval] this.left != null
; [then-branch: 19 | False | dead]
; [else-branch: 19 | True | live]
(push) ; 4
; [else-branch: 19 | True]
; [eval] this.left != null
; [then-branch: 20 | False | dead]
; [else-branch: 20 | True | live]
(push) ; 5
; [else-branch: 20 | True]
; [eval] this.right != null
; [then-branch: 21 | False | dead]
; [else-branch: 21 | True | live]
(push) ; 6
; [else-branch: 21 | True]
; [eval] this.right != null
; [then-branch: 22 | False | dead]
; [else-branch: 22 | True | live]
(push) ; 7
; [else-branch: 22 | True]
; [eval] this.right != null
; [then-branch: 23 | False | dead]
; [else-branch: 23 | True | live]
(push) ; 8
; [else-branch: 23 | True]
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height) <= 1
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | True | live]
; [else-branch: 24 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 24 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 25 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height) >= -1
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 26 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 27 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] -1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
; [eval] this.height == ((old(this.left) == null ? 0 : old(this.left.height)) > (old(this.right) == null ? 0 : old(this.right.height)) ? (old(this.left) == null ? 0 : old(this.left.height)) + 1 : (old(this.right) == null ? 0 : old(this.right.height)) + 1)
; [eval] ((old(this.left) == null ? 0 : old(this.left.height)) > (old(this.right) == null ? 0 : old(this.right.height)) ? (old(this.left) == null ? 0 : old(this.left.height)) + 1 : (old(this.right) == null ? 0 : old(this.right.height)) + 1)
; [eval] (old(this.left) == null ? 0 : old(this.left.height)) > (old(this.right) == null ? 0 : old(this.right.height))
; [eval] (old(this.left) == null ? 0 : old(this.left.height))
; [eval] old(this.left) == null
; [eval] old(this.left)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 28 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] (old(this.right) == null ? 0 : old(this.right.height))
; [eval] old(this.right) == null
; [eval] old(this.right)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 29 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 30 | False | dead]
; [else-branch: 30 | True | live]
(push) ; 10
; [else-branch: 30 | True]
; [eval] (old(this.right) == null ? 0 : old(this.right.height)) + 1
; [eval] (old(this.right) == null ? 0 : old(this.right.height))
; [eval] old(this.right) == null
; [eval] old(this.right)
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | True | live]
; [else-branch: 31 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 31 | True]
(pop) ; 12
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@21@01))) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
; [eval] this.balanceFactor == (old(this.left) == null ? 0 : old(this.left.height)) - (old(this.right) == null ? 0 : old(this.right.height))
; [eval] (old(this.left) == null ? 0 : old(this.left.height)) - (old(this.right) == null ? 0 : old(this.right.height))
; [eval] (old(this.left) == null ? 0 : old(this.left.height))
; [eval] old(this.left) == null
; [eval] old(this.left)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | True | live]
; [else-branch: 32 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 32 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] (old(this.right) == null ? 0 : old(this.right.height))
; [eval] old(this.right) == null
; [eval] old(this.right)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | True | live]
; [else-branch: 33 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 33 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] this.height == 1
; [eval] this.balanceFactor == 0
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- has ----------
(declare-const this@22@01 $Ref)
(declare-const k@23@01 Int)
(declare-const b@24@01 Bool)
(declare-const this@25@01 $Ref)
(declare-const k@26@01 Int)
(declare-const b@27@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@28@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@29@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this), write)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(assert (not (= this@25@01 $Ref.null)))
(assert (=
  ($Snap.second $t@28@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@28@01))
    ($Snap.second ($Snap.second $t@28@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@28@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@28@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@28@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))
; [eval] this.left != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  $Ref.null)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | First:(Second:(Second:($t@28@01))) != Null | live]
; [else-branch: 34 | First:(Second:(Second:($t@28@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 34 | First:(Second:(Second:($t@28@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))
; [eval] this.left != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | First:(Second:(Second:($t@28@01))) != Null | live]
; [else-branch: 35 | First:(Second:(Second:($t@28@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | First:(Second:(Second:($t@28@01))) != Null]
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@25@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))
; [eval] this.left != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | First:(Second:(Second:($t@28@01))) != Null | live]
; [else-branch: 36 | First:(Second:(Second:($t@28@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 36 | First:(Second:(Second:($t@28@01))) != Null]
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  this@25@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))
  $Snap.unit))
; [eval] this.left != null ==> this.left.height > 0
; [eval] this.left != null
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | First:(Second:(Second:($t@28@01))) != Null | live]
; [else-branch: 37 | First:(Second:(Second:($t@28@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 37 | First:(Second:(Second:($t@28@01))) != Null]
; [eval] this.left.height > 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
      $Ref.null))
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))
; [eval] this.right != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
; [else-branch: 38 | First:(Second:(Second:(Second:($t@28@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 38 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
    $Ref.null)))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
; [else-branch: 39 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 39 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  this@25@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
; [else-branch: 40 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 40 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  this@25@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.height > 0
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
; [else-branch: 41 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 41 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
; [eval] this.right.height > 0
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
      $Ref.null))
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))
  $Snap.unit))
; [eval] this.height == ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] (this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 9
; [then-branch: 42 | First:(Second:(Second:($t@28@01))) == Null | dead]
; [else-branch: 42 | First:(Second:(Second:($t@28@01))) != Null | live]
(push) ; 10
; [else-branch: 42 | First:(Second:(Second:($t@28@01))) != Null]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 9
; [then-branch: 43 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
; [else-branch: 43 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
(push) ; 10
; [else-branch: 43 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
(pop) ; 10
(pop) ; 9
; Joined path conditions
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (>
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | First:(Second:(Second:(Second:(Second:(Second:(Second:($t@28@01))))))) > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@28@01))))))))))) | live]
; [else-branch: 44 | !(First:(Second:(Second:(Second:(Second:(Second:(Second:($t@28@01))))))) > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@28@01)))))))))))) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 44 | First:(Second:(Second:(Second:(Second:(Second:(Second:($t@28@01))))))) > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@28@01)))))))))))]
(assert (>
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))
; [eval] (this.left == null ? 0 : this.left.height) + 1
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 11
; [then-branch: 45 | First:(Second:(Second:($t@28@01))) == Null | dead]
; [else-branch: 45 | First:(Second:(Second:($t@28@01))) != Null | live]
(push) ; 12
; [else-branch: 45 | First:(Second:(Second:($t@28@01))) != Null]
(pop) ; 12
(pop) ; 11
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 44 | !(First:(Second:(Second:(Second:(Second:(Second:(Second:($t@28@01))))))) > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@28@01))))))))))))]
(assert (not
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))
; [eval] (this.right == null ? 0 : this.right.height) + 1
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 11
; [then-branch: 46 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
; [else-branch: 46 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
(push) ; 12
; [else-branch: 46 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
(pop) ; 12
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (>
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@28@01)))
  (ite
    (>
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
      1)
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor == (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 9
; [then-branch: 47 | First:(Second:(Second:($t@28@01))) == Null | dead]
; [else-branch: 47 | First:(Second:(Second:($t@28@01))) != Null | live]
(push) ; 10
; [else-branch: 47 | First:(Second:(Second:($t@28@01))) != Null]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 9
; [then-branch: 48 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
; [else-branch: 48 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
(push) ; 10
; [else-branch: 48 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
  (-
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor <= 1
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor >= -1
; [eval] -1
(assert (>=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01))))))
  (- 0 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))))))))))))))
  $Snap.unit))
; [eval] this.height > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@28@01))) 0))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@28@01 this@25@01))
; [eval] k == this.key
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= k@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@28@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= k@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | k@26@01 == First:($t@28@01) | live]
; [else-branch: 49 | k@26@01 != First:($t@28@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 49 | k@26@01 == First:($t@28@01)]
(assert (= k@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@28@01))))
; [exec]
; b := true
; [exec]
; fold acc(valid(this), write)
; [eval] this.left != null
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | First:(Second:(Second:($t@28@01))) != Null | live]
; [else-branch: 50 | First:(Second:(Second:($t@28@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 50 | First:(Second:(Second:($t@28@01))) != Null]
; [eval] this.left != null
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | First:(Second:(Second:($t@28@01))) != Null | live]
; [else-branch: 51 | First:(Second:(Second:($t@28@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 51 | First:(Second:(Second:($t@28@01))) != Null]
; [eval] this.left != null
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | First:(Second:(Second:($t@28@01))) != Null | live]
; [else-branch: 52 | First:(Second:(Second:($t@28@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 52 | First:(Second:(Second:($t@28@01))) != Null]
; [eval] this.left != null ==> this.left.height > 0
; [eval] this.left != null
(push) ; 13
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | First:(Second:(Second:($t@28@01))) != Null | live]
; [else-branch: 53 | First:(Second:(Second:($t@28@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 53 | First:(Second:(Second:($t@28@01))) != Null]
; [eval] this.left.height > 0
(pop) ; 14
(pop) ; 13
; Joined path conditions
; [eval] this.right != null
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
; [else-branch: 54 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 54 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
; [eval] this.right != null
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 55 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
; [else-branch: 55 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 55 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
; [eval] this.right != null
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 56 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
; [else-branch: 56 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 56 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
; [eval] this.right != null ==> this.right.height > 0
; [eval] this.right != null
(push) ; 16
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | First:(Second:(Second:(Second:($t@28@01)))) != Null | live]
; [else-branch: 57 | First:(Second:(Second:(Second:($t@28@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 57 | First:(Second:(Second:(Second:($t@28@01)))) != Null]
; [eval] this.right.height > 0
; ---------- getBalanceFactor ----------
(declare-const this@30@01 $Ref)
(declare-const rd@31@01 $Perm)
(declare-const bf@32@01 Int)
(declare-const this@33@01 $Ref)
(declare-const rd@34@01 $Perm)
(declare-const bf@35@01 Int)
(push) ; 18
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.first $t@36@01) $Snap.unit))
; ---------- getBalanceFactorI ----------
