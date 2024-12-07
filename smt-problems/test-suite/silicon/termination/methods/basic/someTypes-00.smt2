(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:18
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/methods/basic/someTypes.vpr
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
; ---------- predicateTest1 ----------
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
(declare-const $t@3@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; // list_xs
; var list__16981330: PredicateInstance
(declare-const list__16981330@4@01 PredicateInstance)
; [exec]
; list__16981330 := PI_list(xs)
; [eval] PI_list(xs)
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
(declare-const list__16981330@6@01 PredicateInstance)
(assert (= list__16981330@6@01 (PI_list $t@2@01 xs@1@01)))
; [exec]
; unfold acc(list(xs), write)
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
; [eval] xs.next != null
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
; // list_xs.next
; var list_1681681832: PredicateInstance
(declare-const list_1681681832@7@01 PredicateInstance)
; [exec]
; list_1681681832 := PI_list(xs.next)
; [eval] PI_list(xs.next)
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
(declare-const list_1681681832@9@01 PredicateInstance)
(assert (=
  list_1681681832@9@01
  (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
; [exec]
; inhale nestedPredicates(list_1681681832, list__16981330)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] nestedPredicates(list_1681681832, list__16981330)
(assert (nestedPredicates<Bool> list_1681681832@9@01 list__16981330@6@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] xs.next != null
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
; [exec]
; assert (decreasing(PI_list(xs.next), old(PI_list(xs))): Bool) &&
;   (bounded(old(PI_list(xs))): Bool) ||
;   PI_list(xs.next) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs.next), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs.next) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs.next), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs.next), old(PI_list(xs))): Bool)
; [eval] PI_list(xs.next)
(push) ; 6
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(assert (< $k@11@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@11@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@11@01))
(assert (and (< $k@11@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@11@01))))
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 6
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(assert (< $k@12@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@12@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@12@01))
(assert (and (< $k@12@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@12@01))))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | !(decreasing[Bool](PI_list(Second:($t@2@01), First:($t@2@01)), PI_list($t@2@01, xs@1@01))) | live]
; [else-branch: 3 | decreasing[Bool](PI_list(Second:($t@2@01), First:($t@2@01)), PI_list($t@2@01, xs@1@01)) | live]
(push) ; 7
; [then-branch: 3 | !(decreasing[Bool](PI_list(Second:($t@2@01), First:($t@2@01)), PI_list($t@2@01, xs@1@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | decreasing[Bool](PI_list(Second:($t@2@01), First:($t@2@01)), PI_list($t@2@01, xs@1@01))]
(assert (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01)))
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(push) ; 8
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(assert (< $k@13@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@13@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@13@01))
(assert (and (< $k@13@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@13@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@13@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
    (< $k@13@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@13@01)))))
(assert (or
  (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
  (not
    (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01)))))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | decreasing[Bool](PI_list(Second:($t@2@01), First:($t@2@01)), PI_list($t@2@01, xs@1@01)) && bounded[Bool](PI_list($t@2@01, xs@1@01)) | live]
