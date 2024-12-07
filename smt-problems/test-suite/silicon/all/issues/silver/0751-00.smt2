(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:05:17
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0751.vpr
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
(declare-fun f_get2 ($Snap Int) Int)
(declare-fun f_get2%limited ($Snap Int) Int)
(declare-fun f_get2%stateless (Int) Bool)
(declare-fun f_get2%precondition ($Snap Int) Bool)
(declare-fun f_get ($Snap Int) Int)
(declare-fun f_get%limited ($Snap Int) Int)
(declare-fun f_get%stateless (Int) Bool)
(declare-fun f_get%precondition ($Snap Int) Bool)
(declare-fun f_clamp ($Snap) Int)
(declare-fun f_clamp%limited ($Snap) Int)
(declare-const f_clamp%stateless Bool)
(declare-fun f_clamp%precondition ($Snap) Bool)
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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (idx@0@00 Int)) (!
  (= (f_get2%limited s@$ idx@0@00) (f_get2 s@$ idx@0@00))
  :pattern ((f_get2 s@$ idx@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (idx@0@00 Int)) (!
  (f_get2%stateless idx@0@00)
  :pattern ((f_get2%limited s@$ idx@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (idx@2@00 Int)) (!
  (= (f_get%limited s@$ idx@2@00) (f_get s@$ idx@2@00))
  :pattern ((f_get s@$ idx@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (idx@2@00 Int)) (!
  (f_get%stateless idx@2@00)
  :pattern ((f_get%limited s@$ idx@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap)) (!
  (= (f_clamp%limited s@$) (f_clamp s@$))
  :pattern ((f_clamp s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as f_clamp%stateless  Bool)
  :pattern ((f_clamp%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@4@00 (f_clamp%limited s@$))) (=>
    (f_clamp%precondition s@$)
    (= result@4@00 0)))
  :pattern ((f_clamp%limited s@$))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@4@00 (f_clamp%limited s@$))) true)
  :pattern ((f_clamp%limited s@$))
  :qid |quant-u-7|)))
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
; inhale (forall qvar: Int ::
;     { f_get(qvar) }
;     (let alias ==
;       (qvar) in
;       f_get(alias) == f_clamp()))
(declare-const $t@0@01 $Snap)
(assert (= $t@0@01 $Snap.unit))
; [eval] (forall qvar: Int :: { f_get(qvar) } (let alias == (qvar) in f_get(alias) == f_clamp()))
(declare-const qvar@1@01 Int)
(push) ; 3
; [eval] (let alias == (qvar) in f_get(alias) == f_clamp())
(declare-fun letvar@2@01 (Int) Int)
(assert (= (letvar@2@01 qvar@1@01) qvar@1@01))
; [eval] f_get(alias) == f_clamp()
; [eval] f_get(alias)
(push) ; 4
(assert (f_get%precondition $Snap.unit qvar@1@01))
(pop) ; 4
; Joined path conditions
(assert (f_get%precondition $Snap.unit qvar@1@01))
; [eval] f_clamp()
(push) ; 4
(assert (f_clamp%precondition $Snap.unit))
(pop) ; 4
; Joined path conditions
(assert (f_clamp%precondition $Snap.unit))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (f_clamp%precondition $Snap.unit))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((qvar@1@01 Int)) (!
  (and
    (= (letvar@2@01 qvar@1@01) qvar@1@01)
    (f_get%precondition $Snap.unit qvar@1@01))
  :pattern ((f_get%limited $Snap.unit qvar@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0751.vpr@5@12@7@34-aux|)))
(assert (forall ((qvar@1@01 Int)) (!
  (= (f_get $Snap.unit qvar@1@01) (f_clamp $Snap.unit))
  :pattern ((f_get%limited $Snap.unit qvar@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0751.vpr@5@12@7@34|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert f_get(10) == 0
; [eval] f_get(10) == 0
; [eval] f_get(10)
(set-option :timeout 0)
(push) ; 3
(assert (f_get%precondition $Snap.unit 10))
(pop) ; 3
; Joined path conditions
(assert (f_get%precondition $Snap.unit 10))
(push) ; 3
(assert (not (= (f_get $Snap.unit 10) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (f_get $Snap.unit 10) 0))
(pop) ; 2
(pop) ; 1
; ---------- main2 ----------
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
; inhale (forall qvar: Int ::
;     { f_get2(qvar) }
;     qvar > 0 ==> (let alias == (qvar) in f_get2(alias) == f_clamp()))
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (forall qvar: Int :: { f_get2(qvar) } qvar > 0 ==> (let alias == (qvar) in f_get2(alias) == f_clamp()))
(declare-const qvar@4@01 Int)
(push) ; 3
; [eval] qvar > 0 ==> (let alias == (qvar) in f_get2(alias) == f_clamp())
; [eval] qvar > 0
(push) ; 4
; [then-branch: 0 | qvar@4@01 > 0 | live]
; [else-branch: 0 | !(qvar@4@01 > 0) | live]
(push) ; 5
; [then-branch: 0 | qvar@4@01 > 0]
(assert (> qvar@4@01 0))
; [eval] (let alias == (qvar) in f_get2(alias) == f_clamp())
(declare-fun letvar@5@01 (Int) Int)
(assert (= (letvar@5@01 qvar@4@01) qvar@4@01))
; [eval] f_get2(alias) == f_clamp()
; [eval] f_get2(alias)
(push) ; 6
; [eval] idx > -5
; [eval] -5
(push) ; 7
(assert (not (> qvar@4@01 (- 0 5))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (> qvar@4@01 (- 0 5)))
(assert (f_get2%precondition $Snap.unit qvar@4@01))
(pop) ; 6
; Joined path conditions
(assert (and (> qvar@4@01 (- 0 5)) (f_get2%precondition $Snap.unit qvar@4@01)))
; [eval] f_clamp()
(push) ; 6
(assert (f_clamp%precondition $Snap.unit))
(pop) ; 6
; Joined path conditions
(assert (f_clamp%precondition $Snap.unit))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(qvar@4@01 > 0)]
(assert (not (> qvar@4@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (> qvar@4@01 0)
  (and
    (> qvar@4@01 0)
    (= (letvar@5@01 qvar@4@01) qvar@4@01)
    (> qvar@4@01 (- 0 5))
    (f_get2%precondition $Snap.unit qvar@4@01)
    (f_clamp%precondition $Snap.unit))))
; Joined path conditions
(assert (or (not (> qvar@4@01 0)) (> qvar@4@01 0)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((qvar@4@01 Int)) (!
  (and
    (=>
      (> qvar@4@01 0)
      (and
        (> qvar@4@01 0)
        (= (letvar@5@01 qvar@4@01) qvar@4@01)
        (> qvar@4@01 (- 0 5))
        (f_get2%precondition $Snap.unit qvar@4@01)
        (f_clamp%precondition $Snap.unit)))
    (or (not (> qvar@4@01 0)) (> qvar@4@01 0)))
  :pattern ((f_get2%limited $Snap.unit qvar@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0751.vpr@15@12@17@35-aux|)))
(assert (forall ((qvar@4@01 Int)) (!
  (=> (> qvar@4@01 0) (= (f_get2 $Snap.unit qvar@4@01) (f_clamp $Snap.unit)))
  :pattern ((f_get2%limited $Snap.unit qvar@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0751.vpr@15@12@17@35|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert f_get2(10) == 0
; [eval] f_get2(10) == 0
; [eval] f_get2(10)
(set-option :timeout 0)
(push) ; 3
; [eval] idx > -5
; [eval] -5
(assert (f_get2%precondition $Snap.unit 10))
(pop) ; 3
; Joined path conditions
(assert (f_get2%precondition $Snap.unit 10))
(push) ; 3
(assert (not (= (f_get2 $Snap.unit 10) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (f_get2 $Snap.unit 10) 0))
(pop) ; 2
(pop) ; 1
