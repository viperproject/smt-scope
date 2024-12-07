(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testHistoryThreadsApplication.vpr
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
(declare-sort TYPE 0)
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
(declare-fun $SortWrappers.TYPETo$Snap (TYPE) $Snap)
(declare-fun $SortWrappers.$SnapToTYPE ($Snap) TYPE)
(assert (forall ((x TYPE)) (!
    (= x ($SortWrappers.$SnapToTYPE($SortWrappers.TYPETo$Snap x)))
    :pattern (($SortWrappers.TYPETo$Snap x))
    :qid |$Snap.$SnapToTYPETo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.TYPETo$Snap($SortWrappers.$SnapToTYPE x)))
    :pattern (($SortWrappers.$SnapToTYPE x))
    :qid |$Snap.TYPETo$SnapToTYPE|
    )))
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
(declare-const class_Object<TYPE> TYPE)
(declare-const class_History<TYPE> TYPE)
(declare-const class_SubjectLock<TYPE> TYPE)
(declare-const class_Thread<TYPE> TYPE)
(declare-const class_Worker<TYPE> TYPE)
(declare-const class_Main<TYPE> TYPE)
(declare-fun instanceof<Bool> (TYPE TYPE) Bool)
(declare-fun type_of<TYPE> ($Ref) TYPE)
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
(declare-fun History__inv%trigger ($Snap $Ref) Bool)
(declare-fun History__hist_do_incr%trigger ($Snap $Ref $Perm Process) Bool)
(declare-fun History__hist_idle%trigger ($Snap $Ref $Perm Process) Bool)
(declare-fun SubjectLock__inv%trigger ($Snap $Ref) Bool)
(declare-fun SubjectLock__valid%trigger ($Snap $Ref) Bool)
(declare-fun SubjectLock__locked%trigger ($Snap $Ref $Perm Int) Bool)
(declare-fun Thread__is_a_Thread%trigger ($Snap $Ref) Bool)
(declare-fun Thread__instance_of_Thread%trigger ($Snap $Ref) Bool)
(declare-fun Thread__joinToken%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__preFork%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__postJoin%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__joinToken_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__preFork_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__postJoin_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__is_a_Worker%trigger ($Snap $Ref) Bool)
(declare-fun Worker__instance_of_Worker%trigger ($Snap $Ref) Bool)
(declare-fun Worker__is_a_Thread%trigger ($Snap $Ref) Bool)
(declare-fun Worker__instance_of_Thread%trigger ($Snap $Ref) Bool)
(declare-fun Worker__joinToken%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__joinToken_at_Worker%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__preFork%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__postJoin%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__joinToken_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__preFork_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__postJoin_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__preFork_at_Worker%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__postJoin_at_Worker%trigger ($Snap $Ref $Perm) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((t TYPE)) (!
  (instanceof<Bool> (as class_Object<TYPE>  TYPE) t)
  :pattern ((instanceof<Bool> (as class_Object<TYPE>  TYPE) t))
  :qid |prog.object_top|)))
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
(declare-const sys__thrown@4@01 $Ref)
(declare-const diz@5@01 $Ref)
(declare-const current_thread_id@6@01 Int)
(declare-const frac@7@01 $Perm)
(declare-const proc@8@01 Process)
(declare-const sys__thrown@9@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.first $t@10@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@5@01 $Ref.null)))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (= ($Snap.first ($Snap.second $t@10@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@6@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@10@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@10@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@10@01))) $Snap.unit))
; [eval] frac != none
(assert (not (= frac@7@01 $Perm.No)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@10@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@10@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01)))))))
  1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.first $t@11@01) $Snap.unit))
; [eval] frac != none
(assert (=
  ($Snap.second $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.second ($Snap.second $t@11@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@11@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@11@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@11@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@11@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))
  2))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@11@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@10@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == diz.History__x_hist_act
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@11@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__incr_commit ----------
(declare-const diz@12@01 $Ref)
(declare-const current_thread_id@13@01 Int)
(declare-const frac@14@01 $Perm)
(declare-const proc@15@01 Process)
(declare-const sys__thrown@16@01 $Ref)
(declare-const diz@17@01 $Ref)
(declare-const current_thread_id@18@01 Int)
(declare-const frac@19@01 $Perm)
(declare-const proc@20@01 Process)
(declare-const sys__thrown@21@01 $Ref)
(push) ; 1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (= ($Snap.first $t@22@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@17@01 $Ref.null)))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (= ($Snap.first ($Snap.second $t@22@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@18@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@22@01))) $Snap.unit))
; [eval] frac != none
(assert (not (= frac@19@01 $Perm.No)))
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
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  2))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == diz.History__x_hist_act + 1
; [eval] diz.History__x_hist_act + 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (= ($Snap.first $t@23@01) $Snap.unit))
; [eval] frac != none
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
; [eval] p_seq(proc, p_incr())
; [eval] p_incr()
(assert (=
  ($Snap.second ($Snap.second $t@23@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@23@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@23@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@23@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@23@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__free_set_x ----------
(declare-const diz@24@01 $Ref)
(declare-const current_thread_id@25@01 Int)
(declare-const value@26@01 Int)
(declare-const sys__thrown@27@01 $Ref)
(declare-const diz@28@01 $Ref)
(declare-const current_thread_id@29@01 Int)
(declare-const value@30@01 Int)
(declare-const sys__thrown@31@01 $Ref)
(push) ; 1
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.first $t@32@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@28@01 $Ref.null)))
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(assert (= ($Snap.first ($Snap.second $t@32@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@29@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@32@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@32@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@32@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@32@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@32@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@32@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@32@01))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@32@01)))))
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (=
  ($Snap.second $t@33@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@33@01))
    ($Snap.second ($Snap.second $t@33@01)))))
(assert (= ($Snap.first ($Snap.second $t@33@01)) $Snap.unit))
; [eval] diz.History__x_hist_value == value
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@33@01)) value@30@01))
(assert (=
  ($Snap.second ($Snap.second $t@33@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@33@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@33@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@33@01))) $Snap.unit))
; [eval] diz.History__x_hist_mode == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@33@01))))
  0))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__hist_set_x ----------
(declare-const diz@34@01 $Ref)
(declare-const current_thread_id@35@01 Int)
(declare-const value@36@01 Int)
(declare-const sys__thrown@37@01 $Ref)
(declare-const diz@38@01 $Ref)
(declare-const current_thread_id@39@01 Int)
(declare-const value@40@01 Int)
(declare-const sys__thrown@41@01 $Ref)
(push) ; 1
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01))))
(assert (= ($Snap.first $t@42@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@38@01 $Ref.null)))
(assert (=
  ($Snap.second $t@42@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@42@01))
    ($Snap.second ($Snap.second $t@42@01)))))
(assert (= ($Snap.first ($Snap.second $t@42@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@39@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@42@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@42@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@42@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@42@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@42@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))
  2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 ($Snap.combine ($Snap.first $t@43@01) ($Snap.second $t@43@01))))
(assert (=
  ($Snap.second $t@43@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@43@01))
    ($Snap.second ($Snap.second $t@43@01)))))
(assert (= ($Snap.first ($Snap.second $t@43@01)) $Snap.unit))
; [eval] diz.History__x_hist_value == value
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@43@01)) value@40@01))
(assert (=
  ($Snap.second ($Snap.second $t@43@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@43@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@43@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@43@01))) $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@43@01))))
  2))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__begin_hist ----------
(declare-const diz@44@01 $Ref)
(declare-const current_thread_id@45@01 Int)
(declare-const sys__thrown@46@01 $Ref)
(declare-const diz@47@01 $Ref)
(declare-const current_thread_id@48@01 Int)
(declare-const sys__thrown@49@01 $Ref)
(push) ; 1
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (= ($Snap.first $t@50@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@47@01 $Ref.null)))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(assert (= ($Snap.first ($Snap.second $t@50@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@48@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@50@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@50@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@50@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (=
  ($Snap.second $t@51@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@51@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@51@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@51@01))) $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@51@01))) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@51@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@51@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@50@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_init == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@50@01))))))
