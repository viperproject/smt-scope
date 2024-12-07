(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/new_syntax/SnapshotsNestedMagicWands.vpr
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
(assert (=
  ($Snap.second $t@3@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@01))
    ($Snap.second ($Snap.second $t@3@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@3@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@3@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@3@01))) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@3@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@3@01))) $Snap.unit))
; [eval] x.g == old(x.g)
; [eval] old(x.g)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@01)))
  ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))))
(pop) ; 2
(push) ; 2
; [exec]
; package true --* acc(x.f, write) && (true --* acc(x.g, write)) {
;   package true --* acc(x.g, write) {
;   }
; }
(push) ; 3
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [exec]
; package true --* acc(x.g, write) {
; }
(push) ; 4
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
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
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(x.g, write)
(declare-const mwsf@6@01 $MWSF)
(assert (forall (($t@5@01 $Snap)) (!
  (= (MWSF_apply mwsf@6@01 $t@5@01) ($Snap.second $t@2@01))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
  :qid |quant-u-0|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@5@01 $Snap)) (!
  (= (MWSF_apply mwsf@6@01 $t@5@01) ($Snap.second $t@2@01))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
  :qid |quant-u-1|)))
(assert true)
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
; Create MagicWandSnapFunction for wand true --* acc(x.f, write) && (true --* acc(x.g, write))
(declare-const mwsf@7@01 $MWSF)
(assert (forall (($t@4@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@7@01 $t@4@01)
    ($Snap.combine ($Snap.first $t@2@01) ($SortWrappers.$MWSFTo$Snap mwsf@6@01)))
  :pattern ((MWSF_apply mwsf@7@01 $t@4@01))
  :qid |quant-u-2|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@4@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@7@01 $t@4@01)
    ($Snap.combine ($Snap.first $t@2@01) ($SortWrappers.$MWSFTo$Snap mwsf@6@01)))
  :pattern ((MWSF_apply mwsf@7@01 $t@4@01))
  :qid |quant-u-3|)))
(assert true)
(assert (forall (($t@5@01 $Snap)) (!
  (= (MWSF_apply mwsf@6@01 $t@5@01) ($Snap.second $t@2@01))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
  :qid |quant-u-0|)))
; [exec]
; apply true --* acc(x.f, write) && (true --* acc(x.g, write))
(assert (=
  (MWSF_apply mwsf@7@01 $Snap.unit)
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@7@01 $Snap.unit))
    ($Snap.second (MWSF_apply mwsf@7@01 $Snap.unit)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; apply true --* acc(x.g, write)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@7@01 $Snap.unit)))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@7@01 $Snap.unit)))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))))
; [eval] x.g == old(x.g)
; [eval] old(x.g)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@7@01 $Snap.unit))) $Snap.unit))
  ($SortWrappers.$SnapToInt ($Snap.second $t@2@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@7@01 $Snap.unit))) $Snap.unit))
  ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const x@8@01 $Ref)
(declare-const x@9@01 $Ref)
(push) ; 1
(declare-const $t@10@01 Int)
(assert (not (= x@9@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.second $t@11@01) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@11@01)) $t@10@01))
(pop) ; 2
(push) ; 2
; [exec]
; package true --* true --* acc(x.f, write) {
;   package true --* acc(x.f, write) {
;   }
; }
(push) ; 3
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [exec]
; package true --* acc(x.f, write) {
; }
(push) ; 4
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
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
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(x.f, write)
(declare-const mwsf@14@01 $MWSF)
(assert (forall (($t@13@01 $Snap)) (!
  (= (MWSF_apply mwsf@14@01 $t@13@01) ($SortWrappers.IntTo$Snap $t@10@01))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-4|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@13@01 $Snap)) (!
  (= (MWSF_apply mwsf@14@01 $t@13@01) ($SortWrappers.IntTo$Snap $t@10@01))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-5|)))
(assert true)
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
; Create MagicWandSnapFunction for wand true --* true --* acc(x.f, write)
(declare-const mwsf@15@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@15@01 $t@12@01) ($SortWrappers.$MWSFTo$Snap mwsf@14@01))
  :pattern ((MWSF_apply mwsf@15@01 $t@12@01))
  :qid |quant-u-6|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@15@01 $t@12@01) ($SortWrappers.$MWSFTo$Snap mwsf@14@01))
  :pattern ((MWSF_apply mwsf@15@01 $t@12@01))
  :qid |quant-u-7|)))
