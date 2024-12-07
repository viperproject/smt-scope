(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:49
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0851.vpr
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
(declare-fun fun01 ($Snap $Ref Bool Bool) Int)
(declare-fun fun01%limited ($Snap $Ref Bool Bool) Int)
(declare-fun fun01%stateless ($Ref Bool Bool) Bool)
(declare-fun fun01%precondition ($Snap $Ref Bool Bool) Bool)
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
; ---------- FUNCTION fun01----------
(declare-fun x@0@00 () $Ref)
(declare-fun b1@1@00 () Bool)
(declare-fun b2@2@00 () Bool)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] (b1 ? 1 / 3 : none)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b1@1@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b1@1@00 | live]
; [else-branch: 0 | !(b1@1@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b1@1@00]
(assert b1@1@00)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b1@1@00)]
(assert (not b1@1@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not b1@1@00) b1@1@00))
(push) ; 2
(assert (not (or (= (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No) b1@1@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=>
  b1@1@00
  (=
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(assert (<=
  $Perm.No
  (+
    (/ (to_real 1) (to_real 3))
    (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))))
(assert (<=
  (+
    (/ (to_real 1) (to_real 3))
    (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (/ (to_real 1) (to_real 3))
      (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No)))
  (not (= x@0@00 $Ref.null))))
; [eval] (b2 ? 1 / 3 : none)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b2@2@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b2@2@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b2@2@00 | live]
; [else-branch: 1 | !(b2@2@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | b2@2@00]
(assert b2@2@00)
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(b2@2@00)]
(assert (not b2@2@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not b2@2@00) b2@2@00))
(push) ; 2
(assert (not (or (= (ite b2@2@00 (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No) b2@2@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $t@4@00 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (/ (to_real 1) (to_real 3))
        (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No)))
    (= $t@4@00 ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  (=>
    b2@2@00
    (= $t@4@00 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))))
(assert (<=
  $Perm.No
  (+
    (+
      (/ (to_real 1) (to_real 3))
      (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
    (ite b2@2@00 (/ (to_real 1) (to_real 3)) $Perm.No))))
(assert (<=
  (+
    (+
      (/ (to_real 1) (to_real 3))
      (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
    (ite b2@2@00 (/ (to_real 1) (to_real 3)) $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (+
        (/ (to_real 1) (to_real 3))
        (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
      (ite b2@2@00 (/ (to_real 1) (to_real 3)) $Perm.No)))
  (not (= x@0@00 $Ref.null))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b1@1@00 Bool) (b2@2@00 Bool)) (!
  (=
    (fun01%limited s@$ x@0@00 b1@1@00 b2@2@00)
    (fun01 s@$ x@0@00 b1@1@00 b2@2@00))
  :pattern ((fun01 s@$ x@0@00 b1@1@00 b2@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b1@1@00 Bool) (b2@2@00 Bool)) (!
  (fun01%stateless x@0@00 b1@1@00 b2@2@00)
  :pattern ((fun01%limited s@$ x@0@00 b1@1@00 b2@2@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (or (not b1@1@00) b1@1@00))
(assert (=>
  b1@1@00
  (=
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(assert (<=
  $Perm.No
  (+
    (/ (to_real 1) (to_real 3))
    (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))))
(assert (<=
  (+
    (/ (to_real 1) (to_real 3))
    (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (/ (to_real 1) (to_real 3))
      (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No)))
  (not (= x@0@00 $Ref.null))))
(assert (or (not b2@2@00) b2@2@00))
(assert (=>
  (<
    $Perm.No
    (+
      (/ (to_real 1) (to_real 3))
      (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No)))
  (= $t@4@00 ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
(assert (=>
  b2@2@00
  (= $t@4@00 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$))))))
(assert (<=
  $Perm.No
  (+
    (+
      (/ (to_real 1) (to_real 3))
      (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
    (ite b2@2@00 (/ (to_real 1) (to_real 3)) $Perm.No))))
(assert (<=
  (+
    (+
      (/ (to_real 1) (to_real 3))
      (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
    (ite b2@2@00 (/ (to_real 1) (to_real 3)) $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (+
        (/ (to_real 1) (to_real 3))
        (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
      (ite b2@2@00 (/ (to_real 1) (to_real 3)) $Perm.No)))
  (not (= x@0@00 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (/ (to_real 1) (to_real 3))
      (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No))
    (ite b2@2@00 (/ (to_real 1) (to_real 3)) $Perm.No)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 $t@4@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b1@1@00 Bool) (b2@2@00 Bool)) (!
  (and
    (and
      (=>
        (<
          $Perm.No
          (+
            (/ (to_real 1) (to_real 3))
            (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No)))
        (= $t@4@00 ($SortWrappers.$SnapToInt ($Snap.first s@$))))
      (=>
        b2@2@00
        (= $t@4@00 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$))))))
    (=>
      (fun01%precondition s@$ x@0@00 b1@1@00 b2@2@00)
      (= (fun01 s@$ x@0@00 b1@1@00 b2@2@00) $t@4@00)))
  :pattern ((fun01 s@$ x@0@00 b1@1@00 b2@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b1@1@00 Bool) (b2@2@00 Bool)) (!
  true
  :pattern ((fun01 s@$ x@0@00 b1@1@00 b2@2@00))
  :qid |quant-u-3|)))
