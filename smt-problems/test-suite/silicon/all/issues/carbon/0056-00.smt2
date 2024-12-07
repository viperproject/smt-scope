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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(declare-fun $k@8@00 () $Perm)
(declare-fun $k@10@00 () $Perm)
(declare-fun $k@11@00 () $Perm)
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Philosopherinit$ ----------
(declare-const this$_1@0@01 $Ref)
(declare-const k$@1@01 $Perm)
(declare-const f1@2@01 $Ref)
(declare-const f2@3@01 $Ref)
(declare-const this$_1@4@01 $Ref)
(declare-const k$@5@01 $Perm)
(declare-const f1@6@01 $Ref)
(declare-const f2@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] this$_1 != null
(assert (not (= this$_1@4@01 $Ref.null)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] k$ > none
(assert (> k$@5@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] write > k$
(assert (> $Perm.Write k$@5@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) $Snap.unit))
; [eval] f1 != null
(assert (not (= f1@6@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  $Snap.unit))
; [eval] f2 != null
(assert (not (= f2@7@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (=
  ($Snap.second $t@9@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@01))
    ($Snap.second ($Snap.second $t@9@01)))))
(assert (= ($Snap.first ($Snap.second $t@9@01)) $Snap.unit))
; [eval] PhilosophergetLeft$(this$_1) == f1
; [eval] PhilosophergetLeft$(this$_1)
(push) ; 3
; [eval] this$_3 != null
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(assert (< $k@10@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@10@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PhilosophergetLeft$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first $t@9@01)) this$_1@4@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@10@01))
(assert (and
  (< $k@10@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@10@01))
  (PhilosophergetLeft$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first $t@9@01)) this$_1@4@01)))
(assert (=
  (PhilosophergetLeft$ ($Snap.combine $Snap.unit ($Snap.first $t@9@01)) this$_1@4@01)
  f1@6@01))
(assert (= ($Snap.second ($Snap.second $t@9@01)) $Snap.unit))
; [eval] PhilosophergetRight$(this$_1) == f2
; [eval] PhilosophergetRight$(this$_1)
(set-option :timeout 0)
(push) ; 3
; [eval] this$_4 != null
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(assert (< $k@11@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@11@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PhilosophergetRight$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first $t@9@01)) this$_1@4@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@11@01))
(assert (and
  (< $k@11@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@11@01))
  (PhilosophergetRight$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first $t@9@01)) this$_1@4@01)))
(assert (=
  (PhilosophergetRight$ ($Snap.combine $Snap.unit ($Snap.first $t@9@01)) this$_1@4@01)
  f2@7@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$: Ref
(declare-const n$@12@01 $Ref)
; [exec]
; var a$: Ref
(declare-const a$@13@01 $Ref)
; [exec]
; var b$: Ref
(declare-const b$@14@01 $Ref)
; [exec]
; var c$: Ref
(declare-const c$@15@01 $Ref)
; [exec]
; this$_1.Philosopherleft$ := f1
; [exec]
; this$_1.Philosopherright$ := f2
; [exec]
; fold acc(Philosophervalid$(this$_1), write)
; [eval] this$_5.Philosopherleft$ != null
; [eval] this$_5.Philosopherright$ != null
(assert (Philosophervalid$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap f1@6@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap f2@7@01)
    ($Snap.combine $Snap.unit $Snap.unit))) this$_1@4@01))
; [eval] PhilosophergetLeft$(this$_1) == f1
; [eval] PhilosophergetLeft$(this$_1)
(push) ; 3
; [eval] this$_3 != null
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(assert (< $k@16@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@16@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PhilosophergetLeft$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap f1@6@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap f2@7@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) this$_1@4@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@16@01))
(assert (and
  (< $k@16@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@16@01))
  (PhilosophergetLeft$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap f1@6@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap f2@7@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) this$_1@4@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (PhilosophergetLeft$ ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap f1@6@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap f2@7@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) this$_1@4@01)
  f1@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (PhilosophergetLeft$ ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap f1@6@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap f2@7@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) this$_1@4@01)
  f1@6@01))
