(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:22
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/new_syntax/SnapshotsBranching.vpr
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
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(assert (=
  ($Snap.second $t@3@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@01))
    ($Snap.second ($Snap.second $t@3@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@3@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@3@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@3@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@01)))) $Snap.unit))
; [eval] x.a == old(x.a)
; [eval] old(x.a)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@3@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01)))))
  $Snap.unit))
; [eval] x.b == old(x.b)
; [eval] old(x.b)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@2@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01)))))
  $Snap.unit))
; [eval] x.c == old(x.c)
; [eval] old(x.c)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@2@01)))))
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.a, write) --*
; acc(x.a, write) && (x.a == 0 ? acc(x.b, write) : acc(x.c, write)) {
; }
(push) ; 3
(declare-const $t@4@01 $Snap)
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
; [eval] x.a == 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt $t@4@01) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt $t@4@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | $t@4@01 == 0 | live]
; [else-branch: 0 | $t@4@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | $t@4@01 == 0]
(assert (= ($SortWrappers.$SnapToInt $t@4@01) 0))
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
; Create MagicWandSnapFunction for wand acc(x.a, write) --* acc(x.a, write) && (x.a == 0 ? acc(x.b, write) : acc(x.c, write))
(declare-const mwsf@5@01 $MWSF)
(assert (forall (($t@4@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@5@01 $t@4@01)
    ($Snap.combine $t@4@01 ($Snap.first ($Snap.second $t@2@01))))
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-0|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 0 | $t@4@01 != 0]
(assert (not (= ($SortWrappers.$SnapToInt $t@4@01) 0)))
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
; Create MagicWandSnapFunction for wand acc(x.a, write) --* acc(x.a, write) && (x.a == 0 ? acc(x.b, write) : acc(x.c, write))
(declare-const mwsf@6@01 $MWSF)
(assert (forall (($t@4@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@6@01 $t@4@01)
    ($Snap.combine $t@4@01 ($Snap.second ($Snap.second $t@2@01))))
  :pattern ((MWSF_apply mwsf@6@01 $t@4@01))
  :qid |quant-u-2|)))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (= ($SortWrappers.$SnapToInt $t@4@01) 0))
(assert (forall (($t@4@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@5@01 $t@4@01)
    ($Snap.combine $t@4@01 ($Snap.first ($Snap.second $t@2@01))))
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-1|)))
(assert true)
; [exec]
; apply acc(x.a, write) --*
;   acc(x.a, write) && (x.a == 0 ? acc(x.b, write) : acc(x.c, write))
(assert (=
  (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01)))
    ($Snap.second (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))))
; [eval] x.a == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))
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
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))
  0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(mwsf@5@01[First:($t@2@01)]) == 0 | live]
; [else-branch: 1 | First:(mwsf@5@01[First:($t@2@01)]) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(mwsf@5@01[First:($t@2@01)]) == 0]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))
  0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.a == old(x.a)
; [eval] old(x.a)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))))
; [eval] x.b == old(x.b)
; [eval] old(x.b)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@2@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@2@01)))))
; [eval] x.c == old(x.c)
; [eval] old(x.c)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | First:(mwsf@5@01[First:($t@2@01)]) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))
    0)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@2@01)))
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@5@01 ($Snap.first $t@2@01))))))
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (not (= ($SortWrappers.$SnapToInt $t@4@01) 0)))
(assert (forall (($t@4@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@6@01 $t@4@01)
    ($Snap.combine $t@4@01 ($Snap.second ($Snap.second $t@2@01))))
  :pattern ((MWSF_apply mwsf@6@01 $t@4@01))
  :qid |quant-u-3|)))
(assert true)
; [exec]
; apply acc(x.a, write) --*
;   acc(x.a, write) && (x.a == 0 ? acc(x.b, write) : acc(x.c, write))
(assert (=
  (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01)))
    ($Snap.second (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))))
; [eval] x.a == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))
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
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))
  0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(mwsf@6@01[First:($t@2@01)]) == 0 | live]
; [else-branch: 2 | First:(mwsf@6@01[First:($t@2@01)]) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(mwsf@6@01[First:($t@2@01)]) == 0]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))
  0))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@2@01)))
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))))
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(push) ; 4
; [else-branch: 2 | First:(mwsf@6@01[First:($t@2@01)]) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))
    0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.a == old(x.a)
; [eval] old(x.a)
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@2@01))))
; [eval] x.b == old(x.b)
; [eval] old(x.b)
; [eval] x.c == old(x.c)
; [eval] old(x.c)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@2@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@6@01 ($Snap.first $t@2@01))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@2@01)))))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const x@7@01 $Ref)
(declare-const x@8@01 $Ref)
(push) ; 1
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (not (= x@8@01 $Ref.null)))
(assert (=
  ($Snap.second $t@9@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@01))
    ($Snap.second ($Snap.second $t@9@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@10@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@10@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@10@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@10@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@10@01))))
  $Snap.unit))
