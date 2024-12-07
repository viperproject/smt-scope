(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:35:01
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/conditionals3.vpr
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
(declare-fun P%trigger ($Snap $Ref Bool) Bool)
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
(declare-const b1@1@01 Bool)
(declare-const b2@2@01 Bool)
(declare-const x@3@01 $Ref)
(declare-const b1@4@01 Bool)
(declare-const b2@5@01 Bool)
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
; inhale acc(x.f, write) && acc(x.g, write)
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (not (= x@3@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* true {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@7@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@4@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@4@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b1@4@01 | live]
; [else-branch: 0 | !(b1@4@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | b1@4@01]
(assert b1@4@01)
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* true
(declare-const mwsf@8@01 $MWSF)
(assert (forall (($t@7@01 $Snap)) (!
  (= (MWSF_apply mwsf@8@01 $t@7@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@8@01 $t@7@01))
  :qid |quant-u-0|)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(b1@4@01)]
(assert (not b1@4@01))
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* true
(declare-const mwsf@9@01 $MWSF)
(assert (forall (($t@7@01 $Snap)) (!
  (= (MWSF_apply mwsf@9@01 $t@7@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@9@01 $t@7@01))
  :qid |quant-u-2|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert b1@4@01)
(assert (forall (($t@7@01 $Snap)) (!
  (= (MWSF_apply mwsf@8@01 $t@7@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@8@01 $t@7@01))
  :qid |quant-u-1|)))
(pop) ; 3
(push) ; 3
(assert (not b1@4@01))
(assert (forall (($t@7@01 $Snap)) (!
  (= (MWSF_apply mwsf@9@01 $t@7@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@9@01 $t@7@01))
  :qid |quant-u-3|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@10@01 $Ref)
(declare-const b1@11@01 Bool)
(declare-const b2@12@01 Bool)
(declare-const x@13@01 $Ref)
(declare-const b1@14@01 Bool)
(declare-const b2@15@01 Bool)
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
; inhale acc(x.f, write) && acc(x.g, write)
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (not (= x@13@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* (b1 ==> acc(x.g, 1 / 10) && acc(x.g, 1 / 10)) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@14@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@14@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b1@14@01 | live]
; [else-branch: 1 | !(b1@14@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | b1@14@01]
(assert b1@14@01)
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
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(x.g, 1 / 10) && acc(x.g, 1 / 10))
(declare-const mwsf@18@01 $MWSF)
(assert (forall (($t@17@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@18@01 $t@17@01)
    ($Snap.combine ($Snap.second $t@16@01) ($Snap.second $t@16@01)))
  :pattern ((MWSF_apply mwsf@18@01 $t@17@01))
  :qid |quant-u-4|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | !(b1@14@01)]
(assert (not b1@14@01))
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(x.g, 1 / 10) && acc(x.g, 1 / 10))
(declare-const mwsf@19@01 $MWSF)
(assert (forall (($t@17@01 $Snap)) (!
  (= (MWSF_apply mwsf@19@01 $t@17@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@19@01 $t@17@01))
  :qid |quant-u-6|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert b1@14@01)
(assert (forall (($t@17@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@18@01 $t@17@01)
    ($Snap.combine ($Snap.second $t@16@01) ($Snap.second $t@16@01)))
  :pattern ((MWSF_apply mwsf@18@01 $t@17@01))
  :qid |quant-u-5|)))
(assert true)
; [exec]
; assert perm(x.g) >= (!b1 ? write : 8 / 10)
; [eval] perm(x.g) >= (!b1 ? write : 8 / 10)
; [eval] perm(x.g)
; [eval] (!b1 ? write : 8 / 10)
; [eval] !b1
(push) ; 4
; [then-branch: 2 | !(b1@14@01) | dead]
; [else-branch: 2 | b1@14@01 | live]
(push) ; 5
; [else-branch: 2 | b1@14@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(x.g) == (!b1 ? write : 8 / 10)
; [eval] perm(x.g) == (!b1 ? write : 8 / 10)
; [eval] perm(x.g)
; [eval] (!b1 ? write : 8 / 10)
; [eval] !b1
(push) ; 4
; [then-branch: 3 | !(b1@14@01) | dead]
; [else-branch: 3 | b1@14@01 | live]
(push) ; 5
; [else-branch: 3 | b1@14@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (not b1@14@01))
(assert (forall (($t@17@01 $Snap)) (!
  (= (MWSF_apply mwsf@19@01 $t@17@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@19@01 $t@17@01))
  :qid |quant-u-7|)))
; [exec]
; assert perm(x.g) >= (!b1 ? write : 8 / 10)
; [eval] perm(x.g) >= (!b1 ? write : 8 / 10)
; [eval] perm(x.g)
; [eval] (!b1 ? write : 8 / 10)
; [eval] !b1
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not b1@14@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(b1@14@01) | live]
; [else-branch: 4 | b1@14@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | !(b1@14@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(x.g) == (!b1 ? write : 8 / 10)
; [eval] perm(x.g) == (!b1 ? write : 8 / 10)
; [eval] perm(x.g)
; [eval] (!b1 ? write : 8 / 10)
; [eval] !b1
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not b1@14@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(b1@14@01) | live]
; [else-branch: 5 | b1@14@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(b1@14@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@20@01 $Ref)
(declare-const b@21@01 Bool)
(declare-const x@22@01 $Ref)
(declare-const b@23@01 Bool)
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
; inhale acc(x.f, write) && acc(x.g, write)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (not (= x@22@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --*
; acc(x.f, 1 / 10) &&
; (acc(x.g, 1 / 10) &&
; (acc(x.f, 1 / 10) && ((b ==> acc(x.g, 1 / 10)) && acc(x.f, 1 / 10)))) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
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
(assert (not (not b@23@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@23@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | b@23@01 | live]
; [else-branch: 6 | !(b@23@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | b@23@01]
(assert b@23@01)
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
; Create MagicWandSnapFunction for wand true --* acc(x.f, 1 / 10) && (acc(x.g, 1 / 10) && (acc(x.f, 1 / 10) && ((b ==> acc(x.g, 1 / 10)) && acc(x.f, 1 / 10))))
(declare-const mwsf@26@01 $MWSF)
(assert (forall (($t@25@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@26@01 $t@25@01)
    ($Snap.combine
      ($Snap.first $t@24@01)
      ($Snap.combine
        ($Snap.second $t@24@01)
        ($Snap.combine
          ($Snap.first $t@24@01)
          ($Snap.combine ($Snap.second $t@24@01) ($Snap.first $t@24@01))))))
  :pattern ((MWSF_apply mwsf@26@01 $t@25@01))
  :qid |quant-u-8|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 6 | !(b@23@01)]
(assert (not b@23@01))
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
; Create MagicWandSnapFunction for wand true --* acc(x.f, 1 / 10) && (acc(x.g, 1 / 10) && (acc(x.f, 1 / 10) && ((b ==> acc(x.g, 1 / 10)) && acc(x.f, 1 / 10))))
(declare-const mwsf@27@01 $MWSF)
(assert (forall (($t@25@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@27@01 $t@25@01)
    ($Snap.combine
      ($Snap.first $t@24@01)
      ($Snap.combine
        ($Snap.second $t@24@01)
        ($Snap.combine
          ($Snap.first $t@24@01)
          ($Snap.combine $Snap.unit ($Snap.first $t@24@01))))))
  :pattern ((MWSF_apply mwsf@27@01 $t@25@01))
  :qid |quant-u-10|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert b@23@01)
(assert (forall (($t@25@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@26@01 $t@25@01)
    ($Snap.combine
      ($Snap.first $t@24@01)
      ($Snap.combine
        ($Snap.second $t@24@01)
        ($Snap.combine
          ($Snap.first $t@24@01)
          ($Snap.combine ($Snap.second $t@24@01) ($Snap.first $t@24@01))))))
  :pattern ((MWSF_apply mwsf@26@01 $t@25@01))
  :qid |quant-u-9|)))
(assert true)
; [exec]
; assert perm(x.f) >= 7 / 10
; [eval] perm(x.f) >= 7 / 10
; [eval] perm(x.f)
; [exec]
; assert perm(x.g) >= (b ? 8 / 10 : 9 / 10)
; [eval] perm(x.g) >= (b ? 8 / 10 : 9 / 10)
; [eval] perm(x.g)
; [eval] (b ? 8 / 10 : 9 / 10)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@23@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | b@23@01 | live]
; [else-branch: 7 | !(b@23@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | b@23@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(x.f) == 7 / 10
; [eval] perm(x.f) == 7 / 10
; [eval] perm(x.f)
; [exec]
; assert perm(x.g) == (b ? 8 / 10 : 9 / 10)
; [eval] perm(x.g) == (b ? 8 / 10 : 9 / 10)
; [eval] perm(x.g)
; [eval] (b ? 8 / 10 : 9 / 10)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@23@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b@23@01 | live]
; [else-branch: 8 | !(b@23@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | b@23@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (not b@23@01))
(assert (forall (($t@25@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@27@01 $t@25@01)
    ($Snap.combine
      ($Snap.first $t@24@01)
      ($Snap.combine
        ($Snap.second $t@24@01)
        ($Snap.combine
          ($Snap.first $t@24@01)
          ($Snap.combine $Snap.unit ($Snap.first $t@24@01))))))
  :pattern ((MWSF_apply mwsf@27@01 $t@25@01))
  :qid |quant-u-11|)))
(assert true)
; [exec]
; assert perm(x.f) >= 7 / 10
; [eval] perm(x.f) >= 7 / 10
; [eval] perm(x.f)
; [exec]
; assert perm(x.g) >= (b ? 8 / 10 : 9 / 10)
; [eval] perm(x.g) >= (b ? 8 / 10 : 9 / 10)
; [eval] perm(x.g)
; [eval] (b ? 8 / 10 : 9 / 10)
(push) ; 4
; [then-branch: 9 | b@23@01 | dead]
; [else-branch: 9 | !(b@23@01) | live]
(push) ; 5
; [else-branch: 9 | !(b@23@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(x.f) == 7 / 10
; [eval] perm(x.f) == 7 / 10
; [eval] perm(x.f)
; [exec]
; assert perm(x.g) == (b ? 8 / 10 : 9 / 10)
; [eval] perm(x.g) == (b ? 8 / 10 : 9 / 10)
; [eval] perm(x.g)
; [eval] (b ? 8 / 10 : 9 / 10)
(push) ; 4
; [then-branch: 10 | b@23@01 | dead]
; [else-branch: 10 | !(b@23@01) | live]
(push) ; 5
; [else-branch: 10 | !(b@23@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@28@01 $Ref)
(declare-const b1@29@01 Bool)
(declare-const b2@30@01 Bool)
(declare-const x@31@01 $Ref)
(declare-const b1@32@01 Bool)
(declare-const b2@33@01 Bool)
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
; inhale acc(x.f, write) && acc(x.g, write)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (not (= x@31@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --*
; (!b1 ?
;   acc(x.f, 1 / 10) && acc(x.f, 1 / 10) :
;   acc(x.g, 1 / 10) && acc(x.g, 1 / 10)) &&
; (b2 ? acc(x.f, 2 / 10) : acc(x.g, 2 / 10)) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@35@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@32@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@32@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b1@32@01 | live]
; [else-branch: 11 | !(b1@32@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | b1@32@01]
(assert b1@32@01)
; [eval] !b1
; [then-branch: 12 | !(b1@32@01) | dead]
; [else-branch: 12 | b1@32@01 | live]
(push) ; 5
; [else-branch: 12 | b1@32@01]
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
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not b2@33@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b2@33@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | b2@33@01 | live]
; [else-branch: 13 | !(b2@33@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | b2@33@01]
(assert b2@33@01)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool $t@35@01)
  ($SortWrappers.$SnapToBool ($Snap.first $t@34@01))))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (!b1 ? acc(x.f, 1 / 10) && acc(x.f, 1 / 10) : acc(x.g, 1 / 10) && acc(x.g, 1 / 10)) && (b2 ? acc(x.f, 2 / 10) : acc(x.g, 2 / 10))
(declare-const mwsf@36@01 $MWSF)
(assert (forall (($t@35@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@36@01 $t@35@01)
    ($Snap.combine
      ($Snap.combine ($Snap.second $t@34@01) ($Snap.second $t@34@01))
      ($Snap.first $t@34@01)))
  :pattern ((MWSF_apply mwsf@36@01 $t@35@01))
  :qid |quant-u-12|)))
; [eval] !b1
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 13 | !(b2@33@01)]
(assert (not b2@33@01))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (!b1 ? acc(x.f, 1 / 10) && acc(x.f, 1 / 10) : acc(x.g, 1 / 10) && acc(x.g, 1 / 10)) && (b2 ? acc(x.f, 2 / 10) : acc(x.g, 2 / 10))
(declare-const mwsf@37@01 $MWSF)
(assert (forall (($t@35@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@37@01 $t@35@01)
    ($Snap.combine
      ($Snap.combine ($Snap.second $t@34@01) ($Snap.second $t@34@01))
      ($Snap.second $t@34@01)))
  :pattern ((MWSF_apply mwsf@37@01 $t@35@01))
  :qid |quant-u-14|)))
; [eval] !b1
(pop) ; 6
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(b1@32@01)]
(assert (not b1@32@01))
; [eval] !b1
(push) ; 5
(set-option :timeout 10)
(assert (not b1@32@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | !(b1@32@01) | live]
; [else-branch: 14 | b1@32@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | !(b1@32@01)]
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
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not b2@33@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b2@33@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | b2@33@01 | live]
; [else-branch: 15 | !(b2@33@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 15 | b2@33@01]
(assert b2@33@01)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (!b1 ? acc(x.f, 1 / 10) && acc(x.f, 1 / 10) : acc(x.g, 1 / 10) && acc(x.g, 1 / 10)) && (b2 ? acc(x.f, 2 / 10) : acc(x.g, 2 / 10))
(declare-const mwsf@38@01 $MWSF)
(assert (forall (($t@35@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@38@01 $t@35@01)
    ($Snap.combine
      ($Snap.combine ($Snap.first $t@34@01) ($Snap.first $t@34@01))
      ($Snap.first $t@34@01)))
  :pattern ((MWSF_apply mwsf@38@01 $t@35@01))
  :qid |quant-u-16|)))
; [eval] !b1
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 15 | !(b2@33@01)]
(assert (not b2@33@01))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt $t@35@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@34@01))))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (!b1 ? acc(x.f, 1 / 10) && acc(x.f, 1 / 10) : acc(x.g, 1 / 10) && acc(x.g, 1 / 10)) && (b2 ? acc(x.f, 2 / 10) : acc(x.g, 2 / 10))
(declare-const mwsf@39@01 $MWSF)
(assert (forall (($t@35@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@39@01 $t@35@01)
    ($Snap.combine
      ($Snap.combine ($Snap.first $t@34@01) ($Snap.first $t@34@01))
      ($Snap.second $t@34@01)))
  :pattern ((MWSF_apply mwsf@39@01 $t@35@01))
  :qid |quant-u-18|)))
; [eval] !b1
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (and b2@33@01 b1@32@01))
(assert (forall (($t@35@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToBool $t@35@01)
      ($SortWrappers.$SnapToBool ($Snap.first $t@34@01)))
    (=
      (MWSF_apply mwsf@36@01 $t@35@01)
      ($Snap.combine
        ($Snap.combine ($Snap.second $t@34@01) ($Snap.second $t@34@01))
        ($Snap.first $t@34@01))))
  :pattern ((MWSF_apply mwsf@36@01 $t@35@01))
  :qid |quant-u-13|)))
(assert true)
; [exec]
; assert b1 && b2 ==> perm(x.f) >= 9 / 10 && perm(x.g) >= 8 / 10
; [eval] b1 && b2 ==> perm(x.f) >= 9 / 10 && perm(x.g) >= 8 / 10
; [eval] b1 && b2
(push) ; 4
; [then-branch: 16 | !(b1@32@01) | live]
; [else-branch: 16 | b1@32@01 | live]
(push) ; 5
; [then-branch: 16 | !(b1@32@01)]
(assert (not b1@32@01))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | b1@32@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@32@01 (not b1@32@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@32@01 b2@33@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@32@01 b2@33@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | b1@32@01 && b2@33@01 | live]
; [else-branch: 17 | !(b1@32@01 && b2@33@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | b1@32@01 && b2@33@01]
(assert (and b1@32@01 b2@33@01))
; [eval] perm(x.f) >= 9 / 10 && perm(x.g) >= 8 / 10
; [eval] perm(x.f) >= 9 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 18 | False | live]
; [else-branch: 18 | True | live]
(push) ; 7
; [then-branch: 18 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 18 | True]
; [eval] perm(x.g) >= 8 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@32@01 b2@33@01))
; [exec]
; assert b1 && !b2 ==> perm(x.f) >= 10 / 10 && perm(x.g) >= 6 / 10
; [eval] b1 && !b2 ==> perm(x.f) >= 10 / 10 && perm(x.g) >= 6 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 19 | !(b1@32@01) | live]
; [else-branch: 19 | b1@32@01 | live]
(push) ; 5
; [then-branch: 19 | !(b1@32@01)]
(assert (not b1@32@01))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | b1@32@01]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@32@01 (not b2@33@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | b1@32@01 && !(b2@33@01) | dead]
; [else-branch: 20 | !(b1@32@01 && !(b2@33@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 20 | !(b1@32@01 && !(b2@33@01))]
(assert (not (and b1@32@01 (not b2@33@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@32@01 (not b2@33@01))))
; [exec]
; assert !b1 && b2 ==> perm(x.f) >= 6 / 10 && perm(x.g) >= 10 / 10
; [eval] !b1 && b2 ==> perm(x.f) >= 6 / 10 && perm(x.g) >= 10 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 21 | b1@32@01 | live]
; [else-branch: 21 | !(b1@32@01) | live]
(push) ; 5
; [then-branch: 21 | b1@32@01]
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(b1@32@01)]
(assert (not b1@32@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not b1@32@01) b1@32@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@32@01) b2@33@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | !(b1@32@01) && b2@33@01 | dead]
; [else-branch: 22 | !(!(b1@32@01) && b2@33@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 22 | !(!(b1@32@01) && b2@33@01)]
(assert (not (and (not b1@32@01) b2@33@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@32@01) b2@33@01)))
; [exec]
; assert !b1 && !b2 ==> perm(x.f) >= 8 / 10 && perm(x.g) >= 9 / 10
; [eval] !b1 && !b2 ==> perm(x.f) >= 8 / 10 && perm(x.g) >= 9 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 23 | b1@32@01 | live]
; [else-branch: 23 | !(b1@32@01) | live]
(push) ; 5
; [then-branch: 23 | b1@32@01]
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(b1@32@01)]
(assert (not b1@32@01))
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@32@01) (not b2@33@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | !(b1@32@01) && !(b2@33@01) | dead]
; [else-branch: 24 | !(!(b1@32@01) && !(b2@33@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 24 | !(!(b1@32@01) && !(b2@33@01))]
(assert (not (and (not b1@32@01) (not b2@33@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@32@01) (not b2@33@01))))
; [exec]
; assert b1 && b2 ==> perm(x.f) == 9 / 10 && perm(x.g) == 8 / 10
; [eval] b1 && b2 ==> perm(x.f) == 9 / 10 && perm(x.g) == 8 / 10
; [eval] b1 && b2
(push) ; 4
; [then-branch: 25 | !(b1@32@01) | live]
; [else-branch: 25 | b1@32@01 | live]
(push) ; 5
; [then-branch: 25 | !(b1@32@01)]
(assert (not b1@32@01))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | b1@32@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@32@01 b2@33@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@32@01 b2@33@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | b1@32@01 && b2@33@01 | live]
; [else-branch: 26 | !(b1@32@01 && b2@33@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 26 | b1@32@01 && b2@33@01]
(assert (and b1@32@01 b2@33@01))
; [eval] perm(x.f) == 9 / 10 && perm(x.g) == 8 / 10
; [eval] perm(x.f) == 9 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 27 | False | live]
; [else-branch: 27 | True | live]
(push) ; 7
; [then-branch: 27 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 27 | True]
; [eval] perm(x.g) == 8 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@32@01 b2@33@01))
; [exec]
; assert b1 && !b2 ==> perm(x.f) == 10 / 10 && perm(x.g) == 6 / 10
; [eval] b1 && !b2 ==> perm(x.f) == 10 / 10 && perm(x.g) == 6 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 28 | !(b1@32@01) | live]
; [else-branch: 28 | b1@32@01 | live]
(push) ; 5
; [then-branch: 28 | !(b1@32@01)]
(assert (not b1@32@01))
(pop) ; 5
(push) ; 5
; [else-branch: 28 | b1@32@01]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 29 | b1@32@01 && !(b2@33@01) | dead]
; [else-branch: 29 | !(b1@32@01 && !(b2@33@01)) | live]
(push) ; 5
; [else-branch: 29 | !(b1@32@01 && !(b2@33@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && b2 ==> perm(x.f) == 6 / 10 && perm(x.g) == 10 / 10
; [eval] !b1 && b2 ==> perm(x.f) == 6 / 10 && perm(x.g) == 10 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 30 | b1@32@01 | live]
; [else-branch: 30 | !(b1@32@01) | live]
(push) ; 5
; [then-branch: 30 | b1@32@01]
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(b1@32@01)]
(assert (not b1@32@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 31 | !(b1@32@01) && b2@33@01 | dead]
; [else-branch: 31 | !(!(b1@32@01) && b2@33@01) | live]
(push) ; 5
; [else-branch: 31 | !(!(b1@32@01) && b2@33@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && !b2 ==> perm(x.f) == 8 / 10 && perm(x.g) == 9 / 10
; [eval] !b1 && !b2 ==> perm(x.f) == 8 / 10 && perm(x.g) == 9 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 32 | b1@32@01 | live]
; [else-branch: 32 | !(b1@32@01) | live]
(push) ; 5
; [then-branch: 32 | b1@32@01]
(pop) ; 5
(push) ; 5
; [else-branch: 32 | !(b1@32@01)]
(assert (not b1@32@01))
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 33 | !(b1@32@01) && !(b2@33@01) | dead]
; [else-branch: 33 | !(!(b1@32@01) && !(b2@33@01)) | live]
(push) ; 5
; [else-branch: 33 | !(!(b1@32@01) && !(b2@33@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert false
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
; ---------- test04 ----------
(declare-const x@40@01 $Ref)
(declare-const b1@41@01 Bool)
(declare-const b2@42@01 Bool)
(declare-const b3@43@01 Bool)
(declare-const x@44@01 $Ref)
(declare-const b1@45@01 Bool)
(declare-const b2@46@01 Bool)
(declare-const b3@47@01 Bool)
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
; inhale acc(x.f, 5 / 10) && acc(x.g, 5 / 10)
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(assert (not (= x@44@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(P(x, b2), write)
(declare-const $t@49@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; package (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --*
; acc(x.f, 2 / 10) &&
; (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10))) {
;   unfold acc(P(x, b2), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@50@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@45@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@45@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | b1@45@01 | live]
; [else-branch: 34 | !(b1@45@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 34 | b1@45@01]
(assert b1@45@01)
; [exec]
; unfold acc(P(x, b2), write)
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
(assert (not (not b2@46@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@46@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | b2@46@01 | live]
; [else-branch: 35 | !(b2@46@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 35 | b2@46@01]
(assert b2@46@01)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@49@01 x@44@01 b2@46@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not b3@47@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b3@47@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | b3@47@01 | live]
; [else-branch: 36 | !(b3@47@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 36 | b3@47@01]
(assert b3@47@01)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* acc(x.f, 2 / 10) && (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10)))
(declare-const mwsf@51@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@51@01 $t@50@01)
    ($Snap.combine $t@49@01 ($Snap.combine ($Snap.second $t@48@01) $t@49@01)))
  :pattern ((MWSF_apply mwsf@51@01 $t@50@01))
  :qid |quant-u-20|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 36 | !(b3@47@01)]
(assert (not b3@47@01))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* acc(x.f, 2 / 10) && (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10)))
(declare-const mwsf@52@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@52@01 $t@50@01)
    ($Snap.combine
      $t@49@01
      ($Snap.combine ($Snap.second $t@48@01) ($Snap.second $t@48@01))))
  :pattern ((MWSF_apply mwsf@52@01 $t@50@01))
  :qid |quant-u-22|)))
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 35 | !(b2@46@01)]
(assert (not b2@46@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@49@01 x@44@01 b2@46@01))
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool $t@50@01)
  ($SortWrappers.$SnapToBool ($Snap.first $t@48@01))))
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not b3@47@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b3@47@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | b3@47@01 | live]
; [else-branch: 37 | !(b3@47@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 37 | b3@47@01]
(assert b3@47@01)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* acc(x.f, 2 / 10) && (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10)))
(declare-const mwsf@53@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@53@01 $t@50@01)
    ($Snap.combine
      ($Snap.first $t@48@01)
      ($Snap.combine $t@49@01 ($Snap.first $t@48@01))))
  :pattern ((MWSF_apply mwsf@53@01 $t@50@01))
  :qid |quant-u-24|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 37 | !(b3@47@01)]
