(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:14
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0751.vpr
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
(declare-fun round ($Snap $Perm) $Perm)
(declare-fun round%limited ($Snap $Perm) $Perm)
(declare-fun round%stateless ($Perm) Bool)
(declare-fun round%precondition ($Snap $Perm) Bool)
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
; ---------- FUNCTION round----------
(declare-fun x@0@00 () $Perm)
(declare-fun result@1@00 () $Perm)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@00 $Snap)
(assert (= $t@2@00 ($Snap.combine ($Snap.first $t@2@00) ($Snap.second $t@2@00))))
(assert (= ($Snap.first $t@2@00) $Snap.unit))
; [eval] x == 3 / 1 ==> result == 3 / 2
; [eval] x == 3 / 1
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@0@00 (/ (to_real 3) (to_real 1))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@0@00 (/ (to_real 3) (to_real 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@0@00 == 3/1 | live]
; [else-branch: 0 | x@0@00 != 3/1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@0@00 == 3/1]
(assert (= x@0@00 (/ (to_real 3) (to_real 1))))
; [eval] result == 3 / 2
(pop) ; 3
(push) ; 3
; [else-branch: 0 | x@0@00 != 3/1]
(assert (not (= x@0@00 (/ (to_real 3) (to_real 1)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= x@0@00 (/ (to_real 3) (to_real 1))))
  (= x@0@00 (/ (to_real 3) (to_real 1)))))
(assert (=>
  (= x@0@00 (/ (to_real 3) (to_real 1)))
  (= result@1@00 (/ (to_real 3) (to_real 2)))))
(assert (= ($Snap.second $t@2@00) $Snap.unit))
; [eval] result == to_int(x) / 1
; [eval] to_int(x)
(assert (= result@1@00 (/ (to_real (to_int x@0@00)) (to_real 1))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Perm)) (!
  (= (round%limited s@$ x@0@00) (round s@$ x@0@00))
  :pattern ((round s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Perm)) (!
  (round%stateless x@0@00)
  :pattern ((round%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Perm)) (!
  (let ((result@1@00 (round%limited s@$ x@0@00))) (=>
    (round%precondition s@$ x@0@00)
    (and
      (=>
        (= x@0@00 (/ (to_real 3) (to_real 1)))
        (= result@1@00 (/ (to_real 3) (to_real 2))))
      (= result@1@00 (/ (to_real (to_int x@0@00)) (to_real 1))))))
  :pattern ((round%limited s@$ x@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Perm)) (!
  (let ((result@1@00 (round%limited s@$ x@0@00))) true)
  :pattern ((round%limited s@$ x@0@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Perm)) (!
  (let ((result@1@00 (round%limited s@$ x@0@00))) true)
  :pattern ((round%limited s@$ x@0@00))
  :qid |quant-u-4|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] to_int(x)
(assert (= result@1@00 (/ (to_real (to_int x@0@00)) (to_real 2))))
; [eval] x == 3 / 1 ==> result == 3 / 2
; [eval] x == 3 / 1
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@0@00 (/ (to_real 3) (to_real 1))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@0@00 (/ (to_real 3) (to_real 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@0@00 == 3/1 | live]
; [else-branch: 1 | x@0@00 != 3/1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | x@0@00 == 3/1]
(assert (= x@0@00 (/ (to_real 3) (to_real 1))))
; [eval] result == 3 / 2
(pop) ; 3
(push) ; 3
; [else-branch: 1 | x@0@00 != 3/1]
(assert (not (= x@0@00 (/ (to_real 3) (to_real 1)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= x@0@00 (/ (to_real 3) (to_real 1))))
  (= x@0@00 (/ (to_real 3) (to_real 1)))))
(push) ; 2
(assert (not (=>
  (= x@0@00 (/ (to_real 3) (to_real 1)))
  (= result@1@00 (/ (to_real 3) (to_real 2))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= x@0@00 (/ (to_real 3) (to_real 1)))
  (= result@1@00 (/ (to_real 3) (to_real 2)))))
; [eval] result == to_int(x) / 1
; [eval] to_int(x)
(push) ; 2
(assert (not (= result@1@00 (/ (to_real (to_int x@0@00)) (to_real 1)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == to_int(x) / 1
; [eval] to_int(x)
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@1@00 (/ (to_real (to_int x@0@00)) (to_real 1)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == to_int(x) / 1
; [eval] to_int(x)
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@1@00 (/ (to_real (to_int x@0@00)) (to_real 1)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == to_int(x) / 1
; [eval] to_int(x)
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@1@00 (/ (to_real (to_int x@0@00)) (to_real 1)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
