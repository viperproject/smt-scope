(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:33:01
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/transformations/UnfoldedChildren/fourAndRef.vpr
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
; ---------- FUNCTION fourAnd----------
(declare-fun a@0@00 () Bool)
(declare-fun b@1@00 () Bool)
(declare-fun c@2@00 () Bool)
(declare-fun d@3@00 () Bool)
(declare-fun result@4@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] a && (b && (c && d))
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | !(a@0@00) | live]
; [else-branch: 0 | a@0@00 | live]
(push) ; 3
; [then-branch: 0 | !(a@0@00)]
(assert (not a@0@00))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | a@0@00]
(assert a@0@00)
(push) ; 4
; [then-branch: 1 | !(b@1@00) | live]
; [else-branch: 1 | b@1@00 | live]
(push) ; 5
; [then-branch: 1 | !(b@1@00)]
(assert (not b@1@00))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | b@1@00]
(assert b@1@00)
(push) ; 6
; [then-branch: 2 | !(c@2@00) | live]
; [else-branch: 2 | c@2@00 | live]
(push) ; 7
; [then-branch: 2 | !(c@2@00)]
(assert (not c@2@00))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | c@2@00]
(assert c@2@00)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or c@2@00 (not c@2@00)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> b@1@00 (and b@1@00 (or c@2@00 (not c@2@00)))))
(assert (or b@1@00 (not b@1@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  a@0@00
  (and
    a@0@00
    (=> b@1@00 (and b@1@00 (or c@2@00 (not c@2@00))))
    (or b@1@00 (not b@1@00)))))
(assert (or a@0@00 (not a@0@00)))
(assert (= result@4@00 (and a@0@00 (and b@1@00 (and c@2@00 d@3@00)))))
(pop) ; 1
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
