(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:37
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/test1.vpr
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
; unfold acc(inv(this), write)
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
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 2 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | First:(Second:(First:($t@2@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; this.value := 0
; [exec]
; unfold acc(inv(this.next), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@2@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(Second:(Second:(First:($t@2@01))))) != Null | live]
; [else-branch: 3 | First:(Second:(Second:(Second:(First:($t@2@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | First:(Second:(Second:(Second:(First:($t@2@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.second ($Snap.second ($Snap.first $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
; [exec]
; this.next.value := 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(inv(this.next), write)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(Second:(Second:(First:($t@2@01))))) != Null | live]
; [else-branch: 4 | First:(Second:(Second:(Second:(First:($t@2@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | First:(Second:(Second:(Second:(First:($t@2@01))))) != Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
; [exec]
; assert get(this.next) == 1
; [eval] get(this.next) == 1
; [eval] get(this.next)
(push) ; 6
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
(pop) ; 6
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
(push) ; 6
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
  1)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
  1))
; [exec]
; assert this.value == 0
; [eval] this.value == 0
; [exec]
; fold acc(inv(this), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 5 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 5 | First:(Second:(First:($t@2@01))) != Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))))) this@1@01))
; [exec]
; assert get(this) == 0
; [eval] get(this) == 0
; [eval] get(this)
(push) ; 7
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))))) this@1@01))
(pop) ; 7
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))))) this@1@01))
(push) ; 7
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 1)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))))) this@1@01)
  0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 1)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))))) this@1@01)
  0))
; [exec]
; assert (unfolding acc(inv(this), write) in
;     this.next != null && get(this.next) == 1)
; [eval] (unfolding acc(inv(this), write) in this.next != null && get(this.next) == 1)
(push) ; 7
; [eval] this.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 6 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 6 | First:(Second:(First:($t@2@01))) != Null]
; [eval] this.next != null && get(this.next) == 1
; [eval] this.next != null
(push) ; 9
; [then-branch: 7 | First:(Second:(First:($t@2@01))) == Null | live]
; [else-branch: 7 | First:(Second:(First:($t@2@01))) != Null | live]
(push) ; 10
; [then-branch: 7 | First:(Second:(First:($t@2@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null))
(pop) ; 10
(push) ; 10
; [else-branch: 7 | First:(Second:(First:($t@2@01))) != Null]
; [eval] get(this.next) == 1
; [eval] get(this.next)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (or
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))))
(push) ; 7
(assert (not (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (=
    (get ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
    1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (=
    (get ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
    1)))
; [exec]
; assert (unfolding acc(inv(this), write) in get(this.next) == 1)
; [eval] (unfolding acc(inv(this), write) in get(this.next) == 1)
(push) ; 7
; [eval] this.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 8 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 8 | First:(Second:(First:($t@2@01))) != Null]
; [eval] get(this.next) == 1
; [eval] get(this.next)
(push) ; 9
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
; [eval] (unfolding acc(inv(this), write) in this.next != null)
(push) ; 7
; [eval] this.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 9 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 9 | First:(Second:(First:($t@2@01))) != Null]
; [eval] this.next != null
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 3 | First:(Second:(Second:(Second:(First:($t@2@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.second ($Snap.second ($Snap.first $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
; [exec]
; this.next.value := 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@1@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)))
; [exec]
; fold acc(inv(this.next), write)
; [eval] this.next != null
; [then-branch: 10 | First:(Second:(Second:(Second:(First:($t@2@01))))) != Null | dead]
; [else-branch: 10 | First:(Second:(Second:(Second:(First:($t@2@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 10 | First:(Second:(Second:(Second:(First:($t@2@01))))) == Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
; [exec]
; assert get(this.next) == 1
; [eval] get(this.next) == 1
; [eval] get(this.next)
(push) ; 6
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
(pop) ; 6
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))))
(push) ; 6
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
      $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
  1)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
      $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
  1))
; [exec]
; assert this.value == 0
; [eval] this.value == 0
; [exec]
; fold acc(inv(this), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 11 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 11 | First:(Second:(First:($t@2@01))) != Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        $Snap.unit)))) this@1@01))
; [exec]
; assert get(this) == 0
; [eval] get(this) == 0
; [eval] get(this)
(push) ; 7
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        $Snap.unit)))) this@1@01))
(pop) ; 7
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        $Snap.unit)))) this@1@01))
(push) ; 7
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 1)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
          $Snap.unit)))) this@1@01)
  0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 1)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
          $Snap.unit)))) this@1@01)
  0))