(assert (not b3@47@01))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* acc(x.f, 2 / 10) && (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10)))
(declare-const mwsf@54@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@54@01 $t@50@01)
    ($Snap.combine ($Snap.first $t@48@01) ($Snap.combine $t@49@01 $t@49@01)))
  :pattern ((MWSF_apply mwsf@54@01 $t@50@01))
  :qid |quant-u-26|)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 34 | !(b1@45@01)]
(assert (not b1@45@01))
; [exec]
; unfold acc(P(x, b2), write)
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
(assert (not (not b2@46@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@46@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | b2@46@01 | live]
; [else-branch: 38 | !(b2@46@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | b2@46@01]
(assert b2@46@01)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@49@01 x@44@01 b2@46@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt $t@50@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@48@01))))
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not b3@47@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b3@47@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | b3@47@01 | live]
; [else-branch: 39 | !(b3@47@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 39 | b3@47@01]
(assert b3@47@01)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* acc(x.f, 2 / 10) && (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10)))
(declare-const mwsf@55@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@55@01 $t@50@01)
    ($Snap.combine $t@49@01 ($Snap.combine ($Snap.second $t@48@01) $t@49@01)))
  :pattern ((MWSF_apply mwsf@55@01 $t@50@01))
  :qid |quant-u-28|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 39 | !(b3@47@01)]
(assert (not b3@47@01))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* acc(x.f, 2 / 10) && (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10)))
(declare-const mwsf@56@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@56@01 $t@50@01)
    ($Snap.combine
      $t@49@01
      ($Snap.combine ($Snap.second $t@48@01) ($Snap.second $t@48@01))))
  :pattern ((MWSF_apply mwsf@56@01 $t@50@01))
  :qid |quant-u-30|)))
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 38 | !(b2@46@01)]
(assert (not b2@46@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@49@01 x@44@01 b2@46@01))
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not b3@47@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b3@47@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | b3@47@01 | live]
; [else-branch: 40 | !(b3@47@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 40 | b3@47@01]
(assert b3@47@01)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* acc(x.f, 2 / 10) && (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10)))
(declare-const mwsf@57@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@57@01 $t@50@01)
    ($Snap.combine
      ($Snap.first $t@48@01)
      ($Snap.combine $t@49@01 ($Snap.first $t@48@01))))
  :pattern ((MWSF_apply mwsf@57@01 $t@50@01))
  :qid |quant-u-32|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 40 | !(b3@47@01)]
(assert (not b3@47@01))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* acc(x.f, 2 / 10) && (acc(x.g, 2 / 10) && (b3 ? acc(x.f, 3 / 10) : acc(x.g, 3 / 10)))
(declare-const mwsf@58@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@58@01 $t@50@01)
    ($Snap.combine ($Snap.first $t@48@01) ($Snap.combine $t@49@01 $t@49@01)))
  :pattern ((MWSF_apply mwsf@58@01 $t@50@01))
  :qid |quant-u-34|)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (and b3@47@01 b2@46@01 b1@45@01))
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@51@01 $t@50@01)
    ($Snap.combine $t@49@01 ($Snap.combine ($Snap.second $t@48@01) $t@49@01)))
  :pattern ((MWSF_apply mwsf@51@01 $t@50@01))
  :qid |quant-u-21|)))
(assert true)
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 41 | !(b1@45@01) | live]
; [else-branch: 41 | b1@45@01 | live]
(push) ; 5
; [then-branch: 41 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 41 | b1@45@01]
(push) ; 6
; [then-branch: 42 | !(b2@46@01) | live]
; [else-branch: 42 | b2@46@01 | live]
(push) ; 7
; [then-branch: 42 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 42 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (or b2@46@01 (not b2@46@01))))
(assert (or b1@45@01 (not b1@45@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | b1@45@01 && b2@46@01 && b3@47@01 | live]
; [else-branch: 43 | !(b1@45@01 && b2@46@01 && b3@47@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 43 | b1@45@01 && b2@46@01 && b3@47@01]
(assert (and b1@45@01 (and b2@46@01 b3@47@01)))
; [eval] perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 44 | False | live]
; [else-branch: 44 | True | live]
(push) ; 7
; [then-branch: 44 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 44 | True]
; [eval] perm(x.g) >= 3 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> (and b1@45@01 (and b2@46@01 b3@47@01)) (and b1@45@01 b2@46@01 b3@47@01)))
(assert (and b1@45@01 (and b2@46@01 b3@47@01)))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 45 | !(b1@45@01) | live]
; [else-branch: 45 | b1@45@01 | live]
(push) ; 5
; [then-branch: 45 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | b1@45@01]
(push) ; 6
; [then-branch: 46 | !(b2@46@01) | live]
; [else-branch: 46 | b2@46@01 | live]
(push) ; 7
; [then-branch: 46 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 46 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 47 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 47 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 48 | !(b1@45@01) | live]
; [else-branch: 48 | b1@45@01 | live]
(push) ; 5
; [then-branch: 48 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 49 | b2@46@01 | live]
; [else-branch: 49 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 49 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 49 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (or (not b2@46@01) b2@46@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 50 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 50 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 51 | !(b1@45@01) | live]
; [else-branch: 51 | b1@45@01 | live]
(push) ; 5
; [then-branch: 51 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 51 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 52 | b2@46@01 | live]
; [else-branch: 52 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 52 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 52 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 53 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 53 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 54 | b1@45@01 | live]
; [else-branch: 54 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 54 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 54 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 55 | !(b2@46@01) | live]
; [else-branch: 55 | b2@46@01 | live]
(push) ; 7
; [then-branch: 55 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 55 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (and (not b1@45@01) (or b2@46@01 (not b2@46@01)))))
(assert (or (not b1@45@01) b1@45@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 56 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 56 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 56 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 57 | b1@45@01 | live]
; [else-branch: 57 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 57 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 57 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 58 | !(b2@46@01) | live]
; [else-branch: 58 | b2@46@01 | live]
(push) ; 7
; [then-branch: 58 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 58 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 59 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 59 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 59 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 60 | b1@45@01 | live]
; [else-branch: 60 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 60 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 60 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 61 | b2@46@01 | live]
; [else-branch: 61 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 61 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 61 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (and (not b1@45@01) (or (not b2@46@01) b2@46@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 62 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 62 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 62 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 63 | b1@45@01 | live]
; [else-branch: 63 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 63 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 63 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 64 | b2@46@01 | live]
; [else-branch: 64 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 64 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 64 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 65 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 65 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 65 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 66 | !(b1@45@01) | live]
; [else-branch: 66 | b1@45@01 | live]
(push) ; 5
; [then-branch: 66 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 66 | b1@45@01]
(push) ; 6
; [then-branch: 67 | !(b2@46@01) | live]
; [else-branch: 67 | b2@46@01 | live]
(push) ; 7
; [then-branch: 67 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 67 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 68 | b1@45@01 && b2@46@01 && b3@47@01 | live]
; [else-branch: 68 | !(b1@45@01 && b2@46@01 && b3@47@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 68 | b1@45@01 && b2@46@01 && b3@47@01]
(assert (and b1@45@01 (and b2@46@01 b3@47@01)))
; [eval] perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 69 | False | live]
; [else-branch: 69 | True | live]
(push) ; 7
; [then-branch: 69 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 69 | True]
; [eval] perm(x.g) == 3 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@45@01 (and b2@46@01 b3@47@01)))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 70 | !(b1@45@01) | live]
; [else-branch: 70 | b1@45@01 | live]
(push) ; 5
; [then-branch: 70 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 70 | b1@45@01]
(push) ; 6
; [then-branch: 71 | !(b2@46@01) | live]
; [else-branch: 71 | b2@46@01 | live]
(push) ; 7
; [then-branch: 71 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 71 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 72 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 72 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 72 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 73 | !(b1@45@01) | live]
; [else-branch: 73 | b1@45@01 | live]
(push) ; 5
; [then-branch: 73 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 73 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 74 | b2@46@01 | live]
; [else-branch: 74 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 74 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 74 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 75 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 75 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 75 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 76 | !(b1@45@01) | live]
; [else-branch: 76 | b1@45@01 | live]
(push) ; 5
; [then-branch: 76 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 76 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 77 | b2@46@01 | live]
; [else-branch: 77 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 77 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 77 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 78 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 78 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 78 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 79 | b1@45@01 | live]
; [else-branch: 79 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 79 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 79 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 80 | !(b2@46@01) | live]
; [else-branch: 80 | b2@46@01 | live]
(push) ; 7
; [then-branch: 80 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 80 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 81 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 81 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 81 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 82 | b1@45@01 | live]
; [else-branch: 82 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 82 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 82 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 83 | !(b2@46@01) | live]
; [else-branch: 83 | b2@46@01 | live]
(push) ; 7
; [then-branch: 83 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 83 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 84 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 84 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 84 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 85 | b1@45@01 | live]
; [else-branch: 85 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 85 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 85 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 86 | b2@46@01 | live]
; [else-branch: 86 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 86 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 86 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 87 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 87 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 87 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 88 | b1@45@01 | live]
; [else-branch: 88 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 88 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 88 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 89 | b2@46@01 | live]
; [else-branch: 89 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 89 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 89 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 90 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 90 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 90 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 91 | b1@45@01 | live]
; [else-branch: 91 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 91 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 91 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 92 | b2@46@01 | live]
; [else-branch: 92 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 92 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 92 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 93 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 93 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 93 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and (not b3@47@01) b2@46@01 b1@45@01))
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@52@01 $t@50@01)
    ($Snap.combine
      $t@49@01
      ($Snap.combine ($Snap.second $t@48@01) ($Snap.second $t@48@01))))
  :pattern ((MWSF_apply mwsf@52@01 $t@50@01))
  :qid |quant-u-23|)))
(assert true)
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 94 | !(b1@45@01) | live]
; [else-branch: 94 | b1@45@01 | live]
(push) ; 5
; [then-branch: 94 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 94 | b1@45@01]
(push) ; 6
; [then-branch: 95 | !(b2@46@01) | live]
; [else-branch: 95 | b2@46@01 | live]
(push) ; 7
; [then-branch: 95 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 95 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (or b2@46@01 (not b2@46@01))))
(assert (or b1@45@01 (not b1@45@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 96 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 96 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 96 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 97 | !(b1@45@01) | live]
; [else-branch: 97 | b1@45@01 | live]
(push) ; 5
; [then-branch: 97 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 97 | b1@45@01]
(push) ; 6
; [then-branch: 98 | !(b2@46@01) | live]
; [else-branch: 98 | b2@46@01 | live]
(push) ; 7
; [then-branch: 98 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 98 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 99 | b1@45@01 && b2@46@01 && !(b3@47@01) | live]
; [else-branch: 99 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 99 | b1@45@01 && b2@46@01 && !(b3@47@01)]
(assert (and b1@45@01 (and b2@46@01 (not b3@47@01))))
; [eval] perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 100 | False | live]
; [else-branch: 100 | True | live]
(push) ; 7
; [then-branch: 100 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 100 | True]
; [eval] perm(x.g) >= none
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and b1@45@01 (and b2@46@01 (not b3@47@01)))
  (and b1@45@01 b2@46@01 (not b3@47@01))))
(assert (and b1@45@01 (and b2@46@01 (not b3@47@01))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 101 | !(b1@45@01) | live]
; [else-branch: 101 | b1@45@01 | live]
(push) ; 5
; [then-branch: 101 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 101 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 102 | b2@46@01 | live]
; [else-branch: 102 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 102 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 102 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (or (not b2@46@01) b2@46@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 103 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 103 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 103 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 104 | !(b1@45@01) | live]
; [else-branch: 104 | b1@45@01 | live]
(push) ; 5
; [then-branch: 104 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 104 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 105 | b2@46@01 | live]
; [else-branch: 105 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 105 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 105 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 106 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 106 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 106 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 107 | b1@45@01 | live]
; [else-branch: 107 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 107 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 107 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 108 | !(b2@46@01) | live]
; [else-branch: 108 | b2@46@01 | live]
(push) ; 7
; [then-branch: 108 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 108 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (and (not b1@45@01) (or b2@46@01 (not b2@46@01)))))
(assert (or (not b1@45@01) b1@45@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 109 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 109 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 109 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 110 | b1@45@01 | live]
; [else-branch: 110 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 110 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 110 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 111 | !(b2@46@01) | live]
; [else-branch: 111 | b2@46@01 | live]
(push) ; 7
; [then-branch: 111 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 111 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 112 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 112 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 112 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 113 | b1@45@01 | live]
; [else-branch: 113 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 113 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 113 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 114 | b2@46@01 | live]
; [else-branch: 114 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 114 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 114 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (and (not b1@45@01) (or (not b2@46@01) b2@46@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 115 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 115 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 115 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 116 | b1@45@01 | live]
; [else-branch: 116 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 116 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 116 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 117 | b2@46@01 | live]
; [else-branch: 117 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 117 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 117 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 118 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 118 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 118 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 119 | !(b1@45@01) | live]
; [else-branch: 119 | b1@45@01 | live]
(push) ; 5
; [then-branch: 119 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 119 | b1@45@01]
(push) ; 6
; [then-branch: 120 | !(b2@46@01) | live]
; [else-branch: 120 | b2@46@01 | live]
(push) ; 7
; [then-branch: 120 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 120 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 121 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 121 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 121 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 122 | !(b1@45@01) | live]
; [else-branch: 122 | b1@45@01 | live]
(push) ; 5
; [then-branch: 122 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 122 | b1@45@01]
(push) ; 6
; [then-branch: 123 | !(b2@46@01) | live]
; [else-branch: 123 | b2@46@01 | live]
(push) ; 7
; [then-branch: 123 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 123 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 124 | b1@45@01 && b2@46@01 && !(b3@47@01) | live]
; [else-branch: 124 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 124 | b1@45@01 && b2@46@01 && !(b3@47@01)]
(assert (and b1@45@01 (and b2@46@01 (not b3@47@01))))
; [eval] perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 125 | False | live]
; [else-branch: 125 | True | live]
(push) ; 7
; [then-branch: 125 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 125 | True]
; [eval] perm(x.g) == none
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@45@01 (and b2@46@01 (not b3@47@01))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 126 | !(b1@45@01) | live]
; [else-branch: 126 | b1@45@01 | live]
(push) ; 5
; [then-branch: 126 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 126 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 127 | b2@46@01 | live]
; [else-branch: 127 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 127 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 127 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 128 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 128 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 128 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 129 | !(b1@45@01) | live]
; [else-branch: 129 | b1@45@01 | live]
(push) ; 5
; [then-branch: 129 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 129 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 130 | b2@46@01 | live]
; [else-branch: 130 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 130 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 130 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 131 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 131 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 131 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 132 | b1@45@01 | live]
; [else-branch: 132 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 132 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 132 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 133 | !(b2@46@01) | live]
; [else-branch: 133 | b2@46@01 | live]
(push) ; 7
; [then-branch: 133 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 133 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 134 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 134 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 134 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 135 | b1@45@01 | live]
; [else-branch: 135 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 135 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 135 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 136 | !(b2@46@01) | live]
; [else-branch: 136 | b2@46@01 | live]
(push) ; 7
; [then-branch: 136 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 136 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 137 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 137 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 137 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 138 | b1@45@01 | live]
; [else-branch: 138 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 138 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 138 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 139 | b2@46@01 | live]
; [else-branch: 139 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 139 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 139 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 140 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 140 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 140 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 141 | b1@45@01 | live]
; [else-branch: 141 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 141 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 141 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 142 | b2@46@01 | live]
; [else-branch: 142 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 142 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 142 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 143 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 143 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 143 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 144 | b1@45@01 | live]
; [else-branch: 144 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 144 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 144 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 145 | b2@46@01 | live]
; [else-branch: 145 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 145 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 145 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 146 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 146 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 146 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and b3@47@01 (not b2@46@01) b1@45@01))
(assert (forall (($t@50@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToBool $t@50@01)
      ($SortWrappers.$SnapToBool ($Snap.first $t@48@01)))
    (=
      (MWSF_apply mwsf@53@01 $t@50@01)
      ($Snap.combine
        ($Snap.first $t@48@01)
        ($Snap.combine $t@49@01 ($Snap.first $t@48@01)))))
  :pattern ((MWSF_apply mwsf@53@01 $t@50@01))
  :qid |quant-u-25|)))
(assert true)
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 147 | !(b1@45@01) | live]
; [else-branch: 147 | b1@45@01 | live]
(push) ; 5
; [then-branch: 147 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 147 | b1@45@01]
(push) ; 6
; [then-branch: 148 | !(b2@46@01) | live]
; [else-branch: 148 | b2@46@01 | live]
(push) ; 7
; [then-branch: 148 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 148 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (or b2@46@01 (not b2@46@01))))
(assert (or b1@45@01 (not b1@45@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 149 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 149 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 149 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 150 | !(b1@45@01) | live]
; [else-branch: 150 | b1@45@01 | live]
(push) ; 5
; [then-branch: 150 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 150 | b1@45@01]
(push) ; 6
; [then-branch: 151 | !(b2@46@01) | live]
; [else-branch: 151 | b2@46@01 | live]
(push) ; 7
; [then-branch: 151 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 151 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 152 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 152 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 152 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 153 | !(b1@45@01) | live]
; [else-branch: 153 | b1@45@01 | live]
(push) ; 5
; [then-branch: 153 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 153 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 154 | b2@46@01 | live]
; [else-branch: 154 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 154 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 154 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (or (not b2@46@01) b2@46@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 155 | b1@45@01 && !(b2@46@01) && b3@47@01 | live]
; [else-branch: 155 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 155 | b1@45@01 && !(b2@46@01) && b3@47@01]
(assert (and b1@45@01 (and (not b2@46@01) b3@47@01)))
; [eval] perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 1 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 156 | False | live]
; [else-branch: 156 | True | live]
(push) ; 7
; [then-branch: 156 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 156 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and b1@45@01 (and (not b2@46@01) b3@47@01))
  (and b1@45@01 (not b2@46@01) b3@47@01)))
(assert (and b1@45@01 (and (not b2@46@01) b3@47@01)))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 157 | !(b1@45@01) | live]
; [else-branch: 157 | b1@45@01 | live]
(push) ; 5
; [then-branch: 157 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 157 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 158 | b2@46@01 | live]
; [else-branch: 158 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 158 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 158 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 159 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 159 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 159 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 160 | b1@45@01 | live]
; [else-branch: 160 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 160 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 160 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 161 | !(b2@46@01) | live]
; [else-branch: 161 | b2@46@01 | live]
(push) ; 7
; [then-branch: 161 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 161 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (and (not b1@45@01) (or b2@46@01 (not b2@46@01)))))
(assert (or (not b1@45@01) b1@45@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 162 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 162 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 162 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 163 | b1@45@01 | live]
; [else-branch: 163 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 163 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 163 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 164 | !(b2@46@01) | live]
; [else-branch: 164 | b2@46@01 | live]
(push) ; 7
; [then-branch: 164 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 164 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 165 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 165 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 165 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 166 | b1@45@01 | live]
; [else-branch: 166 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 166 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 166 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 167 | b2@46@01 | live]
; [else-branch: 167 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 167 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 167 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (and (not b1@45@01) (or (not b2@46@01) b2@46@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 168 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 168 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 168 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 169 | b1@45@01 | live]
; [else-branch: 169 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 169 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 169 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 170 | b2@46@01 | live]
; [else-branch: 170 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 170 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 170 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 171 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 171 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 171 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 172 | !(b1@45@01) | live]
; [else-branch: 172 | b1@45@01 | live]
(push) ; 5
; [then-branch: 172 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 172 | b1@45@01]
(push) ; 6
; [then-branch: 173 | !(b2@46@01) | live]
; [else-branch: 173 | b2@46@01 | live]
(push) ; 7
; [then-branch: 173 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 173 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 174 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 174 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 174 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 175 | !(b1@45@01) | live]
; [else-branch: 175 | b1@45@01 | live]
(push) ; 5
; [then-branch: 175 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 175 | b1@45@01]
(push) ; 6
; [then-branch: 176 | !(b2@46@01) | live]
; [else-branch: 176 | b2@46@01 | live]
(push) ; 7
; [then-branch: 176 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 176 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 177 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 177 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 177 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 178 | !(b1@45@01) | live]
; [else-branch: 178 | b1@45@01 | live]
(push) ; 5
; [then-branch: 178 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 178 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 179 | b2@46@01 | live]
; [else-branch: 179 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 179 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 179 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 180 | b1@45@01 && !(b2@46@01) && b3@47@01 | live]
; [else-branch: 180 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 180 | b1@45@01 && !(b2@46@01) && b3@47@01]
(assert (and b1@45@01 (and (not b2@46@01) b3@47@01)))
; [eval] perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 1 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 181 | False | live]
; [else-branch: 181 | True | live]
(push) ; 7
; [then-branch: 181 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 181 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@45@01 (and (not b2@46@01) b3@47@01)))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 182 | !(b1@45@01) | live]
; [else-branch: 182 | b1@45@01 | live]
(push) ; 5
; [then-branch: 182 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 182 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 183 | b2@46@01 | live]
; [else-branch: 183 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 183 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 183 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 184 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 184 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 184 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 185 | b1@45@01 | live]
; [else-branch: 185 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 185 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 185 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 186 | !(b2@46@01) | live]
; [else-branch: 186 | b2@46@01 | live]
(push) ; 7
; [then-branch: 186 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 186 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 187 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 187 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 187 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 188 | b1@45@01 | live]
; [else-branch: 188 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 188 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 188 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 189 | !(b2@46@01) | live]
; [else-branch: 189 | b2@46@01 | live]
(push) ; 7
; [then-branch: 189 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 189 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 190 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 190 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 190 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 191 | b1@45@01 | live]
; [else-branch: 191 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 191 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 191 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 192 | b2@46@01 | live]
; [else-branch: 192 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 192 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 192 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 193 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 193 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 193 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 194 | b1@45@01 | live]
; [else-branch: 194 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 194 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 194 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 195 | b2@46@01 | live]
; [else-branch: 195 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 195 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 195 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 196 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 196 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 196 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 197 | b1@45@01 | live]
; [else-branch: 197 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 197 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 197 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 198 | b2@46@01 | live]
; [else-branch: 198 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 198 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 198 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 199 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 199 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 199 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and (not b3@47@01) (not b2@46@01) b1@45@01))
(assert (forall (($t@50@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToBool $t@50@01)
      ($SortWrappers.$SnapToBool ($Snap.first $t@48@01)))
    (=
      (MWSF_apply mwsf@54@01 $t@50@01)
      ($Snap.combine ($Snap.first $t@48@01) ($Snap.combine $t@49@01 $t@49@01))))
  :pattern ((MWSF_apply mwsf@54@01 $t@50@01))
  :qid |quant-u-27|)))
(assert true)
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 200 | !(b1@45@01) | live]
; [else-branch: 200 | b1@45@01 | live]
(push) ; 5
; [then-branch: 200 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 200 | b1@45@01]
(push) ; 6
; [then-branch: 201 | !(b2@46@01) | live]
; [else-branch: 201 | b2@46@01 | live]
(push) ; 7
; [then-branch: 201 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 201 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (or b2@46@01 (not b2@46@01))))
(assert (or b1@45@01 (not b1@45@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 202 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 202 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 202 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 203 | !(b1@45@01) | live]
; [else-branch: 203 | b1@45@01 | live]
(push) ; 5
; [then-branch: 203 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 203 | b1@45@01]
(push) ; 6
; [then-branch: 204 | !(b2@46@01) | live]
; [else-branch: 204 | b2@46@01 | live]
(push) ; 7
; [then-branch: 204 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 204 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 205 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 205 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 205 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 206 | !(b1@45@01) | live]
; [else-branch: 206 | b1@45@01 | live]
(push) ; 5
; [then-branch: 206 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 206 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 207 | b2@46@01 | live]
; [else-branch: 207 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 207 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 207 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (or (not b2@46@01) b2@46@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 208 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 208 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 208 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 209 | !(b1@45@01) | live]
; [else-branch: 209 | b1@45@01 | live]
(push) ; 5
; [then-branch: 209 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 209 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 210 | b2@46@01 | live]
; [else-branch: 210 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 210 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 210 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 211 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | live]
; [else-branch: 211 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 211 | b1@45@01 && !(b2@46@01) && !(b3@47@01)]
(assert (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))
; [eval] perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 4 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 212 | False | live]
; [else-branch: 212 | True | live]
(push) ; 7
; [then-branch: 212 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 212 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))
  (and b1@45@01 (not b2@46@01) (not b3@47@01))))
