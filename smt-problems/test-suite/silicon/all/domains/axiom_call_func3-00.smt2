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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
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
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (heapDep%limited s@$ r@2@00) (heapDep s@$ r@2@00))
  :pattern ((heapDep s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (heapDep%stateless r@2@00)
  :pattern ((heapDep%limited s@$ r@2@00))
  :qid |quant-u-3|)))
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
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (= (interp%limited s@$ i@6@00) (interp s@$ i@6@00))
  :pattern ((interp s@$ i@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (interp%stateless i@6@00)
  :pattern ((interp%limited s@$ i@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (=> (interp%precondition s@$ i@6@00) (= (interp s@$ i@6@00) (+ i@6@00 1)))
  :pattern ((interp s@$ i@6@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  true
  :pattern ((interp s@$ i@6@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (= (heapDep2%limited s@$ r@8@00) (heapDep2 s@$ r@8@00))
  :pattern ((heapDep2 s@$ r@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (heapDep2%stateless r@8@00)
  :pattern ((heapDep2%limited s@$ r@8@00))
  :qid |quant-u-9|)))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- main ----------
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var x: Ref
(declare-const x@0@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@1@01 $Ref)
; [exec]
; x := new(f)
(declare-const x@2@01 $Ref)
(assert (not (= x@2@01 $Ref.null)))
(declare-const f@3@01 Int)
(assert (not (= x@2@01 y@1@01)))
(assert (not (= x@2@01 x@0@01)))
; [exec]
; y := new(f)
(declare-const y@4@01 $Ref)
(assert (not (= y@4@01 $Ref.null)))
(declare-const f@5@01 Int)
(assert (not (= y@4@01 y@1@01)))
(assert (not (= y@4@01 x@2@01)))
; [exec]
; x.f := 20
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@4@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; y.f := 3
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert dfunc2(x.f) == 31
; [eval] dfunc2(x.f) == 31
; [eval] dfunc2(x.f)
(set-option :timeout 0)
(push) ; 3
(assert (not (= (dfunc2<Int> 20) 31)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (dfunc2<Int> 20) 31))
; [exec]
; assert heapDep2(x) == 15 + 20 + 20
; [eval] heapDep2(x) == 15 + 20 + 20
; [eval] heapDep2(x)
(push) ; 3
(assert (heapDep2%precondition ($SortWrappers.IntTo$Snap 20) x@2@01))
(pop) ; 3
; Joined path conditions
(assert (heapDep2%precondition ($SortWrappers.IntTo$Snap 20) x@2@01))
; [eval] 15 + 20 + 20
; [eval] 15 + 20
(push) ; 3
(assert (not (= (heapDep2 ($SortWrappers.IntTo$Snap 20) x@2@01) 55)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (heapDep2 ($SortWrappers.IntTo$Snap 20) x@2@01) 55))
; [exec]
; assert dfunc(x.f + 1) == 27
; [eval] dfunc(x.f + 1) == 27
; [eval] dfunc(x.f + 1)
; [eval] x.f + 1
(push) ; 3
(assert (not (= (dfunc<Int> 21) 27)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (dfunc<Int> 21) 27))
; [exec]
; assert interp(34) == 35
; [eval] interp(34) == 35
; [eval] interp(34)
(push) ; 3
(assert (interp%precondition $Snap.unit 34))
(pop) ; 3
; Joined path conditions
(assert (interp%precondition $Snap.unit 34))
(push) ; 3
(assert (not (= (interp $Snap.unit 34) 35)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (interp $Snap.unit 34) 35))
; [exec]
; assert heapDep(y) + dfunc2(x.f + 5) == 41
; [eval] heapDep(y) + dfunc2(x.f + 5) == 41
; [eval] heapDep(y) + dfunc2(x.f + 5)
; [eval] heapDep(y)
(push) ; 3
(assert (heapDep%precondition ($SortWrappers.IntTo$Snap 3) y@4@01))
(pop) ; 3
; Joined path conditions
(assert (heapDep%precondition ($SortWrappers.IntTo$Snap 3) y@4@01))
; [eval] dfunc2(x.f + 5)
; [eval] x.f + 5
(push) ; 3
(assert (not (= (+ (heapDep ($SortWrappers.IntTo$Snap 3) y@4@01) (dfunc2<Int> 25)) 41)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (+ (heapDep ($SortWrappers.IntTo$Snap 3) y@4@01) (dfunc2<Int> 25)) 41))
; [exec]
; assert heapDepUnint(x) == 24
; [eval] heapDepUnint(x) == 24
; [eval] heapDepUnint(x)
(push) ; 3
(assert (heapDepUnint%precondition ($SortWrappers.IntTo$Snap 20) x@2@01))
(pop) ; 3
; Joined path conditions
(assert (heapDepUnint%precondition ($SortWrappers.IntTo$Snap 20) x@2@01))
(push) ; 3
(assert (not (= (heapDepUnint ($SortWrappers.IntTo$Snap 20) x@2@01) 24)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@4@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@2@01 y@4@01)) (not (= y@4@01 x@2@01))))
(assert (and (not (= x@2@01 y@4@01)) (not (= y@4@01 x@2@01))))
; [eval] heapDepUnint(x) == 24
; [eval] heapDepUnint(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (heapDepUnint ($SortWrappers.IntTo$Snap 20) x@2@01) 24)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@4@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@2@01 y@4@01)) (not (= y@4@01 x@2@01))))
(assert (and (not (= x@2@01 y@4@01)) (not (= y@4@01 x@2@01))))
; [eval] heapDepUnint(x) == 24
; [eval] heapDepUnint(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (heapDepUnint ($SortWrappers.IntTo$Snap 20) x@2@01) 24)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@4@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@2@01 y@4@01)) (not (= y@4@01 x@2@01))))
(assert (and (not (= x@2@01 y@4@01)) (not (= y@4@01 x@2@01))))
; [eval] heapDepUnint(x) == 24
; [eval] heapDepUnint(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (heapDepUnint ($SortWrappers.IntTo$Snap 20) x@2@01) 24)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
