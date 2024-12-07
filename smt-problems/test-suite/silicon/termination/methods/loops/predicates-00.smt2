(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:25
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/methods/loops/predicates.vpr
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
(declare-sort WellFoundedOrder<PredicateInstance> 0)
(declare-sort PredicateInstance 0)
(declare-sort PredicateInstancesNestedRelation 0)
(declare-sort PredicateInstancesWellFoundedOrder 0)
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
(declare-fun $SortWrappers.WellFoundedOrder<PredicateInstance>To$Snap (WellFoundedOrder<PredicateInstance>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<PredicateInstance> ($Snap) WellFoundedOrder<PredicateInstance>)
(assert (forall ((x WellFoundedOrder<PredicateInstance>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<PredicateInstance>($SortWrappers.WellFoundedOrder<PredicateInstance>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<PredicateInstance>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<PredicateInstance>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<PredicateInstance>To$Snap($SortWrappers.$SnapToWellFoundedOrder<PredicateInstance> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<PredicateInstance> x))
    :qid |$Snap.WellFoundedOrder<PredicateInstance>To$SnapToWellFoundedOrder<PredicateInstance>|
    )))
(declare-fun $SortWrappers.PredicateInstanceTo$Snap (PredicateInstance) $Snap)
(declare-fun $SortWrappers.$SnapToPredicateInstance ($Snap) PredicateInstance)
(assert (forall ((x PredicateInstance)) (!
    (= x ($SortWrappers.$SnapToPredicateInstance($SortWrappers.PredicateInstanceTo$Snap x)))
    :pattern (($SortWrappers.PredicateInstanceTo$Snap x))
    :qid |$Snap.$SnapToPredicateInstanceTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PredicateInstanceTo$Snap($SortWrappers.$SnapToPredicateInstance x)))
    :pattern (($SortWrappers.$SnapToPredicateInstance x))
    :qid |$Snap.PredicateInstanceTo$SnapToPredicateInstance|
    )))
(declare-fun $SortWrappers.PredicateInstancesNestedRelationTo$Snap (PredicateInstancesNestedRelation) $Snap)
(declare-fun $SortWrappers.$SnapToPredicateInstancesNestedRelation ($Snap) PredicateInstancesNestedRelation)
(assert (forall ((x PredicateInstancesNestedRelation)) (!
    (= x ($SortWrappers.$SnapToPredicateInstancesNestedRelation($SortWrappers.PredicateInstancesNestedRelationTo$Snap x)))
    :pattern (($SortWrappers.PredicateInstancesNestedRelationTo$Snap x))
    :qid |$Snap.$SnapToPredicateInstancesNestedRelationTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PredicateInstancesNestedRelationTo$Snap($SortWrappers.$SnapToPredicateInstancesNestedRelation x)))
    :pattern (($SortWrappers.$SnapToPredicateInstancesNestedRelation x))
    :qid |$Snap.PredicateInstancesNestedRelationTo$SnapToPredicateInstancesNestedRelation|
    )))
