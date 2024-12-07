(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:59:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/unofficial007.vpr
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
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
(declare-fun itemAt ($Snap $Ref Int) Int)
(declare-fun itemAt%limited ($Snap $Ref Int) Int)
(declare-fun itemAt%stateless ($Ref Int) Bool)
(declare-fun itemAt%precondition ($Snap $Ref Int) Bool)
(declare-fun ascending ($Snap $Ref) Bool)
(declare-fun ascending%limited ($Snap $Ref) Bool)
(declare-fun ascending%stateless ($Ref) Bool)
(declare-fun ascending%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun SortedList%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION length----------
(declare-fun xs@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 $Snap.unit))
; [eval] result > 0
(assert (> result@1@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (= (length%limited s@$ xs@0@00) (length s@$ xs@0@00))
  :pattern ((length s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (length%stateless xs@0@00)
  :pattern ((length%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ xs@0@00))) (=>
    (length%precondition s@$ xs@0@00)
    (> result@1@00 0)))
  :pattern ((length%limited s@$ xs@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ xs@0@00))) true)
  :pattern ((length%limited s@$ xs@0@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] 1 + (unfolding acc(SortedList(xs), write) in (xs.next == null ? 0 : length(xs.next)))
; [eval] (unfolding acc(SortedList(xs), write) in (xs.next == null ? 0 : length(xs.next)))
(set-option :timeout 0)
(push) ; 2
(assert (SortedList%trigger s@$ xs@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= xs@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(s@$)) != Null | live]
; [else-branch: 0 | First:(Second:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] xs.next != null ==> xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.next != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(s@$)) != Null | live]
; [else-branch: 1 | First:(Second:(s@$)) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:(Second:(s@$)) != Null]
; [eval] xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.val <= itemAt(xs.next, 0)
; [eval] itemAt(xs.next, 0)
(push) ; 6
; [eval] 0 <= i
; [eval] i < length(xs)
; [eval] length(xs)
(push) ; 7
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(push) ; 7
(assert (not (<
  0
  (length ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (length ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
(pop) ; 6
; Joined path conditions
(assert (and
  (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
  (<
    0
    (length ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
  (itemAt%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0)))
(push) ; 6
; [then-branch: 2 | !(First:(s@$) <= itemAt((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), 0)) | live]
; [else-branch: 2 | First:(s@$) <= itemAt((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), 0) | live]
(push) ; 7
; [then-branch: 2 | !(First:(s@$) <= itemAt((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), 0))]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | First:(s@$) <= itemAt((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), 0)]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first s@$))
  (itemAt ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0)))
; [eval] ascending(xs.next)
(push) ; 8
(assert (ascending%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 8
; Joined path conditions
(assert (ascending%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first s@$))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
    (ascending%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first s@$))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (<
      0
      (length ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
    (itemAt%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0)
    (=>
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        (itemAt ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first s@$))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
        (ascending%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        (itemAt ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first s@$))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0)))))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first s@$))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
    (ascending ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
; [eval] (xs.next == null ? 0 : length(xs.next))
; [eval] xs.next == null
(push) ; 4
; [then-branch: 3 | First:(Second:(s@$)) == Null | dead]
; [else-branch: 3 | First:(Second:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 3 | First:(Second:(s@$)) != Null]
; [eval] length(xs.next)
(push) ; 6
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] xs.next != null ==> xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.next != null
(push) ; 4
; [then-branch: 4 | First:(Second:(s@$)) != Null | dead]
; [else-branch: 4 | First:(Second:(s@$)) == Null | live]
(push) ; 5
; [else-branch: 4 | First:(Second:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] (xs.next == null ? 0 : length(xs.next))
; [eval] xs.next == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(s@$)) == Null | live]
; [else-branch: 5 | First:(Second:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | First:(Second:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@8@00 ($Snap $Ref) Int)
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (=
    (joined_unfolding@8@00 s@$ xs@0@00)
    (length ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (= (joined_unfolding@8@00 s@$ xs@0@00) 0)))
; Joined path conditions
(assert (and
  (SortedList%trigger s@$ xs@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= xs@0@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (<
          0
          (length ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
        (itemAt%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0)
        (=>
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first s@$))
            (itemAt ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
          (and
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first s@$))
              (itemAt ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
            (ascending%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
        (or
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first s@$))
            (itemAt ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
          (not
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first s@$))
              (itemAt ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first s@$))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) 0))
        (ascending ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
; Joined path conditions
(assert (and
  (SortedList%trigger s@$ xs@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= xs@0@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(assert (= result@1@00 (+ 1 (joined_unfolding@8@00 s@$ xs@0@00))))
; [eval] result > 0
(push) ; 2
(assert (not (> result@1@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (> result@1@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ xs@0@00)
    (=
      (length s@$ xs@0@00)
      (+
        1
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)
          0
          (length%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((length s@$ xs@0@00))
  :pattern ((length%stateless xs@0@00) (SortedList%trigger s@$ xs@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ xs@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (length%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((length s@$ xs@0@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION itemAt----------
(declare-fun xs@2@00 () $Ref)
(declare-fun i@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@3@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] i < length(xs)
; [eval] length(xs)
(push) ; 2
(assert (length%precondition ($Snap.first s@$) xs@2@00))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.first s@$) xs@2@00))
(assert (< i@3@00 (length ($Snap.first s@$) xs@2@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref) (i@3@00 Int)) (!
  (= (itemAt%limited s@$ xs@2@00 i@3@00) (itemAt s@$ xs@2@00 i@3@00))
  :pattern ((itemAt s@$ xs@2@00 i@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref) (i@3@00 Int)) (!
  (itemAt%stateless xs@2@00 i@3@00)
  :pattern ((itemAt%limited s@$ xs@2@00 i@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= 0 i@3@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (length%precondition ($Snap.first s@$) xs@2@00))
(assert (< i@3@00 (length ($Snap.first s@$) xs@2@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(SortedList(xs), write) in (i == 0 ? xs.val : itemAt(xs.next, i - 1)))
(set-option :timeout 0)
(push) ; 2
(assert (SortedList%trigger ($Snap.first s@$) xs@2@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (not (= xs@2@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:(s@$))) != Null | live]
; [else-branch: 6 | First:(Second:(First:(s@$))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(Second:(First:(s@$))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null ==> xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.next != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(First:(s@$))) != Null | live]
; [else-branch: 7 | First:(Second:(First:(s@$))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | First:(Second:(First:(s@$))) != Null]
; [eval] xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.val <= itemAt(xs.next, 0)
; [eval] itemAt(xs.next, 0)
(push) ; 6
; [eval] 0 <= i
; [eval] i < length(xs)
; [eval] length(xs)
(push) ; 7
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(push) ; 7
(assert (not (<
  0
  (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
(pop) ; 6
; Joined path conditions
(assert (and
  (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
  (<
    0
    (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
  (itemAt%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0)))
(push) ; 6
; [then-branch: 8 | !(First:(First:(s@$)) <= itemAt((First:(Second:(Second:(First:(s@$)))), (_, _)), First:(Second:(First:(s@$))), 0)) | live]
; [else-branch: 8 | First:(First:(s@$)) <= itemAt((First:(Second:(Second:(First:(s@$)))), (_, _)), First:(Second:(First:(s@$))), 0) | live]
(push) ; 7
; [then-branch: 8 | !(First:(First:(s@$)) <= itemAt((First:(Second:(Second:(First:(s@$)))), (_, _)), First:(Second:(First:(s@$))), 0))]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | First:(First:(s@$)) <= itemAt((First:(Second:(Second:(First:(s@$)))), (_, _)), First:(Second:(First:(s@$))), 0)]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
  (itemAt ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0)))
; [eval] ascending(xs.next)
(push) ; 8
(assert (ascending%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(pop) ; 8
; Joined path conditions
(assert (ascending%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
    (ascending%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))))
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))
  (and
    (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
    (<
      0
      (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
    (itemAt%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0)
    (=>
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
        (itemAt ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
        (ascending%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))))
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
        (itemAt ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0)))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
    (ascending ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))))
; [eval] (i == 0 ? xs.val : itemAt(xs.next, i - 1))
; [eval] i == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= i@3@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= i@3@00 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | i@3@00 == 0 | live]
; [else-branch: 9 | i@3@00 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | i@3@00 == 0]
(assert (= i@3@00 0))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | i@3@00 != 0]
(assert (not (= i@3@00 0)))
; [eval] itemAt(xs.next, i - 1)
; [eval] i - 1
(push) ; 6
; [eval] 0 <= i
(push) ; 7
(assert (not (<= 0 (- i@3@00 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- i@3@00 1)))
; [eval] i < length(xs)
; [eval] length(xs)
(push) ; 7
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(push) ; 7
(assert (not (<
  (- i@3@00 1)
  (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- i@3@00 1)
  (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
  i@3@00
  1)))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 (- i@3@00 1))
  (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
  (<
    (- i@3@00 1)
    (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
  (itemAt%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
    i@3@00
    1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= i@3@00 0))
  (and
    (not (= i@3@00 0))
    (<= 0 (- i@3@00 1))
    (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
    (<
      (- i@3@00 1)
      (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
    (itemAt%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
      i@3@00
      1)))))
(assert (or (not (= i@3@00 0)) (= i@3@00 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | First:(Second:(First:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null ==> xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.next != null
(push) ; 4
; [then-branch: 10 | First:(Second:(First:(s@$))) != Null | dead]
; [else-branch: 10 | First:(Second:(First:(s@$))) == Null | live]
(push) ; 5
; [else-branch: 10 | First:(Second:(First:(s@$))) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] (i == 0 ? xs.val : itemAt(xs.next, i - 1))
; [eval] i == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= i@3@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= i@3@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | i@3@00 == 0 | live]
; [else-branch: 11 | i@3@00 != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | i@3@00 == 0]
(assert (= i@3@00 0))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (= i@3@00 0))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@9@00 ($Snap $Ref Int) Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))
  (=
    (joined_unfolding@9@00 s@$ xs@2@00 i@3@00)
    (ite
      (= i@3@00 0)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
        i@3@00
        1))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)
  (=
    (joined_unfolding@9@00 s@$ xs@2@00 i@3@00)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$))))))
; Joined path conditions
(assert (and
  (SortedList%trigger ($Snap.first s@$) xs@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (not (= xs@2@00 $Ref.null))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
        $Ref.null))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          $Ref.null))
      (and
        (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
        (<
          0
          (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
        (itemAt%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0)
        (=>
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
            (itemAt ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
          (and
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
              (itemAt ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
            (ascending%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))))
        (or
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
            (itemAt ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
          (not
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
              (itemAt ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          $Ref.null))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) 0))
        (ascending ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))))
    (=>
      (not (= i@3@00 0))
      (and
        (not (= i@3@00 0))
        (<= 0 (- i@3@00 1))
        (length%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
        (<
          (- i@3@00 1)
          (length ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
        (itemAt%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
          i@3@00
          1))))
    (or (not (= i@3@00 0)) (= i@3@00 0)))))
; Joined path conditions
(assert (and
  (SortedList%trigger ($Snap.first s@$) xs@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (not (= xs@2@00 $Ref.null))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null)
    (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (= i@3@00 0))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))))
(assert (= result@4@00 (joined_unfolding@9@00 s@$ xs@2@00 i@3@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref) (i@3@00 Int)) (!
  (=>
    (itemAt%precondition s@$ xs@2@00 i@3@00)
    (=
      (itemAt s@$ xs@2@00 i@3@00)
      (ite
        (= i@3@00 0)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
        (itemAt%limited ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
          i@3@00
          1)))))
  :pattern ((itemAt s@$ xs@2@00 i@3@00))
  :pattern ((itemAt%stateless xs@2@00 i@3@00) (SortedList%trigger ($Snap.first s@$) xs@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref) (i@3@00 Int)) (!
  (=>
    (itemAt%precondition s@$ xs@2@00 i@3@00)
    (ite
      (= i@3@00 0)
      true
      (itemAt%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
        i@3@00
        1))))
  :pattern ((itemAt s@$ xs@2@00 i@3@00))
  :qid |quant-u-11|)))
; ---------- FUNCTION ascending----------
(declare-fun xs@5@00 () $Ref)
(declare-fun result@6@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@5@00 $Ref)) (!
  (= (ascending%limited s@$ xs@5@00) (ascending s@$ xs@5@00))
  :pattern ((ascending s@$ xs@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@5@00 $Ref)) (!
  (ascending%stateless xs@5@00)
  :pattern ((ascending%limited s@$ xs@5@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall i: Int, j: Int :: { itemAt(xs, i), itemAt(xs, j) } 0 <= i && (i < j && j < length(xs)) ==> itemAt(xs, i) <= itemAt(xs, j))
(declare-const i@10@00 Int)
(declare-const j@11@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && (i < j && j < length(xs)) ==> itemAt(xs, i) <= itemAt(xs, j)
; [eval] 0 <= i && (i < j && j < length(xs))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 12 | !(0 <= i@10@00) | live]
; [else-branch: 12 | 0 <= i@10@00 | live]
(push) ; 4
; [then-branch: 12 | !(0 <= i@10@00)]
(assert (not (<= 0 i@10@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | 0 <= i@10@00]
(assert (<= 0 i@10@00))
; [eval] i < j
(push) ; 5
; [then-branch: 13 | !(i@10@00 < j@11@00) | live]
; [else-branch: 13 | i@10@00 < j@11@00 | live]
(push) ; 6
; [then-branch: 13 | !(i@10@00 < j@11@00)]
(assert (not (< i@10@00 j@11@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | i@10@00 < j@11@00]
(assert (< i@10@00 j@11@00))
; [eval] j < length(xs)
; [eval] length(xs)
(push) ; 7
(assert (length%precondition s@$ xs@5@00))
(pop) ; 7
; Joined path conditions
(assert (length%precondition s@$ xs@5@00))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@10@00 j@11@00)
  (and (< i@10@00 j@11@00) (length%precondition s@$ xs@5@00))))
(assert (or (< i@10@00 j@11@00) (not (< i@10@00 j@11@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@10@00)
  (and
    (<= 0 i@10@00)
    (=>
      (< i@10@00 j@11@00)
      (and (< i@10@00 j@11@00) (length%precondition s@$ xs@5@00)))
    (or (< i@10@00 j@11@00) (not (< i@10@00 j@11@00))))))
(assert (or (<= 0 i@10@00) (not (<= 0 i@10@00))))
(push) ; 3
; [then-branch: 14 | 0 <= i@10@00 && i@10@00 < j@11@00 && j@11@00 < length(s@$, xs@5@00) | live]
; [else-branch: 14 | !(0 <= i@10@00 && i@10@00 < j@11@00 && j@11@00 < length(s@$, xs@5@00)) | live]
(push) ; 4
; [then-branch: 14 | 0 <= i@10@00 && i@10@00 < j@11@00 && j@11@00 < length(s@$, xs@5@00)]
(assert (and (<= 0 i@10@00) (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00)))))
; [eval] itemAt(xs, i) <= itemAt(xs, j)
; [eval] itemAt(xs, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < length(xs)
; [eval] length(xs)
(push) ; 6
(assert (length%precondition s@$ xs@5@00))
(pop) ; 6
; Joined path conditions
(assert (length%precondition s@$ xs@5@00))
(push) ; 6
(assert (not (< i@10@00 (length s@$ xs@5@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@10@00 (length s@$ xs@5@00)))
(assert (itemAt%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i@10@00))
(pop) ; 5
; Joined path conditions
(assert (and
  (length%precondition s@$ xs@5@00)
  (< i@10@00 (length s@$ xs@5@00))
  (itemAt%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i@10@00)))
; [eval] itemAt(xs, j)
(push) ; 5
; [eval] 0 <= i
(push) ; 6
(assert (not (<= 0 j@11@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 j@11@00))
; [eval] i < length(xs)
; [eval] length(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j@11@00))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 j@11@00)
  (itemAt%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j@11@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(0 <= i@10@00 && i@10@00 < j@11@00 && j@11@00 < length(s@$, xs@5@00))]
(assert (not
  (and (<= 0 i@10@00) (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@10@00) (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00))))
  (and
    (<= 0 i@10@00)
    (< i@10@00 j@11@00)
    (< j@11@00 (length s@$ xs@5@00))
    (length%precondition s@$ xs@5@00)
    (< i@10@00 (length s@$ xs@5@00))
    (itemAt%precondition ($Snap.combine
      s@$
      ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i@10@00)
    (<= 0 j@11@00)
    (itemAt%precondition ($Snap.combine
      s@$
      ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j@11@00))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@10@00)
      (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00)))))
  (and (<= 0 i@10@00) (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@10@00 Int) (j@11@00 Int)) (!
  (and
    (=>
      (<= 0 i@10@00)
      (and
        (<= 0 i@10@00)
        (=>
          (< i@10@00 j@11@00)
          (and (< i@10@00 j@11@00) (length%precondition s@$ xs@5@00)))
        (or (< i@10@00 j@11@00) (not (< i@10@00 j@11@00)))))
    (or (<= 0 i@10@00) (not (<= 0 i@10@00)))
    (=>
      (and
        (<= 0 i@10@00)
        (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00))))
      (and
        (<= 0 i@10@00)
        (< i@10@00 j@11@00)
        (< j@11@00 (length s@$ xs@5@00))
        (length%precondition s@$ xs@5@00)
        (< i@10@00 (length s@$ xs@5@00))
        (itemAt%precondition ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i@10@00)
        (<= 0 j@11@00)
        (itemAt%precondition ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j@11@00)))
    (or
      (not
        (and
          (<= 0 i@10@00)
          (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00)))))
      (and
        (<= 0 i@10@00)
        (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00))))))
  :pattern ((itemAt%limited ($Snap.combine
    s@$
    ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i@10@00) (itemAt%limited ($Snap.combine
    s@$
    ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/unofficial007.vpr@19@3@19@127-aux|)))
(assert (=
  result@6@00
  (forall ((i@10@00 Int) (j@11@00 Int)) (!
    (=>
      (and
        (<= 0 i@10@00)
        (and (< i@10@00 j@11@00) (< j@11@00 (length s@$ xs@5@00))))
      (<=
        (itemAt ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i@10@00)
        (itemAt ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j@11@00)))
    :pattern ((itemAt%limited ($Snap.combine
      s@$
      ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i@10@00) (itemAt%limited ($Snap.combine
      s@$
      ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j@11@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/unofficial007.vpr@19@3@19@127|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@5@00 $Ref)) (!
  (=>
    (ascending%precondition s@$ xs@5@00)
    (=
      (ascending s@$ xs@5@00)
      (forall ((i Int) (j Int)) (!
        (=>
          (and (<= 0 i) (and (< i j) (< j (length s@$ xs@5@00))))
          (<=
            (itemAt ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i)
            (itemAt ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j)))
        :pattern ((itemAt%limited ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i) (itemAt%limited ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j))
        ))))
  :pattern ((ascending s@$ xs@5@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (xs@5@00 $Ref)) (!
  (=>
    (ascending%precondition s@$ xs@5@00)
    (forall ((i Int) (j Int)) (!
      (and
        (=> (and (<= 0 i) (< i j)) (length%precondition s@$ xs@5@00))
        (=>
          (and (<= 0 i) (and (< i j) (< j (length s@$ xs@5@00))))
          (and
            (itemAt%precondition ($Snap.combine
              s@$
              ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i)
            (itemAt%precondition ($Snap.combine
              s@$
              ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j))))
      :pattern ((itemAt%limited ($Snap.combine
        s@$
        ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 i) (itemAt%limited ($Snap.combine
        s@$
        ($Snap.combine $Snap.unit $Snap.unit)) xs@5@00 j))
      )))
  :pattern ((ascending s@$ xs@5@00))
  :qid |quant-u-13|)))
; ---------- SortedList ----------
(declare-const xs@12@00 $Ref)
(push) ; 1
(declare-const $t@13@00 $Snap)
(assert (= $t@13@00 ($Snap.combine ($Snap.first $t@13@00) ($Snap.second $t@13@00))))
(assert (not (= xs@12@00 $Ref.null)))
(assert (=
  ($Snap.second $t@13@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@00))
    ($Snap.second ($Snap.second $t@13@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@13@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@13@00))))))
; [eval] xs.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:($t@13@00)) != Null | live]
; [else-branch: 15 | First:(Second:($t@13@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 15 | First:(Second:($t@13@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@13@00))) $Snap.unit))
; [eval] xs.next != null ==> xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.next != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:($t@13@00)) != Null | live]
; [else-branch: 16 | First:(Second:($t@13@00)) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | First:(Second:($t@13@00)) != Null]
; [eval] xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.val <= itemAt(xs.next, 0)
; [eval] itemAt(xs.next, 0)
(push) ; 5
; [eval] 0 <= i
; [eval] i < length(xs)
; [eval] length(xs)
(push) ; 6
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))
(push) ; 6
(assert (not (<
  0
  (length ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (length ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))))))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))))
  (<
    0
    (length ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))
  (itemAt%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0)))
(push) ; 5
; [then-branch: 17 | !(First:($t@13@00) <= itemAt((First:(Second:(Second:($t@13@00))), (_, _)), First:(Second:($t@13@00)), 0)) | live]
; [else-branch: 17 | First:($t@13@00) <= itemAt((First:(Second:(Second:($t@13@00))), (_, _)), First:(Second:($t@13@00)), 0) | live]
(push) ; 6
; [then-branch: 17 | !(First:($t@13@00) <= itemAt((First:(Second:(Second:($t@13@00))), (_, _)), First:(Second:($t@13@00)), 0))]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))))
(pop) ; 6
(push) ; 6
; [else-branch: 17 | First:($t@13@00) <= itemAt((First:(Second:(Second:($t@13@00))), (_, _)), First:(Second:($t@13@00)), 0)]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
  (itemAt ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0)))
; [eval] ascending(xs.next)
(push) ; 7
(assert (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))
(pop) ; 7
; Joined path conditions
(assert (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))
    (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))))
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))
      $Ref.null))
  (and
    (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))))
    (<
      0
      (length ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))
    (itemAt%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0)
    (=>
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
        (itemAt ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))
        (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))))))
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
        (itemAt ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0)))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))
      $Ref.null))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first $t@13@00))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) 0))
    (ascending ($Snap.first ($Snap.second ($Snap.second $t@13@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00)))))))
(pop) ; 2
(push) ; 2
; [else-branch: 15 | First:(Second:($t@13@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@00))) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@13@00))) $Snap.unit))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@13@00))) $Snap.unit))
; [eval] xs.next != null ==> xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.next != null
(push) ; 3
; [then-branch: 18 | First:(Second:($t@13@00)) != Null | dead]
; [else-branch: 18 | First:(Second:($t@13@00)) == Null | live]
(push) ; 4
; [else-branch: 18 | First:(Second:($t@13@00)) == Null]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
