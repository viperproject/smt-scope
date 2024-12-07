(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:36:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/let_wands.vpr
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
; ---------- test01 ----------
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
(declare-const $t@3@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; var w: Int
(declare-const w@4@01 Int)
; [exec]
; w := x.f
; [exec]
; package acc(x.f, write) && x.f == w --* acc(x.f, write) && x.f == old(x.f) {
; }
(push) ; 3
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] x.f == w
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@5@01)) $t@2@01))
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
; [eval] x.f == old(x.f)
; [eval] old(x.f)
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f == w --* acc(x.f, write) && x.f == old(x.f)
(declare-const mwsf@6@01 $MWSF)
(assert (forall (($t@5@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@6@01 $t@5@01)
    ($Snap.combine ($Snap.first $t@5@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
  :qid |quant-u-4|)))
; [eval] old(x.f)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@5@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@6@01 $t@5@01)
    ($Snap.combine ($Snap.first $t@5@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
  :qid |quant-u-5|)))
(assert true)
; [exec]
; apply acc(x.f, write) && x.f == old(x.f) --* acc(x.f, write) && x.f == w
; [eval] old(x.f)
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (=
  (MWSF_apply mwsf@6@01 ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@2@01)
    $Snap.unit))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@2@01)
      $Snap.unit)))
    ($Snap.second (MWSF_apply mwsf@6@01 ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@2@01)
      $Snap.unit))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@6@01 ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@2@01)
    $Snap.unit)))
  $Snap.unit))
; [eval] x.f == w
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@2@01)
    $Snap.unit))))
  $t@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@7@01 $Ref)
(declare-const x@8@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@9@01 Int)
(assert (not (= x@8@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@10@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; var w: Int
(declare-const w@11@01 Int)
; [exec]
; w := x.f
; [exec]
; package acc(x.f, write) && x.f == w --* acc(x.f, write) && x.f == old(x.f) {
; }
(push) ; 3
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.second $t@12@01) $Snap.unit))
; [eval] x.f == w
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@12@01)) $t@9@01))
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
; [eval] x.f == old(x.f)
; [eval] old(x.f)
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f == w --* acc(x.f, write) && x.f == old(x.f)
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@13@01 $t@12@01)
    ($Snap.combine ($Snap.first $t@12@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-6|)))
; [eval] old(x.f)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@12@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@13@01 $t@12@01)
    ($Snap.combine ($Snap.first $t@12@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-7|)))
(assert true)
; [exec]
; x.f := 0
; [exec]
; apply acc(x.f, write) && x.f == w --* acc(x.f, write) && x.f == old(x.f)
; [eval] old(x.f)
; [eval] x.f == w
(push) ; 4
(assert (not (= 0 $t@9@01)))
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
; [eval] x.f == w
(set-option :timeout 0)
(push) ; 4
(assert (not (= 0 $t@9@01)))
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
; [eval] x.f == w
(set-option :timeout 0)
(push) ; 4
(assert (not (= 0 $t@9@01)))
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
; [eval] x.f == w
(set-option :timeout 0)
(push) ; 4
(assert (not (= 0 $t@9@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@14@01 $Ref)
(declare-const x@15@01 $Ref)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (not (= x@15@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var w: Int
(declare-const w@17@01 Int)
; [exec]
; w := x.f
(declare-const w@18@01 Int)
(assert (= w@18@01 ($SortWrappers.$SnapToInt ($Snap.first $t@16@01))))
; [exec]
; apply acc(x.f, write) && x.f == w --* acc(x.f, write) && x.f == old(x.f)
; [eval] old(x.f)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@16@01)) w@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.f == w
(set-option :timeout 0)
(push) ; 3
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@16@01)) w@18@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@16@01)) w@18@01))
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@16@01)) ($Snap.combine
    ($Snap.first $t@16@01)
    $Snap.unit))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@16@01)) ($Snap.combine
      ($Snap.first $t@16@01)
      $Snap.unit)))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@16@01)) ($Snap.combine
      ($Snap.first $t@16@01)
      $Snap.unit))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@16@01)) ($Snap.combine
    ($Snap.first $t@16@01)
    $Snap.unit)))
  $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@16@01)) ($Snap.combine
    ($Snap.first $t@16@01)
    $Snap.unit))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@16@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@19@01 $Ref)