; [eval] p_empty()
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__split ----------
(declare-const diz@52@01 $Ref)
(declare-const current_thread_id@53@01 Int)
(declare-const frac1@54@01 $Perm)
(declare-const proc1@55@01 Process)
(declare-const frac2@56@01 $Perm)
(declare-const proc2@57@01 Process)
(declare-const sys__thrown@58@01 $Ref)
(declare-const diz@59@01 $Ref)
(declare-const current_thread_id@60@01 Int)
(declare-const frac1@61@01 $Perm)
(declare-const proc1@62@01 Process)
(declare-const frac2@63@01 $Perm)
(declare-const proc2@64@01 Process)
(declare-const sys__thrown@65@01 $Ref)
(push) ; 1
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 ($Snap.combine ($Snap.first $t@66@01) ($Snap.second $t@66@01))))
(assert (= ($Snap.first $t@66@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@59@01 $Ref.null)))
(assert (=
  ($Snap.second $t@66@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@66@01))
    ($Snap.second ($Snap.second $t@66@01)))))
(assert (= ($Snap.first ($Snap.second $t@66@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@60@01 0))
; [eval] frac1 + frac2
; [eval] p_merge(proc1, proc2)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (and (= frac1@61@01 frac2@63@01) (= proc1@62@01 proc2@64@01))))
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
(declare-const diz@68@01 $Ref)
(declare-const current_thread_id@69@01 Int)
(declare-const frac1@70@01 $Perm)
(declare-const proc1@71@01 Process)
(declare-const frac2@72@01 $Perm)
(declare-const proc2@73@01 Process)
(declare-const sys__thrown@74@01 $Ref)
(declare-const diz@75@01 $Ref)
(declare-const current_thread_id@76@01 Int)
(declare-const frac1@77@01 $Perm)
(declare-const proc1@78@01 Process)
(declare-const frac2@79@01 $Perm)
(declare-const proc2@80@01 Process)
(declare-const sys__thrown@81@01 $Ref)
(push) ; 1
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 ($Snap.combine ($Snap.first $t@82@01) ($Snap.second $t@82@01))))
(assert (= ($Snap.first $t@82@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@75@01 $Ref.null)))
(assert (=
  ($Snap.second $t@82@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@82@01))
    ($Snap.second ($Snap.second $t@82@01)))))
(assert (= ($Snap.first ($Snap.second $t@82@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@76@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@82@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@82@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@82@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (and (= frac1@77@01 frac2@79@01) (= proc1@78@01 proc2@80@01))))
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
(declare-const $t@83@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__History ----------
(declare-const current_thread_id@84@01 Int)
(declare-const sys__thrown@85@01 $Ref)
(declare-const sys__result@86@01 $Ref)
(declare-const current_thread_id@87@01 Int)
(declare-const sys__thrown@88@01 $Ref)
(declare-const sys__result@89@01 $Ref)
(push) ; 1
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@87@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@91@01 $Snap)
(assert (= $t@91@01 ($Snap.combine ($Snap.first $t@91@01) ($Snap.second $t@91@01))))
(assert (= ($Snap.first $t@91@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@89@01 $Ref.null)))
(assert (=
  ($Snap.second $t@91@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@91@01))
    ($Snap.second ($Snap.second $t@91@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@91@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@91@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@91@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@91@01))) $Snap.unit))
; [eval] sys__result.History__x_hist_value == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@91@01))) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@91@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@91@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))
  $Snap.unit))
; [eval] sys__result.History__x_hist_mode == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))))
  $Snap.unit))
; [eval] sys__result.History__x_hist_init == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01))))))))
  $Snap.unit))
; [eval] sys__result.History__x_hist_act == 0
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@91@01)))))))))
  0))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@92@01 $Ref)
; [exec]
; var __flatten_33: Int
(declare-const __flatten_33@93@01 Int)
; [exec]
; var __flatten_34: Int
(declare-const __flatten_34@94@01 Int)
; [exec]
; var __flatten_35: Int
(declare-const __flatten_35@95@01 Int)
; [exec]
; var __flatten_36: Int
(declare-const __flatten_36@96@01 Int)
; [exec]
; var __flatten_101: Int
(declare-const __flatten_101@97@01 Int)
; [exec]
; var __flatten_102: Int
(declare-const __flatten_102@98@01 Int)
; [exec]
; var __flatten_103: Int
(declare-const __flatten_103@99@01 Int)
; [exec]
; var __flatten_104: Int
(declare-const __flatten_104@100@01 Int)
; [exec]
; diz := new(History__x_hist_value, History__x_hist_mode, History__x_hist_init, History__x_hist_act)
(declare-const diz@101@01 $Ref)
(assert (not (= diz@101@01 $Ref.null)))
(declare-const History__x_hist_value@102@01 Int)
(declare-const History__x_hist_mode@103@01 Int)
(declare-const History__x_hist_init@104@01 Int)
(declare-const History__x_hist_act@105@01 Int)
(assert (not (= diz@101@01 sys__thrown@88@01)))
(assert (not (= diz@101@01 diz@92@01)))
(assert (not (= diz@101@01 sys__result@89@01)))
; [exec]
; __flatten_33 := 0
; [exec]
; __flatten_101 := __flatten_33
; [exec]
; diz.History__x_hist_value := __flatten_101
; [exec]
; __flatten_34 := 0
; [exec]
; __flatten_102 := __flatten_34
; [exec]
; diz.History__x_hist_mode := __flatten_102
; [exec]
; __flatten_35 := 0
; [exec]
; __flatten_103 := __flatten_35
; [exec]
; diz.History__x_hist_init := __flatten_103
; [exec]
; __flatten_36 := 0
; [exec]
; __flatten_104 := __flatten_36
; [exec]
; diz.History__x_hist_act := __flatten_104
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
; ---------- History__end_hist_1 ----------
(declare-const diz@106@01 $Ref)
(declare-const current_thread_id@107@01 Int)
(declare-const n@108@01 Int)
(declare-const m@109@01 Int)
(declare-const sys__thrown@110@01 $Ref)
(declare-const diz@111@01 $Ref)
(declare-const current_thread_id@112@01 Int)
(declare-const n@113@01 Int)
(declare-const m@114@01 Int)
(declare-const sys__thrown@115@01 $Ref)
(push) ; 1
(declare-const $t@116@01 $Snap)
(assert (= $t@116@01 ($Snap.combine ($Snap.first $t@116@01) ($Snap.second $t@116@01))))
(assert (= ($Snap.first $t@116@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@111@01 $Ref.null)))
(assert (=
  ($Snap.second $t@116@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@116@01))
    ($Snap.second ($Snap.second $t@116@01)))))
(assert (= ($Snap.first ($Snap.second $t@116@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@112@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@116@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@116@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@116@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@116@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@116@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@116@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@116@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@116@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@116@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@116@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@116@01)))))
  1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@117@01 $Snap)
(assert (= $t@117@01 ($Snap.combine ($Snap.first $t@117@01) ($Snap.second $t@117@01))))
(assert (=
  ($Snap.second $t@117@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@117@01))
    ($Snap.second ($Snap.second $t@117@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@117@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@117@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@117@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@117@01))) $Snap.unit))
; [eval] diz.History__x_hist_mode == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@117@01))) 0))
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
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@117@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@116@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))))
  $Snap.unit))
; [eval] diz.History__x_hist_init == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@116@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@117@01)))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_init) + n + m
; [eval] old(diz.History__x_hist_init) + n + m
; [eval] old(diz.History__x_hist_init) + n
; [eval] old(diz.History__x_hist_init)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@117@01))
  (+
    (+
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@116@01))))))
      n@113@01)
    m@114@01)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- History__if_any_random ----------
(declare-const diz@118@01 $Ref)
(declare-const current_thread_id@119@01 Int)
(declare-const sys__thrown@120@01 $Ref)
(declare-const sys__result@121@01 Bool)
(declare-const diz@122@01 $Ref)
(declare-const current_thread_id@123@01 Int)
(declare-const sys__thrown@124@01 $Ref)
(declare-const sys__result@125@01 Bool)
(push) ; 1
(declare-const $t@126@01 $Snap)
(assert (= $t@126@01 ($Snap.combine ($Snap.first $t@126@01) ($Snap.second $t@126@01))))
(assert (= ($Snap.first $t@126@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@122@01 $Ref.null)))
(assert (= ($Snap.second $t@126@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@123@01 0))
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
; ---------- SubjectLock__SubjectLock ----------
(declare-const current_thread_id@127@01 Int)
(declare-const s@128@01 $Ref)
(declare-const sys__thrown@129@01 $Ref)
(declare-const sys__result@130@01 $Ref)
(declare-const current_thread_id@131@01 Int)
(declare-const s@132@01 $Ref)
(declare-const sys__thrown@133@01 $Ref)
(declare-const sys__result@134@01 $Ref)
(push) ; 1
(declare-const $t@135@01 $Snap)
(assert (= $t@135@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@131@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@136@01 $Snap)
(assert (= $t@136@01 ($Snap.combine ($Snap.first $t@136@01) ($Snap.second $t@136@01))))
(assert (= ($Snap.first $t@136@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@134@01 $Ref.null)))
(assert (=
  ($Snap.second $t@136@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@136@01))
    ($Snap.second ($Snap.second $t@136@01)))))
