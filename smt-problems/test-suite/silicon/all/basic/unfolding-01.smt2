(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/unfolding.vpr
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
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid%trigger ($Snap $Ref) Bool)
(declare-fun deeper%trigger ($Snap $Ref) Bool)
(declare-fun strange%trigger ($Snap $Ref) Bool)
(declare-fun deeperfalse%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- valid ----------
(declare-const r@0@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@1@00 $Snap)
(assert (= $t@1@00 ($Snap.combine ($Snap.first $t@1@00) ($Snap.second $t@1@00))))
(assert (not (= r@0@00 $Ref.null)))
(assert (=
  ($Snap.second $t@1@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@1@00))
    ($Snap.second ($Snap.second $t@1@00)))))
; [eval] r.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@1@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@1@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:($t@1@00)) != Null | live]
; [else-branch: 0 | First:(Second:($t@1@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | First:(Second:($t@1@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@1@00))) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 0 | First:(Second:($t@1@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@1@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@1@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- deeper ----------
(declare-const r@2@00 $Ref)
(push) ; 1
(declare-const $t@3@00 $Snap)
(assert (= $t@3@00 ($Snap.combine ($Snap.first $t@3@00) ($Snap.second $t@3@00))))
(assert (not (= r@2@00 $Ref.null)))
(assert (=
  ($Snap.second $t@3@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@00))
    ($Snap.second ($Snap.second $t@3@00)))))
; [eval] r.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:($t@3@00)) != Null | live]
; [else-branch: 1 | First:(Second:($t@3@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 1 | First:(Second:($t@3@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@3@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@3@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@3@00))) $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(push) ; 3
(assert (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@3@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00)))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@3@00)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= r@2@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= r@2@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(First:(Second:(Second:($t@3@00))))) != Null | live]
; [else-branch: 2 | First:(Second:(First:(Second:(Second:($t@3@00))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(Second:(First:(Second:(Second:($t@3@00))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
  $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(push) ; 5
(assert (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  r@2@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  r@2@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
  $Ref.null)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@3@00)))))))) != Null | live]
; [else-branch: 3 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@3@00)))))))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@3@00)))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
  $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(declare-const recunf@4@00 Bool)
(assert (as recunf@4@00  Bool))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@3@00)))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
  $Snap.unit))
(pop) ; 6
(pop) ; 5
(declare-const joined_unfolding@5@00 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
      $Ref.null))
  (= (as joined_unfolding@5@00  Bool) true)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
    $Ref.null)
  (= (as joined_unfolding@5@00  Bool) true)))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
      $Snap.unit)
    (as recunf@4@00  Bool))))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
      $Ref.null))))
(assert (as joined_unfolding@5@00  Bool))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | First:(Second:(First:(Second:(Second:($t@3@00))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))
  $Snap.unit))
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@6@00 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
      $Ref.null))
  (= (as joined_unfolding@6@00  Bool) true)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
    $Ref.null)
  (= (as joined_unfolding@6@00  Bool) true)))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@3@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00))))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@3@00)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
          $Ref.null))
      (= (as joined_unfolding@5@00  Bool) true))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
        $Ref.null)
      (= (as joined_unfolding@5@00  Bool) true))
    (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
          $Snap.unit)
        (as recunf@4@00  Bool)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
          $Ref.null)))
    (as joined_unfolding@5@00  Bool))))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@3@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00))))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@3@00)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@3@00))))))
      $Ref.null))))
(assert (as joined_unfolding@6@00  Bool))
(pop) ; 2
(push) ; 2
; [else-branch: 1 | First:(Second:($t@3@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@3@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@3@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- strange ----------
(declare-const r@7@00 $Ref)
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 ($Snap.combine ($Snap.first $t@8@00) ($Snap.second $t@8@00))))
(assert (not (= r@7@00 $Ref.null)))
(assert (=
  ($Snap.second $t@8@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@00))
    ($Snap.second ($Snap.second $t@8@00)))))
; [eval] r.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:($t@8@00)) != Null | live]
; [else-branch: 4 | First:(Second:($t@8@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 4 | First:(Second:($t@8@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@8@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@00))))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= r@7@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r@7@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))
  $Snap.unit))
; [eval] (unfolding acc(strange(r), write) in true)
(set-option :timeout 0)
(push) ; 3
(assert (strange%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00))))) r@7@00))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@8@00))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))))))
(assert false)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00))))))))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00))))))))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))) $Ref.null)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:($t@8@00)) != Null | dead]
; [else-branch: 5 | First:(Second:($t@8@00)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | First:(Second:($t@8@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))))
  $Snap.unit))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert false)
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00)))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@00)))))))
      $Snap.unit))))
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))) $Ref.null))
(pop) ; 2
(push) ; 2
; [else-branch: 4 | First:(Second:($t@8@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@8@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@8@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- deeperfalse ----------
(declare-const r@9@00 $Ref)
(push) ; 1
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 ($Snap.combine ($Snap.first $t@10@00) ($Snap.second $t@10@00))))
(assert (not (= r@9@00 $Ref.null)))
(assert (=
  ($Snap.second $t@10@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@00))
    ($Snap.second ($Snap.second $t@10@00)))))
(assert (= ($Snap.first ($Snap.second $t@10@00)) $Snap.unit))
; [eval] r.next != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@10@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@10@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@10@00))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@10@00))) $Snap.unit))
; [eval] (unfolding acc(valid(r.next), write) in false)
(push) ; 2
(assert (valid%trigger ($Snap.first ($Snap.second ($Snap.second $t@10@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@10@00)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@10@00))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= r@9@00 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:(Second:(Second:($t@10@00))))) != Null | live]
; [else-branch: 6 | First:(Second:(First:(Second:(Second:($t@10@00))))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(Second:(First:(Second:(Second:($t@10@00))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
    $Ref.null)))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | First:(Second:(First:(Second:(Second:($t@10@00))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00)))))
  $Snap.unit))
(pop) ; 3
(pop) ; 2
(declare-const joined_unfolding@11@00 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
      $Ref.null))
  (= (as joined_unfolding@11@00  Bool) false)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
    $Ref.null)
  (= (as joined_unfolding@11@00  Bool) false)))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second $t@10@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00)))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@10@00)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@10@00))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00)))))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second $t@10@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@00)))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@10@00)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@10@00))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@10@00))))))
      $Ref.null))))
(assert (as joined_unfolding@11@00  Bool))
(pop) ; 1
