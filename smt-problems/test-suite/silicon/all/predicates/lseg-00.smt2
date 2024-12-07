(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:10
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/predicates/lseg.vpr
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
(declare-fun length ($Snap $Ref $Ref) Int)
(declare-fun length%limited ($Snap $Ref $Ref) Int)
(declare-fun length%stateless ($Ref $Ref) Bool)
(declare-fun length%precondition ($Snap $Ref $Ref) Bool)
(declare-fun get ($Snap $Ref Int $Ref) Int)
(declare-fun get%limited ($Snap $Ref Int $Ref) Int)
(declare-fun get%stateless ($Ref Int $Ref) Bool)
(declare-fun get%precondition ($Snap $Ref Int $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun lseg%trigger ($Snap $Ref $Ref) Bool)
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
(declare-fun joined_unfolding@8@00 ($Snap $Ref $Ref) Int)
(declare-fun joined_unfolding@9@00 ($Snap $Ref Int $Ref) Int)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (= (length%limited s@$ this@0@00 end@1@00) (length s@$ this@0@00 end@1@00))
  :pattern ((length s@$ this@0@00 end@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (length%stateless this@0@00 end@1@00)
  :pattern ((length%limited s@$ this@0@00 end@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (let ((result@2@00 (length%limited s@$ this@0@00 end@1@00))) (=>
    (length%precondition s@$ this@0@00 end@1@00)
    (> result@2@00 0)))
  :pattern ((length%limited s@$ this@0@00 end@1@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (let ((result@2@00 (length%limited s@$ this@0@00 end@1@00))) true)
  :pattern ((length%limited s@$ this@0@00 end@1@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00 end@1@00)
    (=
      (length s@$ this@0@00 end@1@00)
      (ite
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
        1
        (+
          1
          (length%limited ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))))
  :pattern ((length s@$ this@0@00 end@1@00))
  :pattern ((length%stateless this@0@00 end@1@00) (lseg%trigger s@$ this@0@00 end@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00 end@1@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      true
      (length%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
  :pattern ((length s@$ this@0@00 end@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (i@4@00 Int) (end@5@00 $Ref)) (!
  (=
    (get%limited s@$ this@3@00 i@4@00 end@5@00)
    (get s@$ this@3@00 i@4@00 end@5@00))
  :pattern ((get s@$ this@3@00 i@4@00 end@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (i@4@00 Int) (end@5@00 $Ref)) (!
  (get%stateless this@3@00 i@4@00 end@5@00)
  :pattern ((get%limited s@$ this@3@00 i@4@00 end@5@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (i@4@00 Int) (end@5@00 $Ref)) (!
  (=>
    (get%precondition s@$ this@3@00 i@4@00 end@5@00)
    (=
      (get s@$ this@3@00 i@4@00 end@5@00)
      (ite
        (= i@4@00 0)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
        (get%limited ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
          i@4@00
          1) end@5@00))))
  :pattern ((get s@$ this@3@00 i@4@00 end@5@00))
  :pattern ((get%stateless this@3@00 i@4@00 end@5@00) (lseg%trigger ($Snap.first s@$) this@3@00 end@5@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (i@4@00 Int) (end@5@00 $Ref)) (!
  (=>
    (get%precondition s@$ this@3@00 i@4@00 end@5@00)
    (ite
      (= i@4@00 0)
      true
      (get%precondition ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
        i@4@00
        1) end@5@00)))
  :pattern ((get s@$ this@3@00 i@4@00 end@5@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- init ----------
(declare-const this@0@01 $Ref)
(declare-const val@1@01 Int)
(declare-const this@2@01 $Ref)
(declare-const val@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= this@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
(assert (= ($Snap.first ($Snap.second $t@5@01)) $Snap.unit))
; [eval] length(this, null) == 1
; [eval] length(this, null)
(push) ; 3
(assert (length%precondition ($Snap.first $t@5@01) this@2@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@5@01) this@2@01 $Ref.null))
(assert (= (length ($Snap.first $t@5@01) this@2@01 $Ref.null) 1))
(assert (= ($Snap.second ($Snap.second $t@5@01)) $Snap.unit))
; [eval] get(this, 0, null) == val
; [eval] get(this, 0, null)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< 0 (length ($Snap.first $t@5@01) this@2@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (length ($Snap.first $t@5@01) this@2@01 $Ref.null)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@5@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 0 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 (length ($Snap.first $t@5@01) this@2@01 $Ref.null))
  (get%precondition ($Snap.combine
    ($Snap.first $t@5@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 0 $Ref.null)))
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@5@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 0 $Ref.null)
  val@3@01))
(pop) ; 2
(push) ; 2
; [exec]
; this.next := null
; [exec]
; this.value := val
; [exec]
; fold acc(lseg(this, null), write)
; [eval] this.next != end
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 3
; [else-branch: 0 | True]
(assert (lseg%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val@3@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) this@2@01 $Ref.null))
; [eval] length(this, null) == 1
; [eval] length(this, null)
(push) ; 4
(assert (length%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap val@3@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) this@2@01 $Ref.null))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap val@3@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) this@2@01 $Ref.null))
(push) ; 4
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap val@3@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) this@2@01 $Ref.null)
  1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap val@3@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) this@2@01 $Ref.null)
  1))
; [eval] get(this, 0, null) == val
; [eval] get(this, 0, null)
(push) ; 4
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  0
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap val@3@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) this@2@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap val@3@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) this@2@01 $Ref.null)))
(assert (get%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.IntTo$Snap val@3@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 0 $Ref.null))
(pop) ; 4
; Joined path conditions
(assert (and
  (<
    0
    (length ($Snap.combine
      ($SortWrappers.IntTo$Snap val@3@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) this@2@01 $Ref.null))
  (get%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap val@3@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 0 $Ref.null)))
(push) ; 4
(assert (not (=
  (get ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap val@3@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 0 $Ref.null)
  val@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap val@3@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 0 $Ref.null)
  val@3@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- initUnitCycle ----------
(declare-const this@6@01 $Ref)
(declare-const val@7@01 Int)
(declare-const this@8@01 $Ref)
(declare-const val@9@01 Int)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (not (= this@8@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (=
  ($Snap.second $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.second ($Snap.second $t@11@01)))))
(assert (= ($Snap.first ($Snap.second $t@11@01)) $Snap.unit))
; [eval] length(this, this) == 1
; [eval] length(this, this)
(push) ; 3
(assert (length%precondition ($Snap.first $t@11@01) this@8@01 this@8@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@11@01) this@8@01 this@8@01))
(assert (= (length ($Snap.first $t@11@01) this@8@01 this@8@01) 1))
(assert (=
  ($Snap.second ($Snap.second $t@11@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@11@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@11@01))) $Snap.unit))
; [eval] get(this, 0, this) == val
; [eval] get(this, 0, this)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< 0 (length ($Snap.first $t@11@01) this@8@01 this@8@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (length ($Snap.first $t@11@01) this@8@01 this@8@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@11@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@8@01 0 this@8@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 (length ($Snap.first $t@11@01) this@8@01 this@8@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@11@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@8@01 0 this@8@01)))
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@11@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@8@01 0 this@8@01)
  val@9@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@11@01))) $Snap.unit))
