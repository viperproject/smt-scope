(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:33:29
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/examples_paper/list_insert_noseq.vpr
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
(declare-fun head ($Snap $Ref) Int)
(declare-fun head%limited ($Snap $Ref) Int)
(declare-fun head%stateless ($Ref) Bool)
(declare-fun head%precondition ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (= (head%limited s@$ xs@0@00) (head s@$ xs@0@00))
  :pattern ((head s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (head%stateless xs@0@00)
  :pattern ((head%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (=>
    (head%precondition s@$ xs@0@00)
    (= (head s@$ xs@0@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((head s@$ xs@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  true
  :pattern ((head s@$ xs@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- insert ----------
(declare-const xs@0@01 $Ref)
(declare-const x@1@01 Int)
(declare-const i@2@01 Int)
(declare-const xs@3@01 $Ref)
(declare-const x@4@01 Int)
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] head(xs) < x
; [eval] head(xs)
(push) ; 2
(assert (head%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 2
; Joined path conditions
(assert (head%precondition ($Snap.first $t@6@01) xs@3@01))
(assert (< (head ($Snap.first $t@6@01) xs@3@01) x@4@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; var crt: Ref
(declare-const crt@8@01 $Ref)
; [exec]
; var nxt: Ref
(declare-const nxt@9@01 $Ref)
; [exec]
; var node: Ref
(declare-const node@10@01 $Ref)
; [exec]
; i := 0
; [exec]
; unfold acc(List(xs), write)
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(assert (not (= xs@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 0 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first $t@6@01) xs@3@01))
; [exec]
; crt := xs
; [exec]
; nxt := xs.next
(declare-const nxt@11@01 $Ref)
(assert (=
  nxt@11@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))))
; [exec]
; package acc(List(crt), write) --* acc(List(xs), write) {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@12@01 $Snap)
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
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write)
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) $t@12@01)
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-4|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) $t@12@01)
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-5|)))
(assert true)
(declare-const oldCrt@14@01 $Ref)
(declare-const prev@15@01 $Ref)
(declare-const crt@16@01 $Ref)
(declare-const nxt@17@01 $Ref)
(declare-const i@18@01 Int)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (not (= crt@16@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] nxt == crt.next
(assert (= nxt@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
; [eval] nxt != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= nxt@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= nxt@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | nxt@17@01 != Null | live]
; [else-branch: 1 | nxt@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 1 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  $Snap.unit))
(pop) ; 6
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
; [eval] nxt == crt.next
; [eval] nxt != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= nxt@11@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= nxt@11@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | nxt@11@01 != Null | live]
; [else-branch: 2 | nxt@11@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | nxt@11@01 != Null]
(assert (not (= nxt@11@01 $Ref.null)))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  nxt@11@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 7
(assert (not (= nxt@17@01 $Ref.null)))
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (not (= crt@16@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
(assert (= nxt@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 3 | nxt@17@01 == Null | live]
; [else-branch: 3 | nxt@17@01 != Null | live]
(push) ; 10
; [then-branch: 3 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | nxt@17@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
(pop) ; 11
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@17@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)))
(assert (or (not (= nxt@17@01 $Ref.null)) (= nxt@17@01 $Ref.null)))
(pop) ; 8
(push) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 4 | nxt@17@01 == Null | live]
; [else-branch: 4 | nxt@17@01 != Null | live]
(push) ; 10
; [then-branch: 4 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(pop) ; 10
(push) ; 10
; [else-branch: 4 | nxt@17@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
(pop) ; 11
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@17@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)))
(assert (or (not (= nxt@17@01 $Ref.null)) (= nxt@17@01 $Ref.null)))
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 5 | nxt@17@01 == Null | live]
; [else-branch: 5 | nxt@17@01 != Null | live]
(push) ; 9
; [then-branch: 5 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(pop) ; 9
(push) ; 9
; [else-branch: 5 | nxt@17@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
(pop) ; 10
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@17@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)))
(assert (or (not (= nxt@17@01 $Ref.null)) (= nxt@17@01 $Ref.null)))
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
      x@4@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (not (= nxt@17@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
    x@4@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | nxt@17@01 != Null && head(First:(Second:(Second:(Second:($t@19@01)))), nxt@17@01) < x@4@01 | live]
; [else-branch: 6 | !(nxt@17@01 != Null && head(First:(Second:(Second:(Second:($t@19@01)))), nxt@17@01) < x@4@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 6 | nxt@17@01 != Null && head(First:(Second:(Second:(Second:($t@19@01)))), nxt@17@01) < x@4@01]
(assert (and
  (not (= nxt@17@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
    x@4@01)))
; [exec]
; var oldCrt: Ref
(declare-const oldCrt@20@01 $Ref)
; [exec]
; var prev: Ref
(declare-const prev@21@01 $Ref)
; [exec]
; oldCrt := crt
; [exec]
; prev := crt
; [exec]
; unfold acc(List(nxt), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 nxt@17@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 nxt@17@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(First:(Second:(Second:(Second:($t@19@01)))))) != Null | live]
; [else-branch: 7 | First:(Second:(First:(Second:(Second:(Second:($t@19@01)))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 7 | First:(Second:(First:(Second:(Second:(Second:($t@19@01)))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
; [exec]
; crt := nxt
; [exec]
; nxt := nxt.next
(declare-const nxt@22@01 $Ref)
(assert (=
  nxt@22@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@23@01 Int)
(assert (= i@23@01 (+ i@18@01 1)))
; [exec]
; package acc(List(crt), write) --* acc(List(xs), write) {
;   fold acc(List(prev), write)
;   apply acc(List(oldCrt), write) --* acc(List(xs), write)
; }
(set-option :timeout 0)
(push) ; 10
(declare-const $t@24@01 $Snap)
; [exec]
; fold acc(List(prev), write)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:($t@19@01)) != Null | live]
; [else-branch: 8 | First:(Second:($t@19@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 8 | First:(Second:($t@19@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01))) $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@19@01)) $t@24@01)) crt@16@01))
; [exec]
; apply acc(List(oldCrt), write) --* acc(List(xs), write)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write)
(declare-const mwsf@25@01 $MWSF)
(assert (forall (($t@24@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@25@01 $t@24@01)
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))) ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine ($Snap.first ($Snap.second $t@19@01)) $t@24@01))))
  :pattern ((MWSF_apply mwsf@25@01 $t@24@01))
  :qid |quant-u-6|)))