; [eval] x.a == old(x.a)
; [eval] old(x.a)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@10@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))
  $Snap.unit))
; [eval] x.b == old(x.b)
; [eval] old(x.b)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@10@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@9@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))
  $Snap.unit))
; [eval] x.c == old(x.c)
; [eval] old(x.c)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@10@01))))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@9@01)))))
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.a, write) --*
; acc(x.a, write) &&
; (x.a == 0 ? true --* acc(x.b, write) : true --* acc(x.c, write)) {
;   if (x.a == 0) {
;     package true --* acc(x.b, write) {
;     }
;   } else {
;     package true --* acc(x.c, write) {
;     }}
; }
(push) ; 3
(declare-const $t@11@01 $Snap)
; [eval] x.a == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt $t@11@01) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt $t@11@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | $t@11@01 == 0 | live]
; [else-branch: 3 | $t@11@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | $t@11@01 == 0]
(assert (= ($SortWrappers.$SnapToInt $t@11@01) 0))
; [exec]
; package true --* acc(x.b, write) {
; }
(push) ; 5
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
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
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(x.b, write)
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) ($Snap.first ($Snap.second $t@9@01)))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-4|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) ($Snap.first ($Snap.second $t@9@01)))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-5|)))
(assert true)
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
; [eval] x.a == 0
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt $t@11@01) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | $t@11@01 == 0 | live]
; [else-branch: 4 | $t@11@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | $t@11@01 == 0]
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.a, write) --* acc(x.a, write) && (x.a == 0 ? true --* acc(x.b, write) : true --* acc(x.c, write))
(declare-const mwsf@14@01 $MWSF)
(assert (forall (($t@11@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@11@01)
    ($Snap.combine $t@11@01 ($SortWrappers.$MWSFTo$Snap mwsf@13@01)))
  :pattern ((MWSF_apply mwsf@14@01 $t@11@01))
  :qid |quant-u-6|)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | $t@11@01 != 0]
(assert (not (= ($SortWrappers.$SnapToInt $t@11@01) 0)))
(pop) ; 4
; [eval] !(x.a == 0)
; [eval] x.a == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt $t@11@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt $t@11@01) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | $t@11@01 != 0 | live]
; [else-branch: 5 | $t@11@01 == 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | $t@11@01 != 0]
(assert (not (= ($SortWrappers.$SnapToInt $t@11@01) 0)))
; [exec]
; package true --* acc(x.c, write) {
; }
(push) ; 5
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
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
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(x.c, write)
(declare-const mwsf@16@01 $MWSF)
(assert (forall (($t@15@01 $Snap)) (!
  (= (MWSF_apply mwsf@16@01 $t@15@01) ($Snap.second ($Snap.second $t@9@01)))
  :pattern ((MWSF_apply mwsf@16@01 $t@15@01))
  :qid |quant-u-8|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
(assert (forall (($t@15@01 $Snap)) (!
  (= (MWSF_apply mwsf@16@01 $t@15@01) ($Snap.second ($Snap.second $t@9@01)))
  :pattern ((MWSF_apply mwsf@16@01 $t@15@01))
  :qid |quant-u-9|)))
(assert true)
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
; [eval] x.a == 0
; [then-branch: 6 | $t@11@01 == 0 | dead]
; [else-branch: 6 | $t@11@01 != 0 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 6 | $t@11@01 != 0]
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.a, write) --* acc(x.a, write) && (x.a == 0 ? true --* acc(x.b, write) : true --* acc(x.c, write))
(declare-const mwsf@17@01 $MWSF)
(assert (forall (($t@11@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@17@01 $t@11@01)
    ($Snap.combine $t@11@01 ($SortWrappers.$MWSFTo$Snap mwsf@16@01)))
  :pattern ((MWSF_apply mwsf@17@01 $t@11@01))
  :qid |quant-u-10|)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | $t@11@01 == 0]
(assert (= ($SortWrappers.$SnapToInt $t@11@01) 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (= ($SortWrappers.$SnapToInt $t@11@01) 0))
(assert (forall (($t@11@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@11@01)
    ($Snap.combine $t@11@01 ($SortWrappers.$MWSFTo$Snap mwsf@13@01)))
  :pattern ((MWSF_apply mwsf@14@01 $t@11@01))
  :qid |quant-u-7|)))
(assert true)
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) ($Snap.first ($Snap.second $t@9@01)))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-4|)))
; [exec]
; apply acc(x.a, write) --*
;   acc(x.a, write) &&
;   (x.a == 0 ? true --* acc(x.b, write) : true --* acc(x.c, write))
(assert (=
  (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01)))
    ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))))
; [eval] x.a == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))
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
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))
  0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(mwsf@14@01[First:($t@9@01)]) == 0 | live]
; [else-branch: 7 | First:(mwsf@14@01[First:($t@9@01)]) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | First:(mwsf@14@01[First:($t@9@01)]) == 0]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))
  0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.a == 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))
    0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(mwsf@14@01[First:($t@9@01)]) == 0 | live]