; [eval] (unfolding acc(lseg(this, this), write) in this.next == this)
(push) ; 3
(assert (lseg%trigger ($Snap.first $t@11@01) this@8@01 this@8@01))
(assert (=
  ($Snap.first $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@11@01))
    ($Snap.second ($Snap.first $t@11@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@11@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@11@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@11@01))))))
; [eval] this.next != end
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@11@01))))
  this@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(First:($t@11@01))) != this@8@01 | dead]
; [else-branch: 1 | First:(Second:(First:($t@11@01))) == this@8@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | First:(Second:(First:($t@11@01))) == this@8@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@11@01))))
  this@8@01))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@11@01))) $Snap.unit))
; [eval] this.next == this
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (lseg%trigger ($Snap.first $t@11@01) this@8@01 this@8@01)
  (=
    ($Snap.first $t@11@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@11@01))
      ($Snap.second ($Snap.first $t@11@01))))
  (=
    ($Snap.second ($Snap.first $t@11@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@11@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@11@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@11@01))))
    this@8@01)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@11@01))))
      this@8@01)
    (= ($Snap.second ($Snap.second ($Snap.first $t@11@01))) $Snap.unit))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@11@01))))
  this@8@01))
(pop) ; 2
(push) ; 2
; [exec]
; this.next := this
; [exec]
; this.value := val
; [exec]
; fold acc(lseg(this, this), write)
; [eval] this.next != end
; [then-branch: 2 | False | dead]
; [else-branch: 2 | True | live]
(push) ; 3
; [else-branch: 2 | True]
(assert (lseg%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val@9@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit)) this@8@01 this@8@01))
; [eval] length(this, this) == 1
; [eval] length(this, this)
(push) ; 4
(assert (length%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap val@9@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit)) this@8@01 this@8@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap val@9@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit)) this@8@01 this@8@01))
(push) ; 4
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap val@9@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit)) this@8@01 this@8@01)
  1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap val@9@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit)) this@8@01 this@8@01)
  1))
; [eval] get(this, 0, this) == val
; [eval] get(this, 0, this)
(push) ; 4
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  0
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap val@9@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit)) this@8@01 this@8@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap val@9@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit)) this@8@01 this@8@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.IntTo$Snap val@9@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit))
  ($Snap.combine $Snap.unit $Snap.unit)) this@8@01 0 this@8@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (<
    0
    (length ($Snap.combine
      ($SortWrappers.IntTo$Snap val@9@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit)) this@8@01 this@8@01))
  (get%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap val@9@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit))
    ($Snap.combine $Snap.unit $Snap.unit)) this@8@01 0 this@8@01)))
(push) ; 4
(assert (not (=
  (get ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap val@9@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit))
    ($Snap.combine $Snap.unit $Snap.unit)) this@8@01 0 this@8@01)
  val@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap val@9@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap this@8@01) $Snap.unit))
    ($Snap.combine $Snap.unit $Snap.unit)) this@8@01 0 this@8@01)
  val@9@01))
; [eval] (unfolding acc(lseg(this, this), write) in this.next == this)
(push) ; 4
; [eval] this.next != end
; [then-branch: 3 | False | dead]
; [else-branch: 3 | True | live]
(push) ; 5
; [else-branch: 3 | True]
; [eval] this.next == this
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- addAtEnd ----------
(declare-const this@12@01 $Ref)
(declare-const end@13@01 $Ref)
(declare-const val@14@01 Int)
(declare-const this@15@01 $Ref)
(declare-const end@16@01 $Ref)
(declare-const val@17@01 Int)
(push) ; 1
(declare-const $t@18@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
; [eval] length(this, end) == old(length(this, end)) + 1
; [eval] length(this, end)
(push) ; 3
(assert (length%precondition ($Snap.first $t@19@01) this@15@01 end@16@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@19@01) this@15@01 end@16@01))
; [eval] old(length(this, end)) + 1
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 3
(assert (length%precondition $t@18@01 this@15@01 end@16@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition $t@18@01 this@15@01 end@16@01))
(assert (=
  (length ($Snap.first $t@19@01) this@15@01 end@16@01)
  (+ (length $t@18@01 this@15@01 end@16@01) 1)))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] (forall i: Int :: { old(get(this, i, end)) } 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end)))
(declare-const i@20@01 Int)
(push) ; 3
; [eval] 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end))
; [eval] 0 <= i && i < old(length(this, end))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 4 | !(0 <= i@20@01) | live]
; [else-branch: 4 | 0 <= i@20@01 | live]
(push) ; 5
; [then-branch: 4 | !(0 <= i@20@01)]
(assert (not (<= 0 i@20@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | 0 <= i@20@01]
(assert (<= 0 i@20@01))
; [eval] i < old(length(this, end))
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
(push) ; 4
; [then-branch: 5 | 0 <= i@20@01 && i@20@01 < length($t@18@01, this@15@01, end@16@01) | live]
; [else-branch: 5 | !(0 <= i@20@01 && i@20@01 < length($t@18@01, this@15@01, end@16@01)) | live]
(push) ; 5
; [then-branch: 5 | 0 <= i@20@01 && i@20@01 < length($t@18@01, this@15@01, end@16@01)]
(assert (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01))))
; [eval] get(this, i, end) == old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 6
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< i@20@01 (length ($Snap.first $t@19@01) this@15@01 end@16@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@20@01 (length ($Snap.first $t@19@01) this@15@01 end@16@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@20@01 (length ($Snap.first $t@19@01) this@15@01 end@16@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01)))
; [eval] old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 6
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (get%precondition ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01))
(pop) ; 6
; Joined path conditions
(assert (get%precondition ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(0 <= i@20@01 && i@20@01 < length($t@18@01, this@15@01, end@16@01))]
(assert (not (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01)))
  (and
    (<= 0 i@20@01)
    (< i@20@01 (length $t@18@01 this@15@01 end@16@01))
    (< i@20@01 (length ($Snap.first $t@19@01) this@15@01 end@16@01))
    (get%precondition ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01)
    (get%precondition ($Snap.combine
      $t@18@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01))))
  (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@20@01 Int)) (!
  (and
    (or (<= 0 i@20@01) (not (<= 0 i@20@01)))
    (=>
      (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01)))
      (and
        (<= 0 i@20@01)
        (< i@20@01 (length $t@18@01 this@15@01 end@16@01))
        (< i@20@01 (length ($Snap.first $t@19@01) this@15@01 end@16@01))
        (get%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01)
        (get%precondition ($Snap.combine
          $t@18@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01)))
    (or
      (not
        (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01))))
      (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01)))))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119-aux|)))
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 0 i@20@01) (< i@20@01 (length $t@18@01 this@15@01 end@16@01)))
    (=
      (get ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01)
      (get ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01)))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@20@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] get(this, length(this, end) - 1, end) == val
