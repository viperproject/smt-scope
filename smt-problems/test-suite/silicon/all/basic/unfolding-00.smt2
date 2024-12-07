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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- t1 ----------
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@3@01 Int)
; [exec]
; i := (unfolding acc(valid(r), write) in r.f)
; [eval] (unfolding acc(valid(r), write) in r.f)
(push) ; 3
(assert (valid%trigger $t@2@01 r@1@01))
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= r@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 0 | First:(Second:($t@2@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:(Second:($t@2@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | First:(Second:($t@2@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@2@01)) $Snap.unit))
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@4@01 Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))
      $Ref.null))
  (=
    (as joined_unfolding@4@01  Int)
    ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)
  (=
    (as joined_unfolding@4@01  Int)
    ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)))))
; Joined path conditions
(assert (and
  (valid%trigger $t@2@01 r@1@01)
  (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
  (not (= r@1@01 $Ref.null))
  (=
    ($Snap.second $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@2@01))
      ($Snap.second ($Snap.second $t@2@01))))))
; Joined path conditions
(assert (and
  (valid%trigger $t@2@01 r@1@01)
  (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01)))
  (not (= r@1@01 $Ref.null))
  (=
    ($Snap.second $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@2@01))
      ($Snap.second ($Snap.second $t@2@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second $t@2@01)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))
      $Ref.null))))
(declare-const i@5@01 Int)
(assert (= i@5@01 (as joined_unfolding@4@01  Int)))
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(declare-const r@6@01 $Ref)
(declare-const r@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] r != null
(assert (not (= r@7@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@9@01 Int)
; [exec]
; i := (unfolding acc(valid(r), write) in r.f)
; [eval] (unfolding acc(valid(r), write) in r.f)
(push) ; 3
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t3 ----------
(declare-const r@10@01 $Ref)
(declare-const r@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@13@01 Int)
; [exec]
; i := (unfolding acc(valid(r), write) in
;     (unfolding acc(valid(r), write) in r.f))
; [eval] (unfolding acc(valid(r), write) in (unfolding acc(valid(r), write) in r.f))
(push) ; 3
(assert (valid%trigger $t@12@01 r@11@01))
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (not (= r@11@01 $Ref.null)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:($t@12@01)) != Null | live]
; [else-branch: 1 | First:(Second:($t@12@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(Second:($t@12@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null)))
; [eval] (unfolding acc(valid(r), write) in r.f)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) r@11@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) r@11@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) r@11@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) r@11@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t4 ----------
(declare-const r@14@01 $Ref)
(declare-const r@15@01 $Ref)
(push) ; 1
(declare-const $t@16@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@17@01 Int)
; [exec]
; i := (unfolding acc(deeper(r), write) in (r.next == null ? 0 : r.next.f))
; [eval] (unfolding acc(deeper(r), write) in (r.next == null ? 0 : r.next.f))
(push) ; 3
(assert (deeper%trigger $t@16@01 r@15@01))
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (not (= r@15@01 $Ref.null)))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:($t@16@01)) != Null | live]
; [else-branch: 2 | First:(Second:($t@16@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(Second:($t@16@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(push) ; 5
(assert (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (= r@15@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= r@15@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(First:(Second:(Second:($t@16@01))))) != Null | live]
; [else-branch: 3 | First:(Second:(First:(Second:(Second:($t@16@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | First:(Second:(First:(Second:(Second:($t@16@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(declare-const recunf@18@01 Bool)
(assert (as recunf@18@01  Bool))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | First:(Second:(First:(Second:(Second:($t@16@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
  $Snap.unit))
(pop) ; 6
(pop) ; 5
(declare-const joined_unfolding@19@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      $Ref.null))
  (= (as joined_unfolding@19@01  Bool) true)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null)
  (= (as joined_unfolding@19@01  Bool) true)))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      $Snap.unit)
    (as recunf@18@01  Bool))))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      $Ref.null))))
(assert (as joined_unfolding@19@01  Bool))
; [eval] (r.next == null ? 0 : r.next.f)
; [eval] r.next == null
(push) ; 5
; [then-branch: 4 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 4 | First:(Second:($t@16@01)) != Null | live]
(push) ; 6
; [else-branch: 4 | First:(Second:($t@16@01)) != Null]
(push) ; 7
(set-option :timeout 10)
(assert (not (= r@15@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= r@15@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t5 ----------
(declare-const r@20@01 $Ref)
(declare-const r@21@01 $Ref)
(push) ; 1
(declare-const $t@22@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@23@01 Int)
; [exec]
; i := (unfolding acc(deeper(r), write) in
;     (r.next == null ?
;       0 :
;       (unfolding acc(deeper(r.next), write) in r.next.f)))
; [eval] (unfolding acc(deeper(r), write) in (r.next == null ? 0 : (unfolding acc(deeper(r.next), write) in r.next.f)))
(push) ; 3
(assert (deeper%trigger $t@22@01 r@21@01))
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (not (= r@21@01 $Ref.null)))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:($t@22@01)) != Null | live]
; [else-branch: 5 | First:(Second:($t@22@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | First:(Second:($t@22@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@22@01))) $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(push) ; 5
(assert (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@22@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (= r@21@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= r@21@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:(Second:(Second:($t@22@01))))) != Null | live]
; [else-branch: 6 | First:(Second:(First:(Second:(Second:($t@22@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | First:(Second:(First:(Second:(Second:($t@22@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
  $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(declare-const recunf@24@01 Bool)
(assert (as recunf@24@01  Bool))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | First:(Second:(First:(Second:(Second:($t@22@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
  $Snap.unit))
(pop) ; 6
(pop) ; 5
(declare-const joined_unfolding@25@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      $Ref.null))
  (= (as joined_unfolding@25@01  Bool) true)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    $Ref.null)
  (= (as joined_unfolding@25@01  Bool) true)))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@22@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      $Snap.unit)
    (as recunf@24@01  Bool))))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@22@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      $Ref.null))))
(assert (as joined_unfolding@25@01  Bool))
; [eval] (r.next == null ? 0 : (unfolding acc(deeper(r.next), write) in r.next.f))
; [eval] r.next == null
(push) ; 5
; [then-branch: 7 | First:(Second:($t@22@01)) == Null | dead]
; [else-branch: 7 | First:(Second:($t@22@01)) != Null | live]
(push) ; 6
; [else-branch: 7 | First:(Second:($t@22@01)) != Null]
; [eval] (unfolding acc(deeper(r.next), write) in r.next.f)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= r@21@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= r@21@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(First:(Second:(Second:($t@22@01))))) != Null | live]
; [else-branch: 8 | First:(Second:(First:(Second:(Second:($t@22@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 8 | First:(Second:(First:(Second:(Second:($t@22@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
  $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(push) ; 9
(assert (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  r@21@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  r@21@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@22@01)))))))) != Null | live]
; [else-branch: 9 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@22@01)))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 9 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@22@01)))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
  $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(declare-const recunf@26@01 Bool)
(assert (as recunf@26@01  Bool))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@22@01)))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
  $Snap.unit))
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@27@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
      $Ref.null))
  (= (as joined_unfolding@27@01  Bool) true)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
    $Ref.null)
  (= (as joined_unfolding@27@01  Bool) true)))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
      $Snap.unit)
    (as recunf@26@01  Bool))))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
      $Ref.null))))
