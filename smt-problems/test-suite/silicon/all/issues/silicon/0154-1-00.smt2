(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:43
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0154-1.vpr
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
(declare-fun NodegetNext$ ($Snap $Ref) $Ref)
(declare-fun NodegetNext$%limited ($Snap $Ref) $Ref)
(declare-fun NodegetNext$%stateless ($Ref) Bool)
(declare-fun NodegetNext$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Nodevalid$%trigger ($Snap $Ref) Bool)
(declare-fun Nodep$%trigger ($Snap $Ref) Bool)
(declare-fun Nodeq$%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@7@00 ($Snap $Ref) $Ref)
(declare-fun $k@3@00 () $Perm)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (NodegetNext$%limited s@$ this@0@00) (NodegetNext$ s@$ this@0@00))
  :pattern ((NodegetNext$ s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (NodegetNext$%stateless this@0@00)
  :pattern ((NodegetNext$%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@2@00)
    ($Perm.isReadVar $k@3@00)
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    (=>
      (NodegetNext$%precondition s@$ this@0@00)
      (=
        (NodegetNext$ s@$ this@0@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((NodegetNext$ s@$ this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((NodegetNext$ s@$ this@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- NodetestNestingUnfold$ ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(Nodevalid$(this), write)
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(declare-const $k@3@01 $Perm)
(assert ($Perm.isReadVar $k@3@01))
(assert (<= $Perm.No $k@3@01))
(assert (<= $k@3@01 $Perm.Write))
(assert (=> (< $Perm.No $k@3@01) (not (= this@1@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))
(declare-const $k@4@01 $Perm)
(assert ($Perm.isReadVar $k@4@01))
(assert (<= $Perm.No $k@4@01))
(assert (<= $k@4@01 $Perm.Write))
(assert (=> (< $Perm.No $k@4@01) (not (= this@1@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 0 | First:(Second:($t@2@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:($t@2@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodevalid$%trigger ($Snap.second $t@2@01) this@1@01))
; [exec]
; assert this != this.Nodenext$
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))))
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
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))))
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
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))))
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
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (= this@1@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- NodetestNestingFold$ ----------
(declare-const this@5@01 $Ref)
(declare-const this@6@01 $Ref)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@6@01 $Ref.null)))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (<= $Perm.No $k@8@01))
(assert (<= $k@8@01 $Perm.Write))
(assert (=> (< $Perm.No $k@8@01) (not (= this@6@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (<= $Perm.No $k@9@01))
(assert (<= $k@9@01 $Perm.Write))
(assert (=> (< $Perm.No $k@9@01) (not (= this@6@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@7@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@10@01))
(assert (<= $k@10@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@10@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@11@01))
(assert (<= $k@11@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@11@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
  $Snap.unit))
; [eval] this.Nodenext$ != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))
  $Snap.unit))
; [eval] this.Nodenext$.Nodenext$ != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(Nodevalid$(this.Nodenext$), write)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@10@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@12@01 $k@10@01))
(assert (<= $Perm.No (- $k@10@01 $k@12@01)))
(assert (<= (- $k@10@01 $k@12@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@10@01 $k@12@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@11@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@13@01 $k@11@01))
(assert (<= $Perm.No (- $k@11@01 $k@13@01)))
(assert (<= (- $k@11@01 $k@13@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@11@01 $k@13@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] this.Nodenext$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(Second:(Second:($t@7@01)))) != Null | live]
; [else-branch: 1 | First:(Second:(Second:(Second:($t@7@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | First:(Second:(Second:(Second:($t@7@01)))) != Null]
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Nodevalid$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))))
; [exec]
; assert this.Nodenext$ != this.Nodenext$.Nodenext$
; [eval] this.Nodenext$ != this.Nodenext$.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@10@01 $k@12@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))))
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
(assert (not (= this@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@11@01 $k@13@01) $k@9@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@9@01 (- $k@11@01 $k@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@10@01 $k@12@01) $k@8@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@8@01 (- $k@10@01 $k@12@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@11@01 $k@13@01)) (< $Perm.No $k@9@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@7@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@9@01) (< $Perm.No (- $k@11@01 $k@13@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@7@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@10@01 $k@12@01)) (< $Perm.No $k@8@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@8@01) (< $Perm.No (- $k@10@01 $k@12@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.Nodenext$ != this.Nodenext$.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@10@01 $k@12@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))))
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
(assert (not (= this@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@11@01 $k@13@01) $k@9@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@9@01 (- $k@11@01 $k@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@10@01 $k@12@01) $k@8@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@8@01 (- $k@10@01 $k@12@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@11@01 $k@13@01)) (< $Perm.No $k@9@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@7@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@9@01) (< $Perm.No (- $k@11@01 $k@13@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@7@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@10@01 $k@12@01)) (< $Perm.No $k@8@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@8@01) (< $Perm.No (- $k@10@01 $k@12@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.Nodenext$ != this.Nodenext$.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@10@01 $k@12@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))))
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
(assert (not (= this@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@11@01 $k@13@01) $k@9@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@9@01 (- $k@11@01 $k@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@10@01 $k@12@01) $k@8@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@8@01 (- $k@10@01 $k@12@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@11@01 $k@13@01)) (< $Perm.No $k@9@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@7@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@9@01) (< $Perm.No (- $k@11@01 $k@13@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@7@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@10@01 $k@12@01)) (< $Perm.No $k@8@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@8@01) (< $Perm.No (- $k@10@01 $k@12@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.Nodenext$ != this.Nodenext$.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@10@01 $k@12@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@01)))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- NodetestNestingUnfolding$ ----------
(declare-const this@14@01 $Ref)
(declare-const this@15@01 $Ref)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@15@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert this != (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
; [eval] this != (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
; [eval] (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
(push) ; 3
(assert (Nodevalid$%trigger ($Snap.second $t@16@01) this@15@01))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(declare-const $k@17@01 $Perm)
(assert ($Perm.isReadVar $k@17@01))
(assert (<= $Perm.No $k@17@01))
(assert (<= $k@17@01 $Perm.Write))
(assert (=> (< $Perm.No $k@17@01) (not (= this@15@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(declare-const $k@18@01 $Perm)
(assert ($Perm.isReadVar $k@18@01))
(assert (<= $Perm.No $k@18@01))
(assert (<= $k@18@01 $Perm.Write))
(assert (=> (< $Perm.No $k@18@01) (not (= this@15@01 $Ref.null))))
; [eval] this.Nodenext$ != null
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 2 | First:(Second:($t@16@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(Second:($t@16@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | First:(Second:($t@16@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@19@01 $Ref)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (=
    (as joined_unfolding@19@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)
  (=
    (as joined_unfolding@19@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@17@01))
(assert ($Perm.isReadVar $k@18@01))
(assert (and
  (Nodevalid$%trigger ($Snap.second $t@16@01) this@15@01)
  (=
    ($Snap.second $t@16@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@16@01))
      ($Snap.second ($Snap.second $t@16@01))))
  (<= $Perm.No $k@17@01)
  (<= $k@17@01 $Perm.Write)
  (=> (< $Perm.No $k@17@01) (not (= this@15@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.second $t@16@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  (<= $Perm.No $k@18@01)
  (<= $k@18@01 $Perm.Write)
  (=> (< $Perm.No $k@18@01) (not (= this@15@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (Nodevalid$%trigger ($Snap.second $t@16@01) this@15@01)
  (=
    ($Snap.second $t@16@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@16@01))
      ($Snap.second ($Snap.second $t@16@01))))
  (<= $Perm.No $k@17@01)
  (<= $k@17@01 $Perm.Write)
  (=> (< $Perm.No $k@17@01) (not (= this@15@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.second $t@16@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  (<= $Perm.No $k@18@01)
  (<= $k@18@01 $Perm.Write)
  (=> (< $Perm.No $k@18@01) (not (= this@15@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@15@01 (as joined_unfolding@19@01  $Ref)))))
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
; [eval] this != (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
; [eval] (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@20@01 $Perm)
(assert ($Perm.isReadVar $k@20@01))
(assert (<= $Perm.No $k@20@01))
(assert (<= $k@20@01 $Perm.Write))
(assert (=> (< $Perm.No $k@20@01) (not (= this@15@01 $Ref.null))))
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
(assert (<= $Perm.No $k@21@01))
(assert (<= $k@21@01 $Perm.Write))
(assert (=> (< $Perm.No $k@21@01) (not (= this@15@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 3 | First:(Second:($t@16@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | First:(Second:($t@16@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | First:(Second:($t@16@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@22@01 $Ref)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (=
    (as joined_unfolding@22@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)
  (=
    (as joined_unfolding@22@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@20@01))
(assert ($Perm.isReadVar $k@21@01))
(assert (and
  (<= $Perm.No $k@20@01)
  (<= $k@20@01 $Perm.Write)
  (=> (< $Perm.No $k@20@01) (not (= this@15@01 $Ref.null)))
  (<= $Perm.No $k@21@01)
  (<= $k@21@01 $Perm.Write)
  (=> (< $Perm.No $k@21@01) (not (= this@15@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@20@01)
  (<= $k@20@01 $Perm.Write)
  (=> (< $Perm.No $k@20@01) (not (= this@15@01 $Ref.null)))
  (<= $Perm.No $k@21@01)
  (<= $k@21@01 $Perm.Write)
  (=> (< $Perm.No $k@21@01) (not (= this@15@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@15@01 (as joined_unfolding@22@01  $Ref)))))
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
; [eval] this != (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
; [eval] (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(assert (<= $Perm.No $k@23@01))
(assert (<= $k@23@01 $Perm.Write))
(assert (=> (< $Perm.No $k@23@01) (not (= this@15@01 $Ref.null))))
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(assert (<= $Perm.No $k@24@01))
(assert (<= $k@24@01 $Perm.Write))
(assert (=> (< $Perm.No $k@24@01) (not (= this@15@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 4 | First:(Second:($t@16@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(Second:($t@16@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | First:(Second:($t@16@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@25@01 $Ref)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (=
    (as joined_unfolding@25@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)
  (=
    (as joined_unfolding@25@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@23@01))
(assert ($Perm.isReadVar $k@24@01))
(assert (and
  (<= $Perm.No $k@23@01)
  (<= $k@23@01 $Perm.Write)
  (=> (< $Perm.No $k@23@01) (not (= this@15@01 $Ref.null)))
  (<= $Perm.No $k@24@01)
  (<= $k@24@01 $Perm.Write)
  (=> (< $Perm.No $k@24@01) (not (= this@15@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@23@01)
  (<= $k@23@01 $Perm.Write)
  (=> (< $Perm.No $k@23@01) (not (= this@15@01 $Ref.null)))
  (<= $Perm.No $k@24@01)
  (<= $k@24@01 $Perm.Write)
  (=> (< $Perm.No $k@24@01) (not (= this@15@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@15@01 (as joined_unfolding@25@01  $Ref)))))
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
; [eval] this != (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
; [eval] (unfolding acc(Nodevalid$(this), write) in this.Nodenext$)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@26@01 $Perm)
(assert ($Perm.isReadVar $k@26@01))
(assert (<= $Perm.No $k@26@01))
(assert (<= $k@26@01 $Perm.Write))
(assert (=> (< $Perm.No $k@26@01) (not (= this@15@01 $Ref.null))))
(declare-const $k@27@01 $Perm)
(assert ($Perm.isReadVar $k@27@01))
(assert (<= $Perm.No $k@27@01))
(assert (<= $k@27@01 $Perm.Write))
(assert (=> (< $Perm.No $k@27@01) (not (= this@15@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@26@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 5 | First:(Second:($t@16@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | First:(Second:($t@16@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@26@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@26@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | First:(Second:($t@16@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@26@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@28@01 $Ref)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (=
    (as joined_unfolding@28@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)
  (=
    (as joined_unfolding@28@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@26@01))
(assert ($Perm.isReadVar $k@27@01))
(assert (and
  (<= $Perm.No $k@26@01)
  (<= $k@26@01 $Perm.Write)
  (=> (< $Perm.No $k@26@01) (not (= this@15@01 $Ref.null)))
  (<= $Perm.No $k@27@01)
  (<= $k@27@01 $Perm.Write)
  (=> (< $Perm.No $k@27@01) (not (= this@15@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@26@01)
  (<= $k@26@01 $Perm.Write)
  (=> (< $Perm.No $k@26@01) (not (= this@15@01 $Ref.null)))
  (<= $Perm.No $k@27@01)
  (<= $k@27@01 $Perm.Write)
  (=> (< $Perm.No $k@27@01) (not (= this@15@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@15@01 (as joined_unfolding@28@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- NodetestNestingUnfoldTwo$ ----------
(declare-const this@29@01 $Ref)
(declare-const this@30@01 $Ref)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (= ($Snap.first $t@31@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@30@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(Nodep$(this), write)
(assert (=
  ($Snap.second $t@31@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@01))
    ($Snap.second ($Snap.second $t@31@01)))))
(declare-const $k@32@01 $Perm)
(assert ($Perm.isReadVar $k@32@01))
(assert (<= $Perm.No $k@32@01))
(assert (<= $k@32@01 $Perm.Write))
(assert (=> (< $Perm.No $k@32@01) (not (= this@30@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@31@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@31@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))
(declare-const $k@33@01 $Perm)
(assert ($Perm.isReadVar $k@33@01))
(assert (<= $Perm.No $k@33@01))
(assert (<= $k@33@01 $Perm.Write))
(assert (=> (< $Perm.No $k@33@01) (not (= this@30@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@31@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@31@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:($t@31@01)) != Null | live]
; [else-branch: 6 | First:(Second:($t@31@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(Second:($t@31@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@31@01))) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodep$%trigger ($Snap.second $t@31@01) this@30@01))
; [exec]
; assert this != this.Nodenext$
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    this@30@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@31@01)))))))
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
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    this@30@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@31@01)))))))
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
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    this@30@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@31@01)))))))
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
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    this@30@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@31@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- NodetestNestingFoldTwo$ ----------
(declare-const this@34@01 $Ref)
(declare-const this@35@01 $Ref)
(push) ; 1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.first $t@36@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@35@01 $Ref.null)))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(assert (<= $Perm.No $k@37@01))
(assert (<= $k@37@01 $Perm.Write))
(assert (=> (< $Perm.No $k@37@01) (not (= this@35@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@36@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@36@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
(declare-const $k@38@01 $Perm)
(assert ($Perm.isReadVar $k@38@01))
(assert (<= $Perm.No $k@38@01))
(assert (<= $k@38@01 $Perm.Write))
(assert (=> (< $Perm.No $k@38@01) (not (= this@35@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@36@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@39@01 $Perm)
(assert ($Perm.isReadVar $k@39@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@35@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@39@01))
(assert (<= $k@39@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@39@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@40@01 $Perm)
(assert ($Perm.isReadVar $k@40@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@35@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@40@01))
(assert (<= $k@40@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@40@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
  $Snap.unit))
; [eval] this.Nodenext$ != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
  $Snap.unit))
; [eval] this.Nodenext$.Nodenext$ != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(Nodeq$(this.Nodenext$), write)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@41@01 $Perm)
(assert ($Perm.isReadVar $k@41@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@39@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@41@01 $k@39@01))
(assert (<= $Perm.No (- $k@39@01 $k@41@01)))
(assert (<= (- $k@39@01 $k@41@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@39@01 $k@41@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@41@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@42@01 $Perm)
(assert ($Perm.isReadVar $k@42@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@40@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@42@01 $k@40@01))
(assert (<= $Perm.No (- $k@40@01 $k@42@01)))
(assert (<= (- $k@40@01 $k@42@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@40@01 $k@42@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@42@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] this.Nodenext$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(Second:(Second:($t@36@01)))) != Null | live]
; [else-branch: 7 | First:(Second:(Second:(Second:($t@36@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | First:(Second:(Second:(Second:($t@36@01)))) != Null]
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Nodeq$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))))
; [exec]
; assert this != this.Nodenext$
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    this@35@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))))))
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
(assert (not (= this@35@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@35@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@40@01 $k@42@01) $k@38@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@38@01 (- $k@40@01 $k@42@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@39@01 $k@41@01) $k@37@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@37@01 (- $k@39@01 $k@41@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@40@01 $k@42@01)) (< $Perm.No $k@38@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@36@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@38@01) (< $Perm.No (- $k@40@01 $k@42@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@36@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@39@01 $k@41@01)) (< $Perm.No $k@37@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@37@01) (< $Perm.No (- $k@39@01 $k@41@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    this@35@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))))))
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
(assert (not (= this@35@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@35@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@40@01 $k@42@01) $k@38@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@38@01 (- $k@40@01 $k@42@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@39@01 $k@41@01) $k@37@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@37@01 (- $k@39@01 $k@41@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@40@01 $k@42@01)) (< $Perm.No $k@38@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@36@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@38@01) (< $Perm.No (- $k@40@01 $k@42@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@36@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@39@01 $k@41@01)) (< $Perm.No $k@37@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@37@01) (< $Perm.No (- $k@39@01 $k@41@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    this@35@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))))))
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
(assert (not (= this@35@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@35@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@40@01 $k@42@01) $k@38@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@38@01 (- $k@40@01 $k@42@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@39@01 $k@41@01) $k@37@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ $k@37@01 (- $k@39@01 $k@41@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@40@01 $k@42@01)) (< $Perm.No $k@38@01))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@36@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@38@01) (< $Perm.No (- $k@40@01 $k@42@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@36@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@39@01 $k@41@01)) (< $Perm.No $k@37@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No $k@37@01) (< $Perm.No (- $k@39@01 $k@41@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    this@35@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@36@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- NodetestNestingFoldThree$ ----------
(declare-const this@43@01 $Ref)
(declare-const this@44@01 $Ref)
(push) ; 1
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 ($Snap.combine ($Snap.first $t@45@01) ($Snap.second $t@45@01))))
(assert (= ($Snap.first $t@45@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@44@01 $Ref.null)))
(assert (=
  ($Snap.second $t@45@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@45@01))
    ($Snap.second ($Snap.second $t@45@01)))))
(declare-const $k@46@01 $Perm)
(assert ($Perm.isReadVar $k@46@01))
(assert (<= $Perm.No $k@46@01))
(assert (<= $k@46@01 $Perm.Write))
(assert (=> (< $Perm.No $k@46@01) (not (= this@44@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@45@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@45@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
(declare-const $k@47@01 $Perm)
(assert ($Perm.isReadVar $k@47@01))
(assert (<= $Perm.No $k@47@01))
(assert (<= $k@47@01 $Perm.Write))
(assert (=> (< $Perm.No $k@47@01) (not (= this@44@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@45@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@48@01 $Perm)
(assert ($Perm.isReadVar $k@48@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@44@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@48@01))
(assert (<= $k@48@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@48@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@49@01 $Perm)
(assert ($Perm.isReadVar $k@49@01))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@44@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@49@01))
(assert (<= $k@49@01 $Perm.Write))
(assert (=>
  (< $Perm.No $k@49@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
  $Snap.unit))
; [eval] this.Nodenext$ != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
  $Snap.unit))
; [eval] this.Nodenext$.Nodenext$ != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@48@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@48@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(Nodeq$(this.Nodenext$), write)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@50@01 $Perm)
(assert ($Perm.isReadVar $k@50@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@48@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@50@01 $k@48@01))
(assert (<= $Perm.No (- $k@48@01 $k@50@01)))
(assert (<= (- $k@48@01 $k@50@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@48@01 $k@50@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@50@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@51@01 $Perm)
(assert ($Perm.isReadVar $k@51@01))
(set-option :timeout 0)
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
(assert (<= (- $k@49@01 $k@51@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $k@49@01 $k@51@01))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@51@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] this.Nodenext$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@48@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(Second:(Second:($t@45@01)))) != Null | live]
; [else-branch: 8 | First:(Second:(Second:(Second:($t@45@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | First:(Second:(Second:(Second:($t@45@01)))) != Null]
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@48@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Nodeq$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))))
; [exec]
; fold acc(Nodep$(this), write)
(declare-const $k@52@01 $Perm)
(assert ($Perm.isReadVar $k@52@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@46@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@52@01 $k@46@01))
(assert (<= $Perm.No (- $k@46@01 $k@52@01)))
(assert (<= (- $k@46@01 $k@52@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@46@01 $k@52@01)) (not (= this@44@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@52@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@53@01 $Perm)
(assert ($Perm.isReadVar $k@53@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@47@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@53@01 $k@47@01))
(assert (<= $Perm.No (- $k@47@01 $k@53@01)))
(assert (<= (- $k@47@01 $k@53@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@47@01 $k@53@01)) (not (= this@44@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@53@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.Nodenext$ != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:($t@45@01)) != Null | live]
; [else-branch: 9 | First:(Second:($t@45@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | First:(Second:($t@45@01)) != Null]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Nodep$%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@45@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@45@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))))) this@44@01))
; [exec]
; assert this != this.Nodenext$
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@46@01 $k@52@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not
  (=
    this@44@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))))))
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))) this@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))) this@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@47@01 $k@53@01) (- $k@49@01 $k@51@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@49@01 $k@51@01) (- $k@47@01 $k@53@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@46@01 $k@52@01) (- $k@48@01 $k@50@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@48@01 $k@50@01) (- $k@46@01 $k@52@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@47@01 $k@53@01)) (< $Perm.No (- $k@49@01 $k@51@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@45@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@49@01 $k@51@01)) (< $Perm.No (- $k@47@01 $k@53@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@45@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@46@01 $k@52@01)) (< $Perm.No (- $k@48@01 $k@50@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@48@01 $k@50@01)) (< $Perm.No (- $k@46@01 $k@52@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@46@01 $k@52@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not
  (=
    this@44@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))))))
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))) this@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))) this@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@47@01 $k@53@01) (- $k@49@01 $k@51@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@49@01 $k@51@01) (- $k@47@01 $k@53@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@46@01 $k@52@01) (- $k@48@01 $k@50@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@48@01 $k@50@01) (- $k@46@01 $k@52@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@47@01 $k@53@01)) (< $Perm.No (- $k@49@01 $k@51@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@45@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@49@01 $k@51@01)) (< $Perm.No (- $k@47@01 $k@53@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@45@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@46@01 $k@52@01)) (< $Perm.No (- $k@48@01 $k@50@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@48@01 $k@50@01)) (< $Perm.No (- $k@46@01 $k@52@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@46@01 $k@52@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not
  (=
    this@44@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))))))
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))) this@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))) this@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@47@01 $k@53@01) (- $k@49@01 $k@51@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@49@01 $k@51@01) (- $k@47@01 $k@53@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@46@01 $k@52@01) (- $k@48@01 $k@50@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $k@48@01 $k@50@01) (- $k@46@01 $k@52@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@47@01 $k@53@01)) (< $Perm.No (- $k@49@01 $k@51@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@45@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@49@01 $k@51@01)) (< $Perm.No (- $k@47@01 $k@53@01)))
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@45@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@46@01 $k@52@01)) (< $Perm.No (- $k@48@01 $k@50@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and (< $Perm.No (- $k@48@01 $k@50@01)) (< $Perm.No (- $k@46@01 $k@52@01)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this != this.Nodenext$
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@46@01 $k@52@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (not
  (=
    this@44@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@45@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- NodetestNestingUnfoldingTwo$ ----------
(declare-const this@54@01 $Ref)
(declare-const this@55@01 $Ref)
(push) ; 1
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 ($Snap.combine ($Snap.first $t@56@01) ($Snap.second $t@56@01))))
(assert (= ($Snap.first $t@56@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@55@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert this != (unfolding acc(Nodep$(this), write) in this.Nodenext$)
; [eval] this != (unfolding acc(Nodep$(this), write) in this.Nodenext$)
; [eval] (unfolding acc(Nodep$(this), write) in this.Nodenext$)
(push) ; 3
(assert (Nodep$%trigger ($Snap.second $t@56@01) this@55@01))
(assert (=
  ($Snap.second $t@56@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@56@01))
    ($Snap.second ($Snap.second $t@56@01)))))
(declare-const $k@57@01 $Perm)
(assert ($Perm.isReadVar $k@57@01))
(assert (<= $Perm.No $k@57@01))
(assert (<= $k@57@01 $Perm.Write))
(assert (=> (< $Perm.No $k@57@01) (not (= this@55@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@56@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@56@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@56@01))))))
(declare-const $k@58@01 $Perm)
(assert ($Perm.isReadVar $k@58@01))
(assert (<= $Perm.No $k@58@01))
(assert (<= $k@58@01 $Perm.Write))
(assert (=> (< $Perm.No $k@58@01) (not (= this@55@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@57@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:($t@56@01)) != Null | live]
; [else-branch: 10 | First:(Second:($t@56@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | First:(Second:($t@56@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@57@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@57@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 10 | First:(Second:($t@56@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@56@01))) $Snap.unit))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@57@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@59@01 $Ref)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01)))
      $Ref.null))
  (=
    (as joined_unfolding@59@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)
  (=
    (as joined_unfolding@59@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@57@01))
(assert ($Perm.isReadVar $k@58@01))
(assert (and
  (Nodep$%trigger ($Snap.second $t@56@01) this@55@01)
  (=
    ($Snap.second $t@56@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@56@01))
      ($Snap.second ($Snap.second $t@56@01))))
  (<= $Perm.No $k@57@01)
  (<= $k@57@01 $Perm.Write)
  (=> (< $Perm.No $k@57@01) (not (= this@55@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.second $t@56@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@56@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@56@01)))))
  (<= $Perm.No $k@58@01)
  (<= $k@58@01 $Perm.Write)
  (=> (< $Perm.No $k@58@01) (not (= this@55@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (Nodep$%trigger ($Snap.second $t@56@01) this@55@01)
  (=
    ($Snap.second $t@56@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@56@01))
      ($Snap.second ($Snap.second $t@56@01))))
  (<= $Perm.No $k@57@01)
  (<= $k@57@01 $Perm.Write)
  (=> (< $Perm.No $k@57@01) (not (= this@55@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.second $t@56@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@56@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@56@01)))))
  (<= $Perm.No $k@58@01)
  (<= $k@58@01 $Perm.Write)
  (=> (< $Perm.No $k@58@01) (not (= this@55@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.second $t@56@01))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01)))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@55@01 (as joined_unfolding@59@01  $Ref)))))
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
; [eval] this != (unfolding acc(Nodep$(this), write) in this.Nodenext$)
; [eval] (unfolding acc(Nodep$(this), write) in this.Nodenext$)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@60@01 $Perm)
(assert ($Perm.isReadVar $k@60@01))
(assert (<= $Perm.No $k@60@01))
(assert (<= $k@60@01 $Perm.Write))
(assert (=> (< $Perm.No $k@60@01) (not (= this@55@01 $Ref.null))))
(declare-const $k@61@01 $Perm)
(assert ($Perm.isReadVar $k@61@01))
(assert (<= $Perm.No $k@61@01))
(assert (<= $k@61@01 $Perm.Write))
(assert (=> (< $Perm.No $k@61@01) (not (= this@55@01 $Ref.null))))
; [eval] this.Nodenext$ != null
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:($t@56@01)) != Null | live]
; [else-branch: 11 | First:(Second:($t@56@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | First:(Second:($t@56@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | First:(Second:($t@56@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@56@01))) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@62@01 $Ref)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01)))
      $Ref.null))
  (=
    (as joined_unfolding@62@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)
  (=
    (as joined_unfolding@62@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@60@01))
(assert ($Perm.isReadVar $k@61@01))
(assert (and
  (<= $Perm.No $k@60@01)
  (<= $k@60@01 $Perm.Write)
  (=> (< $Perm.No $k@60@01) (not (= this@55@01 $Ref.null)))
  (<= $Perm.No $k@61@01)
  (<= $k@61@01 $Perm.Write)
  (=> (< $Perm.No $k@61@01) (not (= this@55@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@60@01)
  (<= $k@60@01 $Perm.Write)
  (=> (< $Perm.No $k@60@01) (not (= this@55@01 $Ref.null)))
  (<= $Perm.No $k@61@01)
  (<= $k@61@01 $Perm.Write)
  (=> (< $Perm.No $k@61@01) (not (= this@55@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@55@01 (as joined_unfolding@62@01  $Ref)))))
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
; [eval] this != (unfolding acc(Nodep$(this), write) in this.Nodenext$)
; [eval] (unfolding acc(Nodep$(this), write) in this.Nodenext$)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@63@01 $Perm)
(assert ($Perm.isReadVar $k@63@01))
(assert (<= $Perm.No $k@63@01))
(assert (<= $k@63@01 $Perm.Write))
(assert (=> (< $Perm.No $k@63@01) (not (= this@55@01 $Ref.null))))
(declare-const $k@64@01 $Perm)
(assert ($Perm.isReadVar $k@64@01))
(assert (<= $Perm.No $k@64@01))
(assert (<= $k@64@01 $Perm.Write))
(assert (=> (< $Perm.No $k@64@01) (not (= this@55@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:($t@56@01)) != Null | live]
; [else-branch: 12 | First:(Second:($t@56@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | First:(Second:($t@56@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 12 | First:(Second:($t@56@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@56@01))) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@65@01 $Ref)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01)))
      $Ref.null))
  (=
    (as joined_unfolding@65@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)
  (=
    (as joined_unfolding@65@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@63@01))
(assert ($Perm.isReadVar $k@64@01))
(assert (and
  (<= $Perm.No $k@63@01)
  (<= $k@63@01 $Perm.Write)
  (=> (< $Perm.No $k@63@01) (not (= this@55@01 $Ref.null)))
  (<= $Perm.No $k@64@01)
  (<= $k@64@01 $Perm.Write)
  (=> (< $Perm.No $k@64@01) (not (= this@55@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@63@01)
  (<= $k@63@01 $Perm.Write)
  (=> (< $Perm.No $k@63@01) (not (= this@55@01 $Ref.null)))
  (<= $Perm.No $k@64@01)
  (<= $k@64@01 $Perm.Write)
  (=> (< $Perm.No $k@64@01) (not (= this@55@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@55@01 (as joined_unfolding@65@01  $Ref)))))
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
; [eval] this != (unfolding acc(Nodep$(this), write) in this.Nodenext$)
; [eval] (unfolding acc(Nodep$(this), write) in this.Nodenext$)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@66@01 $Perm)
(assert ($Perm.isReadVar $k@66@01))
(assert (<= $Perm.No $k@66@01))
(assert (<= $k@66@01 $Perm.Write))
(assert (=> (< $Perm.No $k@66@01) (not (= this@55@01 $Ref.null))))
(declare-const $k@67@01 $Perm)
(assert ($Perm.isReadVar $k@67@01))
(assert (<= $Perm.No $k@67@01))
(assert (<= $k@67@01 $Perm.Write))
(assert (=> (< $Perm.No $k@67@01) (not (= this@55@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@66@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:($t@56@01)) != Null | live]
; [else-branch: 13 | First:(Second:($t@56@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | First:(Second:($t@56@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@66@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@66@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 13 | First:(Second:($t@56@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@56@01))) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@66@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@68@01 $Ref)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01)))
      $Ref.null))
  (=
    (as joined_unfolding@68@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))) $Ref.null)
  (=
    (as joined_unfolding@68@01  $Ref)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@56@01))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@66@01))
(assert ($Perm.isReadVar $k@67@01))
(assert (and
  (<= $Perm.No $k@66@01)
  (<= $k@66@01 $Perm.Write)
  (=> (< $Perm.No $k@66@01) (not (= this@55@01 $Ref.null)))
  (<= $Perm.No $k@67@01)
  (<= $k@67@01 $Perm.Write)
  (=> (< $Perm.No $k@67@01) (not (= this@55@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (<= $Perm.No $k@66@01)
  (<= $k@66@01 $Perm.Write)
  (=> (< $Perm.No $k@66@01) (not (= this@55@01 $Ref.null)))
  (<= $Perm.No $k@67@01)
  (<= $k@67@01 $Perm.Write)
  (=> (< $Perm.No $k@67@01) (not (= this@55@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= this@55@01 (as joined_unfolding@68@01  $Ref)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- NodetestNestingUnfoldingPrecondition$ ----------
(declare-const this@69@01 $Ref)
(declare-const x@70@01 $Ref)
(declare-const this@71@01 $Ref)
(declare-const x@72@01 $Ref)
(push) ; 1
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 ($Snap.combine ($Snap.first $t@73@01) ($Snap.second $t@73@01))))
(assert (= ($Snap.first $t@73@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@71@01 $Ref.null)))
(assert (=
  ($Snap.second $t@73@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@73@01))
    ($Snap.second ($Snap.second $t@73@01)))))
(assert (= ($Snap.second ($Snap.second $t@73@01)) $Snap.unit))
; [eval] (unfolding acc(Nodevalid$(this), write) in this.Nodenext$ == x)
(push) ; 2
(assert (Nodevalid$%trigger ($Snap.first ($Snap.second $t@73@01)) this@71@01))
(assert (=
  ($Snap.first ($Snap.second $t@73@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@73@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@73@01))))))
(declare-const $k@74@01 $Perm)
(assert ($Perm.isReadVar $k@74@01))
(assert (<= $Perm.No $k@74@01))
(assert (<= $k@74@01 $Perm.Write))
(assert (=> (< $Perm.No $k@74@01) (not (= this@71@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@73@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@73@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@73@01)))))))
(declare-const $k@75@01 $Perm)
(assert ($Perm.isReadVar $k@75@01))
(assert (<= $Perm.No $k@75@01))
(assert (<= $k@75@01 $Perm.Write))
(assert (=> (< $Perm.No $k@75@01) (not (= this@71@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@74@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(First:(Second:($t@73@01))) != Null | live]
; [else-branch: 14 | First:(First:(Second:($t@73@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | First:(First:(Second:($t@73@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
    $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@74@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.Nodenext$ == x
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@74@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 14 | First:(First:(Second:($t@73@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@73@01))))
  $Snap.unit))
; [eval] this.Nodenext$ == x
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@74@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(declare-const joined_unfolding@76@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
      $Ref.null))
  (=
    (as joined_unfolding@76@01  Bool)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
      x@72@01))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
    $Ref.null)
  (=
    (as joined_unfolding@76@01  Bool)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
      x@72@01))))
; Joined path conditions
(assert ($Perm.isReadVar $k@74@01))
(assert ($Perm.isReadVar $k@75@01))
(assert (and
  (Nodevalid$%trigger ($Snap.first ($Snap.second $t@73@01)) this@71@01)
  (=
    ($Snap.first ($Snap.second $t@73@01))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@73@01)))
      ($Snap.second ($Snap.first ($Snap.second $t@73@01)))))
  (<= $Perm.No $k@74@01)
  (<= $k@74@01 $Perm.Write)
  (=> (< $Perm.No $k@74@01) (not (= this@71@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first ($Snap.second $t@73@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@73@01))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@73@01))))))
  (<= $Perm.No $k@75@01)
  (<= $k@75@01 $Perm.Write)
  (=> (< $Perm.No $k@75@01) (not (= this@71@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (Nodevalid$%trigger ($Snap.first ($Snap.second $t@73@01)) this@71@01)
  (=
    ($Snap.first ($Snap.second $t@73@01))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@73@01)))
      ($Snap.second ($Snap.first ($Snap.second $t@73@01)))))
  (<= $Perm.No $k@74@01)
  (<= $k@74@01 $Perm.Write)
  (=> (< $Perm.No $k@74@01) (not (= this@71@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first ($Snap.second $t@73@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@73@01))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@73@01))))))
  (<= $Perm.No $k@75@01)
  (<= $k@75@01 $Perm.Write)
  (=> (< $Perm.No $k@75@01) (not (= this@71@01 $Ref.null)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@73@01))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@73@01))))
      $Ref.null))))
