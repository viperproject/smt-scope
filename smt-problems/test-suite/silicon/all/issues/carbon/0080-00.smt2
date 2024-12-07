(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:47:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0080.vpr
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
(declare-fun readValid ($Snap $Ref) Int)
(declare-fun readValid%limited ($Snap $Ref) Int)
(declare-fun readValid%stateless ($Ref) Bool)
(declare-fun readValid%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (= (readValid%limited s@$ self@0@00) (readValid s@$ self@0@00))
  :pattern ((readValid s@$ self@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (readValid%stateless self@0@00)
  :pattern ((readValid%limited s@$ self@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (=>
    (readValid%precondition s@$ self@0@00)
    (= (readValid s@$ self@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((readValid s@$ self@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  true
  :pattern ((readValid s@$ self@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- read ----------
(declare-const a@0@01 $Ref)
(declare-const a@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; assert readValid(a) >= readValid(a)
; [eval] readValid(a) >= readValid(a)
; [eval] readValid(a)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (readValid%precondition ($SortWrappers.IntTo$Snap $t@2@01) a@1@01))
(pop) ; 3
; Joined path conditions
(assert (readValid%precondition ($SortWrappers.IntTo$Snap $t@2@01) a@1@01))
; [eval] readValid(a)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
; [exec]
; assert perm(valid(a)) == write
; [eval] perm(valid(a)) == write
; [eval] perm(valid(a))
; [exec]
; assert a != null ==> perm(a.f) == none
; [eval] a != null ==> perm(a.f) == none
; [eval] a != null
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@1@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= a@1@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | a@1@01 != Null | live]
; [else-branch: 0 | a@1@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | a@1@01 != Null]
(assert (not (= a@1@01 $Ref.null)))
; [eval] perm(a.f) == none
; [eval] perm(a.f)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | a@1@01 == Null]
(assert (= a@1@01 $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= a@1@01 $Ref.null) (not (= a@1@01 $Ref.null))))
; [exec]
; unfold acc(valid(a), 1 / 3)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= a@1@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($SortWrappers.IntTo$Snap $t@2@01) a@1@01))
; [exec]
; assert perm(valid(a)) == 2 / 3
; [eval] perm(valid(a)) == 2 / 3
; [eval] perm(valid(a))
; [exec]
; assert perm(a.f) == 1 / 3
; [eval] perm(a.f) == 1 / 3
; [eval] perm(a.f)
; [exec]
; assert a.f == readValid(a)
; [eval] a.f == readValid(a)
; [eval] readValid(a)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (= $t@2@01 (readValid ($SortWrappers.IntTo$Snap $t@2@01) a@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= $t@2@01 (readValid ($SortWrappers.IntTo$Snap $t@2@01) a@1@01)))
; [exec]
; unfold acc(valid(a), 2 / 3)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert perm(valid(a)) == none
; [eval] perm(valid(a)) == none
; [eval] perm(valid(a))
; [exec]
; assert perm(a.f) == write
; [eval] perm(a.f) == write
; [eval] perm(a.f)
; [exec]
; a.f := a.f + 1
; [eval] a.f + 1
(declare-const f@4@01 Int)
(assert (= f@4@01 (+ $t@2@01 1)))
; [exec]
; assert a.f == old(readValid(a)) + 1
; [eval] a.f == old(readValid(a)) + 1
; [eval] old(readValid(a)) + 1
; [eval] old(readValid(a))
; [eval] readValid(a)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (= f@4@01 (+ (readValid ($SortWrappers.IntTo$Snap $t@2@01) a@1@01) 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= f@4@01 (+ (readValid ($SortWrappers.IntTo$Snap $t@2@01) a@1@01) 1)))
; [exec]
; fold acc(valid(a), 1 / 3)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (valid%trigger ($SortWrappers.IntTo$Snap f@4@01) a@1@01))
; [exec]
; assert perm(valid(a)) == 1 / 3
; [eval] perm(valid(a)) == 1 / 3
; [eval] perm(valid(a))
; [exec]
; assert perm(a.f) == 2 / 3
; [eval] perm(a.f) == 2 / 3
; [eval] perm(a.f)
; [exec]
; assert a.f == readValid(a)
; [eval] a.f == readValid(a)
; [eval] readValid(a)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (readValid%precondition ($SortWrappers.IntTo$Snap f@4@01) a@1@01))
(pop) ; 3
; Joined path conditions
(assert (readValid%precondition ($SortWrappers.IntTo$Snap f@4@01) a@1@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (= f@4@01 (readValid ($SortWrappers.IntTo$Snap f@4@01) a@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= f@4@01 (readValid ($SortWrappers.IntTo$Snap f@4@01) a@1@01)))
; [exec]
; assert readValid(a) == old(readValid(a)) + 1
; [eval] readValid(a) == old(readValid(a)) + 1
; [eval] readValid(a)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
; [eval] old(readValid(a)) + 1
; [eval] old(readValid(a))
; [eval] readValid(a)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (readValid ($SortWrappers.IntTo$Snap f@4@01) a@1@01)
  (+ (readValid ($SortWrappers.IntTo$Snap $t@2@01) a@1@01) 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (readValid ($SortWrappers.IntTo$Snap f@4@01) a@1@01)
  (+ (readValid ($SortWrappers.IntTo$Snap $t@2@01) a@1@01) 1)))
; [exec]
; fold acc(valid(a), 2 / 3)
; [exec]
; assert perm(valid(a)) == write
; [eval] perm(valid(a)) == write
; [eval] perm(valid(a))
; [exec]
; assert perm(a.f) == none
; [eval] perm(a.f) == none
; [eval] perm(a.f)
; [exec]
; assert readValid(a) == old(readValid(a)) + 1
; [eval] readValid(a) == old(readValid(a)) + 1
; [eval] readValid(a)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
; [eval] old(readValid(a)) + 1
; [eval] old(readValid(a))
; [eval] readValid(a)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
; [exec]
; assert old(perm(a.f)) == none
; [eval] old(perm(a.f)) == none
; [eval] old(perm(a.f))
; [eval] perm(a.f)
; [exec]
; assert a.f == readValid(a)
; [eval] a.f == readValid(a)
(set-option :timeout 0)
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a.f == readValid(a)
(set-option :timeout 0)
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a.f == readValid(a)
(set-option :timeout 0)
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a.f == readValid(a)
(set-option :timeout 0)
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