(assert (as joined_unfolding@27@01  Bool))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | First:(Second:(First:(Second:(Second:($t@22@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
  $Snap.unit))
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@28@01 Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@28@01  Int)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@28@01  Int)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
          $Ref.null))
      (= (as joined_unfolding@27@01  Bool) true))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
        $Ref.null)
      (= (as joined_unfolding@27@01  Bool) true))
    (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
          $Snap.unit)
        (as recunf@26@01  Bool)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
          $Ref.null)))
    (as joined_unfolding@27@01  Bool))))
; Joined path conditions
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null))
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          $Ref.null))
      (=
        (as joined_unfolding@28@01  Int)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
        $Ref.null)
      (=
        (as joined_unfolding@28@01  Int)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
              $Ref.null))
          (= (as joined_unfolding@27@01  Bool) true))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
            $Ref.null)
          (= (as joined_unfolding@27@01  Bool) true))
        (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
              $Ref.null))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                $Ref.null))
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
              $Snap.unit)
            (as recunf@26@01  Bool)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
            $Ref.null)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
              $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
            $Ref.null)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
              $Ref.null)))
        (as joined_unfolding@27@01  Bool))))))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | First:(Second:($t@22@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@22@01)) $Snap.unit))
; [eval] (r.next == null ? 0 : (unfolding acc(deeper(r.next), write) in r.next.f))
; [eval] r.next == null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:($t@22@01)) == Null | live]
; [else-branch: 10 | First:(Second:($t@22@01)) != Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 10 | First:(Second:($t@22@01)) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@29@01 Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null))
  (= (as joined_unfolding@29@01  Int) (as joined_unfolding@28@01  Int))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)
  (= (as joined_unfolding@29@01  Int) 0)))
; Joined path conditions
(assert (and
  (deeper%trigger $t@22@01 r@21@01)
  (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01)))
  (not (= r@21@01 $Ref.null))
  (=
    ($Snap.second $t@22@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@22@01))
      ($Snap.second ($Snap.second $t@22@01))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second $t@22@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
        ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
    (= ($Snap.second ($Snap.second ($Snap.second $t@22@01))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          $Ref.null))
      (= (as joined_unfolding@25@01  Bool) true))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
        $Ref.null)
      (= (as joined_unfolding@25@01  Bool) true))
    (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@22@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))))
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          $Snap.unit)
        (as recunf@24@01  Bool)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
          $Ref.null)))
    (as joined_unfolding@25@01  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
          $Ref.null))
      (and
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
              $Ref.null))
          (=
            (as joined_unfolding@28@01  Int)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
            $Ref.null)
          (=
            (as joined_unfolding@28@01  Int)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
              $Ref.null))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
                $Ref.null))
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
              $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                  $Ref.null))
              (= (as joined_unfolding@27@01  Bool) true))
            (=>
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                $Ref.null)
              (= (as joined_unfolding@27@01  Bool) true))
            (deeper%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
            (=
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))
              ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
            (=
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
                ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))))
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                  $Ref.null))
              (and
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                    $Ref.null))
                (=
                  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))))
                (=
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                  $Snap.unit)
                (as recunf@26@01  Bool)))
            (=>
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                $Ref.null)
              (and
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                  $Ref.null)
                (=
                  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01))))))))
                  $Snap.unit)))
            (or
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                $Ref.null)
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@22@01)))))))))
                  $Ref.null)))
            (as joined_unfolding@27@01  Bool))))))))
; Joined path conditions
(assert (and
  (deeper%trigger $t@22@01 r@21@01)
  (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01)))
  (not (= r@21@01 $Ref.null))
  (=
    ($Snap.second $t@22@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@22@01))
      ($Snap.second ($Snap.second $t@22@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second $t@22@01)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@22@01)))
      $Ref.null))))
