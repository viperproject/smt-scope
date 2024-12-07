(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:46
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0154.vpr
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
(declare-fun Nodet$ ($Snap $Ref) Int)
(declare-fun Nodet$%limited ($Snap $Ref) Int)
(declare-fun Nodet$%stateless ($Ref) Bool)
(declare-fun Nodet$%precondition ($Snap $Ref) Bool)
(declare-fun Nodet2$ ($Snap $Ref) Int)
(declare-fun Nodet2$%limited ($Snap $Ref) Int)
(declare-fun Nodet2$%stateless ($Ref) Bool)
(declare-fun Nodet2$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Nodevalid$%trigger ($Snap $Ref) Bool)
(declare-fun Nodep$%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION Nodet$----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this != null
(assert (not (= this@0@00 $Ref.null)))
(declare-const $k@4@00 $Perm)
(assert ($Perm.isReadVar $k@4@00))
(assert (<= $Perm.No $k@4@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (Nodet$%limited s@$ this@0@00) (Nodet$ s@$ this@0@00))
  :pattern ((Nodet$ s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (Nodet$%stateless this@0@00)
  :pattern ((Nodet$%limited s@$ this@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@4@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this@0@00 $Ref.null)))
(assert (<= $Perm.No $k@4@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Nodevalid$(this), wildcard) in Nodet$(this))
(declare-const $k@5@00 $Perm)
(assert ($Perm.isReadVar $k@5@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@5@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@6@00 $Perm)
(assert ($Perm.isReadVar $k@6@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@4@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@6@00 $k@4@00))
(assert (<= $Perm.No (- $k@4@00 $k@6@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Nodevalid$%trigger ($Snap.second s@$) this@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@5@00))
(assert (<= $k@5@00 $Perm.Write))
(assert (=> (< $Perm.No $k@5@00) (not (= this@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; [eval] this.Nodenext$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@00)))
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
(assert (not (< $Perm.No $k@5@00)))
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
; [eval] Nodet$(this)
(set-option :timeout 0)
(push) ; 4
; [eval] this != null
(declare-const $k@7@00 $Perm)
(assert ($Perm.isReadVar $k@7@00))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (- $k@4@00 $k@6@00) $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< $k@7@00 (- $k@4@00 $k@6@00)))
(assert (<= $Perm.No (- (- $k@4@00 $k@6@00) $k@7@00)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Nodet$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@7@00))
(assert (and
  (< $k@7@00 (- $k@4@00 $k@6@00))
  (<= $Perm.No (- (- $k@4@00 $k@6@00) $k@7@00))
  (Nodet$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | First:(Second:(Second:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] Nodet$(this)
(push) ; 4
; [eval] this != null
(declare-const $k@8@00 $Perm)
(assert ($Perm.isReadVar $k@8@00))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (- $k@4@00 $k@6@00) $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< $k@8@00 (- $k@4@00 $k@6@00)))
(assert (<= $Perm.No (- (- $k@4@00 $k@6@00) $k@8@00)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Nodet$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@8@00))
(assert (and
  (< $k@8@00 (- $k@4@00 $k@6@00))
  (<= $Perm.No (- (- $k@4@00 $k@6@00) $k@8@00))
  (Nodet$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00)))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@9@00 ($Snap $Ref) Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (=
    (joined_unfolding@9@00 s@$ this@0@00)
    (Nodet$ ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (=
    (joined_unfolding@9@00 s@$ this@0@00)
    (Nodet$ ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00))))
; Joined path conditions
(assert ($Perm.isReadVar $k@6@00))
(assert ($Perm.isReadVar $k@7@00))
(assert (and
  (< $k@6@00 $k@4@00)
  (<= $Perm.No (- $k@4@00 $k@6@00))
  (Nodevalid$%trigger ($Snap.second s@$) this@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@5@00)
  (<= $k@5@00 $Perm.Write)
  (=> (< $Perm.No $k@5@00) (not (= this@0@00 $Ref.null)))
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
    (< $k@7@00 (- $k@4@00 $k@6@00))
    (<= $Perm.No (- (- $k@4@00 $k@6@00) $k@7@00))
    (Nodet$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00))))
; Joined path conditions
(assert ($Perm.isReadVar $k@8@00))
(assert (and
  (< $k@6@00 $k@4@00)
  (<= $Perm.No (- $k@4@00 $k@6@00))
  (Nodevalid$%trigger ($Snap.second s@$) this@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@5@00)
  (<= $k@5@00 $Perm.Write)
  (=> (< $Perm.No $k@5@00) (not (= this@0@00 $Ref.null)))
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
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (< $k@8@00 (- $k@4@00 $k@6@00))
    (<= $Perm.No (- (- $k@4@00 $k@6@00) $k@8@00))
    (Nodet$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))))
(assert (= result@1@00 (joined_unfolding@9@00 s@$ this@0@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    ($Perm.isReadVar $k@8@00)
    (=>
      (Nodet$%precondition s@$ this@0@00)
      (=
        (Nodet$ s@$ this@0@00)
        (Nodet$%limited ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00))))
  :pattern ((Nodet$ s@$ this@0@00))
  :pattern ((Nodet$%stateless this@0@00) (Nodevalid$%trigger ($Snap.second s@$) this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (Nodet$%precondition s@$ this@0@00)
    (Nodet$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) this@0@00))
  :pattern ((Nodet$ s@$ this@0@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION Nodet2$----------
(declare-fun this@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this != null
(assert (not (= this@2@00 $Ref.null)))
(declare-const $k@10@00 $Perm)
(assert ($Perm.isReadVar $k@10@00))
(assert (<= $Perm.No $k@10@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (Nodet2$%limited s@$ this@2@00) (Nodet2$ s@$ this@2@00))
  :pattern ((Nodet2$ s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (Nodet2$%stateless this@2@00)
  :pattern ((Nodet2$%limited s@$ this@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@10@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this@2@00 $Ref.null)))
(assert (<= $Perm.No $k@10@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Nodep$(this), wildcard) in Nodet$(this))
(declare-const $k@11@00 $Perm)
(assert ($Perm.isReadVar $k@11@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@11@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@12@00 $Perm)
(assert ($Perm.isReadVar $k@12@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@10@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@12@00 $k@10@00))
(assert (<= $Perm.No (- $k@10@00 $k@12@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Nodep$%trigger ($Snap.second s@$) this@2@00))
(declare-const $t@13@00 $Snap)
(assert (and
  (=> (< $Perm.No (- $k@10@00 $k@12@00)) (= $t@13@00 ($Snap.second s@$)))
  (=> (< $Perm.No $k@11@00) (= $t@13@00 ($Snap.second s@$)))))
(assert (<= $Perm.No (+ (- $k@10@00 $k@12@00) $k@11@00)))
; [eval] Nodet$(this)
(set-option :timeout 0)
(push) ; 3
; [eval] this != null
(declare-const $k@14@00 $Perm)
(assert ($Perm.isReadVar $k@14@00))
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Nodevalid$ ----------
(declare-const this@16@00 $Ref)
(push) ; 1
(declare-const $t@17@00 $Snap)
(assert (= $t@17@00 ($Snap.combine ($Snap.first $t@17@00) ($Snap.second $t@17@00))))
(assert (not (= this@16@00 $Ref.null)))
(assert (=
  ($Snap.second $t@17@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@00))
    ($Snap.second ($Snap.second $t@17@00)))))
; [eval] this.Nodenext$ != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@17@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@17@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:($t@17@00)) != Null | live]
; [else-branch: 1 | First:(Second:($t@17@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 1 | First:(Second:($t@17@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@17@00))) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 1 | First:(Second:($t@17@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@17@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@17@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- Nodep$ ----------
(declare-const this@18@00 $Ref)
(push) ; 1
(declare-const $t@19@00 $Snap)
(pop) ; 1
