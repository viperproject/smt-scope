(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0039a.vpr
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
(declare-fun size ($Snap $Ref) Int)
(declare-fun size%limited ($Snap $Ref) Int)
(declare-fun size%stateless ($Ref) Bool)
(declare-fun size%precondition ($Snap $Ref) Bool)
(declare-fun at ($Snap $Ref Int) Int)
(declare-fun at%limited ($Snap $Ref Int) Int)
(declare-fun at%stateless ($Ref Int) Bool)
(declare-fun at%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION size----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this != null
(assert (not (= this@0@00 $Ref.null)))
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] result >= 1
(assert (>= result@1@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (size%limited s@$ this@0@00) (size s@$ this@0@00))
  :pattern ((size s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (size%stateless this@0@00)
  :pattern ((size%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (size%limited s@$ this@0@00))) (=>
    (size%precondition s@$ this@0@00)
    (>= result@1@00 1)))
  :pattern ((size%limited s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (size%limited s@$ this@0@00))) true)
  :pattern ((size%limited s@$ this@0@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this@0@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(valid(this), write) in (this.next == null ? 1 : 1 + size(this.next)))
(set-option :timeout 0)
(push) ; 2
(assert (valid%trigger ($Snap.second s@$) this@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] this.next != null
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
; [eval] (this.next == null ? 1 : 1 + size(this.next))
; [eval] this.next == null
(push) ; 4
; [then-branch: 1 | First:(Second:(s@$)) == Null | dead]
; [else-branch: 1 | First:(Second:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 1 | First:(Second:(s@$)) != Null]
; [eval] 1 + size(this.next)
; [eval] size(this.next)
(push) ; 6
; [eval] this != null
(assert (size%precondition ($Snap.combine $Snap.unit ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 6
; Joined path conditions
(assert (size%precondition ($Snap.combine $Snap.unit ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (size%precondition ($Snap.combine $Snap.unit ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] (this.next == null ? 1 : 1 + size(this.next))
; [eval] this.next == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(s@$)) == Null | live]
; [else-branch: 2 | First:(Second:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(Second:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@6@00 ($Snap $Ref) Int)
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (=
    (joined_unfolding@6@00 s@$ this@0@00)
    (+
      1
      (size ($Snap.combine $Snap.unit ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (= (joined_unfolding@6@00 s@$ this@0@00) 1)))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.second s@$) this@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (size%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.second s@$) this@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second s@$)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(assert (= result@1@00 (joined_unfolding@6@00 s@$ this@0@00)))
; [eval] result >= 1
(push) ; 2
(assert (not (>= result@1@00 1)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@1@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (size%precondition s@$ this@0@00)
    (=
      (size s@$ this@0@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        1
        (+
          1
          (size%limited ($Snap.combine
            $Snap.unit
            ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((size s@$ this@0@00))
  :pattern ((size%stateless this@0@00) (valid%trigger ($Snap.second s@$) this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (size%precondition s@$ this@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (size%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((size s@$ this@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION at----------
(declare-fun this@2@00 () $Ref)
(declare-fun i@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this != null
(assert (not (= this@2@00 $Ref.null)))
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
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@3@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] i < size(this)
; [eval] size(this)
(push) ; 2
; [eval] this != null
(assert (size%precondition ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@2@00))
(pop) ; 2
; Joined path conditions
(assert (size%precondition ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@2@00))
(assert (<
  i@3@00
  (size ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@2@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (= (at%limited s@$ this@2@00 i@3@00) (at s@$ this@2@00 i@3@00))
  :pattern ((at s@$ this@2@00 i@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (at%stateless this@2@00 i@3@00)
  :pattern ((at%limited s@$ this@2@00 i@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this@2@00 $Ref.null)))
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
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= 0 i@3@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (size%precondition ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@2@00))
(assert (<
  i@3@00
  (size ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@2@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(valid(this), write) in (i == 0 ? 0 : at(this.next, i - 1)))
(set-option :timeout 0)
(push) ; 2
(assert (valid%trigger ($Snap.first ($Snap.second s@$)) this@2@00))
(assert (=
  ($Snap.first ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second s@$)))
    ($Snap.second ($Snap.first ($Snap.second s@$))))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(First:(Second:(s@$))) != Null | live]
; [else-branch: 3 | First:(First:(Second:(s@$))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:(First:(Second:(s@$))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
    $Ref.null)))
; [eval] (i == 0 ? 0 : at(this.next, i - 1))
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
; [then-branch: 4 | i@3@00 == 0 | live]
; [else-branch: 4 | i@3@00 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | i@3@00 == 0]
(assert (= i@3@00 0))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i@3@00 != 0]
(assert (not (= i@3@00 0)))
; [eval] at(this.next, i - 1)
; [eval] i - 1
(push) ; 6
; [eval] this != null
; [eval] 0 <= i
(push) ; 7
(assert (not (<= 0 (- i@3@00 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- i@3@00 1)))
; [eval] i < size(this)
; [eval] size(this)
(push) ; 7
; [eval] this != null
(assert (size%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))))
(pop) ; 7
; Joined path conditions
(assert (size%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))))
(push) ; 7
(assert (not (<
  (- i@3@00 1)
  (size ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- i@3@00 1)
  (size ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))))))
(assert (at%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.second ($Snap.first ($Snap.second s@$)))
    ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))) (-
  i@3@00
  1)))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 (- i@3@00 1))
  (size%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))))
  (<
    (- i@3@00 1)
    (size ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))))
  (at%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.second ($Snap.first ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))) (-
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
    (size%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))))
    (<
      (- i@3@00 1)
      (size ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))))
    (at%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.second ($Snap.first ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))) (-
      i@3@00
      1)))))
(assert (or (not (= i@3@00 0)) (= i@3@00 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | First:(First:(Second:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.first ($Snap.second s@$))) $Snap.unit))
; [eval] (i == 0 ? 0 : at(this.next, i - 1))
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
; [then-branch: 5 | i@3@00 == 0 | live]
; [else-branch: 5 | i@3@00 != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | i@3@00 == 0]
(assert (= i@3@00 0))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (= i@3@00 0))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@7@00 ($Snap $Ref Int) Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
      $Ref.null))
  (=
    (joined_unfolding@7@00 s@$ this@2@00 i@3@00)
    (ite
      (= i@3@00 0)
      0
      (at ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.second ($Snap.first ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))) (-
        i@3@00
        1))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
    $Ref.null)
  (= (joined_unfolding@7@00 s@$ this@2@00 i@3@00) 0)))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second s@$)) this@2@00)
  (=
    ($Snap.first ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second s@$)))
      ($Snap.second ($Snap.first ($Snap.second s@$)))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
        $Ref.null))
    (=>
      (not (= i@3@00 0))
      (and
        (not (= i@3@00 0))
        (<= 0 (- i@3@00 1))
        (size%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))))
        (<
          (- i@3@00 1)
          (size ($Snap.combine
            $Snap.unit
            ($Snap.second ($Snap.first ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))))
        (at%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.second ($Snap.first ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))) (-
          i@3@00
          1))))
    (or (not (= i@3@00 0)) (= i@3@00 0)))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second s@$)) this@2@00)
  (=
    ($Snap.first ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second s@$)))
      ($Snap.second ($Snap.first ($Snap.second s@$)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
      $Ref.null)
    (= ($Snap.second ($Snap.first ($Snap.second s@$))) $Snap.unit)
    (= i@3@00 0))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$))))
      $Ref.null))))
