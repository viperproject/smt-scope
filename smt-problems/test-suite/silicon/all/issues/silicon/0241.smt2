(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:28
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0241.vpr
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
; ---------- test_right_assert ----------
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
; var b: Bool
(declare-const b@0@01 Bool)
; [exec]
; inhale b == true
(declare-const $t@1@01 $Snap)
(assert (= $t@1@01 $Snap.unit))
; [eval] b == true
(assert (= b@0@01 true))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert b &&
;   (b &&
;   (b &&
;   (b &&
;   (b && (b && (b && (b && (b && (b && (b && (b && (b && (b && b)))))))))))))
(set-option :timeout 0)
(push) ; 3
(assert (not b@0@01))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert b@0@01)
(pop) ; 2
(pop) ; 1
; ---------- test_left_assert ----------
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
; var b: Bool
(declare-const b@2@01 Bool)
; [exec]
; inhale b == true
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] b == true
(assert (= b@2@01 true))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert b && b && b && b && b && b && b && b && b && b && b && b && b && b &&
;   b
(set-option :timeout 0)
(push) ; 3
(assert (not b@2@01))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert b@2@01)
(pop) ; 2
(pop) ; 1
; ---------- test_right ----------
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
; var b: Bool
(declare-const b@4@01 Bool)
; [exec]
; var v: Bool
(declare-const v@5@01 Bool)
; [exec]
; inhale b == true
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] b == true
(assert (= b@4@01 true))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; v := b &&
;   (b &&
;   (b &&
;   (b &&
;   (b && (b && (b && (b && (b && (b && (b && (b && (b && (b && b)))))))))))))
; [eval] b && (b && (b && (b && (b && (b && (b && (b && (b && (b && (b && (b && (b && (b && b)))))))))))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | !(b@4@01) | live]
; [else-branch: 0 | b@4@01 | live]
(push) ; 4
; [then-branch: 0 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | b@4@01]
(assert b@4@01)
(push) ; 5
; [then-branch: 1 | !(b@4@01) | live]
; [else-branch: 1 | b@4@01 | live]
(push) ; 6
; [then-branch: 1 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | b@4@01]
(push) ; 7
; [then-branch: 2 | !(b@4@01) | live]
; [else-branch: 2 | b@4@01 | live]
(push) ; 8
; [then-branch: 2 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | b@4@01]
(push) ; 9
; [then-branch: 3 | !(b@4@01) | live]
; [else-branch: 3 | b@4@01 | live]
(push) ; 10
; [then-branch: 3 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | b@4@01]
(push) ; 11
; [then-branch: 4 | !(b@4@01) | live]
; [else-branch: 4 | b@4@01 | live]
(push) ; 12
; [then-branch: 4 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 12
(push) ; 12
; [else-branch: 4 | b@4@01]
(push) ; 13
; [then-branch: 5 | !(b@4@01) | live]
; [else-branch: 5 | b@4@01 | live]
(push) ; 14
; [then-branch: 5 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 14
(push) ; 14
; [else-branch: 5 | b@4@01]
(push) ; 15
; [then-branch: 6 | !(b@4@01) | live]
; [else-branch: 6 | b@4@01 | live]
(push) ; 16
; [then-branch: 6 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 16
(push) ; 16
; [else-branch: 6 | b@4@01]
(push) ; 17
; [then-branch: 7 | !(b@4@01) | live]
; [else-branch: 7 | b@4@01 | live]
(push) ; 18
; [then-branch: 7 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 18
(push) ; 18
; [else-branch: 7 | b@4@01]
(push) ; 19
; [then-branch: 8 | !(b@4@01) | live]
; [else-branch: 8 | b@4@01 | live]
(push) ; 20
; [then-branch: 8 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 20
(push) ; 20
; [else-branch: 8 | b@4@01]
(push) ; 21
; [then-branch: 9 | !(b@4@01) | live]
; [else-branch: 9 | b@4@01 | live]
(push) ; 22
; [then-branch: 9 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 22
(push) ; 22
; [else-branch: 9 | b@4@01]
(push) ; 23
; [then-branch: 10 | !(b@4@01) | live]
; [else-branch: 10 | b@4@01 | live]
(push) ; 24
; [then-branch: 10 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 24
(push) ; 24
; [else-branch: 10 | b@4@01]
(push) ; 25
; [then-branch: 11 | !(b@4@01) | live]
; [else-branch: 11 | b@4@01 | live]
(push) ; 26
; [then-branch: 11 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 26
(push) ; 26
; [else-branch: 11 | b@4@01]
(push) ; 27
; [then-branch: 12 | !(b@4@01) | live]
; [else-branch: 12 | b@4@01 | live]
(push) ; 28
; [then-branch: 12 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 28
(push) ; 28
; [else-branch: 12 | b@4@01]
(push) ; 29
; [then-branch: 13 | !(b@4@01) | live]
; [else-branch: 13 | b@4@01 | live]
(push) ; 30
; [then-branch: 13 | !(b@4@01)]
(assert (not b@4@01))
(pop) ; 30
(push) ; 30
; [else-branch: 13 | b@4@01]
(pop) ; 30
(pop) ; 29
; Joined path conditions
; Joined path conditions
(assert (or b@4@01 (not b@4@01)))
(pop) ; 28
(pop) ; 27
; Joined path conditions
; Joined path conditions
(assert (=> b@4@01 (or b@4@01 (not b@4@01))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 26
(pop) ; 25
; Joined path conditions
; Joined path conditions
(assert (=> b@4@01 (and (=> b@4@01 (or b@4@01 (not b@4@01))) (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and (=> b@4@01 (or b@4@01 (not b@4@01))) (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and (=> b@4@01 (or b@4@01 (not b@4@01))) (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and (=> b@4@01 (or b@4@01 (not b@4@01))) (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and
                (=>
                  b@4@01
                  (and
                    (=> b@4@01 (or b@4@01 (not b@4@01)))
                    (or b@4@01 (not b@4@01))))
                (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and
                (=>
                  b@4@01
                  (and
                    (=>
                      b@4@01
                      (and
                        (=> b@4@01 (or b@4@01 (not b@4@01)))
                        (or b@4@01 (not b@4@01))))
                    (or b@4@01 (not b@4@01))))
                (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and
                (=>
                  b@4@01
                  (and
                    (=>
                      b@4@01
                      (and
                        (=>
                          b@4@01
                          (and
                            (=> b@4@01 (or b@4@01 (not b@4@01)))
                            (or b@4@01 (not b@4@01))))
                        (or b@4@01 (not b@4@01))))
                    (or b@4@01 (not b@4@01))))
                (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and
                (=>
                  b@4@01
                  (and
                    (=>
                      b@4@01
                      (and
                        (=>
                          b@4@01
                          (and
                            (=>
                              b@4@01
                              (and
                                (=> b@4@01 (or b@4@01 (not b@4@01)))
                                (or b@4@01 (not b@4@01))))
                            (or b@4@01 (not b@4@01))))
                        (or b@4@01 (not b@4@01))))
                    (or b@4@01 (not b@4@01))))
                (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and
                (=>
                  b@4@01
                  (and
                    (=>
                      b@4@01
                      (and
                        (=>
                          b@4@01
                          (and
                            (=>
                              b@4@01
                              (and
                                (=>
                                  b@4@01
                                  (and
                                    (=> b@4@01 (or b@4@01 (not b@4@01)))
                                    (or b@4@01 (not b@4@01))))
                                (or b@4@01 (not b@4@01))))
                            (or b@4@01 (not b@4@01))))
                        (or b@4@01 (not b@4@01))))
                    (or b@4@01 (not b@4@01))))
                (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and
                (=>
                  b@4@01
                  (and
                    (=>
                      b@4@01
                      (and
                        (=>
                          b@4@01
                          (and
                            (=>
                              b@4@01
                              (and
                                (=>
                                  b@4@01
                                  (and
                                    (=>
                                      b@4@01
                                      (and
                                        (=> b@4@01 (or b@4@01 (not b@4@01)))
                                        (or b@4@01 (not b@4@01))))
                                    (or b@4@01 (not b@4@01))))
                                (or b@4@01 (not b@4@01))))
                            (or b@4@01 (not b@4@01))))
                        (or b@4@01 (not b@4@01))))
                    (or b@4@01 (not b@4@01))))
                (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and
                (=>
                  b@4@01
                  (and
                    (=>
                      b@4@01
                      (and
                        (=>
                          b@4@01
                          (and
                            (=>
                              b@4@01
                              (and
                                (=>
                                  b@4@01
                                  (and
                                    (=>
                                      b@4@01
                                      (and
                                        (=>
                                          b@4@01
                                          (and
                                            (=> b@4@01 (or b@4@01 (not b@4@01)))
                                            (or b@4@01 (not b@4@01))))
                                        (or b@4@01 (not b@4@01))))
                                    (or b@4@01 (not b@4@01))))
                                (or b@4@01 (not b@4@01))))
                            (or b@4@01 (not b@4@01))))
                        (or b@4@01 (not b@4@01))))
                    (or b@4@01 (not b@4@01))))
                (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  b@4@01
  (and
    b@4@01
    (=>
      b@4@01
      (and
        (=>
          b@4@01
          (and
            (=>
              b@4@01
              (and
                (=>
                  b@4@01
                  (and
                    (=>
                      b@4@01
                      (and
                        (=>
                          b@4@01
                          (and
                            (=>
                              b@4@01
                              (and
                                (=>
                                  b@4@01
                                  (and
                                    (=>
                                      b@4@01
                                      (and
                                        (=>
                                          b@4@01
                                          (and
                                            (=>
                                              b@4@01
                                              (and
                                                (=>
                                                  b@4@01
                                                  (or b@4@01 (not b@4@01)))
                                                (or b@4@01 (not b@4@01))))
                                            (or b@4@01 (not b@4@01))))
                                        (or b@4@01 (not b@4@01))))
                                    (or b@4@01 (not b@4@01))))
                                (or b@4@01 (not b@4@01))))
                            (or b@4@01 (not b@4@01))))
                        (or b@4@01 (not b@4@01))))
                    (or b@4@01 (not b@4@01))))
                (or b@4@01 (not b@4@01))))
            (or b@4@01 (not b@4@01))))
        (or b@4@01 (not b@4@01))))
    (or b@4@01 (not b@4@01)))))
(assert (or b@4@01 (not b@4@01)))
(pop) ; 2
(pop) ; 1
; ---------- test_left ----------
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
; var b: Bool
(declare-const b@7@01 Bool)
; [exec]
; var v: Bool
(declare-const v@8@01 Bool)
; [exec]
; inhale b == true
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] b == true
(assert (= b@7@01 true))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; v := b && b && b && b && b && b && b && b && b && b && b && b && b && b &&
;   b
; [eval] b && b && b && b && b && b && b && b && b && b && b && b && b && b && b
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | !(b@7@01) | live]
; [else-branch: 14 | b@7@01 | live]
(push) ; 4
; [then-branch: 14 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | b@7@01]
(assert b@7@01)
(push) ; 5
; [then-branch: 15 | !(b@7@01) | live]
; [else-branch: 15 | b@7@01 | live]
(push) ; 6
; [then-branch: 15 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 6
(push) ; 6
; [else-branch: 15 | b@7@01]
(push) ; 7
; [then-branch: 16 | !(b@7@01) | live]
; [else-branch: 16 | b@7@01 | live]
(push) ; 8
; [then-branch: 16 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 8
(push) ; 8
; [else-branch: 16 | b@7@01]
(push) ; 9
; [then-branch: 17 | !(b@7@01) | live]
; [else-branch: 17 | b@7@01 | live]
(push) ; 10
; [then-branch: 17 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 10
(push) ; 10
; [else-branch: 17 | b@7@01]
(push) ; 11
; [then-branch: 18 | !(b@7@01) | live]
; [else-branch: 18 | b@7@01 | live]
(push) ; 12
; [then-branch: 18 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 12
(push) ; 12
; [else-branch: 18 | b@7@01]
(push) ; 13
; [then-branch: 19 | !(b@7@01) | live]
; [else-branch: 19 | b@7@01 | live]
(push) ; 14
; [then-branch: 19 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 14
(push) ; 14
; [else-branch: 19 | b@7@01]
(push) ; 15
; [then-branch: 20 | !(b@7@01) | live]
; [else-branch: 20 | b@7@01 | live]
(push) ; 16
; [then-branch: 20 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 16
(push) ; 16
; [else-branch: 20 | b@7@01]
(push) ; 17
; [then-branch: 21 | !(b@7@01) | live]
; [else-branch: 21 | b@7@01 | live]
(push) ; 18
; [then-branch: 21 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 18
(push) ; 18
; [else-branch: 21 | b@7@01]
(push) ; 19
; [then-branch: 22 | !(b@7@01) | live]
; [else-branch: 22 | b@7@01 | live]
(push) ; 20
; [then-branch: 22 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 20
(push) ; 20
; [else-branch: 22 | b@7@01]
(push) ; 21
; [then-branch: 23 | !(b@7@01) | live]
; [else-branch: 23 | b@7@01 | live]
(push) ; 22
; [then-branch: 23 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 22
(push) ; 22
; [else-branch: 23 | b@7@01]
(push) ; 23
; [then-branch: 24 | !(b@7@01) | live]
; [else-branch: 24 | b@7@01 | live]
(push) ; 24
; [then-branch: 24 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 24
(push) ; 24
; [else-branch: 24 | b@7@01]
(push) ; 25
; [then-branch: 25 | !(b@7@01) | live]
; [else-branch: 25 | b@7@01 | live]
(push) ; 26
; [then-branch: 25 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 26
(push) ; 26
; [else-branch: 25 | b@7@01]
(push) ; 27
; [then-branch: 26 | !(b@7@01) | live]
; [else-branch: 26 | b@7@01 | live]
(push) ; 28
; [then-branch: 26 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 28
(push) ; 28
; [else-branch: 26 | b@7@01]
(push) ; 29
; [then-branch: 27 | !(b@7@01) | live]
; [else-branch: 27 | b@7@01 | live]
(push) ; 30
; [then-branch: 27 | !(b@7@01)]
(assert (not b@7@01))
(pop) ; 30
(push) ; 30
; [else-branch: 27 | b@7@01]
(pop) ; 30
(pop) ; 29
; Joined path conditions
; Joined path conditions
(assert (or b@7@01 (not b@7@01)))
(pop) ; 28
(pop) ; 27
; Joined path conditions
; Joined path conditions
(assert (=> b@7@01 (or b@7@01 (not b@7@01))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 26
(pop) ; 25
; Joined path conditions
; Joined path conditions
(assert (=> b@7@01 (and (=> b@7@01 (or b@7@01 (not b@7@01))) (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and (=> b@7@01 (or b@7@01 (not b@7@01))) (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and (=> b@7@01 (or b@7@01 (not b@7@01))) (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and (=> b@7@01 (or b@7@01 (not b@7@01))) (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and
                (=>
                  b@7@01
                  (and
                    (=> b@7@01 (or b@7@01 (not b@7@01)))
                    (or b@7@01 (not b@7@01))))
                (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and
                (=>
                  b@7@01
                  (and
                    (=>
                      b@7@01
                      (and
                        (=> b@7@01 (or b@7@01 (not b@7@01)))
                        (or b@7@01 (not b@7@01))))
                    (or b@7@01 (not b@7@01))))
                (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and
                (=>
                  b@7@01
                  (and
                    (=>
                      b@7@01
                      (and
                        (=>
                          b@7@01
                          (and
                            (=> b@7@01 (or b@7@01 (not b@7@01)))
                            (or b@7@01 (not b@7@01))))
                        (or b@7@01 (not b@7@01))))
                    (or b@7@01 (not b@7@01))))
                (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and
                (=>
                  b@7@01
                  (and
                    (=>
                      b@7@01
                      (and
                        (=>
                          b@7@01
                          (and
                            (=>
                              b@7@01
                              (and
                                (=> b@7@01 (or b@7@01 (not b@7@01)))
                                (or b@7@01 (not b@7@01))))
                            (or b@7@01 (not b@7@01))))
                        (or b@7@01 (not b@7@01))))
                    (or b@7@01 (not b@7@01))))
                (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and
                (=>
                  b@7@01
                  (and
                    (=>
                      b@7@01
                      (and
                        (=>
                          b@7@01
                          (and
                            (=>
                              b@7@01
                              (and
                                (=>
                                  b@7@01
                                  (and
                                    (=> b@7@01 (or b@7@01 (not b@7@01)))
                                    (or b@7@01 (not b@7@01))))
                                (or b@7@01 (not b@7@01))))
                            (or b@7@01 (not b@7@01))))
                        (or b@7@01 (not b@7@01))))
                    (or b@7@01 (not b@7@01))))
                (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and
                (=>
                  b@7@01
                  (and
                    (=>
                      b@7@01
                      (and
                        (=>
                          b@7@01
                          (and
                            (=>
                              b@7@01
                              (and
                                (=>
                                  b@7@01
                                  (and
                                    (=>
                                      b@7@01
                                      (and
                                        (=> b@7@01 (or b@7@01 (not b@7@01)))
                                        (or b@7@01 (not b@7@01))))
                                    (or b@7@01 (not b@7@01))))
                                (or b@7@01 (not b@7@01))))
                            (or b@7@01 (not b@7@01))))
                        (or b@7@01 (not b@7@01))))
                    (or b@7@01 (not b@7@01))))
                (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and
                (=>
                  b@7@01
                  (and
                    (=>
                      b@7@01
                      (and
                        (=>
                          b@7@01
                          (and
                            (=>
                              b@7@01
                              (and
                                (=>
                                  b@7@01
                                  (and
                                    (=>
                                      b@7@01
                                      (and
                                        (=>
                                          b@7@01
                                          (and
                                            (=> b@7@01 (or b@7@01 (not b@7@01)))
                                            (or b@7@01 (not b@7@01))))
                                        (or b@7@01 (not b@7@01))))
                                    (or b@7@01 (not b@7@01))))
                                (or b@7@01 (not b@7@01))))
                            (or b@7@01 (not b@7@01))))
                        (or b@7@01 (not b@7@01))))
                    (or b@7@01 (not b@7@01))))
                (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  b@7@01
  (and
    b@7@01
    (=>
      b@7@01
      (and
        (=>
          b@7@01
          (and
            (=>
              b@7@01
              (and
                (=>
                  b@7@01
                  (and
                    (=>
                      b@7@01
                      (and
                        (=>
                          b@7@01
                          (and
                            (=>
                              b@7@01
                              (and
                                (=>
                                  b@7@01
                                  (and
                                    (=>
                                      b@7@01
                                      (and
                                        (=>
                                          b@7@01
                                          (and
                                            (=>
                                              b@7@01
                                              (and
                                                (=>
                                                  b@7@01
                                                  (or b@7@01 (not b@7@01)))
                                                (or b@7@01 (not b@7@01))))
                                            (or b@7@01 (not b@7@01))))
                                        (or b@7@01 (not b@7@01))))
                                    (or b@7@01 (not b@7@01))))
                                (or b@7@01 (not b@7@01))))
                            (or b@7@01 (not b@7@01))))
                        (or b@7@01 (not b@7@01))))
                    (or b@7@01 (not b@7@01))))
                (or b@7@01 (not b@7@01))))
            (or b@7@01 (not b@7@01))))
        (or b@7@01 (not b@7@01))))
    (or b@7@01 (not b@7@01)))))
(assert (or b@7@01 (not b@7@01)))
(pop) ; 2
(pop) ; 1
