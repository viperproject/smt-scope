(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:22
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0262.vpr
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
(declare-sort Functions 0)
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
(declare-fun $SortWrappers.FunctionsTo$Snap (Functions) $Snap)
(declare-fun $SortWrappers.$SnapToFunctions ($Snap) Functions)
(assert (forall ((x Functions)) (!
    (= x ($SortWrappers.$SnapToFunctions($SortWrappers.FunctionsTo$Snap x)))
    :pattern (($SortWrappers.FunctionsTo$Snap x))
    :qid |$Snap.$SnapToFunctionsTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FunctionsTo$Snap($SortWrappers.$SnapToFunctions x)))
    :pattern (($SortWrappers.$SnapToFunctions x))
    :qid |$Snap.FunctionsTo$SnapToFunctions|
    )))
; ////////// Symbols
(declare-fun __learn_trigger__<Bool> (Bool) Bool)
(declare-fun exists_path<Bool> ($Ref $Ref) Bool)
(declare-fun foo<Bool> ($Ref $Ref) Bool)
; Declaring symbols related to program functions (from program analysis)
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- link_DAG_next ----------
(declare-const from@0@01 $Ref)
(declare-const from@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] from != null ==> (forall x: Ref, y: Ref :: { exists_path(x, y) } __learn_trigger__(foo(from, y)))
; [eval] from != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= from@1@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= from@1@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | from@1@01 != Null | live]
; [else-branch: 0 | from@1@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | from@1@01 != Null]
(assert (not (= from@1@01 $Ref.null)))
; [eval] (forall x: Ref, y: Ref :: { exists_path(x, y) } __learn_trigger__(foo(from, y)))
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(push) ; 5
; [eval] __learn_trigger__(foo(from, y))
; [eval] foo(from, y)
; [eval] exists_path(x, y)
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | from@1@01 == Null]
(assert (= from@1@01 $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= from@1@01 $Ref.null) (not (= from@1@01 $Ref.null))))
(assert (=>
  (not (= from@1@01 $Ref.null))
  (forall ((x@3@01 $Ref) (y@4@01 $Ref)) (!
    (__learn_trigger__<Bool> (foo<Bool> from@1@01 y@4@01))
    :pattern ((exists_path<Bool> x@3@01 y@4@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0262.vpr@8@31@8@106|))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- append ----------
(declare-const from@5@01 $Ref)
(declare-const from@6@01 $Ref)
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
; var y: Ref
(declare-const y@7@01 $Ref)
; [exec]
; inhale from != null
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] from != null
(assert (not (= from@6@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; link_DAG_next(from)
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] from != null ==> (forall x: Ref, y: Ref :: { exists_path(x, y) } __learn_trigger__(foo(from, y)))
; [eval] from != null
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= from@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | from@6@01 != Null | live]
; [else-branch: 1 | from@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | from@6@01 != Null]
; [eval] (forall x: Ref, y: Ref :: { exists_path(x, y) } __learn_trigger__(foo(from, y)))
(declare-const x@10@01 $Ref)
(declare-const y@11@01 $Ref)
(push) ; 5
; [eval] __learn_trigger__(foo(from, y))
; [eval] foo(from, y)
; [eval] exists_path(x, y)
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not (= from@6@01 $Ref.null))
  (forall ((x@10@01 $Ref) (y@11@01 $Ref)) (!
    (__learn_trigger__<Bool> (foo<Bool> from@6@01 y@11@01))
    :pattern ((exists_path<Bool> x@10@01 y@11@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0262.vpr@8@31@8@106|))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert exists_path(y, y) ==> __learn_trigger__(foo(from, y))
; [eval] exists_path(y, y) ==> __learn_trigger__(foo(from, y))
; [eval] exists_path(y, y)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (exists_path<Bool> y@7@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | exists_path[Bool](y@7@01, y@7@01) | live]
; [else-branch: 2 | !(exists_path[Bool](y@7@01, y@7@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | exists_path[Bool](y@7@01, y@7@01)]
(assert (exists_path<Bool> y@7@01 y@7@01))
; [eval] __learn_trigger__(foo(from, y))
; [eval] foo(from, y)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(exists_path[Bool](y@7@01, y@7@01))]
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (exists_path<Bool> y@7@01 y@7@01)) (exists_path<Bool> y@7@01 y@7@01)))
(push) ; 3
(assert (not (=>
  (exists_path<Bool> y@7@01 y@7@01)
  (__learn_trigger__<Bool> (foo<Bool> from@6@01 y@7@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (exists_path<Bool> y@7@01 y@7@01)
  (__learn_trigger__<Bool> (foo<Bool> from@6@01 y@7@01))))
; [exec]
; assert exists_path(y, y) ==> __learn_trigger__(foo(y, y))
; [eval] exists_path(y, y) ==> __learn_trigger__(foo(y, y))
; [eval] exists_path(y, y)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (exists_path<Bool> y@7@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | exists_path[Bool](y@7@01, y@7@01) | live]
; [else-branch: 3 | !(exists_path[Bool](y@7@01, y@7@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | exists_path[Bool](y@7@01, y@7@01)]
(assert (exists_path<Bool> y@7@01 y@7@01))
; [eval] __learn_trigger__(foo(y, y))
; [eval] foo(y, y)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(exists_path[Bool](y@7@01, y@7@01))]
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=>
  (exists_path<Bool> y@7@01 y@7@01)
  (__learn_trigger__<Bool> (foo<Bool> y@7@01 y@7@01)))))
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
; [eval] exists_path(y, y) ==> __learn_trigger__(foo(y, y))
; [eval] exists_path(y, y)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (exists_path<Bool> y@7@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | exists_path[Bool](y@7@01, y@7@01) | live]
; [else-branch: 4 | !(exists_path[Bool](y@7@01, y@7@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | exists_path[Bool](y@7@01, y@7@01)]
(assert (exists_path<Bool> y@7@01 y@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] __learn_trigger__(foo(y, y))
; [eval] foo(y, y)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | !(exists_path[Bool](y@7@01, y@7@01))]
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (exists_path<Bool> y@7@01 y@7@01)
  (__learn_trigger__<Bool> (foo<Bool> y@7@01 y@7@01)))))
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
; [eval] exists_path(y, y) ==> __learn_trigger__(foo(y, y))
; [eval] exists_path(y, y)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (exists_path<Bool> y@7@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | exists_path[Bool](y@7@01, y@7@01) | live]
; [else-branch: 5 | !(exists_path[Bool](y@7@01, y@7@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | exists_path[Bool](y@7@01, y@7@01)]
(assert (exists_path<Bool> y@7@01 y@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] __learn_trigger__(foo(y, y))
; [eval] foo(y, y)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | !(exists_path[Bool](y@7@01, y@7@01))]
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (exists_path<Bool> y@7@01 y@7@01)
  (__learn_trigger__<Bool> (foo<Bool> y@7@01 y@7@01)))))
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
; [eval] exists_path(y, y) ==> __learn_trigger__(foo(y, y))
; [eval] exists_path(y, y)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (exists_path<Bool> y@7@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | exists_path[Bool](y@7@01, y@7@01) | live]
; [else-branch: 6 | !(exists_path[Bool](y@7@01, y@7@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | exists_path[Bool](y@7@01, y@7@01)]
(assert (exists_path<Bool> y@7@01 y@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] __learn_trigger__(foo(y, y))
; [eval] foo(y, y)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 6 | !(exists_path[Bool](y@7@01, y@7@01))]
(assert (not (exists_path<Bool> y@7@01 y@7@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (exists_path<Bool> y@7@01 y@7@01)
  (__learn_trigger__<Bool> (foo<Bool> y@7@01 y@7@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