; [eval] get(this, length(this, end) - 1, end)
; [eval] length(this, end) - 1
; [eval] length(this, end)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [eval] 0 <= i
(push) ; 4
(assert (not (<= 0 (- (length ($Snap.first $t@19@01) this@15@01 end@16@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- (length ($Snap.first $t@19@01) this@15@01 end@16@01) 1)))
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<
  (- (length ($Snap.first $t@19@01) this@15@01 end@16@01) 1)
  (length ($Snap.first $t@19@01) this@15@01 end@16@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- (length ($Snap.first $t@19@01) this@15@01 end@16@01) 1)
  (length ($Snap.first $t@19@01) this@15@01 end@16@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
  (length ($Snap.first $t@19@01) this@15@01 end@16@01)
  1) end@16@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= 0 (- (length ($Snap.first $t@19@01) this@15@01 end@16@01) 1))
  (<
    (- (length ($Snap.first $t@19@01) this@15@01 end@16@01) 1)
    (length ($Snap.first $t@19@01) this@15@01 end@16@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
    (length ($Snap.first $t@19@01) this@15@01 end@16@01)
    1) end@16@01)))
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
    (length ($Snap.first $t@19@01) this@15@01 end@16@01)
    1) end@16@01)
  val@17@01))
(pop) ; 2
(push) ; 2
; [exec]
; var n: Ref
(declare-const n@21@01 $Ref)
; [exec]
; unfold acc(lseg(this, end), write)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (not (= this@15@01 $Ref.null)))
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
; [eval] this.next != end
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:($t@18@01)) != end@16@01 | live]
; [else-branch: 6 | First:(Second:($t@18@01)) == end@16@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(Second:($t@18@01)) != end@16@01]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
(assert (=
  ($Snap.second ($Snap.second $t@18@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@18@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@18@01))) $Snap.unit))
; [eval] this.next != null
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (lseg%trigger $t@18@01 this@15@01 end@16@01))
; [eval] this.next == end
; [then-branch: 7 | First:(Second:($t@18@01)) == end@16@01 | dead]
; [else-branch: 7 | First:(Second:($t@18@01)) != end@16@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 7 | First:(Second:($t@18@01)) != end@16@01]
(pop) ; 4
; [eval] !(this.next == end)
; [eval] this.next == end
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:($t@18@01)) != end@16@01 | live]
; [else-branch: 8 | First:(Second:($t@18@01)) == end@16@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | First:(Second:($t@18@01)) != end@16@01]
; [exec]
; addAtEnd(this.next, end, val)
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (= ($Snap.first ($Snap.second $t@22@01)) $Snap.unit))
; [eval] length(this, end) == old(length(this, end)) + 1
; [eval] length(this, end)
(push) ; 5
(assert (length%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
(pop) ; 5
; Joined path conditions
(assert (length%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
; [eval] old(length(this, end)) + 1
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 5
(assert (length%precondition ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
(pop) ; 5
; Joined path conditions
(assert (length%precondition ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
(assert (=
  (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
  (+
    (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
    1)))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@22@01))) $Snap.unit))
; [eval] (forall i: Int :: { old(get(this, i, end)) } 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end)))
(declare-const i@23@01 Int)
(push) ; 5
; [eval] 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end))
; [eval] 0 <= i && i < old(length(this, end))
; [eval] 0 <= i
(push) ; 6
; [then-branch: 9 | !(0 <= i@23@01) | live]
; [else-branch: 9 | 0 <= i@23@01 | live]
(push) ; 7
; [then-branch: 9 | !(0 <= i@23@01)]
(assert (not (<= 0 i@23@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 9 | 0 <= i@23@01]
(assert (<= 0 i@23@01))
; [eval] i < old(length(this, end))
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@23@01) (not (<= 0 i@23@01))))
(push) ; 6
; [then-branch: 10 | 0 <= i@23@01 && i@23@01 < length(Second:(Second:(Second:($t@18@01))), First:(Second:($t@18@01)), end@16@01) | live]
; [else-branch: 10 | !(0 <= i@23@01 && i@23@01 < length(Second:(Second:(Second:($t@18@01))), First:(Second:($t@18@01)), end@16@01)) | live]
(push) ; 7
; [then-branch: 10 | 0 <= i@23@01 && i@23@01 < length(Second:(Second:(Second:($t@18@01))), First:(Second:($t@18@01)), end@16@01)]
(assert (and
  (<= 0 i@23@01)
  (<
    i@23@01
    (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))))
