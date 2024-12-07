(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:40
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/test10.vpr
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
(declare-fun get ($Snap $Ref) Int)
(declare-fun get%limited ($Snap $Ref) Int)
(declare-fun get%stateless ($Ref) Bool)
(declare-fun get%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun inv%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@2@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (get%limited s@$ this@0@00) (get s@$ this@0@00))
  :pattern ((get s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (get%stateless this@0@00)
  :pattern ((get%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (get%precondition s@$ this@0@00)
    (= (get s@$ this@0@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((get s@$ this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((get s@$ this@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- foo ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] (unfolding acc(inv(this), write) in this.next != null)
(push) ; 2
(assert (inv%trigger ($Snap.first $t@2@01) this@1@01))
(assert (=
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.second ($Snap.first $t@2@01)))))
(assert (not (= this@1@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 0 | First:(Second:(First:($t@2@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(First:($t@2@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)))
; [eval] this.next != null
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(Second:(First:($t@2@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@2@01))) $Snap.unit))
; [eval] this.next != null
(pop) ; 3
(pop) ; 2
(declare-const joined_unfolding@3@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (=
    (as joined_unfolding@3@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
        $Ref.null)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)
  (=
    (as joined_unfolding@3@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
        $Ref.null)))))
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@2@01) this@1@01)
  (=
    ($Snap.first $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.second ($Snap.first $t@2@01))))
  (not (= this@1@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@2@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))))
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@2@01) this@1@01)
  (=
    ($Snap.first $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.second ($Snap.first $t@2@01))))
  (not (= this@1@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@2@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@2@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))))
(assert (as joined_unfolding@3@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] (unfolding acc(inv(this), write) in this.next != null)
(push) ; 3
(assert (inv%trigger ($Snap.first $t@4@01) this@1@01))
(assert (=
  ($Snap.first $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.second ($Snap.first $t@4@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@4@01))))))
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(First:($t@4@01))) != Null | live]
; [else-branch: 1 | First:(Second:(First:($t@4@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(Second:(First:($t@4@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    $Ref.null)))
; [eval] this.next != null
(pop) ; 4
(push) ; 4
; [else-branch: 1 | First:(Second:(First:($t@4@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@4@01))) $Snap.unit))
; [eval] this.next != null
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@5@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
      $Ref.null))
  (=
    (as joined_unfolding@5@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
        $Ref.null)))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    $Ref.null)
  (=
    (as joined_unfolding@5@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
        $Ref.null)))))
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@4@01) this@1@01)
  (=
    ($Snap.first $t@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.second ($Snap.first $t@4@01))))
  (=
    ($Snap.second ($Snap.first $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))))
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@4@01) this@1@01)
  (=
    ($Snap.first $t@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.second ($Snap.first $t@4@01))))
  (=
    ($Snap.second ($Snap.first $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@4@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
      $Ref.null))))
(assert (as joined_unfolding@5@01  Bool))
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(inv(this), write) in
;     (unfolding acc(inv(this.next), write) in true))
; [eval] (unfolding acc(inv(this), write) in (unfolding acc(inv(this.next), write) in true))
(push) ; 3
; [eval] this.next != null
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
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 2 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(Second:(First:($t@2@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)))
; [eval] (unfolding acc(inv(this.next), write) in true)
(push) ; 5
(assert (inv%trigger ($Snap.second ($Snap.second ($Snap.first $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@2@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(Second:(Second:(First:($t@2@01))))) != Null | live]
; [else-branch: 3 | First:(Second:(Second:(Second:(First:($t@2@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | First:(Second:(Second:(Second:(First:($t@2@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
    $Ref.null)))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | First:(Second:(Second:(Second:(First:($t@2@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
  $Snap.unit))
(pop) ; 6
(pop) ; 5
(declare-const joined_unfolding@6@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
      $Ref.null))
  (= (as joined_unfolding@6@01  Bool) true)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
    $Ref.null)
  (= (as joined_unfolding@6@01  Bool) true)))
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.second ($Snap.second ($Snap.first $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))))))
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.second ($Snap.second ($Snap.first $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
      $Ref.null))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
          $Ref.null))
      (= (as joined_unfolding@6@01  Bool) true))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
        $Ref.null)
      (= (as joined_unfolding@6@01  Bool) true))
    (inv%trigger ($Snap.second ($Snap.second ($Snap.first $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@2@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
          $Ref.null))))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)))
(push) ; 3
(assert (not (as joined_unfolding@6@01  Bool)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@6@01  Bool))
; [eval] (unfolding acc(inv(this), write) in this.next != null)
(push) ; 3
; [eval] this.next != null
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
; [then-branch: 4 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 4 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(Second:(First:($t@2@01))) != Null]
; [eval] this.next != null
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