(assert (as joined_unfolding@76@01  Bool))
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
(assert (not (not (= this@71@01 x@72@01))))
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
(assert (not (not (= this@71@01 x@72@01))))
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
(assert (not (not (= this@71@01 x@72@01))))
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
(assert (not (not (= this@71@01 x@72@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- NodetestNestingUnfoldingPostcondition$ ----------
(declare-const this@77@01 $Ref)
(declare-const x@78@01 $Ref)
(declare-const this@79@01 $Ref)
(declare-const x@80@01 $Ref)
(push) ; 1
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 ($Snap.combine ($Snap.first $t@81@01) ($Snap.second $t@81@01))))
(assert (= ($Snap.first $t@81@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@79@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 ($Snap.combine ($Snap.first $t@82@01) ($Snap.second $t@82@01))))
(assert (=
  ($Snap.second $t@82@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@82@01))
    ($Snap.second ($Snap.second $t@82@01)))))
(assert (= ($Snap.first ($Snap.second $t@82@01)) $Snap.unit))
; [eval] (unfolding acc(Nodevalid$(this), write) in true)
(push) ; 3
(assert (Nodevalid$%trigger ($Snap.first $t@82@01) this@79@01))
(assert (=
  ($Snap.first $t@82@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@82@01))
    ($Snap.second ($Snap.first $t@82@01)))))