(declare-fun $SortWrappers.PredicateInstancesWellFoundedOrderTo$Snap (PredicateInstancesWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToPredicateInstancesWellFoundedOrder ($Snap) PredicateInstancesWellFoundedOrder)
(assert (forall ((x PredicateInstancesWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToPredicateInstancesWellFoundedOrder($SortWrappers.PredicateInstancesWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.PredicateInstancesWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToPredicateInstancesWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PredicateInstancesWellFoundedOrderTo$Snap($SortWrappers.$SnapToPredicateInstancesWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToPredicateInstancesWellFoundedOrder x))
    :qid |$Snap.PredicateInstancesWellFoundedOrderTo$SnapToPredicateInstancesWellFoundedOrder|
    )))
; ////////// Symbols
(declare-fun nestedPredicates<Bool> (PredicateInstance PredicateInstance) Bool)
(declare-fun decreasing<Bool> (PredicateInstance PredicateInstance) Bool)
(declare-fun bounded<Bool> (PredicateInstance) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun PI_list ($Snap $Ref) PredicateInstance)
(declare-fun PI_list%limited ($Snap $Ref) PredicateInstance)
(declare-fun PI_list%stateless ($Ref) Bool)
(declare-fun PI_list%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((l1 PredicateInstance) (l2 PredicateInstance)) (!
  (= (decreasing<Bool> l1 l2) (nestedPredicates<Bool> l1 l2))
  :pattern ((nestedPredicates<Bool> l1 l2))
  :qid |prog.predicate_instances_ax_dec|)))
(assert (forall ((l1 PredicateInstance)) (!
  (bounded<Bool> l1)
  :pattern ((bounded<Bool> l1))
  :qid |prog.predicate_instances_ax_bound|)))
(assert (forall ((l1 PredicateInstance) (l2 PredicateInstance) (l3 PredicateInstance)) (!
  (=>
    (and (nestedPredicates<Bool> l1 l2) (nestedPredicates<Bool> l2 l3))
    (nestedPredicates<Bool> l1 l3))
  :pattern ((nestedPredicates<Bool> l1 l2) (nestedPredicates<Bool> l2 l3))
  :qid |prog.nestedTrans|)))
(assert (forall ((l1 PredicateInstance)) (!
  (not (nestedPredicates<Bool> l1 l1))
  :pattern ((nestedPredicates<Bool> l1 l1))
  :qid |prog.nestedReflex|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@2@00 () $Perm)
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (= (PI_list%limited s@$ xs@0@00) (PI_list s@$ xs@0@00))
  :pattern ((PI_list s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (PI_list%stateless xs@0@00)
  :pattern ((PI_list%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- alwaysAppendLoop ----------
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
; var ys: Ref
(declare-const ys@3@01 $Ref)
; [exec]
; ys := xs
; [exec]
; // list_ys
; var list__338897620: PredicateInstance
(declare-const list__338897620@4@01 PredicateInstance)
; [exec]
; list__338897620 := PI_list(ys)
; [eval] PI_list(ys)
(push) ; 3
(declare-const $k@5@01 $Perm)
(assert ($Perm.isReadVar $k@5@01))
(assert (< $k@5@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@5@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition $t@2@01 xs@1@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@5@01))
(assert (and
  (< $k@5@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@5@01))
  (PI_list%precondition $t@2@01 xs@1@01)))
(declare-const list__338897620@6@01 PredicateInstance)
(assert (= list__338897620@6@01 (PI_list $t@2@01 xs@1@01)))
; [exec]
; unfold acc(list(ys), write)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= xs@1@01 $Ref.null)))
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@2@01) != Null | live]
; [else-branch: 0 | First:($t@2@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:($t@2@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger $t@2@01 xs@1@01))
; [eval] ys.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:($t@2@01) != Null | live]
; [else-branch: 1 | First:($t@2@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:($t@2@01) != Null]
; [exec]
; // list_ys.next
; var list__1432489320: PredicateInstance
(declare-const list__1432489320@7@01 PredicateInstance)
; [exec]
; list__1432489320 := PI_list(ys.next)
; [eval] PI_list(ys.next)
(push) ; 5
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (< $k@8@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@8@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@8@01))
(assert (and
  (< $k@8@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@8@01))
  (PI_list%precondition ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
(declare-const list__1432489320@9@01 PredicateInstance)
(assert (=
  list__1432489320@9@01
  (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
; [exec]
; inhale nestedPredicates(list__1432489320, list__338897620)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] nestedPredicates(list__1432489320, list__338897620)
(assert (nestedPredicates<Bool> list__1432489320@9@01 list__338897620@6@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] ys.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:($t@2@01) != Null | live]
; [else-branch: 2 | First:($t@2@01) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:($t@2@01) != Null]
(declare-const old_W1_T0@11@01 PredicateInstance)
(declare-const ys@12@01 $Ref)
(declare-const list__3388976200@13@01 PredicateInstance)
(declare-const list__14324893200@14@01 PredicateInstance)
(declare-const n@15@01 $Ref)
(push) ; 6
; Loop head block: Check well-definedness of invariant
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (not (= ys@12@01 $Ref.null)))
(pop) ; 6
(push) ; 6
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (not (= ys@12@01 $Ref.null)))
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
; [eval] ys.next != null
(pop) ; 8
(push) ; 8
; [eval] !(ys.next != null)
; [eval] ys.next != null
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] ys.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:($t@16@01) != Null | live]
; [else-branch: 3 | First:($t@16@01) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 3 | First:($t@16@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) $Ref.null)))
; [exec]
; var old_W1_T0: PredicateInstance
(declare-const old_W1_T0@17@01 PredicateInstance)
; [exec]
; old_W1_T0 := PI_list(ys.next)
; [eval] PI_list(ys.next)
(push) ; 9
(declare-const $k@18@01 $Perm)
(assert ($Perm.isReadVar $k@18@01))
(assert (< $k@18@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@18@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.second $t@16@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01))))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@18@01))
(assert (and
  (< $k@18@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@18@01))
  (PI_list%precondition ($Snap.second $t@16@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)))))
(declare-const old_W1_T0@19@01 PredicateInstance)
(assert (=
  old_W1_T0@19@01
  (PI_list ($Snap.second $t@16@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)))))