(declare-const x@20@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
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
; var w: Int
(declare-const w@22@01 Int)
; [exec]
; w := x.f
(declare-const w@23@01 Int)
(assert (= w@23@01 ($SortWrappers.$SnapToInt ($Snap.first $t@21@01))))
; [exec]
; x.f := 0
; [exec]
; apply acc(x.f, write) && x.f == w --* acc(x.f, write) && x.f == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@21@01)) w@23@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.f == w
(set-option :timeout 0)
(push) ; 3
(assert (not (= 0 w@23@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == w
(set-option :timeout 0)
(push) ; 3
(assert (not (= 0 w@23@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == w
(set-option :timeout 0)
(push) ; 3
(assert (not (= 0 w@23@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == w
(set-option :timeout 0)
(push) ; 3
(assert (not (= 0 w@23@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@24@01 $Ref)
(declare-const y@25@01 $Ref)
(declare-const x@26@01 $Ref)
(declare-const y@27@01 $Ref)
(push) ; 1
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
; [eval] sum(x)
(push) ; 2
(assert (sum%precondition ($Snap.first $t@28@01) x@26@01))
(pop) ; 2
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@28@01) x@26@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@29@01 Int)
(assert (not (= y@27@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var w: Int
(declare-const w@30@01 Int)
; [exec]
; unfold acc(Pair(x), write)
(assert (=
  ($Snap.first $t@28@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@28@01))
    ($Snap.second ($Snap.first $t@28@01)))))
(assert (not (= x@26@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger ($Snap.first $t@28@01) x@26@01))
; [exec]
; fold acc(Pair(x), write)
(assert (Pair%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@28@01))
  ($Snap.second ($Snap.first $t@28@01))) x@26@01))
; [exec]
; w := sum(x)
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(assert (sum%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@28@01))
  ($Snap.second ($Snap.first $t@28@01))) x@26@01))
(pop) ; 3
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@28@01))
  ($Snap.second ($Snap.first $t@28@01))) x@26@01))
(declare-const w@31@01 Int)
(assert (=
  w@31@01
  (sum ($Snap.combine
    ($Snap.first ($Snap.first $t@28@01))
    ($Snap.second ($Snap.first $t@28@01))) x@26@01)))
; [exec]
; apply acc(Pair(x), write) && sum(x) == w --* acc(y.f, write)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (sum ($Snap.first $t@28@01) x@26@01) w@31@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sum(x) == w
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($Snap.first ($Snap.first $t@28@01))
    ($Snap.second ($Snap.first $t@28@01))) x@26@01)
  w@31@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (sum ($Snap.combine
    ($Snap.first ($Snap.first $t@28@01))
    ($Snap.second ($Snap.first $t@28@01))) x@26@01)
  w@31@01))
(assert (not (= y@27@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const x@32@01 $Ref)
(declare-const y@33@01 $Ref)
(declare-const x@34@01 $Ref)
(declare-const y@35@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
; [eval] sum(x)
(push) ; 2
(assert (sum%precondition ($Snap.first $t@36@01) x@34@01))
(pop) ; 2
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@36@01) x@34@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@37@01 Int)
(assert (not (= y@35@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(Pair(x), write)
(assert (=
  ($Snap.first $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@36@01))
    ($Snap.second ($Snap.first $t@36@01)))))
(assert (not (= x@34@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger ($Snap.first $t@36@01) x@34@01))
; [exec]
; x.f := x.g
(declare-const f@38@01 Int)
(assert (= f@38@01 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@36@01)))))
; [exec]
; fold acc(Pair(x), write)
(assert (Pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap f@38@01)
  ($Snap.second ($Snap.first $t@36@01))) x@34@01))
; [exec]
; apply acc(Pair(x), write) && sum(x) == old(sum(x)) --* acc(y.f, write)
; [eval] old(sum(x))
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] sum(x) == old(sum(x))
; [eval] sum(x)
(push) ; 3
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@38@01)
  ($Snap.second ($Snap.first $t@36@01))) x@34@01))
(pop) ; 3
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@38@01)
  ($Snap.second ($Snap.first $t@36@01))) x@34@01))