; [eval] get(this, i, end) == old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 8
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (<
  i@23@01
  (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (<
  i@23@01
  (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01))
(pop) ; 8
; Joined path conditions
(assert (and
  (<
    i@23@01
    (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01)))
; [eval] old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 8
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01))
(pop) ; 8
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | !(0 <= i@23@01 && i@23@01 < length(Second:(Second:(Second:($t@18@01))), First:(Second:($t@18@01)), end@16@01))]
(assert (not
  (and
    (<= 0 i@23@01)
    (<
      i@23@01
      (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@23@01)
    (<
      i@23@01
      (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
  (and
    (<= 0 i@23@01)
    (<
      i@23@01
      (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
    (<
      i@23@01
      (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
    (get%precondition ($Snap.combine
      ($Snap.first $t@22@01)
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01)
    (get%precondition ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@23@01)
      (<
        i@23@01
        (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))))
  (and
    (<= 0 i@23@01)
    (<
      i@23@01
      (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@23@01 Int)) (!
  (and
    (or (<= 0 i@23@01) (not (<= 0 i@23@01)))
    (=>
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
        (<
          i@23@01
          (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
        (get%precondition ($Snap.combine
          ($Snap.first $t@22@01)
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01)
        (get%precondition ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01)))
    (or
      (not
        (and
          (<= 0 i@23@01)
          (<
            i@23@01
            (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))))
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))))
  :pattern ((get%limited ($Snap.combine
    ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119-aux|)))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and
      (<= 0 i@23@01)
      (<
        i@23@01
        (length ($Snap.second ($Snap.second ($Snap.second $t@18@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
    (=
      (get ($Snap.combine
        ($Snap.first $t@22@01)
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01)
      (get ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01)))
  :pattern ((get%limited ($Snap.combine
    ($Snap.second ($Snap.second ($Snap.second $t@18@01)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) i@23@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@22@01))) $Snap.unit))
; [eval] get(this, length(this, end) - 1, end) == val
; [eval] get(this, length(this, end) - 1, end)
; [eval] length(this, end) - 1
; [eval] length(this, end)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [eval] 0 <= i
(push) ; 6
(assert (not (<=
  0
  (-
    (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
    1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
    1)))
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  (-
    (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
    1)
  (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  (-
    (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
    1)
  (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) (-
  (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
  1) end@16@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
      1))
  (<
    (-
      (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
      1)
    (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) (-
    (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
    1) end@16@01)))
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) (-
    (length ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)
    1) end@16@01)
  val@17@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(lseg(this, end), write)
; [eval] this.next != end
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:($t@18@01)) != end@16@01 | live]
; [else-branch: 11 | First:(Second:($t@18@01)) == end@16@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | First:(Second:($t@18@01)) != end@16@01]
; [eval] this.next != null
(assert (lseg%trigger ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))
; [eval] length(this, end) == old(length(this, end)) + 1
; [eval] length(this, end)
(push) ; 6
(assert (length%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))
; [eval] old(length(this, end)) + 1
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 6
(assert (length%precondition $t@18@01 this@15@01 end@16@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition $t@18@01 this@15@01 end@16@01))
(push) ; 6
(assert (not (=
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
  (+ (length $t@18@01 this@15@01 end@16@01) 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
  (+ (length $t@18@01 this@15@01 end@16@01) 1)))
; [eval] (forall i: Int :: { old(get(this, i, end)) } 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end)))
(declare-const i@24@01 Int)
(push) ; 6
; [eval] 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end))
; [eval] 0 <= i && i < old(length(this, end))
; [eval] 0 <= i
(push) ; 7
; [then-branch: 12 | !(0 <= i@24@01) | live]
; [else-branch: 12 | 0 <= i@24@01 | live]
(push) ; 8
; [then-branch: 12 | !(0 <= i@24@01)]
(assert (not (<= 0 i@24@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 12 | 0 <= i@24@01]
(assert (<= 0 i@24@01))
; [eval] i < old(length(this, end))
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 9
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@24@01) (not (<= 0 i@24@01))))
(push) ; 7
; [then-branch: 13 | 0 <= i@24@01 && i@24@01 < length($t@18@01, this@15@01, end@16@01) | live]
; [else-branch: 13 | !(0 <= i@24@01 && i@24@01 < length($t@18@01, this@15@01, end@16@01)) | live]
(push) ; 8
; [then-branch: 13 | 0 <= i@24@01 && i@24@01 < length($t@18@01, this@15@01, end@16@01)]
(assert (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01))))
; [eval] get(this, i, end) == old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 9
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (<
  i@24@01
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (<
  i@24@01
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))
(pop) ; 9
; Joined path conditions
(assert (and
  (<
    i@24@01
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))
  (get%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)))
; [eval] old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 9
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (get%precondition ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))
(pop) ; 9
; Joined path conditions
(assert (get%precondition ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))
(pop) ; 8
(push) ; 8
; [else-branch: 13 | !(0 <= i@24@01 && i@24@01 < length($t@18@01, this@15@01, end@16@01))]
(assert (not (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01)))
  (and
    (<= 0 i@24@01)
    (< i@24@01 (length $t@18@01 this@15@01 end@16@01))
    (<
      i@24@01
      (length ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))
    (get%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)
    (get%precondition ($Snap.combine
      $t@18@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01))))
  (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01)))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@24@01 Int)) (!
  (and
    (or (<= 0 i@24@01) (not (<= 0 i@24@01)))
    (=>
      (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01)))
      (and
        (<= 0 i@24@01)
        (< i@24@01 (length $t@18@01 this@15@01 end@16@01))
        (<
          i@24@01
          (length ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))
        (get%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)
        (get%precondition ($Snap.combine
          $t@18@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)))
    (or
      (not
        (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01))))
      (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01)))))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119-aux|)))
(assert (forall ((i@24@01 Int)) (!
  (and
    (=> (<= 0 i@24@01) (length%precondition $t@18@01 this@15@01 end@16@01))
    (=>
      (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01)))
      (and
        (get%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)
        (get%precondition ($Snap.combine
          $t@18@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119_precondition|)))
(push) ; 6
(assert (not (forall ((i@24@01 Int)) (!
  (=>
    (and
      (and
        (=> (<= 0 i@24@01) (length%precondition $t@18@01 this@15@01 end@16@01))
        (=>
          (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01)))
          (and
            (get%precondition ($Snap.combine
              ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)
            (get%precondition ($Snap.combine
              $t@18@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))))
      (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01))))
    (=
      (get ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)
      (get ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (<= 0 i@24@01) (< i@24@01 (length $t@18@01 this@15@01 end@16@01)))
    (=
      (get ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)
      (get ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01)))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@24@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119|)))
; [eval] get(this, length(this, end) - 1, end) == val
; [eval] get(this, length(this, end) - 1, end)
; [eval] length(this, end) - 1
; [eval] length(this, end)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
; [eval] 0 <= i
(push) ; 7
(assert (not (<=
  0
  (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
    1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
    1)))
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (<
  (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
    1)
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
    1)
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
  1) end@16@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (length ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
      1))
  (<
    (-
      (length ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
      1)
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01))
  (get%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
    1) end@16@01)))
(push) ; 6
(assert (not (=
  (get ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
    1) end@16@01)
  val@17@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit ($Snap.first $t@22@01)))) this@15@01 end@16@01)
    1) end@16@01)
  val@17@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 6 | First:(Second:($t@18@01)) == end@16@01]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))