(assert (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 213 | b1@45@01 | live]
; [else-branch: 213 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 213 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 213 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 214 | !(b2@46@01) | live]
; [else-branch: 214 | b2@46@01 | live]
(push) ; 7
; [then-branch: 214 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 214 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (and (not b1@45@01) (or b2@46@01 (not b2@46@01)))))
(assert (or (not b1@45@01) b1@45@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 215 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 215 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 215 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 216 | b1@45@01 | live]
; [else-branch: 216 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 216 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 216 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 217 | !(b2@46@01) | live]
; [else-branch: 217 | b2@46@01 | live]
(push) ; 7
; [then-branch: 217 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 217 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 218 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 218 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 218 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 219 | b1@45@01 | live]
; [else-branch: 219 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 219 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 219 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 220 | b2@46@01 | live]
; [else-branch: 220 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 220 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 220 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (and (not b1@45@01) (or (not b2@46@01) b2@46@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 221 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 221 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 221 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 222 | b1@45@01 | live]
; [else-branch: 222 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 222 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 222 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 223 | b2@46@01 | live]
; [else-branch: 223 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 223 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 223 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 224 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 224 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 224 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 225 | !(b1@45@01) | live]
; [else-branch: 225 | b1@45@01 | live]
(push) ; 5
; [then-branch: 225 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 225 | b1@45@01]
(push) ; 6
; [then-branch: 226 | !(b2@46@01) | live]
; [else-branch: 226 | b2@46@01 | live]
(push) ; 7
; [then-branch: 226 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 226 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 227 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 227 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 227 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 228 | !(b1@45@01) | live]
; [else-branch: 228 | b1@45@01 | live]
(push) ; 5
; [then-branch: 228 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 228 | b1@45@01]
(push) ; 6
; [then-branch: 229 | !(b2@46@01) | live]
; [else-branch: 229 | b2@46@01 | live]
(push) ; 7
; [then-branch: 229 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 229 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 230 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 230 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 230 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 231 | !(b1@45@01) | live]
; [else-branch: 231 | b1@45@01 | live]
(push) ; 5
; [then-branch: 231 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 231 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 232 | b2@46@01 | live]
; [else-branch: 232 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 232 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 232 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 233 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 233 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 233 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 234 | !(b1@45@01) | live]
; [else-branch: 234 | b1@45@01 | live]
(push) ; 5
; [then-branch: 234 | !(b1@45@01)]
(assert (not b1@45@01))
(pop) ; 5
(push) ; 5
; [else-branch: 234 | b1@45@01]
; [eval] !b2
(push) ; 6
; [then-branch: 235 | b2@46@01 | live]
; [else-branch: 235 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 235 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 235 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 236 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | live]
; [else-branch: 236 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 236 | b1@45@01 && !(b2@46@01) && !(b3@47@01)]
(assert (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))
; [eval] perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 4 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 237 | False | live]
; [else-branch: 237 | True | live]
(push) ; 7
; [then-branch: 237 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 237 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 238 | b1@45@01 | live]
; [else-branch: 238 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 238 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 238 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 239 | !(b2@46@01) | live]
; [else-branch: 239 | b2@46@01 | live]
(push) ; 7
; [then-branch: 239 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 239 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 240 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 240 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 240 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 241 | b1@45@01 | live]
; [else-branch: 241 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 241 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 241 | !(b1@45@01)]
(assert (not b1@45@01))
(push) ; 6
; [then-branch: 242 | !(b2@46@01) | live]
; [else-branch: 242 | b2@46@01 | live]
(push) ; 7
; [then-branch: 242 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 242 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 243 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 243 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 243 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 244 | b1@45@01 | live]
; [else-branch: 244 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 244 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 244 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 245 | b2@46@01 | live]
; [else-branch: 245 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 245 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 245 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 246 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 246 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 246 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 247 | b1@45@01 | live]
; [else-branch: 247 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 247 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 247 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 248 | b2@46@01 | live]
; [else-branch: 248 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 248 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 248 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 249 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 249 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 249 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 250 | b1@45@01 | live]
; [else-branch: 250 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 250 | b1@45@01]
(pop) ; 5
(push) ; 5
; [else-branch: 250 | !(b1@45@01)]
(assert (not b1@45@01))
; [eval] !b2
(push) ; 6
; [then-branch: 251 | b2@46@01 | live]
; [else-branch: 251 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 251 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 251 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 252 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 252 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 252 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and b3@47@01 b2@46@01 (not b1@45@01)))
(assert (forall (($t@50@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToInt $t@50@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@48@01)))
    (=
      (MWSF_apply mwsf@55@01 $t@50@01)
      ($Snap.combine $t@49@01 ($Snap.combine ($Snap.second $t@48@01) $t@49@01))))
  :pattern ((MWSF_apply mwsf@55@01 $t@50@01))
  :qid |quant-u-29|)))
(assert true)
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 253 | !(b1@45@01) | live]
; [else-branch: 253 | b1@45@01 | live]
(push) ; 5
; [then-branch: 253 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 253 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 254 | !(b2@46@01) | live]
; [else-branch: 254 | b2@46@01 | live]
(push) ; 7
; [then-branch: 254 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 254 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (and b1@45@01 (or b2@46@01 (not b2@46@01)))))
(assert (or b1@45@01 (not b1@45@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 255 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 255 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 255 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 256 | !(b1@45@01) | live]
; [else-branch: 256 | b1@45@01 | live]
(push) ; 5
; [then-branch: 256 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 256 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 257 | !(b2@46@01) | live]
; [else-branch: 257 | b2@46@01 | live]
(push) ; 7
; [then-branch: 257 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 257 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 258 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 258 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 258 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 259 | !(b1@45@01) | live]
; [else-branch: 259 | b1@45@01 | live]
(push) ; 5
; [then-branch: 259 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 259 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 260 | b2@46@01 | live]
; [else-branch: 260 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 260 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 260 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (and b1@45@01 (or (not b2@46@01) b2@46@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 261 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 261 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 261 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 262 | !(b1@45@01) | live]
; [else-branch: 262 | b1@45@01 | live]
(push) ; 5
; [then-branch: 262 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 262 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 263 | b2@46@01 | live]
; [else-branch: 263 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 263 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 263 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 264 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 264 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 264 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 265 | b1@45@01 | live]
; [else-branch: 265 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 265 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 265 | !(b1@45@01)]
(push) ; 6
; [then-branch: 266 | !(b2@46@01) | live]
; [else-branch: 266 | b2@46@01 | live]
(push) ; 7
; [then-branch: 266 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 266 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (or b2@46@01 (not b2@46@01))))
(assert (or (not b1@45@01) b1@45@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 267 | !(b1@45@01) && b2@46@01 && b3@47@01 | live]
; [else-branch: 267 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 267 | !(b1@45@01) && b2@46@01 && b3@47@01]
(assert (and (not b1@45@01) (and b2@46@01 b3@47@01)))
; [eval] perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 268 | False | live]
; [else-branch: 268 | True | live]
(push) ; 7
; [then-branch: 268 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 268 | True]
; [eval] perm(x.g) >= 4 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (not b1@45@01) (and b2@46@01 b3@47@01))
  (and (not b1@45@01) b2@46@01 b3@47@01)))
(assert (and (not b1@45@01) (and b2@46@01 b3@47@01)))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 269 | b1@45@01 | live]
; [else-branch: 269 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 269 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 269 | !(b1@45@01)]
(push) ; 6
; [then-branch: 270 | !(b2@46@01) | live]
; [else-branch: 270 | b2@46@01 | live]
(push) ; 7
; [then-branch: 270 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 270 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 271 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 271 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 271 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 272 | b1@45@01 | live]
; [else-branch: 272 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 272 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 272 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 273 | b2@46@01 | live]
; [else-branch: 273 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 273 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 273 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (or (not b2@46@01) b2@46@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 274 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 274 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 274 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 275 | b1@45@01 | live]
; [else-branch: 275 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 275 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 275 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 276 | b2@46@01 | live]
; [else-branch: 276 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 276 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 276 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 277 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 277 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 277 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 278 | !(b1@45@01) | live]
; [else-branch: 278 | b1@45@01 | live]
(push) ; 5
; [then-branch: 278 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 278 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 279 | !(b2@46@01) | live]
; [else-branch: 279 | b2@46@01 | live]
(push) ; 7
; [then-branch: 279 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 279 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 280 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 280 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 280 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 281 | !(b1@45@01) | live]
; [else-branch: 281 | b1@45@01 | live]
(push) ; 5
; [then-branch: 281 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 281 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 282 | !(b2@46@01) | live]
; [else-branch: 282 | b2@46@01 | live]
(push) ; 7
; [then-branch: 282 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 282 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 283 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 283 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 283 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 284 | !(b1@45@01) | live]
; [else-branch: 284 | b1@45@01 | live]
(push) ; 5
; [then-branch: 284 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 284 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 285 | b2@46@01 | live]
; [else-branch: 285 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 285 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 285 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 286 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 286 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 286 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 287 | !(b1@45@01) | live]
; [else-branch: 287 | b1@45@01 | live]
(push) ; 5
; [then-branch: 287 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 287 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 288 | b2@46@01 | live]
; [else-branch: 288 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 288 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 288 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 289 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 289 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 289 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 290 | b1@45@01 | live]
; [else-branch: 290 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 290 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 290 | !(b1@45@01)]
(push) ; 6
; [then-branch: 291 | !(b2@46@01) | live]
; [else-branch: 291 | b2@46@01 | live]
(push) ; 7
; [then-branch: 291 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 291 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 292 | !(b1@45@01) && b2@46@01 && b3@47@01 | live]
; [else-branch: 292 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 292 | !(b1@45@01) && b2@46@01 && b3@47@01]
(assert (and (not b1@45@01) (and b2@46@01 b3@47@01)))
; [eval] perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 293 | False | live]
; [else-branch: 293 | True | live]
(push) ; 7
; [then-branch: 293 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 293 | True]
; [eval] perm(x.g) == 4 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@45@01) (and b2@46@01 b3@47@01)))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 294 | b1@45@01 | live]
; [else-branch: 294 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 294 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 294 | !(b1@45@01)]
(push) ; 6
; [then-branch: 295 | !(b2@46@01) | live]
; [else-branch: 295 | b2@46@01 | live]
(push) ; 7
; [then-branch: 295 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 295 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 296 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 296 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 296 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 297 | b1@45@01 | live]
; [else-branch: 297 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 297 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 297 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 298 | b2@46@01 | live]
; [else-branch: 298 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 298 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 298 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 299 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 299 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 299 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 300 | b1@45@01 | live]
; [else-branch: 300 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 300 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 300 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 301 | b2@46@01 | live]
; [else-branch: 301 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 301 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 301 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 302 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 302 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 302 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 303 | b1@45@01 | live]
; [else-branch: 303 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 303 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 303 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 304 | b2@46@01 | live]
; [else-branch: 304 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 304 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 304 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 305 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 305 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 305 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and (not b3@47@01) b2@46@01 (not b1@45@01)))
(assert (forall (($t@50@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToInt $t@50@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@48@01)))
    (=
      (MWSF_apply mwsf@56@01 $t@50@01)
      ($Snap.combine
        $t@49@01
        ($Snap.combine ($Snap.second $t@48@01) ($Snap.second $t@48@01)))))
  :pattern ((MWSF_apply mwsf@56@01 $t@50@01))
  :qid |quant-u-31|)))
(assert true)
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 306 | !(b1@45@01) | live]
; [else-branch: 306 | b1@45@01 | live]
(push) ; 5
; [then-branch: 306 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 306 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 307 | !(b2@46@01) | live]
; [else-branch: 307 | b2@46@01 | live]
(push) ; 7
; [then-branch: 307 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 307 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (and b1@45@01 (or b2@46@01 (not b2@46@01)))))
(assert (or b1@45@01 (not b1@45@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 308 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 308 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 308 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 309 | !(b1@45@01) | live]
; [else-branch: 309 | b1@45@01 | live]
(push) ; 5
; [then-branch: 309 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 309 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 310 | !(b2@46@01) | live]
; [else-branch: 310 | b2@46@01 | live]
(push) ; 7
; [then-branch: 310 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 310 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 311 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 311 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 311 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 312 | !(b1@45@01) | live]
; [else-branch: 312 | b1@45@01 | live]
(push) ; 5
; [then-branch: 312 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 312 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 313 | b2@46@01 | live]
; [else-branch: 313 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 313 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 313 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (and b1@45@01 (or (not b2@46@01) b2@46@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 314 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 314 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 314 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 315 | !(b1@45@01) | live]
; [else-branch: 315 | b1@45@01 | live]
(push) ; 5
; [then-branch: 315 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 315 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 316 | b2@46@01 | live]
; [else-branch: 316 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 316 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 316 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 317 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 317 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 317 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 318 | b1@45@01 | live]
; [else-branch: 318 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 318 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 318 | !(b1@45@01)]
(push) ; 6
; [then-branch: 319 | !(b2@46@01) | live]
; [else-branch: 319 | b2@46@01 | live]
(push) ; 7
; [then-branch: 319 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 319 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (or b2@46@01 (not b2@46@01))))
(assert (or (not b1@45@01) b1@45@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 320 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 320 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 320 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 321 | b1@45@01 | live]
; [else-branch: 321 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 321 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 321 | !(b1@45@01)]
(push) ; 6
; [then-branch: 322 | !(b2@46@01) | live]
; [else-branch: 322 | b2@46@01 | live]
(push) ; 7
; [then-branch: 322 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 322 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 323 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | live]
; [else-branch: 323 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 323 | !(b1@45@01) && b2@46@01 && !(b3@47@01)]
(assert (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))
; [eval] perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 324 | False | live]
; [else-branch: 324 | True | live]
(push) ; 7
; [then-branch: 324 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 324 | True]
; [eval] perm(x.g) >= 1 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))
  (and (not b1@45@01) b2@46@01 (not b3@47@01))))
(assert (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 325 | b1@45@01 | live]
; [else-branch: 325 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 325 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 325 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 326 | b2@46@01 | live]
; [else-branch: 326 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 326 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 326 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (or (not b2@46@01) b2@46@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 327 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 327 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 327 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 328 | b1@45@01 | live]
; [else-branch: 328 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 328 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 328 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 329 | b2@46@01 | live]
; [else-branch: 329 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 329 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 329 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 330 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 330 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 330 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 331 | !(b1@45@01) | live]
; [else-branch: 331 | b1@45@01 | live]
(push) ; 5
; [then-branch: 331 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 331 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 332 | !(b2@46@01) | live]
; [else-branch: 332 | b2@46@01 | live]
(push) ; 7
; [then-branch: 332 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 332 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 333 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 333 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 333 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 334 | !(b1@45@01) | live]
; [else-branch: 334 | b1@45@01 | live]
(push) ; 5
; [then-branch: 334 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 334 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 335 | !(b2@46@01) | live]
; [else-branch: 335 | b2@46@01 | live]
(push) ; 7
; [then-branch: 335 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 335 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 336 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 336 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 336 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 337 | !(b1@45@01) | live]
; [else-branch: 337 | b1@45@01 | live]
(push) ; 5
; [then-branch: 337 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 337 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 338 | b2@46@01 | live]
; [else-branch: 338 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 338 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 338 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 339 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 339 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 339 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 340 | !(b1@45@01) | live]
; [else-branch: 340 | b1@45@01 | live]
(push) ; 5
; [then-branch: 340 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 340 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 341 | b2@46@01 | live]
; [else-branch: 341 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 341 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 341 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 342 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 342 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 342 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 343 | b1@45@01 | live]
; [else-branch: 343 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 343 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 343 | !(b1@45@01)]
(push) ; 6
; [then-branch: 344 | !(b2@46@01) | live]
; [else-branch: 344 | b2@46@01 | live]
(push) ; 7
; [then-branch: 344 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 344 | b2@46@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 345 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 345 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 345 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 346 | b1@45@01 | live]
; [else-branch: 346 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 346 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 346 | !(b1@45@01)]
(push) ; 6
; [then-branch: 347 | !(b2@46@01) | live]
; [else-branch: 347 | b2@46@01 | live]
(push) ; 7
; [then-branch: 347 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(push) ; 7
; [else-branch: 347 | b2@46@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 348 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | live]
; [else-branch: 348 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 348 | !(b1@45@01) && b2@46@01 && !(b3@47@01)]
(assert (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))
; [eval] perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 349 | False | live]
; [else-branch: 349 | True | live]
(push) ; 7
; [then-branch: 349 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 349 | True]
; [eval] perm(x.g) == 1 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 350 | b1@45@01 | live]
; [else-branch: 350 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 350 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 350 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 351 | b2@46@01 | live]
; [else-branch: 351 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 351 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 351 | !(b2@46@01)]
(assert (not b2@46@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 352 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 352 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 352 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 353 | b1@45@01 | live]
; [else-branch: 353 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 353 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 353 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 354 | b2@46@01 | live]
; [else-branch: 354 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 354 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 354 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 355 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 355 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 355 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 356 | b1@45@01 | live]
; [else-branch: 356 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 356 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 356 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 357 | b2@46@01 | live]
; [else-branch: 357 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 357 | b2@46@01]
(pop) ; 7
(push) ; 7
; [else-branch: 357 | !(b2@46@01)]
(assert (not b2@46@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 358 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 358 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 358 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and b3@47@01 (not b2@46@01) (not b1@45@01)))
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@57@01 $t@50@01)
    ($Snap.combine
      ($Snap.first $t@48@01)
      ($Snap.combine $t@49@01 ($Snap.first $t@48@01))))
  :pattern ((MWSF_apply mwsf@57@01 $t@50@01))
  :qid |quant-u-33|)))
(assert true)
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 359 | !(b1@45@01) | live]
; [else-branch: 359 | b1@45@01 | live]
(push) ; 5
; [then-branch: 359 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 359 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 360 | !(b2@46@01) | live]
; [else-branch: 360 | b2@46@01 | live]
(push) ; 7
; [then-branch: 360 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 360 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (and b1@45@01 (or b2@46@01 (not b2@46@01)))))
(assert (or b1@45@01 (not b1@45@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 361 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 361 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 361 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 362 | !(b1@45@01) | live]
; [else-branch: 362 | b1@45@01 | live]
(push) ; 5
; [then-branch: 362 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 362 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 363 | !(b2@46@01) | live]
; [else-branch: 363 | b2@46@01 | live]
(push) ; 7
; [then-branch: 363 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 363 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 364 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 364 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 364 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 365 | !(b1@45@01) | live]
; [else-branch: 365 | b1@45@01 | live]
(push) ; 5
; [then-branch: 365 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 365 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 366 | b2@46@01 | live]
; [else-branch: 366 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 366 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 366 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (and b1@45@01 (or (not b2@46@01) b2@46@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 367 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 367 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 367 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 368 | !(b1@45@01) | live]
; [else-branch: 368 | b1@45@01 | live]
(push) ; 5
; [then-branch: 368 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 368 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 369 | b2@46@01 | live]
; [else-branch: 369 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 369 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 369 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 370 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 370 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 370 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 371 | b1@45@01 | live]
; [else-branch: 371 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 371 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 371 | !(b1@45@01)]
(push) ; 6
; [then-branch: 372 | !(b2@46@01) | live]
; [else-branch: 372 | b2@46@01 | live]
(push) ; 7
; [then-branch: 372 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 372 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (or b2@46@01 (not b2@46@01))))
(assert (or (not b1@45@01) b1@45@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 373 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 373 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 373 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 374 | b1@45@01 | live]
; [else-branch: 374 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 374 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 374 | !(b1@45@01)]
(push) ; 6
; [then-branch: 375 | !(b2@46@01) | live]
; [else-branch: 375 | b2@46@01 | live]
(push) ; 7
; [then-branch: 375 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 375 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 376 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 376 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 376 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 377 | b1@45@01 | live]
; [else-branch: 377 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 377 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 377 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 378 | b2@46@01 | live]
; [else-branch: 378 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 378 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 378 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (or (not b2@46@01) b2@46@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 379 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | live]
; [else-branch: 379 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 379 | !(b1@45@01) && !(b2@46@01) && b3@47@01]
(assert (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))
; [eval] perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= none
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 380 | False | live]
; [else-branch: 380 | True | live]
(push) ; 7
; [then-branch: 380 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 380 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (not b1@45@01) (and (not b2@46@01) b3@47@01))
  (and (not b1@45@01) (not b2@46@01) b3@47@01)))
(assert (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 381 | b1@45@01 | live]
; [else-branch: 381 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 381 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 381 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 382 | b2@46@01 | live]
; [else-branch: 382 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 382 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 382 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 383 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 383 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 383 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 384 | !(b1@45@01) | live]
; [else-branch: 384 | b1@45@01 | live]
(push) ; 5
; [then-branch: 384 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 384 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 385 | !(b2@46@01) | live]
; [else-branch: 385 | b2@46@01 | live]
(push) ; 7
; [then-branch: 385 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 385 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 386 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 386 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 386 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 387 | !(b1@45@01) | live]
; [else-branch: 387 | b1@45@01 | live]
(push) ; 5
; [then-branch: 387 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 387 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 388 | !(b2@46@01) | live]
; [else-branch: 388 | b2@46@01 | live]
(push) ; 7
; [then-branch: 388 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 388 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 389 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 389 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 389 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 390 | !(b1@45@01) | live]
; [else-branch: 390 | b1@45@01 | live]
(push) ; 5
; [then-branch: 390 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 390 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 391 | b2@46@01 | live]
; [else-branch: 391 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 391 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 391 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 392 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 392 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 392 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 393 | !(b1@45@01) | live]
; [else-branch: 393 | b1@45@01 | live]
(push) ; 5
; [then-branch: 393 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 393 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 394 | b2@46@01 | live]
; [else-branch: 394 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 394 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 394 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 395 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 395 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 395 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 396 | b1@45@01 | live]
; [else-branch: 396 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 396 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 396 | !(b1@45@01)]
(push) ; 6
; [then-branch: 397 | !(b2@46@01) | live]
; [else-branch: 397 | b2@46@01 | live]
(push) ; 7
; [then-branch: 397 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 397 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 398 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 398 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 398 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 399 | b1@45@01 | live]
; [else-branch: 399 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 399 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 399 | !(b1@45@01)]
(push) ; 6
; [then-branch: 400 | !(b2@46@01) | live]
; [else-branch: 400 | b2@46@01 | live]
(push) ; 7
; [then-branch: 400 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 400 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 401 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 401 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 401 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 402 | b1@45@01 | live]
; [else-branch: 402 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 402 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 402 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 403 | b2@46@01 | live]
; [else-branch: 403 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 403 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 403 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 404 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | live]
; [else-branch: 404 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 404 | !(b1@45@01) && !(b2@46@01) && b3@47@01]
(assert (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))
; [eval] perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] perm(x.f) == none
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 405 | False | live]
; [else-branch: 405 | True | live]
(push) ; 7
; [then-branch: 405 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 405 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 406 | b1@45@01 | live]
; [else-branch: 406 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 406 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 406 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 407 | b2@46@01 | live]
; [else-branch: 407 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 407 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 407 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 408 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 408 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 408 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 409 | b1@45@01 | live]
; [else-branch: 409 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 409 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 409 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 410 | b2@46@01 | live]
; [else-branch: 410 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 410 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 410 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 411 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 411 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 411 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and (not b3@47@01) (not b2@46@01) (not b1@45@01)))
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@58@01 $t@50@01)
    ($Snap.combine ($Snap.first $t@48@01) ($Snap.combine $t@49@01 $t@49@01)))
  :pattern ((MWSF_apply mwsf@58@01 $t@50@01))
  :qid |quant-u-35|)))
