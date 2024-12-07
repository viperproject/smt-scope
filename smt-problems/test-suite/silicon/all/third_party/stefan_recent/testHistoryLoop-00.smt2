(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testHistoryLoop.vpr
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
(declare-fun History__hist_get_x ($Snap $Ref) Int)
(declare-fun History__hist_get_x%limited ($Snap $Ref) Int)
(declare-fun History__hist_get_x%stateless ($Ref) Bool)
(declare-fun History__hist_get_x%precondition ($Snap $Ref) Bool)
(declare-fun History__free_get_x ($Snap $Ref) Int)
(declare-fun History__free_get_x%limited ($Snap $Ref) Int)
(declare-fun History__free_get_x%stateless ($Ref) Bool)
(declare-fun History__free_get_x%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun History__hist_do_incr%trigger ($Snap $Ref $Perm Process) Bool)
(declare-fun History__hist_idle%trigger ($Snap $Ref $Perm Process) Bool)
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
(assert (forall ((n Int)) (!
  (=
    (p_single<Process> n)
    (ite
      (> n 0)
      (p_seq<Process> (p_single<Process> (- n 1)) (as p_incr<Process>  Process))
      (as p_empty<Process>  Process)))
  :pattern ((p_single<Process> n))
  :qid |prog.lemma_post|)))
(assert (forall ((m Int) (n Int)) (!
  (=
    (p_seq<Process> (p_single<Process> m) (p_single<Process> n))
    (p_single<Process> (+ m n)))
  :pattern ((p_seq<Process> (p_single<Process> m) (p_single<Process> n)))
  :qid |prog.single_axiom_post|)))
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
(declare-fun $k@5@00 () $Perm)
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (=
    (History__hist_get_x%limited s@$ diz@0@00)
    (History__hist_get_x s@$ diz@0@00))
  :pattern ((History__hist_get_x s@$ diz@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (History__hist_get_x%stateless diz@0@00)
  :pattern ((History__hist_get_x%limited s@$ diz@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@4@00)
    (=>
      (History__hist_get_x%precondition s@$ diz@0@00)
      (=
        (History__hist_get_x s@$ diz@0@00)
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((History__hist_get_x s@$ diz@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  true
  :pattern ((History__hist_get_x s@$ diz@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (=
    (History__free_get_x%limited s@$ diz@2@00)
    (History__free_get_x s@$ diz@2@00))
  :pattern ((History__free_get_x s@$ diz@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (History__free_get_x%stateless diz@2@00)
  :pattern ((History__free_get_x%limited s@$ diz@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@5@00)
    (=>
      (History__free_get_x%precondition s@$ diz@2@00)
      (=
        (History__free_get_x s@$ diz@2@00)
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((History__free_get_x s@$ diz@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  true
  :pattern ((History__free_get_x s@$ diz@2@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- History__incr_begin ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const frac@2@01 $Perm)
(declare-const proc@3@01 Process)
(declare-const diz@4@01 $Ref)
(declare-const current_thread_id@5@01 Int)
(declare-const frac@6@01 $Perm)
(declare-const proc@7@01 Process)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@4@01 $Ref.null)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@5@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] frac != none
(assert (not (= frac@6@01 $Perm.No)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] frac != none
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
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@9@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
  2))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@9@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == diz.History__x_hist_act
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@9@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__incr_commit ----------
(declare-const diz@10@01 $Ref)
(declare-const current_thread_id@11@01 Int)
(declare-const frac@12@01 $Perm)
(declare-const proc@13@01 Process)
(declare-const diz@14@01 $Ref)
(declare-const current_thread_id@15@01 Int)
(declare-const frac@16@01 $Perm)
(declare-const proc@17@01 Process)
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
; [eval] frac != none
(assert (not (= frac@16@01 $Perm.No)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@18@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))))
  2))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == diz.History__x_hist_act + 1
; [eval] diz.History__x_hist_act + 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
; [eval] frac != none
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
; [eval] p_seq(proc, p_incr())
; [eval] p_incr()
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@18@01)))))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__free_set_x ----------
(declare-const diz@20@01 $Ref)
(declare-const current_thread_id@21@01 Int)
(declare-const value@22@01 Int)
(declare-const diz@23@01 $Ref)
(declare-const current_thread_id@24@01 Int)
(declare-const value@25@01 Int)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@23@01 $Ref.null)))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(assert (= ($Snap.first ($Snap.second $t@26@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@24@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@26@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@26@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(assert (= ($Snap.first ($Snap.second $t@27@01)) $Snap.unit))
; [eval] diz.History__x_hist_value == value
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@27@01)) value@25@01))
(assert (=
  ($Snap.second ($Snap.second $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
; [eval] diz.History__x_hist_mode == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@27@01))))
  0))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__hist_set_x ----------
(declare-const diz@28@01 $Ref)
(declare-const current_thread_id@29@01 Int)
(declare-const value@30@01 Int)
(declare-const diz@31@01 $Ref)
(declare-const current_thread_id@32@01 Int)
(declare-const value@33@01 Int)
(push) ; 1
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (= ($Snap.first $t@34@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@31@01 $Ref.null)))
(assert (=
  ($Snap.second $t@34@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@34@01))
    ($Snap.second ($Snap.second $t@34@01)))))
