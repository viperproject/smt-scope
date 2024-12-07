(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:26
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permission_introspection/forpermPredicatesAdvanced.vpr
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
(declare-fun fun ($Snap $Ref) $Ref)
(declare-fun fun%limited ($Snap $Ref) $Ref)
(declare-fun fun%stateless ($Ref) Bool)
(declare-fun fun%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p1%trigger ($Snap $Ref Int) Bool)
(declare-fun p2%trigger ($Snap $Ref $Ref) Bool)
(declare-fun p3%trigger ($Snap $Ref $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (fun%limited s@$ x@0@00) (fun s@$ x@0@00))
  :pattern ((fun s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (fun%stateless x@0@00)
  :pattern ((fun%limited s@$ x@0@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m1 ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const y@3@01 $Ref)
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
; inhale acc(p1(x, 0), write)
(declare-const $t@4@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p1(y, 10), write)
(declare-const $t@5@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref, i: Int [p1(a, i)] :: i >= 0)
; [eval] (forperm a: Ref, i: Int [p1(a, i)] :: i >= 0)
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
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | True]
; [eval] i >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | True]
; [eval] i >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const x@6@01 $Ref)
(declare-const y@7@01 $Ref)
(declare-const z@8@01 $Ref)
(declare-const x@9@01 $Ref)
(declare-const y@10@01 $Ref)
(declare-const z@11@01 $Ref)
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
; inhale acc(p2(x, y), write)
(declare-const $t@12@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p2(z, y), write)
(declare-const $t@13@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@9@01 z@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != z
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] x != z
(assert (not (= x@9@01 z@11@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert !(forperm a: Ref [p2(a, y)] :: a == z)
; [eval] !(forperm a: Ref [p2(a, y)] :: a == z)
; [eval] (forperm a: Ref [p2(a, y)] :: a == z)
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
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | True]
; [eval] a == z
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | True]
; [eval] a == z
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [exec]
; unfold acc(p2(x, y), write)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (not (= x@9@01 $Ref.null)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@9@01 y@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@10@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@12@01)) $Snap.unit))
; [eval] x.f > y.f
(assert (>
  ($SortWrappers.$SnapToInt ($Snap.first $t@12@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01)))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger $t@12@01 x@9@01 y@10@01))