; [eval] old(sum(x))
; [eval] sum(x)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@38@01)
    ($Snap.second ($Snap.first $t@36@01))) x@34@01)
  (sum ($Snap.first $t@36@01) x@34@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] sum(x) == old(sum(x))
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] old(sum(x))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@38@01)
    ($Snap.second ($Snap.first $t@36@01))) x@34@01)
  (sum ($Snap.first $t@36@01) x@34@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] sum(x) == old(sum(x))
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] old(sum(x))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@38@01)
    ($Snap.second ($Snap.first $t@36@01))) x@34@01)
  (sum ($Snap.first $t@36@01) x@34@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] sum(x) == old(sum(x))
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] old(sum(x))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@38@01)
    ($Snap.second ($Snap.first $t@36@01))) x@34@01)
  (sum ($Snap.first $t@36@01) x@34@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test08 ----------
(declare-const x@39@01 $Ref)
(declare-const x@40@01 $Ref)
(push) ; 1
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 ($Snap.combine ($Snap.first $t@41@01) ($Snap.second $t@41@01))))
(assert (not (= x@40@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --*
; acc(Pair(x), write) && sum(x) == old[lhs](x.f) + old(x.g) {
;   fold acc(Pair(x), write)
; }
(push) ; 3
(declare-const $t@42@01 $Snap)
; [exec]
; fold acc(Pair(x), write)
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
(assert (Pair%trigger ($Snap.combine $t@42@01 ($Snap.second $t@41@01)) x@40@01))
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
; [eval] sum(x) == old[lhs](x.f) + old(x.g)
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 4
(assert (sum%precondition ($Snap.combine $t@42@01 ($Snap.second $t@41@01)) x@40@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.combine $t@42@01 ($Snap.second $t@41@01)) x@40@01))
; [eval] old[lhs](x.f) + old(x.g)
; [eval] old[lhs](x.f)
; [eval] old(x.g)
(push) ; 4
(assert (not (=
  (sum ($Snap.combine $t@42@01 ($Snap.second $t@41@01)) x@40@01)
  (+
    ($SortWrappers.$SnapToInt $t@42@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (sum ($Snap.combine $t@42@01 ($Snap.second $t@41@01)) x@40@01)
  (+
    ($SortWrappers.$SnapToInt $t@42@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01)))))
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(Pair(x), write) && sum(x) == old[lhs](x.f) + old(x.g)
(declare-const mwsf@43@01 $MWSF)
(assert (forall (($t@42@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@43@01 $t@42@01)
    ($Snap.combine ($Snap.combine $t@42@01 ($Snap.second $t@41@01)) $Snap.unit))
  :pattern ((MWSF_apply mwsf@43@01 $t@42@01))
  :qid |quant-u-8|)))
; [eval] old(x.g)
(pop) ; 3
(push) ; 3
(assert (forall (($t@42@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@43@01 $t@42@01)
    ($Snap.combine ($Snap.combine $t@42@01 ($Snap.second $t@41@01)) $Snap.unit))
  :pattern ((MWSF_apply mwsf@43@01 $t@42@01))
  :qid |quant-u-9|)))
(assert true)
; [exec]
; apply acc(x.f, write) --*
;   acc(Pair(x), write) && sum(x) == old[lhs](x.f) + old(x.g)
; [eval] old(x.g)
(assert (=
  (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01)))
    ($Snap.second (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01))))))
(assert (= ($Snap.second (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01))) $Snap.unit))
; [eval] sum(x) == old[lhs](x.f) + old(x.g)
; [eval] sum(x)
(push) ; 4
(assert (sum%precondition ($Snap.first (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01))) x@40@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.first (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01))) x@40@01))
; [eval] old[lhs](x.f) + old(x.g)
; [eval] old[lhs](x.f)
; [eval] old(x.g)
(assert (=
  (sum ($Snap.first (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01))) x@40@01)
  (+
    ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@41@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; unfold acc(Pair(x), write)
(assert (=
  ($Snap.first (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01))))
    ($Snap.second ($Snap.first (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01)))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger ($Snap.first (MWSF_apply mwsf@43@01 ($Snap.first $t@41@01))) x@40@01))
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
(declare-const b@44@01 Bool)
(declare-const x@45@01 $Ref)
(declare-const b@46@01 Bool)
(declare-const x@47@01 $Ref)
(push) ; 1
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(assert (= ($Snap.first $t@48@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@47@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var w: Int
(declare-const w@49@01 Int)
; [exec]
; x.f := 1
; [exec]
; w := x.f
; [exec]
; package acc(x.f, write) && x.f == w - 1 --* acc(x.f, write) && x.f == 0 {
; }
(push) ; 3
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (= ($Snap.second $t@50@01) $Snap.unit))
; [eval] x.f == w - 1
; [eval] w - 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) 0))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f == w - 1 --* acc(x.f, write) && x.f == 0
(declare-const mwsf@51@01 $MWSF)
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@51@01 $t@50@01)
    ($Snap.combine ($Snap.first $t@50@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@51@01 $t@50@01))
  :qid |quant-u-10|)))
