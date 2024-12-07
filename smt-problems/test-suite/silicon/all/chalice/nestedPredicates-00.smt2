(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/nestedPredicates.vpr
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
(declare-fun getNext ($Snap $Ref) $Ref)
(declare-fun getNext%limited ($Snap $Ref) $Ref)
(declare-fun getNext%stateless ($Ref) Bool)
(declare-fun getNext%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid%trigger ($Snap $Ref) Bool)
(declare-fun p%trigger ($Snap $Ref) Bool)
(declare-fun q%trigger ($Snap $Ref) Bool)
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
(declare-fun $k@2@00 () $Perm)
(declare-fun joined_unfolding@8@00 ($Snap $Ref) $Ref)
(declare-fun $k@3@00 () $Perm)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (getNext%limited s@$ this@0@00) (getNext s@$ this@0@00))
  :pattern ((getNext s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (getNext%stateless this@0@00)
  :pattern ((getNext%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@2@00)
    ($Perm.isReadVar $k@3@00)
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    (=>
      (getNext%precondition s@$ this@0@00)
      (= (getNext s@$ this@0@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
  :pattern ((getNext s@$ this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((getNext s@$ this@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- testNestingUnfold ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $k@2@01 $Perm)
(assert ($Perm.isReadVar $k@2@01))
(declare-const $t@3@01 $Snap)
(assert (<= $Perm.No $k@2@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this), wildcard)
(declare-const $k@4@01 $Perm)
(assert ($Perm.isReadVar $k@4@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@2@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@4@01 $k@2@01))
(assert (<= $Perm.No (- $k@2@01 $k@4@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(declare-const $k@5@01 $Perm)
(assert ($Perm.isReadVar $k@5@01))
(assert (<= $Perm.No (* $k@5@01 $k@4@01)))
(assert (<= (* $k@5@01 $k@4@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@5@01 $k@4@01)) (not (= this@1@01 $Ref.null))))
(assert (=
  ($Snap.second $t@3@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@01))
    ($Snap.second ($Snap.second $t@3@01)))))
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (<= $Perm.No (* $k@6@01 $k@4@01)))
(assert (<= (* $k@6@01 $k@4@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@6@01 $k@4@01)) (not (= this@1@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@3@01) != Null | live]
; [else-branch: 0 | First:($t@3@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:($t@3@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@7@01 $k@4@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@3@01 this@1@01))
; [exec]
; assert this != this.next
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) this@1@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@2@01 $k@4@01)) (< $Perm.No (* $k@7@01 $k@4@01)))
  (not (= $t@3@01 ($Snap.second ($Snap.second $t@3@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@7@01 $k@4@01)) (< $Perm.No (- $k@2@01 $k@4@01)))
  (not (= ($Snap.second ($Snap.second $t@3@01)) $t@3@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) this@1@01))))
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:($t@3@01) != Null | live]
; [else-branch: 1 | First:($t@3@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:($t@3@01) != Null]
; [exec]
; unfold acc(valid(this.next), wildcard)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (* $k@7@01 $k@4@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< $k@8@01 (* $k@7@01 $k@4@01)))
(assert (<= $Perm.No (- (* $k@7@01 $k@4@01) $k@8@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@3@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@3@01))))))
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@9@01 $k@8@01)))
(assert (<= (* $k@9@01 $k@8@01) $Perm.Write))
(assert (=>
  (< $Perm.No (* $k@9@01 $k@8@01))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@3@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01)))))))
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@10@01 $k@8@01)))
(assert (<= (* $k@10@01 $k@8@01) $Perm.Write))
(assert (=>
  (< $Perm.No (* $k@10@01 $k@8@01))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@01 $k@8@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(Second:($t@3@01))) != Null | live]
; [else-branch: 2 | First:(Second:(Second:($t@3@01))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(Second:(Second:($t@3@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
    $Ref.null)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@01 $k@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@11@01 $k@8@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.second $t@3@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
; [exec]
; assert this.next != this.next.next
; [eval] this.next != this.next.next
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@01 $k@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))))))
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) this@1@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) this@1@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
  this@1@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- (* $k@7@01 $k@4@01) $k@8@01))
    (< $Perm.No (- $k@2@01 $k@4@01)))
  (not (= ($Snap.second ($Snap.second $t@3@01)) $t@3@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- (* $k@7@01 $k@4@01) $k@8@01))
    (< $Perm.No (* $k@11@01 $k@8@01)))
  (not
    (=
      ($Snap.second ($Snap.second $t@3@01))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01)))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@2@01 $k@4@01))
    (< $Perm.No (- (* $k@7@01 $k@4@01) $k@8@01)))
  (not (= $t@3@01 ($Snap.second ($Snap.second $t@3@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@2@01 $k@4@01)) (< $Perm.No (* $k@11@01 $k@8@01)))
  (not
    (=
      $t@3@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01)))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (* $k@11@01 $k@8@01))
    (< $Perm.No (- (* $k@7@01 $k@4@01) $k@8@01)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01))))
      ($Snap.second ($Snap.second $t@3@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@11@01 $k@8@01)) (< $Perm.No (- $k@2@01 $k@4@01)))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01))))
      $t@3@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) this@1@01))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01)))))))
  (and
    (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
    (not
      (=
        this@1@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01)))))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
        this@1@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (* $k@6@01 $k@4@01) (* $k@10@01 $k@8@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (* $k@10@01 $k@8@01) (* $k@6@01 $k@4@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (* $k@5@01 $k@4@01) (* $k@9@01 $k@8@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (* $k@9@01 $k@8@01) (* $k@5@01 $k@4@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@6@01 $k@4@01)) (< $Perm.No (* $k@10@01 $k@8@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@01))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@10@01 $k@8@01)) (< $Perm.No (* $k@6@01 $k@4@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@5@01 $k@4@01)) (< $Perm.No (* $k@9@01 $k@8@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01)))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@9@01 $k@8@01)) (< $Perm.No (* $k@5@01 $k@4@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) this@1@01))))
; [eval] this.next != this.next.next
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@01 $k@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert this != this.next.next
; [eval] this != this.next.next
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@01 $k@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | First:(Second:(Second:($t@3@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.second $t@3@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
; [exec]
; assert this.next != this.next.next
; [eval] this.next != this.next.next
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@01 $k@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01)))))))
; [exec]
; assert this != this.next.next
; [eval] this != this.next.next
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@01 $k@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (not
  (=
    this@1@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    this@1@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@01)))))))
(pop) ; 5
(pop) ; 4
; [eval] !(this.next != null)
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:($t@3@01) == Null | dead]
; [else-branch: 3 | First:($t@3@01) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | First:($t@3@01) != Null]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:($t@3@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@3@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@3@01 this@1@01))
; [exec]
; assert this != this.next
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:($t@3@01) != Null | dead]
; [else-branch: 4 | First:($t@3@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | First:($t@3@01) == Null]
(pop) ; 4
; [eval] !(this.next != null)
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@5@01 $k@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:($t@3@01) == Null | live]
; [else-branch: 5 | First:($t@3@01) != Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | First:($t@3@01) == Null]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- testNestingFold ----------
(declare-const this@12@01 $Ref)
(declare-const this@13@01 $Ref)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(declare-const $k@15@01 $Perm)
(assert ($Perm.isReadVar $k@15@01))
(assert (<= $Perm.No $k@15@01))
(assert (<= $k@15@01 $Perm.Write))
(assert (=> (< $Perm.No $k@15@01) (not (= this@13@01 $Ref.null))))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(assert (<= $Perm.No $k@16@01))
(assert (<= $k@16@01 $Perm.Write))
(assert (=> (< $Perm.No $k@16@01) (not (= this@13@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@17@01 $Perm)
(assert ($Perm.isReadVar $k@17@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@17@01))
(assert (<= $k@17@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@17@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@18@01 $Perm)
(assert ($Perm.isReadVar $k@18@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@18@01))
(assert (<= $k@18@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@18@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
  $Snap.unit))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  $Snap.unit))
; [eval] this.next.next != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@19@01 $Perm)
(assert ($Perm.isReadVar $k@19@01))
(assert (<= $Perm.No $k@19@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(valid(this.next), wildcard)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@20@01 $Perm)
(assert ($Perm.isReadVar $k@20@01))
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@17@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@21@01 $k@20@01) $k@17@01))
(assert (<= $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01))))
(assert (<= (- $k@17@01 (* $k@21@01 $k@20@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@21@01 $k@20@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@18@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@22@01 $k@20@01) $k@18@01))
(assert (<= $Perm.No (- $k@18@01 (* $k@22@01 $k@20@01))))
(assert (<= (- $k@18@01 (* $k@22@01 $k@20@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@18@01 (* $k@22@01 $k@20@01)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@22@01 $k@20@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(Second:($t@14@01))) != Null | live]
; [else-branch: 6 | First:(Second:(Second:($t@14@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(Second:(Second:($t@14@01))) != Null]
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@19@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@23@01 $k@20@01) $k@19@01))
(assert (<= $Perm.No (- $k@19@01 (* $k@23@01 $k@20@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@23@01 $k@20@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@20@01))
; [exec]
; assert this.next != this.next.next
; [eval] this.next != this.next.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@19@01 (* $k@23@01 $k@20@01))) (< $Perm.No $k@20@01))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@20@01) (< $Perm.No (- $k@19@01 (* $k@23@01 $k@20@01))))
  (not
    (=
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@18@01 (* $k@22@01 $k@20@01)) $k@16@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@16@01 (- $k@18@01 (* $k@22@01 $k@20@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@17@01 (* $k@21@01 $k@20@01)) $k@15@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@15@01 (- $k@17@01 (* $k@21@01 $k@20@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@18@01 (* $k@22@01 $k@20@01))) (< $Perm.No $k@16@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@14@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@16@01) (< $Perm.No (- $k@18@01 (* $k@22@01 $k@20@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@14@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01))) (< $Perm.No $k@15@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@15@01) (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) this@13@01))
  (not (= this@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))))))