(assert (= ($Snap.first ($Snap.second $t@136@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_SubjectLock()
; [eval] type_of(sys__result)
; [eval] class_SubjectLock()
(assert (= (type_of<TYPE> sys__result@134@01) (as class_SubjectLock<TYPE>  TYPE)))
(assert (=
  ($Snap.second ($Snap.second $t@136@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@136@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@136@01))))))
(declare-const $k@137@01 $Perm)
(assert ($Perm.isReadVar $k@137@01))
(assert (<= $Perm.No $k@137@01))
(assert (<= $k@137@01 $Perm.Write))
(assert (=> (< $Perm.No $k@137@01) (not (= sys__result@134@01 $Ref.null))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@136@01))) $Snap.unit))
; [eval] sys__result.SubjectLock__subject == s
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@137@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@136@01))))
  s@132@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@138@01 $Ref)
; [exec]
; var __flatten_37: Ref
(declare-const __flatten_37@139@01 $Ref)
; [exec]
; var __flatten_105: Ref
(declare-const __flatten_105@140@01 $Ref)
; [exec]
; diz := new(SubjectLock__subject)
(declare-const diz@141@01 $Ref)
(assert (not (= diz@141@01 $Ref.null)))
(declare-const SubjectLock__subject@142@01 $Ref)
(assert (not (= diz@141@01 __flatten_37@139@01)))
(assert (not (= diz@141@01 diz@138@01)))
(assert (not (= diz@141@01 sys__thrown@133@01)))
(assert (not (= diz@141@01 __flatten_105@140@01)))
(assert (not (= diz@141@01 sys__result@134@01)))
(assert (not (= diz@141@01 s@132@01)))
; [exec]
; inhale type_of(diz) == class_SubjectLock()
(declare-const $t@143@01 $Snap)
(assert (= $t@143@01 $Snap.unit))
; [eval] type_of(diz) == class_SubjectLock()
; [eval] type_of(diz)
; [eval] class_SubjectLock()
(assert (= (type_of<TYPE> diz@141@01) (as class_SubjectLock<TYPE>  TYPE)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __flatten_37 := s
; [exec]
; __flatten_105 := __flatten_37
; [exec]
; diz.SubjectLock__subject := __flatten_105
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (type_of(sys__result) == class_SubjectLock() &&
;   (acc(sys__result.SubjectLock__subject, wildcard) &&
;   sys__result.SubjectLock__subject == s))
; [eval] sys__result != null
; [eval] type_of(sys__result) == class_SubjectLock()
; [eval] type_of(sys__result)
; [eval] class_SubjectLock()
(declare-const $k@144@01 $Perm)
(assert ($Perm.isReadVar $k@144@01))
(assert (< $k@144@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@144@01)))
(assert (<= (- $Perm.Write $k@144@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@144@01)) (not (= diz@141@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@144@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sys__result.SubjectLock__subject == s
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- SubjectLock__commit ----------
(declare-const diz@145@01 $Ref)
(declare-const current_thread_id@146@01 Int)
(declare-const sys__thrown@147@01 $Ref)
(declare-const diz@148@01 $Ref)
(declare-const current_thread_id@149@01 Int)
(declare-const sys__thrown@150@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@151@01 $Snap)
(assert (= $t@151@01 ($Snap.combine ($Snap.first $t@151@01) ($Snap.second $t@151@01))))
(assert (= ($Snap.first $t@151@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@148@01 $Ref.null)))
(assert (=
  ($Snap.second $t@151@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@151@01))
    ($Snap.second ($Snap.second $t@151@01)))))
(assert (= ($Snap.first ($Snap.second $t@151@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@149@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@152@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- SubjectLock__uncommit ----------
(declare-const diz@153@01 $Ref)
(declare-const current_thread_id@154@01 Int)
(declare-const sys__thrown@155@01 $Ref)
(declare-const diz@156@01 $Ref)
(declare-const current_thread_id@157@01 Int)
(declare-const sys__thrown@158@01 $Ref)
(push) ; 1
(declare-const $t@159@01 $Snap)
(assert (= $t@159@01 ($Snap.combine ($Snap.first $t@159@01) ($Snap.second $t@159@01))))
(assert (= ($Snap.first $t@159@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@156@01 $Ref.null)))
(assert (=
  ($Snap.second $t@159@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@159@01))
    ($Snap.second ($Snap.second $t@159@01)))))
(assert (= ($Snap.first ($Snap.second $t@159@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@157@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@160@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- SubjectLock__lock ----------
(declare-const diz@161@01 $Ref)
(declare-const current_thread_id@162@01 Int)
(declare-const count@163@01 Int)
(declare-const p@164@01 $Perm)
(declare-const sys__thrown@165@01 $Ref)
(declare-const diz@166@01 $Ref)
(declare-const current_thread_id@167@01 Int)
(declare-const count@168@01 Int)
(declare-const p@169@01 $Perm)
(declare-const sys__thrown@170@01 $Ref)
(push) ; 1
(declare-const $t@171@01 $Snap)
(assert (= $t@171@01 ($Snap.combine ($Snap.first $t@171@01) ($Snap.second $t@171@01))))
(assert (= ($Snap.first $t@171@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@166@01 $Ref.null)))
(assert (=
  ($Snap.second $t@171@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@171@01))
    ($Snap.second ($Snap.second $t@171@01)))))
(assert (= ($Snap.first ($Snap.second $t@171@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@167@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@171@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@171@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@171@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@171@01))) $Snap.unit))
; [eval] count >= 0
(assert (>= count@168@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@171@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@171@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@171@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@171@01))))
  $Snap.unit))
; [eval] p >= none
(assert (>= p@169@01 $Perm.No))
; [eval] count > 0
(push) ; 2
(set-option :timeout 10)
(assert (not (not (> count@168@01 0))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (> count@168@01 0)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | count@168@01 > 0 | live]
; [else-branch: 0 | !(count@168@01 > 0) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | count@168@01 > 0]
(assert (> count@168@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@172@01 $Snap)
(assert (= $t@172@01 ($Snap.combine ($Snap.first $t@172@01) ($Snap.second $t@172@01))))
; [eval] count + 1
; [eval] count == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= count@168@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | count@168@01 == 0 | dead]
; [else-branch: 1 | count@168@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | count@168@01 != 0]
(assert (not (= count@168@01 0)))
(assert (= ($Snap.second $t@172@01) $Snap.unit))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 0 | !(count@168@01 > 0)]
(assert (not (> count@168@01 0)))
(push) ; 3
(assert (not (or (= p@169@01 $Perm.No) (< $Perm.No p@169@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No p@169@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@173@01 $Snap)
(assert (= $t@173@01 ($Snap.combine ($Snap.first $t@173@01) ($Snap.second $t@173@01))))
; [eval] count + 1
; [eval] count == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= count@168@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= count@168@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | count@168@01 == 0 | live]
; [else-branch: 2 | count@168@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | count@168@01 == 0]
(assert (= count@168@01 0))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- SubjectLock__unlock ----------
(declare-const diz@174@01 $Ref)
(declare-const current_thread_id@175@01 Int)
(declare-const count@176@01 Int)
(declare-const p@177@01 $Perm)
(declare-const sys__thrown@178@01 $Ref)
(declare-const diz@179@01 $Ref)
(declare-const current_thread_id@180@01 Int)
(declare-const count@181@01 Int)
(declare-const p@182@01 $Perm)
(declare-const sys__thrown@183@01 $Ref)
(push) ; 1
(declare-const $t@184@01 $Snap)
(assert (= $t@184@01 ($Snap.combine ($Snap.first $t@184@01) ($Snap.second $t@184@01))))
(assert (= ($Snap.first $t@184@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@179@01 $Ref.null)))
(assert (=
  ($Snap.second $t@184@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@184@01))
    ($Snap.second ($Snap.second $t@184@01)))))
(assert (= ($Snap.first ($Snap.second $t@184@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@180@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@184@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@184@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@184@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@184@01))) $Snap.unit))
; [eval] count > 0
(assert (> count@181@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@184@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@184@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@184@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@184@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@184@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@184@01))))))))
; [eval] count == 1
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= count@181@01 1))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= count@181@01 1)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | count@181@01 == 1 | live]
; [else-branch: 3 | count@181@01 != 1 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 3 | count@181@01 == 1]
(assert (= count@181@01 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@184@01)))))
  $Snap.unit))
