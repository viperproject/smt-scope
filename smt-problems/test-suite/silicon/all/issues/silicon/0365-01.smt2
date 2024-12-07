(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0365.vpr
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
(declare-sort parallelHeaps 0)
(declare-sort Epsilon 0)
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
(declare-fun $SortWrappers.parallelHeapsTo$Snap (parallelHeaps) $Snap)
(declare-fun $SortWrappers.$SnapToparallelHeaps ($Snap) parallelHeaps)
(assert (forall ((x parallelHeaps)) (!
    (= x ($SortWrappers.$SnapToparallelHeaps($SortWrappers.parallelHeapsTo$Snap x)))
    :pattern (($SortWrappers.parallelHeapsTo$Snap x))
    :qid |$Snap.$SnapToparallelHeapsTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.parallelHeapsTo$Snap($SortWrappers.$SnapToparallelHeaps x)))
    :pattern (($SortWrappers.$SnapToparallelHeaps x))
    :qid |$Snap.parallelHeapsTo$SnapToparallelHeaps|
    )))
(declare-fun $SortWrappers.EpsilonTo$Snap (Epsilon) $Snap)
(declare-fun $SortWrappers.$SnapToEpsilon ($Snap) Epsilon)
(assert (forall ((x Epsilon)) (!
    (= x ($SortWrappers.$SnapToEpsilon($SortWrappers.EpsilonTo$Snap x)))
    :pattern (($SortWrappers.EpsilonTo$Snap x))
    :qid |$Snap.$SnapToEpsilonTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.EpsilonTo$Snap($SortWrappers.$SnapToEpsilon x)))
    :pattern (($SortWrappers.$SnapToEpsilon x))
    :qid |$Snap.EpsilonTo$SnapToEpsilon|
    )))
; ////////// Symbols
(declare-const eps<Perm> $Perm)
(declare-fun temp<Ref> ($Ref) $Ref)
(declare-fun temp_inv<Ref> ($Ref) $Ref)
(declare-fun heap<Int> ($Ref) Int)
(declare-fun is_ghost<Bool> ($Ref) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun resource ($Snap) $Ref)
(declare-fun resource%limited ($Snap) $Ref)
(declare-const resource%stateless Bool)
(declare-fun resource%precondition ($Snap) Bool)
(declare-fun tokCountRef ($Snap $Ref) $Ref)
(declare-fun tokCountRef%limited ($Snap $Ref) $Ref)
(declare-fun tokCountRef%stateless ($Ref) Bool)
(declare-fun tokCountRef%precondition ($Snap $Ref) Bool)
(declare-fun readers ($Snap) $Ref)
(declare-fun readers%limited ($Snap) $Ref)
(declare-const readers%stateless Bool)
(declare-fun readers%precondition ($Snap) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (> (as eps<Perm>  $Perm) $Perm.No))
(assert (forall ((r $Ref)) (!
  (and
    (= (temp_inv<Ref> (temp<Ref> r)) r)
    (ite
      (is_ghost<Bool> r)
      (= (temp<Ref> r) r)
      (= (heap<Int> (temp<Ref> r)) (- (heap<Int> r) 3))))
  :pattern ((temp<Ref> r))
  :qid |prog.inv_temp|)))
(assert (forall ((r $Ref)) (!
  (and
    (= (temp<Ref> (temp_inv<Ref> r)) r)
    (ite
      (is_ghost<Bool> r)
      (= (temp_inv<Ref> r) r)
      (= (heap<Int> (temp_inv<Ref> r)) (+ (heap<Int> r) 3))))
  :pattern ((temp_inv<Ref> r))
  :qid |prog.inv_temp_inv|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION resource----------
(declare-fun result@0@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (resource%limited s@$) (resource s@$))
  :pattern ((resource s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as resource%stateless  Bool)
  :pattern ((resource%limited s@$))
  :qid |quant-u-1|)))
; ---------- FUNCTION tokCountRef----------
(declare-fun r@1@00 () $Ref)
(declare-fun result@2@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@4@00 $Snap)
(assert (= $t@4@00 $Snap.unit))
; [eval] tokCountRef(temp(r)) == result
; [eval] tokCountRef(temp(r))
; [eval] temp(r)
(push) ; 2
(assert (tokCountRef%precondition $Snap.unit (temp<Ref> r@1@00)))
(pop) ; 2
; Joined path conditions
(assert (tokCountRef%precondition $Snap.unit (temp<Ref> r@1@00)))
(assert (= (tokCountRef $Snap.unit (temp<Ref> r@1@00)) result@2@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@1@00 $Ref)) (!
  (= (tokCountRef%limited s@$ r@1@00) (tokCountRef s@$ r@1@00))
  :pattern ((tokCountRef s@$ r@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@1@00 $Ref)) (!
  (tokCountRef%stateless r@1@00)
  :pattern ((tokCountRef%limited s@$ r@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@1@00 $Ref)) (!
  (let ((result@2@00 (tokCountRef%limited s@$ r@1@00))) (=>
    (tokCountRef%precondition s@$ r@1@00)
    (= (tokCountRef%limited $Snap.unit (temp<Ref> r@1@00)) result@2@00)))
  :pattern ((tokCountRef%limited s@$ r@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@1@00 $Ref)) (!
  (let ((result@2@00 (tokCountRef%limited s@$ r@1@00))) (=>
    (tokCountRef%precondition s@$ r@1@00)
    (tokCountRef%precondition $Snap.unit (temp<Ref> r@1@00))))
  :pattern ((tokCountRef%limited s@$ r@1@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION readers----------
(declare-fun result@3@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (readers%limited s@$) (readers s@$))
  :pattern ((readers s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as readers%stateless  Bool)
  :pattern ((readers%limited s@$))
  :qid |quant-u-5|)))