; [else-branch: 4 | !(decreasing[Bool](PI_list(Second:($t@2@01), First:($t@2@01)), PI_list($t@2@01, xs@1@01)) && bounded[Bool](PI_list($t@2@01, xs@1@01))) | live]
(push) ; 7
; [then-branch: 4 | decreasing[Bool](PI_list(Second:($t@2@01), First:($t@2@01)), PI_list($t@2@01, xs@1@01)) && bounded[Bool](PI_list($t@2@01, xs@1@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
  (bounded<Bool> (PI_list $t@2@01 xs@1@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | !(decreasing[Bool](PI_list(Second:($t@2@01), First:($t@2@01)), PI_list($t@2@01, xs@1@01)) && bounded[Bool](PI_list($t@2@01, xs@1@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
    (bounded<Bool> (PI_list $t@2@01 xs@1@01)))))
; [eval] PI_list(xs.next) == old(PI_list(xs)) && false
; [eval] PI_list(xs.next) == old(PI_list(xs))
; [eval] PI_list(xs.next)
(push) ; 8
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(assert (< $k@14@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@14@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@14@01))
(assert (and (< $k@14@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@14@01))))
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 8
(declare-const $k@15@01 $Perm)
(assert ($Perm.isReadVar $k@15@01))
(assert (< $k@15@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@15@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@15@01))
(assert (and (< $k@15@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@15@01))))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 5 | PI_list(Second:($t@2@01), First:($t@2@01)) != PI_list($t@2@01, xs@1@01) | live]
; [else-branch: 5 | PI_list(Second:($t@2@01), First:($t@2@01)) == PI_list($t@2@01, xs@1@01) | live]
(push) ; 9
; [then-branch: 5 | PI_list(Second:($t@2@01), First:($t@2@01)) != PI_list($t@2@01, xs@1@01)]
(assert (not
  (=
    (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
    (PI_list $t@2@01 xs@1@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 5 | PI_list(Second:($t@2@01), First:($t@2@01)) == PI_list($t@2@01, xs@1@01)]
(assert (=
  (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
  (PI_list $t@2@01 xs@1@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
    (PI_list $t@2@01 xs@1@01))
  (not
    (=
      (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
      (PI_list $t@2@01 xs@1@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@14@01))
(assert ($Perm.isReadVar $k@15@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
      (bounded<Bool> (PI_list $t@2@01 xs@1@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
        (bounded<Bool> (PI_list $t@2@01 xs@1@01))))
    (< $k@14@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@14@01))
    (< $k@15@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@15@01))
    (or
      (=
        (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
        (PI_list $t@2@01 xs@1@01))
      (not
        (=
          (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
          (PI_list $t@2@01 xs@1@01)))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
      (bounded<Bool> (PI_list $t@2@01 xs@1@01))))
  (and
    (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
    (bounded<Bool> (PI_list $t@2@01 xs@1@01)))))
(push) ; 6
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
  (bounded<Bool> (PI_list $t@2@01 xs@1@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (decreasing<Bool> (PI_list ($Snap.second $t@2@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (PI_list $t@2@01 xs@1@01))
  (bounded<Bool> (PI_list $t@2@01 xs@1@01))))
; [exec]
; predicateTest1(xs.next)
(declare-const $t@16@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(list(xs), write)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:($t@2@01) != Null | live]
; [else-branch: 6 | First:($t@2@01) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | First:($t@2@01) != Null]
(assert (list%trigger ($Snap.combine ($Snap.first $t@2@01) $t@16@01) xs@1@01))
(pop) ; 6
(pop) ; 5
; [eval] !(xs.next != null)
; [eval] xs.next != null
; [then-branch: 7 | First:($t@2@01) == Null | dead]
; [else-branch: 7 | First:($t@2@01) != Null | live]
(push) ; 5
; [else-branch: 7 | First:($t@2@01) != Null]
(pop) ; 5
(pop) ; 4
; [eval] !(xs.next != null)
; [eval] xs.next != null
; [then-branch: 8 | First:($t@2@01) == Null | dead]
; [else-branch: 8 | First:($t@2@01) != Null | live]
(push) ; 4
; [else-branch: 8 | First:($t@2@01) != Null]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:($t@2@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger $t@2@01 xs@1@01))
; [eval] xs.next != null
; [then-branch: 9 | First:($t@2@01) != Null | dead]
; [else-branch: 9 | First:($t@2@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 9 | First:($t@2@01) == Null]
(pop) ; 4
; [eval] !(xs.next != null)
; [eval] xs.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:($t@2@01) == Null | live]
; [else-branch: 10 | First:($t@2@01) != Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | First:($t@2@01) == Null]
; [eval] xs.next != null
; [then-branch: 11 | First:($t@2@01) != Null | dead]
; [else-branch: 11 | First:($t@2@01) == Null | live]
(push) ; 5
; [else-branch: 11 | First:($t@2@01) == Null]
(pop) ; 5
; [eval] !(xs.next != null)
; [eval] xs.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:($t@2@01) == Null | live]
; [else-branch: 12 | First:($t@2@01) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | First:($t@2@01) == Null]
; [exec]
; fold acc(list(xs), write)
; [eval] xs.next != null
; [then-branch: 13 | First:($t@2@01) != Null | dead]
; [else-branch: 13 | First:($t@2@01) == Null | live]
(push) ; 6
; [else-branch: 13 | First:($t@2@01) == Null]
(assert (list%trigger ($Snap.combine ($Snap.first $t@2@01) $Snap.unit) xs@1@01))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- predicateTest2 ----------
(declare-const xs@17@01 $Ref)
(declare-const xs@18@01 $Ref)
(push) ; 1
(declare-const $t@19@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@20@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; // list_xs
; var list__169813300: PredicateInstance
(declare-const list__169813300@21@01 PredicateInstance)
; [exec]
; list__169813300 := PI_list(xs)
; [eval] PI_list(xs)
(push) ; 3
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(assert (< $k@22@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@22@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition $t@19@01 xs@18@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@22@01))
(assert (and
  (< $k@22@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@22@01))
  (PI_list%precondition $t@19@01 xs@18@01)))
(declare-const list__169813300@23@01 PredicateInstance)
(assert (= list__169813300@23@01 (PI_list $t@19@01 xs@18@01)))
; [exec]
; unfold acc(list(xs), write)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (not (= xs@18@01 $Ref.null)))
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:($t@19@01) != Null | live]
; [else-branch: 14 | First:($t@19@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | First:($t@19@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger $t@19@01 xs@18@01))
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:($t@19@01) != Null | live]
; [else-branch: 15 | First:($t@19@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | First:($t@19@01) != Null]
; [exec]
; // list_xs.next
; var list_16816818320: PredicateInstance
(declare-const list_16816818320@24@01 PredicateInstance)
; [exec]
; list_16816818320 := PI_list(xs.next)
; [eval] PI_list(xs.next)
(push) ; 5
(declare-const $k@25@01 $Perm)
(assert ($Perm.isReadVar $k@25@01))
(assert (< $k@25@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@25@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@25@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.second $t@19@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01))))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@25@01))
(assert (and
  (< $k@25@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@25@01))
  (PI_list%precondition ($Snap.second $t@19@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01)))))
(declare-const list_16816818320@26@01 PredicateInstance)
(assert (=
  list_16816818320@26@01
  (PI_list ($Snap.second $t@19@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01)))))
; [exec]
; inhale nestedPredicates(list_16816818320, list__169813300)
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] nestedPredicates(list_16816818320, list__169813300)
(assert (nestedPredicates<Bool> list_16816818320@26@01 list__169813300@23@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !(xs.next != null)
; [eval] xs.next != null
; [then-branch: 16 | First:($t@19@01) == Null | dead]
; [else-branch: 16 | First:($t@19@01) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 16 | First:($t@19@01) != Null]
(pop) ; 5
; [eval] xs.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | First:($t@19@01) != Null | live]
; [else-branch: 17 | First:($t@19@01) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | First:($t@19@01) != Null]
; [exec]
; fold acc(list(xs), write)
; [eval] xs.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@19@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | First:($t@19@01) != Null | live]
; [else-branch: 18 | First:($t@19@01) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 18 | First:($t@19@01) != Null]
(assert (list%trigger ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01))
; [exec]
; assert (decreasing(PI_list(xs), old(PI_list(xs))): Bool) &&
;   (bounded(old(PI_list(xs))): Bool) ||
;   PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool)
; [eval] PI_list(xs)
(push) ; 7
(declare-const $k@28@01 $Perm)
(assert ($Perm.isReadVar $k@28@01))
(assert (< $k@28@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@28@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@28@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.second $t@19@01)) xs@18@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@28@01))
(assert (and
  (< $k@28@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@28@01))
  (PI_list%precondition ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01)))
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@29@01 $Perm)
(assert ($Perm.isReadVar $k@29@01))
(assert (< $k@29@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@29@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@29@01))
(assert (and (< $k@29@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@29@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 19 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01))) | live]
; [else-branch: 19 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) | live]
(push) ; 8
; [then-branch: 19 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01))]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01)))
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(push) ; 9
(declare-const $k@30@01 $Perm)
(assert ($Perm.isReadVar $k@30@01))
(assert (< $k@30@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@30@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@30@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@30@01))
(assert (and (< $k@30@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@30@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@30@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (< $k@30@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@30@01)))))
(assert (or
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01)))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 20 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01)) | live]
; [else-branch: 20 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01))) | live]
(push) ; 8
; [then-branch: 20 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
; [eval] PI_list(xs) == old(PI_list(xs)) && false
; [eval] PI_list(xs) == old(PI_list(xs))
; [eval] PI_list(xs)
(push) ; 9
(declare-const $k@31@01 $Perm)
(assert ($Perm.isReadVar $k@31@01))
(assert (< $k@31@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@31@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@31@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@31@01))
(assert (and (< $k@31@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@31@01))))
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@32@01 $Perm)
(assert ($Perm.isReadVar $k@32@01))
(assert (< $k@32@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@32@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@32@01))
(assert (and (< $k@32@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@32@01))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 21 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) != PI_list($t@19@01, xs@18@01) | live]
; [else-branch: 21 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) == PI_list($t@19@01, xs@18@01) | live]
(push) ; 10
; [then-branch: 21 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) != PI_list($t@19@01, xs@18@01)]
(assert (not
  (=
    (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
    (PI_list $t@19@01 xs@18@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 21 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) == PI_list($t@19@01, xs@18@01)]
(assert (=
  (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
  (PI_list $t@19@01 xs@18@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
    (PI_list $t@19@01 xs@18@01))
  (not
    (=
      (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
      (PI_list $t@19@01 xs@18@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@31@01))
(assert ($Perm.isReadVar $k@32@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
      (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
        (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
    (< $k@31@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@31@01))
    (< $k@32@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@32@01))
    (or
      (=
        (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
        (PI_list $t@19@01 xs@18@01))
      (not
        (=
          (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
          (PI_list $t@19@01 xs@18@01)))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
      (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
(push) ; 7
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool)
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@33@01 $Perm)
(assert ($Perm.isReadVar $k@33@01))
(assert (< $k@33@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@33@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@33@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@33@01))
(assert (and (< $k@33@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@33@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@34@01 $Perm)
(assert ($Perm.isReadVar $k@34@01))
(assert (< $k@34@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@34@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@34@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@34@01))
(assert (and (< $k@34@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@34@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 22 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01))) | live]
; [else-branch: 22 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) | live]
(push) ; 8
; [then-branch: 22 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 22 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01))]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@35@01 $Perm)
(assert ($Perm.isReadVar $k@35@01))
(assert (< $k@35@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@35@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@35@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@35@01))
(assert (and (< $k@35@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@35@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@35@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (< $k@35@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@35@01)))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 23 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01)) | live]
; [else-branch: 23 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01))) | live]
(push) ; 8
; [then-branch: 23 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 23 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] PI_list(xs) == old(PI_list(xs)) && false
; [eval] PI_list(xs) == old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@36@01 $Perm)
(assert ($Perm.isReadVar $k@36@01))
(assert (< $k@36@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@36@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@36@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert (and (< $k@36@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@36@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(assert (< $k@37@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@37@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@37@01))
(assert (and (< $k@37@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@37@01))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 24 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) != PI_list($t@19@01, xs@18@01) | live]
; [else-branch: 24 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) == PI_list($t@19@01, xs@18@01) | live]
(push) ; 10
; [then-branch: 24 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) != PI_list($t@19@01, xs@18@01)]
(assert (not
  (=
    (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
    (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 24 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) == PI_list($t@19@01, xs@18@01)]
(assert (=
  (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
  (PI_list $t@19@01 xs@18@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
    (PI_list $t@19@01 xs@18@01))
  (not
    (=
      (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
      (PI_list $t@19@01 xs@18@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert ($Perm.isReadVar $k@37@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
      (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
        (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
    (< $k@36@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@36@01))
    (< $k@37@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@37@01))
    (or
      (=
        (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
        (PI_list $t@19@01 xs@18@01))
      (not
        (=
          (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
          (PI_list $t@19@01 xs@18@01)))))))
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool)
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@38@01 $Perm)
(assert ($Perm.isReadVar $k@38@01))
(assert (< $k@38@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@38@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@38@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@38@01))
(assert (and (< $k@38@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@38@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@39@01 $Perm)
(assert ($Perm.isReadVar $k@39@01))
(assert (< $k@39@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@39@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@39@01))
(assert (and (< $k@39@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@39@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 25 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01))) | live]
; [else-branch: 25 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) | live]
(push) ; 8
; [then-branch: 25 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 25 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01))]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@40@01 $Perm)
(assert ($Perm.isReadVar $k@40@01))
(assert (< $k@40@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@40@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@40@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@40@01))
(assert (and (< $k@40@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@40@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@40@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (< $k@40@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@40@01)))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 26 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01)) | live]
; [else-branch: 26 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01))) | live]
(push) ; 8
; [then-branch: 26 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 26 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] PI_list(xs) == old(PI_list(xs)) && false
; [eval] PI_list(xs) == old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@41@01 $Perm)
(assert ($Perm.isReadVar $k@41@01))
(assert (< $k@41@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@41@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@41@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@41@01))
(assert (and (< $k@41@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@41@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@42@01 $Perm)
(assert ($Perm.isReadVar $k@42@01))
(assert (< $k@42@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@42@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@42@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@42@01))
(assert (and (< $k@42@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@42@01))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 27 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) != PI_list($t@19@01, xs@18@01) | live]
; [else-branch: 27 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) == PI_list($t@19@01, xs@18@01) | live]
(push) ; 10
; [then-branch: 27 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) != PI_list($t@19@01, xs@18@01)]
(assert (not
  (=
    (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
    (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 27 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) == PI_list($t@19@01, xs@18@01)]
(assert (=
  (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
  (PI_list $t@19@01 xs@18@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
    (PI_list $t@19@01 xs@18@01))
  (not
    (=
      (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
      (PI_list $t@19@01 xs@18@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@41@01))
(assert ($Perm.isReadVar $k@42@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
      (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
        (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
    (< $k@41@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@41@01))
    (< $k@42@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@42@01))
    (or
      (=
        (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
        (PI_list $t@19@01 xs@18@01))
      (not
        (=
          (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
          (PI_list $t@19@01 xs@18@01)))))))
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool)
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@43@01 $Perm)
(assert ($Perm.isReadVar $k@43@01))
(assert (< $k@43@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@43@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@43@01))
(assert (and (< $k@43@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@43@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@44@01 $Perm)
(assert ($Perm.isReadVar $k@44@01))
(assert (< $k@44@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@44@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@44@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@44@01))
(assert (and (< $k@44@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@44@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 28 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01))) | live]
; [else-branch: 28 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) | live]
(push) ; 8
; [then-branch: 28 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 28 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01))]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@45@01 $Perm)
(assert ($Perm.isReadVar $k@45@01))
(assert (< $k@45@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@45@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@45@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@45@01))
(assert (and (< $k@45@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@45@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@45@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (< $k@45@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@45@01)))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 29 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01)) | live]
; [else-branch: 29 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01))) | live]
(push) ; 8
; [then-branch: 29 | decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 29 | !(decreasing[Bool](PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01), PI_list($t@19@01, xs@18@01)) && bounded[Bool](PI_list($t@19@01, xs@18@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
    (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] PI_list(xs) == old(PI_list(xs)) && false
; [eval] PI_list(xs) == old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@46@01 $Perm)
(assert ($Perm.isReadVar $k@46@01))
(assert (< $k@46@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@46@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@46@01))
(assert (and (< $k@46@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@46@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@47@01 $Perm)
(assert ($Perm.isReadVar $k@47@01))
(assert (< $k@47@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@47@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@47@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@47@01))
(assert (and (< $k@47@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@47@01))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 30 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) != PI_list($t@19@01, xs@18@01) | live]
; [else-branch: 30 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) == PI_list($t@19@01, xs@18@01) | live]
(push) ; 10
; [then-branch: 30 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) != PI_list($t@19@01, xs@18@01)]
(assert (not
  (=
    (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
    (PI_list $t@19@01 xs@18@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 30 | PI_list((First:($t@19@01), Second:($t@19@01)), xs@18@01) == PI_list($t@19@01, xs@18@01)]
(assert (=
  (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
  (PI_list $t@19@01 xs@18@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
    (PI_list $t@19@01 xs@18@01))
  (not
    (=
      (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
      (PI_list $t@19@01 xs@18@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@46@01))
(assert ($Perm.isReadVar $k@47@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
      (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
        (bounded<Bool> (PI_list $t@19@01 xs@18@01))))
    (< $k@46@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@46@01))
    (< $k@47@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@47@01))
    (or
      (=
        (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
        (PI_list $t@19@01 xs@18@01))
      (not
        (=
          (PI_list ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01)) xs@18@01)
          (PI_list $t@19@01 xs@18@01)))))))
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.second $t@19@01)) xs@18@01) (PI_list $t@19@01 xs@18@01))
  (bounded<Bool> (PI_list $t@19@01 xs@18@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- predicateTest3 ----------
(declare-const xs@48@01 $Ref)
(declare-const xs@49@01 $Ref)
(push) ; 1
(declare-const $t@50@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@51@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; // list_xs
; var list__169813301: PredicateInstance
(declare-const list__169813301@52@01 PredicateInstance)
; [exec]
; list__169813301 := PI_list(xs)
; [eval] PI_list(xs)
(push) ; 3
(declare-const $k@53@01 $Perm)
(assert ($Perm.isReadVar $k@53@01))
(assert (< $k@53@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@53@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@53@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition $t@50@01 xs@49@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@53@01))
(assert (and
  (< $k@53@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@53@01))
  (PI_list%precondition $t@50@01 xs@49@01)))
(declare-const list__169813301@54@01 PredicateInstance)
(assert (= list__169813301@54@01 (PI_list $t@50@01 xs@49@01)))
; [exec]
; unfold acc(list(xs), 2 / 3)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (not (= xs@49@01 $Ref.null)))
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | First:($t@50@01) != Null | live]
; [else-branch: 31 | First:($t@50@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 31 | First:($t@50@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger $t@50@01 xs@49@01))
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | First:($t@50@01) != Null | live]
; [else-branch: 32 | First:($t@50@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 32 | First:($t@50@01) != Null]
; [exec]
; // list_xs.next
; var list_16816818321: PredicateInstance
(declare-const list_16816818321@55@01 PredicateInstance)
; [exec]
; list_16816818321 := PI_list(xs.next)
; [eval] PI_list(xs.next)
(push) ; 5
(declare-const $k@56@01 $Perm)
(assert ($Perm.isReadVar $k@56@01))
(assert (< $k@56@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@56@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@56@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@56@01))
(assert (and
  (< $k@56@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@56@01))
  (PI_list%precondition ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)))))
