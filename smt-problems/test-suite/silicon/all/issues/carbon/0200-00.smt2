(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:25
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0200.vpr
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
(declare-fun isBool ($Snap $Ref) Bool)
(declare-fun isBool%limited ($Snap $Ref) Bool)
(declare-fun isBool%stateless ($Ref) Bool)
(declare-fun isBool%precondition ($Snap $Ref) Bool)
(declare-fun box ($Snap Bool) $Ref)
(declare-fun box%limited ($Snap Bool) $Ref)
(declare-fun box%stateless (Bool) Bool)
(declare-fun box%precondition ($Snap Bool) Bool)
(declare-fun unbox ($Snap $Ref) Bool)
(declare-fun unbox%limited ($Snap $Ref) Bool)
(declare-fun unbox%stateless ($Ref) Bool)
(declare-fun unbox%precondition ($Snap $Ref) Bool)
(declare-fun SCIONPath_get_hof ($Snap $Ref) $Ref)
(declare-fun SCIONPath_get_hof%limited ($Snap $Ref) $Ref)
(declare-fun SCIONPath_get_hof%stateless ($Ref) Bool)
(declare-fun SCIONPath_get_hof%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun outer%trigger ($Snap $Ref) Bool)
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
(declare-fun $k@9@00 () $Perm)
(declare-fun $k@10@00 () $Perm)
(declare-fun $k@11@00 () $Perm)
(declare-fun letvar@12@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (isBool%limited s@$ r@0@00) (isBool s@$ r@0@00))
  :pattern ((isBool s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (isBool%stateless r@0@00)
  :pattern ((isBool%limited s@$ r@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (b@2@00 Bool)) (!
  (= (box%limited s@$ b@2@00) (box s@$ b@2@00))
  :pattern ((box s@$ b@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (b@2@00 Bool)) (!
  (box%stateless b@2@00)
  :pattern ((box%limited s@$ b@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (b@2@00 Bool)) (!
  (let ((result@3@00 (box%limited s@$ b@2@00))) (=>
    (box%precondition s@$ b@2@00)
    (isBool $Snap.unit result@3@00)))
  :pattern ((box%limited s@$ b@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (b@2@00 Bool)) (!
  (let ((result@3@00 (box%limited s@$ b@2@00))) (=>
    (box%precondition s@$ b@2@00)
    (isBool%precondition $Snap.unit result@3@00)))
  :pattern ((box%limited s@$ b@2@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (= (unbox%limited s@$ r@4@00) (unbox s@$ r@4@00))
  :pattern ((unbox s@$ r@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (unbox%stateless r@4@00)
  :pattern ((unbox%limited s@$ r@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (= (SCIONPath_get_hof%limited s@$ self@6@00) (SCIONPath_get_hof s@$ self@6@00))
  :pattern ((SCIONPath_get_hof s@$ self@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (SCIONPath_get_hof%stateless self@6@00)
  :pattern ((SCIONPath_get_hof%limited s@$ self@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@11@00)
    (=>
      (SCIONPath_get_hof%precondition s@$ self@6@00)
      (=
        (SCIONPath_get_hof s@$ self@6@00)
        (let ((idx_0 ($SortWrappers.$SnapToInt s@$))) $Ref.null))))
  :pattern ((SCIONPath_get_hof s@$ self@6@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (=>
    (SCIONPath_get_hof%precondition s@$ self@6@00)
    (let ((idx_0 ($SortWrappers.$SnapToInt s@$))) true))
  :pattern ((SCIONPath_get_hof s@$ self@6@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