; [exec]
; ys := ys.next
(declare-const ys@20@01 $Ref)
(assert (= ys@20@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01))))
; [exec]
; // list_ys
; var list__3388976200: PredicateInstance
(declare-const list__3388976200@21@01 PredicateInstance)
; [exec]
; list__3388976200 := PI_list(ys)
; [eval] PI_list(ys)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(push) ; 10
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) ys@20@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (< $k@22@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@22@01)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.second $t@16@01) ys@20@01))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@22@01))
(assert (and
  (< $k@22@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@22@01))
  (PI_list%precondition ($Snap.second $t@16@01) ys@20@01)))
(declare-const list__3388976200@23@01 PredicateInstance)
(assert (= list__3388976200@23@01 (PI_list ($Snap.second $t@16@01) ys@20@01)))
; [exec]
; unfold acc(list(ys), write)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) ys@20@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (not (= ys@20@01 $Ref.null)))
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 4 | First:(Second:($t@16@01)) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 4 | First:(Second:($t@16@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.second $t@16@01) ys@20@01))
; [eval] ys.next != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 5 | First:(Second:($t@16@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 5 | First:(Second:($t@16@01)) != Null]
; [exec]
; // list_ys.next
; var list__14324893200: PredicateInstance
(declare-const list__14324893200@24@01 PredicateInstance)
; [exec]
; list__14324893200 := PI_list(ys.next)
; [eval] PI_list(ys.next)
(push) ; 11
(declare-const $k@25@01 $Perm)
(assert ($Perm.isReadVar $k@25@01))
(assert (< $k@25@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@25@01)))
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No $k@25@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(pop) ; 11
; Joined path conditions
(assert ($Perm.isReadVar $k@25@01))
(assert (and
  (< $k@25@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@25@01))
  (PI_list%precondition ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(declare-const list__14324893200@26@01 PredicateInstance)
(assert (=
  list__14324893200@26@01
  (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
; [exec]
; inhale nestedPredicates(list__14324893200, list__3388976200)
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] nestedPredicates(list__14324893200, list__3388976200)
(assert (nestedPredicates<Bool> list__14324893200@26@01 list__3388976200@23@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] ys.next == null
; [then-branch: 6 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 6 | First:(Second:($t@16@01)) != Null | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 6 | First:(Second:($t@16@01)) != Null]
(pop) ; 11
; [eval] !(ys.next == null)
; [eval] ys.next == null
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 7 | First:(Second:($t@16@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 7 | First:(Second:($t@16@01)) != Null]
; [exec]
; assert true && ys.next != null ==>
;   (decreasing(PI_list(ys.next), old_W1_T0): Bool) &&
;   (bounded(old_W1_T0): Bool) ||
;   PI_list(ys.next) == old_W1_T0 && false
; [eval] true && ys.next != null ==> (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] true && ys.next != null
(push) ; 12
; [then-branch: 8 | False | live]
; [else-branch: 8 | True | live]
(push) ; 13
; [then-branch: 8 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 8 | True]
; [eval] ys.next != null
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 9 | First:(Second:($t@16@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 9 | First:(Second:($t@16@01)) != Null]
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool)
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool)
; [eval] PI_list(ys.next)
(push) ; 14
(declare-const $k@28@01 $Perm)
(assert ($Perm.isReadVar $k@28@01))
(assert (< $k@28@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@28@01)))
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No $k@28@01)))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(assert ($Perm.isReadVar $k@28@01))
(assert (and (< $k@28@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@28@01))))
(set-option :timeout 0)
(push) ; 14
; [then-branch: 10 | !(decreasing[Bool](PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))), old_W1_T0@19@01)) | live]
; [else-branch: 10 | decreasing[Bool](PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))), old_W1_T0@19@01) | live]
(push) ; 15
; [then-branch: 10 | !(decreasing[Bool](PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))), old_W1_T0@19@01))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)))
(pop) ; 15
(push) ; 15
; [else-branch: 10 | decreasing[Bool](PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))), old_W1_T0@19@01)]
(assert (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01))
; [eval] (bounded(old_W1_T0): Bool)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
  (not
    (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01))))
(push) ; 14
; [then-branch: 11 | decreasing[Bool](PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01) | live]
; [else-branch: 11 | !(decreasing[Bool](PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)) | live]
(push) ; 15
; [then-branch: 11 | decreasing[Bool](PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
  (bounded<Bool> old_W1_T0@19@01)))
