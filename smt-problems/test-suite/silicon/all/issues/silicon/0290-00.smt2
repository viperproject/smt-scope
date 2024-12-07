(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:21
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0290.vpr
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
; ////////// Symbols
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
(declare-fun Q%trigger ($Snap $Ref) Bool)
(declare-fun Rec%trigger ($Snap $Ref) Bool)
(declare-fun SP_State%trigger ($Snap $Ref) Bool)
(declare-fun OFL_State%trigger ($Snap $Ref) Bool)
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
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
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
; inhale acc(P(r), write)
(declare-const $t@2@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(P(r), wildcard)
(declare-const $k@3@01 $Perm)
(assert ($Perm.isReadVar $k@3@01))
(assert (< $k@3@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@3@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (<= $Perm.No $k@3@01))
(assert (<= $k@3@01 $Perm.Write))
(assert (=> (< $Perm.No $k@3@01) (not (= r@1@01 $Ref.null))))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@2@01)) $Snap.unit))
; [eval] (unfolding acc(Q(r.f), write) in true)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Q%trigger ($Snap.first ($Snap.second $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))
(assert (= ($Snap.first ($Snap.second $t@2@01)) $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (and
  (Q%trigger ($Snap.first ($Snap.second $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
  (= ($Snap.first ($Snap.second $t@2@01)) $Snap.unit)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@2@01 r@1@01))
; [exec]
; assert false
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
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@4@01 $Ref)
(declare-const x@5@01 $Ref)
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
; var y: Ref
(declare-const y@6@01 $Ref)
; [exec]
; inhale acc(Rec(x), write)
(declare-const $t@7@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; y := (unfolding acc(Rec(x), write) in x.f)
; [eval] (unfolding acc(Rec(x), write) in x.f)
(set-option :timeout 0)
(push) ; 3
(assert (Rec%trigger $t@7@01 x@5@01))
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (<= $Perm.No $k@8@01))
(assert (<= $k@8@01 $Perm.Write))
(assert (=> (< $Perm.No $k@8@01) (not (= x@5@01 $Ref.null))))
; [eval] x.f != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@7@01) != Null | live]
; [else-branch: 0 | First:($t@7@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:($t@7@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (<= $Perm.No $k@9@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 0 | First:($t@7@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@10@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null))
  (=
    (as joined_unfolding@10@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null)
  (=
    (as joined_unfolding@10@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@8@01))
(assert ($Perm.isReadVar $k@9@01))
(assert (and
  (Rec%trigger $t@7@01 x@5@01)
  (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01)))
  (<= $Perm.No $k@8@01)
  (<= $k@8@01 $Perm.Write)
  (=> (< $Perm.No $k@8@01) (not (= x@5@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null))
    (<= $Perm.No $k@9@01))))
; Joined path conditions
(assert (and
  (Rec%trigger $t@7@01 x@5@01)
  (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01)))
  (<= $Perm.No $k@8@01)
  (<= $k@8@01 $Perm.Write)
  (=> (< $Perm.No $k@8@01) (not (= x@5@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null)
    (= ($Snap.second $t@7@01) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@01)) $Ref.null))))
(declare-const y@11@01 $Ref)
(assert (= y@11@01 (as joined_unfolding@10@01  $Ref)))
(pop) ; 2
(pop) ; 1
; ---------- Router__process_data_3_3 ----------
(declare-const spkt@12@01 $Ref)
(declare-const spkt@13@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.second $t@14@01) $Snap.unit))
; [eval] (unfolding acc(SP_State(spkt), wildcard) in true)
(declare-const $k@15@01 $Perm)
(assert ($Perm.isReadVar $k@15@01))
(push) ; 2
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(assert (< $k@16@01 (/ (to_real 1) (to_real 2))))
(assert (<= $Perm.No (- (/ (to_real 1) (to_real 2)) $k@16@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (SP_State%trigger ($Snap.first $t@14@01) spkt@13@01))
(assert (=
  ($Snap.first $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@14@01))
    ($Snap.second ($Snap.first $t@14@01)))))
(assert (<= $Perm.No $k@15@01))
(assert (<= $k@15@01 $Perm.Write))
(assert (=> (< $Perm.No $k@15@01) (not (= spkt@13@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@14@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@14@01))) $Snap.unit))
; [eval] (unfolding acc(OFL_State(self.ofs), write) in true)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (OFL_State%trigger ($Snap.first ($Snap.second ($Snap.first $t@14@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@14@01)))))
(assert (= ($Snap.first ($Snap.second ($Snap.first $t@14@01))) $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (and
  (OFL_State%trigger ($Snap.first ($Snap.second ($Snap.first $t@14@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@14@01))))
  (= ($Snap.first ($Snap.second ($Snap.first $t@14@01))) $Snap.unit)))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@16@01))
(assert (and
  (< $k@16@01 (/ (to_real 1) (to_real 2)))
  (<= $Perm.No (- (/ (to_real 1) (to_real 2)) $k@16@01))
  (SP_State%trigger ($Snap.first $t@14@01) spkt@13@01)
  (=
    ($Snap.first $t@14@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@14@01))
      ($Snap.second ($Snap.first $t@14@01))))
  (<= $Perm.No $k@15@01)
  (<= $k@15@01 $Perm.Write)
  (=> (< $Perm.No $k@15@01) (not (= spkt@13@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first $t@14@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@14@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@14@01)))))
  (= ($Snap.second ($Snap.second ($Snap.first $t@14@01))) $Snap.unit)
  (OFL_State%trigger ($Snap.first ($Snap.second ($Snap.first $t@14@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@14@01))))
  (= ($Snap.first ($Snap.second ($Snap.first $t@14@01))) $Snap.unit)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
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
(pop) ; 2
(pop) ; 1
