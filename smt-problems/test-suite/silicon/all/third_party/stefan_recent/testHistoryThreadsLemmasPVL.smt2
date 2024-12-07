(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:01
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testHistoryThreadsLemmasPVL.vpr
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
(declare-const p_empty<Process> Process)
(declare-fun p_merge<Process> (Process Process) Process)
(declare-fun p_seq<Process> (Process Process) Process)
(declare-const p_incr<Process> Process)
(declare-fun p_single<Process> (Int) Process)
(declare-fun p_dual<Process> (Int Int) Process)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((p1 Process)) (!
  (forall ((p2 Process)) (!
    (forall ((p3 Process)) (!
      (=
        (p_seq<Process> (p_seq<Process> p1 p2) p3)
        (p_seq<Process> p1 (p_seq<Process> p2 p3)))
      :pattern ((p_seq<Process> (p_seq<Process> p1 p2) p3))
      :pattern ((p_seq<Process> p1 (p_seq<Process> p2 p3)))
      ))
    :pattern ((p_seq<Process> p1 p2))
    ))
  
  :qid |prog.seq_assoc|)))
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
; ---------- History__lemma ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const n@2@01 Int)
(declare-const diz@3@01 $Ref)
(declare-const current_thread_id@4@01 Int)
(declare-const n@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@4@01 0))
(assert (= ($Snap.second ($Snap.second $t@6@01)) $Snap.unit))
; [eval] n >= 0
(assert (>= n@5@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
; [eval] p_single(n) == (n > 0 ? p_seq(p_single(n - 1), p_incr()) : p_empty())
; [eval] p_single(n)
; [eval] (n > 0 ? p_seq(p_single(n - 1), p_incr()) : p_empty())
; [eval] n > 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> n@5@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> n@5@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | n@5@01 > 0 | live]
; [else-branch: 0 | !(n@5@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | n@5@01 > 0]
(assert (> n@5@01 0))
; [eval] p_seq(p_single(n - 1), p_incr())
; [eval] p_single(n - 1)
; [eval] n - 1
; [eval] p_incr()
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(n@5@01 > 0)]
(assert (not (> n@5@01 0)))
; [eval] p_empty()
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (> n@5@01 0)) (> n@5@01 0)))
(assert (=
  (p_single<Process> n@5@01)
  (ite
    (> n@5@01 0)
    (p_seq<Process> (p_single<Process> (- n@5@01 1)) (as p_incr<Process>  Process))
    (as p_empty<Process>  Process))))
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@8@01 Bool)
; [eval] n >= 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= n@5@01 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= n@5@01 2)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | n@5@01 >= 2 | live]
; [else-branch: 1 | !(n@5@01 >= 2) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | n@5@01 >= 2]
(assert (>= n@5@01 2))
; [exec]
; History__lemma(diz, current_thread_id, n - 2)
; [eval] n - 2
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] n >= 0
(push) ; 4
(assert (not (>= (- n@5@01 2) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (>= (- n@5@01 2) 0))
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] p_single(n) == (n > 0 ? p_seq(p_single(n - 1), p_incr()) : p_empty())
; [eval] p_single(n)
; [eval] (n > 0 ? p_seq(p_single(n - 1), p_incr()) : p_empty())
; [eval] n > 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (- n@5@01 2) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> (- n@5@01 2) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | n@5@01 - 2 > 0 | live]
; [else-branch: 2 | !(n@5@01 - 2 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | n@5@01 - 2 > 0]
(assert (> (- n@5@01 2) 0))
; [eval] p_seq(p_single(n - 1), p_incr())
; [eval] p_single(n - 1)
; [eval] n - 1
; [eval] p_incr()
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(n@5@01 - 2 > 0)]
(assert (not (> (- n@5@01 2) 0)))
; [eval] p_empty()
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (> (- n@5@01 2) 0)) (> (- n@5@01 2) 0)))
(assert (=
  (p_single<Process> (- n@5@01 2))
  (ite
    (> (- n@5@01 2) 0)
    (p_seq<Process> (p_single<Process> (- (- n@5@01 2) 1)) (as p_incr<Process>  Process))
    (as p_empty<Process>  Process))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] p_single(n) == (n > 0 ? p_seq(p_single(n - 1), p_incr()) : p_empty())
; [eval] p_single(n)
; [eval] (n > 0 ? p_seq(p_single(n - 1), p_incr()) : p_empty())
; [eval] n > 0
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> n@5@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> n@5@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | n@5@01 > 0 | live]
; [else-branch: 3 | !(n@5@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | n@5@01 > 0]
(assert (> n@5@01 0))
; [eval] p_seq(p_single(n - 1), p_incr())
; [eval] p_single(n - 1)
; [eval] n - 1
; [eval] p_incr()
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (> n@5@01 0))
(push) ; 4
(assert (not (=
  (p_single<Process> n@5@01)
  (p_seq<Process> (p_single<Process> (- n@5@01 1)) (as p_incr<Process>  Process)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (p_single<Process> n@5@01)
  (p_seq<Process> (p_single<Process> (- n@5@01 1)) (as p_incr<Process>  Process))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(n@5@01 >= 2)]
(assert (not (>= n@5@01 2)))
(pop) ; 3
; [eval] !(n >= 2)
; [eval] n >= 2
(push) ; 3
(set-option :timeout 10)
(assert (not (>= n@5@01 2)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= n@5@01 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(n@5@01 >= 2) | live]
; [else-branch: 4 | n@5@01 >= 2 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | !(n@5@01 >= 2)]
(assert (not (>= n@5@01 2)))
; [eval] p_single(n) == (n > 0 ? p_seq(p_single(n - 1), p_incr()) : p_empty())
; [eval] p_single(n)
; [eval] (n > 0 ? p_seq(p_single(n - 1), p_incr()) : p_empty())
; [eval] n > 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> n@5@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> n@5@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | n@5@01 > 0 | live]
; [else-branch: 5 | !(n@5@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | n@5@01 > 0]
(assert (> n@5@01 0))
; [eval] p_seq(p_single(n - 1), p_incr())
; [eval] p_single(n - 1)
; [eval] n - 1
; [eval] p_incr()
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(n@5@01 > 0)]
(assert (not (> n@5@01 0)))
; [eval] p_empty()
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (> n@5@01 0)) (> n@5@01 0)))
(push) ; 4
(assert (not (=
  (p_single<Process> n@5@01)
  (ite
    (> n@5@01 0)
    (p_seq<Process> (p_single<Process> (- n@5@01 1)) (as p_incr<Process>  Process))
    (as p_empty<Process>  Process)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (p_single<Process> n@5@01)
  (ite
    (> n@5@01 0)
    (p_seq<Process> (p_single<Process> (- n@5@01 1)) (as p_incr<Process>  Process))
    (as p_empty<Process>  Process))))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | n@5@01 >= 2]
(assert (>= n@5@01 2))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- History__single_axiom ----------
(declare-const diz@10@01 $Ref)
(declare-const current_thread_id@11@01 Int)
(declare-const m@12@01 Int)
(declare-const n@13@01 Int)
(declare-const diz@14@01 $Ref)
(declare-const current_thread_id@15@01 Int)
(declare-const m@16@01 Int)
(declare-const n@17@01 Int)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.first $t@18@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@14@01 $Ref.null)))
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
(assert (= ($Snap.first ($Snap.second $t@18@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@15@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@18@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@18@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@18@01))) $Snap.unit))
; [eval] m >= 0
(assert (>= m@16@01 0))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@18@01))) $Snap.unit))
; [eval] n >= 0
(assert (>= n@17@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] p_seq(p_single(m), p_single(n)) == p_single(m + n)
; [eval] p_seq(p_single(m), p_single(n))
; [eval] p_single(m)
; [eval] p_single(n)
; [eval] p_single(m + n)
; [eval] m + n
(assert (=
  (p_seq<Process> (p_single<Process> m@16@01) (p_single<Process> n@17@01))
  (p_single<Process> (+ m@16@01 n@17@01))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__if_any_random ----------
(declare-const diz@20@01 $Ref)
(declare-const current_thread_id@21@01 Int)
(declare-const sys__result@22@01 Bool)
(declare-const diz@23@01 $Ref)
(declare-const current_thread_id@24@01 Int)
(declare-const sys__result@25@01 Bool)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@23@01 $Ref.null)))
(assert (= ($Snap.second $t@26@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@24@01 0))
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