(assert (= result@4@00 (joined_unfolding@7@00 s@$ this@2@00 i@3@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (=>
    (at%precondition s@$ this@2@00 i@3@00)
    (=
      (at s@$ this@2@00 i@3@00)
      (ite
        (= i@3@00 0)
        0
        (at%limited ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.second ($Snap.first ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))) (-
          i@3@00
          1)))))
  :pattern ((at s@$ this@2@00 i@3@00))
  :pattern ((at%stateless this@2@00 i@3@00) (valid%trigger ($Snap.first ($Snap.second s@$)) this@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (=>
    (at%precondition s@$ this@2@00 i@3@00)
    (ite
      (= i@3@00 0)
      true
      (at%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.second ($Snap.first ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second s@$)))) (-
        i@3@00
        1))))
  :pattern ((at s@$ this@2@00 i@3@00))
  :qid |quant-u-9|)))
; ---------- valid ----------
(declare-const this@8@00 $Ref)
(push) ; 1
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 ($Snap.combine ($Snap.first $t@9@00) ($Snap.second $t@9@00))))
(assert (not (= this@8@00 $Ref.null)))
; [eval] this.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:($t@9@00) != Null | live]
; [else-branch: 6 | First:($t@9@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 6 | First:($t@9@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 6 | First:($t@9@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null))
(assert (= ($Snap.second $t@9@00) $Snap.unit))
(pop) ; 2
(pop) ; 1
