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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@3@00 () $Perm)
(declare-fun joined_unfolding@8@00 ($Snap $Ref Int) Bool)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (= (contains%limited s@$ this@0@00 i@1@00) (contains s@$ this@0@00 i@1@00))
  :pattern ((contains s@$ this@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (contains%stateless this@0@00 i@1@00)
  :pattern ((contains%limited s@$ this@0@00 i@1@00))
  :qid |quant-u-1|)))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- addother ----------
(declare-const this@0@01 $Ref)
(declare-const i@1@01 Int)
(declare-const this@2@01 $Ref)
(declare-const i@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] (forall x: Int :: { old(contains(this, x)) } contains(this, x) == old(contains(this, x)) || x == i)
(declare-const x@6@01 Int)
(push) ; 3
; [eval] contains(this, x) == old(contains(this, x)) || x == i
; [eval] contains(this, x) == old(contains(this, x))
; [eval] contains(this, x)
(push) ; 4
; [eval] this != null
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (< $k@7@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@7@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@7@01))
(assert (and
  (< $k@7@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@7@01))
  (contains%precondition ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)))
; [eval] old(contains(this, x))
; [eval] contains(this, x)
(set-option :timeout 0)
(push) ; 4
; [eval] this != null
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (< $k@8@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@8@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@8@01))
(assert (and
  (< $k@8@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@8@01))
  (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01)))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | contains((_, First:($t@5@01)), this@2@01, x@6@01) == contains((_, Second:($t@4@01)), this@2@01, x@6@01) | live]
; [else-branch: 0 | contains((_, First:($t@5@01)), this@2@01, x@6@01) != contains((_, Second:($t@4@01)), this@2@01, x@6@01) | live]
(push) ; 5
; [then-branch: 0 | contains((_, First:($t@5@01)), this@2@01, x@6@01) == contains((_, Second:($t@4@01)), this@2@01, x@6@01)]
(assert (=
  (contains ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)
  (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | contains((_, First:($t@5@01)), this@2@01, x@6@01) != contains((_, Second:($t@4@01)), this@2@01, x@6@01)]
(assert (not
  (=
    (contains ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)
    (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01))))
; [eval] x == i
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (contains ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)
      (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01)))
  (=
    (contains ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)
    (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@7@01))
(assert ($Perm.isReadVar $k@8@01))
(assert (< $k@7@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@7@01)))
(assert (< $k@8@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@8@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@6@01 Int)) (!
  (and
    (contains%precondition ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)
    (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01)
    (or
      (not
        (=
          (contains ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)
          (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01)))
      (=
        (contains ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)
        (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01))))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85-aux|)))
(assert (forall ((x@6@01 Int)) (!
  (or
    (=
      (contains ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) this@2@01 x@6@01)
      (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01))
    (= x@6@01 i@3@01))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85|)))
(pop) ; 2
(push) ; 2
; [exec]
; var n: Ref
(declare-const n@9@01 $Ref)
; [exec]
; unfold acc(valid(this), write)
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:($t@4@01)) != Null | live]
; [else-branch: 1 | First:(Second:($t@4@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | First:(Second:($t@4@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second $t@4@01) this@2@01))
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:($t@4@01)) != Null | live]
; [else-branch: 2 | First:(Second:($t@4@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(Second:($t@4@01)) != Null]
; [exec]
; addother(this.next, i)
; [eval] this != null
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] (forall x: Int :: { old(contains(this, x)) } contains(this, x) == old(contains(this, x)) || x == i)
(declare-const x@11@01 Int)
(push) ; 5
; [eval] contains(this, x) == old(contains(this, x)) || x == i
; [eval] contains(this, x) == old(contains(this, x))
; [eval] contains(this, x)
(push) ; 6
; [eval] this != null
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(assert (< $k@12@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@12@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@12@01))
(assert (and
  (< $k@12@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@12@01))
  (contains%precondition ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)))