(assert true)
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 412 | !(b1@45@01) | live]
; [else-branch: 412 | b1@45@01 | live]
(push) ; 5
; [then-branch: 412 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 412 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 413 | !(b2@46@01) | live]
; [else-branch: 413 | b2@46@01 | live]
(push) ; 7
; [then-branch: 413 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 413 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (and b1@45@01 (or b2@46@01 (not b2@46@01)))))
(assert (or b1@45@01 (not b1@45@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 414 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 414 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 414 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 b3@47@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 415 | !(b1@45@01) | live]
; [else-branch: 415 | b1@45@01 | live]
(push) ; 5
; [then-branch: 415 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 415 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 416 | !(b2@46@01) | live]
; [else-branch: 416 | b2@46@01 | live]
(push) ; 7
; [then-branch: 416 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 416 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 417 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 417 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 417 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 418 | !(b1@45@01) | live]
; [else-branch: 418 | b1@45@01 | live]
(push) ; 5
; [then-branch: 418 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 418 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 419 | b2@46@01 | live]
; [else-branch: 419 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 419 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 419 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@45@01 (and b1@45@01 (or (not b2@46@01) b2@46@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 420 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 420 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 420 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) b3@47@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 421 | !(b1@45@01) | live]
; [else-branch: 421 | b1@45@01 | live]
(push) ; 5
; [then-branch: 421 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 421 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 422 | b2@46@01 | live]
; [else-branch: 422 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 422 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 422 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 423 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 423 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 423 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@45@01 (and (not b2@46@01) (not b3@47@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 424 | b1@45@01 | live]
; [else-branch: 424 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 424 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 424 | !(b1@45@01)]
(push) ; 6
; [then-branch: 425 | !(b2@46@01) | live]
; [else-branch: 425 | b2@46@01 | live]
(push) ; 7
; [then-branch: 425 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 425 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (or b2@46@01 (not b2@46@01))))
(assert (or (not b1@45@01) b1@45@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 426 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 426 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 426 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 b3@47@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 427 | b1@45@01 | live]
; [else-branch: 427 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 427 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 427 | !(b1@45@01)]
(push) ; 6
; [then-branch: 428 | !(b2@46@01) | live]
; [else-branch: 428 | b2@46@01 | live]
(push) ; 7
; [then-branch: 428 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 428 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 429 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 429 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 429 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and b2@46@01 (not b3@47@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= none && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 430 | b1@45@01 | live]
; [else-branch: 430 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 430 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 430 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 431 | b2@46@01 | live]
; [else-branch: 431 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 431 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 431 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@45@01) (or (not b2@46@01) b2@46@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 432 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 432 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 432 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@45@01) (and (not b2@46@01) b3@47@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 433 | b1@45@01 | live]
; [else-branch: 433 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 433 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 433 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 434 | b2@46@01 | live]
; [else-branch: 434 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 434 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 434 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 435 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | live]
; [else-branch: 435 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 435 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01)]
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
; [eval] perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 3 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 436 | False | live]
; [else-branch: 436 | True | live]
(push) ; 7
; [then-branch: 436 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 436 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))
  (and (not b1@45@01) (not b2@46@01) (not b3@47@01))))
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 437 | !(b1@45@01) | live]
; [else-branch: 437 | b1@45@01 | live]
(push) ; 5
; [then-branch: 437 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 437 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 438 | !(b2@46@01) | live]
; [else-branch: 438 | b2@46@01 | live]
(push) ; 7
; [then-branch: 438 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 438 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 439 | b1@45@01 && b2@46@01 && b3@47@01 | dead]
; [else-branch: 439 | !(b1@45@01 && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 439 | !(b1@45@01 && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == none
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 440 | !(b1@45@01) | live]
; [else-branch: 440 | b1@45@01 | live]
(push) ; 5
; [then-branch: 440 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 440 | b1@45@01]
(assert b1@45@01)
(push) ; 6
; [then-branch: 441 | !(b2@46@01) | live]
; [else-branch: 441 | b2@46@01 | live]
(push) ; 7
; [then-branch: 441 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 441 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 442 | b1@45@01 && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 442 | !(b1@45@01 && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 442 | !(b1@45@01 && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 443 | !(b1@45@01) | live]
; [else-branch: 443 | b1@45@01 | live]
(push) ; 5
; [then-branch: 443 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 443 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 444 | b2@46@01 | live]
; [else-branch: 444 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 444 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 444 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 445 | b1@45@01 && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 445 | !(b1@45@01 && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 445 | !(b1@45@01 && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 446 | !(b1@45@01) | live]
; [else-branch: 446 | b1@45@01 | live]
(push) ; 5
; [then-branch: 446 | !(b1@45@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 446 | b1@45@01]
(assert b1@45@01)
; [eval] !b2
(push) ; 6
; [then-branch: 447 | b2@46@01 | live]
; [else-branch: 447 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 447 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 447 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 448 | b1@45@01 && !(b2@46@01) && !(b3@47@01) | dead]
; [else-branch: 448 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 448 | !(b1@45@01 && !(b2@46@01) && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 4 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 449 | b1@45@01 | live]
; [else-branch: 449 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 449 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 449 | !(b1@45@01)]
(push) ; 6
; [then-branch: 450 | !(b2@46@01) | live]
; [else-branch: 450 | b2@46@01 | live]
(push) ; 7
; [then-branch: 450 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 450 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 451 | !(b1@45@01) && b2@46@01 && b3@47@01 | dead]
; [else-branch: 451 | !(!(b1@45@01) && b2@46@01 && b3@47@01) | live]
(push) ; 5
; [else-branch: 451 | !(!(b1@45@01) && b2@46@01 && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 1 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 452 | b1@45@01 | live]
; [else-branch: 452 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 452 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 452 | !(b1@45@01)]
(push) ; 6
; [then-branch: 453 | !(b2@46@01) | live]
; [else-branch: 453 | b2@46@01 | live]
(push) ; 7
; [then-branch: 453 | !(b2@46@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 453 | b2@46@01]
(assert b2@46@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@46@01 (not b2@46@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 454 | !(b1@45@01) && b2@46@01 && !(b3@47@01) | dead]
; [else-branch: 454 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01)) | live]
(push) ; 5
; [else-branch: 454 | !(!(b1@45@01) && b2@46@01 && !(b3@47@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == none && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 455 | b1@45@01 | live]
; [else-branch: 455 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 455 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 455 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 456 | b2@46@01 | live]
; [else-branch: 456 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 456 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 456 | !(b2@46@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 457 | !(b1@45@01) && !(b2@46@01) && b3@47@01 | dead]
; [else-branch: 457 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01) | live]
(push) ; 5
; [else-branch: 457 | !(!(b1@45@01) && !(b2@46@01) && b3@47@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 458 | b1@45@01 | live]
; [else-branch: 458 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 458 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 458 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 459 | b2@46@01 | live]
; [else-branch: 459 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 459 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 459 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 460 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | live]
; [else-branch: 460 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 460 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01)]
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
; [eval] perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 3 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 461 | False | live]
; [else-branch: 461 | True | live]
(push) ; 7
; [then-branch: 461 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 461 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 462 | b1@45@01 | live]
; [else-branch: 462 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 462 | b1@45@01]
(assert b1@45@01)
(pop) ; 5
(push) ; 5
; [else-branch: 462 | !(b1@45@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 463 | b2@46@01 | live]
; [else-branch: 463 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 463 | b2@46@01]
(assert b2@46@01)
(pop) ; 7
(push) ; 7
; [else-branch: 463 | !(b2@46@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 464 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | live]
; [else-branch: 464 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 464 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01)]
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
(push) ; 4
(assert (not (=> (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))) false)))
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
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(set-option :timeout 0)
(push) ; 4
; [then-branch: 465 | b1@45@01 | live]
; [else-branch: 465 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 465 | b1@45@01]
(assert b1@45@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 465 | !(b1@45@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !b2
(set-option :timeout 0)
(push) ; 6
; [then-branch: 466 | b2@46@01 | live]
; [else-branch: 466 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 466 | b2@46@01]
(assert b2@46@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 466 | !(b2@46@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 467 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | live]
; [else-branch: 467 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 467 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01)]
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (=> (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))) false)))
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
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(set-option :timeout 0)
(push) ; 4
; [then-branch: 468 | b1@45@01 | live]
; [else-branch: 468 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 468 | b1@45@01]
(assert b1@45@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 468 | !(b1@45@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !b2
(set-option :timeout 0)
(push) ; 6
; [then-branch: 469 | b2@46@01 | live]
; [else-branch: 469 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 469 | b2@46@01]
(assert b2@46@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 469 | !(b2@46@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 470 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | live]
; [else-branch: 470 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 470 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01)]
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (=> (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))) false)))
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
; [eval] !b1 && (!b2 && !b3) ==> false
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(set-option :timeout 0)
(push) ; 4
; [then-branch: 471 | b1@45@01 | live]
; [else-branch: 471 | !(b1@45@01) | live]
(push) ; 5
; [then-branch: 471 | b1@45@01]
(assert b1@45@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 471 | !(b1@45@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !b2
(set-option :timeout 0)
(push) ; 6
; [then-branch: 472 | b2@46@01 | live]
; [else-branch: 472 | !(b2@46@01) | live]
(push) ; 7
; [then-branch: 472 | b2@46@01]
(assert b2@46@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 472 | !(b2@46@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@46@01) b2@46@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 473 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01) | live]
; [else-branch: 473 | !(!(b1@45@01) && !(b2@46@01) && !(b3@47@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 473 | !(b1@45@01) && !(b2@46@01) && !(b3@47@01)]
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (=> (and (not b1@45@01) (and (not b2@46@01) (not b3@47@01))) false)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test08 ----------
(declare-const x@59@01 $Ref)
(declare-const b@60@01 Bool)
(declare-const x@61@01 $Ref)
(declare-const b@62@01 Bool)
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
; inhale acc(x.f, 5 / 10)
(declare-const $t@63@01 Bool)
(assert (not (= x@61@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(P(x, b), write)
(declare-const $t@64@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; package true --* (b ==> acc(x.f, 8 / 10)) {
;   unfold acc(P(x, b), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 $Snap.unit))
; [exec]
; unfold acc(P(x, b), write)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@62@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@62@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 474 | b@62@01 | live]
; [else-branch: 474 | !(b@62@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 474 | b@62@01]
(assert b@62@01)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@64@01 x@61@01 b@62@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@62@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 475 | b@62@01 | live]
; [else-branch: 475 | !(b@62@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 475 | b@62@01]
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToBool $t@64@01) $t@63@01))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (b ==> acc(x.f, 8 / 10))
(declare-const mwsf@66@01 $MWSF)
(assert (forall (($t@65@01 $Snap)) (!
  (= (MWSF_apply mwsf@66@01 $t@65@01) ($SortWrappers.BoolTo$Snap $t@63@01))
  :pattern ((MWSF_apply mwsf@66@01 $t@65@01))
  :qid |quant-u-36|)))
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 474 | !(b@62@01)]
(assert (not b@62@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@64@01 x@61@01 b@62@01))
; [then-branch: 476 | b@62@01 | dead]
; [else-branch: 476 | !(b@62@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 476 | !(b@62@01)]
; Create MagicWandSnapFunction for wand true --* (b ==> acc(x.f, 8 / 10))
(declare-const mwsf@67@01 $MWSF)
(assert (forall (($t@65@01 $Snap)) (!
  (= (MWSF_apply mwsf@67@01 $t@65@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@67@01 $t@65@01))
  :qid |quant-u-38|)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert b@62@01)
(assert (forall (($t@65@01 $Snap)) (!
  (= (MWSF_apply mwsf@66@01 $t@65@01) ($SortWrappers.BoolTo$Snap $t@63@01))
  :pattern ((MWSF_apply mwsf@66@01 $t@65@01))
  :qid |quant-u-37|)))
(assert true)
(assert (= ($SortWrappers.$SnapToBool $t@64@01) $t@63@01))
; [exec]
; assert b ==> perm(x.f) >= 2 / 10
; [eval] b ==> perm(x.f) >= 2 / 10
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@62@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 477 | b@62@01 | live]
; [else-branch: 477 | !(b@62@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 477 | b@62@01]
; [eval] perm(x.f) >= 2 / 10
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(x.g) >= none
; [eval] perm(x.g) >= none
; [eval] perm(x.g)
; [exec]
; assert b ==> perm(x.f) == 2 / 10
; [eval] b ==> perm(x.f) == 2 / 10
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@62@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 478 | b@62@01 | live]
; [else-branch: 478 | !(b@62@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 478 | b@62@01]
; [eval] perm(x.f) == 2 / 10
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(x.g) == none
; [eval] perm(x.g) == none
; [eval] perm(x.g)
(pop) ; 3
(push) ; 3
(assert (not b@62@01))
(assert (forall (($t@65@01 $Snap)) (!
  (= (MWSF_apply mwsf@67@01 $t@65@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@67@01 $t@65@01))
  :qid |quant-u-39|)))
(assert true)
; [exec]
; assert b ==> perm(x.f) >= 2 / 10
; [eval] b ==> perm(x.f) >= 2 / 10
(push) ; 4
; [then-branch: 479 | b@62@01 | dead]
; [else-branch: 479 | !(b@62@01) | live]
(push) ; 5
; [else-branch: 479 | !(b@62@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(x.g) >= none
; [eval] perm(x.g) >= none
; [eval] perm(x.g)
; [exec]
; assert b ==> perm(x.f) == 2 / 10
; [eval] b ==> perm(x.f) == 2 / 10
(push) ; 4
; [then-branch: 480 | b@62@01 | dead]
; [else-branch: 480 | !(b@62@01) | live]
(push) ; 5
; [else-branch: 480 | !(b@62@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(x.g) == none
; [eval] perm(x.g) == none
; [eval] perm(x.g)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test09 ----------
(declare-const x@68@01 $Ref)
(declare-const b@69@01 Bool)
(declare-const x@70@01 $Ref)
(declare-const b@71@01 Bool)
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
; inhale acc(x.f, 5 / 10)
(declare-const $t@72@01 Bool)
(assert (not (= x@70@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* true {
;   package true --* acc(x.f, 2 / 10) {
;   }
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 $Snap.unit))
; [exec]
; package true --* acc(x.f, 2 / 10) {
; }
(push) ; 4
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
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
; Create MagicWandSnapFunction for wand true --* acc(x.f, 2 / 10)
(declare-const mwsf@75@01 $MWSF)
(assert (forall (($t@74@01 $Snap)) (!
  (= (MWSF_apply mwsf@75@01 $t@74@01) ($SortWrappers.BoolTo$Snap $t@72@01))
  :pattern ((MWSF_apply mwsf@75@01 $t@74@01))
  :qid |quant-u-40|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@74@01 $Snap)) (!
  (= (MWSF_apply mwsf@75@01 $t@74@01) ($SortWrappers.BoolTo$Snap $t@72@01))
  :pattern ((MWSF_apply mwsf@75@01 $t@74@01))
  :qid |quant-u-41|)))
(assert true)
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@76@01 $MWSF)
(assert (forall (($t@73@01 $Snap)) (!
  (= (MWSF_apply mwsf@76@01 $t@73@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@76@01 $t@73@01))
  :qid |quant-u-42|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (forall (($t@73@01 $Snap)) (!
  (= (MWSF_apply mwsf@76@01 $t@73@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@76@01 $t@73@01))
  :qid |quant-u-43|)))
(assert true)
(assert (forall (($t@74@01 $Snap)) (!
  (= (MWSF_apply mwsf@75@01 $t@74@01) ($SortWrappers.BoolTo$Snap $t@72@01))
  :pattern ((MWSF_apply mwsf@75@01 $t@74@01))
  :qid |quant-u-40|)))
; [exec]
; assert perm(x.f) >= 3 / 10
; [eval] perm(x.f) >= 3 / 10
; [eval] perm(x.f)
; [exec]
; assert perm(x.f) == 3 / 10
; [eval] perm(x.f) == 3 / 10
; [eval] perm(x.f)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
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
; inhale acc(x.f, 5 / 10)
(declare-const $t@79@01 Bool)
(assert (not (= x@78@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package acc(x.f, 5 / 10) --* true {
;   package true --* acc(x.f, 2 / 10) {
;   }
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@80@01 $Snap)
; [exec]
; package true --* acc(x.f, 2 / 10) {
; }
(push) ; 4
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 $Snap.unit))
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
; Create MagicWandSnapFunction for wand true --* acc(x.f, 2 / 10)
(declare-const mwsf@82@01 $MWSF)
(assert (forall (($t@81@01 $Snap)) (!
  (= (MWSF_apply mwsf@82@01 $t@81@01) $t@80@01)
  :pattern ((MWSF_apply mwsf@82@01 $t@81@01))
  :qid |quant-u-44|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@81@01 $Snap)) (!
  (= (MWSF_apply mwsf@82@01 $t@81@01) $t@80@01)
  :pattern ((MWSF_apply mwsf@82@01 $t@81@01))
  :qid |quant-u-45|)))
(assert true)
; Create MagicWandSnapFunction for wand acc(x.f, 5 / 10) --* true
(declare-const mwsf@83@01 $MWSF)
(assert (forall (($t@80@01 $Snap)) (!
  (= (MWSF_apply mwsf@83@01 $t@80@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@83@01 $t@80@01))
  :qid |quant-u-46|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (forall (($t@80@01 $Snap)) (!
  (and
    (forall (($t@81@01 $Snap)) (!
      (= (MWSF_apply mwsf@82@01 $t@81@01) $t@80@01)
      :pattern ((MWSF_apply mwsf@82@01 $t@81@01))
      :qid |quant-u-44|))
    (= (MWSF_apply mwsf@83@01 $t@80@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@83@01 $t@80@01))
  :qid |quant-u-47|)))
(assert true)
; [exec]
; assert perm(x.f) >= 5 / 10
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
; [exec]
; assert perm(x.f) == 5 / 10
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const x@84@01 $Ref)
(declare-const b1@85@01 Bool)
(declare-const b2@86@01 Bool)
(declare-const x@87@01 $Ref)
(declare-const b1@88@01 Bool)
(declare-const b2@89@01 Bool)
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
; inhale acc(x.f, 5 / 10)
(declare-const $t@90@01 Bool)
(assert (not (= x@87@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(P(x, b1), write)
(declare-const $t@91@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; package true --* (b1 ==> acc(x.f, 8 / 10)) {
;   unfold acc(P(x, b1), write)
;   package true --* (b2 ==> acc(x.f, 2 / 10)) {
;   }
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@92@01 $Snap)
(assert (= $t@92@01 $Snap.unit))
; [exec]
; unfold acc(P(x, b1), write)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@88@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@88@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 481 | b1@88@01 | live]
; [else-branch: 481 | !(b1@88@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 481 | b1@88@01]
(assert b1@88@01)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@91@01 x@87@01 b1@88@01))
; [exec]
; package true --* (b2 ==> acc(x.f, 2 / 10)) {
; }
(set-option :timeout 0)
(push) ; 5
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 $Snap.unit))
(push) ; 6
(set-option :timeout 10)
(assert (not (not b2@89@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b2@89@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 482 | b2@89@01 | live]
; [else-branch: 482 | !(b2@89@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 482 | b2@89@01]
(assert b2@89@01)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (b2 ==> acc(x.f, 2 / 10))
(declare-const mwsf@94@01 $MWSF)
(assert (forall (($t@93@01 $Snap)) (!
  (= (MWSF_apply mwsf@94@01 $t@93@01) $t@91@01)
  :pattern ((MWSF_apply mwsf@94@01 $t@93@01))
  :qid |quant-u-48|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 482 | !(b2@89@01)]
(assert (not b2@89@01))
; Create MagicWandSnapFunction for wand true --* (b2 ==> acc(x.f, 2 / 10))
(declare-const mwsf@95@01 $MWSF)
(assert (forall (($t@93@01 $Snap)) (!
  (= (MWSF_apply mwsf@95@01 $t@93@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@95@01 $t@93@01))
  :qid |quant-u-50|)))
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (and b2@89@01 b1@88@01))
(assert (forall (($t@93@01 $Snap)) (!
  (= (MWSF_apply mwsf@94@01 $t@93@01) $t@91@01)
  :pattern ((MWSF_apply mwsf@94@01 $t@93@01))
  :qid |quant-u-49|)))
(assert true)
(push) ; 6
(set-option :timeout 10)
(assert (not (not b1@88@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 483 | b1@88@01 | live]
; [else-branch: 483 | !(b1@88@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 483 | b1@88@01]
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (= ($SortWrappers.$SnapToBool $t@91@01) $t@90@01))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(x.f, 8 / 10))
(declare-const mwsf@96@01 $MWSF)
(assert (forall (($t@92@01 $Snap)) (!
  (= (MWSF_apply mwsf@96@01 $t@92@01) ($SortWrappers.BoolTo$Snap $t@90@01))
  :pattern ((MWSF_apply mwsf@96@01 $t@92@01))
  :qid |quant-u-52|)))
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
(assert (and (not b2@89@01) b1@88@01))
(assert (forall (($t@93@01 $Snap)) (!
  (= (MWSF_apply mwsf@95@01 $t@93@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@95@01 $t@93@01))
  :qid |quant-u-51|)))
(push) ; 6
(set-option :timeout 10)
(assert (not (not b1@88@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 484 | b1@88@01 | live]
; [else-branch: 484 | !(b1@88@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 484 | b1@88@01]
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToBool $t@91@01) $t@90@01))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(x.f, 8 / 10))
(declare-const mwsf@97@01 $MWSF)
(assert (forall (($t@92@01 $Snap)) (!
  (= (MWSF_apply mwsf@97@01 $t@92@01) ($SortWrappers.BoolTo$Snap $t@90@01))
  :pattern ((MWSF_apply mwsf@97@01 $t@92@01))
  :qid |quant-u-54|)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 481 | !(b1@88@01)]
(assert (not b1@88@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@91@01 x@87@01 b1@88@01))
; [exec]
; package true --* (b2 ==> acc(x.f, 2 / 10)) {
; }
(set-option :timeout 0)
(push) ; 5
(declare-const $t@98@01 $Snap)
(assert (= $t@98@01 $Snap.unit))
(push) ; 6
(set-option :timeout 10)
(assert (not (not b2@89@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b2@89@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 485 | b2@89@01 | live]
; [else-branch: 485 | !(b2@89@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 485 | b2@89@01]
(assert b2@89@01)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
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
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (b2 ==> acc(x.f, 2 / 10))
(declare-const mwsf@99@01 $MWSF)
(assert (forall (($t@98@01 $Snap)) (!
  (= (MWSF_apply mwsf@99@01 $t@98@01) ($SortWrappers.BoolTo$Snap $t@90@01))
  :pattern ((MWSF_apply mwsf@99@01 $t@98@01))
  :qid |quant-u-56|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 485 | !(b2@89@01)]
(assert (not b2@89@01))
; Create MagicWandSnapFunction for wand true --* (b2 ==> acc(x.f, 2 / 10))
(declare-const mwsf@100@01 $MWSF)
(assert (forall (($t@98@01 $Snap)) (!
  (= (MWSF_apply mwsf@100@01 $t@98@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@100@01 $t@98@01))
  :qid |quant-u-58|)))
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (and b2@89@01 (not b1@88@01)))
(assert (forall (($t@98@01 $Snap)) (!
  (= (MWSF_apply mwsf@99@01 $t@98@01) ($SortWrappers.BoolTo$Snap $t@90@01))
  :pattern ((MWSF_apply mwsf@99@01 $t@98@01))
  :qid |quant-u-57|)))
(assert true)
; [then-branch: 486 | b1@88@01 | dead]
; [else-branch: 486 | !(b1@88@01) | live]
(push) ; 6
; [else-branch: 486 | !(b1@88@01)]
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(x.f, 8 / 10))
(declare-const mwsf@101@01 $MWSF)
(assert (forall (($t@92@01 $Snap)) (!
  (= (MWSF_apply mwsf@101@01 $t@92@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@101@01 $t@92@01))
  :qid |quant-u-60|)))
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (and (not b2@89@01) (not b1@88@01)))
(assert (forall (($t@98@01 $Snap)) (!
  (= (MWSF_apply mwsf@100@01 $t@98@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@100@01 $t@98@01))
  :qid |quant-u-59|)))
; [then-branch: 487 | b1@88@01 | dead]
; [else-branch: 487 | !(b1@88@01) | live]
(push) ; 6
; [else-branch: 487 | !(b1@88@01)]
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(x.f, 8 / 10))
(declare-const mwsf@102@01 $MWSF)
(assert (forall (($t@92@01 $Snap)) (!
  (= (MWSF_apply mwsf@102@01 $t@92@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@102@01 $t@92@01))
  :qid |quant-u-62|)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (and b1@88@01 (and b2@89@01 b1@88@01)))
(assert (forall (($t@92@01 $Snap)) (!
  (= (MWSF_apply mwsf@96@01 $t@92@01) ($SortWrappers.BoolTo$Snap $t@90@01))
  :pattern ((MWSF_apply mwsf@96@01 $t@92@01))
  :qid |quant-u-53|)))
(assert true)
(assert (forall (($t@93@01 $Snap)) (!
  (= (MWSF_apply mwsf@94@01 $t@93@01) $t@91@01)
  :pattern ((MWSF_apply mwsf@94@01 $t@93@01))
  :qid |quant-u-48|)))
(assert (= ($SortWrappers.$SnapToBool $t@91@01) $t@90@01))
; [exec]
; assert b1 && b2 ==> perm(x.f) >= none
; [eval] b1 && b2 ==> perm(x.f) >= none
; [eval] b1 && b2
(push) ; 4
; [then-branch: 488 | !(b1@88@01) | live]
; [else-branch: 488 | b1@88@01 | live]
(push) ; 5
; [then-branch: 488 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(push) ; 5
; [else-branch: 488 | b1@88@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@88@01 (not b1@88@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 b2@89@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@88@01 b2@89@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 489 | b1@88@01 && b2@89@01 | live]
; [else-branch: 489 | !(b1@88@01 && b2@89@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 489 | b1@88@01 && b2@89@01]
(assert (and b1@88@01 b2@89@01))
; [eval] perm(x.f) >= none
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@88@01 b2@89@01))
; [exec]
; assert b1 && !b2 ==> perm(x.f) >= 2 / 10
; [eval] b1 && !b2 ==> perm(x.f) >= 2 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 490 | !(b1@88@01) | live]
; [else-branch: 490 | b1@88@01 | live]
(push) ; 5
; [then-branch: 490 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(push) ; 5
; [else-branch: 490 | b1@88@01]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 (not b2@89@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 491 | b1@88@01 && !(b2@89@01) | dead]
; [else-branch: 491 | !(b1@88@01 && !(b2@89@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 491 | !(b1@88@01 && !(b2@89@01))]
(assert (not (and b1@88@01 (not b2@89@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@88@01 (not b2@89@01))))
; [exec]
; assert !b1 && b2 ==> perm(x.f) >= 3 / 10
; [eval] !b1 && b2 ==> perm(x.f) >= 3 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 492 | b1@88@01 | live]
; [else-branch: 492 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 492 | b1@88@01]
(pop) ; 5
(push) ; 5
; [else-branch: 492 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not b1@88@01) b1@88@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 493 | !(b1@88@01) && b2@89@01 | dead]
; [else-branch: 493 | !(!(b1@88@01) && b2@89@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 493 | !(!(b1@88@01) && b2@89@01)]
(assert (not (and (not b1@88@01) b2@89@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@88@01) b2@89@01)))
; [exec]
; assert !b1 && !b2 ==> perm(x.f) >= 5 / 10
; [eval] !b1 && !b2 ==> perm(x.f) >= 5 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 494 | b1@88@01 | live]
; [else-branch: 494 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 494 | b1@88@01]
(pop) ; 5
(push) ; 5
; [else-branch: 494 | !(b1@88@01)]
(assert (not b1@88@01))
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) (not b2@89@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 495 | !(b1@88@01) && !(b2@89@01) | dead]
; [else-branch: 495 | !(!(b1@88@01) && !(b2@89@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 495 | !(!(b1@88@01) && !(b2@89@01))]
(assert (not (and (not b1@88@01) (not b2@89@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@88@01) (not b2@89@01))))
; [exec]
; assert b1 && b2 ==> perm(x.f) == none
; [eval] b1 && b2 ==> perm(x.f) == none
; [eval] b1 && b2
(push) ; 4
; [then-branch: 496 | !(b1@88@01) | live]
; [else-branch: 496 | b1@88@01 | live]
(push) ; 5
; [then-branch: 496 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(push) ; 5
; [else-branch: 496 | b1@88@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 b2@89@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@88@01 b2@89@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 497 | b1@88@01 && b2@89@01 | live]
; [else-branch: 497 | !(b1@88@01 && b2@89@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 497 | b1@88@01 && b2@89@01]
(assert (and b1@88@01 b2@89@01))
; [eval] perm(x.f) == none
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@88@01 b2@89@01))
; [exec]
; assert b1 && !b2 ==> perm(x.f) == 2 / 10
; [eval] b1 && !b2 ==> perm(x.f) == 2 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 498 | !(b1@88@01) | live]
; [else-branch: 498 | b1@88@01 | live]
(push) ; 5
; [then-branch: 498 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(push) ; 5
; [else-branch: 498 | b1@88@01]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 499 | b1@88@01 && !(b2@89@01) | dead]
; [else-branch: 499 | !(b1@88@01 && !(b2@89@01)) | live]
(push) ; 5
; [else-branch: 499 | !(b1@88@01 && !(b2@89@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && b2 ==> perm(x.f) == 3 / 10
; [eval] !b1 && b2 ==> perm(x.f) == 3 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 500 | b1@88@01 | live]
; [else-branch: 500 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 500 | b1@88@01]
(pop) ; 5
(push) ; 5
; [else-branch: 500 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 501 | !(b1@88@01) && b2@89@01 | dead]
; [else-branch: 501 | !(!(b1@88@01) && b2@89@01) | live]
(push) ; 5
; [else-branch: 501 | !(!(b1@88@01) && b2@89@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && !b2 ==> perm(x.f) == 5 / 10
; [eval] !b1 && !b2 ==> perm(x.f) == 5 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 502 | b1@88@01 | live]
; [else-branch: 502 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 502 | b1@88@01]
(pop) ; 5
(push) ; 5
; [else-branch: 502 | !(b1@88@01)]
(assert (not b1@88@01))
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 503 | !(b1@88@01) && !(b2@89@01) | dead]
; [else-branch: 503 | !(!(b1@88@01) && !(b2@89@01)) | live]
(push) ; 5
; [else-branch: 503 | !(!(b1@88@01) && !(b2@89@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and b1@88@01 (and (not b2@89@01) b1@88@01)))
(assert (forall (($t@92@01 $Snap)) (!
  (= (MWSF_apply mwsf@97@01 $t@92@01) ($SortWrappers.BoolTo$Snap $t@90@01))
  :pattern ((MWSF_apply mwsf@97@01 $t@92@01))
  :qid |quant-u-55|)))
(assert true)
(assert (forall (($t@93@01 $Snap)) (!
  (= (MWSF_apply mwsf@95@01 $t@93@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@95@01 $t@93@01))
  :qid |quant-u-50|)))
(assert (= ($SortWrappers.$SnapToBool $t@91@01) $t@90@01))
; [exec]
; assert b1 && b2 ==> perm(x.f) >= none
; [eval] b1 && b2 ==> perm(x.f) >= none
; [eval] b1 && b2
(push) ; 4
; [then-branch: 504 | !(b1@88@01) | live]
; [else-branch: 504 | b1@88@01 | live]
(push) ; 5
; [then-branch: 504 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(push) ; 5
; [else-branch: 504 | b1@88@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@88@01 (not b1@88@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 505 | b1@88@01 && b2@89@01 | dead]
; [else-branch: 505 | !(b1@88@01 && b2@89@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 505 | !(b1@88@01 && b2@89@01)]
(assert (not (and b1@88@01 b2@89@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@88@01 b2@89@01)))
; [exec]
; assert b1 && !b2 ==> perm(x.f) >= 2 / 10
; [eval] b1 && !b2 ==> perm(x.f) >= 2 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 506 | !(b1@88@01) | live]
; [else-branch: 506 | b1@88@01 | live]
(push) ; 5
; [then-branch: 506 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(push) ; 5
; [else-branch: 506 | b1@88@01]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 (not b2@89@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@88@01 (not b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 507 | b1@88@01 && !(b2@89@01) | live]
; [else-branch: 507 | !(b1@88@01 && !(b2@89@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 507 | b1@88@01 && !(b2@89@01)]
(assert (and b1@88@01 (not b2@89@01)))
; [eval] perm(x.f) >= 2 / 10
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@88@01 (not b2@89@01)))
; [exec]
; assert !b1 && b2 ==> perm(x.f) >= 3 / 10
; [eval] !b1 && b2 ==> perm(x.f) >= 3 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 508 | b1@88@01 | live]
; [else-branch: 508 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 508 | b1@88@01]
(pop) ; 5
(push) ; 5
; [else-branch: 508 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not b1@88@01) b1@88@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 509 | !(b1@88@01) && b2@89@01 | dead]
; [else-branch: 509 | !(!(b1@88@01) && b2@89@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 509 | !(!(b1@88@01) && b2@89@01)]
(assert (not (and (not b1@88@01) b2@89@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@88@01) b2@89@01)))
; [exec]
; assert !b1 && !b2 ==> perm(x.f) >= 5 / 10
; [eval] !b1 && !b2 ==> perm(x.f) >= 5 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 510 | b1@88@01 | live]
; [else-branch: 510 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 510 | b1@88@01]
(pop) ; 5
(push) ; 5
; [else-branch: 510 | !(b1@88@01)]
(assert (not b1@88@01))
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) (not b2@89@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 511 | !(b1@88@01) && !(b2@89@01) | dead]
; [else-branch: 511 | !(!(b1@88@01) && !(b2@89@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 511 | !(!(b1@88@01) && !(b2@89@01))]
(assert (not (and (not b1@88@01) (not b2@89@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@88@01) (not b2@89@01))))
; [exec]
; assert b1 && b2 ==> perm(x.f) == none
; [eval] b1 && b2 ==> perm(x.f) == none
; [eval] b1 && b2
(push) ; 4
; [then-branch: 512 | !(b1@88@01) | live]
; [else-branch: 512 | b1@88@01 | live]
(push) ; 5
; [then-branch: 512 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(push) ; 5
; [else-branch: 512 | b1@88@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 513 | b1@88@01 && b2@89@01 | dead]
; [else-branch: 513 | !(b1@88@01 && b2@89@01) | live]
(push) ; 5
; [else-branch: 513 | !(b1@88@01 && b2@89@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && !b2 ==> perm(x.f) == 2 / 10
; [eval] b1 && !b2 ==> perm(x.f) == 2 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 514 | !(b1@88@01) | live]
; [else-branch: 514 | b1@88@01 | live]
(push) ; 5
; [then-branch: 514 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(push) ; 5
; [else-branch: 514 | b1@88@01]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 (not b2@89@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@88@01 (not b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 515 | b1@88@01 && !(b2@89@01) | live]
; [else-branch: 515 | !(b1@88@01 && !(b2@89@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 515 | b1@88@01 && !(b2@89@01)]
(assert (and b1@88@01 (not b2@89@01)))
; [eval] perm(x.f) == 2 / 10
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@88@01 (not b2@89@01)))
; [exec]
; assert !b1 && b2 ==> perm(x.f) == 3 / 10
; [eval] !b1 && b2 ==> perm(x.f) == 3 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 516 | b1@88@01 | live]
; [else-branch: 516 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 516 | b1@88@01]
(pop) ; 5
(push) ; 5
; [else-branch: 516 | !(b1@88@01)]
(assert (not b1@88@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 517 | !(b1@88@01) && b2@89@01 | dead]
; [else-branch: 517 | !(!(b1@88@01) && b2@89@01) | live]
(push) ; 5
; [else-branch: 517 | !(!(b1@88@01) && b2@89@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && !b2 ==> perm(x.f) == 5 / 10
; [eval] !b1 && !b2 ==> perm(x.f) == 5 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 518 | b1@88@01 | live]
; [else-branch: 518 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 518 | b1@88@01]
(pop) ; 5
(push) ; 5
; [else-branch: 518 | !(b1@88@01)]
(assert (not b1@88@01))
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 519 | !(b1@88@01) && !(b2@89@01) | dead]
; [else-branch: 519 | !(!(b1@88@01) && !(b2@89@01)) | live]
(push) ; 5
; [else-branch: 519 | !(!(b1@88@01) && !(b2@89@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and (not b1@88@01) (and b2@89@01 (not b1@88@01))))
(assert (forall (($t@92@01 $Snap)) (!
  (= (MWSF_apply mwsf@101@01 $t@92@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@101@01 $t@92@01))
  :qid |quant-u-61|)))
(assert true)
(assert (forall (($t@98@01 $Snap)) (!
  (= (MWSF_apply mwsf@99@01 $t@98@01) ($SortWrappers.BoolTo$Snap $t@90@01))
  :pattern ((MWSF_apply mwsf@99@01 $t@98@01))
  :qid |quant-u-56|)))
; [exec]
; assert b1 && b2 ==> perm(x.f) >= none
; [eval] b1 && b2 ==> perm(x.f) >= none
; [eval] b1 && b2
(push) ; 4
; [then-branch: 520 | !(b1@88@01) | live]
; [else-branch: 520 | b1@88@01 | live]
(push) ; 5
; [then-branch: 520 | !(b1@88@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 520 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@88@01 (not b1@88@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 521 | b1@88@01 && b2@89@01 | dead]
; [else-branch: 521 | !(b1@88@01 && b2@89@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 521 | !(b1@88@01 && b2@89@01)]
(assert (not (and b1@88@01 b2@89@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@88@01 b2@89@01)))
; [exec]
; assert b1 && !b2 ==> perm(x.f) >= 2 / 10
; [eval] b1 && !b2 ==> perm(x.f) >= 2 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 522 | !(b1@88@01) | live]
; [else-branch: 522 | b1@88@01 | live]
(push) ; 5
; [then-branch: 522 | !(b1@88@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 522 | b1@88@01]
(assert b1@88@01)
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 (not b2@89@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 523 | b1@88@01 && !(b2@89@01) | dead]
; [else-branch: 523 | !(b1@88@01 && !(b2@89@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 523 | !(b1@88@01 && !(b2@89@01))]
(assert (not (and b1@88@01 (not b2@89@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@88@01 (not b2@89@01))))
; [exec]
; assert !b1 && b2 ==> perm(x.f) >= 3 / 10
; [eval] !b1 && b2 ==> perm(x.f) >= 3 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 524 | b1@88@01 | live]
; [else-branch: 524 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 524 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(push) ; 5
; [else-branch: 524 | !(b1@88@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not b1@88@01) b1@88@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) b2@89@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@88@01) b2@89@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 525 | !(b1@88@01) && b2@89@01 | live]
; [else-branch: 525 | !(!(b1@88@01) && b2@89@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 525 | !(b1@88@01) && b2@89@01]
(assert (and (not b1@88@01) b2@89@01))
; [eval] perm(x.f) >= 3 / 10
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@88@01) b2@89@01))
; [exec]
; assert !b1 && !b2 ==> perm(x.f) >= 5 / 10
; [eval] !b1 && !b2 ==> perm(x.f) >= 5 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 526 | b1@88@01 | live]
; [else-branch: 526 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 526 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(push) ; 5
; [else-branch: 526 | !(b1@88@01)]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) (not b2@89@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 527 | !(b1@88@01) && !(b2@89@01) | dead]
; [else-branch: 527 | !(!(b1@88@01) && !(b2@89@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 527 | !(!(b1@88@01) && !(b2@89@01))]
(assert (not (and (not b1@88@01) (not b2@89@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@88@01) (not b2@89@01))))
; [exec]
; assert b1 && b2 ==> perm(x.f) == none
; [eval] b1 && b2 ==> perm(x.f) == none
; [eval] b1 && b2
(push) ; 4
; [then-branch: 528 | !(b1@88@01) | live]
; [else-branch: 528 | b1@88@01 | live]
(push) ; 5
; [then-branch: 528 | !(b1@88@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 528 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 529 | b1@88@01 && b2@89@01 | dead]
; [else-branch: 529 | !(b1@88@01 && b2@89@01) | live]
(push) ; 5
; [else-branch: 529 | !(b1@88@01 && b2@89@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && !b2 ==> perm(x.f) == 2 / 10
; [eval] b1 && !b2 ==> perm(x.f) == 2 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 530 | !(b1@88@01) | live]
; [else-branch: 530 | b1@88@01 | live]
(push) ; 5
; [then-branch: 530 | !(b1@88@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 530 | b1@88@01]
(assert b1@88@01)
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 531 | b1@88@01 && !(b2@89@01) | dead]
; [else-branch: 531 | !(b1@88@01 && !(b2@89@01)) | live]
(push) ; 5
; [else-branch: 531 | !(b1@88@01 && !(b2@89@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && b2 ==> perm(x.f) == 3 / 10
; [eval] !b1 && b2 ==> perm(x.f) == 3 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 532 | b1@88@01 | live]
; [else-branch: 532 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 532 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(push) ; 5
; [else-branch: 532 | !(b1@88@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) b2@89@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@88@01) b2@89@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 533 | !(b1@88@01) && b2@89@01 | live]
; [else-branch: 533 | !(!(b1@88@01) && b2@89@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 533 | !(b1@88@01) && b2@89@01]
(assert (and (not b1@88@01) b2@89@01))
; [eval] perm(x.f) == 3 / 10
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@88@01) b2@89@01))
; [exec]
; assert !b1 && !b2 ==> perm(x.f) == 5 / 10
; [eval] !b1 && !b2 ==> perm(x.f) == 5 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 534 | b1@88@01 | live]
; [else-branch: 534 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 534 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(push) ; 5
; [else-branch: 534 | !(b1@88@01)]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 535 | !(b1@88@01) && !(b2@89@01) | dead]
; [else-branch: 535 | !(!(b1@88@01) && !(b2@89@01)) | live]
(push) ; 5
; [else-branch: 535 | !(!(b1@88@01) && !(b2@89@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (and (not b1@88@01) (and (not b2@89@01) (not b1@88@01))))
(assert (forall (($t@92@01 $Snap)) (!
  (= (MWSF_apply mwsf@102@01 $t@92@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@102@01 $t@92@01))
  :qid |quant-u-63|)))
(assert true)
(assert (forall (($t@98@01 $Snap)) (!
  (= (MWSF_apply mwsf@100@01 $t@98@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@100@01 $t@98@01))
  :qid |quant-u-58|)))
; [exec]
; assert b1 && b2 ==> perm(x.f) >= none
; [eval] b1 && b2 ==> perm(x.f) >= none
; [eval] b1 && b2
(push) ; 4
; [then-branch: 536 | !(b1@88@01) | live]
; [else-branch: 536 | b1@88@01 | live]
(push) ; 5
; [then-branch: 536 | !(b1@88@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 536 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@88@01 (not b1@88@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 537 | b1@88@01 && b2@89@01 | dead]
; [else-branch: 537 | !(b1@88@01 && b2@89@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 537 | !(b1@88@01 && b2@89@01)]
(assert (not (and b1@88@01 b2@89@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@88@01 b2@89@01)))
; [exec]
; assert b1 && !b2 ==> perm(x.f) >= 2 / 10
; [eval] b1 && !b2 ==> perm(x.f) >= 2 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 538 | !(b1@88@01) | live]
; [else-branch: 538 | b1@88@01 | live]
(push) ; 5
; [then-branch: 538 | !(b1@88@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 538 | b1@88@01]
(assert b1@88@01)
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@88@01 (not b2@89@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 539 | b1@88@01 && !(b2@89@01) | dead]
; [else-branch: 539 | !(b1@88@01 && !(b2@89@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 539 | !(b1@88@01 && !(b2@89@01))]
(assert (not (and b1@88@01 (not b2@89@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@88@01 (not b2@89@01))))
; [exec]
; assert !b1 && b2 ==> perm(x.f) >= 3 / 10
; [eval] !b1 && b2 ==> perm(x.f) >= 3 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 540 | b1@88@01 | live]
; [else-branch: 540 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 540 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(push) ; 5
; [else-branch: 540 | !(b1@88@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not b1@88@01) b1@88@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 541 | !(b1@88@01) && b2@89@01 | dead]
; [else-branch: 541 | !(!(b1@88@01) && b2@89@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 541 | !(!(b1@88@01) && b2@89@01)]
(assert (not (and (not b1@88@01) b2@89@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@88@01) b2@89@01)))
; [exec]
; assert !b1 && !b2 ==> perm(x.f) >= 5 / 10
; [eval] !b1 && !b2 ==> perm(x.f) >= 5 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 542 | b1@88@01 | live]
; [else-branch: 542 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 542 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(push) ; 5
; [else-branch: 542 | !(b1@88@01)]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) (not b2@89@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@88@01) (not b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 543 | !(b1@88@01) && !(b2@89@01) | live]
; [else-branch: 543 | !(!(b1@88@01) && !(b2@89@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 543 | !(b1@88@01) && !(b2@89@01)]
(assert (and (not b1@88@01) (not b2@89@01)))
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@88@01) (not b2@89@01)))
; [exec]
; assert b1 && b2 ==> perm(x.f) == none
; [eval] b1 && b2 ==> perm(x.f) == none
; [eval] b1 && b2
(push) ; 4
; [then-branch: 544 | !(b1@88@01) | live]
; [else-branch: 544 | b1@88@01 | live]
(push) ; 5
; [then-branch: 544 | !(b1@88@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 544 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 545 | b1@88@01 && b2@89@01 | dead]
; [else-branch: 545 | !(b1@88@01 && b2@89@01) | live]
(push) ; 5
; [else-branch: 545 | !(b1@88@01 && b2@89@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && !b2 ==> perm(x.f) == 2 / 10
; [eval] b1 && !b2 ==> perm(x.f) == 2 / 10
; [eval] b1 && !b2
(push) ; 4
; [then-branch: 546 | !(b1@88@01) | live]
; [else-branch: 546 | b1@88@01 | live]
(push) ; 5
; [then-branch: 546 | !(b1@88@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 546 | b1@88@01]
(assert b1@88@01)
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 547 | b1@88@01 && !(b2@89@01) | dead]
; [else-branch: 547 | !(b1@88@01 && !(b2@89@01)) | live]
(push) ; 5
; [else-branch: 547 | !(b1@88@01 && !(b2@89@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && b2 ==> perm(x.f) == 3 / 10
; [eval] !b1 && b2 ==> perm(x.f) == 3 / 10
; [eval] !b1 && b2
; [eval] !b1
(push) ; 4
; [then-branch: 548 | b1@88@01 | live]
; [else-branch: 548 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 548 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(push) ; 5
; [else-branch: 548 | !(b1@88@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 549 | !(b1@88@01) && b2@89@01 | dead]
; [else-branch: 549 | !(!(b1@88@01) && b2@89@01) | live]
(push) ; 5
; [else-branch: 549 | !(!(b1@88@01) && b2@89@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && !b2 ==> perm(x.f) == 5 / 10
; [eval] !b1 && !b2 ==> perm(x.f) == 5 / 10
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 4
; [then-branch: 550 | b1@88@01 | live]
; [else-branch: 550 | !(b1@88@01) | live]
(push) ; 5
; [then-branch: 550 | b1@88@01]
(assert b1@88@01)
(pop) ; 5
(push) ; 5
; [else-branch: 550 | !(b1@88@01)]
; [eval] !b2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@88@01) (not b2@89@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@88@01) (not b2@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 551 | !(b1@88@01) && !(b2@89@01) | live]
; [else-branch: 551 | !(!(b1@88@01) && !(b2@89@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 551 | !(b1@88@01) && !(b2@89@01)]
(assert (and (not b1@88@01) (not b2@89@01)))
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@88@01) (not b2@89@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- curry_test03 ----------
(declare-const x@103@01 $Ref)
(declare-const x@104@01 $Ref)
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
; inhale acc(x.f, write)
(declare-const $t@105@01 Bool)
(assert (not (= x@104@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true --* acc(x.f, write)
(declare-const $t@106@01 $MWSF)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; package true --* true {
;   package true --* acc(x.f, write) {
;     apply true --* acc(x.f, write)
;   }
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@107@01 $Snap)
(assert (= $t@107@01 $Snap.unit))
; [exec]
; package true --* acc(x.f, write) {
;   apply true --* acc(x.f, write)
; }
(push) ; 4
(declare-const $t@108@01 $Snap)
(assert (= $t@108@01 $Snap.unit))
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
(declare-const mwsf@109@01 $MWSF)
(assert (forall (($t@108@01 $Snap)) (!
  (= (MWSF_apply mwsf@109@01 $t@108@01) (MWSF_apply $t@106@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@109@01 $t@108@01))
  :qid |quant-u-64|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@108@01 $Snap)) (!
  (= (MWSF_apply mwsf@109@01 $t@108@01) (MWSF_apply $t@106@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@109@01 $t@108@01))
  :qid |quant-u-65|)))
(assert true)
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@110@01 $MWSF)
(assert (forall (($t@107@01 $Snap)) (!
  (= (MWSF_apply mwsf@110@01 $t@107@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@110@01 $t@107@01))
  :qid |quant-u-66|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (forall (($t@107@01 $Snap)) (!
  (= (MWSF_apply mwsf@110@01 $t@107@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@110@01 $t@107@01))
  :qid |quant-u-67|)))
(assert true)
(assert (forall (($t@108@01 $Snap)) (!
  (= (MWSF_apply mwsf@109@01 $t@108@01) (MWSF_apply $t@106@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@109@01 $t@108@01))
  :qid |quant-u-64|)))
; [exec]
; exhale true --* true
; [exec]
; exhale acc(x.f, write)
; [exec]
; assert false
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
; ---------- test06 ----------
(declare-const x@111@01 $Ref)
(declare-const b1@112@01 Bool)
(declare-const b2@113@01 Bool)
(declare-const b3@114@01 Bool)
(declare-const x@115@01 $Ref)
(declare-const b1@116@01 Bool)
(declare-const b2@117@01 Bool)
(declare-const b3@118@01 Bool)
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
; inhale acc(x.f, 5 / 10) && acc(x.g, 5 / 10)
(declare-const $t@119@01 $Snap)
(assert (= $t@119@01 ($Snap.combine ($Snap.first $t@119@01) ($Snap.second $t@119@01))))
(assert (not (= x@115@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(P(x, b2), write)
(declare-const $t@120@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; package (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --*
; (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10)) {
;   unfold acc(P(x, b2), write)
;   package (b2 ==> acc(x.g, 1 / 10)) --*
;   (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10)) {
;   }
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@121@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@116@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@116@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 552 | b1@116@01 | live]
; [else-branch: 552 | !(b1@116@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 552 | b1@116@01]
(assert b1@116@01)
; [exec]
; unfold acc(P(x, b2), write)
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
(assert (not (not b2@117@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@117@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 553 | b2@117@01 | live]
; [else-branch: 553 | !(b2@117@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 553 | b2@117@01]
(assert b2@117@01)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@120@01 x@115@01 b2@117@01))
; [exec]
; package (b2 ==> acc(x.g, 1 / 10)) --*
; (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10)) {
; }
(set-option :timeout 0)
(push) ; 6
(declare-const $t@122@01 $Snap)
(push) ; 7
(set-option :timeout 10)
(assert (not (not b2@117@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 554 | b2@117@01 | live]
; [else-branch: 554 | !(b2@117@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 554 | b2@117@01]
(push) ; 8
(set-option :timeout 10)
(assert (not (not b3@118@01)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not b3@118@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 555 | b3@118@01 | live]
; [else-branch: 555 | !(b3@118@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 555 | b3@118@01]
(assert b3@118@01)
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
(check-sat)
; unknown
(set-option :timeout 0)
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
; Create MagicWandSnapFunction for wand (b2 ==> acc(x.g, 1 / 10)) --* (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10))
(declare-const mwsf@123@01 $MWSF)
(assert (forall (($t@122@01 $Snap)) (!
  (= (MWSF_apply mwsf@123@01 $t@122@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@123@01 $t@122@01))
  :qid |quant-u-68|)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 555 | !(b3@118@01)]
(assert (not b3@118@01))
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
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b2 ==> acc(x.g, 1 / 10)) --* (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10))
(declare-const mwsf@124@01 $MWSF)
(assert (forall (($t@122@01 $Snap)) (!
  (= (MWSF_apply mwsf@124@01 $t@122@01) $t@122@01)
  :pattern ((MWSF_apply mwsf@124@01 $t@122@01))
  :qid |quant-u-70|)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
(assert (and b3@118@01 b2@117@01 b1@116@01))
(assert (forall (($t@122@01 $Snap)) (!
  (= (MWSF_apply mwsf@123@01 $t@122@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@123@01 $t@122@01))
  :qid |quant-u-69|)))
(assert true)
; [eval] b1 && b2
(push) ; 7
; [then-branch: 556 | !(b1@116@01) | live]
; [else-branch: 556 | b1@116@01 | live]
(push) ; 8
; [then-branch: 556 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 8
(push) ; 8
; [else-branch: 556 | b1@116@01]
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and b1@116@01 b2@117@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and b1@116@01 b2@117@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 557 | b1@116@01 && b2@117@01 | live]
; [else-branch: 557 | !(b1@116@01 && b2@117@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 557 | b1@116@01 && b2@117@01]
(assert (and b1@116@01 b2@117@01))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToBool $t@120@01) ($SortWrappers.$SnapToBool $t@121@01)))
(set-option :timeout 10)
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
(assert (=
  ($SortWrappers.$SnapToBool $t@120@01)
  ($SortWrappers.$SnapToBool ($Snap.first $t@119@01))))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10))
(declare-const mwsf@125@01 $MWSF)
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@125@01 $t@121@01) ($Snap.first $t@119@01))
  :pattern ((MWSF_apply mwsf@125@01 $t@121@01))
  :qid |quant-u-72|)))
; [eval] b1 && b2
(set-option :timeout 0)
(push) ; 8
; [then-branch: 558 | !(b1@116@01) | live]
; [else-branch: 558 | b1@116@01 | live]
(push) ; 9
; [then-branch: 558 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 9
(push) ; 9
; [else-branch: 558 | b1@116@01]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
(push) ; 6
(assert (and (not b3@118@01) b2@117@01 b1@116@01))
(assert (forall (($t@122@01 $Snap)) (!
  (= (MWSF_apply mwsf@124@01 $t@122@01) $t@122@01)
  :pattern ((MWSF_apply mwsf@124@01 $t@122@01))
  :qid |quant-u-71|)))
(assert true)
; [eval] b1 && b2
(push) ; 7
; [then-branch: 559 | !(b1@116@01) | live]
; [else-branch: 559 | b1@116@01 | live]
(push) ; 8
; [then-branch: 559 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 8
(push) ; 8
; [else-branch: 559 | b1@116@01]
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and b1@116@01 b2@117@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and b1@116@01 b2@117@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 560 | b1@116@01 && b2@117@01 | live]
; [else-branch: 560 | !(b1@116@01 && b2@117@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 560 | b1@116@01 && b2@117@01]
(assert (and b1@116@01 b2@117@01))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToBool $t@120@01) ($SortWrappers.$SnapToBool $t@121@01)))
(set-option :timeout 10)
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
(assert (=
  ($SortWrappers.$SnapToBool $t@120@01)
  ($SortWrappers.$SnapToBool ($Snap.first $t@119@01))))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10))
(declare-const mwsf@126@01 $MWSF)
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@126@01 $t@121@01) ($Snap.first $t@119@01))
  :pattern ((MWSF_apply mwsf@126@01 $t@121@01))
  :qid |quant-u-74|)))
; [eval] b1 && b2
(set-option :timeout 0)
(push) ; 8
; [then-branch: 561 | !(b1@116@01) | live]
; [else-branch: 561 | b1@116@01 | live]
(push) ; 9
; [then-branch: 561 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 9
(push) ; 9
; [else-branch: 561 | b1@116@01]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 553 | !(b2@117@01)]
(assert (not b2@117@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@120@01 x@115@01 b2@117@01))
; [exec]
; package (b2 ==> acc(x.g, 1 / 10)) --*
; (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10)) {
; }
(set-option :timeout 0)
(push) ; 6
(declare-const $t@127@01 $Snap)
; [then-branch: 562 | b2@117@01 | dead]
; [else-branch: 562 | !(b2@117@01) | live]
(push) ; 7
; [else-branch: 562 | !(b2@117@01)]
(assert (= $t@127@01 $Snap.unit))
(push) ; 8
(set-option :timeout 10)
(assert (not (not b3@118@01)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not b3@118@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 563 | b3@118@01 | live]
; [else-branch: 563 | !(b3@118@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 563 | b3@118@01]
(assert b3@118@01)
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
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool $t@121@01)
  ($SortWrappers.$SnapToBool ($Snap.first $t@119@01))))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b2 ==> acc(x.g, 1 / 10)) --* (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10))
(declare-const mwsf@128@01 $MWSF)
(assert (forall (($t@127@01 $Snap)) (!
  (= (MWSF_apply mwsf@128@01 $t@127@01) ($Snap.first $t@119@01))
  :pattern ((MWSF_apply mwsf@128@01 $t@127@01))
  :qid |quant-u-76|)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 563 | !(b3@118@01)]
(assert (not b3@118@01))
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
(check-sat)
; unknown
(set-option :timeout 0)
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
; Create MagicWandSnapFunction for wand (b2 ==> acc(x.g, 1 / 10)) --* (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10))
(declare-const mwsf@129@01 $MWSF)
(assert (forall (($t@127@01 $Snap)) (!
  (= (MWSF_apply mwsf@129@01 $t@127@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@129@01 $t@127@01))
  :qid |quant-u-78|)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
(assert (and b3@118@01 (not b2@117@01) b1@116@01))
(assert (forall (($t@127@01 $Snap)) (!
  (= (MWSF_apply mwsf@128@01 $t@127@01) ($Snap.first $t@119@01))
  :pattern ((MWSF_apply mwsf@128@01 $t@127@01))
  :qid |quant-u-77|)))
(assert (=
  ($SortWrappers.$SnapToBool $t@121@01)
  ($SortWrappers.$SnapToBool ($Snap.first $t@119@01))))
; [eval] b1 && b2
(push) ; 7
; [then-branch: 564 | !(b1@116@01) | live]
; [else-branch: 564 | b1@116@01 | live]
(push) ; 8
; [then-branch: 564 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 8
(push) ; 8
; [else-branch: 564 | b1@116@01]
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and b1@116@01 b2@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 565 | b1@116@01 && b2@117@01 | dead]
; [else-branch: 565 | !(b1@116@01 && b2@117@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 565 | !(b1@116@01 && b2@117@01)]
(assert (not (and b1@116@01 b2@117@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
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
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10))
(declare-const mwsf@130@01 $MWSF)
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@130@01 $t@121@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@130@01 $t@121@01))
  :qid |quant-u-80|)))
; [eval] b1 && b2
(set-option :timeout 0)
(push) ; 8
; [then-branch: 566 | !(b1@116@01) | live]
; [else-branch: 566 | b1@116@01 | live]
(push) ; 9
; [then-branch: 566 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 9
(push) ; 9
; [else-branch: 566 | b1@116@01]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
(push) ; 6
(assert (and (not b3@118@01) (not b2@117@01) b1@116@01))
(assert (forall (($t@127@01 $Snap)) (!
  (= (MWSF_apply mwsf@129@01 $t@127@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@129@01 $t@127@01))
  :qid |quant-u-79|)))
(assert true)
; [eval] b1 && b2
(push) ; 7
; [then-branch: 567 | !(b1@116@01) | live]
; [else-branch: 567 | b1@116@01 | live]
(push) ; 8
; [then-branch: 567 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 8
(push) ; 8
; [else-branch: 567 | b1@116@01]
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and b1@116@01 b2@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 568 | b1@116@01 && b2@117@01 | dead]
; [else-branch: 568 | !(b1@116@01 && b2@117@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 568 | !(b1@116@01 && b2@117@01)]
(assert (not (and b1@116@01 b2@117@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
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
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10))
(declare-const mwsf@131@01 $MWSF)
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@131@01 $t@121@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@131@01 $t@121@01))
  :qid |quant-u-82|)))
; [eval] b1 && b2
(set-option :timeout 0)
(push) ; 8
; [then-branch: 569 | !(b1@116@01) | live]
; [else-branch: 569 | b1@116@01 | live]
(push) ; 9
; [then-branch: 569 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 9
(push) ; 9
; [else-branch: 569 | b1@116@01]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 552 | !(b1@116@01)]
(assert (not b1@116@01))
; [exec]
; unfold acc(P(x, b2), write)
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
(assert (not (not b2@117@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@117@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 570 | b2@117@01 | live]
; [else-branch: 570 | !(b2@117@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 570 | b2@117@01]
(assert b2@117@01)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@120@01 x@115@01 b2@117@01))
; [exec]
; package (b2 ==> acc(x.g, 1 / 10)) --*
; (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10)) {
; }
(set-option :timeout 0)
(push) ; 6
(declare-const $t@132@01 $Snap)
(push) ; 7
(set-option :timeout 10)
(assert (not (not b2@117@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 571 | b2@117@01 | live]
; [else-branch: 571 | !(b2@117@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 571 | b2@117@01]
(push) ; 8
(set-option :timeout 10)
(assert (not (not b3@118@01)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not b3@118@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 572 | b3@118@01 | live]
; [else-branch: 572 | !(b3@118@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 572 | b3@118@01]
(assert b3@118@01)
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
(check-sat)
; unknown
(set-option :timeout 0)
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
; Create MagicWandSnapFunction for wand (b2 ==> acc(x.g, 1 / 10)) --* (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10))
(declare-const mwsf@133@01 $MWSF)
(assert (forall (($t@132@01 $Snap)) (!
  (= (MWSF_apply mwsf@133@01 $t@132@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@133@01 $t@132@01))
  :qid |quant-u-84|)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 572 | !(b3@118@01)]
(assert (not b3@118@01))
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
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b2 ==> acc(x.g, 1 / 10)) --* (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10))
(declare-const mwsf@134@01 $MWSF)
(assert (forall (($t@132@01 $Snap)) (!
  (= (MWSF_apply mwsf@134@01 $t@132@01) $t@132@01)
  :pattern ((MWSF_apply mwsf@134@01 $t@132@01))
  :qid |quant-u-86|)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
(assert (and b3@118@01 b2@117@01 (not b1@116@01)))
(assert (forall (($t@132@01 $Snap)) (!
  (= (MWSF_apply mwsf@133@01 $t@132@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@133@01 $t@132@01))
  :qid |quant-u-85|)))
(assert true)
; [eval] b1 && b2
(push) ; 7
; [then-branch: 573 | !(b1@116@01) | live]
; [else-branch: 573 | b1@116@01 | live]
(push) ; 8
; [then-branch: 573 | !(b1@116@01)]
(pop) ; 8
(push) ; 8
; [else-branch: 573 | b1@116@01]
(assert b1@116@01)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and b1@116@01 b2@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 574 | b1@116@01 && b2@117@01 | dead]
; [else-branch: 574 | !(b1@116@01 && b2@117@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 574 | !(b1@116@01 && b2@117@01)]
(assert (not (and b1@116@01 b2@117@01)))
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
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
(assert (=
  ($SortWrappers.$SnapToInt $t@121@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@119@01))))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10))
(declare-const mwsf@135@01 $MWSF)
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@135@01 $t@121@01) ($Snap.second $t@119@01))
  :pattern ((MWSF_apply mwsf@135@01 $t@121@01))
  :qid |quant-u-88|)))
; [eval] b1 && b2
(set-option :timeout 0)
(push) ; 8
; [then-branch: 575 | !(b1@116@01) | live]
; [else-branch: 575 | b1@116@01 | live]
(push) ; 9
; [then-branch: 575 | !(b1@116@01)]
(pop) ; 9
(push) ; 9
; [else-branch: 575 | b1@116@01]
(assert b1@116@01)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
(push) ; 6
(assert (and (not b3@118@01) b2@117@01 (not b1@116@01)))
(assert (forall (($t@132@01 $Snap)) (!
  (= (MWSF_apply mwsf@134@01 $t@132@01) $t@132@01)
  :pattern ((MWSF_apply mwsf@134@01 $t@132@01))
  :qid |quant-u-87|)))
(assert true)
; [eval] b1 && b2
(push) ; 7
; [then-branch: 576 | !(b1@116@01) | live]
; [else-branch: 576 | b1@116@01 | live]
(push) ; 8
; [then-branch: 576 | !(b1@116@01)]
(pop) ; 8
(push) ; 8
; [else-branch: 576 | b1@116@01]
(assert b1@116@01)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and b1@116@01 b2@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 577 | b1@116@01 && b2@117@01 | dead]
; [else-branch: 577 | !(b1@116@01 && b2@117@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 577 | !(b1@116@01 && b2@117@01)]
(assert (not (and b1@116@01 b2@117@01)))
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
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
(assert (=
  ($SortWrappers.$SnapToInt $t@121@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@119@01))))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10))
(declare-const mwsf@136@01 $MWSF)
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@136@01 $t@121@01) ($Snap.second $t@119@01))
  :pattern ((MWSF_apply mwsf@136@01 $t@121@01))
  :qid |quant-u-90|)))
; [eval] b1 && b2
(set-option :timeout 0)
(push) ; 8
; [then-branch: 578 | !(b1@116@01) | live]
; [else-branch: 578 | b1@116@01 | live]
(push) ; 9
; [then-branch: 578 | !(b1@116@01)]
(pop) ; 9
(push) ; 9
; [else-branch: 578 | b1@116@01]
(assert b1@116@01)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 570 | !(b2@117@01)]
(assert (not b2@117@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@120@01 x@115@01 b2@117@01))
; [exec]
; package (b2 ==> acc(x.g, 1 / 10)) --*
; (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10)) {
; }
(set-option :timeout 0)
(push) ; 6
(declare-const $t@137@01 $Snap)
; [then-branch: 579 | b2@117@01 | dead]
; [else-branch: 579 | !(b2@117@01) | live]
(push) ; 7
; [else-branch: 579 | !(b2@117@01)]
(assert (= $t@137@01 $Snap.unit))
(push) ; 8
(set-option :timeout 10)
(assert (not (not b3@118@01)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not b3@118@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 580 | b3@118@01 | live]
; [else-branch: 580 | !(b3@118@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 580 | b3@118@01]
(assert b3@118@01)
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
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
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
; Create MagicWandSnapFunction for wand (b2 ==> acc(x.g, 1 / 10)) --* (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10))
(declare-const mwsf@138@01 $MWSF)
(assert (forall (($t@137@01 $Snap)) (!
  (= (MWSF_apply mwsf@138@01 $t@137@01) ($Snap.first $t@119@01))
  :pattern ((MWSF_apply mwsf@138@01 $t@137@01))
  :qid |quant-u-92|)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 580 | !(b3@118@01)]
(assert (not b3@118@01))
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
(check-sat)
; unknown
(set-option :timeout 0)
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
; Create MagicWandSnapFunction for wand (b2 ==> acc(x.g, 1 / 10)) --* (b3 ? acc(x.f, 2 / 10) : acc(x.g, 1 / 10))
(declare-const mwsf@139@01 $MWSF)
(assert (forall (($t@137@01 $Snap)) (!
  (= (MWSF_apply mwsf@139@01 $t@137@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@139@01 $t@137@01))
  :qid |quant-u-94|)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
(assert (and b3@118@01 (not b2@117@01) (not b1@116@01)))
(assert (forall (($t@137@01 $Snap)) (!
  (= (MWSF_apply mwsf@138@01 $t@137@01) ($Snap.first $t@119@01))
  :pattern ((MWSF_apply mwsf@138@01 $t@137@01))
  :qid |quant-u-93|)))
(assert true)
; [eval] b1 && b2
(push) ; 7
; [then-branch: 581 | !(b1@116@01) | live]
; [else-branch: 581 | b1@116@01 | live]
(push) ; 8
; [then-branch: 581 | !(b1@116@01)]
(pop) ; 8
(push) ; 8
; [else-branch: 581 | b1@116@01]
(assert b1@116@01)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and b1@116@01 b2@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 582 | b1@116@01 && b2@117@01 | dead]
; [else-branch: 582 | !(b1@116@01 && b2@117@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 582 | !(b1@116@01 && b2@117@01)]
(assert (not (and b1@116@01 b2@117@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
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
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10))
(declare-const mwsf@140@01 $MWSF)
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@140@01 $t@121@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@140@01 $t@121@01))
  :qid |quant-u-96|)))
; [eval] b1 && b2
(set-option :timeout 0)
(push) ; 8
; [then-branch: 583 | !(b1@116@01) | live]
; [else-branch: 583 | b1@116@01 | live]
(push) ; 9
; [then-branch: 583 | !(b1@116@01)]
(pop) ; 9
(push) ; 9
; [else-branch: 583 | b1@116@01]
(assert b1@116@01)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
(push) ; 6
(assert (and (not b3@118@01) (not b2@117@01) (not b1@116@01)))
(assert (forall (($t@137@01 $Snap)) (!
  (= (MWSF_apply mwsf@139@01 $t@137@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@139@01 $t@137@01))
  :qid |quant-u-95|)))
(assert true)
; [eval] b1 && b2
(push) ; 7
; [then-branch: 584 | !(b1@116@01) | live]
; [else-branch: 584 | b1@116@01 | live]
(push) ; 8
; [then-branch: 584 | !(b1@116@01)]
(pop) ; 8
(push) ; 8
; [else-branch: 584 | b1@116@01]
(assert b1@116@01)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and b1@116@01 b2@117@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 585 | b1@116@01 && b2@117@01 | dead]
; [else-branch: 585 | !(b1@116@01 && b2@117@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 585 | !(b1@116@01 && b2@117@01)]
(assert (not (and b1@116@01 b2@117@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
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
; Create MagicWandSnapFunction for wand (b1 ? acc(x.f, 1 / 10) : acc(x.g, 1 / 10)) --* (b1 && b2 ? acc(x.f, 8 / 10) : acc(x.g, 3 / 10))
(declare-const mwsf@141@01 $MWSF)
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@141@01 $t@121@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@141@01 $t@121@01))
  :qid |quant-u-98|)))
; [eval] b1 && b2
(set-option :timeout 0)
(push) ; 8
; [then-branch: 586 | !(b1@116@01) | live]
; [else-branch: 586 | b1@116@01 | live]
(push) ; 9
; [then-branch: 586 | !(b1@116@01)]
(pop) ; 9
(push) ; 9
; [else-branch: 586 | b1@116@01]
(assert b1@116@01)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (and
  (and b1@116@01 b2@117@01)
  (and b3@118@01 b2@117@01 b1@116@01)
  b2@117@01
  b1@116@01))
(assert (forall (($t@121@01 $Snap)) (!
  (and
    (and
      (=
        ($SortWrappers.$SnapToBool $t@120@01)
        ($SortWrappers.$SnapToBool $t@121@01))
      (=
        ($SortWrappers.$SnapToBool $t@120@01)
        ($SortWrappers.$SnapToBool ($Snap.first $t@119@01))))
    (= (MWSF_apply mwsf@125@01 $t@121@01) ($Snap.first $t@119@01)))
  :pattern ((MWSF_apply mwsf@125@01 $t@121@01))
  :qid |quant-u-73|)))
(assert true)
(assert (forall (($t@122@01 $Snap)) (!
  (= (MWSF_apply mwsf@123@01 $t@122@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@123@01 $t@122@01))
  :qid |quant-u-68|)))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 587 | !(b1@116@01) | live]
; [else-branch: 587 | b1@116@01 | live]
(push) ; 5
; [then-branch: 587 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 587 | b1@116@01]
(push) ; 6
; [then-branch: 588 | !(b2@117@01) | live]
; [else-branch: 588 | b2@117@01 | live]
(push) ; 7
; [then-branch: 588 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 588 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (or b2@117@01 (not b2@117@01))))
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 589 | b1@116@01 && b2@117@01 && b3@118@01 | live]
; [else-branch: 589 | !(b1@116@01 && b2@117@01 && b3@118@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 589 | b1@116@01 && b2@117@01 && b3@118@01]
(assert (and b1@116@01 (and b2@117@01 b3@118@01)))
; [eval] perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 1 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 590 | False | live]
; [else-branch: 590 | True | live]
(push) ; 7
; [then-branch: 590 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 590 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and b1@116@01 (and b2@117@01 b3@118@01))
  (and b1@116@01 b2@117@01 b3@118@01)))
(assert (and b1@116@01 (and b2@117@01 b3@118@01)))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 591 | !(b1@116@01) | live]
; [else-branch: 591 | b1@116@01 | live]
(push) ; 5
; [then-branch: 591 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 591 | b1@116@01]
(push) ; 6
; [then-branch: 592 | !(b2@117@01) | live]
; [else-branch: 592 | b2@117@01 | live]
(push) ; 7
; [then-branch: 592 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 592 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 593 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 593 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 593 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 594 | !(b1@116@01) | live]
; [else-branch: 594 | b1@116@01 | live]
(push) ; 5
; [then-branch: 594 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 594 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 595 | b2@117@01 | live]
; [else-branch: 595 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 595 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 595 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (or (not b2@117@01) b2@117@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 596 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 596 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 596 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 597 | !(b1@116@01) | live]
; [else-branch: 597 | b1@116@01 | live]
(push) ; 5
; [then-branch: 597 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 597 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 598 | b2@117@01 | live]
; [else-branch: 598 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 598 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 598 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 599 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 599 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 599 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 600 | b1@116@01 | live]
; [else-branch: 600 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 600 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 600 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 601 | !(b2@117@01) | live]
; [else-branch: 601 | b2@117@01 | live]
(push) ; 7
; [then-branch: 601 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 601 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (and (not b1@116@01) (or b2@117@01 (not b2@117@01)))))
(assert (or (not b1@116@01) b1@116@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 602 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 602 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 602 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 603 | b1@116@01 | live]
; [else-branch: 603 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 603 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 603 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 604 | !(b2@117@01) | live]
; [else-branch: 604 | b2@117@01 | live]
(push) ; 7
; [then-branch: 604 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 604 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 605 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 605 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 605 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 606 | b1@116@01 | live]
; [else-branch: 606 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 606 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 606 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 607 | b2@117@01 | live]
; [else-branch: 607 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 607 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 607 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (and (not b1@116@01) (or (not b2@117@01) b2@117@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 608 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 608 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 608 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 609 | b1@116@01 | live]
; [else-branch: 609 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 609 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 609 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 610 | b2@117@01 | live]
; [else-branch: 610 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 610 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 610 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 611 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 611 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 611 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert perm(P(x, b2)) >= none
; [eval] perm(P(x, b2)) >= none
; [eval] perm(P(x, b2))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 612 | !(b1@116@01) | live]
; [else-branch: 612 | b1@116@01 | live]
(push) ; 5
; [then-branch: 612 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 612 | b1@116@01]
(push) ; 6
; [then-branch: 613 | !(b2@117@01) | live]
; [else-branch: 613 | b2@117@01 | live]
(push) ; 7
; [then-branch: 613 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 613 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 614 | b1@116@01 && b2@117@01 && b3@118@01 | live]
; [else-branch: 614 | !(b1@116@01 && b2@117@01 && b3@118@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 614 | b1@116@01 && b2@117@01 && b3@118@01]
(assert (and b1@116@01 (and b2@117@01 b3@118@01)))
; [eval] perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 1 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 615 | False | live]
; [else-branch: 615 | True | live]
(push) ; 7
; [then-branch: 615 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 615 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@116@01 (and b2@117@01 b3@118@01)))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 616 | !(b1@116@01) | live]
; [else-branch: 616 | b1@116@01 | live]
(push) ; 5
; [then-branch: 616 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 616 | b1@116@01]
(push) ; 6
; [then-branch: 617 | !(b2@117@01) | live]
; [else-branch: 617 | b2@117@01 | live]
(push) ; 7
; [then-branch: 617 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 617 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 618 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 618 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 618 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 619 | !(b1@116@01) | live]
; [else-branch: 619 | b1@116@01 | live]
(push) ; 5
; [then-branch: 619 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 619 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 620 | b2@117@01 | live]
; [else-branch: 620 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 620 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 620 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 621 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 621 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 621 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 622 | !(b1@116@01) | live]
; [else-branch: 622 | b1@116@01 | live]
(push) ; 5
; [then-branch: 622 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 622 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 623 | b2@117@01 | live]
; [else-branch: 623 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 623 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 623 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 624 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 624 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 624 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 625 | b1@116@01 | live]
; [else-branch: 625 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 625 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 625 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 626 | !(b2@117@01) | live]
; [else-branch: 626 | b2@117@01 | live]
(push) ; 7
; [then-branch: 626 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 626 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 627 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 627 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 627 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 628 | b1@116@01 | live]
; [else-branch: 628 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 628 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 628 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 629 | !(b2@117@01) | live]
; [else-branch: 629 | b2@117@01 | live]
(push) ; 7
; [then-branch: 629 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 629 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 630 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 630 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 630 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 631 | b1@116@01 | live]
; [else-branch: 631 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 631 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 631 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 632 | b2@117@01 | live]
; [else-branch: 632 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 632 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 632 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 633 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 633 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 633 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 634 | b1@116@01 | live]
; [else-branch: 634 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 634 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 634 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 635 | b2@117@01 | live]
; [else-branch: 635 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 635 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 635 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 636 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 636 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 636 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(P(x, b2)) == none
; [eval] perm(P(x, b2)) == none
; [eval] perm(P(x, b2))
(pop) ; 3
(push) ; 3
(assert (and
  (and b1@116@01 b2@117@01)
  (and (not b3@118@01) b2@117@01 b1@116@01)
  b2@117@01
  b1@116@01))
(assert (forall (($t@121@01 $Snap)) (!
  (and
    (and
      (=
        ($SortWrappers.$SnapToBool $t@120@01)
        ($SortWrappers.$SnapToBool $t@121@01))
      (=
        ($SortWrappers.$SnapToBool $t@120@01)
        ($SortWrappers.$SnapToBool ($Snap.first $t@119@01))))
    (= (MWSF_apply mwsf@126@01 $t@121@01) ($Snap.first $t@119@01)))
  :pattern ((MWSF_apply mwsf@126@01 $t@121@01))
  :qid |quant-u-75|)))
(assert true)
(assert (forall (($t@122@01 $Snap)) (!
  (= (MWSF_apply mwsf@124@01 $t@122@01) $t@122@01)
  :pattern ((MWSF_apply mwsf@124@01 $t@122@01))
  :qid |quant-u-70|)))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 637 | !(b1@116@01) | live]
; [else-branch: 637 | b1@116@01 | live]
(push) ; 5
; [then-branch: 637 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 637 | b1@116@01]
(push) ; 6
; [then-branch: 638 | !(b2@117@01) | live]
; [else-branch: 638 | b2@117@01 | live]
(push) ; 7
; [then-branch: 638 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 638 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (or b2@117@01 (not b2@117@01))))
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 639 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 639 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 639 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 640 | !(b1@116@01) | live]
; [else-branch: 640 | b1@116@01 | live]
(push) ; 5
; [then-branch: 640 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 640 | b1@116@01]
(push) ; 6
; [then-branch: 641 | !(b2@117@01) | live]
; [else-branch: 641 | b2@117@01 | live]
(push) ; 7
; [then-branch: 641 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 641 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 642 | b1@116@01 && b2@117@01 && !(b3@118@01) | live]
; [else-branch: 642 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 642 | b1@116@01 && b2@117@01 && !(b3@118@01)]
(assert (and b1@116@01 (and b2@117@01 (not b3@118@01))))
; [eval] perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 3 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 643 | False | live]
; [else-branch: 643 | True | live]
(push) ; 7
; [then-branch: 643 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 643 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and b1@116@01 (and b2@117@01 (not b3@118@01)))
  (and b1@116@01 b2@117@01 (not b3@118@01))))
(assert (and b1@116@01 (and b2@117@01 (not b3@118@01))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 644 | !(b1@116@01) | live]
; [else-branch: 644 | b1@116@01 | live]
(push) ; 5
; [then-branch: 644 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 644 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 645 | b2@117@01 | live]
; [else-branch: 645 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 645 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 645 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (or (not b2@117@01) b2@117@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 646 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 646 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 646 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 647 | !(b1@116@01) | live]
; [else-branch: 647 | b1@116@01 | live]
(push) ; 5
; [then-branch: 647 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 647 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 648 | b2@117@01 | live]
; [else-branch: 648 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 648 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 648 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 649 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 649 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 649 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 650 | b1@116@01 | live]
; [else-branch: 650 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 650 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 650 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 651 | !(b2@117@01) | live]
; [else-branch: 651 | b2@117@01 | live]
(push) ; 7
; [then-branch: 651 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 651 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (and (not b1@116@01) (or b2@117@01 (not b2@117@01)))))
(assert (or (not b1@116@01) b1@116@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 652 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 652 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 652 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 653 | b1@116@01 | live]
; [else-branch: 653 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 653 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 653 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 654 | !(b2@117@01) | live]
; [else-branch: 654 | b2@117@01 | live]
(push) ; 7
; [then-branch: 654 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 654 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 655 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 655 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 655 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 656 | b1@116@01 | live]
; [else-branch: 656 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 656 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 656 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 657 | b2@117@01 | live]
; [else-branch: 657 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 657 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 657 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (and (not b1@116@01) (or (not b2@117@01) b2@117@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 658 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 658 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 658 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 659 | b1@116@01 | live]
; [else-branch: 659 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 659 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 659 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 660 | b2@117@01 | live]
; [else-branch: 660 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 660 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 660 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 661 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 661 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 661 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert perm(P(x, b2)) >= none
; [eval] perm(P(x, b2)) >= none
; [eval] perm(P(x, b2))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 662 | !(b1@116@01) | live]
; [else-branch: 662 | b1@116@01 | live]
(push) ; 5
; [then-branch: 662 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 662 | b1@116@01]
(push) ; 6
; [then-branch: 663 | !(b2@117@01) | live]
; [else-branch: 663 | b2@117@01 | live]
(push) ; 7
; [then-branch: 663 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 663 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 664 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 664 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 664 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 665 | !(b1@116@01) | live]
; [else-branch: 665 | b1@116@01 | live]
(push) ; 5
; [then-branch: 665 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 665 | b1@116@01]
(push) ; 6
; [then-branch: 666 | !(b2@117@01) | live]
; [else-branch: 666 | b2@117@01 | live]
(push) ; 7
; [then-branch: 666 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 666 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 667 | b1@116@01 && b2@117@01 && !(b3@118@01) | live]
; [else-branch: 667 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 667 | b1@116@01 && b2@117@01 && !(b3@118@01)]
(assert (and b1@116@01 (and b2@117@01 (not b3@118@01))))
; [eval] perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 3 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 668 | False | live]
; [else-branch: 668 | True | live]
(push) ; 7
; [then-branch: 668 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 668 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@116@01 (and b2@117@01 (not b3@118@01))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 669 | !(b1@116@01) | live]
; [else-branch: 669 | b1@116@01 | live]
(push) ; 5
; [then-branch: 669 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 669 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 670 | b2@117@01 | live]
; [else-branch: 670 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 670 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 670 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 671 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 671 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 671 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 672 | !(b1@116@01) | live]
; [else-branch: 672 | b1@116@01 | live]
(push) ; 5
; [then-branch: 672 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 672 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 673 | b2@117@01 | live]
; [else-branch: 673 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 673 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 673 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 674 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 674 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 674 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 675 | b1@116@01 | live]
; [else-branch: 675 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 675 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 675 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 676 | !(b2@117@01) | live]
; [else-branch: 676 | b2@117@01 | live]
(push) ; 7
; [then-branch: 676 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 676 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 677 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 677 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 677 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 678 | b1@116@01 | live]
; [else-branch: 678 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 678 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 678 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 679 | !(b2@117@01) | live]
; [else-branch: 679 | b2@117@01 | live]
(push) ; 7
; [then-branch: 679 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 679 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 680 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 680 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 680 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 681 | b1@116@01 | live]
; [else-branch: 681 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 681 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 681 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 682 | b2@117@01 | live]
; [else-branch: 682 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 682 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 682 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 683 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 683 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 683 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 684 | b1@116@01 | live]
; [else-branch: 684 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 684 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 684 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 685 | b2@117@01 | live]
; [else-branch: 685 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 685 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 685 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 686 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 686 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 686 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(P(x, b2)) == none
; [eval] perm(P(x, b2)) == none
; [eval] perm(P(x, b2))
(pop) ; 3
(push) ; 3
(assert (and
  (not (and b1@116@01 b2@117@01))
  (and b3@118@01 (not b2@117@01) b1@116@01)
  (not b2@117@01)
  b1@116@01))
(assert (forall (($t@121@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToBool $t@121@01)
      ($SortWrappers.$SnapToBool ($Snap.first $t@119@01)))
    (= (MWSF_apply mwsf@130@01 $t@121@01) $t@120@01))
  :pattern ((MWSF_apply mwsf@130@01 $t@121@01))
  :qid |quant-u-81|)))
(assert true)
(assert (forall (($t@127@01 $Snap)) (!
  (= (MWSF_apply mwsf@128@01 $t@127@01) ($Snap.first $t@119@01))
  :pattern ((MWSF_apply mwsf@128@01 $t@127@01))
  :qid |quant-u-76|)))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 687 | !(b1@116@01) | live]
; [else-branch: 687 | b1@116@01 | live]
(push) ; 5
; [then-branch: 687 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 687 | b1@116@01]
(push) ; 6
; [then-branch: 688 | !(b2@117@01) | live]
; [else-branch: 688 | b2@117@01 | live]
(push) ; 7
; [then-branch: 688 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 688 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (or b2@117@01 (not b2@117@01))))
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 689 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 689 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 689 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 690 | !(b1@116@01) | live]
; [else-branch: 690 | b1@116@01 | live]
(push) ; 5
; [then-branch: 690 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 690 | b1@116@01]
(push) ; 6
; [then-branch: 691 | !(b2@117@01) | live]
; [else-branch: 691 | b2@117@01 | live]
(push) ; 7
; [then-branch: 691 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 691 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 692 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 692 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 692 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 693 | !(b1@116@01) | live]
; [else-branch: 693 | b1@116@01 | live]
(push) ; 5
; [then-branch: 693 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 693 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 694 | b2@117@01 | live]
; [else-branch: 694 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 694 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 694 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (or (not b2@117@01) b2@117@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 695 | b1@116@01 && !(b2@117@01) && b3@118@01 | live]
; [else-branch: 695 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 695 | b1@116@01 && !(b2@117@01) && b3@118@01]
(assert (and b1@116@01 (and (not b2@117@01) b3@118@01)))
; [eval] perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 4 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 696 | False | live]
; [else-branch: 696 | True | live]
(push) ; 7
; [then-branch: 696 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 696 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and b1@116@01 (and (not b2@117@01) b3@118@01))
  (and b1@116@01 (not b2@117@01) b3@118@01)))
(assert (and b1@116@01 (and (not b2@117@01) b3@118@01)))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 697 | !(b1@116@01) | live]
; [else-branch: 697 | b1@116@01 | live]
(push) ; 5
; [then-branch: 697 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 697 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 698 | b2@117@01 | live]
; [else-branch: 698 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 698 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 698 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 699 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 699 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 699 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 700 | b1@116@01 | live]
; [else-branch: 700 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 700 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 700 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 701 | !(b2@117@01) | live]
; [else-branch: 701 | b2@117@01 | live]
(push) ; 7
; [then-branch: 701 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 701 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (and (not b1@116@01) (or b2@117@01 (not b2@117@01)))))
(assert (or (not b1@116@01) b1@116@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 702 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 702 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 702 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 703 | b1@116@01 | live]
; [else-branch: 703 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 703 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 703 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 704 | !(b2@117@01) | live]
; [else-branch: 704 | b2@117@01 | live]
(push) ; 7
; [then-branch: 704 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 704 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 705 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 705 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 705 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 706 | b1@116@01 | live]
; [else-branch: 706 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 706 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 706 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 707 | b2@117@01 | live]
; [else-branch: 707 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 707 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 707 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (and (not b1@116@01) (or (not b2@117@01) b2@117@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 708 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 708 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 708 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 709 | b1@116@01 | live]
; [else-branch: 709 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 709 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 709 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 710 | b2@117@01 | live]
; [else-branch: 710 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 710 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 710 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 711 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 711 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 711 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert perm(P(x, b2)) >= none
; [eval] perm(P(x, b2)) >= none
; [eval] perm(P(x, b2))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 712 | !(b1@116@01) | live]
; [else-branch: 712 | b1@116@01 | live]
(push) ; 5
; [then-branch: 712 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 712 | b1@116@01]
(push) ; 6
; [then-branch: 713 | !(b2@117@01) | live]
; [else-branch: 713 | b2@117@01 | live]
(push) ; 7
; [then-branch: 713 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 713 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 714 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 714 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 714 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 715 | !(b1@116@01) | live]
; [else-branch: 715 | b1@116@01 | live]
(push) ; 5
; [then-branch: 715 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 715 | b1@116@01]
(push) ; 6
; [then-branch: 716 | !(b2@117@01) | live]
; [else-branch: 716 | b2@117@01 | live]
(push) ; 7
; [then-branch: 716 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 716 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 717 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 717 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 717 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 718 | !(b1@116@01) | live]
; [else-branch: 718 | b1@116@01 | live]
(push) ; 5
; [then-branch: 718 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 718 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 719 | b2@117@01 | live]
; [else-branch: 719 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 719 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 719 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 720 | b1@116@01 && !(b2@117@01) && b3@118@01 | live]
; [else-branch: 720 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 720 | b1@116@01 && !(b2@117@01) && b3@118@01]
(assert (and b1@116@01 (and (not b2@117@01) b3@118@01)))
; [eval] perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 4 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 721 | False | live]
; [else-branch: 721 | True | live]
(push) ; 7
; [then-branch: 721 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 721 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@116@01 (and (not b2@117@01) b3@118@01)))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 722 | !(b1@116@01) | live]
; [else-branch: 722 | b1@116@01 | live]
(push) ; 5
; [then-branch: 722 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 722 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 723 | b2@117@01 | live]
; [else-branch: 723 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 723 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 723 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 724 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 724 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 724 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 725 | b1@116@01 | live]
; [else-branch: 725 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 725 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 725 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 726 | !(b2@117@01) | live]
; [else-branch: 726 | b2@117@01 | live]
(push) ; 7
; [then-branch: 726 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 726 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 727 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 727 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 727 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 728 | b1@116@01 | live]
; [else-branch: 728 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 728 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 728 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 729 | !(b2@117@01) | live]
; [else-branch: 729 | b2@117@01 | live]
(push) ; 7
; [then-branch: 729 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 729 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 730 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 730 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 730 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 731 | b1@116@01 | live]
; [else-branch: 731 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 731 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 731 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 732 | b2@117@01 | live]
; [else-branch: 732 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 732 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 732 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 733 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 733 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 733 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 734 | b1@116@01 | live]
; [else-branch: 734 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 734 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 734 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 735 | b2@117@01 | live]
; [else-branch: 735 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 735 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 735 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 736 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 736 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 736 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(P(x, b2)) == none
; [eval] perm(P(x, b2)) == none
; [eval] perm(P(x, b2))
(pop) ; 3
(push) ; 3
(assert (and
  (not (and b1@116@01 b2@117@01))
  (and (not b3@118@01) (not b2@117@01) b1@116@01)
  (not b2@117@01)
  b1@116@01))
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@131@01 $t@121@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@131@01 $t@121@01))
  :qid |quant-u-83|)))
(assert true)
(assert (forall (($t@127@01 $Snap)) (!
  (= (MWSF_apply mwsf@129@01 $t@127@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@129@01 $t@127@01))
  :qid |quant-u-78|)))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 737 | !(b1@116@01) | live]
; [else-branch: 737 | b1@116@01 | live]
(push) ; 5
; [then-branch: 737 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 737 | b1@116@01]
(push) ; 6
; [then-branch: 738 | !(b2@117@01) | live]
; [else-branch: 738 | b2@117@01 | live]
(push) ; 7
; [then-branch: 738 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 738 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (or b2@117@01 (not b2@117@01))))
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 739 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 739 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 739 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 740 | !(b1@116@01) | live]
; [else-branch: 740 | b1@116@01 | live]
(push) ; 5
; [then-branch: 740 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 740 | b1@116@01]
(push) ; 6
; [then-branch: 741 | !(b2@117@01) | live]
; [else-branch: 741 | b2@117@01 | live]
(push) ; 7
; [then-branch: 741 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 741 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 742 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 742 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 742 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 743 | !(b1@116@01) | live]
; [else-branch: 743 | b1@116@01 | live]
(push) ; 5
; [then-branch: 743 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 743 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 744 | b2@117@01 | live]
; [else-branch: 744 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 744 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 744 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (or (not b2@117@01) b2@117@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 745 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 745 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 745 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 746 | !(b1@116@01) | live]
; [else-branch: 746 | b1@116@01 | live]
(push) ; 5
; [then-branch: 746 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 746 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 747 | b2@117@01 | live]
; [else-branch: 747 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 747 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 747 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 748 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | live]
; [else-branch: 748 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 748 | b1@116@01 && !(b2@117@01) && !(b3@118@01)]
(assert (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))
; [eval] perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 749 | False | live]
; [else-branch: 749 | True | live]
(push) ; 7
; [then-branch: 749 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 749 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))
  (and b1@116@01 (not b2@117@01) (not b3@118@01))))
(assert (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 750 | b1@116@01 | live]
; [else-branch: 750 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 750 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 750 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 751 | !(b2@117@01) | live]
; [else-branch: 751 | b2@117@01 | live]
(push) ; 7
; [then-branch: 751 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 751 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (and (not b1@116@01) (or b2@117@01 (not b2@117@01)))))
(assert (or (not b1@116@01) b1@116@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 752 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 752 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 752 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 753 | b1@116@01 | live]
; [else-branch: 753 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 753 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 753 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 754 | !(b2@117@01) | live]
; [else-branch: 754 | b2@117@01 | live]
(push) ; 7
; [then-branch: 754 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 754 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 755 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 755 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 755 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 756 | b1@116@01 | live]
; [else-branch: 756 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 756 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 756 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 757 | b2@117@01 | live]
; [else-branch: 757 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 757 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 757 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (and (not b1@116@01) (or (not b2@117@01) b2@117@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 758 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 758 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 758 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 759 | b1@116@01 | live]
; [else-branch: 759 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 759 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 759 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 760 | b2@117@01 | live]
; [else-branch: 760 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 760 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 760 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 761 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 761 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 761 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert perm(P(x, b2)) >= none
; [eval] perm(P(x, b2)) >= none
; [eval] perm(P(x, b2))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 762 | !(b1@116@01) | live]
; [else-branch: 762 | b1@116@01 | live]
(push) ; 5
; [then-branch: 762 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 762 | b1@116@01]
(push) ; 6
; [then-branch: 763 | !(b2@117@01) | live]
; [else-branch: 763 | b2@117@01 | live]
(push) ; 7
; [then-branch: 763 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 763 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 764 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 764 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 764 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 765 | !(b1@116@01) | live]
; [else-branch: 765 | b1@116@01 | live]
(push) ; 5
; [then-branch: 765 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 765 | b1@116@01]
(push) ; 6
; [then-branch: 766 | !(b2@117@01) | live]
; [else-branch: 766 | b2@117@01 | live]
(push) ; 7
; [then-branch: 766 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 766 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 767 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 767 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 767 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 768 | !(b1@116@01) | live]
; [else-branch: 768 | b1@116@01 | live]
(push) ; 5
; [then-branch: 768 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 768 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 769 | b2@117@01 | live]
; [else-branch: 769 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 769 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 769 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 770 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 770 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 770 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 771 | !(b1@116@01) | live]
; [else-branch: 771 | b1@116@01 | live]
(push) ; 5
; [then-branch: 771 | !(b1@116@01)]
(assert (not b1@116@01))
(pop) ; 5
(push) ; 5
; [else-branch: 771 | b1@116@01]
; [eval] !b2
(push) ; 6
; [then-branch: 772 | b2@117@01 | live]
; [else-branch: 772 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 772 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 772 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 773 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | live]
; [else-branch: 773 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 773 | b1@116@01 && !(b2@117@01) && !(b3@118@01)]
(assert (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))
; [eval] perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 774 | False | live]
; [else-branch: 774 | True | live]
(push) ; 7
; [then-branch: 774 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 774 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 775 | b1@116@01 | live]
; [else-branch: 775 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 775 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 775 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 776 | !(b2@117@01) | live]
; [else-branch: 776 | b2@117@01 | live]
(push) ; 7
; [then-branch: 776 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 776 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 777 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 777 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 777 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 778 | b1@116@01 | live]
; [else-branch: 778 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 778 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 778 | !(b1@116@01)]
(assert (not b1@116@01))
(push) ; 6
; [then-branch: 779 | !(b2@117@01) | live]
; [else-branch: 779 | b2@117@01 | live]
(push) ; 7
; [then-branch: 779 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 779 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 780 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 780 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 780 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 781 | b1@116@01 | live]
; [else-branch: 781 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 781 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 781 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 782 | b2@117@01 | live]
; [else-branch: 782 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 782 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 782 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 783 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 783 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 783 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 784 | b1@116@01 | live]
; [else-branch: 784 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 784 | b1@116@01]
(pop) ; 5
(push) ; 5
; [else-branch: 784 | !(b1@116@01)]
(assert (not b1@116@01))
; [eval] !b2
(push) ; 6
; [then-branch: 785 | b2@117@01 | live]
; [else-branch: 785 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 785 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 785 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 786 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 786 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 786 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(P(x, b2)) == none
; [eval] perm(P(x, b2)) == none
; [eval] perm(P(x, b2))
(pop) ; 3
(push) ; 3
(assert (and
  (not (and b1@116@01 b2@117@01))
  (and b3@118@01 b2@117@01 (not b1@116@01))
  b2@117@01
  (not b1@116@01)))
(assert (forall (($t@121@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToInt $t@121@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@119@01)))
    (= (MWSF_apply mwsf@135@01 $t@121@01) ($Snap.second $t@119@01)))
  :pattern ((MWSF_apply mwsf@135@01 $t@121@01))
  :qid |quant-u-89|)))
(assert true)
(assert (forall (($t@132@01 $Snap)) (!
  (= (MWSF_apply mwsf@133@01 $t@132@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@133@01 $t@132@01))
  :qid |quant-u-84|)))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 787 | !(b1@116@01) | live]
; [else-branch: 787 | b1@116@01 | live]
(push) ; 5
; [then-branch: 787 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 787 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 788 | !(b2@117@01) | live]
; [else-branch: 788 | b2@117@01 | live]
(push) ; 7
; [then-branch: 788 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 788 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (and b1@116@01 (or b2@117@01 (not b2@117@01)))))
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 789 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 789 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 789 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 790 | !(b1@116@01) | live]
; [else-branch: 790 | b1@116@01 | live]
(push) ; 5
; [then-branch: 790 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 790 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 791 | !(b2@117@01) | live]
; [else-branch: 791 | b2@117@01 | live]
(push) ; 7
; [then-branch: 791 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 791 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 792 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 792 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 792 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 793 | !(b1@116@01) | live]
; [else-branch: 793 | b1@116@01 | live]
(push) ; 5
; [then-branch: 793 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 793 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 794 | b2@117@01 | live]
; [else-branch: 794 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 794 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 794 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (and b1@116@01 (or (not b2@117@01) b2@117@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 795 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 795 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 795 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 796 | !(b1@116@01) | live]
; [else-branch: 796 | b1@116@01 | live]
(push) ; 5
; [then-branch: 796 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 796 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 797 | b2@117@01 | live]
; [else-branch: 797 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 797 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 797 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 798 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 798 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 798 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 799 | b1@116@01 | live]
; [else-branch: 799 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 799 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 799 | !(b1@116@01)]
(push) ; 6
; [then-branch: 800 | !(b2@117@01) | live]
; [else-branch: 800 | b2@117@01 | live]
(push) ; 7
; [then-branch: 800 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 800 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (or b2@117@01 (not b2@117@01))))
(assert (or (not b1@116@01) b1@116@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 801 | !(b1@116@01) && b2@117@01 && b3@118@01 | live]
; [else-branch: 801 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 801 | !(b1@116@01) && b2@117@01 && b3@118@01]
(assert (and (not b1@116@01) (and b2@117@01 b3@118@01)))
; [eval] perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 802 | False | live]
; [else-branch: 802 | True | live]
(push) ; 7
; [then-branch: 802 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 802 | True]
; [eval] perm(x.g) >= 3 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (not b1@116@01) (and b2@117@01 b3@118@01))
  (and (not b1@116@01) b2@117@01 b3@118@01)))
