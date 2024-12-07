(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/testHistoryApplication.vpr
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
(declare-sort Process 0)
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
(declare-fun $SortWrappers.ProcessTo$Snap (Process) $Snap)
(declare-fun $SortWrappers.$SnapToProcess ($Snap) Process)
(assert (forall ((x Process)) (!
    (= x ($SortWrappers.$SnapToProcess($SortWrappers.ProcessTo$Snap x)))
    :pattern (($SortWrappers.ProcessTo$Snap x))
    :qid |$Snap.$SnapToProcessTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ProcessTo$Snap($SortWrappers.$SnapToProcess x)))
    :pattern (($SortWrappers.$SnapToProcess x))
    :qid |$Snap.ProcessTo$SnapToProcess|
    )))
; ////////// Symbols
(declare-fun p_merge<Process> (Process Process) Process)
(declare-fun p_seq<Process> (Process Process) Process)
(declare-const p_empty<Process> Process)
(declare-const p_incr<Process> Process)
(declare-fun p_single<Process> (Int) Process)
(declare-fun p_dual<Process> (Int Int) Process)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Ref__hist_idle%trigger ($Snap $Ref $Ref Process) Bool)
(declare-fun Ref__hist_empty%trigger ($Snap $Ref $Ref Process) Bool)
(declare-fun Ref__hist_incr%trigger ($Snap $Ref $Ref Process) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((p Process)) (!
  (= (p_merge<Process> (as p_empty<Process>  Process) p) p)
  :pattern ((p_merge<Process> (as p_empty<Process>  Process) p))
  :qid |prog.empty_1L|)))
(assert (forall ((p Process)) (!
  (= (p_seq<Process> (as p_empty<Process>  Process) p) p)
  :pattern ((p_seq<Process> (as p_empty<Process>  Process) p))
  :qid |prog.empty_2L|)))
(assert (forall ((p Process)) (!
  (= (p_seq<Process> p (as p_empty<Process>  Process)) p)
  :pattern ((p_seq<Process> p (as p_empty<Process>  Process)))
  :qid |prog.empty_2R|)))
(assert (forall ((n Int)) (!
  (=
    (ite
      (> n 0)
      (p_seq<Process> (as p_incr<Process>  Process) (p_single<Process> (- n 1)))
      (as p_empty<Process>  Process))
    (p_single<Process> n))
  :pattern ((p_single<Process> n))
  :qid |prog.single_def|)))
(assert (forall ((n Int) (m Int)) (!
  (=
    (p_merge<Process> (p_single<Process> n) (p_single<Process> m))
    (p_dual<Process> n m))
  :pattern ((p_single<Process> n) (p_dual<Process> n m))
  :pattern ((p_single<Process> m) (p_dual<Process> n m))
  :pattern ((p_merge<Process> (p_single<Process> n) (p_single<Process> m)))
  :pattern ((p_dual<Process> n m))
  :qid |prog.dual_def|)))
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
; ---------- Ref__do_incr ----------
(declare-const diz@0@01 $Ref)
(declare-const h@1@01 $Ref)
(declare-const diz@2@01 $Ref)
(declare-const h@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] h != null
(assert (not (= h@3@01 $Ref.null)))
; [eval] p_empty()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
(assert (= ($Snap.first ($Snap.second $t@5@01)) $Snap.unit))
; [eval] h != null
; [eval] p_single(1)
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@6@01 Bool)
; [exec]
; var __flatten_18: Int
(declare-const __flatten_18@7@01 Int)
; [exec]
; var __flatten_49: Int
(declare-const __flatten_49@8@01 Int)
; [exec]
; Ref__incr_begin(h, diz, p_empty())
; [eval] p_empty()
; [eval] diz != null
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (=
  ($Snap.second $t@9@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@01))
    ($Snap.second ($Snap.second $t@9@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@9@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@9@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@9@01))) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@9@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@9@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@9@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_49 := diz.Ref__x + 1
