(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:36:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/package.vpr
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
; ---------- test06 ----------
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
; package acc(x.f, write) --* acc(x.f, write) {
; }
(push) ; 3
(declare-const $t@2@01 $Snap)
(assert (not (= x@1@01 $Ref.null)))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write)
(declare-const mwsf@3@01 $MWSF)
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@3@01 $t@2@01) $t@2@01)
  :pattern ((MWSF_apply mwsf@3@01 $t@2@01))
  :qid |quant-u-0|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@3@01 $t@2@01) $t@2@01)
  :pattern ((MWSF_apply mwsf@3@01 $t@2@01))
  :qid |quant-u-1|)))
(assert true)
; [exec]
; package acc(x.f, write) --* acc(x.f, 1 / 2) {
; }
(push) ; 4
(declare-const $t@4@01 $Snap)
(assert (not (= x@1@01 $Ref.null)))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, 1 / 2)
(declare-const mwsf@5@01 $MWSF)
(assert (forall (($t@4@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@4@01) $t@4@01)
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-2|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@4@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@4@01) $t@4@01)
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-3|)))
(assert true)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const x@6@01 $Ref)
(declare-const x@7@01 $Ref)
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
; package acc(x.f, 1 / 2) --* acc(x.f, write) {
; }
(push) ; 3
(declare-const $t@8@01 $Snap)
(assert (not (= x@7@01 $Ref.null)))
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
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
(pop) ; 3
(declare-const $t@9@01 $Snap)
(declare-const $t@10@01 $Snap)
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) --* acc(x.f, write)
(declare-const mwsf@11@01 $MWSF)
(assert (forall (($t@9@01 $Snap)) (!
  (= (MWSF_apply mwsf@11@01 $t@9@01) $t@10@01)
  :pattern ((MWSF_apply mwsf@11@01 $t@9@01))
  :qid |quant-u-4|)))
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const x@12@01 $Ref)
(declare-const x@13@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@14@01 Int)
(assert (not (= x@13@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.f := 0
; [exec]
; package acc(x.f, 1 / 2) --* acc(x.f, 1 / 2) && x.f == 0 {
; }
(push) ; 3
(declare-const $t@15@01 $Snap)
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
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (= ($SortWrappers.$SnapToInt $t@15@01) 0)))
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
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (= ($SortWrappers.$SnapToInt $t@15@01) 0)))
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
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (= ($SortWrappers.$SnapToInt $t@15@01) 0)))
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
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (= ($SortWrappers.$SnapToInt $t@15@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@16@01 $Snap)
(declare-const $t@17@01 $Snap)
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) --* acc(x.f, 1 / 2) && x.f == 0
(declare-const mwsf@18@01 $MWSF)
(assert (forall (($t@16@01 $Snap)) (!
  (= (MWSF_apply mwsf@18@01 $t@16@01) $t@17@01)
  :pattern ((MWSF_apply mwsf@18@01 $t@16@01))
  :qid |quant-u-6|)))
(pop) ; 2
(pop) ; 1
; ---------- test09 ----------
(declare-const x@19@01 $Ref)
(declare-const x@20@01 $Ref)
(push) ; 1
(declare-const $t@21@01 Int)
(assert (not (= x@20@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.f := 0
; [exec]
; package acc(x.f, 1 / 2) --* acc(x.f, write) && x.f == 0 {
; }
(push) ; 3
(declare-const $t@22@01 $Snap)
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
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
(assert (= ($SortWrappers.$SnapToInt $t@22@01) 0))
(check-sat)
; unknown
; [eval] x.f == 0
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) --* acc(x.f, write) && x.f == 0
(declare-const mwsf@23@01 $MWSF)
(assert (forall (($t@22@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@23@01 $t@22@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit))
  :pattern ((MWSF_apply mwsf@23@01 $t@22@01))
  :qid |quant-u-8|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@22@01 $Snap)) (!
  (and
    (= ($SortWrappers.$SnapToInt $t@22@01) 0)
    (=
      (MWSF_apply mwsf@23@01 $t@22@01)
      ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit)))
  :pattern ((MWSF_apply mwsf@23@01 $t@22@01))
  :qid |quant-u-9|)))
