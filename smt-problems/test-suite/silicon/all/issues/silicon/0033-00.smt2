(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0033.vpr
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
(declare-fun size ($Snap $Ref) Int)
(declare-fun size%limited ($Snap $Ref) Int)
(declare-fun size%stateless ($Ref) Bool)
(declare-fun size%precondition ($Snap $Ref) Bool)
(declare-fun size_0 ($Snap $Ref) Int)
(declare-fun size_0%limited ($Snap $Ref) Int)
(declare-fun size_0%stateless ($Ref) Bool)
(declare-fun size_0%precondition ($Snap $Ref) Bool)
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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@5@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@7@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@8@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (size%limited s@$ this@0@00) (size s@$ this@0@00))
  :pattern ((size s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (size%stateless this@0@00)
  :pattern ((size%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (size%limited s@$ this@0@00))) (=>
    (size%precondition s@$ this@0@00)
    (>= result@1@00 1)))
  :pattern ((size%limited s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (size%limited s@$ this@0@00))) true)
  :pattern ((size%limited s@$ this@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (size%precondition s@$ this@0@00)
    (=
      (size s@$ this@0@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        1
        (+
          1
          (size%limited ($Snap.combine
            $Snap.unit
            ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((size s@$ this@0@00))
  :pattern ((size%stateless this@0@00) (valid%trigger ($Snap.second s@$) this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (size%precondition s@$ this@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (size%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((size s@$ this@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (size_0%limited s@$ this@2@00) (size_0 s@$ this@2@00))
  :pattern ((size_0 s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (size_0%stateless this@2@00)
  :pattern ((size_0%limited s@$ this@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (size_0%limited s@$ this@2@00))) (=>
    (size_0%precondition s@$ this@2@00)
    (>= result@3@00 1)))
  :pattern ((size_0%limited s@$ this@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (size_0%limited s@$ this@2@00))) true)
  :pattern ((size_0%limited s@$ this@2@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (=>
    (size_0%precondition s@$ this@2@00)
    (=
      (size_0 s@$ this@2@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        1
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
            $Ref.null)
          2
          (+
            2
            (size_0%limited ($Snap.combine
              $Snap.unit
              ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((size_0 s@$ this@2@00))
  :pattern ((size_0%stateless this@2@00) (valid%trigger ($Snap.second s@$) this@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (=>
    (size_0%precondition s@$ this@2@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
          $Ref.null)
        true
        (size_0%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))
  :pattern ((size_0 s@$ this@2@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- unfoldOnce ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(assert (= ($Snap.second ($Snap.second $t@2@01)) $Snap.unit))
; [eval] size(this) == 1
; [eval] size(this)
(push) ; 2
; [eval] this != null
(assert (size%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@2@01))) this@1@01))
(pop) ; 2
; Joined path conditions
(assert (size%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@2@01))) this@1@01))
(assert (=
  (size ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@2@01))) this@1@01)
  1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this), write)
(assert (=
  ($Snap.first ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@2@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@2@01))))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@2@01))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(First:(Second:($t@2@01))) != Null | dead]
; [else-branch: 0 | First:(First:(Second:($t@2@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | First:(First:(Second:($t@2@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@2@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.first ($Snap.second $t@2@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.first ($Snap.second $t@2@01)) this@1@01))
; [exec]
; assert this.next == null
; [eval] this.next == null
; [exec]
; assert this.next != null
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@2@01))))
    $Ref.null))))
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
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@2@01))))
    $Ref.null))))
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
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@2@01))))
    $Ref.null))))
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
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@2@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- unfoldTwice ----------
(declare-const this@3@01 $Ref)
(declare-const this@4@01 $Ref)
(push) ; 1
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.first $t@5@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@4@01 $Ref.null)))
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
(assert (= ($Snap.second ($Snap.second $t@5@01)) $Snap.unit))
; [eval] size(this) == 2
; [eval] size(this)
(push) ; 2
; [eval] this != null
(assert (size%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@5@01))) this@4@01))
(pop) ; 2
; Joined path conditions
(assert (size%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@5@01))) this@4@01))
(assert (=
  (size ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@5@01))) this@4@01)
  2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this), write)
(assert (=
  ($Snap.first ($Snap.second $t@5@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@5@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@5@01))))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@5@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@5@01))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(First:(Second:($t@5@01))) != Null | live]
; [else-branch: 1 | First:(First:(Second:($t@5@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | First:(First:(Second:($t@5@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@5@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.first ($Snap.second $t@5@01)) this@4@01))
; [exec]
; unfold acc(valid(this.next), write)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@5@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@5@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@5@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@4@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@5@01)))))))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@5@01)))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@5@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(First:(Second:($t@5@01)))) != Null | live]
; [else-branch: 2 | First:(Second:(First:(Second:($t@5@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(Second:(First:(Second:($t@5@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@5@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.first ($Snap.second $t@5@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@5@01))))))
; [exec]
; assert this.next.next == null
; [eval] this.next.next == null
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@5@01)))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@5@01)))))
  $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | First:(Second:(First:(Second:($t@5@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@5@01)))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@5@01)))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.first ($Snap.second $t@5@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@5@01))))))