; [else-branch: 8 | First:(mwsf@14@01[First:($t@9@01)]) != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | First:(mwsf@14@01[First:($t@9@01)]) == 0]
; [exec]
; apply true --* acc(x.b, write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.a == old(x.a)
; [eval] old(x.a)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01))))
; [eval] x.b == old(x.b)
; [eval] old(x.b)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01)))) $Snap.unit))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@9@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01)))) $Snap.unit))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@9@01)))))
; [eval] x.c == old(x.c)
; [eval] old(x.c)
(pop) ; 5
; [eval] !(x.a == 0)
; [eval] x.a == 0
; [then-branch: 9 | First:(mwsf@14@01[First:($t@9@01)]) != 0 | dead]
; [else-branch: 9 | First:(mwsf@14@01[First:($t@9@01)]) == 0 | live]
(push) ; 5
; [else-branch: 9 | First:(mwsf@14@01[First:($t@9@01)]) == 0]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 7 | First:(mwsf@14@01[First:($t@9@01)]) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))
    0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.a == 0
; [then-branch: 10 | First:(mwsf@14@01[First:($t@9@01)]) == 0 | dead]
; [else-branch: 10 | First:(mwsf@14@01[First:($t@9@01)]) != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 10 | First:(mwsf@14@01[First:($t@9@01)]) != 0]
(pop) ; 5
; [eval] !(x.a == 0)
; [eval] x.a == 0
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01))))
  0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(mwsf@14@01[First:($t@9@01)]) != 0 | live]
; [else-branch: 11 | First:(mwsf@14@01[First:($t@9@01)]) == 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | First:(mwsf@14@01[First:($t@9@01)]) != 0]
; [exec]
; apply true --* acc(x.c, write)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@9@01)))
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@14@01 ($Snap.first $t@9@01)))) $Snap.unit))))
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (not (= ($SortWrappers.$SnapToInt $t@11@01) 0)))
(assert (forall (($t@11@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@17@01 $t@11@01)
    ($Snap.combine $t@11@01 ($SortWrappers.$MWSFTo$Snap mwsf@16@01)))
  :pattern ((MWSF_apply mwsf@17@01 $t@11@01))
  :qid |quant-u-11|)))
(assert true)
(assert (forall (($t@15@01 $Snap)) (!
  (= (MWSF_apply mwsf@16@01 $t@15@01) ($Snap.second ($Snap.second $t@9@01)))
  :pattern ((MWSF_apply mwsf@16@01 $t@15@01))
  :qid |quant-u-8|)))
; [exec]
; apply acc(x.a, write) --*
;   acc(x.a, write) &&
;   (x.a == 0 ? true --* acc(x.b, write) : true --* acc(x.c, write))
(assert (=
  (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01)))
    ($Snap.second (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))))
; [eval] x.a == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))
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
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))
  0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(mwsf@17@01[First:($t@9@01)]) == 0 | live]
; [else-branch: 12 | First:(mwsf@17@01[First:($t@9@01)]) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | First:(mwsf@17@01[First:($t@9@01)]) == 0]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))
  0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.a == 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))
    0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(mwsf@17@01[First:($t@9@01)]) == 0 | live]
; [else-branch: 13 | First:(mwsf@17@01[First:($t@9@01)]) != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | First:(mwsf@17@01[First:($t@9@01)]) == 0]
; [exec]
; apply true --* acc(x.b, write)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@9@01)))
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01)))) $Snap.unit))))
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 5
; [eval] !(x.a == 0)
; [eval] x.a == 0
; [then-branch: 14 | First:(mwsf@17@01[First:($t@9@01)]) != 0 | dead]
; [else-branch: 14 | First:(mwsf@17@01[First:($t@9@01)]) == 0 | live]
(push) ; 5
; [else-branch: 14 | First:(mwsf@17@01[First:($t@9@01)]) == 0]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 12 | First:(mwsf@17@01[First:($t@9@01)]) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))
    0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.a == 0
; [then-branch: 15 | First:(mwsf@17@01[First:($t@9@01)]) == 0 | dead]
; [else-branch: 15 | First:(mwsf@17@01[First:($t@9@01)]) != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 15 | First:(mwsf@17@01[First:($t@9@01)]) != 0]
(pop) ; 5
; [eval] !(x.a == 0)
; [eval] x.a == 0
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))
  0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(mwsf@17@01[First:($t@9@01)]) != 0 | live]
; [else-branch: 16 | First:(mwsf@17@01[First:($t@9@01)]) == 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | First:(mwsf@17@01[First:($t@9@01)]) != 0]
; [exec]
; apply true --* acc(x.c, write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x.a == old(x.a)
; [eval] old(x.a)
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01))))
; [eval] x.b == old(x.b)
; [eval] old(x.b)
; [eval] x.c == old(x.c)
; [eval] old(x.c)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01)))) $Snap.unit))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@9@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@17@01 ($Snap.first $t@9@01)))) $Snap.unit))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@9@01)))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