; [eval] diz.Ref__x + 1
(declare-const __flatten_49@10@01 Int)
(assert (=
  __flatten_49@10@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@9@01))) 1)))
; [exec]
; __flatten_18 := __flatten_49
; [exec]
; diz.Ref__x := __flatten_18
; [exec]
; Ref__incr_commit(h, diz, p_empty())
; [eval] p_empty()
; [eval] diz != null
; [eval] ref.Ref__x == diz.Ref__x_old + 1
; [eval] diz.Ref__x_old + 1
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  __flatten_49@10@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
    1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  __flatten_49@10@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
    1)))
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
; [eval] p_seq(p, p_incr())
; [eval] p_incr()
(assert (=
  ($Snap.second $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.second ($Snap.second $t@11@01)))))
(assert (= ($Snap.second ($Snap.second $t@11@01)) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@11@01)))
  __flatten_49@10@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] h != null
; [eval] p_single(1)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (p_seq<Process> (as p_empty<Process>  Process) (as p_incr<Process>  Process))
  (p_single<Process> 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__do_incr_twice ----------
(declare-const diz@12@01 $Ref)
(declare-const h@13@01 $Ref)
(declare-const diz@14@01 $Ref)
(declare-const h@15@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@14@01 $Ref.null)))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [eval] h != null
(assert (not (= h@15@01 $Ref.null)))
; [eval] p_empty()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (= ($Snap.first ($Snap.second $t@17@01)) $Snap.unit))
; [eval] h != null
; [eval] p_single(2)
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@18@01 Bool)
; [exec]
; var __flatten_23: Int
(declare-const __flatten_23@19@01 Int)
; [exec]
; var __flatten_28: Int
(declare-const __flatten_28@20@01 Int)
; [exec]
; var __flatten_54: Int
(declare-const __flatten_54@21@01 Int)
; [exec]
; var __flatten_59: Int
(declare-const __flatten_59@22@01 Int)
; [exec]
; Ref__incr_begin(h, diz, p_empty())
; [eval] p_empty()
; [eval] diz != null
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@23@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@23@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@23@01))) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@23@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@16@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@23@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@23@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_54 := diz.Ref__x + 1
; [eval] diz.Ref__x + 1
(declare-const __flatten_54@24@01 Int)
(assert (=
  __flatten_54@24@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@23@01))) 1)))
; [exec]
; __flatten_23 := __flatten_54
; [exec]
; diz.Ref__x := __flatten_23
; [exec]
; Ref__incr_commit(h, diz, p_empty())
; [eval] p_empty()
; [eval] diz != null
; [eval] ref.Ref__x == diz.Ref__x_old + 1
; [eval] diz.Ref__x_old + 1
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  __flatten_54@24@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
    1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  __flatten_54@24@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
    1)))
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
; [eval] p_seq(p, p_incr())
; [eval] p_incr()
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.second ($Snap.second $t@25@01)) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@25@01)))
  __flatten_54@24@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Ref__incr_begin(h, diz, p_single(1))
; [eval] p_single(1)
; [eval] diz != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (p_seq<Process> (as p_empty<Process>  Process) (as p_incr<Process>  Process))
  (p_single<Process> 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@26@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@26@01))) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@25@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@26@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_59 := diz.Ref__x + 1
; [eval] diz.Ref__x + 1
(declare-const __flatten_59@27@01 Int)
(assert (=
  __flatten_59@27@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))) 1)))
; [exec]
; __flatten_28 := __flatten_59
; [exec]
; diz.Ref__x := __flatten_28
; [exec]
; Ref__incr_commit(h, diz, p_single(1))
; [eval] p_single(1)
; [eval] diz != null
; [eval] ref.Ref__x == diz.Ref__x_old + 1
; [eval] diz.Ref__x_old + 1
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  __flatten_59@27@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
    1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  __flatten_59@27@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
    1)))
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
; [eval] p_seq(p, p_incr())
; [eval] p_incr()
(assert (=
  ($Snap.second $t@28@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@28@01))
    ($Snap.second ($Snap.second $t@28@01)))))
