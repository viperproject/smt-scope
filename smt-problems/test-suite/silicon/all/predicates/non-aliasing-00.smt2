(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:13
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/predicates/non-aliasing.vpr
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
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid%trigger ($Snap $Ref) Bool)
(declare-fun valid2%trigger ($Snap $Ref) Bool)
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
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@6@01 $k@4@01)))
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
  (and (< $Perm.No (- $k@2@01 $k@4@01)) (< $Perm.No (* $k@6@01 $k@4@01)))
  (not (= $t@3@01 ($Snap.second $t@3@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@6@01 $k@4@01)) (< $Perm.No (- $k@2@01 $k@4@01)))
  (not (= ($Snap.second $t@3@01) $t@3@01)))))
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
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (* $k@6@01 $k@4@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< $k@7@01 (* $k@6@01 $k@4@01)))
(assert (<= $Perm.No (- (* $k@6@01 $k@4@01) $k@7@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@3@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@01))
    ($Snap.second ($Snap.second $t@3@01)))))
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@8@01 $k@7@01)))
(assert (<= (* $k@8@01 $k@7@01) $Perm.Write))
(assert (=>
  (< $Perm.No (* $k@8@01 $k@7@01))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01)) $Ref.null))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@8@01 $k@7@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:($t@3@01)) != Null | live]
; [else-branch: 2 | First:(Second:($t@3@01)) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(Second:($t@3@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))) $Ref.null)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@8@01 $k@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))))))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* $k@9@01 $k@7@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
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
(assert (not (< $Perm.No (* $k@8@01 $k@7@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01)))))))
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))) this@1@01)))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01)))
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
    (< $Perm.No (- (* $k@6@01 $k@4@01) $k@7@01))
    (< $Perm.No (- $k@2@01 $k@4@01)))
  (not (= ($Snap.second $t@3@01) $t@3@01)))))
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
    (< $Perm.No (- (* $k@6@01 $k@4@01) $k@7@01))
    (< $Perm.No (* $k@9@01 $k@7@01)))
  (not (= ($Snap.second $t@3@01) ($Snap.second ($Snap.second $t@3@01)))))))
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
    (< $Perm.No (- (* $k@6@01 $k@4@01) $k@7@01)))
  (not (= $t@3@01 ($Snap.second $t@3@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@2@01 $k@4@01)) (< $Perm.No (* $k@9@01 $k@7@01)))
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
  (and
    (< $Perm.No (* $k@9@01 $k@7@01))
    (< $Perm.No (- (* $k@6@01 $k@4@01) $k@7@01)))
  (not (= ($Snap.second ($Snap.second $t@3@01)) ($Snap.second $t@3@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@9@01 $k@7@01)) (< $Perm.No (- $k@2@01 $k@4@01)))
  (not (= ($Snap.second ($Snap.second $t@3@01)) $t@3@01)))))
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
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))))))
  (and
    (not (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
    (not
      (=
        this@1@01
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01)))
        ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01)))
        this@1@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (* $k@5@01 $k@4@01) (* $k@8@01 $k@7@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (* $k@8@01 $k@7@01) (* $k@5@01 $k@4@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@5@01 $k@4@01)) (< $Perm.No (* $k@8@01 $k@7@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (* $k@8@01 $k@7@01)) (< $Perm.No (* $k@5@01 $k@4@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01)))
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
(assert (not (< $Perm.No (* $k@8@01 $k@7@01))))
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
(assert (not (< $Perm.No (* $k@8@01 $k@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | First:(Second:($t@3@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@3@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))))
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
(assert (not (< $Perm.No (* $k@8@01 $k@7@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@3@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))))))
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
(assert (not (< $Perm.No (* $k@8@01 $k@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (not
  (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@01))))))
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
(assert (= ($Snap.second $t@3@01) $Snap.unit))
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
; ---------- testNestingUnfold2 ----------
(declare-const this@10@01 $Ref)
(declare-const this@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid2(this), write)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (not (= this@11@01 $Ref.null)))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:($t@12@01) != Null | live]
; [else-branch: 6 | First:($t@12@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:($t@12@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid2%trigger $t@12@01 this@11@01))
; [exec]
; assert this != this.next
; [eval] this != this.next
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= this@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01))))))
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
(assert (not (not (= this@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01))))))
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
(assert (not (not (= this@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01))))))
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
(assert (not (not (= this@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@12@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
