(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/import/loop/liba.vpr
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
(declare-fun main ($Snap) Bool)
(declare-fun main%limited ($Snap) Bool)
(declare-const main%stateless Bool)
(declare-fun main%precondition ($Snap) Bool)
(declare-fun libb ($Snap) Bool)
(declare-fun libb%limited ($Snap) Bool)
(declare-const libb%stateless Bool)
(declare-fun libb%precondition ($Snap) Bool)
(declare-fun liba ($Snap) Bool)
(declare-fun liba%limited ($Snap) Bool)
(declare-const liba%stateless Bool)
(declare-fun liba%precondition ($Snap) Bool)
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
(assert (forall ((s@$ $Snap)) (!
  (= (main%limited s@$) (main s@$))
  :pattern ((main s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as main%stateless  Bool)
  :pattern ((main%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (main%limited s@$))) (=>
    (main%precondition s@$)
    (= result@0@00 (liba%limited $Snap.unit))))
  :pattern ((main%limited s@$))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (main%limited s@$))) (=>
    (main%precondition s@$)
    (liba%precondition $Snap.unit)))
  :pattern ((main%limited s@$))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap)) (!
  (= (libb%limited s@$) (libb s@$))
  :pattern ((libb s@$))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap)) (!
  (as libb%stateless  Bool)
  :pattern ((libb%limited s@$))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@1@00 (libb%limited s@$))) (=>
    (libb%precondition s@$)
    (= result@1@00 (main%limited $Snap.unit))))
  :pattern ((libb%limited s@$))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@1@00 (libb%limited s@$))) (=>
    (libb%precondition s@$)
    (main%precondition $Snap.unit)))
  :pattern ((libb%limited s@$))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap)) (!
  (= (liba%limited s@$) (liba s@$))
  :pattern ((liba s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as liba%stateless  Bool)
  :pattern ((liba%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@2@00 (liba%limited s@$))) (=>
    (liba%precondition s@$)
    (= result@2@00 (libb%limited $Snap.unit))))
  :pattern ((liba%limited s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@2@00 (liba%limited s@$))) (=>
    (liba%precondition s@$)
    (libb%precondition $Snap.unit)))
  :pattern ((liba%limited s@$))
  :qid |quant-u-11|)))
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
; assert main()
; [eval] main()
(push) ; 3
(assert (main%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (main%precondition $Snap.unit))
(push) ; 3
(assert (not (main $Snap.unit)))
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
; [eval] main()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (main $Snap.unit)))
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
; [eval] main()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (main $Snap.unit)))
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
; [eval] main()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (main $Snap.unit)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
