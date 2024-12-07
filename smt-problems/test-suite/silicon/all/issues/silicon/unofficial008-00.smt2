(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:59:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/unofficial008.vpr
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
(declare-sort PyType 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.PyTypeTo$Snap (PyType) $Snap)
(declare-fun $SortWrappers.$SnapToPyType ($Snap) PyType)
(assert (forall ((x PyType)) (!
    (= x ($SortWrappers.$SnapToPyType($SortWrappers.PyTypeTo$Snap x)))
    :pattern (($SortWrappers.PyTypeTo$Snap x))
    :qid |$Snap.$SnapToPyTypeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PyTypeTo$Snap($SortWrappers.$SnapToPyType x)))
    :pattern (($SortWrappers.$SnapToPyType x))
    :qid |$Snap.PyTypeTo$SnapToPyType|
    )))
; ////////// Symbols
(declare-fun isInt<Bool> ($Ref) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun get_idx_1 ($Snap $Ref) $Ref)
(declare-fun get_idx_1%limited ($Snap $Ref) $Ref)
(declare-fun get_idx_1%stateless ($Ref) Bool)
(declare-fun get_idx_1%precondition ($Snap $Ref) Bool)
(declare-fun get_idx ($Snap $Ref) $Ref)
(declare-fun get_idx%limited ($Snap $Ref) $Ref)
(declare-fun get_idx%stateless ($Ref) Bool)
(declare-fun get_idx%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Packet%trigger ($Snap $Ref) Bool)
(declare-fun Path%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (= (get_idx_1%limited s@$ self@0@00) (get_idx_1 s@$ self@0@00))
  :pattern ((get_idx_1 s@$ self@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (get_idx_1%stateless self@0@00)
  :pattern ((get_idx_1%limited s@$ self@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (let ((result@1@00 (get_idx_1%limited s@$ self@0@00))) (=>
    (get_idx_1%precondition s@$ self@0@00)
    (isInt<Bool> result@1@00)))
  :pattern ((get_idx_1%limited s@$ self@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (let ((result@1@00 (get_idx_1%limited s@$ self@0@00))) true)
  :pattern ((get_idx_1%limited s@$ self@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (=>
    (get_idx_1%precondition s@$ self@0@00)
    (=
      (get_idx_1 s@$ self@0@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
  :pattern ((get_idx_1 s@$ self@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  true
  :pattern ((get_idx_1 s@$ self@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (= (get_idx%limited s@$ self@2@00) (get_idx s@$ self@2@00))
  :pattern ((get_idx s@$ self@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (get_idx%stateless self@2@00)
  :pattern ((get_idx%limited s@$ self@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (let ((result@3@00 (get_idx%limited s@$ self@2@00))) (=>
    (get_idx%precondition s@$ self@2@00)
    (isInt<Bool> result@3@00)))
  :pattern ((get_idx%limited s@$ self@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (let ((result@3@00 (get_idx%limited s@$ self@2@00))) true)
  :pattern ((get_idx%limited s@$ self@2@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (=>
    (get_idx%precondition s@$ self@2@00)
    (=
      (get_idx s@$ self@2@00)
      (get_idx_1 ($Snap.combine
        ($Snap.first s@$)
        ($Snap.first ($Snap.second s@$))) self@2@00)))
  :pattern ((get_idx s@$ self@2@00))
  :pattern ((get_idx%stateless self@2@00) (Packet%trigger s@$ self@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (=>
    (get_idx%precondition s@$ self@2@00)
    (get_idx_1%precondition ($Snap.combine
      ($Snap.first s@$)
      ($Snap.first ($Snap.second s@$))) self@2@00))
  :pattern ((get_idx s@$ self@2@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
