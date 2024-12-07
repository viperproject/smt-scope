(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:52:31
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0203.vpr
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
(declare-sort Dummy 0)
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
(declare-fun $SortWrappers.DummyTo$Snap (Dummy) $Snap)
(declare-fun $SortWrappers.$SnapToDummy ($Snap) Dummy)
(assert (forall ((x Dummy)) (!
    (= x ($SortWrappers.$SnapToDummy($SortWrappers.DummyTo$Snap x)))
    :pattern (($SortWrappers.DummyTo$Snap x))
    :qid |$Snap.$SnapToDummyTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DummyTo$Snap($SortWrappers.$SnapToDummy x)))
    :pattern (($SortWrappers.$SnapToDummy x))
    :qid |$Snap.DummyTo$SnapToDummy|
    )))
; ////////// Symbols
(declare-fun loc<Bool> (Dummy Int) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun count ($Snap Int Int Dummy) Int)
(declare-fun count%limited ($Snap Int Int Dummy) Int)
(declare-fun count%stateless (Int Int Dummy) Bool)
(declare-fun count%precondition ($Snap Int Int Dummy) Bool)
(declare-fun recfun ($Snap Int) Int)
(declare-fun recfun%limited ($Snap Int) Int)
(declare-fun recfun%stateless (Int) Bool)
(declare-fun recfun%precondition ($Snap Int) Bool)
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
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (=
    (count%limited s@$ lo@0@00 hi@1@00 a@2@00)
    (count s@$ lo@0@00 hi@1@00 a@2@00))
  :pattern ((count s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (count%stateless lo@0@00 hi@1@00 a@2@00)
  :pattern ((count%limited s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (let ((result@3@00 (count%limited s@$ lo@0@00 hi@1@00 a@2@00))) (=>
    (count%precondition s@$ lo@0@00 hi@1@00 a@2@00)
    (and
      (=> (<= hi@1@00 lo@0@00) (= result@3@00 0))
      (=>
        (<= lo@0@00 hi@1@00)
        (=
          (count%limited $Snap.unit lo@0@00 (+ hi@1@00 1) a@2@00)
          (+ result@3@00 (ite (loc<Bool> a@2@00 hi@1@00) 0 1)))))))
  :pattern ((count%limited s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (let ((result@3@00 (count%limited s@$ lo@0@00 hi@1@00 a@2@00))) true)
  :pattern ((count%limited s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (let ((result@3@00 (count%limited s@$ lo@0@00 hi@1@00 a@2@00))) (=>
    (and (count%precondition s@$ lo@0@00 hi@1@00 a@2@00) (<= lo@0@00 hi@1@00))
    (count%precondition $Snap.unit lo@0@00 (+ hi@1@00 1) a@2@00)))
  :pattern ((count%limited s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (= (recfun%limited s@$ x@4@00) (recfun s@$ x@4@00))
  :pattern ((recfun s@$ x@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (recfun%stateless x@4@00)
  :pattern ((recfun%limited s@$ x@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (recfun%limited s@$ x@4@00))) (=>
    (recfun%precondition s@$ x@4@00)
    (< (recfun%limited $Snap.unit x@4@00) 0)))
  :pattern ((recfun%limited s@$ x@4@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (recfun%limited s@$ x@4@00))) (=>
    (recfun%precondition s@$ x@4@00)
    (recfun%precondition $Snap.unit x@4@00)))
  :pattern ((recfun%limited s@$ x@4@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=> (recfun%precondition s@$ x@4@00) (= (recfun s@$ x@4@00) (- 0 x@4@00)))
  :pattern ((recfun s@$ x@4@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  true
  :pattern ((recfun s@$ x@4@00))
  :qid |quant-u-10|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