(assert true)
(assert (forall (($t@13@01 $Snap)) (!
  (= (MWSF_apply mwsf@14@01 $t@13@01) ($SortWrappers.IntTo$Snap $t@10@01))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-4|)))
; [exec]
; apply true --* true --* acc(x.f, write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; apply true --* acc(x.f, write)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF (MWSF_apply mwsf@15@01 $Snap.unit)) $Snap.unit))
  $t@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF (MWSF_apply mwsf@15@01 $Snap.unit)) $Snap.unit))
  $t@10@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@16@01 $Ref)
(declare-const x@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (not (= x@17@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@19@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@18@01))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] x.g == old(x.g)
; [eval] old(x.g)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@19@01)))
  ($SortWrappers.$SnapToInt ($Snap.second $t@18@01))))
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) && acc(x.g, write) --*
; acc(x.f, write) &&
; (acc(x.g, write) && (acc(x.g, write) --* acc(x.g, write))) {
;   package acc(x.g, write) --* acc(x.g, write) {
;   }
; }
(push) ; 3
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
; [exec]
; package acc(x.g, write) --* acc(x.g, write) {
; }
(push) ; 4
(declare-const $t@21@01 $Snap)
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
; Create MagicWandSnapFunction for wand acc(x.g, write) --* acc(x.g, write)
(declare-const mwsf@22@01 $MWSF)
(assert (forall (($t@21@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@21@01) $t@21@01)
  :pattern ((MWSF_apply mwsf@22@01 $t@21@01))
  :qid |quant-u-8|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@21@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@21@01) $t@21@01)
  :pattern ((MWSF_apply mwsf@22@01 $t@21@01))
  :qid |quant-u-9|)))
(assert true)
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
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, write) && acc(x.g, write) --* acc(x.f, write) && (acc(x.g, write) && (acc(x.g, write) --* acc(x.g, write)))
(declare-const mwsf@23@01 $MWSF)
(assert (forall (($t@20@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@23@01 $t@20@01)
    ($Snap.combine
      ($Snap.first $t@20@01)
      ($Snap.combine
        ($Snap.second $t@20@01)
        ($SortWrappers.$MWSFTo$Snap mwsf@22@01))))
  :pattern ((MWSF_apply mwsf@23@01 $t@20@01))
  :qid |quant-u-10|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@20@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@23@01 $t@20@01)
    ($Snap.combine
      ($Snap.first $t@20@01)
      ($Snap.combine
        ($Snap.second $t@20@01)
        ($SortWrappers.$MWSFTo$Snap mwsf@22@01))))
  :pattern ((MWSF_apply mwsf@23@01 $t@20@01))
  :qid |quant-u-11|)))
(assert true)
(assert (forall (($t@21@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@21@01) $t@21@01)
  :pattern ((MWSF_apply mwsf@22@01 $t@21@01))
  :qid |quant-u-8|)))
; [exec]
; apply acc(x.f, write) && acc(x.g, write) --*
;   acc(x.f, write) &&
;   (acc(x.g, write) && (acc(x.g, write) --* acc(x.g, write)))
(assert (=
  (MWSF_apply mwsf@23@01 ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.second $t@18@01)))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@23@01 ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.second $t@18@01))))
    ($Snap.second (MWSF_apply mwsf@23@01 ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.second $t@18@01)))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@23@01 ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.second $t@18@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply mwsf@23@01 ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.second $t@18@01)))))
    ($Snap.second ($Snap.second (MWSF_apply mwsf@23@01 ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.second $t@18@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; apply acc(x.g, write) --* acc(x.g, write)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@23@01 ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.second $t@18@01)))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@18@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@23@01 ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.second $t@18@01)))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@18@01))))