(assert (= ($Snap.second ($Snap.second $t@28@01)) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@28@01)))
  __flatten_59@27@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] h != null
; [eval] p_single(2)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (p_seq<Process> (p_single<Process> 1) (as p_incr<Process>  Process))
  (p_single<Process> 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__main_og ----------
(declare-const diz@29@01 $Ref)
(declare-const diz@30@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (= ($Snap.first $t@31@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@30@01 $Ref.null)))
(assert (=
  ($Snap.second $t@31@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@01))
    ($Snap.second ($Snap.second $t@31@01)))))
(assert (= ($Snap.second ($Snap.second $t@31@01)) $Snap.unit))
; [eval] diz.Ref__x == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@31@01))) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] diz.Ref__x == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 1))
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@33@01 Bool)
; [exec]
; var hh: Ref
(declare-const hh@34@01 $Ref)
; [exec]
; assert diz.Ref__x == 0
; [eval] diz.Ref__x == 0
; [exec]
; inhale hh != null && acc(Ref__hist_idle(hh, diz, p_empty()), write)
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (= ($Snap.first $t@35@01) $Snap.unit))
; [eval] hh != null
(assert (not (= hh@34@01 $Ref.null)))
; [eval] p_empty()
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; Ref__do_incr(diz, hh)
; [eval] diz != null
; [eval] h != null
; [eval] p_empty()
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(assert (= ($Snap.first ($Snap.second $t@36@01)) $Snap.unit))
; [eval] h != null
; [eval] p_single(1)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; exhale hh != null && acc(Ref__hist_idle(hh, diz, p_single(1)), write)
; [eval] hh != null
; [eval] p_single(1)
; [exec]
; inhale diz.Ref__x == 1
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] diz.Ref__x == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@36@01)) 1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] diz.Ref__x == 1
(pop) ; 2
(pop) ; 1
; ---------- Ref__Ref ----------
(declare-const sys__result@38@01 $Ref)
(declare-const sys__result@39@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 ($Snap.combine ($Snap.first $t@40@01) ($Snap.second $t@40@01))))
(assert (= ($Snap.first $t@40@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@39@01 $Ref.null)))
(assert (=
  ($Snap.second $t@40@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@40@01))
    ($Snap.second ($Snap.second $t@40@01)))))
(assert (= ($Snap.second ($Snap.second $t@40@01)) $Snap.unit))
; [eval] sys__result.Ref__x == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@40@01))) 0))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@41@01 $Ref)
; [exec]
; var __flatten_63: Ref
(declare-const __flatten_63@42@01 $Ref)
; [exec]
; __flatten_63 := new(Ref__x, Ref__x_old, Ref__Integer_value)
(declare-const __flatten_63@43@01 $Ref)
(assert (not (= __flatten_63@43@01 $Ref.null)))
(declare-const Ref__x@44@01 Int)
(declare-const Ref__x_old@45@01 Int)
(declare-const Ref__Integer_value@46@01 Int)
(assert (not (= __flatten_63@43@01 __flatten_63@42@01)))
(assert (not (= __flatten_63@43@01 diz@41@01)))
(assert (not (= __flatten_63@43@01 sys__result@39@01)))
; [exec]
; diz := __flatten_63
; [exec]
; diz.Ref__x := 0
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Ref__x, write) && sys__result.Ref__x == 0)
; [eval] sys__result != null
; [eval] sys__result.Ref__x == 0
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__empty_begin ----------
(declare-const diz@47@01 $Ref)
(declare-const ref@48@01 $Ref)
(declare-const p@49@01 Process)
(declare-const diz@50@01 $Ref)
(declare-const ref@51@01 $Ref)
(declare-const p@52@01 Process)
(push) ; 1
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 ($Snap.combine ($Snap.first $t@53@01) ($Snap.second $t@53@01))))
(assert (= ($Snap.first $t@53@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@50@01 $Ref.null)))
(assert (=
  ($Snap.second $t@53@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@53@01))
    ($Snap.second ($Snap.second $t@53@01)))))