(assert (= ($Snap.second ($Snap.second $t@18@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (lseg%trigger $t@18@01 this@15@01 end@16@01))
; [eval] this.next == end
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))) end@16@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:($t@18@01)) == end@16@01 | live]
; [else-branch: 14 | First:(Second:($t@18@01)) != end@16@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 14 | First:(Second:($t@18@01)) == end@16@01]
; [exec]
; n := new(next, value)
(declare-const n@25@01 $Ref)
(assert (not (= n@25@01 $Ref.null)))
(declare-const next@26@01 $Ref)
(declare-const value@27@01 Int)
(assert (not (= n@25@01 end@16@01)))
(assert (not (= n@25@01 this@15@01)))
(assert (not (= n@25@01 n@21@01)))
(assert (not
  (= n@25@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@18@01))))))
; [exec]
; n.next := end
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@15@01 n@25@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; n.value := val
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@15@01 n@25@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; this.next := n
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= n@25@01 this@15@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(lseg(n, end), write)
; [eval] this.next != end
; [then-branch: 15 | False | dead]
; [else-branch: 15 | True | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 15 | True]
(assert (lseg%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val@17@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)) n@25@01 end@16@01))
; [exec]
; fold acc(lseg(this, end), write)
; [eval] this.next != end
(push) ; 6
(set-option :timeout 10)
(assert (not (= n@25@01 end@16@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | n@25@01 != end@16@01 | live]
; [else-branch: 16 | n@25@01 == end@16@01 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | n@25@01 != end@16@01]
; [eval] this.next != null
(assert (lseg%trigger ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n@25@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap val@17@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01))
; [eval] length(this, end) == old(length(this, end)) + 1
; [eval] length(this, end)
(push) ; 7
(assert (length%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n@25@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap val@17@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n@25@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap val@17@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01))
; [eval] old(length(this, end)) + 1
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 7
(assert (length%precondition $t@18@01 this@15@01 end@16@01))
(pop) ; 7
; Joined path conditions
(assert (length%precondition $t@18@01 this@15@01 end@16@01))
(push) ; 7
(assert (not (=
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
  (+ (length $t@18@01 this@15@01 end@16@01) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
  (+ (length $t@18@01 this@15@01 end@16@01) 1)))
; [eval] (forall i: Int :: { old(get(this, i, end)) } 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end)))
(declare-const i@28@01 Int)
(push) ; 7
; [eval] 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end))
; [eval] 0 <= i && i < old(length(this, end))
; [eval] 0 <= i
(push) ; 8
; [then-branch: 17 | !(0 <= i@28@01) | live]
; [else-branch: 17 | 0 <= i@28@01 | live]
(push) ; 9
; [then-branch: 17 | !(0 <= i@28@01)]
(assert (not (<= 0 i@28@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 17 | 0 <= i@28@01]
(assert (<= 0 i@28@01))
; [eval] i < old(length(this, end))
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@28@01) (not (<= 0 i@28@01))))
(push) ; 8
; [then-branch: 18 | 0 <= i@28@01 && i@28@01 < length($t@18@01, this@15@01, end@16@01) | live]
; [else-branch: 18 | !(0 <= i@28@01 && i@28@01 < length($t@18@01, this@15@01, end@16@01)) | live]
(push) ; 9
; [then-branch: 18 | 0 <= i@28@01 && i@28@01 < length($t@18@01, this@15@01, end@16@01)]
(assert (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01))))
; [eval] get(this, i, end) == old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 10
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (<
  i@28@01
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (<
  i@28@01
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (<
    i@28@01
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01))
  (get%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)))
; [eval] old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 10
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (get%precondition ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))
(pop) ; 10
; Joined path conditions
(assert (get%precondition ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))
(pop) ; 9
(push) ; 9
; [else-branch: 18 | !(0 <= i@28@01 && i@28@01 < length($t@18@01, this@15@01, end@16@01))]
(assert (not (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01)))
  (and
    (<= 0 i@28@01)
    (< i@28@01 (length $t@18@01 this@15@01 end@16@01))
    (<
      i@28@01
      (length ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n@25@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.IntTo$Snap val@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01))
    (get%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n@25@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.IntTo$Snap val@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)
    (get%precondition ($Snap.combine
      $t@18@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01))))
  (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@28@01 Int)) (!
  (and
    (or (<= 0 i@28@01) (not (<= 0 i@28@01)))
    (=>
      (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01)))
      (and
        (<= 0 i@28@01)
        (< i@28@01 (length $t@18@01 this@15@01 end@16@01))
        (<
          i@28@01
          (length ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap n@25@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val@17@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap end@16@01)
                    $Snap.unit))))) this@15@01 end@16@01))
        (get%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap n@25@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val@17@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap end@16@01)
                    $Snap.unit)))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)
        (get%precondition ($Snap.combine
          $t@18@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)))
    (or
      (not
        (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01))))
      (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01)))))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119-aux|)))
(assert (forall ((i@28@01 Int)) (!
  (and
    (=> (<= 0 i@28@01) (length%precondition $t@18@01 this@15@01 end@16@01))
    (=>
      (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01)))
      (and
        (get%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap n@25@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val@17@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap end@16@01)
                    $Snap.unit)))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)
        (get%precondition ($Snap.combine
          $t@18@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119_precondition|)))
(push) ; 7
(assert (not (forall ((i@28@01 Int)) (!
  (=>
    (and
      (and
        (=> (<= 0 i@28@01) (length%precondition $t@18@01 this@15@01 end@16@01))
        (=>
          (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01)))
          (and
            (get%precondition ($Snap.combine
              ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap n@25@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap val@17@01)
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap end@16@01)
                        $Snap.unit)))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)
            (get%precondition ($Snap.combine
              $t@18@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))))
      (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01))))
    (=
      (get ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap n@25@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.IntTo$Snap val@17@01)
                ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)
      (get ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= 0 i@28@01) (< i@28@01 (length $t@18@01 this@15@01 end@16@01)))
    (=
      (get ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap n@25@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.IntTo$Snap val@17@01)
                ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)
      (get ($Snap.combine $t@18@01 ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01)))
  :pattern ((get%limited ($Snap.combine
    $t@18@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 i@28@01 end@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119|)))
; [eval] get(this, length(this, end) - 1, end) == val
; [eval] get(this, length(this, end) - 1, end)
; [eval] length(this, end) - 1
; [eval] length(this, end)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [eval] 0 <= i
(push) ; 8
(assert (not (<=
  0
  (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
    1))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
    1)))
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (<
  (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
    1)
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<
  (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
    1)
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
  (length ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@25@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.IntTo$Snap val@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
  1) end@16@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (length ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n@25@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.IntTo$Snap val@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
      1))
  (<
    (-
      (length ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n@25@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.IntTo$Snap val@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
      1)
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01))
  (get%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
    1) end@16@01)))
