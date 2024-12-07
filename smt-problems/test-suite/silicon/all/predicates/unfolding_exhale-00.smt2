(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/predicates/unfolding_exhale.vpr
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
; ---------- fail10 ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(P(this), write) &&
;   (unfolding acc(P(this), write) in this.x == old(this.x))
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(push) ; 3
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@2@01) this@1@01))
(assert (not (= this@1@01 $Ref.null)))
; [eval] this.x == old(this.x)
; [eval] old(this.x)
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
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(set-option :timeout 0)
(push) ; 3
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@2@01) this@1@01))
(assert (not (= this@1@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x)
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
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
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(set-option :timeout 0)
(push) ; 3
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@2@01) this@1@01))
(assert (not (= this@1@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x)
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
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
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(set-option :timeout 0)
(push) ; 3
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@2@01) this@1@01))
(assert (not (= this@1@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x)
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- success10 ----------
(declare-const this@3@01 $Ref)
(declare-const this@4@01 $Ref)
(push) ; 1
(declare-const $t@5@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(P(this), write) &&
;   (unfolding acc(P(this), write) in
;     this.x == old((unfolding acc(P(this), write) in this.x)))
; [eval] (unfolding acc(P(this), write) in this.x == old((unfolding acc(P(this), write) in this.x)))
(push) ; 3
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@5@01) this@4@01))
(assert (not (= this@4@01 $Ref.null)))
; [eval] this.x == old((unfolding acc(P(this), write) in this.x))
; [eval] old((unfolding acc(P(this), write) in this.x))
; [eval] (unfolding acc(P(this), write) in this.x)
(push) ; 4
(pop) ; 4
; Joined path conditions
(pop) ; 3
; Joined path conditions
(assert (and
  (P%trigger ($SortWrappers.IntTo$Snap $t@5@01) this@4@01)
  (not (= this@4@01 $Ref.null))))