(pop) ; 15
(push) ; 15
; [else-branch: 11 | !(decreasing[Bool](PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
; [eval] PI_list(ys.next) == old_W1_T0 && false
; [eval] PI_list(ys.next) == old_W1_T0
; [eval] PI_list(ys.next)
(push) ; 16
(declare-const $k@29@01 $Perm)
(assert ($Perm.isReadVar $k@29@01))
(assert (< $k@29@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@29@01)))
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@29@01))
(assert (and (< $k@29@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@29@01))))
(set-option :timeout 0)
(push) ; 16
; [then-branch: 12 | PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))) != old_W1_T0@19@01 | live]
; [else-branch: 12 | PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))) == old_W1_T0@19@01 | live]
(push) ; 17
; [then-branch: 12 | PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))) != old_W1_T0@19@01]
(assert (not
  (=
    (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
    old_W1_T0@19@01)))
(pop) ; 17
(push) ; 17
; [else-branch: 12 | PI_list(Second:(Second:($t@16@01)), First:(Second:($t@16@01))) == old_W1_T0@19@01]
(assert (=
  (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
  old_W1_T0@19@01))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
    old_W1_T0@19@01)
  (not
    (=
      (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
      old_W1_T0@19@01))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@29@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01)))
    (< $k@29@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@29@01))
    (or
      (=
        (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
        old_W1_T0@19@01)
      (not
        (=
          (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
          old_W1_T0@19@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert ($Perm.isReadVar $k@28@01))
(assert ($Perm.isReadVar $k@29@01))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (and
    (< $k@28@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@28@01))
    (or
      (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
      (not
        (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)))
    (=>
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (not
          (and
            (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
            (bounded<Bool> old_W1_T0@19@01)))
        (< $k@29@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@29@01))
        (or
          (=
            (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
            old_W1_T0@19@01)
          (not
            (=
              (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
              old_W1_T0@19@01)))))
    (or
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01))))))
(push) ; 12
(assert (not (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (and
    (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (and
    (decreasing<Bool> (PI_list ($Snap.second ($Snap.second $t@16@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
; Loop head block: Re-establish invariant
(pop) ; 11
(pop) ; 10
; [eval] !(ys.next != null)
; [eval] ys.next != null
; [then-branch: 13 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 13 | First:(Second:($t@16@01)) != Null | live]
(push) ; 10
; [else-branch: 13 | First:(Second:($t@16@01)) != Null]
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 4 | First:(Second:($t@16@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@16@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.second $t@16@01) ys@20@01))
; [eval] ys.next != null
; [then-branch: 14 | First:(Second:($t@16@01)) != Null | dead]
; [else-branch: 14 | First:(Second:($t@16@01)) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 14 | First:(Second:($t@16@01)) == Null]
(pop) ; 10
; [eval] !(ys.next != null)
; [eval] ys.next != null
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:($t@16@01)) == Null | live]
; [else-branch: 15 | First:(Second:($t@16@01)) != Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 15 | First:(Second:($t@16@01)) == Null]
; [eval] ys.next == null
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:($t@16@01)) == Null | live]
; [else-branch: 16 | First:(Second:($t@16@01)) != Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 16 | First:(Second:($t@16@01)) == Null]
; [exec]
; var n: Ref
(declare-const n@30@01 $Ref)
; [exec]
; n := new(next)
(declare-const n@31@01 $Ref)
(assert (not (= n@31@01 $Ref.null)))
(declare-const next@32@01 $Ref)
(assert (not (= n@31@01 xs@1@01)))
(assert (not
  (= n@31@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(assert (not (= n@31@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)))))
(assert (not (= n@31@01 ys@12@01)))
(assert (not (= n@31@01 n@30@01)))
(assert (not (= n@31@01 ys@20@01)))
; [exec]
; n.next := null
(push) ; 12
(set-option :timeout 10)
(assert (not (= ys@20@01 n@31@01)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ys@12@01 n@31@01)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [exec]
; ys.next := n
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= n@31@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(n), write)
; [eval] xs.next != null
; [then-branch: 17 | False | dead]
; [else-branch: 17 | True | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 17 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01))
; [exec]
; assert true && ys.next != null ==>
;   (decreasing(PI_list(ys.next), old_W1_T0): Bool) &&
;   (bounded(old_W1_T0): Bool) ||
;   PI_list(ys.next) == old_W1_T0 && false
; [eval] true && ys.next != null ==> (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] true && ys.next != null
(push) ; 13
; [then-branch: 18 | False | live]
; [else-branch: 18 | True | live]
(push) ; 14
; [then-branch: 18 | False]
(assert false)
(pop) ; 14
(push) ; 14
; [else-branch: 18 | True]
; [eval] ys.next != null
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(push) ; 13
(push) ; 14
(set-option :timeout 10)
(assert (not (= n@31@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | n@31@01 != Null | live]
; [else-branch: 19 | n@31@01 == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 19 | n@31@01 != Null]
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool)
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool)
; [eval] PI_list(ys.next)
(push) ; 15
(declare-const $k@33@01 $Perm)
(assert ($Perm.isReadVar $k@33@01))
(assert (< $k@33@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@33@01)))
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No $k@33@01)))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) n@31@01))
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@33@01))
(assert (and
  (< $k@33@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@33@01))
  (PI_list%precondition ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01)))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 20 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01)) | live]
