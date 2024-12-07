(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:44
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/abstract_funcs_and_preds.vpr
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
(declare-fun fun02 ($Snap $Ref) Bool)
(declare-fun fun02%limited ($Snap $Ref) Bool)
(declare-fun fun02%stateless ($Ref) Bool)
(declare-fun fun02%precondition ($Snap $Ref) Bool)
(declare-fun fun03 ($Snap $Ref) Bool)
(declare-fun fun03%limited ($Snap $Ref) Bool)
(declare-fun fun03%stateless ($Ref) Bool)
(declare-fun fun03%precondition ($Snap $Ref) Bool)
(declare-fun fun01 ($Snap $Ref) Int)
(declare-fun fun01%limited ($Snap $Ref) Int)
(declare-fun fun01%stateless ($Ref) Bool)
(declare-fun fun01%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun file%trigger ($Snap Int) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION fun02----------
(declare-fun x@0@00 () $Ref)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (not (= x@0@00 $Ref.null)))
(declare-const $t@6@00 $Snap)
(assert (= $t@6@00 $Snap.unit))
; [eval] x == x.f ==> result
; [eval] x == x.f
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@0@00 == s@$ | live]
; [else-branch: 0 | x@0@00 != s@$ | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@0@00 == s@$]
(assert (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | x@0@00 != s@$]
(assert (not (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$)))
  (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$))))
(assert (=> (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$)) result@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (fun02%limited s@$ x@0@00) (fun02 s@$ x@0@00))
  :pattern ((fun02 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (fun02%stateless x@0@00)
  :pattern ((fun02%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (fun02%limited s@$ x@0@00))) (=>
    (and
      (fun02%precondition s@$ x@0@00)
      (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$)))
    result@1@00))
  :pattern ((fun02%limited s@$ x@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (fun02%limited s@$ x@0@00))) true)
  :pattern ((fun02%limited s@$ x@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION fun03----------
(declare-fun x@2@00 () $Ref)
(declare-fun result@3@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (not (= x@2@00 $Ref.null)))
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 $Snap.unit))
; [eval] x == x.f ==> !result
; [eval] x == x.f
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@2@00 == s@$ | live]
; [else-branch: 1 | x@2@00 != s@$ | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | x@2@00 == s@$]
(assert (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)))
; [eval] !result
(pop) ; 3
(push) ; 3
; [else-branch: 1 | x@2@00 != s@$]
(assert (not (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)))
  (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$))))
(assert (=> (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)) (not result@3@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (fun03%limited s@$ x@2@00) (fun03 s@$ x@2@00))
  :pattern ((fun03 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (fun03%stateless x@2@00)
  :pattern ((fun03%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (let ((result@3@00 (fun03%limited s@$ x@2@00))) (=>
    (and
      (fun03%precondition s@$ x@2@00)
      (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)))
    (not result@3@00)))
  :pattern ((fun03%limited s@$ x@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (let ((result@3@00 (fun03%limited s@$ x@2@00))) true)
  :pattern ((fun03%limited s@$ x@2@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (not (= x@2@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] !fun02(x)
; [eval] fun02(x)
(set-option :timeout 0)
(push) ; 2
(assert (fun02%precondition s@$ x@2@00))
(pop) ; 2
; Joined path conditions
(assert (fun02%precondition s@$ x@2@00))
(assert (= result@3@00 (not (fun02 s@$ x@2@00))))
; [eval] x == x.f ==> !result
; [eval] x == x.f
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@2@00 == s@$ | live]
; [else-branch: 2 | x@2@00 != s@$ | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | x@2@00 == s@$]
(assert (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)))
; [eval] !result
(pop) ; 3
(push) ; 3
; [else-branch: 2 | x@2@00 != s@$]
(assert (not (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)))
  (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$))))
(push) ; 2
(assert (not (=> (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)) (not result@3@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)) (not result@3@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (fun03%precondition s@$ x@2@00)
    (= (fun03 s@$ x@2@00) (not (fun02 s@$ x@2@00))))
  :pattern ((fun03 s@$ x@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=> (fun03%precondition s@$ x@2@00) (fun02%precondition s@$ x@2@00))
  :pattern ((fun03 s@$ x@2@00))
  :qid |quant-u-11|)))
; ---------- FUNCTION fun01----------
(declare-fun x@4@00 () $Ref)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 $Snap.unit))
; [eval] 0 < result
(assert (< 0 result@5@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (= (fun01%limited s@$ x@4@00) (fun01 s@$ x@4@00))
  :pattern ((fun01 s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (fun01%stateless x@4@00)
  :pattern ((fun01%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (let ((result@5@00 (fun01%limited s@$ x@4@00))) (=>
    (fun01%precondition s@$ x@4@00)
    (< 0 result@5@00)))
  :pattern ((fun01%limited s@$ x@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (let ((result@5@00 (fun01%limited s@$ x@4@00))) true)
  :pattern ((fun01%limited s@$ x@4@00))
  :qid |quant-u-13|)))
; ---------- file ----------
(declare-const id@9@00 Int)
