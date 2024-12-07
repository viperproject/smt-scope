(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:51
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/unofficial001.vpr
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
(declare-fun last ($Snap $Ref $Ref $Ref) $Ref)
(declare-fun last%limited ($Snap $Ref $Ref $Ref) $Ref)
(declare-fun last%stateless ($Ref $Ref $Ref) Bool)
(declare-fun last%precondition ($Snap $Ref $Ref $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION last----------
(declare-fun start@0@00 () $Ref)
(declare-fun end@1@00 () $Ref)
(declare-fun x@2@00 () $Ref)
(declare-fun result@3@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] start != null
(assert (not (= start@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] start != end
(assert (not (= start@0@00 end@1@00)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; [eval] x != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@2@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= x@2@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@2@00 != Null | live]
; [else-branch: 0 | x@2@00 == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | x@2@00 != Null]
(assert (not (= x@2@00 $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 0 | x@2@00 == Null]
(assert (= x@2@00 $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(pop) ; 2
(pop) ; 1
(assert (forall ((s@$ $Snap) (start@0@00 $Ref) (end@1@00 $Ref) (x@2@00 $Ref)) (!
  (=
    (last%limited s@$ start@0@00 end@1@00 x@2@00)
    (last s@$ start@0@00 end@1@00 x@2@00))
  :pattern ((last s@$ start@0@00 end@1@00 x@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (start@0@00 $Ref) (end@1@00 $Ref) (x@2@00 $Ref)) (!
  (last%stateless start@0@00 end@1@00 x@2@00)
  :pattern ((last%limited s@$ start@0@00 end@1@00 x@2@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (not (= x@2@00 $Ref.null)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= start@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (not (= start@0@00 end@1@00)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P(start, end), write) in (start.next != end ? last(start.next, end, x) : null))
(set-option :timeout 0)
(push) ; 2
(assert (P%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) start@0@00 end@1@00))
; [eval] start != end
(push) ; 3
(set-option :timeout 10)
(assert (not (= start@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | start@0@00 != end@1@00 | live]
; [else-branch: 1 | start@0@00 == end@1@00 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | start@0@00 != end@1@00]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@2@00 start@0@00)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] start.next == null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(First:(Second:(Second:(s@$)))) == Null | live]
; [else-branch: 2 | First:(First:(Second:(Second:(s@$)))) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(First:(Second:(Second:(s@$)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] end == null
(assert (= end@1@00 $Ref.null))
; [eval] (start.next != end ? last(start.next, end, x) : null)
; [eval] start.next != end
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(First:(Second:(Second:(s@$)))) != end@1@00 | dead]
; [else-branch: 3 | First:(First:(Second:(Second:(s@$)))) == end@1@00 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 3 | First:(First:(Second:(Second:(s@$)))) == end@1@00]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | First:(First:(Second:(Second:(s@$)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    $Ref.null)))
; [eval] (start.next != end ? last(start.next, end, x) : null)
; [eval] start.next != end
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    end@1@00))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(First:(Second:(Second:(s@$)))) != end@1@00 | live]
; [else-branch: 4 | First:(First:(Second:(Second:(s@$)))) == end@1@00 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | First:(First:(Second:(Second:(s@$)))) != end@1@00]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    end@1@00)))
; [eval] last(start.next, end, x)
(push) ; 7
; [eval] start != null
; [eval] start != end
; [eval] x != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= x@2@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | x@2@00 != Null | live]
; [else-branch: 5 | x@2@00 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 5 | x@2@00 != Null]
(assert (last%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (= x@2@00 $Ref.null))
  (last%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | First:(First:(Second:(Second:(s@$)))) == end@1@00]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      end@1@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        end@1@00))
    (=>
      (not (= x@2@00 $Ref.null))
      (last%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00)))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    end@1@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      end@1@00))))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@4@00 ($Snap $Ref $Ref $Ref) $Ref)
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Ref.null)
    (not (= start@0@00 end@1@00)))
  (= (joined_unfolding@4@00 s@$ start@0@00 end@1@00 x@2@00) $Ref.null)))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        $Ref.null))
    (not (= start@0@00 end@1@00)))
  (=
    (joined_unfolding@4@00 s@$ start@0@00 end@1@00 x@2@00)
    (ite
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
          end@1@00))
      (last ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00)
      $Ref.null))))
; Joined path conditions
(assert (P%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) start@0@00 end@1@00))
(assert (=>
  (not (= start@0@00 end@1@00))
  (=
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(assert (=>
  (and
    (not (= start@0@00 end@1@00))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Ref.null)
    (= ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))) $Snap.unit)
    (= end@1@00 $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      end@1@00))))
; Joined path conditions
(assert (=>
  (and
    (not (= start@0@00 end@1@00))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
          end@1@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
            end@1@00))
        (=>
          (not (= x@2@00 $Ref.null))
          (last%precondition ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00))))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        end@1@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
          end@1@00))))))
(assert (or
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        $Ref.null))
    (not (= start@0@00 end@1@00)))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Ref.null)
    (not (= start@0@00 end@1@00)))))
