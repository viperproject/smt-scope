(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:47
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0352.vpr
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
(declare-fun foo ($Snap) Int)
(declare-fun foo%limited ($Snap) Int)
(declare-const foo%stateless Bool)
(declare-fun foo%precondition ($Snap) Bool)
(declare-fun bar ($Snap) Int)
(declare-fun bar%limited ($Snap) Int)
(declare-const bar%stateless Bool)
(declare-fun bar%precondition ($Snap) Bool)
(declare-fun foo2 ($Snap) Int)
(declare-fun foo2%limited ($Snap) Int)
(declare-const foo2%stateless Bool)
(declare-fun foo2%precondition ($Snap) Bool)
(declare-fun foo3 ($Snap Int) Int)
(declare-fun foo3%limited ($Snap Int) Int)
(declare-fun foo3%stateless (Int) Bool)
(declare-fun foo3%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION foo----------
(declare-fun result@0@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (foo%limited s@$) (foo s@$))
  :pattern ((foo s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as foo%stateless  Bool)
  :pattern ((foo%limited s@$))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@0@00 100))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (foo%precondition s@$) (= (foo s@$) 100))
  :pattern ((foo s@$))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((foo s@$))
  :qid |quant-u-9|)))
; ---------- FUNCTION bar----------
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (bar%limited s@$) (bar s@$))
  :pattern ((bar s@$))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap)) (!
  (as bar%stateless  Bool)
  :pattern ((bar%limited s@$))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (true ? 100 : foo())
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | True]
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (= result@1@00 100))
(pop) ; 1
(declare-const $unresolved@5@00 $Snap)
(assert (forall ((s@$ $Snap)) (!
  (=> (bar%precondition s@$) (= (bar s@$) 100))
  :pattern ((bar s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((bar s@$))
  :qid |quant-u-11|)))
; ---------- FUNCTION foo2----------
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (foo2%limited s@$) (foo2 s@$))
  :pattern ((foo2 s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as foo2%stateless  Bool)
  :pattern ((foo2%limited s@$))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (true ? 1 : 1 + foo2())
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | True]
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (= result@2@00 1))
(pop) ; 1
(declare-const $unresolved@6@00 $Snap)
(assert (forall ((s@$ $Snap)) (!
  (=> (foo2%precondition s@$) (= (foo2 s@$) 1))
  :pattern ((foo2 s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((foo2 s@$))
  :qid |quant-u-13|)))
; ---------- FUNCTION foo3----------
(declare-fun i@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] 0 < i
(assert (< 0 i@3@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@3@00 Int)) (!
  (= (foo3%limited s@$ i@3@00) (foo3 s@$ i@3@00))
  :pattern ((foo3 s@$ i@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@3@00 Int)) (!
  (foo3%stateless i@3@00)
  :pattern ((foo3%limited s@$ i@3@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (< 0 i@3@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (0 < i ? 1 : 1 + foo3(i))
; [eval] 0 < i
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 i@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | 0 < i@3@00 | live]
; [else-branch: 2 | !(0 < i@3@00) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | 0 < i@3@00]
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (= result@4@00 1))
(pop) ; 1
(declare-const $unresolved@7@00 $Snap)
(assert (forall ((s@$ $Snap) (i@3@00 Int)) (!
  (=>
    (foo3%precondition s@$ i@3@00)
    (=
      (foo3 s@$ i@3@00)
      (ite (< 0 i@3@00) 1 (+ 1 (foo3%limited $unresolved@7@00 i@3@00)))))
  :pattern ((foo3 s@$ i@3@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (i@3@00 Int)) (!
  (=>
    (foo3%precondition s@$ i@3@00)
    (ite (< 0 i@3@00) true (foo3%precondition $unresolved@7@00 i@3@00)))
  :pattern ((foo3 s@$ i@3@00))
  :qid |quant-u-15|)))