; [eval] this.next != this.next.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(valid(this), wildcard)
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(declare-const $k@25@01 $Perm)
(assert ($Perm.isReadVar $k@25@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@15@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@25@01 $k@24@01) $k@15@01))
(assert (<= $Perm.No (- $k@15@01 (* $k@25@01 $k@24@01))))
(assert (<= (- $k@15@01 (* $k@25@01 $k@24@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@15@01 (* $k@25@01 $k@24@01)))
  (not (= this@13@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@25@01 $k@24@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@26@01 $Perm)
(assert ($Perm.isReadVar $k@26@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@16@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@26@01 $k@24@01) $k@16@01))
(assert (<= $Perm.No (- $k@16@01 (* $k@26@01 $k@24@01))))
(assert (<= (- $k@16@01 (* $k@26@01 $k@24@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@16@01 (* $k@26@01 $k@24@01)))
  (not (= this@13@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@26@01 $k@24@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:($t@14@01) != Null | live]
; [else-branch: 7 | First:($t@14@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | First:($t@14@01) != Null]
(declare-const $k@27@01 $Perm)
(assert ($Perm.isReadVar $k@27@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $k@20@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@27@01 $k@24@01) $k@20@01))
(assert (<= $Perm.No (- $k@20@01 (* $k@27@01 $k@24@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@27@01 $k@24@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (valid%trigger ($Snap.combine
  ($Snap.first $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))) this@13@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
  this@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) this@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@24@01))
; [exec]
; assert this != this.next
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@15@01 (* $k@25@01 $k@24@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert this != this.next.next
; [eval] this != this.next.next
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@15@01 (* $k@25@01 $k@24@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not
  (=
    this@13@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@13@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) this@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) this@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@20@01 (* $k@27@01 $k@24@01)))
    (< $Perm.No (- $k@19@01 (* $k@23@01 $k@20@01))))
  (not
    (=
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@20@01 (* $k@27@01 $k@24@01))) (< $Perm.No $k@24@01))
  (not
    (=
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
      ($Snap.combine
        ($Snap.first $t@14@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@14@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@19@01 (* $k@23@01 $k@20@01)))
    (< $Perm.No (- $k@20@01 (* $k@27@01 $k@24@01))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@19@01 (* $k@23@01 $k@20@01))) (< $Perm.No $k@24@01))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
      ($Snap.combine
        ($Snap.first $t@14@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@14@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@24@01) (< $Perm.No (- $k@20@01 (* $k@27@01 $k@24@01))))
  (not
    (=
      ($Snap.combine
        ($Snap.first $t@14@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@14@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@24@01) (< $Perm.No (- $k@19@01 (* $k@23@01 $k@20@01))))
  (not
    (=
      ($Snap.combine
        ($Snap.first $t@14@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@14@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) this@13@01)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
        this@13@01)))
  (and
    (not (= this@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))))
    (not
      (=
        this@13@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@16@01 (* $k@26@01 $k@24@01)) (- $k@18@01 (* $k@22@01 $k@20@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@18@01 (* $k@22@01 $k@20@01)) (- $k@16@01 (* $k@26@01 $k@24@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@15@01 (* $k@25@01 $k@24@01)) (- $k@17@01 (* $k@21@01 $k@20@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@17@01 (* $k@21@01 $k@20@01)) (- $k@15@01 (* $k@25@01 $k@24@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@16@01 (* $k@26@01 $k@24@01)))
    (< $Perm.No (- $k@18@01 (* $k@22@01 $k@20@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@14@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@18@01 (* $k@22@01 $k@20@01)))
    (< $Perm.No (- $k@16@01 (* $k@26@01 $k@24@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@14@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@15@01 (* $k@25@01 $k@24@01)))
    (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01)))
    (< $Perm.No (- $k@15@01 (* $k@25@01 $k@24@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= this@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01))))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@14@01)) this@13@01))))
