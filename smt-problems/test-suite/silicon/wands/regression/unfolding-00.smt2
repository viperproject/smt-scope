(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:37:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/unfolding.vpr
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
(declare-fun Pair%trigger ($Snap $Ref) Bool)
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
    (=
      (sum s@$ p@0@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((sum s@$ p@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  true
  :pattern ((sum s@$ p@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test06 ----------
(declare-const p@0@01 $Ref)
(declare-const p@1@01 $Ref)
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
; package acc(Pair(p), write) && sum(p) == 10 --* p.f + p.g == 10 {
;   unfold acc(Pair(p), write)
; }
(push) ; 3
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] sum(p) == 10
; [eval] sum(p)
(push) ; 4
(assert (sum%precondition ($Snap.first $t@2@01) p@1@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@2@01) p@1@01))
(assert (= (sum ($Snap.first $t@2@01) p@1@01) 10))
; [exec]
; unfold acc(Pair(p), write)
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
(assert (=
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.second ($Snap.first $t@2@01)))))
(assert (not (= p@1@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger ($Snap.first $t@2@01) p@1@01))
; [eval] p.f + p.g == 10
; [eval] p.f + p.g
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@2@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@2@01))))
  10)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@2@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@2@01))))
  10))
; Create MagicWandSnapFunction for wand acc(Pair(p), write) && sum(p) == 10 --* p.f + p.g == 10
(declare-const mwsf@3@01 $MWSF)
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@3@01 $t@2@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@3@01 $t@2@01))
  :qid |quant-u-4|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@3@01 $t@2@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@3@01 $t@2@01))
  :qid |quant-u-5|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const p@4@01 $Ref)
(declare-const p@5@01 $Ref)
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
; package acc(Pair(p), write) && sum(p) == 10 --*
; acc(Pair(p), write) && (unfolding acc(Pair(p), write) in p.f + p.g == 10) {
; }
(push) ; 3
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] sum(p) == 10
; [eval] sum(p)
(push) ; 4
(assert (sum%precondition ($Snap.first $t@6@01) p@5@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@6@01) p@5@01))
(assert (= (sum ($Snap.first $t@6@01) p@5@01) 10))
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
; [eval] (unfolding acc(Pair(p), write) in p.f + p.g == 10)
(set-option :timeout 0)
(push) ; 4
(assert (Pair%trigger ($Snap.first $t@6@01) p@5@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(assert (not (= p@5@01 $Ref.null)))
; [eval] p.f + p.g == 10
; [eval] p.f + p.g
(pop) ; 4
; Joined path conditions
(assert (and
  (Pair%trigger ($Snap.first $t@6@01) p@5@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))
  (not (= p@5@01 $Ref.null))))
(push) ; 4
(assert (not (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@6@01))))
  10)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@6@01))))
  10))
; Create MagicWandSnapFunction for wand acc(Pair(p), write) && sum(p) == 10 --* acc(Pair(p), write) && (unfolding acc(Pair(p), write) in p.f + p.g == 10)
(declare-const mwsf@7@01 $MWSF)
(assert (forall (($t@6@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@7@01 $t@6@01)
    ($Snap.combine ($Snap.first $t@6@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@7@01 $t@6@01))
  :qid |quant-u-6|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@6@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@7@01 $t@6@01)
    ($Snap.combine ($Snap.first $t@6@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@7@01 $t@6@01))
  :qid |quant-u-7|)))
(assert true)
; [exec]
; inhale acc(Pair(p), write)
(declare-const $t@8@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(Pair(p), write)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (not (= p@5@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger $t@8@01 p@5@01))
; [exec]
; p.f := 5
; [exec]
; p.g := p.f
; [exec]
; fold acc(Pair(p), write)
(assert (Pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 5)
  ($SortWrappers.IntTo$Snap 5)) p@5@01))
