(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/postconditions.vpr
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
(declare-sort Wrap 0)
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
(declare-fun $SortWrappers.WrapTo$Snap (Wrap) $Snap)
(declare-fun $SortWrappers.$SnapToWrap ($Snap) Wrap)
(assert (forall ((x Wrap)) (!
    (= x ($SortWrappers.$SnapToWrap($SortWrappers.WrapTo$Snap x)))
    :pattern (($SortWrappers.WrapTo$Snap x))
    :qid |$Snap.$SnapToWrapTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WrapTo$Snap($SortWrappers.$SnapToWrap x)))
    :pattern (($SortWrappers.$SnapToWrap x))
    :qid |$Snap.WrapTo$SnapToWrap|
    )))
; ////////// Symbols
(declare-fun WrappedInt<Wrap> (Int) Wrap)
(declare-fun get_Wrap_data<Int> (Wrap) Int)
(declare-fun Wrap_tag<Int> (Wrap) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun wrapNot ($Snap Int) Wrap)
(declare-fun wrapNot%limited ($Snap Int) Wrap)
(declare-fun wrapNot%stateless (Int) Bool)
(declare-fun wrapNot%precondition ($Snap Int) Bool)
(declare-fun wrap ($Snap Int) Wrap)
(declare-fun wrap%limited ($Snap Int) Wrap)
(declare-fun wrap%stateless (Int) Bool)
(declare-fun wrap%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((data Int)) (!
  (= data (get_Wrap_data<Int> (WrappedInt<Wrap> data)))
  :pattern ((WrappedInt<Wrap> data))
  )))
(assert (forall ((data Int)) (!
  (= (Wrap_tag<Int> (WrappedInt<Wrap> data)) 0)
  :pattern ((WrappedInt<Wrap> data))
  )))
(assert (forall ((t Wrap)) (!
  (= t (WrappedInt<Wrap> (get_Wrap_data<Int> t)))
  :pattern ((Wrap_tag<Int> t))
  :pattern ((get_Wrap_data<Int> t))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION wrapNot----------
(declare-fun data@0@00 () Int)
(declare-fun result@1@00 () Wrap)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@00 $Snap)
(assert (= $t@4@00 $Snap.unit))
; [eval] get_Wrap_data(result) != data
; [eval] get_Wrap_data(result)
(assert (not (= (get_Wrap_data<Int> result@1@00) data@0@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (data@0@00 Int)) (!
  (= (wrapNot%limited s@$ data@0@00) (wrapNot s@$ data@0@00))
  :pattern ((wrapNot s@$ data@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (data@0@00 Int)) (!
  (wrapNot%stateless data@0@00)
  :pattern ((wrapNot%limited s@$ data@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (data@0@00 Int)) (!
  (let ((result@1@00 (wrapNot%limited s@$ data@0@00))) (=>
    (wrapNot%precondition s@$ data@0@00)
    (not (= (get_Wrap_data<Int> result@1@00) data@0@00))))
  :pattern ((wrapNot%limited s@$ data@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (data@0@00 Int)) (!
  (let ((result@1@00 (wrapNot%limited s@$ data@0@00))) true)
  :pattern ((wrapNot%limited s@$ data@0@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION wrap----------
(declare-fun data@2@00 () Int)
(declare-fun result@3@00 () Wrap)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] get_Wrap_data(result) == data
; [eval] get_Wrap_data(result)
(assert (= (get_Wrap_data<Int> result@3@00) data@2@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (data@2@00 Int)) (!
  (= (wrap%limited s@$ data@2@00) (wrap s@$ data@2@00))
  :pattern ((wrap s@$ data@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (data@2@00 Int)) (!
  (wrap%stateless data@2@00)
  :pattern ((wrap%limited s@$ data@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (data@2@00 Int)) (!
  (let ((result@3@00 (wrap%limited s@$ data@2@00))) (=>
    (wrap%precondition s@$ data@2@00)
    (= (get_Wrap_data<Int> result@3@00) data@2@00)))
  :pattern ((wrap%limited s@$ data@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (data@2@00 Int)) (!
  (let ((result@3@00 (wrap%limited s@$ data@2@00))) true)
  :pattern ((wrap%limited s@$ data@2@00))
  :qid |quant-u-7|)))