; [else-branch: 20 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) | live]
(push) ; 16
; [then-branch: 20 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)))
(pop) ; 16
(push) ; 16
; [else-branch: 20 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01)]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) n@31@01) old_W1_T0@19@01))
; [eval] (bounded(old_W1_T0): Bool)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01))))
(push) ; 15
; [then-branch: 21 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01) | live]
; [else-branch: 21 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)) | live]
(push) ; 16
; [then-branch: 21 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (bounded<Bool> old_W1_T0@19@01)))
(pop) ; 16
(push) ; 16
; [else-branch: 21 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
; [eval] PI_list(ys.next) == old_W1_T0 && false
; [eval] PI_list(ys.next) == old_W1_T0
; [eval] PI_list(ys.next)
(push) ; 17
(declare-const $k@34@01 $Perm)
(assert ($Perm.isReadVar $k@34@01))
(assert (< $k@34@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@34@01)))
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@34@01)))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@34@01))
(assert (and (< $k@34@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@34@01))))
(set-option :timeout 0)
(push) ; 17
; [then-branch: 22 | PI_list((Null, _), n@31@01) != old_W1_T0@19@01 | live]
; [else-branch: 22 | PI_list((Null, _), n@31@01) == old_W1_T0@19@01 | live]
(push) ; 18
; [then-branch: 22 | PI_list((Null, _), n@31@01) != old_W1_T0@19@01]
(assert (not
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)))
(pop) ; 18
(push) ; 18
; [else-branch: 22 | PI_list((Null, _), n@31@01) == old_W1_T0@19@01]
(assert (=
  (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
  old_W1_T0@19@01))
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)
  (not
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@34@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01)))
    (< $k@34@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@34@01))
    (or
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01)
      (not
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert ($Perm.isReadVar $k@33@01))
(assert ($Perm.isReadVar $k@34@01))
(assert (=>
  (not (= n@31@01 $Ref.null))
  (and
    (< $k@33@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@33@01))
    (PI_list%precondition ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01)
    (or
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (not
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)))
    (=>
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (not
          (and
            (decreasing<Bool> (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01) old_W1_T0@19@01)
            (bounded<Bool> old_W1_T0@19@01)))
        (< $k@34@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@34@01))
        (or
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01)
          (not
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01)))))
    (or
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01))))))
(push) ; 13
(assert (not (=>
  (not (= n@31@01 $Ref.null))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] true && ys.next != null ==> (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] true && ys.next != null
(set-option :timeout 0)
(push) ; 13
; [then-branch: 23 | False | live]
; [else-branch: 23 | True | live]
(push) ; 14
; [then-branch: 23 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 23 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
; [eval] ys.next != null
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(set-option :timeout 0)
(push) ; 13
(push) ; 14
(set-option :timeout 10)
(assert (not (= n@31@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | n@31@01 != Null | live]
; [else-branch: 24 | n@31@01 == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 24 | n@31@01 != Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool)
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool)
; [eval] PI_list(ys.next)
(set-option :timeout 0)
(push) ; 15
(declare-const $k@35@01 $Perm)
(assert ($Perm.isReadVar $k@35@01))
(assert (< $k@35@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@35@01)))
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No $k@35@01)))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) n@31@01))
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@35@01))
(assert (and
  (< $k@35@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@35@01))
  (PI_list%precondition ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01)))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 25 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01)) | live]
