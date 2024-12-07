(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0118.vpr
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
(declare-fun Nodelen ($Snap $Ref) Int)
(declare-fun Nodelen%limited ($Snap $Ref) Int)
(declare-fun Nodelen%stateless ($Ref) Bool)
(declare-fun Nodelen%precondition ($Snap $Ref) Bool)
(declare-fun Listlen ($Snap $Ref) Int)
(declare-fun Listlen%limited ($Snap $Ref) Int)
(declare-fun Listlen%stateless ($Ref) Bool)
(declare-fun Listlen%precondition ($Snap $Ref) Bool)
(declare-fun Nodeget ($Snap $Ref Int) Int)
(declare-fun Nodeget%limited ($Snap $Ref Int) Int)
(declare-fun Nodeget%stateless ($Ref Int) Bool)
(declare-fun Nodeget%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Nodeinv%trigger ($Snap $Ref) Bool)
(declare-fun Listinv%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION Nodelen----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this != null
(assert (not (= this@0@00 $Ref.null)))
(declare-const $k@7@00 $Perm)
(assert ($Perm.isReadVar $k@7@00))
(assert (<= $Perm.No $k@7@00))
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 $Snap.unit))
; [eval] result > 0
(assert (> result@1@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (Nodelen%limited s@$ this@0@00) (Nodelen s@$ this@0@00))
  :pattern ((Nodelen s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (Nodelen%stateless this@0@00)
  :pattern ((Nodelen%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (Nodelen%limited s@$ this@0@00))) (and
    ($Perm.isReadVar $k@7@00)
    (=> (Nodelen%precondition s@$ this@0@00) (> result@1@00 0))))
  :pattern ((Nodelen%limited s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (Nodelen%limited s@$ this@0@00))) true)
  :pattern ((Nodelen%limited s@$ this@0@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@7@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this@0@00 $Ref.null)))
