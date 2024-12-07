(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/PackageStateConsolidation.vpr
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
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const z@2@01 $Ref)
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(declare-const z@5@01 $Ref)
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
; inhale acc(x.f, 1 / 2)
(declare-const $t@6@01 Int)
(assert (not (= x@3@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(y.f, 1 / 2)
(declare-const $t@7@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@4@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(z.f, write)
(declare-const $t@8@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@4@01 z@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@3@01 z@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@5@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x == y
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] x == y
(assert (= x@3@01 y@4@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; package true --* true {
;   assert z != x
;   exhale acc(x.f, write)
;   inhale acc(x.f, 1 / 2)
;   inhale acc(y.f, 1 / 2)
;   package true --* true {
;     exhale acc(y.f, write)
;   }
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [exec]
; assert z != x
; [eval] z != x
(push) ; 4
(assert (not (not (= z@5@01 x@3@01))))
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
; [eval] z != x
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= z@5@01 x@3@01))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= z@5@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@4@01 x@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= $t@7@01 $t@6@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@4@01 z@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@8@01 $t@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@7@01 $t@8@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= z@5@01 y@4@01)) (not (= y@4@01 z@5@01))))
; [eval] z != x
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= z@5@01 x@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@5@01 x@3@01)))
; [exec]
; exhale acc(x.f, write)
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
(assert (not (= z@5@01 x@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@4@01 x@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [exec]
; inhale acc(x.f, 1 / 2)
(declare-const $t@11@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(y.f, 1 / 2)
(declare-const $t@12@01 Int)
; State saturation: after inhale
(check-sat)
; unknown
(assert (= $t@11@01 $t@12@01))
; [exec]
; package true --* true {
;   exhale acc(y.f, write)
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [exec]
; exhale acc(y.f, write)
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
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@14@01 $MWSF)
(assert (forall (($t@13@01 $Snap)) (!
  (= (MWSF_apply mwsf@14@01 $t@13@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-0|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@13@01 $Snap)) (!
  (= (MWSF_apply mwsf@14@01 $t@13@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-1|)))
(assert true)
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@15@01 $MWSF)
(assert (forall (($t@10@01 $Snap)) (!
  (= (MWSF_apply mwsf@15@01 $t@10@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@15@01 $t@10@01))
  :qid |quant-u-2|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (forall (($t@10@01 $Snap)) (!
  (= (MWSF_apply mwsf@15@01 $t@10@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@15@01 $t@10@01))
  :qid |quant-u-3|)))
(assert true)
(assert (forall (($t@13@01 $Snap)) (!
  (= (MWSF_apply mwsf@14@01 $t@13@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-0|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@16@01 $Ref)
(declare-const z@17@01 $Ref)
(declare-const x@18@01 $Ref)
(declare-const z@19@01 $Ref)
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
; inhale acc(x.f, 1 / 2)
(declare-const $t@20@01 Int)
(assert (not (= x@18@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != z ==> acc(x.f, 1 / 2)
; [eval] x != z
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@18@01 z@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@18@01 z@19@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@18@01 != z@19@01 | live]
; [else-branch: 0 | x@18@01 == z@19@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@18@01 != z@19@01]
(assert (not (= x@18@01 z@19@01)))
(declare-const $t@21@01 Int)
(assert (= $t@20@01 $t@21@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* true {
;   inhale acc(z.f, write)
;   exhale acc(x.f, write)
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
; [exec]
; inhale acc(z.f, write)
(declare-const $t@23@01 Int)
(assert (not (= z@19@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(x.f, write)
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
(push) ; 5
(set-option :timeout 10)
(assert (not (= z@19@01 x@18@01)))
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
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@24@01 $MWSF)
(assert (forall (($t@22@01 $Snap)) (!
  (= (MWSF_apply mwsf@24@01 $t@22@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@24@01 $t@22@01))
  :qid |quant-u-4|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@22@01 $Snap)) (!
  (= (MWSF_apply mwsf@24@01 $t@22@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@24@01 $t@22@01))
  :qid |quant-u-5|)))
(assert true)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | x@18@01 == z@19@01]
(assert (= x@18@01 z@19@01))
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* true {
;   inhale acc(z.f, write)
;   exhale acc(x.f, write)
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [exec]
; inhale acc(z.f, write)
(declare-const $t@27@01 Int)
(assert (not (= z@19@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(x.f, write)
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
(push) ; 5
(set-option :timeout 10)
(assert (not (= z@19@01 x@18@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@28@01 $MWSF)
(assert (forall (($t@26@01 $Snap)) (!
  (= (MWSF_apply mwsf@28@01 $t@26@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@28@01 $t@26@01))
  :qid |quant-u-6|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@26@01 $Snap)) (!
  (= (MWSF_apply mwsf@28@01 $t@26@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@28@01 $t@26@01))
  :qid |quant-u-7|)))
(assert true)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@29@01 $Ref)
(declare-const x@30@01 $Ref)
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
; inhale acc(x.f, 1 / 3)
(declare-const $t@31@01 Int)
(assert (not (= x@30@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* true {
;   inhale acc(x.f, 1 / 3)
;   package true --* true {
;     inhale acc(x.f, 1 / 3)
;     exhale acc(x.f, write)
;   }
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; [exec]
; inhale acc(x.f, 1 / 3)
(declare-const $t@33@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* true {
;   inhale acc(x.f, 1 / 3)
;   exhale acc(x.f, write)
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [exec]
; inhale acc(x.f, 1 / 3)
(declare-const $t@35@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(x.f, write)
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
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= $t@35@01 $t@33@01))
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (= $t@35@01 $t@31@01))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@36@01 $MWSF)
(assert (forall (($t@34@01 $Snap)) (!
  (= (MWSF_apply mwsf@36@01 $t@34@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@36@01 $t@34@01))
  :qid |quant-u-8|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@34@01 $Snap)) (!
  (= (MWSF_apply mwsf@36@01 $t@34@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@36@01 $t@34@01))
  :qid |quant-u-9|)))
(assert (and (= $t@35@01 $t@33@01) (= $t@35@01 $t@31@01)))
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@37@01 $MWSF)
(assert (forall (($t@32@01 $Snap)) (!
  (= (MWSF_apply mwsf@37@01 $t@32@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@37@01 $t@32@01))
  :qid |quant-u-10|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (forall (($t@32@01 $Snap)) (!
  (= (MWSF_apply mwsf@37@01 $t@32@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@37@01 $t@32@01))
  :qid |quant-u-11|)))
(assert (and (= $t@35@01 $t@33@01) (= $t@35@01 $t@31@01)))
(assert (forall (($t@34@01 $Snap)) (!
  (= (MWSF_apply mwsf@36@01 $t@34@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@36@01 $t@34@01))
  :qid |quant-u-8|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@38@01 $Ref)
(declare-const y@39@01 $Ref)
(declare-const x@40@01 $Ref)
(declare-const y@41@01 $Ref)
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
; package true --* true {
;   inhale acc(x.f, write)
;   inhale acc(y.f, write)
;   assert x != y
; }
(push) ; 3
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [exec]
; inhale acc(x.f, write)
(declare-const $t@43@01 Int)
(assert (not (= x@40@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(y.f, write)
(declare-const $t@44@01 Int)
(assert (not (= y@41@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@40@01 y@41@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert x != y
; [eval] x != y
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= x@40@01 y@41@01))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@41@01 x@40@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@43@01 $t@44@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@44@01 $t@43@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@40@01 y@41@01)) (not (= y@41@01 x@40@01))))
; [eval] x != y
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@45@01 $MWSF)
(assert (forall (($t@42@01 $Snap)) (!
  (= (MWSF_apply mwsf@45@01 $t@42@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@45@01 $t@42@01))
  :qid |quant-u-12|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@42@01 $Snap)) (!
  (= (MWSF_apply mwsf@45@01 $t@42@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@45@01 $t@42@01))
  :qid |quant-u-13|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@46@01 $Ref)
(declare-const y@47@01 $Ref)
(declare-const x@48@01 $Ref)
(declare-const y@49@01 $Ref)
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
; package true --* true {
;   inhale acc(x.f, 1 / 2)
;   inhale acc(y.f, 1 / 2)
;   inhale x.f == 4
;   inhale y.f == 5
;   assert x != y
; }
(push) ; 3
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 $Snap.unit))
; [exec]
; inhale acc(x.f, 1 / 2)
(declare-const $t@51@01 Int)
(assert (not (= x@48@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(y.f, 1 / 2)
(declare-const $t@52@01 Int)
(assert (not (= y@49@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@48@01 y@49@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhale x.f == 4
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 $Snap.unit))
; [eval] x.f == 4
(assert (= $t@51@01 4))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale y.f == 5
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 $Snap.unit))
; [eval] y.f == 5
(assert (= $t@52@01 5))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert x != y
; [eval] x != y
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= x@48@01 y@49@01))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@49@01 x@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@51@01 $t@52@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@52@01 $t@51@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@48@01 y@49@01)) (not (= y@49@01 x@48@01))))
; [eval] x != y
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@55@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (= (MWSF_apply mwsf@55@01 $t@50@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@55@01 $t@50@01))
  :qid |quant-u-14|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@50@01 $Snap)) (!
  (= (MWSF_apply mwsf@55@01 $t@50@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@55@01 $t@50@01))
  :qid |quant-u-15|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