; [eval] old(contains(this, x))
; [eval] contains(this, x)
(set-option :timeout 0)
(push) ; 6
; [eval] this != null
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(assert (< $k@13@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@13@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@13@01))
(assert (and
  (< $k@13@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@13@01))
  (contains%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | contains((_, First:($t@10@01)), First:(Second:($t@4@01)), x@11@01) == contains((_, Second:(Second:(Second:($t@4@01)))), First:(Second:($t@4@01)), x@11@01) | live]
; [else-branch: 3 | contains((_, First:($t@10@01)), First:(Second:($t@4@01)), x@11@01) != contains((_, Second:(Second:(Second:($t@4@01)))), First:(Second:($t@4@01)), x@11@01) | live]
(push) ; 7
; [then-branch: 3 | contains((_, First:($t@10@01)), First:(Second:($t@4@01)), x@11@01) == contains((_, Second:(Second:(Second:($t@4@01)))), First:(Second:($t@4@01)), x@11@01)]
(assert (=
  (contains ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
  (contains ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | contains((_, First:($t@10@01)), First:(Second:($t@4@01)), x@11@01) != contains((_, Second:(Second:(Second:($t@4@01)))), First:(Second:($t@4@01)), x@11@01)]
(assert (not
  (=
    (contains ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
    (contains ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01))))
; [eval] x == i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (contains ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
      (contains ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)))
  (=
    (contains ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
    (contains ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@12@01))
(assert ($Perm.isReadVar $k@13@01))
(assert (< $k@12@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@12@01)))
(assert (< $k@13@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@13@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@11@01 Int)) (!
  (and
    (contains%precondition ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
    (contains%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
    (or
      (not
        (=
          (contains ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
          (contains ($Snap.combine
            $Snap.unit
            ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)))
      (=
        (contains ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
        (contains ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01))))
  :pattern ((contains%limited ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85-aux|)))
(assert (forall ((x@11@01 Int)) (!
  (or
    (=
      (contains ($Snap.combine $Snap.unit ($Snap.first $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01)
      (contains ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01))
    (= x@11@01 i@3@01))
  :pattern ((contains%limited ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) x@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(valid(this), write)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:($t@4@01)) != Null | live]
; [else-branch: 4 | First:(Second:($t@4@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | First:(Second:($t@4@01)) != Null]
(assert (valid%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.first $t@10@01))) this@2@01))
; [eval] (forall x: Int :: { old(contains(this, x)) } contains(this, x) == old(contains(this, x)) || x == i)
(declare-const x@14@01 Int)
(push) ; 6
; [eval] contains(this, x) == old(contains(this, x)) || x == i
; [eval] contains(this, x) == old(contains(this, x))
; [eval] contains(this, x)
(push) ; 7
; [eval] this != null
(declare-const $k@15@01 $Perm)
(assert ($Perm.isReadVar $k@15@01))
(assert (< $k@15@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@15@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      ($Snap.first $t@10@01)))) this@2@01 x@14@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@15@01))
(assert (and
  (< $k@15@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@15@01))
  (contains%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        ($Snap.first $t@10@01)))) this@2@01 x@14@01)))
; [eval] old(contains(this, x))
; [eval] contains(this, x)
(set-option :timeout 0)
(push) ; 7
; [eval] this != null
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(assert (< $k@16@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@16@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@16@01))
(assert (and
  (< $k@16@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@16@01))
  (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01)))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | contains((_, (First:(Second:($t@4@01)), (First:(Second:(Second:($t@4@01))), First:($t@10@01)))), this@2@01, x@14@01) == contains((_, Second:($t@4@01)), this@2@01, x@14@01) | live]
; [else-branch: 5 | contains((_, (First:(Second:($t@4@01)), (First:(Second:(Second:($t@4@01))), First:($t@10@01)))), this@2@01, x@14@01) != contains((_, Second:($t@4@01)), this@2@01, x@14@01) | live]
(push) ; 8
; [then-branch: 5 | contains((_, (First:(Second:($t@4@01)), (First:(Second:(Second:($t@4@01))), First:($t@10@01)))), this@2@01, x@14@01) == contains((_, Second:($t@4@01)), this@2@01, x@14@01)]
(assert (=
  (contains ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        ($Snap.first $t@10@01)))) this@2@01 x@14@01)
  (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | contains((_, (First:(Second:($t@4@01)), (First:(Second:(Second:($t@4@01))), First:($t@10@01)))), this@2@01, x@14@01) != contains((_, Second:($t@4@01)), this@2@01, x@14@01)]
(assert (not
  (=
    (contains ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second $t@4@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.first $t@10@01)))) this@2@01 x@14@01)
    (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))))
; [eval] x == i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (contains ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second $t@4@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.first $t@10@01)))) this@2@01 x@14@01)
      (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01)))
  (=
    (contains ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second $t@4@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.first $t@10@01)))) this@2@01 x@14@01)
    (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@15@01))
(assert ($Perm.isReadVar $k@16@01))
(assert (< $k@15@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@15@01)))
(assert (< $k@16@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@16@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@14@01 Int)) (!
  (and
    (contains%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second $t@4@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.first $t@10@01)))) this@2@01 x@14@01)
    (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01)
    (or
      (not
        (=
          (contains ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second $t@4@01))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
                ($Snap.first $t@10@01)))) this@2@01 x@14@01)
          (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01)))
      (=
        (contains ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second $t@4@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
              ($Snap.first $t@10@01)))) this@2@01 x@14@01)
        (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85-aux|)))
(assert (forall ((x@14@01 Int)) (!
  (and
    (contains%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second $t@4@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.first $t@10@01)))) this@2@01 x@14@01)
    (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85_precondition|)))
(push) ; 6
(assert (not (forall ((x@14@01 Int)) (!
  (=>
    (and
      (contains%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second $t@4@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.first $t@10@01)))) this@2@01 x@14@01)
      (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
    (or
      (=
        (contains ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second $t@4@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
              ($Snap.first $t@10@01)))) this@2@01 x@14@01)
        (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
      (= x@14@01 i@3@01)))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@14@01 Int)) (!
  (or
    (=
      (contains ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second $t@4@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.first $t@10@01)))) this@2@01 x@14@01)
      (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
    (= x@14@01 i@3@01))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85|)))
