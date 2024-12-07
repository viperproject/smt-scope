(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:08
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/expressions/unfolding.vpr
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
(declare-fun nonTerminating ($Snap $Ref) Bool)
(declare-fun nonTerminating%limited ($Snap $Ref) Bool)
(declare-fun nonTerminating%stateless ($Ref) Bool)
(declare-fun nonTerminating%precondition ($Snap $Ref) Bool)
(declare-fun partiallyTerminating ($Snap $Ref) Bool)
(declare-fun partiallyTerminating%limited ($Snap $Ref) Bool)
(declare-fun partiallyTerminating%stateless ($Ref) Bool)
(declare-fun partiallyTerminating%precondition ($Snap $Ref) Bool)
(declare-fun test ($Snap $Ref) Bool)
(declare-fun test%limited ($Snap $Ref) Bool)
(declare-fun test%stateless ($Ref) Bool)
(declare-fun test%precondition ($Snap $Ref) Bool)
(declare-fun test2 ($Snap $Ref) Bool)
(declare-fun test2%limited ($Snap $Ref) Bool)
(declare-fun test2%stateless ($Ref) Bool)
(declare-fun test2%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun foo%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION nonTerminating----------
(declare-fun x@0@00 () $Ref)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (nonTerminating%limited s@$ x@0@00) (nonTerminating s@$ x@0@00))
  :pattern ((nonTerminating s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (nonTerminating%stateless x@0@00)
  :pattern ((nonTerminating%limited s@$ x@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION partiallyTerminating----------
(declare-fun x@2@00 () $Ref)
(declare-fun result@3@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@8@00 $Perm)
(assert ($Perm.isReadVar $k@8@00))
(assert (<= $Perm.No $k@8@00))
(assert (<= $k@8@00 $Perm.Write))
(assert (=> (< $Perm.No $k@8@00) (not (= x@2@00 $Ref.null))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (partiallyTerminating%limited s@$ x@2@00) (partiallyTerminating s@$ x@2@00))
  :pattern ((partiallyTerminating s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (partiallyTerminating%stateless x@2@00)
  :pattern ((partiallyTerminating%limited s@$ x@2@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION test----------
(declare-fun x@4@00 () $Ref)
(declare-fun result@5@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (= (test%limited s@$ x@4@00) (test s@$ x@4@00))
  :pattern ((test s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (test%stateless x@4@00)
  :pattern ((test%limited s@$ x@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(foo(x), write) in nonTerminating(x))
(set-option :timeout 0)
(push) ; 2
(assert (foo%trigger s@$ x@4@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@4@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] x.f == 42
(assert (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 42))
; [eval] nonTerminating(x)
(push) ; 3
(assert (nonTerminating%precondition $Snap.unit x@4@00))
(pop) ; 3
; Joined path conditions
(assert (nonTerminating%precondition $Snap.unit x@4@00))
(pop) ; 2
; Joined path conditions
(assert (and
  (foo%trigger s@$ x@4@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= x@4@00 $Ref.null))
  (= ($Snap.second s@$) $Snap.unit)
  (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 42)
  (nonTerminating%precondition $Snap.unit x@4@00)))
(assert (= result@5@00 (nonTerminating $Snap.unit x@4@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (test%precondition s@$ x@4@00)
    (= (test s@$ x@4@00) (nonTerminating $Snap.unit x@4@00)))
  :pattern ((test s@$ x@4@00))
  :pattern ((test%stateless x@4@00) (foo%trigger s@$ x@4@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (test%precondition s@$ x@4@00)
    (nonTerminating%precondition $Snap.unit x@4@00))
  :pattern ((test s@$ x@4@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION test2----------
(declare-fun x@6@00 () $Ref)
(declare-fun result@7@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (= (test2%limited s@$ x@6@00) (test2 s@$ x@6@00))
  :pattern ((test2 s@$ x@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (test2%stateless x@6@00)
  :pattern ((test2%limited s@$ x@6@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(foo(x), write) in partiallyTerminating(x))
(set-option :timeout 0)
(push) ; 2
(assert (foo%trigger s@$ x@6@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@6@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] x.f == 42
(assert (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 42))
; [eval] partiallyTerminating(x)
(push) ; 3
(declare-const $k@9@00 $Perm)
(assert ($Perm.isReadVar $k@9@00))
(assert (< $k@9@00 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@9@00)))
(assert (<= (- $Perm.Write $k@9@00) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@9@00)) (not (= x@6@00 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (partiallyTerminating%precondition ($Snap.first s@$) x@6@00))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@9@00))
(assert (and
  (< $k@9@00 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@9@00))
  (<= (- $Perm.Write $k@9@00) $Perm.Write)
  (=> (< $Perm.No (- $Perm.Write $k@9@00)) (not (= x@6@00 $Ref.null)))
  (partiallyTerminating%precondition ($Snap.first s@$) x@6@00)))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@9@00))
(assert (and
  (foo%trigger s@$ x@6@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= x@6@00 $Ref.null))
  (= ($Snap.second s@$) $Snap.unit)
  (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 42)
  (< $k@9@00 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@9@00))
  (<= (- $Perm.Write $k@9@00) $Perm.Write)
  (=> (< $Perm.No (- $Perm.Write $k@9@00)) (not (= x@6@00 $Ref.null)))
  (partiallyTerminating%precondition ($Snap.first s@$) x@6@00)))
(assert (= result@7@00 (partiallyTerminating ($Snap.first s@$) x@6@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    (=>
      (test2%precondition s@$ x@6@00)
      (= (test2 s@$ x@6@00) (partiallyTerminating ($Snap.first s@$) x@6@00))))
  :pattern ((test2 s@$ x@6@00))
  :pattern ((test2%stateless x@6@00) (foo%trigger s@$ x@6@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (=>
    (test2%precondition s@$ x@6@00)
    (partiallyTerminating%precondition ($Snap.first s@$) x@6@00))
  :pattern ((test2 s@$ x@6@00))
  :qid |quant-u-11|)))
; ---------- foo ----------
(declare-const x@10@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@11@00 $Snap)
(assert (= $t@11@00 ($Snap.combine ($Snap.first $t@11@00) ($Snap.second $t@11@00))))
(assert (not (= x@10@00 $Ref.null)))
(assert (= ($Snap.second $t@11@00) $Snap.unit))
; [eval] x.f == 42
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@11@00)) 42))
(pop) ; 1
