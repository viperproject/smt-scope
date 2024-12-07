(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/func3.vpr
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
(declare-fun f4 ($Snap $Ref) $Ref)
(declare-fun f4%limited ($Snap $Ref) $Ref)
(declare-fun f4%stateless ($Ref) Bool)
(declare-fun f4%precondition ($Snap $Ref) Bool)
(declare-fun f3 ($Snap $Ref) Int)
(declare-fun f3%limited ($Snap $Ref) Int)
(declare-fun f3%stateless ($Ref) Bool)
(declare-fun f3%precondition ($Snap $Ref) Bool)
(declare-fun f2 ($Snap $Ref) Int)
(declare-fun f2%limited ($Snap $Ref) Int)
(declare-fun f2%stateless ($Ref) Bool)
(declare-fun f2%precondition ($Snap $Ref) Bool)
(declare-fun f1 ($Snap $Ref) Int)
(declare-fun f1%limited ($Snap $Ref) Int)
(declare-fun f1%stateless ($Ref) Bool)
(declare-fun f1%precondition ($Snap $Ref) Bool)
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
; ---------- FUNCTION f4----------
(declare-fun r@0@00 () $Ref)
(declare-fun result@1@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $k@8@00 $Perm)
(assert ($Perm.isReadVar $k@8@00))
(assert (<= $Perm.No $k@8@00))
(assert (<= $k@8@00 $Perm.Write))
(assert (=> (< $Perm.No $k@8@00) (not (= r@0@00 $Ref.null))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (f4%limited s@$ r@0@00) (f4 s@$ r@0@00))
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (f4%stateless r@0@00)
  :pattern ((f4%limited s@$ r@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@8@00))
(assert (<= $Perm.No $k@8@00))
(assert (<= $k@8@00 $Perm.Write))
(assert (=> (< $Perm.No $k@8@00) (not (= r@0@00 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@1@00 ($SortWrappers.$SnapTo$Ref s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@8@00)
    (=>
      (f4%precondition s@$ r@0@00)
      (= (f4 s@$ r@0@00) ($SortWrappers.$SnapTo$Ref s@$))))
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  true
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION f3----------
(declare-fun r@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const $k@9@00 $Perm)
(assert ($Perm.isReadVar $k@9@00))
(assert (<= $Perm.No $k@9@00))
(assert (<= $k@9@00 $Perm.Write))
(assert (=> (< $Perm.No $k@9@00) (not (= r@2@00 $Ref.null))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] r.f == 2
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 2))
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 $Snap.unit))
; [eval] result == 2
(assert (= result@3@00 2))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (f3%limited s@$ r@2@00) (f3 s@$ r@2@00))
  :pattern ((f3 s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (f3%stateless r@2@00)
  :pattern ((f3%limited s@$ r@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (f3%limited s@$ r@2@00))) (and
    ($Perm.isReadVar $k@9@00)
    (=> (f3%precondition s@$ r@2@00) (= result@3@00 2))))
  :pattern ((f3%limited s@$ r@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (f3%limited s@$ r@2@00))) true)
  :pattern ((f3%limited s@$ r@2@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert ($Perm.isReadVar $k@9@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= $Perm.No $k@9@00))
(assert (<= $k@9@00 $Perm.Write))
(assert (=> (< $Perm.No $k@9@00) (not (= r@2@00 $Ref.null))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 ($SortWrappers.$SnapToInt ($Snap.first s@$))))
; [eval] result == 2
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@3@00 2)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 2))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    (=>
      (f3%precondition s@$ r@2@00)
      (= (f3 s@$ r@2@00) ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((f3 s@$ r@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  true
  :pattern ((f3 s@$ r@2@00))
  :qid |quant-u-13|)))
; ---------- FUNCTION f2----------
(declare-fun r@4@00 () $Ref)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@11@00 $Perm)
(assert ($Perm.isReadVar $k@11@00))
(assert (<= $Perm.No $k@11@00))
(assert (<= $k@11@00 $Perm.Write))
(assert (=> (< $Perm.No $k@11@00) (not (= r@4@00 $Ref.null))))
(declare-const $t@12@00 $Snap)
(assert (= $t@12@00 $Snap.unit))
; [eval] result == 2
(assert (= result@5@00 2))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (= (f2%limited s@$ r@4@00) (f2 s@$ r@4@00))
  :pattern ((f2 s@$ r@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (f2%stateless r@4@00)
  :pattern ((f2%limited s@$ r@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (let ((result@5@00 (f2%limited s@$ r@4@00))) (and
    ($Perm.isReadVar $k@11@00)
    (=> (f2%precondition s@$ r@4@00) (= result@5@00 2))))
  :pattern ((f2%limited s@$ r@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (let ((result@5@00 (f2%limited s@$ r@4@00))) true)
  :pattern ((f2%limited s@$ r@4@00))
  :qid |quant-u-15|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@11@00))
(assert (<= $Perm.No $k@11@00))
(assert (<= $k@11@00 $Perm.Write))
(assert (=> (< $Perm.No $k@11@00) (not (= r@4@00 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@5@00 ($SortWrappers.$SnapToInt s@$)))
; [eval] result == 2
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@5@00 2)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == 2
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@5@00 2)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == 2
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@5@00 2)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == 2
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@5@00 2)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- FUNCTION f1----------
(declare-fun r@6@00 () $Ref)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(assert (<= $Perm.No $k@13@00))
(assert (<= $k@13@00 $Perm.Write))
(assert (=> (< $Perm.No $k@13@00) (not (= r@6@00 $Ref.null))))
(declare-const $t@14@00 $Snap)
(assert (= $t@14@00 $Snap.unit))
; [eval] result == r.f
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@7@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (= (f1%limited s@$ r@6@00) (f1 s@$ r@6@00))
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (f1%stateless r@6@00)
  :pattern ((f1%limited s@$ r@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (let ((result@7@00 (f1%limited s@$ r@6@00))) (and
    ($Perm.isReadVar $k@13@00)
    (=>
      (f1%precondition s@$ r@6@00)
      (= result@7@00 ($SortWrappers.$SnapToInt s@$)))))
  :pattern ((f1%limited s@$ r@6@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (let ((result@7@00 (f1%limited s@$ r@6@00))) true)
  :pattern ((f1%limited s@$ r@6@00))
  :qid |quant-u-17|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert ($Perm.isReadVar $k@13@00))
(assert (<= $Perm.No $k@13@00))
(assert (<= $k@13@00 $Perm.Write))
(assert (=> (< $Perm.No $k@13@00) (not (= r@6@00 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@7@00 ($SortWrappers.$SnapToInt s@$)))
; [eval] result == r.f
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@13@00)
    (=>
      (f1%precondition s@$ r@6@00)
      (= (f1 s@$ r@6@00) ($SortWrappers.$SnapToInt s@$))))
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  true
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-19|)))
