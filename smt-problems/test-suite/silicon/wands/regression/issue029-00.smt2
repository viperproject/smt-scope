(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:36:05
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/issue029.vpr
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
(declare-sort $MWSF 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
    )))
; ////////// Symbols
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap) Bool)
(declare-fun Q%trigger ($Snap Bool) Bool)
(declare-fun LL%trigger ($Snap $Ref) Bool)
(declare-fun LLC%trigger ($Snap $Ref Int) Bool)
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
(declare-const b@0@01 Bool)
(declare-const b@1@01 Bool)
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
; package acc(Q(b), write) && (unfolding acc(Q(b), write) in true) --* true {
; }
(push) ; 3
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] (unfolding acc(Q(b), write) in true)
(push) ; 4
(assert (Q%trigger ($Snap.first $t@2@01) b@1@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@1@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@1@01 | live]
; [else-branch: 0 | !(b@1@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | b@1@01]
(assert b@1@01)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(b@1@01)]
(assert (not b@1@01))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@3@01 Bool)
(assert (=> b@1@01 (= (as joined_unfolding@3@01  Bool) true)))
(assert (=> (not b@1@01) (= (as joined_unfolding@3@01  Bool) true)))
; Joined path conditions
(assert (Q%trigger ($Snap.first $t@2@01) b@1@01))
; Joined path conditions
(assert (=> (not b@1@01) (and (not b@1@01) (= ($Snap.first $t@2@01) $Snap.unit))))
(assert (or (not b@1@01) b@1@01))
(assert (as joined_unfolding@3@01  Bool))
; Create MagicWandSnapFunction for wand acc(Q(b), write) && (unfolding acc(Q(b), write) in true) --* true
(declare-const mwsf@4@01 $MWSF)
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@4@01 $t@2@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@4@01 $t@2@01))
  :qid |quant-u-0|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@4@01 $t@2@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@4@01 $t@2@01))
  :qid |quant-u-1|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@5@01 $Ref)
(declare-const x@6@01 $Ref)
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
; inhale acc(LL(x), write)
(declare-const $t@7@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package acc(LL(x), write) &&
; ((unfolding acc(LL(x), write) in x.val == 10) &&
; (unfolding acc(LL(x), write) in
;   x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
; acc(LL(x), write) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(push) ; 4
(assert (LL%trigger ($Snap.first $t@8@01) x@6@01))
(assert (=
  ($Snap.first $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@8@01))
    ($Snap.second ($Snap.first $t@8@01)))))
(assert (not (= x@6@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(First:($t@8@01))) != Null | live]
; [else-branch: 1 | First:(Second:(First:($t@8@01))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:(Second:(First:($t@8@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
    $Ref.null)))
; [eval] x.val == 10
(pop) ; 5
(push) ; 5
; [else-branch: 1 | First:(Second:(First:($t@8@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@8@01))) $Snap.unit))
; [eval] x.val == 10
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@9@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
      $Ref.null))
  (=
    (as joined_unfolding@9@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@8@01))) 10))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
    $Ref.null)
  (=
    (as joined_unfolding@9@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@8@01))) 10))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@8@01) x@6@01)
  (=
    ($Snap.first $t@8@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@8@01))
      ($Snap.second ($Snap.first $t@8@01))))
  (not (= x@6@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@8@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@8@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@8@01) x@6@01)
  (=
    ($Snap.first $t@8@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@8@01))
      ($Snap.second ($Snap.first $t@8@01))))
  (not (= x@6@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@8@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@8@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@8@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
      $Ref.null))))
(assert (as joined_unfolding@9@01  Bool))
(assert (= ($Snap.second ($Snap.second $t@8@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))
(push) ; 4
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(First:($t@8@01))) != Null | live]
; [else-branch: 2 | First:(Second:(First:($t@8@01))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(Second:(First:($t@8@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(First:($t@8@01))) != Null | live]
; [else-branch: 3 | First:(Second:(First:($t@8@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 3 | First:(Second:(First:($t@8@01))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 20)
(push) ; 8
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@8@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@6@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@6@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(Second:(Second:(First:($t@8@01))))) != Null | live]
; [else-branch: 4 | First:(Second:(Second:(Second:(First:($t@8@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 4 | First:(Second:(Second:(Second:(First:($t@8@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
    $Ref.null)))
; [eval] x.next.val == 20
(pop) ; 9
(push) ; 9
; [else-branch: 4 | First:(Second:(Second:(Second:(First:($t@8@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
  $Snap.unit))
; [eval] x.next.val == 20
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@10@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@10@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
      20))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@10@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
      20))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@8@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@8@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@8@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@8@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
      $Ref.null))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@10@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
          20)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@10@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
          20)))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@8@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@8@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
          $Ref.null))))))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | First:(Second:(First:($t@8@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@8@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 6
; [then-branch: 5 | First:(Second:(First:($t@8@01))) != Null | dead]
; [else-branch: 5 | First:(Second:(First:($t@8@01))) == Null | live]
(push) ; 7
; [else-branch: 5 | First:(Second:(First:($t@8@01))) == Null]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@11@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
      $Ref.null))
  (=
    (as joined_unfolding@11@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
          $Ref.null))
      (as joined_unfolding@10@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
    $Ref.null)
  (= (as joined_unfolding@11@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@10@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
              20)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@10@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
              20)))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@8@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@8@01)))))
        (=
          ($Snap.second ($Snap.second ($Snap.first $t@8@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01)))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@8@01))))))
              $Ref.null))))))))
; Joined path conditions
(assert (as joined_unfolding@11@01  Bool))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(LL(x), write) && ((unfolding acc(LL(x), write) in x.val == 10) && (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))) --* acc(LL(x), write)
(declare-const mwsf@12@01 $MWSF)
(assert (forall (($t@8@01 $Snap)) (!
  (= (MWSF_apply mwsf@12@01 $t@8@01) ($Snap.first $t@8@01))
  :pattern ((MWSF_apply mwsf@12@01 $t@8@01))
  :qid |quant-u-2|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@8@01 $Snap)) (!
  (= (MWSF_apply mwsf@12@01 $t@8@01) ($Snap.first $t@8@01))
  :pattern ((MWSF_apply mwsf@12@01 $t@8@01))
  :qid |quant-u-3|)))
(assert true)
; [exec]
; apply acc(LL(x), write) &&
;   ((unfolding acc(LL(x), write) in x.val == 10) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
;   acc(LL(x), write)
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(push) ; 4
(assert (LL%trigger $t@7@01 x@6@01))
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (not (= x@6@01 $Ref.null)))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:($t@7@01)) != Null | live]
; [else-branch: 6 | First:(Second:($t@7@01)) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | First:(Second:($t@7@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
; [eval] x.val == 10
(pop) ; 5
(push) ; 5
; [else-branch: 6 | First:(Second:($t@7@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [eval] x.val == 10
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@13@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))
  (=
    (as joined_unfolding@13@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 10))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)
  (=
    (as joined_unfolding@13@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 10))))
; Joined path conditions
(assert (and
  (LL%trigger $t@7@01 x@6@01)
  (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01)))
  (not (= x@6@01 $Ref.null))
  (=
    ($Snap.second $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@7@01))
      ($Snap.second ($Snap.second $t@7@01))))))
; Joined path conditions
(assert (and
  (LL%trigger $t@7@01 x@6@01)
  (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01)))
  (not (= x@6@01 $Ref.null))
  (=
    ($Snap.second $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@7@01))
      ($Snap.second ($Snap.second $t@7@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))))