; [exec]
; assert (unfolding acc(inv(this), write) in
;     this.next != null && get(this.next) == 1)
; [eval] (unfolding acc(inv(this), write) in this.next != null && get(this.next) == 1)
(push) ; 7
; [eval] this.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 12 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 12 | First:(Second:(First:($t@2@01))) != Null]
; [eval] this.next != null && get(this.next) == 1
; [eval] this.next != null
(push) ; 9
; [then-branch: 13 | First:(Second:(First:($t@2@01))) == Null | live]
; [else-branch: 13 | First:(Second:(First:($t@2@01))) != Null | live]
(push) ; 10
; [then-branch: 13 | First:(Second:(First:($t@2@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null))
(pop) ; 10
(push) ; 10
; [else-branch: 13 | First:(Second:(First:($t@2@01))) != Null]
; [eval] get(this.next) == 1
; [eval] get(this.next)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
    $Ref.null)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (or
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))))
(push) ; 7
(assert (not (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (=
    (get ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
    1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
      $Ref.null))
  (=
    (get ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
        $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01)))))
    1)))
; [exec]
; assert (unfolding acc(inv(this), write) in get(this.next) == 1)
; [eval] (unfolding acc(inv(this), write) in get(this.next) == 1)
(push) ; 7
; [eval] this.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 14 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 14 | First:(Second:(First:($t@2@01))) != Null]
; [eval] get(this.next) == 1
; [eval] get(this.next)
(push) ; 9
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
; [eval] (unfolding acc(inv(this), write) in this.next != null)
(push) ; 7
; [eval] this.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@2@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:(First:($t@2@01))) != Null | live]
; [else-branch: 15 | First:(Second:(First:($t@2@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 15 | First:(Second:(First:($t@2@01))) != Null]
; [eval] this.next != null
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- goo ----------
(declare-const this@6@01 $Ref)
(declare-const a@7@01 $Ref)
(declare-const b@8@01 $Ref)
(declare-const c@9@01 Bool)
(declare-const this@10@01 $Ref)
(declare-const a@11@01 $Ref)
(declare-const b@12@01 $Ref)
(declare-const c@13@01 Bool)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] a != null
(assert (not (= a@11@01 $Ref.null)))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] b != null
(assert (not (= b@12@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
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
; var z: Ref
(declare-const z@15@01 $Ref)
; [exec]
; unfold acc(inv(a), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 16 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 16 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
    $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  b@12@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.first ($Snap.second ($Snap.second $t@14@01))) a@11@01))
; [exec]
; unfold acc(inv(b), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 17 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
    $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.second ($Snap.second ($Snap.second $t@14@01))) b@12@01))
; [exec]
; a.value := 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; b.value := 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | c@13@01 | live]
; [else-branch: 18 | !(c@13@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | c@13@01]
(assert c@13@01)
; [exec]
; z := a
; [exec]
; fold acc(inv(z), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 19 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 19 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  a@11@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert c ==> acc(inv(a), write) && get(a) == 0
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | c@13@01 | live]
; [else-branch: 20 | !(c@13@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 20 | c@13@01]
; [eval] get(a) == 0
; [eval] get(a)
(push) ; 8
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01))
(pop) ; 8
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01))
(push) ; 8
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01)
  0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01)
  0))
; [exec]
; assert !c ==> acc(inv(b), write) && get(b) == 1
; [eval] !c
; [then-branch: 21 | !(c@13@01) | dead]
; [else-branch: 21 | c@13@01 | live]
(push) ; 8
; [else-branch: 21 | c@13@01]
; [exec]
; unfold acc(inv(z), write)
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 22 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 22 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null]
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a.value == 0
; [eval] a.value == 0
; [exec]
; assert b.value == 1
; [eval] b.value == 1
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 18 | !(c@13@01)]
(assert (not c@13@01))
(pop) ; 5
; [eval] !c
(push) ; 5
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | !(c@13@01) | live]
; [else-branch: 23 | c@13@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | !(c@13@01)]
(assert (not c@13@01))
; [exec]
; z := b
; [exec]
; fold acc(inv(z), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 24 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 24 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  b@12@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert c ==> acc(inv(a), write) && get(a) == 0
; [then-branch: 25 | c@13@01 | dead]
; [else-branch: 25 | !(c@13@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 25 | !(c@13@01)]
; [exec]
; assert !c ==> acc(inv(b), write) && get(b) == 1
; [eval] !c
(push) ; 8
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | !(c@13@01) | live]
; [else-branch: 26 | c@13@01 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 26 | !(c@13@01)]
; [eval] get(b) == 1
; [eval] get(b)
(push) ; 9
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01))
(pop) ; 9
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01))
(push) ; 9
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01)
  1)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01)
  1))
