(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:18
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0119.vpr
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
(declare-fun p%trigger ($Snap $Ref) Bool)
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
; ---------- test01 ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= this@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var c: Int
(declare-const c@3@01 Int)
; [exec]
; var d: Int
(declare-const d@4@01 Int)
; [exec]
; c := (unfolding acc(p(this), write) in this.x)
; [eval] (unfolding acc(p(this), write) in this.x)
(push) ; 3
(assert (p%trigger ($Snap.first $t@2@01) this@1@01))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))))
(pop) ; 3
; Joined path conditions
(assert (and
  (p%trigger ($Snap.first $t@2@01) this@1@01)
  (=
    ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)))))
(declare-const c@5@01 Int)
(assert (= c@5@01 ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))))
; [exec]
; exhale acc(this.x, 1 / 2)
; [exec]
; d := (unfolding acc(p(this), write) in this.x)
; [eval] (unfolding acc(p(this), write) in this.x)
(push) ; 3
(pop) ; 3
; Joined path conditions
(declare-const d@6@01 Int)
(assert (= d@6@01 ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))))
; [exec]
; assert c == d
; [eval] c == d
(push) ; 3
(assert (not (= c@5@01 d@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= c@5@01 d@6@01))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const this@7@01 $Ref)
(declare-const alias@8@01 $Ref)
(declare-const this@9@01 $Ref)
(declare-const alias@10@01 $Ref)
(push) ; 1
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.first $t@11@01) $Snap.unit))
; [eval] this == alias
(assert (= this@9@01 alias@10@01))
(assert (=
  ($Snap.second $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.second ($Snap.second $t@11@01)))))
(assert (not (= alias@10@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var c: Int
(declare-const c@12@01 Int)
; [exec]
; var d: Int
(declare-const d@13@01 Int)
; [exec]
; c := (unfolding acc(p(this), write) in this.x)
; [eval] (unfolding acc(p(this), write) in this.x)
(push) ; 3
(assert (p%trigger ($Snap.first ($Snap.second $t@11@01)) this@9@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (= alias@10@01 this@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@11@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@11@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= alias@10@01 this@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (p%trigger ($Snap.first ($Snap.second $t@11@01)) this@9@01)
  (=
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@11@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@11@01))))))
(declare-const c@14@01 Int)
(assert (= c@14@01 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@11@01)))))
; [exec]
; exhale acc(this.x, 1 / 2)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= alias@10@01 this@9@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; d := (unfolding acc(p(alias), write) in alias.x)
; [eval] (unfolding acc(p(alias), write) in alias.x)
(set-option :timeout 0)
(push) ; 3
(assert (p%trigger ($Snap.first ($Snap.second $t@11@01)) alias@10@01))
(pop) ; 3
; Joined path conditions
(assert (p%trigger ($Snap.first ($Snap.second $t@11@01)) alias@10@01))
(declare-const d@15@01 Int)
(assert (= d@15@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@11@01)))))
; [exec]
; assert c == d
; [eval] c == d
(push) ; 3
(assert (not (= c@14@01 d@15@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= c@14@01 d@15@01))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const this@16@01 $Ref)
(declare-const alias@17@01 $Ref)
(declare-const this@18@01 $Ref)
(declare-const alias@19@01 $Ref)
(push) ; 1
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (= ($Snap.first $t@20@01) $Snap.unit))
; [eval] this == alias
(assert (= this@18@01 alias@19@01))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (not (= alias@19@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var c: Int
(declare-const c@21@01 Int)
; [exec]
; var d: Int
(declare-const d@22@01 Int)
; [exec]
; c := (unfolding acc(p(alias), write) in alias.x)
; [eval] (unfolding acc(p(alias), write) in alias.x)
(push) ; 3
(assert (p%trigger ($Snap.first ($Snap.second $t@20@01)) alias@19@01))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@20@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@01)))))
(pop) ; 3
; Joined path conditions
(assert (and
  (p%trigger ($Snap.first ($Snap.second $t@20@01)) alias@19@01)
  (=
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@20@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@01))))))
(declare-const c@23@01 Int)
(assert (= c@23@01 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@20@01)))))
; [exec]
; exhale acc(alias.x, 1 / 2)
; [exec]
; d := (unfolding acc(p(this), write) in this.x)
; [eval] (unfolding acc(p(this), write) in this.x)
(push) ; 3
(assert (p%trigger ($Snap.first ($Snap.second $t@20@01)) this@18@01))
(assert (not (= this@18@01 $Ref.null)))
(pop) ; 3
; Joined path conditions
(assert (and
  (p%trigger ($Snap.first ($Snap.second $t@20@01)) this@18@01)
  (not (= this@18@01 $Ref.null))))
(declare-const d@24@01 Int)
(assert (= d@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@01)))))
; [exec]
; assert c == d
; [eval] c == d
(push) ; 3
(assert (not (= c@23@01 d@24@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= c@23@01 d@24@01))
(pop) ; 2
(pop) ; 1