(assert (<= $Perm.No $k@7@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Nodeinv(this), wildcard) in (this.Noden == null ? 1 : 1 + Nodelen(this.Noden)))
(declare-const $k@9@00 $Perm)
(assert ($Perm.isReadVar $k@9@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@10@00 $Perm)
(assert ($Perm.isReadVar $k@10@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@7@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@10@00 $k@7@00))
(assert (<= $Perm.No (- $k@7@00 $k@10@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Nodeinv%trigger ($Snap.second s@$) this@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@9@00))
(assert (<= $k@9@00 $Perm.Write))
(assert (=> (< $Perm.No $k@9@00) (not (= this@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; [eval] this.Noden != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(Second:(s@$))) != Null | live]
; [else-branch: 0 | First:(Second:(Second:(s@$))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(Second:(s@$))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@0@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (this.Noden == null ? 1 : 1 + Nodelen(this.Noden))
; [eval] this.Noden == null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(Second:(Second:(s@$))) == Null | dead]
; [else-branch: 1 | First:(Second:(Second:(s@$))) != Null | live]
(push) ; 5
; [else-branch: 1 | First:(Second:(Second:(s@$))) != Null]
; [eval] 1 + Nodelen(this.Noden)
; [eval] Nodelen(this.Noden)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
; [eval] this != null
(declare-const $k@11@00 $Perm)
(assert ($Perm.isReadVar $k@11@00))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $k@9@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< $k@11@00 $k@9@00))
(assert (<= $Perm.No (- $k@9@00 $k@11@00)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodelen%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@11@00))
(assert (and
  (< $k@11@00 $k@9@00)
  (<= $Perm.No (- $k@9@00 $k@11@00))
  (Nodelen%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@11@00))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (and
    (< $k@11@00 $k@9@00)
    (<= $Perm.No (- $k@9@00 $k@11@00))
    (Nodelen%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | First:(Second:(Second:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (this.Noden == null ? 1 : 1 + Nodelen(this.Noden))
; [eval] this.Noden == null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(Second:(s@$))) == Null | live]
; [else-branch: 2 | First:(Second:(Second:(s@$))) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(Second:(Second:(s@$))) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@12@00 ($Snap $Ref) Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (=
    (joined_unfolding@12@00 s@$ this@0@00)
    (+
      1
      (Nodelen ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (= (joined_unfolding@12@00 s@$ this@0@00) 1)))
; Joined path conditions
(assert ($Perm.isReadVar $k@10@00))
(assert ($Perm.isReadVar $k@11@00))
(assert (and
  (< $k@10@00 $k@7@00)
  (<= $Perm.No (- $k@7@00 $k@10@00))
  (Nodeinv%trigger ($Snap.second s@$) this@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@9@00)
  (<= $k@9@00 $Perm.Write)
  (=> (< $Perm.No $k@9@00) (not (= this@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
          $Ref.null))
      (and
        (< $k@11@00 $k@9@00)
        (<= $Perm.No (- $k@9@00 $k@11@00))
        (Nodelen%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
; Joined path conditions
(assert (and
  (< $k@10@00 $k@7@00)
  (<= $Perm.No (- $k@7@00 $k@10@00))
  (Nodeinv%trigger ($Snap.second s@$) this@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@9@00)
  (<= $k@9@00 $Perm.Write)
  (=> (< $Perm.No $k@9@00) (not (= this@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))))
(assert (= result@1@00 (joined_unfolding@12@00 s@$ this@0@00)))
; [eval] result > 0
(push) ; 2
(assert (not (> result@1@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (> result@1@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@7@00)
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@11@00)
    (=>
      (Nodelen%precondition s@$ this@0@00)
      (=
        (Nodelen s@$ this@0@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
            $Ref.null)
          1
          (+
            1
            (Nodelen%limited ($Snap.combine
              $Snap.unit
              ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((Nodelen s@$ this@0@00))
  :pattern ((Nodelen%stateless this@0@00) (Nodeinv%trigger ($Snap.second s@$) this@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (Nodelen%precondition s@$ this@0@00)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null)
      true
      (Nodelen%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((Nodelen s@$ this@0@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION Listlen----------
(declare-fun this@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this != null
(assert (not (= this@2@00 $Ref.null)))
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(assert (<= $Perm.No $k@13@00))
(declare-const $t@14@00 $Snap)
(assert (= $t@14@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@3@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (Listlen%limited s@$ this@2@00) (Listlen s@$ this@2@00))
  :pattern ((Listlen s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (Listlen%stateless this@2@00)
  :pattern ((Listlen%limited s@$ this@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (Listlen%limited s@$ this@2@00))) (and
    ($Perm.isReadVar $k@13@00)
    (=> (Listlen%precondition s@$ this@2@00) (>= result@3@00 0))))
  :pattern ((Listlen%limited s@$ this@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (Listlen%limited s@$ this@2@00))) true)
  :pattern ((Listlen%limited s@$ this@2@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@13@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this@2@00 $Ref.null)))
(assert (<= $Perm.No $k@13@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Listinv(this), wildcard) in (this.Listc == null ? 0 : Nodelen(this.Listc)))
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@16@00 $Perm)
(assert ($Perm.isReadVar $k@16@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@13@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@16@00 $k@13@00))
(assert (<= $Perm.No (- $k@13@00 $k@16@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Listinv%trigger ($Snap.second s@$) this@2@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@15@00))
(assert (<= $k@15@00 $Perm.Write))
(assert (=> (< $Perm.No $k@15@00) (not (= this@2@00 $Ref.null))))
; [eval] this.Listc != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
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
; [then-branch: 3 | First:(Second:(s@$)) != Null | live]
; [else-branch: 3 | First:(Second:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (this.Listc == null ? 0 : Nodelen(this.Listc))
; [eval] this.Listc == null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(Second:(s@$)) == Null | dead]
; [else-branch: 4 | First:(Second:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 4 | First:(Second:(s@$)) != Null]
; [eval] Nodelen(this.Listc)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
; [eval] this != null
(declare-const $k@17@00 $Perm)
(assert ($Perm.isReadVar $k@17@00))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $k@15@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< $k@17@00 $k@15@00))
(assert (<= $Perm.No (- $k@15@00 $k@17@00)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodelen%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@17@00))
(assert (and
  (< $k@17@00 $k@15@00)
  (<= $Perm.No (- $k@15@00 $k@17@00))
  (Nodelen%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@17@00))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (< $k@17@00 $k@15@00)
    (<= $Perm.No (- $k@15@00 $k@17@00))
    (Nodelen%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 3 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] (this.Listc == null ? 0 : Nodelen(this.Listc))
; [eval] this.Listc == null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(s@$)) == Null | live]
; [else-branch: 5 | First:(Second:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | First:(Second:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@18@00 ($Snap $Ref) Int)
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (=
    (joined_unfolding@18@00 s@$ this@2@00)
    (Nodelen ($Snap.combine $Snap.unit ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (= (joined_unfolding@18@00 s@$ this@2@00) 0)))
; Joined path conditions
(assert ($Perm.isReadVar $k@16@00))
(assert ($Perm.isReadVar $k@17@00))
(assert (and
  (< $k@16@00 $k@13@00)
  (<= $Perm.No (- $k@13@00 $k@16@00))
  (Listinv%trigger ($Snap.second s@$) this@2@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@15@00)
  (<= $k@15@00 $Perm.Write)
  (=> (< $Perm.No $k@15@00) (not (= this@2@00 $Ref.null)))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (< $k@17@00 $k@15@00)
        (<= $Perm.No (- $k@15@00 $k@17@00))
        (Nodelen%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))))
; Joined path conditions
(assert (and
  (< $k@16@00 $k@13@00)
  (<= $Perm.No (- $k@13@00 $k@16@00))
  (Listinv%trigger ($Snap.second s@$) this@2@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@15@00)
  (<= $k@15@00 $Perm.Write)
  (=> (< $Perm.No $k@15@00) (not (= this@2@00 $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second s@$)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(assert (= result@3@00 (joined_unfolding@18@00 s@$ this@2@00)))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@3@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@3@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@15@00)
    ($Perm.isReadVar $k@16@00)
    ($Perm.isReadVar $k@17@00)
    (=>
      (Listlen%precondition s@$ this@2@00)
      (=
        (Listlen s@$ this@2@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)
          0
          (Nodelen ($Snap.combine $Snap.unit ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((Listlen s@$ this@2@00))
  :pattern ((Listlen%stateless this@2@00) (Listinv%trigger ($Snap.second s@$) this@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (=>
    (Listlen%precondition s@$ this@2@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (Nodelen%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((Listlen s@$ this@2@00))
  :qid |quant-u-13|)))
; ---------- FUNCTION Nodeget----------
(declare-fun this@4@00 () $Ref)
(declare-fun i@5@00 () Int)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this != null
(assert (not (= this@4@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const $k@19@00 $Perm)
(assert ($Perm.isReadVar $k@19@00))
(assert (<= $Perm.No $k@19@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@5@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] i < Nodelen(this)
; [eval] Nodelen(this)
(push) ; 2
; [eval] this != null
(declare-const $k@20@00 $Perm)
(assert ($Perm.isReadVar $k@20@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@19@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@20@00 $k@19@00))
(assert (<= $Perm.No (- $k@19@00 $k@20@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Nodelen%precondition ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@4@00))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@20@00))
(assert (and
  (< $k@20@00 $k@19@00)
  (<= $Perm.No (- $k@19@00 $k@20@00))
  (Nodelen%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second s@$))) this@4@00)))
(assert (<
  i@5@00
  (Nodelen ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@4@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@4@00 $Ref) (i@5@00 Int)) (!
  (= (Nodeget%limited s@$ this@4@00 i@5@00) (Nodeget s@$ this@4@00 i@5@00))
  :pattern ((Nodeget s@$ this@4@00 i@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref) (i@5@00 Int)) (!
  (Nodeget%stateless this@4@00 i@5@00)
  :pattern ((Nodeget%limited s@$ this@4@00 i@5@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert ($Perm.isReadVar $k@19@00))
(assert ($Perm.isReadVar $k@20@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this@4@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@19@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= 0 i@5@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (< $k@20@00 $k@19@00))
(assert (<= $Perm.No (- $k@19@00 $k@20@00)))
(assert (Nodelen%precondition ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@4@00))
(assert (<
  i@5@00
  (Nodelen ($Snap.combine $Snap.unit ($Snap.first ($Snap.second s@$))) this@4@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Nodeinv(this), wildcard) in (i == 0 ? this.Nodev : Nodeget(this.Noden, i - 1)))
(declare-const $k@21@00 $Perm)
(assert ($Perm.isReadVar $k@21@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@21@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@22@00 $Perm)
(assert ($Perm.isReadVar $k@22@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@19@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@22@00 $k@19@00))
(assert (<= $Perm.No (- $k@19@00 $k@22@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Nodeinv%trigger ($Snap.first ($Snap.second s@$)) this@4@00))
(assert (=
  ($Snap.first ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second s@$)))
    ($Snap.second ($Snap.first ($Snap.second s@$))))))
(assert (<= $Perm.No $k@21@00))
(assert (<= $k@21@00 $Perm.Write))
(assert (=> (< $Perm.No $k@21@00) (not (= this@4@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
; [eval] this.Noden != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:(Second:(s@$)))) != Null | live]
; [else-branch: 6 | First:(Second:(First:(Second:(s@$)))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(Second:(First:(Second:(s@$)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
    $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@4@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (i == 0 ? this.Nodev : Nodeget(this.Noden, i - 1))
; [eval] i == 0
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= i@5@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= i@5@00 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | i@5@00 == 0 | live]
; [else-branch: 7 | i@5@00 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | i@5@00 == 0]
(assert (= i@5@00 0))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | i@5@00 != 0]
(assert (not (= i@5@00 0)))
; [eval] Nodeget(this.Noden, i - 1)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] i - 1
(set-option :timeout 0)
(push) ; 6
; [eval] this != null
(declare-const $k@23@00 $Perm)
(assert ($Perm.isReadVar $k@23@00))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $k@21@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< $k@23@00 $k@21@00))
(assert (<= $Perm.No (- $k@21@00 $k@23@00)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] 0 <= i
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 (- i@5@00 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- i@5@00 1)))
; [eval] i < Nodelen(this)
; [eval] Nodelen(this)
(push) ; 7
; [eval] this != null
(declare-const $k@24@00 $Perm)
(assert ($Perm.isReadVar $k@24@00))
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= $k@21@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (< $k@24@00 $k@21@00))
(assert (<= $Perm.No (- $k@21@00 $k@24@00)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@24@00)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Nodelen%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@24@00))
(assert (and
  (< $k@24@00 $k@21@00)
  (<= $Perm.No (- $k@21@00 $k@24@00))
  (Nodelen%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))))))
(set-option :timeout 0)
(push) ; 7
(assert (not (<
  (- i@5@00 1)
  (Nodelen ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- i@5@00 1)
  (Nodelen ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))))))
(assert (Nodeget%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
    ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
  i@5@00
  1)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@23@00))
(assert ($Perm.isReadVar $k@24@00))
(assert (and
  (< $k@23@00 $k@21@00)
  (<= $Perm.No (- $k@21@00 $k@23@00))
  (<= 0 (- i@5@00 1))
  (< $k@24@00 $k@21@00)
  (<= $Perm.No (- $k@21@00 $k@24@00))
  (Nodelen%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))))
  (<
    (- i@5@00 1)
    (Nodelen ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))))
  (Nodeget%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
      ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
    i@5@00
    1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@23@00))
(assert ($Perm.isReadVar $k@24@00))
(assert (=>
  (not (= i@5@00 0))
  (and
    (not (= i@5@00 0))
    (< $k@23@00 $k@21@00)
    (<= $Perm.No (- $k@21@00 $k@23@00))
    (<= 0 (- i@5@00 1))
    (< $k@24@00 $k@21@00)
    (<= $Perm.No (- $k@21@00 $k@24@00))
    (Nodelen%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))))
    (<
      (- i@5@00 1)
      (Nodelen ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))))
    (Nodeget%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
        ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
      i@5@00
      1)))))
(assert (or (not (= i@5@00 0)) (= i@5@00 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | First:(Second:(First:(Second:(s@$)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))) $Snap.unit))
; [eval] (i == 0 ? this.Nodev : Nodeget(this.Noden, i - 1))
; [eval] i == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= i@5@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= i@5@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | i@5@00 == 0 | live]
; [else-branch: 8 | i@5@00 != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | i@5@00 == 0]
(assert (= i@5@00 0))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (= i@5@00 0))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@25@00 ($Snap $Ref Int) Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
      $Ref.null))
  (=
    (joined_unfolding@25@00 s@$ this@4@00 i@5@00)
    (ite
      (= i@5@00 0)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
      (Nodeget ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
          ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
        i@5@00
        1))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
    $Ref.null)
  (=
    (joined_unfolding@25@00 s@$ this@4@00 i@5@00)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$)))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@22@00))
(assert ($Perm.isReadVar $k@23@00))
(assert ($Perm.isReadVar $k@24@00))
(assert (and
  (< $k@22@00 $k@19@00)
  (<= $Perm.No (- $k@19@00 $k@22@00))
  (Nodeinv%trigger ($Snap.first ($Snap.second s@$)) this@4@00)
  (=
    ($Snap.first ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second s@$)))
      ($Snap.second ($Snap.first ($Snap.second s@$)))))
  (<= $Perm.No $k@21@00)
  (<= $k@21@00 $Perm.Write)
  (=> (< $Perm.No $k@21@00) (not (= this@4@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.first ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
        $Ref.null))
    (=>
      (not (= i@5@00 0))
      (and
        (not (= i@5@00 0))
        (< $k@23@00 $k@21@00)
        (<= $Perm.No (- $k@21@00 $k@23@00))
        (<= 0 (- i@5@00 1))
        (< $k@24@00 $k@21@00)
        (<= $Perm.No (- $k@21@00 $k@24@00))
        (Nodelen%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))))
        (<
          (- i@5@00 1)
          (Nodelen ($Snap.combine
            $Snap.unit
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))))
        (Nodeget%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
            ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
          i@5@00
          1))))
    (or (not (= i@5@00 0)) (= i@5@00 0)))))
; Joined path conditions
(assert (and
  (< $k@22@00 $k@19@00)
  (<= $Perm.No (- $k@19@00 $k@22@00))
  (Nodeinv%trigger ($Snap.first ($Snap.second s@$)) this@4@00)
  (=
    ($Snap.first ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second s@$)))
      ($Snap.second ($Snap.first ($Snap.second s@$)))))
  (<= $Perm.No $k@21@00)
  (<= $k@21@00 $Perm.Write)
  (=> (< $Perm.No $k@21@00) (not (= this@4@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.first ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))) $Snap.unit)
    (= i@5@00 0))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))))
      $Ref.null))))
