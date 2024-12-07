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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
(declare-const list@0@01 $Ref)
(declare-const list@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; label new_promise
; [exec]
; package acc(List(list), write) &&
; (length(list) == old[new_promise](length(list)) &&
; (forall i: Int ::
;   { item_at(list, i) }
;   0 <= i && i < length(list) ==> 2 == old[new_promise](item_at(list, i)))) --*
; true {
; }
(push) ; 3
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(assert (=
  ($Snap.second $t@3@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@01))
    ($Snap.second ($Snap.second $t@3@01)))))
(assert (= ($Snap.first ($Snap.second $t@3@01)) $Snap.unit))
; [eval] length(list) == old[new_promise](length(list))
; [eval] length(list)
(push) ; 4
(assert (length%precondition ($Snap.first $t@3@01) list@1@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.first $t@3@01) list@1@01))
; [eval] old[new_promise](length(list))
; [eval] length(list)
(push) ; 4
(assert (length%precondition $t@2@01 list@1@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition $t@2@01 list@1@01))
(assert (= (length ($Snap.first $t@3@01) list@1@01) (length $t@2@01 list@1@01)))
(assert (= ($Snap.second ($Snap.second $t@3@01)) $Snap.unit))
; [eval] (forall i: Int :: { item_at(list, i) } 0 <= i && i < length(list) ==> 2 == old[new_promise](item_at(list, i)))
(declare-const i@4@01 Int)
(push) ; 4
; [eval] 0 <= i && i < length(list) ==> 2 == old[new_promise](item_at(list, i))
; [eval] 0 <= i && i < length(list)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 0 | !(0 <= i@4@01) | live]
; [else-branch: 0 | 0 <= i@4@01 | live]
(push) ; 6
; [then-branch: 0 | !(0 <= i@4@01)]
(assert (not (<= 0 i@4@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 0 | 0 <= i@4@01]
(assert (<= 0 i@4@01))
; [eval] i < length(list)
; [eval] length(list)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@4@01) (not (<= 0 i@4@01))))
(push) ; 5
; [then-branch: 1 | 0 <= i@4@01 && i@4@01 < length(First:($t@3@01), list@1@01) | live]
; [else-branch: 1 | !(0 <= i@4@01 && i@4@01 < length(First:($t@3@01), list@1@01)) | live]
(push) ; 6
; [then-branch: 1 | 0 <= i@4@01 && i@4@01 < length(First:($t@3@01), list@1@01)]
(assert (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))))
; [eval] 2 == old[new_promise](item_at(list, i))
; [eval] old[new_promise](item_at(list, i))
; [eval] item_at(list, i)
(push) ; 7
; [eval] count < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (< i@4@01 (length $t@2@01 list@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (< i@4@01 (length $t@2@01 list@1@01)))
; [eval] count >= 0
(push) ; 8
(assert (not (>= i@4@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (>= i@4@01 0))
(assert (item_at%precondition ($Snap.combine
  $t@2@01
  ($Snap.combine $Snap.unit $Snap.unit)) list@1@01 i@4@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (< i@4@01 (length $t@2@01 list@1@01))
  (>= i@4@01 0)
  (item_at%precondition ($Snap.combine
    $t@2@01
    ($Snap.combine $Snap.unit $Snap.unit)) list@1@01 i@4@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | !(0 <= i@4@01 && i@4@01 < length(First:($t@3@01), list@1@01))]
(assert (not (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01)))
  (and
    (<= 0 i@4@01)
    (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))
    (< i@4@01 (length $t@2@01 list@1@01))
    (>= i@4@01 0)
    (item_at%precondition ($Snap.combine
      $t@2@01
      ($Snap.combine $Snap.unit $Snap.unit)) list@1@01 i@4@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))))
  (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01)))))
; [eval] item_at(list, i)
(push) ; 5
; [eval] count < length(this)
; [eval] length(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] count < length(this)
; [eval] length(this)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] count < length(this)
; [eval] length(this)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] count < length(this)
; [eval] length(this)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@4@01 Int)) (!
  (and
    (or (<= 0 i@4@01) (not (<= 0 i@4@01)))
    (=>
      (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01)))
      (and
        (<= 0 i@4@01)
        (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))
        (< i@4@01 (length $t@2@01 list@1@01))
        (>= i@4@01 0)
        (item_at%precondition ($Snap.combine
          $t@2@01
          ($Snap.combine $Snap.unit $Snap.unit)) list@1@01 i@4@01)))
    (or
      (not
        (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01))))
      (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01)))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0313b.vpr@34@17@36@56-aux|)))
(assert (forall ((i@4@01 Int)) (!
  (=>
    (and (<= 0 i@4@01) (< i@4@01 (length ($Snap.first $t@3@01) list@1@01)))
    (=
      2
      (item_at ($Snap.combine $t@2@01 ($Snap.combine $Snap.unit $Snap.unit)) list@1@01 i@4@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0313b.vpr@34@17@36@56|)))
; Create MagicWandSnapFunction for wand acc(List(list), write) && (length(list) == old[new_promise](length(list)) && (forall i: Int :: { item_at(list, i) } 0 <= i && i < length(list) ==> 2 == old[new_promise](item_at(list, i)))) --* true
(declare-const mwsf@5@01 $MWSF)
(assert (forall (($t@3@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@3@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@5@01 $t@3@01))
  :qid |quant-u-10|)))
; [eval] old[new_promise](length(list))
; [eval] length(list)
(push) ; 4
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (forall (($t@3@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@3@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@5@01 $t@3@01))
  :qid |quant-u-11|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
