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
; ---------- FUNCTION History__hist_get_x----------
(declare-fun diz@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@0@00 $Ref.null)))
(declare-const $k@4@00 $Perm)
(assert ($Perm.isReadVar $k@4@00))
(assert (<= $Perm.No $k@4@00))
(assert (<= $k@4@00 $Perm.Write))
(assert (=> (< $Perm.No $k@4@00) (not (= diz@0@00 $Ref.null))))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@4@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= diz@0@00 $Ref.null)))
(assert (<= $Perm.No $k@4@00))
(assert (<= $k@4@00 $Perm.Write))
(assert (=> (< $Perm.No $k@4@00) (not (= diz@0@00 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@1@00 ($SortWrappers.$SnapToInt ($Snap.second s@$))))
(pop) ; 1
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
; ---------- FUNCTION History__free_get_x----------
(declare-fun diz@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@2@00 $Ref.null)))
(declare-const $k@5@00 $Perm)
(assert ($Perm.isReadVar $k@5@00))
(assert (<= $Perm.No $k@5@00))
(assert (<= $k@5@00 $Perm.Write))
(assert (=> (< $Perm.No $k@5@00) (not (= diz@2@00 $Ref.null))))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@5@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= diz@2@00 $Ref.null)))
(assert (<= $Perm.No $k@5@00))
(assert (<= $k@5@00 $Perm.Write))
(assert (=> (< $Perm.No $k@5@00) (not (= diz@2@00 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 ($SortWrappers.$SnapToInt ($Snap.second s@$))))
(pop) ; 1
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
; ---------- History__inv ----------
(declare-const diz@6@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 ($Snap.combine ($Snap.first $t@7@00) ($Snap.second $t@7@00))))
(assert (not (= diz@6@00 $Ref.null)))
(assert (=
  ($Snap.second $t@7@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@00))
    ($Snap.second ($Snap.second $t@7@00)))))
(assert (= ($Snap.second ($Snap.second $t@7@00)) $Snap.unit))
; [eval] diz.History__x_hist_mode == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@7@00))) 1))
(pop) ; 1
; ---------- History__hist_do_incr ----------
(declare-const diz@8@00 $Ref)
(declare-const frac@9@00 $Perm)
(declare-const proc@10@00 Process)
; ---------- History__hist_idle ----------
(declare-const diz@11@00 $Ref)
(declare-const frac@12@00 $Perm)
(declare-const proc@13@00 Process)
; ---------- SubjectLock__inv ----------
(declare-const diz@14@00 $Ref)
(push) ; 1
(declare-const $t@15@00 $Snap)
(assert (= $t@15@00 ($Snap.combine ($Snap.first $t@15@00) ($Snap.second $t@15@00))))
(declare-const $k@16@00 $Perm)
(assert ($Perm.isReadVar $k@16@00))
(assert (<= $Perm.No $k@16@00))
(assert (<= $k@16@00 $Perm.Write))
(assert (=> (< $Perm.No $k@16@00) (not (= diz@14@00 $Ref.null))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- SubjectLock__valid ----------
(declare-const diz@17@00 $Ref)
; ---------- SubjectLock__locked ----------
(declare-const diz@18@00 $Ref)
(declare-const p@19@00 $Perm)
(declare-const count@20@00 Int)
; ---------- Thread__is_a_Thread ----------
(declare-const diz@21@00 $Ref)
; ---------- Thread__instance_of_Thread ----------
(declare-const diz@22@00 $Ref)
; ---------- Thread__joinToken ----------
(declare-const diz@23@00 $Ref)
(declare-const p@24@00 $Perm)
; ---------- Thread__preFork ----------
(declare-const diz@25@00 $Ref)
(declare-const p@26@00 $Perm)
; ---------- Thread__postJoin ----------
(declare-const diz@27@00 $Ref)
(declare-const p@28@00 $Perm)
; ---------- Thread__joinToken_at_Thread ----------
(declare-const diz@29@00 $Ref)
(declare-const p@30@00 $Perm)
; ---------- Thread__preFork_at_Thread ----------
(declare-const diz@31@00 $Ref)
(declare-const p@32@00 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@33@00 $Snap)
(assert (= $t@33@00 $Snap.unit))
(pop) ; 1
; ---------- Thread__postJoin_at_Thread ----------
(declare-const diz@34@00 $Ref)
(declare-const p@35@00 $Perm)
(push) ; 1
(declare-const $t@36@00 $Snap)
(assert (= $t@36@00 $Snap.unit))
(pop) ; 1
; ---------- Worker__is_a_Worker ----------
(declare-const diz@37@00 $Ref)
; ---------- Worker__instance_of_Worker ----------
(declare-const diz@38@00 $Ref)
; ---------- Worker__is_a_Thread ----------
(declare-const diz@39@00 $Ref)
; ---------- Worker__instance_of_Thread ----------
(declare-const diz@40@00 $Ref)
; ---------- Worker__joinToken ----------
(declare-const diz@41@00 $Ref)
(declare-const p@42@00 $Perm)
; ---------- Worker__joinToken_at_Worker ----------
(declare-const diz@43@00 $Ref)
(declare-const p@44@00 $Perm)
(push) ; 1
(declare-const $t@45@00 $Snap)
(pop) ; 1
; ---------- Worker__preFork ----------
(declare-const diz@46@00 $Ref)
(declare-const p@47@00 $Perm)
; ---------- Worker__postJoin ----------
(declare-const diz@48@00 $Ref)
(declare-const p@49@00 $Perm)
; ---------- Worker__joinToken_at_Thread ----------
(declare-const diz@50@00 $Ref)
(declare-const p@51@00 $Perm)
; ---------- Worker__preFork_at_Thread ----------
(declare-const diz@52@00 $Ref)
(declare-const p@53@00 $Perm)
(push) ; 1
(declare-const $t@54@00 $Snap)
(assert (= $t@54@00 $Snap.unit))
(pop) ; 1
; ---------- Worker__postJoin_at_Thread ----------
(declare-const diz@55@00 $Ref)
(declare-const p@56@00 $Perm)
(push) ; 1
(declare-const $t@57@00 $Snap)
(assert (= $t@57@00 $Snap.unit))
(pop) ; 1
; ---------- Worker__preFork_at_Worker ----------
(declare-const diz@58@00 $Ref)
(declare-const p@59@00 $Perm)
(push) ; 1
(declare-const $t@60@00 $Snap)
(assert (= $t@60@00 ($Snap.combine ($Snap.first $t@60@00) ($Snap.second $t@60@00))))
(assert (=
  ($Snap.second $t@60@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@60@00))
    ($Snap.second ($Snap.second $t@60@00)))))
