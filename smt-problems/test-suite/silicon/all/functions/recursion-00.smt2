(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/recursion.vpr
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
(declare-fun fac ($Snap Int) Int)
(declare-fun fac%limited ($Snap Int) Int)
(declare-fun fac%stateless (Int) Bool)
(declare-fun fac%precondition ($Snap Int) Bool)
(declare-fun err1 ($Snap Int) Int)
(declare-fun err1%limited ($Snap Int) Int)
(declare-fun err1%stateless (Int) Bool)
(declare-fun err1%precondition ($Snap Int) Bool)
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
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (= (fac%limited s@$ n@0@00) (fac s@$ n@0@00))
  :pattern ((fac s@$ n@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (fac%stateless n@0@00)
  :pattern ((fac%limited s@$ n@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (let ((result@1@00 (fac%limited s@$ n@0@00))) (=>
    (fac%precondition s@$ n@0@00)
    (>= result@1@00 0)))
  :pattern ((fac%limited s@$ n@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (let ((result@1@00 (fac%limited s@$ n@0@00))) true)
  :pattern ((fac%limited s@$ n@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (=>
    (fac%precondition s@$ n@0@00)
    (=
      (fac s@$ n@0@00)
      (ite (< n@0@00 2) n@0@00 (* n@0@00 (fac%limited $Snap.unit (- n@0@00 1))))))
  :pattern ((fac s@$ n@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (=>
    (fac%precondition s@$ n@0@00)
    (ite (< n@0@00 2) true (fac%precondition $Snap.unit (- n@0@00 1))))
  :pattern ((fac s@$ n@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (n@2@00 Int)) (!
  (= (err1%limited s@$ n@2@00) (err1 s@$ n@2@00))
  :pattern ((err1 s@$ n@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (n@2@00 Int)) (!
  (err1%stateless n@2@00)
  :pattern ((err1%limited s@$ n@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (n@2@00 Int)) (!
  (let ((result@3@00 (err1%limited s@$ n@2@00))) (=>
    (err1%precondition s@$ n@2@00)
    (>= result@3@00 0)))
  :pattern ((err1%limited s@$ n@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (n@2@00 Int)) (!
  (let ((result@3@00 (err1%limited s@$ n@2@00))) true)
  :pattern ((err1%limited s@$ n@2@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
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
; assert fac(0) == 0
; [eval] fac(0) == 0
; [eval] fac(0)
(push) ; 3
; [eval] n >= 0
(assert (fac%precondition $Snap.unit 0))
(pop) ; 3
; Joined path conditions
(assert (fac%precondition $Snap.unit 0))
(push) ; 3
(assert (not (= (fac $Snap.unit 0) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fac $Snap.unit 0) 0))
; [exec]
; assert fac(1) == 1
; [eval] fac(1) == 1
; [eval] fac(1)
(push) ; 3
; [eval] n >= 0
(assert (fac%precondition $Snap.unit 1))
(pop) ; 3
; Joined path conditions
(assert (fac%precondition $Snap.unit 1))
(push) ; 3
(assert (not (= (fac $Snap.unit 1) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fac $Snap.unit 1) 1))
; [exec]
; assert fac(2) == 2
; [eval] fac(2) == 2
; [eval] fac(2)
(push) ; 3
; [eval] n >= 0
(assert (fac%precondition $Snap.unit 2))
(pop) ; 3
; Joined path conditions
(assert (fac%precondition $Snap.unit 2))
(push) ; 3
(assert (not (= (fac $Snap.unit 2) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fac $Snap.unit 2) 2))
; [exec]
; assert fac(3) == 6
; [eval] fac(3) == 6
; [eval] fac(3)
(push) ; 3
; [eval] n >= 0
(assert (fac%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac%precondition $Snap.unit 3))
(push) ; 3
(assert (not (= (fac $Snap.unit 3) 6)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fac $Snap.unit 3) 6))
; [exec]
; assert fac(4) == 24
; [eval] fac(4) == 24
; [eval] fac(4)
(push) ; 3
; [eval] n >= 0
(assert (fac%precondition $Snap.unit 4))
(pop) ; 3
; Joined path conditions
(assert (fac%precondition $Snap.unit 4))
(push) ; 3
(assert (not (= (fac $Snap.unit 4) 24)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fac $Snap.unit 4) 24))
; [exec]
; assert fac(7) >= 0
; [eval] fac(7) >= 0
; [eval] fac(7)
(push) ; 3
; [eval] n >= 0
(assert (fac%precondition $Snap.unit 7))
(pop) ; 3
; Joined path conditions
(assert (fac%precondition $Snap.unit 7))
(push) ; 3
(assert (not (>= (fac $Snap.unit 7) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= (fac $Snap.unit 7) 0))
(pop) ; 2
(pop) ; 1