(declare-const list_16816818321@57@01 PredicateInstance)
(assert (=
  list_16816818321@57@01
  (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)))))
; [exec]
; inhale nestedPredicates(list_16816818321, list__169813301)
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 $Snap.unit))
; [eval] nestedPredicates(list_16816818321, list__169813301)
(assert (nestedPredicates<Bool> list_16816818321@57@01 list__169813301@54@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | First:($t@50@01) != Null | live]
; [else-branch: 33 | First:($t@50@01) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 33 | First:($t@50@01) != Null]
; [exec]
; assert (decreasing(PI_list(xs.next), old(PI_list(xs))): Bool) &&
;   (bounded(old(PI_list(xs))): Bool) ||
;   PI_list(xs.next) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs.next), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs.next) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs.next), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs.next), old(PI_list(xs))): Bool)
; [eval] PI_list(xs.next)
(push) ; 6
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(assert (< $k@59@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@59@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@59@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@59@01))
(assert (and
  (< $k@59@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@59@01))))
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 6
(declare-const $k@60@01 $Perm)
(assert ($Perm.isReadVar $k@60@01))
(assert (< $k@60@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@60@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@60@01))
(assert (and
  (< $k@60@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@60@01))))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 34 | !(decreasing[Bool](PI_list(Second:($t@50@01), First:($t@50@01)), PI_list($t@50@01, xs@49@01))) | live]