; [eval] p >= none
(assert (>= p@182@01 $Perm.No))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
; [eval] count == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= count@181@01 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | count@181@01 == 1 | live]
; [else-branch: 4 | count@181@01 != 1 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | count@181@01 == 1]
(push) ; 5
(assert (not (or (= p@182@01 $Perm.No) (< $Perm.No p@182@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $t@185@01 $Snap)
(assert (<= $Perm.No p@182@01))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 3 | count@181@01 != 1]
(assert (not (= count@181@01 1)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@184@01)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@184@01)))))
  $Snap.unit))
; [eval] p >= none
(assert (>= p@182@01 $Perm.No))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
; [eval] count == 1
; [then-branch: 5 | count@181@01 == 1 | dead]
; [else-branch: 5 | count@181@01 != 1 | live]
(push) ; 4
; [else-branch: 5 | count@181@01 != 1]
; [eval] count - 1
(declare-const $t@186@01 $Snap)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- SubjectLock__if_any_random ----------
(declare-const diz@187@01 $Ref)
(declare-const current_thread_id@188@01 Int)
(declare-const sys__thrown@189@01 $Ref)
(declare-const sys__result@190@01 Bool)
(declare-const diz@191@01 $Ref)
(declare-const current_thread_id@192@01 Int)
(declare-const sys__thrown@193@01 $Ref)
(declare-const sys__result@194@01 Bool)
(push) ; 1
(declare-const $t@195@01 $Snap)
(assert (= $t@195@01 ($Snap.combine ($Snap.first $t@195@01) ($Snap.second $t@195@01))))
(assert (= ($Snap.first $t@195@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@191@01 $Ref.null)))
(assert (= ($Snap.second $t@195@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@192@01 0))
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
; ---------- Thread__run ----------
(declare-const diz@196@01 $Ref)
(declare-const current_thread_id@197@01 Int)
(declare-const sys__thrown@198@01 $Ref)
(declare-const diz@199@01 $Ref)
(declare-const current_thread_id@200@01 Int)
(declare-const sys__thrown@201@01 $Ref)
(push) ; 1
(declare-const $t@202@01 $Snap)
(assert (= $t@202@01 ($Snap.combine ($Snap.first $t@202@01) ($Snap.second $t@202@01))))
(assert (= ($Snap.first $t@202@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@199@01 $Ref.null)))
(assert (=
  ($Snap.second $t@202@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@202@01))
    ($Snap.second ($Snap.second $t@202@01)))))