(assert (= ($Snap.first ($Snap.second $t@34@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@32@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@34@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@34@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@34@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@34@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@34@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@34@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@34@01))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@34@01)))))
  2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (=
  ($Snap.second $t@35@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@35@01))
    ($Snap.second ($Snap.second $t@35@01)))))
(assert (= ($Snap.first ($Snap.second $t@35@01)) $Snap.unit))
; [eval] diz.History__x_hist_value == value
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@35@01)) value@33@01))
(assert (=
  ($Snap.second ($Snap.second $t@35@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@35@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@35@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@35@01))) $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@35@01))))
  2))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__begin_hist ----------
(declare-const diz@36@01 $Ref)
(declare-const current_thread_id@37@01 Int)
(declare-const diz@38@01 $Ref)
(declare-const current_thread_id@39@01 Int)
(push) ; 1
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 ($Snap.combine ($Snap.first $t@40@01) ($Snap.second $t@40@01))))
(assert (= ($Snap.first $t@40@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@38@01 $Ref.null)))
(assert (=
  ($Snap.second $t@40@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@40@01))
    ($Snap.second ($Snap.second $t@40@01)))))
(assert (= ($Snap.first ($Snap.second $t@40@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@39@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@40@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@40@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@40@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@40@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@40@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@40@01)))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 ($Snap.combine ($Snap.first $t@41@01) ($Snap.second $t@41@01))))
(assert (=
  ($Snap.second $t@41@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@41@01))
    ($Snap.second ($Snap.second $t@41@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@41@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@41@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@41@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@41@01))) $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@41@01))) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@41@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@41@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@40@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@41@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_init == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@41@01)))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@40@01))))))
; [eval] p_empty()
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__split ----------
(declare-const diz@42@01 $Ref)
(declare-const current_thread_id@43@01 Int)
(declare-const frac1@44@01 $Perm)
(declare-const proc1@45@01 Process)
(declare-const frac2@46@01 $Perm)
(declare-const proc2@47@01 Process)
(declare-const diz@48@01 $Ref)
(declare-const current_thread_id@49@01 Int)
(declare-const frac1@50@01 $Perm)
(declare-const proc1@51@01 Process)
(declare-const frac2@52@01 $Perm)
(declare-const proc2@53@01 Process)
(push) ; 1
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 ($Snap.combine ($Snap.first $t@54@01) ($Snap.second $t@54@01))))
(assert (= ($Snap.first $t@54@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@48@01 $Ref.null)))
(assert (=
  ($Snap.second $t@54@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@54@01))
    ($Snap.second ($Snap.second $t@54@01)))))
(assert (= ($Snap.first ($Snap.second $t@54@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@49@01 0))
; [eval] frac1 + frac2
; [eval] p_merge(proc1, proc2)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (and (= frac1@50@01 frac2@52@01) (= proc1@51@01 proc2@53@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__merge ----------
(declare-const diz@56@01 $Ref)
(declare-const current_thread_id@57@01 Int)
(declare-const frac1@58@01 $Perm)
(declare-const proc1@59@01 Process)
(declare-const frac2@60@01 $Perm)
(declare-const proc2@61@01 Process)
(declare-const diz@62@01 $Ref)
(declare-const current_thread_id@63@01 Int)
(declare-const frac1@64@01 $Perm)
(declare-const proc1@65@01 Process)
(declare-const frac2@66@01 $Perm)
(declare-const proc2@67@01 Process)
(push) ; 1
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 ($Snap.combine ($Snap.first $t@68@01) ($Snap.second $t@68@01))))
(assert (= ($Snap.first $t@68@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@62@01 $Ref.null)))
(assert (=
  ($Snap.second $t@68@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@68@01))
    ($Snap.second ($Snap.second $t@68@01)))))