(assert (and (not b1@116@01) (and b2@117@01 b3@118@01)))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 803 | b1@116@01 | live]
; [else-branch: 803 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 803 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 803 | !(b1@116@01)]
(push) ; 6
; [then-branch: 804 | !(b2@117@01) | live]
; [else-branch: 804 | b2@117@01 | live]
(push) ; 7
; [then-branch: 804 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 804 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 805 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 805 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 805 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 806 | b1@116@01 | live]
; [else-branch: 806 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 806 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 806 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 807 | b2@117@01 | live]
; [else-branch: 807 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 807 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 807 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (or (not b2@117@01) b2@117@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 808 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 808 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 808 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 809 | b1@116@01 | live]
; [else-branch: 809 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 809 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 809 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 810 | b2@117@01 | live]
; [else-branch: 810 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 810 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 810 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 811 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 811 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 811 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert perm(P(x, b2)) >= none
; [eval] perm(P(x, b2)) >= none
; [eval] perm(P(x, b2))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 812 | !(b1@116@01) | live]
; [else-branch: 812 | b1@116@01 | live]
(push) ; 5
; [then-branch: 812 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 812 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 813 | !(b2@117@01) | live]
; [else-branch: 813 | b2@117@01 | live]
(push) ; 7
; [then-branch: 813 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 813 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 814 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 814 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 814 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 815 | !(b1@116@01) | live]
; [else-branch: 815 | b1@116@01 | live]
(push) ; 5
; [then-branch: 815 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 815 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 816 | !(b2@117@01) | live]
; [else-branch: 816 | b2@117@01 | live]
(push) ; 7
; [then-branch: 816 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 816 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 817 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 817 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 817 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 818 | !(b1@116@01) | live]
; [else-branch: 818 | b1@116@01 | live]
(push) ; 5
; [then-branch: 818 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 818 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 819 | b2@117@01 | live]
; [else-branch: 819 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 819 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 819 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 820 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 820 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 820 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 821 | !(b1@116@01) | live]
; [else-branch: 821 | b1@116@01 | live]
(push) ; 5
; [then-branch: 821 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 821 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 822 | b2@117@01 | live]
; [else-branch: 822 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 822 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 822 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 823 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 823 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 823 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 824 | b1@116@01 | live]
; [else-branch: 824 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 824 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 824 | !(b1@116@01)]
(push) ; 6
; [then-branch: 825 | !(b2@117@01) | live]
; [else-branch: 825 | b2@117@01 | live]
(push) ; 7
; [then-branch: 825 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 825 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 826 | !(b1@116@01) && b2@117@01 && b3@118@01 | live]
; [else-branch: 826 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 826 | !(b1@116@01) && b2@117@01 && b3@118@01]
(assert (and (not b1@116@01) (and b2@117@01 b3@118@01)))
; [eval] perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 827 | False | live]
; [else-branch: 827 | True | live]
(push) ; 7
; [then-branch: 827 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 827 | True]
; [eval] perm(x.g) == 3 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@116@01) (and b2@117@01 b3@118@01)))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 828 | b1@116@01 | live]
; [else-branch: 828 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 828 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 828 | !(b1@116@01)]
(push) ; 6
; [then-branch: 829 | !(b2@117@01) | live]
; [else-branch: 829 | b2@117@01 | live]
(push) ; 7
; [then-branch: 829 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 829 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 830 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 830 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 830 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 831 | b1@116@01 | live]
; [else-branch: 831 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 831 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 831 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 832 | b2@117@01 | live]
; [else-branch: 832 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 832 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 832 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 833 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 833 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 833 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 834 | b1@116@01 | live]
; [else-branch: 834 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 834 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 834 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 835 | b2@117@01 | live]
; [else-branch: 835 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 835 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 835 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 836 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 836 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 836 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(P(x, b2)) == none
; [eval] perm(P(x, b2)) == none
; [eval] perm(P(x, b2))
(pop) ; 3
(push) ; 3
(assert (and
  (not (and b1@116@01 b2@117@01))
  (and (not b3@118@01) b2@117@01 (not b1@116@01))
  b2@117@01
  (not b1@116@01)))
(assert (forall (($t@121@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToInt $t@121@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@119@01)))
    (= (MWSF_apply mwsf@136@01 $t@121@01) ($Snap.second $t@119@01)))
  :pattern ((MWSF_apply mwsf@136@01 $t@121@01))
  :qid |quant-u-91|)))
