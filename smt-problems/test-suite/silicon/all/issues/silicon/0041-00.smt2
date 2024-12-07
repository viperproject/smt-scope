(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0041.vpr
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
(declare-fun SL_length ($Snap $Ref) Int)
(declare-fun SL_length%limited ($Snap $Ref) Int)
(declare-fun SL_length%stateless ($Ref) Bool)
(declare-fun SL_length%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun SL%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@3@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (SL_length%limited s@$ x@0@00) (SL_length s@$ x@0@00))
  :pattern ((SL_length s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (SL_length%stateless x@0@00)
  :pattern ((SL_length%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (SL_length%limited s@$ x@0@00))) (=>
    (SL_length%precondition s@$ x@0@00)
    (> result@1@00 0)))
  :pattern ((SL_length%limited s@$ x@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (SL_length%limited s@$ x@0@00))) true)
  :pattern ((SL_length%limited s@$ x@0@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (SL_length%precondition s@$ x@0@00)
    (=
      (SL_length s@$ x@0@00)
      (+
        1
        (ite
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
          0
          (SL_length%limited ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))))
  :pattern ((SL_length s@$ x@0@00))
  :pattern ((SL_length%stateless x@0@00) (SL%trigger s@$ x@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (SL_length%precondition s@$ x@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
      true
      (SL_length%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
  :pattern ((SL_length s@$ x@0@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] SL_length(x) == 2
; [eval] SL_length(x)
(push) ; 2
(assert (SL_length%precondition ($Snap.first $t@2@01) x@1@01))
(pop) ; 2
; Joined path conditions
(assert (SL_length%precondition ($Snap.first $t@2@01) x@1@01))
(assert (= (SL_length ($Snap.first $t@2@01) x@1@01) 2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(SL(x), write)
(assert (=
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.second ($Snap.first $t@2@01)))))
(assert (not (= x@1@01 $Ref.null)))
; [eval] x.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(First:($t@2@01)) != Null | live]
; [else-branch: 0 | First:(First:($t@2@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(First:($t@2@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (SL%trigger ($Snap.first $t@2@01) x@1@01))
; [exec]
; unfold acc(SL(x.next), write)
(assert (=
  ($Snap.second ($Snap.first $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 1 | First:(Second:(First:($t@2@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(Second:(First:($t@2@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (SL%trigger ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01)))))
; [exec]
; assert x.next.next == null
; [eval] x.next.next == null
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | First:(Second:(First:($t@2@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@2@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (SL%trigger ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01)))))
; [exec]
; assert x.next.next == null
; [eval] x.next.next == null
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const head@3@01 $Ref)
(declare-const head@4@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] SL_length(head) == 2
; [eval] SL_length(head)
(push) ; 3
(assert (SL_length%precondition ($Snap.first $t@5@01) head@4@01))
(pop) ; 3
; Joined path conditions
(assert (SL_length%precondition ($Snap.first $t@5@01) head@4@01))
(assert (= (SL_length ($Snap.first $t@5@01) head@4@01) 2))
(pop) ; 2
(push) ; 2
; [exec]
; var x: Ref
(declare-const x@6@01 $Ref)
; [exec]
; x := new(next)
(declare-const x@7@01 $Ref)
(assert (not (= x@7@01 $Ref.null)))
(declare-const next@8@01 $Ref)
(assert (not (= x@7@01 head@4@01)))
(assert (not (= x@7@01 x@6@01)))
; [exec]
; x.next := null
; [exec]
; head := x
; [exec]
; fold acc(SL(head), write)
; [eval] x.next != null
; [then-branch: 2 | False | dead]
; [else-branch: 2 | True | live]
(push) ; 3
; [else-branch: 2 | True]
(assert (SL%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x@7@01))
; [exec]
; x := new(next)
(declare-const x@9@01 $Ref)
(assert (not (= x@9@01 $Ref.null)))
(declare-const next@10@01 $Ref)
(assert (not (= x@9@01 x@7@01)))
; [exec]
; x.next := head
; [exec]
; head := x
; [exec]
; fold acc(SL(head), write)
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@7@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | x@7@01 != Null | live]
; [else-branch: 3 | x@7@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | x@7@01 != Null]
(assert (SL%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x@7@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x@9@01))
; [eval] SL_length(head) == 2
; [eval] SL_length(head)
(push) ; 5
(assert (SL_length%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x@7@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x@9@01))
(pop) ; 5
; Joined path conditions
(assert (SL_length%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x@7@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x@9@01))
(push) ; 5
(assert (not (=
  (SL_length ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@7@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x@9@01)
  2)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  (SL_length ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@7@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x@9@01)
  2))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@11@01 $Ref)
(declare-const x@12@01 $Ref)
(push) ; 1
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; [eval] SL_length(x) == 2
; [eval] SL_length(x)
(push) ; 2
(assert (SL_length%precondition ($Snap.first $t@13@01) x@12@01))
(pop) ; 2
; Joined path conditions
(assert (SL_length%precondition ($Snap.first $t@13@01) x@12@01))
(assert (= (SL_length ($Snap.first $t@13@01) x@12@01) 2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(SL(x), write) in
;     (unfolding acc(SL(x.next), write) in x.next.next == null))
; [eval] (unfolding acc(SL(x), write) in (unfolding acc(SL(x.next), write) in x.next.next == null))
(push) ; 3
(assert (SL%trigger ($Snap.first $t@13@01) x@12@01))
(assert (=
  ($Snap.first $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@13@01))
    ($Snap.second ($Snap.first $t@13@01)))))
(assert (not (= x@12@01 $Ref.null)))
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(First:($t@13@01)) != Null | live]
; [else-branch: 4 | First:(First:($t@13@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(First:($t@13@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01))) $Ref.null)))
; [eval] (unfolding acc(SL(x.next), write) in x.next.next == null)
(push) ; 5
(assert (SL%trigger ($Snap.second ($Snap.first $t@13@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@13@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@13@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@13@01))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (= x@12@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(First:($t@13@01))) != Null | dead]
; [else-branch: 5 | First:(Second:(First:($t@13@01))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 5 | First:(Second:(First:($t@13@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@13@01))) $Snap.unit))
; [eval] x.next.next == null
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (and
  (SL%trigger ($Snap.second ($Snap.first $t@13@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01))))
  (=
    ($Snap.second ($Snap.first $t@13@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@13@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@13@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@13@01))) $Snap.unit))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
  $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (SL%trigger ($Snap.first $t@13@01) x@12@01)
  (=
    ($Snap.first $t@13@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@13@01))
      ($Snap.second ($Snap.first $t@13@01))))
  (not (= x@12@01 $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01)))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01)))
        $Ref.null))
    (SL%trigger ($Snap.second ($Snap.first $t@13@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01))))
    (=
      ($Snap.second ($Snap.first $t@13@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@13@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@13@01)))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
          $Ref.null)
        (= ($Snap.second ($Snap.second ($Snap.first $t@13@01))) $Snap.unit)))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
      $Ref.null))))
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@13@01))) $Ref.null)))
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@13@01))))
  $Ref.null))
(pop) ; 2
(pop) ; 1