(declare-const i@30@01 Int)
(assert (= i@30@01 (as joined_unfolding@29@01  Int)))
(pop) ; 2
(pop) ; 1
; ---------- t6 ----------
(declare-const r@31@01 $Ref)
(declare-const r@32@01 $Ref)
(push) ; 1
(declare-const $t@33@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@34@01 Int)
; [exec]
; i := (unfolding acc(deeper(r), write) in
;     (r.next == null ? 0 : (r.next.next == null ? 0 : r.next.next.f)))
; [eval] (unfolding acc(deeper(r), write) in (r.next == null ? 0 : (r.next.next == null ? 0 : r.next.next.f)))
(push) ; 3
(assert (deeper%trigger $t@33@01 r@32@01))
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (not (= r@32@01 $Ref.null)))
(assert (=
  ($Snap.second $t@33@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@33@01))
    ($Snap.second ($Snap.second $t@33@01)))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:($t@33@01)) != Null | live]
; [else-branch: 11 | First:(Second:($t@33@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | First:(Second:($t@33@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@33@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@33@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@33@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@33@01))) $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(push) ; 5
(assert (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@33@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01)))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@33@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@33@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (= r@32@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= r@32@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))))))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(First:(Second:(Second:($t@33@01))))) != Null | live]
; [else-branch: 12 | First:(Second:(First:(Second:(Second:($t@33@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 12 | First:(Second:(First:(Second:(Second:($t@33@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
  $Snap.unit))
; [eval] (unfolding acc(deeper(r.next), write) in true)
(declare-const recunf@35@01 Bool)
(assert (as recunf@35@01  Bool))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | First:(Second:(First:(Second:(Second:($t@33@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))
  $Snap.unit))
(pop) ; 6
(pop) ; 5
(declare-const joined_unfolding@36@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
      $Ref.null))
  (= (as joined_unfolding@36@01  Bool) true)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
    $Ref.null)
  (= (as joined_unfolding@36@01  Bool) true)))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@33@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@33@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@33@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
      $Snap.unit)
    (as recunf@35@01  Bool))))
; Joined path conditions
(assert (and
  (deeper%trigger ($Snap.first ($Snap.second ($Snap.second $t@33@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@33@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@33@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@33@01))))))
      $Ref.null))))
(assert (as joined_unfolding@36@01  Bool))
; [eval] (r.next == null ? 0 : (r.next.next == null ? 0 : r.next.next.f))
; [eval] r.next == null
(push) ; 5
; [then-branch: 13 | First:(Second:($t@33@01)) == Null | dead]
; [else-branch: 13 | First:(Second:($t@33@01)) != Null | live]
(push) ; 6
; [else-branch: 13 | First:(Second:($t@33@01)) != Null]
; [eval] (r.next.next == null ? 0 : r.next.next.f)
; [eval] r.next.next == null
(push) ; 7
(set-option :timeout 10)
(assert (not (= r@32@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= r@32@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@33@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t7 ----------
(declare-const r@37@01 $Ref)
(declare-const r@38@01 $Ref)
(push) ; 1
(declare-const $t@39@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert false
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
(pop) ; 2
(pop) ; 1
; ---------- t8 ----------
(declare-const r@40@01 $Ref)
(declare-const r@41@01 $Ref)
(push) ; 1
(declare-const $t@42@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (unfolding acc(strange(r), write) in false)
; [eval] (unfolding acc(strange(r), write) in false)
(push) ; 3
(assert (strange%trigger $t@42@01 r@41@01))
(assert (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01))))
(assert (not (= r@41@01 $Ref.null)))
(assert (=
  ($Snap.second $t@42@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@42@01))
    ($Snap.second ($Snap.second $t@42@01)))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:($t@42@01)) != Null | live]
; [else-branch: 14 | First:(Second:($t@42@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 14 | First:(Second:($t@42@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@42@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@42@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@42@01))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@41@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@42@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@42@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@41@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))
  $Snap.unit))
; [eval] (unfolding acc(strange(r), write) in true)
(set-option :timeout 0)
(push) ; 5
(assert (strange%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01))))) r@41@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))))))
(assert false)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01))))))))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01))))))))))
; [eval] r.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:($t@42@01)) != Null | dead]
; [else-branch: 15 | First:(Second:($t@42@01)) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 15 | First:(Second:($t@42@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))))
  $Snap.unit))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert false)
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01)))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@01)))))))
      $Snap.unit))))
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | First:(Second:($t@42@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@42@01)) $Snap.unit))
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@43@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01)))
      $Ref.null))
  (= (as joined_unfolding@43@01  Bool) false)))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)
  (= (as joined_unfolding@43@01  Bool) false)))
; Joined path conditions
(assert (and
  (strange%trigger $t@42@01 r@41@01)
  (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01)))
  (not (= r@41@01 $Ref.null))
  (=
    ($Snap.second $t@42@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@42@01))
      ($Snap.second ($Snap.second $t@42@01))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01)))
      $Ref.null))
  false))
; Joined path conditions
(assert (and
  (strange%trigger $t@42@01 r@41@01)
  (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01)))
  (not (= r@41@01 $Ref.null))
  (=
    ($Snap.second $t@42@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@42@01))
      ($Snap.second ($Snap.second $t@42@01))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01)))
      $Ref.null)
    (= ($Snap.second ($Snap.second $t@42@01)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01)))
      $Ref.null))))
