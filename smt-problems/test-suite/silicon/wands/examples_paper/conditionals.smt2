(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:33:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/examples_paper/conditionals.vpr
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
; ---------- conditionals01 ----------
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
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write)) {
; }
(push) ; 3
(declare-const $t@3@01 $Snap)
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
(assert (not (not ($SortWrappers.$SnapToBool $t@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | $t@3@01 | live]
; [else-branch: 0 | !($t@3@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | $t@3@01]
(assert ($SortWrappers.$SnapToBool $t@3@01))
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
(declare-const mwsf@4@01 $MWSF)
(assert (forall (($t@3@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@4@01 $t@3@01)
    ($Snap.combine $t@3@01 ($Snap.second $t@2@01)))
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-0|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 0 | !($t@3@01)]
(assert (not ($SortWrappers.$SnapToBool $t@3@01)))
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write))
(declare-const mwsf@5@01 $MWSF)
(assert (forall (($t@3@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@3@01) ($Snap.combine $t@3@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@5@01 $t@3@01))
  :qid |quant-u-2|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert ($SortWrappers.$SnapToBool $t@3@01))
(assert (forall (($t@3@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@4@01 $t@3@01)
    ($Snap.combine $t@3@01 ($Snap.second $t@2@01)))
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-1|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write))
(assert (=
  (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))
    ($Snap.second (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(mwsf@4@01[First:($t@2@01)]) | live]
; [else-branch: 1 | !(First:(mwsf@4@01[First:($t@2@01)])) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(mwsf@4@01[First:($t@2@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(mwsf@4@01[First:($t@2@01)]) | live]
; [else-branch: 2 | !(First:(mwsf@4@01[First:($t@2@01)])) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(mwsf@4@01[First:($t@2@01)])]
; [exec]
; assert acc(x.g, write)
(pop) ; 5
; [eval] !x.f
; [then-branch: 3 | !(First:(mwsf@4@01[First:($t@2@01)])) | dead]
; [else-branch: 3 | First:(mwsf@4@01[First:($t@2@01)]) | live]
(push) ; 5
; [else-branch: 3 | First:(mwsf@4@01[First:($t@2@01)])]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(First:(mwsf@4@01[First:($t@2@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))
(assert (= ($Snap.second (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [then-branch: 4 | First:(mwsf@4@01[First:($t@2@01)]) | dead]
; [else-branch: 4 | !(First:(mwsf@4@01[First:($t@2@01)])) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | !(First:(mwsf@4@01[First:($t@2@01)]))]
(pop) ; 5
; [eval] !x.f
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(First:(mwsf@4@01[First:($t@2@01)])) | live]
; [else-branch: 5 | First:(mwsf@4@01[First:($t@2@01)]) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(First:(mwsf@4@01[First:($t@2@01)]))]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (not ($SortWrappers.$SnapToBool $t@3@01)))
(assert (forall (($t@3@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@3@01) ($Snap.combine $t@3@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@5@01 $t@3@01))
  :qid |quant-u-3|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && (x.f ==> acc(x.g, write))
(assert (=
  (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01)))
    ($Snap.second (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(mwsf@5@01[First:($t@2@01)]) | live]
; [else-branch: 6 | !(First:(mwsf@5@01[First:($t@2@01)])) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | First:(mwsf@5@01[First:($t@2@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))))
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(mwsf@5@01[First:($t@2@01)]) | dead]
; [else-branch: 7 | !(First:(mwsf@5@01[First:($t@2@01)])) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | !(First:(mwsf@5@01[First:($t@2@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))))
(pop) ; 5
; [eval] !x.f
; [then-branch: 8 | !(First:(mwsf@5@01[First:($t@2@01)])) | dead]
; [else-branch: 8 | First:(mwsf@5@01[First:($t@2@01)]) | live]
(push) ; 5
; [else-branch: 8 | First:(mwsf@5@01[First:($t@2@01)])]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(First:(mwsf@5@01[First:($t@2@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))))
(assert (= ($Snap.second (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [then-branch: 9 | First:(mwsf@5@01[First:($t@2@01)]) | dead]
; [else-branch: 9 | !(First:(mwsf@5@01[First:($t@2@01)])) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | !(First:(mwsf@5@01[First:($t@2@01)]))]
(pop) ; 5
; [eval] !x.f
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | !(First:(mwsf@5@01[First:($t@2@01)])) | live]
; [else-branch: 10 | First:(mwsf@5@01[First:($t@2@01)]) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | !(First:(mwsf@5@01[First:($t@2@01)]))]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- conditionals02 ----------
(declare-const x@6@01 $Ref)
(declare-const x@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (not (= x@7@01 $Ref.null)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --*
; acc(x.f, write) && (x.f ? acc(x.g, write) : acc(x.h, write)) {
; }
(push) ; 3
(declare-const $t@9@01 $Snap)
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
(assert (not (not ($SortWrappers.$SnapToBool $t@9@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@9@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | $t@9@01 | live]
; [else-branch: 11 | !($t@9@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | $t@9@01]
(assert ($SortWrappers.$SnapToBool $t@9@01))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (x.f ? acc(x.g, write) : acc(x.h, write))
(declare-const mwsf@10@01 $MWSF)
(assert (forall (($t@9@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@10@01 $t@9@01)
    ($Snap.combine $t@9@01 ($Snap.first ($Snap.second $t@8@01))))
  :pattern ((MWSF_apply mwsf@10@01 $t@9@01))
  :qid |quant-u-4|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !($t@9@01)]
(assert (not ($SortWrappers.$SnapToBool $t@9@01)))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (x.f ? acc(x.g, write) : acc(x.h, write))
(declare-const mwsf@11@01 $MWSF)
(assert (forall (($t@9@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@11@01 $t@9@01)
    ($Snap.combine $t@9@01 ($Snap.second ($Snap.second $t@8@01))))
  :pattern ((MWSF_apply mwsf@11@01 $t@9@01))
  :qid |quant-u-6|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert ($SortWrappers.$SnapToBool $t@9@01))
(assert (forall (($t@9@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@10@01 $t@9@01)
    ($Snap.combine $t@9@01 ($Snap.first ($Snap.second $t@8@01))))
  :pattern ((MWSF_apply mwsf@10@01 $t@9@01))
  :qid |quant-u-5|)))
(assert true)
; [exec]
; apply acc(x.f, write) --*
;   acc(x.f, write) && (x.f ? acc(x.g, write) : acc(x.h, write))
(assert (=
  (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))
    ($Snap.second (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(mwsf@10@01[First:($t@8@01)]) | live]
; [else-branch: 12 | !(First:(mwsf@10@01[First:($t@8@01)])) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | First:(mwsf@10@01[First:($t@8@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(x.f, write) && (acc(x.g, write) && acc(x.h, write))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 12 | !(First:(mwsf@10@01[First:($t@8@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.second $t@8@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.second (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [exec]
; assert acc(x.f, write) && (acc(x.g, write) && acc(x.h, write))
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (not ($SortWrappers.$SnapToBool $t@9@01)))
(assert (forall (($t@9@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@11@01 $t@9@01)
    ($Snap.combine $t@9@01 ($Snap.second ($Snap.second $t@8@01))))
  :pattern ((MWSF_apply mwsf@11@01 $t@9@01))
  :qid |quant-u-7|)))
(assert true)
; [exec]
; apply acc(x.f, write) --*
;   acc(x.f, write) && (x.f ? acc(x.g, write) : acc(x.h, write))
(assert (=
  (MWSF_apply mwsf@11@01 ($Snap.first $t@8@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@11@01 ($Snap.first $t@8@01)))
    ($Snap.second (MWSF_apply mwsf@11@01 ($Snap.first $t@8@01))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@11@01 ($Snap.first $t@8@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@11@01 ($Snap.first $t@8@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(mwsf@11@01[First:($t@8@01)]) | live]
; [else-branch: 13 | !(First:(mwsf@11@01[First:($t@8@01)])) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | First:(mwsf@11@01[First:($t@8@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@11@01 ($Snap.first $t@8@01)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@8@01)))
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@11@01 ($Snap.first $t@8@01))))))
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [exec]
; assert acc(x.f, write) && (acc(x.g, write) && acc(x.h, write))
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(push) ; 4
; [else-branch: 13 | !(First:(mwsf@11@01[First:($t@8@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@11@01 ($Snap.first $t@8@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(x.f, write) && (acc(x.g, write) && acc(x.h, write))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