; [exec]
; unfold acc(inv(z), write)
(push) ; 9
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 27 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 27 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null]
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a.value == 0
; [eval] a.value == 0
; [exec]
; assert b.value == 1
; [eval] b.value == 1
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 23 | c@13@01]
(assert c@13@01)
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 17 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.second ($Snap.second ($Snap.second $t@14@01))) b@12@01))
; [exec]
; a.value := 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; b.value := 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | c@13@01 | live]
; [else-branch: 28 | !(c@13@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 28 | c@13@01]
(assert c@13@01)
; [exec]
; z := a
; [exec]
; fold acc(inv(z), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 29 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 29 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01))
; [exec]
; assert c ==> acc(inv(a), write) && get(a) == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | c@13@01 | live]
; [else-branch: 30 | !(c@13@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 30 | c@13@01]
; [eval] get(a) == 0
; [eval] get(a)
(push) ; 8
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01))
(pop) ; 8
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01))
(push) ; 8
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01)
  0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))) a@11@01)
  0))
; [exec]
; assert !c ==> acc(inv(b), write) && get(b) == 1
; [eval] !c
; [then-branch: 31 | !(c@13@01) | dead]
; [else-branch: 31 | c@13@01 | live]
(push) ; 8
; [else-branch: 31 | c@13@01]
; [exec]
; unfold acc(inv(z), write)
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 32 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 32 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a.value == 0
; [eval] a.value == 0
; [exec]
; assert b.value == 1
; [eval] b.value == 1
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 28 | !(c@13@01)]
(assert (not c@13@01))
(pop) ; 5
; [eval] !c
(push) ; 5
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | !(c@13@01) | live]
; [else-branch: 33 | c@13@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 33 | !(c@13@01)]
(assert (not c@13@01))
; [exec]
; z := b
; [exec]
; fold acc(inv(z), write)
; [eval] this.next != null
; [then-branch: 34 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | dead]
; [else-branch: 34 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | live]
(push) ; 6
; [else-branch: 34 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) b@12@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  b@12@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert c ==> acc(inv(a), write) && get(a) == 0
; [then-branch: 35 | c@13@01 | dead]
; [else-branch: 35 | !(c@13@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 35 | !(c@13@01)]
; [exec]
; assert !c ==> acc(inv(b), write) && get(b) == 1
; [eval] !c
(push) ; 8
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | !(c@13@01) | live]
; [else-branch: 36 | c@13@01 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 36 | !(c@13@01)]
; [eval] get(b) == 1
; [eval] get(b)
(push) ; 9
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) b@12@01))
(pop) ; 9
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) b@12@01))
(push) ; 9
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      $Snap.unit)) b@12@01)
  1)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      $Snap.unit)) b@12@01)
  1))
; [exec]
; unfold acc(inv(z), write)
(push) ; 9
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
; [then-branch: 37 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | dead]
; [else-branch: 37 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 37 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a.value == 0
; [eval] a.value == 0
; [exec]
; assert b.value == 1
; [eval] b.value == 1
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 33 | c@13@01]
(assert c@13@01)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 16 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.first ($Snap.second ($Snap.second $t@14@01))) a@11@01))
; [exec]
; unfold acc(inv(b), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 38 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 38 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.second ($Snap.second ($Snap.second $t@14@01))) b@12@01))
; [exec]
; a.value := 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; b.value := 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | c@13@01 | live]
; [else-branch: 39 | !(c@13@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 39 | c@13@01]
(assert c@13@01)
; [exec]
; z := a
; [exec]
; fold acc(inv(z), write)
; [eval] this.next != null
; [then-branch: 40 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | dead]
; [else-branch: 40 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | live]
(push) ; 6
; [else-branch: 40 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) a@11@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  a@11@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert c ==> acc(inv(a), write) && get(a) == 0
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | c@13@01 | live]
; [else-branch: 41 | !(c@13@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 41 | c@13@01]
; [eval] get(a) == 0
; [eval] get(a)
(push) ; 8
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) a@11@01))
(pop) ; 8
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) a@11@01))
(push) ; 8
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
      $Snap.unit)) a@11@01)
  0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
      $Snap.unit)) a@11@01)
  0))
; [exec]
; assert !c ==> acc(inv(b), write) && get(b) == 1
; [eval] !c
; [then-branch: 42 | !(c@13@01) | dead]
; [else-branch: 42 | c@13@01 | live]
(push) ; 8
; [else-branch: 42 | c@13@01]
; [exec]
; unfold acc(inv(z), write)
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
; [then-branch: 43 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | dead]
; [else-branch: 43 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 43 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a.value == 0
; [eval] a.value == 0
; [exec]
; assert b.value == 1
; [eval] b.value == 1
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 39 | !(c@13@01)]
(assert (not c@13@01))
(pop) ; 5
; [eval] !c
(push) ; 5
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | !(c@13@01) | live]
; [else-branch: 44 | c@13@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 44 | !(c@13@01)]
(assert (not c@13@01))
; [exec]
; z := b
; [exec]
; fold acc(inv(z), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 45 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 45 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01))
; [exec]
; assert c ==> acc(inv(a), write) && get(a) == 0
; [then-branch: 46 | c@13@01 | dead]
; [else-branch: 46 | !(c@13@01) | live]
(push) ; 7
; [else-branch: 46 | !(c@13@01)]
; [exec]
; assert !c ==> acc(inv(b), write) && get(b) == 1
; [eval] !c
(push) ; 8
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | !(c@13@01) | live]
; [else-branch: 47 | c@13@01 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 47 | !(c@13@01)]
; [eval] get(b) == 1
; [eval] get(b)
(push) ; 9
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01))
(pop) ; 9
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01))
(push) ; 9
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01)
  1)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))) b@12@01)
  1))