(push) ; 4
(assert (not (as joined_unfolding@13@01  Bool)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(set-option :timeout 0)
(push) ; 4
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:($t@7@01)) != Null | live]
; [else-branch: 7 | First:(Second:($t@7@01)) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | First:(Second:($t@7@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.val == 10
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | First:(Second:($t@7@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.val == 10
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@14@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))
  (=
    (as joined_unfolding@14@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 10))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)
  (=
    (as joined_unfolding@14@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 10))))
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (as joined_unfolding@14@01  Bool)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(set-option :timeout 0)
(push) ; 4
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:($t@7@01)) != Null | live]
; [else-branch: 8 | First:(Second:($t@7@01)) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | First:(Second:($t@7@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.val == 10
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 8 | First:(Second:($t@7@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.val == 10
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@15@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))
  (=
    (as joined_unfolding@15@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 10))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)
  (=
    (as joined_unfolding@15@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 10))))
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (as joined_unfolding@15@01  Bool)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(set-option :timeout 0)
(push) ; 4
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:($t@7@01)) != Null | live]
; [else-branch: 9 | First:(Second:($t@7@01)) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | First:(Second:($t@7@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.val == 10
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | First:(Second:($t@7@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.val == 10
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@16@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))
  (=
    (as joined_unfolding@16@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 10))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)
  (=
    (as joined_unfolding@16@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 10))))
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (as joined_unfolding@16@01  Bool)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
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
; var x: Ref
(declare-const x@17@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@18@01 $Ref)
; [exec]
; x := new(val, next)
(declare-const x@19@01 $Ref)
(assert (not (= x@19@01 $Ref.null)))
(declare-const val@20@01 Int)
(declare-const next@21@01 $Ref)
(assert (not (= x@19@01 x@17@01)))
(assert (not (= x@19@01 y@18@01)))
; [exec]
; y := new(val, next)
(declare-const y@22@01 $Ref)
(assert (not (= y@22@01 $Ref.null)))
(declare-const val@23@01 Int)
(declare-const next@24@01 $Ref)
(assert (not (= y@22@01 y@18@01)))
(assert (not (= y@22@01 x@19@01)))
(assert (not (= y@22@01 next@21@01)))
; [exec]
; x.next := y
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@22@01 x@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.val := 10
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@22@01 x@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.next.val := 20
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 y@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.next.next := null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@19@01 y@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(LL(x.next), write)
; [eval] x.next != null
; [then-branch: 10 | False | dead]
; [else-branch: 10 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 10 | True]
(assert (LL%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 20)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) y@22@01))
; [exec]
; fold acc(LL(x), write)
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@22@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | y@22@01 != Null | live]
; [else-branch: 11 | y@22@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | y@22@01 != Null]
(assert (LL%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 10)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap y@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 20)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x@19@01))
; [exec]
; package acc(LL(x), write) &&
; ((unfolding acc(LL(x), write) in x.val == 10) &&
; (unfolding acc(LL(x), write) in
;   x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
; acc(LL(x), write) {
; }
(push) ; 5
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.first ($Snap.second $t@25@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(push) ; 6
(assert (LL%trigger ($Snap.first $t@25@01) x@19@01))
(assert (=
  ($Snap.first $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@25@01))
    ($Snap.second ($Snap.first $t@25@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@25@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@25@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
; [eval] x.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(First:($t@25@01))) != Null | live]
; [else-branch: 12 | First:(Second:(First:($t@25@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | First:(Second:(First:($t@25@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
    $Ref.null)))
; [eval] x.val == 10
(pop) ; 7
(push) ; 7
; [else-branch: 12 | First:(Second:(First:($t@25@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@25@01))) $Snap.unit))
; [eval] x.val == 10
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@26@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
      $Ref.null))
  (=
    (as joined_unfolding@26@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@25@01))) 10))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
    $Ref.null)
  (=
    (as joined_unfolding@26@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@25@01))) 10))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@25@01) x@19@01)
  (=
    ($Snap.first $t@25@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@25@01))
      ($Snap.second ($Snap.first $t@25@01))))
  (=
    ($Snap.second ($Snap.first $t@25@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@25@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@25@01) x@19@01)
  (=
    ($Snap.first $t@25@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@25@01))
      ($Snap.second ($Snap.first $t@25@01))))
  (=
    ($Snap.second ($Snap.first $t@25@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@25@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@25@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
      $Ref.null))))
(assert (as joined_unfolding@26@01  Bool))
(assert (= ($Snap.second ($Snap.second $t@25@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))
(push) ; 6
; [eval] x.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(First:($t@25@01))) != Null | live]
; [else-branch: 13 | First:(Second:(First:($t@25@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 13 | First:(Second:(First:($t@25@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:(First:($t@25@01))) != Null | live]
; [else-branch: 14 | First:(Second:(First:($t@25@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 14 | First:(Second:(First:($t@25@01))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 20)
(push) ; 10
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@25@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@25@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  x@19@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  x@19@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01)))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:(Second:(Second:(First:($t@25@01))))) != Null | live]
; [else-branch: 15 | First:(Second:(Second:(Second:(First:($t@25@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 15 | First:(Second:(Second:(Second:(First:($t@25@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
    $Ref.null)))
; [eval] x.next.val == 20
(pop) ; 11
(push) ; 11
; [else-branch: 15 | First:(Second:(Second:(Second:(First:($t@25@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
  $Snap.unit))
; [eval] x.next.val == 20
(pop) ; 11
(pop) ; 10
(declare-const joined_unfolding@27@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@27@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
      20))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@27@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
      20))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@25@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@25@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@25@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@25@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
      $Ref.null))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@27@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
          20)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@27@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
          20)))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@25@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@25@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
          $Ref.null))))))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | First:(Second:(First:($t@25@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@25@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 8
; [then-branch: 16 | First:(Second:(First:($t@25@01))) != Null | dead]
; [else-branch: 16 | First:(Second:(First:($t@25@01))) == Null | live]
(push) ; 9
; [else-branch: 16 | First:(Second:(First:($t@25@01))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@28@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
      $Ref.null))
  (=
    (as joined_unfolding@28@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
          $Ref.null))
      (as joined_unfolding@27@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
    $Ref.null)
  (= (as joined_unfolding@28@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@27@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
              20)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@27@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
              20)))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@25@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@25@01)))))
        (=
          ($Snap.second ($Snap.second ($Snap.first $t@25@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01)))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@25@01))))))
              $Ref.null))))))))
