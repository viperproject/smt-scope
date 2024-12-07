(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:27:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quasihavoc/pred5.vpr
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
(declare-fun Pair%trigger ($Snap $Ref $Ref) Bool)
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
; ---------- foo ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const b@2@01 Bool)
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(declare-const b@5@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] (unfolding acc(Pair(x, y), write) in x.f == 3)
(push) ; 2
(assert (Pair%trigger ($Snap.first $t@6@01) x@3@01 y@4@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(assert (not (= x@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@4@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@6@01))) $Snap.unit))
; [eval] x.f == y.f
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@6@01))))))
; [eval] x.f == 3
(pop) ; 2
; Joined path conditions
(assert (and
  (Pair%trigger ($Snap.first $t@6@01) x@3@01 y@4@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))
  (not (= x@3@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (not (= y@4@01 $Ref.null))
  (= ($Snap.second ($Snap.second ($Snap.first $t@6@01))) $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@6@01)))))))
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; quasihavoc b ==> Pair(x, y)
(declare-const $t@7@01 $Snap)
; [exec]
; unfold acc(Pair(x, y), write)
(assert (=
  (ite b@5@01 $t@7@01 ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first (ite b@5@01 $t@7@01 ($Snap.first $t@6@01)))
    ($Snap.second (ite b@5@01 $t@7@01 ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second (ite b@5@01 $t@7@01 ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second (ite b@5@01 $t@7@01 ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second (ite b@5@01 $t@7@01 ($Snap.first $t@6@01)))))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second (ite b@5@01 $t@7@01 ($Snap.first $t@6@01))))
  $Snap.unit))
; [eval] x.f == y.f
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (ite
    b@5@01
    $t@7@01
    ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (ite
    b@5@01
    $t@7@01
    ($Snap.first $t@6@01)))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger (ite b@5@01 $t@7@01 ($Snap.first $t@6@01)) x@3@01 y@4@01))
; [exec]
; inhale b == false
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] b == false
(assert (= b@5@01 false))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert y.f == 3
; [eval] y.f == 3
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (ite
    b@5@01
    $t@7@01
    ($Snap.first $t@6@01)))))
  3)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (ite
    b@5@01
    $t@7@01
    ($Snap.first $t@6@01)))))
  3))
(pop) ; 2
(pop) ; 1
