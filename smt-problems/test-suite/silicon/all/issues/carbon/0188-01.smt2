(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:12
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0188.vpr
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
(declare-fun g ($Snap Int Int) Int)
(declare-fun g%limited ($Snap Int Int) Int)
(declare-fun g%stateless (Int Int) Bool)
(declare-fun g%precondition ($Snap Int Int) Bool)
(declare-fun h ($Snap Int) Bool)
(declare-fun h%limited ($Snap Int) Bool)
(declare-fun h%stateless (Int) Bool)
(declare-fun h%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION f----------
(declare-fun a@0@00 () Int)
(declare-fun b@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int)) (!
  (= (f%limited s@$ a@0@00 b@1@00) (f s@$ a@0@00 b@1@00))
  :pattern ((f s@$ a@0@00 b@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int)) (!
  (f%stateless a@0@00 b@1@00)
  :pattern ((f%limited s@$ a@0@00 b@1@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION g----------
(declare-fun a@3@00 () Int)
(declare-fun b@4@00 () Int)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] a > b ==> f(a, b)
; [eval] a > b
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> a@3@00 b@4@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> a@3@00 b@4@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | a@3@00 > b@4@00 | live]
; [else-branch: 0 | !(a@3@00 > b@4@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | a@3@00 > b@4@00]
(assert (> a@3@00 b@4@00))
; [eval] f(a, b)
(push) ; 4
(assert (f%precondition $Snap.unit a@3@00 b@4@00))
(pop) ; 4
; Joined path conditions
(assert (f%precondition $Snap.unit a@3@00 b@4@00))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(a@3@00 > b@4@00)]
(assert (not (> a@3@00 b@4@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> a@3@00 b@4@00)
  (and (> a@3@00 b@4@00) (f%precondition $Snap.unit a@3@00 b@4@00))))
; Joined path conditions
(assert (or (not (> a@3@00 b@4@00)) (> a@3@00 b@4@00)))
(assert (=> (> a@3@00 b@4@00) (f $Snap.unit a@3@00 b@4@00)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] b > a ==> f(b, a)
; [eval] b > a
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> b@4@00 a@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> b@4@00 a@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@4@00 > a@3@00 | live]
; [else-branch: 1 | !(b@4@00 > a@3@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | b@4@00 > a@3@00]
(assert (> b@4@00 a@3@00))
; [eval] f(b, a)
(push) ; 4
(assert (f%precondition $Snap.unit b@4@00 a@3@00))
(pop) ; 4
; Joined path conditions
(assert (f%precondition $Snap.unit b@4@00 a@3@00))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(b@4@00 > a@3@00)]
(assert (not (> b@4@00 a@3@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> b@4@00 a@3@00)
  (and (> b@4@00 a@3@00) (f%precondition $Snap.unit b@4@00 a@3@00))))
; Joined path conditions
(assert (or (not (> b@4@00 a@3@00)) (> b@4@00 a@3@00)))
(assert (=> (> b@4@00 a@3@00) (f $Snap.unit b@4@00 a@3@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@3@00 Int) (b@4@00 Int)) (!
  (= (g%limited s@$ a@3@00 b@4@00) (g s@$ a@3@00 b@4@00))
  :pattern ((g s@$ a@3@00 b@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@3@00 Int) (b@4@00 Int)) (!
  (g%stateless a@3@00 b@4@00)
  :pattern ((g%limited s@$ a@3@00 b@4@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION h----------
(declare-fun a@6@00 () Int)
(declare-fun result@7@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 $Snap.unit))
; [eval] (forall i: Int :: { g(a, i) } g(a, i) > 17 ==> result)
(declare-const i@9@00 Int)
(push) ; 2
; [eval] g(a, i) > 17 ==> result
; [eval] g(a, i) > 17
; [eval] g(a, i)
(push) ; 3
; [eval] a > b ==> f(a, b)
; [eval] a > b
(push) ; 4
; [then-branch: 2 | a@6@00 > i@9@00 | live]
; [else-branch: 2 | !(a@6@00 > i@9@00) | live]
(push) ; 5
; [then-branch: 2 | a@6@00 > i@9@00]
(assert (> a@6@00 i@9@00))
; [eval] f(a, b)
(push) ; 6
(assert (f%precondition $Snap.unit a@6@00 i@9@00))
(pop) ; 6
; Joined path conditions
(assert (f%precondition $Snap.unit a@6@00 i@9@00))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(a@6@00 > i@9@00)]
(assert (not (> a@6@00 i@9@00)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (> a@6@00 i@9@00)
  (and (> a@6@00 i@9@00) (f%precondition $Snap.unit a@6@00 i@9@00))))
; Joined path conditions
(assert (or (not (> a@6@00 i@9@00)) (> a@6@00 i@9@00)))
(push) ; 4
(assert (not (=> (> a@6@00 i@9@00) (f $Snap.unit a@6@00 i@9@00))))
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
; [eval] a > b ==> f(a, b)
; [eval] a > b
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | a@6@00 > i@9@00 | live]
; [else-branch: 3 | !(a@6@00 > i@9@00) | live]
(push) ; 5
; [then-branch: 3 | a@6@00 > i@9@00]
(assert (> a@6@00 i@9@00))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f(a, b)
(set-option :timeout 0)
(push) ; 6
(assert (f%precondition $Snap.unit a@6@00 i@9@00))
(pop) ; 6
; Joined path conditions
(assert (f%precondition $Snap.unit a@6@00 i@9@00))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(a@6@00 > i@9@00)]
(assert (not (> a@6@00 i@9@00)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (=> (> a@6@00 i@9@00) (f $Snap.unit a@6@00 i@9@00))))
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
; [eval] a > b ==> f(a, b)
; [eval] a > b
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | a@6@00 > i@9@00 | live]
; [else-branch: 4 | !(a@6@00 > i@9@00) | live]
(push) ; 5
; [then-branch: 4 | a@6@00 > i@9@00]
(assert (> a@6@00 i@9@00))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f(a, b)
(set-option :timeout 0)
(push) ; 6
(assert (f%precondition $Snap.unit a@6@00 i@9@00))
(pop) ; 6
; Joined path conditions
(assert (f%precondition $Snap.unit a@6@00 i@9@00))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(a@6@00 > i@9@00)]
(assert (not (> a@6@00 i@9@00)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (=> (> a@6@00 i@9@00) (f $Snap.unit a@6@00 i@9@00))))
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
; [eval] a > b ==> f(a, b)
; [eval] a > b
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | a@6@00 > i@9@00 | live]
; [else-branch: 5 | !(a@6@00 > i@9@00) | live]
(push) ; 5
; [then-branch: 5 | a@6@00 > i@9@00]
(assert (> a@6@00 i@9@00))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f(a, b)
(set-option :timeout 0)
(push) ; 6
(assert (f%precondition $Snap.unit a@6@00 i@9@00))
(pop) ; 6
; Joined path conditions
(assert (f%precondition $Snap.unit a@6@00 i@9@00))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(a@6@00 > i@9@00)]
(assert (not (> a@6@00 i@9@00)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (=> (> a@6@00 i@9@00) (f $Snap.unit a@6@00 i@9@00))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
