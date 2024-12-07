(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:30:00
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/nestedRef.vpr
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
(declare-fun NonDet1 ($Snap Bool) Bool)
(declare-fun NonDet1%limited ($Snap Bool) Bool)
(declare-fun NonDet1%stateless (Bool) Bool)
(declare-fun NonDet1%precondition ($Snap Bool) Bool)
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
(assert (forall ((s@$ $Snap) (vari@0@00 Bool)) (!
  (= (NonDet1%limited s@$ vari@0@00) (NonDet1 s@$ vari@0@00))
  :pattern ((NonDet1 s@$ vari@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (vari@0@00 Bool)) (!
  (NonDet1%stateless vari@0@00)
  :pattern ((NonDet1%limited s@$ vari@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (vari@0@00 Bool)) (!
  (=> (NonDet1%precondition s@$ vari@0@00) (= (NonDet1 s@$ vari@0@00) true))
  :pattern ((NonDet1 s@$ vari@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (vari@0@00 Bool)) (!
  true
  :pattern ((NonDet1 s@$ vari@0@00))
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
; var i: Bool
(declare-const i@0@01 Bool)
; [exec]
; var m: Bool
(declare-const m@1@01 Bool)
; [exec]
; i := true
; [exec]
; m := true
; [exec]
; assert (exists k: Bool :: { NonDet1(k) } i &&
;     [(NonDet1(k) ? k : m), k || m])
; [eval] (exists k: Bool :: { NonDet1(k) } i && (k || m))
(declare-const k@2@01 Bool)
(push) ; 3
; [eval] i && (k || m)
(push) ; 4
; [then-branch: 0 | False | live]
; [else-branch: 0 | True | live]
(push) ; 5
; [then-branch: 0 | False]
(assert false)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | True]
; [eval] k || m
(push) ; 6
; [then-branch: 1 | k@2@01 | live]
; [else-branch: 1 | !(k@2@01) | live]
(push) ; 7
; [then-branch: 1 | k@2@01]
(assert k@2@01)
(pop) ; 7
(push) ; 7
; [else-branch: 1 | !(k@2@01)]
(assert (not k@2@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not k@2@01) k@2@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not k@2@01) k@2@01))
; [eval] NonDet1(k)
(push) ; 4
(assert (NonDet1%precondition $Snap.unit k@2@01))
(pop) ; 4
; Joined path conditions
(assert (NonDet1%precondition $Snap.unit k@2@01))
(assert (NonDet1%precondition $Snap.unit k@2@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((k@2@01 Bool)) (!
  (and (or (not k@2@01) k@2@01) (NonDet1%precondition $Snap.unit k@2@01))
  :pattern ((NonDet1 $Snap.unit k@2@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/nestedRef.vpr@13@11@13@65-aux|)))
(pop) ; 2
(pop) ; 1