(push) ; 3
(assert (not (as joined_unfolding@43@01  Bool)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(strange(r), write) in false)
(set-option :timeout 0)
(push) ; 3
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:($t@42@01)) != Null | dead]
; [else-branch: 16 | First:(Second:($t@42@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 16 | First:(Second:($t@42@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@42@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(strange(r), write) in false)
(set-option :timeout 0)
(push) ; 3
; [eval] r.next != null
; [then-branch: 17 | First:(Second:($t@42@01)) != Null | dead]
; [else-branch: 17 | First:(Second:($t@42@01)) == Null | live]
(push) ; 4
; [else-branch: 17 | First:(Second:($t@42@01)) == Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@42@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@42@01))) $Ref.null)
  (= ($Snap.second ($Snap.second $t@42@01)) $Snap.unit)))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(strange(r), write) in false)
(set-option :timeout 0)
(push) ; 3
; [eval] r.next != null
; [then-branch: 18 | First:(Second:($t@42@01)) != Null | dead]
; [else-branch: 18 | First:(Second:($t@42@01)) == Null | live]
(push) ; 4
; [else-branch: 18 | First:(Second:($t@42@01)) == Null]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($Snap.second ($Snap.second $t@42@01)) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- t9 ----------
(declare-const r@44@01 $Ref)
(declare-const r@45@01 $Ref)
(push) ; 1
(declare-const $t@46@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(strange(r), write)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (not (= r@45@01 $Ref.null)))
(assert (=
  ($Snap.second $t@46@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@46@01))
    ($Snap.second ($Snap.second $t@46@01)))))
; [eval] r.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:($t@46@01)) != Null | live]
; [else-branch: 19 | First:(Second:($t@46@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 19 | First:(Second:($t@46@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@46@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@46@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= r@45@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@46@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@46@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= r@45@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))
  $Snap.unit))
; [eval] (unfolding acc(strange(r), write) in true)
(set-option :timeout 0)
(push) ; 4
(assert (strange%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))) r@45@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@46@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))
(assert false)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))
; [eval] r.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))) $Ref.null)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:($t@46@01)) != Null | dead]
; [else-branch: 20 | First:(Second:($t@46@01)) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 20 | First:(Second:($t@46@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
  $Snap.unit))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert false)
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))) $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01)))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
      $Snap.unit))))
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))) $Ref.null))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unsat
(assert (strange%trigger $t@46@01 r@45@01))
; [exec]
; assert r.next == null
; [eval] r.next == null
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 19 | First:(Second:($t@46@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@46@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@46@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (strange%trigger $t@46@01 r@45@01))
; [exec]
; assert r.next == null
; [eval] r.next == null
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t10 ----------
(declare-const r@47@01 $Ref)
(declare-const i@48@01 Int)
(declare-const r@49@01 $Ref)
(declare-const i@50@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@51@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 ($Snap.combine ($Snap.first $t@52@01) ($Snap.second $t@52@01))))
(assert (= ($Snap.second $t@52@01) $Snap.unit))
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 3
(assert (valid%trigger ($Snap.first $t@52@01) r@49@01))
(assert (=
  ($Snap.first $t@52@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@52@01))
    ($Snap.second ($Snap.first $t@52@01)))))
(assert (not (= r@49@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@52@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@52@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@52@01))))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | First:(Second:(First:($t@52@01))) != Null | live]
; [else-branch: 21 | First:(Second:(First:($t@52@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | First:(Second:(First:($t@52@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
    $Ref.null)))
; [eval] r.f > 2
(pop) ; 4
(push) ; 4
; [else-branch: 21 | First:(Second:(First:($t@52@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@52@01))) $Snap.unit))
; [eval] r.f > 2
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@53@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
      $Ref.null))
  (=
    (as joined_unfolding@53@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@52@01))) 2))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
    $Ref.null)
  (=
    (as joined_unfolding@53@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@52@01))) 2))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first $t@52@01) r@49@01)
  (=
    ($Snap.first $t@52@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@52@01))
      ($Snap.second ($Snap.first $t@52@01))))
  (not (= r@49@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@52@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@52@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@52@01)))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first $t@52@01) r@49@01)
  (=
    ($Snap.first $t@52@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@52@01))
      ($Snap.second ($Snap.first $t@52@01))))
  (not (= r@49@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@52@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@52@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@52@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@52@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@52@01))))
      $Ref.null))))
(assert (as joined_unfolding@53@01  Bool))
(pop) ; 2
(push) ; 2
; [exec]
; var j: Int
(declare-const j@54@01 Int)
; [exec]
; j := i
; [exec]
; unfold acc(valid(r), write)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (not (= r@49@01 $Ref.null)))
(assert (=
  ($Snap.second $t@51@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))))
; [eval] r.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@51@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@51@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(Second:($t@51@01)) != Null | live]
; [else-branch: 22 | First:(Second:($t@51@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 22 | First:(Second:($t@51@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@51@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@51@01 r@49@01))
; [exec]
; r.f := 3
; [exec]
; fold acc(valid(r), write)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@51@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | First:(Second:($t@51@01)) != Null | live]
; [else-branch: 23 | First:(Second:($t@51@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | First:(Second:($t@51@01)) != Null]
(assert (valid%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))) r@49@01))
(declare-const j@55@01 Int)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 ($Snap.combine ($Snap.first $t@56@01) ($Snap.second $t@56@01))))
(assert (= ($Snap.second $t@56@01) $Snap.unit))
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 6
(assert (valid%trigger ($Snap.first $t@56@01) r@49@01))
(assert (=
  ($Snap.first $t@56@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@56@01))
    ($Snap.second ($Snap.first $t@56@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@56@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@56@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@56@01))))))