(assert (= ($Snap.first ($Snap.second $t@202@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@200@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@203@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__start ----------
(declare-const diz@204@01 $Ref)
(declare-const current_thread_id@205@01 Int)
(declare-const sys__thrown@206@01 $Ref)
(declare-const diz@207@01 $Ref)
(declare-const current_thread_id@208@01 Int)
(declare-const sys__thrown@209@01 $Ref)
(push) ; 1
(declare-const $t@210@01 $Snap)
(assert (= $t@210@01 ($Snap.combine ($Snap.first $t@210@01) ($Snap.second $t@210@01))))
(assert (= ($Snap.first $t@210@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@207@01 $Ref.null)))
(assert (=
  ($Snap.second $t@210@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@210@01))
    ($Snap.second ($Snap.second $t@210@01)))))
(assert (= ($Snap.first ($Snap.second $t@210@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@208@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@211@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__join ----------
(declare-const diz@212@01 $Ref)
(declare-const current_thread_id@213@01 Int)
(declare-const p@214@01 $Perm)
(declare-const sys__thrown@215@01 $Ref)
(declare-const diz@216@01 $Ref)
(declare-const current_thread_id@217@01 Int)
(declare-const p@218@01 $Perm)
(declare-const sys__thrown@219@01 $Ref)
(push) ; 1
(declare-const $t@220@01 $Snap)
(assert (= $t@220@01 ($Snap.combine ($Snap.first $t@220@01) ($Snap.second $t@220@01))))
(assert (= ($Snap.first $t@220@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@216@01 $Ref.null)))
(assert (=
  ($Snap.second $t@220@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@220@01))
    ($Snap.second ($Snap.second $t@220@01)))))
(assert (= ($Snap.first ($Snap.second $t@220@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@217@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@221@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__open_joinToken_at_Thread ----------
(declare-const diz@222@01 $Ref)
(declare-const current_thread_id@223@01 Int)
(declare-const p@224@01 $Perm)
(declare-const sys__thrown@225@01 $Ref)
(declare-const diz@226@01 $Ref)
(declare-const current_thread_id@227@01 Int)
(declare-const p@228@01 $Perm)
(declare-const sys__thrown@229@01 $Ref)
(push) ; 1
(declare-const $t@230@01 $Snap)
(assert (= $t@230@01 ($Snap.combine ($Snap.first $t@230@01) ($Snap.second $t@230@01))))
(assert (= ($Snap.first $t@230@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@226@01 $Ref.null)))
(assert (=
  ($Snap.second $t@230@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@230@01))
    ($Snap.second ($Snap.second $t@230@01)))))
(assert (= ($Snap.first ($Snap.second $t@230@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@227@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@230@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@230@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@230@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@231@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__open_preFork_at_Thread ----------
(declare-const diz@232@01 $Ref)
(declare-const current_thread_id@233@01 Int)
(declare-const p@234@01 $Perm)
(declare-const sys__thrown@235@01 $Ref)
(declare-const diz@236@01 $Ref)
(declare-const current_thread_id@237@01 Int)
(declare-const p@238@01 $Perm)
(declare-const sys__thrown@239@01 $Ref)
(push) ; 1
(declare-const $t@240@01 $Snap)
(assert (= $t@240@01 ($Snap.combine ($Snap.first $t@240@01) ($Snap.second $t@240@01))))
(assert (= ($Snap.first $t@240@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@236@01 $Ref.null)))
(assert (=
  ($Snap.second $t@240@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@240@01))
    ($Snap.second ($Snap.second $t@240@01)))))
(assert (= ($Snap.first ($Snap.second $t@240@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@237@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@240@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@240@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@240@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@241@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__open_postJoin_at_Thread ----------
(declare-const diz@242@01 $Ref)
(declare-const current_thread_id@243@01 Int)
(declare-const p@244@01 $Perm)
(declare-const sys__thrown@245@01 $Ref)
(declare-const diz@246@01 $Ref)
(declare-const current_thread_id@247@01 Int)
(declare-const p@248@01 $Perm)
(declare-const sys__thrown@249@01 $Ref)
(push) ; 1
(declare-const $t@250@01 $Snap)
(assert (= $t@250@01 ($Snap.combine ($Snap.first $t@250@01) ($Snap.second $t@250@01))))
(assert (= ($Snap.first $t@250@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@246@01 $Ref.null)))
(assert (=
  ($Snap.second $t@250@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@250@01))
    ($Snap.second ($Snap.second $t@250@01)))))
(assert (= ($Snap.first ($Snap.second $t@250@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@247@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@250@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@250@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@250@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@251@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__Thread ----------
(declare-const current_thread_id@252@01 Int)
(declare-const sys__thrown@253@01 $Ref)
(declare-const sys__result@254@01 $Ref)
(declare-const current_thread_id@255@01 Int)
(declare-const sys__thrown@256@01 $Ref)
(declare-const sys__result@257@01 $Ref)
(push) ; 1
(declare-const $t@258@01 $Snap)
(assert (= $t@258@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@255@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@259@01 $Snap)
(assert (= $t@259@01 ($Snap.combine ($Snap.first $t@259@01) ($Snap.second $t@259@01))))
(assert (= ($Snap.first $t@259@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@257@01 $Ref.null)))
(assert (=
  ($Snap.second $t@259@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@259@01))
    ($Snap.second ($Snap.second $t@259@01)))))
(assert (= ($Snap.first ($Snap.second $t@259@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Thread()
; [eval] type_of(sys__result)
; [eval] class_Thread()
(assert (= (type_of<TYPE> sys__result@257@01) (as class_Thread<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__Thread_at_Thread ----------
(declare-const current_thread_id@260@01 Int)
(declare-const sys__thrown@261@01 $Ref)
(declare-const sys__result@262@01 $Ref)
(declare-const current_thread_id@263@01 Int)
(declare-const sys__thrown@264@01 $Ref)
(declare-const sys__result@265@01 $Ref)
(push) ; 1
(declare-const $t@266@01 $Snap)
(assert (= $t@266@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@263@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@267@01 $Snap)
(assert (= $t@267@01 ($Snap.combine ($Snap.first $t@267@01) ($Snap.second $t@267@01))))
(assert (= ($Snap.first $t@267@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@265@01 $Ref.null)))
(assert (= ($Snap.second $t@267@01) $Snap.unit))
; [eval] type_of(sys__result) == class_Thread()
; [eval] type_of(sys__result)
; [eval] class_Thread()
(assert (= (type_of<TYPE> sys__result@265@01) (as class_Thread<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@268@01 $Ref)
; [exec]
; diz := new()
(declare-const diz@269@01 $Ref)
(assert (not (= diz@269@01 $Ref.null)))
(assert (not (= diz@269@01 sys__result@265@01)))
(assert (not (= diz@269@01 diz@268@01)))
(assert (not (= diz@269@01 sys__thrown@264@01)))
; [exec]
; inhale type_of(diz) == class_Thread()
(declare-const $t@270@01 $Snap)
(assert (= $t@270@01 $Snap.unit))
; [eval] type_of(diz) == class_Thread()
; [eval] type_of(diz)
; [eval] class_Thread()
(assert (= (type_of<TYPE> diz@269@01) (as class_Thread<TYPE>  TYPE)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__run_at_Thread ----------
(declare-const diz@271@01 $Ref)
(declare-const current_thread_id@272@01 Int)
(declare-const sys__thrown@273@01 $Ref)
(declare-const diz@274@01 $Ref)
(declare-const current_thread_id@275@01 Int)
(declare-const sys__thrown@276@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@277@01 $Snap)
(assert (= $t@277@01 ($Snap.combine ($Snap.first $t@277@01) ($Snap.second $t@277@01))))
(assert (= ($Snap.first $t@277@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@274@01 $Ref.null)))
(assert (=
  ($Snap.second $t@277@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@277@01))
    ($Snap.second ($Snap.second $t@277@01)))))
(assert (= ($Snap.first ($Snap.second $t@277@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@275@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@278@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__start_at_Thread ----------
(declare-const diz@279@01 $Ref)
(declare-const current_thread_id@280@01 Int)
(declare-const sys__thrown@281@01 $Ref)
(declare-const diz@282@01 $Ref)
(declare-const current_thread_id@283@01 Int)
(declare-const sys__thrown@284@01 $Ref)
(push) ; 1
(declare-const $t@285@01 $Snap)
(assert (= $t@285@01 ($Snap.combine ($Snap.first $t@285@01) ($Snap.second $t@285@01))))
(assert (= ($Snap.first $t@285@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@282@01 $Ref.null)))
(assert (=
  ($Snap.second $t@285@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@285@01))
    ($Snap.second ($Snap.second $t@285@01)))))
(assert (= ($Snap.first ($Snap.second $t@285@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@283@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@286@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__join_at_Thread ----------
(declare-const diz@287@01 $Ref)
(declare-const current_thread_id@288@01 Int)
(declare-const p@289@01 $Perm)
(declare-const sys__thrown@290@01 $Ref)
(declare-const diz@291@01 $Ref)
(declare-const current_thread_id@292@01 Int)
(declare-const p@293@01 $Perm)
(declare-const sys__thrown@294@01 $Ref)
(push) ; 1
(declare-const $t@295@01 $Snap)
(assert (= $t@295@01 ($Snap.combine ($Snap.first $t@295@01) ($Snap.second $t@295@01))))
(assert (= ($Snap.first $t@295@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@291@01 $Ref.null)))
(assert (=
  ($Snap.second $t@295@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@295@01))
    ($Snap.second ($Snap.second $t@295@01)))))
(assert (= ($Snap.first ($Snap.second $t@295@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@292@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@296@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__if_any_random ----------
(declare-const diz@297@01 $Ref)
(declare-const current_thread_id@298@01 Int)
(declare-const sys__thrown@299@01 $Ref)
(declare-const sys__result@300@01 Bool)
(declare-const diz@301@01 $Ref)
(declare-const current_thread_id@302@01 Int)
(declare-const sys__thrown@303@01 $Ref)
(declare-const sys__result@304@01 Bool)
(push) ; 1
(declare-const $t@305@01 $Snap)
(assert (= $t@305@01 ($Snap.combine ($Snap.first $t@305@01) ($Snap.second $t@305@01))))
(assert (= ($Snap.first $t@305@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@301@01 $Ref.null)))
(assert (= ($Snap.second $t@305@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@302@01 0))
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
; ---------- Worker__run ----------
(declare-const diz@306@01 $Ref)
(declare-const current_thread_id@307@01 Int)
(declare-const sys__thrown@308@01 $Ref)
(declare-const diz@309@01 $Ref)
(declare-const current_thread_id@310@01 Int)
(declare-const sys__thrown@311@01 $Ref)
(push) ; 1
(declare-const $t@312@01 $Snap)
(assert (= $t@312@01 ($Snap.combine ($Snap.first $t@312@01) ($Snap.second $t@312@01))))
(assert (= ($Snap.first $t@312@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@309@01 $Ref.null)))
(assert (=
  ($Snap.second $t@312@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@312@01))
    ($Snap.second ($Snap.second $t@312@01)))))
(assert (= ($Snap.first ($Snap.second $t@312@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@310@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@313@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__start ----------
(declare-const diz@314@01 $Ref)
(declare-const current_thread_id@315@01 Int)
(declare-const sys__thrown@316@01 $Ref)
(declare-const diz@317@01 $Ref)
(declare-const current_thread_id@318@01 Int)
(declare-const sys__thrown@319@01 $Ref)
(push) ; 1
(declare-const $t@320@01 $Snap)
(assert (= $t@320@01 ($Snap.combine ($Snap.first $t@320@01) ($Snap.second $t@320@01))))
(assert (= ($Snap.first $t@320@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@317@01 $Ref.null)))
(assert (=
  ($Snap.second $t@320@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@320@01))
    ($Snap.second ($Snap.second $t@320@01)))))
(assert (= ($Snap.first ($Snap.second $t@320@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@318@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@321@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__join ----------
(declare-const diz@322@01 $Ref)
(declare-const current_thread_id@323@01 Int)
(declare-const p@324@01 $Perm)
(declare-const sys__thrown@325@01 $Ref)
(declare-const diz@326@01 $Ref)
(declare-const current_thread_id@327@01 Int)
(declare-const p@328@01 $Perm)
(declare-const sys__thrown@329@01 $Ref)
(push) ; 1
(declare-const $t@330@01 $Snap)
(assert (= $t@330@01 ($Snap.combine ($Snap.first $t@330@01) ($Snap.second $t@330@01))))
(assert (= ($Snap.first $t@330@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@326@01 $Ref.null)))
(assert (=
  ($Snap.second $t@330@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@330@01))
    ($Snap.second ($Snap.second $t@330@01)))))
(assert (= ($Snap.first ($Snap.second $t@330@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@327@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@331@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_joinToken_at_Thread ----------
(declare-const diz@332@01 $Ref)
(declare-const current_thread_id@333@01 Int)
(declare-const p@334@01 $Perm)
(declare-const sys__thrown@335@01 $Ref)
(declare-const diz@336@01 $Ref)
(declare-const current_thread_id@337@01 Int)
(declare-const p@338@01 $Perm)
(declare-const sys__thrown@339@01 $Ref)
(push) ; 1
(declare-const $t@340@01 $Snap)
(assert (= $t@340@01 ($Snap.combine ($Snap.first $t@340@01) ($Snap.second $t@340@01))))
(assert (= ($Snap.first $t@340@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@336@01 $Ref.null)))
(assert (=
  ($Snap.second $t@340@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@340@01))
    ($Snap.second ($Snap.second $t@340@01)))))
(assert (= ($Snap.first ($Snap.second $t@340@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@337@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@340@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@340@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@340@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@341@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_preFork_at_Thread ----------
(declare-const diz@342@01 $Ref)
(declare-const current_thread_id@343@01 Int)
(declare-const p@344@01 $Perm)
(declare-const sys__thrown@345@01 $Ref)
(declare-const diz@346@01 $Ref)
(declare-const current_thread_id@347@01 Int)
(declare-const p@348@01 $Perm)
(declare-const sys__thrown@349@01 $Ref)
(push) ; 1
(declare-const $t@350@01 $Snap)
(assert (= $t@350@01 ($Snap.combine ($Snap.first $t@350@01) ($Snap.second $t@350@01))))
(assert (= ($Snap.first $t@350@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@346@01 $Ref.null)))
(assert (=
  ($Snap.second $t@350@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@350@01))
    ($Snap.second ($Snap.second $t@350@01)))))
(assert (= ($Snap.first ($Snap.second $t@350@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@347@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@350@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@350@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@350@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@351@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_postJoin_at_Thread ----------
(declare-const diz@352@01 $Ref)
(declare-const current_thread_id@353@01 Int)
(declare-const p@354@01 $Perm)
(declare-const sys__thrown@355@01 $Ref)
(declare-const diz@356@01 $Ref)
(declare-const current_thread_id@357@01 Int)
(declare-const p@358@01 $Perm)
(declare-const sys__thrown@359@01 $Ref)
(push) ; 1
(declare-const $t@360@01 $Snap)
(assert (= $t@360@01 ($Snap.combine ($Snap.first $t@360@01) ($Snap.second $t@360@01))))
(assert (= ($Snap.first $t@360@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@356@01 $Ref.null)))
(assert (=
  ($Snap.second $t@360@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@360@01))
    ($Snap.second ($Snap.second $t@360@01)))))
(assert (= ($Snap.first ($Snap.second $t@360@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@357@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@360@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@360@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@360@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@361@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__Thread ----------
(declare-const current_thread_id@362@01 Int)
(declare-const sys__thrown@363@01 $Ref)
(declare-const sys__result@364@01 $Ref)
(declare-const current_thread_id@365@01 Int)
(declare-const sys__thrown@366@01 $Ref)
(declare-const sys__result@367@01 $Ref)
(push) ; 1
(declare-const $t@368@01 $Snap)
(assert (= $t@368@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@365@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@369@01 $Snap)
(assert (= $t@369@01 ($Snap.combine ($Snap.first $t@369@01) ($Snap.second $t@369@01))))
(assert (= ($Snap.first $t@369@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@367@01 $Ref.null)))
(assert (=
  ($Snap.second $t@369@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@369@01))
    ($Snap.second ($Snap.second $t@369@01)))))
(assert (= ($Snap.first ($Snap.second $t@369@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Thread()
; [eval] type_of(sys__result)
; [eval] class_Thread()
(assert (= (type_of<TYPE> sys__result@367@01) (as class_Thread<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__Thread_at_Thread ----------
(declare-const current_thread_id@370@01 Int)
(declare-const sys__thrown@371@01 $Ref)
(declare-const sys__result@372@01 $Ref)
(declare-const current_thread_id@373@01 Int)
(declare-const sys__thrown@374@01 $Ref)
(declare-const sys__result@375@01 $Ref)
(push) ; 1
(declare-const $t@376@01 $Snap)
(assert (= $t@376@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@373@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@377@01 $Snap)
(assert (= $t@377@01 ($Snap.combine ($Snap.first $t@377@01) ($Snap.second $t@377@01))))
(assert (= ($Snap.first $t@377@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@375@01 $Ref.null)))
(assert (= ($Snap.second $t@377@01) $Snap.unit))
; [eval] type_of(sys__result) == class_Thread()
; [eval] type_of(sys__result)
; [eval] class_Thread()
(assert (= (type_of<TYPE> sys__result@375@01) (as class_Thread<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__run_at_Thread ----------
(declare-const diz@378@01 $Ref)
(declare-const current_thread_id@379@01 Int)
(declare-const sys__thrown@380@01 $Ref)
(declare-const diz@381@01 $Ref)
(declare-const current_thread_id@382@01 Int)
(declare-const sys__thrown@383@01 $Ref)
(push) ; 1
(declare-const $t@384@01 $Snap)
(assert (= $t@384@01 ($Snap.combine ($Snap.first $t@384@01) ($Snap.second $t@384@01))))
(assert (= ($Snap.first $t@384@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@381@01 $Ref.null)))
(assert (=
  ($Snap.second $t@384@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@384@01))
    ($Snap.second ($Snap.second $t@384@01)))))
(assert (= ($Snap.first ($Snap.second $t@384@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@382@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@385@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__start_at_Thread ----------
(declare-const diz@386@01 $Ref)
(declare-const current_thread_id@387@01 Int)
(declare-const sys__thrown@388@01 $Ref)
(declare-const diz@389@01 $Ref)
(declare-const current_thread_id@390@01 Int)
(declare-const sys__thrown@391@01 $Ref)
(push) ; 1
(declare-const $t@392@01 $Snap)
(assert (= $t@392@01 ($Snap.combine ($Snap.first $t@392@01) ($Snap.second $t@392@01))))
(assert (= ($Snap.first $t@392@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@389@01 $Ref.null)))
(assert (=
  ($Snap.second $t@392@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@392@01))
    ($Snap.second ($Snap.second $t@392@01)))))
(assert (= ($Snap.first ($Snap.second $t@392@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@390@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@393@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__join_at_Thread ----------
(declare-const diz@394@01 $Ref)
(declare-const current_thread_id@395@01 Int)
(declare-const p@396@01 $Perm)
(declare-const sys__thrown@397@01 $Ref)
(declare-const diz@398@01 $Ref)
(declare-const current_thread_id@399@01 Int)
(declare-const p@400@01 $Perm)
(declare-const sys__thrown@401@01 $Ref)
(push) ; 1
(declare-const $t@402@01 $Snap)
(assert (= $t@402@01 ($Snap.combine ($Snap.first $t@402@01) ($Snap.second $t@402@01))))
(assert (= ($Snap.first $t@402@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@398@01 $Ref.null)))
(assert (=
  ($Snap.second $t@402@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@402@01))
    ($Snap.second ($Snap.second $t@402@01)))))
(assert (= ($Snap.first ($Snap.second $t@402@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@399@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@403@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_preFork_at_Worker ----------
(declare-const diz@404@01 $Ref)
(declare-const current_thread_id@405@01 Int)
(declare-const p@406@01 $Perm)
(declare-const sys__thrown@407@01 $Ref)
(declare-const diz@408@01 $Ref)
(declare-const current_thread_id@409@01 Int)
(declare-const p@410@01 $Perm)
(declare-const sys__thrown@411@01 $Ref)
(push) ; 1
(declare-const $t@412@01 $Snap)
(assert (= $t@412@01 ($Snap.combine ($Snap.first $t@412@01) ($Snap.second $t@412@01))))
(assert (= ($Snap.first $t@412@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@408@01 $Ref.null)))
(assert (=
  ($Snap.second $t@412@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@412@01))
    ($Snap.second ($Snap.second $t@412@01)))))
(assert (= ($Snap.first ($Snap.second $t@412@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@409@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@412@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@412@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@412@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@413@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_postJoin_at_Worker ----------
(declare-const diz@414@01 $Ref)
(declare-const current_thread_id@415@01 Int)
(declare-const p@416@01 $Perm)
(declare-const sys__thrown@417@01 $Ref)
(declare-const diz@418@01 $Ref)
(declare-const current_thread_id@419@01 Int)
(declare-const p@420@01 $Perm)
(declare-const sys__thrown@421@01 $Ref)
(push) ; 1
(declare-const $t@422@01 $Snap)
(assert (= $t@422@01 ($Snap.combine ($Snap.first $t@422@01) ($Snap.second $t@422@01))))
(assert (= ($Snap.first $t@422@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@418@01 $Ref.null)))
(assert (=
  ($Snap.second $t@422@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@422@01))
    ($Snap.second ($Snap.second $t@422@01)))))
(assert (= ($Snap.first ($Snap.second $t@422@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@419@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@422@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@422@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@422@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@423@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__Worker ----------
(declare-const current_thread_id@424@01 Int)
(declare-const s@425@01 $Ref)
(declare-const l@426@01 $Ref)
(declare-const sys__thrown@427@01 $Ref)
(declare-const sys__result@428@01 $Ref)
(declare-const current_thread_id@429@01 Int)
(declare-const s@430@01 $Ref)
(declare-const l@431@01 $Ref)
(declare-const sys__thrown@432@01 $Ref)
(declare-const sys__result@433@01 $Ref)
(push) ; 1
(declare-const $t@434@01 $Snap)
(assert (= $t@434@01 ($Snap.combine ($Snap.first $t@434@01) ($Snap.second $t@434@01))))
(assert (= ($Snap.first $t@434@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@429@01 0))
(assert (=
  ($Snap.second $t@434@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@434@01))
    ($Snap.second ($Snap.second $t@434@01)))))
(declare-const $k@435@01 $Perm)
(assert ($Perm.isReadVar $k@435@01))
(assert (<= $Perm.No $k@435@01))
(assert (<= $k@435@01 $Perm.Write))
(assert (=> (< $Perm.No $k@435@01) (not (= l@431@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@434@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@434@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@434@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@434@01))) $Snap.unit))
; [eval] l.SubjectLock__subject == s
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@435@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@434@01))) s@430@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@434@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@434@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@434@01)))))))
; [eval] p_empty()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@436@01 $Snap)
(assert (= $t@436@01 ($Snap.combine ($Snap.first $t@436@01) ($Snap.second $t@436@01))))
(assert (= ($Snap.first $t@436@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@433@01 $Ref.null)))
(assert (=
  ($Snap.second $t@436@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@436@01))
    ($Snap.second ($Snap.second $t@436@01)))))
(assert (= ($Snap.first ($Snap.second $t@436@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Worker()
; [eval] type_of(sys__result)
; [eval] class_Worker()
(assert (= (type_of<TYPE> sys__result@433@01) (as class_Worker<TYPE>  TYPE)))
(assert (=
  ($Snap.second ($Snap.second $t@436@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@436@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@436@01))))))
(declare-const $k@437@01 $Perm)
(assert ($Perm.isReadVar $k@437@01))
(assert (<= $Perm.No $k@437@01))
(assert (<= $k@437@01 $Perm.Write))
(assert (=> (< $Perm.No $k@437@01) (not (= sys__result@433@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@436@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@436@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@436@01))))
  $Snap.unit))
; [eval] sys__result.Worker__l == l
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@437@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@436@01))))
  l@431@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01))))))))
(declare-const $k@438@01 $Perm)
(assert ($Perm.isReadVar $k@438@01))
(assert (<= $Perm.No $k@438@01))
(assert (<= $k@438@01 $Perm.Write))
(assert (=> (< $Perm.No $k@438@01) (not (= sys__result@433@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01))))))
  $Snap.unit))
; [eval] sys__result.Worker__s == s
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@438@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01))))))
  s@430@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@436@01))))))))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__Worker_at_Worker ----------
(declare-const current_thread_id@439@01 Int)
(declare-const s@440@01 $Ref)
(declare-const l@441@01 $Ref)
(declare-const sys__thrown@442@01 $Ref)
(declare-const sys__result@443@01 $Ref)
(declare-const current_thread_id@444@01 Int)
(declare-const s@445@01 $Ref)
(declare-const l@446@01 $Ref)
(declare-const sys__thrown@447@01 $Ref)
(declare-const sys__result@448@01 $Ref)
(push) ; 1
(declare-const $t@449@01 $Snap)
(assert (= $t@449@01 ($Snap.combine ($Snap.first $t@449@01) ($Snap.second $t@449@01))))
(assert (= ($Snap.first $t@449@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@444@01 0))
(assert (=
  ($Snap.second $t@449@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@449@01))
    ($Snap.second ($Snap.second $t@449@01)))))
(declare-const $k@450@01 $Perm)
(assert ($Perm.isReadVar $k@450@01))
(assert (<= $Perm.No $k@450@01))
(assert (<= $k@450@01 $Perm.Write))
(assert (=> (< $Perm.No $k@450@01) (not (= l@446@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@449@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@449@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@449@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@449@01))) $Snap.unit))
; [eval] l.SubjectLock__subject == s
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@450@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@449@01))) s@445@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@449@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@449@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@449@01)))))))
; [eval] p_empty()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@451@01 $Snap)
(assert (= $t@451@01 ($Snap.combine ($Snap.first $t@451@01) ($Snap.second $t@451@01))))
(assert (= ($Snap.first $t@451@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@448@01 $Ref.null)))
(assert (=
  ($Snap.second $t@451@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@451@01))
    ($Snap.second ($Snap.second $t@451@01)))))
(assert (= ($Snap.first ($Snap.second $t@451@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Worker()
; [eval] type_of(sys__result)
; [eval] class_Worker()
(assert (= (type_of<TYPE> sys__result@448@01) (as class_Worker<TYPE>  TYPE)))
(assert (=
  ($Snap.second ($Snap.second $t@451@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@451@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@451@01))))))
(declare-const $k@452@01 $Perm)
(assert ($Perm.isReadVar $k@452@01))
(assert (<= $Perm.No $k@452@01))
(assert (<= $k@452@01 $Perm.Write))
(assert (=> (< $Perm.No $k@452@01) (not (= sys__result@448@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@451@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@451@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@451@01))))
  $Snap.unit))
; [eval] sys__result.Worker__l == l
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@452@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@451@01))))
  l@446@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01))))))))
