(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/annotation/opaque.vpr
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
(declare-fun isGreaterOne ($Snap Int) Bool)
(declare-fun isGreaterOne%limited ($Snap Int) Bool)
(declare-fun isGreaterOne%stateless (Int) Bool)
(declare-fun isGreaterOne%precondition ($Snap Int) Bool)
(declare-fun isGreaterOne32 ($Snap $Ref) Bool)
(declare-fun isGreaterOne32%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne32%stateless ($Ref) Bool)
(declare-fun isGreaterOne32%precondition ($Snap $Ref) Bool)
(declare-fun fac1 ($Snap Int) Int)
(declare-fun fac1%limited ($Snap Int) Int)
(declare-fun fac1%stateless (Int) Bool)
(declare-fun fac1%precondition ($Snap Int) Bool)
(declare-fun fac3 ($Snap Int) Int)
(declare-fun fac3%limited ($Snap Int) Int)
(declare-fun fac3%stateless (Int) Bool)
(declare-fun fac3%precondition ($Snap Int) Bool)
(declare-fun isGreaterOne3 ($Snap $Ref) Bool)
(declare-fun isGreaterOne3%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne3%stateless ($Ref) Bool)
(declare-fun isGreaterOne3%precondition ($Snap $Ref) Bool)
(declare-fun isGreaterOne33 ($Snap $Ref) Bool)
(declare-fun isGreaterOne33%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne33%stateless ($Ref) Bool)
(declare-fun isGreaterOne33%precondition ($Snap $Ref) Bool)
(declare-fun funP ($Snap $Ref) Int)
(declare-fun funP%limited ($Snap $Ref) Int)
(declare-fun funP%stateless ($Ref) Bool)
(declare-fun funP%precondition ($Snap $Ref) Bool)
(declare-fun isGreaterOne22 ($Snap $Ref) Bool)
(declare-fun isGreaterOne22%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne22%stateless ($Ref) Bool)
(declare-fun isGreaterOne22%precondition ($Snap $Ref) Bool)
(declare-fun fac2 ($Snap Int) Int)
(declare-fun fac2%limited ($Snap Int) Int)
(declare-fun fac2%stateless (Int) Bool)
(declare-fun fac2%precondition ($Snap Int) Bool)
(declare-fun isGreaterOne35 ($Snap $Ref) Bool)
(declare-fun isGreaterOne35%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne35%stateless ($Ref) Bool)
(declare-fun isGreaterOne35%precondition ($Snap $Ref) Bool)
(declare-fun isGreaterOne2 ($Snap $Ref) Bool)
(declare-fun isGreaterOne2%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne2%stateless ($Ref) Bool)
(declare-fun isGreaterOne2%precondition ($Snap $Ref) Bool)
(declare-fun isGreaterOne34 ($Snap $Ref) Bool)
(declare-fun isGreaterOne34%limited ($Snap $Ref) Bool)
(declare-fun isGreaterOne34%stateless ($Ref) Bool)
(declare-fun isGreaterOne34%precondition ($Snap $Ref) Bool)
(declare-fun funP2 ($Snap $Ref) Int)
(declare-fun funP2%limited ($Snap $Ref) Int)
(declare-fun funP2%stateless ($Ref) Bool)
(declare-fun funP2%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION isGreaterOne----------
(declare-fun i@0@00 () Int)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] i > -60
; [eval] -60
(assert (> i@0@00 (- 0 60)))
(declare-const $t@26@00 $Snap)
(assert (= $t@26@00 $Snap.unit))
; [eval] i > 60 ==> result
; [eval] i > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@0@00 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@0@00 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@0@00 > 60 | live]
; [else-branch: 0 | !(i@0@00 > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | i@0@00 > 60]
(assert (> i@0@00 60))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(i@0@00 > 60)]
(assert (not (> i@0@00 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (> i@0@00 60)) (> i@0@00 60)))
(assert (=> (> i@0@00 60) result@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (= (isGreaterOne%limited s@$ i@0@00) (isGreaterOne s@$ i@0@00))
  :pattern ((isGreaterOne s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (isGreaterOne%stateless i@0@00)
  :pattern ((isGreaterOne%limited s@$ i@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (let ((result@1@00 (isGreaterOne%limited s@$ i@0@00))) (=>
    (and (isGreaterOne%precondition s@$ i@0@00) (> i@0@00 60))
    result@1@00))
  :pattern ((isGreaterOne%limited s@$ i@0@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (let ((result@1@00 (isGreaterOne%limited s@$ i@0@00))) true)
  :pattern ((isGreaterOne%limited s@$ i@0@00))
  :qid |quant-u-27|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (> i@0@00 (- 0 60)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] i > 1
(assert (= result@1@00 (> i@0@00 1)))
; [eval] i > 60 ==> result
; [eval] i > 60
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> i@0@00 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> i@0@00 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | i@0@00 > 60 | live]
; [else-branch: 1 | !(i@0@00 > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | i@0@00 > 60]
(assert (> i@0@00 60))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(i@0@00 > 60)]
(assert (not (> i@0@00 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (> i@0@00 60)) (> i@0@00 60)))
(push) ; 2
(assert (not (=> (> i@0@00 60) result@1@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (> i@0@00 60) result@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (=>
    (isGreaterOne%precondition s@$ i@0@00)
    (= (isGreaterOne s@$ i@0@00) (> i@0@00 1)))
  :pattern ((isGreaterOne s@$ i@0@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  true
  :pattern ((isGreaterOne s@$ i@0@00))
  :qid |quant-u-29|)))
; ---------- FUNCTION isGreaterOne32----------
(declare-fun r@2@00 () $Ref)
(declare-fun result@3@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@2@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] r.f > -38
; [eval] -38
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
(declare-const $t@27@00 $Snap)
(assert (= $t@27@00 ($Snap.combine ($Snap.first $t@27@00) ($Snap.second $t@27@00))))
(assert (= ($Snap.first $t@27@00) $Snap.unit))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(s@$) > 60 | live]
; [else-branch: 2 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@3@00))
(assert (= ($Snap.second $t@27@00) $Snap.unit))
; [eval] result == r.f > 1
; [eval] r.f > 1
(assert (= result@3@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (isGreaterOne32%limited s@$ r@2@00) (isGreaterOne32 s@$ r@2@00))
  :pattern ((isGreaterOne32 s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (isGreaterOne32%stateless r@2@00)
  :pattern ((isGreaterOne32%limited s@$ r@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (isGreaterOne32%limited s@$ r@2@00))) (=>
    (isGreaterOne32%precondition s@$ r@2@00)
    (and
      (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@3@00)
      (= result@3@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)))))
  :pattern ((isGreaterOne32%limited s@$ r@2@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (isGreaterOne32%limited s@$ r@2@00))) true)
  :pattern ((isGreaterOne32%limited s@$ r@2@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (isGreaterOne32%limited s@$ r@2@00))) true)
  :pattern ((isGreaterOne32%limited s@$ r@2@00))
  :qid |quant-u-32|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@2@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] @reveal() (isGreaterOne(r.f))
(set-option :timeout 0)
(push) ; 2
; [eval] i > -60
; [eval] -60
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(pop) ; 2
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))
  (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
(assert (=
  result@3@00
  (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(s@$) > 60 | live]
; [else-branch: 3 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(push) ; 2
(assert (not (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@3@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@3@00))
; [eval] result == r.f > 1
; [eval] r.f > 1
(push) ; 2
(assert (not (= result@3@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (=>
    (isGreaterOne32%precondition s@$ r@2@00)
    (=
      (isGreaterOne32 s@$ r@2@00)
      (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne32 s@$ r@2@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (=>
    (isGreaterOne32%precondition s@$ r@2@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne32 s@$ r@2@00))
  :qid |quant-u-34|)))
; ---------- FUNCTION fac1----------
(declare-fun i@4@00 () Int)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (= (fac1%limited s@$ i@4@00) (fac1 s@$ i@4@00))
  :pattern ((fac1 s@$ i@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (fac1%stateless i@4@00)
  :pattern ((fac1%limited s@$ i@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i <= 1 ? 1 : i * fac1(i - 1))
; [eval] i <= 1
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= i@4@00 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= i@4@00 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | i@4@00 <= 1 | live]
; [else-branch: 4 | !(i@4@00 <= 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | i@4@00 <= 1]
(assert (<= i@4@00 1))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | !(i@4@00 <= 1)]
(assert (not (<= i@4@00 1)))
; [eval] i * fac1(i - 1)
; [eval] fac1(i - 1)
; [eval] i - 1
(push) ; 4
(assert (fac1%precondition $Snap.unit (- i@4@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fac1%precondition $Snap.unit (- i@4@00 1)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (<= i@4@00 1))
  (and (not (<= i@4@00 1)) (fac1%precondition $Snap.unit (- i@4@00 1)))))
(assert (or (not (<= i@4@00 1)) (<= i@4@00 1)))
(assert (= result@5@00 (ite (<= i@4@00 1) 1 (* i@4@00 (fac1 $Snap.unit (- i@4@00 1))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (=>
    (fac1%precondition s@$ i@4@00)
    (=
      (fac1 s@$ i@4@00)
      (ite (<= i@4@00 1) 1 (* i@4@00 (fac1%limited $Snap.unit (- i@4@00 1))))))
  :pattern ((fac1 s@$ i@4@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (=>
    (fac1%precondition s@$ i@4@00)
    (ite (<= i@4@00 1) true (fac1%precondition $Snap.unit (- i@4@00 1))))
  :pattern ((fac1 s@$ i@4@00))
  :qid |quant-u-36|)))
; ---------- FUNCTION fac3----------
(declare-fun i@6@00 () Int)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (= (fac3%limited s@$ i@6@00) (fac3 s@$ i@6@00))
  :pattern ((fac3 s@$ i@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (fac3%stateless i@6@00)
  :pattern ((fac3%limited s@$ i@6@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i <= 1 ? 1 : i * @reveal() (fac3(i - 1)))
; [eval] i <= 1
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= i@6@00 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= i@6@00 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | i@6@00 <= 1 | live]
; [else-branch: 5 | !(i@6@00 <= 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | i@6@00 <= 1]
(assert (<= i@6@00 1))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | !(i@6@00 <= 1)]
(assert (not (<= i@6@00 1)))
; [eval] i * @reveal() (fac3(i - 1))
; [eval] @reveal() (fac3(i - 1))
; [eval] i - 1
(push) ; 4
(assert (fac3%precondition $Snap.unit (- i@6@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fac3%precondition $Snap.unit (- i@6@00 1)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (<= i@6@00 1))
  (and (not (<= i@6@00 1)) (fac3%precondition $Snap.unit (- i@6@00 1)))))
(assert (or (not (<= i@6@00 1)) (<= i@6@00 1)))
(assert (= result@7@00 (ite (<= i@6@00 1) 1 (* i@6@00 (fac3 $Snap.unit (- i@6@00 1))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (=>
    (fac3%precondition s@$ i@6@00)
    (=
      (fac3 s@$ i@6@00)
      (ite (<= i@6@00 1) 1 (* i@6@00 (fac3%limited $Snap.unit (- i@6@00 1))))))
  :pattern ((fac3 s@$ i@6@00))
  :qid |quant-u-37|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (=>
    (fac3%precondition s@$ i@6@00)
    (ite (<= i@6@00 1) true (fac3%precondition $Snap.unit (- i@6@00 1))))
  :pattern ((fac3 s@$ i@6@00))
  :qid |quant-u-38|)))
; ---------- FUNCTION isGreaterOne3----------
(declare-fun r@8@00 () $Ref)
(declare-fun result@9@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@8@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] r.f > -38
; [eval] -38
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
(declare-const $t@28@00 $Snap)
(assert (= $t@28@00 $Snap.unit))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(s@$) > 60 | live]
; [else-branch: 6 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@9@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (= (isGreaterOne3%limited s@$ r@8@00) (isGreaterOne3 s@$ r@8@00))
  :pattern ((isGreaterOne3 s@$ r@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (isGreaterOne3%stateless r@8@00)
  :pattern ((isGreaterOne3%limited s@$ r@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (let ((result@9@00 (isGreaterOne3%limited s@$ r@8@00))) (=>
    (and
      (isGreaterOne3%precondition s@$ r@8@00)
      (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
    result@9@00))
  :pattern ((isGreaterOne3%limited s@$ r@8@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (let ((result@9@00 (isGreaterOne3%limited s@$ r@8@00))) true)
  :pattern ((isGreaterOne3%limited s@$ r@8@00))
  :qid |quant-u-40|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@8@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] @reveal() (isGreaterOne(r.f))
(set-option :timeout 0)
(push) ; 2
; [eval] i > -60
; [eval] -60
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(pop) ; 2
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))
  (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
(assert (=
  result@9@00
  (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(s@$) > 60 | live]
; [else-branch: 7 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 7 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(push) ; 2
(assert (not (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@9@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@9@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (=>
    (isGreaterOne3%precondition s@$ r@8@00)
    (=
      (isGreaterOne3 s@$ r@8@00)
      (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne3 s@$ r@8@00))
  :qid |quant-u-41|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (=>
    (isGreaterOne3%precondition s@$ r@8@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne3 s@$ r@8@00))
  :qid |quant-u-42|)))
; ---------- FUNCTION isGreaterOne33----------
(declare-fun r@10@00 () $Ref)
(declare-fun result@11@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (not (= r@10@00 $Ref.null)))
(declare-const $t@29@00 $Snap)
(assert (= $t@29@00 $Snap.unit))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt s@$) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt s@$) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | s@$ > 60 | live]
; [else-branch: 8 | !(s@$ > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | s@$ > 60]
(assert (> ($SortWrappers.$SnapToInt s@$) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 8 | !(s@$ > 60)]
(assert (not (> ($SortWrappers.$SnapToInt s@$) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt s@$) 60))
  (> ($SortWrappers.$SnapToInt s@$) 60)))
(assert (=> (> ($SortWrappers.$SnapToInt s@$) 60) result@11@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (= (isGreaterOne33%limited s@$ r@10@00) (isGreaterOne33 s@$ r@10@00))
  :pattern ((isGreaterOne33 s@$ r@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (isGreaterOne33%stateless r@10@00)
  :pattern ((isGreaterOne33%limited s@$ r@10@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (let ((result@11@00 (isGreaterOne33%limited s@$ r@10@00))) (=>
    (and
      (isGreaterOne33%precondition s@$ r@10@00)
      (> ($SortWrappers.$SnapToInt s@$) 60))
    result@11@00))
  :pattern ((isGreaterOne33%limited s@$ r@10@00))
  :qid |quant-u-43|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (let ((result@11@00 (isGreaterOne33%limited s@$ r@10@00))) true)
  :pattern ((isGreaterOne33%limited s@$ r@10@00))
  :qid |quant-u-44|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (not (= r@10@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] @reveal() (isGreaterOne(r.f))
(set-option :timeout 0)
(push) ; 2
; [eval] i > -60
; [eval] -60
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt s@$) (- 0 60))))
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
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt s@$) (- 0 60))))
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
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt s@$) (- 0 60))))
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
; [eval] i > -60
; [eval] -60
(set-option :timeout 0)
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt s@$) (- 0 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- FUNCTION funP----------
(declare-fun x@12@00 () $Ref)
(declare-fun result@13@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  (= (funP%limited s@$ x@12@00) (funP s@$ x@12@00))
  :pattern ((funP s@$ x@12@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  (funP%stateless x@12@00)
  :pattern ((funP%limited s@$ x@12@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P(x), write) in x.f)
(set-option :timeout 0)
(push) ; 2
(assert (P%trigger s@$ x@12@00))
(assert (not (= x@12@00 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and (P%trigger s@$ x@12@00) (not (= x@12@00 $Ref.null))))
(assert (= result@13@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  (=>
    (funP%precondition s@$ x@12@00)
    (= (funP s@$ x@12@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((funP s@$ x@12@00))
  :qid |quant-u-45|)))
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  true
  :pattern ((funP s@$ x@12@00))
  :qid |quant-u-46|)))
; ---------- FUNCTION isGreaterOne22----------
(declare-fun r@14@00 () $Ref)
(declare-fun result@15@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@14@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] r.f > -38
; [eval] -38
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
(declare-const $t@30@00 $Snap)
(assert (= $t@30@00 ($Snap.combine ($Snap.first $t@30@00) ($Snap.second $t@30@00))))
(assert (= ($Snap.first $t@30@00) $Snap.unit))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(s@$) > 60 | live]
; [else-branch: 9 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@15@00))
(assert (= ($Snap.second $t@30@00) $Snap.unit))
; [eval] result == r.f > 1
; [eval] r.f > 1
(assert (= result@15@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (= (isGreaterOne22%limited s@$ r@14@00) (isGreaterOne22 s@$ r@14@00))
  :pattern ((isGreaterOne22 s@$ r@14@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (isGreaterOne22%stateless r@14@00)
  :pattern ((isGreaterOne22%limited s@$ r@14@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (let ((result@15@00 (isGreaterOne22%limited s@$ r@14@00))) (=>
    (isGreaterOne22%precondition s@$ r@14@00)
    (and
      (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@15@00)
      (= result@15@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)))))
  :pattern ((isGreaterOne22%limited s@$ r@14@00))
  :qid |quant-u-47|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (let ((result@15@00 (isGreaterOne22%limited s@$ r@14@00))) true)
  :pattern ((isGreaterOne22%limited s@$ r@14@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (r@14@00 $Ref)) (!
  (let ((result@15@00 (isGreaterOne22%limited s@$ r@14@00))) true)
  :pattern ((isGreaterOne22%limited s@$ r@14@00))
  :qid |quant-u-49|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@14@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] isGreaterOne(r.f)
(set-option :timeout 0)
(push) ; 2
; [eval] i > -60
; [eval] -60
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(pop) ; 2
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))
  (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
(assert (=
  result@15@00
  (isGreaterOne%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(s@$) > 60 | live]
; [else-branch: 10 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 10 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(push) ; 2
(assert (not (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@15@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@15@00))
; [eval] result == r.f > 1
; [eval] r.f > 1
(push) ; 2
(assert (not (= result@15@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1))))
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
; [eval] result == r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@15@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1))))
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
; [eval] result == r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@15@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1))))
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
; [eval] result == r.f > 1
; [eval] r.f > 1
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@15@00 (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- FUNCTION fac2----------
(declare-fun i@16@00 () Int)
(declare-fun result@17@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@16@00 Int)) (!
  (= (fac2%limited s@$ i@16@00) (fac2 s@$ i@16@00))
  :pattern ((fac2 s@$ i@16@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (i@16@00 Int)) (!
  (fac2%stateless i@16@00)
  :pattern ((fac2%limited s@$ i@16@00))
  :qid |quant-u-17|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i <= 1 ? 1 : i * fac2(i - 1))
; [eval] i <= 1
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= i@16@00 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= i@16@00 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | i@16@00 <= 1 | live]
; [else-branch: 11 | !(i@16@00 <= 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | i@16@00 <= 1]
(assert (<= i@16@00 1))
(pop) ; 3
(push) ; 3
; [else-branch: 11 | !(i@16@00 <= 1)]
(assert (not (<= i@16@00 1)))
; [eval] i * fac2(i - 1)
; [eval] fac2(i - 1)
; [eval] i - 1
(push) ; 4
(assert (fac2%precondition $Snap.unit (- i@16@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fac2%precondition $Snap.unit (- i@16@00 1)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (<= i@16@00 1))
  (and (not (<= i@16@00 1)) (fac2%precondition $Snap.unit (- i@16@00 1)))))
(assert (or (not (<= i@16@00 1)) (<= i@16@00 1)))
(assert (=
  result@17@00
  (ite (<= i@16@00 1) 1 (* i@16@00 (fac2%limited $Snap.unit (- i@16@00 1))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@16@00 Int)) (!
  (=>
    (fac2%precondition s@$ i@16@00)
    (=
      (fac2 s@$ i@16@00)
      (ite (<= i@16@00 1) 1 (* i@16@00 (fac2%limited $Snap.unit (- i@16@00 1))))))
  :pattern ((fac2 s@$ i@16@00))
  :qid |quant-u-50|)))
(assert (forall ((s@$ $Snap) (i@16@00 Int)) (!
  (=>
    (fac2%precondition s@$ i@16@00)
    (ite (<= i@16@00 1) true (fac2%precondition $Snap.unit (- i@16@00 1))))
  :pattern ((fac2 s@$ i@16@00))
  :qid |quant-u-51|)))
; ---------- FUNCTION isGreaterOne35----------
(declare-fun r@18@00 () $Ref)
(declare-fun result@19@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@18@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] r.f > -38
; [eval] -38
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
(declare-const $t@31@00 $Snap)
(assert (= $t@31@00 $Snap.unit))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(s@$) > 60 | live]
; [else-branch: 12 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 12 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@19@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (= (isGreaterOne35%limited s@$ r@18@00) (isGreaterOne35 s@$ r@18@00))
  :pattern ((isGreaterOne35 s@$ r@18@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (isGreaterOne35%stateless r@18@00)
  :pattern ((isGreaterOne35%limited s@$ r@18@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (let ((result@19@00 (isGreaterOne35%limited s@$ r@18@00))) (=>
    (and
      (isGreaterOne35%precondition s@$ r@18@00)
      (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
    result@19@00))
  :pattern ((isGreaterOne35%limited s@$ r@18@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (let ((result@19@00 (isGreaterOne35%limited s@$ r@18@00))) true)
  :pattern ((isGreaterOne35%limited s@$ r@18@00))
  :qid |quant-u-53|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@18@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] isGreaterOne(r.f)
(set-option :timeout 0)
(push) ; 2
; [eval] i > -60
; [eval] -60
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(pop) ; 2
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))
  (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
(assert (=
  result@19@00
  (isGreaterOne%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(s@$) > 60 | live]
; [else-branch: 13 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 13 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(push) ; 2
(assert (not (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@19@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@19@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (=>
    (isGreaterOne35%precondition s@$ r@18@00)
    (=
      (isGreaterOne35 s@$ r@18@00)
      (isGreaterOne%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne35 s@$ r@18@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (r@18@00 $Ref)) (!
  (=>
    (isGreaterOne35%precondition s@$ r@18@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne35 s@$ r@18@00))
  :qid |quant-u-55|)))
; ---------- FUNCTION isGreaterOne2----------
(declare-fun r@20@00 () $Ref)
(declare-fun result@21@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@20@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] r.f > -38
; [eval] -38
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
(declare-const $t@32@00 $Snap)
(assert (= $t@32@00 $Snap.unit))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(s@$) > 60 | live]
; [else-branch: 14 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 14 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@21@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (= (isGreaterOne2%limited s@$ r@20@00) (isGreaterOne2 s@$ r@20@00))
  :pattern ((isGreaterOne2 s@$ r@20@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (isGreaterOne2%stateless r@20@00)
  :pattern ((isGreaterOne2%limited s@$ r@20@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (let ((result@21@00 (isGreaterOne2%limited s@$ r@20@00))) (=>
    (and
      (isGreaterOne2%precondition s@$ r@20@00)
      (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
    result@21@00))
  :pattern ((isGreaterOne2%limited s@$ r@20@00))
  :qid |quant-u-56|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (let ((result@21@00 (isGreaterOne2%limited s@$ r@20@00))) true)
  :pattern ((isGreaterOne2%limited s@$ r@20@00))
  :qid |quant-u-57|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@20@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] isGreaterOne(r.f)
(set-option :timeout 0)
(push) ; 2
; [eval] i > -60
; [eval] -60
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(pop) ; 2
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))
  (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
(assert (=
  result@21@00
  (isGreaterOne%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(s@$) > 60 | live]
; [else-branch: 15 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 15 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(push) ; 2
(assert (not (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@21@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@21@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (=>
    (isGreaterOne2%precondition s@$ r@20@00)
    (=
      (isGreaterOne2 s@$ r@20@00)
      (isGreaterOne%limited $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne2 s@$ r@20@00))
  :qid |quant-u-58|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (=>
    (isGreaterOne2%precondition s@$ r@20@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne2 s@$ r@20@00))
  :qid |quant-u-59|)))
; ---------- FUNCTION isGreaterOne34----------
(declare-fun r@22@00 () $Ref)
(declare-fun result@23@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@22@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] r.f > -38
; [eval] -38
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
(declare-const $t@33@00 $Snap)
(assert (= $t@33@00 $Snap.unit))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(s@$) > 60 | live]
; [else-branch: 16 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 16 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 16 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@23@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (= (isGreaterOne34%limited s@$ r@22@00) (isGreaterOne34 s@$ r@22@00))
  :pattern ((isGreaterOne34 s@$ r@22@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (isGreaterOne34%stateless r@22@00)
  :pattern ((isGreaterOne34%limited s@$ r@22@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (let ((result@23@00 (isGreaterOne34%limited s@$ r@22@00))) (=>
    (and
      (isGreaterOne34%precondition s@$ r@22@00)
      (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
    result@23@00))
  :pattern ((isGreaterOne34%limited s@$ r@22@00))
  :qid |quant-u-60|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (let ((result@23@00 (isGreaterOne34%limited s@$ r@22@00))) true)
  :pattern ((isGreaterOne34%limited s@$ r@22@00))
  :qid |quant-u-61|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= r@22@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 38)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] @reveal() (isGreaterOne(r.f))
(set-option :timeout 0)
(push) ; 2
; [eval] i > -60
; [eval] -60
(push) ; 3
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60)))
(assert (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(pop) ; 2
; Joined path conditions
(assert (and
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) (- 0 60))
  (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
(assert (=
  result@23@00
  (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
; [eval] r.f > 60 ==> result
; [eval] r.f > 60
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | First:(s@$) > 60 | live]
; [else-branch: 17 | !(First:(s@$) > 60) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | First:(s@$) > 60]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
(pop) ; 3
(push) ; 3
; [else-branch: 17 | !(First:(s@$) > 60)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60))
  (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60)))
(push) ; 2
(assert (not (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@23@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 60) result@23@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (=>
    (isGreaterOne34%precondition s@$ r@22@00)
    (=
      (isGreaterOne34 s@$ r@22@00)
      (isGreaterOne $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((isGreaterOne34 s@$ r@22@00))
  :qid |quant-u-62|)))
(assert (forall ((s@$ $Snap) (r@22@00 $Ref)) (!
  (=>
    (isGreaterOne34%precondition s@$ r@22@00)
    (isGreaterOne%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((isGreaterOne34 s@$ r@22@00))
  :qid |quant-u-63|)))
; ---------- FUNCTION funP2----------
(declare-fun x@24@00 () $Ref)
(declare-fun result@25@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@24@00 $Ref)) (!
  (= (funP2%limited s@$ x@24@00) (funP2 s@$ x@24@00))
  :pattern ((funP2 s@$ x@24@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (x@24@00 $Ref)) (!
  (funP2%stateless x@24@00)
  :pattern ((funP2%limited s@$ x@24@00))
  :qid |quant-u-25|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P(x), write) in x.f)
(set-option :timeout 0)
(push) ; 2
(assert (P%trigger s@$ x@24@00))
(assert (not (= x@24@00 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and (P%trigger s@$ x@24@00) (not (= x@24@00 $Ref.null))))
(assert (= result@25@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@24@00 $Ref)) (!
  (=>
    (funP2%precondition s@$ x@24@00)
    (= (funP2 s@$ x@24@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((funP2 s@$ x@24@00))
  :qid |quant-u-64|)))
(assert (forall ((s@$ $Snap) (x@24@00 $Ref)) (!
  true
  :pattern ((funP2 s@$ x@24@00))
  :qid |quant-u-65|)))
; ---------- P ----------
(declare-const x@34@00 $Ref)
(push) ; 1
(declare-const $t@35@00 Int)
(assert (not (= x@34@00 $Ref.null)))
(pop) ; 1
