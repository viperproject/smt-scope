(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:48
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testHistoryApplication.vpr
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
; ---------- History__hist_do_incr ----------
(declare-const diz@6@00 $Ref)
(declare-const frac@7@00 $Perm)
(declare-const proc@8@00 Process)
; ---------- History__hist_idle ----------
(declare-const diz@9@00 $Ref)
(declare-const frac@10@00 $Perm)
(declare-const proc@11@00 Process)