(assert (= ($Snap.first ($Snap.second $t@60@00)) $Snap.unit))
; [eval] p == write
(assert (= p@59@00 $Perm.Write))
(assert (=
  ($Snap.second ($Snap.second $t@60@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@60@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@60@00))))))
(declare-const $k@61@00 $Perm)
(assert ($Perm.isReadVar $k@61@00))
(assert (<= $Perm.No $k@61@00))
(assert (<= $k@61@00 $Perm.Write))
(assert (=> (< $Perm.No $k@61@00) (not (= diz@58@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@60@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@60@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@61@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@62@00 $Perm)
(assert ($Perm.isReadVar $k@62@00))
(assert (<= $Perm.No $k@62@00))
(assert (<= $k@62@00 $Perm.Write))
(assert (=>
  (< $Perm.No $k@62@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@60@00))))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00))))))))
(declare-const $k@63@00 $Perm)
(assert ($Perm.isReadVar $k@63@00))
(assert (<= $Perm.No $k@63@00))
(assert (<= $k@63@00 $Perm.Write))
(assert (=> (< $Perm.No $k@63@00) (not (= diz@58@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00))))))
  $Snap.unit))
; [eval] diz.Worker__l.SubjectLock__subject == diz.Worker__s
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@61@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@62@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@60@00)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@60@00))))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@61@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] p_empty()
(pop) ; 1
; ---------- Worker__postJoin_at_Worker ----------
(declare-const diz@64@00 $Ref)
(declare-const p@65@00 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@66@00 $Snap)
(assert (= $t@66@00 ($Snap.combine ($Snap.first $t@66@00) ($Snap.second $t@66@00))))
(assert (=
  ($Snap.second $t@66@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@66@00))
    ($Snap.second ($Snap.second $t@66@00)))))
(assert (= ($Snap.first ($Snap.second $t@66@00)) $Snap.unit))
; [eval] p == write
(assert (= p@65@00 $Perm.Write))
(assert (=
  ($Snap.second ($Snap.second $t@66@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@66@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@66@00))))))
(declare-const $k@67@00 $Perm)
(assert ($Perm.isReadVar $k@67@00))
(assert (<= $Perm.No $k@67@00))
(assert (<= $k@67@00 $Perm.Write))
(assert (=> (< $Perm.No $k@67@00) (not (= diz@64@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@66@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@66@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@67@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@68@00 $Perm)
(assert ($Perm.isReadVar $k@68@00))
(assert (<= $Perm.No $k@68@00))
(assert (<= $k@68@00 $Perm.Write))
(assert (=>
  (< $Perm.No $k@68@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@66@00))))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00))))))))
(declare-const $k@69@00 $Perm)
(assert ($Perm.isReadVar $k@69@00))
(assert (<= $Perm.No $k@69@00))
(assert (<= $k@69@00 $Perm.Write))
(assert (=> (< $Perm.No $k@69@00) (not (= diz@64@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00))))))
  $Snap.unit))
; [eval] diz.Worker__l.SubjectLock__subject == diz.Worker__s
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@67@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@68@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@69@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@66@00)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@00))))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@67@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@69@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] p_single(1)
(pop) ; 1