(pop) ; 11
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01)))
      $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
      $Ref.null))
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
      x@4@01))
  (not (= nxt@11@01 $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (forall (($t@24@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@25@01 $t@24@01)
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))) ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine ($Snap.first ($Snap.second $t@19@01)) $t@24@01))))
  :pattern ((MWSF_apply mwsf@25@01 $t@24@01))
  :qid |quant-u-7|)))
(assert true)
; Loop head block: Re-establish invariant
; [eval] nxt == crt.next
; [eval] nxt != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= nxt@22@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (= nxt@22@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | nxt@22@01 != Null | live]
; [else-branch: 9 | nxt@22@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 9 | nxt@22@01 != Null]
(assert (not (= nxt@22@01 $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  nxt@22@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 7 | First:(Second:(First:(Second:(Second:(Second:($t@19@01)))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
; [exec]
; crt := nxt
; [exec]
; nxt := nxt.next
(declare-const nxt@26@01 $Ref)
(assert (=
  nxt@26@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@27@01 Int)
(assert (= i@27@01 (+ i@18@01 1)))
; [exec]
; package acc(List(crt), write) --* acc(List(xs), write) {
;   fold acc(List(prev), write)
;   apply acc(List(oldCrt), write) --* acc(List(xs), write)
; }
(set-option :timeout 0)
(push) ; 10
(declare-const $t@28@01 $Snap)
; [exec]
; fold acc(List(prev), write)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:($t@19@01)) != Null | live]
; [else-branch: 10 | First:(Second:($t@19@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 10 | First:(Second:($t@19@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01))) $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@19@01)) $t@28@01)) crt@16@01))
; [exec]
; apply acc(List(oldCrt), write) --* acc(List(xs), write)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(assert (not (= nxt@17@01 $Ref.null)))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write)
(declare-const mwsf@29@01 $MWSF)
(assert (forall (($t@28@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@29@01 $t@28@01)
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))) ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine ($Snap.first ($Snap.second $t@19@01)) $t@28@01))))
  :pattern ((MWSF_apply mwsf@29@01 $t@28@01))
  :qid |quant-u-8|)))
