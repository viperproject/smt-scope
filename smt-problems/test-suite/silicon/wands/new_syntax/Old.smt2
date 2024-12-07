(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:05
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/new_syntax/Old.vpr
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
; ---------- test0 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
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
; var a: Int
(declare-const a@3@01 Int)
; [exec]
; var y: Ref
(declare-const y@4@01 $Ref)
; [exec]
; a := x.f
; [exec]
; y := new(f)
(declare-const y@5@01 $Ref)
(assert (not (= y@5@01 $Ref.null)))
(declare-const f@6@01 Int)
(assert (not (= y@5@01 x@1@01)))
(assert (not (= y@5@01 y@4@01)))
; [exec]
; package acc(x.f, write) && (acc(y.f, write) && (x.f == 3 && y.f == 5)) --*
; acc(x.f, write) && x.f == old[lhs](x.f) {
;   exhale acc(x.f, write)
;   inhale acc(x.f, write) && x.f == 5
;   label first
;   exhale acc(x.f, write)
;   inhale acc(x.f, write) && x.f == y.f
;   package acc(x.f, write) && x.f == 4 --* old[lhs](x.f) == 4 {
;   }
;   assert old[lhs](x.f) == 3
;   assert x.f == old[first](x.f)
;   exhale acc(x.f, write)
;   inhale acc(x.f, write) && x.f == a
;   assert x.f == old(x.f)
;   exhale acc(x.f, write)
;   inhale acc(x.f, write) && x.f == old[lhs](x.f)
;   assert old[first](x.f) == 5
; }
(push) ; 3
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@1@01 y@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@7@01))) $Snap.unit))
; [eval] x.f == 3
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 3))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@7@01))) $Snap.unit))
; [eval] y.f == 5
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@7@01))) 5))
; [exec]
; exhale acc(x.f, write)
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
; [exec]
; inhale acc(x.f, write) && x.f == 5
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.second $t@8@01) $Snap.unit))
; [eval] x.f == 5
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@8@01)) 5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label first
; [exec]
; exhale acc(x.f, write)
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
; [exec]
; inhale acc(x.f, write) && x.f == y.f
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] x.f == y.f
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@7@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package acc(x.f, write) && x.f == 4 --* old[lhs](x.f) == 4 {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] x.f == 4
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)) 4))
; [eval] old[lhs](x.f) == 4
; [eval] old[lhs](x.f)
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f == 4 --* old[lhs](x.f) == 4
(declare-const mwsf@11@01 $MWSF)
(assert (forall (($t@10@01 $Snap)) (!
  (= (MWSF_apply mwsf@11@01 $t@10@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@11@01 $t@10@01))
  :qid |quant-u-0|)))
(pop) ; 4
(push) ; 4
(assert (forall (($t@10@01 $Snap)) (!
  (= (MWSF_apply mwsf@11@01 $t@10@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@11@01 $t@10@01))
  :qid |quant-u-1|)))
; [exec]
; assert old[lhs](x.f) == 3
; [eval] old[lhs](x.f) == 3
; [eval] old[lhs](x.f)
; [exec]
; assert x.f == old[first](x.f)
; [eval] x.f == old[first](x.f)
; [eval] old[first](x.f)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@8@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@8@01))))
; [exec]
; exhale acc(x.f, write)
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
; [exec]
; inhale acc(x.f, write) && x.f == a
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.second $t@12@01) $Snap.unit))
; [eval] x.f == a
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@12@01)) $t@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x.f == old(x.f)
; [eval] x.f == old(x.f)
; [eval] old(x.f)
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
(check-sat)
; unknown
; [exec]
; inhale acc(x.f, write) && x.f == old[lhs](x.f)
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@13@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@7@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert old[first](x.f) == 5
; [eval] old[first](x.f) == 5
; [eval] old[first](x.f)
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
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
; Create MagicWandSnapFunction for wand acc(x.f, write) && (acc(y.f, write) && (x.f == 3 && y.f == 5)) --* acc(x.f, write) && x.f == old[lhs](x.f)
(declare-const mwsf@14@01 $MWSF)
(assert (forall (($t@7@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@7@01)
    ($Snap.combine ($Snap.first $t@13@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@14@01 $t@7@01))
  :qid |quant-u-2|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@7@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@7@01)
    ($Snap.combine ($Snap.first $t@13@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@14@01 $t@7@01))
  :qid |quant-u-3|)))
(assert true)
(assert (forall (($t@10@01 $Snap)) (!
  (= (MWSF_apply mwsf@11@01 $t@10@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@11@01 $t@10@01))
  :qid |quant-u-0|)))
; [exec]
; x.f := 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@5@01 x@1@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; y.f := 5
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@1@01 y@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; apply acc(x.f, write) && (acc(y.f, write) && (x.f == 3 && y.f == 5)) --*
;   acc(x.f, write) && x.f == old[lhs](x.f)
; [eval] x.f == 3
; [eval] y.f == 5
(assert (=
  (MWSF_apply mwsf@14@01 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 5)
      ($Snap.combine $Snap.unit $Snap.unit))))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
      ($SortWrappers.IntTo$Snap 3)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 5)
        ($Snap.combine $Snap.unit $Snap.unit)))))
    ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
      ($SortWrappers.IntTo$Snap 3)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 5)
        ($Snap.combine $Snap.unit $Snap.unit))))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 5)
      ($Snap.combine $Snap.unit $Snap.unit)))))
  $Snap.unit))
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 5)
      ($Snap.combine $Snap.unit $Snap.unit))))))
  3))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [exec]
