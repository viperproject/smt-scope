(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:24
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/heap.vpr
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
; ---------- t0 ----------
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
; var c: Ref
(declare-const c@0@01 $Ref)
; [exec]
; c := new(f)
(declare-const c@1@01 $Ref)
(assert (not (= c@1@01 $Ref.null)))
(declare-const f@2@01 $Ref)
(assert (not (= c@1@01 c@0@01)))
; [exec]
; assert c.f != c
; [eval] c.f != c
(push) ; 3
(assert (not (not (= f@2@01 c@1@01))))
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
; [eval] c.f != c
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= f@2@01 c@1@01))))
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
; [eval] c.f != c
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= f@2@01 c@1@01))))
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
; [eval] c.f != c
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= f@2@01 c@1@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- t1 ----------
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
; var a: Ref
(declare-const a@3@01 $Ref)
; [exec]
; var c: Ref
(declare-const c@4@01 $Ref)
; [exec]
; inhale acc(a.f, write)
(declare-const $t@5@01 $Ref)
(assert (not (= a@3@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; c := new(f)
(declare-const c@6@01 $Ref)
(assert (not (= c@6@01 $Ref.null)))
(declare-const f@7@01 $Ref)
(assert (not (= c@6@01 c@4@01)))
(assert (not (= c@6@01 $t@5@01)))
(assert (not (= c@6@01 a@3@01)))
; [exec]
; inhale a != null
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] a != null
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; set_f(a, c)
; [eval] monitor != null
; [eval] value != null
(declare-const $t@9@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c@6@01 a@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert a.f != c
; [eval] a.f != c
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= $t@9@01 c@6@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@3@01 c@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@7@01 $t@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $t@9@01 f@7@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c@6@01 a@3@01)) (not (= a@3@01 c@6@01))))
; [eval] a.f != c
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= $t@9@01 c@6@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@3@01 c@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@7@01 $t@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $t@9@01 f@7@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c@6@01 a@3@01)) (not (= a@3@01 c@6@01))))
; [eval] a.f != c
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= $t@9@01 c@6@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@3@01 c@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@7@01 $t@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $t@9@01 f@7@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= c@6@01 a@3@01)) (not (= a@3@01 c@6@01))))
; [eval] a.f != c
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= $t@9@01 c@6@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- set_f ----------
(declare-const monitor@10@01 $Ref)
(declare-const value@11@01 $Ref)
(declare-const monitor@12@01 $Ref)
(declare-const value@13@01 $Ref)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (not (= monitor@12@01 $Ref.null)))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] monitor != null
(assert (= ($Snap.second ($Snap.second $t@14@01)) $Snap.unit))
; [eval] value != null
(assert (not (= value@13@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@15@01 $Ref)
(pop) ; 2
(push) ; 2
; [exec]
; monitor.f := value
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(declare-const r@16@01 $Ref)
(declare-const r@17@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] r != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= r@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | r@17@01 != Null | live]
; [else-branch: 0 | r@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | r@17@01 != Null]
(assert (not (= r@17@01 $Ref.null)))
; [exec]
; assert perm(r.f) == none
; [eval] perm(r.f) == none
; [eval] perm(r.f)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | r@17@01 == Null]
(assert (= r@17@01 $Ref.null))
(pop) ; 3
; [eval] !(r != null)
; [eval] r != null
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= r@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | r@17@01 == Null | live]
; [else-branch: 1 | r@17@01 != Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | r@17@01 == Null]
(assert (= r@17@01 $Ref.null))
; [exec]
; assert perm(r.f) == none
; [eval] perm(r.f) == none
; [eval] perm(r.f)
(pop) ; 3
(push) ; 3
; [else-branch: 1 | r@17@01 != Null]
(assert (not (= r@17@01 $Ref.null)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t3 ----------
(declare-const r@18@01 $Ref)
(declare-const res@19@01 $Ref)
(declare-const r@20@01 $Ref)
(declare-const res@21@01 $Ref)
(push) ; 1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (= ($Snap.first $t@22@01) $Snap.unit))
; [eval] r != null
(assert (not (= r@20@01 $Ref.null)))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@22@01))) $Snap.unit))
; [eval] r.f != null
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r@20@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; res := r.f.f
(declare-const res@23@01 $Ref)
(assert (=
  res@23@01
  ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(pop) ; 2
(pop) ; 1
