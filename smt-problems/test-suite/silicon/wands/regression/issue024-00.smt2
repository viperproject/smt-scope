(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:36:03
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/issue024.vpr
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
(declare-fun compare%trigger ($Snap $Ref) Bool)
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
; ---------- incompleteness_01 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 Bool)
(pop) ; 2
(push) ; 2
; [exec]
; assert x.f == old(x.f)
; [eval] x.f == old(x.f)
; [eval] old(x.f)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert x.f == old(x.f)
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToBool (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@2@01)) ($Snap.first $t@2@01)))
  ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
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
; [eval] x.f == old(x.f)
; [eval] old(x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToBool (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@2@01)) ($Snap.first $t@2@01)))
  ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
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
; [eval] x.f == old(x.f)
; [eval] old(x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToBool (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@2@01)) ($Snap.first $t@2@01)))
  ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
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
; [eval] x.f == old(x.f)
; [eval] old(x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToBool (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@2@01)) ($Snap.first $t@2@01)))
  ($SortWrappers.$SnapToBool ($Snap.first $t@2@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- comparison ----------
(declare-const x@4@01 $Ref)
(declare-const x@5@01 $Ref)
(push) ; 1
(declare-const $t@6@01 Bool)
(assert (not (= x@5@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 Bool)
(pop) ; 2
(push) ; 2
; [exec]
; assert x.f == old(x.f)
; [eval] x.f == old(x.f)
; [eval] old(x.f)
; [exec]
; fold acc(compare(x), write)
(assert (compare%trigger ($SortWrappers.BoolTo$Snap $t@6@01) x@5@01))
; [exec]
; unfold acc(compare(x), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert x.f == old(x.f)
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(pop) ; 2
(pop) ; 1
; ---------- incompleteness_02 ----------
(declare-const x@8@01 $Ref)
(declare-const x@9@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (not (= x@9@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write)) {
; }
(push) ; 3
(declare-const $t@11@01 $Snap)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool $t@11@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | $t@11@01 | live]
; [else-branch: 0 | !($t@11@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | $t@11@01]
(assert ($SortWrappers.$SnapToBool $t@11@01))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write))
(declare-const mwsf@12@01 $MWSF)
(assert (forall (($t@11@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@12@01 $t@11@01)
    ($Snap.combine $t@11@01 ($Snap.second $t@10@01)))
  :pattern ((MWSF_apply mwsf@12@01 $t@11@01))
  :qid |quant-u-0|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 0 | !($t@11@01)]
(assert (not ($SortWrappers.$SnapToBool $t@11@01)))
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write))
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@11@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@11@01) ($Snap.combine $t@11@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@13@01 $t@11@01))
  :qid |quant-u-2|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert ($SortWrappers.$SnapToBool $t@11@01))
(assert (forall (($t@11@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@12@01 $t@11@01)
    ($Snap.combine $t@11@01 ($Snap.second $t@10@01)))
  :pattern ((MWSF_apply mwsf@12@01 $t@11@01))
  :qid |quant-u-1|)))
(assert true)
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:($t@10@01) | live]
; [else-branch: 1 | !(First:($t@10@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:($t@10@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@10@01)))
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write))
(assert (=
  (MWSF_apply mwsf@12@01 ($Snap.first $t@10@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@12@01 ($Snap.first $t@10@01)))
    ($Snap.second (MWSF_apply mwsf@12@01 ($Snap.first $t@10@01))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@12@01 ($Snap.first $t@10@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@12@01 ($Snap.first $t@10@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(mwsf@12@01[First:($t@10@01)]) | live]
; [else-branch: 2 | !(First:(mwsf@12@01[First:($t@10@01)])) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(mwsf@12@01[First:($t@10@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@12@01 ($Snap.first $t@10@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(x.g, write)
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | !(First:($t@10@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01))))
(pop) ; 4
; [eval] !x.f
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(First:($t@10@01)) | live]
; [else-branch: 3 | First:($t@10@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | !(First:($t@10@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | First:($t@10@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@10@01)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (not ($SortWrappers.$SnapToBool $t@11@01)))
(assert (forall (($t@11@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@11@01) ($Snap.combine $t@11@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@13@01 $t@11@01))
  :qid |quant-u-3|)))
(assert true)
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:($t@10@01) | live]
; [else-branch: 4 | !(First:($t@10@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:($t@10@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@10@01)))
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write))
(assert (=
  (MWSF_apply mwsf@13@01 ($Snap.first $t@10@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@13@01 ($Snap.first $t@10@01)))
    ($Snap.second (MWSF_apply mwsf@13@01 ($Snap.first $t@10@01))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@13@01 ($Snap.first $t@10@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@13@01 ($Snap.first $t@10@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(mwsf@13@01[First:($t@10@01)]) | live]
; [else-branch: 5 | !(First:(mwsf@13@01[First:($t@10@01)])) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | First:(mwsf@13@01[First:($t@10@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@13@01 ($Snap.first $t@10@01)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second $t@10@01))
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@13@01 ($Snap.first $t@10@01))))))
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [exec]
; assert acc(x.g, write)
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | !(First:($t@10@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01))))
(pop) ; 4
; [eval] !x.f
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(First:($t@10@01)) | live]
; [else-branch: 6 | First:($t@10@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | !(First:($t@10@01))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@10@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | First:($t@10@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@10@01)))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