; Joined path conditions
(assert (as joined_unfolding@28@01  Bool))
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(LL(x), write) && ((unfolding acc(LL(x), write) in x.val == 10) && (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))) --* acc(LL(x), write)
(declare-const mwsf@29@01 $MWSF)
(assert (forall (($t@25@01 $Snap)) (!
  (= (MWSF_apply mwsf@29@01 $t@25@01) ($Snap.first $t@25@01))
  :pattern ((MWSF_apply mwsf@29@01 $t@25@01))
  :qid |quant-u-4|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
(assert (forall (($t@25@01 $Snap)) (!
  (= (MWSF_apply mwsf@29@01 $t@25@01) ($Snap.first $t@25@01))
  :pattern ((MWSF_apply mwsf@29@01 $t@25@01))
  :qid |quant-u-5|)))
(assert true)
; [exec]
; apply acc(LL(x), write) &&
;   ((unfolding acc(LL(x), write) in x.val == 10) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
;   acc(LL(x), write)
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(push) ; 6
; [eval] x.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= y@22@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | y@22@01 != Null | live]
; [else-branch: 17 | y@22@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 17 | y@22@01 != Null]
; [eval] x.val == 10
(pop) ; 7
(pop) ; 6
; Joined path conditions
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))
(push) ; 6
; [eval] x.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= y@22@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | y@22@01 != Null | live]
; [else-branch: 18 | y@22@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 18 | y@22@01 != Null]
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= y@22@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | y@22@01 != Null | live]
; [else-branch: 19 | y@22@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 19 | y@22@01 != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 20)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= x@19@01 y@22@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= x@19@01 y@22@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 20 | False | dead]
; [else-branch: 20 | True | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 20 | True]
; [eval] x.next.val == 20
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(pop) ; 6
; Joined path conditions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const x@30@01 $Ref)
(declare-const x@31@01 $Ref)
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
; inhale acc(LL(x), write) &&
;   ((unfolding acc(LL(x), write) in x.val == 10) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 20)))
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(assert (= ($Snap.first ($Snap.second $t@32@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(push) ; 3
(assert (LL%trigger ($Snap.first $t@32@01) x@31@01))
(assert (=
  ($Snap.first $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@32@01))
    ($Snap.second ($Snap.first $t@32@01)))))
(assert (not (= x@31@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@32@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@32@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | First:(Second:(First:($t@32@01))) != Null | live]
; [else-branch: 21 | First:(Second:(First:($t@32@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | First:(Second:(First:($t@32@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)))
; [eval] x.val == 10
(pop) ; 4
(push) ; 4
; [else-branch: 21 | First:(Second:(First:($t@32@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@32@01))) $Snap.unit))
; [eval] x.val == 10
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@33@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))
  (=
    (as joined_unfolding@33@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@32@01))) 10))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)
  (=
    (as joined_unfolding@33@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@32@01))) 10))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@32@01) x@31@01)
  (=
    ($Snap.first $t@32@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@32@01))
      ($Snap.second ($Snap.first $t@32@01))))
  (not (= x@31@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@32@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@32@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@32@01) x@31@01)
  (=
    ($Snap.first $t@32@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@32@01))
      ($Snap.second ($Snap.first $t@32@01))))
  (not (= x@31@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@32@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@32@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@32@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))))
(assert (as joined_unfolding@33@01  Bool))
(assert (= ($Snap.second ($Snap.second $t@32@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(Second:(First:($t@32@01))) != Null | live]
; [else-branch: 22 | First:(Second:(First:($t@32@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | First:(Second:(First:($t@32@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | First:(Second:(First:($t@32@01))) != Null | live]
; [else-branch: 23 | First:(Second:(First:($t@32@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 23 | First:(Second:(First:($t@32@01))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 20)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | First:(Second:(Second:(Second:(First:($t@32@01))))) != Null | live]
; [else-branch: 24 | First:(Second:(Second:(Second:(First:($t@32@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 24 | First:(Second:(Second:(Second:(First:($t@32@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null)))
; [eval] x.next.val == 20
(pop) ; 8
(push) ; 8
; [else-branch: 24 | First:(Second:(Second:(Second:(First:($t@32@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
  $Snap.unit))
; [eval] x.next.val == 20
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@34@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@34@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      20))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@34@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      20))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@34@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
          20)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@34@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
          20)))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
          $Ref.null))))))
(pop) ; 4
(push) ; 4
; [else-branch: 22 | First:(Second:(First:($t@32@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@32@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 5
; [then-branch: 25 | First:(Second:(First:($t@32@01))) != Null | dead]
; [else-branch: 25 | First:(Second:(First:($t@32@01))) == Null | live]
(push) ; 6
; [else-branch: 25 | First:(Second:(First:($t@32@01))) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@35@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))
  (=
    (as joined_unfolding@35@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
          $Ref.null))
      (as joined_unfolding@34@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)
  (= (as joined_unfolding@35@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@34@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
              20)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@34@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
              20)))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))
        (=
          ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
              $Ref.null))))))))
; Joined path conditions
(assert (as joined_unfolding@35@01  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LL(x), write) &&
;   ((unfolding acc(LL(x), write) in x.val == 10) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
;   acc(LL(x), write)
(declare-const $t@36@01 $MWSF)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; apply acc(LL(x), write) &&
;   ((unfolding acc(LL(x), write) in x.val == 10) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
;   acc(LL(x), write)
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(set-option :timeout 0)
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | First:(Second:(First:($t@32@01))) != Null | live]
; [else-branch: 26 | First:(Second:(First:($t@32@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 26 | First:(Second:(First:($t@32@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)))
; [eval] x.val == 10
(pop) ; 4
(push) ; 4
; [else-branch: 26 | First:(Second:(First:($t@32@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@32@01))) $Snap.unit))
; [eval] x.val == 10
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@37@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))
  (=
    (as joined_unfolding@37@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@32@01))) 10))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)
  (=
    (as joined_unfolding@37@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@32@01))) 10))))
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (as joined_unfolding@37@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@37@01  Bool))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | First:(Second:(First:($t@32@01))) != Null | live]
; [else-branch: 27 | First:(Second:(First:($t@32@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 27 | First:(Second:(First:($t@32@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | First:(Second:(First:($t@32@01))) != Null | live]
; [else-branch: 28 | First:(Second:(First:($t@32@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 28 | First:(Second:(First:($t@32@01))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 20)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | First:(Second:(Second:(Second:(First:($t@32@01))))) != Null | live]
; [else-branch: 29 | First:(Second:(Second:(Second:(First:($t@32@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 29 | First:(Second:(Second:(Second:(First:($t@32@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null)))
; [eval] x.next.val == 20
(pop) ; 8
(push) ; 8
; [else-branch: 29 | First:(Second:(Second:(Second:(First:($t@32@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
  $Snap.unit))
; [eval] x.next.val == 20
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@38@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@38@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      20))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@38@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      20))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@38@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
          20)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@38@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
          20)))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
          $Ref.null))))))
(pop) ; 4
(push) ; 4
; [else-branch: 27 | First:(Second:(First:($t@32@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@32@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 5
; [then-branch: 30 | First:(Second:(First:($t@32@01))) != Null | dead]
; [else-branch: 30 | First:(Second:(First:($t@32@01))) == Null | live]
(push) ; 6
; [else-branch: 30 | First:(Second:(First:($t@32@01))) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@39@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))
  (=
    (as joined_unfolding@39@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
          $Ref.null))
      (as joined_unfolding@38@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
    $Ref.null)
  (= (as joined_unfolding@39@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@38@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
              20)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@38@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
              20)))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@32@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@32@01)))))
        (=
          ($Snap.second ($Snap.second ($Snap.first $t@32@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01)))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@32@01))))))
              $Ref.null))))))))
; Joined path conditions
(push) ; 3
(assert (not (as joined_unfolding@39@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@39@01  Bool))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val))
(set-option :timeout 0)
(push) ; 3
(assert (LL%trigger (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))) x@31@01))
(assert (=
  (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))
  ($Snap.combine
    ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))
    ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
(assert (=
  ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | live]
; [else-branch: 31 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 31 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
; [eval] x.next != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | live]
; [else-branch: 32 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 32 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) != Null | live]
; [else-branch: 33 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 33 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)))
; [eval] x.next.val == 2 * x.val
; [eval] 2 * x.val
(pop) ; 8
(push) ; 8
; [else-branch: 33 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Snap.unit))
; [eval] x.next.val == 2 * x.val
; [eval] 2 * x.val
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@40@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))
  (=
    (as joined_unfolding@40@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      (*
        2
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (=
    (as joined_unfolding@40@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      (*
        2
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))
      (=
        (as joined_unfolding@40@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          (*
            2
            ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (=
        (as joined_unfolding@40@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          (*
            2
            ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    (=
      ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))))))
(pop) ; 4
(push) ; 4
; [else-branch: 31 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
; [eval] x.next != null
(push) ; 5
; [then-branch: 34 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | dead]
; [else-branch: 34 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | live]
(push) ; 6
; [else-branch: 34 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@41@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (=
    (as joined_unfolding@41@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          $Ref.null))
      (as joined_unfolding@40@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)
  (= (as joined_unfolding@41@01  Bool) true)))
; Joined path conditions
(assert (and
  (LL%trigger (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))) x@31@01)
  (=
    (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))
    ($Snap.combine
      ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))
      ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
  (=
    ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))
    ($Snap.combine
      ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))
          (=
            (as joined_unfolding@40@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              (*
                2
                ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (=
            (as joined_unfolding@40@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              (*
                2
                ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        (=
          ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))))))))
; Joined path conditions
(assert (and
  (LL%trigger (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))) x@31@01)
  (=
    (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))
    ($Snap.combine
      ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))
      ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
  (=
    ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))
    ($Snap.combine
      ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))))