; [eval] r.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | First:(Second:(First:($t@56@01))) != Null | live]
; [else-branch: 24 | First:(Second:(First:($t@56@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 24 | First:(Second:(First:($t@56@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)))
; [eval] r.f > 2
(pop) ; 7
(push) ; 7
; [else-branch: 24 | First:(Second:(First:($t@56@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@56@01))) $Snap.unit))
; [eval] r.f > 2
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@57@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
      $Ref.null))
  (=
    (as joined_unfolding@57@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@56@01))) 2))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)
  (=
    (as joined_unfolding@57@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@56@01))) 2))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first $t@56@01) r@49@01)
  (=
    ($Snap.first $t@56@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@56@01))
      ($Snap.second ($Snap.first $t@56@01))))
  (=
    ($Snap.second ($Snap.first $t@56@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@56@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@56@01)))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first $t@56@01) r@49@01)
  (=
    ($Snap.first $t@56@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@56@01))
      ($Snap.second ($Snap.first $t@56@01))))
  (=
    ($Snap.second ($Snap.first $t@56@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@56@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@56@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@56@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
      $Ref.null))))
(assert (as joined_unfolding@57@01  Bool))
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 6
; [eval] r.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@51@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | First:(Second:($t@51@01)) != Null | live]
; [else-branch: 25 | First:(Second:($t@51@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 25 | First:(Second:($t@51@01)) != Null]
; [eval] r.f > 2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 6
(assert (= $t@56@01 ($Snap.combine ($Snap.first $t@56@01) ($Snap.second $t@56@01))))
(assert (= ($Snap.second $t@56@01) $Snap.unit))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
      $Ref.null))
  (=
    (as joined_unfolding@57@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@56@01))) 2))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)
  (=
    (as joined_unfolding@57@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@56@01))) 2))))
(assert (valid%trigger ($Snap.first $t@56@01) r@49@01))
(assert (=
  ($Snap.first $t@56@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@56@01))
    ($Snap.second ($Snap.first $t@56@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@56@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@56@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@56@01))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@56@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
      $Ref.null))))
(assert (as joined_unfolding@57@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 7
; [eval] j > 0
(pop) ; 7
(push) ; 7
; [eval] !(j > 0)
; [eval] j > 0
(pop) ; 7
; Loop head block: Follow loop-internal edges
; [eval] j > 0
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> j@55@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (> j@55@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | j@55@01 > 0 | live]
; [else-branch: 26 | !(j@55@01 > 0) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 26 | j@55@01 > 0]
(assert (> j@55@01 0))
; [exec]
; j := j - 1
; [eval] j - 1
(declare-const j@58@01 Int)
(assert (= j@58@01 (- j@55@01 1)))
; [exec]
; unfold acc(valid(r), write)
; [eval] r.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | First:(Second:(First:($t@56@01))) != Null | live]
; [else-branch: 27 | First:(Second:(First:($t@56@01))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 27 | First:(Second:(First:($t@56@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; r.f := r.f + 1
; [eval] r.f + 1
(declare-const f@59@01 Int)
(assert (= f@59@01 (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@56@01))) 1)))
; [exec]
; fold acc(valid(r), write)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | First:(Second:(First:($t@56@01))) != Null | live]
; [else-branch: 28 | First:(Second:(First:($t@56@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 28 | First:(Second:(First:($t@56@01))) != Null]
(assert (valid%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap f@59@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@56@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@56@01))))) r@49@01))
; Loop head block: Re-establish invariant
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 10
; [eval] r.next != null
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | First:(Second:(First:($t@56@01))) != Null | live]
; [else-branch: 29 | First:(Second:(First:($t@56@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 29 | First:(Second:(First:($t@56@01))) != Null]
; [eval] r.f > 2
(pop) ; 11
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (> f@59@01 2)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (> f@59@01 2))
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 27 | First:(Second:(First:($t@56@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@56@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; r.f := r.f + 1
; [eval] r.f + 1
(declare-const f@60@01 Int)
(assert (= f@60@01 (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@56@01))) 1)))
; [exec]
; fold acc(valid(r), write)
; [eval] r.next != null
; [then-branch: 30 | First:(Second:(First:($t@56@01))) != Null | dead]
; [else-branch: 30 | First:(Second:(First:($t@56@01))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 30 | First:(Second:(First:($t@56@01))) == Null]
(assert (valid%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap f@60@01)
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@56@01))) $Snap.unit)) r@49@01))
; Loop head block: Re-establish invariant
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 10
; [eval] r.next != null
; [then-branch: 31 | First:(Second:(First:($t@56@01))) != Null | dead]
; [else-branch: 31 | First:(Second:(First:($t@56@01))) == Null | live]
(push) ; 11
; [else-branch: 31 | First:(Second:(First:($t@56@01))) == Null]
; [eval] r.f > 2
(pop) ; 11
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (> f@60@01 2)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (> f@60@01 2))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 26 | !(j@55@01 > 0)]
(assert (not (> j@55@01 0)))
(pop) ; 7
; [eval] !(j > 0)
; [eval] j > 0
(push) ; 7
(set-option :timeout 10)
(assert (not (> j@55@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> j@55@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | !(j@55@01 > 0) | live]
; [else-branch: 32 | j@55@01 > 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 32 | !(j@55@01 > 0)]
(assert (not (> j@55@01 0)))
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 8
; [eval] r.next != null
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | First:(Second:(First:($t@56@01))) != Null | live]
; [else-branch: 33 | First:(Second:(First:($t@56@01))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 33 | First:(Second:(First:($t@56@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)))
; [eval] r.f > 2
(pop) ; 9
(push) ; 9
; [else-branch: 33 | First:(Second:(First:($t@56@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@56@01))) $Snap.unit))
; [eval] r.f > 2
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@61@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
      $Ref.null))
  (=
    (as joined_unfolding@61@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@56@01))) 2))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@56@01))))
    $Ref.null)
  (=
    (as joined_unfolding@61@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@56@01))) 2))))