; [exec]
; assert acc(x.f, 1 / 2)
; [exec]
; assert acc(x.f, 2 / 3)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test08 ----------
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
(pop) ; 2
(push) ; 2
; [exec]
; x.f := 0
; [exec]
; package true --* acc(x.f, 1 / 3) && x.f == 0 {
; }
(push) ; 3
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
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
; [eval] x.f == 0
; Create MagicWandSnapFunction for wand true --* acc(x.f, 1 / 3) && x.f == 0
(declare-const mwsf@28@01 $MWSF)
(assert (forall (($t@27@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@28@01 $t@27@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit))
  :pattern ((MWSF_apply mwsf@28@01 $t@27@01))
  :qid |quant-u-10|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@27@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@28@01 $t@27@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit))
  :pattern ((MWSF_apply mwsf@28@01 $t@27@01))
  :qid |quant-u-11|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@29@01 $Ref)
(declare-const x@30@01 $Ref)
(push) ; 1
(declare-const $t@31@01 Int)
(assert (not (= x@30@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.f := 1
; [exec]
; package acc(x.f, 1 / 2) --* acc(x.f, write) && x.f == 0 {
; }
(push) ; 3
(declare-const $t@32@01 $Snap)
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
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
(assert (= ($SortWrappers.$SnapToInt $t@32@01) 1))
(check-sat)
; unknown
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (= ($SortWrappers.$SnapToInt $t@32@01) 0)))
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
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (= ($SortWrappers.$SnapToInt $t@32@01) 0)))
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
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (= ($SortWrappers.$SnapToInt $t@32@01) 0)))
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
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (= ($SortWrappers.$SnapToInt $t@32@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@33@01 $Snap)
(declare-const $t@34@01 $Snap)
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) --* acc(x.f, write) && x.f == 0
(declare-const mwsf@35@01 $MWSF)
(assert (forall (($t@33@01 $Snap)) (!
  (= (MWSF_apply mwsf@35@01 $t@33@01) $t@34@01)
  :pattern ((MWSF_apply mwsf@35@01 $t@33@01))
  :qid |quant-u-12|)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@36@01 $Ref)
(declare-const x@37@01 $Ref)
(push) ; 1
(declare-const $t@38@01 Int)
(assert (not (= x@37@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.f := 1
; [exec]
; package acc(x.f, 1 / 2) && x.f == 0 --* acc(x.f, 1 / 2) && x.f == 0 {
; }
(push) ; 3
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
(assert (= ($Snap.second $t@39@01) $Snap.unit))
; [eval] x.f == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@39@01)) 0))
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
; [eval] x.f == 0
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) && x.f == 0 --* acc(x.f, 1 / 2) && x.f == 0
(declare-const mwsf@40@01 $MWSF)
(assert (forall (($t@39@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@40@01 $t@39@01)
    ($Snap.combine ($Snap.first $t@39@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@40@01 $t@39@01))
  :qid |quant-u-14|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@39@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@40@01 $t@39@01)
    ($Snap.combine ($Snap.first $t@39@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@40@01 $t@39@01))
  :qid |quant-u-15|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@41@01 $Ref)
(declare-const x@42@01 $Ref)
(push) ; 1
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 ($Snap.combine ($Snap.first $t@43@01) ($Snap.second $t@43@01))))
(assert (not (= x@42@01 $Ref.null)))
(assert (= ($Snap.second $t@43@01) $Snap.unit))
; [eval] x.f == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@43@01)) 1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, 1 / 2) && x.f == 0 --* false {
; }
(push) ; 3
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (= ($Snap.second $t@44@01) $Snap.unit))
; [eval] x.f == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@44@01)) 0))
(push) ; 4
(assert (not false))
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
(assert (not false))
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
(assert (not false))
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@45@01 $Snap)
(declare-const $t@46@01 $Snap)
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) && x.f == 0 --* false
(declare-const mwsf@47@01 $MWSF)
(assert (forall (($t@45@01 $Snap)) (!
  (= (MWSF_apply mwsf@47@01 $t@45@01) $t@46@01)
  :pattern ((MWSF_apply mwsf@47@01 $t@45@01))
  :qid |quant-u-16|)))
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
(declare-const x@48@01 $Ref)
(declare-const x@49@01 $Ref)
(push) ; 1
(declare-const $t@50@01 Int)
(assert (not (= x@49@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.f := 1
; [exec]
; package true --* acc(x.f, write) && x.f == 1 {
; }
(push) ; 3
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 $Snap.unit))
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
; [eval] x.f == 1
; Create MagicWandSnapFunction for wand true --* acc(x.f, write) && x.f == 1
(declare-const mwsf@52@01 $MWSF)
(assert (forall (($t@51@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@52@01 $t@51@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit))
  :pattern ((MWSF_apply mwsf@52@01 $t@51@01))
  :qid |quant-u-18|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@51@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@52@01 $t@51@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit))
  :pattern ((MWSF_apply mwsf@52@01 $t@51@01))
  :qid |quant-u-19|)))
