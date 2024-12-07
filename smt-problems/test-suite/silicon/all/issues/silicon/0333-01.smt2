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
; ---------- FUNCTION p----------
(declare-fun result@0@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (p%limited s@$) (p s@$))
  :pattern ((p s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as p%stateless  Bool)
  :pattern ((p%limited s@$))
  :qid |quant-u-1|)))
; ---------- FUNCTION I2----------
(declare-fun t@1@00 () $Ref)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@1@00 $Ref)) (!
  (= (I2%limited s@$ t@1@00) (I2 s@$ t@1@00))
  :pattern ((I2 s@$ t@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (t@1@00 $Ref)) (!
  (I2%stateless t@1@00)
  :pattern ((I2%limited s@$ t@1@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(I(t), write) in t != null ==> (let up == ((p() ? t.l : t.r)) in (let dn == ((p() ? t.r : t.l)) in I2(dn) && I2(up))))
(set-option :timeout 0)
(push) ; 2
(assert (I%trigger s@$ t@1@00))
; [eval] t != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= t@1@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= t@1@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | t@1@00 != Null | live]
; [else-branch: 0 | t@1@00 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | t@1@00 != Null]
(assert (not (= t@1@00 $Ref.null)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] p()
(push) ; 4
(assert (p%precondition $Snap.unit))
(pop) ; 4
; Joined path conditions
(assert (p%precondition $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (p $Snap.unit))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (p $Snap.unit)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | p(_) | live]
; [else-branch: 1 | !(p(_)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | p(_)]
(assert (p $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] t != null ==> (let up == ((p() ? t.l : t.r)) in (let dn == ((p() ? t.r : t.l)) in I2(dn) && I2(up)))
; [eval] t != null
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= t@1@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | t@1@00 != Null | live]
; [else-branch: 2 | t@1@00 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | t@1@00 != Null]
; [eval] (let up == ((p() ? t.l : t.r)) in (let dn == ((p() ? t.r : t.l)) in I2(dn) && I2(up)))
; [eval] (p() ? t.l : t.r)
; [eval] p()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (p $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | p(_) | live]
; [else-branch: 3 | !(p(_)) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 3 | p(_)]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(declare-fun letvar@3@00 ($Snap $Ref) $Ref)
(assert (=
  (letvar@3@00 s@$ t@1@00)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
; [eval] (let dn == ((p() ? t.r : t.l)) in I2(dn) && I2(up))
; [eval] (p() ? t.r : t.l)
; [eval] p()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (p $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | p(_) | live]
; [else-branch: 4 | !(p(_)) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 4 | p(_)]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(declare-fun letvar@4@00 ($Snap $Ref) $Ref)
(assert (= (letvar@4@00 s@$ t@1@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] I2(dn) && I2(up)
; [eval] I2(dn)
(push) ; 7
(assert (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 7
; Joined path conditions
(assert (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(push) ; 7
; [then-branch: 5 | !(I2(First:(Second:(Second:(s@$))), First:(s@$))) | live]
; [else-branch: 5 | I2(First:(Second:(Second:(s@$))), First:(s@$)) | live]
(push) ; 8
; [then-branch: 5 | !(I2(First:(Second:(Second:(s@$))), First:(s@$)))]
(assert (not
  (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | I2(First:(Second:(Second:(s@$))), First:(s@$))]
(assert (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] I2(up)
(push) ; 9
(assert (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 9
; Joined path conditions
(assert (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (and
    (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(assert (or
  (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (not
    (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= t@1@00 $Ref.null))
  (and
    (=
      (letvar@3@00 s@$ t@1@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (= (letvar@4@00 s@$ t@1@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (=>
      (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (and
        (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
    (or
      (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (not
        (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(p(_))]
(assert (not (p $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] t != null ==> (let up == ((p() ? t.l : t.r)) in (let dn == ((p() ? t.r : t.l)) in I2(dn) && I2(up)))
; [eval] t != null
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= t@1@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | t@1@00 != Null | live]
; [else-branch: 6 | t@1@00 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | t@1@00 != Null]
; [eval] (let up == ((p() ? t.l : t.r)) in (let dn == ((p() ? t.r : t.l)) in I2(dn) && I2(up)))
; [eval] (p() ? t.l : t.r)
; [eval] p()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 7 | p(_) | dead]
; [else-branch: 7 | !(p(_)) | live]
(push) ; 8
; [else-branch: 7 | !(p(_))]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(declare-fun letvar@5@00 ($Snap $Ref) $Ref)
(assert (= (letvar@5@00 s@$ t@1@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] (let dn == ((p() ? t.r : t.l)) in I2(dn) && I2(up))
; [eval] (p() ? t.r : t.l)
; [eval] p()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 8 | p(_) | dead]
; [else-branch: 8 | !(p(_)) | live]
(push) ; 8
; [else-branch: 8 | !(p(_))]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(declare-fun letvar@6@00 ($Snap $Ref) $Ref)
(assert (=
  (letvar@6@00 s@$ t@1@00)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
; [eval] I2(dn) && I2(up)
; [eval] I2(dn)
(push) ; 7
(assert (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 7
; Joined path conditions
(assert (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(push) ; 7
; [then-branch: 9 | !(I2(Second:(Second:(Second:(s@$))), First:(Second:(s@$)))) | live]
; [else-branch: 9 | I2(Second:(Second:(Second:(s@$))), First:(Second:(s@$))) | live]
(push) ; 8
; [then-branch: 9 | !(I2(Second:(Second:(Second:(s@$))), First:(Second:(s@$))))]
(assert (not
  (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | I2(Second:(Second:(Second:(s@$))), First:(Second:(s@$)))]
(assert (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
; [eval] I2(up)
(push) ; 9
(assert (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 9
; Joined path conditions
(assert (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
  (and
    (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))
(assert (or
  (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
  (not
    (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= t@1@00 $Ref.null))
  (and
    (= (letvar@5@00 s@$ t@1@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (=
      (letvar@6@00 s@$ t@1@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (=>
      (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      (and
        (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
    (or
      (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      (not
        (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | t@1@00 == Null]
(assert (= t@1@00 $Ref.null))
(assert (= s@$ $Snap.unit))
; [eval] t != null ==> (let up == ((p() ? t.l : t.r)) in (let dn == ((p() ? t.r : t.l)) in I2(dn) && I2(up)))
; [eval] t != null
(push) ; 4
; [then-branch: 10 | t@1@00 != Null | dead]
; [else-branch: 10 | t@1@00 == Null | live]
(push) ; 5
; [else-branch: 10 | t@1@00 == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@7@00 ($Snap $Ref) Bool)
(assert (=>
  (and (p $Snap.unit) (not (= t@1@00 $Ref.null)))
  (=
    (joined_unfolding@7@00 s@$ t@1@00)
    (=>
      (not (= t@1@00 $Ref.null))
      (and
        (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))))
(assert (=>
  (and (not (p $Snap.unit)) (not (= t@1@00 $Ref.null)))
  (=
    (joined_unfolding@7@00 s@$ t@1@00)
    (=>
      (not (= t@1@00 $Ref.null))
      (and
        (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))))
(assert (=> (= t@1@00 $Ref.null) (= (joined_unfolding@7@00 s@$ t@1@00) true)))
; Joined path conditions
(assert (I%trigger s@$ t@1@00))
(assert (=>
  (not (= t@1@00 $Ref.null))
  (and
    (not (= t@1@00 $Ref.null))
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (p%precondition $Snap.unit))))
(assert (=>
  (and (not (= t@1@00 $Ref.null)) (p $Snap.unit))
  (and
    (p $Snap.unit)
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (=>
      (not (= t@1@00 $Ref.null))
      (and
        (=
          (letvar@3@00 s@$ t@1@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (=
          (letvar@4@00 s@$ t@1@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (=>
          (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
          (and
            (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
        (or
          (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
          (not
            (I2 ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))))))
; Joined path conditions
(assert (=>
  (and (not (= t@1@00 $Ref.null)) (not (p $Snap.unit)))
  (and
    (not (p $Snap.unit))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (=>
      (not (= t@1@00 $Ref.null))
      (and
        (=
          (letvar@5@00 s@$ t@1@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (=
          (letvar@6@00 s@$ t@1@00)
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (I2%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (=>
          (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
          (and
            (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
            (I2%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
        (or
          (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
          (not
            (I2 ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))))))
; Joined path conditions
(assert (=> (= t@1@00 $Ref.null) (and (= t@1@00 $Ref.null) (= s@$ $Snap.unit))))
(assert (or
  (= t@1@00 $Ref.null)
  (and (not (p $Snap.unit)) (not (= t@1@00 $Ref.null)))
  (and (p $Snap.unit) (not (= t@1@00 $Ref.null)))))
(assert (= result@2@00 (joined_unfolding@7@00 s@$ t@1@00)))
(pop) ; 1
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
; ---------- I ----------
(declare-const t@8@00 $Ref)
(push) ; 1
; [eval] t != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= t@8@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= t@8@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | t@8@00 != Null | live]
; [else-branch: 11 | t@8@00 == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 11 | t@8@00 != Null]
(assert (not (= t@8@00 $Ref.null)))
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 ($Snap.combine ($Snap.first $t@9@00) ($Snap.second $t@9@00))))
(assert (=
  ($Snap.second $t@9@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@00))
    ($Snap.second ($Snap.second $t@9@00)))))
; [eval] p()
(push) ; 3
(assert (p%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (p%precondition $Snap.unit))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (p $Snap.unit))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (p $Snap.unit)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | p(_) | live]
; [else-branch: 12 | !(p(_)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | p(_)]
(assert (p $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second $t@9@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@9@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@9@00))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 12 | !(p(_))]
(assert (not (p $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second $t@9@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@9@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@9@00))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [else-branch: 11 | t@8@00 == Null]
(assert (= t@8@00 $Ref.null))
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
