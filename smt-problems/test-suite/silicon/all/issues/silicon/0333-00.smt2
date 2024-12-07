(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0333.vpr
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
(declare-fun p ($Snap) Bool)
(declare-fun p%limited ($Snap) Bool)
(declare-const p%stateless Bool)
(declare-fun p%precondition ($Snap) Bool)
(declare-fun I2 ($Snap $Ref) Bool)
(declare-fun I2%limited ($Snap $Ref) Bool)
(declare-fun I2%stateless ($Ref) Bool)
(declare-fun I2%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun I%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@7@00 ($Snap $Ref) Bool)
(declare-fun letvar@3@00 ($Snap $Ref) $Ref)
(declare-fun letvar@4@00 ($Snap $Ref) $Ref)
(declare-fun letvar@5@00 ($Snap $Ref) $Ref)
(declare-fun letvar@6@00 ($Snap $Ref) $Ref)
(assert (forall ((s@$ $Snap)) (!
  (= (p%limited s@$) (p s@$))
  :pattern ((p s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as p%stateless  Bool)
  :pattern ((p%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (t@1@00 $Ref)) (!
  (= (I2%limited s@$ t@1@00) (I2 s@$ t@1@00))
  :pattern ((I2 s@$ t@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (t@1@00 $Ref)) (!
  (I2%stateless t@1@00)
  :pattern ((I2%limited s@$ t@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (t@1@00 $Ref)) (!
  (=>
    (I2%precondition s@$ t@1@00)
    (=
      (I2 s@$ t@1@00)
      (=>
        (not (= t@1@00 $Ref.null))
        (let ((up (ite
          (p $Snap.unit)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))) (let ((dn (ite
          (p $Snap.unit)
          ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))) (and
          (I2%limited (ite
            (p $Snap.unit)
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))) dn)
          (I2%limited (ite
            (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (ite
              (and (not (= t@1@00 $Ref.null)) (p $Snap.unit))
              ($Snap.second ($Snap.second ($Snap.second s@$)))
              ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.first ($Snap.second ($Snap.second s@$)))) up)))))))
  :pattern ((I2 s@$ t@1@00))
  :pattern ((I2%stateless t@1@00) (I%trigger s@$ t@1@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (t@1@00 $Ref)) (!
  (=>
    (and (I2%precondition s@$ t@1@00) (not (= t@1@00 $Ref.null)))
    (and
      (p%precondition $Snap.unit)
      (let ((up (ite
        (p $Snap.unit)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))) (and
        (p%precondition $Snap.unit)
        (let ((dn (ite
          (p $Snap.unit)
          ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))) (and
          (and
            (p%precondition $Snap.unit)
            (I2%precondition (ite
              (p $Snap.unit)
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.second ($Snap.second ($Snap.second s@$)))) dn))
          (=>
            (I2%limited (ite
              (p $Snap.unit)
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.second ($Snap.second ($Snap.second s@$)))) dn)
            (and
              (and
                (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (ite
                  (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                  (=> (not (= t@1@00 $Ref.null)) (p%precondition $Snap.unit))
                  true))
              (I2%precondition (ite
                (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (ite
                  (and (not (= t@1@00 $Ref.null)) (p $Snap.unit))
                  ($Snap.second ($Snap.second ($Snap.second s@$)))
                  ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.first ($Snap.second ($Snap.second s@$)))) up)))))))))
  :pattern ((I2 s@$ t@1@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- fail ----------
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@0@01 $Snap)
(assert (= $t@0@01 $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
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
