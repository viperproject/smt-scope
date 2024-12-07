(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:32:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/transformations/UnfoldedChildren/fourAnd.vpr
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
(declare-fun fourAnd ($Snap Bool Bool Bool Bool) Bool)
(declare-fun fourAnd%limited ($Snap Bool Bool Bool Bool) Bool)
(declare-fun fourAnd%stateless (Bool Bool Bool Bool) Bool)
(declare-fun fourAnd%precondition ($Snap Bool Bool Bool Bool) Bool)
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
(assert (forall ((s@$ $Snap) (a@0@00 Bool) (b@1@00 Bool) (c@2@00 Bool) (d@3@00 Bool)) (!
  (=
    (fourAnd%limited s@$ a@0@00 b@1@00 c@2@00 d@3@00)
    (fourAnd s@$ a@0@00 b@1@00 c@2@00 d@3@00))
  :pattern ((fourAnd s@$ a@0@00 b@1@00 c@2@00 d@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Bool) (b@1@00 Bool) (c@2@00 Bool) (d@3@00 Bool)) (!
  (fourAnd%stateless a@0@00 b@1@00 c@2@00 d@3@00)
  :pattern ((fourAnd%limited s@$ a@0@00 b@1@00 c@2@00 d@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@0@00 Bool) (b@1@00 Bool) (c@2@00 Bool) (d@3@00 Bool)) (!
  (=>
    (fourAnd%precondition s@$ a@0@00 b@1@00 c@2@00 d@3@00)
    (=
      (fourAnd s@$ a@0@00 b@1@00 c@2@00 d@3@00)
      (and a@0@00 (and b@1@00 (and c@2@00 d@3@00)))))
  :pattern ((fourAnd s@$ a@0@00 b@1@00 c@2@00 d@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@0@00 Bool) (b@1@00 Bool) (c@2@00 Bool) (d@3@00 Bool)) (!
  true
  :pattern ((fourAnd s@$ a@0@00 b@1@00 c@2@00 d@3@00))
  :qid |quant-u-3|)))
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
; var x: Bool
(declare-const x@0@01 Bool)
; [exec]
; var y: Bool
(declare-const y@1@01 Bool)
; [exec]
; var r: Bool
(declare-const r@2@01 Bool)
; [exec]
; x := true
; [exec]
; y := true
; [exec]
; r := fourAnd(x, y, true, true)
; [eval] fourAnd(x, y, true, true)
(push) ; 3
(assert (fourAnd%precondition $Snap.unit true true true true))
(pop) ; 3
; Joined path conditions
(assert (fourAnd%precondition $Snap.unit true true true true))
(declare-const r@3@01 Bool)
(assert (= r@3@01 (fourAnd $Snap.unit true true true true)))
; [exec]
; assert r
(push) ; 3
(assert (not r@3@01))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert r@3@01)
; [exec]
; r := fourAnd(x, y, false, true)
; [eval] fourAnd(x, y, false, true)
(push) ; 3
(assert (fourAnd%precondition $Snap.unit true true false true))
(pop) ; 3
; Joined path conditions
(assert (fourAnd%precondition $Snap.unit true true false true))
(declare-const r@4@01 Bool)
(assert (= r@4@01 (fourAnd $Snap.unit true true false true)))
; [exec]
; assert !r
; [eval] !r
(push) ; 3
(assert (not (not r@4@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not r@4@01))
; [exec]
; r := fourAnd(x, false, false, true)
; [eval] fourAnd(x, false, false, true)
(push) ; 3
(assert (fourAnd%precondition $Snap.unit true false false true))
(pop) ; 3
; Joined path conditions
(assert (fourAnd%precondition $Snap.unit true false false true))
(declare-const r@5@01 Bool)
(assert (= r@5@01 (fourAnd $Snap.unit true false false true)))
; [exec]
; assert !r
; [eval] !r
(push) ; 3
(assert (not (not r@5@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not r@5@01))
(pop) ; 2
(pop) ; 1
