(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permission_introspection/forpermMisc.vpr
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
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const p@1@01 $Perm)
(declare-const x@2@01 $Ref)
(declare-const p@3@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] p >= none
(assert (>= p@3@01 $Perm.No))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(x.val, p)
(push) ; 3
(assert (not (or (= p@3@01 $Perm.No) (< $Perm.No p@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@5@01 Int)
(assert (<= $Perm.No p@3@01))
(assert (<= p@3@01 $Perm.Write))
(assert (=> (< $Perm.No p@3@01) (not (= x@2@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forperm r: Ref [r.val] :: false)
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forperm r: Ref [r.val] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< $Perm.No p@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No p@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | (Z) < (p@3@01) | live]
; [else-branch: 0 | !((Z) < (p@3@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | (Z) < (p@3@01)]
(assert (< $Perm.No p@3@01))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !((Z) < (p@3@01))]
(assert (not (< $Perm.No p@3@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< $Perm.No p@3@01)) (< $Perm.No p@3@01)))
(assert (=> (< $Perm.No p@3@01) false))
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
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@7@01 $Ref)
(declare-const p@8@01 $Perm)
(declare-const x@9@01 $Ref)
(declare-const p@10@01 $Perm)
(push) ; 1
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] p >= none
(assert (>= p@10@01 $Perm.No))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(x.val, p)
(push) ; 3
(assert (not (or (= p@10@01 $Perm.No) (< $Perm.No p@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@12@01 Int)
(assert (<= $Perm.No p@10@01))
(assert (<= p@10@01 $Perm.Write))
(assert (=> (< $Perm.No p@10@01) (not (= x@9@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm r: Ref [r.val] :: false)
; [eval] (forperm r: Ref [r.val] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< $Perm.No p@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No p@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | (Z) < (p@10@01) | live]
; [else-branch: 1 | !((Z) < (p@10@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | (Z) < (p@10@01)]
(assert (< $Perm.No p@10@01))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !((Z) < (p@10@01))]
(assert (not (< $Perm.No p@10@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< $Perm.No p@10@01)) (< $Perm.No p@10@01)))
(push) ; 3
(assert (not (=> (< $Perm.No p@10@01) false)))
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
; [eval] (forperm r: Ref [r.val] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< $Perm.No p@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No p@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | (Z) < (p@10@01) | live]
; [else-branch: 2 | !((Z) < (p@10@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | (Z) < (p@10@01)]
(assert (< $Perm.No p@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | !((Z) < (p@10@01))]
(assert (not (< $Perm.No p@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (< $Perm.No p@10@01) false)))
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
; [eval] (forperm r: Ref [r.val] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< $Perm.No p@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No p@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | (Z) < (p@10@01) | live]
; [else-branch: 3 | !((Z) < (p@10@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | (Z) < (p@10@01)]
(assert (< $Perm.No p@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | !((Z) < (p@10@01))]
(assert (not (< $Perm.No p@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (< $Perm.No p@10@01) false)))
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
; [eval] (forperm r: Ref [r.val] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< $Perm.No p@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No p@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | (Z) < (p@10@01) | live]
; [else-branch: 4 | !((Z) < (p@10@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | (Z) < (p@10@01)]
(assert (< $Perm.No p@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | !((Z) < (p@10@01))]
(assert (not (< $Perm.No p@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (< $Perm.No p@10@01) false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const c1@13@01 $Ref)
(declare-const c2@14@01 $Ref)
(declare-const c3@15@01 $Ref)
(declare-const c1@16@01 $Ref)
(declare-const c2@17@01 $Ref)
(declare-const c3@18@01 $Ref)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (not (= c1@16@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@16@01 c2@17@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@17@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
; [eval] c3 == c1 || c3 == c2
; [eval] c3 == c1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 5 | c3@18@01 == c1@16@01 | live]
; [else-branch: 5 | c3@18@01 != c1@16@01 | live]
(push) ; 3
; [then-branch: 5 | c3@18@01 == c1@16@01]
(assert (= c3@18@01 c1@16@01))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | c3@18@01 != c1@16@01]
(assert (not (= c3@18@01 c1@16@01)))
; [eval] c3 == c2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= c3@18@01 c1@16@01)) (= c3@18@01 c1@16@01)))
(assert (or (= c3@18@01 c1@16@01) (= c3@18@01 c2@17@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forperm r: Ref [r.val] :: r == c3 ==> false)
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] (forperm r: Ref [r.val] :: r == c3 ==> false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | True]
; [eval] r == c3 ==> false
; [eval] r == c3
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c2@17@01 c3@18@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c2@17@01 c3@18@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | c2@17@01 == c3@18@01 | live]
; [else-branch: 7 | c2@17@01 != c3@18@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 7 | c2@17@01 == c3@18@01]
(assert (= c2@17@01 c3@18@01))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | c2@17@01 != c3@18@01]
(assert (not (= c2@17@01 c3@18@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= c2@17@01 c3@18@01)) (= c2@17@01 c3@18@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (not (= c2@17@01 c3@18@01)) (= c2@17@01 c3@18@01)))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | True | live]
; [else-branch: 8 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | True]
; [eval] r == c3 ==> false
; [eval] r == c3
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@16@01 c3@18@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@16@01 c3@18@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | c1@16@01 == c3@18@01 | live]
; [else-branch: 9 | c1@16@01 != c3@18@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 9 | c1@16@01 == c3@18@01]
(assert (= c1@16@01 c3@18@01))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | c1@16@01 != c3@18@01]
(assert (not (= c1@16@01 c3@18@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= c1@16@01 c3@18@01)) (= c1@16@01 c3@18@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (not (= c1@16@01 c3@18@01)) (= c1@16@01 c3@18@01)))
(assert (and (=> (= c2@17@01 c3@18@01) false) (=> (= c1@16@01 c3@18@01) false)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const c1@21@01 $Ref)
(declare-const c2@22@01 $Ref)
(declare-const c3@23@01 $Ref)
(declare-const c1@24@01 $Ref)
(declare-const c2@25@01 $Ref)
(declare-const c3@26@01 $Ref)
(push) ; 1
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (not (= c1@24@01 $Ref.null)))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= c2@25@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@27@01)) $Snap.unit))
; [eval] c3 == c1 || c3 == c2
; [eval] c3 == c1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 10 | c3@26@01 == c1@24@01 | live]
; [else-branch: 10 | c3@26@01 != c1@24@01 | live]
(push) ; 3
; [then-branch: 10 | c3@26@01 == c1@24@01]
(assert (= c3@26@01 c1@24@01))
(pop) ; 3
(push) ; 3
; [else-branch: 10 | c3@26@01 != c1@24@01]
(assert (not (= c3@26@01 c1@24@01)))
; [eval] c3 == c2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= c3@26@01 c1@24@01)) (= c3@26@01 c1@24@01)))
(assert (or (= c3@26@01 c1@24@01) (= c3@26@01 c2@25@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forperm r: Ref [r.val] :: r == c3 ==> false)
; [eval] (forperm r: Ref [r.val] :: r == c3 ==> false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | True | live]
; [else-branch: 11 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | True]
; [eval] r == c3 ==> false
; [eval] r == c3
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c2@25@01 c3@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c2@25@01 c3@26@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | c2@25@01 == c3@26@01 | live]
; [else-branch: 12 | c2@25@01 != c3@26@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 12 | c2@25@01 == c3@26@01]
(assert (= c2@25@01 c3@26@01))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | c2@25@01 != c3@26@01]
(assert (not (= c2@25@01 c3@26@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= c2@25@01 c3@26@01)) (= c2@25@01 c3@26@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (not (= c2@25@01 c3@26@01)) (= c2@25@01 c3@26@01)))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | True | live]
; [else-branch: 13 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | True]
; [eval] r == c3 ==> false
; [eval] r == c3
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@24@01 c3@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@24@01 c3@26@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | c1@24@01 == c3@26@01 | live]
; [else-branch: 14 | c1@24@01 != c3@26@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 14 | c1@24@01 == c3@26@01]
(assert (= c1@24@01 c3@26@01))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | c1@24@01 != c3@26@01]
(assert (not (= c1@24@01 c3@26@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= c1@24@01 c3@26@01)) (= c1@24@01 c3@26@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (not (= c1@24@01 c3@26@01)) (= c1@24@01 c3@26@01)))
(push) ; 3
(assert (not (and (=> (= c2@25@01 c3@26@01) false) (=> (= c1@24@01 c3@26@01) false))))
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
(assert (not (= c2@25@01 c1@24@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
; [eval] (forperm r: Ref [r.val] :: r == c3 ==> false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | True | live]
; [else-branch: 15 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
; [eval] r == c3 ==> false
; [eval] r == c3
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@24@01 c3@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@24@01 c3@26@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | c1@24@01 == c3@26@01 | live]
; [else-branch: 16 | c1@24@01 != c3@26@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | c1@24@01 == c3@26@01]
(assert (= c1@24@01 c3@26@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 16 | c1@24@01 != c3@26@01]
(assert (not (= c1@24@01 c3@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (= c1@24@01 c3@26@01)
  (and
    (= c1@24@01 c3@26@01)
    (not (= c1@24@01 c2@25@01))
    (not (= c2@25@01 c1@24@01)))))
; Joined path conditions
(assert (=>
  (not (= c1@24@01 c3@26@01))
  (and
    (not (= c1@24@01 c3@26@01))
    (not (= c1@24@01 c2@25@01))
    (not (= c2@25@01 c1@24@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (not (= c2@25@01 c1@24@01))
  (not (= c1@24@01 c2@25@01))
  (=>
    (= c1@24@01 c3@26@01)
    (and
      (= c1@24@01 c3@26@01)
      (not (= c1@24@01 c2@25@01))
      (not (= c2@25@01 c1@24@01))))
  (=>
    (not (= c1@24@01 c3@26@01))
    (and
      (not (= c1@24@01 c3@26@01))
      (not (= c1@24@01 c2@25@01))
      (not (= c2@25@01 c1@24@01))))))
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | True | live]
; [else-branch: 17 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
; [eval] r == c3 ==> false
; [eval] r == c3
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c2@25@01 c3@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c2@25@01 c3@26@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | c2@25@01 == c3@26@01 | live]
; [else-branch: 18 | c2@25@01 != c3@26@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 18 | c2@25@01 == c3@26@01]
(assert (= c2@25@01 c3@26@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 18 | c2@25@01 != c3@26@01]
(assert (not (= c2@25@01 c3@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (= c2@25@01 c3@26@01)
  (and
    (= c2@25@01 c3@26@01)
    (not (= c1@24@01 c2@25@01))
    (not (= c2@25@01 c1@24@01)))))
; Joined path conditions
(assert (=>
  (not (= c2@25@01 c3@26@01))
  (and
    (not (= c2@25@01 c3@26@01))
    (not (= c1@24@01 c2@25@01))
    (not (= c2@25@01 c1@24@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (not (= c2@25@01 c1@24@01))
  (not (= c1@24@01 c2@25@01))
  (=>
    (= c2@25@01 c3@26@01)
    (and
      (= c2@25@01 c3@26@01)
      (not (= c1@24@01 c2@25@01))
      (not (= c2@25@01 c1@24@01))))
  (=>
    (not (= c2@25@01 c3@26@01))
    (and
      (not (= c2@25@01 c3@26@01))
      (not (= c1@24@01 c2@25@01))
      (not (= c2@25@01 c1@24@01))))))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (=> (= c1@24@01 c3@26@01) false) (=> (= c2@25@01 c3@26@01) false))))
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
(assert (not (= c2@25@01 c1@24@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
; [eval] (forperm r: Ref [r.val] :: r == c3 ==> false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | True | live]
; [else-branch: 19 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
; [eval] r == c3 ==> false
; [eval] r == c3
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c2@25@01 c3@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c2@25@01 c3@26@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | c2@25@01 == c3@26@01 | live]
; [else-branch: 20 | c2@25@01 != c3@26@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 20 | c2@25@01 == c3@26@01]
(assert (= c2@25@01 c3@26@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 20 | c2@25@01 != c3@26@01]
(assert (not (= c2@25@01 c3@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (= c2@25@01 c3@26@01)
  (and
    (= c2@25@01 c3@26@01)
    (not (= c2@25@01 c1@24@01))
    (not (= c1@24@01 c2@25@01)))))
; Joined path conditions
(assert (=>
  (not (= c2@25@01 c3@26@01))
  (and
    (not (= c2@25@01 c3@26@01))
    (not (= c2@25@01 c1@24@01))
    (not (= c1@24@01 c2@25@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (not (= c1@24@01 c2@25@01))
  (not (= c2@25@01 c1@24@01))
  (=>
    (= c2@25@01 c3@26@01)
    (and
      (= c2@25@01 c3@26@01)
      (not (= c2@25@01 c1@24@01))
      (not (= c1@24@01 c2@25@01))))
  (=>
    (not (= c2@25@01 c3@26@01))
    (and
      (not (= c2@25@01 c3@26@01))
      (not (= c2@25@01 c1@24@01))
      (not (= c1@24@01 c2@25@01))))))
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
; [eval] r == c3 ==> false
; [eval] r == c3
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@24@01 c3@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@24@01 c3@26@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | c1@24@01 == c3@26@01 | live]
; [else-branch: 22 | c1@24@01 != c3@26@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 22 | c1@24@01 == c3@26@01]
(assert (= c1@24@01 c3@26@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 22 | c1@24@01 != c3@26@01]
(assert (not (= c1@24@01 c3@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (= c1@24@01 c3@26@01)
  (and
    (= c1@24@01 c3@26@01)
    (not (= c2@25@01 c1@24@01))
    (not (= c1@24@01 c2@25@01)))))
; Joined path conditions
(assert (=>
  (not (= c1@24@01 c3@26@01))
  (and
    (not (= c1@24@01 c3@26@01))
    (not (= c2@25@01 c1@24@01))
    (not (= c1@24@01 c2@25@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (not (= c1@24@01 c2@25@01))
  (not (= c2@25@01 c1@24@01))
  (=>
    (= c1@24@01 c3@26@01)
    (and
      (= c1@24@01 c3@26@01)
      (not (= c2@25@01 c1@24@01))
      (not (= c1@24@01 c2@25@01))))
  (=>
    (not (= c1@24@01 c3@26@01))
    (and
      (not (= c1@24@01 c3@26@01))
      (not (= c2@25@01 c1@24@01))
      (not (= c1@24@01 c2@25@01))))))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (=> (= c2@25@01 c3@26@01) false) (=> (= c1@24@01 c3@26@01) false))))
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
(assert (not (= c2@25@01 c1@24@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
; [eval] (forperm r: Ref [r.val] :: r == c3 ==> false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
; [eval] r == c3 ==> false
; [eval] r == c3
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@24@01 c3@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@24@01 c3@26@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | c1@24@01 == c3@26@01 | live]
; [else-branch: 24 | c1@24@01 != c3@26@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 24 | c1@24@01 == c3@26@01]
(assert (= c1@24@01 c3@26@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 24 | c1@24@01 != c3@26@01]
(assert (not (= c1@24@01 c3@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= c1@24@01 c2@25@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
; [eval] r == c3 ==> false
; [eval] r == c3
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c2@25@01 c3@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c2@25@01 c3@26@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | c2@25@01 == c3@26@01 | live]
; [else-branch: 26 | c2@25@01 != c3@26@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 26 | c2@25@01 == c3@26@01]
(assert (= c2@25@01 c3@26@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 26 | c2@25@01 != c3@26@01]
(assert (not (= c2@25@01 c3@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= c2@25@01 c1@24@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@27@01)))
    ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c1@24@01 c2@25@01)) (not (= c2@25@01 c1@24@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and (not (= c2@25@01 c1@24@01)) (not (= c1@24@01 c2@25@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (=> (= c1@24@01 c3@26@01) false) (=> (= c2@25@01 c3@26@01) false))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test07a ----------
(declare-const c1@28@01 $Ref)
(declare-const c2@29@01 $Ref)
(declare-const c1@30@01 $Ref)
(declare-const c2@31@01 $Ref)
(push) ; 1
(declare-const $t@32@01 Int)
(assert (not (= c1@30@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forperm r: Ref [r.val] :: r == c2 ==> false)
; [eval] (forperm r: Ref [r.val] :: r == c2 ==> false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 27 | True]
; [eval] r == c2 ==> false
; [eval] r == c2
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@30@01 c2@31@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@30@01 c2@31@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | c1@30@01 == c2@31@01 | live]
; [else-branch: 28 | c1@30@01 != c2@31@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 28 | c1@30@01 == c2@31@01]
(assert (= c1@30@01 c2@31@01))
(pop) ; 6
(push) ; 6
; [else-branch: 28 | c1@30@01 != c2@31@01]
(assert (not (= c1@30@01 c2@31@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= c1@30@01 c2@31@01)) (= c1@30@01 c2@31@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (not (= c1@30@01 c2@31@01)) (= c1@30@01 c2@31@01)))
(push) ; 3
(assert (not (=> (= c1@30@01 c2@31@01) false)))
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
; [eval] (forperm r: Ref [r.val] :: r == c2 ==> false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 29 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r == c2 ==> false
; [eval] r == c2
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@30@01 c2@31@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@30@01 c2@31@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | c1@30@01 == c2@31@01 | live]
; [else-branch: 30 | c1@30@01 != c2@31@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 30 | c1@30@01 == c2@31@01]
(assert (= c1@30@01 c2@31@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 30 | c1@30@01 != c2@31@01]
(assert (not (= c1@30@01 c2@31@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (= c1@30@01 c2@31@01) false)))
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
; [eval] (forperm r: Ref [r.val] :: r == c2 ==> false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | True | live]
; [else-branch: 31 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 31 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r == c2 ==> false
; [eval] r == c2
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@30@01 c2@31@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@30@01 c2@31@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | c1@30@01 == c2@31@01 | live]
; [else-branch: 32 | c1@30@01 != c2@31@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 32 | c1@30@01 == c2@31@01]
(assert (= c1@30@01 c2@31@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 32 | c1@30@01 != c2@31@01]
(assert (not (= c1@30@01 c2@31@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (= c1@30@01 c2@31@01) false)))
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
; [eval] (forperm r: Ref [r.val] :: r == c2 ==> false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | True | live]
; [else-branch: 33 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 33 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r == c2 ==> false
; [eval] r == c2
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@30@01 c2@31@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@30@01 c2@31@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | c1@30@01 == c2@31@01 | live]
; [else-branch: 34 | c1@30@01 != c2@31@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 34 | c1@30@01 == c2@31@01]
(assert (= c1@30@01 c2@31@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 34 | c1@30@01 != c2@31@01]
(assert (not (= c1@30@01 c2@31@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (= c1@30@01 c2@31@01) false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test07b ----------
(declare-const c1@33@01 $Ref)
(declare-const c2@34@01 $Ref)
(declare-const c1@35@01 $Ref)
(declare-const c2@36@01 $Ref)
(push) ; 1
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(assert (not (= c1@35@01 $Ref.null)))
(assert (= ($Snap.second $t@37@01) $Snap.unit))
; [eval] c1 != c2
(assert (not (= c1@35@01 c2@36@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forperm r: Ref [r.val] :: r == c2 ==> false)
; [eval] (forperm r: Ref [r.val] :: r == c2 ==> false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | True]
; [eval] r == c2 ==> false
; [eval] r == c2
(push) ; 5
; [then-branch: 36 | c1@35@01 == c2@36@01 | dead]
; [else-branch: 36 | c1@35@01 != c2@36@01 | live]
(push) ; 6
; [else-branch: 36 | c1@35@01 != c2@36@01]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const c1@38@01 $Ref)
(declare-const c2@39@01 $Ref)
(declare-const c1@40@01 $Ref)
(declare-const c2@41@01 $Ref)
(push) ; 1
(declare-const $t@42@01 Int)
(assert (not (= c1@40@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forperm r: Ref [r.val] :: r == c2 ==> false)
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 $Snap.unit))
; [eval] (forperm r: Ref [r.val] :: r == c2 ==> false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | True | live]
; [else-branch: 37 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 37 | True]
; [eval] r == c2 ==> false
; [eval] r == c2
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= c1@40@01 c2@41@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c1@40@01 c2@41@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | c1@40@01 == c2@41@01 | live]
; [else-branch: 38 | c1@40@01 != c2@41@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 38 | c1@40@01 == c2@41@01]
(assert (= c1@40@01 c2@41@01))
(pop) ; 6
(push) ; 6
; [else-branch: 38 | c1@40@01 != c2@41@01]
(assert (not (= c1@40@01 c2@41@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= c1@40@01 c2@41@01)) (= c1@40@01 c2@41@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (not (= c1@40@01 c2@41@01)) (= c1@40@01 c2@41@01)))
(assert (=> (= c1@40@01 c2@41@01) false))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale c1 == c2
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] c1 == c2
(assert (= c1@40@01 c2@41@01))
; State saturation: after inhale
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const c1@45@01 $Ref)
(declare-const c1@46@01 $Ref)
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
; inhale (forperm r: Ref [r.val] :: false)
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 $Snap.unit))
; [eval] (forperm r: Ref [r.val] :: false)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(c1.val, write)
(declare-const $t@48@01 Int)
(assert (not (= c1@46@01 $Ref.null)))
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