; [else-branch: 34 | decreasing[Bool](PI_list(Second:($t@50@01), First:($t@50@01)), PI_list($t@50@01, xs@49@01)) | live]
(push) ; 7
; [then-branch: 34 | !(decreasing[Bool](PI_list(Second:($t@50@01), First:($t@50@01)), PI_list($t@50@01, xs@49@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 34 | decreasing[Bool](PI_list(Second:($t@50@01), First:($t@50@01)), PI_list($t@50@01, xs@49@01))]
(assert (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01)))
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(push) ; 8
(declare-const $k@61@01 $Perm)
(assert ($Perm.isReadVar $k@61@01))
(assert (< $k@61@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@61@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@61@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@61@01))
(assert (and
  (< $k@61@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@61@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@61@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
    (< $k@61@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@61@01)))))
(assert (or
  (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
  (not
    (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01)))))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 35 | decreasing[Bool](PI_list(Second:($t@50@01), First:($t@50@01)), PI_list($t@50@01, xs@49@01)) && bounded[Bool](PI_list($t@50@01, xs@49@01)) | live]
; [else-branch: 35 | !(decreasing[Bool](PI_list(Second:($t@50@01), First:($t@50@01)), PI_list($t@50@01, xs@49@01)) && bounded[Bool](PI_list($t@50@01, xs@49@01))) | live]
(push) ; 7
; [then-branch: 35 | decreasing[Bool](PI_list(Second:($t@50@01), First:($t@50@01)), PI_list($t@50@01, xs@49@01)) && bounded[Bool](PI_list($t@50@01, xs@49@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
  (bounded<Bool> (PI_list $t@50@01 xs@49@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 35 | !(decreasing[Bool](PI_list(Second:($t@50@01), First:($t@50@01)), PI_list($t@50@01, xs@49@01)) && bounded[Bool](PI_list($t@50@01, xs@49@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
    (bounded<Bool> (PI_list $t@50@01 xs@49@01)))))
; [eval] PI_list(xs.next) == old(PI_list(xs)) && false
; [eval] PI_list(xs.next) == old(PI_list(xs))
; [eval] PI_list(xs.next)
(push) ; 8
(declare-const $k@62@01 $Perm)
(assert ($Perm.isReadVar $k@62@01))
(assert (< $k@62@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@62@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@62@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@62@01))
(assert (and
  (< $k@62@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@62@01))))
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 8
(declare-const $k@63@01 $Perm)
(assert ($Perm.isReadVar $k@63@01))
(assert (< $k@63@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@63@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@63@01))
(assert (and
  (< $k@63@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@63@01))))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 36 | PI_list(Second:($t@50@01), First:($t@50@01)) != PI_list($t@50@01, xs@49@01) | live]
; [else-branch: 36 | PI_list(Second:($t@50@01), First:($t@50@01)) == PI_list($t@50@01, xs@49@01) | live]
(push) ; 9
; [then-branch: 36 | PI_list(Second:($t@50@01), First:($t@50@01)) != PI_list($t@50@01, xs@49@01)]
(assert (not
  (=
    (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)))
    (PI_list $t@50@01 xs@49@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 36 | PI_list(Second:($t@50@01), First:($t@50@01)) == PI_list($t@50@01, xs@49@01)]
(assert (=
  (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)))
  (PI_list $t@50@01 xs@49@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)))
    (PI_list $t@50@01 xs@49@01))
  (not
    (=
      (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)))
      (PI_list $t@50@01 xs@49@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@62@01))