; assert old[first](x.f) == 5
; [eval] old[first](x.f) == 5
; [eval] old[first](x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] old[first](x.f) == 5
; [eval] old[first](x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] old[first](x.f) == 5
; [eval] old[first](x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] old[first](x.f) == 5
; [eval] old[first](x.f)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const x@15@01 $Ref)
(declare-const x@16@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@17@01 $MWSF)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@18@01 $MWSF)
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(x.f, write)
(declare-const $t@19@01 Int)
(assert (not (= x@16@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f)
(assert (=
  (MWSF_apply $t@17@01 ($SortWrappers.IntTo$Snap $t@19@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply $t@17@01 ($SortWrappers.IntTo$Snap $t@19@01)))
    ($Snap.second (MWSF_apply $t@17@01 ($SortWrappers.IntTo$Snap $t@19@01))))))
(assert (=
  ($Snap.second (MWSF_apply $t@17@01 ($SortWrappers.IntTo$Snap $t@19@01)))
  $Snap.unit))
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply $t@17@01 ($SortWrappers.IntTo$Snap $t@19@01))))
  $t@19@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@20@01 $Snap)
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
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f)
(declare-const mwsf@21@01 $MWSF)
(assert (forall (($t@20@01 $Snap)) (!
  (= (MWSF_apply mwsf@21@01 $t@20@01) ($Snap.combine $t@20@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@21@01 $t@20@01))
  :qid |quant-u-4|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@20@01 $Snap)) (!
  (= (MWSF_apply mwsf@21@01 $t@20@01) ($Snap.combine $t@20@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@21@01 $t@20@01))
  :qid |quant-u-5|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@22@01 $Ref)
(declare-const x@23@01 $Ref)
(push) ; 1
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (not (= x@23@01 $Ref.null)))
(assert (= ($Snap.second $t@24@01) $Snap.unit))
; [eval] x.f == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@24@01)) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* acc(x.f, write) && old[lhs](x.f) == 0 {
;   assert old[lhs](x.f) == 0
; }
(push) ; 3
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [exec]
; assert old[lhs](x.f) == 0
; [eval] old[lhs](x.f) == 0
; [eval] old[lhs](x.f)
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] old[lhs](x.f) == 0
; [eval] old[lhs](x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] old[lhs](x.f) == 0
; [eval] old[lhs](x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] old[lhs](x.f) == 0
; [eval] old[lhs](x.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
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
(declare-const $t@26@01 $Snap)
(declare-const $t@27@01 $Snap)
; Create MagicWandSnapFunction for wand true --* acc(x.f, write) && old[lhs](x.f) == 0
(declare-const mwsf@28@01 $MWSF)
(assert (forall (($t@26@01 $Snap)) (!
  (= (MWSF_apply mwsf@28@01 $t@26@01) $t@27@01)
  :pattern ((MWSF_apply mwsf@28@01 $t@26@01))
  :qid |quant-u-6|)))
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
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
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] x.f == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0))
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f) {
; }
(push) ; 3
(declare-const $t@33@01 $Snap)
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
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f)
(declare-const mwsf@34@01 $MWSF)
(assert (forall (($t@33@01 $Snap)) (!
  (= (MWSF_apply mwsf@34@01 $t@33@01) ($Snap.combine $t@33@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@34@01 $t@33@01))
  :qid |quant-u-8|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@33@01 $Snap)) (!
  (= (MWSF_apply mwsf@34@01 $t@33@01) ($Snap.combine $t@33@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@34@01 $t@33@01))
  :qid |quant-u-9|)))
(assert true)
; [exec]
; x.f := 0
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f)
(assert (=
  (MWSF_apply mwsf@34@01 ($SortWrappers.IntTo$Snap 0))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@34@01 ($SortWrappers.IntTo$Snap 0)))
    ($Snap.second (MWSF_apply mwsf@34@01 ($SortWrappers.IntTo$Snap 0))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@34@01 ($SortWrappers.IntTo$Snap 0)))
  $Snap.unit))
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@34@01 ($SortWrappers.IntTo$Snap 0))))
  0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == 0
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const x@35@01 $Ref)
(declare-const x@36@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@37@01 Int)
(assert (not (= x@36@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 ($Snap.combine ($Snap.first $t@38@01) ($Snap.second $t@38@01))))
(assert (= ($Snap.second $t@38@01) $Snap.unit))
; [eval] x.f == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) 0))
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f) {
; }
(push) ; 3
(declare-const $t@39@01 $Snap)
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
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f)
(declare-const mwsf@40@01 $MWSF)
(assert (forall (($t@39@01 $Snap)) (!
  (= (MWSF_apply mwsf@40@01 $t@39@01) ($Snap.combine $t@39@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@40@01 $t@39@01))
  :qid |quant-u-10|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@39@01 $Snap)) (!
  (= (MWSF_apply mwsf@40@01 $t@39@01) ($Snap.combine $t@39@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@40@01 $t@39@01))
  :qid |quant-u-11|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && x.f == old[lhs](x.f)
(assert (=
  (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01)))
    ($Snap.second (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01)))
  $Snap.unit))
; [eval] x.f == old[lhs](x.f)
; [eval] old[lhs](x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01))))
  $t@37@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01))))
  0)))
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
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01))))
  0)))
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
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01))))
  0)))
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
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@40@01 ($SortWrappers.IntTo$Snap $t@37@01))))
  0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
