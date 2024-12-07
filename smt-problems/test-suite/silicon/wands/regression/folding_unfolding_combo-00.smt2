(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:35:31
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/folding_unfolding_combo.vpr
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
(declare-fun sum ($Snap $Ref) Int)
(declare-fun sum%limited ($Snap $Ref) Int)
(declare-fun sum%stateless ($Ref) Bool)
(declare-fun sum%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Single%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  (= (sum%limited s@$ p@0@00) (sum s@$ p@0@00))
  :pattern ((sum s@$ p@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  (sum%stateless p@0@00)
  :pattern ((sum%limited s@$ p@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  (=>
    (sum%precondition s@$ p@0@00)
    (= (sum s@$ p@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((sum s@$ p@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  true
  :pattern ((sum s@$ p@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- t01 ----------
(declare-const xs@0@01 $Ref)
(declare-const xs@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@3@01 Int)
; [exec]
; unfold acc(Single(xs), write)
(assert (not (= xs@1@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Single%trigger ($SortWrappers.IntTo$Snap $t@2@01) xs@1@01))
; [exec]
; xs.f := 3
; [exec]
; fold acc(Single(xs), write)
(assert (Single%trigger ($SortWrappers.IntTo$Snap 3) xs@1@01))
; [exec]
; package true --* acc(xs.f, write) && xs.f == 3 {
;   unfold acc(Single(xs), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [exec]
; unfold acc(Single(xs), write)
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
; State saturation: after unfold
(set-option :timeout 40)
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
; [eval] xs.f == 3
; Create MagicWandSnapFunction for wand true --* acc(xs.f, write) && xs.f == 3
(declare-const mwsf@5@01 $MWSF)
(assert (forall (($t@4@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@5@01 $t@4@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) $Snap.unit))
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-4|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@4@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@5@01 $t@4@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) $Snap.unit))
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-5|)))
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
; ---------- t02 ----------
(declare-const xs@6@01 $Ref)
(declare-const xs@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale sum(xs) == 3
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] sum(xs) == 3
; [eval] sum(xs)
(push) ; 3
(assert (sum%precondition ($SortWrappers.IntTo$Snap $t@8@01) xs@7@01))
(pop) ; 3
; Joined path conditions
(assert (sum%precondition ($SortWrappers.IntTo$Snap $t@8@01) xs@7@01))
(assert (= (sum ($SortWrappers.IntTo$Snap $t@8@01) xs@7@01) 3))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* acc(Single(xs), write) && sum(xs) == 3 {
;   unfold acc(Single(xs), write)
;   fold acc(Single(xs), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [exec]
; unfold acc(Single(xs), write)
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
(assert (not (= xs@7@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Single%trigger ($SortWrappers.IntTo$Snap $t@8@01) xs@7@01))
; [exec]
; fold acc(Single(xs), write)
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
; [eval] sum(xs) == 3
; [eval] sum(xs)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
; Create MagicWandSnapFunction for wand true --* acc(Single(xs), write) && sum(xs) == 3
(declare-const mwsf@11@01 $MWSF)
(assert (forall (($t@10@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@11@01 $t@10@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap $t@8@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@11@01 $t@10@01))
  :qid |quant-u-6|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@10@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@11@01 $t@10@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap $t@8@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@11@01 $t@10@01))
  :qid |quant-u-7|)))
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
; ---------- t03 ----------
(declare-const x@12@01 $Ref)
(declare-const x@13@01 $Ref)
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
; inhale acc(Single(x), write)
(declare-const $t@14@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.g, write)
(declare-const $t@15@01 Int)
(assert (not (= x@13@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; package true --* acc(Single(x), write) && acc(x.g, write) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
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
; Create MagicWandSnapFunction for wand true --* acc(Single(x), write) && acc(x.g, write)
(declare-const mwsf@17@01 $MWSF)
(assert (forall (($t@16@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@17@01 $t@16@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@14@01)
      ($SortWrappers.IntTo$Snap $t@15@01)))
  :pattern ((MWSF_apply mwsf@17@01 $t@16@01))
  :qid |quant-u-8|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@16@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@17@01 $t@16@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@14@01)
      ($SortWrappers.IntTo$Snap $t@15@01)))
  :pattern ((MWSF_apply mwsf@17@01 $t@16@01))
  :qid |quant-u-9|)))
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