(assert ($Perm.isReadVar $k@63@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
      (bounded<Bool> (PI_list $t@50@01 xs@49@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
        (bounded<Bool> (PI_list $t@50@01 xs@49@01))))
    (< $k@62@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@62@01))
    (< $k@63@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@63@01))
    (or
      (=
        (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)))
        (PI_list $t@50@01 xs@49@01))
      (not
        (=
          (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)))
          (PI_list $t@50@01 xs@49@01)))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
      (bounded<Bool> (PI_list $t@50@01 xs@49@01))))
  (and
    (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
    (bounded<Bool> (PI_list $t@50@01 xs@49@01)))))
(push) ; 6
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
  (bounded<Bool> (PI_list $t@50@01 xs@49@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (decreasing<Bool> (PI_list ($Snap.second $t@50@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))) (PI_list $t@50@01 xs@49@01))
  (bounded<Bool> (PI_list $t@50@01 xs@49@01))))
; [exec]
; predicateTest3(xs.next)
(declare-const $t@64@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(list(xs), 2 / 3)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | First:($t@50@01) != Null | live]
; [else-branch: 37 | First:($t@50@01) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 37 | First:($t@50@01) != Null]
(assert (list%trigger ($Snap.combine ($Snap.first $t@50@01) $t@64@01) xs@49@01))
(pop) ; 6
(pop) ; 5
; [eval] !(xs.next != null)
; [eval] xs.next != null
; [then-branch: 38 | First:($t@50@01) == Null | dead]
; [else-branch: 38 | First:($t@50@01) != Null | live]
(push) ; 5
; [else-branch: 38 | First:($t@50@01) != Null]
(pop) ; 5
(pop) ; 4
; [eval] !(xs.next != null)
; [eval] xs.next != null
; [then-branch: 39 | First:($t@50@01) == Null | dead]
; [else-branch: 39 | First:($t@50@01) != Null | live]
(push) ; 4
; [else-branch: 39 | First:($t@50@01) != Null]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 31 | First:($t@50@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null))
(assert (= ($Snap.second $t@50@01) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger $t@50@01 xs@49@01))
; [eval] xs.next != null
; [then-branch: 40 | First:($t@50@01) != Null | dead]
; [else-branch: 40 | First:($t@50@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 40 | First:($t@50@01) == Null]
(pop) ; 4
; [eval] !(xs.next != null)
; [eval] xs.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | First:($t@50@01) == Null | live]
; [else-branch: 41 | First:($t@50@01) != Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 41 | First:($t@50@01) == Null]
; [eval] xs.next != null
; [then-branch: 42 | First:($t@50@01) != Null | dead]
; [else-branch: 42 | First:($t@50@01) == Null | live]
(push) ; 5
; [else-branch: 42 | First:($t@50@01) == Null]
(pop) ; 5
; [eval] !(xs.next != null)
; [eval] xs.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | First:($t@50@01) == Null | live]
; [else-branch: 43 | First:($t@50@01) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 43 | First:($t@50@01) == Null]
; [exec]
; fold acc(list(xs), 2 / 3)
; [eval] xs.next != null
; [then-branch: 44 | First:($t@50@01) != Null | dead]
; [else-branch: 44 | First:($t@50@01) == Null | live]
(push) ; 6
; [else-branch: 44 | First:($t@50@01) == Null]
(assert (list%trigger ($Snap.combine ($Snap.first $t@50@01) $Snap.unit) xs@49@01))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- predicateTest4 ----------
(declare-const xs@65@01 $Ref)
(declare-const xs@66@01 $Ref)
(push) ; 1
(declare-const $t@67@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@68@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; // list_xs
; var list__169813302: PredicateInstance
(declare-const list__169813302@69@01 PredicateInstance)
; [exec]
; list__169813302 := PI_list(xs)
; [eval] PI_list(xs)
(push) ; 3
(declare-const $k@70@01 $Perm)
(assert ($Perm.isReadVar $k@70@01))
(assert (< $k@70@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@70@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition $t@67@01 xs@66@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@70@01))
(assert (and
  (< $k@70@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@70@01))
  (PI_list%precondition $t@67@01 xs@66@01)))