; [eval] PhilosophergetRight$(this$_1) == f2
; [eval] PhilosophergetRight$(this$_1)
(push) ; 3
; [eval] this$_4 != null
(declare-const $k@17@01 $Perm)
(assert ($Perm.isReadVar $k@17@01))
(assert (< $k@17@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@17@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PhilosophergetRight$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap f1@6@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap f2@7@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) this$_1@4@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@17@01))
(assert (and
  (< $k@17@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@17@01))
  (PhilosophergetRight$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap f1@6@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap f2@7@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) this$_1@4@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (PhilosophergetRight$ ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap f1@6@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap f2@7@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) this$_1@4@01)
  f2@7@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (PhilosophergetRight$ ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap f1@6@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap f2@7@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) this$_1@4@01)
  f2@7@01))
(pop) ; 2
(pop) ; 1
; ---------- Philosopherrun$ ----------
(declare-const this$_2@18@01 $Ref)
(declare-const k$_1@19@01 $Perm)
(declare-const this$_2@20@01 $Ref)
(declare-const k$_1@21@01 $Perm)
(push) ; 1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (= ($Snap.first $t@22@01) $Snap.unit))
; [eval] this$_2 != null
(assert (not (= this$_2@20@01 $Ref.null)))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (= ($Snap.first ($Snap.second $t@22@01)) $Snap.unit))
; [eval] k$_1 > none
(assert (> k$_1@21@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@22@01))) $Snap.unit))
; [eval] write > k$_1
(assert (> $Perm.Write k$_1@21@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@22@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var n$_1: Ref
(declare-const n$_1@23@01 $Ref)
; [exec]
; var a$_1: Ref
(declare-const a$_1@24@01 $Ref)
; [exec]
; var b$_1: Ref
(declare-const b$_1@25@01 $Ref)
; [exec]
; var c$_1: Ref
(declare-const c$_1@26@01 $Ref)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(assert (= ($Snap.first ($Snap.second $t@27@01)) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@27@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@27@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@27@01))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))
  $Snap.unit))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(assert (= ($Snap.first ($Snap.second $t@27@01)) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@27@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@27@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@27@01))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
(push) ; 5
; [eval] !true
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | True]
; [exec]
; unfold acc(Philosophervalid$(this$_2), write)
(assert (=
  ($Snap.first $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@27@01))
    ($Snap.second ($Snap.first $t@27@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@27@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@27@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@27@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@27@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@27@01)))) $Snap.unit))
; [eval] this$_5.Philosopherleft$ != null
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@27@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@27@01))))
  $Snap.unit))
; [eval] this$_5.Philosopherright$ != null
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@27@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Philosophervalid$%trigger ($Snap.first $t@27@01) this$_2@20@01))
; [exec]
; inhale acc(Fork$MonitorInvariant(this$_2.Philosopherleft$), write)
(declare-const $t@28@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(Fork$MonitorInvariant(this$_2.Philosopherleft$), write)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(assert (= ($Snap.first $t@28@01) $Snap.unit))
(assert (= ($Snap.second $t@28@01) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Fork$MonitorInvariant%trigger $t@28@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@27@01)))))
; [exec]
; inhale acc(Fork$MonitorInvariant(this$_2.Philosopherright$), write)
(declare-const $t@29@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(Fork$MonitorInvariant(this$_2.Philosopherright$), write)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(assert (= ($Snap.first $t@29@01) $Snap.unit))
(assert (= ($Snap.second $t@29@01) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Fork$MonitorInvariant%trigger $t@29@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@27@01))))))
; [exec]
; fold acc(Fork$MonitorInvariant(this$_2.Philosopherleft$), write)
(assert (Fork$MonitorInvariant%trigger ($Snap.combine $Snap.unit $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@27@01)))))
; [exec]
; exhale acc(Fork$MonitorInvariant(this$_2.Philosopherleft$), write)
; [exec]
; fold acc(Fork$MonitorInvariant(this$_2.Philosopherright$), write)
(assert (Fork$MonitorInvariant%trigger ($Snap.combine $Snap.unit $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@27@01))))))
; [exec]
; exhale acc(Fork$MonitorInvariant(this$_2.Philosopherright$), write)
; [exec]
; fold acc(Philosophervalid$(this$_2), write)
; [eval] this$_5.Philosopherleft$ != null
; [eval] this$_5.Philosopherright$ != null
(assert (Philosophervalid$%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@27@01)))
    ($Snap.combine $Snap.unit $Snap.unit))) this$_2@20@01))
; Loop head block: Re-establish invariant
(pop) ; 5
; [eval] !true
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | True]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
