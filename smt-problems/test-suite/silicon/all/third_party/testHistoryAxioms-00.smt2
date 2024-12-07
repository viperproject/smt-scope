(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:28
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/testHistoryAxioms.vpr
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
      (p_seq<Process> (p_single<Process> (- n 1)) (as p_incr<Process>  Process))
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
; ---------- Ref__main ----------
(declare-const diz@0@01 $Ref)
(declare-const diz@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] diz != null
(assert (not (= diz@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@3@01 Bool)
; [exec]
; assert p_single(2) == p_single(2)
; [eval] p_single(2) == p_single(2)
; [eval] p_single(2)
; [eval] p_single(2)
; [exec]
; assert p_dual(1, 1) == p_merge(p_single(1), p_single(1))
; [eval] p_dual(1, 1) == p_merge(p_single(1), p_single(1))
; [eval] p_dual(1, 1)
; [eval] p_merge(p_single(1), p_single(1))
; [eval] p_single(1)
; [eval] p_single(1)
(push) ; 3
(assert (not (=
  (p_dual<Process> 1 1)
  (p_merge<Process> (p_single<Process> 1) (p_single<Process> 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (p_dual<Process> 1 1)
  (p_merge<Process> (p_single<Process> 1) (p_single<Process> 1))))
; [exec]
; assert p_empty() == p_single(0)
; [eval] p_empty() == p_single(0)
; [eval] p_empty()
; [eval] p_single(0)
(push) ; 3
(assert (not (= (as p_empty<Process>  Process) (p_single<Process> 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (as p_empty<Process>  Process) (p_single<Process> 0)))
; [exec]
; assert p_seq(p_incr(), p_single(1)) == p_single(2)
; [eval] p_seq(p_incr(), p_single(1)) == p_single(2)
; [eval] p_seq(p_incr(), p_single(1))
; [eval] p_incr()
; [eval] p_single(1)
; [eval] p_single(2)
(push) ; 3
(assert (not (=
  (p_seq<Process> (as p_incr<Process>  Process) (p_single<Process> 1))
  (p_single<Process> 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (p_seq<Process> (as p_incr<Process>  Process) (p_single<Process> 1))
  (p_single<Process> 2)))
; [exec]
; assert p_empty() == p_dual(0, 0)
; [eval] p_empty() == p_dual(0, 0)
; [eval] p_empty()
; [eval] p_dual(0, 0)
(push) ; 3
(assert (not (= (as p_empty<Process>  Process) (p_dual<Process> 0 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (as p_empty<Process>  Process) (p_dual<Process> 0 0)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__Ref ----------
(declare-const sys__result@4@01 $Ref)
(declare-const sys__result@5@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@5@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.second ($Snap.second $t@6@01)) $Snap.unit))
; [eval] sys__result.Ref__x == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) 0))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@7@01 $Ref)
; [exec]
; var __flatten_31: Ref
(declare-const __flatten_31@8@01 $Ref)
; [exec]
; __flatten_31 := new(Ref__x, Ref__x_old, Ref__Integer_value)
(declare-const __flatten_31@9@01 $Ref)
(assert (not (= __flatten_31@9@01 $Ref.null)))
(declare-const Ref__x@10@01 Int)
(declare-const Ref__x_old@11@01 Int)
(declare-const Ref__Integer_value@12@01 Int)
(assert (not (= __flatten_31@9@01 __flatten_31@8@01)))
(assert (not (= __flatten_31@9@01 sys__result@5@01)))
(assert (not (= __flatten_31@9@01 diz@7@01)))
; [exec]
; diz := __flatten_31
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
(declare-const diz@13@01 $Ref)
(declare-const ref@14@01 $Ref)
(declare-const p@15@01 Process)
(declare-const diz@16@01 $Ref)
(declare-const ref@17@01 $Ref)
(declare-const p@18@01 Process)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@16@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (not (= ref@17@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@20@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@20@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@20@01))) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@01)))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@20@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__empty_commit ----------
(declare-const diz@21@01 $Ref)
(declare-const ref@22@01 $Ref)
(declare-const p@23@01 Process)
(declare-const diz@24@01 $Ref)
(declare-const ref@25@01 $Ref)
(declare-const p@26@01 Process)
(push) ; 1
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (= ($Snap.first $t@27@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@24@01 $Ref.null)))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))
(assert (not (= ref@25@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@27@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@27@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@27@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@27@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@27@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
; [eval] p_seq(p, p_empty())
; [eval] p_empty()
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
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@27@01))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__incr_begin ----------
(declare-const diz@29@01 $Ref)
(declare-const ref@30@01 $Ref)
(declare-const p@31@01 Process)
(declare-const diz@32@01 $Ref)
(declare-const ref@33@01 $Ref)
(declare-const p@34@01 Process)
(push) ; 1
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (= ($Snap.first $t@35@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@32@01 $Ref.null)))
(assert (=
  ($Snap.second $t@35@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@35@01))
    ($Snap.second ($Snap.second $t@35@01)))))
(assert (not (= ref@33@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@36@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@36@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@36@01))) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@01)))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@35@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@36@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__incr_commit ----------
(declare-const diz@37@01 $Ref)
(declare-const ref@38@01 $Ref)
(declare-const p@39@01 Process)
(declare-const diz@40@01 $Ref)
(declare-const ref@41@01 $Ref)
(declare-const p@42@01 Process)
(push) ; 1
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 ($Snap.combine ($Snap.first $t@43@01) ($Snap.second $t@43@01))))
(assert (= ($Snap.first $t@43@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@40@01 $Ref.null)))
(assert (=
  ($Snap.second $t@43@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@43@01))
    ($Snap.second ($Snap.second $t@43@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@43@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@43@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@43@01))))))
(assert (not (= ref@41@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@43@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@43@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@43@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@43@01))))
  $Snap.unit))
; [eval] ref.Ref__x == diz.Ref__x_old + 1
; [eval] diz.Ref__x_old + 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@43@01))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@43@01)))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
; [eval] p_seq(p, p_incr())
; [eval] p_incr()
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (= ($Snap.second ($Snap.second $t@44@01)) $Snap.unit))
; [eval] ref.Ref__x == old(ref.Ref__x)
; [eval] old(ref.Ref__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@44@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@43@01))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__if_any_random ----------
(declare-const diz@45@01 $Ref)
(declare-const sys__result@46@01 Bool)
(declare-const diz@47@01 $Ref)
(declare-const sys__result@48@01 Bool)
(push) ; 1
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 $Snap.unit))
; [eval] diz != null
(assert (not (= diz@47@01 $Ref.null)))
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