(declare-const $k@83@01 $Perm)
(assert ($Perm.isReadVar $k@83@01))
(assert (<= $Perm.No $k@83@01))
(assert (<= $k@83@01 $Perm.Write))
(assert (=> (< $Perm.No $k@83@01) (not (= this@79@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first $t@82@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@82@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@82@01))))))
(declare-const $k@84@01 $Perm)
(assert ($Perm.isReadVar $k@84@01))
(assert (<= $Perm.No $k@84@01))
(assert (<= $k@84@01 $Perm.Write))
(assert (=> (< $Perm.No $k@84@01) (not (= this@79@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@83@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(First:($t@82@01)) != Null | live]
; [else-branch: 15 | First:(First:($t@82@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | First:(First:($t@82@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01))) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@83@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 15 | First:(First:($t@82@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@82@01))) $Snap.unit))
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@85@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01)))
      $Ref.null))
  (= (as joined_unfolding@85@01  Bool) true)))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01))) $Ref.null)
  (= (as joined_unfolding@85@01  Bool) true)))
; Joined path conditions
(assert ($Perm.isReadVar $k@83@01))
(assert ($Perm.isReadVar $k@84@01))
(assert (and
  (Nodevalid$%trigger ($Snap.first $t@82@01) this@79@01)
  (=
    ($Snap.first $t@82@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@82@01))
      ($Snap.second ($Snap.first $t@82@01))))
  (<= $Perm.No $k@83@01)
  (<= $k@83@01 $Perm.Write)
  (=> (< $Perm.No $k@83@01) (not (= this@79@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first $t@82@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@82@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@82@01)))))
  (<= $Perm.No $k@84@01)
  (<= $k@84@01 $Perm.Write)
  (=> (< $Perm.No $k@84@01) (not (= this@79@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (Nodevalid$%trigger ($Snap.first $t@82@01) this@79@01)
  (=
    ($Snap.first $t@82@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@82@01))
      ($Snap.second ($Snap.first $t@82@01))))
  (<= $Perm.No $k@83@01)
  (<= $k@83@01 $Perm.Write)
  (=> (< $Perm.No $k@83@01) (not (= this@79@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.first $t@82@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@82@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@82@01)))))
  (<= $Perm.No $k@84@01)
  (<= $k@84@01 $Perm.Write)
  (=> (< $Perm.No $k@84@01) (not (= this@79@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@82@01))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@82@01)))
      $Ref.null))))
