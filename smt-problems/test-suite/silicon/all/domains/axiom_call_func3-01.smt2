(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/domains/axiom_call_func3.vpr
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
(declare-sort d 0)
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
(declare-fun $SortWrappers.dTo$Snap (d) $Snap)
(declare-fun $SortWrappers.$SnapTod ($Snap) d)
(assert (forall ((x d)) (!
    (= x ($SortWrappers.$SnapTod($SortWrappers.dTo$Snap x)))
    :pattern (($SortWrappers.dTo$Snap x))
    :qid |$Snap.$SnapTodTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.dTo$Snap($SortWrappers.$SnapTod x)))
    :pattern (($SortWrappers.$SnapTod x))
    :qid |$Snap.dTo$SnapTod|
    )))
; ////////// Symbols
(declare-fun dfunc<Int> (Int) Int)
(declare-fun dfunc2<Int> (Int) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun heapDepUnint ($Snap $Ref) Int)
(declare-fun heapDepUnint%limited ($Snap $Ref) Int)
(declare-fun heapDepUnint%stateless ($Ref) Bool)
(declare-fun heapDepUnint%precondition ($Snap $Ref) Bool)
(declare-fun heapDep ($Snap $Ref) Int)
(declare-fun heapDep%limited ($Snap $Ref) Int)
(declare-fun heapDep%stateless ($Ref) Bool)
(declare-fun heapDep%precondition ($Snap $Ref) Bool)
(declare-fun uninterp ($Snap Int) Int)
(declare-fun uninterp%limited ($Snap Int) Int)
(declare-fun uninterp%stateless (Int) Bool)
(declare-fun uninterp%precondition ($Snap Int) Bool)
(declare-fun interp ($Snap Int) Int)
(declare-fun interp%limited ($Snap Int) Int)
(declare-fun interp%stateless (Int) Bool)
(declare-fun interp%precondition ($Snap Int) Bool)
(declare-fun heapDep2 ($Snap $Ref) Int)
(declare-fun heapDep2%limited ($Snap $Ref) Int)
(declare-fun heapDep2%stateless ($Ref) Bool)
(declare-fun heapDep2%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (and
  (forall ((i Int)) (!
    (interp%precondition $Snap.unit i)
    :pattern ((dfunc<Int> i))
    ))
  (forall ((i Int)) (!
    (= (dfunc<Int> i) (+ (interp $Snap.unit i) 5))
    :pattern ((dfunc<Int> i))
    ))))
