(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:31:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/transformations/Macros/Hygienic/loopConstruction.vpr
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
; ---------- main ----------
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
; var value: Int
(declare-const value@0@01 Int)
; [exec]
; var oldX: Int
(declare-const oldX@1@01 Int)
; [exec]
; var ctr: Int
(declare-const ctr@2@01 Int)
; [exec]
; var oldX$0: Int
(declare-const oldX$0@3@01 Int)
; [exec]
; var ctr$0: Int
(declare-const ctr$0@4@01 Int)
; [exec]
; value := 0
; [exec]
; oldX := value
; [exec]
; ctr := 0
(declare-const value@5@01 Int)
(declare-const ctr@6@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] ctr < 5
(assert (< ctr@6@01 5))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] value == oldX + ctr
; [eval] oldX + ctr
(assert (= value@5@01 ctr@6@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] ctr < 5
; [eval] value == oldX + ctr
; [eval] oldX + ctr
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
(assert (< ctr@6@01 5))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
(assert (= value@5@01 ctr@6@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label loop
; [exec]
; value := value + 1
; [eval] value + 1
(declare-const value@8@01 Int)
(assert (= value@8@01 (+ value@5@01 1)))
; [exec]
; ctr := ctr + 1
; [eval] ctr + 1
(declare-const ctr@9@01 Int)
(assert (= ctr@9@01 (+ ctr@6@01 1)))
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] ctr < 5
(pop) ; 5
(push) ; 5
; [eval] !(ctr < 5)
; [eval] ctr < 5
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] ctr < 5
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< ctr@9@01 5))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< ctr@9@01 5)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | ctr@9@01 < 5 | live]
; [else-branch: 0 | !(ctr@9@01 < 5) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | ctr@9@01 < 5]
(assert (< ctr@9@01 5))
; Loop head block: Re-establish invariant
; [eval] ctr < 5
; [eval] value == oldX + ctr
; [eval] oldX + ctr
(push) ; 6
(assert (not (= value@8@01 ctr@9@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= value@8@01 ctr@9@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(ctr@9@01 < 5)]
(assert (not (< ctr@9@01 5)))
(pop) ; 5
; [eval] !(ctr < 5)
; [eval] ctr < 5
(push) ; 5
(set-option :timeout 10)
(assert (not (< ctr@9@01 5)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< ctr@9@01 5))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(ctr@9@01 < 5) | live]
; [else-branch: 1 | ctr@9@01 < 5 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(ctr@9@01 < 5)]
(assert (not (< ctr@9@01 5)))
; [exec]
; assert ctr == 5
; [eval] ctr == 5
(push) ; 6
(assert (not (= ctr@9@01 5)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= ctr@9@01 5))
; [exec]
; assert oldX + 5 == value
; [eval] oldX + 5 == value
; [eval] oldX + 5
(push) ; 6
(assert (not (= 5 value@8@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= 5 value@8@01))
; [exec]
; oldX$0 := value
; [exec]
; ctr$0 := 0
(declare-const value@10@01 Int)
(declare-const ctr$0@11@01 Int)
(push) ; 6
; Loop head block: Check well-definedness of invariant
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.first $t@12@01) $Snap.unit))
; [eval] ctr$0 < 5
(assert (< ctr$0@11@01 5))
(assert (= ($Snap.second $t@12@01) $Snap.unit))
; [eval] value == oldX$0 + ctr$0
; [eval] oldX$0 + ctr$0
(assert (= value@10@01 (+ value@8@01 ctr$0@11@01)))
(pop) ; 6
(push) ; 6
; Loop head block: Establish invariant
; [eval] ctr$0 < 5
; [eval] value == oldX$0 + ctr$0
; [eval] oldX$0 + ctr$0
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.first $t@12@01) $Snap.unit))
(assert (< ctr$0@11@01 5))
(assert (= ($Snap.second $t@12@01) $Snap.unit))
(assert (= value@10@01 (+ value@8@01 ctr$0@11@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label loop$0
; [exec]
; value := value + 1
; [eval] value + 1
(declare-const value@13@01 Int)
(assert (= value@13@01 (+ value@10@01 1)))
; [exec]
; ctr$0 := ctr$0 + 1
; [eval] ctr$0 + 1
(declare-const ctr$0@14@01 Int)
(assert (= ctr$0@14@01 (+ ctr$0@11@01 1)))
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] ctr$0 < 5
(pop) ; 8
(push) ; 8
; [eval] !(ctr$0 < 5)
; [eval] ctr$0 < 5
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] ctr$0 < 5
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< ctr$0@14@01 5))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< ctr$0@14@01 5)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | ctr$0@14@01 < 5 | live]
; [else-branch: 2 | !(ctr$0@14@01 < 5) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 2 | ctr$0@14@01 < 5]
(assert (< ctr$0@14@01 5))
; Loop head block: Re-establish invariant
; [eval] ctr$0 < 5
; [eval] value == oldX$0 + ctr$0
; [eval] oldX$0 + ctr$0
(push) ; 9
(assert (not (= value@13@01 (+ value@8@01 ctr$0@14@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (= value@13@01 (+ value@8@01 ctr$0@14@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | !(ctr$0@14@01 < 5)]
(assert (not (< ctr$0@14@01 5)))
(pop) ; 8
; [eval] !(ctr$0 < 5)
; [eval] ctr$0 < 5
(push) ; 8
(set-option :timeout 10)
(assert (not (< ctr$0@14@01 5)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< ctr$0@14@01 5))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(ctr$0@14@01 < 5) | live]
; [else-branch: 3 | ctr$0@14@01 < 5 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 3 | !(ctr$0@14@01 < 5)]
(assert (not (< ctr$0@14@01 5)))
; [exec]
; assert ctr$0 == 5
; [eval] ctr$0 == 5
(push) ; 9
(assert (not (= ctr$0@14@01 5)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (= ctr$0@14@01 5))
; [exec]
; assert oldX$0 + 5 == value
; [eval] oldX$0 + 5 == value
; [eval] oldX$0 + 5
(push) ; 9
(assert (not (= (+ value@8@01 5) value@13@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (= (+ value@8@01 5) value@13@01))
; [exec]
; assert value == 10
; [eval] value == 10
(push) ; 9
(assert (not (= value@13@01 10)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (= value@13@01 10))
(pop) ; 8
(push) ; 8
; [else-branch: 3 | ctr$0@14@01 < 5]
(assert (< ctr$0@14@01 5))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 1 | ctr@9@01 < 5]
(assert (< ctr@9@01 5))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
