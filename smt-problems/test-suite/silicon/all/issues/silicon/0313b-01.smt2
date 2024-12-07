(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0313b.vpr
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
(declare-sort $MWSF 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
    )))
; ////////// Symbols
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
(declare-fun item_at ($Snap $Ref Int) Int)
(declare-fun item_at%limited ($Snap $Ref Int) Int)
(declare-fun item_at%stateless ($Ref Int) Bool)
(declare-fun item_at%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION length----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@1@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (length%limited s@$ this@0@00) (length s@$ this@0@00))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (length%stateless this@0@00)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ this@0@00))) (=>
    (length%precondition s@$ this@0@00)
    (>= result@1@00 0)))
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ this@0@00))) true)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (this == null ? 0 : (unfolding acc(List(this), write) in 1 + length(this.next)))
; [eval] this == null
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@0@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@0@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | this@0@00 == Null | live]
; [else-branch: 0 | this@0@00 != Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | this@0@00 == Null]
(assert (= this@0@00 $Ref.null))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | this@0@00 != Null]
(assert (not (= this@0@00 $Ref.null)))
; [eval] (unfolding acc(List(this), write) in 1 + length(this.next))
(push) ; 4
(assert (List%trigger s@$ this@0@00))
; [eval] this != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@0@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | this@0@00 != Null | live]
; [else-branch: 1 | this@0@00 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | this@0@00 != Null]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] 1 + length(this.next)
; [eval] length(this.next)
(push) ; 6
(assert (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (List%trigger s@$ this@0@00))
(assert (=>
  (not (= this@0@00 $Ref.null))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= this@0@00 $Ref.null))
  (and
    (not (= this@0@00 $Ref.null))
    (List%trigger s@$ this@0@00)
    (=>
      (not (= this@0@00 $Ref.null))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))))
(assert (or (not (= this@0@00 $Ref.null)) (= this@0@00 $Ref.null)))
(assert (=
  result@1@00
  (ite
    (= this@0@00 $Ref.null)
    0
    (+
      1
      (length ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@1@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@1@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00)
    (=
      (length s@$ this@0@00)
      (ite
        (= this@0@00 $Ref.null)
        0
        (+
          1
          (length%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((length s@$ this@0@00))
  :pattern ((length%stateless this@0@00) (List%trigger s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00)
    (ite
      (= this@0@00 $Ref.null)
      true
      (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION item_at----------
(declare-fun this@2@00 () $Ref)
(declare-fun count@3@00 () Int)
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
; [eval] count < length(this)
; [eval] length(this)
(push) ; 2
(assert (length%precondition ($Snap.first s@$) this@2@00))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.first s@$) this@2@00))
(assert (< count@3@00 (length ($Snap.first s@$) this@2@00)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] count >= 0
(assert (>= count@3@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (count@3@00 Int)) (!
  (=
    (item_at%limited s@$ this@2@00 count@3@00)
    (item_at s@$ this@2@00 count@3@00))
  :pattern ((item_at s@$ this@2@00 count@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (count@3@00 Int)) (!
  (item_at%stateless this@2@00 count@3@00)
  :pattern ((item_at%limited s@$ this@2@00 count@3@00))
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
(assert (length%precondition ($Snap.first s@$) this@2@00))
(assert (< count@3@00 (length ($Snap.first s@$) this@2@00)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (>= count@3@00 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(List(this), write) in (count == 0 ? this.value : item_at(this.next, count - 1)))
(set-option :timeout 0)
(push) ; 2
(assert (List%trigger ($Snap.first s@$) this@2@00))
; [eval] this != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | this@2@00 != Null | live]
; [else-branch: 2 | this@2@00 == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | this@2@00 != Null]
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] (count == 0 ? this.value : item_at(this.next, count - 1))
; [eval] count == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= count@3@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= count@3@00 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | count@3@00 == 0 | live]
; [else-branch: 3 | count@3@00 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | count@3@00 == 0]
(assert (= count@3@00 0))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | count@3@00 != 0]
(assert (not (= count@3@00 0)))
; [eval] item_at(this.next, count - 1)
; [eval] count - 1
(push) ; 6
; [eval] count < length(this)
; [eval] length(this)
(push) ; 7
(assert (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(push) ; 7
(assert (not (<
  (- count@3@00 1)
  (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- count@3@00 1)
  (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))))
; [eval] count >= 0
(push) ; 7
(assert (not (>= (- count@3@00 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= (- count@3@00 1) 0))
(assert (item_at%precondition ($Snap.combine
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
  count@3@00
  1)))
(pop) ; 6
; Joined path conditions
(assert (and
  (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
  (<
    (- count@3@00 1)
    (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
  (>= (- count@3@00 1) 0)
  (item_at%precondition ($Snap.combine
    ($Snap.second ($Snap.second ($Snap.first s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
    count@3@00
    1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= count@3@00 0))
  (and
    (not (= count@3@00 0))
    (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
    (<
      (- count@3@00 1)
      (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
    (>= (- count@3@00 1) 0)
    (item_at%precondition ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
      count@3@00
      1)))))
(assert (or (not (= count@3@00 0)) (= count@3@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (List%trigger ($Snap.first s@$) this@2@00))
(assert (=>
  (not (= this@2@00 $Ref.null))
  (and
    (not (= this@2@00 $Ref.null))
    (=
      ($Snap.first s@$)
      ($Snap.combine
        ($Snap.first ($Snap.first s@$))
        ($Snap.second ($Snap.first s@$))))
    (=
      ($Snap.second ($Snap.first s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first s@$)))
        ($Snap.second ($Snap.second ($Snap.first s@$)))))
    (=>
      (not (= count@3@00 0))
      (and
        (not (= count@3@00 0))
        (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
        (<
          (- count@3@00 1)
          (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
        (>= (- count@3@00 1) 0)
        (item_at%precondition ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
          count@3@00
          1))))
    (or (not (= count@3@00 0)) (= count@3@00 0)))))
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  result@4@00
  (ite
    (= count@3@00 0)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
    (item_at ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
      count@3@00
      1)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (count@3@00 Int)) (!
  (=>
    (item_at%precondition s@$ this@2@00 count@3@00)
    (=
      (item_at s@$ this@2@00 count@3@00)
      (ite
        (= count@3@00 0)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
        (item_at%limited ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
          count@3@00
          1)))))
  :pattern ((item_at s@$ this@2@00 count@3@00))
  :pattern ((item_at%stateless this@2@00 count@3@00) (List%trigger ($Snap.first s@$) this@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (count@3@00 Int)) (!
  (=>
    (item_at%precondition s@$ this@2@00 count@3@00)
    (ite
      (= count@3@00 0)
      true
      (item_at%precondition ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.first s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
        count@3@00
        1))))
  :pattern ((item_at s@$ this@2@00 count@3@00))
  :qid |quant-u-9|)))
; ---------- List ----------
(declare-const this@6@00 $Ref)
(push) ; 1
; [eval] this != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@6@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= this@6@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | this@6@00 != Null | live]
; [else-branch: 4 | this@6@00 == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 4 | this@6@00 != Null]
(assert (not (= this@6@00 $Ref.null)))
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 ($Snap.combine ($Snap.first $t@7@00) ($Snap.second $t@7@00))))
(assert (=
  ($Snap.second $t@7@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@00))
    ($Snap.second ($Snap.second $t@7@00)))))
(pop) ; 2
(push) ; 2
; [else-branch: 4 | this@6@00 == Null]
(assert (= this@6@00 $Ref.null))
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