(assert (and
  (forall ((i Int)) (!
    (uninterp%precondition $Snap.unit i)
    :pattern ((dfunc2<Int> i))
    ))
  (forall ((i Int)) (!
    (= (dfunc2<Int> i) (+ (uninterp $Snap.unit i) 7))
    :pattern ((dfunc2<Int> i))
    ))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION heapDepUnint----------
(declare-fun r@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (not (= r@0@00 $Ref.null)))
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 $Snap.unit))
; [eval] result == r.f + 3
; [eval] r.f + 3
(assert (= result@1@00 (+ ($SortWrappers.$SnapToInt s@$) 3)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (heapDepUnint%limited s@$ r@0@00) (heapDepUnint s@$ r@0@00))
  :pattern ((heapDepUnint s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (heapDepUnint%stateless r@0@00)
  :pattern ((heapDepUnint%limited s@$ r@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (let ((result@1@00 (heapDepUnint%limited s@$ r@0@00))) (=>
    (heapDepUnint%precondition s@$ r@0@00)
    (= result@1@00 (+ ($SortWrappers.$SnapToInt s@$) 3))))
  :pattern ((heapDepUnint%limited s@$ r@0@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (let ((result@1@00 (heapDepUnint%limited s@$ r@0@00))) true)
  :pattern ((heapDepUnint%limited s@$ r@0@00))
  :qid |quant-u-11|)))
; ---------- FUNCTION heapDep----------
(declare-fun r@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (not (= r@2@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (heapDep%limited s@$ r@2@00) (heapDep s@$ r@2@00))
  :pattern ((heapDep s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (heapDep%stateless r@2@00)
  :pattern ((heapDep%limited s@$ r@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (not (= r@2@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] r.f + 2
(assert (= result@3@00 (+ ($SortWrappers.$SnapToInt s@$) 2)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (=>
    (heapDep%precondition s@$ r@2@00)
    (= (heapDep s@$ r@2@00) (+ ($SortWrappers.$SnapToInt s@$) 2)))
  :pattern ((heapDep s@$ r@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  true
  :pattern ((heapDep s@$ r@2@00))
  :qid |quant-u-13|)))
; ---------- FUNCTION uninterp----------
(declare-fun i@4@00 () Int)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@11@00 $Snap)
(assert (= $t@11@00 $Snap.unit))
; [eval] result == i + 4
; [eval] i + 4
(assert (= result@5@00 (+ i@4@00 4)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (= (uninterp%limited s@$ i@4@00) (uninterp s@$ i@4@00))
  :pattern ((uninterp s@$ i@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (uninterp%stateless i@4@00)
  :pattern ((uninterp%limited s@$ i@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (let ((result@5@00 (uninterp%limited s@$ i@4@00))) (=>
    (uninterp%precondition s@$ i@4@00)
    (= result@5@00 (+ i@4@00 4))))
  :pattern ((uninterp%limited s@$ i@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (let ((result@5@00 (uninterp%limited s@$ i@4@00))) true)
  :pattern ((uninterp%limited s@$ i@4@00))
  :qid |quant-u-15|)))
; ---------- FUNCTION interp----------
(declare-fun i@6@00 () Int)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (= (interp%limited s@$ i@6@00) (interp s@$ i@6@00))
  :pattern ((interp s@$ i@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (interp%stateless i@6@00)
  :pattern ((interp%limited s@$ i@6@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] i + 1
(assert (= result@7@00 (+ i@6@00 1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (=> (interp%precondition s@$ i@6@00) (= (interp s@$ i@6@00) (+ i@6@00 1)))
  :pattern ((interp s@$ i@6@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  true
  :pattern ((interp s@$ i@6@00))
  :qid |quant-u-17|)))
; ---------- FUNCTION heapDep2----------
(declare-fun r@8@00 () $Ref)
(declare-fun result@9@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (not (= r@8@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (= (heapDep2%limited s@$ r@8@00) (heapDep2 s@$ r@8@00))
  :pattern ((heapDep2 s@$ r@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (heapDep2%stateless r@8@00)
  :pattern ((heapDep2%limited s@$ r@8@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (not (= r@8@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] heapDep(r) + heapDepUnint(r) + 10
; [eval] heapDep(r) + heapDepUnint(r)
; [eval] heapDep(r)
(set-option :timeout 0)
(push) ; 2
(assert (heapDep%precondition s@$ r@8@00))
(pop) ; 2
; Joined path conditions
(assert (heapDep%precondition s@$ r@8@00))
; [eval] heapDepUnint(r)
(push) ; 2
(assert (heapDepUnint%precondition s@$ r@8@00))
(pop) ; 2
; Joined path conditions
(assert (heapDepUnint%precondition s@$ r@8@00))
(assert (= result@9@00 (+ (+ (heapDep s@$ r@8@00) (heapDepUnint s@$ r@8@00)) 10)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (=>
    (heapDep2%precondition s@$ r@8@00)
    (=
      (heapDep2 s@$ r@8@00)
      (+ (+ (heapDep s@$ r@8@00) (heapDepUnint s@$ r@8@00)) 10)))
  :pattern ((heapDep2 s@$ r@8@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (=>
    (heapDep2%precondition s@$ r@8@00)
    (and
      (heapDep%precondition s@$ r@8@00)
      (heapDepUnint%precondition s@$ r@8@00)))
  :pattern ((heapDep2 s@$ r@8@00))
  :qid |quant-u-19|)))