(pop) ; 11
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01)))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
    $Ref.null)
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
      x@4@01))
  (not (= nxt@11@01 $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (forall (($t@28@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@29@01 $t@28@01)
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))) ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine ($Snap.first ($Snap.second $t@19@01)) $t@28@01))))
  :pattern ((MWSF_apply mwsf@29@01 $t@28@01))
  :qid |quant-u-9|)))
(assert true)
; Loop head block: Re-establish invariant
; [eval] nxt == crt.next
; [eval] nxt != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= nxt@26@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | nxt@26@01 != Null | dead]
; [else-branch: 11 | nxt@26@01 == Null | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 11 | nxt@26@01 == Null]
(assert (= nxt@26@01 $Ref.null))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 6 | !(nxt@17@01 != Null && head(First:(Second:(Second:(Second:($t@19@01)))), nxt@17@01) < x@4@01)]
(assert (not
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
      x@4@01))))
(pop) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 12 | nxt@17@01 == Null | live]
; [else-branch: 12 | nxt@17@01 != Null | live]
(push) ; 9
; [then-branch: 12 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(pop) ; 9
(push) ; 9
; [else-branch: 12 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
(pop) ; 10
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@17@01 $Ref.null))
  (and
    (not (= nxt@17@01 $Ref.null))
    (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (not (= nxt@17@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
    x@4@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
      x@4@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(nxt@17@01 != Null && head(First:(Second:(Second:(Second:($t@19@01)))), nxt@17@01) < x@4@01) | live]
; [else-branch: 13 | nxt@17@01 != Null && head(First:(Second:(Second:(Second:($t@19@01)))), nxt@17@01) < x@4@01 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 13 | !(nxt@17@01 != Null && head(First:(Second:(Second:(Second:($t@19@01)))), nxt@17@01) < x@4@01)]
(assert (not
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
      x@4@01))))
; [exec]
; node := new(val, next)
(declare-const node@30@01 $Ref)
(assert (not (= node@30@01 $Ref.null)))
(declare-const val@31@01 Int)
(declare-const next@32@01 $Ref)
(assert (not (= node@30@01 crt@16@01)))
(assert (not (= node@30@01 nxt@17@01)))
(assert (not (= node@30@01 oldCrt@14@01)))
(assert (not
  (=
    node@30@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01))))))
(assert (not (= node@30@01 xs@3@01)))
(assert (not (= node@30@01 node@10@01)))
(assert (not (= node@30@01 prev@15@01)))
; [exec]
; node.val := x
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 node@30@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; node.next := nxt
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 node@30@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(List(node), write)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= nxt@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= nxt@17@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | nxt@17@01 != Null | live]
; [else-branch: 14 | nxt@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 14 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
(assert (List%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap nxt@17@01)
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) node@30@01))
; [exec]
; crt.next := node
; [exec]
; fold acc(List(crt), write)
; [eval] xs.next != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= node@30@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | node@30@01 != Null | live]
; [else-branch: 15 | node@30@01 == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 15 | node@30@01 != Null]
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@30@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap nxt@17@01)
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))) crt@16@01))
; [exec]
; apply acc(List(crt), write) --* acc(List(xs), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 13 | nxt@17@01 != Null && head(First:(Second:(Second:(Second:($t@19@01)))), nxt@17@01) < x@4@01]
(assert (and
  (not (= nxt@17@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))) nxt@17@01)
    x@4@01)))
(pop) ; 8
(pop) ; 7
(push) ; 7
(assert (= nxt@17@01 $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  $Snap.unit))
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (not (= crt@16@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
(assert (= nxt@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 16 | nxt@17@01 == Null | live]
; [else-branch: 16 | nxt@17@01 != Null | live]
(push) ; 10
; [then-branch: 16 | nxt@17@01 == Null]
(pop) ; 10
(push) ; 10
; [else-branch: 16 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(check-sat)
; unsat
(pop) ; 11
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
(push) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 17 | nxt@17@01 == Null | live]
; [else-branch: 17 | nxt@17@01 != Null | live]
(push) ; 10
; [then-branch: 17 | nxt@17@01 == Null]
(pop) ; 10
(push) ; 10
; [else-branch: 17 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(check-sat)
; unsat
(pop) ; 11
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 18 | nxt@17@01 == Null | live]
; [else-branch: 18 | nxt@17@01 != Null | live]
(push) ; 9
; [then-branch: 18 | nxt@17@01 == Null]
(pop) ; 9
(push) ; 9
; [else-branch: 18 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [then-branch: 19 | nxt@17@01 != Null | dead]
; [else-branch: 19 | nxt@17@01 == Null | live]
(push) ; 8
; [else-branch: 19 | nxt@17@01 == Null]
(pop) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 20 | nxt@17@01 == Null | live]
; [else-branch: 20 | nxt@17@01 != Null | live]
(push) ; 9
; [then-branch: 20 | nxt@17@01 == Null]
(pop) ; 9
(push) ; 9
; [else-branch: 20 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= nxt@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | nxt@17@01 == Null | live]
; [else-branch: 21 | nxt@17@01 != Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 21 | nxt@17@01 == Null]
; [exec]
; node := new(val, next)
(declare-const node@33@01 $Ref)
(assert (not (= node@33@01 $Ref.null)))
(declare-const val@34@01 Int)
(declare-const next@35@01 $Ref)
(assert (not (= node@33@01 crt@16@01)))
(assert (not (= node@33@01 nxt@17@01)))
(assert (not (= node@33@01 oldCrt@14@01)))
(assert (not
  (=
    node@33@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@19@01))))))