; [exec]
; apply acc(Pair(p), write) && sum(p) == 10 --*
;   acc(Pair(p), write) && (unfolding acc(Pair(p), write) in p.f + p.g == 10)
; [eval] sum(p) == 10
; [eval] sum(p)
(set-option :timeout 0)
(push) ; 4
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 5)
  ($SortWrappers.IntTo$Snap 5)) p@5@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 5)
  ($SortWrappers.IntTo$Snap 5)) p@5@01))
(push) ; 4
(assert (not (=
  (sum ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5)) p@5@01)
  10)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (sum ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5)) p@5@01)
  10))
(assert (=
  (MWSF_apply mwsf@7@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
    $Snap.unit))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
      $Snap.unit)))
    ($Snap.second (MWSF_apply mwsf@7@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
      $Snap.unit))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@7@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
    $Snap.unit)))
  $Snap.unit))
; [eval] (unfolding acc(Pair(p), write) in p.f + p.g == 10)
(push) ; 4
(assert (Pair%trigger ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
  ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
  $Snap.unit))) p@5@01))
(assert (=
  ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
    $Snap.unit)))
  ($Snap.combine
    ($Snap.first ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
      $Snap.unit))))
    ($Snap.second ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
      $Snap.unit)))))))
; [eval] p.f + p.g == 10
; [eval] p.f + p.g
(pop) ; 4
; Joined path conditions
(assert (and
  (Pair%trigger ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
    $Snap.unit))) p@5@01)
  (=
    ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
      $Snap.unit)))
    ($Snap.combine
      ($Snap.first ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
        $Snap.unit))))
      ($Snap.second ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
        ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
        $Snap.unit))))))))
(assert (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
      $Snap.unit)))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first (MWSF_apply mwsf@7@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 5) ($SortWrappers.IntTo$Snap 5))
      $Snap.unit))))))
  10))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert (unfolding acc(Pair(p), write) in p.f + p.g == 10)
; [eval] (unfolding acc(Pair(p), write) in p.f + p.g == 10)
(set-option :timeout 0)
(push) ; 4
; [eval] p.f + p.g == 10
; [eval] p.f + p.g
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
; ---------- test01 ----------
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
; var p: Ref
(declare-const p@9@01 $Ref)
; [exec]
; p := new(f, g)
(declare-const p@10@01 $Ref)
(assert (not (= p@10@01 $Ref.null)))
(declare-const f@11@01 Int)
(declare-const g@12@01 Int)
(assert (not (= p@10@01 p@9@01)))
; [exec]
; p.f := 3
; [exec]
; p.g := 7
; [exec]
; fold acc(Pair(p), write)
(assert (Pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($SortWrappers.IntTo$Snap 7)) p@10@01))
; [exec]
; package acc(Pair(p), write) && sum(p) == 10 --*
; acc(p.f, write) && (acc(p.g, write) && p.f + p.g == 10) {
;   unfold acc(Pair(p), write)
; }
(push) ; 3
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; [eval] sum(p) == 10
; [eval] sum(p)
(push) ; 4
(assert (sum%precondition ($Snap.first $t@13@01) p@10@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@13@01) p@10@01))
(assert (= (sum ($Snap.first $t@13@01) p@10@01) 10))
; [exec]
; unfold acc(Pair(p), write)
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
(assert (=
  ($Snap.first $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@13@01))
    ($Snap.second ($Snap.first $t@13@01)))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger ($Snap.first $t@13@01) p@10@01))
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
; [eval] p.f + p.g == 10
; [eval] p.f + p.g
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@13@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@13@01))))
  10)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@13@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@13@01))))
  10))
; Create MagicWandSnapFunction for wand acc(Pair(p), write) && sum(p) == 10 --* acc(p.f, write) && (acc(p.g, write) && p.f + p.g == 10)
(declare-const mwsf@14@01 $MWSF)
(assert (forall (($t@13@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@13@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@13@01))
      ($Snap.combine ($Snap.second ($Snap.first $t@13@01)) $Snap.unit)))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-8|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@13@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@13@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@13@01))
      ($Snap.combine ($Snap.second ($Snap.first $t@13@01)) $Snap.unit)))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-9|)))