(assert (= result@6@00 (joined_unfolding@25@00 s@$ this@4@00 i@5@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@4@00 $Ref) (i@5@00 Int)) (!
  (and
    ($Perm.isReadVar $k@19@00)
    ($Perm.isReadVar $k@20@00)
    ($Perm.isReadVar $k@21@00)
    ($Perm.isReadVar $k@22@00)
    ($Perm.isReadVar $k@23@00)
    ($Perm.isReadVar $k@24@00)
    (=>
      (Nodeget%precondition s@$ this@4@00 i@5@00)
      (=
        (Nodeget s@$ this@4@00 i@5@00)
        (ite
          (= i@5@00 0)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
          (Nodeget%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
              ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
            i@5@00
            1))))))
  :pattern ((Nodeget s@$ this@4@00 i@5@00))
  :pattern ((Nodeget%stateless this@4@00 i@5@00) (Nodeinv%trigger ($Snap.first ($Snap.second s@$)) this@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref) (i@5@00 Int)) (!
  (=>
    (Nodeget%precondition s@$ this@4@00 i@5@00)
    (ite
      (= i@5@00 0)
      true
      (Nodeget%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
          ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
        i@5@00
        1))))
  :pattern ((Nodeget s@$ this@4@00 i@5@00))
  :qid |quant-u-15|)))