(assert true)
(assert (forall (($t@132@01 $Snap)) (!
  (= (MWSF_apply mwsf@134@01 $t@132@01) $t@132@01)
  :pattern ((MWSF_apply mwsf@134@01 $t@132@01))
  :qid |quant-u-86|)))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 837 | !(b1@116@01) | live]
; [else-branch: 837 | b1@116@01 | live]
(push) ; 5
; [then-branch: 837 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 837 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 838 | !(b2@117@01) | live]
; [else-branch: 838 | b2@117@01 | live]
(push) ; 7
; [then-branch: 838 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 838 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (and b1@116@01 (or b2@117@01 (not b2@117@01)))))
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 839 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 839 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 839 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 840 | !(b1@116@01) | live]
; [else-branch: 840 | b1@116@01 | live]
(push) ; 5
; [then-branch: 840 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 840 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 841 | !(b2@117@01) | live]
; [else-branch: 841 | b2@117@01 | live]
(push) ; 7
; [then-branch: 841 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 841 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 842 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 842 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 842 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 843 | !(b1@116@01) | live]
; [else-branch: 843 | b1@116@01 | live]
(push) ; 5
; [then-branch: 843 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 843 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 844 | b2@117@01 | live]
; [else-branch: 844 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 844 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 844 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (and b1@116@01 (or (not b2@117@01) b2@117@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 845 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 845 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 845 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 846 | !(b1@116@01) | live]
; [else-branch: 846 | b1@116@01 | live]
(push) ; 5
; [then-branch: 846 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 846 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 847 | b2@117@01 | live]
; [else-branch: 847 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 847 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 847 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 848 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 848 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 848 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 849 | b1@116@01 | live]
; [else-branch: 849 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 849 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 849 | !(b1@116@01)]
(push) ; 6
; [then-branch: 850 | !(b2@117@01) | live]
; [else-branch: 850 | b2@117@01 | live]
(push) ; 7
; [then-branch: 850 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 850 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (or b2@117@01 (not b2@117@01))))
(assert (or (not b1@116@01) b1@116@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 851 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 851 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 851 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 852 | b1@116@01 | live]
; [else-branch: 852 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 852 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 852 | !(b1@116@01)]
(push) ; 6
; [then-branch: 853 | !(b2@117@01) | live]
; [else-branch: 853 | b2@117@01 | live]
(push) ; 7
; [then-branch: 853 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 853 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 854 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | live]
; [else-branch: 854 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 854 | !(b1@116@01) && b2@117@01 && !(b3@118@01)]
(assert (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))
; [eval] perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 855 | False | live]
; [else-branch: 855 | True | live]
(push) ; 7
; [then-branch: 855 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 855 | True]
; [eval] perm(x.g) >= 3 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))
  (and (not b1@116@01) b2@117@01 (not b3@118@01))))