(assert true)
; [exec]
; apply acc(Pair(p), write) && sum(p) == 10 --*
;   acc(p.f, write) && (acc(p.g, write) && p.f + p.g == 10)
; [eval] sum(p) == 10
; [eval] sum(p)
(push) ; 4
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($SortWrappers.IntTo$Snap 7)) p@10@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($SortWrappers.IntTo$Snap 7)) p@10@01))
(push) ; 4
(assert (not (=
  (sum ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7)) p@10@01)
  10)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (sum ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7)) p@10@01)
  10))
(assert (=
  (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit)))
    ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit)))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit))))
    ($Snap.second ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit)))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit))))
  $Snap.unit))
; [eval] p.f + p.g == 10
; [eval] p.f + p.g
(assert (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit))))))
  10))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; fold acc(Pair(p), write)
(assert (Pair%trigger ($Snap.combine
  ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit)))
  ($Snap.first ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit))))) p@10@01))
; [exec]
; assert sum(p) == 10
; [eval] sum(p) == 10
; [eval] sum(p)
(set-option :timeout 0)
(push) ; 4
(assert (sum%precondition ($Snap.combine
  ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit)))
  ($Snap.first ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit))))) p@10@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit)))
  ($Snap.first ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
    ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
    $Snap.unit))))) p@10@01))
(push) ; 4
(assert (not (=
  (sum ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit)))
    ($Snap.first ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit))))) p@10@01)
  10)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (sum ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit)))
    ($Snap.first ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7))
      $Snap.unit))))) p@10@01)
  10))
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
; ---------- test02 ----------
(declare-const p@15@01 $Ref)
(declare-const p@16@01 $Ref)
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
; inhale acc(Pair(p), 1 / 2)
(declare-const $t@17@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package acc(Pair(p), 1 / 2) --* acc(p.f, write) && acc(p.g, write) {
;   unfold acc(Pair(p), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@18@01 $Snap)
; [exec]
; unfold acc(Pair(p), write)
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
(assert (= $t@18@01 $t@17@01))
(check-sat)
; unknown
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (not (= p@16@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger $t@17@01 p@16@01))
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
; Create MagicWandSnapFunction for wand acc(Pair(p), 1 / 2) --* acc(p.f, write) && acc(p.g, write)
(declare-const mwsf@19@01 $MWSF)
(assert (forall (($t@18@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@19@01 $t@18@01)
    ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01)))
  :pattern ((MWSF_apply mwsf@19@01 $t@18@01))
  :qid |quant-u-10|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@18@01 $Snap)) (!
  (and
    (= $t@18@01 $t@17@01)
    (=
      (MWSF_apply mwsf@19@01 $t@18@01)
      ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
  :pattern ((MWSF_apply mwsf@19@01 $t@18@01))
  :qid |quant-u-11|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const p@20@01 $Ref)
(declare-const p@21@01 $Ref)
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
; package acc(Pair(p), 1 / 2) --* acc(p.f, write) && acc(p.g, write) {
;   unfold acc(Pair(p), write)
; }
(push) ; 3
(declare-const $t@22@01 $Snap)
; [exec]
; unfold acc(Pair(p), write)
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
(pop) ; 3
(declare-const $t@23@01 $Snap)
(declare-const $t@24@01 $Snap)
; Create MagicWandSnapFunction for wand acc(Pair(p), 1 / 2) --* acc(p.f, write) && acc(p.g, write)
(declare-const mwsf@25@01 $MWSF)
(assert (forall (($t@23@01 $Snap)) (!
  (= (MWSF_apply mwsf@25@01 $t@23@01) $t@24@01)
  :pattern ((MWSF_apply mwsf@25@01 $t@23@01))
  :qid |quant-u-12|)))
(pop) ; 2
(pop) ; 1