(assert (= ($Snap.first ($Snap.second $t@68@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@63@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@68@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@68@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (and (= frac1@64@01 frac2@66@01) (= proc1@65@01 proc2@67@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] frac1 + frac2
; [eval] p_merge(proc1, proc2)
(declare-const $t@69@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__History ----------
(declare-const current_thread_id@70@01 Int)
(declare-const sys__result@71@01 $Ref)
(declare-const current_thread_id@72@01 Int)
(declare-const sys__result@73@01 $Ref)
(push) ; 1
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@72@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 ($Snap.combine ($Snap.first $t@75@01) ($Snap.second $t@75@01))))
(assert (= ($Snap.first $t@75@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@73@01 $Ref.null)))
(assert (=
  ($Snap.second $t@75@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@75@01))
    ($Snap.second ($Snap.second $t@75@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@75@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@75@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@75@01))) $Snap.unit))
; [eval] sys__result.History__x_hist_value == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@75@01))) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@75@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
  $Snap.unit))
; [eval] sys__result.History__x_hist_mode == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
  $Snap.unit))
; [eval] sys__result.History__x_hist_init == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01))))))))
  $Snap.unit))
; [eval] sys__result.History__x_hist_act == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@75@01)))))))))
  0))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@76@01 $Ref)
; [exec]
; var __flatten_31: Int
(declare-const __flatten_31@77@01 Int)
; [exec]
; var __flatten_32: Int
(declare-const __flatten_32@78@01 Int)
; [exec]
; var __flatten_33: Int
(declare-const __flatten_33@79@01 Int)
; [exec]
; var __flatten_34: Int
(declare-const __flatten_34@80@01 Int)
; [exec]
; var __flatten_74: Int
(declare-const __flatten_74@81@01 Int)
; [exec]
; var __flatten_75: Int
(declare-const __flatten_75@82@01 Int)
; [exec]
; var __flatten_76: Int
(declare-const __flatten_76@83@01 Int)
; [exec]
; var __flatten_77: Int
(declare-const __flatten_77@84@01 Int)
; [exec]
; diz := new(History__x_hist_value, History__x_hist_mode, History__x_hist_init, History__x_hist_act)
(declare-const diz@85@01 $Ref)
(assert (not (= diz@85@01 $Ref.null)))
(declare-const History__x_hist_value@86@01 Int)
(declare-const History__x_hist_mode@87@01 Int)
(declare-const History__x_hist_init@88@01 Int)
(declare-const History__x_hist_act@89@01 Int)
(assert (not (= diz@85@01 diz@76@01)))
(assert (not (= diz@85@01 sys__result@73@01)))
; [exec]
; __flatten_31 := 0
; [exec]
; __flatten_74 := __flatten_31
; [exec]
; diz.History__x_hist_value := __flatten_74
; [exec]
; __flatten_32 := 0
; [exec]
; __flatten_75 := __flatten_32
; [exec]
; diz.History__x_hist_mode := __flatten_75
; [exec]
; __flatten_33 := 0
; [exec]
; __flatten_76 := __flatten_33
; [exec]
; diz.History__x_hist_init := __flatten_76
; [exec]
; __flatten_34 := 0
; [exec]
; __flatten_77 := __flatten_34
; [exec]
; diz.History__x_hist_act := __flatten_77
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.History__x_hist_value, write) &&
;   sys__result.History__x_hist_value == 0 &&
;   (acc(sys__result.History__x_hist_mode, write) &&
;   sys__result.History__x_hist_mode == 0 &&
;   (acc(sys__result.History__x_hist_init, write) &&
;   sys__result.History__x_hist_init == 0 &&
;   (acc(sys__result.History__x_hist_act, write) &&
;   sys__result.History__x_hist_act == 0))))
; [eval] sys__result != null
; [eval] sys__result.History__x_hist_value == 0
; [eval] sys__result.History__x_hist_mode == 0
; [eval] sys__result.History__x_hist_init == 0
; [eval] sys__result.History__x_hist_act == 0
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__if_any_random ----------
(declare-const diz@90@01 $Ref)
(declare-const current_thread_id@91@01 Int)
(declare-const sys__result@92@01 Bool)
(declare-const diz@93@01 $Ref)
(declare-const current_thread_id@94@01 Int)
(declare-const sys__result@95@01 Bool)
(push) ; 1
(declare-const $t@96@01 $Snap)
(assert (= $t@96@01 ($Snap.combine ($Snap.first $t@96@01) ($Snap.second $t@96@01))))
(assert (= ($Snap.first $t@96@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@93@01 $Ref.null)))
(assert (= ($Snap.second $t@96@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@94@01 0))
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
; ---------- Application__do_incr_loop ----------
(declare-const diz@97@01 $Ref)
(declare-const current_thread_id@98@01 Int)
(declare-const h@99@01 $Ref)
(declare-const n@100@01 Int)
(declare-const p@101@01 Process)
(declare-const q@102@01 $Perm)
(declare-const diz@103@01 $Ref)
(declare-const current_thread_id@104@01 Int)
(declare-const h@105@01 $Ref)
(declare-const n@106@01 Int)
(declare-const p@107@01 Process)
(declare-const q@108@01 $Perm)
(push) ; 1
(declare-const $t@109@01 $Snap)
(assert (= $t@109@01 ($Snap.combine ($Snap.first $t@109@01) ($Snap.second $t@109@01))))
(assert (= ($Snap.first $t@109@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@103@01 $Ref.null)))
(assert (=
  ($Snap.second $t@109@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@109@01))
    ($Snap.second ($Snap.second $t@109@01)))))
