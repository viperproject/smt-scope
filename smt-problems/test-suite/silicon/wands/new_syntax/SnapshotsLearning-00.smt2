(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:25
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/new_syntax/SnapshotsLearning.vpr
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
(declare-fun get ($Snap $Ref) Int)
(declare-fun get%limited ($Snap $Ref) Int)
(declare-fun get%stateless ($Ref) Bool)
(declare-fun get%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Cell%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (get%limited s@$ x@0@00) (get s@$ x@0@00))
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (get%stateless x@0@00)
  :pattern ((get%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (get%precondition s@$ x@0@00)
    (= (get s@$ x@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test0 ----------
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
; inhale (true --* acc(x.f, write)) &&
;   (applying true --* acc(x.f, write) in
;     x.f == 0)
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] (applying true --* acc(x.f, write) in x.f == 0)
(push) ; 3
(assert (not (= x@1@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == 0
(pop) ; 3
; Joined path conditions
(assert (not (= x@1@01 $Ref.null)))
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@2@01)) $Snap.unit))
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply true --* acc(x.f, write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert x.f == 0
; [eval] x.f == 0
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const x@3@01 $Ref)
(declare-const x@4@01 $Ref)
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
; inhale (true --* acc(x.f, write) && (x.f == 0 ==> acc(x.g, write))) &&
;   (applying true --* acc(x.f, write) && (x.f == 0 ==> acc(x.g, write)) in
;     x.f == 0 ==> x.g == 0)
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] (applying true --* acc(x.f, write) && (x.f == 0 ==> acc(x.g, write)) in x.f == 0 ==> x.g == 0)
(push) ; 3
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))))
(assert (not (= x@4@01 $Ref.null)))
; [eval] x.f == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
    0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
  0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(First:($t@5@01)[_]) == 0 | live]
; [else-branch: 0 | First:(First:($t@5@01)[_]) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:(First:($t@5@01)[_]) == 0]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
  0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == 0 ==> x.g == 0
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
    0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(First:($t@5@01)[_]) == 0 | live]
; [else-branch: 1 | First:(First:($t@5@01)[_]) != 0 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 1 | First:(First:($t@5@01)[_]) == 0]
; [eval] x.g == 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 0 | First:(First:($t@5@01)[_]) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
    0)))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == 0 ==> x.g == 0
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(First:($t@5@01)[_]) == 0 | dead]
; [else-branch: 2 | First:(First:($t@5@01)[_]) != 0 | live]
(push) ; 6
; [else-branch: 2 | First:(First:($t@5@01)[_]) != 0]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_applying@6@01 Bool)
(assert (=>
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
    0)
  (=
    (as joined_applying@6@01  Bool)
    (=>
      (=
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
        0)
      (=
        ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
        0)))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
      0))
  (= (as joined_applying@6@01  Bool) true)))
; Joined path conditions
(assert (and
  (=
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)
    ($Snap.combine
      ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit))
      ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit))))
  (not (= x@4@01 $Ref.null))))
; Joined path conditions
(assert (and
  (=
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)
    ($Snap.combine
      ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit))
      ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit))))
  (not (= x@4@01 $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
      0))
  (and
    (not
      (=
        ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
        0))
    (=
      ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit))
      $Snap.unit))))
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
      0))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
    0)))
(assert (as joined_applying@6@01  Bool))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply true --* acc(x.f, write) && (x.f == 0 ==> acc(x.g, write))
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
    0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(First:($t@5@01)[_]) == 0 | live]
; [else-branch: 3 | First:(First:($t@5@01)[_]) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:(First:($t@5@01)[_]) == 0]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
  0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
    0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(First:($t@5@01)[_]) == 0 | live]
; [else-branch: 4 | First:(First:($t@5@01)[_]) != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(First:($t@5@01)[_]) == 0]
; [exec]
; assert x.g == 0
; [eval] x.g == 0
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
  0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
  0))
(pop) ; 4
; [eval] !(x.f == 0)
; [eval] x.f == 0
; [then-branch: 5 | First:(First:($t@5@01)[_]) != 0 | dead]
; [else-branch: 5 | First:(First:($t@5@01)[_]) == 0 | live]
(push) ; 4
; [else-branch: 5 | First:(First:($t@5@01)[_]) == 0]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 3 | First:(First:($t@5@01)[_]) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
    0)))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit))
  $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.f == 0
; [then-branch: 6 | First:(First:($t@5@01)[_]) == 0 | dead]
; [else-branch: 6 | First:(First:($t@5@01)[_]) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 6 | First:(First:($t@5@01)[_]) != 0]
(pop) ; 4
; [eval] !(x.f == 0)
; [eval] x.f == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@5@01)) $Snap.unit)))
  0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(First:($t@5@01)[_]) != 0 | live]
; [else-branch: 7 | First:(First:($t@5@01)[_]) == 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | First:(First:($t@5@01)[_]) != 0]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@7@01 $Ref)
(declare-const x@8@01 $Ref)
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
; inhale (true --* acc(Cell(x), write)) &&
;   (applying true --* acc(Cell(x), write) in
;     get(x) == 0)
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] (applying true --* acc(Cell(x), write) in get(x) == 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
(assert (get%precondition (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@9@01)) $Snap.unit) x@8@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@9@01)) $Snap.unit) x@8@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@9@01)) $Snap.unit) x@8@01))
(assert (=
  (get (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@9@01)) $Snap.unit) x@8@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply true --* acc(Cell(x), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; unfold acc(Cell(x), write)
(assert (not (= x@8@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Cell%trigger (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@9@01)) $Snap.unit) x@8@01))
; [exec]
; assert x.f == 0
; [eval] x.f == 0
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@9@01)) $Snap.unit))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first $t@9@01)) $Snap.unit))
  0))
(pop) ; 2
(pop) ; 1
