(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:48
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0155.vpr
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
(declare-fun i ($Snap $Ref Int Bool) Bool)
(declare-fun i%limited ($Snap $Ref Int Bool) Bool)
(declare-fun i%stateless ($Ref Int Bool) Bool)
(declare-fun i%precondition ($Snap $Ref Int Bool) Bool)
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
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (x@1@00 Int) (y@2@00 Bool)) (!
  (= (i%limited s@$ this@0@00 x@1@00 y@2@00) (i s@$ this@0@00 x@1@00 y@2@00))
  :pattern ((i s@$ this@0@00 x@1@00 y@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (x@1@00 Int) (y@2@00 Bool)) (!
  (i%stateless this@0@00 x@1@00 y@2@00)
  :pattern ((i%limited s@$ this@0@00 x@1@00 y@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (x@1@00 Int) (y@2@00 Bool)) (!
  (and
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    (=>
      (i%precondition s@$ this@0@00 x@1@00 y@2@00)
      (=
        (i s@$ this@0@00 x@1@00 y@2@00)
        (i%limited ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@1@00 y@2@00))))
  :pattern ((i s@$ this@0@00 x@1@00 y@2@00))
  :pattern ((i%stateless this@0@00 x@1@00 y@2@00) (valid%trigger ($Snap.second s@$) this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (x@1@00 Int) (y@2@00 Bool)) (!
  (=>
    (i%precondition s@$ this@0@00 x@1@00 y@2@00)
    (i%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@1@00 y@2@00))
  :pattern ((i s@$ this@0@00 x@1@00 y@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- triggersSix$ ----------
(declare-const this@0@01 $Ref)
(declare-const c@1@01 Int)
(declare-const d@2@01 Int)
(declare-const this@3@01 $Ref)
(declare-const c@4@01 Int)
(declare-const d@5@01 Int)
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
; [eval] c > d
(assert (> c@4@01 d@5@01))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] (forall x: Int, fresh__0: Bool :: { i(this, x, fresh__0) } true ==> i(this, x, c > d))
(declare-const x@7@01 Int)
(declare-const fresh__0@8@01 Bool)
(push) ; 2
; [eval] true ==> i(this, x, c > d)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | True]
; [eval] i(this, x, c > d)
; [eval] c > d
(push) ; 5
; [eval] this != null
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (< $k@9@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@9@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (i%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 (>
  c@4@01
  d@5@01)))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@9@01))
(assert (and
  (< $k@9@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@9@01))
  (i%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 (>
    c@4@01
    d@5@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@9@01))
(assert (and
  (< $k@9@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@9@01))
  (i%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 (>
    c@4@01
    d@5@01))))
; [eval] i(this, x, fresh__0)
(set-option :timeout 0)
(push) ; 3
; [eval] this != null
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(assert (< $k@10@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@10@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (i%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 fresh__0@8@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@10@01))
(assert (and
  (< $k@10@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@10@01))
  (i%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 fresh__0@8@01)))
(assert ($Perm.isReadVar $k@10@01))
(assert (< $k@10@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@10@01)))
(assert (i%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 fresh__0@8@01))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@9@01))
(assert ($Perm.isReadVar $k@10@01))
(assert (< $k@9@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@9@01)))
(assert (< $k@10@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@10@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@7@01 Int) (fresh__0@8@01 Bool)) (!
  (and
    (i%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 (>
      c@4@01
      d@5@01))
    (i%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 fresh__0@8@01))
  :pattern ((i ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 fresh__0@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0155.vpr@22@13@22@56-aux|)))
(assert (forall ((x@7@01 Int) (fresh__0@8@01 Bool)) (!
  (i ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 (>
    c@4@01
    d@5@01))
  :pattern ((i ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 x@7@01 fresh__0@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0155.vpr@22@13@22@56|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.second $t@11@01) $Snap.unit))
; [eval] i(this, 4, true)
(push) ; 3
; [eval] this != null
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(assert (< $k@12@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@12@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (i%precondition ($Snap.combine $Snap.unit ($Snap.first $t@11@01)) this@3@01 4 true))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@12@01))
(assert (and
  (< $k@12@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@12@01))
  (i%precondition ($Snap.combine $Snap.unit ($Snap.first $t@11@01)) this@3@01 4 true)))
(assert (i ($Snap.combine $Snap.unit ($Snap.first $t@11@01)) this@3@01 4 true))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [eval] i(this, 4, true)
(push) ; 3
; [eval] this != null
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(assert (< $k@13@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@13@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (i%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 4 true))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@13@01))
(assert (and
  (< $k@13@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@13@01))
  (i%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 4 true)))
(set-option :timeout 0)
(push) ; 3
(assert (not (i ($Snap.combine $Snap.unit ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 4 true)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (i ($Snap.combine $Snap.unit ($Snap.first ($Snap.second ($Snap.second $t@6@01)))) this@3@01 4 true))
(pop) ; 2
(pop) ; 1
