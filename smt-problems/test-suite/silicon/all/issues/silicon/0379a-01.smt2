(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0379a.vpr
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
(declare-fun read$ ($Snap) $Perm)
(declare-fun read$%limited ($Snap) $Perm)
(declare-const read$%stateless Bool)
(declare-fun read$%precondition ($Snap) Bool)
(declare-fun f ($Snap $Ref) Bool)
(declare-fun f%limited ($Snap $Ref) Bool)
(declare-fun f%stateless ($Ref) Bool)
(declare-fun f%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
(declare-fun u32%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION read$----------
(declare-fun result@0@00 () $Perm)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@3@00 $Snap)
(assert (= $t@3@00 $Snap.unit))
; [eval] none < result
(assert (< $Perm.No result@0@00))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (read$%limited s@$) (read$ s@$))
  :pattern ((read$ s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as read$%stateless  Bool)
  :pattern ((read$%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) (=>
    (read$%precondition s@$)
    (< $Perm.No result@0@00)))
  :pattern ((read$%limited s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-5|)))
; ---------- FUNCTION f----------
(declare-fun _pure_1@1@00 () $Ref)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
; [eval] read$()
(push) ; 2
(assert (read$%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (read$%precondition $Snap.unit))
(push) ; 2
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (read$ $Snap.unit)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (_pure_1@1@00 $Ref)) (!
  (= (f%limited s@$ _pure_1@1@00) (f s@$ _pure_1@1@00))
  :pattern ((f s@$ _pure_1@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (_pure_1@1@00 $Ref)) (!
  (f%stateless _pure_1@1@00)
  :pattern ((f%limited s@$ _pure_1@1@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (read$%precondition $Snap.unit))
(assert (<= $Perm.No (read$ $Snap.unit)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] ((unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) >= 0 || (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) % 2 == 0 ? (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) % 2 : 0) == 0
; [eval] ((unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) >= 0 || (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) % 2 == 0 ? (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) % 2 : 0)
; [eval] (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) >= 0 || (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) % 2 == 0
; [eval] (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) >= 0
; [eval] (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int))
; [eval] read$()
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
; Joined path conditions
(push) ; 2
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
; [eval] read$()
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (P%trigger s@$ _pure_1@1@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= (read$ $Snap.unit) $Perm.Write))
(assert (=> (< $Perm.No (read$ $Snap.unit)) (not (= _pure_1@1@00 $Ref.null))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (u32%trigger ($Snap.first ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(assert (=
  ($Snap.first ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second s@$)))
    ($Snap.second ($Snap.first ($Snap.second s@$))))))
(assert (=>
  (< $Perm.No (read$ $Snap.unit))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))))
(assert (= ($Snap.second ($Snap.first ($Snap.second s@$))) $Snap.unit))
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (u32%trigger ($Snap.first ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (=
    ($Snap.first ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second s@$)))
      ($Snap.second ($Snap.first ($Snap.second s@$)))))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
  (= ($Snap.second ($Snap.first ($Snap.second s@$))) $Snap.unit)
  (<=
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$)))))))
(pop) ; 2
; Joined path conditions
(assert (and
  (P%trigger s@$ _pure_1@1@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (<= (read$ $Snap.unit) $Perm.Write)
  (=> (< $Perm.No (read$ $Snap.unit)) (not (= _pure_1@1@00 $Ref.null)))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (u32%trigger ($Snap.first ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (=
    ($Snap.first ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second s@$)))
      ($Snap.second ($Snap.first ($Snap.second s@$)))))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
  (= ($Snap.second ($Snap.first ($Snap.second s@$))) $Snap.unit)
  (<=
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$)))))))
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | First:(First:(Second:(s@$))) >= 0 | live]
; [else-branch: 0 | !(First:(First:(Second:(s@$))) >= 0) | live]
(push) ; 3
; [then-branch: 0 | First:(First:(Second:(s@$))) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$)))) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(First:(First:(Second:(s@$))) >= 0)]
(assert (not
  (>=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
    0)))
