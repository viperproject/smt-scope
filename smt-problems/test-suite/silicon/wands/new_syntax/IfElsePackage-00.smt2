(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:33:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/new_syntax/IfElsePackage.vpr
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
(declare-fun Cell%trigger ($Snap $Ref) Bool)
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
; ---------- test0 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
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
; package acc(Cell(x), write) --*
; acc(x.f, write) && (acc(x.b, write) && (x.b ? acc(x.f.b, write) : false)) {
;   unfold acc(Cell(x), write)
;   if (x.b) {
;     unfold acc(Cell(x.f), write)
;   } else {
;     inhale false}
;   assert x.b ==> acc(x.f.b, write)
; }
(push) ; 3
(declare-const $t@2@01 $Snap)
; [exec]
; unfold acc(Cell(x), write)
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
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@2@01) | live]
; [else-branch: 0 | !(First:($t@2@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:($t@2@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Cell%trigger $t@2@01 x@1@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:($t@2@01) | live]
; [else-branch: 1 | !(First:($t@2@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:($t@2@01)]
; [exec]
; unfold acc(Cell(x.f), write)
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
(assert (=
  ($Snap.second ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@2@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(Second:($t@2@01))) | live]
; [else-branch: 2 | !(First:(Second:(Second:($t@2@01)))) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | First:(Second:(Second:($t@2@01)))]
(assert ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Cell%trigger ($Snap.second ($Snap.second $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert x.b ==> acc(x.f.b, write)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:($t@2@01) | live]
; [else-branch: 3 | !(First:($t@2@01)) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 3 | First:($t@2@01)]
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:($t@2@01) | live]
; [else-branch: 4 | !(First:($t@2@01)) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 4 | First:($t@2@01)]
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand acc(Cell(x), write) --* acc(x.f, write) && (acc(x.b, write) && (x.b ? acc(x.f.b, write) : false))
(declare-const mwsf@3@01 $MWSF)
(assert (forall (($t@2@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@3@01 $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@2@01))
      ($Snap.combine
        ($Snap.first $t@2@01)
        ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  :pattern ((MWSF_apply mwsf@3@01 $t@2@01))
  :qid |quant-u-0|)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 2 | !(First:(Second:(Second:($t@2@01))))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Cell%trigger ($Snap.second ($Snap.second $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert x.b ==> acc(x.f.b, write)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:($t@2@01) | live]
; [else-branch: 5 | !(First:($t@2@01)) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | First:($t@2@01)]
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:($t@2@01) | live]
; [else-branch: 6 | !(First:($t@2@01)) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 6 | First:($t@2@01)]
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand acc(Cell(x), write) --* acc(x.f, write) && (acc(x.b, write) && (x.b ? acc(x.f.b, write) : false))
(declare-const mwsf@4@01 $MWSF)
(assert (forall (($t@2@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@4@01 $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@2@01))
      ($Snap.combine
        ($Snap.first $t@2@01)
        ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  :pattern ((MWSF_apply mwsf@4@01 $t@2@01))
  :qid |quant-u-2|)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !x.b
; [then-branch: 7 | !(First:($t@2@01)) | dead]
; [else-branch: 7 | First:($t@2@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | First:($t@2@01)]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(First:($t@2@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))))
(assert (= ($Snap.second ($Snap.second $t@2@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Cell%trigger $t@2@01 x@1@01))
; [then-branch: 8 | First:($t@2@01) | dead]
; [else-branch: 8 | !(First:($t@2@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 8 | !(First:($t@2@01))]
(pop) ; 5
; [eval] !x.b
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | !(First:($t@2@01)) | live]
; [else-branch: 9 | First:($t@2@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | !(First:($t@2@01))]
; [exec]
; inhale false
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (and
  ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
(assert (forall (($t@2@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@3@01 $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@2@01))
      ($Snap.combine
        ($Snap.first $t@2@01)
        ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  :pattern ((MWSF_apply mwsf@3@01 $t@2@01))
  :qid |quant-u-1|)))
(assert true)
; [exec]
; exhale acc(Cell(x), write) --*
;   acc(x.f, write) && (acc(x.b, write) && (x.b ? acc(x.f.b, write) : false))
(pop) ; 3
(push) ; 3
(assert (and
  ($SortWrappers.$SnapToBool ($Snap.first $t@2@01))
  (not
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second ($Snap.second $t@2@01)))))))
(assert (forall (($t@2@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@4@01 $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@2@01))
      ($Snap.combine
        ($Snap.first $t@2@01)
        ($Snap.first ($Snap.second ($Snap.second $t@2@01))))))
  :pattern ((MWSF_apply mwsf@4@01 $t@2@01))
  :qid |quant-u-3|)))
(assert true)
; [exec]
; exhale acc(Cell(x), write) --*
;   acc(x.f, write) && (acc(x.b, write) && (x.b ? acc(x.f.b, write) : false))
(pop) ; 3
(pop) ; 2
(pop) ; 1