; Joined path conditions
; Joined path conditions
(push) ; 8
(assert (not (as joined_unfolding@61@01  Bool)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@61@01  Bool))
(pop) ; 7
(push) ; 7
; [else-branch: 32 | j@55@01 > 0]
(assert (> j@55@01 0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 22 | First:(Second:($t@51@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@51@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@51@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@51@01 r@49@01))
; [exec]
; r.f := 3
; [exec]
; fold acc(valid(r), write)
; [eval] r.next != null
; [then-branch: 34 | First:(Second:($t@51@01)) != Null | dead]
; [else-branch: 34 | First:(Second:($t@51@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 34 | First:(Second:($t@51@01)) == Null]
(assert (valid%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($Snap.combine ($Snap.first ($Snap.second $t@51@01)) $Snap.unit)) r@49@01))
(declare-const j@62@01 Int)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (= ($Snap.second $t@63@01) $Snap.unit))
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 6
(assert (valid%trigger ($Snap.first $t@63@01) r@49@01))
(assert (=
  ($Snap.first $t@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@63@01))
    ($Snap.second ($Snap.first $t@63@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@63@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@63@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@63@01))))))
; [eval] r.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | First:(Second:(First:($t@63@01))) != Null | live]
; [else-branch: 35 | First:(Second:(First:($t@63@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 35 | First:(Second:(First:($t@63@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)))
; [eval] r.f > 2
(pop) ; 7
(push) ; 7
; [else-branch: 35 | First:(Second:(First:($t@63@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@63@01))) $Snap.unit))
; [eval] r.f > 2
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@64@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
      $Ref.null))
  (=
    (as joined_unfolding@64@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@63@01))) 2))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)
  (=
    (as joined_unfolding@64@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@63@01))) 2))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first $t@63@01) r@49@01)
  (=
    ($Snap.first $t@63@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@63@01))
      ($Snap.second ($Snap.first $t@63@01))))
  (=
    ($Snap.second ($Snap.first $t@63@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@63@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@63@01)))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first $t@63@01) r@49@01)
  (=
    ($Snap.first $t@63@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@63@01))
      ($Snap.second ($Snap.first $t@63@01))))
  (=
    ($Snap.second ($Snap.first $t@63@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@63@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@63@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@63@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
      $Ref.null))))
(assert (as joined_unfolding@64@01  Bool))
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 6
; [eval] r.next != null
; [then-branch: 36 | First:(Second:($t@51@01)) != Null | dead]
; [else-branch: 36 | First:(Second:($t@51@01)) == Null | live]
(push) ; 7
; [else-branch: 36 | First:(Second:($t@51@01)) == Null]
; [eval] r.f > 2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 6
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (= ($Snap.second $t@63@01) $Snap.unit))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
      $Ref.null))
  (=
    (as joined_unfolding@64@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@63@01))) 2))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)
  (=
    (as joined_unfolding@64@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@63@01))) 2))))
(assert (valid%trigger ($Snap.first $t@63@01) r@49@01))
(assert (=
  ($Snap.first $t@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@63@01))
    ($Snap.second ($Snap.first $t@63@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@63@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@63@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@63@01))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@63@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
      $Ref.null))))
(assert (as joined_unfolding@64@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 7
; [eval] j > 0
(pop) ; 7
(push) ; 7
; [eval] !(j > 0)
; [eval] j > 0
(pop) ; 7
; Loop head block: Follow loop-internal edges
; [eval] j > 0
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> j@62@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (> j@62@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | j@62@01 > 0 | live]
; [else-branch: 37 | !(j@62@01 > 0) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 37 | j@62@01 > 0]
(assert (> j@62@01 0))
; [exec]
; j := j - 1
; [eval] j - 1
(declare-const j@65@01 Int)
(assert (= j@65@01 (- j@62@01 1)))
; [exec]
; unfold acc(valid(r), write)
; [eval] r.next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(Second:(First:($t@63@01))) != Null | live]
; [else-branch: 38 | First:(Second:(First:($t@63@01))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 38 | First:(Second:(First:($t@63@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; r.f := r.f + 1
; [eval] r.f + 1
(declare-const f@66@01 Int)
(assert (= f@66@01 (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@63@01))) 1)))
; [exec]
; fold acc(valid(r), write)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(Second:(First:($t@63@01))) != Null | live]
; [else-branch: 39 | First:(Second:(First:($t@63@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 39 | First:(Second:(First:($t@63@01))) != Null]
(assert (valid%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap f@66@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@63@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@63@01))))) r@49@01))
; Loop head block: Re-establish invariant
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 10
; [eval] r.next != null
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | First:(Second:(First:($t@63@01))) != Null | live]
; [else-branch: 40 | First:(Second:(First:($t@63@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 40 | First:(Second:(First:($t@63@01))) != Null]
; [eval] r.f > 2
(pop) ; 11
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (> f@66@01 2)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (> f@66@01 2))
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 38 | First:(Second:(First:($t@63@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@63@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; r.f := r.f + 1
; [eval] r.f + 1
(declare-const f@67@01 Int)
(assert (= f@67@01 (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@63@01))) 1)))
; [exec]
; fold acc(valid(r), write)
; [eval] r.next != null
; [then-branch: 41 | First:(Second:(First:($t@63@01))) != Null | dead]
; [else-branch: 41 | First:(Second:(First:($t@63@01))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 41 | First:(Second:(First:($t@63@01))) == Null]
(assert (valid%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap f@67@01)
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@63@01))) $Snap.unit)) r@49@01))
; Loop head block: Re-establish invariant
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 10
; [eval] r.next != null
; [then-branch: 42 | First:(Second:(First:($t@63@01))) != Null | dead]
; [else-branch: 42 | First:(Second:(First:($t@63@01))) == Null | live]
(push) ; 11
; [else-branch: 42 | First:(Second:(First:($t@63@01))) == Null]
; [eval] r.f > 2
(pop) ; 11
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (> f@67@01 2)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (> f@67@01 2))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 37 | !(j@62@01 > 0)]
(assert (not (> j@62@01 0)))
(pop) ; 7
; [eval] !(j > 0)
; [eval] j > 0
(push) ; 7
(set-option :timeout 10)
(assert (not (> j@62@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> j@62@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | !(j@62@01 > 0) | live]
; [else-branch: 43 | j@62@01 > 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 43 | !(j@62@01 > 0)]
(assert (not (> j@62@01 0)))
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 8
; [eval] r.next != null
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | First:(Second:(First:($t@63@01))) != Null | live]
; [else-branch: 44 | First:(Second:(First:($t@63@01))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 44 | First:(Second:(First:($t@63@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)))
; [eval] r.f > 2
(pop) ; 9
(push) ; 9
; [else-branch: 44 | First:(Second:(First:($t@63@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@63@01))) $Snap.unit))
; [eval] r.f > 2
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@68@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
      $Ref.null))
  (=
    (as joined_unfolding@68@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@63@01))) 2))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@63@01))))
    $Ref.null)
  (=
    (as joined_unfolding@68@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@63@01))) 2))))