(assert (not (= node@33@01 xs@3@01)))
(assert (not (= node@33@01 node@10@01)))
(assert (not (= node@33@01 prev@15@01)))
; [exec]
; node.val := x
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 node@33@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; node.next := nxt
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 node@33@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(List(node), write)
; [eval] xs.next != null
; [then-branch: 22 | nxt@17@01 != Null | dead]
; [else-branch: 22 | nxt@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 22 | nxt@17@01 == Null]
(assert (List%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)) node@33@01))
; [exec]
; crt.next := node
; [exec]
; fold acc(List(crt), write)
; [eval] xs.next != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= node@33@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | node@33@01 != Null | live]
; [else-branch: 23 | node@33@01 == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 23 | node@33@01 != Null]
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@33@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))) crt@16@01))
; [exec]
; apply acc(List(crt), write) --* acc(List(xs), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@6@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first $t@6@01) xs@3@01))
; [exec]
; crt := xs
; [exec]
; nxt := xs.next
(declare-const nxt@36@01 $Ref)
(assert (=
  nxt@36@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))))
; [exec]
; package acc(List(crt), write) --* acc(List(xs), write) {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@37@01 $Snap)
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
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write)
(declare-const mwsf@38@01 $MWSF)
(assert (forall (($t@37@01 $Snap)) (!
  (= (MWSF_apply mwsf@38@01 $t@37@01) $t@37@01)
  :pattern ((MWSF_apply mwsf@38@01 $t@37@01))
  :qid |quant-u-10|)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@37@01 $Snap)) (!
  (= (MWSF_apply mwsf@38@01 $t@37@01) $t@37@01)
  :pattern ((MWSF_apply mwsf@38@01 $t@37@01))
  :qid |quant-u-11|)))
