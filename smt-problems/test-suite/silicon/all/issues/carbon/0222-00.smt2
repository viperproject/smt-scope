(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:58
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0222.vpr
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
(declare-fun foo ($Snap $Ref) Int)
(declare-fun foo%limited ($Snap $Ref) Int)
(declare-fun foo%stateless ($Ref) Bool)
(declare-fun foo%precondition ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (foo%limited s@$ x@0@00) (foo s@$ x@0@00))
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (foo%stateless x@0@00)
  :pattern ((foo%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (foo%precondition s@$ x@0@00)
    (= (foo s@$ x@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
(declare-const x@0@01 $Ref)
(declare-const z@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const z@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= x@2@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@2@01 z@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@3@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.val := 4
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@3@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert foo(x) == 4
; [eval] foo(x) == 4
; [eval] foo(x)
(set-option :timeout 0)
(push) ; 3
(assert (foo%precondition ($SortWrappers.IntTo$Snap 4) x@2@01))
(pop) ; 3
; Joined path conditions
(assert (foo%precondition ($SortWrappers.IntTo$Snap 4) x@2@01))
(push) ; 3
(assert (not (= (foo ($SortWrappers.IntTo$Snap 4) x@2@01) 4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (foo ($SortWrappers.IntTo$Snap 4) x@2@01) 4))
; [exec]
; z.val := 3
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@01 z@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert foo(x) == 4
; [eval] foo(x) == 4
; [eval] foo(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [exec]
; x.val := 5
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@3@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert foo(x) == 42
; [eval] foo(x) == 42
; [eval] foo(x)
(set-option :timeout 0)
(push) ; 3
(assert (foo%precondition ($SortWrappers.IntTo$Snap 5) x@2@01))
(pop) ; 3
; Joined path conditions
(assert (foo%precondition ($SortWrappers.IntTo$Snap 5) x@2@01))
(push) ; 3
(assert (not (= (foo ($SortWrappers.IntTo$Snap 5) x@2@01) 42)))
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
(assert (not (= x@2@01 z@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= z@3@01 x@2@01)) (not (= x@2@01 z@3@01))))
(assert (and (not (= z@3@01 x@2@01)) (not (= x@2@01 z@3@01))))
; [eval] foo(x) == 42
; [eval] foo(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (foo ($SortWrappers.IntTo$Snap 5) x@2@01) 42)))
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
(assert (not (= x@2@01 z@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= z@3@01 x@2@01)) (not (= x@2@01 z@3@01))))
(assert (and (not (= z@3@01 x@2@01)) (not (= x@2@01 z@3@01))))
; [eval] foo(x) == 42
; [eval] foo(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (foo ($SortWrappers.IntTo$Snap 5) x@2@01) 42)))
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
(assert (not (= x@2@01 z@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= z@3@01 x@2@01)) (not (= x@2@01 z@3@01))))
(assert (and (not (= z@3@01 x@2@01)) (not (= x@2@01 z@3@01))))
; [eval] foo(x) == 42
; [eval] foo(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (foo ($SortWrappers.IntTo$Snap 5) x@2@01) 42)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
