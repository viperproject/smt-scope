(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permissions/framing_none_perms.vpr
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
(declare-fun fun01 ($Snap $Ref $Ref Bool) Int)
(declare-fun fun01%limited ($Snap $Ref $Ref Bool) Int)
(declare-fun fun01%stateless ($Ref $Ref Bool) Bool)
(declare-fun fun01%precondition ($Snap $Ref $Ref Bool) Bool)
(declare-fun fun02 ($Snap $Ref $Ref Bool) Int)
(declare-fun fun02%limited ($Snap $Ref $Ref Bool) Int)
(declare-fun fun02%stateless ($Ref $Ref Bool) Bool)
(declare-fun fun02%precondition ($Snap $Ref $Ref Bool) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref) (b@2@00 Bool)) (!
  (= (fun01%limited s@$ x@0@00 y@1@00 b@2@00) (fun01 s@$ x@0@00 y@1@00 b@2@00))
  :pattern ((fun01 s@$ x@0@00 y@1@00 b@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref) (b@2@00 Bool)) (!
  (fun01%stateless x@0@00 y@1@00 b@2@00)
  :pattern ((fun01%limited s@$ x@0@00 y@1@00 b@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref) (y@5@00 $Ref) (b@6@00 Bool)) (!
  (= (fun02%limited s@$ x@4@00 y@5@00 b@6@00) (fun02 s@$ x@4@00 y@5@00 b@6@00))
  :pattern ((fun02 s@$ x@4@00 y@5@00 b@6@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref) (y@5@00 $Ref) (b@6@00 Bool)) (!
  (fun02%stateless x@4@00 y@5@00 b@6@00)
  :pattern ((fun02%limited s@$ x@4@00 y@5@00 b@6@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const y@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= x@2@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@3@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var vx: Int
(declare-const vx@5@01 Int)
; [exec]
; var vy: Int
(declare-const vy@6@01 Int)
; [exec]
; vx := fun01(x, y, true)
; [eval] fun01(x, y, true)
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
(assert (fun01%precondition ($Snap.first $t@4@01) x@2@01 y@3@01 true))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($Snap.first $t@4@01) x@2@01 y@3@01 true))
(declare-const vx@7@01 Int)
(assert (= vx@7@01 (fun01 ($Snap.first $t@4@01) x@2@01 y@3@01 true)))
; [exec]
; vy := fun01(x, y, false)
; [eval] fun01(x, y, false)
(push) ; 3
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 4
; [else-branch: 1 | True]
(assert (fun01%precondition ($Snap.second $t@4@01) x@2@01 y@3@01 false))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($Snap.second $t@4@01) x@2@01 y@3@01 false))
(declare-const vy@8@01 Int)
(assert (= vy@8@01 (fun01 ($Snap.second $t@4@01) x@2@01 y@3@01 false)))
; [exec]
; y.f := 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert vx == fun01(x, y, true)
; [eval] vx == fun01(x, y, true)
; [eval] fun01(x, y, true)
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
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [exec]
; assert vy == fun01(x, y, false)
; [eval] vy == fun01(x, y, false)
; [eval] fun01(x, y, false)
(push) ; 3
; [then-branch: 3 | False | dead]
; [else-branch: 3 | True | live]
(push) ; 4
; [else-branch: 3 | True]
(assert (fun01%precondition ($SortWrappers.IntTo$Snap 0) x@2@01 y@3@01 false))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($SortWrappers.IntTo$Snap 0) x@2@01 y@3@01 false))
(push) ; 3
(assert (not (= vy@8@01 (fun01 ($SortWrappers.IntTo$Snap 0) x@2@01 y@3@01 false))))
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
(assert (not (= y@3@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@2@01 y@3@01)) (not (= y@3@01 x@2@01))))
; [eval] vy == fun01(x, y, false)
; [eval] fun01(x, y, false)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | False | dead]
; [else-branch: 4 | True | live]
(push) ; 4
; [else-branch: 4 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@3@01 x@2@01)) (not (= x@2@01 y@3@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and (not (= y@3@01 x@2@01)) (not (= x@2@01 y@3@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (= vy@8@01 (fun01 ($SortWrappers.IntTo$Snap 0) x@2@01 y@3@01 false))))
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
(assert (not (= y@3@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@2@01 y@3@01)) (not (= y@3@01 x@2@01))))
; [eval] vy == fun01(x, y, false)
; [eval] fun01(x, y, false)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | False | dead]
; [else-branch: 5 | True | live]
(push) ; 4
; [else-branch: 5 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= y@3@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@2@01 y@3@01)) (not (= y@3@01 x@2@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and (not (= x@2@01 y@3@01)) (not (= y@3@01 x@2@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (= vy@8@01 (fun01 ($SortWrappers.IntTo$Snap 0) x@2@01 y@3@01 false))))
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
(assert (not (= y@3@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@2@01 y@3@01)) (not (= y@3@01 x@2@01))))
; [eval] vy == fun01(x, y, false)
; [eval] fun01(x, y, false)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | False | dead]
; [else-branch: 6 | True | live]
(push) ; 4
; [else-branch: 6 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@3@01 x@2@01)) (not (= x@2@01 y@3@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and (not (= y@3@01 x@2@01)) (not (= x@2@01 y@3@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (= vy@8@01 (fun01 ($SortWrappers.IntTo$Snap 0) x@2@01 y@3@01 false))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@9@01 $Ref)
(declare-const y@10@01 $Ref)
(declare-const x@11@01 $Ref)
(declare-const y@12@01 $Ref)
(push) ; 1
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (not (= x@11@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@11@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@12@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var vx: Int
(declare-const vx@14@01 Int)
; [exec]
; var vy: Int
(declare-const vy@15@01 Int)
; [exec]
; vx := fun02(x, y, true)
; [eval] fun02(x, y, true)
(push) ; 3
; [eval] (b ? write : none)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | True | live]
; [else-branch: 7 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] (!b ? write : none)
; [eval] !b
(push) ; 4
; [then-branch: 8 | False | dead]
; [else-branch: 8 | True | live]
(push) ; 5
; [else-branch: 8 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (fun02%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) x@11@01 y@12@01 true))
(pop) ; 3
; Joined path conditions
(assert (fun02%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) x@11@01 y@12@01 true))
(declare-const vx@16@01 Int)
(assert (=
  vx@16@01
  (fun02 ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) x@11@01 y@12@01 true)))
; [exec]
; vy := fun02(x, y, false)
; [eval] fun02(x, y, false)
(set-option :timeout 0)
(push) ; 3
; [eval] (b ? write : none)
(push) ; 4
; [then-branch: 9 | False | dead]
; [else-branch: 9 | True | live]
(push) ; 5
; [else-branch: 9 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (!b ? write : none)
; [eval] !b
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
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (fun02%precondition ($Snap.combine $Snap.unit ($Snap.second $t@13@01)) x@11@01 y@12@01 false))
(pop) ; 3
; Joined path conditions
(assert (fun02%precondition ($Snap.combine $Snap.unit ($Snap.second $t@13@01)) x@11@01 y@12@01 false))
(declare-const vy@17@01 Int)
(assert (=
  vy@17@01
  (fun02 ($Snap.combine $Snap.unit ($Snap.second $t@13@01)) x@11@01 y@12@01 false)))
; [exec]
; y.f := 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@11@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert vx == fun02(x, y, true)
; [eval] vx == fun02(x, y, true)
; [eval] fun02(x, y, true)
(set-option :timeout 0)
(push) ; 3
; [eval] (b ? write : none)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | True | live]
; [else-branch: 11 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] (!b ? write : none)
; [eval] !b
(push) ; 4
; [then-branch: 12 | False | dead]
; [else-branch: 12 | True | live]
(push) ; 5
; [else-branch: 12 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
; [exec]
; assert vy == fun02(x, y, false)
; [eval] vy == fun02(x, y, false)
; [eval] fun02(x, y, false)
(set-option :timeout 0)
(push) ; 3
; [eval] (b ? write : none)
(push) ; 4
; [then-branch: 13 | False | dead]
; [else-branch: 13 | True | live]
(push) ; 5
; [else-branch: 13 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (!b ? write : none)
; [eval] !b
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
; [then-branch: 14 | True | live]
; [else-branch: 14 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (fun02%precondition ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 0)) x@11@01 y@12@01 false))
(pop) ; 3
; Joined path conditions
(assert (fun02%precondition ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 0)) x@11@01 y@12@01 false))
(push) ; 3
(assert (not (=
  vy@17@01
  (fun02 ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 0)) x@11@01 y@12@01 false))))
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
(assert (not (= y@12@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@11@01 y@12@01)) (not (= y@12@01 x@11@01))))
; [eval] vy == fun02(x, y, false)
; [eval] fun02(x, y, false)
(set-option :timeout 0)
(push) ; 3
; [eval] (b ? write : none)
(push) ; 4
; [then-branch: 15 | False | dead]
; [else-branch: 15 | True | live]
(push) ; 5
; [else-branch: 15 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x@11@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (!b ? write : none)
; [eval] !b
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
; [then-branch: 16 | True | live]
; [else-branch: 16 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x@11@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(pop) ; 3
; Joined path conditions
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  vy@17@01
  (fun02 ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 0)) x@11@01 y@12@01 false))))
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
(assert (not (= y@12@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@11@01 y@12@01)) (not (= y@12@01 x@11@01))))
; [eval] vy == fun02(x, y, false)
; [eval] fun02(x, y, false)
(set-option :timeout 0)
(push) ; 3
; [eval] (b ? write : none)
(push) ; 4
; [then-branch: 17 | False | dead]
; [else-branch: 17 | True | live]
(push) ; 5
; [else-branch: 17 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= y@12@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@11@01 y@12@01)) (not (= y@12@01 x@11@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not (= x@11@01 y@12@01)) (not (= y@12@01 x@11@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (!b ? write : none)
; [eval] !b
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
; [then-branch: 18 | True | live]
; [else-branch: 18 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= y@12@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,07s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@11@01 y@12@01)) (not (= y@12@01 x@11@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not (= x@11@01 y@12@01)) (not (= y@12@01 x@11@01))))
(pop) ; 3
; Joined path conditions
(assert (and (not (= x@11@01 y@12@01)) (not (= y@12@01 x@11@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  vy@17@01
  (fun02 ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 0)) x@11@01 y@12@01 false))))
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
(assert (not (= y@12@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@11@01 y@12@01)) (not (= y@12@01 x@11@01))))
; [eval] vy == fun02(x, y, false)
; [eval] fun02(x, y, false)
(set-option :timeout 0)
(push) ; 3
; [eval] (b ? write : none)
(push) ; 4
; [then-branch: 19 | False | dead]
; [else-branch: 19 | True | live]
(push) ; 5
; [else-branch: 19 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x@11@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (!b ? write : none)
; [eval] !b
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
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 20 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x@11@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(pop) ; 3
; Joined path conditions
(assert (and (not (= y@12@01 x@11@01)) (not (= x@11@01 y@12@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  vy@17@01
  (fun02 ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 0)) x@11@01 y@12@01 false))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