; [else-branch: 25 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) | live]
(push) ; 16
; [then-branch: 25 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 25 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01)]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) n@31@01) old_W1_T0@19@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] (bounded(old_W1_T0): Bool)
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01))
  (and
    (not
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01))
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01)))))
; Joined path conditions
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01)))))
(assert (or
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01))))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 26 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01) | live]
; [else-branch: 26 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)) | live]
(push) ; 16
; [then-branch: 26 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (bounded<Bool> old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 26 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] PI_list(ys.next) == old_W1_T0 && false
; [eval] PI_list(ys.next) == old_W1_T0
; [eval] PI_list(ys.next)
(set-option :timeout 0)
(push) ; 17
(declare-const $k@36@01 $Perm)
(assert ($Perm.isReadVar $k@36@01))
(assert (< $k@36@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@36@01)))
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@36@01)))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert (and (< $k@36@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@36@01))))
(set-option :timeout 0)
(push) ; 17
; [then-branch: 27 | PI_list((Null, _), n@31@01) != old_W1_T0@19@01 | live]
; [else-branch: 27 | PI_list((Null, _), n@31@01) == old_W1_T0@19@01 | live]
(push) ; 18
; [then-branch: 27 | PI_list((Null, _), n@31@01) != old_W1_T0@19@01]
(assert (not
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(pop) ; 18
(set-option :timeout 0)
(push) ; 18
; [else-branch: 27 | PI_list((Null, _), n@31@01) == old_W1_T0@19@01]
(assert (=
  (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
  old_W1_T0@19@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(pop) ; 18
(pop) ; 17
; Joined path conditions
(assert (=>
  (not
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01))
  (and
    (not
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01))
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01)))))
; Joined path conditions
(assert (=>
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)
  (and
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01)
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01)))))
(assert (or
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)
  (not
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01)
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01)))
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01))
    (< $k@36@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@36@01))
    (=>
      (not
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01))
      (and
        (not
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01))
        (not (= ys@20@01 ys@12@01))
        (not (= ys@12@01 ys@20@01))))
    (=>
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01)
      (and
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01)
        (not (= ys@20@01 ys@12@01))
        (not (= ys@12@01 ys@20@01))))
    (or
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01)
      (not
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert ($Perm.isReadVar $k@35@01))
(assert ($Perm.isReadVar $k@36@01))
(assert (=>
  (not (= n@31@01 $Ref.null))
  (and
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01))
    (< $k@35@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@35@01))
    (PI_list%precondition ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01)
    (=>
      (not
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01))
      (and
        (not
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01))
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))))
    (=>
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))))
    (or
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (not
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)))
    (=>
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01))
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01)
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))))
    (=>
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (not
          (and
            (decreasing<Bool> (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01) old_W1_T0@19@01)
            (bounded<Bool> old_W1_T0@19@01)))
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))
        (< $k@36@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@36@01))
        (=>
          (not
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01))
          (and
            (not
              (=
                (PI_list ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $Ref.null)
                  $Snap.unit) n@31@01)
                old_W1_T0@19@01))
            (not (= ys@20@01 ys@12@01))
            (not (= ys@12@01 ys@20@01))))
        (=>
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01)
          (and
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01)
            (not (= ys@20@01 ys@12@01))
            (not (= ys@12@01 ys@20@01))))
        (or
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01)
          (not
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01)))))
    (or
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01))))))
(set-option :timeout 0)
(push) ; 13
(assert (not (=>
  (not (= n@31@01 $Ref.null))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] true && ys.next != null ==> (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] true && ys.next != null
(set-option :timeout 0)
(push) ; 13
; [then-branch: 28 | False | live]
; [else-branch: 28 | True | live]
(push) ; 14
; [then-branch: 28 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (= n@31@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01))))
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 28 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] ys.next != null
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(set-option :timeout 0)
(push) ; 13
(push) ; 14
(set-option :timeout 10)
(assert (not (= n@31@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | n@31@01 != Null | live]
; [else-branch: 29 | n@31@01 == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 29 | n@31@01 != Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool)
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool)
; [eval] PI_list(ys.next)
(set-option :timeout 0)
(push) ; 15
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(assert (< $k@37@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@37@01)))
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) n@31@01))
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@37@01))
(assert (and
  (< $k@37@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@37@01))
  (PI_list%precondition ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01)))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 30 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01)) | live]