; [exec]
; assert this.next.next == null
; [eval] this.next.next == null
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- unfoldThrice ----------
(declare-const this@6@01 $Ref)
(declare-const this@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@7@01 $Ref.null)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.second ($Snap.second $t@8@01)) $Snap.unit))
; [eval] size(this) == 3
; [eval] size(this)
(push) ; 2
; [eval] this != null
(assert (size%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@8@01))) this@7@01))
(pop) ; 2
; Joined path conditions
(assert (size%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@8@01))) this@7@01))
(assert (=
  (size ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@8@01))) this@7@01)
  3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this), write)
(assert (=
  ($Snap.first ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@8@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@8@01))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(First:(Second:($t@8@01))) != Null | live]
; [else-branch: 3 | First:(First:(Second:($t@8@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:(First:(Second:($t@8@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@8@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.first ($Snap.second $t@8@01)) this@7@01))
; [exec]
; unfold acc(valid(this.next), write)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@7@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@8@01)))))))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(First:(Second:($t@8@01)))) != Null | live]
; [else-branch: 4 | First:(Second:(First:(Second:($t@8@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(Second:(First:(Second:($t@8@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.first ($Snap.second $t@8@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@8@01))))))
; [exec]
; unfold acc(valid(this.next.next), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@8@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@7@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(Second:(First:(Second:($t@8@01))))) != Null | live]
; [else-branch: 5 | First:(Second:(Second:(First:(Second:($t@8@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | First:(Second:(Second:(First:(Second:($t@8@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))))
; [exec]
; assert this.next.next.next == null
; [eval] this.next.next.next == null
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))
  $Ref.null))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | First:(Second:(Second:(First:(Second:($t@8@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))))
; [exec]
; assert this.next.next.next == null
; [eval] this.next.next.next == null
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | First:(Second:(First:(Second:($t@8@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@8@01)))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@8@01)))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second ($Snap.first ($Snap.second $t@8@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@8@01))))))
; [exec]
; unfold acc(valid(this.next.next), write)
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- unrollExpression ----------
(declare-const this@9@01 $Ref)
(declare-const this@10@01 $Ref)
(push) ; 1
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.first $t@11@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@10@01 $Ref.null)))
(assert (=
  ($Snap.second $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.second ($Snap.second $t@11@01)))))
(assert (= ($Snap.second ($Snap.second $t@11@01)) $Snap.unit))
; [eval] size_0(this) == 2
; [eval] size_0(this)
(push) ; 2
; [eval] this != null
(assert (size_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@11@01))) this@10@01))
(pop) ; 2
; Joined path conditions
(assert (size_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@11@01))) this@10@01))
(assert (=
  (size_0 ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@11@01))) this@10@01)
  2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(valid(this), write) in
;     (unfolding acc(valid(this.next), write) in this.next.next == null))
; [eval] (unfolding acc(valid(this), write) in (unfolding acc(valid(this.next), write) in this.next.next == null))
(push) ; 3
(assert (valid%trigger ($Snap.first ($Snap.second $t@11@01)) this@10@01))
(assert (=
  ($Snap.first ($Snap.second $t@11@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@11@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@11@01))))))
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(First:(Second:($t@11@01))) != Null | live]
; [else-branch: 6 | First:(First:(Second:($t@11@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | First:(First:(Second:($t@11@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01))))
    $Ref.null)))
; [eval] (unfolding acc(valid(this.next), write) in this.next.next == null)
(push) ; 5
(assert (valid%trigger ($Snap.second ($Snap.first ($Snap.second $t@11@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@11@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  this@10@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01)))))))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(First:(Second:($t@11@01)))) != Null | dead]
; [else-branch: 7 | First:(Second:(First:(Second:($t@11@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 7 | First:(Second:(First:(Second:($t@11@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@11@01))))
  $Snap.unit))
; [eval] this.next.next == null
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.second ($Snap.first ($Snap.second $t@11@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01)))))
  (=
    ($Snap.second ($Snap.first ($Snap.second $t@11@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@11@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@11@01))))
      $Snap.unit))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
  $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second $t@11@01)) this@10@01)
  (=
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@11@01)))
      ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01))))
        $Ref.null))
    (valid%trigger ($Snap.second ($Snap.first ($Snap.second $t@11@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01)))))
    (=
      ($Snap.second ($Snap.first ($Snap.second $t@11@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@11@01))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@11@01))))
          $Snap.unit)))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
      $Ref.null))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@11@01))))
    $Ref.null)))
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@11@01)))))
  $Ref.null))
(pop) ; 2
(pop) ; 1