; [eval] w - 1
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@50@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@51@01 $t@50@01)
    ($Snap.combine ($Snap.first $t@50@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@51@01 $t@50@01))
  :qid |quant-u-11|)))
(assert true)
; [exec]
; exhale acc(x.f, write) && x.f == 0 --* acc(x.f, write) && x.f == 0
; [exec]
; w := x.f
; [exec]
; package acc(x.f, write) && x.f == w - 1 --* acc(x.f, write) && x.f == 0 {
; }
(push) ; 4
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 ($Snap.combine ($Snap.first $t@52@01) ($Snap.second $t@52@01))))
(assert (= ($Snap.second $t@52@01) $Snap.unit))
; [eval] x.f == w - 1
; [eval] w - 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@52@01)) 0))
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
; [eval] x.f == 0
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f == w - 1 --* acc(x.f, write) && x.f == 0
(declare-const mwsf@53@01 $MWSF)
(assert (forall (($t@52@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@53@01 $t@52@01)
    ($Snap.combine ($Snap.first $t@52@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@53@01 $t@52@01))
  :qid |quant-u-12|)))
; [eval] w - 1
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@52@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@53@01 $t@52@01)
    ($Snap.combine ($Snap.first $t@52@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@53@01 $t@52@01))
  :qid |quant-u-13|)))
(assert true)
; [exec]
; x.f := 10
; [exec]
; exhale acc(x.f, write) && x.f == 10 --* acc(x.f, write) && x.f == 0
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test11 ----------
(declare-const b@54@01 Bool)
(declare-const x@55@01 $Ref)
(declare-const b@56@01 Bool)
(declare-const x@57@01 $Ref)
(push) ; 1
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(assert (= ($Snap.first $t@58@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@57@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var w: Int
(declare-const w@59@01 Int)
; [exec]
; w := x.f
(declare-const w@60@01 Int)
(assert (= w@60@01 ($SortWrappers.$SnapToInt ($Snap.second $t@58@01))))
; [exec]
; package acc(x.f, write) && x.f > w --* acc(x.f, write) {
; }
(push) ; 3
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(assert (= ($Snap.second $t@61@01) $Snap.unit))
; [eval] x.f > w
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@61@01)) w@60@01))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f > w --* acc(x.f, write)
(declare-const mwsf@62@01 $MWSF)
(assert (forall (($t@61@01 $Snap)) (!
  (= (MWSF_apply mwsf@62@01 $t@61@01) ($Snap.first $t@61@01))
  :pattern ((MWSF_apply mwsf@62@01 $t@61@01))
  :qid |quant-u-14|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@61@01 $Snap)) (!
  (= (MWSF_apply mwsf@62@01 $t@61@01) ($Snap.first $t@61@01))
  :pattern ((MWSF_apply mwsf@62@01 $t@61@01))
  :qid |quant-u-15|)))
