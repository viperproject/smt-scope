(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/recursive_unrolling.vpr
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
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun node%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@3@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (length%limited s@$ this@0@00) (length s@$ this@0@00))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (length%stateless this@0@00)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ this@0@00))) (=>
    (length%precondition s@$ this@0@00)
    (> result@1@00 0)))
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ this@0@00))) true)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00)
    (=
      (length s@$ this@0@00)
      (+
        1
        (ite
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
          0
          (length%limited ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))))
  :pattern ((length s@$ this@0@00))
  :pattern ((length%stateless this@0@00) (node%trigger s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
      true
      (length%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var n1: Ref
(declare-const n1@0@01 $Ref)
; [exec]
; var n2: Ref
(declare-const n2@1@01 $Ref)
; [exec]
; var n3: Ref
(declare-const n3@2@01 $Ref)
; [exec]
; var n4: Ref
(declare-const n4@3@01 $Ref)
; [exec]
; var n5: Ref
(declare-const n5@4@01 $Ref)
; [exec]
; n1 := new(next)
(declare-const n1@5@01 $Ref)
(assert (not (= n1@5@01 $Ref.null)))
(declare-const next@6@01 $Ref)
(assert (not (= n1@5@01 n3@2@01)))
(assert (not (= n1@5@01 n1@0@01)))
(assert (not (= n1@5@01 n2@1@01)))
(assert (not (= n1@5@01 n5@4@01)))
(assert (not (= n1@5@01 n4@3@01)))
; [exec]
; n1.next := null
; [exec]
; fold acc(node(n1), write)
; [eval] this.next != null
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 3
; [else-branch: 0 | True]
(assert (node%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) n1@5@01))
; [exec]
; n2 := new(next)
(declare-const n2@7@01 $Ref)
(assert (not (= n2@7@01 $Ref.null)))
(declare-const next@8@01 $Ref)
(assert (not (= n2@7@01 n3@2@01)))
(assert (not (= n2@7@01 n2@1@01)))
(assert (not (= n2@7@01 n5@4@01)))
(assert (not (= n2@7@01 n4@3@01)))
(assert (not (= n2@7@01 n1@5@01)))
; [exec]
; n2.next := n1
; [exec]
; fold acc(node(n2), write)
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= n1@5@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | n1@5@01 != Null | live]
; [else-branch: 1 | n1@5@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | n1@5@01 != Null]
(assert (node%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap n1@5@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) n2@7@01))
; [exec]
; n3 := new(next)
(declare-const n3@9@01 $Ref)
(assert (not (= n3@9@01 $Ref.null)))
(declare-const next@10@01 $Ref)
(assert (not (= n3@9@01 n3@2@01)))
(assert (not (= n3@9@01 n2@7@01)))
(assert (not (= n3@9@01 n5@4@01)))
(assert (not (= n3@9@01 n4@3@01)))
(assert (not (= n3@9@01 n1@5@01)))
; [exec]
; n3.next := n2
; [exec]
; fold acc(node(n3), write)
; [eval] this.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= n2@7@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | n2@7@01 != Null | live]
; [else-branch: 2 | n2@7@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | n2@7@01 != Null]
(assert (node%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap n2@7@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n1@5@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))) n3@9@01))
; [exec]
; n4 := new(next)
(declare-const n4@11@01 $Ref)
(assert (not (= n4@11@01 $Ref.null)))
(declare-const next@12@01 $Ref)
(assert (not (= n4@11@01 n3@9@01)))
(assert (not (= n4@11@01 n2@7@01)))
(assert (not (= n4@11@01 n5@4@01)))
(assert (not (= n4@11@01 n4@3@01)))
(assert (not (= n4@11@01 n1@5@01)))
; [exec]
; n4.next := n3
; [exec]
; fold acc(node(n4), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= n3@9@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | n3@9@01 != Null | live]
; [else-branch: 3 | n3@9@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | n3@9@01 != Null]
(assert (node%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap n3@9@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n2@7@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n1@5@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) n4@11@01))
; [exec]
; n5 := new(next)
(declare-const n5@13@01 $Ref)
(assert (not (= n5@13@01 $Ref.null)))
(declare-const next@14@01 $Ref)
(assert (not (= n5@13@01 n3@9@01)))
(assert (not (= n5@13@01 n2@7@01)))
(assert (not (= n5@13@01 n5@4@01)))
(assert (not (= n5@13@01 n1@5@01)))
(assert (not (= n5@13@01 n4@11@01)))
; [exec]
; n5.next := n4
; [exec]
; fold acc(node(n5), write)
; [eval] this.next != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= n4@11@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | n4@11@01 != Null | live]
; [else-branch: 4 | n4@11@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 4 | n4@11@01 != Null]
(assert (node%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap n4@11@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n3@9@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n2@7@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n1@5@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))))) n5@13@01))
; [exec]
; assert length(n5) == 5
; [eval] length(n5) == 5
; [eval] length(n5)
(push) ; 8
(assert (length%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap n4@11@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n3@9@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n2@7@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n1@5@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))))) n5@13@01))
(pop) ; 8
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap n4@11@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap n3@9@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n2@7@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n1@5@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))))) n5@13@01))
(push) ; 8
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.$RefTo$Snap n4@11@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n3@9@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n2@7@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n1@5@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))))) n5@13@01)
  5)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.$RefTo$Snap n4@11@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap n3@9@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap n2@7@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap n1@5@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))))) n5@13@01)
  5))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const n4@15@01 $Ref)
