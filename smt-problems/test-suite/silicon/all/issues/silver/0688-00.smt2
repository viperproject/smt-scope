(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:05:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0688.vpr
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
(declare-sort Unit 0)
(declare-sort Exe67 0)
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
(declare-fun $SortWrappers.UnitTo$Snap (Unit) $Snap)
(declare-fun $SortWrappers.$SnapToUnit ($Snap) Unit)
(assert (forall ((x Unit)) (!
    (= x ($SortWrappers.$SnapToUnit($SortWrappers.UnitTo$Snap x)))
    :pattern (($SortWrappers.UnitTo$Snap x))
    :qid |$Snap.$SnapToUnitTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.UnitTo$Snap($SortWrappers.$SnapToUnit x)))
    :pattern (($SortWrappers.$SnapToUnit x))
    :qid |$Snap.UnitTo$SnapToUnit|
    )))
(declare-fun $SortWrappers.Exe67To$Snap (Exe67) $Snap)
(declare-fun $SortWrappers.$SnapToExe67 ($Snap) Exe67)
(assert (forall ((x Exe67)) (!
    (= x ($SortWrappers.$SnapToExe67($SortWrappers.Exe67To$Snap x)))
    :pattern (($SortWrappers.Exe67To$Snap x))
    :qid |$Snap.$SnapToExe67To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Exe67To$Snap($SortWrappers.$SnapToExe67 x)))
    :pattern (($SortWrappers.$SnapToExe67 x))
    :qid |$Snap.Exe67To$SnapToExe67|
    )))
; ////////// Symbols
(declare-const unit<Unit> Unit)
(declare-fun Unit_tag<Int> (Unit) Int)
(declare-fun F67<Int> (Int Int) Int)
(declare-const L67<Int> Int)
(declare-const R67<Int> Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun lemmaLEqualR67 ($Snap) Unit)
(declare-fun lemmaLEqualR67%limited ($Snap) Unit)
(declare-const lemmaLEqualR67%stateless Bool)
(declare-fun lemmaLEqualR67%precondition ($Snap) Bool)
(declare-fun functionUnit ($Snap Int) Unit)
(declare-fun functionUnit%limited ($Snap Int) Unit)
(declare-fun functionUnit%stateless (Int) Bool)
(declare-fun functionUnit%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (= (Unit_tag<Int> (as unit<Unit>  Unit)) 0))
(assert (forall ((t Unit)) (!
  (= t (as unit<Unit>  Unit))
  :pattern ((Unit_tag<Int> t))
  )))
(assert (forall ((x Int)) (!
  (= (F67<Int> (as L67<Int>  Int) x) (as L67<Int>  Int))
  :pattern ((F67<Int> (as L67<Int>  Int) x))
  :qid |prog.LeftUnit67|)))
(assert (forall ((x Int)) (!
  (= (F67<Int> x (as R67<Int>  Int)) (as R67<Int>  Int))
  :pattern ((F67<Int> x (as R67<Int>  Int)))
  :qid |prog.RightUnit67|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun letvar@4@00 ($Snap) Int)
(assert (forall ((s@$ $Snap)) (!
  (= (lemmaLEqualR67%limited s@$) (lemmaLEqualR67 s@$))
  :pattern ((lemmaLEqualR67 s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as lemmaLEqualR67%stateless  Bool)
  :pattern ((lemmaLEqualR67%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (lemmaLEqualR67%limited s@$))) (=>
    (lemmaLEqualR67%precondition s@$)
    (= (as L67<Int>  Int) (as R67<Int>  Int))))
  :pattern ((lemmaLEqualR67%limited s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (lemmaLEqualR67%limited s@$))) true)
  :pattern ((lemmaLEqualR67%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap)) (!
  (=>
    (lemmaLEqualR67%precondition s@$)
    (=
      (lemmaLEqualR67 s@$)
      (let ((x (F67<Int> (as L67<Int>  Int) (as R67<Int>  Int)))) (as unit<Unit>  Unit))))
  :pattern ((lemmaLEqualR67 s@$))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap)) (!
  (=>
    (lemmaLEqualR67%precondition s@$)
    (let ((x (F67<Int> (as L67<Int>  Int) (as R67<Int>  Int)))) true))
  :pattern ((lemmaLEqualR67 s@$))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@1@00 Int)) (!
  (= (functionUnit%limited s@$ x@1@00) (functionUnit s@$ x@1@00))
  :pattern ((functionUnit s@$ x@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@1@00 Int)) (!
  (functionUnit%stateless x@1@00)
  :pattern ((functionUnit%limited s@$ x@1@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
