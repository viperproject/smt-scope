(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0229.vpr
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
(declare-fun valid2%trigger ($Snap $Ref) Bool)
(declare-fun valid__Foo%trigger ($Snap $Ref) Bool)
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
; ---------- test42 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] (unfolding acc(valid2(x), write) in x.r)
(push) ; 2
(assert (valid2%trigger ($Snap.first $t@2@01) x@1@01))
(assert (=
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.second ($Snap.first $t@2@01)))))
(assert (not (= x@1@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.first $t@2@01)) $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (and
  (valid2%trigger ($Snap.first $t@2@01) x@1@01)
  (=
    ($Snap.first $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.second ($Snap.first $t@2@01))))
  (not (= x@1@01 $Ref.null))
  (= ($Snap.second ($Snap.first $t@2@01)) $Snap.unit)))
(assert ($SortWrappers.$SnapToBool ($Snap.first ($Snap.first $t@2@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $MWSF)
; [eval] old((unfolding acc(valid2(x), write) in x.r))
; [eval] (unfolding acc(valid2(x), write) in x.r)
(push) ; 3
(pop) ; 3
; Joined path conditions
(pop) ; 2
(push) ; 2
; [exec]
; package true --* old((unfolding acc(valid2(x), write) in x.r)) {
; }
(push) ; 3
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] old((unfolding acc(valid2(x), write) in x.r))
; [eval] (unfolding acc(valid2(x), write) in x.r)
(push) ; 4
(pop) ; 4
; Joined path conditions
; Create MagicWandSnapFunction for wand true --* old((unfolding acc(valid2(x), write) in x.r))
(declare-const mwsf@5@01 $MWSF)
(assert (forall (($t@4@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@4@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-0|)))
; [eval] old((unfolding acc(valid2(x), write) in x.r))
; [eval] (unfolding acc(valid2(x), write) in x.r)
(push) ; 4
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (forall (($t@4@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@4@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-1|)))
; [eval] old((unfolding acc(valid2(x), write) in x.r))
; [eval] (unfolding acc(valid2(x), write) in x.r)
(push) ; 4
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const x$1@6@01 $Ref)
(declare-const rd$1@7@01 $Perm)
(declare-const res$1@8@01 $Ref)
(declare-const x$1@9@01 $Ref)
(declare-const rd$1@10@01 $Perm)
(declare-const res$1@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.first $t@12@01) $Snap.unit))
; [eval] none < rd$1
(assert (< $Perm.No rd$1@10@01))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))
; [eval] rd$1 < write
(assert (< rd$1@10@01 $Perm.Write))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (not (= res$1@11@01 $Ref.null)))
; [eval] rd$1 / 2
; [eval] old((unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v))
; [eval] (unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v)
; [eval] rd$1 / 2
(push) ; 3
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [eval] rd$1 / 2
(push) ; 4
(assert (not (or
  (= (/ rd$1@10@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@10@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2)))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No)
  (<
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid__Foo%trigger ($Snap.second ($Snap.second $t@12@01)) x$1@9@01))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (<= $Perm.No (/ rd$1@10@01 (to_real 2))))
(assert (<= (/ rd$1@10@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@10@01 (to_real 2))) (not (= x$1@9@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (/ rd$1@10@01 (to_real 2)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (/ rd$1@10@01 (to_real 2)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (<=
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2)))))
  (valid__Foo%trigger ($Snap.second ($Snap.second $t@12@01)) x$1@9@01)
  (=
    ($Snap.second ($Snap.second $t@12@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  (<= $Perm.No (/ rd$1@10@01 (to_real 2)))
  (<= (/ rd$1@10@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@10@01 (to_real 2))) (not (= x$1@9@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  (=>
    (< $Perm.No (/ rd$1@10@01 (to_real 2)))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
        $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  (=>
    (< $Perm.No (/ rd$1@10@01 (to_real 2)))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
        $Ref.null)))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(valid__Foo(x$1), write)
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (not (= x$1@9@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid__Foo%trigger ($Snap.second ($Snap.second $t@12@01)) x$1@9@01))
; [exec]
; res$1 := x$1.Foo__v1
(declare-const res$1@14@01 $Ref)
(assert (=
  res$1@14@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))))
; [exec]
; package acc(res$1.Int__v, write) --*
; acc(valid__Foo(x$1), write) &&
; (unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v) ==
; old((unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v)) {
;   fold acc(valid__Foo(x$1), write)
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@15@01 $Snap)
(assert (not (= res$1@14@01 $Ref.null)))
; [exec]
; fold acc(valid__Foo(x$1), write)
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
(assert (not (=
  res$1@14@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid__Foo%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    $t@15@01
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))) x$1@9@01))
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
; [eval] (unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v) == old((unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v))
; [eval] (unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v)
; [eval] rd$1 / 2
(set-option :timeout 0)
(push) ; 4
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [eval] rd$1 / 2
(push) ; 5
(assert (not (or
  (= (/ rd$1@10@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@10@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2)))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No)
  (<
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (/ rd$1@10@01 (to_real 2))))
(assert (<= (/ rd$1@10@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@10@01 (to_real 2))) (not (= x$1@9@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (/ rd$1@10@01 (to_real 2)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (/ rd$1@10@01 (to_real 2)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert (and
  (<=
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2)))))
  (<= $Perm.No (/ rd$1@10@01 (to_real 2)))
  (<= (/ rd$1@10@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@10@01 (to_real 2))) (not (= x$1@9@01 $Ref.null)))
  (=>
    (< $Perm.No (/ rd$1@10@01 (to_real 2)))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
        $Ref.null)))
  (=>
    (< $Perm.No (/ rd$1@10@01 (to_real 2)))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
        $Ref.null)))))
