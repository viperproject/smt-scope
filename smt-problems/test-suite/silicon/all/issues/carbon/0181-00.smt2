(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:10
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0181.vpr
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
(declare-fun req ($Snap $Ref) Bool)
(declare-fun req%limited ($Snap $Ref) Bool)
(declare-fun req%stateless ($Ref) Bool)
(declare-fun req%precondition ($Snap $Ref) Bool)
(declare-fun actual ($Snap $Ref) Int)
(declare-fun actual%limited ($Snap $Ref) Int)
(declare-fun actual%stateless ($Ref) Bool)
(declare-fun actual%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun outer%trigger ($Snap $Ref) Bool)
(declare-fun inner%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (req%limited s@$ r@0@00) (req s@$ r@0@00))
  :pattern ((req s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (req%stateless r@0@00)
  :pattern ((req%limited s@$ r@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (actual%limited s@$ r@2@00) (actual s@$ r@2@00))
  :pattern ((actual s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (actual%stateless r@2@00)
  :pattern ((actual%limited s@$ r@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m ----------
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] (unfolding acc(outer(r), 1 / 2) in req(r))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (outer%trigger ($Snap.first $t@2@01) r@1@01))
; [eval] req(r)
(set-option :timeout 0)
(push) ; 3
(assert (req%precondition $Snap.unit r@1@01))
(pop) ; 3
; Joined path conditions
(assert (req%precondition $Snap.unit r@1@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (outer%trigger ($Snap.first $t@2@01) r@1@01)
  (req%precondition $Snap.unit r@1@01)))
(assert (req $Snap.unit r@1@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@3@01 Int)
; [exec]
; unfold acc(outer(r), 1 / 2)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; i := actual(r)
; [eval] actual(r)
(set-option :timeout 0)
(push) ; 3
; [eval] req(r)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (actual%precondition $Snap.unit r@1@01))
(pop) ; 3
; Joined path conditions
(assert (actual%precondition $Snap.unit r@1@01))
(declare-const i@4@01 Int)
(assert (= i@4@01 (actual $Snap.unit r@1@01)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const r@5@01 $Ref)
(declare-const r@6@01 $Ref)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (unfolding acc(outer(r), write) in req(r))
(push) ; 2
(assert (outer%trigger ($Snap.first $t@7@01) r@6@01))
; [eval] req(r)
(push) ; 3
(assert (req%precondition $Snap.unit r@6@01))
(pop) ; 3
; Joined path conditions
(assert (req%precondition $Snap.unit r@6@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (outer%trigger ($Snap.first $t@7@01) r@6@01)
  (req%precondition $Snap.unit r@6@01)))
(assert (req $Snap.unit r@6@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@8@01 Int)
; [exec]
; unfold acc(outer(r), 1 / 2)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; i := actual(r)
; [eval] actual(r)
(set-option :timeout 0)
(push) ; 3
; [eval] req(r)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (actual%precondition $Snap.unit r@6@01))
(pop) ; 3
; Joined path conditions
(assert (actual%precondition $Snap.unit r@6@01))
(declare-const i@9@01 Int)
(assert (= i@9@01 (actual $Snap.unit r@6@01)))
(pop) ; 2
(pop) ; 1
