(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:08
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/predicates/different_field_types.vpr
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
(declare-fun fun ($Snap $Ref Bool) Bool)
(declare-fun fun%limited ($Snap $Ref Bool) Bool)
(declare-fun fun%stateless ($Ref Bool) Bool)
(declare-fun fun%precondition ($Snap $Ref Bool) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref Bool) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b@1@00 Bool)) (!
  (= (fun%limited s@$ x@0@00 b@1@00) (fun s@$ x@0@00 b@1@00))
  :pattern ((fun s@$ x@0@00 b@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b@1@00 Bool)) (!
  (fun%stateless x@0@00 b@1@00)
  :pattern ((fun%limited s@$ x@0@00 b@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b@1@00 Bool)) (!
  (=>
    (fun%precondition s@$ x@0@00 b@1@00)
    (=
      (fun s@$ x@0@00 b@1@00)
      (ite
        b@1@00
        (not (= ($SortWrappers.$SnapToInt s@$) 0))
        (not ($SortWrappers.$SnapToBool s@$)))))
  :pattern ((fun s@$ x@0@00 b@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b@1@00 Bool)) (!
  true
  :pattern ((fun s@$ x@0@00 b@1@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test1 ----------
(declare-const x@0@01 $Ref)
(declare-const b@1@01 Bool)
(declare-const x@2@01 $Ref)
(declare-const b@3@01 Bool)
(set-option :timeout 0)
(push) ; 1
(push) ; 2
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@3@01 | live]
; [else-branch: 0 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | b@3@01]
(assert b@3@01)
(declare-const $t@4@01 Int)
(assert (not (= x@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@3@01 | live]
; [else-branch: 1 | !(b@3@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | b@3@01]
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] x.f == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@5@01)) 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@3@01 | live]
; [else-branch: 2 | !(b@3@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | b@3@01]
; [exec]
; x.f := 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | b@3@01 | live]
; [else-branch: 3 | !(b@3@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | b@3@01]
; [eval] x.f == 0
(pop) ; 5
(pop) ; 4
; [eval] !b
; [then-branch: 4 | !(b@3@01) | dead]
; [else-branch: 4 | b@3@01 | live]
(push) ; 4
; [else-branch: 4 | b@3@01]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 0 | !(b@3@01)]
(assert (not b@3@01))
(declare-const $t@6@01 Bool)
(assert (not (= x@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | b@3@01 | dead]
; [else-branch: 5 | !(b@3@01) | live]
(push) ; 4
; [else-branch: 5 | !(b@3@01)]
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@7@01)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [then-branch: 6 | b@3@01 | dead]
; [else-branch: 6 | !(b@3@01) | live]
(push) ; 4
; [else-branch: 6 | !(b@3@01)]
(pop) ; 4
; [eval] !b
(push) ; 4
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(b@3@01) | live]
; [else-branch: 7 | b@3@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | !(b@3@01)]
; [exec]
; x.g := true
; [then-branch: 8 | b@3@01 | dead]
; [else-branch: 8 | !(b@3@01) | live]
(push) ; 5
; [else-branch: 8 | !(b@3@01)]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@8@01 $Ref)
(declare-const b@9@01 Bool)
(declare-const x@10@01 $Ref)
(declare-const b@11@01 Bool)
(push) ; 1
(declare-const $t@12@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@11@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | b@11@01 | live]
; [else-branch: 9 | !(b@11@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | b@11@01]
(assert b@11@01)
(declare-const $t@13@01 Int)
(assert (not (= x@10@01 $Ref.null)))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | !(b@11@01)]
(assert (not b@11@01))
(declare-const $t@14@01 Bool)
(assert (not (= x@10@01 $Ref.null)))
(pop) ; 3
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(P(x, b), write)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@11@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | b@11@01 | live]
; [else-branch: 10 | !(b@11@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | b@11@01]
(assert b@11@01)
(assert (not (= x@10@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@12@01 x@10@01 b@11@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b@11@01 | live]
; [else-branch: 11 | !(b@11@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | b@11@01]
; [exec]
; x.f := x.f + 1
; [eval] x.f + 1
(declare-const f@15@01 Int)
(assert (= f@15@01 (+ ($SortWrappers.$SnapToInt $t@12@01) 1)))
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | b@11@01 | live]
; [else-branch: 12 | !(b@11@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | b@11@01]
(pop) ; 5
(pop) ; 4
; [eval] !b
; [then-branch: 13 | !(b@11@01) | dead]
; [else-branch: 13 | b@11@01 | live]
(push) ; 4
; [else-branch: 13 | b@11@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 10 | !(b@11@01)]
(assert (not b@11@01))
(assert (not (= x@10@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@12@01 x@10@01 b@11@01))
; [then-branch: 14 | b@11@01 | dead]
; [else-branch: 14 | !(b@11@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 14 | !(b@11@01)]
(pop) ; 4
; [eval] !b
(push) ; 4
(set-option :timeout 10)
(assert (not b@11@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | !(b@11@01) | live]
; [else-branch: 15 | b@11@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | !(b@11@01)]
; [exec]
; x.g := !x.g
; [eval] !x.g
(declare-const g@16@01 Bool)
(assert (= g@16@01 (not ($SortWrappers.$SnapToBool $t@12@01))))
; [then-branch: 16 | b@11@01 | dead]
; [else-branch: 16 | !(b@11@01) | live]
(push) ; 5
; [else-branch: 16 | !(b@11@01)]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const x@17@01 $Ref)
(declare-const b@18@01 Bool)
(declare-const x@19@01 $Ref)
(declare-const b@20@01 Bool)
(push) ; 1
(declare-const $t@21@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@22@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; var c: Bool
(declare-const c@23@01 Bool)
; [exec]
; unfold acc(P(x, b), write)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@20@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@20@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | b@20@01 | live]
; [else-branch: 17 | !(b@20@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | b@20@01]
(assert b@20@01)
(assert (not (= x@19@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@21@01 x@19@01 b@20@01))
; [exec]
; c := fun(x, b)
; [eval] fun(x, b)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@20@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | b@20@01 | live]
; [else-branch: 18 | !(b@20@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | b@20@01]
(assert (fun%precondition $t@21@01 x@19@01 b@20@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@20@01 (fun%precondition $t@21@01 x@19@01 b@20@01)))
(declare-const c@24@01 Bool)
(assert (= c@24@01 (fun $t@21@01 x@19@01 b@20@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@20@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | b@20@01 | live]
; [else-branch: 19 | !(b@20@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | b@20@01]
; [exec]
; x.f := x.f + 1
; [eval] x.f + 1
(declare-const f@25@01 Int)
(assert (= f@25@01 (+ ($SortWrappers.$SnapToInt $t@21@01) 1)))
; [exec]
; c := fun(x, b)
; [eval] fun(x, b)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not b@20@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | b@20@01 | live]
; [else-branch: 20 | !(b@20@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 20 | b@20@01]
(assert (fun%precondition ($SortWrappers.IntTo$Snap f@25@01) x@19@01 b@20@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  b@20@01
  (fun%precondition ($SortWrappers.IntTo$Snap f@25@01) x@19@01 b@20@01)))
(declare-const c@26@01 Bool)
(assert (= c@26@01 (fun ($SortWrappers.IntTo$Snap f@25@01) x@19@01 b@20@01)))
; [exec]
; fold acc(P(x, b), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@20@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | b@20@01 | live]
; [else-branch: 21 | !(b@20@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | b@20@01]
(assert (P%trigger ($SortWrappers.IntTo$Snap f@25@01) x@19@01 b@20@01))
(pop) ; 5
(pop) ; 4
; [eval] !b
; [then-branch: 22 | !(b@20@01) | dead]
; [else-branch: 22 | b@20@01 | live]
(push) ; 4
; [else-branch: 22 | b@20@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 17 | !(b@20@01)]
(assert (not b@20@01))
(assert (not (= x@19@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@21@01 x@19@01 b@20@01))
; [exec]
; c := fun(x, b)
; [eval] fun(x, b)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | b@20@01 | dead]
; [else-branch: 23 | !(b@20@01) | live]
(push) ; 5
; [else-branch: 23 | !(b@20@01)]
(assert (fun%precondition $t@21@01 x@19@01 b@20@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> (not b@20@01) (fun%precondition $t@21@01 x@19@01 b@20@01)))
(declare-const c@27@01 Bool)
(assert (= c@27@01 (fun $t@21@01 x@19@01 b@20@01)))
; [then-branch: 24 | b@20@01 | dead]
; [else-branch: 24 | !(b@20@01) | live]
(push) ; 4
; [else-branch: 24 | !(b@20@01)]
(pop) ; 4
; [eval] !b
(push) ; 4
(set-option :timeout 10)
(assert (not b@20@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | !(b@20@01) | live]
; [else-branch: 25 | b@20@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | !(b@20@01)]
; [exec]
; x.g := !x.g
; [eval] !x.g
(declare-const g@28@01 Bool)
(assert (= g@28@01 (not ($SortWrappers.$SnapToBool $t@21@01))))
; [exec]
; c := fun(x, b)
; [eval] fun(x, b)
(push) ; 5
; [then-branch: 26 | b@20@01 | dead]
; [else-branch: 26 | !(b@20@01) | live]
(push) ; 6
; [else-branch: 26 | !(b@20@01)]
(assert (fun%precondition ($SortWrappers.BoolTo$Snap g@28@01) x@19@01 b@20@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not b@20@01)
  (fun%precondition ($SortWrappers.BoolTo$Snap g@28@01) x@19@01 b@20@01)))
(declare-const c@29@01 Bool)
(assert (= c@29@01 (fun ($SortWrappers.BoolTo$Snap g@28@01) x@19@01 b@20@01)))
; [exec]
; fold acc(P(x, b), write)
; [then-branch: 27 | b@20@01 | dead]
; [else-branch: 27 | !(b@20@01) | live]
(push) ; 5
; [else-branch: 27 | !(b@20@01)]
(assert (P%trigger ($SortWrappers.BoolTo$Snap g@28@01) x@19@01 b@20@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
