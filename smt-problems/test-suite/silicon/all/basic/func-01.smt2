(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:12
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/func.vpr
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
(declare-fun f1 ($Snap) Int)
(declare-fun f1%limited ($Snap) Int)
(declare-const f1%stateless Bool)
(declare-fun f1%precondition ($Snap) Bool)
(declare-fun f3 ($Snap Int) Int)
(declare-fun f3%limited ($Snap Int) Int)
(declare-fun f3%stateless (Int) Bool)
(declare-fun f3%precondition ($Snap Int) Bool)
(declare-fun f2 ($Snap) Int)
(declare-fun f2%limited ($Snap) Int)
(declare-const f2%stateless Bool)
(declare-fun f2%precondition ($Snap) Bool)
(declare-fun f8 ($Snap) Int)
(declare-fun f8%limited ($Snap) Int)
(declare-const f8%stateless Bool)
(declare-fun f8%precondition ($Snap) Bool)
(declare-fun f4 ($Snap) Int)
(declare-fun f4%limited ($Snap) Int)
(declare-const f4%stateless Bool)
(declare-fun f4%precondition ($Snap) Bool)
(declare-fun f7 ($Snap) Int)
(declare-fun f7%limited ($Snap) Int)
(declare-const f7%stateless Bool)
(declare-fun f7%precondition ($Snap) Bool)
(declare-fun f6 ($Snap) Int)
(declare-fun f6%limited ($Snap) Int)
(declare-const f6%stateless Bool)
(declare-fun f6%precondition ($Snap) Bool)
(declare-fun f5 ($Snap Int Bool) Int)
(declare-fun f5%limited ($Snap Int Bool) Int)
(declare-fun f5%stateless (Int Bool) Bool)
(declare-fun f5%precondition ($Snap Int Bool) Bool)
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
; ---------- FUNCTION f1----------
(declare-fun result@0@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (f1%limited s@$) (f1 s@$))
  :pattern ((f1 s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as f1%stateless  Bool)
  :pattern ((f1%limited s@$))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@0@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (f1%precondition s@$) (= (f1 s@$) 1))
  :pattern ((f1 s@$))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((f1 s@$))
  :qid |quant-u-17|)))
; ---------- FUNCTION f3----------
(declare-fun i@1@00 () Int)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@1@00 Int)) (!
  (= (f3%limited s@$ i@1@00) (f3 s@$ i@1@00))
  :pattern ((f3 s@$ i@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@1@00 Int)) (!
  (f3%stateless i@1@00)
  :pattern ((f3%limited s@$ i@1@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@2@00 i@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@1@00 Int)) (!
  (=> (f3%precondition s@$ i@1@00) (= (f3 s@$ i@1@00) i@1@00))
  :pattern ((f3 s@$ i@1@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (i@1@00 Int)) (!
  true
  :pattern ((f3 s@$ i@1@00))
  :qid |quant-u-19|)))
; ---------- FUNCTION f2----------
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] f1() > 0
; [eval] f1()
(push) ; 2
(assert (f1%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit))
(assert (> (f1 $Snap.unit) 0))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (f2%limited s@$) (f2 s@$))
  :pattern ((f2 s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as f2%stateless  Bool)
  :pattern ((f2%limited s@$))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (f1%precondition $Snap.unit))
(assert (> (f1 $Snap.unit) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@3@00 2))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (f2%precondition s@$) (= (f2 s@$) 2))
  :pattern ((f2 s@$))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((f2 s@$))
  :qid |quant-u-21|)))
; ---------- FUNCTION f8----------
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (f8%limited s@$) (f8 s@$))
  :pattern ((f8 s@$))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap)) (!
  (as f8%stateless  Bool)
  :pattern ((f8%limited s@$))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] f3(f1())
; [eval] f1()
(set-option :timeout 0)
(push) ; 2
(assert (f1%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit))
(push) ; 2
(assert (f3%precondition $Snap.unit (f1 $Snap.unit)))
(pop) ; 2
; Joined path conditions
(assert (f3%precondition $Snap.unit (f1 $Snap.unit)))
(assert (= result@4@00 (f3 $Snap.unit (f1 $Snap.unit))))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (f8%precondition s@$) (= (f8 s@$) (f3 $Snap.unit (f1 $Snap.unit))))
  :pattern ((f8 s@$))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap)) (!
  (=>
    (f8%precondition s@$)
    (and
      (f1%precondition $Snap.unit)
      (f3%precondition $Snap.unit (f1 $Snap.unit))))
  :pattern ((f8 s@$))
  :qid |quant-u-23|)))