(assert (as joined_unfolding@85@01  Bool))
(assert (= ($Snap.second ($Snap.second $t@82@01)) $Snap.unit))
; [eval] this != NodegetNext$(this)
; [eval] NodegetNext$(this)
(push) ; 3
; [eval] this != null
(declare-const $k@86@01 $Perm)
(assert ($Perm.isReadVar $k@86@01))
(assert (< $k@86@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@86@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@86@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (NodegetNext$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@82@01)) this@79@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@86@01))
(assert (and
  (< $k@86@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@86@01))
  (NodegetNext$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@82@01)) this@79@01)))
(assert (not
  (=
    this@79@01
    (NodegetNext$ ($Snap.combine $Snap.unit ($Snap.first $t@82@01)) this@79@01))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [eval] (unfolding acc(Nodevalid$(this), write) in true)
(push) ; 3
(assert (Nodevalid$%trigger ($Snap.second $t@81@01) this@79@01))
(assert (=
  ($Snap.second $t@81@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@81@01))
    ($Snap.second ($Snap.second $t@81@01)))))
(declare-const $k@87@01 $Perm)
(assert ($Perm.isReadVar $k@87@01))
(assert (<= $Perm.No $k@87@01))
(assert (<= $k@87@01 $Perm.Write))
(assert (=> (< $Perm.No $k@87@01) (not (= this@79@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@81@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@81@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))
(declare-const $k@88@01 $Perm)
(assert ($Perm.isReadVar $k@88@01))
(assert (<= $Perm.No $k@88@01))
(assert (<= $k@88@01 $Perm.Write))
(assert (=> (< $Perm.No $k@88@01) (not (= this@79@01 $Ref.null))))
; [eval] this.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@87@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:($t@81@01)) != Null | live]
; [else-branch: 16 | First:(Second:($t@81@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | First:(Second:($t@81@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))) $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@87@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 16 | First:(Second:($t@81@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@81@01))) $Snap.unit))
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@89@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01)))
      $Ref.null))
  (= (as joined_unfolding@89@01  Bool) true)))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))) $Ref.null)
  (= (as joined_unfolding@89@01  Bool) true)))