; [eval] this != this.next.next
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@15@01 (* $k@25@01 $k@24@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@17@01 (* $k@21@01 $k@20@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- testNestingUnfolding ----------
(declare-const this@28@01 $Ref)
(declare-const this@29@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@30@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert this != (unfolding acc(valid(this), write) in this.next)
; [eval] this != (unfolding acc(valid(this), write) in this.next)
; [eval] (unfolding acc(valid(this), write) in this.next)
(push) ; 3
(assert (valid%trigger $t@30@01 this@29@01))
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(declare-const $k@31@01 $Perm)
(assert ($Perm.isReadVar $k@31@01))
(assert (<= $Perm.No $k@31@01))
(assert (<= $k@31@01 $Perm.Write))
(assert (=> (< $Perm.No $k@31@01) (not (= this@29@01 $Ref.null))))
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(declare-const $k@32@01 $Perm)
(assert ($Perm.isReadVar $k@32@01))
(assert (<= $Perm.No $k@32@01))
(assert (<= $k@32@01 $Perm.Write))
(assert (=> (< $Perm.No $k@32@01) (not (= this@29@01 $Ref.null))))
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@31@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:($t@30@01) != Null | live]
; [else-branch: 8 | First:($t@30@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | First:($t@30@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@31@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@33@01 $Perm)
(assert ($Perm.isReadVar $k@33@01))
(assert (<= $Perm.No $k@33@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@31@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 8 | First:($t@30@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@30@01)) $Snap.unit))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@31@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@34@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
  (=
    (as joined_unfolding@34@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)
  (=
    (as joined_unfolding@34@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@31@01))
(assert ($Perm.isReadVar $k@32@01))
(assert ($Perm.isReadVar $k@33@01))
(assert (and
  (valid%trigger $t@30@01 this@29@01)
  (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01)))
  (<= $Perm.No $k@31@01)
  (<= $k@31@01 $Perm.Write)
  (=> (< $Perm.No $k@31@01) (not (= this@29@01 $Ref.null)))
  (=
    ($Snap.second $t@30@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@30@01))
      ($Snap.second ($Snap.second $t@30@01))))
  (<= $Perm.No $k@32@01)
  (<= $k@32@01 $Perm.Write)
  (=> (< $Perm.No $k@32@01) (not (= this@29@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
    (<= $Perm.No $k@33@01))))
; Joined path conditions
(assert (and
  (valid%trigger $t@30@01 this@29@01)
  (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01)))
  (<= $Perm.No $k@31@01)
  (<= $k@31@01 $Perm.Write)
  (=> (< $Perm.No $k@31@01) (not (= this@29@01 $Ref.null)))
  (=
    ($Snap.second $t@30@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@30@01))
      ($Snap.second ($Snap.second $t@30@01))))
  (<= $Perm.No $k@32@01)
  (<= $k@32@01 $Perm.Write)
  (=> (< $Perm.No $k@32@01) (not (= this@29@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)
    (= ($Snap.second ($Snap.second $t@30@01)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@29@01 (as joined_unfolding@34@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != (unfolding acc(valid(this), write) in this.next)
; [eval] (unfolding acc(valid(this), write) in this.next)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@35@01 $Perm)
(assert ($Perm.isReadVar $k@35@01))
(assert (<= $Perm.No $k@35@01))
(assert (<= $k@35@01 $Perm.Write))
(assert (=> (< $Perm.No $k@35@01) (not (= this@29@01 $Ref.null))))
(declare-const $k@36@01 $Perm)
(assert ($Perm.isReadVar $k@36@01))
(assert (<= $Perm.No $k@36@01))
(assert (<= $k@36@01 $Perm.Write))
(assert (=> (< $Perm.No $k@36@01) (not (= this@29@01 $Ref.null))))
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@35@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:($t@30@01) != Null | live]
; [else-branch: 9 | First:($t@30@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | First:($t@30@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@35@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(assert (<= $Perm.No $k@37@01))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@35@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 9 | First:($t@30@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@30@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@35@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@38@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
  (=
    (as joined_unfolding@38@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)
  (=
    (as joined_unfolding@38@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@35@01))
(assert ($Perm.isReadVar $k@36@01))
(assert ($Perm.isReadVar $k@37@01))
(assert (and
  (<= $Perm.No $k@35@01)
  (<= $k@35@01 $Perm.Write)
  (=> (< $Perm.No $k@35@01) (not (= this@29@01 $Ref.null)))
  (<= $Perm.No $k@36@01)
  (<= $k@36@01 $Perm.Write)
  (=> (< $Perm.No $k@36@01) (not (= this@29@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
    (<= $Perm.No $k@37@01))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@35@01)
  (<= $k@35@01 $Perm.Write)
  (=> (< $Perm.No $k@35@01) (not (= this@29@01 $Ref.null)))
  (<= $Perm.No $k@36@01)
  (<= $k@36@01 $Perm.Write)
  (=> (< $Perm.No $k@36@01) (not (= this@29@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@29@01 (as joined_unfolding@38@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != (unfolding acc(valid(this), write) in this.next)
; [eval] (unfolding acc(valid(this), write) in this.next)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@39@01 $Perm)
(assert ($Perm.isReadVar $k@39@01))
(assert (<= $Perm.No $k@39@01))
(assert (<= $k@39@01 $Perm.Write))
(assert (=> (< $Perm.No $k@39@01) (not (= this@29@01 $Ref.null))))
(declare-const $k@40@01 $Perm)
(assert ($Perm.isReadVar $k@40@01))
(assert (<= $Perm.No $k@40@01))
(assert (<= $k@40@01 $Perm.Write))
(assert (=> (< $Perm.No $k@40@01) (not (= this@29@01 $Ref.null))))
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:($t@30@01) != Null | live]
; [else-branch: 10 | First:($t@30@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | First:($t@30@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@41@01 $Perm)
(assert ($Perm.isReadVar $k@41@01))
(assert (<= $Perm.No $k@41@01))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 10 | First:($t@30@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@30@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@42@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
  (=
    (as joined_unfolding@42@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)
  (=
    (as joined_unfolding@42@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@39@01))
(assert ($Perm.isReadVar $k@40@01))
(assert ($Perm.isReadVar $k@41@01))
(assert (and
  (<= $Perm.No $k@39@01)
  (<= $k@39@01 $Perm.Write)
  (=> (< $Perm.No $k@39@01) (not (= this@29@01 $Ref.null)))
  (<= $Perm.No $k@40@01)
  (<= $k@40@01 $Perm.Write)
  (=> (< $Perm.No $k@40@01) (not (= this@29@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
    (<= $Perm.No $k@41@01))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@39@01)
  (<= $k@39@01 $Perm.Write)
  (=> (< $Perm.No $k@39@01) (not (= this@29@01 $Ref.null)))
  (<= $Perm.No $k@40@01)
  (<= $k@40@01 $Perm.Write)
  (=> (< $Perm.No $k@40@01) (not (= this@29@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@29@01 (as joined_unfolding@42@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != (unfolding acc(valid(this), write) in this.next)
; [eval] (unfolding acc(valid(this), write) in this.next)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@43@01 $Perm)
(assert ($Perm.isReadVar $k@43@01))
(assert (<= $Perm.No $k@43@01))
(assert (<= $k@43@01 $Perm.Write))
(assert (=> (< $Perm.No $k@43@01) (not (= this@29@01 $Ref.null))))
(declare-const $k@44@01 $Perm)
(assert ($Perm.isReadVar $k@44@01))
(assert (<= $Perm.No $k@44@01))
(assert (<= $k@44@01 $Perm.Write))
(assert (=> (< $Perm.No $k@44@01) (not (= this@29@01 $Ref.null))))
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:($t@30@01) != Null | live]
; [else-branch: 11 | First:($t@30@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | First:($t@30@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@45@01 $Perm)
(assert ($Perm.isReadVar $k@45@01))
(assert (<= $Perm.No $k@45@01))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | First:($t@30@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@30@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@46@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
  (=
    (as joined_unfolding@46@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null)
  (=
    (as joined_unfolding@46@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@43@01))
(assert ($Perm.isReadVar $k@44@01))
(assert ($Perm.isReadVar $k@45@01))
(assert (and
  (<= $Perm.No $k@43@01)
  (<= $k@43@01 $Perm.Write)
  (=> (< $Perm.No $k@43@01) (not (= this@29@01 $Ref.null)))
  (<= $Perm.No $k@44@01)
  (<= $k@44@01 $Perm.Write)
  (=> (< $Perm.No $k@44@01) (not (= this@29@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@30@01)) $Ref.null))
    (<= $Perm.No $k@45@01))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@43@01)
  (<= $k@43@01 $Perm.Write)
  (=> (< $Perm.No $k@43@01) (not (= this@29@01 $Ref.null)))
  (<= $Perm.No $k@44@01)
  (<= $k@44@01 $Perm.Write)
  (=> (< $Perm.No $k@44@01) (not (= this@29@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@29@01 (as joined_unfolding@46@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- testNestingUnfoldTwo ----------
(declare-const this@47@01 $Ref)
(declare-const this@48@01 $Ref)
(push) ; 1
(declare-const $k@49@01 $Perm)
(assert ($Perm.isReadVar $k@49@01))
(declare-const $t@50@01 $Snap)
(assert (<= $Perm.No $k@49@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(p(this), wildcard)
(declare-const $k@51@01 $Perm)
(assert ($Perm.isReadVar $k@51@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@49@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@51@01 $k@49@01))
(assert (<= $Perm.No (- $k@49@01 $k@51@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@51@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(declare-const $k@52@01 $Perm)
(assert ($Perm.isReadVar $k@52@01))
(assert (<= $Perm.No (* $k@52@01 $k@51@01)))
(assert (<= (* $k@52@01 $k@51@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@52@01 $k@51@01)) (not (= this@48@01 $Ref.null))))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(declare-const $k@53@01 $Perm)
(assert ($Perm.isReadVar $k@53@01))
(assert (<= $Perm.No (* $k@53@01 $k@51@01)))
(assert (<= (* $k@53@01 $k@51@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@53@01 $k@51@01)) (not (= this@48@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@52@01 $k@51@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:($t@50@01) != Null | live]
; [else-branch: 12 | First:($t@50@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | First:($t@50@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01)) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@52@01 $k@51@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@54@01 $Perm)
(assert ($Perm.isReadVar $k@54@01))
(assert (<= $Perm.No (* $k@54@01 $k@51@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p%trigger $t@50@01 this@48@01))
; [exec]
; assert this != this.next
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@52@01 $k@51@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@48@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@52@01 $k@51@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@48@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@52@01 $k@51@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@48@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@52@01 $k@51@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@48@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@50@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- testNestingFoldTwo ----------
(declare-const this@55@01 $Ref)
(declare-const this@56@01 $Ref)
(push) ; 1
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 ($Snap.combine ($Snap.first $t@57@01) ($Snap.second $t@57@01))))
(declare-const $k@58@01 $Perm)
(assert ($Perm.isReadVar $k@58@01))
(assert (<= $Perm.No $k@58@01))
(assert (<= $k@58@01 $Perm.Write))
(assert (=> (< $Perm.No $k@58@01) (not (= this@56@01 $Ref.null))))
(assert (=
  ($Snap.second $t@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@57@01))
    ($Snap.second ($Snap.second $t@57@01)))))
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(assert (<= $Perm.No $k@59@01))
(assert (<= $k@59@01 $Perm.Write))
(assert (=> (< $Perm.No $k@59@01) (not (= this@56@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@57@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@57@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@57@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@60@01 $Perm)
(assert ($Perm.isReadVar $k@60@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@60@01))
(assert (<= $k@60@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@60@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@57@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@57@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@61@01 $Perm)
(assert ($Perm.isReadVar $k@61@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@61@01))
(assert (<= $k@61@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@61@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))
  $Snap.unit))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01))))))
  $Snap.unit))
; [eval] this.next.next != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@57@01))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@62@01 $Perm)
(assert ($Perm.isReadVar $k@62@01))
(assert (<= $Perm.No $k@62@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(q(this.next), wildcard)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@63@01 $Perm)
(assert ($Perm.isReadVar $k@63@01))
(declare-const $k@64@01 $Perm)
(assert ($Perm.isReadVar $k@64@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@60@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@64@01 $k@63@01) $k@60@01))
(assert (<= $Perm.No (- $k@60@01 (* $k@64@01 $k@63@01))))
(assert (<= (- $k@60@01 (* $k@64@01 $k@63@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@60@01 (* $k@64@01 $k@63@01)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@64@01 $k@63@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@65@01 $Perm)
(assert ($Perm.isReadVar $k@65@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@61@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@65@01 $k@63@01) $k@61@01))
(assert (<= $Perm.No (- $k@61@01 (* $k@65@01 $k@63@01))))
(assert (<= (- $k@61@01 (* $k@65@01 $k@63@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@61@01 (* $k@65@01 $k@63@01)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@65@01 $k@63@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@57@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(Second:($t@57@01))) != Null | live]
; [else-branch: 13 | First:(Second:(Second:($t@57@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | First:(Second:(Second:($t@57@01))) != Null]
(declare-const $k@66@01 $Perm)
(assert ($Perm.isReadVar $k@66@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@62@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@66@01 $k@63@01) $k@62@01))
(assert (<= $Perm.No (- $k@62@01 (* $k@66@01 $k@63@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@66@01 $k@63@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (q%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@57@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@57@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01))))
(assert (<= $Perm.No $k@63@01))
; [exec]
; assert this != this.next
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@61@01 (* $k@65@01 $k@63@01)) $k@59@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@59@01 (- $k@61@01 (* $k@65@01 $k@63@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@60@01 (* $k@64@01 $k@63@01)) $k@58@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@58@01 (- $k@60@01 (* $k@64@01 $k@63@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@61@01 (* $k@65@01 $k@63@01))) (< $Perm.No $k@59@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@57@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@59@01) (< $Perm.No (- $k@61@01 (* $k@65@01 $k@63@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@57@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@57@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@60@01 (* $k@64@01 $k@63@01))) (< $Perm.No $k@58@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@57@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@58@01) (< $Perm.No (- $k@60@01 (* $k@64@01 $k@63@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@57@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@61@01 (* $k@65@01 $k@63@01)) $k@59@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@59@01 (- $k@61@01 (* $k@65@01 $k@63@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@60@01 (* $k@64@01 $k@63@01)) $k@58@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@58@01 (- $k@60@01 (* $k@64@01 $k@63@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@61@01 (* $k@65@01 $k@63@01))) (< $Perm.No $k@59@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@57@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@59@01) (< $Perm.No (- $k@61@01 (* $k@65@01 $k@63@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@57@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@57@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@60@01 (* $k@64@01 $k@63@01))) (< $Perm.No $k@58@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@57@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@58@01) (< $Perm.No (- $k@60@01 (* $k@64@01 $k@63@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@57@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@61@01 (* $k@65@01 $k@63@01)) $k@59@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@59@01 (- $k@61@01 (* $k@65@01 $k@63@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@60@01 (* $k@64@01 $k@63@01)) $k@58@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@58@01 (- $k@60@01 (* $k@64@01 $k@63@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@61@01 (* $k@65@01 $k@63@01))) (< $Perm.No $k@59@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@57@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@57@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@59@01) (< $Perm.No (- $k@61@01 (* $k@65@01 $k@63@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@57@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@57@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@60@01 (* $k@64@01 $k@63@01))) (< $Perm.No $k@58@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@57@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@58@01) (< $Perm.No (- $k@60@01 (* $k@64@01 $k@63@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@57@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@57@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- testNestingFoldThree ----------
(declare-const this@67@01 $Ref)
(declare-const this@68@01 $Ref)
(push) ; 1
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 ($Snap.combine ($Snap.first $t@69@01) ($Snap.second $t@69@01))))
(declare-const $k@70@01 $Perm)
(assert ($Perm.isReadVar $k@70@01))
(assert (<= $Perm.No $k@70@01))
(assert (<= $k@70@01 $Perm.Write))
(assert (=> (< $Perm.No $k@70@01) (not (= this@68@01 $Ref.null))))
(assert (=
  ($Snap.second $t@69@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@69@01))
    ($Snap.second ($Snap.second $t@69@01)))))
(declare-const $k@71@01 $Perm)
(assert ($Perm.isReadVar $k@71@01))
(assert (<= $Perm.No $k@71@01))
(assert (<= $k@71@01 $Perm.Write))
(assert (=> (< $Perm.No $k@71@01) (not (= this@68@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@69@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@72@01 $Perm)
(assert ($Perm.isReadVar $k@72@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@68@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@72@01))
(assert (<= $k@72@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@72@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@69@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@73@01 $Perm)
(assert ($Perm.isReadVar $k@73@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@68@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@73@01))
(assert (<= $k@73@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@73@01)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))
  $Snap.unit))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
  $Snap.unit))
; [eval] this.next.next != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@72@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@72@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@74@01 $Perm)
(assert ($Perm.isReadVar $k@74@01))
(assert (<= $Perm.No $k@74@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(q(this.next), wildcard)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@75@01 $Perm)
(assert ($Perm.isReadVar $k@75@01))
(declare-const $k@76@01 $Perm)
(assert ($Perm.isReadVar $k@76@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@72@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@76@01 $k@75@01) $k@72@01))
(assert (<= $Perm.No (- $k@72@01 (* $k@76@01 $k@75@01))))
(assert (<= (- $k@72@01 (* $k@76@01 $k@75@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@72@01 (* $k@76@01 $k@75@01)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@76@01 $k@75@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@77@01 $Perm)
(assert ($Perm.isReadVar $k@77@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@73@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@77@01 $k@75@01) $k@73@01))
(assert (<= $Perm.No (- $k@73@01 (* $k@77@01 $k@75@01))))
(assert (<= (- $k@73@01 (* $k@77@01 $k@75@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@73@01 (* $k@77@01 $k@75@01)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@77@01 $k@75@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@72@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:(Second:($t@69@01))) != Null | live]
; [else-branch: 14 | First:(Second:(Second:($t@69@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | First:(Second:(Second:($t@69@01))) != Null]
(declare-const $k@78@01 $Perm)
(assert ($Perm.isReadVar $k@78@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@72@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@74@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@78@01 $k@75@01) $k@74@01))
(assert (<= $Perm.No (- $k@74@01 (* $k@78@01 $k@75@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@78@01 $k@75@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (q%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))
(assert (<= $Perm.No $k@75@01))
; [exec]
; fold acc(p(this), wildcard)
(declare-const $k@79@01 $Perm)
(assert ($Perm.isReadVar $k@79@01))
(declare-const $k@80@01 $Perm)
(assert ($Perm.isReadVar $k@80@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@70@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@80@01 $k@79@01) $k@70@01))
(assert (<= $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01))))
(assert (<= (- $k@70@01 (* $k@80@01 $k@79@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01)))
  (not (= this@68@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@80@01 $k@79@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@81@01 $Perm)
(assert ($Perm.isReadVar $k@81@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@71@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@81@01 $k@79@01) $k@71@01))
(assert (<= $Perm.No (- $k@71@01 (* $k@81@01 $k@79@01))))
(assert (<= (- $k@71@01 (* $k@81@01 $k@79@01)) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@71@01 (* $k@81@01 $k@79@01)))
  (not (= this@68@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@81@01 $k@79@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:($t@69@01) != Null | live]
; [else-branch: 15 | First:($t@69@01) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | First:($t@69@01) != Null]
(declare-const $k@82@01 $Perm)
(assert ($Perm.isReadVar $k@82@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@70@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $k@75@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< (* $k@82@01 $k@79@01) $k@75@01))
(assert (<= $Perm.No (- $k@75@01 (* $k@82@01 $k@79@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@82@01 $k@79@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (p%trigger ($Snap.combine
  ($Snap.first $t@69@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@69@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))))) this@68@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
  this@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@79@01))
; [exec]
; assert this != this.next
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not (= this@68@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@68@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) this@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) this@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@74@01 (* $k@78@01 $k@75@01))) (< $Perm.No $k@79@01))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
      ($Snap.combine
        ($Snap.first $t@69@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@69@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@79@01) (< $Perm.No (- $k@74@01 (* $k@78@01 $k@75@01))))
  (not
    (=
      ($Snap.combine
        ($Snap.first $t@69@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@69@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
      this@68@01))
  (not
    (=
      this@68@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@71@01 (* $k@81@01 $k@79@01)) (- $k@73@01 (* $k@77@01 $k@75@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@73@01 (* $k@77@01 $k@75@01)) (- $k@71@01 (* $k@81@01 $k@79@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@70@01 (* $k@80@01 $k@79@01)) (- $k@72@01 (* $k@76@01 $k@75@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@72@01 (* $k@76@01 $k@75@01)) (- $k@70@01 (* $k@80@01 $k@79@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@71@01 (* $k@81@01 $k@79@01)))
    (< $Perm.No (- $k@73@01 (* $k@77@01 $k@75@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@69@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@73@01 (* $k@77@01 $k@75@01)))
    (< $Perm.No (- $k@71@01 (* $k@81@01 $k@79@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@69@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01)))
    (< $Perm.No (- $k@72@01 (* $k@76@01 $k@75@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@72@01 (* $k@76@01 $k@75@01)))
    (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not (= this@68@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@68@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) this@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) this@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@74@01 (* $k@78@01 $k@75@01))) (< $Perm.No $k@79@01))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
      ($Snap.combine
        ($Snap.first $t@69@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@69@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@79@01) (< $Perm.No (- $k@74@01 (* $k@78@01 $k@75@01))))
  (not
    (=
      ($Snap.combine
        ($Snap.first $t@69@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@69@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
      this@68@01))
  (not
    (=
      this@68@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@71@01 (* $k@81@01 $k@79@01)) (- $k@73@01 (* $k@77@01 $k@75@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@73@01 (* $k@77@01 $k@75@01)) (- $k@71@01 (* $k@81@01 $k@79@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@70@01 (* $k@80@01 $k@79@01)) (- $k@72@01 (* $k@76@01 $k@75@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@72@01 (* $k@76@01 $k@75@01)) (- $k@70@01 (* $k@80@01 $k@79@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@71@01 (* $k@81@01 $k@79@01)))
    (< $Perm.No (- $k@73@01 (* $k@77@01 $k@75@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@69@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@73@01 (* $k@77@01 $k@75@01)))
    (< $Perm.No (- $k@71@01 (* $k@81@01 $k@79@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@69@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01)))
    (< $Perm.No (- $k@72@01 (* $k@76@01 $k@75@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@72@01 (* $k@76@01 $k@75@01)))
    (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not (= this@68@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@68@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) this@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) this@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@74@01 (* $k@78@01 $k@75@01))) (< $Perm.No $k@79@01))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
      ($Snap.combine
        ($Snap.first $t@69@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@69@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@79@01) (< $Perm.No (- $k@74@01 (* $k@78@01 $k@75@01))))
  (not
    (=
      ($Snap.combine
        ($Snap.first $t@69@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@69@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
      this@68@01))
  (not
    (=
      this@68@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@71@01 (* $k@81@01 $k@79@01)) (- $k@73@01 (* $k@77@01 $k@75@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@73@01 (* $k@77@01 $k@75@01)) (- $k@71@01 (* $k@81@01 $k@79@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@70@01 (* $k@80@01 $k@79@01)) (- $k@72@01 (* $k@76@01 $k@75@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+ (- $k@72@01 (* $k@76@01 $k@75@01)) (- $k@70@01 (* $k@80@01 $k@79@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@71@01 (* $k@81@01 $k@79@01)))
    (< $Perm.No (- $k@73@01 (* $k@77@01 $k@75@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@69@01)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@73@01 (* $k@77@01 $k@75@01)))
    (< $Perm.No (- $k@71@01 (* $k@81@01 $k@79@01))))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@69@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01)))
    (< $Perm.No (- $k@72@01 (* $k@76@01 $k@75@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $k@72@01 (* $k@76@01 $k@75@01)))
    (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@70@01 (* $k@80@01 $k@79@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not (= this@68@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- testNestingUnfoldingTwo ----------
(declare-const this@83@01 $Ref)
(declare-const this@84@01 $Ref)
(push) ; 1
(declare-const $k@85@01 $Perm)
(assert ($Perm.isReadVar $k@85@01))
(declare-const $t@86@01 $Snap)
(assert (<= $Perm.No $k@85@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert this != (unfolding acc(p(this), wildcard) in this.next)
; [eval] this != (unfolding acc(p(this), wildcard) in this.next)
; [eval] (unfolding acc(p(this), wildcard) in this.next)
(declare-const $k@87@01 $Perm)
(assert ($Perm.isReadVar $k@87@01))
(push) ; 3
(assert (not (< $Perm.No $k@87@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(declare-const $k@88@01 $Perm)
(assert ($Perm.isReadVar $k@88@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@85@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@88@01 $k@85@01))
(assert (<= $Perm.No (- $k@85@01 $k@88@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@88@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (p%trigger $t@86@01 this@84@01))
(assert (= $t@86@01 ($Snap.combine ($Snap.first $t@86@01) ($Snap.second $t@86@01))))
(declare-const $k@89@01 $Perm)
(assert ($Perm.isReadVar $k@89@01))
(assert (<= $Perm.No (* $k@89@01 $k@87@01)))
(assert (<= (* $k@89@01 $k@87@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@89@01 $k@87@01)) (not (= this@84@01 $Ref.null))))
(assert (=
  ($Snap.second $t@86@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@86@01))
    ($Snap.second ($Snap.second $t@86@01)))))
(declare-const $k@90@01 $Perm)
(assert ($Perm.isReadVar $k@90@01))
(assert (<= $Perm.No (* $k@90@01 $k@87@01)))
(assert (<= (* $k@90@01 $k@87@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@90@01 $k@87@01)) (not (= this@84@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@89@01 $k@87@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:($t@86@01) != Null | live]
; [else-branch: 16 | First:($t@86@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | First:($t@86@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@89@01 $k@87@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@91@01 $Perm)
(assert ($Perm.isReadVar $k@91@01))
(assert (<= $Perm.No (* $k@91@01 $k@87@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@89@01 $k@87@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 16 | First:($t@86@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@86@01)) $Snap.unit))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@89@01 $k@87@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@92@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
  (=
    (as joined_unfolding@92@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)
  (=
    (as joined_unfolding@92@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@88@01))
(assert ($Perm.isReadVar $k@89@01))
(assert ($Perm.isReadVar $k@90@01))
(assert ($Perm.isReadVar $k@91@01))
(assert (and
  (< $k@88@01 $k@85@01)
  (<= $Perm.No (- $k@85@01 $k@88@01))
  (p%trigger $t@86@01 this@84@01)
  (= $t@86@01 ($Snap.combine ($Snap.first $t@86@01) ($Snap.second $t@86@01)))
  (<= $Perm.No (* $k@89@01 $k@87@01))
  (<= (* $k@89@01 $k@87@01) $Perm.Write)
  (=> (< $Perm.No (* $k@89@01 $k@87@01)) (not (= this@84@01 $Ref.null)))
  (=
    ($Snap.second $t@86@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@86@01))
      ($Snap.second ($Snap.second $t@86@01))))
  (<= $Perm.No (* $k@90@01 $k@87@01))
  (<= (* $k@90@01 $k@87@01) $Perm.Write)
  (=> (< $Perm.No (* $k@90@01 $k@87@01)) (not (= this@84@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
    (<= $Perm.No (* $k@91@01 $k@87@01)))))
; Joined path conditions
(assert (and
  (< $k@88@01 $k@85@01)
  (<= $Perm.No (- $k@85@01 $k@88@01))
  (p%trigger $t@86@01 this@84@01)
  (= $t@86@01 ($Snap.combine ($Snap.first $t@86@01) ($Snap.second $t@86@01)))
  (<= $Perm.No (* $k@89@01 $k@87@01))
  (<= (* $k@89@01 $k@87@01) $Perm.Write)
  (=> (< $Perm.No (* $k@89@01 $k@87@01)) (not (= this@84@01 $Ref.null)))
  (=
    ($Snap.second $t@86@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@86@01))
      ($Snap.second ($Snap.second $t@86@01))))
  (<= $Perm.No (* $k@90@01 $k@87@01))
  (<= (* $k@90@01 $k@87@01) $Perm.Write)
  (=> (< $Perm.No (* $k@90@01 $k@87@01)) (not (= this@84@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)
    (= ($Snap.second ($Snap.second $t@86@01)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@84@01 (as joined_unfolding@92@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != (unfolding acc(p(this), wildcard) in this.next)
; [eval] (unfolding acc(p(this), wildcard) in this.next)
(declare-const $k@93@01 $Perm)
(assert ($Perm.isReadVar $k@93@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No $k@93@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(declare-const $k@94@01 $Perm)
(assert ($Perm.isReadVar $k@94@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@85@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@94@01 $k@85@01))
(assert (<= $Perm.No (- $k@85@01 $k@94@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@94@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@95@01 $Perm)
(assert ($Perm.isReadVar $k@95@01))
(assert (<= $Perm.No (* $k@95@01 $k@93@01)))
(assert (<= (* $k@95@01 $k@93@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@95@01 $k@93@01)) (not (= this@84@01 $Ref.null))))
(declare-const $k@96@01 $Perm)
(assert ($Perm.isReadVar $k@96@01))
(assert (<= $Perm.No (* $k@96@01 $k@93@01)))
(assert (<= (* $k@96@01 $k@93@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@96@01 $k@93@01)) (not (= this@84@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@95@01 $k@93@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | First:($t@86@01) != Null | live]
; [else-branch: 17 | First:($t@86@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | First:($t@86@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@95@01 $k@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@97@01 $Perm)
(assert ($Perm.isReadVar $k@97@01))
(assert (<= $Perm.No (* $k@97@01 $k@93@01)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@95@01 $k@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 17 | First:($t@86@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@86@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@95@01 $k@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@98@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
  (=
    (as joined_unfolding@98@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)
  (=
    (as joined_unfolding@98@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@94@01))
(assert ($Perm.isReadVar $k@95@01))
(assert ($Perm.isReadVar $k@96@01))
(assert ($Perm.isReadVar $k@97@01))
(assert (and
  (< $k@94@01 $k@85@01)
  (<= $Perm.No (- $k@85@01 $k@94@01))
  (<= $Perm.No (* $k@95@01 $k@93@01))
  (<= (* $k@95@01 $k@93@01) $Perm.Write)
  (=> (< $Perm.No (* $k@95@01 $k@93@01)) (not (= this@84@01 $Ref.null)))
  (<= $Perm.No (* $k@96@01 $k@93@01))
  (<= (* $k@96@01 $k@93@01) $Perm.Write)
  (=> (< $Perm.No (* $k@96@01 $k@93@01)) (not (= this@84@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
    (<= $Perm.No (* $k@97@01 $k@93@01)))))
; Joined path conditions
(assert (and
  (< $k@94@01 $k@85@01)
  (<= $Perm.No (- $k@85@01 $k@94@01))
  (<= $Perm.No (* $k@95@01 $k@93@01))
  (<= (* $k@95@01 $k@93@01) $Perm.Write)
  (=> (< $Perm.No (* $k@95@01 $k@93@01)) (not (= this@84@01 $Ref.null)))
  (<= $Perm.No (* $k@96@01 $k@93@01))
  (<= (* $k@96@01 $k@93@01) $Perm.Write)
  (=> (< $Perm.No (* $k@96@01 $k@93@01)) (not (= this@84@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@84@01 (as joined_unfolding@98@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != (unfolding acc(p(this), wildcard) in this.next)
; [eval] (unfolding acc(p(this), wildcard) in this.next)
(declare-const $k@99@01 $Perm)
(assert ($Perm.isReadVar $k@99@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No $k@99@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(declare-const $k@100@01 $Perm)
(assert ($Perm.isReadVar $k@100@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@85@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@100@01 $k@85@01))
(assert (<= $Perm.No (- $k@85@01 $k@100@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@100@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@101@01 $Perm)
(assert ($Perm.isReadVar $k@101@01))
(assert (<= $Perm.No (* $k@101@01 $k@99@01)))
(assert (<= (* $k@101@01 $k@99@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@101@01 $k@99@01)) (not (= this@84@01 $Ref.null))))
(declare-const $k@102@01 $Perm)
(assert ($Perm.isReadVar $k@102@01))
(assert (<= $Perm.No (* $k@102@01 $k@99@01)))
(assert (<= (* $k@102@01 $k@99@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@102@01 $k@99@01)) (not (= this@84@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@101@01 $k@99@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | First:($t@86@01) != Null | live]
; [else-branch: 18 | First:($t@86@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | First:($t@86@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@101@01 $k@99@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@103@01 $Perm)
(assert ($Perm.isReadVar $k@103@01))
(assert (<= $Perm.No (* $k@103@01 $k@99@01)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@101@01 $k@99@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 18 | First:($t@86@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@86@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@101@01 $k@99@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@104@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
  (=
    (as joined_unfolding@104@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)
  (=
    (as joined_unfolding@104@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@100@01))
(assert ($Perm.isReadVar $k@101@01))
(assert ($Perm.isReadVar $k@102@01))
(assert ($Perm.isReadVar $k@103@01))
(assert (and
  (< $k@100@01 $k@85@01)
  (<= $Perm.No (- $k@85@01 $k@100@01))
  (<= $Perm.No (* $k@101@01 $k@99@01))
  (<= (* $k@101@01 $k@99@01) $Perm.Write)
  (=> (< $Perm.No (* $k@101@01 $k@99@01)) (not (= this@84@01 $Ref.null)))
  (<= $Perm.No (* $k@102@01 $k@99@01))
  (<= (* $k@102@01 $k@99@01) $Perm.Write)
  (=> (< $Perm.No (* $k@102@01 $k@99@01)) (not (= this@84@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
    (<= $Perm.No (* $k@103@01 $k@99@01)))))
; Joined path conditions
(assert (and
  (< $k@100@01 $k@85@01)
  (<= $Perm.No (- $k@85@01 $k@100@01))
  (<= $Perm.No (* $k@101@01 $k@99@01))
  (<= (* $k@101@01 $k@99@01) $Perm.Write)
  (=> (< $Perm.No (* $k@101@01 $k@99@01)) (not (= this@84@01 $Ref.null)))
  (<= $Perm.No (* $k@102@01 $k@99@01))
  (<= (* $k@102@01 $k@99@01) $Perm.Write)
  (=> (< $Perm.No (* $k@102@01 $k@99@01)) (not (= this@84@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@84@01 (as joined_unfolding@104@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != (unfolding acc(p(this), wildcard) in this.next)
; [eval] (unfolding acc(p(this), wildcard) in this.next)
(declare-const $k@105@01 $Perm)
(assert ($Perm.isReadVar $k@105@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No $k@105@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(declare-const $k@106@01 $Perm)
(assert ($Perm.isReadVar $k@106@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@85@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@106@01 $k@85@01))
(assert (<= $Perm.No (- $k@85@01 $k@106@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@106@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@107@01 $Perm)
(assert ($Perm.isReadVar $k@107@01))
(assert (<= $Perm.No (* $k@107@01 $k@105@01)))
(assert (<= (* $k@107@01 $k@105@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@107@01 $k@105@01)) (not (= this@84@01 $Ref.null))))
(declare-const $k@108@01 $Perm)
(assert ($Perm.isReadVar $k@108@01))
(assert (<= $Perm.No (* $k@108@01 $k@105@01)))
(assert (<= (* $k@108@01 $k@105@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@108@01 $k@105@01)) (not (= this@84@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@107@01 $k@105@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:($t@86@01) != Null | live]
; [else-branch: 19 | First:($t@86@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | First:($t@86@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@107@01 $k@105@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@109@01 $Perm)
(assert ($Perm.isReadVar $k@109@01))
(assert (<= $Perm.No (* $k@109@01 $k@105@01)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@107@01 $k@105@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 19 | First:($t@86@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@86@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@107@01 $k@105@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@110@01 $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
  (=
    (as joined_unfolding@110@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null)
  (=
    (as joined_unfolding@110@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)))))
; Joined path conditions
(assert ($Perm.isReadVar $k@106@01))
(assert ($Perm.isReadVar $k@107@01))
(assert ($Perm.isReadVar $k@108@01))
(assert ($Perm.isReadVar $k@109@01))
(assert (and
  (< $k@106@01 $k@85@01)
  (<= $Perm.No (- $k@85@01 $k@106@01))
  (<= $Perm.No (* $k@107@01 $k@105@01))
  (<= (* $k@107@01 $k@105@01) $Perm.Write)
  (=> (< $Perm.No (* $k@107@01 $k@105@01)) (not (= this@84@01 $Ref.null)))
  (<= $Perm.No (* $k@108@01 $k@105@01))
  (<= (* $k@108@01 $k@105@01) $Perm.Write)
  (=> (< $Perm.No (* $k@108@01 $k@105@01)) (not (= this@84@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@86@01)) $Ref.null))
    (<= $Perm.No (* $k@109@01 $k@105@01)))))
; Joined path conditions
(assert (and
  (< $k@106@01 $k@85@01)
  (<= $Perm.No (- $k@85@01 $k@106@01))
  (<= $Perm.No (* $k@107@01 $k@105@01))
  (<= (* $k@107@01 $k@105@01) $Perm.Write)
  (=> (< $Perm.No (* $k@107@01 $k@105@01)) (not (= this@84@01 $Ref.null)))
  (<= $Perm.No (* $k@108@01 $k@105@01))
  (<= (* $k@108@01 $k@105@01) $Perm.Write)
  (=> (< $Perm.No (* $k@108@01 $k@105@01)) (not (= this@84@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@84@01 (as joined_unfolding@110@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- testNestingUnfoldingPrecondition ----------
(declare-const this@111@01 $Ref)
(declare-const x@112@01 $Ref)
(declare-const this@113@01 $Ref)
(declare-const x@114@01 $Ref)
(push) ; 1
(declare-const $t@115@01 $Snap)
(assert (= $t@115@01 ($Snap.combine ($Snap.first $t@115@01) ($Snap.second $t@115@01))))
(declare-const $k@116@01 $Perm)
(assert ($Perm.isReadVar $k@116@01))
(assert (<= $Perm.No $k@116@01))
(assert (= ($Snap.second $t@115@01) $Snap.unit))
; [eval] (unfolding acc(valid(this), wildcard) in this.next == x)
(declare-const $k@117@01 $Perm)
(assert ($Perm.isReadVar $k@117@01))
(push) ; 2
(assert (not (< $Perm.No $k@117@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@118@01 $Perm)
(assert ($Perm.isReadVar $k@118@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@116@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@118@01 $k@116@01))
(assert (<= $Perm.No (- $k@116@01 $k@118@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@118@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (valid%trigger ($Snap.first $t@115@01) this@113@01))
(assert (=
  ($Snap.first $t@115@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@115@01))
    ($Snap.second ($Snap.first $t@115@01)))))
(declare-const $k@119@01 $Perm)
(assert ($Perm.isReadVar $k@119@01))
(assert (<= $Perm.No (* $k@119@01 $k@117@01)))
(assert (<= (* $k@119@01 $k@117@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@119@01 $k@117@01)) (not (= this@113@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first $t@115@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@115@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@115@01))))))
(declare-const $k@120@01 $Perm)
(assert ($Perm.isReadVar $k@120@01))
(assert (<= $Perm.No (* $k@120@01 $k@117@01)))
(assert (<= (* $k@120@01 $k@117@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@120@01 $k@117@01)) (not (= this@113@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@119@01 $k@117@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(First:($t@115@01)) != Null | live]
; [else-branch: 20 | First:(First:($t@115@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 20 | First:(First:($t@115@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01))) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@119@01 $k@117@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@121@01 $Perm)
(assert ($Perm.isReadVar $k@121@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@113@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@121@01 $k@117@01)))
; [eval] this.next == x
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@119@01 $k@117@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 20 | First:(First:($t@115@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@115@01))) $Snap.unit))
; [eval] this.next == x
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@119@01 $k@117@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(declare-const joined_unfolding@122@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01)))
      $Ref.null))
  (=
    (as joined_unfolding@122@01  Bool)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01)))
      x@114@01))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01))) $Ref.null)
  (=
    (as joined_unfolding@122@01  Bool)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01)))
      x@114@01))))
; Joined path conditions
(assert ($Perm.isReadVar $k@118@01))
(assert ($Perm.isReadVar $k@119@01))
(assert ($Perm.isReadVar $k@120@01))
(assert ($Perm.isReadVar $k@121@01))
(assert (and
  (< $k@118@01 $k@116@01)
  (<= $Perm.No (- $k@116@01 $k@118@01))
  (valid%trigger ($Snap.first $t@115@01) this@113@01)
  (=
    ($Snap.first $t@115@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@115@01))
      ($Snap.second ($Snap.first $t@115@01))))
  (<= $Perm.No (* $k@119@01 $k@117@01))
  (<= (* $k@119@01 $k@117@01) $Perm.Write)
  (=> (< $Perm.No (* $k@119@01 $k@117@01)) (not (= this@113@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first $t@115@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@115@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@115@01)))))
  (<= $Perm.No (* $k@120@01 $k@117@01))
  (<= (* $k@120@01 $k@117@01) $Perm.Write)
  (=> (< $Perm.No (* $k@120@01 $k@117@01)) (not (= this@113@01 $Ref.null)))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01)))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01)))
        $Ref.null))
    (<= $Perm.No (* $k@121@01 $k@117@01)))))
; Joined path conditions
(assert (and
  (< $k@118@01 $k@116@01)
  (<= $Perm.No (- $k@116@01 $k@118@01))
  (valid%trigger ($Snap.first $t@115@01) this@113@01)
  (=
    ($Snap.first $t@115@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@115@01))
      ($Snap.second ($Snap.first $t@115@01))))
  (<= $Perm.No (* $k@119@01 $k@117@01))
  (<= (* $k@119@01 $k@117@01) $Perm.Write)
  (=> (< $Perm.No (* $k@119@01 $k@117@01)) (not (= this@113@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first $t@115@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@115@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@115@01)))))
  (<= $Perm.No (* $k@120@01 $k@117@01))
  (<= (* $k@120@01 $k@117@01) $Perm.Write)
  (=> (< $Perm.No (* $k@120@01 $k@117@01)) (not (= this@113@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@115@01))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@115@01)))
      $Ref.null))))
(assert (as joined_unfolding@122@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert this != x
; [eval] this != x
(push) ; 3
(assert (not (not (= this@113@01 x@114@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != x
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@113@01 x@114@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != x
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@113@01 x@114@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] this != x
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@113@01 x@114@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- testNestingUnfoldingPostcondition ----------
(declare-const this@123@01 $Ref)
(declare-const x@124@01 $Ref)
(declare-const this@125@01 $Ref)
(declare-const x@126@01 $Ref)
(push) ; 1
(declare-const $k@127@01 $Perm)
(assert ($Perm.isReadVar $k@127@01))
(declare-const $t@128@01 $Snap)
(assert (<= $Perm.No $k@127@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 ($Snap.combine ($Snap.first $t@129@01) ($Snap.second $t@129@01))))
(declare-const $k@130@01 $Perm)
(assert ($Perm.isReadVar $k@130@01))
(assert (<= $Perm.No $k@130@01))
(assert (= ($Snap.second $t@129@01) $Snap.unit))
; [eval] (unfolding acc(valid(this), wildcard) in true)
(declare-const $k@131@01 $Perm)
(assert ($Perm.isReadVar $k@131@01))
(push) ; 3
(assert (not (< $Perm.No $k@131@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(declare-const $k@132@01 $Perm)
(assert ($Perm.isReadVar $k@132@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@130@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@132@01 $k@130@01))
(assert (<= $Perm.No (- $k@130@01 $k@132@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@132@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid%trigger ($Snap.first $t@129@01) this@125@01))
(assert (=
  ($Snap.first $t@129@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@129@01))
    ($Snap.second ($Snap.first $t@129@01)))))
(declare-const $k@133@01 $Perm)
(assert ($Perm.isReadVar $k@133@01))
(assert (<= $Perm.No (* $k@133@01 $k@131@01)))
(assert (<= (* $k@133@01 $k@131@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@133@01 $k@131@01)) (not (= this@125@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first $t@129@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@129@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@129@01))))))
(declare-const $k@134@01 $Perm)
(assert ($Perm.isReadVar $k@134@01))
(assert (<= $Perm.No (* $k@134@01 $k@131@01)))
(assert (<= (* $k@134@01 $k@131@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@134@01 $k@131@01)) (not (= this@125@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@133@01 $k@131@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | First:(First:($t@129@01)) != Null | live]
; [else-branch: 21 | First:(First:($t@129@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | First:(First:($t@129@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01))) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@133@01 $k@131@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@135@01 $Perm)
(assert ($Perm.isReadVar $k@135@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@125@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@135@01 $k@131@01)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 21 | First:(First:($t@129@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@129@01))) $Snap.unit))
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@136@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01)))
      $Ref.null))
  (= (as joined_unfolding@136@01  Bool) true)))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01))) $Ref.null)
  (= (as joined_unfolding@136@01  Bool) true)))
; Joined path conditions
(assert ($Perm.isReadVar $k@132@01))
(assert ($Perm.isReadVar $k@133@01))
(assert ($Perm.isReadVar $k@134@01))
(assert ($Perm.isReadVar $k@135@01))
(assert (and
  (< $k@132@01 $k@130@01)
  (<= $Perm.No (- $k@130@01 $k@132@01))
  (valid%trigger ($Snap.first $t@129@01) this@125@01)
  (=
    ($Snap.first $t@129@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@129@01))
      ($Snap.second ($Snap.first $t@129@01))))
  (<= $Perm.No (* $k@133@01 $k@131@01))
  (<= (* $k@133@01 $k@131@01) $Perm.Write)
  (=> (< $Perm.No (* $k@133@01 $k@131@01)) (not (= this@125@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first $t@129@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@129@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@129@01)))))
  (<= $Perm.No (* $k@134@01 $k@131@01))
  (<= (* $k@134@01 $k@131@01) $Perm.Write)
  (=> (< $Perm.No (* $k@134@01 $k@131@01)) (not (= this@125@01 $Ref.null)))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01)))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01)))
        $Ref.null))
    (<= $Perm.No (* $k@135@01 $k@131@01)))))
; Joined path conditions
(assert (and
  (< $k@132@01 $k@130@01)
  (<= $Perm.No (- $k@130@01 $k@132@01))
  (valid%trigger ($Snap.first $t@129@01) this@125@01)
  (=
    ($Snap.first $t@129@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@129@01))
      ($Snap.second ($Snap.first $t@129@01))))
  (<= $Perm.No (* $k@133@01 $k@131@01))
  (<= (* $k@133@01 $k@131@01) $Perm.Write)
  (=> (< $Perm.No (* $k@133@01 $k@131@01)) (not (= this@125@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first $t@129@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@129@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@129@01)))))
  (<= $Perm.No (* $k@134@01 $k@131@01))
  (<= (* $k@134@01 $k@131@01) $Perm.Write)
  (=> (< $Perm.No (* $k@134@01 $k@131@01)) (not (= this@125@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@129@01))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@129@01)))
      $Ref.null))))
(assert (as joined_unfolding@136@01  Bool))
(pop) ; 2
(push) ; 2
(declare-const $k@137@01 $Perm)
(assert ($Perm.isReadVar $k@137@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@127@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@137@01 $k@127@01))
(assert (<= $Perm.No (- $k@127@01 $k@137@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@137@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] (unfolding acc(valid(this), wildcard) in true)
(declare-const $k@138@01 $Perm)
(assert ($Perm.isReadVar $k@138@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No $k@138@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(declare-const $k@139@01 $Perm)
(assert ($Perm.isReadVar $k@139@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@127@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@139@01 $k@127@01))
(assert (<= $Perm.No (- $k@127@01 $k@139@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@139@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (valid%trigger $t@128@01 this@125@01))
(assert (= $t@128@01 ($Snap.combine ($Snap.first $t@128@01) ($Snap.second $t@128@01))))
(declare-const $k@140@01 $Perm)
(assert ($Perm.isReadVar $k@140@01))
(assert (<= $Perm.No (* $k@140@01 $k@138@01)))
(assert (<= (* $k@140@01 $k@138@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@140@01 $k@138@01)) (not (= this@125@01 $Ref.null))))
(assert (=
  ($Snap.second $t@128@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@128@01))
    ($Snap.second ($Snap.second $t@128@01)))))
(declare-const $k@141@01 $Perm)
(assert ($Perm.isReadVar $k@141@01))
(assert (<= $Perm.No (* $k@141@01 $k@138@01)))
(assert (<= (* $k@141@01 $k@138@01) $Perm.Write))
(assert (=> (< $Perm.No (* $k@141@01 $k@138@01)) (not (= this@125@01 $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@140@01 $k@138@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:($t@128@01) != Null | live]
; [else-branch: 22 | First:($t@128@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | First:($t@128@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@140@01 $k@138@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@142@01 $Perm)
(assert ($Perm.isReadVar $k@142@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@125@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@142@01 $k@138@01)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 22 | First:($t@128@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@128@01)) $Snap.unit))
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@143@01 Bool)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null))
  (= (as joined_unfolding@143@01  Bool) true)))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null)
  (= (as joined_unfolding@143@01  Bool) true)))
; Joined path conditions
(assert ($Perm.isReadVar $k@139@01))
(assert ($Perm.isReadVar $k@140@01))
(assert ($Perm.isReadVar $k@141@01))
(assert ($Perm.isReadVar $k@142@01))
(assert (and
  (< $k@139@01 $k@127@01)
  (<= $Perm.No (- $k@127@01 $k@139@01))
  (valid%trigger $t@128@01 this@125@01)
  (= $t@128@01 ($Snap.combine ($Snap.first $t@128@01) ($Snap.second $t@128@01)))
  (<= $Perm.No (* $k@140@01 $k@138@01))
  (<= (* $k@140@01 $k@138@01) $Perm.Write)
  (=> (< $Perm.No (* $k@140@01 $k@138@01)) (not (= this@125@01 $Ref.null)))
  (=
    ($Snap.second $t@128@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@128@01))
      ($Snap.second ($Snap.second $t@128@01))))
  (<= $Perm.No (* $k@141@01 $k@138@01))
  (<= (* $k@141@01 $k@138@01) $Perm.Write)
  (=> (< $Perm.No (* $k@141@01 $k@138@01)) (not (= this@125@01 $Ref.null)))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null))
    (<= $Perm.No (* $k@142@01 $k@138@01)))))
; Joined path conditions
(assert (and
  (< $k@139@01 $k@127@01)
  (<= $Perm.No (- $k@127@01 $k@139@01))
  (valid%trigger $t@128@01 this@125@01)
  (= $t@128@01 ($Snap.combine ($Snap.first $t@128@01) ($Snap.second $t@128@01)))
  (<= $Perm.No (* $k@140@01 $k@138@01))
  (<= (* $k@140@01 $k@138@01) $Perm.Write)
  (=> (< $Perm.No (* $k@140@01 $k@138@01)) (not (= this@125@01 $Ref.null)))
  (=
    ($Snap.second $t@128@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@128@01))
      ($Snap.second ($Snap.second $t@128@01))))
  (<= $Perm.No (* $k@141@01 $k@138@01))
  (<= (* $k@141@01 $k@138@01) $Perm.Write)
  (=> (< $Perm.No (* $k@141@01 $k@138@01)) (not (= this@125@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null)
    (= ($Snap.second ($Snap.second $t@128@01)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@128@01)) $Ref.null))))
(push) ; 3
(assert (not (as joined_unfolding@143@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@143@01  Bool))
(pop) ; 2
(pop) ; 1
