(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:35:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/eval_states.vpr
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
(declare-fun Emp%trigger ($Snap $Ref) Bool)
(declare-fun P%trigger ($Snap $Ref) Bool)
(declare-fun Q%trigger ($Snap $Ref) Bool)
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
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(assert (= ($Snap.second $t@3@01) $Snap.unit))
; [eval] x.f == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@3@01)) 0))
(pop) ; 2
(push) ; 2
; [exec]
; apply acc(x.f, 1 / 2) --* acc(x.f, write) && x.f == 0
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@2@01)) ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@2@01)) ($Snap.second $t@2@01)))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@2@01)) ($Snap.second $t@2@01))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@2@01)) ($Snap.second $t@2@01)))
  $Snap.unit))
; [eval] x.f == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@2@01)) ($Snap.second $t@2@01))))
  0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == 0
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@4@01 $Ref)
(declare-const x@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $MWSF)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.g, write) && x.g > 0 --* acc(x.g, write) && x.g > 0 {
;   apply true --* true
; }
(push) ; 3
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (not (= x@5@01 $Ref.null)))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] x.g > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 0))
; [exec]
; apply true --* true
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
(check-sat)
; unknown
(assert (= (MWSF_apply $t@6@01 $Snap.unit) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
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
; [eval] x.g > 0
; Create MagicWandSnapFunction for wand acc(x.g, write) && x.g > 0 --* acc(x.g, write) && x.g > 0
(declare-const mwsf@8@01 $MWSF)
(assert (forall (($t@7@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@8@01 $t@7@01)
    ($Snap.combine ($Snap.first $t@7@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@8@01 $t@7@01))
  :qid |quant-u-0|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@7@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@8@01 $t@7@01)
    ($Snap.combine ($Snap.first $t@7@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@8@01 $t@7@01))
  :qid |quant-u-1|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const l@9@01 $Ref)
(declare-const l@10@01 $Ref)
(push) ; 1
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.first $t@11@01) $Snap.unit))
; [eval] l != null
(assert (not (= l@10@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* acc(l.h, write) {
;   apply true --* acc(l.h, write) && acc(Emp(l.h), write)
;   unfold acc(Emp(l.h), write)
; }
(push) ; 3
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [exec]
; apply true --* acc(l.h, write) && acc(Emp(l.h), write)
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
(check-sat)
; unknown
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@11@01)) $Snap.unit)
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@11@01)) $Snap.unit))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@11@01)) $Snap.unit)))))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [exec]
; unfold acc(Emp(l.h), write)
(set-option :timeout 0)
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
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@11@01)) $Snap.unit))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Emp%trigger ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@11@01)) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@11@01)) $Snap.unit)))))
(set-option :timeout 0)
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
; Create MagicWandSnapFunction for wand true --* acc(l.h, write)
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@13@01 $t@12@01)
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@11@01)) $Snap.unit)))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-2|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@12@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@13@01 $t@12@01)
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@11@01)) $Snap.unit)))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-3|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const l@14@01 $Ref)
(declare-const l@15@01 $Ref)
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
; package acc(P(l), write) --* acc(l.h, write) && acc(Q(l.h), write) {
;   unfold acc(P(l), write)
;   fold acc(Q(l.h), write)
; }
(push) ; 3
(declare-const $t@16@01 $Snap)
; [exec]
; unfold acc(P(l), write)
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
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (not (= l@15@01 $Ref.null)))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
; [eval] x.h != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l@15@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [eval] x.h.h != null
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@16@01 l@15@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) l@15@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(Q(l.h), write)
(set-option :timeout 0)
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
; [eval] x.h != null
(assert (Q%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01))))
(set-option :timeout 0)
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
(set-option :timeout 0)
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
; Create MagicWandSnapFunction for wand acc(P(l), write) --* acc(l.h, write) && acc(Q(l.h), write)
(declare-const mwsf@17@01 $MWSF)
(assert (forall (($t@16@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@17@01 $t@16@01)
    ($Snap.combine
      ($Snap.first $t@16@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@17@01 $t@16@01))
  :qid |quant-u-4|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@16@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@17@01 $t@16@01)
    ($Snap.combine
      ($Snap.first $t@16@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@17@01 $t@16@01))
  :qid |quant-u-5|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const l@18@01 $Ref)
(declare-const l@19@01 $Ref)
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
; package acc(P(l), write) --* acc(Q(l), write) {
;   unfold acc(P(l), write)
;   fold acc(Q(l), write)
; }
(push) ; 3
(declare-const $t@20@01 $Snap)
; [exec]
; unfold acc(P(l), write)
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
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (not (= l@19@01 $Ref.null)))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (= ($Snap.first ($Snap.second $t@20@01)) $Snap.unit))
; [eval] x.h != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@20@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@20@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@20@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l@19@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@20@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@20@01))) $Snap.unit))
; [eval] x.h.h != null
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@20@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@20@01 l@19@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@20@01)) l@19@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(Q(l), write)
(set-option :timeout 0)
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
; [eval] x.h != null
(assert (Q%trigger ($Snap.combine ($Snap.first $t@20@01) $Snap.unit) l@19@01))
(set-option :timeout 0)
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
; Create MagicWandSnapFunction for wand acc(P(l), write) --* acc(Q(l), write)
(declare-const mwsf@21@01 $MWSF)
(assert (forall (($t@20@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@21@01 $t@20@01)
    ($Snap.combine ($Snap.first $t@20@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@21@01 $t@20@01))
  :qid |quant-u-6|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@20@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@21@01 $t@20@01)
    ($Snap.combine ($Snap.first $t@20@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@21@01 $t@20@01))
  :qid |quant-u-7|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