(assert true)
; [exec]
; package acc(x.g, write) && x.g == 1 --* acc(x.g, write) && x.g == 1 {
; }
(push) ; 4
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 ($Snap.combine ($Snap.first $t@53@01) ($Snap.second $t@53@01))))
(assert (= ($Snap.second $t@53@01) $Snap.unit))
; [eval] x.g == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@53@01)) 1))
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
; [eval] x.g == 1
; Create MagicWandSnapFunction for wand acc(x.g, write) && x.g == 1 --* acc(x.g, write) && x.g == 1
(declare-const mwsf@54@01 $MWSF)
(assert (forall (($t@53@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@54@01 $t@53@01)
    ($Snap.combine ($Snap.first $t@53@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@54@01 $t@53@01))
  :qid |quant-u-20|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@53@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@54@01 $t@53@01)
    ($Snap.combine ($Snap.first $t@53@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@54@01 $t@53@01))
  :qid |quant-u-21|)))
(assert true)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test11 ----------
(declare-const x@55@01 $Ref)
(declare-const x@56@01 $Ref)
(push) ; 1
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 ($Snap.combine ($Snap.first $t@57@01) ($Snap.second $t@57@01))))
(assert (not (= x@56@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.f := 1
; [exec]
; package acc(x.g, write) && x.g == 1 --*
; acc(x.g, write) && (x.g == 1 && (acc(x.f, write) && x.f == 1)) {
; }
(push) ; 3
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(assert (= ($Snap.second $t@58@01) $Snap.unit))
; [eval] x.g == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1))
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
; [eval] x.g == 1
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
(check-sat)
; unknown
; [eval] x.f == 1
; Create MagicWandSnapFunction for wand acc(x.g, write) && x.g == 1 --* acc(x.g, write) && (x.g == 1 && (acc(x.f, write) && x.f == 1))
(declare-const mwsf@59@01 $MWSF)
(assert (forall (($t@58@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@59@01 $t@58@01)
    ($Snap.combine
      ($Snap.first $t@58@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit))))
  :pattern ((MWSF_apply mwsf@59@01 $t@58@01))
  :qid |quant-u-22|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@58@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@59@01 $t@58@01)
    ($Snap.combine
      ($Snap.first $t@58@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit))))
  :pattern ((MWSF_apply mwsf@59@01 $t@58@01))
  :qid |quant-u-23|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test12 ----------
(declare-const x@60@01 $Ref)
(declare-const x@61@01 $Ref)
(push) ; 1
(declare-const $t@62@01 Int)
(assert (not (= x@61@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package false --* false {
; }
(push) ; 3
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 $Snap.unit))
(assert false)
; Create MagicWandSnapFunction for wand false --* false
(declare-const mwsf@64@01 $MWSF)
(assert (forall (($t@63@01 $Snap)) (!
  (= (MWSF_apply mwsf@64@01 $t@63@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@64@01 $t@63@01))
  :qid |quant-u-24|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@63@01 $Snap)) (!
  (= (MWSF_apply mwsf@64@01 $t@63@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@64@01 $t@63@01))
  :qid |quant-u-25|)))
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
; ---------- test13 ----------
(declare-const x@65@01 $Ref)
(declare-const x@66@01 $Ref)
(push) ; 1
(declare-const $t@67@01 Int)
(assert (not (= x@66@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* false {
;   package acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false) {
;   }
; }
(push) ; 3
(declare-const $t@68@01 $Snap)
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false) {
; }
(push) ; 4
(declare-const $t@69@01 $Snap)
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
(check-sat)
; unknown
(check-sat)
; unknown
(assert (= ($SortWrappers.$SnapToInt $t@69@01) ($SortWrappers.$SnapToInt $t@68@01)))
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
(declare-const mwsf@70@01 $MWSF)
(assert (forall (($t@69@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@70@01 $t@69@01)
    ($Snap.combine $t@69@01 ($Snap.combine $t@68@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@70@01 $t@69@01))
  :qid |quant-u-26|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@69@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@70@01 $t@69@01)
    ($Snap.combine $t@69@01 ($Snap.combine $t@68@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@70@01 $t@69@01))
  :qid |quant-u-27|)))
