(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:52:41
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0213.vpr
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
(declare-fun Foo%trigger ($Snap $Ref) Bool)
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
; ---------- silicon_fail ----------
(declare-const x@0@01 $Ref)
(declare-const res@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const res@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (not (= res@3@01 $Ref.null)))
; [eval] old((unfolding acc(Foo(x), 1 / 2) in x.val))
; [eval] (unfolding acc(Foo(x), 1 / 2) in x.val)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Foo%trigger $t@4@01 x@2@01))
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= x@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) $Ref.null)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) x@2@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (Foo%trigger $t@4@01 x@2@01)
  (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01)))
  (not (= x@2@01 $Ref.null))
  (=
    ($Snap.second $t@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.second ($Snap.second $t@4@01))))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) $Ref.null))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(Foo(x), write)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= x@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) $Ref.null)))
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Foo%trigger $t@4@01 x@2@01))
; [exec]
; res := x.f1
(declare-const res@6@01 $Ref)
(assert (= res@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01))))
; [exec]
; package acc(res.val, write) --*
; acc(Foo(x), write) &&
; (unfolding acc(Foo(x), 1 / 2) in x.val) ==
; old((unfolding acc(Foo(x), 1 / 2) in x.val)) {
;   fold acc(Foo(x), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@7@01 $Snap)
(assert (not (= res@6@01 $Ref.null)))
; [exec]
; fold acc(Foo(x), write)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= res@6@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Foo%trigger ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.combine $t@7@01 ($Snap.second ($Snap.second $t@4@01)))) x@2@01))
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
; [eval] (unfolding acc(Foo(x), 1 / 2) in x.val) == old((unfolding acc(Foo(x), 1 / 2) in x.val))
; [eval] (unfolding acc(Foo(x), 1 / 2) in x.val)
(set-option :timeout 0)
(push) ; 4
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) x@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
; [eval] old((unfolding acc(Foo(x), 1 / 2) in x.val))
; [eval] (unfolding acc(Foo(x), 1 / 2) in x.val)
(set-option :timeout 0)
(push) ; 4
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) x@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
; Create MagicWandSnapFunction for wand acc(res.val, write) --* acc(Foo(x), write) && (unfolding acc(Foo(x), 1 / 2) in x.val) == old((unfolding acc(Foo(x), 1 / 2) in x.val))
(declare-const mwsf@8@01 $MWSF)
(assert (forall (($t@7@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@8@01 $t@7@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@4@01)
        ($Snap.combine $t@7@01 ($Snap.second ($Snap.second $t@4@01))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@8@01 $t@7@01))
  :qid |quant-u-0|)))
; [eval] old((unfolding acc(Foo(x), 1 / 2) in x.val))
; [eval] (unfolding acc(Foo(x), 1 / 2) in x.val)
(set-option :timeout 0)
(push) ; 4
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) x@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@7@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@8@01 $t@7@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@4@01)
        ($Snap.combine $t@7@01 ($Snap.second ($Snap.second $t@4@01))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@8@01 $t@7@01))
  :qid |quant-u-1|)))
(assert true)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) res@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(Foo(x), 1 / 2) in x.val))
; [eval] (unfolding acc(Foo(x), 1 / 2) in x.val)
(set-option :timeout 0)
(push) ; 4
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) x@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- silicon_ok1 ----------
(declare-const x@9@01 $Ref)
(declare-const res@10@01 $Ref)
(declare-const x@11@01 $Ref)
(declare-const res@12@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@13@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (not (= res@12@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(Foo(x), write)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (not (= x@11@01 $Ref.null)))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) $Ref.null)))
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) x@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Foo%trigger $t@13@01 x@11@01))
; [exec]
; res := x.f1
(declare-const res@15@01 $Ref)
(assert (= res@15@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01))))
; [exec]
; x.val := 10
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) x@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; package acc(res.val, write) --*
; acc(Foo(x), write) && (unfolding acc(Foo(x), 1 / 2) in x.val) == 10 {
;   fold acc(Foo(x), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@16@01 $Snap)
(assert (not (= res@15@01 $Ref.null)))
; [exec]
; fold acc(Foo(x), write)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= res@15@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Foo%trigger ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.combine $t@16@01 ($SortWrappers.IntTo$Snap 10))) x@11@01))
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
; [eval] (unfolding acc(Foo(x), 1 / 2) in x.val) == 10
; [eval] (unfolding acc(Foo(x), 1 / 2) in x.val)
(set-option :timeout 0)
(push) ; 4
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) x@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
; Create MagicWandSnapFunction for wand acc(res.val, write) --* acc(Foo(x), write) && (unfolding acc(Foo(x), 1 / 2) in x.val) == 10
(declare-const mwsf@17@01 $MWSF)
(assert (forall (($t@16@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@17@01 $t@16@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.combine $t@16@01 ($SortWrappers.IntTo$Snap 10)))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@17@01 $t@16@01))
  :qid |quant-u-2|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@16@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@17@01 $t@16@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.combine $t@16@01 ($SortWrappers.IntTo$Snap 10)))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@17@01 $t@16@01))
  :qid |quant-u-3|)))
(assert true)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) res@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- silicon_ok2 ----------
(declare-const x@18@01 $Ref)
(declare-const res@19@01 $Ref)
(declare-const x@20@01 $Ref)
(declare-const res@21@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (not (= x@20@01 $Ref.null)))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@22@01)) $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@22@01)) x@20@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (not (= res@21@01 $Ref.null)))
; [eval] old(x.val)
(pop) ; 2
(push) ; 2
; [exec]
; res := x.f1
(declare-const res@24@01 $Ref)
(assert (= res@24@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@22@01))))
; [exec]
; package acc(res.val, write) --* acc(x.val, write) && x.val == old(x.val) {
; }
(push) ; 3
(declare-const $t@25@01 $Snap)
(assert (not (= res@24@01 $Ref.null)))
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
(assert (not (= res@24@01 x@20@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] x.val == old(x.val)
; [eval] old(x.val)
; Create MagicWandSnapFunction for wand acc(res.val, write) --* acc(x.val, write) && x.val == old(x.val)
(declare-const mwsf@26@01 $MWSF)
(assert (forall (($t@25@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@26@01 $t@25@01)
    ($Snap.combine ($Snap.second ($Snap.second $t@22@01)) $Snap.unit))
  :pattern ((MWSF_apply mwsf@26@01 $t@25@01))
  :qid |quant-u-4|)))
; [eval] old(x.val)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@25@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@26@01 $t@25@01)
    ($Snap.combine ($Snap.second ($Snap.second $t@22@01)) $Snap.unit))
  :pattern ((MWSF_apply mwsf@26@01 $t@25@01))
  :qid |quant-u-5|)))
(assert true)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@22@01)) res@24@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] old(x.val)
(pop) ; 3
(pop) ; 2
(pop) ; 1