; Joined path conditions
; Joined path conditions
(push) ; 8
(assert (not (as joined_unfolding@68@01  Bool)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (as joined_unfolding@68@01  Bool))
(pop) ; 7
(push) ; 7
; [else-branch: 43 | j@62@01 > 0]
(assert (> j@62@01 0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t11 ----------
(declare-const r@69@01 $Ref)
(declare-const r@70@01 $Ref)
(push) ; 1
(declare-const $t@71@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 ($Snap.combine ($Snap.first $t@72@01) ($Snap.second $t@72@01))))
(assert (not (= r@70@01 $Ref.null)))
(assert (= ($Snap.second $t@72@01) $Snap.unit))
; [eval] r.f > 2
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@72@01)) 2))
(pop) ; 2
(push) ; 2
; [exec]
; t10(r, 0)
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 ($Snap.combine ($Snap.first $t@73@01) ($Snap.second $t@73@01))))
(assert (= ($Snap.second $t@73@01) $Snap.unit))
; [eval] (unfolding acc(valid(r), write) in r.f > 2)
(push) ; 3
(assert (valid%trigger ($Snap.first $t@73@01) r@70@01))
(assert (=
  ($Snap.first $t@73@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@73@01))
    ($Snap.second ($Snap.first $t@73@01)))))
(assert (not (= r@70@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@73@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@73@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@73@01))))))
; [eval] r.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:(First:($t@73@01))) != Null | live]
; [else-branch: 45 | First:(Second:(First:($t@73@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 45 | First:(Second:(First:($t@73@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
    $Ref.null)))
; [eval] r.f > 2
(pop) ; 4
(push) ; 4
; [else-branch: 45 | First:(Second:(First:($t@73@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@73@01))) $Snap.unit))
; [eval] r.f > 2
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@74@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
      $Ref.null))
  (=
    (as joined_unfolding@74@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@73@01))) 2))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
    $Ref.null)
  (=
    (as joined_unfolding@74@01  Bool)
    (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@73@01))) 2))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first $t@73@01) r@70@01)
  (=
    ($Snap.first $t@73@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@73@01))
      ($Snap.second ($Snap.first $t@73@01))))
  (not (= r@70@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@73@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@73@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@73@01)))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first $t@73@01) r@70@01)
  (=
    ($Snap.first $t@73@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@73@01))
      ($Snap.second ($Snap.first $t@73@01))))
  (not (= r@70@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@73@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@73@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@73@01)))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
      $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first $t@73@01))) $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
      $Ref.null))))
(assert (as joined_unfolding@74@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(valid(r), write)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | First:(Second:(First:($t@73@01))) != Null | live]
; [else-branch: 46 | First:(Second:(First:($t@73@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 46 | First:(Second:(First:($t@73@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [eval] r.f > 2
(set-option :timeout 0)
(push) ; 4
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@73@01))) 2)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@73@01))) 2))
(pop) ; 3
(push) ; 3
; [else-branch: 46 | First:(Second:(First:($t@73@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@73@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@73@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [eval] r.f > 2
(set-option :timeout 0)
(push) ; 4
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@73@01))) 2)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@73@01))) 2))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t12 ----------
(declare-const r@75@01 $Ref)
(declare-const r@76@01 $Ref)
(push) ; 1
(declare-const $t@77@01 $Snap)
(assert (= $t@77@01 ($Snap.combine ($Snap.first $t@77@01) ($Snap.second $t@77@01))))
(assert (= ($Snap.second $t@77@01) $Snap.unit))
; [eval] (unfolding acc(deeperfalse(r), write) in true)
(push) ; 2
(assert (deeperfalse%trigger ($Snap.first $t@77@01) r@76@01))
(assert (=
  ($Snap.first $t@77@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@77@01))
    ($Snap.second ($Snap.first $t@77@01)))))
