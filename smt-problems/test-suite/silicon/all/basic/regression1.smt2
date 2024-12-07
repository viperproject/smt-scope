(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:51
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/regression1.vpr
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
(declare-sort PermissionHelper 0)
(declare-sort UnitHelper 0)
(declare-sort Boxing 0)
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
(declare-fun $SortWrappers.PermissionHelperTo$Snap (PermissionHelper) $Snap)
(declare-fun $SortWrappers.$SnapToPermissionHelper ($Snap) PermissionHelper)
(assert (forall ((x PermissionHelper)) (!
    (= x ($SortWrappers.$SnapToPermissionHelper($SortWrappers.PermissionHelperTo$Snap x)))
    :pattern (($SortWrappers.PermissionHelperTo$Snap x))
    :qid |$Snap.$SnapToPermissionHelperTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PermissionHelperTo$Snap($SortWrappers.$SnapToPermissionHelper x)))
    :pattern (($SortWrappers.$SnapToPermissionHelper x))
    :qid |$Snap.PermissionHelperTo$SnapToPermissionHelper|
    )))
(declare-fun $SortWrappers.UnitHelperTo$Snap (UnitHelper) $Snap)
(declare-fun $SortWrappers.$SnapToUnitHelper ($Snap) UnitHelper)
(assert (forall ((x UnitHelper)) (!
    (= x ($SortWrappers.$SnapToUnitHelper($SortWrappers.UnitHelperTo$Snap x)))
    :pattern (($SortWrappers.UnitHelperTo$Snap x))
    :qid |$Snap.$SnapToUnitHelperTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.UnitHelperTo$Snap($SortWrappers.$SnapToUnitHelper x)))
    :pattern (($SortWrappers.$SnapToUnitHelper x))
    :qid |$Snap.UnitHelperTo$SnapToUnitHelper|
    )))
(declare-fun $SortWrappers.BoxingTo$Snap (Boxing) $Snap)
(declare-fun $SortWrappers.$SnapToBoxing ($Snap) Boxing)
(assert (forall ((x Boxing)) (!
    (= x ($SortWrappers.$SnapToBoxing($SortWrappers.BoxingTo$Snap x)))
    :pattern (($SortWrappers.BoxingTo$Snap x))
    :qid |$Snap.$SnapToBoxingTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BoxingTo$Snap($SortWrappers.$SnapToBoxing x)))
    :pattern (($SortWrappers.$SnapToBoxing x))
    :qid |$Snap.BoxingTo$SnapToBoxing|
    )))
; ////////// Symbols
(declare-const globalRdPerm<Perm> $Perm)
(declare-const unit<Ref> $Ref)
(declare-fun int2Ref<Ref> (Int) $Ref)
(declare-fun ref2Int<Int> ($Ref) Int)
(declare-fun bool2Ref<Ref> (Bool) $Ref)
(declare-fun ref2Bool<Bool> ($Ref) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (> (as globalRdPerm<Perm>  $Perm) $Perm.No))
(assert (< (as globalRdPerm<Perm>  $Perm) $Perm.Write))
(assert (forall ((x Int)) (!
  (= (ref2Int<Int> (int2Ref<Ref> x)) x)
  :pattern ((ref2Int<Int> (int2Ref<Ref> x)))
  :qid |prog.intInverse|)))
(assert (forall ((x Bool)) (!
  (= (ref2Bool<Bool> (bool2Ref<Ref> x)) x)
  :pattern ((ref2Bool<Bool> (bool2Ref<Ref> x)))
  :qid |prog.boolInverse|)))
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
; ---------- Simple_lessinitgreater ----------
(declare-const rd@0@01 $Perm)
(declare-const this@1@01 $Ref)
(declare-const vresult@2@01 $Ref)
(declare-const rd@3@01 $Perm)
(declare-const this@4@01 $Ref)
(declare-const vresult@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] rd > none
(assert (> rd@3@01 $Perm.No))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@4@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; vresult := unit()
; [eval] unit()
(declare-const vresult@7@01 $Ref)
(assert (= vresult@7@01 (as unit<Ref>  $Ref)))
(pop) ; 2
(pop) ; 1
; ---------- Simple_test2 ----------
(declare-const rd@8@01 $Perm)
(declare-const this@9@01 $Ref)
(declare-const x@10@01 Int)
(declare-const vresult@11@01 Int)
(declare-const rd@12@01 $Perm)
(declare-const this@13@01 $Ref)
(declare-const x@14@01 Int)
(declare-const vresult@15@01 Int)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] rd > none
(assert (> rd@12@01 $Perm.No))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
; [eval] this != null
(assert (not (= this@13@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@16@01)) $Snap.unit))
; [eval] x > 0
(assert (> x@14@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] vresult == x * x
; [eval] x * x
(assert (= vresult@15@01 (* x@14@01 x@14@01)))
(pop) ; 2
(push) ; 2
; [exec]
; vresult := x
; [eval] vresult == x * x
; [eval] x * x
(push) ; 3
(assert (not (= x@14@01 (* x@14@01 x@14@01))))
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
; [eval] vresult == x * x
; [eval] x * x
(set-option :timeout 0)
(push) ; 3
(assert (not (= x@14@01 (* x@14@01 x@14@01))))
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
; [eval] vresult == x * x
; [eval] x * x
(set-option :timeout 0)
(push) ; 3
(assert (not (= x@14@01 (* x@14@01 x@14@01))))
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
; [eval] vresult == x * x
; [eval] x * x
(set-option :timeout 0)
(push) ; 3
(assert (not (= x@14@01 (* x@14@01 x@14@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