(push) ; 3
(assert (not (as joined_unfolding@41@01  Bool)))
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
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val))
(set-option :timeout 0)
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | live]
; [else-branch: 35 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | live]
; [else-branch: 36 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 36 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
(set-option :timeout 0)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) != Null | live]
; [else-branch: 37 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 37 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
; [eval] x.next.val == 2 * x.val
; [eval] 2 * x.val
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 37 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
; [eval] x.next.val == 2 * x.val
; [eval] 2 * x.val
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@42@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))
  (=
    (as joined_unfolding@42@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      (*
        2
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (=
    (as joined_unfolding@42@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      (*
        2
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null))
    (not
      (=
        x@31@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        x@31@01)))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null)
    (not
      (=
        x@31@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        x@31@01))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))
      (=
        (as joined_unfolding@42@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          (*
            2
            ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (=
        (as joined_unfolding@42@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          (*
            2
            ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    (=
      ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null))
        (not
          (=
            x@31@01
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            x@31@01))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null)
        (not
          (=
            x@31@01
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            x@31@01))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 35 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | dead]
; [else-branch: 38 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | live]
(push) ; 6
; [else-branch: 38 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@43@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (=
    (as joined_unfolding@43@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          $Ref.null))
      (as joined_unfolding@42@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)
  (= (as joined_unfolding@43@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))
          (=
            (as joined_unfolding@42@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              (*
                2
                ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (=
            (as joined_unfolding@42@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              (*
                2
                ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        (=
          ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
                $Ref.null))
            (not
              (=
                x@31@01
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))
                x@31@01))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null)
            (not
              (=
                x@31@01
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))
                x@31@01))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))))))))
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (as joined_unfolding@43@01  Bool)))
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
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val))
(set-option :timeout 0)
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | live]
; [else-branch: 39 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 39 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | live]
; [else-branch: 40 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 40 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
(set-option :timeout 0)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) != Null | live]
; [else-branch: 41 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 41 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
; [eval] x.next.val == 2 * x.val
; [eval] 2 * x.val
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 41 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
; [eval] x.next.val == 2 * x.val
; [eval] 2 * x.val
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@44@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))
  (=
    (as joined_unfolding@44@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      (*
        2
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (=
    (as joined_unfolding@44@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      (*
        2
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null))
    (not
      (=
        x@31@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        x@31@01)))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null)
    (not
      (=
        x@31@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        x@31@01))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))
      (=
        (as joined_unfolding@44@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          (*
            2
            ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (=
        (as joined_unfolding@44@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          (*
            2
            ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    (=
      ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null))
        (not
          (=
            x@31@01
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            x@31@01))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null)
        (not
          (=
            x@31@01
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            x@31@01))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 39 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
; [then-branch: 42 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | dead]
; [else-branch: 42 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | live]
(push) ; 6
; [else-branch: 42 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@45@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (=
    (as joined_unfolding@45@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          $Ref.null))
      (as joined_unfolding@44@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)
  (= (as joined_unfolding@45@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))
          (=
            (as joined_unfolding@44@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              (*
                2
                ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (=
            (as joined_unfolding@44@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              (*
                2
                ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        (=
          ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
                $Ref.null))
            (not
              (=
                x@31@01
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))
                x@31@01))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null)
            (not
              (=
                x@31@01
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))
                x@31@01))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))))))))
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (as joined_unfolding@45@01  Bool)))
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
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val))
(set-option :timeout 0)
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | live]
; [else-branch: 43 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 43 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | live]
; [else-branch: 44 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 44 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
(set-option :timeout 0)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit))))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) != Null | live]
; [else-branch: 45 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 45 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
; [eval] x.next.val == 2 * x.val
; [eval] 2 * x.val
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 45 | First:(Second:(Second:(Second:($t@36@01[(First:($t@32@01), (_, _))])))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  x@31@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
(assert (and
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@31@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      x@31@01))
  (not
    (=
      x@31@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
; [eval] x.next.val == 2 * x.val
; [eval] 2 * x.val
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@46@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))
  (=
    (as joined_unfolding@46@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      (*
        2
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (=
    (as joined_unfolding@46@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      (*
        2
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null))
    (not
      (=
        x@31@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        x@31@01)))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null)
    (not
      (=
        x@31@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        x@31@01))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))
      (=
        (as joined_unfolding@46@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          (*
            2
            ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (=
        (as joined_unfolding@46@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          (*
            2
            ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    (=
      ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null))
        (not
          (=
            x@31@01
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            x@31@01))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null)
        (not
          (=
            x@31@01
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            x@31@01))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Ref.null))))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 43 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 2 * x.val)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
; [then-branch: 46 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) != Null | dead]
; [else-branch: 46 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null | live]
(push) ; 6
; [else-branch: 46 | First:(Second:($t@36@01[(First:($t@32@01), (_, _))])) == Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@47@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (=
    (as joined_unfolding@47@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          $Ref.null))
      (as joined_unfolding@46@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    $Ref.null)
  (= (as joined_unfolding@47@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))
          (=
            (as joined_unfolding@46@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              (*
                2
                ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (=
            (as joined_unfolding@46@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              (*
                2
                ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (LL%trigger ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        (=
          ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))
            ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
                $Ref.null))
            (not
              (=
                x@31@01
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))
                x@31@01))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null)
            (not
              (=
                x@31@01
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                  ($Snap.first $t@32@01)
                  ($Snap.combine $Snap.unit $Snap.unit))))))
                x@31@01))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
              ($Snap.first $t@32@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second (MWSF_apply $t@36@01 ($Snap.combine
                ($Snap.first $t@32@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Ref.null))))))))
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (as joined_unfolding@47@01  Bool)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const x@48@01 $Ref)
(declare-const x@49@01 $Ref)
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
; package acc(LL(x), write) &&
; ((unfolding acc(LL(x), write) in x.val == 10) &&
; (unfolding acc(LL(x), write) in
;   x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
; acc(LL(x), write) &&
; (unfolding acc(LL(x), write) in
;   x.next != null ==>
;   (unfolding acc(LL(x.next), write) in x.val < x.next.val)) {
; }
(push) ; 3
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(assert (= ($Snap.first ($Snap.second $t@50@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(push) ; 4
(assert (LL%trigger ($Snap.first $t@50@01) x@49@01))
(assert (=
  ($Snap.first $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@50@01))
    ($Snap.second ($Snap.first $t@50@01)))))
(assert (not (= x@49@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@50@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@50@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | First:(Second:(First:($t@50@01))) != Null | live]
; [else-branch: 47 | First:(Second:(First:($t@50@01))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 47 | First:(Second:(First:($t@50@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null)))
; [eval] x.val == 10
(pop) ; 5
(push) ; 5
; [else-branch: 47 | First:(Second:(First:($t@50@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@50@01))) $Snap.unit))
; [eval] x.val == 10
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@51@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null))
  (=
    (as joined_unfolding@51@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@50@01))) 10))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null)
  (=
    (as joined_unfolding@51@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@50@01))) 10))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@50@01) x@49@01)
  (=
    ($Snap.first $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@50@01))
      ($Snap.second ($Snap.first $t@50@01))))
  (not (= x@49@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@50@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@50@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@50@01) x@49@01)
  (=
    ($Snap.first $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@50@01))
      ($Snap.second ($Snap.first $t@50@01))))
  (not (= x@49@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@50@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@50@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@50@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null))))