(declare-const $k@453@01 $Perm)
(assert ($Perm.isReadVar $k@453@01))
(assert (<= $Perm.No $k@453@01))
(assert (<= $k@453@01 $Perm.Write))
(assert (=> (< $Perm.No $k@453@01) (not (= sys__result@448@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01))))))
  $Snap.unit))
; [eval] sys__result.Worker__s == s
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@453@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@451@01))))))
  s@445@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@454@01 $Ref)
; [exec]
; var __flatten_38: Ref
(declare-const __flatten_38@455@01 $Ref)
; [exec]
; var __flatten_39: Ref
(declare-const __flatten_39@456@01 $Ref)
; [exec]
; var __flatten_106: Ref
(declare-const __flatten_106@457@01 $Ref)
; [exec]
; var __flatten_107: Ref
(declare-const __flatten_107@458@01 $Ref)
; [exec]
; diz := new(Worker__l, Worker__s)
(declare-const diz@459@01 $Ref)
(assert (not (= diz@459@01 $Ref.null)))
(declare-const Worker__l@460@01 $Ref)
(declare-const Worker__s@461@01 $Ref)
(assert (not (= diz@459@01 l@446@01)))
(assert (not (= diz@459@01 sys__result@448@01)))
(assert (not (= diz@459@01 __flatten_39@456@01)))
(assert (not (= diz@459@01 s@445@01)))
(assert (not (= diz@459@01 __flatten_106@457@01)))
(assert (not (= diz@459@01 diz@454@01)))
(assert (not (= diz@459@01 sys__thrown@447@01)))
(assert (not (= diz@459@01 __flatten_107@458@01)))
(assert (not
  (=
    diz@459@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@449@01))))))
