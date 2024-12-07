(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:03:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0251.vpr
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
(declare-fun f ($Snap Int) Int)
(declare-fun f%limited ($Snap Int) Int)
(declare-fun f%stateless (Int) Bool)
(declare-fun f%precondition ($Snap Int) Bool)
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
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (= (f%limited s@$ i@0@00) (f s@$ i@0@00))
  :pattern ((f s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (f%stateless i@0@00)
  :pattern ((f%limited s@$ i@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (=> (f%precondition s@$ i@0@00) (= (f s@$ i@0@00) i@0@00))
  :pattern ((f s@$ i@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  true
  :pattern ((f s@$ i@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- failure ----------
(declare-const i@0@01 Int)
(declare-const i@1@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] i == 0
(assert (= i@1@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (forall i$0: Int ::i$0 != 0 ==> i$0 != f(i))
(declare-const i$0@4@01 Int)
(push) ; 3
; [eval] i$0 != 0 ==> i$0 != f(i)
; [eval] i$0 != 0
(push) ; 4
; [then-branch: 0 | i$0@4@01 != 0 | live]
; [else-branch: 0 | i$0@4@01 == 0 | live]
(push) ; 5
; [then-branch: 0 | i$0@4@01 != 0]
(assert (not (= i$0@4@01 0)))
; [eval] i$0 != f(i)
; [eval] f(i)
(push) ; 6
(assert (f%precondition $Snap.unit i@1@01))
(pop) ; 6
; Joined path conditions
(assert (f%precondition $Snap.unit i@1@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i$0@4@01 == 0]
(assert (= i$0@4@01 0))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= i$0@4@01 0))
  (and (not (= i$0@4@01 0)) (f%precondition $Snap.unit i@1@01))))
; Joined path conditions
(assert (or (= i$0@4@01 0) (not (= i$0@4@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$0@4@01 Int)) (!
  (=> (not (= i$0@4@01 0)) (not (= i$0@4@01 (f $Snap.unit i@1@01))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0251.vpr@10@12@10@19|)))
(pop) ; 2
(push) ; 2
; [eval] (forall i$0: Int ::i$0 != 0 ==> i$0 != f(i))
(declare-const i$0@5@01 Int)
(push) ; 3
; [eval] i$0 != 0 ==> i$0 != f(i)
; [eval] i$0 != 0
(push) ; 4
; [then-branch: 1 | i$0@5@01 != 0 | live]
; [else-branch: 1 | i$0@5@01 == 0 | live]
(push) ; 5
; [then-branch: 1 | i$0@5@01 != 0]
(assert (not (= i$0@5@01 0)))
; [eval] i$0 != f(i)
; [eval] f(i)
(push) ; 6
(assert (f%precondition $Snap.unit i@1@01))
(pop) ; 6
; Joined path conditions
(assert (f%precondition $Snap.unit i@1@01))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i$0@5@01 == 0]
(assert (= i$0@5@01 0))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= i$0@5@01 0))
  (and (not (= i$0@5@01 0)) (f%precondition $Snap.unit i@1@01))))
; Joined path conditions
(assert (or (= i$0@5@01 0) (not (= i$0@5@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$0@5@01 Int)) (!
  (=> (not (= i$0@5@01 0)) (f%precondition $Snap.unit i@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0251.vpr@10@12@10@19_precondition|)))
(push) ; 3
(assert (not (forall ((i$0@5@01 Int)) (!
  (=>
    (and
      (=> (not (= i$0@5@01 0)) (f%precondition $Snap.unit i@1@01))
      (not (= i$0@5@01 0)))
    (not (= i$0@5@01 (f $Snap.unit i@1@01))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0251.vpr@10@12@10@19|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i$0@5@01 Int)) (!
  (=> (not (= i$0@5@01 0)) (not (= i$0@5@01 (f $Snap.unit i@1@01))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0251.vpr@10@12@10@19|)))
(pop) ; 2
(pop) ; 1
; ---------- unlink_DAG_next ----------
(declare-const x@6@01 $Ref)
(declare-const x@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 $Ref)
(assert (not (= x@7@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] (forall x$0: Ref ::x.next != x$0)
(declare-const x$0@10@01 $Ref)
(push) ; 3
; [eval] x.next != x$0
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x$0@10@01 $Ref)) (!
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@01)) x$0@10@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0251.vpr@18@13@18@29|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