(assert (as joined_unfolding@51@01  Bool))
(assert (= ($Snap.second ($Snap.second $t@50@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))
(push) ; 4
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | First:(Second:(First:($t@50@01))) != Null | live]
; [else-branch: 48 | First:(Second:(First:($t@50@01))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 48 | First:(Second:(First:($t@50@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | First:(Second:(First:($t@50@01))) != Null | live]
; [else-branch: 49 | First:(Second:(First:($t@50@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 49 | First:(Second:(First:($t@50@01))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 20)
(push) ; 8
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@49@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@49@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | First:(Second:(Second:(Second:(First:($t@50@01))))) != Null | live]
; [else-branch: 50 | First:(Second:(Second:(Second:(First:($t@50@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 50 | First:(Second:(Second:(Second:(First:($t@50@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null)))
; [eval] x.next.val == 20
(pop) ; 9
(push) ; 9
; [else-branch: 50 | First:(Second:(Second:(Second:(First:($t@50@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
  $Snap.unit))
; [eval] x.next.val == 20
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@52@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@52@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
      20))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@52@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
      20))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
      $Ref.null))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@52@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
          20)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@52@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
          20)))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
          $Ref.null))))))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | First:(Second:(First:($t@50@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@50@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 6
; [then-branch: 51 | First:(Second:(First:($t@50@01))) != Null | dead]
; [else-branch: 51 | First:(Second:(First:($t@50@01))) == Null | live]
(push) ; 7
; [else-branch: 51 | First:(Second:(First:($t@50@01))) == Null]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@53@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null))
  (=
    (as joined_unfolding@53@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
          $Ref.null))
      (as joined_unfolding@52@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null)
  (= (as joined_unfolding@53@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@52@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
              20)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@52@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
              20)))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))
        (=
          ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
              $Ref.null))))))))
; Joined path conditions
(assert (as joined_unfolding@53@01  Bool))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.val < x.next.val))
(set-option :timeout 0)
(push) ; 4
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | First:(Second:(First:($t@50@01))) != Null | live]
; [else-branch: 52 | First:(Second:(First:($t@50@01))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 52 | First:(Second:(First:($t@50@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.val < x.next.val)
; [eval] x.next != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | First:(Second:(First:($t@50@01))) != Null | live]
; [else-branch: 53 | First:(Second:(First:($t@50@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 53 | First:(Second:(First:($t@50@01))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.val < x.next.val)
(push) ; 8
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@49@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@49@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | First:(Second:(Second:(Second:(First:($t@50@01))))) != Null | live]
; [else-branch: 54 | First:(Second:(Second:(Second:(First:($t@50@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 54 | First:(Second:(Second:(Second:(First:($t@50@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null)))
; [eval] x.val < x.next.val
(pop) ; 9
(push) ; 9
; [else-branch: 54 | First:(Second:(Second:(Second:(First:($t@50@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
  $Snap.unit))
; [eval] x.val < x.next.val
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@54@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@54@01  Bool)
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@50@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@54@01  Bool)
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@50@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
      $Ref.null))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@54@01  Bool)
        (<
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@50@01)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@54@01  Bool)
        (<
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@50@01)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
          $Ref.null))))))
(pop) ; 5
(push) ; 5
; [else-branch: 52 | First:(Second:(First:($t@50@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@50@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.val < x.next.val)
; [eval] x.next != null
(push) ; 6
; [then-branch: 55 | First:(Second:(First:($t@50@01))) != Null | dead]
; [else-branch: 55 | First:(Second:(First:($t@50@01))) == Null | live]
(push) ; 7
; [else-branch: 55 | First:(Second:(First:($t@50@01))) == Null]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@55@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null))
  (=
    (as joined_unfolding@55@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
          $Ref.null))
      (as joined_unfolding@54@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
    $Ref.null)
  (= (as joined_unfolding@55@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@54@01  Bool)
            (<
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@50@01)))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@54@01  Bool)
            (<
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@50@01)))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@50@01)))))
        (=
          ($Snap.second ($Snap.second ($Snap.first $t@50@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01)))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@50@01))))))
              $Ref.null))))))))
; Joined path conditions
(push) ; 4
(assert (not (as joined_unfolding@55@01  Bool)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@55@01  Bool))
; Create MagicWandSnapFunction for wand acc(LL(x), write) && ((unfolding acc(LL(x), write) in x.val == 10) && (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))) --* acc(LL(x), write) && (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.val < x.next.val))
(declare-const mwsf@56@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@56@01 $t@50@01)
    ($Snap.combine ($Snap.first $t@50@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@56@01 $t@50@01))
  :qid |quant-u-6|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@56@01 $t@50@01)
    ($Snap.combine ($Snap.first $t@50@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@56@01 $t@50@01))
  :qid |quant-u-7|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test08 ----------
(declare-const x@57@01 $Ref)
(declare-const x@58@01 $Ref)
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
; inhale acc(LL(x), write) &&
;   ((unfolding acc(LL(x), write) in x.val == 10) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 20)))
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 ($Snap.combine ($Snap.first $t@59@01) ($Snap.second $t@59@01))))
(assert (=
  ($Snap.second $t@59@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@59@01))
    ($Snap.second ($Snap.second $t@59@01)))))
(assert (= ($Snap.first ($Snap.second $t@59@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(push) ; 3
(assert (LL%trigger ($Snap.first $t@59@01) x@58@01))
(assert (=
  ($Snap.first $t@59@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@59@01))
    ($Snap.second ($Snap.first $t@59@01)))))
(assert (not (= x@58@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@59@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@59@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 56 | First:(Second:(First:($t@59@01))) != Null | live]
; [else-branch: 56 | First:(Second:(First:($t@59@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 56 | First:(Second:(First:($t@59@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)))
; [eval] x.val == 10
(pop) ; 4
(push) ; 4
; [else-branch: 56 | First:(Second:(First:($t@59@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@59@01))) $Snap.unit))
; [eval] x.val == 10
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@60@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))
  (=
    (as joined_unfolding@60@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@59@01))) 10))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)
  (=
    (as joined_unfolding@60@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@59@01))) 10))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@59@01) x@58@01)
  (=
    ($Snap.first $t@59@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@59@01))
      ($Snap.second ($Snap.first $t@59@01))))
  (not (= x@58@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@59@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@59@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first $t@59@01) x@58@01)
  (=
    ($Snap.first $t@59@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@59@01))
      ($Snap.second ($Snap.first $t@59@01))))
  (not (= x@58@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@59@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@59@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@59@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))))