(assert (not (= diz@459@01 __flatten_38@455@01)))
; [exec]
; inhale type_of(diz) == class_Worker()
(declare-const $t@462@01 $Snap)
(assert (= $t@462@01 $Snap.unit))
; [eval] type_of(diz) == class_Worker()
; [eval] type_of(diz)
; [eval] class_Worker()
(assert (= (type_of<TYPE> diz@459@01) (as class_Worker<TYPE>  TYPE)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __flatten_38 := l
; [exec]
; __flatten_106 := __flatten_38
; [exec]
; diz.Worker__l := __flatten_106
; [exec]
; __flatten_39 := s
; [exec]
; __flatten_107 := __flatten_39
; [exec]
; diz.Worker__s := __flatten_107
; [exec]
; fold acc(Worker__preFork_at_Thread(diz, write), write)
(assert (Worker__preFork_at_Thread%trigger $Snap.unit diz@459@01 $Perm.Write))
; [exec]
; fold acc(Worker__preFork_at_Worker(diz, write), write)
; [eval] p == write
(declare-const $k@463@01 $Perm)
(assert ($Perm.isReadVar $k@463@01))
(assert (< $k@463@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@463@01)))
(assert (<= (- $Perm.Write $k@463@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@463@01)) (not (= diz@459@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@463@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@464@01 $Perm)
(assert ($Perm.isReadVar $k@464@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@450@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@464@01 $k@450@01))
(assert (<= $Perm.No (- $k@450@01 $k@464@01)))
(assert (<= (- $k@450@01 $k@464@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@450@01 $k@464@01)) (not (= l@446@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@464@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@465@01 $Perm)
(assert ($Perm.isReadVar $k@465@01))
(assert (< $k@465@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@465@01)))
(assert (<= (- $Perm.Write $k@465@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@465@01)) (not (= diz@459@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@465@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__l.SubjectLock__subject == diz.Worker__s
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@450@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] p_empty()
(assert (Worker__preFork_at_Worker%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@446@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@449@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap s@445@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@449@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@449@01))))))))))) diz@459@01 $Perm.Write))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (type_of(sys__result) == class_Worker() &&
;   (acc(sys__result.Worker__l, wildcard) &&
;   (sys__result.Worker__l == l &&
;   (acc(sys__result.Worker__s, wildcard) &&
;   (sys__result.Worker__s == s &&
;   acc(Worker__preFork_at_Worker(sys__result, write), write))))))
; [eval] sys__result != null
; [eval] type_of(sys__result) == class_Worker()
; [eval] type_of(sys__result)
; [eval] class_Worker()
(declare-const $k@466@01 $Perm)
(assert ($Perm.isReadVar $k@466@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (- $Perm.Write $k@463@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@466@01 (- $Perm.Write $k@463@01)))
(assert (<= $Perm.No (- (- $Perm.Write $k@463@01) $k@466@01)))
(assert (<= (- (- $Perm.Write $k@463@01) $k@466@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- (- $Perm.Write $k@463@01) $k@466@01))
  (not (= diz@459@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@466@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sys__result.Worker__l == l
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write $k@463@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@467@01 $Perm)
(assert ($Perm.isReadVar $k@467@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (- $Perm.Write $k@465@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@467@01 (- $Perm.Write $k@465@01)))
(assert (<= $Perm.No (- (- $Perm.Write $k@465@01) $k@467@01)))
(assert (<= (- (- $Perm.Write $k@465@01) $k@467@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- (- $Perm.Write $k@465@01) $k@467@01))
  (not (= diz@459@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@467@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sys__result.Worker__s == s
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write $k@465@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__run_at_Worker ----------
(declare-const diz@468@01 $Ref)
(declare-const current_thread_id@469@01 Int)
(declare-const sys__thrown@470@01 $Ref)
(declare-const diz@471@01 $Ref)
(declare-const current_thread_id@472@01 Int)
(declare-const sys__thrown@473@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@474@01 $Snap)
(assert (= $t@474@01 ($Snap.combine ($Snap.first $t@474@01) ($Snap.second $t@474@01))))
(assert (= ($Snap.first $t@474@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@471@01 $Ref.null)))
(assert (=
  ($Snap.second $t@474@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@474@01))
    ($Snap.second ($Snap.second $t@474@01)))))
(assert (= ($Snap.first ($Snap.second $t@474@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@472@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@475@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; var if_any_bool: Bool
(declare-const if_any_bool@476@01 Bool)
; [exec]
; var __flatten_43: Ref
(declare-const __flatten_43@477@01 $Ref)
; [exec]
; unfold acc(Worker__preFork_at_Worker(diz, write), write)
(assert (=
  ($Snap.second ($Snap.second $t@474@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@474@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@474@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@474@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@474@01))))
  $Snap.unit))
; [eval] p == write
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))
(declare-const $k@478@01 $Perm)
(assert ($Perm.isReadVar $k@478@01))
(assert (<= $Perm.No $k@478@01))
(assert (<= $k@478@01 $Perm.Write))
(assert (=> (< $Perm.No $k@478@01) (not (= diz@471@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@478@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@479@01 $Perm)
(assert ($Perm.isReadVar $k@479@01))
(assert (<= $Perm.No $k@479@01))
(assert (<= $k@479@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@479@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))))
(declare-const $k@480@01 $Perm)
(assert ($Perm.isReadVar $k@480@01))
(assert (<= $Perm.No $k@480@01))
(assert (<= $k@480@01 $Perm.Write))
(assert (=> (< $Perm.No $k@480@01) (not (= diz@471@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))
  $Snap.unit))
; [eval] diz.Worker__l.SubjectLock__subject == diz.Worker__s
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@478@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@479@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@480@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@478@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@480@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] p_empty()
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Worker__preFork_at_Worker%trigger ($Snap.second ($Snap.second $t@474@01)) diz@471@01 $Perm.Write))
; [exec]
; sys__thrown := SubjectLock__lock(diz.Worker__l, current_thread_id, 0, 1 / 2)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@478@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))
    $Ref.null)))
