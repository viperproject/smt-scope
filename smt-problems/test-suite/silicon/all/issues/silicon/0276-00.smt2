(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0276.vpr
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
(declare-fun f ($Snap Int Int) Bool)
(declare-fun f%limited ($Snap Int Int) Bool)
(declare-fun f%stateless (Int Int) Bool)
(declare-fun f%precondition ($Snap Int Int) Bool)
(declare-fun m ($Snap Int) Int)
(declare-fun m%limited ($Snap Int) Int)
(declare-fun m%stateless (Int) Bool)
(declare-fun m%precondition ($Snap Int) Bool)
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
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int)) (!
  (= (f%limited s@$ a@0@00 b@1@00) (f s@$ a@0@00 b@1@00))
  :pattern ((f s@$ a@0@00 b@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int)) (!
  (f%stateless a@0@00 b@1@00)
  :pattern ((f%limited s@$ a@0@00 b@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@3@00 Int)) (!
  (= (m%limited s@$ a@3@00) (m s@$ a@3@00))
  :pattern ((m s@$ a@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@3@00 Int)) (!
  (m%stateless a@3@00)
  :pattern ((m%limited s@$ a@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (a@3@00 Int)) (!
  (=> (m%precondition s@$ a@3@00) (= (m s@$ a@3@00) 14))
  :pattern ((m s@$ a@3@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (a@3@00 Int)) (!
  true
  :pattern ((m s@$ a@3@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- client ----------
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
; var a: Int
(declare-const a@0@01 Int)
; [exec]
; a := m((3 > 2 ? 3 : 2))
; [eval] m((3 > 2 ? 3 : 2))
; [eval] (3 > 2 ? 3 : 2)
; [eval] 3 > 2
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | True]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
; [eval] (forall b: Int ::f(a, b))
(declare-const b@1@01 Int)
(push) ; 4
; [eval] f(a, b)
(push) ; 5
(assert (f%precondition $Snap.unit 3 b@1@01))
(pop) ; 5
; Joined path conditions
(assert (f%precondition $Snap.unit 3 b@1@01))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((b@1@01 Int)) (!
  (f%precondition $Snap.unit 3 b@1@01)
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45_precondition|)))
(push) ; 4
(assert (not (forall ((b@1@01 Int)) (!
  (=> (f%precondition $Snap.unit 3 b@1@01) (f $Snap.unit 3 b@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall b: Int ::f(a, b))
(declare-const b@2@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] f(a, b)
(push) ; 5
(assert (f%precondition $Snap.unit 3 b@2@01))
(pop) ; 5
; Joined path conditions
(assert (f%precondition $Snap.unit 3 b@2@01))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((b@2@01 Int)) (!
  (f%precondition $Snap.unit 3 b@2@01)
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45_precondition|)))
(push) ; 4
(assert (not (forall ((b@2@01 Int)) (!
  (=> (f%precondition $Snap.unit 3 b@2@01) (f $Snap.unit 3 b@2@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall b: Int ::f(a, b))
(declare-const b@3@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] f(a, b)
(push) ; 5
(assert (f%precondition $Snap.unit 3 b@3@01))
(pop) ; 5
; Joined path conditions
(assert (f%precondition $Snap.unit 3 b@3@01))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((b@3@01 Int)) (!
  (f%precondition $Snap.unit 3 b@3@01)
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45_precondition|)))
(push) ; 4
(assert (not (forall ((b@3@01 Int)) (!
  (=> (f%precondition $Snap.unit 3 b@3@01) (f $Snap.unit 3 b@3@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall b: Int ::f(a, b))
(declare-const b@4@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] f(a, b)
(push) ; 5
(assert (f%precondition $Snap.unit 3 b@4@01))
(pop) ; 5
; Joined path conditions
(assert (f%precondition $Snap.unit 3 b@4@01))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((b@4@01 Int)) (!
  (f%precondition $Snap.unit 3 b@4@01)
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45_precondition|)))
(push) ; 4
(assert (not (forall ((b@4@01 Int)) (!
  (=> (f%precondition $Snap.unit 3 b@4@01) (f $Snap.unit 3 b@4@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