(pop) ; 5
(pop) ; 4
; [eval] !(this.next != null)
; [eval] this.next != null
; [then-branch: 6 | First:(Second:($t@4@01)) == Null | dead]
; [else-branch: 6 | First:(Second:($t@4@01)) != Null | live]
(push) ; 4
; [else-branch: 6 | First:(Second:($t@4@01)) != Null]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 1 | First:(Second:($t@4@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.second $t@4@01) this@2@01))
; [eval] this.next != null
; [then-branch: 7 | First:(Second:($t@4@01)) != Null | dead]
; [else-branch: 7 | First:(Second:($t@4@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 7 | First:(Second:($t@4@01)) == Null]
(pop) ; 4
; [eval] !(this.next != null)
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:($t@4@01)) == Null | live]
; [else-branch: 8 | First:(Second:($t@4@01)) != Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | First:(Second:($t@4@01)) == Null]
; [exec]
; n := new(next, value)
(declare-const n@17@01 $Ref)
(assert (not (= n@17@01 $Ref.null)))
(declare-const next@18@01 $Ref)
(declare-const value@19@01 Int)
(assert (not (= n@17@01 n@9@01)))
(assert (not (= n@17@01 this@2@01)))
(assert (not
  (= n@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@4@01))))))
; [exec]
; this.next := n
(push) ; 5
(set-option :timeout 10)
(assert (not (= n@17@01 this@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; this.next.value := i
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@2@01 n@17@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; this.next.next := null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@2@01 n@17@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(valid(this.next), write)
; [eval] this.next != null
; [then-branch: 9 | False | dead]
; [else-branch: 9 | True | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | True]
(assert (valid%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit)) n@17@01))
; [exec]
; fold acc(valid(this), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= n@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | n@17@01 != Null | live]
; [else-branch: 10 | n@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 10 | n@17@01 != Null]
(assert (valid%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap n@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit)))) this@2@01))
; [eval] (forall x: Int :: { old(contains(this, x)) } contains(this, x) == old(contains(this, x)) || x == i)
(declare-const x@20@01 Int)
(push) ; 7
; [eval] contains(this, x) == old(contains(this, x)) || x == i
; [eval] contains(this, x) == old(contains(this, x))
; [eval] contains(this, x)
(push) ; 8
; [eval] this != null
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
(assert (< $k@21@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@21@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@21@01))
(assert (and
  (< $k@21@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@21@01))
  (contains%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)))
; [eval] old(contains(this, x))
; [eval] contains(this, x)
(set-option :timeout 0)
(push) ; 8
; [eval] this != null
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(assert (< $k@22@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@22@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@22@01))
(assert (and
  (< $k@22@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@22@01))
  (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01)))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 11 | contains((_, (n@17@01, (First:(Second:(Second:($t@4@01))), (Null, (i@3@01, _))))), this@2@01, x@20@01) == contains((_, Second:($t@4@01)), this@2@01, x@20@01) | live]
; [else-branch: 11 | contains((_, (n@17@01, (First:(Second:(Second:($t@4@01))), (Null, (i@3@01, _))))), this@2@01, x@20@01) != contains((_, Second:($t@4@01)), this@2@01, x@20@01) | live]
(push) ; 9
; [then-branch: 11 | contains((_, (n@17@01, (First:(Second:(Second:($t@4@01))), (Null, (i@3@01, _))))), this@2@01, x@20@01) == contains((_, Second:($t@4@01)), this@2@01, x@20@01)]
(assert (=
  (contains ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
  (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | contains((_, (n@17@01, (First:(Second:(Second:($t@4@01))), (Null, (i@3@01, _))))), this@2@01, x@20@01) != contains((_, Second:($t@4@01)), this@2@01, x@20@01)]
(assert (not
  (=
    (contains ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
    (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))))
; [eval] x == i
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (contains ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n@17@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
      (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01)))
  (=
    (contains ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
    (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@21@01))
(assert ($Perm.isReadVar $k@22@01))
(assert (< $k@21@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@21@01)))
(assert (< $k@22@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@22@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@20@01 Int)) (!
  (and
    (contains%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
    (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01)
    (or
      (not
        (=
          (contains ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap n@17@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $Ref.null)
                  ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
          (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01)))
      (=
        (contains ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap n@17@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
        (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85-aux|)))
(assert (forall ((x@20@01 Int)) (!
  (and
    (contains%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
    (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85_precondition|)))
(push) ; 7
(assert (not (forall ((x@20@01 Int)) (!
  (=>
    (and
      (contains%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n@17@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
      (contains%precondition ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
    (or
      (=
        (contains ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap n@17@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $Ref.null)
                ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
        (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
      (= x@20@01 i@3@01)))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@20@01 Int)) (!
  (or
    (=
      (contains ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n@17@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              ($Snap.combine ($SortWrappers.IntTo$Snap i@3@01) $Snap.unit))))) this@2@01 x@20@01)
      (contains ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
    (= x@20@01 i@3@01))
  :pattern ((contains%limited ($Snap.combine $Snap.unit ($Snap.second $t@4@01)) this@2@01 x@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0113.vpr@22@11@22@85|)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
