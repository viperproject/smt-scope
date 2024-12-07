(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:59:21
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0010.vpr
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
(declare-fun P%trigger ($Snap $Ref) Bool)
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
; ---------- branch ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert 3 > 2 && (unfolding acc(P(this), write) in (!this.b ? true : true))
; [eval] 3 > 2
; [eval] (unfolding acc(P(this), write) in (!this.b ? true : true))
(push) ; 3
(assert (P%trigger $t@2@01 this@1@01))
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= this@1@01 $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@2@01) | live]
; [else-branch: 0 | !(First:($t@2@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:($t@2@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))
; [eval] (!this.b ? true : true)
; [eval] !this.b
(push) ; 5
; [then-branch: 1 | !(First:($t@2@01)) | dead]
; [else-branch: 1 | First:($t@2@01) | live]
(push) ; 6
; [else-branch: 1 | First:($t@2@01)]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(First:($t@2@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] (!this.b ? true : true)
; [eval] !this.b
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | !(First:($t@2@01)) | live]
; [else-branch: 2 | First:($t@2@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | !(First:($t@2@01))]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@3@01 Bool)
(assert (=>
  ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))
  (= (as joined_unfolding@3@01  Bool) true)))
(assert (=>
  (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))
  (= (as joined_unfolding@3@01  Bool) true)))
; Joined path conditions
(assert (and
  (P%trigger $t@2@01 this@1@01)
  (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
  (not (= this@1@01 $Ref.null))))
; Joined path conditions
(assert (and
  (P%trigger $t@2@01 this@1@01)
  (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
  (not (= this@1@01 $Ref.null))))
(assert (=>
  (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))
  (and
    (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))
    (= ($Snap.second $t@2@01) $Snap.unit))))
(assert (or
  (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))
  ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))))
(push) ; 3
(assert (not (as joined_unfolding@3@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@3@01  Bool))
(pop) ; 2
(pop) ; 1
