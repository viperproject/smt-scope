(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/funcpred.vpr
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
(declare-fun itemat ($Snap $Ref Int) Int)
(declare-fun itemat%limited ($Snap $Ref Int) Int)
(declare-fun itemat%stateless ($Ref Int) Bool)
(declare-fun itemat%precondition ($Snap $Ref Int) Bool)
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
(declare-fun $k@3@00 () $Perm)
(declare-fun joined_unfolding@7@00 ($Snap $Ref Int) Int)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(assert (forall ((s@$ $Snap) (node@0@00 $Ref) (i@1@00 Int)) (!
  (= (itemat%limited s@$ node@0@00 i@1@00) (itemat s@$ node@0@00 i@1@00))
  :pattern ((itemat s@$ node@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (node@0@00 $Ref) (i@1@00 Int)) (!
  (itemat%stateless node@0@00 i@1@00)
  :pattern ((itemat%limited s@$ node@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (node@0@00 $Ref) (i@1@00 Int)) (!
  (and
    ($Perm.isReadVar $k@3@00)
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    (=>
      (itemat%precondition s@$ node@0@00 i@1@00)
      (=
        (itemat s@$ node@0@00 i@1@00)
        (ite
          (or
            (= i@1@00 0)
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
              $Ref.null))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
          (itemat%limited ($Snap.combine
            ($Snap.second ($Snap.second ($Snap.first s@$)))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
            i@1@00
            1))))))
  :pattern ((itemat s@$ node@0@00 i@1@00))
  :pattern ((itemat%stateless node@0@00 i@1@00) (valid%trigger ($Snap.first s@$) node@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (node@0@00 $Ref) (i@1@00 Int)) (!
  (=>
    (itemat%precondition s@$ node@0@00 i@1@00)
    (ite
      (or
        (= i@1@00 0)
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      true
      (itemat%precondition ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.first s@$)))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
        i@1@00
        1))))
  :pattern ((itemat s@$ node@0@00 i@1@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- a ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= this@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this), write)
(assert (=
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.second ($Snap.first $t@2@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@2@01))))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(First:($t@2@01)) != Null | live]
; [else-branch: 0 | First:(First:($t@2@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(First:($t@2@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.first $t@2@01) this@1@01))
; [exec]
; this.value := 1
; [exec]
; fold acc(valid(this), write)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(First:($t@2@01)) != Null | live]
; [else-branch: 1 | First:(First:($t@2@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(First:($t@2@01)) != Null]
(assert (valid%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@2@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.second ($Snap.second ($Snap.first $t@2@01))))) this@1@01))
; [exec]
; void(this)
(declare-const $t@4@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert itemat(this, 0) == 1
; [eval] itemat(this, 0) == 1
; [eval] itemat(this, 0)
(set-option :timeout 0)
(push) ; 5
(declare-const $k@5@01 $Perm)
(assert ($Perm.isReadVar $k@5@01))
(assert (< $k@5@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@5@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] i >= 0
(assert (itemat%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
  $Snap.unit) this@1@01 0))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@5@01))
(assert (and
  (< $k@5@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@5@01))
  (itemat%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 1)
        ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    $Snap.unit) this@1@01 0)))
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  (itemat ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 1)
        ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    $Snap.unit) this@1@01 0)
  1)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  (itemat ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 1)
        ($Snap.second ($Snap.second ($Snap.first $t@2@01)))))
    $Snap.unit) this@1@01 0)
  1))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(First:($t@2@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@2@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.first $t@2@01) this@1@01))
; [exec]
; this.value := 1
; [exec]
; fold acc(valid(this), write)
; [eval] this.next != null
; [then-branch: 2 | First:(First:($t@2@01)) != Null | dead]
; [else-branch: 2 | First:(First:($t@2@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | First:(First:($t@2@01)) == Null]
(assert (valid%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@2@01))
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit)) this@1@01))
; [exec]
; void(this)
(declare-const $t@6@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert itemat(this, 0) == 1
; [eval] itemat(this, 0) == 1
; [eval] itemat(this, 0)
(set-option :timeout 0)
(push) ; 5
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (< $k@7@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@7@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] i >= 0
(assert (itemat%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit))
  $Snap.unit) this@1@01 0))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@7@01))
(assert (and
  (< $k@7@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@7@01))
  (itemat%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit))
    $Snap.unit) this@1@01 0)))
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  (itemat ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit))
    $Snap.unit) this@1@01 0)
  1)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  (itemat ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.combine ($SortWrappers.IntTo$Snap 1) $Snap.unit))
    $Snap.unit) this@1@01 0)
  1))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- void ----------
(declare-const this@8@01 $Ref)
(declare-const this@9@01 $Ref)
(push) ; 1
(declare-const $t@10@01 Int)
(assert (not (= this@9@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 Int)
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
