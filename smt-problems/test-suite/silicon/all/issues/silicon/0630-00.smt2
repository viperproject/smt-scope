(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:44
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0630.vpr
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
(declare-fun pred%trigger ($Snap $Ref) Bool)
(declare-fun predFive%trigger ($Snap $Ref) Bool)
(declare-fun tt%trigger ($Snap $Ref) Bool)
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
; ---------- m_test1 ----------
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
; var _1: Ref
(declare-const _1@0@01 $Ref)
; [exec]
; inhale acc(pred(_1), write)
(declare-const $t@1@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(pred(_1), write) in
;     _1.discriminant == 4 &&
;     (unfolding acc(predFive(_1.field1), write) in true))
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (unfolding acc(pred(_1), write) in _1.discriminant == 4 && (unfolding acc(predFive(_1.field1), write) in true))
(set-option :timeout 0)
(push) ; 3
(assert (pred%trigger $t@1@01 _1@0@01))
(assert (= $t@1@01 ($Snap.combine ($Snap.first $t@1@01) ($Snap.second $t@1@01))))
(assert (not (= _1@0@01 $Ref.null)))
(assert (=
  ($Snap.second $t@1@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@1@01))
    ($Snap.second ($Snap.second $t@1@01)))))
; [eval] self.discriminant == 4
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@1@01) == 4 | live]
; [else-branch: 0 | First:($t@1@01) != 4 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:($t@1@01) == 4]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))
; [eval] _1.discriminant == 4 && (unfolding acc(predFive(_1.field1), write) in true)
; [eval] _1.discriminant == 4
(push) ; 5
; [then-branch: 1 | First:($t@1@01) != 4 | live]
; [else-branch: 1 | First:($t@1@01) == 4 | live]
(push) ; 6
; [then-branch: 1 | First:($t@1@01) != 4]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | First:($t@1@01) == 4]
; [eval] (unfolding acc(predFive(_1.field1), write) in true)
(push) ; 7
(assert (predFive%trigger ($Snap.second ($Snap.second $t@1@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@1@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@1@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@1@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@1@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@1@01))) $Snap.unit))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@1@01))) $Snap.unit))
(pop) ; 7
; Joined path conditions
(assert (and
  (predFive%trigger ($Snap.second ($Snap.second $t@1@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@1@01))))
  (=
    ($Snap.second ($Snap.second $t@1@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@1@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@1@01)))))
  (= ($Snap.first ($Snap.second ($Snap.second $t@1@01))) $Snap.unit)
  (= ($Snap.second ($Snap.second ($Snap.second $t@1@01))) $Snap.unit)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)
  (and
    (predFive%trigger ($Snap.second ($Snap.second $t@1@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@1@01))))
    (=
      ($Snap.second ($Snap.second $t@1@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@1@01)))
        ($Snap.second ($Snap.second ($Snap.second $t@1@01)))))
    (= ($Snap.first ($Snap.second ($Snap.second $t@1@01))) $Snap.unit)
    (= ($Snap.second ($Snap.second ($Snap.second $t@1@01))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | First:($t@1@01) != 4]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)))
; [then-branch: 2 | False | dead]
; [else-branch: 2 | True | live]
(push) ; 5
; [else-branch: 2 | True]
(assert (= ($Snap.second ($Snap.second $t@1@01)) $Snap.unit))
; [eval] _1.discriminant == 4 && (unfolding acc(predFive(_1.field1), write) in true)
; [eval] _1.discriminant == 4
(push) ; 6
; [then-branch: 3 | First:($t@1@01) != 4 | live]
; [else-branch: 3 | First:($t@1@01) == 4 | live]
(push) ; 7
; [then-branch: 3 | First:($t@1@01) != 4]
(pop) ; 7
(push) ; 7
; [else-branch: 3 | First:($t@1@01) == 4]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))
; [eval] (unfolding acc(predFive(_1.field1), write) in true)
(push) ; 8
(check-sat)
; unsat
(pop) ; 8
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@3@01 Bool)
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)
  (=
    (as joined_unfolding@3@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))))
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))
  (=
    (as joined_unfolding@3@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))))
; Joined path conditions
(assert (and
  (pred%trigger $t@1@01 _1@0@01)
  (= $t@1@01 ($Snap.combine ($Snap.first $t@1@01) ($Snap.second $t@1@01)))
  (not (= _1@0@01 $Ref.null))
  (=
    ($Snap.second $t@1@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@1@01))
      ($Snap.second ($Snap.second $t@1@01))))))
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)
  (and
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)
    (=>
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)
      (and
        (predFive%trigger ($Snap.second ($Snap.second $t@1@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@1@01))))
        (=
          ($Snap.second ($Snap.second $t@1@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@1@01)))
            ($Snap.second ($Snap.second ($Snap.second $t@1@01)))))
        (= ($Snap.first ($Snap.second ($Snap.second $t@1@01))) $Snap.unit)
        (= ($Snap.second ($Snap.second ($Snap.second $t@1@01))) $Snap.unit)))
    (or
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))))))
; Joined path conditions
(assert (and
  (pred%trigger $t@1@01 _1@0@01)
  (= $t@1@01 ($Snap.combine ($Snap.first $t@1@01) ($Snap.second $t@1@01)))
  (not (= _1@0@01 $Ref.null))
  (=
    ($Snap.second $t@1@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@1@01))
      ($Snap.second ($Snap.second $t@1@01))))))
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))
  (= ($Snap.second ($Snap.second $t@1@01)) $Snap.unit)))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@01)) 4)))
(assert (as joined_unfolding@3@01  Bool))
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