; [eval] current_thread_id >= 0
; [eval] count >= 0
; [eval] p >= none
; [eval] count > 0
; [then-branch: 6 | False | dead]
; [else-branch: 6 | True | live]
(push) ; 3
; [else-branch: 6 | True]
(declare-const sys__thrown@481@01 $Ref)
(declare-const $t@482@01 $Snap)
(assert (= $t@482@01 ($Snap.combine ($Snap.first $t@482@01) ($Snap.second $t@482@01))))
; [eval] count + 1
; [eval] count == 0
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | True | live]
; [else-branch: 7 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | True]
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(SubjectLock__inv(diz.Worker__l), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@478@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@482@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@482@01))
    ($Snap.second ($Snap.second $t@482@01)))))
(declare-const $k@483@01 $Perm)
(assert ($Perm.isReadVar $k@483@01))
(declare-const $t@484@01 $Ref)
(assert (and
  (=>
    (< $Perm.No $k@479@01)
    (=
      $t@484@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))))
  (=>
    (< $Perm.No $k@483@01)
    (=
      $t@484@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@482@01)))))))
(assert (<= $Perm.No (+ $k@479@01 $k@483@01)))
(assert (<= (+ $k@479@01 $k@483@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ $k@479@01 $k@483@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ $k@479@01 $k@483@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (SubjectLock__inv%trigger ($Snap.second $t@482@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))
; [exec]
; unfold acc(History__inv(diz.Worker__l.SubjectLock__subject), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@478@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ $k@479@01 $k@483@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@482@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@482@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@482@01))))))
(assert (not (= $t@484@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@482@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@482@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@482@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@482@01))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@482@01)))))
  1))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (History__inv%trigger ($Snap.second ($Snap.second $t@482@01)) $t@484@01))
; [exec]
; assert acc(History__hist_idle(diz.Worker__s, 1 / 2, p_empty()), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@480@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] p_empty()
; [exec]
; sys__thrown := History__incr_begin(diz.Worker__s, current_thread_id, 1 / 2,
;   p_empty())
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@480@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] p_empty()
; [eval] diz != null
(set-option :timeout 0)
(push) ; 5
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))
    $Ref.null)))
; [eval] current_thread_id >= 0
; [eval] frac != none
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  $t@484@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  $t@484@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] diz.History__x_hist_mode == 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  $t@484@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const sys__thrown@485@01 $Ref)
(declare-const $t@486@01 $Snap)
(assert (= $t@486@01 ($Snap.combine ($Snap.first $t@486@01) ($Snap.second $t@486@01))))
(assert (= ($Snap.first $t@486@01) $Snap.unit))
; [eval] frac != none
(assert (=
  ($Snap.second $t@486@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@486@01))
    ($Snap.second ($Snap.second $t@486@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@486@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@486@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@486@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@486@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@486@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01)))))
  $Snap.unit))
; [eval] diz.History__x_hist_mode == 2
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@486@01)))))
  2))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == old(diz.History__x_hist_value)
; [eval] old(diz.History__x_hist_value)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  $t@484@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@486@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@482@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01)))))))
  $Snap.unit))
; [eval] diz.History__x_hist_value == diz.History__x_hist_act
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@486@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@486@01))))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_43 := diz.Worker__s
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@480@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_43@487@01 $Ref)
(assert (=
  __flatten_43@487@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))))
; [exec]
; sys__thrown := History__hist_set_x(diz.Worker__s, current_thread_id, __flatten_43.History__x_hist_value +
;   1)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@480@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] __flatten_43.History__x_hist_value + 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@474@01))))))))
  __flatten_43@487@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] diz != null
; [eval] current_thread_id >= 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] diz.History__x_hist_mode == 2
(declare-const sys__thrown@488@01 $Ref)
(declare-const $t@489@01 $Snap)
(assert (= $t@489@01 ($Snap.combine ($Snap.first $t@489@01) ($Snap.second $t@489@01))))
; ---------- Worker__if_any_random ----------
(declare-const diz@490@01 $Ref)
(declare-const current_thread_id@491@01 Int)
(declare-const sys__thrown@492@01 $Ref)
(declare-const sys__result@493@01 Bool)
(declare-const diz@494@01 $Ref)
(declare-const current_thread_id@495@01 Int)
(declare-const sys__thrown@496@01 $Ref)
(declare-const sys__result@497@01 Bool)
(set-option :timeout 0)
(push) ; 5
(declare-const $t@498@01 $Snap)
(assert (= $t@498@01 ($Snap.combine ($Snap.first $t@498@01) ($Snap.second $t@498@01))))
(assert (= ($Snap.first $t@498@01) $Snap.unit))
