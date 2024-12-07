(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:25
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0200.vpr
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
(declare-fun isBool ($Snap $Ref) Bool)
(declare-fun isBool%limited ($Snap $Ref) Bool)
(declare-fun isBool%stateless ($Ref) Bool)
(declare-fun isBool%precondition ($Snap $Ref) Bool)
(declare-fun box ($Snap Bool) $Ref)
(declare-fun box%limited ($Snap Bool) $Ref)
(declare-fun box%stateless (Bool) Bool)
(declare-fun box%precondition ($Snap Bool) Bool)
(declare-fun unbox ($Snap $Ref) Bool)
(declare-fun unbox%limited ($Snap $Ref) Bool)
(declare-fun unbox%stateless ($Ref) Bool)
(declare-fun unbox%precondition ($Snap $Ref) Bool)
(declare-fun SCIONPath_get_hof ($Snap $Ref) $Ref)
(declare-fun SCIONPath_get_hof%limited ($Snap $Ref) $Ref)
(declare-fun SCIONPath_get_hof%stateless ($Ref) Bool)
(declare-fun SCIONPath_get_hof%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun outer%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION isBool----------
(declare-fun r@0@00 () $Ref)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (isBool%limited s@$ r@0@00) (isBool s@$ r@0@00))
  :pattern ((isBool s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (isBool%stateless r@0@00)
  :pattern ((isBool%limited s@$ r@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION box----------
(declare-fun b@2@00 () Bool)
(declare-fun result@3@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 $Snap.unit))
; [eval] isBool(result)
(push) ; 2
(assert (isBool%precondition $Snap.unit result@3@00))
(pop) ; 2
; Joined path conditions
(assert (isBool%precondition $Snap.unit result@3@00))
(assert (isBool $Snap.unit result@3@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@2@00 Bool)) (!
  (= (box%limited s@$ b@2@00) (box s@$ b@2@00))
  :pattern ((box s@$ b@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (b@2@00 Bool)) (!
  (box%stateless b@2@00)
  :pattern ((box%limited s@$ b@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (b@2@00 Bool)) (!
  (let ((result@3@00 (box%limited s@$ b@2@00))) (=>
    (box%precondition s@$ b@2@00)
    (isBool $Snap.unit result@3@00)))
  :pattern ((box%limited s@$ b@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (b@2@00 Bool)) (!
  (let ((result@3@00 (box%limited s@$ b@2@00))) (=>
    (box%precondition s@$ b@2@00)
    (isBool%precondition $Snap.unit result@3@00)))
  :pattern ((box%limited s@$ b@2@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION unbox----------
(declare-fun r@4@00 () $Ref)
(declare-fun result@5@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] isBool(r)
(push) ; 2
(assert (isBool%precondition $Snap.unit r@4@00))
(pop) ; 2
; Joined path conditions
(assert (isBool%precondition $Snap.unit r@4@00))
(assert (isBool $Snap.unit r@4@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (= (unbox%limited s@$ r@4@00) (unbox s@$ r@4@00))
  :pattern ((unbox s@$ r@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (unbox%stateless r@4@00)
  :pattern ((unbox%limited s@$ r@4@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION SCIONPath_get_hof----------
(declare-fun self@6@00 () $Ref)
(declare-fun result@7@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@9@00 $Perm)
(assert ($Perm.isReadVar $k@9@00))
(assert (<= $Perm.No $k@9@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (= (SCIONPath_get_hof%limited s@$ self@6@00) (SCIONPath_get_hof s@$ self@6@00))
  :pattern ((SCIONPath_get_hof s@$ self@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (SCIONPath_get_hof%stateless self@6@00)
  :pattern ((SCIONPath_get_hof%limited s@$ self@6@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@9@00))
(assert (<= $Perm.No $k@9@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (let idx_0 == ((unfolding acc(outer(self), wildcard) in self.whatever)) in (unbox(box(false)) ? null : null))
; [eval] (unfolding acc(outer(self), wildcard) in self.whatever)
(declare-const $k@10@00 $Perm)
(assert ($Perm.isReadVar $k@10@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@11@00 $Perm)
(assert ($Perm.isReadVar $k@11@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@9@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@11@00 $k@9@00))
(assert (<= $Perm.No (- $k@9@00 $k@11@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (outer%trigger s@$ self@6@00))
(assert (<= $Perm.No $k@10@00))
(assert (<= $k@10@00 $Perm.Write))
(assert (=> (< $Perm.No $k@10@00) (not (= self@6@00 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@11@00))
(assert (and
  (< $k@11@00 $k@9@00)
  (<= $Perm.No (- $k@9@00 $k@11@00))
  (outer%trigger s@$ self@6@00)
  (<= $Perm.No $k@10@00)
  (<= $k@10@00 $Perm.Write)
  (=> (< $Perm.No $k@10@00) (not (= self@6@00 $Ref.null)))))
(declare-fun letvar@12@00 ($Snap $Ref) Int)
(assert (= (letvar@12@00 s@$ self@6@00) ($SortWrappers.$SnapToInt s@$)))
; [eval] (unbox(box(false)) ? null : null)
; [eval] unbox(box(false))
; [eval] box(false)
(set-option :timeout 0)
(push) ; 2
(assert (box%precondition $Snap.unit false))
(pop) ; 2
; Joined path conditions
(assert (box%precondition $Snap.unit false))
(push) ; 2
; [eval] isBool(r)
(push) ; 3
(assert (isBool%precondition $Snap.unit (box $Snap.unit false)))
(pop) ; 3
; Joined path conditions
(assert (isBool%precondition $Snap.unit (box $Snap.unit false)))
(push) ; 3
(assert (not (isBool $Snap.unit (box $Snap.unit false))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (isBool $Snap.unit (box $Snap.unit false)))
(assert (unbox%precondition $Snap.unit (box $Snap.unit false)))
(pop) ; 2
; Joined path conditions
(assert (and
  (isBool%precondition $Snap.unit (box $Snap.unit false))
  (isBool $Snap.unit (box $Snap.unit false))
  (unbox%precondition $Snap.unit (box $Snap.unit false))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (unbox $Snap.unit (box $Snap.unit false)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (unbox $Snap.unit (box $Snap.unit false))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | unbox(_, box(_, False)) | live]
; [else-branch: 0 | !(unbox(_, box(_, False))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | unbox(_, box(_, False))]
(assert (unbox $Snap.unit (box $Snap.unit false)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(unbox(_, box(_, False)))]
(assert (not (unbox $Snap.unit (box $Snap.unit false))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (unbox $Snap.unit (box $Snap.unit false)))
  (unbox $Snap.unit (box $Snap.unit false))))
(assert (= result@7@00 $Ref.null))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@11@00)
    (=>
      (SCIONPath_get_hof%precondition s@$ self@6@00)
      (=
        (SCIONPath_get_hof s@$ self@6@00)
        (let ((idx_0 ($SortWrappers.$SnapToInt s@$))) $Ref.null))))
  :pattern ((SCIONPath_get_hof s@$ self@6@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (=>
    (SCIONPath_get_hof%precondition s@$ self@6@00)
    (let ((idx_0 ($SortWrappers.$SnapToInt s@$))) true))
  :pattern ((SCIONPath_get_hof s@$ self@6@00))
  :qid |quant-u-11|)))
; ---------- outer ----------
(declare-const r@13@00 $Ref)
(push) ; 1
(declare-const $t@14@00 Int)
(assert (not (= r@13@00 $Ref.null)))
(pop) ; 1