; [eval] x.g == old(x.g)
; [eval] old(x.g)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second (MWSF_apply mwsf@23@01 ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.second $t@18@01)))))) ($Snap.first ($Snap.second (MWSF_apply mwsf@23@01 ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.second $t@18@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.second $t@18@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second (MWSF_apply mwsf@23@01 ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.second $t@18@01)))))) ($Snap.first ($Snap.second (MWSF_apply mwsf@23@01 ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.second $t@18@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.second $t@18@01))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const x@24@01 $Ref)
(declare-const x@25@01 $Ref)
(push) ; 1
(declare-const $t@26@01 Int)
(assert (not (= x@25@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (= ($Snap.second $t@27@01) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@27@01)) $t@26@01))
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* acc(x.f, write) {
;   package true --* true {
;   }
; }
(push) ; 3
(declare-const $t@28@01 $Snap)
; [exec]
; package true --* true {
; }
(push) ; 4
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 $Snap.unit))
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@30@01 $MWSF)
(assert (forall (($t@29@01 $Snap)) (!
  (= (MWSF_apply mwsf@30@01 $t@29@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@30@01 $t@29@01))
  :qid |quant-u-12|)))
(pop) ; 4
(push) ; 4
(assert (forall (($t@29@01 $Snap)) (!
  (= (MWSF_apply mwsf@30@01 $t@29@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@30@01 $t@29@01))
  :qid |quant-u-13|)))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write)
(declare-const mwsf@31@01 $MWSF)
(assert (forall (($t@28@01 $Snap)) (!
  (= (MWSF_apply mwsf@31@01 $t@28@01) $t@28@01)
  :pattern ((MWSF_apply mwsf@31@01 $t@28@01))
  :qid |quant-u-14|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@28@01 $Snap)) (!
  (= (MWSF_apply mwsf@31@01 $t@28@01) $t@28@01)
  :pattern ((MWSF_apply mwsf@31@01 $t@28@01))
  :qid |quant-u-15|)))
(assert (forall (($t@29@01 $Snap)) (!
  (= (MWSF_apply mwsf@30@01 $t@29@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@30@01 $t@29@01))
  :qid |quant-u-12|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt (MWSF_apply mwsf@31@01 ($SortWrappers.IntTo$Snap $t@26@01)))
  $t@26@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply mwsf@31@01 ($SortWrappers.IntTo$Snap $t@26@01)))
  $t@26@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const x@32@01 $Ref)
(declare-const x@33@01 $Ref)
(push) ; 1
(declare-const $t@34@01 Int)
(assert (not (= x@33@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (= ($Snap.second $t@35@01) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@35@01)) $t@34@01))
(pop) ; 2
(push) ; 2
; [exec]
; package true --* acc(x.f, write) {
; }
(push) ; 3
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
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
; Create MagicWandSnapFunction for wand true --* acc(x.f, write)
(declare-const mwsf@37@01 $MWSF)
(assert (forall (($t@36@01 $Snap)) (!
  (= (MWSF_apply mwsf@37@01 $t@36@01) ($SortWrappers.IntTo$Snap $t@34@01))
  :pattern ((MWSF_apply mwsf@37@01 $t@36@01))
  :qid |quant-u-16|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@36@01 $Snap)) (!
  (= (MWSF_apply mwsf@37@01 $t@36@01) ($SortWrappers.IntTo$Snap $t@34@01))
  :pattern ((MWSF_apply mwsf@37@01 $t@36@01))
  :qid |quant-u-17|)))
(assert true)
; [exec]
; package true --* acc(x.f, write) {
;   apply true --* acc(x.f, write)
; }
(push) ; 4
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 $Snap.unit))
; [exec]
; apply true --* acc(x.f, write)
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
; [state consolidation]
; State saturation: before repetition
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
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(x.f, write)
(declare-const mwsf@39@01 $MWSF)
(assert (forall (($t@38@01 $Snap)) (!
  (= (MWSF_apply mwsf@39@01 $t@38@01) (MWSF_apply mwsf@37@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@39@01 $t@38@01))
  :qid |quant-u-18|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@38@01 $Snap)) (!
  (= (MWSF_apply mwsf@39@01 $t@38@01) (MWSF_apply mwsf@37@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@39@01 $t@38@01))
  :qid |quant-u-19|)))
(assert true)
; [exec]
; apply true --* acc(x.f, write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(set-option :timeout 0)
(push) ; 5
(assert (not (= ($SortWrappers.$SnapToInt (MWSF_apply mwsf@39@01 $Snap.unit)) $t@34@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToInt (MWSF_apply mwsf@39@01 $Snap.unit)) $t@34@01))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
