(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:52:31
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0203.vpr
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
(declare-sort Dummy 0)
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
(declare-fun $SortWrappers.DummyTo$Snap (Dummy) $Snap)
(declare-fun $SortWrappers.$SnapToDummy ($Snap) Dummy)
(assert (forall ((x Dummy)) (!
    (= x ($SortWrappers.$SnapToDummy($SortWrappers.DummyTo$Snap x)))
    :pattern (($SortWrappers.DummyTo$Snap x))
    :qid |$Snap.$SnapToDummyTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DummyTo$Snap($SortWrappers.$SnapToDummy x)))
    :pattern (($SortWrappers.$SnapToDummy x))
    :qid |$Snap.DummyTo$SnapToDummy|
    )))
; ////////// Symbols
(declare-fun loc<Bool> (Dummy Int) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun count ($Snap Int Int Dummy) Int)
(declare-fun count%limited ($Snap Int Int Dummy) Int)
(declare-fun count%stateless (Int Int Dummy) Bool)
(declare-fun count%precondition ($Snap Int Int Dummy) Bool)
(declare-fun recfun ($Snap Int) Int)
(declare-fun recfun%limited ($Snap Int) Int)
(declare-fun recfun%stateless (Int) Bool)
(declare-fun recfun%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION count----------
(declare-fun lo@0@00 () Int)
(declare-fun hi@1@00 () Int)
(declare-fun a@2@00 () Dummy)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@00 $Snap)
(assert (= $t@6@00 ($Snap.combine ($Snap.first $t@6@00) ($Snap.second $t@6@00))))
(assert (= ($Snap.first $t@6@00) $Snap.unit))
; [eval] hi <= lo ==> result == 0
; [eval] hi <= lo
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= hi@1@00 lo@0@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= hi@1@00 lo@0@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | hi@1@00 <= lo@0@00 | live]
; [else-branch: 0 | !(hi@1@00 <= lo@0@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | hi@1@00 <= lo@0@00]
(assert (<= hi@1@00 lo@0@00))
; [eval] result == 0
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(hi@1@00 <= lo@0@00)]
(assert (not (<= hi@1@00 lo@0@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (<= hi@1@00 lo@0@00)) (<= hi@1@00 lo@0@00)))
(assert (=> (<= hi@1@00 lo@0@00) (= result@3@00 0)))
(assert (= ($Snap.second $t@6@00) $Snap.unit))
; [eval] lo <= hi ==> count(lo, hi + 1, a) == result + (loc(a, hi) ? 0 : 1)
; [eval] lo <= hi
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= lo@0@00 hi@1@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= lo@0@00 hi@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | lo@0@00 <= hi@1@00 | live]
; [else-branch: 1 | !(lo@0@00 <= hi@1@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | lo@0@00 <= hi@1@00]
(assert (<= lo@0@00 hi@1@00))
; [eval] count(lo, hi + 1, a) == result + (loc(a, hi) ? 0 : 1)
; [eval] count(lo, hi + 1, a)
; [eval] hi + 1
(push) ; 4
(assert (count%precondition $Snap.unit lo@0@00 (+ hi@1@00 1) a@2@00))
(pop) ; 4
; Joined path conditions
(assert (count%precondition $Snap.unit lo@0@00 (+ hi@1@00 1) a@2@00))
; [eval] result + (loc(a, hi) ? 0 : 1)
; [eval] (loc(a, hi) ? 0 : 1)
; [eval] loc(a, hi)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (loc<Bool> a@2@00 hi@1@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (loc<Bool> a@2@00 hi@1@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | loc[Bool](a@2@00, hi@1@00) | live]
; [else-branch: 2 | !(loc[Bool](a@2@00, hi@1@00)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | loc[Bool](a@2@00, hi@1@00)]
(assert (loc<Bool> a@2@00 hi@1@00))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(loc[Bool](a@2@00, hi@1@00))]
(assert (not (loc<Bool> a@2@00 hi@1@00)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (loc<Bool> a@2@00 hi@1@00)) (loc<Bool> a@2@00 hi@1@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(lo@0@00 <= hi@1@00)]
(assert (not (<= lo@0@00 hi@1@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (<= lo@0@00 hi@1@00)
  (and
    (<= lo@0@00 hi@1@00)
    (count%precondition $Snap.unit lo@0@00 (+ hi@1@00 1) a@2@00)
    (or (not (loc<Bool> a@2@00 hi@1@00)) (loc<Bool> a@2@00 hi@1@00)))))
; Joined path conditions
(assert (or (not (<= lo@0@00 hi@1@00)) (<= lo@0@00 hi@1@00)))
(assert (=>
  (<= lo@0@00 hi@1@00)
  (=
    (count $Snap.unit lo@0@00 (+ hi@1@00 1) a@2@00)
    (+ result@3@00 (ite (loc<Bool> a@2@00 hi@1@00) 0 1)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (=
    (count%limited s@$ lo@0@00 hi@1@00 a@2@00)
    (count s@$ lo@0@00 hi@1@00 a@2@00))
  :pattern ((count s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (count%stateless lo@0@00 hi@1@00 a@2@00)
  :pattern ((count%limited s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (let ((result@3@00 (count%limited s@$ lo@0@00 hi@1@00 a@2@00))) (=>
    (count%precondition s@$ lo@0@00 hi@1@00 a@2@00)
    (and
      (=> (<= hi@1@00 lo@0@00) (= result@3@00 0))
      (=>
        (<= lo@0@00 hi@1@00)
        (=
          (count%limited $Snap.unit lo@0@00 (+ hi@1@00 1) a@2@00)
          (+ result@3@00 (ite (loc<Bool> a@2@00 hi@1@00) 0 1)))))))
  :pattern ((count%limited s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (let ((result@3@00 (count%limited s@$ lo@0@00 hi@1@00 a@2@00))) true)
  :pattern ((count%limited s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (lo@0@00 Int) (hi@1@00 Int) (a@2@00 Dummy)) (!
  (let ((result@3@00 (count%limited s@$ lo@0@00 hi@1@00 a@2@00))) (=>
    (and (count%precondition s@$ lo@0@00 hi@1@00 a@2@00) (<= lo@0@00 hi@1@00))
    (count%precondition $Snap.unit lo@0@00 (+ hi@1@00 1) a@2@00)))
  :pattern ((count%limited s@$ lo@0@00 hi@1@00 a@2@00))
  :qid |quant-u-6|)))
; ---------- FUNCTION recfun----------
(declare-fun x@4@00 () Int)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] x > 0
(assert (> x@4@00 0))
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 $Snap.unit))
; [eval] recfun(x) < 0
; [eval] recfun(x)
(push) ; 2
; [eval] x > 0
(assert (recfun%precondition $Snap.unit x@4@00))
(pop) ; 2
; Joined path conditions
(assert (recfun%precondition $Snap.unit x@4@00))
(assert (< (recfun $Snap.unit x@4@00) 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (= (recfun%limited s@$ x@4@00) (recfun s@$ x@4@00))
  :pattern ((recfun s@$ x@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (recfun%stateless x@4@00)
  :pattern ((recfun%limited s@$ x@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (recfun%limited s@$ x@4@00))) (=>
    (recfun%precondition s@$ x@4@00)
    (< (recfun%limited $Snap.unit x@4@00) 0)))
  :pattern ((recfun%limited s@$ x@4@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (recfun%limited s@$ x@4@00))) (=>
    (recfun%precondition s@$ x@4@00)
    (recfun%precondition $Snap.unit x@4@00)))
  :pattern ((recfun%limited s@$ x@4@00))
  :qid |quant-u-8|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (> x@4@00 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] -x
(assert (= result@5@00 (- 0 x@4@00)))
; [eval] recfun(x) < 0
; [eval] recfun(x)
(set-option :timeout 0)
(push) ; 2
; [eval] x > 0
(assert (recfun%precondition $Snap.unit x@4@00))
(pop) ; 2
; Joined path conditions
(assert (recfun%precondition $Snap.unit x@4@00))
(push) ; 2
(assert (not (< (recfun $Snap.unit x@4@00) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (< (recfun $Snap.unit x@4@00) 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=> (recfun%precondition s@$ x@4@00) (= (recfun s@$ x@4@00) (- 0 x@4@00)))
  :pattern ((recfun s@$ x@4@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  true
  :pattern ((recfun s@$ x@4@00))
  :qid |quant-u-10|)))