(declare-const list__169813302@71@01 PredicateInstance)
(assert (= list__169813302@71@01 (PI_list $t@67@01 xs@66@01)))
; [exec]
; unfold acc(list(xs), 2 / 3)
(assert (= $t@67@01 ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01))))
(assert (not (= xs@66@01 $Ref.null)))
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:($t@67@01) != Null | live]
; [else-branch: 45 | First:($t@67@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 45 | First:($t@67@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger $t@67@01 xs@66@01))
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | First:($t@67@01) != Null | live]
; [else-branch: 46 | First:($t@67@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 46 | First:($t@67@01) != Null]
; [exec]
; // list_xs.next
; var list_16816818322: PredicateInstance
(declare-const list_16816818322@72@01 PredicateInstance)
; [exec]
; list_16816818322 := PI_list(xs.next)
; [eval] PI_list(xs.next)
(push) ; 5
(declare-const $k@73@01 $Perm)
(assert ($Perm.isReadVar $k@73@01))
(assert (< $k@73@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@73@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@73@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.second $t@67@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01))))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@73@01))
(assert (and
  (< $k@73@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@73@01))
  (PI_list%precondition ($Snap.second $t@67@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01)))))
(declare-const list_16816818322@74@01 PredicateInstance)
(assert (=
  list_16816818322@74@01
  (PI_list ($Snap.second $t@67@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01)))))
; [exec]
; inhale nestedPredicates(list_16816818322, list__169813302)
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 $Snap.unit))
; [eval] nestedPredicates(list_16816818322, list__169813302)
(assert (nestedPredicates<Bool> list_16816818322@74@01 list__169813302@71@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !(xs.next != null)
; [eval] xs.next != null
; [then-branch: 47 | First:($t@67@01) == Null | dead]
; [else-branch: 47 | First:($t@67@01) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 47 | First:($t@67@01) != Null]
(pop) ; 5
; [eval] xs.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | First:($t@67@01) != Null | live]
; [else-branch: 48 | First:($t@67@01) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 48 | First:($t@67@01) != Null]
; [exec]
; fold acc(list(xs), 2 / 3)
; [eval] xs.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@67@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | First:($t@67@01) != Null | live]
; [else-branch: 49 | First:($t@67@01) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 49 | First:($t@67@01) != Null]
(assert (list%trigger ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01))
; [exec]
; assert (decreasing(PI_list(xs), old(PI_list(xs))): Bool) &&
;   (bounded(old(PI_list(xs))): Bool) ||
;   PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool)
; [eval] PI_list(xs)
(push) ; 7
(declare-const $k@76@01 $Perm)
(assert ($Perm.isReadVar $k@76@01))
(assert (< $k@76@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@76@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@76@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (PI_list%precondition ($Snap.combine
  ($Snap.first $t@67@01)
  ($Snap.second $t@67@01)) xs@66@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@76@01))
(assert (and
  (< $k@76@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@76@01))
  (PI_list%precondition ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01)))
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@77@01 $Perm)
(assert ($Perm.isReadVar $k@77@01))
(assert (< $k@77@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@77@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@77@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@77@01))
(assert (and
  (< $k@77@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@77@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 50 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01))) | live]