(push) ; 7
(assert (not (=
  (get ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
    1) end@16@01)
  val@17@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit)))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@15@01 (-
    (length ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@25@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.IntTo$Snap val@17@01)
            ($Snap.combine ($SortWrappers.$RefTo$Snap end@16@01) $Snap.unit))))) this@15@01 end@16@01)
    1) end@16@01)
  val@17@01))
(pop) ; 6
(pop) ; 5
(pop) ; 4
; [eval] !(this.next == end)
; [eval] this.next == end
; [then-branch: 19 | First:(Second:($t@18@01)) != end@16@01 | dead]
; [else-branch: 19 | First:(Second:($t@18@01)) == end@16@01 | live]
(push) ; 4
; [else-branch: 19 | First:(Second:($t@18@01)) == end@16@01]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t1 ----------
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var n: Ref
(declare-const n@29@01 $Ref)
; [exec]
; n := new(next, value)
(declare-const n@30@01 $Ref)
(assert (not (= n@30@01 $Ref.null)))
(declare-const next@31@01 $Ref)
(declare-const value@32@01 Int)
(assert (not (= n@30@01 n@29@01)))
; [exec]
; init(n, 0)
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (=
  ($Snap.second $t@33@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@33@01))
    ($Snap.second ($Snap.second $t@33@01)))))
(assert (= ($Snap.first ($Snap.second $t@33@01)) $Snap.unit))
; [eval] length(this, null) == 1
; [eval] length(this, null)
(push) ; 3
(assert (length%precondition ($Snap.first $t@33@01) n@30@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@33@01) n@30@01 $Ref.null))
(assert (= (length ($Snap.first $t@33@01) n@30@01 $Ref.null) 1))
(assert (= ($Snap.second ($Snap.second $t@33@01)) $Snap.unit))
; [eval] get(this, 0, null) == val
; [eval] get(this, 0, null)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< 0 (length ($Snap.first $t@33@01) n@30@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (length ($Snap.first $t@33@01) n@30@01 $Ref.null)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@33@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 0 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 (length ($Snap.first $t@33@01) n@30@01 $Ref.null))
  (get%precondition ($Snap.combine
    ($Snap.first $t@33@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 0 $Ref.null)))
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@33@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 0 $Ref.null)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert get(n, 0, null) == 0
; [eval] get(n, 0, null) == 0
; [eval] get(n, 0, null)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(pop) ; 3
; Joined path conditions
; [exec]
; addAtEnd(n, null, 1)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (=
  ($Snap.second $t@34@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@34@01))
    ($Snap.second ($Snap.second $t@34@01)))))
(assert (= ($Snap.first ($Snap.second $t@34@01)) $Snap.unit))
; [eval] length(this, end) == old(length(this, end)) + 1
; [eval] length(this, end)
(push) ; 3
(assert (length%precondition ($Snap.first $t@34@01) n@30@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@34@01) n@30@01 $Ref.null))
; [eval] old(length(this, end)) + 1
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  (length ($Snap.first $t@34@01) n@30@01 $Ref.null)
  (+ (length ($Snap.first $t@33@01) n@30@01 $Ref.null) 1)))
(assert (=
  ($Snap.second ($Snap.second $t@34@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@34@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@34@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@34@01))) $Snap.unit))
; [eval] (forall i: Int :: { old(get(this, i, end)) } 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end)))
(declare-const i@35@01 Int)
(push) ; 3
; [eval] 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end))
; [eval] 0 <= i && i < old(length(this, end))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 20 | !(0 <= i@35@01) | live]
; [else-branch: 20 | 0 <= i@35@01 | live]
(push) ; 5
; [then-branch: 20 | !(0 <= i@35@01)]
(assert (not (<= 0 i@35@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | 0 <= i@35@01]
(assert (<= 0 i@35@01))
; [eval] i < old(length(this, end))
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@35@01) (not (<= 0 i@35@01))))
(push) ; 4
; [then-branch: 21 | 0 <= i@35@01 && i@35@01 < length(First:($t@33@01), n@30@01, Null) | live]
; [else-branch: 21 | !(0 <= i@35@01 && i@35@01 < length(First:($t@33@01), n@30@01, Null)) | live]
(push) ; 5
; [then-branch: 21 | 0 <= i@35@01 && i@35@01 < length(First:($t@33@01), n@30@01, Null)]
(assert (and
  (<= 0 i@35@01)
  (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null))))
; [eval] get(this, i, end) == old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 6
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< i@35@01 (length ($Snap.first $t@34@01) n@30@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@35@01 (length ($Snap.first $t@34@01) n@30@01 $Ref.null)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@34@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@35@01 (length ($Snap.first $t@34@01) n@30@01 $Ref.null))
  (get%precondition ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null)))
; [eval] old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 6
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@33@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@33@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(0 <= i@35@01 && i@35@01 < length(First:($t@33@01), n@30@01, Null))]
(assert (not
  (and
    (<= 0 i@35@01)
    (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@35@01)
    (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null)))
  (and
    (<= 0 i@35@01)
    (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null))
    (< i@35@01 (length ($Snap.first $t@34@01) n@30@01 $Ref.null))
    (get%precondition ($Snap.combine
      ($Snap.first $t@34@01)
      ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null)
    (get%precondition ($Snap.combine
      ($Snap.first $t@33@01)
      ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@35@01)
      (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null))))
  (and
    (<= 0 i@35@01)
    (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@35@01 Int)) (!
  (and
    (or (<= 0 i@35@01) (not (<= 0 i@35@01)))
    (=>
      (and
        (<= 0 i@35@01)
        (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null)))
      (and
        (<= 0 i@35@01)
        (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null))
        (< i@35@01 (length ($Snap.first $t@34@01) n@30@01 $Ref.null))
        (get%precondition ($Snap.combine
          ($Snap.first $t@34@01)
          ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null)
        (get%precondition ($Snap.combine
          ($Snap.first $t@33@01)
          ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null)))
    (or
      (not
        (and
          (<= 0 i@35@01)
          (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null))))
      (and
        (<= 0 i@35@01)
        (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null)))))
  :pattern ((get%limited ($Snap.combine
    ($Snap.first $t@33@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119-aux|)))
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and
      (<= 0 i@35@01)
      (< i@35@01 (length ($Snap.first $t@33@01) n@30@01 $Ref.null)))
    (=
      (get ($Snap.combine
        ($Snap.first $t@34@01)
        ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null)
      (get ($Snap.combine
        ($Snap.first $t@33@01)
        ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null)))
  :pattern ((get%limited ($Snap.combine
    ($Snap.first $t@33@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 i@35@01 $Ref.null))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@34@01))) $Snap.unit))