; [eval] old((unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v))
; [eval] (unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v)
; [eval] rd$1 / 2
(set-option :timeout 0)
(push) ; 4
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [eval] rd$1 / 2
(push) ; 5
(assert (not (or
  (= (/ rd$1@10@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@10@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2)))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No)
  (<
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
; Create MagicWandSnapFunction for wand acc(res$1.Int__v, write) --* acc(valid__Foo(x$1), write) && (unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v) == old((unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v))
(declare-const mwsf@16@01 $MWSF)
(assert (forall (($t@15@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@16@01 $t@15@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
        ($Snap.combine
          $t@15@01
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@16@01 $t@15@01))
  :qid |quant-u-2|)))
; [eval] rd$1 / 2
; [eval] old((unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v))
; [eval] (unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v)
; [eval] rd$1 / 2
(set-option :timeout 0)
(push) ; 4
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [eval] rd$1 / 2
(push) ; 5
(assert (not (or
  (= (/ rd$1@10@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@10@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2)))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No)
  (<
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@15@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@16@01 $t@15@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
        ($Snap.combine
          $t@15@01
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@16@01 $t@15@01))
  :qid |quant-u-3|)))
(assert true)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  res$1@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] rd$1 / 2
; [eval] old((unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v))
; [eval] (unfolding acc(valid__Foo(x$1), rd$1 / 2) in x$1.Foo__v2.Int__v)
; [eval] rd$1 / 2
(set-option :timeout 0)
(push) ; 4
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [eval] rd$1 / 2
(push) ; 5
(assert (not (or
  (= (/ rd$1@10@01 (to_real 2)) $Perm.No)
  (< $Perm.No (/ rd$1@10@01 (to_real 2))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2)))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No)
  (<
    (-
      (/ rd$1@10@01 (to_real 2))
      ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (/ rd$1@10@01 (to_real 2))))
(assert (<= (/ rd$1@10@01 (to_real 2)) $Perm.Write))
(assert (=> (< $Perm.No (/ rd$1@10@01 (to_real 2))) (not (= x$1@9@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (/ rd$1@10@01 (to_real 2)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (/ rd$1@10@01 (to_real 2)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (/ rd$1@10@01 (to_real 2)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert (and
  (<=
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (/ rd$1@10@01 (to_real 2)))))
  (<= $Perm.No (/ rd$1@10@01 (to_real 2)))
  (<= (/ rd$1@10@01 (to_real 2)) $Perm.Write)
  (=> (< $Perm.No (/ rd$1@10@01 (to_real 2))) (not (= x$1@9@01 $Ref.null)))
  (=>
    (< $Perm.No (/ rd$1@10@01 (to_real 2)))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@12@01))))
        $Ref.null)))
  (=>
    (< $Perm.No (/ rd$1@10@01 (to_real 2)))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
        $Ref.null)))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