; [else-branch: 50 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) | live]
(push) ; 8
; [then-branch: 50 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 50 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01))]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($Snap.first $t@67@01)
  ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01)))
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(push) ; 9
(declare-const $k@78@01 $Perm)
(assert ($Perm.isReadVar $k@78@01))
(assert (< $k@78@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@78@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@78@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@78@01))
(assert (and
  (< $k@78@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@78@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@78@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (< $k@78@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@78@01)))))
(assert (or
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (not
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01)))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 51 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01)) | live]
; [else-branch: 51 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01))) | live]
(push) ; 8
; [then-branch: 51 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 51 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
; [eval] PI_list(xs) == old(PI_list(xs)) && false
; [eval] PI_list(xs) == old(PI_list(xs))
; [eval] PI_list(xs)
(push) ; 9
(declare-const $k@79@01 $Perm)
(assert ($Perm.isReadVar $k@79@01))
(assert (< $k@79@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@79@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@79@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@79@01))
(assert (and
  (< $k@79@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@79@01))))
; [eval] old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@80@01 $Perm)
(assert ($Perm.isReadVar $k@80@01))
(assert (< $k@80@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@80@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@80@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@80@01))
(assert (and
  (< $k@80@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@80@01))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 52 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) != PI_list($t@67@01, xs@66@01) | live]