(pop) ; 2
(pop) ; 1
; ---------- success2 ----------
(declare-const this@6@01 $Ref)
(declare-const this@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 Int)
(assert (not (= this@7@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(P(this), write)
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@8@01) this@7@01))
; [exec]
; exhale acc(P(this), write) &&
;   (unfolding acc(P(this), write) in this.x == old(this.x))
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(push) ; 3
; [eval] this.x == old(this.x)
; [eval] old(this.x)
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- fail5 ----------
(declare-const this@9@01 $Ref)
(declare-const this@10@01 $Ref)
(push) ; 1
(declare-const $t@11@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(P(this), write)
(assert (not (= this@10@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@11@01) this@10@01))
; [exec]
; this.x := this.x + 1
; [eval] this.x + 1
(declare-const x@12@01 Int)
(assert (= x@12@01 (+ $t@11@01 1)))
; [exec]
; fold acc(P(this), write)
(assert (P%trigger ($SortWrappers.IntTo$Snap x@12@01) this@10@01))
; [exec]
; exhale acc(P(this), write) &&
;   (unfolding acc(P(this), write) in this.x == old(this.x) + 1)
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x) + 1)
(set-option :timeout 0)
(push) ; 3
; [eval] this.x == old(this.x) + 1
; [eval] old(this.x) + 1
; [eval] old(this.x)
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
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x) + 1)
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x) + 1
; [eval] old(this.x) + 1
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
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
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x) + 1)
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x) + 1
; [eval] old(this.x) + 1
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
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
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x) + 1)
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x) + 1
; [eval] old(this.x) + 1
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- success5 ----------
(declare-const this@13@01 $Ref)
(declare-const this@14@01 $Ref)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.first $t@15@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@14@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(P(this), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger ($Snap.second $t@15@01) this@14@01))
; [exec]
; this.x := this.x + 1
; [eval] this.x + 1
(declare-const x@16@01 Int)
(assert (= x@16@01 (+ ($SortWrappers.$SnapToInt ($Snap.second $t@15@01)) 1)))
; [exec]
; fold acc(P(this), write)
(assert (P%trigger ($SortWrappers.IntTo$Snap x@16@01) this@14@01))
; [exec]
; exhale acc(P(this), write) &&
;   (unfolding acc(P(this), write) in
;     this.x == old((unfolding acc(P(this), write) in this.x)) + 1)
; [eval] (unfolding acc(P(this), write) in this.x == old((unfolding acc(P(this), write) in this.x)) + 1)
(set-option :timeout 0)
(push) ; 3
; [eval] this.x == old((unfolding acc(P(this), write) in this.x)) + 1
; [eval] old((unfolding acc(P(this), write) in this.x)) + 1
; [eval] old((unfolding acc(P(this), write) in this.x))
; [eval] (unfolding acc(P(this), write) in this.x)
(push) ; 4
(pop) ; 4
; Joined path conditions
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- success4 ----------
(declare-const this@17@01 $Ref)
(declare-const this@18@01 $Ref)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@18@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; this.x := this.x + 1
; [eval] this.x + 1
(declare-const x@20@01 Int)
(assert (= x@20@01 (+ ($SortWrappers.$SnapToInt ($Snap.second $t@19@01)) 1)))
; [exec]
; fold acc(P(this), write)
(assert (P%trigger ($SortWrappers.IntTo$Snap x@20@01) this@18@01))
; [exec]
; exhale acc(P(this), write) &&
;   (unfolding acc(P(this), write) in this.x == old(this.x) + 1)
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x) + 1)
(push) ; 3
; [eval] this.x == old(this.x) + 1
; [eval] old(this.x) + 1
; [eval] old(this.x)
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- fail1 ----------
(declare-const this@21@01 $Ref)
(declare-const this@22@01 $Ref)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (= ($Snap.first $t@23@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@22@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(P(this), write)
(assert (P%trigger ($Snap.second $t@23@01) this@22@01))
; [exec]
; exhale acc(P(this), write) &&
;   (unfolding acc(P(this), write) in
;     this.x == old((unfolding acc(P(this), write) in this.x)))
; [eval] (unfolding acc(P(this), write) in this.x == old((unfolding acc(P(this), write) in this.x)))
(push) ; 3
; [eval] this.x == old((unfolding acc(P(this), write) in this.x))
; [eval] old((unfolding acc(P(this), write) in this.x))
; [eval] (unfolding acc(P(this), write) in this.x)
(push) ; 4
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old((unfolding acc(P(this), write) in this.x)))
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old((unfolding acc(P(this), write) in this.x))
; [eval] old((unfolding acc(P(this), write) in this.x))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old((unfolding acc(P(this), write) in this.x)))
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old((unfolding acc(P(this), write) in this.x))
; [eval] old((unfolding acc(P(this), write) in this.x))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x == old((unfolding acc(P(this), write) in this.x)))
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old((unfolding acc(P(this), write) in this.x))
; [eval] old((unfolding acc(P(this), write) in this.x))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] (unfolding acc(P(this), write) in this.x)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- fail2 ----------
(declare-const this@24@01 $Ref)
(declare-const this@25@01 $Ref)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@25@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; this.x := 0
; [exec]
; fold acc(P(this), write)
(assert (P%trigger ($SortWrappers.IntTo$Snap 0) this@25@01))
; [exec]
; exhale acc(P(this), write) &&
;   (unfolding acc(P(this), write) in this.x == old(this.x))
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(push) ; 3
; [eval] this.x == old(this.x)
; [eval] old(this.x)
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= 0 ($SortWrappers.$SnapToInt ($Snap.second $t@26@01)))))
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
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x)
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (= 0 ($SortWrappers.$SnapToInt ($Snap.second $t@26@01)))))
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
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x)
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (= 0 ($SortWrappers.$SnapToInt ($Snap.second $t@26@01)))))
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
; [eval] (unfolding acc(P(this), write) in this.x == old(this.x))
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this.x == old(this.x)
; [eval] old(this.x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (= 0 ($SortWrappers.$SnapToInt ($Snap.second $t@26@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