; Joined path conditions
(assert ($Perm.isReadVar $k@87@01))
(assert ($Perm.isReadVar $k@88@01))
(assert (and
  (Nodevalid$%trigger ($Snap.second $t@81@01) this@79@01)
  (=
    ($Snap.second $t@81@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@81@01))
      ($Snap.second ($Snap.second $t@81@01))))
  (<= $Perm.No $k@87@01)
  (<= $k@87@01 $Perm.Write)
  (=> (< $Perm.No $k@87@01) (not (= this@79@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.second $t@81@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@81@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))
  (<= $Perm.No $k@88@01)
  (<= $k@88@01 $Perm.Write)
  (=> (< $Perm.No $k@88@01) (not (= this@79@01 $Ref.null)))))
; Joined path conditions
(assert (and
  (Nodevalid$%trigger ($Snap.second $t@81@01) this@79@01)
  (=
    ($Snap.second $t@81@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@81@01))
      ($Snap.second ($Snap.second $t@81@01))))
  (<= $Perm.No $k@87@01)
  (<= $k@87@01 $Perm.Write)
  (=> (< $Perm.No $k@87@01) (not (= this@79@01 $Ref.null)))
  (=
    ($Snap.second ($Snap.second $t@81@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@81@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))
  (<= $Perm.No $k@88@01)
  (<= $k@88@01 $Perm.Write)
  (=> (< $Perm.No $k@88@01) (not (= this@79@01 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.second $t@81@01))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01)))
      $Ref.null))))