(assert true)
(declare-const oldCrt@39@01 $Ref)
(declare-const prev@40@01 $Ref)
(declare-const crt@41@01 $Ref)
(declare-const nxt@42@01 $Ref)
(declare-const i@43@01 Int)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (not (= crt@41@01 $Ref.null)))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@44@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@44@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@44@01))) $Snap.unit))
; [eval] nxt == crt.next
(assert (= nxt@42@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@44@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
; [eval] nxt != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= nxt@42@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= nxt@42@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | nxt@42@01 != Null | live]
; [else-branch: 24 | nxt@42@01 == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 24 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | nxt@42@01 == Null]
(assert (= nxt@42@01 $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  $Snap.unit))
(pop) ; 6
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
; [eval] nxt == crt.next
; [eval] nxt != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= nxt@36@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | nxt@36@01 != Null | dead]
; [else-branch: 25 | nxt@36@01 == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 25 | nxt@36@01 == Null]
(assert (= nxt@36@01 $Ref.null))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
(assert (not (= nxt@42@01 $Ref.null)))
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (not (= crt@41@01 $Ref.null)))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@44@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@44@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@44@01))) $Snap.unit))
(assert (= nxt@42@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@44@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 26 | nxt@42@01 == Null | live]
; [else-branch: 26 | nxt@42@01 != Null | live]
(push) ; 10
; [then-branch: 26 | nxt@42@01 == Null]
(assert (= nxt@42@01 $Ref.null))
(pop) ; 10
(push) ; 10
; [else-branch: 26 | nxt@42@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
(pop) ; 11
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@42@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)))
(assert (or (not (= nxt@42@01 $Ref.null)) (= nxt@42@01 $Ref.null)))
(pop) ; 8
(push) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 27 | nxt@42@01 == Null | live]
; [else-branch: 27 | nxt@42@01 != Null | live]
(push) ; 10
; [then-branch: 27 | nxt@42@01 == Null]
(assert (= nxt@42@01 $Ref.null))
(pop) ; 10
(push) ; 10
; [else-branch: 27 | nxt@42@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
(pop) ; 11
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@42@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)))
(assert (or (not (= nxt@42@01 $Ref.null)) (= nxt@42@01 $Ref.null)))
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 28 | nxt@42@01 == Null | live]
; [else-branch: 28 | nxt@42@01 != Null | live]
(push) ; 9
; [then-branch: 28 | nxt@42@01 == Null]
(assert (= nxt@42@01 $Ref.null))
(pop) ; 9
(push) ; 9
; [else-branch: 28 | nxt@42@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
(pop) ; 10
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@42@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)))
(assert (or (not (= nxt@42@01 $Ref.null)) (= nxt@42@01 $Ref.null)))
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (and
    (not (= nxt@42@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
      x@4@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (not (= nxt@42@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
    x@4@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | nxt@42@01 != Null && head(First:(Second:(Second:(Second:($t@44@01)))), nxt@42@01) < x@4@01 | live]
; [else-branch: 29 | !(nxt@42@01 != Null && head(First:(Second:(Second:(Second:($t@44@01)))), nxt@42@01) < x@4@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 29 | nxt@42@01 != Null && head(First:(Second:(Second:(Second:($t@44@01)))), nxt@42@01) < x@4@01]
(assert (and
  (not (= nxt@42@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
    x@4@01)))
; [exec]
; var oldCrt: Ref
(declare-const oldCrt@45@01 $Ref)
; [exec]
; var prev: Ref
(declare-const prev@46@01 $Ref)
; [exec]
; oldCrt := crt
; [exec]
; prev := crt
; [exec]
; unfold acc(List(nxt), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@41@01 nxt@42@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@41@01 nxt@42@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | First:(Second:(First:(Second:(Second:(Second:($t@44@01)))))) != Null | live]
; [else-branch: 30 | First:(Second:(First:(Second:(Second:(Second:($t@44@01)))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 30 | First:(Second:(First:(Second:(Second:(Second:($t@44@01)))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
; [exec]
; crt := nxt
; [exec]
; nxt := nxt.next
(declare-const nxt@47@01 $Ref)
(assert (=
  nxt@47@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@48@01 Int)
(assert (= i@48@01 (+ i@43@01 1)))
; [exec]
; package acc(List(crt), write) --* acc(List(xs), write) {
;   fold acc(List(prev), write)
;   apply acc(List(oldCrt), write) --* acc(List(xs), write)
; }
(set-option :timeout 0)
(push) ; 10
(declare-const $t@49@01 $Snap)
; [exec]
; fold acc(List(prev), write)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | First:(Second:($t@44@01)) != Null | live]
; [else-branch: 31 | First:(Second:($t@44@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 31 | First:(Second:($t@44@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))) $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@44@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@44@01)) $t@49@01)) crt@41@01))
; [exec]
; apply acc(List(oldCrt), write) --* acc(List(xs), write)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write)
(declare-const mwsf@50@01 $MWSF)
(assert (forall (($t@49@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@50@01 $t@49@01)
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))) ($Snap.combine
      ($Snap.first $t@44@01)
      ($Snap.combine ($Snap.first ($Snap.second $t@44@01)) $t@49@01))))
  :pattern ((MWSF_apply mwsf@50@01 $t@49@01))
  :qid |quant-u-12|)))
(pop) ; 11
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01)))
      $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
      $Ref.null))
  (and
    (not (= nxt@42@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
      x@4@01))
  (= nxt@36@01 $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (forall (($t@49@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@50@01 $t@49@01)
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))) ($Snap.combine
      ($Snap.first $t@44@01)
      ($Snap.combine ($Snap.first ($Snap.second $t@44@01)) $t@49@01))))
  :pattern ((MWSF_apply mwsf@50@01 $t@49@01))
  :qid |quant-u-13|)))