(assert (= ($Snap.first ($Snap.second $t@109@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@104@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@109@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@109@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@109@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@109@01))) $Snap.unit))
; [eval] n >= 0
(assert (>= n@106@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@109@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@109@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@109@01))))
  $Snap.unit))
; [eval] q != none
(assert (not (= q@108@01 $Perm.No)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01)))))))))
(assert (not (= h@105@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01)))))))
  $Snap.unit))
; [eval] h.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@109@01))))))))
  1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@110@01 $Snap)
(assert (= $t@110@01 ($Snap.combine ($Snap.first $t@110@01) ($Snap.second $t@110@01))))
(assert (=
  ($Snap.second $t@110@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@110@01))
    ($Snap.second ($Snap.second $t@110@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@110@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@110@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@110@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@110@01))) $Snap.unit))
; [eval] h.History__x_hist_mode == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@110@01))) 1))
; [eval] p_seq(p, p_single(n))
; [eval] p_single(n)
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@111@01 Bool)
; [exec]
; var i: Int
(declare-const i@112@01 Int)
; [exec]
; i := 0
(declare-const i@113@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@114@01 $Snap)
(assert (= $t@114@01 ($Snap.combine ($Snap.first $t@114@01) ($Snap.second $t@114@01))))
(assert (= ($Snap.first $t@114@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@113@01))
(assert (=
  ($Snap.second $t@114@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@114@01))
    ($Snap.second ($Snap.second $t@114@01)))))
(assert (= ($Snap.first ($Snap.second $t@114@01)) $Snap.unit))
; [eval] i <= n
(assert (<= i@113@01 n@106@01))
(assert (=
  ($Snap.second ($Snap.second $t@114@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@114@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@114@01))) $Snap.unit))
; [eval] q != none
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@114@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@114@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))
  $Snap.unit))
; [eval] h.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))
  1))
