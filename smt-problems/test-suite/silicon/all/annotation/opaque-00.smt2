(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/annotation/opaque.vpr
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
(declare-fun isGreaterOne ($Snap Int) Bool)
(declare-fun isGreaterOne%limited ($Snap Int) Bool)
(declare-fun isGreaterOne%stateless (Int) Bool)
(declare-fun isGreaterOne%precondition ($Snap Int) Bool)
(declare-fun isGreaterOne32 ($Snap $Ref) Bool)
(declare-fun isGreaterOne32%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne32%stateless ($Ref) Bool)
(declare-fun isGreaterOne32%precondition ($Snap $Ref) Bool)
(declare-fun fac1 ($Snap Int) Int)
(declare-fun fac1%limited ($Snap Int) Int)
(declare-fun fac1%stateless (Int) Bool)
(declare-fun fac1%precondition ($Snap Int) Bool)
(declare-fun fac3 ($Snap Int) Int)
(declare-fun fac3%limited ($Snap Int) Int)
(declare-fun fac3%stateless (Int) Bool)
(declare-fun fac3%precondition ($Snap Int) Bool)
(declare-fun isGreaterOne3 ($Snap $Ref) Bool)
(declare-fun isGreaterOne3%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne3%stateless ($Ref) Bool)
(declare-fun isGreaterOne3%precondition ($Snap $Ref) Bool)
(declare-fun isGreaterOne33 ($Snap $Ref) Bool)
(declare-fun isGreaterOne33%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne33%stateless ($Ref) Bool)
(declare-fun isGreaterOne33%precondition ($Snap $Ref) Bool)
(declare-fun funP ($Snap $Ref) Int)
(declare-fun funP%limited ($Snap $Ref) Int)
(declare-fun funP%stateless ($Ref) Bool)
(declare-fun funP%precondition ($Snap $Ref) Bool)
(declare-fun isGreaterOne22 ($Snap $Ref) Bool)
(declare-fun isGreaterOne22%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne22%stateless ($Ref) Bool)
(declare-fun isGreaterOne22%precondition ($Snap $Ref) Bool)
(declare-fun fac2 ($Snap Int) Int)
(declare-fun fac2%limited ($Snap Int) Int)
(declare-fun fac2%stateless (Int) Bool)
(declare-fun fac2%precondition ($Snap Int) Bool)
(declare-fun isGreaterOne35 ($Snap $Ref) Bool)
(declare-fun isGreaterOne35%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne35%stateless ($Ref) Bool)
(declare-fun isGreaterOne35%precondition ($Snap $Ref) Bool)
(declare-fun isGreaterOne2 ($Snap $Ref) Bool)
(declare-fun isGreaterOne2%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne2%stateless ($Ref) Bool)
(declare-fun isGreaterOne2%precondition ($Snap $Ref) Bool)
(declare-fun isGreaterOne34 ($Snap $Ref) Bool)
(declare-fun isGreaterOne34%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne34%stateless ($Ref) Bool)
(declare-fun isGreaterOne34%precondition ($Snap $Ref) Bool)
(declare-fun funP2 ($Snap $Ref) Int)
(declare-fun funP2%limited ($Snap $Ref) Int)
(declare-fun funP2%stateless ($Ref) Bool)
(declare-fun funP2%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (= (isGreaterOne%limited s@$ i@0@00) (isGreaterOne s@$ i@0@00))
  :pattern ((isGreaterOne s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (isGreaterOne%stateless i@0@00)
  :pattern ((isGreaterOne%limited s@$ i@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (let ((result@1@00 (isGreaterOne%limited s@$ i@0@00))) (=>
    (and (isGreaterOne%precondition s@$ i@0@00) (> i@0@00 60))
    result@1@00))
  :pattern ((isGreaterOne%limited s@$ i@0@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (let ((result@1@00 (isGreaterOne%limited s@$ i@0@00))) true)
  :pattern ((isGreaterOne%limited s@$ i@0@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (=>
    (isGreaterOne%precondition s@$ i@0@00)
    (= (isGreaterOne s@$ i@0@00) (> i@0@00 1)))
  :pattern ((isGreaterOne s@$ i@0@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  true
  :pattern ((isGreaterOne s@$ i@0@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (isGreaterOne32%limited s@$ r@2@00) (isGreaterOne32 s@$ r@2@00))
  :pattern ((isGreaterOne32 s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (isGreaterOne32%stateless r@2@00)
  :pattern ((isGreaterOne32%limited s@$ r@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (isGreaterOne32%limited s@$ r@2@00))) (=>
    (isGreaterOne32%precondition s@$ r@2@00)
    (and
      (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@3@00)
      (= result@3@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)))))
  :pattern ((isGreaterOne32%limited s@$ r@2@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (isGreaterOne32%limited s@$ r@2@00))) true)
  :pattern ((isGreaterOne32%limited s@$ r@2@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (isGreaterOne32%limited s@$ r@2@00))) true)
  :pattern ((isGreaterOne32%limited s@$ r@2@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (=>
    (isGreaterOne32%precondition s@$ r@2@00)
    (=
      (isGreaterOne32 s@$ r@2@00)
      (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne32 s@$ r@2@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (=>
    (isGreaterOne32%precondition s@$ r@2@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne32 s@$ r@2@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (= (fac1%limited s@$ i@4@00) (fac1 s@$ i@4@00))
  :pattern ((fac1 s@$ i@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (fac1%stateless i@4@00)
  :pattern ((fac1%limited s@$ i@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (=>
    (fac1%precondition s@$ i@4@00)
    (=
      (fac1 s@$ i@4@00)
      (ite (<= i@4@00 1) 1 (* i@4@00 (fac1%limited $Snap.unit (- i@4@00 1))))))
  :pattern ((fac1 s@$ i@4@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (=>
    (fac1%precondition s@$ i@4@00)
    (ite (<= i@4@00 1) true (fac1%precondition $Snap.unit (- i@4@00 1))))
  :pattern ((fac1 s@$ i@4@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (= (fac3%limited s@$ i@6@00) (fac3 s@$ i@6@00))
  :pattern ((fac3 s@$ i@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (fac3%stateless i@6@00)
  :pattern ((fac3%limited s@$ i@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (=>
    (fac3%precondition s@$ i@6@00)
    (=
      (fac3 s@$ i@6@00)
      (ite (<= i@6@00 1) 1 (* i@6@00 (fac3%limited $Snap.unit (- i@6@00 1))))))
  :pattern ((fac3 s@$ i@6@00))
  :qid |quant-u-37|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (=>
    (fac3%precondition s@$ i@6@00)
    (ite (<= i@6@00 1) true (fac3%precondition $Snap.unit (- i@6@00 1))))
  :pattern ((fac3 s@$ i@6@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (= (isGreaterOne3%limited s@$ r@8@00) (isGreaterOne3 s@$ r@8@00))
  :pattern ((isGreaterOne3 s@$ r@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (isGreaterOne3%stateless r@8@00)
  :pattern ((isGreaterOne3%limited s@$ r@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (let ((result@9@00 (isGreaterOne3%limited s@$ r@8@00))) (=>
    (and
      (isGreaterOne3%precondition s@$ r@8@00)
      (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
    result@9@00))
  :pattern ((isGreaterOne3%limited s@$ r@8@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (let ((result@9@00 (isGreaterOne3%limited s@$ r@8@00))) true)
  :pattern ((isGreaterOne3%limited s@$ r@8@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (=>
    (isGreaterOne3%precondition s@$ r@8@00)
    (=
      (isGreaterOne3 s@$ r@8@00)
      (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne3 s@$ r@8@00))
  :qid |quant-u-41|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (=>
    (isGreaterOne3%precondition s@$ r@8@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne3 s@$ r@8@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (= (isGreaterOne33%limited s@$ r@10@00) (isGreaterOne33 s@$ r@10@00))
  :pattern ((isGreaterOne33 s@$ r@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (isGreaterOne33%stateless r@10@00)
  :pattern ((isGreaterOne33%limited s@$ r@10@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (let ((result@11@00 (isGreaterOne33%limited s@$ r@10@00))) (=>
    (and
      (isGreaterOne33%precondition s@$ r@10@00)
      (> ($SortWrappers.$SnapToInt s@$) 60))
    result@11@00))
  :pattern ((isGreaterOne33%limited s@$ r@10@00))
  :qid |quant-u-43|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (let ((result@11@00 (isGreaterOne33%limited s@$ r@10@00))) true)
  :pattern ((isGreaterOne33%limited s@$ r@10@00))
  :qid |quant-u-44|)))
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  (= (funP%limited s@$ x@12@00) (funP s@$ x@12@00))
  :pattern ((funP s@$ x@12@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  (funP%stateless x@12@00)
  :pattern ((funP%limited s@$ x@12@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  (=>
    (funP%precondition s@$ x@12@00)
    (= (funP s@$ x@12@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((funP s@$ x@12@00))
  :qid |quant-u-45|)))
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  true
  :pattern ((funP s@$ x@12@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (= (isGreaterOne22%limited s@$ r@14@00) (isGreaterOne22 s@$ r@14@00))
  :pattern ((isGreaterOne22 s@$ r@14@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (isGreaterOne22%stateless r@14@00)
  :pattern ((isGreaterOne22%limited s@$ r@14@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (let ((result@15@00 (isGreaterOne22%limited s@$ r@14@00))) (=>
    (isGreaterOne22%precondition s@$ r@14@00)
    (and
      (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@15@00)
      (= result@15@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)))))
  :pattern ((isGreaterOne22%limited s@$ r@14@00))
  :qid |quant-u-47|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (let ((result@15@00 (isGreaterOne22%limited s@$ r@14@00))) true)
  :pattern ((isGreaterOne22%limited s@$ r@14@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (let ((result@15@00 (isGreaterOne22%limited s@$ r@14@00))) true)
  :pattern ((isGreaterOne22%limited s@$ r@14@00))
  :qid |quant-u-49|)))
(assert (forall ((s@$ $Snap) (i@16@00 Int)) (!
  (= (fac2%limited s@$ i@16@00) (fac2 s@$ i@16@00))
  :pattern ((fac2 s@$ i@16@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (i@16@00 Int)) (!
  (fac2%stateless i@16@00)
  :pattern ((fac2%limited s@$ i@16@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (i@16@00 Int)) (!
  (=>
    (fac2%precondition s@$ i@16@00)
    (=
      (fac2 s@$ i@16@00)
      (ite (<= i@16@00 1) 1 (* i@16@00 (fac2%limited $Snap.unit (- i@16@00 1))))))
  :pattern ((fac2 s@$ i@16@00))
  :qid |quant-u-50|)))
(assert (forall ((s@$ $Snap) (i@16@00 Int)) (!
  (=>
    (fac2%precondition s@$ i@16@00)
    (ite (<= i@16@00 1) true (fac2%precondition $Snap.unit (- i@16@00 1))))
  :pattern ((fac2 s@$ i@16@00))
  :qid |quant-u-51|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (= (isGreaterOne35%limited s@$ r@18@00) (isGreaterOne35 s@$ r@18@00))
  :pattern ((isGreaterOne35 s@$ r@18@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (isGreaterOne35%stateless r@18@00)
  :pattern ((isGreaterOne35%limited s@$ r@18@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (let ((result@19@00 (isGreaterOne35%limited s@$ r@18@00))) (=>
    (and
      (isGreaterOne35%precondition s@$ r@18@00)
      (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
    result@19@00))
  :pattern ((isGreaterOne35%limited s@$ r@18@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (let ((result@19@00 (isGreaterOne35%limited s@$ r@18@00))) true)
  :pattern ((isGreaterOne35%limited s@$ r@18@00))
  :qid |quant-u-53|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (=>
    (isGreaterOne35%precondition s@$ r@18@00)
    (=
      (isGreaterOne35 s@$ r@18@00)
      (isGreaterOne%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne35 s@$ r@18@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (=>
    (isGreaterOne35%precondition s@$ r@18@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne35 s@$ r@18@00))
  :qid |quant-u-55|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (= (isGreaterOne2%limited s@$ r@20@00) (isGreaterOne2 s@$ r@20@00))
  :pattern ((isGreaterOne2 s@$ r@20@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (isGreaterOne2%stateless r@20@00)
  :pattern ((isGreaterOne2%limited s@$ r@20@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (let ((result@21@00 (isGreaterOne2%limited s@$ r@20@00))) (=>
    (and
      (isGreaterOne2%precondition s@$ r@20@00)
      (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
    result@21@00))
  :pattern ((isGreaterOne2%limited s@$ r@20@00))
  :qid |quant-u-56|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (let ((result@21@00 (isGreaterOne2%limited s@$ r@20@00))) true)
  :pattern ((isGreaterOne2%limited s@$ r@20@00))
  :qid |quant-u-57|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (=>
    (isGreaterOne2%precondition s@$ r@20@00)
    (=
      (isGreaterOne2 s@$ r@20@00)
      (isGreaterOne%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne2 s@$ r@20@00))
  :qid |quant-u-58|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (=>
    (isGreaterOne2%precondition s@$ r@20@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne2 s@$ r@20@00))
  :qid |quant-u-59|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (= (isGreaterOne34%limited s@$ r@22@00) (isGreaterOne34 s@$ r@22@00))
  :pattern ((isGreaterOne34 s@$ r@22@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (isGreaterOne34%stateless r@22@00)
  :pattern ((isGreaterOne34%limited s@$ r@22@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (let ((result@23@00 (isGreaterOne34%limited s@$ r@22@00))) (=>
    (and
      (isGreaterOne34%precondition s@$ r@22@00)
      (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
    result@23@00))
  :pattern ((isGreaterOne34%limited s@$ r@22@00))
  :qid |quant-u-60|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (let ((result@23@00 (isGreaterOne34%limited s@$ r@22@00))) true)
  :pattern ((isGreaterOne34%limited s@$ r@22@00))
  :qid |quant-u-61|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (=>
    (isGreaterOne34%precondition s@$ r@22@00)
    (=
      (isGreaterOne34 s@$ r@22@00)
      (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne34 s@$ r@22@00))
  :qid |quant-u-62|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (=>
    (isGreaterOne34%precondition s@$ r@22@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne34 s@$ r@22@00))
  :qid |quant-u-63|)))
(assert (forall ((s@$ $Snap) (x@24@00 $Ref)) (!
  (= (funP2%limited s@$ x@24@00) (funP2 s@$ x@24@00))
  :pattern ((funP2 s@$ x@24@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (x@24@00 $Ref)) (!
  (funP2%stateless x@24@00)
  :pattern ((funP2%limited s@$ x@24@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (x@24@00 $Ref)) (!
  (=>
    (funP2%precondition s@$ x@24@00)
    (= (funP2 s@$ x@24@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((funP2 s@$ x@24@00))
  :qid |quant-u-64|)))
(assert (forall ((s@$ $Snap) (x@24@00 $Ref)) (!
  true
  :pattern ((funP2 s@$ x@24@00))
  :qid |quant-u-65|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- mPre ----------
(declare-const j@0@01 Int)
(declare-const j@1@01 Int)
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
; var tmp: Bool
(declare-const tmp@2@01 Bool)
; [exec]
; tmp := isGreaterOne(j)
; [eval] isGreaterOne(j)
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@1@01 (- 0 60))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 4
(assert (not (> j@1@01 (- 0 60))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 4
(assert (not (> j@1@01 (- 0 60))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 4
(assert (not (> j@1@01 (- 0 60))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- mPre2 ----------
(declare-const j@3@01 Int)
(declare-const j@4@01 Int)
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
; var tmp: Bool
(declare-const tmp@5@01 Bool)
; [exec]
; tmp := @reveal()
;   (isGreaterOne(j))
; [eval] @reveal() (isGreaterOne(j))
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@4@01 (- 0 60))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 4
(assert (not (> j@4@01 (- 0 60))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 4
(assert (not (> j@4@01 (- 0 60))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 4
(assert (not (> j@4@01 (- 0 60))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- mPost ----------
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
; var tmp: Bool
(declare-const tmp@6@01 Bool)
; [exec]
; tmp := isGreaterOne(70)
; [eval] isGreaterOne(70)
(push) ; 3
; [eval] i > -60
; [eval] -60
(assert (isGreaterOne%precondition $Snap.unit 70))
(pop) ; 3
; Joined path conditions
(assert (isGreaterOne%precondition $Snap.unit 70))
(declare-const tmp@7@01 Bool)
(assert (= tmp@7@01 (isGreaterOne%limited $Snap.unit 70)))
; [exec]
; assert tmp
(push) ; 3
(assert (not tmp@7@01))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert tmp@7@01)
(pop) ; 2
(pop) ; 1
; ---------- mPost2 ----------
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
; var tmp: Bool
(declare-const tmp@8@01 Bool)
; [exec]
; tmp := @reveal()
;   (isGreaterOne(70))
; [eval] @reveal() (isGreaterOne(70))
(push) ; 3
; [eval] i > -60
; [eval] -60
(assert (isGreaterOne%precondition $Snap.unit 70))
(pop) ; 3
; Joined path conditions
(assert (isGreaterOne%precondition $Snap.unit 70))
(declare-const tmp@9@01 Bool)
(assert (= tmp@9@01 (isGreaterOne $Snap.unit 70)))
; [exec]
; assert tmp
(push) ; 3
(assert (not tmp@9@01))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert tmp@9@01)
(pop) ; 2
(pop) ; 1
; ---------- mDef ----------
(declare-const j@10@01 Int)
(declare-const j@11@01 Int)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] j > -50
; [eval] -50
(assert (> j@11@01 (- 0 50)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale isGreaterOne(j)
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] isGreaterOne(j)
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@11@01 (- 0 60))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> j@11@01 (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit j@11@01))
(pop) ; 3
; Joined path conditions
(assert (and (> j@11@01 (- 0 60)) (isGreaterOne%precondition $Snap.unit j@11@01)))
(assert (isGreaterOne%limited $Snap.unit j@11@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert j > 1
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@11@01 1)))
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
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@11@01 1)))
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
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@11@01 1)))
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
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@11@01 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mDef2 ----------
(declare-const j@14@01 Int)
(declare-const j@15@01 Int)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] j > -50
; [eval] -50
(assert (> j@15@01 (- 0 50)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; @reveal()
; inhale @reveal()
;   (isGreaterOne(j))
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] @reveal() (isGreaterOne(j))
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@15@01 (- 0 60))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> j@15@01 (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit j@15@01))
(pop) ; 3
; Joined path conditions
(assert (and (> j@15@01 (- 0 60)) (isGreaterOne%precondition $Snap.unit j@15@01)))
(assert (isGreaterOne $Snap.unit j@15@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert j > 1
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@15@01 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> j@15@01 1))
(pop) ; 2
(pop) ; 1
; ---------- mProveFun ----------
(declare-const j@18@01 Int)
(declare-const j@19@01 Int)
(push) ; 1
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] j > 1
(assert (> j@19@01 1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert isGreaterOne(j)
; [eval] isGreaterOne(j)
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@19@01 (- 0 60))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> j@19@01 (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit j@19@01))
(pop) ; 3
; Joined path conditions
(assert (and (> j@19@01 (- 0 60)) (isGreaterOne%precondition $Snap.unit j@19@01)))
(push) ; 3
(assert (not (isGreaterOne%limited $Snap.unit j@19@01)))
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
; [eval] isGreaterOne(j)
(set-option :timeout 0)
(push) ; 3
; [eval] i > -60
; [eval] -60
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (isGreaterOne%limited $Snap.unit j@19@01)))
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
; [eval] isGreaterOne(j)
(set-option :timeout 0)
(push) ; 3
; [eval] i > -60
; [eval] -60
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (isGreaterOne%limited $Snap.unit j@19@01)))
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
; [eval] isGreaterOne(j)
(set-option :timeout 0)
(push) ; 3
; [eval] i > -60
; [eval] -60
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (isGreaterOne%limited $Snap.unit j@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mProveFun2 ----------
(declare-const j@21@01 Int)
(declare-const j@22@01 Int)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] j > 1
(assert (> j@22@01 1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert @reveal()
;   (isGreaterOne(j))
; [eval] @reveal() (isGreaterOne(j))
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@22@01 (- 0 60))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> j@22@01 (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit j@22@01))
(pop) ; 3
; Joined path conditions
(assert (and (> j@22@01 (- 0 60)) (isGreaterOne%precondition $Snap.unit j@22@01)))
(push) ; 3
(assert (not (isGreaterOne $Snap.unit j@22@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (isGreaterOne $Snap.unit j@22@01))
(pop) ; 2
(pop) ; 1
; ---------- mProveRevealed ----------
(declare-const j@24@01 Int)
(declare-const j@25@01 Int)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] j > -40
; [eval] -40
(assert (> j@25@01 (- 0 40)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale isGreaterOne(j)
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] isGreaterOne(j)
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@25@01 (- 0 60))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> j@25@01 (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit j@25@01))
(pop) ; 3
; Joined path conditions
(assert (and (> j@25@01 (- 0 60)) (isGreaterOne%precondition $Snap.unit j@25@01)))
(assert (isGreaterOne%limited $Snap.unit j@25@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert @reveal()
;   (isGreaterOne(j))
; [eval] @reveal() (isGreaterOne(j))
(set-option :timeout 0)
(push) ; 3
; [eval] i > -60
; [eval] -60
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (isGreaterOne $Snap.unit j@25@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (isGreaterOne $Snap.unit j@25@01))
; [exec]
; assert j > 1
; [eval] j > 1
(push) ; 3
(assert (not (> j@25@01 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> j@25@01 1))
(pop) ; 2
(pop) ; 1
; ---------- mProveRevealed2 ----------
(declare-const j@28@01 Int)
(declare-const j@29@01 Int)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] j > -40
; [eval] -40
(assert (> j@29@01 (- 0 40)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale isGreaterOne(j)
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] isGreaterOne(j)
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@29@01 (- 0 60))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> j@29@01 (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit j@29@01))
(pop) ; 3
; Joined path conditions
(assert (and (> j@29@01 (- 0 60)) (isGreaterOne%precondition $Snap.unit j@29@01)))
(assert (isGreaterOne%limited $Snap.unit j@29@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert j > 1
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@29@01 1)))
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
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@29@01 1)))
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
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@29@01 1)))
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
; [eval] j > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> j@29@01 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mProveOpaque ----------
(declare-const j@32@01 Int)
(declare-const j@33@01 Int)
(push) ; 1
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] j > -40
; [eval] -40
(assert (> j@33@01 (- 0 40)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; @reveal()
; inhale @reveal()
;   (isGreaterOne(j))
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 $Snap.unit))
; [eval] @reveal() (isGreaterOne(j))
(push) ; 3
; [eval] i > -60
; [eval] -60
(push) ; 4
(assert (not (> j@33@01 (- 0 60))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> j@33@01 (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit j@33@01))
(pop) ; 3
; Joined path conditions
(assert (and (> j@33@01 (- 0 60)) (isGreaterOne%precondition $Snap.unit j@33@01)))
(assert (isGreaterOne $Snap.unit j@33@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert isGreaterOne(j)
; [eval] isGreaterOne(j)
(set-option :timeout 0)
(push) ; 3
; [eval] i > -60
; [eval] -60
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (isGreaterOne%limited $Snap.unit j@33@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (isGreaterOne%limited $Snap.unit j@33@01))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- mNestedFunc ----------
(declare-const r@36@01 $Ref)
(declare-const r@37@01 $Ref)
(push) ; 1
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 ($Snap.combine ($Snap.first $t@38@01) ($Snap.second $t@38@01))))
(assert (not (= r@37@01 $Ref.null)))
(assert (= ($Snap.second $t@38@01) $Snap.unit))
; [eval] r.f > -20
; [eval] -20
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) (- 0 20)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale isGreaterOne2(r)
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 $Snap.unit))
; [eval] isGreaterOne2(r)
(push) ; 3
; [eval] r.f > -38
; [eval] -38
(push) ; 4
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) (- 0 38))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) (- 0 38)))
(assert (isGreaterOne2%precondition ($Snap.combine ($Snap.first $t@38@01) $Snap.unit) r@37@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) (- 0 38))
  (isGreaterOne2%precondition ($Snap.combine ($Snap.first $t@38@01) $Snap.unit) r@37@01)))
(assert (isGreaterOne2%limited ($Snap.combine ($Snap.first $t@38@01) $Snap.unit) r@37@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mNestedFunc2 ----------
(declare-const r@40@01 $Ref)
(declare-const r@41@01 $Ref)
(push) ; 1
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01))))
(assert (not (= r@41@01 $Ref.null)))
(assert (= ($Snap.second $t@42@01) $Snap.unit))
; [eval] r.f > -20
; [eval] -20
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) (- 0 20)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; @reveal()
; inhale @reveal()
;   (isGreaterOne2(r))
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 $Snap.unit))
; [eval] @reveal() (isGreaterOne2(r))
(push) ; 3
; [eval] r.f > -38
; [eval] -38
(push) ; 4
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) (- 0 38))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) (- 0 38)))
(assert (isGreaterOne2%precondition ($Snap.combine ($Snap.first $t@42@01) $Snap.unit) r@41@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) (- 0 38))
  (isGreaterOne2%precondition ($Snap.combine ($Snap.first $t@42@01) $Snap.unit) r@41@01)))
(assert (isGreaterOne2 ($Snap.combine ($Snap.first $t@42@01) $Snap.unit) r@41@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mNestedFunc3 ----------
(declare-const r@44@01 $Ref)
(declare-const r@45@01 $Ref)
(push) ; 1
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (not (= r@45@01 $Ref.null)))
(assert (= ($Snap.second $t@46@01) $Snap.unit))
; [eval] r.f > -20
; [eval] -20
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@46@01)) (- 0 20)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale isGreaterOne3(r)
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 $Snap.unit))
; [eval] isGreaterOne3(r)
(push) ; 3
; [eval] r.f > -38
; [eval] -38
(push) ; 4
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@46@01)) (- 0 38))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@46@01)) (- 0 38)))
(assert (isGreaterOne3%precondition ($Snap.combine ($Snap.first $t@46@01) $Snap.unit) r@45@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@46@01)) (- 0 38))
  (isGreaterOne3%precondition ($Snap.combine ($Snap.first $t@46@01) $Snap.unit) r@45@01)))
(assert (isGreaterOne3%limited ($Snap.combine ($Snap.first $t@46@01) $Snap.unit) r@45@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@46@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@46@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@46@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@46@01)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mNestedFunc4 ----------
(declare-const r@48@01 $Ref)
(declare-const r@49@01 $Ref)
(push) ; 1
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (not (= r@49@01 $Ref.null)))
(assert (= ($Snap.second $t@50@01) $Snap.unit))
; [eval] r.f > -20
; [eval] -20
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) (- 0 20)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; @reveal()
; inhale @reveal()
;   (isGreaterOne3(r))
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 $Snap.unit))
; [eval] @reveal() (isGreaterOne3(r))
(push) ; 3
; [eval] r.f > -38
; [eval] -38
(push) ; 4
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) (- 0 38))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) (- 0 38)))
(assert (isGreaterOne3%precondition ($Snap.combine ($Snap.first $t@50@01) $Snap.unit) r@49@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) (- 0 38))
  (isGreaterOne3%precondition ($Snap.combine ($Snap.first $t@50@01) $Snap.unit) r@49@01)))
(assert (isGreaterOne3 ($Snap.combine ($Snap.first $t@50@01) $Snap.unit) r@49@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) 1))
(pop) ; 2
(pop) ; 1
; ---------- mNestedFunc5 ----------
(declare-const r@52@01 $Ref)
(declare-const r@53@01 $Ref)
(push) ; 1
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 ($Snap.combine ($Snap.first $t@54@01) ($Snap.second $t@54@01))))
(assert (not (= r@53@01 $Ref.null)))
(assert (= ($Snap.second $t@54@01) $Snap.unit))
; [eval] r.f > -20
; [eval] -20
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@54@01)) (- 0 20)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale isGreaterOne34(r)
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 $Snap.unit))
; [eval] isGreaterOne34(r)
(push) ; 3
; [eval] r.f > -38
; [eval] -38
(push) ; 4
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@54@01)) (- 0 38))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@54@01)) (- 0 38)))
(assert (isGreaterOne34%precondition ($Snap.combine ($Snap.first $t@54@01) $Snap.unit) r@53@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@54@01)) (- 0 38))
  (isGreaterOne34%precondition ($Snap.combine ($Snap.first $t@54@01) $Snap.unit) r@53@01)))
(assert (isGreaterOne34 ($Snap.combine ($Snap.first $t@54@01) $Snap.unit) r@53@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@54@01)) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@54@01)) 1))
(pop) ; 2
(pop) ; 1
; ---------- mNestedFunc6 ----------
(declare-const r@56@01 $Ref)
(declare-const r@57@01 $Ref)
(push) ; 1
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(assert (not (= r@57@01 $Ref.null)))
(assert (= ($Snap.second $t@58@01) $Snap.unit))
; [eval] r.f > -20
; [eval] -20
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) (- 0 20)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale isGreaterOne35(r)
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 $Snap.unit))
; [eval] isGreaterOne35(r)
(push) ; 3
; [eval] r.f > -38
; [eval] -38
(push) ; 4
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) (- 0 38))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) (- 0 38)))
(assert (isGreaterOne35%precondition ($Snap.combine ($Snap.first $t@58@01) $Snap.unit) r@57@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) (- 0 38))
  (isGreaterOne35%precondition ($Snap.combine ($Snap.first $t@58@01) $Snap.unit) r@57@01)))
(assert (isGreaterOne35 ($Snap.combine ($Snap.first $t@58@01) $Snap.unit) r@57@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1)))
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
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFac1_1 ----------
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
; var tmp: Int
(declare-const tmp@60@01 Int)
; [exec]
; tmp := fac1(3)
; [eval] fac1(3)
(push) ; 3
(assert (fac1%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac1%precondition $Snap.unit 3))
(declare-const tmp@61@01 Int)
(assert (= tmp@61@01 (fac1 $Snap.unit 3)))
; [exec]
; assert tmp == 6
; [eval] tmp == 6
(push) ; 3
(assert (not (= tmp@61@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@61@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@61@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@61@01 6)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFac1_2 ----------
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
; var tmp: Int
(declare-const tmp@62@01 Int)
; [exec]
; tmp := fac1(3)
; [eval] fac1(3)
(push) ; 3
(assert (fac1%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac1%precondition $Snap.unit 3))
(declare-const tmp@63@01 Int)
(assert (= tmp@63@01 (fac1 $Snap.unit 3)))
; [exec]
; assert tmp == 3 * fac1(2)
; [eval] tmp == 3 * fac1(2)
; [eval] 3 * fac1(2)
; [eval] fac1(2)
(push) ; 3
(assert (fac1%precondition $Snap.unit 2))
(pop) ; 3
; Joined path conditions
(assert (fac1%precondition $Snap.unit 2))
(push) ; 3
(assert (not (= tmp@63@01 (* 3 (fac1 $Snap.unit 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@63@01 (* 3 (fac1 $Snap.unit 2))))
; [exec]
; assert tmp == 3 * 2 * fac1(1)
; [eval] tmp == 3 * 2 * fac1(1)
; [eval] 3 * 2 * fac1(1)
; [eval] 3 * 2
; [eval] fac1(1)
(push) ; 3
(assert (fac1%precondition $Snap.unit 1))
(pop) ; 3
; Joined path conditions
(assert (fac1%precondition $Snap.unit 1))
(push) ; 3
(assert (not (= tmp@63@01 (* 6 (fac1 $Snap.unit 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@63@01 (* 6 (fac1 $Snap.unit 1))))
; [exec]
; assert tmp == 6
; [eval] tmp == 6
(push) ; 3
(assert (not (= tmp@63@01 6)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@63@01 6))
(pop) ; 2
(pop) ; 1
; ---------- mFac2_1 ----------
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
; var tmp: Int
(declare-const tmp@64@01 Int)
; [exec]
; tmp := fac2(3)
; [eval] fac2(3)
(push) ; 3
(assert (fac2%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 3))
(declare-const tmp@65@01 Int)
(assert (= tmp@65@01 (fac2%limited $Snap.unit 3)))
; [exec]
; assert tmp == 6
; [eval] tmp == 6
(push) ; 3
(assert (not (= tmp@65@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@65@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@65@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@65@01 6)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFac2_2 ----------
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
; var tmp: Int
(declare-const tmp@66@01 Int)
; [exec]
; tmp := fac2(3)
; [eval] fac2(3)
(push) ; 3
(assert (fac2%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 3))
(declare-const tmp@67@01 Int)
(assert (= tmp@67@01 (fac2%limited $Snap.unit 3)))
; [exec]
; assert tmp == 3 * fac2(2)
; [eval] tmp == 3 * fac2(2)
; [eval] 3 * fac2(2)
; [eval] fac2(2)
(push) ; 3
(assert (fac2%precondition $Snap.unit 2))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 2))
(push) ; 3
(assert (not (= tmp@67@01 (* 3 (fac2%limited $Snap.unit 2)))))
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
; [eval] tmp == 3 * fac2(2)
; [eval] 3 * fac2(2)
; [eval] fac2(2)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@67@01 (* 3 (fac2%limited $Snap.unit 2)))))
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
; [eval] tmp == 3 * fac2(2)
; [eval] 3 * fac2(2)
; [eval] fac2(2)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@67@01 (* 3 (fac2%limited $Snap.unit 2)))))
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
; [eval] tmp == 3 * fac2(2)
; [eval] 3 * fac2(2)
; [eval] fac2(2)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@67@01 (* 3 (fac2%limited $Snap.unit 2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFac2_3 ----------
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
; var tmp: Int
(declare-const tmp@68@01 Int)
; [exec]
; tmp := @reveal()
;   (fac2(3))
; [eval] @reveal() (fac2(3))
(push) ; 3
(assert (fac2%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 3))
(declare-const tmp@69@01 Int)
(assert (= tmp@69@01 (fac2 $Snap.unit 3)))
; [exec]
; assert tmp == 3 * @reveal() (fac2(2))
; [eval] tmp == 3 * @reveal() (fac2(2))
; [eval] 3 * @reveal() (fac2(2))
; [eval] @reveal() (fac2(2))
(push) ; 3
(assert (fac2%precondition $Snap.unit 2))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 2))
(push) ; 3
(assert (not (= tmp@69@01 (* 3 (fac2 $Snap.unit 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@69@01 (* 3 (fac2 $Snap.unit 2))))
; [exec]
; assert tmp == 3 * 2 * @reveal() (fac2(1))
; [eval] tmp == 3 * 2 * @reveal() (fac2(1))
; [eval] 3 * 2 * @reveal() (fac2(1))
; [eval] 3 * 2
; [eval] @reveal() (fac2(1))
(push) ; 3
(assert (fac2%precondition $Snap.unit 1))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 1))
(push) ; 3
(assert (not (= tmp@69@01 (* 6 (fac2 $Snap.unit 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@69@01 (* 6 (fac2 $Snap.unit 1))))
; [exec]
; assert tmp == 6
; [eval] tmp == 6
(push) ; 3
(assert (not (= tmp@69@01 6)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@69@01 6))
(pop) ; 2
(pop) ; 1
; ---------- mFac2_4 ----------
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
; var tmp: Int
(declare-const tmp@70@01 Int)
; [exec]
; tmp := @reveal()
;   (fac2(3))
; [eval] @reveal() (fac2(3))
(push) ; 3
(assert (fac2%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 3))
(declare-const tmp@71@01 Int)
(assert (= tmp@71@01 (fac2 $Snap.unit 3)))
; [exec]
; assert tmp == 3 * fac2(2)
; [eval] tmp == 3 * fac2(2)
; [eval] 3 * fac2(2)
; [eval] fac2(2)
(push) ; 3
(assert (fac2%precondition $Snap.unit 2))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 2))
(push) ; 3
(assert (not (= tmp@71@01 (* 3 (fac2%limited $Snap.unit 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@71@01 (* 3 (fac2%limited $Snap.unit 2))))
; [exec]
; assert tmp == 3 * 2 * fac2(1)
; [eval] tmp == 3 * 2 * fac2(1)
; [eval] 3 * 2 * fac2(1)
; [eval] 3 * 2
; [eval] fac2(1)
(push) ; 3
(assert (fac2%precondition $Snap.unit 1))
(pop) ; 3
; Joined path conditions
(assert (fac2%precondition $Snap.unit 1))
(push) ; 3
(assert (not (= tmp@71@01 (* 6 (fac2%limited $Snap.unit 1)))))
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
; [eval] tmp == 3 * 2 * fac2(1)
; [eval] 3 * 2 * fac2(1)
; [eval] 3 * 2
; [eval] fac2(1)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@71@01 (* 6 (fac2%limited $Snap.unit 1)))))
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
; [eval] tmp == 3 * 2 * fac2(1)
; [eval] 3 * 2 * fac2(1)
; [eval] 3 * 2
; [eval] fac2(1)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@71@01 (* 6 (fac2%limited $Snap.unit 1)))))
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
; [eval] tmp == 3 * 2 * fac2(1)
; [eval] 3 * 2 * fac2(1)
; [eval] 3 * 2
; [eval] fac2(1)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@71@01 (* 6 (fac2%limited $Snap.unit 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFac3_1 ----------
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
; var tmp: Int
(declare-const tmp@72@01 Int)
; [exec]
; tmp := fac3(3)
; [eval] fac3(3)
(push) ; 3
(assert (fac3%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 3))
(declare-const tmp@73@01 Int)
(assert (= tmp@73@01 (fac3%limited $Snap.unit 3)))
; [exec]
; assert tmp == 6
; [eval] tmp == 6
(push) ; 3
(assert (not (= tmp@73@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@73@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@73@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@73@01 6)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFac3_2 ----------
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
; var tmp: Int
(declare-const tmp@74@01 Int)
; [exec]
; tmp := fac3(3)
; [eval] fac3(3)
(push) ; 3
(assert (fac3%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 3))
(declare-const tmp@75@01 Int)
(assert (= tmp@75@01 (fac3%limited $Snap.unit 3)))
; [exec]
; assert tmp == 3 * fac3(2)
; [eval] tmp == 3 * fac3(2)
; [eval] 3 * fac3(2)
; [eval] fac3(2)
(push) ; 3
(assert (fac3%precondition $Snap.unit 2))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 2))
(push) ; 3
(assert (not (= tmp@75@01 (* 3 (fac3%limited $Snap.unit 2)))))
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
; [eval] tmp == 3 * fac3(2)
; [eval] 3 * fac3(2)
; [eval] fac3(2)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@75@01 (* 3 (fac3%limited $Snap.unit 2)))))
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
; [eval] tmp == 3 * fac3(2)
; [eval] 3 * fac3(2)
; [eval] fac3(2)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@75@01 (* 3 (fac3%limited $Snap.unit 2)))))
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
; [eval] tmp == 3 * fac3(2)
; [eval] 3 * fac3(2)
; [eval] fac3(2)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@75@01 (* 3 (fac3%limited $Snap.unit 2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFac3_3 ----------
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
; var tmp: Int
(declare-const tmp@76@01 Int)
; [exec]
; tmp := @reveal()
;   (fac3(3))
; [eval] @reveal() (fac3(3))
(push) ; 3
(assert (fac3%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 3))
(declare-const tmp@77@01 Int)
(assert (= tmp@77@01 (fac3 $Snap.unit 3)))
; [exec]
; assert tmp == 3 * @reveal() (fac3(2))
; [eval] tmp == 3 * @reveal() (fac3(2))
; [eval] 3 * @reveal() (fac3(2))
; [eval] @reveal() (fac3(2))
(push) ; 3
(assert (fac3%precondition $Snap.unit 2))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 2))
(push) ; 3
(assert (not (= tmp@77@01 (* 3 (fac3 $Snap.unit 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@77@01 (* 3 (fac3 $Snap.unit 2))))
; [exec]
; assert tmp == 3 * 2 * @reveal() (fac3(1))
; [eval] tmp == 3 * 2 * @reveal() (fac3(1))
; [eval] 3 * 2 * @reveal() (fac3(1))
; [eval] 3 * 2
; [eval] @reveal() (fac3(1))
(push) ; 3
(assert (fac3%precondition $Snap.unit 1))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 1))
(push) ; 3
(assert (not (= tmp@77@01 (* 6 (fac3 $Snap.unit 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@77@01 (* 6 (fac3 $Snap.unit 1))))
; [exec]
; assert tmp == 6
; [eval] tmp == 6
(push) ; 3
(assert (not (= tmp@77@01 6)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@77@01 6))
(pop) ; 2
(pop) ; 1
; ---------- mFac3_4 ----------
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
; var tmp: Int
(declare-const tmp@78@01 Int)
; [exec]
; tmp := @reveal()
;   (fac3(3))
; [eval] @reveal() (fac3(3))
(push) ; 3
(assert (fac3%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 3))
(declare-const tmp@79@01 Int)
(assert (= tmp@79@01 (fac3 $Snap.unit 3)))
; [exec]
; assert tmp == 3 * fac3(2)
; [eval] tmp == 3 * fac3(2)
; [eval] 3 * fac3(2)
; [eval] fac3(2)
(push) ; 3
(assert (fac3%precondition $Snap.unit 2))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 2))
(push) ; 3
(assert (not (= tmp@79@01 (* 3 (fac3%limited $Snap.unit 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= tmp@79@01 (* 3 (fac3%limited $Snap.unit 2))))
; [exec]
; assert tmp == 3 * 2 * fac3(1)
; [eval] tmp == 3 * 2 * fac3(1)
; [eval] 3 * 2 * fac3(1)
; [eval] 3 * 2
; [eval] fac3(1)
(push) ; 3
(assert (fac3%precondition $Snap.unit 1))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 1))
(push) ; 3
(assert (not (= tmp@79@01 (* 6 (fac3%limited $Snap.unit 1)))))
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
; [eval] tmp == 3 * 2 * fac3(1)
; [eval] 3 * 2 * fac3(1)
; [eval] 3 * 2
; [eval] fac3(1)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@79@01 (* 6 (fac3%limited $Snap.unit 1)))))
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
; [eval] tmp == 3 * 2 * fac3(1)
; [eval] 3 * 2 * fac3(1)
; [eval] 3 * 2
; [eval] fac3(1)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@79@01 (* 6 (fac3%limited $Snap.unit 1)))))
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
; [eval] tmp == 3 * 2 * fac3(1)
; [eval] 3 * 2 * fac3(1)
; [eval] 3 * 2
; [eval] fac3(1)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= tmp@79@01 (* 6 (fac3%limited $Snap.unit 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFac3_5 ----------
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
; var tmp: Int
(declare-const tmp@80@01 Int)
; [exec]
; tmp := @reveal()
;   (fac3(3))
; [eval] @reveal() (fac3(3))
(push) ; 3
(assert (fac3%precondition $Snap.unit 3))
(pop) ; 3
; Joined path conditions
(assert (fac3%precondition $Snap.unit 3))
(declare-const tmp@81@01 Int)
(assert (= tmp@81@01 (fac3 $Snap.unit 3)))
; [exec]
; assert tmp == 6
; [eval] tmp == 6
(push) ; 3
(assert (not (= tmp@81@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@81@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@81@01 6)))
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
; [eval] tmp == 6
(set-option :timeout 0)
(push) ; 3
(assert (not (= tmp@81@01 6)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFold ----------
(declare-const r@82@01 $Ref)
(declare-const r@83@01 $Ref)
(push) ; 1
(declare-const $t@84@01 Int)
(assert (not (= r@83@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var tmp: Int
(declare-const tmp@85@01 Int)
; [exec]
; tmp := r.f
; [exec]
; fold acc(P(r), write)
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@84@01) r@83@01))
; [exec]
; assert funP(r) == tmp
; [eval] funP(r) == tmp
; [eval] funP(r)
(push) ; 3
(assert (funP%precondition ($SortWrappers.IntTo$Snap $t@84@01) r@83@01))
(pop) ; 3
; Joined path conditions
(assert (funP%precondition ($SortWrappers.IntTo$Snap $t@84@01) r@83@01))
(push) ; 3
(assert (not (= (funP%limited ($SortWrappers.IntTo$Snap $t@84@01) r@83@01) $t@84@01)))
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
; [eval] funP(r) == tmp
; [eval] funP(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (funP%limited ($SortWrappers.IntTo$Snap $t@84@01) r@83@01) $t@84@01)))
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
; [eval] funP(r) == tmp
; [eval] funP(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (funP%limited ($SortWrappers.IntTo$Snap $t@84@01) r@83@01) $t@84@01)))
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
; [eval] funP(r) == tmp
; [eval] funP(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (funP%limited ($SortWrappers.IntTo$Snap $t@84@01) r@83@01) $t@84@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- mFold2 ----------
(declare-const r@86@01 $Ref)
(declare-const r@87@01 $Ref)
(push) ; 1
(declare-const $t@88@01 Int)
(assert (not (= r@87@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var tmp: Int
(declare-const tmp@89@01 Int)
; [exec]
; tmp := r.f
; [exec]
; fold acc(P(r), write)
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@88@01) r@87@01))
; [exec]
; assert @reveal() (funP(r)) == tmp
; [eval] @reveal() (funP(r)) == tmp
; [eval] @reveal() (funP(r))
(push) ; 3
(assert (funP%precondition ($SortWrappers.IntTo$Snap $t@88@01) r@87@01))
(pop) ; 3
; Joined path conditions
(assert (funP%precondition ($SortWrappers.IntTo$Snap $t@88@01) r@87@01))
(push) ; 3
(assert (not (= (funP ($SortWrappers.IntTo$Snap $t@88@01) r@87@01) $t@88@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (funP ($SortWrappers.IntTo$Snap $t@88@01) r@87@01) $t@88@01))
(pop) ; 2
(pop) ; 1
; ---------- mFold3 ----------
(declare-const r@90@01 $Ref)
(declare-const r@91@01 $Ref)
(push) ; 1
(declare-const $t@92@01 Int)
(assert (not (= r@91@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var tmp: Int
(declare-const tmp@93@01 Int)
; [exec]
; tmp := r.f
; [exec]
; fold acc(P(r), write)
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@92@01) r@91@01))
; [exec]
; assert funP2(r) == tmp
; [eval] funP2(r) == tmp
; [eval] funP2(r)
(push) ; 3
(assert (funP2%precondition ($SortWrappers.IntTo$Snap $t@92@01) r@91@01))
(pop) ; 3
; Joined path conditions
(assert (funP2%precondition ($SortWrappers.IntTo$Snap $t@92@01) r@91@01))
(push) ; 3
(assert (not (= (funP2 ($SortWrappers.IntTo$Snap $t@92@01) r@91@01) $t@92@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (funP2 ($SortWrappers.IntTo$Snap $t@92@01) r@91@01) $t@92@01))
(pop) ; 2
(pop) ; 1
