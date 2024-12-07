(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:28
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0047.vpr
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
(declare-const x@0@01 Int)
(declare-const y@1@01 Int)
(declare-const z@2@01 Int)
(declare-const x@3@01 Int)
(declare-const y@4@01 Int)
(declare-const z@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] z == x || z == y
; [eval] z == x
(push) ; 2
; [then-branch: 0 | z@5@01 == x@3@01 | live]
; [else-branch: 0 | z@5@01 != x@3@01 | live]
(push) ; 3
; [then-branch: 0 | z@5@01 == x@3@01]
(assert (= z@5@01 x@3@01))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | z@5@01 != x@3@01]
(assert (not (= z@5@01 x@3@01)))
; [eval] z == y
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@5@01 x@3@01)) (= z@5@01 x@3@01)))
(assert (or (= z@5@01 x@3@01) (= z@5@01 y@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert z == y
; [eval] z == y
(push) ; 3
(assert (not (= z@5@01 y@4@01)))
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
; [eval] z == y
(set-option :timeout 0)
(push) ; 3
(assert (not (= z@5@01 y@4@01)))
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
; [eval] z == y
(set-option :timeout 0)
(push) ; 3
(assert (not (= z@5@01 y@4@01)))
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
; [eval] z == y
(set-option :timeout 0)
(push) ; 3
(assert (not (= z@5@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@7@01 Int)
(declare-const y@8@01 Int)
(declare-const z@9@01 Int)
(declare-const x@10@01 Int)
(declare-const y@11@01 Int)
(declare-const z@12@01 Int)
(push) ; 1
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] z == x || z == y
; [eval] z == x
(push) ; 2
; [then-branch: 1 | z@12@01 == x@10@01 | live]
; [else-branch: 1 | z@12@01 != x@10@01 | live]
(push) ; 3
; [then-branch: 1 | z@12@01 == x@10@01]
(assert (= z@12@01 x@10@01))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | z@12@01 != x@10@01]
(assert (not (= z@12@01 x@10@01)))
; [eval] z == y
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@12@01 x@10@01)) (= z@12@01 x@10@01)))
(assert (or (= z@12@01 x@10@01) (= z@12@01 y@11@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert z == x
; [eval] z == x
(push) ; 3
(assert (not (= z@12@01 x@10@01)))
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
; [eval] z == x
(set-option :timeout 0)
(push) ; 3
(assert (not (= z@12@01 x@10@01)))
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
; [eval] z == x
(set-option :timeout 0)
(push) ; 3
(assert (not (= z@12@01 x@10@01)))
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
; [eval] z == x
(set-option :timeout 0)
(push) ; 3
(assert (not (= z@12@01 x@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@14@01 Int)
(declare-const y@15@01 Int)
(declare-const z@16@01 Int)
(declare-const x@17@01 Int)
(declare-const y@18@01 Int)
(declare-const z@19@01 Int)
(push) ; 1
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] z == x || z == y
; [eval] z == x
(push) ; 2
; [then-branch: 2 | z@19@01 == x@17@01 | live]
; [else-branch: 2 | z@19@01 != x@17@01 | live]
(push) ; 3
; [then-branch: 2 | z@19@01 == x@17@01]
(assert (= z@19@01 x@17@01))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | z@19@01 != x@17@01]
(assert (not (= z@19@01 x@17@01)))
; [eval] z == y
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@19@01 x@17@01)) (= z@19@01 x@17@01)))
(assert (or (= z@19@01 x@17@01) (= z@19@01 y@18@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert z == y || z == x
; [eval] z == y || z == x
; [eval] z == y
(push) ; 3
; [then-branch: 3 | z@19@01 == y@18@01 | live]
; [else-branch: 3 | z@19@01 != y@18@01 | live]
(push) ; 4
; [then-branch: 3 | z@19@01 == y@18@01]
(assert (= z@19@01 y@18@01))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | z@19@01 != y@18@01]
(assert (not (= z@19@01 y@18@01)))
; [eval] z == x
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (= z@19@01 y@18@01)) (= z@19@01 y@18@01)))
(push) ; 3
(assert (not (or (= z@19@01 y@18@01) (= z@19@01 x@17@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or (= z@19@01 y@18@01) (= z@19@01 x@17@01)))
(pop) ; 2
(pop) ; 1