; [eval] get(this, length(this, end) - 1, end) == val
; [eval] get(this, length(this, end) - 1, end)
; [eval] length(this, end) - 1
; [eval] length(this, end)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [eval] 0 <= i
(push) ; 4
(assert (not (<= 0 (- (length ($Snap.first $t@34@01) n@30@01 $Ref.null) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- (length ($Snap.first $t@34@01) n@30@01 $Ref.null) 1)))
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<
  (- (length ($Snap.first $t@34@01) n@30@01 $Ref.null) 1)
  (length ($Snap.first $t@34@01) n@30@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- (length ($Snap.first $t@34@01) n@30@01 $Ref.null) 1)
  (length ($Snap.first $t@34@01) n@30@01 $Ref.null)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@34@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 (-
  (length ($Snap.first $t@34@01) n@30@01 $Ref.null)
  1) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= 0 (- (length ($Snap.first $t@34@01) n@30@01 $Ref.null) 1))
  (<
    (- (length ($Snap.first $t@34@01) n@30@01 $Ref.null) 1)
    (length ($Snap.first $t@34@01) n@30@01 $Ref.null))
  (get%precondition ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 (-
    (length ($Snap.first $t@34@01) n@30@01 $Ref.null)
    1) $Ref.null)))
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 (-
    (length ($Snap.first $t@34@01) n@30@01 $Ref.null)
    1) $Ref.null)
  1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert get(n, 0, null) == 0
; [eval] get(n, 0, null) == 0
; [eval] get(n, 0, null)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< 0 (length ($Snap.first $t@34@01) n@30@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (length ($Snap.first $t@34@01) n@30@01 $Ref.null)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@34@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 0 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 (length ($Snap.first $t@34@01) n@30@01 $Ref.null))
  (get%precondition ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 0 $Ref.null)))
(push) ; 3
(assert (not (=
  (get ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 0 $Ref.null)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 0 $Ref.null)
  0))
; [exec]
; assert get(n, 1, null) == 1
; [eval] get(n, 1, null) == 1
; [eval] get(n, 1, null)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< 1 (length ($Snap.first $t@34@01) n@30@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 1 (length ($Snap.first $t@34@01) n@30@01 $Ref.null)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@34@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 1 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 1 (length ($Snap.first $t@34@01) n@30@01 $Ref.null))
  (get%precondition ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 1 $Ref.null)))
(push) ; 3
(assert (not (=
  (get ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 1 $Ref.null)
  1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@34@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@30@01 1 $Ref.null)
  1))
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var n: Ref
(declare-const n@36@01 $Ref)
; [exec]
; n := new(next, value)
(declare-const n@37@01 $Ref)
(assert (not (= n@37@01 $Ref.null)))
(declare-const next@38@01 $Ref)
(declare-const value@39@01 Int)
(assert (not (= n@37@01 n@36@01)))
; [exec]
; initUnitCycle(n, 0)
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 ($Snap.combine ($Snap.first $t@40@01) ($Snap.second $t@40@01))))
(assert (=
  ($Snap.second $t@40@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@40@01))
    ($Snap.second ($Snap.second $t@40@01)))))
(assert (= ($Snap.first ($Snap.second $t@40@01)) $Snap.unit))
; [eval] length(this, this) == 1
; [eval] length(this, this)
(push) ; 3
(assert (length%precondition ($Snap.first $t@40@01) n@37@01 n@37@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@40@01) n@37@01 n@37@01))
(assert (= (length ($Snap.first $t@40@01) n@37@01 n@37@01) 1))
(assert (=
  ($Snap.second ($Snap.second $t@40@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@40@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@40@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@40@01))) $Snap.unit))
; [eval] get(this, 0, this) == val
; [eval] get(this, 0, this)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< 0 (length ($Snap.first $t@40@01) n@37@01 n@37@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (length ($Snap.first $t@40@01) n@37@01 n@37@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@40@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 0 n@37@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 (length ($Snap.first $t@40@01) n@37@01 n@37@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@40@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 0 n@37@01)))
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@40@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 0 n@37@01)
  0))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@40@01))) $Snap.unit))
; [eval] (unfolding acc(lseg(this, this), write) in this.next == this)
(push) ; 3
(assert (lseg%trigger ($Snap.first $t@40@01) n@37@01 n@37@01))
(assert (=
  ($Snap.first $t@40@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@40@01))
    ($Snap.second ($Snap.first $t@40@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@40@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@40@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@40@01))))))
; [eval] this.next != end
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@40@01))))
  n@37@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(Second:(First:($t@40@01))) != n@37@01 | dead]
; [else-branch: 22 | First:(Second:(First:($t@40@01))) == n@37@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 22 | First:(Second:(First:($t@40@01))) == n@37@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@40@01))))
  n@37@01))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@40@01))) $Snap.unit))
; [eval] this.next == this
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (lseg%trigger ($Snap.first $t@40@01) n@37@01 n@37@01)
  (=
    ($Snap.first $t@40@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@40@01))
      ($Snap.second ($Snap.first $t@40@01))))
  (=
    ($Snap.second ($Snap.first $t@40@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@40@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@40@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@40@01))))
    n@37@01)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@40@01))))
      n@37@01)
    (= ($Snap.second ($Snap.second ($Snap.first $t@40@01))) $Snap.unit))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@40@01))))
  n@37@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert get(n, 0, n) == 0
; [eval] get(n, 0, n) == 0
; [eval] get(n, 0, n)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(pop) ; 3
; Joined path conditions
; [exec]
; addAtEnd(n, n, 1)
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 ($Snap.combine ($Snap.first $t@41@01) ($Snap.second $t@41@01))))
(assert (=
  ($Snap.second $t@41@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@41@01))
    ($Snap.second ($Snap.second $t@41@01)))))
(assert (= ($Snap.first ($Snap.second $t@41@01)) $Snap.unit))
; [eval] length(this, end) == old(length(this, end)) + 1
; [eval] length(this, end)
(push) ; 3
(assert (length%precondition ($Snap.first $t@41@01) n@37@01 n@37@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@41@01) n@37@01 n@37@01))
; [eval] old(length(this, end)) + 1
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  (length ($Snap.first $t@41@01) n@37@01 n@37@01)
  (+ (length ($Snap.first $t@40@01) n@37@01 n@37@01) 1)))
(assert (=
  ($Snap.second ($Snap.second $t@41@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@41@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@41@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@41@01))) $Snap.unit))