(declare-const n4@16@01 $Ref)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] length(n4) == 4
; [eval] length(n4)
(push) ; 2
(assert (length%precondition ($Snap.first $t@17@01) n4@16@01))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.first $t@17@01) n4@16@01))
(assert (= (length ($Snap.first $t@17@01) n4@16@01) 4))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(node(n4), write)
(assert (=
  ($Snap.first $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@17@01))
    ($Snap.second ($Snap.first $t@17@01)))))
(assert (not (= n4@16@01 $Ref.null)))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@17@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@17@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(First:($t@17@01)) != Null | live]
; [else-branch: 5 | First:(First:($t@17@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | First:(First:($t@17@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@17@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger ($Snap.first $t@17@01) n4@16@01))
; [exec]
; unfold acc(node(n4.next), write)
(assert (=
  ($Snap.second ($Snap.first $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= n4@16@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@17@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:($t@17@01))) != Null | live]
; [else-branch: 6 | First:(Second:(First:($t@17@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | First:(Second:(First:($t@17@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger ($Snap.second ($Snap.first $t@17@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@17@01)))))
; [exec]
; unfold acc(node(n4.next.next), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@17@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@17@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  n4@16@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(Second:(First:($t@17@01)))) != Null | live]
; [else-branch: 7 | First:(Second:(Second:(First:($t@17@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | First:(Second:(Second:(First:($t@17@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger ($Snap.second ($Snap.second ($Snap.first $t@17@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01))))))
; [exec]
; unfold acc(node(n4.next.next.next), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@17@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  n4@16@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(Second:(Second:(First:($t@17@01))))) != Null | live]
; [else-branch: 8 | First:(Second:(Second:(Second:(First:($t@17@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 8 | First:(Second:(Second:(Second:(First:($t@17@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))))
; [exec]
; assert n4.next.next.next.next == null
; [eval] n4.next.next.next.next == null
(set-option :timeout 0)
(push) ; 7
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))
  $Ref.null))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | First:(Second:(Second:(Second:(First:($t@17@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))))
; [exec]
; assert n4.next.next.next.next == null
; [eval] n4.next.next.next.next == null
(pop) ; 6
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | First:(Second:(Second:(First:($t@17@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@17@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@17@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger ($Snap.second ($Snap.second ($Snap.first $t@17@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01))))))
; [exec]
; unfold acc(node(n4.next.next.next), write)
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 6 | First:(Second:(First:($t@17@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@17@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@17@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger ($Snap.second ($Snap.first $t@17@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@17@01)))))
; [exec]
; unfold acc(node(n4.next.next), write)
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
