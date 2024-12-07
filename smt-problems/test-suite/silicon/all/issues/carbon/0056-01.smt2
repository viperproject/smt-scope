(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:46:34
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0056.vpr
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
(declare-sort GlobalKPermission 0)
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
(declare-fun $SortWrappers.GlobalKPermissionTo$Snap (GlobalKPermission) $Snap)
(declare-fun $SortWrappers.$SnapToGlobalKPermission ($Snap) GlobalKPermission)
(assert (forall ((x GlobalKPermission)) (!
    (= x ($SortWrappers.$SnapToGlobalKPermission($SortWrappers.GlobalKPermissionTo$Snap x)))
    :pattern (($SortWrappers.GlobalKPermissionTo$Snap x))
    :qid |$Snap.$SnapToGlobalKPermissionTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.GlobalKPermissionTo$Snap($SortWrappers.$SnapToGlobalKPermission x)))
    :pattern (($SortWrappers.$SnapToGlobalKPermission x))
    :qid |$Snap.GlobalKPermissionTo$SnapToGlobalKPermission|
    )))
; ////////// Symbols
(declare-const globalK$<Perm> $Perm)
; Declaring symbols related to program functions (from program analysis)
(declare-fun PhilosophergetLeft$ ($Snap $Ref) $Ref)
(declare-fun PhilosophergetLeft$%limited ($Snap $Ref) $Ref)
(declare-fun PhilosophergetLeft$%stateless ($Ref) Bool)
(declare-fun PhilosophergetLeft$%precondition ($Snap $Ref) Bool)
(declare-fun PhilosophergetRight$ ($Snap $Ref) $Ref)
(declare-fun PhilosophergetRight$%limited ($Snap $Ref) $Ref)
(declare-fun PhilosophergetRight$%stateless ($Ref) Bool)
(declare-fun PhilosophergetRight$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Philosopher$MonitorInvariant%trigger ($Snap $Ref) Bool)
(declare-fun Philosophervalid$%trigger ($Snap $Ref) Bool)
(declare-fun Fork$MonitorInvariant%trigger ($Snap $Ref) Bool)
(declare-fun Program$MonitorInvariant%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
(assert true)
; ////////// Axioms
(assert (and
  (> (as globalK$<Perm>  $Perm) $Perm.No)
  (> $Perm.Write (as globalK$<Perm>  $Perm))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION PhilosophergetLeft$----------
(declare-fun this$_3@0@00 () $Ref)
(declare-fun result@1@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this$_3 != null
(assert (not (= this$_3@0@00 $Ref.null)))
(declare-const $k@4@00 $Perm)
(assert ($Perm.isReadVar $k@4@00))
(assert (<= $Perm.No $k@4@00))
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] result != null
(assert (not (= result@1@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (=
    (PhilosophergetLeft$%limited s@$ this$_3@0@00)
    (PhilosophergetLeft$ s@$ this$_3@0@00))
  :pattern ((PhilosophergetLeft$ s@$ this$_3@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (PhilosophergetLeft$%stateless this$_3@0@00)
  :pattern ((PhilosophergetLeft$%limited s@$ this$_3@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (let ((result@1@00 (PhilosophergetLeft$%limited s@$ this$_3@0@00))) (and
    ($Perm.isReadVar $k@4@00)
    (=>
      (PhilosophergetLeft$%precondition s@$ this$_3@0@00)
      (not (= result@1@00 $Ref.null)))))
  :pattern ((PhilosophergetLeft$%limited s@$ this$_3@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (let ((result@1@00 (PhilosophergetLeft$%limited s@$ this$_3@0@00))) true)
  :pattern ((PhilosophergetLeft$%limited s@$ this$_3@0@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@4@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this$_3@0@00 $Ref.null)))
(assert (<= $Perm.No $k@4@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Philosophervalid$(this$_3), wildcard) in this$_3.Philosopherleft$)
(declare-const $k@6@00 $Perm)
(assert ($Perm.isReadVar $k@6@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@7@00 $Perm)
(assert ($Perm.isReadVar $k@7@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@4@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@7@00 $k@4@00))
(assert (<= $Perm.No (- $k@4@00 $k@7@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Philosophervalid$%trigger ($Snap.second s@$) this$_3@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@6@00))
(assert (<= $k@6@00 $Perm.Write))
(assert (=> (< $Perm.No $k@6@00) (not (= this$_3@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] this$_5.Philosopherleft$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] this$_5.Philosopherright$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@7@00))
(assert (and
  (< $k@7@00 $k@4@00)
  (<= $Perm.No (- $k@4@00 $k@7@00))
  (Philosophervalid$%trigger ($Snap.second s@$) this$_3@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@6@00)
  (<= $k@6@00 $Perm.Write)
  (=> (< $Perm.No $k@6@00) (not (= this$_3@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))))
(assert (= result@1@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
; [eval] result != null
(set-option :timeout 0)
(push) ; 2
(assert (not (not (= result@1@00 $Ref.null))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= result@1@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    (=>
      (PhilosophergetLeft$%precondition s@$ this$_3@0@00)
      (=
        (PhilosophergetLeft$ s@$ this$_3@0@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((PhilosophergetLeft$ s@$ this$_3@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  true
  :pattern ((PhilosophergetLeft$ s@$ this$_3@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION PhilosophergetRight$----------
(declare-fun this$_4@2@00 () $Ref)
(declare-fun result@3@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this$_4 != null
(assert (not (= this$_4@2@00 $Ref.null)))
(declare-const $k@8@00 $Perm)
(assert ($Perm.isReadVar $k@8@00))
(assert (<= $Perm.No $k@8@00))
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 $Snap.unit))
; [eval] result != null
(assert (not (= result@3@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this$_4@2@00 $Ref)) (!
  (=
    (PhilosophergetRight$%limited s@$ this$_4@2@00)
    (PhilosophergetRight$ s@$ this$_4@2@00))
  :pattern ((PhilosophergetRight$ s@$ this$_4@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this$_4@2@00 $Ref)) (!
  (PhilosophergetRight$%stateless this$_4@2@00)
  :pattern ((PhilosophergetRight$%limited s@$ this$_4@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this$_4@2@00 $Ref)) (!
  (let ((result@3@00 (PhilosophergetRight$%limited s@$ this$_4@2@00))) (and
    ($Perm.isReadVar $k@8@00)
    (=>
      (PhilosophergetRight$%precondition s@$ this$_4@2@00)
      (not (= result@3@00 $Ref.null)))))
  :pattern ((PhilosophergetRight$%limited s@$ this$_4@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this$_4@2@00 $Ref)) (!
  (let ((result@3@00 (PhilosophergetRight$%limited s@$ this$_4@2@00))) true)
  :pattern ((PhilosophergetRight$%limited s@$ this$_4@2@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@8@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this$_4@2@00 $Ref.null)))
(assert (<= $Perm.No $k@8@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Philosophervalid$(this$_4), wildcard) in this$_4.Philosopherright$)
(declare-const $k@10@00 $Perm)
(assert ($Perm.isReadVar $k@10@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@11@00 $Perm)
(assert ($Perm.isReadVar $k@11@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@8@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@11@00 $k@8@00))
(assert (<= $Perm.No (- $k@8@00 $k@11@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Philosophervalid$%trigger ($Snap.second s@$) this$_4@2@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@10@00))
(assert (<= $k@10@00 $Perm.Write))
(assert (=> (< $Perm.No $k@10@00) (not (= this$_4@2@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] this$_5.Philosopherleft$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] this$_5.Philosopherright$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@11@00))
(assert (and
  (< $k@11@00 $k@8@00)
  (<= $Perm.No (- $k@8@00 $k@11@00))
  (Philosophervalid$%trigger ($Snap.second s@$) this$_4@2@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@10@00)
  (<= $k@10@00 $Perm.Write)
  (=> (< $Perm.No $k@10@00) (not (= this$_4@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))))
(assert (=
  result@3@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))
; [eval] result != null
(set-option :timeout 0)
(push) ; 2
(assert (not (not (= result@3@00 $Ref.null))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= result@3@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this$_4@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@8@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@11@00)
    (=>
      (PhilosophergetRight$%precondition s@$ this$_4@2@00)
      (=
        (PhilosophergetRight$ s@$ this$_4@2@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((PhilosophergetRight$ s@$ this$_4@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this$_4@2@00 $Ref)) (!
  true
  :pattern ((PhilosophergetRight$ s@$ this$_4@2@00))
  :qid |quant-u-11|)))
; ---------- Philosopher$MonitorInvariant ----------
(declare-const this$@12@00 $Ref)
(push) ; 1
(declare-const $t@13@00 $Snap)
(assert (= $t@13@00 $Snap.unit))
(pop) ; 1
; ---------- Philosophervalid$ ----------
(declare-const this$_5@14@00 $Ref)
(push) ; 1
(declare-const $t@15@00 $Snap)
(assert (= $t@15@00 ($Snap.combine ($Snap.first $t@15@00) ($Snap.second $t@15@00))))
(assert (not (= this$_5@14@00 $Ref.null)))
(assert (=
  ($Snap.second $t@15@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@00))
    ($Snap.second ($Snap.second $t@15@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@15@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@15@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@15@00))) $Snap.unit))
; [eval] this$_5.Philosopherleft$ != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@15@00))) $Snap.unit))
; [eval] this$_5.Philosopherright$ != null
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@15@00))) $Ref.null)))
(pop) ; 1
; ---------- Fork$MonitorInvariant ----------
(declare-const this$_6@16@00 $Ref)
(push) ; 1
(declare-const $t@17@00 $Snap)
(assert (= $t@17@00 ($Snap.combine ($Snap.first $t@17@00) ($Snap.second $t@17@00))))
(assert (= ($Snap.first $t@17@00) $Snap.unit))
(assert (= ($Snap.second $t@17@00) $Snap.unit))
(pop) ; 1
; ---------- Program$MonitorInvariant ----------
(declare-const this$_7@18@00 $Ref)
(push) ; 1
(declare-const $t@19@00 $Snap)
(assert (= $t@19@00 $Snap.unit))
(pop) ; 1
