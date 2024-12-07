(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:07
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/elsif.vpr
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
; ---------- t1 ----------
(declare-const a@0@01 Int)
(declare-const b@1@01 Int)
(declare-const a@2@01 Int)
(declare-const b@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] a > 0
(assert (> a@2@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] b == 2 || (b == 3 || (b == 4 || b == 5))
; [eval] b == 2
(push) ; 3
; [then-branch: 0 | b@3@01 == 2 | live]
; [else-branch: 0 | b@3@01 != 2 | live]
(push) ; 4
; [then-branch: 0 | b@3@01 == 2]
(assert (= b@3@01 2))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | b@3@01 != 2]
(assert (not (= b@3@01 2)))
; [eval] b == 3
(push) ; 5
; [then-branch: 1 | b@3@01 == 3 | live]
; [else-branch: 1 | b@3@01 != 3 | live]
(push) ; 6
; [then-branch: 1 | b@3@01 == 3]
(assert (= b@3@01 3))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | b@3@01 != 3]
(assert (not (= b@3@01 3)))
; [eval] b == 4
(push) ; 7
; [then-branch: 2 | b@3@01 == 4 | live]
; [else-branch: 2 | b@3@01 != 4 | live]
(push) ; 8
; [then-branch: 2 | b@3@01 == 4]
(assert (= b@3@01 4))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | b@3@01 != 4]
(assert (not (= b@3@01 4)))
; [eval] b == 5
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (not (= b@3@01 4)) (= b@3@01 4)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= b@3@01 3))
  (and (not (= b@3@01 3)) (or (not (= b@3@01 4)) (= b@3@01 4)))))
(assert (or (not (= b@3@01 3)) (= b@3@01 3)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= b@3@01 2))
  (and
    (not (= b@3@01 2))
    (=>
      (not (= b@3@01 3))
      (and (not (= b@3@01 3)) (or (not (= b@3@01 4)) (= b@3@01 4))))
    (or (not (= b@3@01 3)) (= b@3@01 3)))))
(assert (or (not (= b@3@01 2)) (= b@3@01 2)))
(assert (or (= b@3@01 2) (or (= b@3@01 3) (or (= b@3@01 4) (= b@3@01 5)))))
(pop) ; 2
(push) ; 2
; [eval] a == 1
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= a@2@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@2@01 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | a@2@01 == 1 | live]
; [else-branch: 3 | a@2@01 != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | a@2@01 == 1]
(assert (= a@2@01 1))
; [exec]
; b := 2
; [eval] b == 2 || (b == 3 || (b == 4 || b == 5))
; [eval] b == 2
(pop) ; 3
(push) ; 3
; [else-branch: 3 | a@2@01 != 1]
(assert (not (= a@2@01 1)))
(pop) ; 3
; [eval] !(a == 1)
; [eval] a == 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@2@01 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= a@2@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | a@2@01 != 1 | live]
; [else-branch: 4 | a@2@01 == 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | a@2@01 != 1]
(assert (not (= a@2@01 1)))
; [eval] a == 2
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= a@2@01 2))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@2@01 2)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | a@2@01 == 2 | live]
; [else-branch: 5 | a@2@01 != 2 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | a@2@01 == 2]
(assert (= a@2@01 2))
; [exec]
; b := 3
; [eval] b == 2 || (b == 3 || (b == 4 || b == 5))
; [eval] b == 2
(push) ; 5
; [then-branch: 6 | False | live]
; [else-branch: 6 | True | live]
(push) ; 6
; [then-branch: 6 | False]
(assert false)
(pop) ; 6
(push) ; 6
; [else-branch: 6 | True]
; [eval] b == 3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 5 | a@2@01 != 2]
(assert (not (= a@2@01 2)))
(pop) ; 4
; [eval] !(a == 2)
; [eval] a == 2
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@2@01 2)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= a@2@01 2))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | a@2@01 != 2 | live]
; [else-branch: 7 | a@2@01 == 2 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | a@2@01 != 2]
(assert (not (= a@2@01 2)))
; [eval] a == 3
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= a@2@01 3))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= a@2@01 3)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | a@2@01 == 3 | live]
; [else-branch: 8 | a@2@01 != 3 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | a@2@01 == 3]
(assert (= a@2@01 3))
; [exec]
; b := 4
; [eval] b == 2 || (b == 3 || (b == 4 || b == 5))
; [eval] b == 2
(push) ; 6
; [then-branch: 9 | False | live]
; [else-branch: 9 | True | live]
(push) ; 7
; [then-branch: 9 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 9 | True]
; [eval] b == 3
(push) ; 8
; [then-branch: 10 | False | live]
; [else-branch: 10 | True | live]
(push) ; 9
; [then-branch: 10 | False]
(assert false)
(pop) ; 9
(push) ; 9
; [else-branch: 10 | True]
; [eval] b == 4
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 8 | a@2@01 != 3]
(assert (not (= a@2@01 3)))
(pop) ; 5
; [eval] !(a == 3)
; [eval] a == 3
(push) ; 5
(set-option :timeout 10)
(assert (not (= a@2@01 3)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= a@2@01 3))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | a@2@01 != 3 | live]
; [else-branch: 11 | a@2@01 == 3 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | a@2@01 != 3]
(assert (not (= a@2@01 3)))
; [eval] a == 4
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= a@2@01 4))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= a@2@01 4)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | a@2@01 == 4 | live]
; [else-branch: 12 | a@2@01 != 4 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 12 | a@2@01 == 4]
(assert (= a@2@01 4))
; [exec]
; b := 2
; [eval] b == 2 || (b == 3 || (b == 4 || b == 5))
; [eval] b == 2
(pop) ; 6
(push) ; 6
; [else-branch: 12 | a@2@01 != 4]
(assert (not (= a@2@01 4)))
(pop) ; 6
; [eval] !(a == 4)
; [eval] a == 4
(push) ; 6
(set-option :timeout 10)
(assert (not (= a@2@01 4)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= a@2@01 4))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | a@2@01 != 4 | live]
; [else-branch: 13 | a@2@01 == 4 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | a@2@01 != 4]
(assert (not (= a@2@01 4)))
; [exec]
; b := 5
; [eval] b == 2 || (b == 3 || (b == 4 || b == 5))
; [eval] b == 2
(push) ; 7
; [then-branch: 14 | False | live]
; [else-branch: 14 | True | live]
(push) ; 8
; [then-branch: 14 | False]
(assert false)
(pop) ; 8
(push) ; 8
; [else-branch: 14 | True]
; [eval] b == 3
(push) ; 9
; [then-branch: 15 | False | live]
; [else-branch: 15 | True | live]
(push) ; 10
; [then-branch: 15 | False]
(assert false)
(pop) ; 10
(push) ; 10
; [else-branch: 15 | True]
; [eval] b == 4
(push) ; 11
; [then-branch: 16 | False | live]
; [else-branch: 16 | True | live]
(push) ; 12
; [then-branch: 16 | False]
(assert false)
(pop) ; 12
(push) ; 12
; [else-branch: 16 | True]
; [eval] b == 5
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 13 | a@2@01 == 4]
(assert (= a@2@01 4))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 11 | a@2@01 == 3]
(assert (= a@2@01 3))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 7 | a@2@01 == 2]
(assert (= a@2@01 2))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 4 | a@2@01 == 1]
(assert (= a@2@01 1))
(pop) ; 3
(pop) ; 2
(pop) ; 1
