(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:28
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0134.vpr
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
; ---------- main01 ----------
(declare-const t1@0@01 $Ref)
(declare-const t2@1@01 $Ref)
(declare-const t1@2@01 $Ref)
(declare-const t2@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const $k@5@01 $Perm)
(assert ($Perm.isReadVar $k@5@01))
(assert (<= $Perm.No $k@5@01))
(assert (<= $k@5@01 $Perm.Write))
(assert (=> (< $Perm.No $k@5@01) (not (= t1@2@01 $Ref.null))))
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@2@01 t2@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@6@01))
(assert (<= $k@6@01 $Perm.Write))
(assert (=> (< $Perm.No $k@6@01) (not (= t2@3@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] t1 == t2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= t1@2@01 t2@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t1@2@01 t2@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | t1@2@01 == t2@3@01 | live]
; [else-branch: 0 | t1@2@01 != t2@3@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | t1@2@01 == t2@3@01]
(assert (= t1@2@01 t2@3@01))
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
(push) ; 4
(set-option :timeout 10)
(assert (not (= t2@3@01 t1@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@7@01 $Ref)
(assert (and
  (=>
    (< $Perm.No $k@6@01)
    (= $t@7@01 ($SortWrappers.$SnapTo$Ref ($Snap.second $t@4@01))))
  (=>
    (< $Perm.No $k@5@01)
    (= $t@7@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01))))))
(assert (<= $Perm.No (+ $k@6@01 $k@5@01)))
(assert (<= (+ $k@6@01 $k@5@01) $Perm.Write))
(assert (=> (< $Perm.No (+ $k@6@01 $k@5@01)) (not (= t2@3@01 $Ref.null))))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- main02 ----------
(declare-const t1@8@01 $Ref)
(declare-const t2@9@01 $Ref)
(declare-const t1@10@01 $Ref)
(declare-const t2@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(assert (<= $Perm.No $k@13@01))
(assert (<= $k@13@01 $Perm.Write))
(assert (=> (< $Perm.No $k@13@01) (not (= t1@10@01 $Ref.null))))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@10@01 t2@11@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@14@01))
(assert (<= $k@14@01 $Perm.Write))
(assert (=> (< $Perm.No $k@14@01) (not (= t2@11@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
; [eval] t1.next != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] t2.next != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@15@01 $Perm)
(assert ($Perm.isReadVar $k@15@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= t2@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@10@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@15@01))
(assert (<= $k@15@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@15@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= t2@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@10@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@16@01))
(assert (<= $k@16@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@16@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01)))
      $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] t1 == t2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= t1@10@01 t2@11@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t1@10@01 t2@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | t1@10@01 == t2@11@01 | live]