(assert (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 856 | b1@116@01 | live]
; [else-branch: 856 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 856 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 856 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 857 | b2@117@01 | live]
; [else-branch: 857 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 857 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 857 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (or (not b2@117@01) b2@117@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 858 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 858 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 858 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 859 | b1@116@01 | live]
; [else-branch: 859 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 859 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 859 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 860 | b2@117@01 | live]
; [else-branch: 860 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 860 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 860 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 861 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 861 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 861 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert perm(P(x, b2)) >= none
; [eval] perm(P(x, b2)) >= none
; [eval] perm(P(x, b2))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 862 | !(b1@116@01) | live]
; [else-branch: 862 | b1@116@01 | live]
(push) ; 5
; [then-branch: 862 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 862 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 863 | !(b2@117@01) | live]
; [else-branch: 863 | b2@117@01 | live]
(push) ; 7
; [then-branch: 863 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 863 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 864 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 864 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 864 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 865 | !(b1@116@01) | live]
; [else-branch: 865 | b1@116@01 | live]
(push) ; 5
; [then-branch: 865 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 865 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 866 | !(b2@117@01) | live]
; [else-branch: 866 | b2@117@01 | live]
(push) ; 7
; [then-branch: 866 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 866 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 867 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 867 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 867 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 868 | !(b1@116@01) | live]
; [else-branch: 868 | b1@116@01 | live]
(push) ; 5
; [then-branch: 868 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 868 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 869 | b2@117@01 | live]
; [else-branch: 869 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 869 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 869 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 870 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 870 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 870 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 871 | !(b1@116@01) | live]
; [else-branch: 871 | b1@116@01 | live]
(push) ; 5
; [then-branch: 871 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 871 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 872 | b2@117@01 | live]
; [else-branch: 872 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 872 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 872 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 873 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 873 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 873 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 874 | b1@116@01 | live]
; [else-branch: 874 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 874 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 874 | !(b1@116@01)]
(push) ; 6
; [then-branch: 875 | !(b2@117@01) | live]
; [else-branch: 875 | b2@117@01 | live]
(push) ; 7
; [then-branch: 875 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 875 | b2@117@01]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 876 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 876 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 876 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 877 | b1@116@01 | live]
; [else-branch: 877 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 877 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 877 | !(b1@116@01)]
(push) ; 6
; [then-branch: 878 | !(b2@117@01) | live]
; [else-branch: 878 | b2@117@01 | live]
(push) ; 7
; [then-branch: 878 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(push) ; 7
; [else-branch: 878 | b2@117@01]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 879 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | live]
; [else-branch: 879 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 879 | !(b1@116@01) && b2@117@01 && !(b3@118@01)]
(assert (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))
; [eval] perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 880 | False | live]
; [else-branch: 880 | True | live]
(push) ; 7
; [then-branch: 880 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 880 | True]
; [eval] perm(x.g) == 3 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 881 | b1@116@01 | live]
; [else-branch: 881 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 881 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 881 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 882 | b2@117@01 | live]
; [else-branch: 882 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 882 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 882 | !(b2@117@01)]
(assert (not b2@117@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 883 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 883 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 883 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 884 | b1@116@01 | live]
; [else-branch: 884 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 884 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 884 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 885 | b2@117@01 | live]
; [else-branch: 885 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 885 | b2@117@01]
(pop) ; 7
(push) ; 7
; [else-branch: 885 | !(b2@117@01)]
(assert (not b2@117@01))
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 886 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 886 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 886 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(P(x, b2)) == none
; [eval] perm(P(x, b2)) == none
; [eval] perm(P(x, b2))
(pop) ; 3
(push) ; 3
(assert (and
  (not (and b1@116@01 b2@117@01))
  (and b3@118@01 (not b2@117@01) (not b1@116@01))
  (not b2@117@01)
  (not b1@116@01)))
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@140@01 $t@121@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@140@01 $t@121@01))
  :qid |quant-u-97|)))