(assert (not (= ref@51@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 ($Snap.combine ($Snap.first $t@54@01) ($Snap.second $t@54@01))))
(assert (=
  ($Snap.second $t@54@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@54@01))
    ($Snap.second ($Snap.second $t@54@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@54@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@54@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@54@01))) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@54@01)))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@53@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@54@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@54@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@54@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__empty_commit ----------
(declare-const diz@55@01 $Ref)
(declare-const ref@56@01 $Ref)
(declare-const p@57@01 Process)
(declare-const diz@58@01 $Ref)
(declare-const ref@59@01 $Ref)
(declare-const p@60@01 Process)
(push) ; 1
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(assert (= ($Snap.first $t@61@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@58@01 $Ref.null)))
(assert (=
  ($Snap.second $t@61@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@61@01))
    ($Snap.second ($Snap.second $t@61@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@61@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@61@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@61@01))))))
(assert (not (= ref@59@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@61@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@61@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@61@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@61@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 ($Snap.combine ($Snap.first $t@62@01) ($Snap.second $t@62@01))))
; [eval] p_seq(p, p_empty())
; [eval] p_empty()
(assert (=
  ($Snap.second $t@62@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@62@01))
    ($Snap.second ($Snap.second $t@62@01)))))
(assert (= ($Snap.second ($Snap.second $t@62@01)) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@62@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@61@01))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__incr_begin ----------
(declare-const diz@63@01 $Ref)
(declare-const ref@64@01 $Ref)
(declare-const p@65@01 Process)
(declare-const diz@66@01 $Ref)
(declare-const ref@67@01 $Ref)
(declare-const p@68@01 Process)
(push) ; 1
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 ($Snap.combine ($Snap.first $t@69@01) ($Snap.second $t@69@01))))
(assert (= ($Snap.first $t@69@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@66@01 $Ref.null)))
(assert (=
  ($Snap.second $t@69@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@69@01))
    ($Snap.second ($Snap.second $t@69@01)))))
(assert (not (= ref@67@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 ($Snap.combine ($Snap.first $t@70@01) ($Snap.second $t@70@01))))
(assert (=
  ($Snap.second $t@70@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@70@01))
    ($Snap.second ($Snap.second $t@70@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@70@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@70@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@70@01))) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@70@01)))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@69@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@70@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@70@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__incr_commit ----------
(declare-const diz@71@01 $Ref)
(declare-const ref@72@01 $Ref)
(declare-const p@73@01 Process)
(declare-const diz@74@01 $Ref)
(declare-const ref@75@01 $Ref)
(declare-const p@76@01 Process)
(push) ; 1
(declare-const $t@77@01 $Snap)
(assert (= $t@77@01 ($Snap.combine ($Snap.first $t@77@01) ($Snap.second $t@77@01))))
(assert (= ($Snap.first $t@77@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@74@01 $Ref.null)))
(assert (=
  ($Snap.second $t@77@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@77@01))
    ($Snap.second ($Snap.second $t@77@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@77@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@77@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@77@01))))))
(assert (not (= ref@75@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@77@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@77@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@77@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@77@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old + 1
; [eval] diz.Ref__x_old + 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@77@01))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@77@01)))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 ($Snap.combine ($Snap.first $t@78@01) ($Snap.second $t@78@01))))
; [eval] p_seq(p, p_incr())
; [eval] p_incr()
(assert (=
  ($Snap.second $t@78@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@78@01))
    ($Snap.second ($Snap.second $t@78@01)))))
(assert (= ($Snap.second ($Snap.second $t@78@01)) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@78@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@77@01))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__if_any_random ----------
(declare-const diz@79@01 $Ref)
(declare-const sys__result@80@01 Bool)
(declare-const diz@81@01 $Ref)
(declare-const sys__result@82@01 Bool)
(push) ; 1
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 $Snap.unit))
; [eval] diz != null
(assert (not (= diz@81@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