(push) ; 3
(assert (not (as joined_unfolding@89@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@89@01  Bool))
; [eval] this != NodegetNext$(this)
; [eval] NodegetNext$(this)
(push) ; 3
; [eval] this != null
(declare-const $k@90@01 $Perm)
(assert ($Perm.isReadVar $k@90@01))
(assert (< $k@90@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@90@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@90@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (NodegetNext$%precondition ($Snap.combine $Snap.unit ($Snap.second $t@81@01)) this@79@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@90@01))
(assert (and
  (< $k@90@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@90@01))
  (NodegetNext$%precondition ($Snap.combine $Snap.unit ($Snap.second $t@81@01)) this@79@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    this@79@01
    (NodegetNext$ ($Snap.combine $Snap.unit ($Snap.second $t@81@01)) this@79@01)))))
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
; [eval] this != NodegetNext$(this)
; [eval] NodegetNext$(this)
(set-option :timeout 0)
(push) ; 3
; [eval] this != null
(declare-const $k@91@01 $Perm)
(assert ($Perm.isReadVar $k@91@01))
(assert (< $k@91@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@91@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@91@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@91@01))
(assert (and (< $k@91@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@91@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    this@79@01
    (NodegetNext$ ($Snap.combine $Snap.unit ($Snap.second $t@81@01)) this@79@01)))))
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
; [eval] this != NodegetNext$(this)
; [eval] NodegetNext$(this)
(set-option :timeout 0)
(push) ; 3
; [eval] this != null
(declare-const $k@92@01 $Perm)
(assert ($Perm.isReadVar $k@92@01))
(assert (< $k@92@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@92@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@92@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@92@01))
(assert (and (< $k@92@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@92@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    this@79@01
    (NodegetNext$ ($Snap.combine $Snap.unit ($Snap.second $t@81@01)) this@79@01)))))
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
; [eval] this != NodegetNext$(this)
; [eval] NodegetNext$(this)
(set-option :timeout 0)
(push) ; 3
; [eval] this != null
(declare-const $k@93@01 $Perm)
(assert ($Perm.isReadVar $k@93@01))
(assert (< $k@93@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@93@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@93@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@93@01))
(assert (and (< $k@93@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@93@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    this@79@01
    (NodegetNext$ ($Snap.combine $Snap.unit ($Snap.second $t@81@01)) this@79@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
