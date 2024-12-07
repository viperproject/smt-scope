(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0113.vpr
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
(declare-fun contains ($Snap $Ref Int) Bool)
(declare-fun contains%limited ($Snap $Ref Int) Bool)
(declare-fun contains%stateless ($Ref Int) Bool)
(declare-fun contains%precondition ($Snap $Ref Int) Bool)
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
; ---------- FUNCTION contains----------
(declare-fun this@0@00 () $Ref)
(declare-fun i@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this != null
(assert (not (= this@0@00 $Ref.null)))
(declare-const $k@3@00 $Perm)
(assert ($Perm.isReadVar $k@3@00))
(assert (<= $Perm.No $k@3@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (= (contains%limited s@$ this@0@00 i@1@00) (contains s@$ this@0@00 i@1@00))
  :pattern ((contains s@$ this@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (contains%stateless this@0@00 i@1@00)
  :pattern ((contains%limited s@$ this@0@00 i@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@3@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this@0@00 $Ref.null)))
(assert (<= $Perm.No $k@3@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(valid(this), wildcard) in i == this.value || this.next != null && contains(this.next, i))
(declare-const $k@4@00 $Perm)
(assert ($Perm.isReadVar $k@4@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@5@00 $Perm)
(assert ($Perm.isReadVar $k@5@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@3@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@5@00 $k@3@00))
(assert (<= $Perm.No (- $k@3@00 $k@5@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (valid%trigger ($Snap.second s@$) this@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@4@00))
(assert (<= $k@4@00 $Perm.Write))
(assert (=> (< $Perm.No $k@4@00) (not (= this@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(s@$)) != Null | live]
; [else-branch: 0 | First:(Second:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] i == this.value || this.next != null && contains(this.next, i)
; [eval] i == this.value
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | i@1@00 == First:(Second:(Second:(s@$))) | live]
; [else-branch: 1 | i@1@00 != First:(Second:(Second:(s@$))) | live]
(push) ; 5
; [then-branch: 1 | i@1@00 == First:(Second:(Second:(s@$)))]
(assert (=
  i@1@00
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i@1@00 != First:(Second:(Second:(s@$)))]
(assert (not
  (=
    i@1@00
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))))
; [eval] this.next != null && contains(this.next, i)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | First:(Second:(s@$)) == Null | live]
; [else-branch: 2 | First:(Second:(s@$)) != Null | live]
(push) ; 7
; [then-branch: 2 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | First:(Second:(s@$)) != Null]
; [eval] contains(this.next, i)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
; [eval] this != null
(declare-const $k@6@00 $Perm)
(assert ($Perm.isReadVar $k@6@00))
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $k@4@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (< $k@6@00 $k@4@00))
(assert (<= $Perm.No (- $k@4@00 $k@6@00)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@6@00))
(assert (and
  (< $k@6@00 $k@4@00)
  (<= $Perm.No (- $k@4@00 $k@6@00))
  (contains%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@6@00))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (< $k@6@00 $k@4@00)
    (<= $Perm.No (- $k@4@00 $k@6@00))
    (contains%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))
(assert (or
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@6@00))
(assert (=>
  (not
    (=
      i@1@00
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (and
    (not
      (=
        i@1@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (< $k@6@00 $k@4@00)
        (<= $Perm.No (- $k@4@00 $k@6@00))
        (contains%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))))
(assert (or
  (not
    (=
      i@1@00
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (=
    i@1@00
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] i == this.value || this.next != null && contains(this.next, i)
; [eval] i == this.value
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | i@1@00 == First:(Second:(Second:(s@$))) | live]
; [else-branch: 3 | i@1@00 != First:(Second:(Second:(s@$))) | live]
(push) ; 5
; [then-branch: 3 | i@1@00 == First:(Second:(Second:(s@$)))]
(assert (=
  i@1@00
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | i@1@00 != First:(Second:(Second:(s@$)))]
(assert (not
  (=
    i@1@00
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))))
; [eval] this.next != null && contains(this.next, i)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | First:(Second:(s@$)) == Null | live]
; [else-branch: 4 | First:(Second:(s@$)) != Null | live]
(push) ; 7
; [then-branch: 4 | First:(Second:(s@$)) == Null]
(pop) ; 7
(push) ; 7
; [else-branch: 4 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
; [eval] contains(this.next, i)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
; [eval] this != null
(declare-const $k@7@00 $Perm)
(assert ($Perm.isReadVar $k@7@00))
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= (- $k@3@00 $k@5@00) $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (< $k@7@00 (- $k@3@00 $k@5@00)))
(assert (<= $Perm.No (- (- $k@3@00 $k@5@00) $k@7@00)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@7@00))
(assert (and
  (< $k@7@00 (- $k@3@00 $k@5@00))
  (<= $Perm.No (- (- $k@3@00 $k@5@00) $k@7@00))
  (contains%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@7@00))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (< $k@7@00 (- $k@3@00 $k@5@00))
    (<= $Perm.No (- (- $k@3@00 $k@5@00) $k@7@00))
    (contains%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))
(assert (or
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@7@00))
(assert (=>
  (not
    (=
      i@1@00
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (and
    (not
      (=
        i@1@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (< $k@7@00 (- $k@3@00 $k@5@00))
        (<= $Perm.No (- (- $k@3@00 $k@5@00) $k@7@00))
        (contains%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))))
(assert (or
  (not
    (=
      i@1@00
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (=
    i@1@00
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@8@00 ($Snap $Ref Int) Bool)
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (=
    (joined_unfolding@8@00 s@$ this@0@00 i@1@00)
    (or
      (=
        i@1@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (contains ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (=
    (joined_unfolding@8@00 s@$ this@0@00 i@1@00)
    (or
      (=
        i@1@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (contains ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@5@00))
(assert ($Perm.isReadVar $k@6@00))
(assert (and
  (< $k@5@00 $k@3@00)
  (<= $Perm.No (- $k@3@00 $k@5@00))
  (valid%trigger ($Snap.second s@$) this@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@4@00)
  (<= $k@4@00 $Perm.Write)
  (=> (< $Perm.No $k@4@00) (not (= this@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=>
      (not
        (=
          i@1@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (not
          (=
            i@1@00
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null))
          (and
            (< $k@6@00 $k@4@00)
            (<= $Perm.No (- $k@4@00 $k@6@00))
            (contains%precondition ($Snap.combine
              $Snap.unit
              ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))))
    (or
      (not
        (=
          i@1@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (=
        i@1@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@7@00))
(assert (and
  (< $k@5@00 $k@3@00)
  (<= $Perm.No (- $k@3@00 $k@5@00))
  (valid%trigger ($Snap.second s@$) this@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@4@00)
  (<= $k@4@00 $Perm.Write)
  (=> (< $Perm.No $k@4@00) (not (= this@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (=
          i@1@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (not
          (=
            i@1@00
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                $Ref.null))
            (< $k@7@00 (- $k@3@00 $k@5@00))
            (<= $Perm.No (- (- $k@3@00 $k@5@00) $k@7@00))
            (contains%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))))
    (or
      (not
        (=
          i@1@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (=
        i@1@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(assert (= result@2@00 (joined_unfolding@8@00 s@$ this@0@00 i@1@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (and
    ($Perm.isReadVar $k@3@00)
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    (=>
      (contains%precondition s@$ this@0@00 i@1@00)
      (=
        (contains s@$ this@0@00 i@1@00)
        (or
          (=
            i@1@00
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                $Ref.null))
            (contains%limited (ite
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  $Ref.null))
              ($Snap.combine
                $Snap.unit
                ($Snap.second ($Snap.second ($Snap.second s@$))))
              ($Snap.combine $Snap.unit ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))))
  :pattern ((contains s@$ this@0@00 i@1@00))
  :pattern ((contains%stateless this@0@00 i@1@00) (valid%trigger ($Snap.second s@$) this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (=>
    (and
      (contains%precondition s@$ this@0@00 i@1@00)
      (and
        (not
          (=
            i@1@00
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))))
    (contains%precondition (ite
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      ($Snap.combine $Snap.unit ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.combine $Snap.unit ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))
  :pattern ((contains s@$ this@0@00 i@1@00))
  :qid |quant-u-3|)))
; ---------- valid ----------
(declare-const this@9@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 ($Snap.combine ($Snap.first $t@10@00) ($Snap.second $t@10@00))))
(assert (not (= this@9@00 $Ref.null)))
(assert (=
  ($Snap.second $t@10@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@00))
    ($Snap.second ($Snap.second $t@10@00)))))
; [eval] this.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:($t@10@00) != Null | live]
; [else-branch: 5 | First:($t@10@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 5 | First:($t@10@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00)) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 5 | First:($t@10@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@10@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