; [else-branch: 30 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) | live]
(push) ; 16
; [then-branch: 30 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 30 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01)]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) n@31@01) old_W1_T0@19@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
; [eval] (bounded(old_W1_T0): Bool)
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01))
  (and
    (not
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01))
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01)))))
; Joined path conditions
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01)))))
(assert (or
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01))))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 31 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01) | live]
; [else-branch: 31 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)) | live]
(push) ; 16
; [then-branch: 31 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (bounded<Bool> old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 31 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
; [eval] PI_list(ys.next) == old_W1_T0 && false
; [eval] PI_list(ys.next) == old_W1_T0
; [eval] PI_list(ys.next)
(set-option :timeout 0)
(push) ; 17
(declare-const $k@38@01 $Perm)
(assert ($Perm.isReadVar $k@38@01))
(assert (< $k@38@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@38@01)))
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@38@01)))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@38@01))
(assert (and (< $k@38@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@38@01))))
(set-option :timeout 0)
(push) ; 17
; [then-branch: 32 | PI_list((Null, _), n@31@01) != old_W1_T0@19@01 | live]
; [else-branch: 32 | PI_list((Null, _), n@31@01) == old_W1_T0@19@01 | live]
(push) ; 18
; [then-branch: 32 | PI_list((Null, _), n@31@01) != old_W1_T0@19@01]
(assert (not
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(pop) ; 18
(set-option :timeout 0)
(push) ; 18
; [else-branch: 32 | PI_list((Null, _), n@31@01) == old_W1_T0@19@01]
(assert (=
  (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
  old_W1_T0@19@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(pop) ; 18
(pop) ; 17
; Joined path conditions
(assert (=>
  (not
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01))
  (and
    (not
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01))
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01)))))
; Joined path conditions
(assert (=>
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)
  (and
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01)
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01)))))
(assert (or
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)
  (not
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01)
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@38@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01)))
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01))
    (< $k@38@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@38@01))
    (=>
      (not
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01))
      (and
        (not
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01))
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))))
    (=>
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01)
      (and
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01)
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))))
    (or
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01)
      (not
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert ($Perm.isReadVar $k@37@01))
(assert ($Perm.isReadVar $k@38@01))
(assert (=>
  (not (= n@31@01 $Ref.null))
  (and
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01))
    (< $k@37@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@37@01))
    (PI_list%precondition ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01)
    (=>
      (not
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01))
      (and
        (not
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01))
        (not (= ys@20@01 ys@12@01))
        (not (= ys@12@01 ys@20@01))))
    (=>
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (not (= ys@20@01 ys@12@01))
        (not (= ys@12@01 ys@20@01))))
    (or
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (not
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)))
    (=>
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01))
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01)
        (not (= ys@20@01 ys@12@01))
        (not (= ys@12@01 ys@20@01))))
    (=>
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (not
          (and
            (decreasing<Bool> (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01) old_W1_T0@19@01)
            (bounded<Bool> old_W1_T0@19@01)))
        (not (= ys@20@01 ys@12@01))
        (not (= ys@12@01 ys@20@01))
        (< $k@38@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@38@01))
        (=>
          (not
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01))
          (and
            (not
              (=
                (PI_list ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $Ref.null)
                  $Snap.unit) n@31@01)
                old_W1_T0@19@01))
            (not (= ys@12@01 ys@20@01))
            (not (= ys@20@01 ys@12@01))))
        (=>
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01)
          (and
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01)
            (not (= ys@12@01 ys@20@01))
            (not (= ys@20@01 ys@12@01))))
        (or
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01)
          (not
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01)))))
    (or
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01))))))
(set-option :timeout 0)
(push) ; 13
(assert (not (=>
  (not (= n@31@01 $Ref.null))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] true && ys.next != null ==> (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] true && ys.next != null
(set-option :timeout 0)
(push) ; 13
; [then-branch: 33 | False | live]
; [else-branch: 33 | True | live]
(push) ; 14
; [then-branch: 33 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 33 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
; [eval] ys.next != null
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(set-option :timeout 0)
(push) ; 13
(push) ; 14
(set-option :timeout 10)
(assert (not (= n@31@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | n@31@01 != Null | live]
; [else-branch: 34 | n@31@01 == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 34 | n@31@01 != Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || PI_list(ys.next) == old_W1_T0 && false
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool) && (bounded(old_W1_T0): Bool)
; [eval] (decreasing(PI_list(ys.next), old_W1_T0): Bool)
; [eval] PI_list(ys.next)
(set-option :timeout 0)
(push) ; 15
(declare-const $k@39@01 $Perm)
(assert ($Perm.isReadVar $k@39@01))
(assert (< $k@39@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@39@01)))
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) n@31@01))
(pop) ; 15
; Joined path conditions
(assert ($Perm.isReadVar $k@39@01))
(assert (and
  (< $k@39@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@39@01))
  (PI_list%precondition ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01)))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 35 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01)) | live]
