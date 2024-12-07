(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:31:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/transformations/Macros/Hygienic/forallRef.vpr
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
; var a: Int
(declare-const a@0@01 Int)
; [exec]
; var b: Int
(declare-const b@1@01 Int)
; [exec]
; a := 6
; [exec]
; b := 4
; [exec]
; assert (forall i: Int ::0 <= i && i < b ==> i < a)
; [eval] (forall i: Int ::0 <= i && i < b ==> i < a)
(declare-const i@2@01 Int)
(push) ; 3
; [eval] 0 <= i && i < b ==> i < a
; [eval] 0 <= i && i < b
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | !(0 <= i@2@01) | live]
; [else-branch: 0 | 0 <= i@2@01 | live]
(push) ; 5
; [then-branch: 0 | !(0 <= i@2@01)]
(assert (not (<= 0 i@2@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | 0 <= i@2@01]
(assert (<= 0 i@2@01))
; [eval] i < b
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@2@01) (not (<= 0 i@2@01))))
(push) ; 4
; [then-branch: 1 | 0 <= i@2@01 && i@2@01 < 4 | live]
; [else-branch: 1 | !(0 <= i@2@01 && i@2@01 < 4) | live]
(push) ; 5
; [then-branch: 1 | 0 <= i@2@01 && i@2@01 < 4]
(assert (and (<= 0 i@2@01) (< i@2@01 4)))
; [eval] i < a
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(0 <= i@2@01 && i@2@01 < 4)]
(assert (not (and (<= 0 i@2@01) (< i@2@01 4))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (and (<= 0 i@2@01) (< i@2@01 4))) (and (<= 0 i@2@01) (< i@2@01 4))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((i@2@01 Int)) (!
  (=> (and (<= 0 i@2@01) (< i@2@01 4)) (< i@2@01 6))
  
  :qid |prog./silicon/silver/src/test/resources/transformations/Macros/Hygienic/forallRef.vpr@10@12@10@54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@2@01 Int)) (!
  (=> (and (<= 0 i@2@01) (< i@2@01 4)) (< i@2@01 6))
  
  :qid |prog./silicon/silver/src/test/resources/transformations/Macros/Hygienic/forallRef.vpr@10@12@10@54|)))
; [exec]
; assert (forall i$0: Int ::0 <= i$0 && i$0 < b ==> i$0 < a)
; [eval] (forall i$0: Int ::0 <= i$0 && i$0 < b ==> i$0 < a)
(declare-const i$0@3@01 Int)
(push) ; 3
; [eval] 0 <= i$0 && i$0 < b ==> i$0 < a
; [eval] 0 <= i$0 && i$0 < b
; [eval] 0 <= i$0
(push) ; 4
; [then-branch: 2 | !(0 <= i$0@3@01) | live]
; [else-branch: 2 | 0 <= i$0@3@01 | live]
(push) ; 5
; [then-branch: 2 | !(0 <= i$0@3@01)]
(assert (not (<= 0 i$0@3@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | 0 <= i$0@3@01]
(assert (<= 0 i$0@3@01))
; [eval] i$0 < b
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$0@3@01) (not (<= 0 i$0@3@01))))
(push) ; 4
; [then-branch: 3 | 0 <= i$0@3@01 && i$0@3@01 < 4 | live]
; [else-branch: 3 | !(0 <= i$0@3@01 && i$0@3@01 < 4) | live]
(push) ; 5
; [then-branch: 3 | 0 <= i$0@3@01 && i$0@3@01 < 4]
(assert (and (<= 0 i$0@3@01) (< i$0@3@01 4)))
; [eval] i$0 < a
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(0 <= i$0@3@01 && i$0@3@01 < 4)]
(assert (not (and (<= 0 i$0@3@01) (< i$0@3@01 4))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i$0@3@01) (< i$0@3@01 4)))
  (and (<= 0 i$0@3@01) (< i$0@3@01 4))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((i$0@3@01 Int)) (!
  (=> (and (<= 0 i$0@3@01) (< i$0@3@01 4)) (< i$0@3@01 6))
  
  :qid |prog./silicon/silver/src/test/resources/transformations/Macros/Hygienic/forallRef.vpr@11@12@11@62|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i$0@3@01 Int)) (!
  (=> (and (<= 0 i$0@3@01) (< i$0@3@01 4)) (< i$0@3@01 6))
  
  :qid |prog./silicon/silver/src/test/resources/transformations/Macros/Hygienic/forallRef.vpr@11@12@11@62|)))
(pop) ; 2
(pop) ; 1