(assert true)
(assert (forall (($t@137@01 $Snap)) (!
  (= (MWSF_apply mwsf@138@01 $t@137@01) ($Snap.first $t@119@01))
  :pattern ((MWSF_apply mwsf@138@01 $t@137@01))
  :qid |quant-u-92|)))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 887 | !(b1@116@01) | live]
; [else-branch: 887 | b1@116@01 | live]
(push) ; 5
; [then-branch: 887 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 887 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 888 | !(b2@117@01) | live]
; [else-branch: 888 | b2@117@01 | live]
(push) ; 7
; [then-branch: 888 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 888 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (and b1@116@01 (or b2@117@01 (not b2@117@01)))))
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 889 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 889 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 889 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 890 | !(b1@116@01) | live]
; [else-branch: 890 | b1@116@01 | live]
(push) ; 5
; [then-branch: 890 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 890 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 891 | !(b2@117@01) | live]
; [else-branch: 891 | b2@117@01 | live]
(push) ; 7
; [then-branch: 891 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 891 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 892 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 892 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 892 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 893 | !(b1@116@01) | live]
; [else-branch: 893 | b1@116@01 | live]
(push) ; 5
; [then-branch: 893 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 893 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 894 | b2@117@01 | live]
; [else-branch: 894 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 894 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 894 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (and b1@116@01 (or (not b2@117@01) b2@117@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 895 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 895 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 895 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 896 | !(b1@116@01) | live]
; [else-branch: 896 | b1@116@01 | live]
(push) ; 5
; [then-branch: 896 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 896 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 897 | b2@117@01 | live]
; [else-branch: 897 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 897 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 897 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 898 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 898 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 898 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 899 | b1@116@01 | live]
; [else-branch: 899 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 899 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 899 | !(b1@116@01)]
(push) ; 6
; [then-branch: 900 | !(b2@117@01) | live]
; [else-branch: 900 | b2@117@01 | live]
(push) ; 7
; [then-branch: 900 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 900 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (or b2@117@01 (not b2@117@01))))
(assert (or (not b1@116@01) b1@116@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 901 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 901 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 901 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 902 | b1@116@01 | live]
; [else-branch: 902 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 902 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 902 | !(b1@116@01)]
(push) ; 6
; [then-branch: 903 | !(b2@117@01) | live]
; [else-branch: 903 | b2@117@01 | live]
(push) ; 7
; [then-branch: 903 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 903 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 904 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 904 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 904 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 905 | b1@116@01 | live]
; [else-branch: 905 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 905 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 905 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 906 | b2@117@01 | live]
; [else-branch: 906 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 906 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 906 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (or (not b2@117@01) b2@117@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 907 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | live]
; [else-branch: 907 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 907 | !(b1@116@01) && !(b2@117@01) && b3@118@01]
(assert (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))
; [eval] perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 3 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 908 | False | live]
; [else-branch: 908 | True | live]
(push) ; 7
; [then-branch: 908 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 908 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (not b1@116@01) (and (not b2@117@01) b3@118@01))
  (and (not b1@116@01) (not b2@117@01) b3@118@01)))
(assert (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 909 | b1@116@01 | live]
; [else-branch: 909 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 909 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 909 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 910 | b2@117@01 | live]
; [else-branch: 910 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 910 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 910 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 911 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 911 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 911 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert perm(P(x, b2)) >= none
; [eval] perm(P(x, b2)) >= none
; [eval] perm(P(x, b2))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 912 | !(b1@116@01) | live]
; [else-branch: 912 | b1@116@01 | live]
(push) ; 5
; [then-branch: 912 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 912 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 913 | !(b2@117@01) | live]
; [else-branch: 913 | b2@117@01 | live]
(push) ; 7
; [then-branch: 913 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 913 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 914 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 914 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 914 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 915 | !(b1@116@01) | live]
; [else-branch: 915 | b1@116@01 | live]
(push) ; 5
; [then-branch: 915 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 915 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 916 | !(b2@117@01) | live]
; [else-branch: 916 | b2@117@01 | live]
(push) ; 7
; [then-branch: 916 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 916 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 917 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 917 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 917 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 918 | !(b1@116@01) | live]
; [else-branch: 918 | b1@116@01 | live]
(push) ; 5
; [then-branch: 918 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 918 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 919 | b2@117@01 | live]
; [else-branch: 919 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 919 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 919 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 920 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 920 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 920 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 921 | !(b1@116@01) | live]
; [else-branch: 921 | b1@116@01 | live]
(push) ; 5
; [then-branch: 921 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 921 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 922 | b2@117@01 | live]
; [else-branch: 922 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 922 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 922 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 923 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 923 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 923 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 924 | b1@116@01 | live]
; [else-branch: 924 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 924 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 924 | !(b1@116@01)]
(push) ; 6
; [then-branch: 925 | !(b2@117@01) | live]
; [else-branch: 925 | b2@117@01 | live]
(push) ; 7
; [then-branch: 925 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 925 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 926 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 926 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 926 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 927 | b1@116@01 | live]
; [else-branch: 927 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 927 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 927 | !(b1@116@01)]
(push) ; 6
; [then-branch: 928 | !(b2@117@01) | live]
; [else-branch: 928 | b2@117@01 | live]
(push) ; 7
; [then-branch: 928 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 928 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 929 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 929 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 929 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 930 | b1@116@01 | live]
; [else-branch: 930 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 930 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 930 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 931 | b2@117@01 | live]
; [else-branch: 931 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 931 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 931 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 932 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | live]
; [else-branch: 932 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 932 | !(b1@116@01) && !(b2@117@01) && b3@118@01]
(assert (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))
; [eval] perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 3 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 933 | False | live]
; [else-branch: 933 | True | live]
(push) ; 7
; [then-branch: 933 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 933 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 934 | b1@116@01 | live]
; [else-branch: 934 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 934 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 934 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 935 | b2@117@01 | live]
; [else-branch: 935 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 935 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 935 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 936 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 936 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 936 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert perm(P(x, b2)) == none
; [eval] perm(P(x, b2)) == none
; [eval] perm(P(x, b2))
(pop) ; 3
(push) ; 3
(assert (and
  (not (and b1@116@01 b2@117@01))
  (and (not b3@118@01) (not b2@117@01) (not b1@116@01))
  (not b2@117@01)
  (not b1@116@01)))
(assert (forall (($t@121@01 $Snap)) (!
  (= (MWSF_apply mwsf@141@01 $t@121@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@141@01 $t@121@01))
  :qid |quant-u-99|)))
(assert true)
(assert (forall (($t@137@01 $Snap)) (!
  (= (MWSF_apply mwsf@139@01 $t@137@01) $t@120@01)
  :pattern ((MWSF_apply mwsf@139@01 $t@137@01))
  :qid |quant-u-94|)))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) >= 1 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 937 | !(b1@116@01) | live]
; [else-branch: 937 | b1@116@01 | live]
(push) ; 5
; [then-branch: 937 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 937 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 938 | !(b2@117@01) | live]
; [else-branch: 938 | b2@117@01 | live]
(push) ; 7
; [then-branch: 938 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 938 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (and b1@116@01 (or b2@117@01 (not b2@117@01)))))
(assert (or b1@116@01 (not b1@116@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 939 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 939 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 939 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 b3@118@01))))
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 940 | !(b1@116@01) | live]
; [else-branch: 940 | b1@116@01 | live]
(push) ; 5
; [then-branch: 940 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 940 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 941 | !(b2@117@01) | live]
; [else-branch: 941 | b2@117@01 | live]
(push) ; 7
; [then-branch: 941 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 941 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 942 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 942 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 942 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) >= 4 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 943 | !(b1@116@01) | live]
; [else-branch: 943 | b1@116@01 | live]
(push) ; 5
; [then-branch: 943 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 943 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 944 | b2@117@01 | live]
; [else-branch: 944 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 944 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 944 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b1@116@01 (and b1@116@01 (or (not b2@117@01) b2@117@01))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 945 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 945 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 945 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) b3@118@01))))
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 946 | !(b1@116@01) | live]
; [else-branch: 946 | b1@116@01 | live]
(push) ; 5
; [then-branch: 946 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 946 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 947 | b2@117@01 | live]
; [else-branch: 947 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 947 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 947 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 948 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 948 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 948 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and b1@116@01 (and (not b2@117@01) (not b3@118@01)))))
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 949 | b1@116@01 | live]
; [else-branch: 949 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 949 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 949 | !(b1@116@01)]
(push) ; 6
; [then-branch: 950 | !(b2@117@01) | live]
; [else-branch: 950 | b2@117@01 | live]
(push) ; 7
; [then-branch: 950 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 950 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (or b2@117@01 (not b2@117@01))))
(assert (or (not b1@116@01) b1@116@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 951 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 951 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 951 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 b3@118@01))))
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 952 | b1@116@01 | live]
; [else-branch: 952 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 952 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 952 | !(b1@116@01)]
(push) ; 6
; [then-branch: 953 | !(b2@117@01) | live]
; [else-branch: 953 | b2@117@01 | live]
(push) ; 7
; [then-branch: 953 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 953 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 954 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 954 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 954 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and b2@117@01 (not b3@118@01)))))
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) >= 3 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 955 | b1@116@01 | live]
; [else-branch: 955 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 955 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 955 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 956 | b2@117@01 | live]
; [else-branch: 956 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 956 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 956 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (not b1@116@01) (or (not b2@117@01) b2@117@01)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 957 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 957 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 957 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (not b1@116@01) (and (not b2@117@01) b3@118@01))))
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 958 | b1@116@01 | live]
; [else-branch: 958 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 958 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 958 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 959 | b2@117@01 | live]
; [else-branch: 959 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 959 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 959 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 960 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | live]
; [else-branch: 960 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 960 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01)]
(assert (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))
; [eval] perm(x.f) >= 5 / 10 && perm(x.g) >= 5 / 10
; [eval] perm(x.f) >= 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 961 | False | live]
; [else-branch: 961 | True | live]
(push) ; 7
; [then-branch: 961 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 961 | True]
; [eval] perm(x.g) >= 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))
  (and (not b1@116@01) (not b2@117@01) (not b3@118@01))))
(assert (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))
; [exec]
; assert perm(P(x, b2)) >= none
; [eval] perm(P(x, b2)) >= none
; [eval] perm(P(x, b2))
; [exec]
; assert b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3) ==> perm(x.f) == 1 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && b3)
(push) ; 4
; [then-branch: 962 | !(b1@116@01) | live]
; [else-branch: 962 | b1@116@01 | live]
(push) ; 5
; [then-branch: 962 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 962 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 963 | !(b2@117@01) | live]
; [else-branch: 963 | b2@117@01 | live]
(push) ; 7
; [then-branch: 963 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 963 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 964 | b1@116@01 && b2@117@01 && b3@118@01 | dead]
; [else-branch: 964 | !(b1@116@01 && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 964 | !(b1@116@01 && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (b2 && !b3)
(push) ; 4
; [then-branch: 965 | !(b1@116@01) | live]
; [else-branch: 965 | b1@116@01 | live]
(push) ; 5
; [then-branch: 965 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 965 | b1@116@01]
(assert b1@116@01)
(push) ; 6
; [then-branch: 966 | !(b2@117@01) | live]
; [else-branch: 966 | b2@117@01 | live]
(push) ; 7
; [then-branch: 966 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 966 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 967 | b1@116@01 && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 967 | !(b1@116@01 && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 967 | !(b1@116@01 && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3) ==> perm(x.f) == 4 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && b3)
(push) ; 4
; [then-branch: 968 | !(b1@116@01) | live]
; [else-branch: 968 | b1@116@01 | live]
(push) ; 5
; [then-branch: 968 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 968 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 969 | b2@117@01 | live]
; [else-branch: 969 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 969 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 969 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 970 | b1@116@01 && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 970 | !(b1@116@01 && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 970 | !(b1@116@01 && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] b1 && (!b2 && !b3)
(push) ; 4
; [then-branch: 971 | !(b1@116@01) | live]
; [else-branch: 971 | b1@116@01 | live]
(push) ; 5
; [then-branch: 971 | !(b1@116@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 971 | b1@116@01]
(assert b1@116@01)
; [eval] !b2
(push) ; 6
; [then-branch: 972 | b2@117@01 | live]
; [else-branch: 972 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 972 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 972 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 973 | b1@116@01 && !(b2@117@01) && !(b3@118@01) | dead]
; [else-branch: 973 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 973 | !(b1@116@01 && !(b2@117@01) && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 974 | b1@116@01 | live]
; [else-branch: 974 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 974 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 974 | !(b1@116@01)]
(push) ; 6
; [then-branch: 975 | !(b2@117@01) | live]
; [else-branch: 975 | b2@117@01 | live]
(push) ; 7
; [then-branch: 975 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 975 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 976 | !(b1@116@01) && b2@117@01 && b3@118@01 | dead]
; [else-branch: 976 | !(!(b1@116@01) && b2@117@01 && b3@118@01) | live]
(push) ; 5
; [else-branch: 976 | !(!(b1@116@01) && b2@117@01 && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 3 / 10
; [eval] !b1 && (b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 977 | b1@116@01 | live]
; [else-branch: 977 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 977 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 977 | !(b1@116@01)]
(push) ; 6
; [then-branch: 978 | !(b2@117@01) | live]
; [else-branch: 978 | b2@117@01 | live]
(push) ; 7
; [then-branch: 978 | !(b2@117@01)]
(pop) ; 7
(push) ; 7
; [else-branch: 978 | b2@117@01]
(assert b2@117@01)
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or b2@117@01 (not b2@117@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 979 | !(b1@116@01) && b2@117@01 && !(b3@118@01) | dead]
; [else-branch: 979 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01)) | live]
(push) ; 5
; [else-branch: 979 | !(!(b1@116@01) && b2@117@01 && !(b3@118@01))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3) ==> perm(x.f) == 3 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && b3)
; [eval] !b1
(push) ; 4
; [then-branch: 980 | b1@116@01 | live]
; [else-branch: 980 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 980 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 980 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 981 | b2@117@01 | live]
; [else-branch: 981 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 981 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 981 | !(b2@117@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 982 | !(b1@116@01) && !(b2@117@01) && b3@118@01 | dead]
; [else-branch: 982 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01) | live]
(push) ; 5
; [else-branch: 982 | !(!(b1@116@01) && !(b2@117@01) && b3@118@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3) ==> perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] !b1 && (!b2 && !b3)
; [eval] !b1
(push) ; 4
; [then-branch: 983 | b1@116@01 | live]
; [else-branch: 983 | !(b1@116@01) | live]
(push) ; 5
; [then-branch: 983 | b1@116@01]
(assert b1@116@01)
(pop) ; 5
(push) ; 5
; [else-branch: 983 | !(b1@116@01)]
; [eval] !b2
(push) ; 6
; [then-branch: 984 | b2@117@01 | live]
; [else-branch: 984 | !(b2@117@01) | live]
(push) ; 7
; [then-branch: 984 | b2@117@01]
(assert b2@117@01)
(pop) ; 7
(push) ; 7
; [else-branch: 984 | !(b2@117@01)]
; [eval] !b3
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b2@117@01) b2@117@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 985 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01) | live]
; [else-branch: 985 | !(!(b1@116@01) && !(b2@117@01) && !(b3@118@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 985 | !(b1@116@01) && !(b2@117@01) && !(b3@118@01)]
(assert (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))
; [eval] perm(x.f) == 5 / 10 && perm(x.g) == 5 / 10
; [eval] perm(x.f) == 5 / 10
; [eval] perm(x.f)
(push) ; 6
; [then-branch: 986 | False | live]
; [else-branch: 986 | True | live]
(push) ; 7
; [then-branch: 986 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 986 | True]
; [eval] perm(x.g) == 5 / 10
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and (not b1@116@01) (and (not b2@117@01) (not b3@118@01))))
; [exec]
; assert perm(P(x, b2)) == none
; [eval] perm(P(x, b2)) == none
; [eval] perm(P(x, b2))
(pop) ; 3
(pop) ; 2
(pop) ; 1
