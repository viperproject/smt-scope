(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/expressions/access.vpr
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
(declare-fun test2 ($Snap $Ref) Bool)
(declare-fun test2%limited ($Snap $Ref) Bool)
(declare-fun test2%stateless ($Ref) Bool)
(declare-fun test2%precondition ($Snap $Ref) Bool)
(declare-fun test1 ($Snap $Ref) Bool)
(declare-fun test1%limited ($Snap $Ref) Bool)
(declare-fun test1%stateless ($Ref) Bool)
(declare-fun test1%precondition ($Snap $Ref) Bool)
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
; ---------- FUNCTION test2----------
(declare-fun x@2@00 () $Ref)
(declare-fun result@3@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first s@$))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert false)
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (test2%limited s@$ x@2@00) (test2 s@$ x@2@00))
  :pattern ((test2 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (test2%stateless x@2@00)
  :pattern ((test2%limited s@$ x@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first s@$))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
; [eval] nonTerminating(x)
(set-option :timeout 0)
(push) ; 2
(assert (nonTerminating%precondition $Snap.unit x@2@00))
(pop) ; 2
; Joined path conditions
(assert (nonTerminating%precondition $Snap.unit x@2@00))
(assert (= result@3@00 (nonTerminating $Snap.unit x@2@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (test2%precondition s@$ x@2@00)
    (= (test2 s@$ x@2@00) (nonTerminating $Snap.unit x@2@00)))
  :pattern ((test2 s@$ x@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (test2%precondition s@$ x@2@00)
    (nonTerminating%precondition $Snap.unit x@2@00))
  :pattern ((test2 s@$ x@2@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION test1----------
(declare-fun x@4@00 () $Ref)
(declare-fun result@5@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@4@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (= (test1%limited s@$ x@4@00) (test1 s@$ x@4@00))
  :pattern ((test1 s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (test1%stateless x@4@00)
  :pattern ((test1%limited s@$ x@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@4@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] nonTerminating(x)
(set-option :timeout 0)
(push) ; 2
(assert (nonTerminating%precondition $Snap.unit x@4@00))
(pop) ; 2
; Joined path conditions
(assert (nonTerminating%precondition $Snap.unit x@4@00))
(assert (= result@5@00 (nonTerminating $Snap.unit x@4@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (test1%precondition s@$ x@4@00)
    (= (test1 s@$ x@4@00) (nonTerminating $Snap.unit x@4@00)))
  :pattern ((test1 s@$ x@4@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (test1%precondition s@$ x@4@00)
    (nonTerminating%precondition $Snap.unit x@4@00))
  :pattern ((test1 s@$ x@4@00))
  :qid |quant-u-9|)))