; [else-branch: 1 | t1@10@01 != t2@11@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | t1@10@01 == t2@11@01]
(assert (= t1@10@01 t2@11@01))
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
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)) t2@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) t2@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= t2@11@01 t1@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@17@01 $Ref)
(assert (and
  (=>
    (< $Perm.No $k@14@01)
    (=
      $t@17@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01)))))
  (=>
    (< $Perm.No $k@13@01)
    (= $t@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= t2@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@18@01 $Ref)
(assert (and
  (=>
    (< $Perm.No $k@15@01)
    (=
      $t@18@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  (=>
    (< $Perm.No $k@16@01)
    (=
      $t@18@01
      ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)) t2@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (+ $k@14@01 $k@13@01)))
(assert (<= (+ $k@14@01 $k@13@01) $Perm.Write))
(assert (=> (< $Perm.No (+ $k@14@01 $k@13@01)) (not (= t2@11@01 $Ref.null))))
(assert (<= $Perm.No (+ $k@15@01 $k@16@01)))
(assert (<= (+ $k@15@01 $k@16@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ $k@15@01 $k@16@01))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (+ $k@14@01 $k@13@01) (+ $k@15@01 $k@16@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (+ $k@15@01 $k@16@01) (+ $k@14@01 $k@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (+ $k@14@01 $k@13@01)) (< $Perm.No (+ $k@15@01 $k@16@01)))
  (not (= $t@17@01 $t@18@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (+ $k@15@01 $k@16@01)) (< $Perm.No (+ $k@14@01 $k@13@01)))
  (not (= $t@18@01 $t@17@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const t1@19@01 $Ref)
(declare-const t2@20@01 $Ref)
(declare-const t1@21@01 $Ref)
(declare-const t2@22@01 $Ref)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(assert (<= $Perm.No $k@24@01))
(assert (<= $k@24@01 $Perm.Write))
(assert (=> (< $Perm.No $k@24@01) (not (= t1@21@01 $Ref.null))))
(declare-const $k@25@01 $Perm)
(assert ($Perm.isReadVar $k@25@01))
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@21@01 t2@22@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@25@01))
(assert (<= $k@25@01 $Perm.Write))
(assert (=> (< $Perm.No $k@25@01) (not (= t2@22@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert t1 != t2
; [eval] t1 != t2
(push) ; 3
(assert (not (not (= t1@21@01 t2@22@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@22@01 t1@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@24@01 $k@25@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@25@01 $k@24@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@24@01) (< $Perm.No $k@25@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@23@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@25@01) (< $Perm.No $k@24@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@23@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@21@01 t2@22@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@22@01 t1@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@24@01 $k@25@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@25@01 $k@24@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@24@01) (< $Perm.No $k@25@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@23@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@25@01) (< $Perm.No $k@24@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@23@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@21@01 t2@22@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@22@01 t1@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@24@01 $k@25@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@25@01 $k@24@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@24@01) (< $Perm.No $k@25@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@23@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@25@01) (< $Perm.No $k@24@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@23@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@23@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@21@01 t2@22@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const t1@26@01 $Ref)
(declare-const t2@27@01 $Ref)
(declare-const t1@28@01 $Ref)
(declare-const t2@29@01 $Ref)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(declare-const $k@31@01 $Perm)
(assert ($Perm.isReadVar $k@31@01))
(assert (<= $Perm.No $k@31@01))
(assert (<= $k@31@01 $Perm.Write))
(assert (=> (< $Perm.No $k@31@01) (not (= t1@28@01 $Ref.null))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@28@01 t2@29@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= t2@29@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert t1 != t2
; [eval] t1 != t2
(push) ; 3
(assert (not (not (= t1@28@01 t2@29@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@29@01 t1@28@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@31@01 $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $Perm.Write $k@31@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No $k@31@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@30@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No $k@31@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@30@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= t1@28@01 t2@29@01)) (not (= t2@29@01 t1@28@01))))
; [eval] t1 != t2
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const t1@32@01 $Ref)
(declare-const t2@33@01 $Ref)
(declare-const t1@34@01 $Ref)
(declare-const t2@35@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (not (= t1@34@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@34@01 t2@35@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= t2@35@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert t1 != t2
; [eval] t1 != t2
(push) ; 3
(assert (not (not (= t1@34@01 t2@35@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@35@01 t1@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@36@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.second $t@36@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.second $t@36@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@36@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@34@01 t2@35@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@35@01 t1@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@36@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.second $t@36@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.second $t@36@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@36@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@34@01 t2@35@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@35@01 t1@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@36@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.second $t@36@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.second $t@36@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@36@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@34@01 t2@35@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const t1@37@01 $Ref)
(declare-const t2@38@01 $Ref)
(declare-const t1@39@01 $Ref)
(declare-const t2@40@01 $Ref)
(push) ; 1
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 ($Snap.combine ($Snap.first $t@41@01) ($Snap.second $t@41@01))))
(assert (not (= t1@39@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@39@01 t2@40@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= t2@40@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert t1 != t2
; [eval] t1 != t2
(push) ; 3
(assert (not (not (= t1@39@01 t2@40@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@40@01 t1@39@01)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@41@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.second $t@41@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.second $t@41@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@41@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= t1@39@01 t2@40@01)) (not (= t2@40@01 t1@39@01))))
; [eval] t1 != t2
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const t1@42@01 $Ref)
(declare-const t2@43@01 $Ref)
(declare-const t1@44@01 $Ref)
(declare-const t2@45@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (not (= t1@44@01 $Ref.null)))
(declare-const $k@47@01 $Perm)
(assert ($Perm.isReadVar $k@47@01))
(push) ; 2
(set-option :timeout 10)
(assert (not (= t1@44@01 t2@45@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@47@01))
(assert (<= $k@47@01 $Perm.Write))
(assert (=> (< $Perm.No $k@47@01) (not (= t2@45@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert t1 != t2
; [eval] t1 != t2
(push) ; 3
(assert (not (not (= t1@44@01 t2@45@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@45@01 t1@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (/ (to_real 1) (to_real 2)) $k@47@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@47@01 (/ (to_real 1) (to_real 2))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No $k@47@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@46@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@46@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No $k@47@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@46@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@46@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@44@01 t2@45@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@45@01 t1@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (/ (to_real 1) (to_real 2)) $k@47@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@47@01 (/ (to_real 1) (to_real 2))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No $k@47@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@46@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@46@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No $k@47@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@46@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@46@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@44@01 t2@45@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= t2@45@01 t1@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (/ (to_real 1) (to_real 2)) $k@47@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@47@01 (/ (to_real 1) (to_real 2))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No $k@47@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@46@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@46@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No $k@47@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.second $t@46@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@46@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t1 != t2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= t1@44@01 t2@45@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