; [else-branch: 35 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) | live]
(push) ; 16
; [then-branch: 35 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 35 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01)]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) n@31@01) old_W1_T0@19@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] (bounded(old_W1_T0): Bool)
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01))
  (and
    (not
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01))
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01)))))
; Joined path conditions
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01)))))
(assert (or
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01))))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 36 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01) | live]
; [else-branch: 36 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)) | live]
(push) ; 16
; [then-branch: 36 | decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01)]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    $Snap.unit) n@31@01) old_W1_T0@19@01)
  (bounded<Bool> old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(pop) ; 16
(set-option :timeout 0)
(push) ; 16
; [else-branch: 36 | !(decreasing[Bool](PI_list((Null, _), n@31@01), old_W1_T0@19@01) && bounded[Bool](old_W1_T0@19@01))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ys@20@01 ys@12@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
(assert (and (not (= ys@12@01 ys@20@01)) (not (= ys@20@01 ys@12@01))))
; [eval] PI_list(ys.next) == old_W1_T0 && false
; [eval] PI_list(ys.next) == old_W1_T0
; [eval] PI_list(ys.next)
(set-option :timeout 0)
(push) ; 17
(declare-const $k@40@01 $Perm)
(assert ($Perm.isReadVar $k@40@01))
(assert (< $k@40@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@40@01)))
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No $k@40@01)))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(pop) ; 17
; Joined path conditions
(assert ($Perm.isReadVar $k@40@01))
(assert (and (< $k@40@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@40@01))))
(set-option :timeout 0)
(push) ; 17
; [then-branch: 37 | PI_list((Null, _), n@31@01) != old_W1_T0@19@01 | live]
; [else-branch: 37 | PI_list((Null, _), n@31@01) == old_W1_T0@19@01 | live]
(push) ; 18
; [then-branch: 37 | PI_list((Null, _), n@31@01) != old_W1_T0@19@01]
(assert (not
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(pop) ; 18
(set-option :timeout 0)
(push) ; 18
; [else-branch: 37 | PI_list((Null, _), n@31@01) == old_W1_T0@19@01]
(assert (=
  (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
  old_W1_T0@19@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ys@12@01 ys@20@01)))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@16@01)) n@31@01))))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(assert (and (not (= ys@20@01 ys@12@01)) (not (= ys@12@01 ys@20@01))))
(pop) ; 18
(pop) ; 17
; Joined path conditions
(assert (=>
  (not
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01))
  (and
    (not
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01))
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01)))))
; Joined path conditions
(assert (=>
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)
  (and
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01)
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01)))))
(assert (or
  (=
    (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
    old_W1_T0@19@01)
  (not
    (=
      (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
      old_W1_T0@19@01))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01)
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@40@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01)))
    (not (= ys@12@01 ys@20@01))
    (not (= ys@20@01 ys@12@01))
    (< $k@40@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@40@01))
    (=>
      (not
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01))
      (and
        (not
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01))
        (not (= ys@20@01 ys@12@01))
        (not (= ys@12@01 ys@20@01))))
    (=>
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01)
      (and
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01)
        (not (= ys@20@01 ys@12@01))
        (not (= ys@12@01 ys@20@01))))
    (or
      (=
        (PI_list ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n@31@01)
        old_W1_T0@19@01)
      (not
        (=
          (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01)
          old_W1_T0@19@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (bounded<Bool> old_W1_T0@19@01)))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert ($Perm.isReadVar $k@39@01))
(assert ($Perm.isReadVar $k@40@01))
(assert (=>
  (not (= n@31@01 $Ref.null))
  (and
    (not (= ys@20@01 ys@12@01))
    (not (= ys@12@01 ys@20@01))
    (< $k@39@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@39@01))
    (PI_list%precondition ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01)
    (=>
      (not
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01))
      (and
        (not
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01))
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))))
    (=>
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))))
    (or
      (decreasing<Bool> (PI_list ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        $Snap.unit) n@31@01) old_W1_T0@19@01)
      (not
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)))
    (=>
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01))
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01)
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))))
    (=>
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (not
          (and
            (decreasing<Bool> (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01) old_W1_T0@19@01)
            (bounded<Bool> old_W1_T0@19@01)))
        (not (= ys@12@01 ys@20@01))
        (not (= ys@20@01 ys@12@01))
        (< $k@40@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@40@01))
        (=>
          (not
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01))
          (and
            (not
              (=
                (PI_list ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $Ref.null)
                  $Snap.unit) n@31@01)
                old_W1_T0@19@01))
            (not (= ys@20@01 ys@12@01))
            (not (= ys@12@01 ys@20@01))))
        (=>
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01)
          (and
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01)
            (not (= ys@20@01 ys@12@01))
            (not (= ys@12@01 ys@20@01))))
        (or
          (=
            (PI_list ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              $Snap.unit) n@31@01)
            old_W1_T0@19@01)
          (not
            (=
              (PI_list ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                $Snap.unit) n@31@01)
              old_W1_T0@19@01)))))
    (or
      (not
        (and
          (decreasing<Bool> (PI_list ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            $Snap.unit) n@31@01) old_W1_T0@19@01)
          (bounded<Bool> old_W1_T0@19@01)))
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          $Snap.unit) n@31@01) old_W1_T0@19@01)
        (bounded<Bool> old_W1_T0@19@01))))))
(set-option :timeout 0)
(push) ; 13
(assert (not (=>
  (not (= n@31@01 $Ref.null))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      $Snap.unit) n@31@01) old_W1_T0@19@01)
    (bounded<Bool> old_W1_T0@19@01)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(pop) ; 12
(pop) ; 11
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