(assert true)
; [exec]
; x.f := x.f + 1
; [eval] x.f + 1
(declare-const f@63@01 Int)
(assert (= f@63@01 (+ ($SortWrappers.$SnapToInt ($Snap.second $t@58@01)) 1)))
; [exec]
; apply acc(x.f, write) && x.f > w --* acc(x.f, write)
; [eval] x.f > w
(push) ; 4
(assert (not (> f@63@01 w@60@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> f@63@01 w@60@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; w := x.f
(declare-const w@64@01 Int)
(assert (=
  w@64@01
  ($SortWrappers.$SnapToInt (MWSF_apply mwsf@62@01 ($Snap.combine
    ($SortWrappers.IntTo$Snap f@63@01)
    $Snap.unit)))))
; [exec]
; package acc(x.f, write) && x.f > w --* acc(x.f, write) {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(assert (= ($Snap.second $t@65@01) $Snap.unit))
; [eval] x.f > w
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@65@01)) w@64@01))
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
; Create MagicWandSnapFunction for wand acc(x.f, write) && x.f > w --* acc(x.f, write)
(declare-const mwsf@66@01 $MWSF)
(assert (forall (($t@65@01 $Snap)) (!
  (= (MWSF_apply mwsf@66@01 $t@65@01) ($Snap.first $t@65@01))
  :pattern ((MWSF_apply mwsf@66@01 $t@65@01))
  :qid |quant-u-16|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@65@01 $Snap)) (!
  (= (MWSF_apply mwsf@66@01 $t@65@01) ($Snap.first $t@65@01))
  :pattern ((MWSF_apply mwsf@66@01 $t@65@01))
  :qid |quant-u-17|)))
(assert true)
; [exec]
; x.f := x.f + 1
; [eval] x.f + 1
(declare-const f@67@01 Int)
(assert (=
  f@67@01
  (+
    ($SortWrappers.$SnapToInt (MWSF_apply mwsf@62@01 ($Snap.combine
      ($SortWrappers.IntTo$Snap f@63@01)
      $Snap.unit)))
    1)))
; [exec]
; w := x.f
; [exec]
; exhale acc(x.f, write) && x.f > w --* acc(x.f, write)
(push) ; 5
(set-option :timeout 10)
(assert (not (= w@64@01 f@67@01)))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not (= w@64@01 f@67@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
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
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= w@64@01 f@67@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
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
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= w@64@01 f@67@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
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
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test12 ----------
(declare-const x@68@01 $Ref)
(declare-const y@69@01 $Ref)
(declare-const x@70@01 $Ref)
(declare-const y@71@01 $Ref)
(push) ; 1
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 ($Snap.combine ($Snap.first $t@72@01) ($Snap.second $t@72@01))))
; [eval] sum(x)
(push) ; 2
(assert (sum%precondition ($Snap.first $t@72@01) x@70@01))
(pop) ; 2
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@72@01) x@70@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var w: Int
(declare-const w@73@01 Int)
; [exec]
; w := sum(x)
; [eval] sum(x)
(push) ; 3
(pop) ; 3
; Joined path conditions
(declare-const w@74@01 Int)
(assert (= w@74@01 (sum ($Snap.first $t@72@01) x@70@01)))
; [exec]
; package acc(Pair(x), write) && sum(x) == w --*
; acc(y.f, write) && acc(y.g, write) {
;   apply acc(Pair(x), write) && sum(x) == w --* acc(y.f, write)
; }
(push) ; 3
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 ($Snap.combine ($Snap.first $t@75@01) ($Snap.second $t@75@01))))
(assert (= ($Snap.second $t@75@01) $Snap.unit))
; [eval] sum(x) == w
; [eval] sum(x)
(push) ; 4
(assert (sum%precondition ($Snap.first $t@75@01) x@70@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@75@01) x@70@01))
(assert (= (sum ($Snap.first $t@75@01) x@70@01) w@74@01))
; [exec]
; apply acc(Pair(x), write) && sum(x) == w --* acc(y.f, write)
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
(assert (not (= (sum ($Snap.first $t@72@01) x@70@01) w@74@01)))
(check-sat)
; unsat
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
; [eval] sum(x) == w
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (not (= y@71@01 $Ref.null)))
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
(pop) ; 3
(declare-const $t@76@01 $Snap)
(declare-const $t@77@01 $Snap)
; Create MagicWandSnapFunction for wand acc(Pair(x), write) && sum(x) == w --* acc(y.f, write) && acc(y.g, write)
(declare-const mwsf@78@01 $MWSF)
(assert (forall (($t@76@01 $Snap)) (!
  (= (MWSF_apply mwsf@78@01 $t@76@01) $t@77@01)
  :pattern ((MWSF_apply mwsf@78@01 $t@76@01))
  :qid |quant-u-18|)))
(pop) ; 2
(pop) ; 1