; ---------- FUNCTION f4----------
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (f4%limited s@$) (f4 s@$))
  :pattern ((f4 s@$))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  (as f4%stateless  Bool)
  :pattern ((f4%limited s@$))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] f1() + f2()
; [eval] f1()
(set-option :timeout 0)
(push) ; 2
(assert (f1%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit))
; [eval] f2()
(push) ; 2
; [eval] f1() > 0
; [eval] f1()
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (f1 $Snap.unit) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (f1 $Snap.unit) 0))
(assert (f2%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (and (> (f1 $Snap.unit) 0) (f2%precondition $Snap.unit)))
(assert (= result@5@00 (+ (f1 $Snap.unit) (f2 $Snap.unit))))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (f4%precondition s@$) (= (f4 s@$) (+ (f1 $Snap.unit) (f2 $Snap.unit))))
  :pattern ((f4 s@$))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap)) (!
  (=>
    (f4%precondition s@$)
    (and (f1%precondition $Snap.unit) (f2%precondition $Snap.unit)))
  :pattern ((f4 s@$))
  :qid |quant-u-25|)))
; ---------- FUNCTION f7----------
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (f7%limited s@$) (f7 s@$))
  :pattern ((f7 s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  (as f7%stateless  Bool)
  :pattern ((f7%limited s@$))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] f6()
(set-option :timeout 0)
(push) ; 2
(assert (f6%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (f6%precondition $Snap.unit))
(assert (= result@6@00 (f6 $Snap.unit)))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (f7%precondition s@$) (= (f7 s@$) (f6%limited $Snap.unit)))
  :pattern ((f7 s@$))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap)) (!
  (=> (f7%precondition s@$) (f6%precondition $Snap.unit))
  :pattern ((f7 s@$))
  :qid |quant-u-27|)))
; ---------- FUNCTION f6----------
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (f6%limited s@$) (f6 s@$))
  :pattern ((f6 s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  (as f6%stateless  Bool)
  :pattern ((f6%limited s@$))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] f7()
(set-option :timeout 0)
(push) ; 2
(assert (f7%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (f7%precondition $Snap.unit))
(assert (= result@7@00 (f7 $Snap.unit)))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (f6%precondition s@$) (= (f6 s@$) (f7%limited $Snap.unit)))
  :pattern ((f6 s@$))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap)) (!
  (=> (f6%precondition s@$) (f7%precondition $Snap.unit))
  :pattern ((f6 s@$))
  :qid |quant-u-29|)))
; ---------- FUNCTION f5----------
(declare-fun i@8@00 () Int)
(declare-fun b@9@00 () Bool)
(declare-fun result@10@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@8@00 Int) (b@9@00 Bool)) (!
  (= (f5%limited s@$ i@8@00 b@9@00) (f5 s@$ i@8@00 b@9@00))
  :pattern ((f5 s@$ i@8@00 b@9@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (i@8@00 Int) (b@9@00 Bool)) (!
  (f5%stateless i@8@00 b@9@00)
  :pattern ((f5%limited s@$ i@8@00 b@9@00))
  :qid |quant-u-15|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (b ? f5(2 * i, false) : i)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@9@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@9@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@9@00 | live]
; [else-branch: 0 | !(b@9@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b@9@00]
(assert b@9@00)
; [eval] f5(2 * i, false)
; [eval] 2 * i
(push) ; 4
(assert (f5%precondition $Snap.unit (* 2 i@8@00) false))
(pop) ; 4
; Joined path conditions
(assert (f5%precondition $Snap.unit (* 2 i@8@00) false))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b@9@00)]
(assert (not b@9@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=> b@9@00 (and b@9@00 (f5%precondition $Snap.unit (* 2 i@8@00) false))))
; Joined path conditions
(assert (or (not b@9@00) b@9@00))
(assert (= result@10@00 (ite b@9@00 (f5 $Snap.unit (* 2 i@8@00) false) i@8@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@8@00 Int) (b@9@00 Bool)) (!
  (=>
    (f5%precondition s@$ i@8@00 b@9@00)
    (=
      (f5 s@$ i@8@00 b@9@00)
      (ite b@9@00 (f5%limited $Snap.unit (* 2 i@8@00) false) i@8@00)))
  :pattern ((f5 s@$ i@8@00 b@9@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (i@8@00 Int) (b@9@00 Bool)) (!
  (=>
    (f5%precondition s@$ i@8@00 b@9@00)
    (ite b@9@00 (f5%precondition $Snap.unit (* 2 i@8@00) false) true))
  :pattern ((f5 s@$ i@8@00 b@9@00))
  :qid |quant-u-31|)))
