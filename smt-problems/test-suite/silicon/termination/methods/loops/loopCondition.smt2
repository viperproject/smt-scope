(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/methods/loops/loopCondition.vpr
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
(declare-sort IntWellFoundedOrder 0)
(declare-sort WellFoundedOrder<Int> 0)
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
(declare-fun $SortWrappers.IntWellFoundedOrderTo$Snap (IntWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToIntWellFoundedOrder ($Snap) IntWellFoundedOrder)
(assert (forall ((x IntWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToIntWellFoundedOrder($SortWrappers.IntWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.IntWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToIntWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntWellFoundedOrderTo$Snap($SortWrappers.$SnapToIntWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToIntWellFoundedOrder x))
    :qid |$Snap.IntWellFoundedOrderTo$SnapToIntWellFoundedOrder|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Int>To$Snap (WellFoundedOrder<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Int> ($Snap) WellFoundedOrder<Int>)
(assert (forall ((x WellFoundedOrder<Int>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Int>($SortWrappers.WellFoundedOrder<Int>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Int>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Int>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Int> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Int> x))
    :qid |$Snap.WellFoundedOrder<Int>To$SnapToWellFoundedOrder<Int>|
    )))
; ////////// Symbols
(declare-fun decreasing<Bool> (Int Int) Bool)
(declare-fun bounded<Bool> (Int) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((int1 Int) (int2 Int)) (!
  (=> (< int1 int2) (decreasing<Bool> int1 int2))
  :pattern ((decreasing<Bool> int1 int2))
  :qid |prog.integer_ax_dec|)))
(assert (forall ((int1 Int)) (!
  (=> (>= int1 0) (bounded<Bool> int1))
  :pattern ((bounded<Bool> int1))
  :qid |prog.integer_ax_bound|)))
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
; ---------- sum ----------
(declare-const n@0@01 Int)
(declare-const res@1@01 Int)
(declare-const n@2@01 Int)
(declare-const res@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] 0 <= n
(assert (<= 0 n@2@01))
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
(declare-const i@5@01 Int)
; [exec]
; var break: Bool
(declare-const break@6@01 Bool)
; [exec]
; res := 0
; [exec]
; i := 0
; [exec]
; break := false
(declare-const old_W1_T0@7@01 Int)
(declare-const res@8@01 Int)
(declare-const i@9@01 Int)
(declare-const break@10@01 Bool)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] i <= n
(assert (<= i@9@01 n@2@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] i <= n
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@11@01 $Snap.unit))
(assert (<= i@9@01 n@2@01))
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
; [eval] !break
(pop) ; 5
(push) ; 5
; [eval] !!break
; [eval] !break
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] !break
(push) ; 5
(set-option :timeout 10)
(assert (not break@10@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not break@10@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | !(break@10@01) | live]
; [else-branch: 0 | break@10@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | !(break@10@01)]
(assert (not break@10@01))
; [exec]
; var old_W1_T0: Int
(declare-const old_W1_T0@12@01 Int)
; [exec]
; old_W1_T0 := n - i
; [eval] n - i
(declare-const old_W1_T0@13@01 Int)
(assert (= old_W1_T0@13@01 (- n@2@01 i@9@01)))
; [exec]
; res := res + i
; [eval] res + i
(declare-const res@14@01 Int)
(assert (= res@14@01 (+ res@8@01 i@9@01)))
; [eval] i + 1 <= n
; [eval] i + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (<= (+ i@9@01 1) n@2@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<= (+ i@9@01 1) n@2@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | i@9@01 + 1 <= n@2@01 | live]
; [else-branch: 1 | !(i@9@01 + 1 <= n@2@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 1 | i@9@01 + 1 <= n@2@01]
(assert (<= (+ i@9@01 1) n@2@01))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@15@01 Int)
(assert (= i@15@01 (+ i@9@01 1)))
; [exec]
; assert true && !break ==>
;   (decreasing(n - i, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) ||
;   n - i == old_W1_T0 && false
; [eval] true && !break ==> (decreasing(n - i, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || n - i == old_W1_T0 && false
; [eval] true && !break
(push) ; 7
; [then-branch: 2 | False | live]
; [else-branch: 2 | True | live]
(push) ; 8
; [then-branch: 2 | False]
(assert false)
(pop) ; 8
(push) ; 8
; [else-branch: 2 | True]
; [eval] !break
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not break@10@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(break@10@01) | live]
; [else-branch: 3 | break@10@01 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 3 | !(break@10@01)]
; [eval] (decreasing(n - i, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || n - i == old_W1_T0 && false
; [eval] (decreasing(n - i, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool)
; [eval] (decreasing(n - i, old_W1_T0): Bool)
; [eval] n - i
(push) ; 9
; [then-branch: 4 | !(decreasing[Bool](n@2@01 - i@15@01, old_W1_T0@13@01)) | live]
; [else-branch: 4 | decreasing[Bool](n@2@01 - i@15@01, old_W1_T0@13@01) | live]
(push) ; 10
; [then-branch: 4 | !(decreasing[Bool](n@2@01 - i@15@01, old_W1_T0@13@01))]
(assert (not (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 4 | decreasing[Bool](n@2@01 - i@15@01, old_W1_T0@13@01)]
(assert (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01))
; [eval] (bounded(old_W1_T0): Bool)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
  (not (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01))))
(push) ; 9
; [then-branch: 5 | decreasing[Bool](n@2@01 - i@15@01, old_W1_T0@13@01) && bounded[Bool](old_W1_T0@13@01) | live]
; [else-branch: 5 | !(decreasing[Bool](n@2@01 - i@15@01, old_W1_T0@13@01) && bounded[Bool](old_W1_T0@13@01)) | live]
(push) ; 10
; [then-branch: 5 | decreasing[Bool](n@2@01 - i@15@01, old_W1_T0@13@01) && bounded[Bool](old_W1_T0@13@01)]
(assert (and
  (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
  (bounded<Bool> old_W1_T0@13@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 5 | !(decreasing[Bool](n@2@01 - i@15@01, old_W1_T0@13@01) && bounded[Bool](old_W1_T0@13@01))]
(assert (not
  (and
    (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
    (bounded<Bool> old_W1_T0@13@01))))
; [eval] n - i == old_W1_T0 && false
; [eval] n - i == old_W1_T0
; [eval] n - i
(push) ; 11
; [then-branch: 6 | n@2@01 - i@15@01 != old_W1_T0@13@01 | live]
; [else-branch: 6 | n@2@01 - i@15@01 == old_W1_T0@13@01 | live]
(push) ; 12
; [then-branch: 6 | n@2@01 - i@15@01 != old_W1_T0@13@01]
(assert (not (= (- n@2@01 i@15@01) old_W1_T0@13@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 6 | n@2@01 - i@15@01 == old_W1_T0@13@01]
(assert (= (- n@2@01 i@15@01) old_W1_T0@13@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (= (- n@2@01 i@15@01) old_W1_T0@13@01)
  (not (= (- n@2@01 i@15@01) old_W1_T0@13@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
      (bounded<Bool> old_W1_T0@13@01)))
  (and
    (not
      (and
        (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
        (bounded<Bool> old_W1_T0@13@01)))
    (or
      (= (- n@2@01 i@15@01) old_W1_T0@13@01)
      (not (= (- n@2@01 i@15@01) old_W1_T0@13@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
      (bounded<Bool> old_W1_T0@13@01)))
  (and
    (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
    (bounded<Bool> old_W1_T0@13@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not break@10@01)
  (and
    (or
      (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
      (not (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)))
    (=>
      (not
        (and
          (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
          (bounded<Bool> old_W1_T0@13@01)))
      (and
        (not
          (and
            (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
            (bounded<Bool> old_W1_T0@13@01)))
        (or
          (= (- n@2@01 i@15@01) old_W1_T0@13@01)
          (not (= (- n@2@01 i@15@01) old_W1_T0@13@01)))))
    (or
      (not
        (and
          (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
          (bounded<Bool> old_W1_T0@13@01)))
      (and
        (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
        (bounded<Bool> old_W1_T0@13@01))))))
(push) ; 7
(assert (not (=>
  (not break@10@01)
  (and
    (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
    (bounded<Bool> old_W1_T0@13@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not break@10@01)
  (and
    (decreasing<Bool> (- n@2@01 i@15@01) old_W1_T0@13@01)
    (bounded<Bool> old_W1_T0@13@01))))
; Loop head block: Re-establish invariant
; [eval] i <= n
(push) ; 7
(assert (not (<= i@15@01 n@2@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= i@15@01 n@2@01))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | !(i@9@01 + 1 <= n@2@01)]
(assert (not (<= (+ i@9@01 1) n@2@01)))
(pop) ; 6
; [eval] !(i + 1 <= n)
; [eval] i + 1 <= n
; [eval] i + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (<= (+ i@9@01 1) n@2@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (<= (+ i@9@01 1) n@2@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(i@9@01 + 1 <= n@2@01) | live]
; [else-branch: 7 | i@9@01 + 1 <= n@2@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 7 | !(i@9@01 + 1 <= n@2@01)]
(assert (not (<= (+ i@9@01 1) n@2@01)))
; [exec]
; break := true
; [exec]
; assert true && !break ==>
;   (decreasing(n - i, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) ||
;   n - i == old_W1_T0 && false
; [eval] true && !break ==> (decreasing(n - i, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || n - i == old_W1_T0 && false
; [eval] true && !break
(push) ; 7
; [then-branch: 8 | False | live]
; [else-branch: 8 | True | live]
(push) ; 8
; [then-branch: 8 | False]
(assert false)
(pop) ; 8
(push) ; 8
; [else-branch: 8 | True]
; [eval] !break
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
; [then-branch: 9 | False | dead]
; [else-branch: 9 | True | live]
(push) ; 8
; [else-branch: 9 | True]
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Loop head block: Re-establish invariant
; [eval] i <= n
(pop) ; 6
(push) ; 6
; [else-branch: 7 | i@9@01 + 1 <= n@2@01]
(assert (<= (+ i@9@01 1) n@2@01))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 0 | break@10@01]
(assert break@10@01)
(pop) ; 5
; [eval] !!break
; [eval] !break
(push) ; 5
(set-option :timeout 10)
(assert (not (not break@10@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not break@10@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | break@10@01 | live]
; [else-branch: 10 | !(break@10@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | break@10@01]
(assert break@10@01)
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(break@10@01)]
(assert (not break@10@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- sum_e ----------
(declare-const n@16@01 Int)
(declare-const res@17@01 Int)
(declare-const n@18@01 Int)
(declare-const res@19@01 Int)
(push) ; 1
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] 0 <= n
(assert (<= 0 n@18@01))
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
(declare-const i@21@01 Int)
; [exec]
; var break: Bool
(declare-const break@22@01 Bool)
; [exec]
; res := 0
; [exec]
; i := 0
; [exec]
; break := false
(declare-const old_W2_T0@23@01 Int)
(declare-const res@24@01 Int)
(declare-const i@25@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] i <= n
(assert (<= i@25@01 n@18@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] i <= n
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@26@01 $Snap.unit))
(assert (<= i@25@01 n@18@01))
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
; [eval] !break
(pop) ; 5
(push) ; 5
; [eval] !!break
; [eval] !break
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] !break
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | True | live]
; [else-branch: 11 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | True]
; [exec]
; var old_W2_T0: Int
(declare-const old_W2_T0@27@01 Int)
; [exec]
; old_W2_T0 := n - i
; [eval] n - i
(declare-const old_W2_T0@28@01 Int)
(assert (= old_W2_T0@28@01 (- n@18@01 i@25@01)))
; [exec]
; res := res + i
; [eval] res + i
(declare-const res@29@01 Int)
(assert (= res@29@01 (+ res@24@01 i@25@01)))
; [eval] i + 1 <= n
; [eval] i + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (<= (+ i@25@01 1) n@18@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<= (+ i@25@01 1) n@18@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | i@25@01 + 1 <= n@18@01 | live]
; [else-branch: 12 | !(i@25@01 + 1 <= n@18@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 12 | i@25@01 + 1 <= n@18@01]
(assert (<= (+ i@25@01 1) n@18@01))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@30@01 Int)
(assert (= i@30@01 (+ i@25@01 1)))
; [exec]
; assert true && !break ==>
;   (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) ||
;   n - i == old_W2_T0 && false
; [eval] true && !break ==> (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] true && !break
(push) ; 7
; [then-branch: 13 | False | live]
; [else-branch: 13 | True | live]
(push) ; 8
; [then-branch: 13 | False]
(assert false)
(pop) ; 8
(push) ; 8
; [else-branch: 13 | True]
; [eval] !break
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | True | live]
; [else-branch: 14 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 14 | True]
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(n - i, old_W2_T0): Bool)
; [eval] n - i
(push) ; 9
; [then-branch: 15 | !(decreasing[Bool](n@18@01 - i@30@01, old_W2_T0@28@01)) | live]
; [else-branch: 15 | decreasing[Bool](n@18@01 - i@30@01, old_W2_T0@28@01) | live]
(push) ; 10
; [then-branch: 15 | !(decreasing[Bool](n@18@01 - i@30@01, old_W2_T0@28@01))]
(assert (not (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 15 | decreasing[Bool](n@18@01 - i@30@01, old_W2_T0@28@01)]
(assert (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01))
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
  (not (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01))))
(push) ; 9
; [then-branch: 16 | decreasing[Bool](n@18@01 - i@30@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01) | live]
; [else-branch: 16 | !(decreasing[Bool](n@18@01 - i@30@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)) | live]
(push) ; 10
; [then-branch: 16 | decreasing[Bool](n@18@01 - i@30@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)]
(assert (and
  (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 16 | !(decreasing[Bool](n@18@01 - i@30@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01))]
(assert (not
  (and
    (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
    (bounded<Bool> old_W2_T0@28@01))))
; [eval] n - i == old_W2_T0 && false
; [eval] n - i == old_W2_T0
; [eval] n - i
(push) ; 11
; [then-branch: 17 | n@18@01 - i@30@01 != old_W2_T0@28@01 | live]
; [else-branch: 17 | n@18@01 - i@30@01 == old_W2_T0@28@01 | live]
(push) ; 12
; [then-branch: 17 | n@18@01 - i@30@01 != old_W2_T0@28@01]
(assert (not (= (- n@18@01 i@30@01) old_W2_T0@28@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 17 | n@18@01 - i@30@01 == old_W2_T0@28@01]
(assert (= (- n@18@01 i@30@01) old_W2_T0@28@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (= (- n@18@01 i@30@01) old_W2_T0@28@01)
  (not (= (- n@18@01 i@30@01) old_W2_T0@28@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
      (bounded<Bool> old_W2_T0@28@01)))
  (and
    (not
      (and
        (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
        (bounded<Bool> old_W2_T0@28@01)))
    (or
      (= (- n@18@01 i@30@01) old_W2_T0@28@01)
      (not (= (- n@18@01 i@30@01) old_W2_T0@28@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
      (bounded<Bool> old_W2_T0@28@01)))
  (and
    (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
    (bounded<Bool> old_W2_T0@28@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (and
  (or
    (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
    (not (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)))
  (=>
    (not
      (and
        (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
        (bounded<Bool> old_W2_T0@28@01)))
    (and
      (not
        (and
          (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
          (bounded<Bool> old_W2_T0@28@01)))
      (or
        (= (- n@18@01 i@30@01) old_W2_T0@28@01)
        (not (= (- n@18@01 i@30@01) old_W2_T0@28@01)))))
  (or
    (not
      (and
        (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
        (bounded<Bool> old_W2_T0@28@01)))
    (and
      (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
      (bounded<Bool> old_W2_T0@28@01)))))
(push) ; 7
(assert (not (and
  (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (decreasing<Bool> (- n@18@01 i@30@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01)))
; Loop head block: Re-establish invariant
; [eval] i <= n
(push) ; 7
(assert (not (<= i@30@01 n@18@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= i@30@01 n@18@01))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | !(i@25@01 + 1 <= n@18@01)]
(assert (not (<= (+ i@25@01 1) n@18@01)))
(pop) ; 6
; [eval] !(i + 1 <= n)
; [eval] i + 1 <= n
; [eval] i + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (<= (+ i@25@01 1) n@18@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (<= (+ i@25@01 1) n@18@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | !(i@25@01 + 1 <= n@18@01) | live]
; [else-branch: 18 | i@25@01 + 1 <= n@18@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 18 | !(i@25@01 + 1 <= n@18@01)]
(assert (not (<= (+ i@25@01 1) n@18@01)))
; [exec]
; assert true && !break ==>
;   (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) ||
;   n - i == old_W2_T0 && false
; [eval] true && !break ==> (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] true && !break
(push) ; 7
; [then-branch: 19 | False | live]
; [else-branch: 19 | True | live]
(push) ; 8
; [then-branch: 19 | False]
(assert false)
(pop) ; 8
(push) ; 8
; [else-branch: 19 | True]
; [eval] !break
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 20 | True]
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(n - i, old_W2_T0): Bool)
; [eval] n - i
(push) ; 9
; [then-branch: 21 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01)) | live]
; [else-branch: 21 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) | live]
(push) ; 10
; [then-branch: 21 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01))]
(assert (not (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 21 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01)]
(assert (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01))
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (not (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01))))
(push) ; 9
; [then-branch: 22 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01) | live]
; [else-branch: 22 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)) | live]
(push) ; 10
; [then-branch: 22 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)]
(assert (and
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 22 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01))]
(assert (not
  (and
    (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
    (bounded<Bool> old_W2_T0@28@01))))
; [eval] n - i == old_W2_T0 && false
; [eval] n - i == old_W2_T0
; [eval] n - i
(push) ; 11
; [then-branch: 23 | n@18@01 - i@25@01 != old_W2_T0@28@01 | live]
; [else-branch: 23 | n@18@01 - i@25@01 == old_W2_T0@28@01 | live]
(push) ; 12
; [then-branch: 23 | n@18@01 - i@25@01 != old_W2_T0@28@01]
(assert (not (= (- n@18@01 i@25@01) old_W2_T0@28@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 23 | n@18@01 - i@25@01 == old_W2_T0@28@01]
(assert (= (- n@18@01 i@25@01) old_W2_T0@28@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (= (- n@18@01 i@25@01) old_W2_T0@28@01)
  (not (= (- n@18@01 i@25@01) old_W2_T0@28@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
      (bounded<Bool> old_W2_T0@28@01)))
  (and
    (not
      (and
        (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
        (bounded<Bool> old_W2_T0@28@01)))
    (or
      (= (- n@18@01 i@25@01) old_W2_T0@28@01)
      (not (= (- n@18@01 i@25@01) old_W2_T0@28@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
      (bounded<Bool> old_W2_T0@28@01)))
  (and
    (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
    (bounded<Bool> old_W2_T0@28@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (and
  (or
    (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
    (not (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)))
  (=>
    (not
      (and
        (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
        (bounded<Bool> old_W2_T0@28@01)))
    (and
      (not
        (and
          (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
          (bounded<Bool> old_W2_T0@28@01)))
      (or
        (= (- n@18@01 i@25@01) old_W2_T0@28@01)
        (not (= (- n@18@01 i@25@01) old_W2_T0@28@01)))))
  (or
    (not
      (and
        (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
        (bounded<Bool> old_W2_T0@28@01)))
    (and
      (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
      (bounded<Bool> old_W2_T0@28@01)))))
(push) ; 7
(assert (not (and
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01))))
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
; [eval] true && !break ==> (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] true && !break
(set-option :timeout 0)
(push) ; 7
; [then-branch: 24 | False | live]
; [else-branch: 24 | True | live]
(push) ; 8
; [then-branch: 24 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 24 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !break
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 25 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(n - i, old_W2_T0): Bool)
; [eval] n - i
(set-option :timeout 0)
(push) ; 9
; [then-branch: 26 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01)) | live]
; [else-branch: 26 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) | live]
(push) ; 10
; [then-branch: 26 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01))]
(assert (not (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 26 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01)]
(assert (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
; [then-branch: 27 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01) | live]
; [else-branch: 27 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)) | live]
(push) ; 10
; [then-branch: 27 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)]
(assert (and
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 27 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01))]
(assert (not
  (and
    (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
    (bounded<Bool> old_W2_T0@28@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] n - i == old_W2_T0 && false
; [eval] n - i == old_W2_T0
; [eval] n - i
(set-option :timeout 0)
(push) ; 11
; [then-branch: 28 | n@18@01 - i@25@01 != old_W2_T0@28@01 | live]
; [else-branch: 28 | n@18@01 - i@25@01 == old_W2_T0@28@01 | live]
(push) ; 12
; [then-branch: 28 | n@18@01 - i@25@01 != old_W2_T0@28@01]
(assert (not (= (- n@18@01 i@25@01) old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 28 | n@18@01 - i@25@01 == old_W2_T0@28@01]
(assert (= (- n@18@01 i@25@01) old_W2_T0@28@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (= (- n@18@01 i@25@01) old_W2_T0@28@01)
  (not (= (- n@18@01 i@25@01) old_W2_T0@28@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01))))
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
; [eval] true && !break ==> (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] true && !break
(set-option :timeout 0)
(push) ; 7
; [then-branch: 29 | False | live]
; [else-branch: 29 | True | live]
(push) ; 8
; [then-branch: 29 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 29 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !break
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | True | live]
; [else-branch: 30 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 30 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(n - i, old_W2_T0): Bool)
; [eval] n - i
(set-option :timeout 0)
(push) ; 9
; [then-branch: 31 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01)) | live]
; [else-branch: 31 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) | live]
(push) ; 10
; [then-branch: 31 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01))]
(assert (not (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 31 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01)]
(assert (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
; [then-branch: 32 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01) | live]
; [else-branch: 32 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)) | live]
(push) ; 10
; [then-branch: 32 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)]
(assert (and
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 32 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01))]
(assert (not
  (and
    (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
    (bounded<Bool> old_W2_T0@28@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] n - i == old_W2_T0 && false
; [eval] n - i == old_W2_T0
; [eval] n - i
(set-option :timeout 0)
(push) ; 11
; [then-branch: 33 | n@18@01 - i@25@01 != old_W2_T0@28@01 | live]
; [else-branch: 33 | n@18@01 - i@25@01 == old_W2_T0@28@01 | live]
(push) ; 12
; [then-branch: 33 | n@18@01 - i@25@01 != old_W2_T0@28@01]
(assert (not (= (- n@18@01 i@25@01) old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 33 | n@18@01 - i@25@01 == old_W2_T0@28@01]
(assert (= (- n@18@01 i@25@01) old_W2_T0@28@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (= (- n@18@01 i@25@01) old_W2_T0@28@01)
  (not (= (- n@18@01 i@25@01) old_W2_T0@28@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01))))
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
; [eval] true && !break ==> (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] true && !break
(set-option :timeout 0)
(push) ; 7
; [then-branch: 34 | False | live]
; [else-branch: 34 | True | live]
(push) ; 8
; [then-branch: 34 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 34 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !break
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 35 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || n - i == old_W2_T0 && false
; [eval] (decreasing(n - i, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(n - i, old_W2_T0): Bool)
; [eval] n - i
(set-option :timeout 0)
(push) ; 9
; [then-branch: 36 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01)) | live]
; [else-branch: 36 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) | live]
(push) ; 10
; [then-branch: 36 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01))]
(assert (not (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 36 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01)]
(assert (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
; [then-branch: 37 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01) | live]
; [else-branch: 37 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)) | live]
(push) ; 10
; [then-branch: 37 | decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01)]
(assert (and
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 37 | !(decreasing[Bool](n@18@01 - i@25@01, old_W2_T0@28@01) && bounded[Bool](old_W2_T0@28@01))]
(assert (not
  (and
    (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
    (bounded<Bool> old_W2_T0@28@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] n - i == old_W2_T0 && false
; [eval] n - i == old_W2_T0
; [eval] n - i
(set-option :timeout 0)
(push) ; 11
; [then-branch: 38 | n@18@01 - i@25@01 != old_W2_T0@28@01 | live]
; [else-branch: 38 | n@18@01 - i@25@01 == old_W2_T0@28@01 | live]
(push) ; 12
; [then-branch: 38 | n@18@01 - i@25@01 != old_W2_T0@28@01]
(assert (not (= (- n@18@01 i@25@01) old_W2_T0@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 38 | n@18@01 - i@25@01 == old_W2_T0@28@01]
(assert (= (- n@18@01 i@25@01) old_W2_T0@28@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (= (- n@18@01 i@25@01) old_W2_T0@28@01)
  (not (= (- n@18@01 i@25@01) old_W2_T0@28@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (and
  (decreasing<Bool> (- n@18@01 i@25@01) old_W2_T0@28@01)
  (bounded<Bool> old_W2_T0@28@01))))
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