(assert true)
; Loop head block: Re-establish invariant
; [eval] nxt == crt.next
; [eval] nxt != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= nxt@47@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (= nxt@47@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | nxt@47@01 != Null | live]
; [else-branch: 32 | nxt@47@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 32 | nxt@47@01 != Null]
(assert (not (= nxt@47@01 $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  nxt@47@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 30 | First:(Second:(First:(Second:(Second:(Second:($t@44@01)))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
; [exec]
; crt := nxt
; [exec]
; nxt := nxt.next
(declare-const nxt@51@01 $Ref)
(assert (=
  nxt@51@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@52@01 Int)
(assert (= i@52@01 (+ i@43@01 1)))
; [exec]
; package acc(List(crt), write) --* acc(List(xs), write) {
;   fold acc(List(prev), write)
;   apply acc(List(oldCrt), write) --* acc(List(xs), write)
; }
(set-option :timeout 0)
(push) ; 10
(declare-const $t@53@01 $Snap)
; [exec]
; fold acc(List(prev), write)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | First:(Second:($t@44@01)) != Null | live]
; [else-branch: 33 | First:(Second:($t@44@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 33 | First:(Second:($t@44@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))) $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@44@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@44@01)) $t@53@01)) crt@41@01))
; [exec]
; apply acc(List(oldCrt), write) --* acc(List(xs), write)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(assert (not (= nxt@42@01 $Ref.null)))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write)
(declare-const mwsf@54@01 $MWSF)
(assert (forall (($t@53@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@54@01 $t@53@01)
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))) ($Snap.combine
      ($Snap.first $t@44@01)
      ($Snap.combine ($Snap.first ($Snap.second $t@44@01)) $t@53@01))))
  :pattern ((MWSF_apply mwsf@54@01 $t@53@01))
  :qid |quant-u-14|)))
(pop) ; 11
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01)))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
    $Ref.null)
  (and
    (not (= nxt@42@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
      x@4@01))
  (= nxt@36@01 $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (forall (($t@53@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@54@01 $t@53@01)
    (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))) ($Snap.combine
      ($Snap.first $t@44@01)
      ($Snap.combine ($Snap.first ($Snap.second $t@44@01)) $t@53@01))))
  :pattern ((MWSF_apply mwsf@54@01 $t@53@01))
  :qid |quant-u-15|)))
(assert true)
; Loop head block: Re-establish invariant
; [eval] nxt == crt.next
; [eval] nxt != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= nxt@51@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | nxt@51@01 != Null | dead]
; [else-branch: 34 | nxt@51@01 == Null | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 34 | nxt@51@01 == Null]
(assert (= nxt@51@01 $Ref.null))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 29 | !(nxt@42@01 != Null && head(First:(Second:(Second:(Second:($t@44@01)))), nxt@42@01) < x@4@01)]
(assert (not
  (and
    (not (= nxt@42@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
      x@4@01))))
(pop) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 35 | nxt@42@01 == Null | live]
; [else-branch: 35 | nxt@42@01 != Null | live]
(push) ; 9
; [then-branch: 35 | nxt@42@01 == Null]
(assert (= nxt@42@01 $Ref.null))
(pop) ; 9
(push) ; 9
; [else-branch: 35 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
(pop) ; 10
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@42@01 $Ref.null))
  (and
    (not (= nxt@42@01 $Ref.null))
    (head%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (not (= nxt@42@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
    x@4@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (and
    (not (= nxt@42@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
      x@4@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | !(nxt@42@01 != Null && head(First:(Second:(Second:(Second:($t@44@01)))), nxt@42@01) < x@4@01) | live]
; [else-branch: 36 | nxt@42@01 != Null && head(First:(Second:(Second:(Second:($t@44@01)))), nxt@42@01) < x@4@01 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 36 | !(nxt@42@01 != Null && head(First:(Second:(Second:(Second:($t@44@01)))), nxt@42@01) < x@4@01)]
(assert (not
  (and
    (not (= nxt@42@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
      x@4@01))))
; [exec]
; node := new(val, next)
(declare-const node@55@01 $Ref)
(assert (not (= node@55@01 $Ref.null)))
(declare-const val@56@01 Int)
(declare-const next@57@01 $Ref)
(assert (not (= node@55@01 crt@41@01)))
(assert (not (= node@55@01 nxt@42@01)))
(assert (not (= node@55@01 prev@40@01)))
(assert (not (= node@55@01 xs@3@01)))
(assert (not
  (=
    node@55@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))))))
(assert (not (= node@55@01 node@10@01)))
(assert (not (= node@55@01 oldCrt@39@01)))
; [exec]
; node.val := x
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@41@01 node@55@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; node.next := nxt
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@41@01 node@55@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(List(node), write)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= nxt@42@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= nxt@42@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | nxt@42@01 != Null | live]
; [else-branch: 37 | nxt@42@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 37 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
(assert (List%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap nxt@42@01)
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))) node@55@01))
; [exec]
; crt.next := node
; [exec]
; fold acc(List(crt), write)
; [eval] xs.next != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= node@55@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | node@55@01 != Null | live]
; [else-branch: 38 | node@55@01 == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 38 | node@55@01 != Null]
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@44@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@55@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap nxt@42@01)
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))) crt@41@01))
; [exec]
; apply acc(List(crt), write) --* acc(List(xs), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 36 | nxt@42@01 != Null && head(First:(Second:(Second:(Second:($t@44@01)))), nxt@42@01) < x@4@01]
(assert (and
  (not (= nxt@42@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))) nxt@42@01)
    x@4@01)))
