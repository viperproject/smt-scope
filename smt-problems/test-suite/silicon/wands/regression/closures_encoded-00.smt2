(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/closures_encoded.vpr
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
(declare-fun c1_pre%trigger ($Snap $Ref) Bool)
(declare-fun c1_post%trigger ($Snap $Ref) Bool)
(declare-fun c2_pre%trigger ($Snap $Ref) Bool)
(declare-fun c2_post%trigger ($Snap $Ref) Bool)
(declare-fun c3_pre%trigger ($Snap $Ref) Bool)
(declare-fun c3_post%trigger ($Snap $Ref) Bool)
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
; ---------- triple_not_nested ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(c1_pre(x), write)
; [exec]
; inhale acc(c1_post(x), write)
(declare-const $t@4@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply acc(c1_post(x), write) --* acc(c2_pre(x), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; exhale acc(c2_pre(x), write)
; [exec]
; inhale acc(c2_post(x), write)
(declare-const $t@5@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply acc(c2_post(x), write) --* acc(c3_pre(x), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; exhale acc(c3_pre(x), write)
; [exec]
; inhale acc(c3_post(x), write)
(declare-const $t@6@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- call_triple_not_nested ----------
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
; var x: Ref
(declare-const x@7@01 $Ref)
; [exec]
; var w: Int
(declare-const w@8@01 Int)
; [exec]
; x := new(f)
(declare-const x@9@01 $Ref)
(assert (not (= x@9@01 $Ref.null)))
(declare-const f@10@01 Int)
(assert (not (= x@9@01 x@7@01)))
; [exec]
; x.f := 1
; [exec]
; w := x.f
; [exec]
; package acc(x.f, write) && x.f == w - 2 --* acc(x.f, write) {
; }
(push) ; 3
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.second $t@11@01) $Snap.unit))
; [eval] x.f == w - 2
; [eval] w - 2
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@11@01)) (- 0 1)))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f == w - 2 --* acc(x.f, write)
(declare-const mwsf@12@01 $MWSF)
(assert (forall (($t@11@01 $Snap)) (!
  (= (MWSF_apply mwsf@12@01 $t@11@01) ($Snap.first $t@11@01))
  :pattern ((MWSF_apply mwsf@12@01 $t@11@01))
  :qid |quant-u-0|)))
; [eval] w - 2
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@11@01 $Snap)) (!
  (= (MWSF_apply mwsf@12@01 $t@11@01) ($Snap.first $t@11@01))
  :pattern ((MWSF_apply mwsf@12@01 $t@11@01))
  :qid |quant-u-1|)))
(assert true)
; [exec]
; package acc(x.f, write) && x.f == w + 1 --* acc(x.f, write) && x.f > 0 {
; }
(push) ; 4
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; [eval] x.f == w + 1
; [eval] w + 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 2))
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
; [eval] x.f > 0
(set-option :timeout 0)
(push) ; 5
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@13@01)) 0))
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f == w + 1 --* acc(x.f, write) && x.f > 0
(declare-const mwsf@14@01 $MWSF)
(assert (forall (($t@13@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@13@01)
    ($Snap.combine ($Snap.first $t@13@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-2|)))
; [eval] w + 1
(pop) ; 4
(push) ; 4
(assert (forall (($t@13@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@13@01)
    ($Snap.combine ($Snap.first $t@13@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-3|)))
(assert true)
; [exec]
; x.f := -10
; [eval] -10
; [exec]
; exhale acc(x.f, write) &&
;   ((acc(x.f, write) && x.f == w + 1 --* acc(x.f, write) && x.f > 0) &&
;   (acc(x.f, write) && x.f == w - 2 --* acc(x.f, write)))
; [eval] w + 1
; [eval] w - 2
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- triple_nested ----------
(declare-const x@15@01 $Ref)
(declare-const x@16@01 $Ref)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@18@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(c1_pre(x), write)
; [exec]
; inhale acc(c1_post(x), write)
(declare-const $t@19@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply acc(c1_post(x), write) --*
;   acc(c2_pre(x), write) &&
;   (acc(c2_post(x), write) --* acc(c3_pre(x), write))
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@17@01)) $t@19@01)
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@17@01)) $t@19@01))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@17@01)) $t@19@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; exhale acc(c2_pre(x), write)
; [exec]
; inhale acc(c2_post(x), write)
(declare-const $t@20@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply acc(c2_post(x), write) --* acc(c3_pre(x), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; exhale acc(c3_pre(x), write)
; [exec]
; inhale acc(c3_post(x), write)
(declare-const $t@21@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- call_triple_nested ----------
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
; var x: Ref
(declare-const x@22@01 $Ref)
; [exec]
; var a: Int
(declare-const a@23@01 Int)
; [exec]
; x := new(f)
(declare-const x@24@01 $Ref)
(assert (not (= x@24@01 $Ref.null)))
(declare-const f@25@01 Int)
(assert (not (= x@24@01 x@22@01)))
; [exec]
; x.f := 1
; [exec]
; a := x.f
; [exec]
; package true --* true {
; }
(push) ; 3
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@27@01 $MWSF)
(assert (forall (($t@26@01 $Snap)) (!
  (= (MWSF_apply mwsf@27@01 $t@26@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@27@01 $t@26@01))
  :qid |quant-u-4|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@26@01 $Snap)) (!
  (= (MWSF_apply mwsf@27@01 $t@26@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@27@01 $t@26@01))
  :qid |quant-u-5|)))
; [exec]
; package true --* true --* true {
; }
(push) ; 4
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
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
; Create MagicWandSnapFunction for wand true --* true --* true
(declare-const mwsf@29@01 $MWSF)
(assert (forall (($t@28@01 $Snap)) (!
  (= (MWSF_apply mwsf@29@01 $t@28@01) ($SortWrappers.$MWSFTo$Snap mwsf@27@01))
  :pattern ((MWSF_apply mwsf@29@01 $t@28@01))
  :qid |quant-u-6|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@28@01 $Snap)) (!
  (= (MWSF_apply mwsf@29@01 $t@28@01) ($SortWrappers.$MWSFTo$Snap mwsf@27@01))
  :pattern ((MWSF_apply mwsf@29@01 $t@28@01))
  :qid |quant-u-7|)))
(assert true)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
