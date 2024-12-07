(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:45
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0267a.vpr
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
(declare-fun issubtype<Bool> (PyType PyType) Bool)
(declare-fun typeof<PyType> ($Ref) PyType)
(declare-const bool<PyType> PyType)
(declare-const int<PyType> PyType)
; Declaring symbols related to program functions (from program analysis)
(declare-fun int___unbox__ ($Snap $Ref) Int)
(declare-fun int___unbox__%limited ($Snap $Ref) Int)
(declare-fun int___unbox__%stateless ($Ref) Bool)
(declare-fun int___unbox__%precondition ($Snap $Ref) Bool)
(declare-fun bool___unbox__ ($Snap $Ref) Bool)
(declare-fun bool___unbox__%limited ($Snap $Ref) Bool)
(declare-fun bool___unbox__%stateless ($Ref) Bool)
(declare-fun bool___unbox__%precondition ($Snap $Ref) Bool)
(declare-fun __prim__bool___box__ ($Snap Bool) $Ref)
(declare-fun __prim__bool___box__%limited ($Snap Bool) $Ref)
(declare-fun __prim__bool___box__%stateless (Bool) Bool)
(declare-fun __prim__bool___box__%precondition ($Snap Bool) Bool)
(declare-fun __prim__int___box__ ($Snap Int) $Ref)
(declare-fun __prim__int___box__%limited ($Snap Int) $Ref)
(declare-fun __prim__int___box__%stateless (Int) Bool)
(declare-fun __prim__int___box__%precondition ($Snap Int) Bool)
(declare-fun OTHER_GLOBAL_VAR ($Snap) $Ref)
(declare-fun OTHER_GLOBAL_VAR%limited ($Snap) $Ref)
(declare-const OTHER_GLOBAL_VAR%stateless Bool)
(declare-fun OTHER_GLOBAL_VAR%precondition ($Snap) Bool)
(declare-fun ANOTHER_GLOBAL_VAR ($Snap) $Ref)
(declare-fun ANOTHER_GLOBAL_VAR%limited ($Snap) $Ref)
(declare-const ANOTHER_GLOBAL_VAR%stateless Bool)
(declare-fun ANOTHER_GLOBAL_VAR%precondition ($Snap) Bool)
(declare-fun SO_MANY_GLOBAL_VARS ($Snap) $Ref)
(declare-fun SO_MANY_GLOBAL_VARS%limited ($Snap) $Ref)
(declare-const SO_MANY_GLOBAL_VARS%stateless Bool)
(declare-fun SO_MANY_GLOBAL_VARS%precondition ($Snap) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
(assert (distinct bool<PyType> int<PyType>))
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
(declare-fun $unresolved@14@00 () $Snap)
(assert (forall ((s@$ $Snap) (box@0@00 $Ref)) (!
  (= (int___unbox__%limited s@$ box@0@00) (int___unbox__ s@$ box@0@00))
  :pattern ((int___unbox__ s@$ box@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (box@0@00 $Ref)) (!
  (int___unbox__%stateless box@0@00)
  :pattern ((int___unbox__%limited s@$ box@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (box@2@00 $Ref)) (!
  (= (bool___unbox__%limited s@$ box@2@00) (bool___unbox__ s@$ box@2@00))
  :pattern ((bool___unbox__ s@$ box@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (box@2@00 $Ref)) (!
  (bool___unbox__%stateless box@2@00)
  :pattern ((bool___unbox__%limited s@$ box@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (prim@4@00 Bool)) (!
  (=
    (__prim__bool___box__%limited s@$ prim@4@00)
    (__prim__bool___box__ s@$ prim@4@00))
  :pattern ((__prim__bool___box__ s@$ prim@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (prim@4@00 Bool)) (!
  (__prim__bool___box__%stateless prim@4@00)
  :pattern ((__prim__bool___box__%limited s@$ prim@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (prim@4@00 Bool)) (!
  (let ((result@5@00 (__prim__bool___box__%limited s@$ prim@4@00))) (=>
    (__prim__bool___box__%precondition s@$ prim@4@00)
    (and
      (= (typeof<PyType> result@5@00) (as bool<PyType>  PyType))
      (= (bool___unbox__ $Snap.unit result@5@00) prim@4@00)
      (= (int___unbox__ $Snap.unit result@5@00) (ite prim@4@00 1 0)))))
  :pattern ((__prim__bool___box__%limited s@$ prim@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (prim@4@00 Bool)) (!
  (let ((result@5@00 (__prim__bool___box__%limited s@$ prim@4@00))) true)
  :pattern ((__prim__bool___box__%limited s@$ prim@4@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (prim@4@00 Bool)) (!
  (let ((result@5@00 (__prim__bool___box__%limited s@$ prim@4@00))) (=>
    (__prim__bool___box__%precondition s@$ prim@4@00)
    (bool___unbox__%precondition $Snap.unit result@5@00)))
  :pattern ((__prim__bool___box__%limited s@$ prim@4@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (prim@4@00 Bool)) (!
  (let ((result@5@00 (__prim__bool___box__%limited s@$ prim@4@00))) (=>
    (__prim__bool___box__%precondition s@$ prim@4@00)
    (int___unbox__%precondition $Snap.unit result@5@00)))
  :pattern ((__prim__bool___box__%limited s@$ prim@4@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (prim@6@00 Int)) (!
  (=
    (__prim__int___box__%limited s@$ prim@6@00)
    (__prim__int___box__ s@$ prim@6@00))
  :pattern ((__prim__int___box__ s@$ prim@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (prim@6@00 Int)) (!
  (__prim__int___box__%stateless prim@6@00)
  :pattern ((__prim__int___box__%limited s@$ prim@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap)) (!
  (= (OTHER_GLOBAL_VAR%limited s@$) (OTHER_GLOBAL_VAR s@$))
  :pattern ((OTHER_GLOBAL_VAR s@$))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  (as OTHER_GLOBAL_VAR%stateless  Bool)
  :pattern ((OTHER_GLOBAL_VAR%limited s@$))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap)) (!
  (= (ANOTHER_GLOBAL_VAR%limited s@$) (ANOTHER_GLOBAL_VAR s@$))
  :pattern ((ANOTHER_GLOBAL_VAR s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  (as ANOTHER_GLOBAL_VAR%stateless  Bool)
  :pattern ((ANOTHER_GLOBAL_VAR%limited s@$))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@9@00 (ANOTHER_GLOBAL_VAR%limited s@$))) (=>
    (ANOTHER_GLOBAL_VAR%precondition s@$)
    (and
      (issubtype<Bool> (typeof<PyType> result@9@00) (as bool<PyType>  PyType))
      (= result@9@00 (__prim__bool___box__ $Snap.unit true)))))
  :pattern ((ANOTHER_GLOBAL_VAR%limited s@$))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@9@00 (ANOTHER_GLOBAL_VAR%limited s@$))) true)
  :pattern ((ANOTHER_GLOBAL_VAR%limited s@$))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@9@00 (ANOTHER_GLOBAL_VAR%limited s@$))) (=>
    (ANOTHER_GLOBAL_VAR%precondition s@$)
    (__prim__bool___box__%precondition $Snap.unit true)))
  :pattern ((ANOTHER_GLOBAL_VAR%limited s@$))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap)) (!
  (= (SO_MANY_GLOBAL_VARS%limited s@$) (SO_MANY_GLOBAL_VARS s@$))
  :pattern ((SO_MANY_GLOBAL_VARS s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  (as SO_MANY_GLOBAL_VARS%stateless  Bool)
  :pattern ((SO_MANY_GLOBAL_VARS%limited s@$))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@10@00 (SO_MANY_GLOBAL_VARS%limited s@$))) (=>
    (SO_MANY_GLOBAL_VARS%precondition s@$)
    (and
      (issubtype<Bool> (typeof<PyType> result@10@00) (as int<PyType>  PyType))
      (=
        result@10@00
        (ite
          (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit))
          (OTHER_GLOBAL_VAR $Snap.unit)
          (__prim__int___box__ $unresolved@14@00 44))))))
  :pattern ((SO_MANY_GLOBAL_VARS%limited s@$))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@10@00 (SO_MANY_GLOBAL_VARS%limited s@$))) true)
  :pattern ((SO_MANY_GLOBAL_VARS%limited s@$))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@10@00 (SO_MANY_GLOBAL_VARS%limited s@$))) (=>
    (SO_MANY_GLOBAL_VARS%precondition s@$)
    (and
      (and
        (ANOTHER_GLOBAL_VAR%precondition $Snap.unit)
        (bool___unbox__%precondition $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
      (ite
        (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit))
        (OTHER_GLOBAL_VAR%precondition $Snap.unit)
        (__prim__int___box__%precondition $unresolved@14@00 44)))))
  :pattern ((SO_MANY_GLOBAL_VARS%limited s@$))
  :qid |quant-u-23|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