; [eval] (forall i: Int :: { old(get(this, i, end)) } 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end)))
(declare-const i@42@01 Int)
(push) ; 3
; [eval] 0 <= i && i < old(length(this, end)) ==> get(this, i, end) == old(get(this, i, end))
; [eval] 0 <= i && i < old(length(this, end))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 23 | !(0 <= i@42@01) | live]
; [else-branch: 23 | 0 <= i@42@01 | live]
(push) ; 5
; [then-branch: 23 | !(0 <= i@42@01)]
(assert (not (<= 0 i@42@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | 0 <= i@42@01]
(assert (<= 0 i@42@01))
; [eval] i < old(length(this, end))
; [eval] old(length(this, end))
; [eval] length(this, end)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@42@01) (not (<= 0 i@42@01))))
(push) ; 4
; [then-branch: 24 | 0 <= i@42@01 && i@42@01 < length(First:($t@40@01), n@37@01, n@37@01) | live]
; [else-branch: 24 | !(0 <= i@42@01 && i@42@01 < length(First:($t@40@01), n@37@01, n@37@01)) | live]
(push) ; 5
; [then-branch: 24 | 0 <= i@42@01 && i@42@01 < length(First:($t@40@01), n@37@01, n@37@01)]
(assert (and (<= 0 i@42@01) (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01))))
; [eval] get(this, i, end) == old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 6
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< i@42@01 (length ($Snap.first $t@41@01) n@37@01 n@37@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@42@01 (length ($Snap.first $t@41@01) n@37@01 n@37@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@41@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@42@01 (length ($Snap.first $t@41@01) n@37@01 n@37@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01)))
; [eval] old(get(this, i, end))
; [eval] get(this, i, end)
(push) ; 6
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@40@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01))
(pop) ; 6
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@40@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | !(0 <= i@42@01 && i@42@01 < length(First:($t@40@01), n@37@01, n@37@01))]
(assert (not
  (and
    (<= 0 i@42@01)
    (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@42@01)
    (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01)))
  (and
    (<= 0 i@42@01)
    (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01))
    (< i@42@01 (length ($Snap.first $t@41@01) n@37@01 n@37@01))
    (get%precondition ($Snap.combine
      ($Snap.first $t@41@01)
      ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01)
    (get%precondition ($Snap.combine
      ($Snap.first $t@40@01)
      ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@42@01)
      (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01))))
  (and
    (<= 0 i@42@01)
    (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@42@01 Int)) (!
  (and
    (or (<= 0 i@42@01) (not (<= 0 i@42@01)))
    (=>
      (and
        (<= 0 i@42@01)
        (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01)))
      (and
        (<= 0 i@42@01)
        (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01))
        (< i@42@01 (length ($Snap.first $t@41@01) n@37@01 n@37@01))
        (get%precondition ($Snap.combine
          ($Snap.first $t@41@01)
          ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01)
        (get%precondition ($Snap.combine
          ($Snap.first $t@40@01)
          ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01)))
    (or
      (not
        (and
          (<= 0 i@42@01)
          (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01))))
      (and
        (<= 0 i@42@01)
        (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01)))))
  :pattern ((get%limited ($Snap.combine
    ($Snap.first $t@40@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119-aux|)))
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and
      (<= 0 i@42@01)
      (< i@42@01 (length ($Snap.first $t@40@01) n@37@01 n@37@01)))
    (=
      (get ($Snap.combine
        ($Snap.first $t@41@01)
        ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01)
      (get ($Snap.combine
        ($Snap.first $t@40@01)
        ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01)))
  :pattern ((get%limited ($Snap.combine
    ($Snap.first $t@40@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 i@42@01 n@37@01))
  :qid |prog./silicon/silver/src/test/resources/all/predicates/lseg.vpr@55@14@55@119|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@41@01))) $Snap.unit))
; [eval] get(this, length(this, end) - 1, end) == val
; [eval] get(this, length(this, end) - 1, end)
; [eval] length(this, end) - 1
; [eval] length(this, end)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [eval] 0 <= i
(push) ; 4
(assert (not (<= 0 (- (length ($Snap.first $t@41@01) n@37@01 n@37@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- (length ($Snap.first $t@41@01) n@37@01 n@37@01) 1)))
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<
  (- (length ($Snap.first $t@41@01) n@37@01 n@37@01) 1)
  (length ($Snap.first $t@41@01) n@37@01 n@37@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- (length ($Snap.first $t@41@01) n@37@01 n@37@01) 1)
  (length ($Snap.first $t@41@01) n@37@01 n@37@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@41@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 (-
  (length ($Snap.first $t@41@01) n@37@01 n@37@01)
  1) n@37@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= 0 (- (length ($Snap.first $t@41@01) n@37@01 n@37@01) 1))
  (<
    (- (length ($Snap.first $t@41@01) n@37@01 n@37@01) 1)
    (length ($Snap.first $t@41@01) n@37@01 n@37@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 (-
    (length ($Snap.first $t@41@01) n@37@01 n@37@01)
    1) n@37@01)))
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 (-
    (length ($Snap.first $t@41@01) n@37@01 n@37@01)
    1) n@37@01)
  1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert get(n, 0, n) == 0
; [eval] get(n, 0, n) == 0
; [eval] get(n, 0, n)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< 0 (length ($Snap.first $t@41@01) n@37@01 n@37@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (length ($Snap.first $t@41@01) n@37@01 n@37@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@41@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 0 n@37@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 (length ($Snap.first $t@41@01) n@37@01 n@37@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 0 n@37@01)))
(push) ; 3
(assert (not (=
  (get ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 0 n@37@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 0 n@37@01)
  0))
; [exec]
; assert get(n, 1, n) == 1
; [eval] get(n, 1, n) == 1
; [eval] get(n, 1, n)
(push) ; 3
; [eval] 0 <= i
; [eval] i < length(this, end)
; [eval] length(this, end)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (< 1 (length ($Snap.first $t@41@01) n@37@01 n@37@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 1 (length ($Snap.first $t@41@01) n@37@01 n@37@01)))
(assert (get%precondition ($Snap.combine
  ($Snap.first $t@41@01)
  ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 1 n@37@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 1 (length ($Snap.first $t@41@01) n@37@01 n@37@01))
  (get%precondition ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 1 n@37@01)))
(push) ; 3
(assert (not (=
  (get ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 1 n@37@01)
  1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($Snap.first $t@41@01)
    ($Snap.combine $Snap.unit $Snap.unit)) n@37@01 1 n@37@01)
  1))
(pop) ; 2
(pop) ; 1