(assert (= result@3@00 (joined_unfolding@4@00 s@$ start@0@00 end@1@00 x@2@00)))
(pop) ; 1
(push) ; 1
(assert (= x@2@00 $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= start@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (not (= start@0@00 end@1@00)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P(start, end), write) in (start.next != end ? last(start.next, end, x) : null))
(set-option :timeout 0)
(push) ; 2
(assert (P%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) start@0@00 end@1@00))
; [eval] start != end
(push) ; 3
(set-option :timeout 10)
(assert (not (= start@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | start@0@00 != end@1@00 | live]
; [else-branch: 6 | start@0@00 == end@1@00 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | start@0@00 != end@1@00]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
; [eval] start.next == null
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(First:(Second:(Second:(s@$)))) == Null | live]
; [else-branch: 7 | First:(First:(Second:(Second:(s@$)))) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | First:(First:(Second:(Second:(s@$)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] end == null
(assert (= end@1@00 $Ref.null))
; [eval] (start.next != end ? last(start.next, end, x) : null)
; [eval] start.next != end
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(First:(Second:(Second:(s@$)))) != end@1@00 | dead]
; [else-branch: 8 | First:(First:(Second:(Second:(s@$)))) == end@1@00 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 8 | First:(First:(Second:(Second:(s@$)))) == end@1@00]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | First:(First:(Second:(Second:(s@$)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    $Ref.null)))
; [eval] (start.next != end ? last(start.next, end, x) : null)
; [eval] start.next != end
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    end@1@00))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(First:(Second:(Second:(s@$)))) != end@1@00 | live]
; [else-branch: 9 | First:(First:(Second:(Second:(s@$)))) == end@1@00 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 9 | First:(First:(Second:(Second:(s@$)))) != end@1@00]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    end@1@00)))
; [eval] last(start.next, end, x)
(push) ; 7
; [eval] start != null
; [eval] start != end
; [eval] x != null
; [then-branch: 10 | x@2@00 != Null | dead]
; [else-branch: 10 | x@2@00 == Null | live]
(push) ; 8
; [else-branch: 10 | x@2@00 == Null]
(assert (last%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (= x@2@00 $Ref.null)
  (last%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | First:(First:(Second:(Second:(s@$)))) == end@1@00]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
  end@1@00))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      end@1@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        end@1@00))
    (=>
      (= x@2@00 $Ref.null)
      (last%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
            $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00)))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
    end@1@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      end@1@00))))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@5@00 ($Snap $Ref $Ref $Ref) $Ref)
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Ref.null)
    (not (= start@0@00 end@1@00)))
  (= (joined_unfolding@5@00 s@$ start@0@00 end@1@00 x@2@00) $Ref.null)))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        $Ref.null))
    (not (= start@0@00 end@1@00)))
  (=
    (joined_unfolding@5@00 s@$ start@0@00 end@1@00 x@2@00)
    (ite
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
          end@1@00))
      (last ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
            $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00)
      $Ref.null))))
; Joined path conditions
(assert (P%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) start@0@00 end@1@00))
(assert (=>
  (not (= start@0@00 end@1@00))
  (=
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(assert (=>
  (and
    (not (= start@0@00 end@1@00))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Ref.null)
    (= ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))) $Snap.unit)
    (= end@1@00 $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      end@1@00))))
; Joined path conditions
(assert (=>
  (and
    (not (= start@0@00 end@1@00))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        $Ref.null))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
          end@1@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
            end@1@00))
        (=>
          (= x@2@00 $Ref.null)
          (last%precondition ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
                $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00))))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        end@1@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
          end@1@00))))))
(assert (or
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
        $Ref.null))
    (not (= start@0@00 end@1@00)))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Ref.null)
    (not (= start@0@00 end@1@00)))))
(assert (= result@3@00 (joined_unfolding@5@00 s@$ start@0@00 end@1@00 x@2@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (start@0@00 $Ref) (end@1@00 $Ref) (x@2@00 $Ref)) (!
  (=>
    (last%precondition s@$ start@0@00 end@1@00 x@2@00)
    (=
      (last s@$ start@0@00 end@1@00 x@2@00)
      (ite
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
            end@1@00))
        (last%limited (ite
          (not (= x@2@00 $Ref.null))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.second ($Snap.second ($Snap.second s@$))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
                $Snap.unit)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00)
        $Ref.null)))
  :pattern ((last s@$ start@0@00 end@1@00 x@2@00))
  :pattern ((last%stateless start@0@00 end@1@00 x@2@00) (P%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) start@0@00 end@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (start@0@00 $Ref) (end@1@00 $Ref) (x@2@00 $Ref)) (!
  (=>
    (last%precondition s@$ start@0@00 end@1@00 x@2@00)
    (ite
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))
          end@1@00))
      (last%precondition (ite
        (not (= x@2@00 $Ref.null))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
              ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
              $Snap.unit)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))) end@1@00 x@2@00)
      true))
  :pattern ((last s@$ start@0@00 end@1@00 x@2@00))
  :qid |quant-u-3|)))
; ---------- P ----------
(declare-const start@6@00 $Ref)
(declare-const end@7@00 $Ref)
(push) ; 1
; [eval] start != end
(push) ; 2
(set-option :timeout 10)
(assert (not (= start@6@00 end@7@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= start@6@00 end@7@00))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | start@6@00 != end@7@00 | live]
; [else-branch: 11 | start@6@00 == end@7@00 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 11 | start@6@00 != end@7@00]
(assert (not (= start@6@00 end@7@00)))
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 ($Snap.combine ($Snap.first $t@8@00) ($Snap.second $t@8@00))))
(assert (not (= start@6@00 $Ref.null)))
; [eval] start.next == null
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@8@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@8@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:($t@8@00) == Null | live]
; [else-branch: 12 | First:($t@8@00) != Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | First:($t@8@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@8@00)) $Ref.null))
(assert (= ($Snap.second $t@8@00) $Snap.unit))
; [eval] end == null
(assert (= end@7@00 $Ref.null))
(pop) ; 3
(push) ; 3
; [else-branch: 12 | First:($t@8@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@8@00)) $Ref.null)))
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 11 | start@6@00 == end@7@00]
(assert (= start@6@00 end@7@00))
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