; [eval] p_seq(p, p_single(i))
; [eval] p_single(i)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i <= n
(push) ; 4
(assert (not (<= 0 n@106@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 n@106@01))
; [eval] q != none
; [eval] h.History__x_hist_mode == 1
; [eval] p_seq(p, p_single(i))
; [eval] p_single(i)
(push) ; 4
(set-option :timeout 10)
(assert (not (= p@107@01 (p_seq<Process> p@107@01 (p_single<Process> 0)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 4
(assert (= $t@114@01 ($Snap.combine ($Snap.first $t@114@01) ($Snap.second $t@114@01))))
(assert (= ($Snap.first $t@114@01) $Snap.unit))
(assert (<= 0 i@113@01))
(assert (=
  ($Snap.second $t@114@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@114@01))
    ($Snap.second ($Snap.second $t@114@01)))))
(assert (= ($Snap.first ($Snap.second $t@114@01)) $Snap.unit))
(assert (<= i@113@01 n@106@01))
(assert (=
  ($Snap.second ($Snap.second $t@114@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@114@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@114@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@114@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@114@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))
  $Snap.unit))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@114@01))))))
  1))
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
; [eval] i < n
(pop) ; 5
(push) ; 5
; [eval] !(i < n)
; [eval] i < n
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < n
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@113@01 n@106@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@113@01 n@106@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@113@01 < n@106@01 | live]
; [else-branch: 0 | !(i@113@01 < n@106@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | i@113@01 < n@106@01]
(assert (< i@113@01 n@106@01))
; [exec]
; History__incr_begin(h, current_thread_id, q, p_seq(p, p_single(i)))
; [eval] p_seq(p, p_single(i))
; [eval] p_single(i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] frac != none
; [eval] diz.History__x_hist_mode == 1
(declare-const $t@115@01 $Snap)
(assert (= $t@115@01 ($Snap.combine ($Snap.first $t@115@01) ($Snap.second $t@115@01))))
(assert (= ($Snap.first $t@115@01) $Snap.unit))
; [eval] frac != none
(assert (=
  ($Snap.second $t@115@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@115@01))
    ($Snap.second ($Snap.second $t@115@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@115@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@115@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@115@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@115@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))
  2))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@115@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@114@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == diz.History__x_hist_act
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@115@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__hist_set_x(h, current_thread_id, h.History__x_hist_value + 1)
; [eval] h.History__x_hist_value + 1
; [eval] diz != null
; [eval] current_thread_id >= 0
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] diz.History__x_hist_mode == 2
(declare-const $t@116@01 $Snap)
(assert (= $t@116@01 ($Snap.combine ($Snap.first $t@116@01) ($Snap.second $t@116@01))))
(assert (=
  ($Snap.second $t@116@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@116@01))
    ($Snap.second ($Snap.second $t@116@01)))))
(assert (= ($Snap.first ($Snap.second $t@116@01)) $Snap.unit))
; [eval] diz.History__x_hist_value == value
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@116@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@115@01))))
    1)))
(assert (=
  ($Snap.second ($Snap.second $t@116@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@116@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@116@01))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@115@01)))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@116@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@116@01))) $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; History__incr_commit(h, current_thread_id, q, p_seq(p, p_single(i)))
; [eval] p_seq(p, p_single(i))
; [eval] p_single(i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] frac != none
; [eval] diz.History__x_hist_mode == 2
; [eval] diz.History__x_hist_value == diz.History__x_hist_act + 1
; [eval] diz.History__x_hist_act + 1
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@116@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))))
    1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@116@01))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))))
    1)))
(declare-const $t@117@01 $Snap)
(assert (= $t@117@01 ($Snap.combine ($Snap.first $t@117@01) ($Snap.second $t@117@01))))
(assert (= ($Snap.first $t@117@01) $Snap.unit))
; [eval] frac != none
(assert (=
  ($Snap.second $t@117@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@117@01))
    ($Snap.second ($Snap.second $t@117@01)))))
; [eval] p_seq(proc, p_incr())
; [eval] p_incr()
(assert (=
  ($Snap.second ($Snap.second $t@117@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@117@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@117@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@117@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@117@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@117@01))))
  ($SortWrappers.$SnapToInt ($Snap.first $t@116@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@118@01 Int)
(assert (= i@118@01 (+ i@113@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@118@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@118@01))
; ---------- Application__do_loop_twice ----------
(declare-const diz@119@01 $Ref)
(declare-const current_thread_id@120@01 Int)
(declare-const h@121@01 $Ref)
(declare-const m@122@01 Int)
(declare-const n@123@01 Int)
(declare-const q@124@01 $Perm)
(declare-const diz@125@01 $Ref)
(declare-const current_thread_id@126@01 Int)
(declare-const h@127@01 $Ref)
(declare-const m@128@01 Int)
(declare-const n@129@01 Int)
(declare-const q@130@01 $Perm)
(push) ; 6
; ---------- Application__Application ----------
(declare-const current_thread_id@131@01 Int)