; ---------- Nodeinv ----------
(declare-const this@26@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@27@00 $Snap)
(assert (= $t@27@00 ($Snap.combine ($Snap.first $t@27@00) ($Snap.second $t@27@00))))
(assert (not (= this@26@00 $Ref.null)))
(assert (=
  ($Snap.second $t@27@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@00))
    ($Snap.second ($Snap.second $t@27@00)))))
; [eval] this.Noden != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@27@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@27@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:($t@27@00)) != Null | live]
; [else-branch: 9 | First:(Second:($t@27@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 9 | First:(Second:($t@27@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@27@00))) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 9 | First:(Second:($t@27@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@27@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@27@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- Listinv ----------
(declare-const this@28@00 $Ref)
(push) ; 1
(declare-const $t@29@00 $Snap)
(assert (= $t@29@00 ($Snap.combine ($Snap.first $t@29@00) ($Snap.second $t@29@00))))
(assert (not (= this@28@00 $Ref.null)))
; [eval] this.Listc != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@29@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@29@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:($t@29@00) != Null | live]
; [else-branch: 10 | First:($t@29@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 10 | First:($t@29@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@29@00)) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 10 | First:($t@29@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@29@00)) $Ref.null))
(assert (= ($Snap.second $t@29@00) $Snap.unit))
(pop) ; 2
(pop) ; 1