(assert true)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
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
(pop) ; 4
(pop) ; 3
(declare-const $t@71@01 $Snap)
(declare-const $t@72@01 $Snap)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* false
(declare-const mwsf@73@01 $MWSF)
(assert (forall (($t@71@01 $Snap)) (!
  (= (MWSF_apply mwsf@73@01 $t@71@01) $t@72@01)
  :pattern ((MWSF_apply mwsf@73@01 $t@71@01))
  :qid |quant-u-28|)))
(pop) ; 2
(pop) ; 1
; ---------- test14 ----------
(declare-const x@74@01 $Ref)
(declare-const x@75@01 $Ref)
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
; package acc(x.f, write) && acc(x.f, write) --* false {
; }
(push) ; 3
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (not (= x@75@01 $Ref.null)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@76@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@76@01))))
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, write) && acc(x.f, write) --* false
(declare-const mwsf@77@01 $MWSF)
(assert (forall (($t@76@01 $Snap)) (!
  (= (MWSF_apply mwsf@77@01 $t@76@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@77@01 $t@76@01))
  :qid |quant-u-30|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@76@01 $Snap)) (!
  (= (MWSF_apply mwsf@77@01 $t@76@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@77@01 $t@76@01))
  :qid |quant-u-31|)))
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
; ---------- test15 ----------
(declare-const x@78@01 $Ref)
(declare-const x@79@01 $Ref)
(push) ; 1
(declare-const $t@80@01 Int)
(assert (not (= x@79@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* true {
;   package acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false) {
;   }
; }
(push) ; 3
(declare-const $t@81@01 $Snap)
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false) {
; }
(push) ; 4
(declare-const $t@82@01 $Snap)
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
(check-sat)
; unknown
(check-sat)
; unknown
(assert (= ($SortWrappers.$SnapToInt $t@82@01) ($SortWrappers.$SnapToInt $t@81@01)))
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
(declare-const mwsf@83@01 $MWSF)
(assert (forall (($t@82@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@83@01 $t@82@01)
    ($Snap.combine $t@82@01 ($Snap.combine $t@81@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@83@01 $t@82@01))
  :qid |quant-u-32|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@82@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@83@01 $t@82@01)
    ($Snap.combine $t@82@01 ($Snap.combine $t@81@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@83@01 $t@82@01))
  :qid |quant-u-33|)))
(assert true)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* true
(declare-const mwsf@84@01 $MWSF)
(assert (forall (($t@81@01 $Snap)) (!
  (= (MWSF_apply mwsf@84@01 $t@81@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@84@01 $t@81@01))
  :qid |quant-u-34|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (forall (($t@81@01 $Snap)) (!
  (and
    (forall (($t@82@01 $Snap)) (!
      (=
        (MWSF_apply mwsf@83@01 $t@82@01)
        ($Snap.combine $t@82@01 ($Snap.combine $t@81@01 $Snap.unit)))
      :pattern ((MWSF_apply mwsf@83@01 $t@82@01))
      :qid |quant-u-32|))
    (= (MWSF_apply mwsf@84@01 $t@81@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@84@01 $t@81@01))
  :qid |quant-u-35|)))
(assert true)
; [exec]
; assert acc(x.f, write) --* true
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
; ---------- test16 ----------
(declare-const x@85@01 $Ref)
(declare-const x@86@01 $Ref)
(push) ; 1
(declare-const $t@87@01 Int)
(assert (not (= x@86@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* false {
;   package acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false) {
;   }
;   apply acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
; }
(push) ; 3
(declare-const $t@88@01 $Snap)
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false) {
; }
(push) ; 4
(declare-const $t@89@01 $Snap)
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
(check-sat)
; unknown
(check-sat)
; unknown
(assert (= ($SortWrappers.$SnapToInt $t@89@01) ($SortWrappers.$SnapToInt $t@88@01)))
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
(declare-const mwsf@90@01 $MWSF)
(assert (forall (($t@89@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@90@01 $t@89@01)
    ($Snap.combine $t@89@01 ($Snap.combine $t@88@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@90@01 $t@89@01))
  :qid |quant-u-36|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@89@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@90@01 $t@89@01)
    ($Snap.combine $t@89@01 ($Snap.combine $t@88@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@90@01 $t@89@01))
  :qid |quant-u-37|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
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
(check-sat)
; unknown
(assert (=
  (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01)))
    ($Snap.second (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01))))
    ($Snap.second ($Snap.second (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01)))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01)))))))
