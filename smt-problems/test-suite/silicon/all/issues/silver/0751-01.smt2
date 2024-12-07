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
; ---------- FUNCTION f_get2----------
(declare-fun idx@0@00 () Int)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] idx > -5
; [eval] -5
(assert (> idx@0@00 (- 0 5)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (idx@0@00 Int)) (!
  (= (f_get2%limited s@$ idx@0@00) (f_get2 s@$ idx@0@00))
  :pattern ((f_get2 s@$ idx@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (idx@0@00 Int)) (!
  (f_get2%stateless idx@0@00)
  :pattern ((f_get2%limited s@$ idx@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION f_get----------
(declare-fun idx@2@00 () Int)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (idx@2@00 Int)) (!
  (= (f_get%limited s@$ idx@2@00) (f_get s@$ idx@2@00))
  :pattern ((f_get s@$ idx@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (idx@2@00 Int)) (!
  (f_get%stateless idx@2@00)
  :pattern ((f_get%limited s@$ idx@2@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION f_clamp----------
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] result == 0
(assert (= result@4@00 0))
(pop) ; 1
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