(assert (as joined_unfolding@60@01  Bool))
(assert (= ($Snap.second ($Snap.second $t@59@01)) $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | First:(Second:(First:($t@59@01))) != Null | live]
; [else-branch: 57 | First:(Second:(First:($t@59@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 57 | First:(Second:(First:($t@59@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | First:(Second:(First:($t@59@01))) != Null | live]
; [else-branch: 58 | First:(Second:(First:($t@59@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 58 | First:(Second:(First:($t@59@01))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 20)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 59 | First:(Second:(Second:(Second:(First:($t@59@01))))) != Null | live]
; [else-branch: 59 | First:(Second:(Second:(Second:(First:($t@59@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 59 | First:(Second:(Second:(Second:(First:($t@59@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null)))
; [eval] x.next.val == 20
(pop) ; 8
(push) ; 8
; [else-branch: 59 | First:(Second:(Second:(Second:(First:($t@59@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
  $Snap.unit))
; [eval] x.next.val == 20
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@61@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@61@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      20))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@61@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      20))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@61@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
          20)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@61@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
          20)))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
          $Ref.null))))))
(pop) ; 4
(push) ; 4
; [else-branch: 57 | First:(Second:(First:($t@59@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@59@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 5
; [then-branch: 60 | First:(Second:(First:($t@59@01))) != Null | dead]
; [else-branch: 60 | First:(Second:(First:($t@59@01))) == Null | live]
(push) ; 6
; [else-branch: 60 | First:(Second:(First:($t@59@01))) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@62@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))
  (=
    (as joined_unfolding@62@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
          $Ref.null))
      (as joined_unfolding@61@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)
  (= (as joined_unfolding@62@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@61@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
              20)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@61@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
              20)))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))
        (=
          ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
              $Ref.null))))))))
; Joined path conditions
(assert (as joined_unfolding@62@01  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(LL(x), write) &&
;   ((unfolding acc(LL(x), write) in x.val == 10) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
;   acc(LL(x), write) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.val < x.next.val))
(declare-const $t@63@01 $MWSF)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; apply acc(LL(x), write) &&
;   ((unfolding acc(LL(x), write) in x.val == 10) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.next.val == 20))) --*
;   acc(LL(x), write) &&
;   (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.val < x.next.val))
; [eval] (unfolding acc(LL(x), write) in x.val == 10)
(set-option :timeout 0)
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 61 | First:(Second:(First:($t@59@01))) != Null | live]
; [else-branch: 61 | First:(Second:(First:($t@59@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 61 | First:(Second:(First:($t@59@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)))
; [eval] x.val == 10
(pop) ; 4
(push) ; 4
; [else-branch: 61 | First:(Second:(First:($t@59@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@59@01))) $Snap.unit))
; [eval] x.val == 10
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@64@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))
  (=
    (as joined_unfolding@64@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@59@01))) 10))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)
  (=
    (as joined_unfolding@64@01  Bool)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@59@01))) 10))))
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (as joined_unfolding@64@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@64@01  Bool))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20))
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 62 | First:(Second:(First:($t@59@01))) != Null | live]
; [else-branch: 62 | First:(Second:(First:($t@59@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 62 | First:(Second:(First:($t@59@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 63 | First:(Second:(First:($t@59@01))) != Null | live]
; [else-branch: 63 | First:(Second:(First:($t@59@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 63 | First:(Second:(First:($t@59@01))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.next.val == 20)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 64 | First:(Second:(Second:(Second:(First:($t@59@01))))) != Null | live]
; [else-branch: 64 | First:(Second:(Second:(Second:(First:($t@59@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 64 | First:(Second:(Second:(Second:(First:($t@59@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null)))
; [eval] x.next.val == 20
(pop) ; 8
(push) ; 8
; [else-branch: 64 | First:(Second:(Second:(Second:(First:($t@59@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
  $Snap.unit))
; [eval] x.next.val == 20
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@65@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@65@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      20))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@65@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      20))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@65@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
          20)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@65@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
          20)))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
          $Ref.null))))))
(pop) ; 4
(push) ; 4
; [else-branch: 62 | First:(Second:(First:($t@59@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@59@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.next.val == 20)
; [eval] x.next != null
(push) ; 5
; [then-branch: 65 | First:(Second:(First:($t@59@01))) != Null | dead]
; [else-branch: 65 | First:(Second:(First:($t@59@01))) == Null | live]
(push) ; 6
; [else-branch: 65 | First:(Second:(First:($t@59@01))) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@66@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))
  (=
    (as joined_unfolding@66@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
          $Ref.null))
      (as joined_unfolding@65@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
    $Ref.null)
  (= (as joined_unfolding@66@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@65@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
              20)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@65@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
              20)))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first $t@59@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@59@01)))))
        (=
          ($Snap.second ($Snap.second ($Snap.first $t@59@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01)))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@59@01))))))
              $Ref.null))))))))
; Joined path conditions
(push) ; 3
(assert (not (as joined_unfolding@66@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@66@01  Bool))
(assert (=
  (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))
  ($Snap.combine
    ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))
    ($Snap.second (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
(assert (=
  ($Snap.second (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))
  $Snap.unit))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.val < x.next.val))
(push) ; 3
(assert (LL%trigger ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
  ($Snap.first $t@59@01)
  ($Snap.combine $Snap.unit $Snap.unit)))) x@58@01))
(assert (=
  ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))
  ($Snap.combine
    ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
(assert (=
  ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 66 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null | live]
; [else-branch: 66 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 66 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.val < x.next.val)
; [eval] x.next != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 67 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null | live]
; [else-branch: 67 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 67 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.val < x.next.val)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
  ($Snap.first $t@59@01)
  ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
  ($Snap.first $t@59@01)
  ($Snap.combine $Snap.unit $Snap.unit)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 68 | First:(Second:(Second:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))))) != Null | live]
; [else-branch: 68 | First:(Second:(Second:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 68 | First:(Second:(Second:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null)))
; [eval] x.val < x.next.val
(pop) ; 8
(push) ; 8
; [else-branch: 68 | First:(Second:(Second:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Snap.unit))
; [eval] x.val < x.next.val
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@67@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
      $Ref.null))
  (=
    (as joined_unfolding@67@01  Bool)
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null)
  (=
    (as joined_unfolding@67@01  Bool)
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))
          $Ref.null))
      (=
        (as joined_unfolding@67@01  Bool)
        (<
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
        $Ref.null)
      (=
        (as joined_unfolding@67@01  Bool)
        (<
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))
          $Ref.null))))))
(pop) ; 4
(push) ; 4
; [else-branch: 66 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.val < x.next.val)
; [eval] x.next != null
(push) ; 5
; [then-branch: 69 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null | dead]
; [else-branch: 69 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null | live]
(push) ; 6
; [else-branch: 69 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@68@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Ref.null))
  (=
    (as joined_unfolding@68@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          $Ref.null))
      (as joined_unfolding@67@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    $Ref.null)
  (= (as joined_unfolding@68@01  Bool) true)))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))) x@58@01)
  (=
    ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))
    ($Snap.combine
      ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))
              $Ref.null))
          (=
            (as joined_unfolding@67@01  Bool)
            (<
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
            $Ref.null)
          (=
            (as joined_unfolding@67@01  Bool)
            (<
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))
              $Ref.null))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))) x@58@01)
  (=
    ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))
    ($Snap.combine
      ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))
      ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
  (=
    ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Ref.null))))
(assert (as joined_unfolding@68@01  Bool))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert (unfolding acc(LL(x), write) in
;     x.next != null ==>
;     (unfolding acc(LL(x.next), write) in x.val <= x.next.val))
; [eval] (unfolding acc(LL(x), write) in x.next != null ==> (unfolding acc(LL(x.next), write) in x.val <= x.next.val))
(set-option :timeout 0)
(push) ; 3
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 70 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null | live]
; [else-branch: 70 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 70 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    $Ref.null)))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.val <= x.next.val)
; [eval] x.next != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 71 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null | live]
; [else-branch: 71 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 71 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null]
; [eval] (unfolding acc(LL(x.next), write) in x.val <= x.next.val)
(push) ; 7
(assert (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
  ($Snap.first $t@59@01)
  ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
  ($Snap.first $t@59@01)
  ($Snap.combine $Snap.unit $Snap.unit)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  x@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 72 | First:(Second:(Second:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))))) != Null | live]