(assert false)
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply mwsf@90@01 ($SortWrappers.IntTo$Snap $t@87@01))))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unsat
; Create MagicWandSnapFunction for wand acc(x.f, write) --* false
(declare-const mwsf@91@01 $MWSF)
(assert (forall (($t@88@01 $Snap)) (!
  (= (MWSF_apply mwsf@91@01 $t@88@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@91@01 $t@88@01))
  :qid |quant-u-38|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@88@01 $Snap)) (!
  (and
    (forall (($t@89@01 $Snap)) (!
      (=
        (MWSF_apply mwsf@90@01 $t@89@01)
        ($Snap.combine $t@89@01 ($Snap.combine $t@88@01 $Snap.unit)))
      :pattern ((MWSF_apply mwsf@90@01 $t@89@01))
      :qid |quant-u-36|))
    (= (MWSF_apply mwsf@91@01 $t@88@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@91@01 $t@88@01))
  :qid |quant-u-39|)))
(assert true)
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
; ---------- test17 ----------
(declare-const x@92@01 $Ref)
(declare-const x@93@01 $Ref)
(push) ; 1
(declare-const $t@94@01 Int)
(assert (not (= x@93@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* false {
;   package acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false) {
;   }
;   apply acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
; }
(push) ; 3
(declare-const $t@95@01 $Snap)
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false) {
; }
(push) ; 4
(declare-const $t@96@01 $Snap)
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
(check-sat)
; unknown
(check-sat)
; unknown
(assert (= ($SortWrappers.$SnapToInt $t@96@01) ($SortWrappers.$SnapToInt $t@95@01)))
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
(declare-const mwsf@97@01 $MWSF)
(assert (forall (($t@96@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@97@01 $t@96@01)
    ($Snap.combine $t@96@01 ($Snap.combine $t@95@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@97@01 $t@96@01))
  :qid |quant-u-40|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@96@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@97@01 $t@96@01)
    ($Snap.combine $t@96@01 ($Snap.combine $t@95@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@97@01 $t@96@01))
  :qid |quant-u-41|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
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
(check-sat)
; unknown
(assert (=
  (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01)))
    ($Snap.second (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01))))
    ($Snap.second ($Snap.second (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01)))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01)))))))
(assert false)
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply mwsf@97@01 ($SortWrappers.IntTo$Snap $t@94@01))))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unsat
; Create MagicWandSnapFunction for wand acc(x.f, write) --* false
(declare-const mwsf@98@01 $MWSF)
(assert (forall (($t@95@01 $Snap)) (!
  (= (MWSF_apply mwsf@98@01 $t@95@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@98@01 $t@95@01))
  :qid |quant-u-42|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@95@01 $Snap)) (!
  (and
    (forall (($t@96@01 $Snap)) (!
      (=
        (MWSF_apply mwsf@97@01 $t@96@01)
        ($Snap.combine $t@96@01 ($Snap.combine $t@95@01 $Snap.unit)))
      :pattern ((MWSF_apply mwsf@97@01 $t@96@01))
      :qid |quant-u-40|))
    (= (MWSF_apply mwsf@98@01 $t@95@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@98@01 $t@95@01))
  :qid |quant-u-43|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
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
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
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
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
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
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
