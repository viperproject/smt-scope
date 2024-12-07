(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:52:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0167.vpr
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
(declare-fun f ($Snap Int) Bool)
(declare-fun f%limited ($Snap Int) Bool)
(declare-fun f%stateless (Int) Bool)
(declare-fun f%precondition ($Snap Int) Bool)
(declare-fun h ($Snap Int) Bool)
(declare-fun h%limited ($Snap Int) Bool)
(declare-fun h%stateless (Int) Bool)
(declare-fun h%precondition ($Snap Int) Bool)
(declare-fun g ($Snap Int) Bool)
(declare-fun g%limited ($Snap Int) Bool)
(declare-fun g%stateless (Int) Bool)
(declare-fun g%precondition ($Snap Int) Bool)
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
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (= (f%limited s@$ n@0@00) (f s@$ n@0@00))
  :pattern ((f s@$ n@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (f%stateless n@0@00)
  :pattern ((f%limited s@$ n@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (n@2@00 Int)) (!
  (= (h%limited s@$ n@2@00) (h s@$ n@2@00))
  :pattern ((h s@$ n@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (n@2@00 Int)) (!
  (h%stateless n@2@00)
  :pattern ((h%limited s@$ n@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (n@4@00 Int)) (!
  (= (g%limited s@$ n@4@00) (g s@$ n@4@00))
  :pattern ((g s@$ n@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (n@4@00 Int)) (!
  (g%stateless n@4@00)
  :pattern ((g%limited s@$ n@4@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const n@0@01 Int)
(declare-const n@1@01 Int)
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
; inhale (forall i: Int :: { g(i) } i > 4 ==> h(i))
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (forall i: Int :: { g(i) } i > 4 ==> h(i))
(declare-const i@3@01 Int)
(push) ; 3
; [eval] i > 4 ==> h(i)
; [eval] i > 4
(push) ; 4
; [then-branch: 0 | i@3@01 > 4 | live]
; [else-branch: 0 | !(i@3@01 > 4) | live]
(push) ; 5
; [then-branch: 0 | i@3@01 > 4]
(assert (> i@3@01 4))
; [eval] h(i)
(push) ; 6
(assert (h%precondition $Snap.unit i@3@01))
(pop) ; 6
; Joined path conditions
(assert (h%precondition $Snap.unit i@3@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(i@3@01 > 4)]
(assert (not (> i@3@01 4)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> (> i@3@01 4) (and (> i@3@01 4) (h%precondition $Snap.unit i@3@01))))
; Joined path conditions
(assert (or (not (> i@3@01 4)) (> i@3@01 4)))
; [eval] g(i)
(push) ; 4
; [eval] f(n)
(push) ; 5
(assert (f%precondition $Snap.unit i@3@01))
(pop) ; 5
; Joined path conditions
(assert (f%precondition $Snap.unit i@3@01))
(push) ; 5
(assert (not (f $Snap.unit i@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f(n)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (f $Snap.unit i@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f(n)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (f $Snap.unit i@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f(n)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (f $Snap.unit i@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int)) (!
  (and
    (=> (> i@3@01 4) (and (> i@3@01 4) (h%precondition $Snap.unit i@3@01)))
    (or (not (> i@3@01 4)) (> i@3@01 4)))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0167.vpr@12@10@12@48-aux|)))
(assert (forall ((i@3@01 Int)) (!
  (=> (> i@3@01 4) (h $Snap.unit i@3@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0167.vpr@12@10@12@48|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale f(n) && g(n)
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] f(n)
(set-option :timeout 0)
(push) ; 3
(assert (f%precondition $Snap.unit n@1@01))
(pop) ; 3
; Joined path conditions
(assert (f%precondition $Snap.unit n@1@01))
(assert (f $Snap.unit n@1@01))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] g(n)
(push) ; 3
; [eval] f(n)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (g%precondition $Snap.unit n@1@01))
(pop) ; 3
; Joined path conditions
(assert (g%precondition $Snap.unit n@1@01))
(assert (g $Snap.unit n@1@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale n == 5
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] n == 5
(assert (= n@1@01 5))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert h(n)
; [eval] h(n)
(set-option :timeout 0)
(push) ; 3
(assert (h%precondition $Snap.unit n@1@01))
(pop) ; 3
; Joined path conditions
(assert (h%precondition $Snap.unit n@1@01))
(push) ; 3
(assert (not (h $Snap.unit n@1@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (h $Snap.unit n@1@01))
(pop) ; 2
(pop) ; 1