; [else-branch: 72 | First:(Second:(Second:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 72 | First:(Second:(Second:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null)))
; [eval] x.val <= x.next.val
(pop) ; 8
(push) ; 8
; [else-branch: 72 | First:(Second:(Second:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  $Snap.unit))
; [eval] x.val <= x.next.val
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@69@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
      $Ref.null))
  (=
    (as joined_unfolding@69@01  Bool)
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null)
  (=
    (as joined_unfolding@69@01  Bool)
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))))
; Joined path conditions
(assert (and
  (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))))
      $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))
          $Ref.null))
      (=
        (as joined_unfolding@69@01  Bool)
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
        $Ref.null)
      (=
        (as joined_unfolding@69@01  Bool)
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))))
    (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))))
          $Ref.null))))))
(pop) ; 4
(push) ; 4
; [else-branch: 70 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
    ($Snap.first $t@59@01)
    ($Snap.combine $Snap.unit $Snap.unit))))))
  $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LL(x.next), write) in x.val <= x.next.val)
; [eval] x.next != null
(push) ; 5
; [then-branch: 73 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) != Null | dead]
; [else-branch: 73 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null | live]
(push) ; 6
; [else-branch: 73 | First:(Second:(First:($t@63@01[(First:($t@59@01), (_, _))]))) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@70@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Ref.null))
  (=
    (as joined_unfolding@70@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          $Ref.null))
      (as joined_unfolding@69@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
      ($Snap.first $t@59@01)
      ($Snap.combine $Snap.unit $Snap.unit)))))))
    $Ref.null)
  (= (as joined_unfolding@70@01  Bool) true)))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
        ($Snap.first $t@59@01)
        ($Snap.combine $Snap.unit $Snap.unit)))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))
              $Ref.null))
          (=
            (as joined_unfolding@69@01  Bool)
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
            $Ref.null)
          (=
            (as joined_unfolding@69@01  Bool)
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))))
        (LL%trigger ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
          ($Snap.first $t@59@01)
          ($Snap.combine $Snap.unit $Snap.unit))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
            ($Snap.first $t@59@01)
            ($Snap.combine $Snap.unit $Snap.unit)))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit))))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
              ($Snap.first $t@59@01)
              ($Snap.combine $Snap.unit $Snap.unit)))))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply $t@63@01 ($Snap.combine
                ($Snap.first $t@59@01)
                ($Snap.combine $Snap.unit $Snap.unit)))))))))
              $Ref.null))))))))
; Joined path conditions
(push) ; 3
(assert (not (as joined_unfolding@70@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@70@01  Bool))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const b@71@01 Bool)
(declare-const b@72@01 Bool)
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
; inhale acc(P(), write)
(declare-const $t@73@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* acc(Q(b), write) {
;   fold acc(Q(b), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [exec]
; fold acc(Q(b), write)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@72@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@72@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 74 | b@72@01 | live]
; [else-branch: 74 | !(b@72@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 74 | b@72@01]
(assert b@72@01)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(assert (Q%trigger $t@73@01 b@72@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(Q(b), write)
(declare-const mwsf@75@01 $MWSF)
(assert (forall (($t@74@01 $Snap)) (!
  (= (MWSF_apply mwsf@75@01 $t@74@01) $t@73@01)
  :pattern ((MWSF_apply mwsf@75@01 $t@74@01))
  :qid |quant-u-8|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 74 | !(b@72@01)]
(assert (not b@72@01))
(assert (Q%trigger $Snap.unit b@72@01))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(Q(b), write)
(declare-const mwsf@76@01 $MWSF)
(assert (forall (($t@74@01 $Snap)) (!
  (= (MWSF_apply mwsf@76@01 $t@74@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@76@01 $t@74@01))
  :qid |quant-u-10|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert b@72@01)
(assert (forall (($t@74@01 $Snap)) (!
  (= (MWSF_apply mwsf@75@01 $t@74@01) $t@73@01)
  :pattern ((MWSF_apply mwsf@75@01 $t@74@01))
  :qid |quant-u-9|)))
(assert true)
; [exec]
; assert !b ==> acc(P(), write)
; [eval] !b
; [then-branch: 75 | !(b@72@01) | dead]
; [else-branch: 75 | b@72@01 | live]
(push) ; 4
; [else-branch: 75 | b@72@01]
; [exec]
; apply true --* acc(Q(b), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(Q(b), write)
; [exec]
; assert acc(P(), write)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@77@01 $Ref)
(declare-const x@78@01 $Ref)
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
; package acc(LLC(x, 0), write) --*
; acc(LLC(x, 0), write) &&
; (unfolding acc(LLC(x, 0), write) in
;   x.next != null ==>
;   (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1)) {
; }
(push) ; 3
(declare-const $t@79@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] (unfolding acc(LLC(x, 0), write) in x.next != null ==> (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1))
(set-option :timeout 0)
(push) ; 4
(assert (LLC%trigger $t@79@01 x@78@01 0))
(assert (= $t@79@01 ($Snap.combine ($Snap.first $t@79@01) ($Snap.second $t@79@01))))
(assert (not (= x@78@01 $Ref.null)))
(assert (=
  ($Snap.second $t@79@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@79@01))
    ($Snap.second ($Snap.second $t@79@01)))))
(assert (= ($Snap.first ($Snap.second $t@79@01)) $Snap.unit))
; [eval] x.val == i
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@79@01)) 0))
(assert (=
  ($Snap.second ($Snap.second $t@79@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@79@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 76 | First:(Second:(Second:($t@79@01))) != Null | live]
; [else-branch: 76 | First:(Second:(Second:($t@79@01))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 76 | First:(Second:(Second:($t@79@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
    $Ref.null)))
; [eval] i + 1
; [eval] x.next != null ==> (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1)
; [eval] x.next != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 77 | First:(Second:(Second:($t@79@01))) != Null | live]
; [else-branch: 77 | First:(Second:(Second:($t@79@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 77 | First:(Second:(Second:($t@79@01))) != Null]
; [eval] (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1)
(push) ; 8
(assert (LLC%trigger ($Snap.second ($Snap.second ($Snap.second $t@79@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01)))) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@79@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@78@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
  $Snap.unit))
; [eval] x.val == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@78@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 78 | First:(Second:(Second:(Second:(Second:(Second:($t@79@01)))))) != Null | live]
; [else-branch: 78 | First:(Second:(Second:(Second:(Second:(Second:($t@79@01)))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 78 | First:(Second:(Second:(Second:(Second:(Second:($t@79@01)))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
    $Ref.null)))
; [eval] i + 1
; [eval] x.next.val == 1
(pop) ; 9
(push) ; 9
; [else-branch: 78 | First:(Second:(Second:(Second:(Second:(Second:($t@79@01)))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
  $Snap.unit))
; [eval] x.next.val == 1
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@80@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
      $Ref.null))
  (=
    (as joined_unfolding@80@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
      1))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
    $Ref.null)
  (=
    (as joined_unfolding@80@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
      1))))
; Joined path conditions
(assert (and
  (LLC%trigger ($Snap.second ($Snap.second ($Snap.second $t@79@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01)))) 1)
  (=
    ($Snap.second ($Snap.second ($Snap.second $t@79@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
    1)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))))))
; Joined path conditions
(assert (and
  (LLC%trigger ($Snap.second ($Snap.second ($Snap.second $t@79@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01)))) 1)
  (=
    ($Snap.second ($Snap.second ($Snap.second $t@79@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
    1)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
      $Ref.null))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
          $Ref.null))
      (=
        (as joined_unfolding@80@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
          1)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
        $Ref.null)
      (=
        (as joined_unfolding@80@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
          1)))
    (LLC%trigger ($Snap.second ($Snap.second ($Snap.second $t@79@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01)))) 1)
    (=
      ($Snap.second ($Snap.second ($Snap.second $t@79@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
      1)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
          $Ref.null))))))
(pop) ; 5
(push) ; 5
; [else-branch: 76 | First:(Second:(Second:($t@79@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@79@01))) $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1)
; [eval] x.next != null
(push) ; 6
; [then-branch: 79 | First:(Second:(Second:($t@79@01))) != Null | dead]
; [else-branch: 79 | First:(Second:(Second:($t@79@01))) == Null | live]
(push) ; 7
; [else-branch: 79 | First:(Second:(Second:($t@79@01))) == Null]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@81@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
      $Ref.null))
  (=
    (as joined_unfolding@81@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
          $Ref.null))
      (as joined_unfolding@80@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
    $Ref.null)
  (= (as joined_unfolding@81@01  Bool) true)))