; [eval] (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) % 2 == 0
; [eval] (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) % 2
; [eval] (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int))
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [eval] read$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $t@4@00 $Snap)
(assert (and
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@4@00 ($Snap.first ($Snap.second s@$))))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@4@00 ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (<= $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
; [eval] (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [eval] read$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (-
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (u32%trigger $t@4@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(assert (= $t@4@00 ($Snap.combine ($Snap.first $t@4@00) ($Snap.second $t@4@00))))
(assert (= ($Snap.second $t@4@00) $Snap.unit))
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@00))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
; Joined path conditions
(assert (and
  (u32%trigger $t@4@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (= $t@4@00 ($Snap.combine ($Snap.first $t@4@00) ($Snap.second $t@4@00)))
  (= ($Snap.second $t@4@00) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@00)))))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@4@00 ($Snap.first ($Snap.second s@$))))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@4@00 ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (<= $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
  (u32%trigger $t@4@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (= $t@4@00 ($Snap.combine ($Snap.first $t@4@00) ($Snap.second $t@4@00)))
  (= ($Snap.second $t@4@00) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (>=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
      0))
  (and
    (not
      (>=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
        0))
    (=>
      (< $Perm.No (read$ $Snap.unit))
      (= $t@4@00 ($Snap.first ($Snap.second s@$))))
    (=>
      (< $Perm.No (read$ $Snap.unit))
      (= $t@4@00 ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (<= $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (u32%trigger $t@4@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (= $t@4@00 ($Snap.combine ($Snap.first $t@4@00) ($Snap.second $t@4@00)))
    (= ($Snap.second $t@4@00) $Snap.unit)
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@4@00))))))
(assert (or
  (not
    (>=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
      0))
  (>=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
    0)))
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (or
    (>=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
      0)
    (= (mod ($SortWrappers.$SnapToInt ($Snap.first $t@4@00)) 2) 0)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (or
  (>=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
    0)
  (= (mod ($SortWrappers.$SnapToInt ($Snap.first $t@4@00)) 2) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(First:(Second:(s@$))) >= 0 || First:($t@4@00) % 2 == 0 | live]
; [else-branch: 1 | !(First:(First:(Second:(s@$))) >= 0 || First:($t@4@00) % 2 == 0) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | First:(First:(Second:(s@$))) >= 0 || First:($t@4@00) % 2 == 0]
(assert (or
  (>=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
    0)
  (= (mod ($SortWrappers.$SnapToInt ($Snap.first $t@4@00)) 2) 0)))
; [eval] (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)) % 2
; [eval] (unfolding acc(P(_pure_1), read$()) in (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int))
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [eval] read$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] (unfolding acc(u32(_pure_1.f$m2), read$()) in _pure_1.f$m2.val_int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [eval] read$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
; Joined path conditions
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (or
  (>=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
    0)
  (= (mod ($SortWrappers.$SnapToInt ($Snap.first $t@4@00)) 2) 0)))
(assert (=
  result@2@00
  (=
    (mod
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
      2)
    0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (_pure_1@1@00 $Ref)) (!
  (and
    (and
      (=>
        (< $Perm.No (read$ $Snap.unit))
        (= $t@4@00 ($Snap.first ($Snap.second s@$))))
      (=>
        (< $Perm.No (read$ $Snap.unit))
        (= $t@4@00 ($Snap.second ($Snap.second ($Snap.second s@$))))))
    (=>
      (f%precondition s@$ _pure_1@1@00)
      (=
        (f s@$ _pure_1@1@00)
        (=
          (ite
            (or
              (>=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
                0)
              (=
                (mod
                  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
                  2)
                0))
            (mod
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
              2)
            0)
          0))))
  :pattern ((f s@$ _pure_1@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (_pure_1@1@00 $Ref)) (!
  true
  :pattern ((f s@$ _pure_1@1@00))
  :qid |quant-u-7|)))
; ---------- P ----------
(declare-const self@5@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@00 $Snap)
(assert (= $t@6@00 ($Snap.combine ($Snap.first $t@6@00) ($Snap.second $t@6@00))))
(assert (not (= self@5@00 $Ref.null)))
(assert (=
  ($Snap.second $t@6@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@00))
    ($Snap.second ($Snap.second $t@6@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@6@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@00))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@6@00))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@6@00)))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- u32 ----------
(declare-const self@7@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 ($Snap.combine ($Snap.first $t@8@00) ($Snap.second $t@8@00))))
(assert (not (= self@7@00 $Ref.null)))
(assert (= ($Snap.second $t@8@00) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@8@00))))
(pop) ; 1
