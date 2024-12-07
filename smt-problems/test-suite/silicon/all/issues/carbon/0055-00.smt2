(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:46:31
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0055.vpr
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
(declare-fun Nodecontains$ ($Snap $Ref Int) Bool)
(declare-fun Nodecontains$%limited ($Snap $Ref Int) Bool)
(declare-fun Nodecontains$%stateless ($Ref Int) Bool)
(declare-fun Nodecontains$%precondition ($Snap $Ref Int) Bool)
(declare-fun Nodesize$ ($Snap $Ref) Int)
(declare-fun Nodesize$%limited ($Snap $Ref) Int)
(declare-fun Nodesize$%stateless ($Ref) Bool)
(declare-fun Nodesize$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Nodevalid$%trigger ($Snap $Ref) Bool)
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
(declare-fun $k@5@00 () $Perm)
(declare-fun joined_unfolding@10@00 ($Snap $Ref Int) Bool)
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(declare-fun $k@8@00 () $Perm)
(declare-fun $k@9@00 () $Perm)
(declare-fun $k@11@00 () $Perm)
(declare-fun joined_unfolding@16@00 ($Snap $Ref) Int)
(declare-fun $k@13@00 () $Perm)
(declare-fun $k@14@00 () $Perm)
(declare-fun $k@15@00 () $Perm)
(assert (forall ((s@$ $Snap) (this$_4@0@00 $Ref) (i@1@00 Int)) (!
  (=
    (Nodecontains$%limited s@$ this$_4@0@00 i@1@00)
    (Nodecontains$ s@$ this$_4@0@00 i@1@00))
  :pattern ((Nodecontains$ s@$ this$_4@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this$_4@0@00 $Ref) (i@1@00 Int)) (!
  (Nodecontains$%stateless this$_4@0@00 i@1@00)
  :pattern ((Nodecontains$%limited s@$ this$_4@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this$_4@0@00 $Ref) (i@1@00 Int)) (!
  (and
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    ($Perm.isReadVar $k@8@00)
    ($Perm.isReadVar $k@9@00)
    (=>
      (Nodecontains$%precondition s@$ this$_4@0@00 i@1@00)
      (=
        (Nodecontains$ s@$ this$_4@0@00 i@1@00)
        (or
          (=
            i@1@00
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                $Ref.null))
            (Nodecontains$%limited (ite
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  $Ref.null))
              ($Snap.combine
                $Snap.unit
                ($Snap.second ($Snap.second ($Snap.second s@$))))
              ($Snap.combine $Snap.unit ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))))
  :pattern ((Nodecontains$ s@$ this$_4@0@00 i@1@00))
  :pattern ((Nodecontains$%stateless this$_4@0@00 i@1@00) (Nodevalid$%trigger ($Snap.second s@$) this$_4@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this$_4@0@00 $Ref) (i@1@00 Int)) (!
  (=>
    (and
      (Nodecontains$%precondition s@$ this$_4@0@00 i@1@00)
      (and
        (not
          (=
            i@1@00
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))))
    (Nodecontains$%precondition (ite
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      ($Snap.combine $Snap.unit ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.combine $Snap.unit ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))
  :pattern ((Nodecontains$ s@$ this$_4@0@00 i@1@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this$_3@3@00 $Ref)) (!
  (= (Nodesize$%limited s@$ this$_3@3@00) (Nodesize$ s@$ this$_3@3@00))
  :pattern ((Nodesize$ s@$ this$_3@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this$_3@3@00 $Ref)) (!
  (Nodesize$%stateless this$_3@3@00)
  :pattern ((Nodesize$%limited s@$ this$_3@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this$_3@3@00 $Ref)) (!
  (let ((result@4@00 (Nodesize$%limited s@$ this$_3@3@00))) (and
    ($Perm.isReadVar $k@11@00)
    (=> (Nodesize$%precondition s@$ this$_3@3@00) (> result@4@00 0))))
  :pattern ((Nodesize$%limited s@$ this$_3@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this$_3@3@00 $Ref)) (!
  (let ((result@4@00 (Nodesize$%limited s@$ this$_3@3@00))) true)
  :pattern ((Nodesize$%limited s@$ this$_3@3@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this$_3@3@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@11@00)
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@14@00)
    ($Perm.isReadVar $k@15@00)
    (=>
      (Nodesize$%precondition s@$ this$_3@3@00)
      (=
        (Nodesize$ s@$ this$_3@3@00)
        (ite
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null))
          (+
            1
            (Nodesize$%limited ($Snap.combine
              $Snap.unit
              ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
          1))))
  :pattern ((Nodesize$ s@$ this$_3@3@00))
  :pattern ((Nodesize$%stateless this$_3@3@00) (Nodevalid$%trigger ($Snap.second s@$) this$_3@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this$_3@3@00 $Ref)) (!
  (=>
    (Nodesize$%precondition s@$ this$_3@3@00)
    (ite
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (Nodesize$%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      true))
  :pattern ((Nodesize$ s@$ this$_3@3@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Nodeinit$ ----------
(declare-const this@0@01 $Ref)
(declare-const k$@1@01 $Perm)
(declare-const v@2@01 Int)
(declare-const this@3@01 $Ref)
(declare-const k$@4@01 $Perm)
(declare-const v@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] k$ > none
(assert (> k$@4@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] write > k$
(assert (> $Perm.Write k$@4@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.first ($Snap.second $t@7@01)) $Snap.unit))
; [eval] Nodesize$(this) == 1
; [eval] Nodesize$(this)
(push) ; 3
; [eval] this$_3 != null
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (< $k@8@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@8@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Nodesize$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this@3@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@8@01))
(assert (and
  (< $k@8@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@8@01))
  (Nodesize$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this@3@01)))
(assert (= (Nodesize$ ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this@3@01) 1))
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [eval] (forall y: Int :: { Nodecontains$(this, y) } true ==> Nodecontains$(this, y) == (y == v))
(declare-const y@9@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Nodecontains$(this, y) == (y == v)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | True]
; [eval] Nodecontains$(this, y) == (y == v)
; [eval] Nodecontains$(this, y)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(assert (< $k@10@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@10@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodecontains$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this@3@01 y@9@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@10@01))
(assert (and
  (< $k@10@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@10@01))
  (Nodecontains$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this@3@01 y@9@01)))
; [eval] y == v
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@10@01))
(assert (and
  (< $k@10@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@10@01))
  (Nodecontains$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this@3@01 y@9@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@10@01))
(assert (< $k@10@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@10@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@9@01 Int)) (!
  (Nodecontains$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this@3@01 y@9@01)
  :pattern ((Nodecontains$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first $t@7@01)) this@3@01 y@9@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0055.vpr@33@70@33@132-aux|)))
(assert (forall ((y@9@01 Int)) (!
  (=
    (Nodecontains$ ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this@3@01 y@9@01)
    (= y@9@01 v@5@01))
  :pattern ((Nodecontains$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first $t@7@01)) this@3@01 y@9@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0055.vpr@33@70@33@132|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; this.Nodenext$ := null
; [exec]
; this.Nodevalue$ := v
; [exec]
; fold acc(Nodevalid$(this), write)
; [eval] this$_5.Nodenext$ != null
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 3
; [else-branch: 1 | True]
(assert (Nodevalid$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit)) this@3@01))
; [eval] Nodesize$(this) == 1
; [eval] Nodesize$(this)
(push) ; 4
; [eval] this$_3 != null
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(assert (< $k@11@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@11@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Nodesize$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@11@01))
(assert (and
  (< $k@11@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@11@01))
  (Nodesize$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (Nodesize$ ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01)
  1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Nodesize$ ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01)
  1))
; [eval] (forall y: Int :: { Nodecontains$(this, y) } true ==> Nodecontains$(this, y) == (y == v))
(declare-const y@12@01 Int)
(push) ; 4
; [eval] true ==> Nodecontains$(this, y) == (y == v)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | True]
; [eval] Nodecontains$(this, y) == (y == v)
; [eval] Nodecontains$(this, y)
(push) ; 7
; [eval] this$_4 != null
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(assert (< $k@13@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@13@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Nodecontains$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap $Ref.null)
    ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@13@01))
(assert (and
  (< $k@13@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@13@01))
  (Nodecontains$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01)))
; [eval] y == v
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@13@01))
(assert (and
  (< $k@13@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@13@01))
  (Nodecontains$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@13@01))
(assert (< $k@13@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@13@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@12@01 Int)) (!
  (Nodecontains$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01)
  :pattern ((Nodecontains$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0055.vpr@33@70@33@132-aux|)))
(assert (forall ((y@12@01 Int)) (!
  (Nodecontains$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01)
  :pattern ((Nodecontains$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0055.vpr@33@70@33@132_precondition|)))
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((y@12@01 Int)) (!
  (=>
    (Nodecontains$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01)
    (=
      (Nodecontains$ ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01)
      (= y@12@01 v@5@01)))
  :pattern ((Nodecontains$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0055.vpr@33@70@33@132|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((y@12@01 Int)) (!
  (=
    (Nodecontains$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01)
    (= y@12@01 v@5@01))
  :pattern ((Nodecontains$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap $Ref.null)
      ($Snap.combine ($SortWrappers.IntTo$Snap v@5@01) $Snap.unit))) this@3@01 y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0055.vpr@33@70@33@132|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
