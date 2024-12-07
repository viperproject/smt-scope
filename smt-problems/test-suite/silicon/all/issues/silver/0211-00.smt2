(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:03:10
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0211.vpr
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
(declare-fun f ($Snap $Perm) $Perm)
(declare-fun f%limited ($Snap $Perm) $Perm)
(declare-fun f%stateless ($Perm) Bool)
(declare-fun f%precondition ($Snap $Perm) Bool)
(declare-fun fi ($Snap Int) Int)
(declare-fun fi%limited ($Snap Int) Int)
(declare-fun fi%stateless (Int) Bool)
(declare-fun fi%precondition ($Snap Int) Bool)
(declare-fun g ($Snap) $Perm)
(declare-fun g%limited ($Snap) $Perm)
(declare-const g%stateless Bool)
(declare-fun g%precondition ($Snap) Bool)
(declare-fun gi ($Snap) Int)
(declare-fun gi%limited ($Snap) Int)
(declare-const gi%stateless Bool)
(declare-fun gi%precondition ($Snap) Bool)
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
(assert (forall ((s@$ $Snap) (p@0@00 $Perm)) (!
  (= (f%limited s@$ p@0@00) (f s@$ p@0@00))
  :pattern ((f s@$ p@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Perm)) (!
  (f%stateless p@0@00)
  :pattern ((f%limited s@$ p@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Perm)) (!
  (=> (f%precondition s@$ p@0@00) (= (f s@$ p@0@00) (/ (to_real 1) (to_real 2))))
  :pattern ((f s@$ p@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Perm)) (!
  true
  :pattern ((f s@$ p@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (p@2@00 Int)) (!
  (= (fi%limited s@$ p@2@00) (fi s@$ p@2@00))
  :pattern ((fi s@$ p@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (p@2@00 Int)) (!
  (fi%stateless p@2@00)
  :pattern ((fi%limited s@$ p@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (p@2@00 Int)) (!
  (=> (fi%precondition s@$ p@2@00) (= (fi s@$ p@2@00) (div 1 3)))
  :pattern ((fi s@$ p@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (p@2@00 Int)) (!
  true
  :pattern ((fi s@$ p@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap)) (!
  (= (g%limited s@$) (g s@$))
  :pattern ((g s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as g%stateless  Bool)
  :pattern ((g%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap)) (!
  (=>
    (g%precondition s@$)
    (= (g s@$) (f $Snap.unit (/ (to_real 1) (to_real 4)))))
  :pattern ((g s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  (=>
    (g%precondition s@$)
    (f%precondition $Snap.unit (/ (to_real 1) (to_real 4))))
  :pattern ((g s@$))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap)) (!
  (= (gi%limited s@$) (gi s@$))
  :pattern ((gi s@$))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap)) (!
  (as gi%stateless  Bool)
  :pattern ((gi%limited s@$))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap)) (!
  (=> (gi%precondition s@$) (= (gi s@$) (fi $Snap.unit (div 1 5))))
  :pattern ((gi s@$))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap)) (!
  (=> (gi%precondition s@$) (fi%precondition $Snap.unit (div 1 5)))
  :pattern ((gi s@$))
  :qid |quant-u-15|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m ----------
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
(assert (not (= r@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var p1: Perm
(declare-const p1@3@01 $Perm)
; [exec]
; var p2: Perm
(declare-const p2@4@01 $Perm)
; [exec]
; var i1: Int
(declare-const i1@5@01 Int)
; [exec]
; var i2: Int
(declare-const i2@6@01 Int)
; [exec]
; var i3: Int
(declare-const i3@7@01 Int)
; [exec]
; p1 := 1 / 7
(declare-const p1@8@01 $Perm)
(assert (= p1@8@01 (/ (to_real 1) (to_real 7))))
; [exec]
; p2 := 1 / 8 / 3
; [eval] 1 / 8
(declare-const p2@9@01 $Perm)
(assert (= p2@9@01 (/ (to_real (div 1 8)) (to_real 3))))
; [exec]
; i1 := 4 / 3
; [eval] 4 / 3
(declare-const i1@10@01 Int)
(assert (= i1@10@01 (div 4 3)))
; [exec]
; i2 := i1 / 1
; [eval] i1 / 1
(declare-const i2@11@01 Int)
(assert (= i2@11@01 (div i1@10@01 1)))
; [exec]
; i3 := 7 / 2 / (2 / 1)
; [eval] 7 / 2 / (2 / 1)
; [eval] 7 / 2
; [eval] 2 / 1
(push) ; 3
(assert (not (not (= (div 2 1) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const i3@12@01 Int)
(assert (= i3@12@01 (div (div 7 2) (div 2 1))))
; [exec]
; assert 1 / 2 * (2 / 1) == 0 / 1
; [eval] 1 / 2 * (2 / 1) == 0 / 1
; [eval] 1 / 2 * (2 / 1)
(push) ; 3
(assert (not false))
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
; [eval] 1 / 2 * (2 / 1) == 0 / 1
; [eval] 1 / 2 * (2 / 1)
(set-option :timeout 0)
(push) ; 3
(assert (not false))
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
; [eval] 1 / 2 * (2 / 1) == 0 / 1
; [eval] 1 / 2 * (2 / 1)
(set-option :timeout 0)
(push) ; 3
(assert (not false))
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
; [eval] 1 / 2 * (2 / 1) == 0 / 1
; [eval] 1 / 2 * (2 / 1)
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