; Joined path conditions
(assert (and
  (LLC%trigger $t@79@01 x@78@01 0)
  (= $t@79@01 ($Snap.combine ($Snap.first $t@79@01) ($Snap.second $t@79@01)))
  (not (= x@78@01 $Ref.null))
  (=
    ($Snap.second $t@79@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@79@01))
      ($Snap.second ($Snap.second $t@79@01))))
  (= ($Snap.first ($Snap.second $t@79@01)) $Snap.unit)
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@79@01)) 0)
  (=
    ($Snap.second ($Snap.second $t@79@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@79@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
              $Ref.null))
          (=
            (as joined_unfolding@80@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
              1)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
            $Ref.null)
          (=
            (as joined_unfolding@80@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
              1)))
        (LLC%trigger ($Snap.second ($Snap.second ($Snap.second $t@79@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01)))) 1)
        (=
          ($Snap.second ($Snap.second ($Snap.second $t@79@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
          $Snap.unit)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
          1)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
              $Ref.null))))))))
; Joined path conditions
(assert (and
  (LLC%trigger $t@79@01 x@78@01 0)
  (= $t@79@01 ($Snap.combine ($Snap.first $t@79@01) ($Snap.second $t@79@01)))
  (not (= x@78@01 $Ref.null))
  (=
    ($Snap.second $t@79@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@79@01))
      ($Snap.second ($Snap.second $t@79@01))))
  (= ($Snap.first ($Snap.second $t@79@01)) $Snap.unit)
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@79@01)) 0)
  (=
    ($Snap.second ($Snap.second $t@79@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@79@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.second $t@79@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@79@01))))
      $Ref.null))))
(push) ; 4
(assert (not (as joined_unfolding@81@01  Bool)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@81@01  Bool))
; Create MagicWandSnapFunction for wand acc(LLC(x, 0), write) --* acc(LLC(x, 0), write) && (unfolding acc(LLC(x, 0), write) in x.next != null ==> (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1))
(declare-const mwsf@82@01 $MWSF)
(assert (forall (($t@79@01 $Snap)) (!
  (= (MWSF_apply mwsf@82@01 $t@79@01) ($Snap.combine $t@79@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@82@01 $t@79@01))
  :qid |quant-u-12|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@79@01 $Snap)) (!
  (= (MWSF_apply mwsf@82@01 $t@79@01) ($Snap.combine $t@79@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@82@01 $t@79@01))
  :qid |quant-u-13|)))
(assert true)
; [exec]
; inhale acc(LLC(x, 0), write)
(declare-const $t@83@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply acc(LLC(x, 0), write) --*
;   acc(LLC(x, 0), write) &&
;   (unfolding acc(LLC(x, 0), write) in
;     x.next != null ==>
;     (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1))
(assert (=
  (MWSF_apply mwsf@82@01 $t@83@01)
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))
    ($Snap.second (MWSF_apply mwsf@82@01 $t@83@01)))))
(assert (= ($Snap.second (MWSF_apply mwsf@82@01 $t@83@01)) $Snap.unit))
; [eval] (unfolding acc(LLC(x, 0), write) in x.next != null ==> (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1))
(set-option :timeout 0)
(push) ; 4
(assert (LLC%trigger ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)) x@78@01 0))
(assert (=
  ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))
  ($Snap.combine
    ($Snap.first ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))
    ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
(assert (not (= x@78@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
    ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
  $Snap.unit))
; [eval] x.val == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 80 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) != Null | live]
; [else-branch: 80 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 80 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
    $Ref.null)))
; [eval] i + 1
; [eval] x.next != null ==> (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1)
; [eval] x.next != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 81 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) != Null | live]
; [else-branch: 81 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 81 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) != Null]
; [eval] (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1)
(push) ; 8
(assert (LLC%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@78@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
  $Snap.unit))
; [eval] x.val == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  x@78@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 82 | First:(Second:(Second:(Second:(Second:(Second:(First:(mwsf@82@01[$t@83@01]))))))) != Null | live]
; [else-branch: 82 | First:(Second:(Second:(Second:(Second:(Second:(First:(mwsf@82@01[$t@83@01]))))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 82 | First:(Second:(Second:(Second:(Second:(Second:(First:(mwsf@82@01[$t@83@01]))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
    $Ref.null)))
; [eval] i + 1
; [eval] x.next.val == 1
(pop) ; 9
(push) ; 9
; [else-branch: 82 | First:(Second:(Second:(Second:(Second:(Second:(First:(mwsf@82@01[$t@83@01]))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
  $Snap.unit))
; [eval] x.next.val == 1
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@84@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
      $Ref.null))
  (=
    (as joined_unfolding@84@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
      1))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
    $Ref.null)
  (=
    (as joined_unfolding@84@01  Bool)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
      1))))
; Joined path conditions
(assert (and
  (LLC%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))) 1)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
    1)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))))))
; Joined path conditions
(assert (and
  (LLC%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))) 1)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
    1)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
      $Ref.null))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
          $Ref.null))
      (=
        (as joined_unfolding@84@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
          1)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
        $Ref.null)
      (=
        (as joined_unfolding@84@01  Bool)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
          1)))
    (LLC%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))) 1)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
      1)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
          $Ref.null))))))
(pop) ; 5
(push) ; 5
; [else-branch: 80 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
  $Snap.unit))
; [eval] x.next != null ==> (unfolding acc(LLC(x.next, 1), write) in x.next.val == 1)
; [eval] x.next != null
(push) ; 6
; [then-branch: 83 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) != Null | dead]
; [else-branch: 83 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) == Null | live]
(push) ; 7
; [else-branch: 83 | First:(Second:(Second:(First:(mwsf@82@01[$t@83@01])))) == Null]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@85@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@85@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
          $Ref.null))
      (as joined_unfolding@84@01  Bool)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
    $Ref.null)
  (= (as joined_unfolding@85@01  Bool) true)))
; Joined path conditions
(assert (and
  (LLC%trigger ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)) x@78@01 0)
  (=
    ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))
    ($Snap.combine
      ($Snap.first ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))
      ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
  (not (= x@78@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
      ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
  (=
    ($Snap.first ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
    0)
  (=
    ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
              $Ref.null))
          (=
            (as joined_unfolding@84@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
              1)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
            $Ref.null)
          (=
            (as joined_unfolding@84@01  Bool)
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
              1)))
        (LLC%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))) 1)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
          $Snap.unit)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
          1)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
              $Ref.null))))))))
; Joined path conditions
(assert (and
  (LLC%trigger ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)) x@78@01 0)
  (=
    ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))
    ($Snap.combine
      ($Snap.first ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))
      ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
  (not (= x@78@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
      ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
  (=
    ($Snap.first ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
    0)
  (=
    ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first (MWSF_apply mwsf@82@01 $t@83@01))))))
      $Ref.null))))
(assert (as joined_unfolding@85@01  Bool))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(LLC(x, 0), write)
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