; [else-branch: 52 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) == PI_list($t@67@01, xs@66@01) | live]
(push) ; 10
; [then-branch: 52 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) != PI_list($t@67@01, xs@66@01)]
(assert (not
  (=
    (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
    (PI_list $t@67@01 xs@66@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 52 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) == PI_list($t@67@01, xs@66@01)]
(assert (=
  (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
  (PI_list $t@67@01 xs@66@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
    (PI_list $t@67@01 xs@66@01))
  (not
    (=
      (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
      (PI_list $t@67@01 xs@66@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@79@01))
(assert ($Perm.isReadVar $k@80@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@67@01)
        ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
      (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($Snap.first $t@67@01)
          ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
        (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
    (< $k@79@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@79@01))
    (< $k@80@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@80@01))
    (or
      (=
        (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
        (PI_list $t@67@01 xs@66@01))
      (not
        (=
          (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
          (PI_list $t@67@01 xs@66@01)))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@67@01)
        ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
      (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
(push) ; 7
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool)
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@81@01 $Perm)
(assert ($Perm.isReadVar $k@81@01))
(assert (< $k@81@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@81@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@81@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@81@01))
(assert (and
  (< $k@81@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@81@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@82@01 $Perm)
(assert ($Perm.isReadVar $k@82@01))
(assert (< $k@82@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@82@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@82@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@82@01))
(assert (and
  (< $k@82@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@82@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 53 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01))) | live]
; [else-branch: 53 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) | live]
(push) ; 8
; [then-branch: 53 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 53 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01))]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($Snap.first $t@67@01)
  ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@83@01 $Perm)
(assert ($Perm.isReadVar $k@83@01))
(assert (< $k@83@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@83@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@83@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@83@01))
(assert (and
  (< $k@83@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@83@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@83@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (< $k@83@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@83@01)))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 54 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01)) | live]
; [else-branch: 54 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01))) | live]
(push) ; 8
; [then-branch: 54 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 54 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] PI_list(xs) == old(PI_list(xs)) && false
; [eval] PI_list(xs) == old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@84@01 $Perm)
(assert ($Perm.isReadVar $k@84@01))
(assert (< $k@84@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@84@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@84@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@84@01))
(assert (and
  (< $k@84@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@84@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@85@01 $Perm)
(assert ($Perm.isReadVar $k@85@01))
(assert (< $k@85@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@85@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@85@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@85@01))
(assert (and
  (< $k@85@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@85@01))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 55 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) != PI_list($t@67@01, xs@66@01) | live]
; [else-branch: 55 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) == PI_list($t@67@01, xs@66@01) | live]
(push) ; 10
; [then-branch: 55 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) != PI_list($t@67@01, xs@66@01)]
(assert (not
  (=
    (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
    (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 55 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) == PI_list($t@67@01, xs@66@01)]
(assert (=
  (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
  (PI_list $t@67@01 xs@66@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
    (PI_list $t@67@01 xs@66@01))
  (not
    (=
      (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
      (PI_list $t@67@01 xs@66@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@84@01))
(assert ($Perm.isReadVar $k@85@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@67@01)
        ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
      (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($Snap.first $t@67@01)
          ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
        (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
    (< $k@84@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@84@01))
    (< $k@85@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@85@01))
    (or
      (=
        (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
        (PI_list $t@67@01 xs@66@01))
      (not
        (=
          (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
          (PI_list $t@67@01 xs@66@01)))))))
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool)
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@86@01 $Perm)
(assert ($Perm.isReadVar $k@86@01))
(assert (< $k@86@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@86@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@86@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@86@01))
(assert (and
  (< $k@86@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@86@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@87@01 $Perm)
(assert ($Perm.isReadVar $k@87@01))
(assert (< $k@87@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@87@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@87@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@87@01))
(assert (and
  (< $k@87@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@87@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 56 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01))) | live]
; [else-branch: 56 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) | live]
(push) ; 8
; [then-branch: 56 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 56 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01))]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($Snap.first $t@67@01)
  ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@88@01 $Perm)
(assert ($Perm.isReadVar $k@88@01))
(assert (< $k@88@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@88@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@88@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@88@01))
(assert (and
  (< $k@88@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@88@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@88@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (< $k@88@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@88@01)))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 57 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01)) | live]
; [else-branch: 57 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01))) | live]
(push) ; 8
; [then-branch: 57 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 57 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] PI_list(xs) == old(PI_list(xs)) && false
; [eval] PI_list(xs) == old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@89@01 $Perm)
(assert ($Perm.isReadVar $k@89@01))
(assert (< $k@89@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@89@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@89@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@89@01))
(assert (and
  (< $k@89@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@89@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@90@01 $Perm)
(assert ($Perm.isReadVar $k@90@01))
(assert (< $k@90@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@90@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@90@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@90@01))
(assert (and
  (< $k@90@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@90@01))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 58 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) != PI_list($t@67@01, xs@66@01) | live]
; [else-branch: 58 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) == PI_list($t@67@01, xs@66@01) | live]
(push) ; 10
; [then-branch: 58 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) != PI_list($t@67@01, xs@66@01)]
(assert (not
  (=
    (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
    (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 58 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) == PI_list($t@67@01, xs@66@01)]
(assert (=
  (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
  (PI_list $t@67@01 xs@66@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
    (PI_list $t@67@01 xs@66@01))
  (not
    (=
      (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
      (PI_list $t@67@01 xs@66@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@89@01))
(assert ($Perm.isReadVar $k@90@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@67@01)
        ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
      (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($Snap.first $t@67@01)
          ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
        (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
    (< $k@89@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@89@01))
    (< $k@90@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@90@01))
    (or
      (=
        (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
        (PI_list $t@67@01 xs@66@01))
      (not
        (=
          (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
          (PI_list $t@67@01 xs@66@01)))))))
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool) || PI_list(xs) == old(PI_list(xs)) && false
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool) && (bounded(old(PI_list(xs))): Bool)
; [eval] (decreasing(PI_list(xs), old(PI_list(xs))): Bool)
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@91@01 $Perm)
(assert ($Perm.isReadVar $k@91@01))
(assert (< $k@91@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@91@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@91@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@91@01))
(assert (and
  (< $k@91@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@91@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@92@01 $Perm)
(assert ($Perm.isReadVar $k@92@01))
(assert (< $k@92@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@92@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@92@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@92@01))
(assert (and
  (< $k@92@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@92@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 59 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01))) | live]
; [else-branch: 59 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) | live]
(push) ; 8
; [then-branch: 59 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)))]
(assert (not
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 59 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01))]
(assert (decreasing<Bool> (PI_list ($Snap.combine
  ($Snap.first $t@67@01)
  ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(PI_list(xs))): Bool)
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@93@01 $Perm)
(assert ($Perm.isReadVar $k@93@01))
(assert (< $k@93@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@93@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@93@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@93@01))
(assert (and
  (< $k@93@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@93@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@93@01))
(assert (=>
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (< $k@93@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@93@01)))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 60 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01)) | live]
; [else-branch: 60 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01))) | live]
(push) ; 8
; [then-branch: 60 | decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01))]
(assert (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 60 | !(decreasing[Bool](PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01), PI_list($t@67@01, xs@66@01)) && bounded[Bool](PI_list($t@67@01, xs@66@01)))]
(assert (not
  (and
    (decreasing<Bool> (PI_list ($Snap.combine
      ($Snap.first $t@67@01)
      ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
    (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] PI_list(xs) == old(PI_list(xs)) && false
; [eval] PI_list(xs) == old(PI_list(xs))
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@94@01 $Perm)
(assert ($Perm.isReadVar $k@94@01))
(assert (< $k@94@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@94@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@94@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@94@01))
(assert (and
  (< $k@94@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@94@01))))
; [eval] old(PI_list(xs))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] PI_list(xs)
(set-option :timeout 0)
(push) ; 9
(declare-const $k@95@01 $Perm)
(assert ($Perm.isReadVar $k@95@01))
(assert (< $k@95@01 (/ (to_real 2) (to_real 3))))
(assert (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@95@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@95@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@95@01))
(assert (and
  (< $k@95@01 (/ (to_real 2) (to_real 3)))
  (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@95@01))))
(set-option :timeout 0)
(push) ; 9
; [then-branch: 61 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) != PI_list($t@67@01, xs@66@01) | live]
; [else-branch: 61 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) == PI_list($t@67@01, xs@66@01) | live]
(push) ; 10
; [then-branch: 61 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) != PI_list($t@67@01, xs@66@01)]
(assert (not
  (=
    (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
    (PI_list $t@67@01 xs@66@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 61 | PI_list((First:($t@67@01), Second:($t@67@01)), xs@66@01) == PI_list($t@67@01, xs@66@01)]
(assert (=
  (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
  (PI_list $t@67@01 xs@66@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
    (PI_list $t@67@01 xs@66@01))
  (not
    (=
      (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
      (PI_list $t@67@01 xs@66@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@94@01))
(assert ($Perm.isReadVar $k@95@01))
(assert (=>
  (not
    (and
      (decreasing<Bool> (PI_list ($Snap.combine
        ($Snap.first $t@67@01)
        ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
      (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
  (and
    (not
      (and
        (decreasing<Bool> (PI_list ($Snap.combine
          ($Snap.first $t@67@01)
          ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
        (bounded<Bool> (PI_list $t@67@01 xs@66@01))))
    (< $k@94@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@94@01))
    (< $k@95@01 (/ (to_real 2) (to_real 3)))
    (<= $Perm.No (- (/ (to_real 2) (to_real 3)) $k@95@01))
    (or
      (=
        (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
        (PI_list $t@67@01 xs@66@01))
      (not
        (=
          (PI_list ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01)) xs@66@01)
          (PI_list $t@67@01 xs@66@01)))))))
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (PI_list ($Snap.combine
    ($Snap.first $t@67@01)
    ($Snap.second $t@67@01)) xs@66@01) (PI_list $t@67@01 xs@66@01))
  (bounded<Bool> (PI_list $t@67@01 xs@66@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