; [exec]
; unfold acc(inv(z), write)
(push) ; 9
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | live]
; [else-branch: 48 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 48 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a.value == 0
; [eval] a.value == 0
; [exec]
; assert b.value == 1
; [eval] b.value == 1
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 44 | c@13@01]
(assert c@13@01)
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 38 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.second ($Snap.second ($Snap.second $t@14@01))) b@12@01))
; [exec]
; a.value := 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; b.value := 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | c@13@01 | live]
; [else-branch: 49 | !(c@13@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 49 | c@13@01]
(assert c@13@01)
; [exec]
; z := a
; [exec]
; fold acc(inv(z), write)
; [eval] this.next != null
; [then-branch: 50 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | dead]
; [else-branch: 50 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | live]
(push) ; 6
; [else-branch: 50 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) a@11@01))
; [exec]
; assert c ==> acc(inv(a), write) && get(a) == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | c@13@01 | live]
; [else-branch: 51 | !(c@13@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 51 | c@13@01]
; [eval] get(a) == 0
; [eval] get(a)
(push) ; 8
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) a@11@01))
(pop) ; 8
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 0)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) a@11@01))
(push) ; 8
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
      $Snap.unit)) a@11@01)
  0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@14@01)))))
      $Snap.unit)) a@11@01)
  0))
; [exec]
; assert !c ==> acc(inv(b), write) && get(b) == 1
; [eval] !c
; [then-branch: 52 | !(c@13@01) | dead]
; [else-branch: 52 | c@13@01 | live]
(push) ; 8
; [else-branch: 52 | c@13@01]
; [exec]
; unfold acc(inv(z), write)
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@12@01 a@11@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
; [then-branch: 53 | First:(Second:(First:(Second:(Second:($t@14@01))))) != Null | dead]
; [else-branch: 53 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 53 | First:(Second:(First:(Second:(Second:($t@14@01))))) == Null]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a.value == 0
; [eval] a.value == 0
; [exec]
; assert b.value == 1
; [eval] b.value == 1
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 49 | !(c@13@01)]
(assert (not c@13@01))
(pop) ; 5
; [eval] !c
(push) ; 5
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | !(c@13@01) | live]
; [else-branch: 54 | c@13@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 54 | !(c@13@01)]
(assert (not c@13@01))
; [exec]
; z := b
; [exec]
; fold acc(inv(z), write)
; [eval] this.next != null
; [then-branch: 55 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | dead]
; [else-branch: 55 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | live]
(push) ; 6
; [else-branch: 55 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null]
(assert (inv%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) b@12@01))
; [exec]
; assert c ==> acc(inv(a), write) && get(a) == 0
; [then-branch: 56 | c@13@01 | dead]
; [else-branch: 56 | !(c@13@01) | live]
(push) ; 7
; [else-branch: 56 | !(c@13@01)]
; [exec]
; assert !c ==> acc(inv(b), write) && get(b) == 1
; [eval] !c
(push) ; 8
(set-option :timeout 10)
(assert (not c@13@01))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | !(c@13@01) | live]
; [else-branch: 57 | c@13@01 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 57 | !(c@13@01)]
; [eval] get(b) == 1
; [eval] get(b)
(push) ; 9
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) b@12@01))
(pop) ; 9
; Joined path conditions
(assert (get%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
    $Snap.unit)) b@12@01))
(push) ; 9
(assert (not (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      $Snap.unit)) b@12@01)
  1)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))
      $Snap.unit)) b@12@01)
  1))
; [exec]
; unfold acc(inv(z), write)
(push) ; 9
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= a@11@01 b@12@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
; [then-branch: 58 | First:(Second:(Second:(Second:(Second:($t@14@01))))) != Null | dead]
; [else-branch: 58 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 58 | First:(Second:(Second:(Second:(Second:($t@14@01))))) == Null]
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a.value == 0
; [eval] a.value == 0
; [exec]
; assert b.value == 1
; [eval] b.value == 1
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 54 | c@13@01]
(assert c@13@01)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