; [exec]
; assert (forperm a: Ref [p2(a, y)] :: a == z)
; [eval] (forperm a: Ref [p2(a, y)] :: a == z)
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
; [then-branch: 4 | True | live]
; [else-branch: 4 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | True]
; [eval] a == z
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const x@15@01 $Ref)
(declare-const y@16@01 $Ref)
(declare-const z@17@01 $Ref)
(declare-const x@18@01 $Ref)
(declare-const y@19@01 $Ref)
(declare-const z@20@01 $Ref)
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
; inhale acc(p3(x, y), write)
(declare-const $t@21@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p3(z, z), write)
(declare-const $t@22@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and (= x@18@01 z@20@01) (= y@19@01 z@20@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != y
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@18@01 y@19@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [p3(a, a)] :: a == z)
; [eval] (forperm a: Ref [p3(a, a)] :: a == z)
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
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | True]
; [eval] a == z
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@19@01 x@18@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | y@19@01 == x@18@01 | dead]
; [else-branch: 6 | y@19@01 != x@18@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 6 | y@19@01 != x@18@01]
(assert (not (= y@19@01 x@18@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (= y@19@01 x@18@01)))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const x@24@01 $Ref)
(declare-const y@25@01 $Ref)
(declare-const z@26@01 $Ref)
(declare-const x@27@01 $Ref)
(declare-const y@28@01 $Ref)
(declare-const z@29@01 $Ref)
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
; inhale acc(p3(x, y), write)
(declare-const $t@30@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p3(y, z), write)
(declare-const $t@31@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and (= x@27@01 y@28@01) (= y@28@01 z@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale z != y
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; [eval] z != y
(assert (not (= z@29@01 y@28@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [p3(a, y)] :: a == x)
; [eval] (forperm a: Ref [p3(a, y)] :: a == x)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@28@01 z@29@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | y@28@01 == z@29@01 | dead]
; [else-branch: 7 | y@28@01 != z@29@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 7 | y@28@01 != z@29@01]
(assert (not (= y@28@01 z@29@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (= y@28@01 z@29@01)))
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
; [eval] a == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const x@33@01 $Ref)
(declare-const y@34@01 $Ref)
(declare-const x@35@01 $Ref)
(declare-const y@36@01 $Ref)
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
; inhale acc(p1(x, 10), write)
(declare-const $t@37@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p1(y, 15), write)
(declare-const $t@38@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] (forperm a: Ref, i: Int [p1(a, i)] :: a == x)
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
; [then-branch: 9 | True | live]
; [else-branch: 9 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | True]
; [eval] a == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | True]
; [eval] a == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= y@36@01 x@35@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@36@01 x@35@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | y@36@01 == x@35@01 | live]
; [else-branch: 11 | y@36@01 != x@35@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | y@36@01 == x@35@01]
(assert (= y@36@01 x@35@01))
; [exec]
; assert x == y
; [eval] x == y
(push) ; 4
(assert (not (= x@35@01 y@36@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= x@35@01 y@36@01))
(pop) ; 3
(push) ; 3
; [else-branch: 11 | y@36@01 != x@35@01]
(assert (not (= y@36@01 x@35@01)))
(pop) ; 3
; [eval] !(forperm a: Ref, i: Int [p1(a, i)] :: a == x)
; [eval] (forperm a: Ref, i: Int [p1(a, i)] :: a == x)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | True | live]
; [else-branch: 12 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | True]
; [eval] a == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
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
; [eval] a == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@36@01 x@35@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= y@36@01 x@35@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | y@36@01 != x@35@01 | live]
; [else-branch: 14 | y@36@01 == x@35@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | y@36@01 != x@35@01]
(assert (not (= y@36@01 x@35@01)))
; [exec]
; assert x != y
; [eval] x != y
(push) ; 4
(assert (not (not (= x@35@01 y@36@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= x@35@01 y@36@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 14 | y@36@01 == x@35@01]
(assert (= y@36@01 x@35@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m6 ----------
(declare-const x@39@01 $Ref)
(declare-const y@40@01 $Ref)
(declare-const x@41@01 $Ref)
(declare-const y@42@01 $Ref)
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
; inhale acc(p2(x, y), write)
(declare-const $t@43@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p3(y, x), write)
(declare-const $t@44@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref, b: Ref [p2(a, b)] :: x != y ==> a != y)
; [eval] (forperm a: Ref, b: Ref [p2(a, b)] :: x != y ==> a != y)
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
; [eval] x != y ==> a != y
; [eval] x != y
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= x@41@01 y@42@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= x@41@01 y@42@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | x@41@01 != y@42@01 | live]
; [else-branch: 16 | x@41@01 == y@42@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | x@41@01 != y@42@01]
(assert (not (= x@41@01 y@42@01)))
; [eval] a != y
(pop) ; 6
(push) ; 6
; [else-branch: 16 | x@41@01 == y@42@01]
(assert (= x@41@01 y@42@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (= x@41@01 y@42@01) (not (= x@41@01 y@42@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (= x@41@01 y@42@01) (not (= x@41@01 y@42@01))))
(pop) ; 2
(pop) ; 1
; ---------- m7 ----------
(declare-const x@45@01 $Ref)
(declare-const y@46@01 $Ref)
(declare-const x@47@01 $Ref)
(declare-const y@48@01 $Ref)
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
; inhale acc(p2(x, y), write)
(declare-const $t@49@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p2(fun(x), fun(y)), write)
; [eval] fun(x)
(set-option :timeout 0)
(push) ; 3
(assert (fun%precondition $Snap.unit x@47@01))
(pop) ; 3
; Joined path conditions
(assert (fun%precondition $Snap.unit x@47@01))
; [eval] fun(y)
(push) ; 3
(assert (fun%precondition $Snap.unit y@48@01))
(pop) ; 3
; Joined path conditions
(assert (fun%precondition $Snap.unit y@48@01))
(declare-const $t@50@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (and (= x@47@01 (fun $Snap.unit x@47@01)) (= y@48@01 (fun $Snap.unit y@48@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun(x) != x
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 $Snap.unit))
; [eval] fun(x) != x
; [eval] fun(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (not (= (fun $Snap.unit x@47@01) x@47@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [p2(fun(x), a)] :: a == fun(y))
; [eval] (forperm a: Ref [p2(fun(x), a)] :: a == fun(y))
; [eval] fun(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
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
; [eval] a == fun(y)
; [eval] fun(y)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [eval] fun(x)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 18 | fun(_, x@47@01) == x@47@01 | dead]
; [else-branch: 18 | fun(_, x@47@01) != x@47@01 | live]
(push) ; 4
; [else-branch: 18 | fun(_, x@47@01) != x@47@01]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- m8 ----------
(declare-const x@52@01 $Ref)
(declare-const y@53@01 $Ref)
(declare-const x@54@01 $Ref)
(declare-const y@55@01 $Ref)
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
; inhale acc(p1(x, 10), write)
(declare-const $t@56@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p1(y, 0), write)
(declare-const $t@57@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [p1(a, 10)] :: a == x)
; [eval] (forperm a: Ref [p1(a, 10)] :: a == x)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 19 | False | dead]
; [else-branch: 19 | True | live]
(push) ; 4
; [else-branch: 19 | True]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | True]
; [eval] a == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- m9 ----------
(declare-const x@58@01 $Ref)
(declare-const y@59@01 $Ref)
(declare-const z@60@01 $Ref)
(declare-const b@61@01 Bool)
(declare-const x@62@01 $Ref)
(declare-const y@63@01 $Ref)
(declare-const z@64@01 $Ref)
(declare-const b@65@01 Bool)
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
; inhale acc(p3((b ? x : y), z), write)
; [eval] (b ? x : y)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@65@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@65@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | b@65@01 | live]
; [else-branch: 21 | !(b@65@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | b@65@01]
(assert b@65@01)
(pop) ; 4
(push) ; 4
; [else-branch: 21 | !(b@65@01)]
(assert (not b@65@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b@65@01) b@65@01))
(declare-const $t@66@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(p3(z, x), write)
(declare-const $t@67@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and (= (ite b@65@01 x@62@01 y@63@01) z@64@01) (= z@64@01 x@62@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale z != (b ? x : y)
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 $Snap.unit))
; [eval] z != (b ? x : y)
; [eval] (b ? x : y)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@65@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@65@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | b@65@01 | live]
; [else-branch: 22 | !(b@65@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | b@65@01]
(assert b@65@01)
(pop) ; 4
(push) ; 4
; [else-branch: 22 | !(b@65@01)]
(assert (not b@65@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (not (= z@64@01 (ite b@65@01 x@62@01 y@63@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [p3((b ? x : y), a)] :: a == z)
; [eval] (forperm a: Ref [p3((b ? x : y), a)] :: a == z)
; [eval] (b ? x : y)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@65@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@65@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | b@65@01 | live]
; [else-branch: 23 | !(b@65@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | b@65@01]
(assert b@65@01)
(pop) ; 4
(push) ; 4
; [else-branch: 23 | !(b@65@01)]
(assert (not b@65@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (ite b@65@01 x@62@01 y@63@01) z@64@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | (b@65@01 ? x@62@01 : y@63@01) == z@64@01 | dead]
; [else-branch: 24 | (b@65@01 ? x@62@01 : y@63@01) != z@64@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 24 | (b@65@01 ? x@62@01 : y@63@01) != z@64@01]
(assert (not (= (ite b@65@01 x@62@01 y@63@01) z@64@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (= (ite b@65@01 x@62@01 y@63@01) z@64@01)))
; [eval] (b ? x : y)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@65@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@65@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | b@65@01 | live]
; [else-branch: 25 | !(b@65@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | b@65@01]
(assert b@65@01)
(pop) ; 4
(push) ; 4
; [else-branch: 25 | !(b@65@01)]
(assert (not b@65@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 26 | True]
; [eval] a == z
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
