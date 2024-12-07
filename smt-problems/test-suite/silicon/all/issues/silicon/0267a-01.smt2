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
; ---------- FUNCTION int___unbox__----------
(declare-fun box@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (box@0@00 $Ref)) (!
  (= (int___unbox__%limited s@$ box@0@00) (int___unbox__ s@$ box@0@00))
  :pattern ((int___unbox__ s@$ box@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (box@0@00 $Ref)) (!
  (int___unbox__%stateless box@0@00)
  :pattern ((int___unbox__%limited s@$ box@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION bool___unbox__----------
(declare-fun box@2@00 () $Ref)
(declare-fun result@3@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (box@2@00 $Ref)) (!
  (= (bool___unbox__%limited s@$ box@2@00) (bool___unbox__ s@$ box@2@00))
  :pattern ((bool___unbox__ s@$ box@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (box@2@00 $Ref)) (!
  (bool___unbox__%stateless box@2@00)
  :pattern ((bool___unbox__%limited s@$ box@2@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION __prim__bool___box__----------
(declare-fun prim@4@00 () Bool)
(declare-fun result@5@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@11@00 $Snap)
(assert (= $t@11@00 ($Snap.combine ($Snap.first $t@11@00) ($Snap.second $t@11@00))))
(assert (= ($Snap.first $t@11@00) $Snap.unit))
; [eval] typeof(result) == bool()
; [eval] typeof(result)
; [eval] bool()
(assert (= (typeof<PyType> result@5@00) (as bool<PyType>  PyType)))
(assert (=
  ($Snap.second $t@11@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@00))
    ($Snap.second ($Snap.second $t@11@00)))))
(assert (= ($Snap.first ($Snap.second $t@11@00)) $Snap.unit))
; [eval] bool___unbox__(result) == prim
; [eval] bool___unbox__(result)
(push) ; 2
(assert (bool___unbox__%precondition $Snap.unit result@5@00))
(pop) ; 2
; Joined path conditions
(assert (bool___unbox__%precondition $Snap.unit result@5@00))
(assert (= (bool___unbox__ $Snap.unit result@5@00) prim@4@00))
(assert (= ($Snap.second ($Snap.second $t@11@00)) $Snap.unit))
; [eval] int___unbox__(result) == (prim ? 1 : 0)
; [eval] int___unbox__(result)
(push) ; 2
(assert (int___unbox__%precondition $Snap.unit result@5@00))
(pop) ; 2
; Joined path conditions
(assert (int___unbox__%precondition $Snap.unit result@5@00))
; [eval] (prim ? 1 : 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not prim@4@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not prim@4@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | prim@4@00 | live]
; [else-branch: 0 | !(prim@4@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | prim@4@00]
(assert prim@4@00)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(prim@4@00)]
(assert (not prim@4@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not prim@4@00) prim@4@00))
(assert (= (int___unbox__ $Snap.unit result@5@00) (ite prim@4@00 1 0)))
(pop) ; 1
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
; ---------- FUNCTION __prim__int___box__----------
(declare-fun prim@6@00 () Int)
(declare-fun result@7@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
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
; ---------- FUNCTION OTHER_GLOBAL_VAR----------
(declare-fun result@8@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (OTHER_GLOBAL_VAR%limited s@$) (OTHER_GLOBAL_VAR s@$))
  :pattern ((OTHER_GLOBAL_VAR s@$))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  (as OTHER_GLOBAL_VAR%stateless  Bool)
  :pattern ((OTHER_GLOBAL_VAR%limited s@$))
  :qid |quant-u-9|)))
; ---------- FUNCTION ANOTHER_GLOBAL_VAR----------
(declare-fun result@9@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@12@00 $Snap)
(assert (= $t@12@00 ($Snap.combine ($Snap.first $t@12@00) ($Snap.second $t@12@00))))
(assert (= ($Snap.first $t@12@00) $Snap.unit))
; [eval] issubtype(typeof(result), bool())
; [eval] typeof(result)
; [eval] bool()
(assert (issubtype<Bool> (typeof<PyType> result@9@00) (as bool<PyType>  PyType)))
(assert (= ($Snap.second $t@12@00) $Snap.unit))
; [eval] result == __prim__bool___box__(true)
; [eval] __prim__bool___box__(true)
(push) ; 2
(assert (__prim__bool___box__%precondition $Snap.unit true))
(pop) ; 2
; Joined path conditions
(assert (__prim__bool___box__%precondition $Snap.unit true))
(assert (= result@9@00 (__prim__bool___box__ $Snap.unit true)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] __prim__bool___box__(true)
(set-option :timeout 0)
(push) ; 2
(assert (__prim__bool___box__%precondition $Snap.unit true))
(pop) ; 2
; Joined path conditions
(assert (__prim__bool___box__%precondition $Snap.unit true))
(assert (= result@9@00 (__prim__bool___box__ $Snap.unit true)))
; [eval] issubtype(typeof(result), bool())
; [eval] typeof(result)
; [eval] bool()
(push) ; 2
(assert (not (issubtype<Bool> (typeof<PyType> result@9@00) (as bool<PyType>  PyType))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] issubtype(typeof(result), bool())
; [eval] typeof(result)
; [eval] bool()
(set-option :timeout 0)
(push) ; 2
(assert (not (issubtype<Bool> (typeof<PyType> result@9@00) (as bool<PyType>  PyType))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] issubtype(typeof(result), bool())
; [eval] typeof(result)
; [eval] bool()
(set-option :timeout 0)
(push) ; 2
(assert (not (issubtype<Bool> (typeof<PyType> result@9@00) (as bool<PyType>  PyType))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] issubtype(typeof(result), bool())
; [eval] typeof(result)
; [eval] bool()
(set-option :timeout 0)
(push) ; 2
(assert (not (issubtype<Bool> (typeof<PyType> result@9@00) (as bool<PyType>  PyType))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- FUNCTION SO_MANY_GLOBAL_VARS----------
(declare-fun result@10@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@13@00 $Snap)
(assert (= $t@13@00 ($Snap.combine ($Snap.first $t@13@00) ($Snap.second $t@13@00))))
(assert (= ($Snap.first $t@13@00) $Snap.unit))
; [eval] issubtype(typeof(result), int())
; [eval] typeof(result)
; [eval] int()
(assert (issubtype<Bool> (typeof<PyType> result@10@00) (as int<PyType>  PyType)))
(assert (= ($Snap.second $t@13@00) $Snap.unit))
; [eval] result == (bool___unbox__(ANOTHER_GLOBAL_VAR()) ? OTHER_GLOBAL_VAR() : __prim__int___box__(44))
; [eval] (bool___unbox__(ANOTHER_GLOBAL_VAR()) ? OTHER_GLOBAL_VAR() : __prim__int___box__(44))
; [eval] bool___unbox__(ANOTHER_GLOBAL_VAR())
; [eval] ANOTHER_GLOBAL_VAR()
(push) ; 2
(assert (ANOTHER_GLOBAL_VAR%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (ANOTHER_GLOBAL_VAR%precondition $Snap.unit))
(push) ; 2
(assert (bool___unbox__%precondition $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
(pop) ; 2
; Joined path conditions
(assert (bool___unbox__%precondition $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | bool___unbox__(_, ANOTHER_GLOBAL_VAR(_)) | live]
; [else-branch: 1 | !(bool___unbox__(_, ANOTHER_GLOBAL_VAR(_))) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | bool___unbox__(_, ANOTHER_GLOBAL_VAR(_))]
(assert (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
; [eval] OTHER_GLOBAL_VAR()
(push) ; 4
(assert (OTHER_GLOBAL_VAR%precondition $Snap.unit))
(pop) ; 4
; Joined path conditions
(assert (OTHER_GLOBAL_VAR%precondition $Snap.unit))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit))
  (and
    (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit))
    (OTHER_GLOBAL_VAR%precondition $Snap.unit))))
(assert (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
(assert (= result@10@00 (OTHER_GLOBAL_VAR $Snap.unit)))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (SO_MANY_GLOBAL_VARS%limited s@$) (SO_MANY_GLOBAL_VARS s@$))
  :pattern ((SO_MANY_GLOBAL_VARS s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  (as SO_MANY_GLOBAL_VARS%stateless  Bool)
  :pattern ((SO_MANY_GLOBAL_VARS%limited s@$))
  :qid |quant-u-13|)))
(declare-const $unresolved@14@00 $Snap)
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
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (bool___unbox__(ANOTHER_GLOBAL_VAR()) ? OTHER_GLOBAL_VAR() : __prim__int___box__(44))
; [eval] bool___unbox__(ANOTHER_GLOBAL_VAR())
; [eval] ANOTHER_GLOBAL_VAR()
(set-option :timeout 0)
(push) ; 2
(assert (ANOTHER_GLOBAL_VAR%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (ANOTHER_GLOBAL_VAR%precondition $Snap.unit))
(push) ; 2
(assert (bool___unbox__%precondition $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
(pop) ; 2
; Joined path conditions
(assert (bool___unbox__%precondition $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | bool___unbox__(_, ANOTHER_GLOBAL_VAR(_)) | live]
; [else-branch: 2 | !(bool___unbox__(_, ANOTHER_GLOBAL_VAR(_))) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | bool___unbox__(_, ANOTHER_GLOBAL_VAR(_))]
(assert (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
; [eval] OTHER_GLOBAL_VAR()
(push) ; 4
(assert (OTHER_GLOBAL_VAR%precondition $Snap.unit))
(pop) ; 4
; Joined path conditions
(assert (OTHER_GLOBAL_VAR%precondition $Snap.unit))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit))
  (and
    (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit))
    (OTHER_GLOBAL_VAR%precondition $Snap.unit))))
(assert (bool___unbox__ $Snap.unit (ANOTHER_GLOBAL_VAR $Snap.unit)))
(assert (= result@10@00 (OTHER_GLOBAL_VAR $Snap.unit)))
; [eval] issubtype(typeof(result), int())
; [eval] typeof(result)
; [eval] int()
(push) ; 2
(assert (not (issubtype<Bool> (typeof<PyType> result@10@00) (as int<PyType>  PyType))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] issubtype(typeof(result), int())
; [eval] typeof(result)
; [eval] int()
(set-option :timeout 0)
(push) ; 2
(assert (not (issubtype<Bool> (typeof<PyType> result@10@00) (as int<PyType>  PyType))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] issubtype(typeof(result), int())
; [eval] typeof(result)
; [eval] int()
(set-option :timeout 0)
(push) ; 2
(assert (not (issubtype<Bool> (typeof<PyType> result@10@00) (as int<PyType>  PyType))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] issubtype(typeof(result), int())
; [eval] typeof(result)
; [eval] int()
(set-option :timeout 0)
(push) ; 2
(assert (not (issubtype<Bool> (typeof<PyType> result@10@00) (as int<PyType>  PyType))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
