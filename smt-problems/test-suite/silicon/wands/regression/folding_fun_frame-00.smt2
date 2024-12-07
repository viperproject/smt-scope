(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:35:24
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/folding_fun_frame.vpr
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
(declare-fun sum_rec ($Snap $Ref) Int)
(declare-fun sum_rec%limited ($Snap $Ref) Int)
(declare-fun sum_rec%stateless ($Ref) Bool)
(declare-fun sum_rec%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@2@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (ys@0@00 $Ref)) (!
  (= (sum_rec%limited s@$ ys@0@00) (sum_rec s@$ ys@0@00))
  :pattern ((sum_rec s@$ ys@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (ys@0@00 $Ref)) (!
  (sum_rec%stateless ys@0@00)
  :pattern ((sum_rec%limited s@$ ys@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (ys@0@00 $Ref)) (!
  (=>
    (sum_rec%precondition s@$ ys@0@00)
    (=
      (sum_rec s@$ ys@0@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)
          0
          (sum_rec%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((sum_rec s@$ ys@0@00))
  :pattern ((sum_rec%stateless ys@0@00) (List%trigger s@$ ys@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (ys@0@00 $Ref)) (!
  (=>
    (sum_rec%precondition s@$ ys@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (sum_rec%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((sum_rec s@$ ys@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- t01 ----------
(declare-const xs@0@01 $Ref)
(declare-const xs@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
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
; i := sum_rec(xs)
; [eval] sum_rec(xs)
(push) ; 3
(assert (sum_rec%precondition $t@2@01 xs@1@01))
(pop) ; 3
; Joined path conditions
(assert (sum_rec%precondition $t@2@01 xs@1@01))
(declare-const i@4@01 Int)
(assert (= i@4@01 (sum_rec $t@2@01 xs@1@01)))
; [exec]
; unfold acc(List(xs), write)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= xs@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
; [eval] ys.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 0 | First:(Second:($t@2@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:($t@2@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger $t@2@01 xs@1@01))
; [exec]
; package true --* acc(List(xs), write) && sum_rec(xs) == i {
;   fold acc(List(xs), write)
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [exec]
; fold acc(List(xs), write)
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
; [eval] ys.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 1 | First:(Second:($t@2@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:(Second:($t@2@01)) != Null]
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))) xs@1@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [eval] sum_rec(xs) == i
; [eval] sum_rec(xs)
(set-option :timeout 0)
(push) ; 6
(assert (sum_rec%precondition ($Snap.combine
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))) xs@1@01))
(pop) ; 6
; Joined path conditions
(assert (sum_rec%precondition ($Snap.combine
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))) xs@1@01))
(push) ; 6
(assert (not (=
  (sum_rec ($Snap.combine
    ($Snap.first $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@2@01))
      ($Snap.second ($Snap.second $t@2@01)))) xs@1@01)
  i@4@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (sum_rec ($Snap.combine
    ($Snap.first $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@2@01))
      ($Snap.second ($Snap.second $t@2@01)))) xs@1@01)
  i@4@01))
; Create MagicWandSnapFunction for wand true --* acc(List(xs), write) && sum_rec(xs) == i
(declare-const mwsf@6@01 $MWSF)
(assert (forall (($t@5@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@6@01 $t@5@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@2@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@2@01))
          ($Snap.second ($Snap.second $t@2@01))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
  :qid |quant-u-4|)))
(pop) ; 5
(pop) ; 4
(push) ; 4
(assert (forall (($t@5@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@6@01 $t@5@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@2@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@2@01))
          ($Snap.second ($Snap.second $t@2@01))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
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
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
