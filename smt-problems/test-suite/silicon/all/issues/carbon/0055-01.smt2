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
; ---------- FUNCTION Nodecontains$----------
(declare-fun this$_4@0@00 () $Ref)
(declare-fun i@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this$_4 != null
(assert (not (= this$_4@0@00 $Ref.null)))
(declare-const $k@5@00 $Perm)
(assert ($Perm.isReadVar $k@5@00))
(assert (<= $Perm.No $k@5@00))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@5@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this$_4@0@00 $Ref.null)))
(assert (<= $Perm.No $k@5@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Nodevalid$(this$_4), wildcard) in i == this$_4.Nodevalue$ || this$_4.Nodenext$ != null && Nodecontains$(this$_4.Nodenext$, i))
(declare-const $k@6@00 $Perm)
(assert ($Perm.isReadVar $k@6@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@7@00 $Perm)
(assert ($Perm.isReadVar $k@7@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@5@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@7@00 $k@5@00))
(assert (<= $Perm.No (- $k@5@00 $k@7@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Nodevalid$%trigger ($Snap.second s@$) this$_4@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@6@00))
(assert (<= $k@6@00 $Perm.Write))
(assert (=> (< $Perm.No $k@6@00) (not (= this$_4@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; [eval] this$_5.Nodenext$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
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
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this$_4@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] i == this$_4.Nodevalue$ || this$_4.Nodenext$ != null && Nodecontains$(this$_4.Nodenext$, i)
; [eval] i == this$_4.Nodevalue$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
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
; [eval] this$_4.Nodenext$ != null && Nodecontains$(this$_4.Nodenext$, i)
; [eval] this$_4.Nodenext$ != null
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
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
; [eval] Nodecontains$(this$_4.Nodenext$, i)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
; [eval] this$_4 != null
(declare-const $k@8@00 $Perm)
(assert ($Perm.isReadVar $k@8@00))
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $k@6@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (< $k@8@00 $k@6@00))
(assert (<= $Perm.No (- $k@6@00 $k@8@00)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@00)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Nodecontains$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@8@00))
(assert (and
  (< $k@8@00 $k@6@00)
  (<= $Perm.No (- $k@6@00 $k@8@00))
  (Nodecontains$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@8@00))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (< $k@8@00 $k@6@00)
    (<= $Perm.No (- $k@6@00 $k@8@00))
    (Nodecontains$%precondition ($Snap.combine
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
(assert ($Perm.isReadVar $k@8@00))
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
        (< $k@8@00 $k@6@00)
        (<= $Perm.No (- $k@6@00 $k@8@00))
        (Nodecontains$%precondition ($Snap.combine
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
; [eval] i == this$_4.Nodevalue$ || this$_4.Nodenext$ != null && Nodecontains$(this$_4.Nodenext$, i)
; [eval] i == this$_4.Nodevalue$
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
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
; [eval] this$_4.Nodenext$ != null && Nodecontains$(this$_4.Nodenext$, i)
; [eval] this$_4.Nodenext$ != null
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
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
; [eval] Nodecontains$(this$_4.Nodenext$, i)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
; [eval] this$_4 != null
(declare-const $k@9@00 $Perm)
(assert ($Perm.isReadVar $k@9@00))
(push) ; 9
(set-option :timeout 10)
(assert (not (= this$_4@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= (- $k@5@00 $k@7@00) $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (< $k@9@00 (- $k@5@00 $k@7@00)))
(assert (<= $Perm.No (- (- $k@5@00 $k@7@00) $k@9@00)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@00)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Nodecontains$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@9@00))
(assert (and
  (< $k@9@00 (- $k@5@00 $k@7@00))
  (<= $Perm.No (- (- $k@5@00 $k@7@00) $k@9@00))
  (Nodecontains$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@9@00))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (< $k@9@00 (- $k@5@00 $k@7@00))
    (<= $Perm.No (- (- $k@5@00 $k@7@00) $k@9@00))
    (Nodecontains$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))
(assert (or
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@9@00))
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
        (< $k@9@00 (- $k@5@00 $k@7@00))
        (<= $Perm.No (- (- $k@5@00 $k@7@00) $k@9@00))
        (Nodecontains$%precondition ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
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
(declare-fun joined_unfolding@10@00 ($Snap $Ref Int) Bool)
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (=
    (joined_unfolding@10@00 s@$ this$_4@0@00 i@1@00)
    (or
      (=
        i@1@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (Nodecontains$ ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (=
    (joined_unfolding@10@00 s@$ this$_4@0@00 i@1@00)
    (or
      (=
        i@1@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (Nodecontains$ ($Snap.combine $Snap.unit ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@7@00))
(assert ($Perm.isReadVar $k@8@00))
(assert (and
  (< $k@7@00 $k@5@00)
  (<= $Perm.No (- $k@5@00 $k@7@00))
  (Nodevalid$%trigger ($Snap.second s@$) this$_4@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@6@00)
  (<= $k@6@00 $Perm.Write)
  (=> (< $Perm.No $k@6@00) (not (= this$_4@0@00 $Ref.null)))
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
            (< $k@8@00 $k@6@00)
            (<= $Perm.No (- $k@6@00 $k@8@00))
            (Nodecontains$%precondition ($Snap.combine
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
(assert ($Perm.isReadVar $k@9@00))
(assert (and
  (< $k@7@00 $k@5@00)
  (<= $Perm.No (- $k@5@00 $k@7@00))
  (Nodevalid$%trigger ($Snap.second s@$) this$_4@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@6@00)
  (<= $k@6@00 $Perm.Write)
  (=> (< $Perm.No $k@6@00) (not (= this$_4@0@00 $Ref.null)))
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
            (< $k@9@00 (- $k@5@00 $k@7@00))
            (<= $Perm.No (- (- $k@5@00 $k@7@00) $k@9@00))
            (Nodecontains$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) i@1@00)))
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
(assert (= result@2@00 (joined_unfolding@10@00 s@$ this$_4@0@00 i@1@00)))
(pop) ; 1
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
; ---------- FUNCTION Nodesize$----------
(declare-fun this$_3@3@00 () $Ref)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this$_3 != null
(assert (not (= this$_3@3@00 $Ref.null)))
(declare-const $k@11@00 $Perm)
(assert ($Perm.isReadVar $k@11@00))
(assert (<= $Perm.No $k@11@00))
(declare-const $t@12@00 $Snap)
(assert (= $t@12@00 $Snap.unit))
; [eval] result > 0
(assert (> result@4@00 0))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@11@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this$_3@3@00 $Ref.null)))
(assert (<= $Perm.No $k@11@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Nodevalid$(this$_3), wildcard) in (this$_3.Nodenext$ != null ? 1 + Nodesize$(this$_3.Nodenext$) : 1))
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@14@00 $Perm)
(assert ($Perm.isReadVar $k@14@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@11@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@14@00 $k@11@00))
(assert (<= $Perm.No (- $k@11@00 $k@14@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Nodevalid$%trigger ($Snap.second s@$) this$_3@3@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (<= $Perm.No $k@13@00))
(assert (<= $k@13@00 $Perm.Write))
(assert (=> (< $Perm.No $k@13@00) (not (= this$_3@3@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; [eval] this$_5.Nodenext$ != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
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
; [then-branch: 5 | First:(Second:(s@$)) != Null | live]
; [else-branch: 5 | First:(Second:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= this$_3@3@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (this$_3.Nodenext$ != null ? 1 + Nodesize$(this$_3.Nodenext$) : 1)
; [eval] this$_3.Nodenext$ != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(s@$)) != Null | live]
; [else-branch: 6 | First:(Second:(s@$)) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | First:(Second:(s@$)) != Null]
; [eval] 1 + Nodesize$(this$_3.Nodenext$)
; [eval] Nodesize$(this$_3.Nodenext$)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_3 != null
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $k@13@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< $k@15@00 $k@13@00))
(assert (<= $Perm.No (- $k@13@00 $k@15@00)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodesize$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@15@00))
(assert (and
  (< $k@15@00 $k@13@00)
  (<= $Perm.No (- $k@13@00 $k@15@00))
  (Nodesize$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@15@00))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (< $k@15@00 $k@13@00)
    (<= $Perm.No (- $k@13@00 $k@15@00))
    (Nodesize$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 5 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (this$_3.Nodenext$ != null ? 1 + Nodesize$(this$_3.Nodenext$) : 1)
; [eval] this$_3.Nodenext$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | First:(Second:(s@$)) != Null | dead]
; [else-branch: 7 | First:(Second:(s@$)) == Null | live]
(push) ; 5
; [else-branch: 7 | First:(Second:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@16@00 ($Snap $Ref) Int)
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (=
    (joined_unfolding@16@00 s@$ this$_3@3@00)
    (+
      1
      (Nodesize$ ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (= (joined_unfolding@16@00 s@$ this$_3@3@00) 1)))
; Joined path conditions
(assert ($Perm.isReadVar $k@14@00))
(assert ($Perm.isReadVar $k@15@00))
(assert (and
  (< $k@14@00 $k@11@00)
  (<= $Perm.No (- $k@11@00 $k@14@00))
  (Nodevalid$%trigger ($Snap.second s@$) this$_3@3@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@13@00)
  (<= $k@13@00 $Perm.Write)
  (=> (< $Perm.No $k@13@00) (not (= this$_3@3@00 $Ref.null)))
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
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (< $k@15@00 $k@13@00)
        (<= $Perm.No (- $k@13@00 $k@15@00))
        (Nodesize$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))))
; Joined path conditions
(assert (and
  (< $k@14@00 $k@11@00)
  (<= $Perm.No (- $k@11@00 $k@14@00))
  (Nodevalid$%trigger ($Snap.second s@$) this$_3@3@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No $k@13@00)
  (<= $k@13@00 $Perm.Write)
  (=> (< $Perm.No $k@13@00) (not (= this$_3@3@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(assert (= result@4@00 (joined_unfolding@16@00 s@$ this$_3@3@00)))
; [eval] result > 0
(push) ; 2
(assert (not (> result@4@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (> result@4@00 0))
(pop) ; 1
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
; ---------- Nodevalid$ ----------
(declare-const this$_5@17@00 $Ref)
(push) ; 1
(declare-const $t@18@00 $Snap)
(assert (= $t@18@00 ($Snap.combine ($Snap.first $t@18@00) ($Snap.second $t@18@00))))
(assert (not (= this$_5@17@00 $Ref.null)))
(assert (=
  ($Snap.second $t@18@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@00))
    ($Snap.second ($Snap.second $t@18@00)))))
; [eval] this$_5.Nodenext$ != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@18@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@18@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:($t@18@00) != Null | live]
; [else-branch: 8 | First:($t@18@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 8 | First:($t@18@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@18@00)) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 8 | First:($t@18@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@18@00)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@18@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