(pop) ; 8
(pop) ; 7
(push) ; 7
(assert (= nxt@42@01 $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  $Snap.unit))
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (not (= crt@41@01 $Ref.null)))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@44@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@44@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@44@01))) $Snap.unit))
(assert (= nxt@42@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@44@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 39 | nxt@42@01 == Null | live]
; [else-branch: 39 | nxt@42@01 != Null | live]
(push) ; 10
; [then-branch: 39 | nxt@42@01 == Null]
(pop) ; 10
(push) ; 10
; [else-branch: 39 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(check-sat)
; unsat
(pop) ; 11
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
(push) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 40 | nxt@42@01 == Null | live]
; [else-branch: 40 | nxt@42@01 != Null | live]
(push) ; 10
; [then-branch: 40 | nxt@42@01 == Null]
(pop) ; 10
(push) ; 10
; [else-branch: 40 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(check-sat)
; unsat
(pop) ; 11
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 41 | nxt@42@01 == Null | live]
; [else-branch: 41 | nxt@42@01 != Null | live]
(push) ; 9
; [then-branch: 41 | nxt@42@01 == Null]
(pop) ; 9
(push) ; 9
; [else-branch: 41 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [then-branch: 42 | nxt@42@01 != Null | dead]
; [else-branch: 42 | nxt@42@01 == Null | live]
(push) ; 8
; [else-branch: 42 | nxt@42@01 == Null]
(pop) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 43 | nxt@42@01 == Null | live]
; [else-branch: 43 | nxt@42@01 != Null | live]
(push) ; 9
; [then-branch: 43 | nxt@42@01 == Null]
(pop) ; 9
(push) ; 9
; [else-branch: 43 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= nxt@42@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | nxt@42@01 == Null | live]
; [else-branch: 44 | nxt@42@01 != Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 44 | nxt@42@01 == Null]
; [exec]
; node := new(val, next)
(declare-const node@58@01 $Ref)
(assert (not (= node@58@01 $Ref.null)))
(declare-const val@59@01 Int)
(declare-const next@60@01 $Ref)
(assert (not (= node@58@01 crt@41@01)))
(assert (not (= node@58@01 nxt@42@01)))
(assert (not (= node@58@01 prev@40@01)))
(assert (not (= node@58@01 xs@3@01)))
(assert (not
  (=
    node@58@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))))))
(assert (not (= node@58@01 node@10@01)))
(assert (not (= node@58@01 oldCrt@39@01)))
; [exec]
; node.val := x
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@41@01 node@58@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; node.next := nxt
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@41@01 node@58@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(List(node), write)
; [eval] xs.next != null
; [then-branch: 45 | nxt@42@01 != Null | dead]
; [else-branch: 45 | nxt@42@01 == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 45 | nxt@42@01 == Null]
(assert (List%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)) node@58@01))
; [exec]
; crt.next := node
; [exec]
; fold acc(List(crt), write)
; [eval] xs.next != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= node@58@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | node@58@01 != Null | live]
; [else-branch: 46 | node@58@01 == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 46 | node@58@01 != Null]
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@44@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@58@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))) crt@41@01))
; [exec]
; apply acc(List(crt), write) --* acc(List(xs), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
