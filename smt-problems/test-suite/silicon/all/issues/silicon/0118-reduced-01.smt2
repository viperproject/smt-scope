(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:13
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0118-reduced.vpr
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
(declare-fun get ($Snap $Ref Int) Int)
(declare-fun get%limited ($Snap $Ref Int) Int)
(declare-fun get%stateless ($Ref Int) Bool)
(declare-fun get%precondition ($Snap $Ref Int) Bool)
(declare-fun list_len ($Snap) Int)
(declare-fun list_len%limited ($Snap) Int)
(declare-const list_len%stateless Bool)
(declare-fun list_len%precondition ($Snap) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Node%trigger ($Snap $Ref) Bool)
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
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (length%limited s@$ this@0@00) (length s@$ this@0@00))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (length%stateless this@0@00)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@1@00 10))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=> (length%precondition s@$ this@0@00) (= (length s@$ this@0@00) 10))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION get----------
(declare-fun this@2@00 () $Ref)
(declare-fun i@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
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
  (= (get%limited s@$ this@2@00 i@3@00) (get s@$ this@2@00 i@3@00))
  :pattern ((get s@$ this@2@00 i@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (get%stateless this@2@00 i@3@00)
  :pattern ((get%limited s@$ this@2@00 i@3@00))
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
; [eval] (unfolding acc(Node(this), write) in (i == 0 ? -1 : get(this.next, i - 1)))
(set-option :timeout 0)
(push) ; 2
(assert (Node%trigger ($Snap.first s@$) this@2@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (not (= this@2@00 $Ref.null)))
; [eval] (i == 0 ? -1 : get(this.next, i - 1))
; [eval] i == 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@3@00 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@3@00 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@3@00 == 0 | live]
; [else-branch: 0 | i@3@00 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | i@3@00 == 0]
(assert (= i@3@00 0))
; [eval] -1
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i@3@00 != 0]
(assert (not (= i@3@00 0)))
; [eval] get(this.next, i - 1)
; [eval] i - 1
(push) ; 5
; [eval] 0 <= i
(push) ; 6
(assert (not (<= 0 (- i@3@00 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- i@3@00 1)))
; [eval] i < length(this)
; [eval] length(this)
(push) ; 6
(assert (length%precondition ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(push) ; 6
(assert (not (<
  (- i@3@00 1)
  (length ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- i@3@00 1)
  (length ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
(assert (get%precondition ($Snap.combine
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
  i@3@00
  1)))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 (- i@3@00 1))
  (length%precondition ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))
  (<
    (- i@3@00 1)
    (length ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
  (get%precondition ($Snap.combine
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
    i@3@00
    1))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= i@3@00 0))
  (and
    (not (= i@3@00 0))
    (<= 0 (- i@3@00 1))
    (length%precondition ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))
    (<
      (- i@3@00 1)
      (length ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
    (get%precondition ($Snap.combine
      ($Snap.second ($Snap.first s@$))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
      i@3@00
      1)))))
(assert (or (not (= i@3@00 0)) (= i@3@00 0)))
(pop) ; 2
; Joined path conditions
(assert (and
  (Node%trigger ($Snap.first s@$) this@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (not (= this@2@00 $Ref.null))
  (=>
    (not (= i@3@00 0))
    (and
      (not (= i@3@00 0))
      (<= 0 (- i@3@00 1))
      (length%precondition ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))
      (<
        (- i@3@00 1)
        (length ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
      (get%precondition ($Snap.combine
        ($Snap.second ($Snap.first s@$))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
        i@3@00
        1))))
  (or (not (= i@3@00 0)) (= i@3@00 0))))
(assert (=
  result@4@00
  (ite
    (= i@3@00 0)
    (- 0 1)
    (get ($Snap.combine
      ($Snap.second ($Snap.first s@$))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
      i@3@00
      1)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (=>
    (get%precondition s@$ this@2@00 i@3@00)
    (=
      (get s@$ this@2@00 i@3@00)
      (ite
        (= i@3@00 0)
        (- 0 1)
        (get%limited ($Snap.combine
          ($Snap.second ($Snap.first s@$))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
          i@3@00
          1)))))
  :pattern ((get s@$ this@2@00 i@3@00))
  :pattern ((get%stateless this@2@00 i@3@00) (Node%trigger ($Snap.first s@$) this@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (i@3@00 Int)) (!
  (=>
    (get%precondition s@$ this@2@00 i@3@00)
    (ite
      (= i@3@00 0)
      true
      (get%precondition ($Snap.combine
        ($Snap.second ($Snap.first s@$))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
        i@3@00
        1))))
  :pattern ((get s@$ this@2@00 i@3@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION list_len----------
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (list_len%limited s@$) (list_len s@$))
  :pattern ((list_len s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as list_len%stateless  Bool)
  :pattern ((list_len%limited s@$))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@5@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (list_len%precondition s@$) (= (list_len s@$) 0))
  :pattern ((list_len s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((list_len s@$))
  :qid |quant-u-11|)))
; ---------- Node ----------
(declare-const this@6@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 ($Snap.combine ($Snap.first $t@7@00) ($Snap.second $t@7@00))))
(assert (not (= this@6@00 $Ref.null)))
(pop) ; 1