(assert (not (= r@76@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@77@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@77@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.first $t@77@01))) $Snap.unit))
; [eval] r.next != null
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@77@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@77@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@77@01))))
  $Snap.unit))
; [eval] (unfolding acc(valid(r.next), write) in false)
(push) ; 3
(assert (valid%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@77@01)))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= r@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@77@01))))))
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | First:(Second:(First:(Second:(Second:(First:($t@77@01)))))) != Null | live]
; [else-branch: 47 | First:(Second:(First:(Second:(Second:(First:($t@77@01)))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 47 | First:(Second:(First:(Second:(Second:(First:($t@77@01)))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
    $Ref.null)))
(pop) ; 4
(push) ; 4
; [else-branch: 47 | First:(Second:(First:(Second:(Second:(First:($t@77@01)))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
  $Snap.unit))
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@78@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
      $Ref.null))
  (= (as joined_unfolding@78@01  Bool) false)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
    $Ref.null)
  (= (as joined_unfolding@78@01  Bool) false)))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@77@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@77@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
      $Ref.null))))
(assert (as joined_unfolding@78@01  Bool))
(pop) ; 2
; Joined path conditions
(assert (and
  (deeperfalse%trigger ($Snap.first $t@77@01) r@76@01)
  (=
    ($Snap.first $t@77@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@77@01))
      ($Snap.second ($Snap.first $t@77@01))))
  (not (= r@76@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first $t@77@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@77@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
  (= ($Snap.first ($Snap.second ($Snap.first $t@77@01))) $Snap.unit)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@77@01)))
      $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@77@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@77@01))))
    $Snap.unit)
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
        $Ref.null))
    (= (as joined_unfolding@78@01  Bool) false))
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
      $Ref.null)
    (= (as joined_unfolding@78@01  Bool) false))
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@77@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))))
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
      $Ref.null)
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
        $Ref.null)
      (=
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01))))))
        $Snap.unit)))
  (or
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@77@01)))))))
        $Ref.null)))
  (as joined_unfolding@78@01  Bool)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 2
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
(push) ; 3
(assert (not false))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert false)
(pop) ; 2
(pop) ; 1
; ---------- t13 ----------
(declare-const r@80@01 $Ref)
(declare-const r@81@01 $Ref)
(push) ; 1
(declare-const $t@82@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
; [exec]
; t12(r)
; [eval] (unfolding acc(deeperfalse(r), write) in true)
(push) ; 3
(assert (deeperfalse%trigger $t@82@01 r@81@01))
(assert (= $t@82@01 ($Snap.combine ($Snap.first $t@82@01) ($Snap.second $t@82@01))))
(assert (not (= r@81@01 $Ref.null)))
(assert (=
  ($Snap.second $t@82@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@82@01))
    ($Snap.second ($Snap.second $t@82@01)))))
(assert (= ($Snap.first ($Snap.second $t@82@01)) $Snap.unit))
; [eval] r.next != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@82@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@82@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@82@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@82@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@82@01))) $Snap.unit))
; [eval] (unfolding acc(valid(r.next), write) in false)
(push) ; 4
(assert (valid%trigger ($Snap.first ($Snap.second ($Snap.second $t@82@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@82@01))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@82@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@82@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@81@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@82@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] r.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | First:(Second:(First:(Second:(Second:($t@82@01))))) != Null | live]
; [else-branch: 48 | First:(Second:(First:(Second:(Second:($t@82@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 48 | First:(Second:(First:(Second:(Second:($t@82@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
    $Ref.null)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | First:(Second:(First:(Second:(Second:($t@82@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))
  $Snap.unit))
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@84@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
      $Ref.null))
  (= (as joined_unfolding@84@01  Bool) false)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
    $Ref.null)
  (= (as joined_unfolding@84@01  Bool) false)))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second $t@82@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@82@01)))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@82@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@82@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))))))
; Joined path conditions
(assert (and
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second $t@82@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@82@01)))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@82@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@82@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
      $Ref.null))))
(assert (as joined_unfolding@84@01  Bool))
(pop) ; 3
; Joined path conditions
(assert (and
  (deeperfalse%trigger $t@82@01 r@81@01)
  (= $t@82@01 ($Snap.combine ($Snap.first $t@82@01) ($Snap.second $t@82@01)))
  (not (= r@81@01 $Ref.null))
  (=
    ($Snap.second $t@82@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@82@01))
      ($Snap.second ($Snap.second $t@82@01))))
  (= ($Snap.first ($Snap.second $t@82@01)) $Snap.unit)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@82@01)) $Ref.null))
  (=
    ($Snap.second ($Snap.second $t@82@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@82@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@82@01)))))
  (= ($Snap.second ($Snap.second ($Snap.second $t@82@01))) $Snap.unit)
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
        $Ref.null))
    (= (as joined_unfolding@84@01  Bool) false))
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
      $Ref.null)
    (= (as joined_unfolding@84@01  Bool) false))
  (valid%trigger ($Snap.first ($Snap.second ($Snap.second $t@82@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@82@01)))
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@82@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@82@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))))
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
      $Ref.null)
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
        $Ref.null)
      (=
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01)))))
        $Snap.unit)))
  (or
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@82@01))))))
        $Ref.null)))
  (as joined_unfolding@84@01  Bool)))
(declare-const $t@85@01 $Snap)
(assert (= $t@85@01 $Snap.unit))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
(pop) ; 2
(pop) ; 1
