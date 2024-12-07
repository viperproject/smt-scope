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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@8@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@9@00 ($Snap $Ref Int) Int)
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
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref) (i@3@00 Int)) (!
  (= (itemAt%limited s@$ xs@2@00 i@3@00) (itemAt s@$ xs@2@00 i@3@00))
  :pattern ((itemAt s@$ xs@2@00 i@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref) (i@3@00 Int)) (!
  (itemAt%stateless xs@2@00 i@3@00)
  :pattern ((itemAt%limited s@$ xs@2@00 i@3@00))
  :qid |quant-u-3|)))
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
(assert (forall ((s@$ $Snap) (xs@5@00 $Ref)) (!
  (= (ascending%limited s@$ xs@5@00) (ascending s@$ xs@5@00))
  :pattern ((ascending s@$ xs@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@5@00 $Ref)) (!
  (ascending%stateless xs@5@00)
  :pattern ((ascending%limited s@$ xs@5@00))
  :qid |quant-u-5|)))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- insert ----------
(declare-const xs@0@01 $Ref)
(declare-const e@1@01 Int)
(declare-const xs@2@01 $Ref)
(declare-const e@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(SortedList(xs), write) in true)
; [eval] (unfolding acc(SortedList(xs), write) in true)
(push) ; 3
(assert (SortedList%trigger $t@4@01 xs@2@01))
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= xs@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
; [eval] xs.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:($t@4@01)) != Null | live]
; [else-branch: 0 | First:(Second:($t@4@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:(Second:($t@4@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] xs.next != null ==> xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.next != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:($t@4@01)) != Null | live]
; [else-branch: 1 | First:(Second:($t@4@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 1 | First:(Second:($t@4@01)) != Null]
; [eval] xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.val <= itemAt(xs.next, 0)
; [eval] itemAt(xs.next, 0)
(push) ; 7
; [eval] 0 <= i
; [eval] i < length(xs)
; [eval] length(xs)
(push) ; 8
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))
(pop) ; 8
; Joined path conditions
(assert (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))
(push) ; 8
(assert (not (<
  0
  (length ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (length ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))))))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
(pop) ; 7
; Joined path conditions
(assert (and
  (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))))
  (<
    0
    (length ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))
  (itemAt%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0)))
(push) ; 7
; [then-branch: 2 | !(First:($t@4@01) <= itemAt((First:(Second:(Second:($t@4@01))), (_, _)), First:(Second:($t@4@01)), 0)) | live]
; [else-branch: 2 | First:($t@4@01) <= itemAt((First:(Second:(Second:($t@4@01))), (_, _)), First:(Second:($t@4@01)), 0) | live]
(push) ; 8
; [then-branch: 2 | !(First:($t@4@01) <= itemAt((First:(Second:(Second:($t@4@01))), (_, _)), First:(Second:($t@4@01)), 0))]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | First:($t@4@01) <= itemAt((First:(Second:(Second:($t@4@01))), (_, _)), First:(Second:($t@4@01)), 0)]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
  (itemAt ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0)))
; [eval] ascending(xs.next)
(push) ; 9
(assert (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))
(pop) ; 9
; Joined path conditions
(assert (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
    (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))))
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
    (itemAt ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
      $Ref.null))
  (and
    (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))))
    (<
      0
      (length ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))
    (itemAt%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0)
    (=>
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
        (itemAt ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
        (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))))))
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
        (itemAt ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0)))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
      $Ref.null))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
      (itemAt ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
    (ascending ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | First:(Second:($t@4@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] xs.next != null ==> xs.val <= itemAt(xs.next, 0) && ascending(xs.next)
; [eval] xs.next != null
(push) ; 5
; [then-branch: 3 | First:(Second:($t@4@01)) != Null | dead]
; [else-branch: 3 | First:(Second:($t@4@01)) == Null | live]
(push) ; 6
; [else-branch: 3 | First:(Second:($t@4@01)) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@5@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
      $Ref.null))
  (= (as joined_unfolding@5@01  Bool) true)))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)
  (= (as joined_unfolding@5@01  Bool) true)))
; Joined path conditions
(assert (and
  (SortedList%trigger $t@4@01 xs@2@01)
  (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01)))
  (not (= xs@2@01 $Ref.null))
  (=
    ($Snap.second $t@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.second ($Snap.second $t@4@01))))
  (=
    ($Snap.second ($Snap.second $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
        $Ref.null))
    (= ($Snap.second ($Snap.second ($Snap.second $t@4@01))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
          $Ref.null))
      (and
        (length%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))))
        (<
          0
          (length ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))
        (itemAt%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0)
        (=>
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
            (itemAt ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
          (and
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
              (itemAt ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
            (ascending%precondition ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))))))
        (or
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
            (itemAt ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
          (not
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
              (itemAt ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
          $Ref.null))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))
          (itemAt ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) 0))
        (ascending ($Snap.first ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))))))))
; Joined path conditions
(assert (and
  (SortedList%trigger $t@4@01 xs@2@01)
  (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01)))
  (not (= xs@2@01 $Ref.null))
  (=
    ($Snap.second $t@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.second ($Snap.second $t@4@01))))
  (=
    ($Snap.second ($Snap.second $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
      $Ref.null)
    (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit)
    (= ($Snap.second ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01)))
      $Ref.null))))
(push) ; 3
(assert (not (as joined_unfolding@5@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@5@01  Bool))
; [exec]
; assert ascending(xs)
; [eval] ascending(xs)
(push) ; 3
(assert (ascending%precondition $t@4@01 xs@2@01))
(pop) ; 3
; Joined path conditions
(assert (ascending%precondition $t@4@01 xs@2@01))
(push) ; 3
(assert (not (ascending $t@4@01 xs@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (ascending $t@4@01 xs@2@01))
(pop) ; 2
(pop) ; 1
