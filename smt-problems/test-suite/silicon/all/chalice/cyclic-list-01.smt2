(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:14
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/cyclic-list.vpr
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
; ---------- FUNCTION length----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] result > 0
(assert (> result@1@00 0))
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
    (> result@1@00 0)))
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
; [eval] (unfolding acc(valid(this), write) in (this.next == null ? 1 : 1 + length(this.next)))
(set-option :timeout 0)
(push) ; 2
(assert (valid%trigger s@$ this@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@0@00 $Ref.null)))
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
; [eval] (this.next == null ? 1 : 1 + length(this.next))
; [eval] this.next == null
(push) ; 4
; [then-branch: 1 | First:(Second:(s@$)) == Null | dead]
; [else-branch: 1 | First:(Second:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 1 | First:(Second:(s@$)) != Null]
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
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] (this.next == null ? 1 : 1 + length(this.next))
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
      (length ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (= (joined_unfolding@6@00 s@$ this@0@00) 1)))
; Joined path conditions
(assert (and
  (valid%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@0@00 $Ref.null))
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
      (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
; Joined path conditions
(assert (and
  (valid%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@0@00 $Ref.null))
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
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00)
    (=
      (length s@$ this@0@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        1
        (+
          1
          (length%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((length s@$ this@0@00))
  :pattern ((length%stateless this@0@00) (valid%trigger s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION itemAt----------
(declare-fun this@2@00 () $Ref)
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
; [eval] i < length(this)
; [eval] length(this)
(push) ; 2
(assert (length%precondition ($Snap.first s@$) this@2@00))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.first s@$) this@2@00))
(assert (< i@3@00 (length ($Snap.first s@$) this@2@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (= (itemAt%limited s@$ this@2@00 i@3@00) (itemAt s@$ this@2@00 i@3@00))
  :pattern ((itemAt s@$ this@2@00 i@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (itemAt%stateless this@2@00 i@3@00)
  :pattern ((itemAt%limited s@$ this@2@00 i@3@00))
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
(assert (length%precondition ($Snap.first s@$) this@2@00))
(assert (< i@3@00 (length ($Snap.first s@$) this@2@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(valid(this), write) in (i == 0 || this.next == null ? this.value : itemAt(this.next, i - 1)))
(set-option :timeout 0)
(push) ; 2
(assert (valid%trigger ($Snap.first s@$) this@2@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] this.next != null
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
; [then-branch: 3 | First:(Second:(First:(s@$))) != Null | live]
; [else-branch: 3 | First:(Second:(First:(s@$))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:(Second:(First:(s@$))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)))
; [eval] (i == 0 || this.next == null ? this.value : itemAt(this.next, i - 1))
; [eval] i == 0 || this.next == null
; [eval] i == 0
(push) ; 4
; [then-branch: 4 | i@3@00 == 0 | live]
; [else-branch: 4 | i@3@00 != 0 | live]
(push) ; 5
; [then-branch: 4 | i@3@00 == 0]
(assert (= i@3@00 0))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i@3@00 != 0]
(assert (not (= i@3@00 0)))
; [eval] this.next == null
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= i@3@00 0)) (= i@3@00 0)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (or
    (= i@3@00 0)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (or
  (= i@3@00 0)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | i@3@00 == 0 || First:(Second:(First:(s@$))) == Null | live]
; [else-branch: 5 | !(i@3@00 == 0 || First:(Second:(First:(s@$))) == Null) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | i@3@00 == 0 || First:(Second:(First:(s@$))) == Null]
(assert (or
  (= i@3@00 0)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(i@3@00 == 0 || First:(Second:(First:(s@$))) == Null)]
(assert (not
  (or
    (= i@3@00 0)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))))
; [eval] itemAt(this.next, i - 1)
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
; [eval] i < length(this)
; [eval] length(this)
(push) ; 7
(assert (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
(push) ; 7
(assert (not (<
  (- i@3@00 1)
  (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- i@3@00 1)
  (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
  i@3@00
  1)))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 (- i@3@00 1))
  (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
  (<
    (- i@3@00 1)
    (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
  (itemAt%precondition ($Snap.combine
    ($Snap.second ($Snap.second ($Snap.first s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
    i@3@00
    1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (or
      (= i@3@00 0)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
        $Ref.null)))
  (and
    (not
      (or
        (= i@3@00 0)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          $Ref.null)))
    (<= 0 (- i@3@00 1))
    (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
    (<
      (- i@3@00 1)
      (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
    (itemAt%precondition ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
      i@3@00
      1)))))
(assert (or
  (not
    (or
      (= i@3@00 0)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
        $Ref.null)))
  (or
    (= i@3@00 0)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | First:(Second:(First:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] (i == 0 || this.next == null ? this.value : itemAt(this.next, i - 1))
; [eval] i == 0 || this.next == null
; [eval] i == 0
(push) ; 4
; [then-branch: 6 | i@3@00 == 0 | live]
; [else-branch: 6 | i@3@00 != 0 | live]
(push) ; 5
; [then-branch: 6 | i@3@00 == 0]
(assert (= i@3@00 0))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | i@3@00 != 0]
(assert (not (= i@3@00 0)))
; [eval] this.next == null
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= i@3@00 0)) (= i@3@00 0)))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (or
    (= i@3@00 0)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (or
  (= i@3@00 0)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | i@3@00 == 0 || First:(Second:(First:(s@$))) == Null | live]
; [else-branch: 7 | !(i@3@00 == 0 || First:(Second:(First:(s@$))) == Null) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | i@3@00 == 0 || First:(Second:(First:(s@$))) == Null]
(assert (or
  (= i@3@00 0)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (or
  (= i@3@00 0)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@7@00 ($Snap $Ref Int) Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))
  (=
    (joined_unfolding@7@00 s@$ this@2@00 i@3@00)
    (ite
      (or
        (= i@3@00 0)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          $Ref.null))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
      (itemAt ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.first s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
        i@3@00
        1))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)
  (=
    (joined_unfolding@7@00 s@$ this@2@00 i@3@00)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first s@$) this@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (not (= this@2@00 $Ref.null))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
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
    (or (not (= i@3@00 0)) (= i@3@00 0))
    (=>
      (not
        (or
          (= i@3@00 0)
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
            $Ref.null)))
      (and
        (not
          (or
            (= i@3@00 0)
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
              $Ref.null)))
        (<= 0 (- i@3@00 1))
        (length%precondition ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))))
        (<
          (- i@3@00 1)
          (length ($Snap.second ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))))
        (itemAt%precondition ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
          i@3@00
          1))))
    (or
      (not
        (or
          (= i@3@00 0)
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
            $Ref.null)))
      (or
        (= i@3@00 0)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          $Ref.null))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first s@$) this@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (not (= this@2@00 $Ref.null))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit)
    (or (not (= i@3@00 0)) (= i@3@00 0))
    (or
      (= i@3@00 0)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
        $Ref.null)))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      $Ref.null))))
(assert (= result@4@00 (joined_unfolding@7@00 s@$ this@2@00 i@3@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (=>
    (itemAt%precondition s@$ this@2@00 i@3@00)
    (=
      (itemAt s@$ this@2@00 i@3@00)
      (ite
        (or
          (= i@3@00 0)
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
            $Ref.null))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
        (itemAt%limited ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
          i@3@00
          1)))))
  :pattern ((itemAt s@$ this@2@00 i@3@00))
  :pattern ((itemAt%stateless this@2@00 i@3@00) (valid%trigger ($Snap.first s@$) this@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (=>
    (itemAt%precondition s@$ this@2@00 i@3@00)
    (ite
      (or
        (= i@3@00 0)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          $Ref.null))
      true
      (itemAt%precondition ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.first s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
        i@3@00
        1))))
  :pattern ((itemAt s@$ this@2@00 i@3@00))
  :qid |quant-u-9|)))
; ---------- valid ----------
(declare-const this@8@00 $Ref)
(push) ; 1
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 ($Snap.combine ($Snap.first $t@9@00) ($Snap.second $t@9@00))))
(assert (not (= this@8@00 $Ref.null)))
(assert (=
  ($Snap.second $t@9@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@00))
    ($Snap.second ($Snap.second $t@9@00)))))
; [eval] this.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@9@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@9@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:($t@9@00)) != Null | live]
; [else-branch: 8 | First:(Second:($t@9@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 8 | First:(Second:($t@9@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@9@00))) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 8 | First:(Second:($t@9@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@9@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@9@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
