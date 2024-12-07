(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:24
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0385.vpr
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
(declare-sort Dummy 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.DummyTo$Snap (Dummy) $Snap)
(declare-fun $SortWrappers.$SnapToDummy ($Snap) Dummy)
(assert (forall ((x Dummy)) (!
    (= x ($SortWrappers.$SnapToDummy($SortWrappers.DummyTo$Snap x)))
    :pattern (($SortWrappers.DummyTo$Snap x))
    :qid |$Snap.$SnapToDummyTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DummyTo$Snap($SortWrappers.$SnapToDummy x)))
    :pattern (($SortWrappers.$SnapToDummy x))
    :qid |$Snap.DummyTo$SnapToDummy|
    )))
; ////////// Symbols
(declare-fun guard<Bool> ($Ref) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun foo_2_1 ($Snap $Ref $Ref) Bool)
(declare-fun foo_2_1%limited ($Snap $Ref $Ref) Bool)
(declare-fun foo_2_1%stateless ($Ref $Ref) Bool)
(declare-fun foo_2_1%precondition ($Snap $Ref $Ref) Bool)
(declare-fun foo_1_2 ($Snap $Ref $Ref) Bool)
(declare-fun foo_1_2%limited ($Snap $Ref $Ref) Bool)
(declare-fun foo_1_2%stateless ($Ref $Ref) Bool)
(declare-fun foo_1_2%precondition ($Snap $Ref $Ref) Bool)
(declare-fun foo_1_1 ($Snap $Ref $Ref) Bool)
(declare-fun foo_1_1%limited ($Snap $Ref $Ref) Bool)
(declare-fun foo_1_1%stateless ($Ref $Ref) Bool)
(declare-fun foo_1_1%precondition ($Snap $Ref $Ref) Bool)
(declare-fun foo_2_2 ($Snap $Ref $Ref) Bool)
(declare-fun foo_2_2%limited ($Snap $Ref $Ref) Bool)
(declare-fun foo_2_2%stateless ($Ref $Ref) Bool)
(declare-fun foo_2_2%precondition ($Snap $Ref $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((s@$ $Snap) (y@0@00 $Ref) (x@1@00 $Ref)) (!
  (= (foo_2_1%limited s@$ y@0@00 x@1@00) (foo_2_1 s@$ y@0@00 x@1@00))
  :pattern ((foo_2_1 s@$ y@0@00 x@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (y@0@00 $Ref) (x@1@00 $Ref)) (!
  (foo_2_1%stateless y@0@00 x@1@00)
  :pattern ((foo_2_1%limited s@$ y@0@00 x@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (y@0@00 $Ref) (x@1@00 $Ref)) (!
  (=>
    (foo_2_1%precondition s@$ y@0@00 x@1@00)
    (=
      (foo_2_1 s@$ y@0@00 x@1@00)
      (or
        (not (guard<Bool> y@0@00))
        (ite
          (guard<Bool> y@0@00)
          ($SortWrappers.$SnapToBool ($Snap.second s@$))
          ($SortWrappers.$SnapToBool s@$)))))
  :pattern ((foo_2_1 s@$ y@0@00 x@1@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (y@0@00 $Ref) (x@1@00 $Ref)) (!
  true
  :pattern ((foo_2_1 s@$ y@0@00 x@1@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (y@3@00 $Ref) (x@4@00 $Ref)) (!
  (= (foo_1_2%limited s@$ y@3@00 x@4@00) (foo_1_2 s@$ y@3@00 x@4@00))
  :pattern ((foo_1_2 s@$ y@3@00 x@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (y@3@00 $Ref) (x@4@00 $Ref)) (!
  (foo_1_2%stateless y@3@00 x@4@00)
  :pattern ((foo_1_2%limited s@$ y@3@00 x@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (y@3@00 $Ref) (x@4@00 $Ref)) (!
  (=>
    (foo_1_2%precondition s@$ y@3@00 x@4@00)
    (=
      (foo_1_2 s@$ y@3@00 x@4@00)
      (=> (guard<Bool> y@3@00) ($SortWrappers.$SnapToBool ($Snap.second s@$)))))
  :pattern ((foo_1_2 s@$ y@3@00 x@4@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (y@3@00 $Ref) (x@4@00 $Ref)) (!
  true
  :pattern ((foo_1_2 s@$ y@3@00 x@4@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (y@6@00 $Ref) (x@7@00 $Ref)) (!
  (= (foo_1_1%limited s@$ y@6@00 x@7@00) (foo_1_1 s@$ y@6@00 x@7@00))
  :pattern ((foo_1_1 s@$ y@6@00 x@7@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (y@6@00 $Ref) (x@7@00 $Ref)) (!
  (foo_1_1%stateless y@6@00 x@7@00)
  :pattern ((foo_1_1%limited s@$ y@6@00 x@7@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (y@6@00 $Ref) (x@7@00 $Ref)) (!
  (=>
    (foo_1_1%precondition s@$ y@6@00 x@7@00)
    (=
      (foo_1_1 s@$ y@6@00 x@7@00)
      (or
        (not (guard<Bool> y@6@00))
        (ite
          (guard<Bool> y@6@00)
          ($SortWrappers.$SnapToBool ($Snap.second s@$))
          ($SortWrappers.$SnapToBool ($Snap.first s@$))))))
  :pattern ((foo_1_1 s@$ y@6@00 x@7@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (y@6@00 $Ref) (x@7@00 $Ref)) (!
  true
  :pattern ((foo_1_1 s@$ y@6@00 x@7@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (y@9@00 $Ref) (x@10@00 $Ref)) (!
  (= (foo_2_2%limited s@$ y@9@00 x@10@00) (foo_2_2 s@$ y@9@00 x@10@00))
  :pattern ((foo_2_2 s@$ y@9@00 x@10@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (y@9@00 $Ref) (x@10@00 $Ref)) (!
  (foo_2_2%stateless y@9@00 x@10@00)
  :pattern ((foo_2_2%limited s@$ y@9@00 x@10@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (y@9@00 $Ref) (x@10@00 $Ref)) (!
  (=>
    (foo_2_2%precondition s@$ y@9@00 x@10@00)
    (=
      (foo_2_2 s@$ y@9@00 x@10@00)
      (=> (guard<Bool> y@9@00) ($SortWrappers.$SnapToBool ($Snap.second s@$)))))
  :pattern ((foo_2_2 s@$ y@9@00 x@10@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (y@9@00 $Ref) (x@10@00 $Ref)) (!
  true
  :pattern ((foo_2_2 s@$ y@9@00 x@10@00))
  :qid |quant-u-15|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- testA ----------
(declare-const s@0@01 $Ref)
(declare-const r@1@01 $Ref)
(declare-const s@2@01 $Ref)
(declare-const r@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= r@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r@3@01 s@2@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= s@2@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
(assert ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@4@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert foo_1_1(s, r)
; [eval] foo_1_1(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@2@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@2@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | guard[Bool](s@2@01) | live]
; [else-branch: 0 | !(guard[Bool](s@2@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | guard[Bool](s@2@01)]
(assert (guard<Bool> s@2@01))
(assert (foo_1_1%precondition ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(guard[Bool](s@2@01))]
(assert (not (guard<Bool> s@2@01)))
(assert (foo_1_1%precondition ($Snap.combine ($Snap.first $t@4@01) $Snap.unit) s@2@01 r@3@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_1@5@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@2@01)
  (=
    (joined_foo_1_1@5@01 s@2@01 r@3@01)
    (foo_1_1 ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))))
(assert (=>
  (not (guard<Bool> s@2@01))
  (=
    (joined_foo_1_1@5@01 s@2@01 r@3@01)
    (foo_1_1 ($Snap.combine ($Snap.first $t@4@01) $Snap.unit) s@2@01 r@3@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@2@01)
  (and
    (guard<Bool> s@2@01)
    (foo_1_1%precondition ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@2@01))
  (and
    (not (guard<Bool> s@2@01))
    (foo_1_1%precondition ($Snap.combine ($Snap.first $t@4@01) $Snap.unit) s@2@01 r@3@01))))
(assert (or (not (guard<Bool> s@2@01)) (guard<Bool> s@2@01)))
(push) ; 3
(assert (not (joined_foo_1_1@5@01 s@2@01 r@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (joined_foo_1_1@5@01 s@2@01 r@3@01))
; [exec]
; assert foo_1_2(s, r)
; [eval] foo_1_2(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@2@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@2@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | guard[Bool](s@2@01) | live]
; [else-branch: 1 | !(guard[Bool](s@2@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | guard[Bool](s@2@01)]
(assert (guard<Bool> s@2@01))
(assert (foo_1_2%precondition ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(guard[Bool](s@2@01))]
(assert (not (guard<Bool> s@2@01)))
(assert (foo_1_2%precondition ($Snap.combine ($Snap.first $t@4@01) $Snap.unit) s@2@01 r@3@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_2@6@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@2@01)
  (=
    (joined_foo_1_2@6@01 s@2@01 r@3@01)
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))))
(assert (=>
  (not (guard<Bool> s@2@01))
  (=
    (joined_foo_1_2@6@01 s@2@01 r@3@01)
    (foo_1_2 ($Snap.combine ($Snap.first $t@4@01) $Snap.unit) s@2@01 r@3@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@2@01)
  (and
    (guard<Bool> s@2@01)
    (foo_1_2%precondition ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@2@01))
  (and
    (not (guard<Bool> s@2@01))
    (foo_1_2%precondition ($Snap.combine ($Snap.first $t@4@01) $Snap.unit) s@2@01 r@3@01))))
(push) ; 3
(assert (not (joined_foo_1_2@6@01 s@2@01 r@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (joined_foo_1_2@6@01 s@2@01 r@3@01))
; [exec]
; assert foo_2_1(s, r)
; [eval] foo_2_1(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@2@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@2@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | guard[Bool](s@2@01) | live]
; [else-branch: 2 | !(guard[Bool](s@2@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | guard[Bool](s@2@01)]
(assert (guard<Bool> s@2@01))
(assert (foo_2_1%precondition ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(guard[Bool](s@2@01))]
(assert (not (guard<Bool> s@2@01)))
(assert (foo_2_1%precondition ($Snap.first $t@4@01) s@2@01 r@3@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_2_1@7@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@2@01)
  (=
    (joined_foo_2_1@7@01 s@2@01 r@3@01)
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))))
(assert (=>
  (not (guard<Bool> s@2@01))
  (=
    (joined_foo_2_1@7@01 s@2@01 r@3@01)
    (foo_2_1 ($Snap.first $t@4@01) s@2@01 r@3@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@2@01)
  (and
    (guard<Bool> s@2@01)
    (foo_2_1%precondition ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@2@01))
  (and
    (not (guard<Bool> s@2@01))
    (foo_2_1%precondition ($Snap.first $t@4@01) s@2@01 r@3@01))))
(push) ; 3
(assert (not (joined_foo_2_1@7@01 s@2@01 r@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (joined_foo_2_1@7@01 s@2@01 r@3@01))
; [exec]
; assert foo_2_2(s, r)
; [eval] foo_2_2(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@2@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@2@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | guard[Bool](s@2@01) | live]
; [else-branch: 3 | !(guard[Bool](s@2@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | guard[Bool](s@2@01)]
(assert (guard<Bool> s@2@01))
(assert (foo_2_2%precondition ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(guard[Bool](s@2@01))]
(assert (not (guard<Bool> s@2@01)))
(assert (foo_2_2%precondition ($Snap.first $t@4@01) s@2@01 r@3@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_2_2@8@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@2@01)
  (=
    (joined_foo_2_2@8@01 s@2@01 r@3@01)
    (foo_2_2 ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))))
(assert (=>
  (not (guard<Bool> s@2@01))
  (=
    (joined_foo_2_2@8@01 s@2@01 r@3@01)
    (foo_2_2 ($Snap.first $t@4@01) s@2@01 r@3@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@2@01)
  (and
    (guard<Bool> s@2@01)
    (foo_2_2%precondition ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.first ($Snap.second $t@4@01))) s@2@01 r@3@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@2@01))
  (and
    (not (guard<Bool> s@2@01))
    (foo_2_2%precondition ($Snap.first $t@4@01) s@2@01 r@3@01))))
(push) ; 3
(assert (not (joined_foo_2_2@8@01 s@2@01 r@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (joined_foo_2_2@8@01 s@2@01 r@3@01))
(pop) ; 2
(pop) ; 1
; ---------- testB ----------
(declare-const s@9@01 $Ref)
(declare-const r@10@01 $Ref)
(declare-const s@11@01 $Ref)
(declare-const r@12@01 $Ref)
(push) ; 1
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (not (= r@12@01 $Ref.null)))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= s@11@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@13@01)) $Snap.unit))
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@13@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert foo_1_1(s, r) || (foo_1_2(s, r) || (foo_2_1(s, r) || foo_2_2(s, r)))
; [eval] foo_1_1(s, r) || (foo_1_2(s, r) || (foo_2_1(s, r) || foo_2_2(s, r)))
; [eval] foo_1_1(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | guard[Bool](s@11@01) | live]
; [else-branch: 4 | !(guard[Bool](s@11@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | guard[Bool](s@11@01)]
(assert (guard<Bool> s@11@01))
(assert (foo_1_1%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(guard[Bool](s@11@01))]
(assert (not (guard<Bool> s@11@01)))
(assert (foo_1_1%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_1@14@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@11@01)
  (=
    (joined_foo_1_1@14@01 s@11@01 r@12@01)
    (foo_1_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(assert (=>
  (not (guard<Bool> s@11@01))
  (=
    (joined_foo_1_1@14@01 s@11@01 r@12@01)
    (foo_1_1 ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (guard<Bool> s@11@01)
    (foo_1_1%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@11@01))
  (and
    (not (guard<Bool> s@11@01))
    (foo_1_1%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))))
(assert (or (not (guard<Bool> s@11@01)) (guard<Bool> s@11@01)))
(push) ; 3
; [then-branch: 5 | joined_foo_1_1@14@01(s@11@01, r@12@01) | live]
; [else-branch: 5 | !(joined_foo_1_1@14@01(s@11@01, r@12@01)) | live]
(push) ; 4
; [then-branch: 5 | joined_foo_1_1@14@01(s@11@01, r@12@01)]
(assert (joined_foo_1_1@14@01 s@11@01 r@12@01))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(joined_foo_1_1@14@01(s@11@01, r@12@01))]
(assert (not (joined_foo_1_1@14@01 s@11@01 r@12@01)))
; [eval] foo_1_2(s, r)
(push) ; 5
; [eval] guard(y)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (guard<Bool> s@11@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | guard[Bool](s@11@01) | live]
; [else-branch: 6 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | guard[Bool](s@11@01)]
(assert (guard<Bool> s@11@01))
(assert (foo_1_2%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (guard<Bool> s@11@01)
    (foo_1_2%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(assert (guard<Bool> s@11@01))
(push) ; 5
; [then-branch: 7 | foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01) | live]
; [else-branch: 7 | !(foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)) | live]
(push) ; 6
; [then-branch: 7 | foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)]
(assert (foo_1_2 ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | !(foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01))]
(assert (not
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
; [eval] foo_2_1(s, r)
(push) ; 7
; [eval] guard(y)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | guard[Bool](s@11@01) | live]
; [else-branch: 8 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 8 | guard[Bool](s@11@01)]
(assert (foo_2_1%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (foo_2_1%precondition ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(push) ; 7
; [then-branch: 9 | foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01) | live]
; [else-branch: 9 | !(foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)) | live]
(push) ; 8
; [then-branch: 9 | foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)]
(assert (foo_2_1 ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | !(foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01))]
(assert (not
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
; [eval] foo_2_2(s, r)
(push) ; 9
; [eval] guard(y)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | guard[Bool](s@11@01) | live]
; [else-branch: 10 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 10 | guard[Bool](s@11@01)]
(assert (foo_2_2%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (foo_2_2%precondition ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (and
    (not
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (=>
      (guard<Bool> s@11@01)
      (foo_2_2%precondition ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (and
    (not
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (=>
      (guard<Bool> s@11@01)
      (foo_2_1%precondition ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (=>
      (not
        (foo_2_1 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (and
        (not
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (=>
          (guard<Bool> s@11@01)
          (foo_2_2%precondition ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
    (or
      (not
        (foo_2_1 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (joined_foo_1_1@14@01 s@11@01 r@12@01))
  (and
    (not (joined_foo_1_1@14@01 s@11@01 r@12@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (guard<Bool> s@11@01)
        (foo_1_2%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
    (guard<Bool> s@11@01)
    (=>
      (not
        (foo_1_2 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (and
        (not
          (foo_1_2 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (=>
          (guard<Bool> s@11@01)
          (foo_2_1%precondition ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (=>
          (not
            (foo_2_1 ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
          (and
            (not
              (foo_2_1 ($Snap.combine
                ($Snap.first $t@13@01)
                ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
            (=>
              (guard<Bool> s@11@01)
              (foo_2_2%precondition ($Snap.combine
                ($Snap.first $t@13@01)
                ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
        (or
          (not
            (foo_2_1 ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
    (or
      (not
        (foo_1_2 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not (joined_foo_1_1@14@01 s@11@01 r@12@01))
  (joined_foo_1_1@14@01 s@11@01 r@12@01)))
(push) ; 3
(assert (not (or
  (joined_foo_1_1@14@01 s@11@01 r@12@01)
  (or
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
    (or
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      (foo_2_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
; [eval] foo_1_1(s, r) || (foo_1_2(s, r) || (foo_2_1(s, r) || foo_2_2(s, r)))
; [eval] foo_1_1(s, r)
(set-option :timeout 0)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | guard[Bool](s@11@01) | live]
; [else-branch: 11 | !(guard[Bool](s@11@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | guard[Bool](s@11@01)]
(assert (guard<Bool> s@11@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (foo_1_1%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(guard[Bool](s@11@01))]
(assert (not (guard<Bool> s@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (foo_1_1%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_1@15@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@11@01)
  (=
    (joined_foo_1_1@15@01 s@11@01 r@12@01)
    (foo_1_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(assert (=>
  (not (guard<Bool> s@11@01))
  (=
    (joined_foo_1_1@15@01 s@11@01 r@12@01)
    (foo_1_1 ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (guard<Bool> s@11@01)
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (foo_1_1%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@11@01))
  (and
    (not (guard<Bool> s@11@01))
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (foo_1_1%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | joined_foo_1_1@15@01(s@11@01, r@12@01) | live]
; [else-branch: 12 | !(joined_foo_1_1@15@01(s@11@01, r@12@01)) | live]
(push) ; 4
; [then-branch: 12 | joined_foo_1_1@15@01(s@11@01, r@12@01)]
(assert (joined_foo_1_1@15@01 s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 12 | !(joined_foo_1_1@15@01(s@11@01, r@12@01))]
(assert (not (joined_foo_1_1@15@01 s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
; [eval] foo_1_2(s, r)
(set-option :timeout 0)
(push) ; 5
; [eval] guard(y)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (guard<Bool> s@11@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | guard[Bool](s@11@01) | live]
; [else-branch: 13 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | guard[Bool](s@11@01)]
(assert (guard<Bool> s@11@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (foo_1_2%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (guard<Bool> s@11@01)
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (foo_1_2%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(assert (guard<Bool> s@11@01))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01) | live]
; [else-branch: 14 | !(foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)) | live]
(push) ; 6
; [then-branch: 14 | foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)]
(assert (foo_1_2 ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
  ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))
(assert false)
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 14 | !(foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01))]
(assert (not
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
; [eval] foo_2_1(s, r)
(set-option :timeout 0)
(push) ; 7
; [eval] guard(y)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | guard[Bool](s@11@01) | live]
; [else-branch: 15 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 15 | guard[Bool](s@11@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (foo_2_1%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (foo_2_1%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 16 | foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01) | live]
; [else-branch: 16 | !(foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)) | live]
(push) ; 8
; [then-branch: 16 | foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)]
(assert (foo_2_1 ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))
(assert false)
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 16 | !(foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01))]
(assert (not
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
; [eval] foo_2_2(s, r)
(set-option :timeout 0)
(push) ; 9
; [eval] guard(y)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | guard[Bool](s@11@01) | live]
; [else-branch: 17 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 17 | guard[Bool](s@11@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (foo_2_2%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (foo_2_2%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
  false))
; Joined path conditions
(assert (=>
  (not
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (and
    (not
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (not (= r@12@01 s@11@01))
        (not (= s@11@01 r@12@01))
        (foo_2_2%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))))
(assert (or
  (not
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
  false))
; Joined path conditions
(assert (=>
  (not
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (and
    (not
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (not (= s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (foo_2_1%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
    (=>
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      false)
    (=>
      (not
        (foo_2_1 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (and
        (not
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (not (= s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (=>
          (guard<Bool> s@11@01)
          (and
            (not (= r@12@01 s@11@01))
            (not (= s@11@01 r@12@01))
            (foo_2_2%precondition ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
    (or
      (not
        (foo_2_1 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (joined_foo_1_1@15@01 s@11@01 r@12@01)
  (and
    (joined_foo_1_1@15@01 s@11@01 r@12@01)
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01)))))
; Joined path conditions
(assert (=>
  (not (joined_foo_1_1@15@01 s@11@01 r@12@01))
  (and
    (not (joined_foo_1_1@15@01 s@11@01 r@12@01))
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (guard<Bool> s@11@01)
        (not (= r@12@01 s@11@01))
        (not (= s@11@01 r@12@01))
        (foo_1_2%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
    (guard<Bool> s@11@01)
    (=>
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      false)
    (=>
      (not
        (foo_1_2 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (and
        (not
          (foo_1_2 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (not (= s@11@01 r@12@01))
        (=>
          (guard<Bool> s@11@01)
          (and
            (not (= s@11@01 r@12@01))
            (not (= r@12@01 s@11@01))
            (foo_2_1%precondition ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
        (=>
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
          false)
        (=>
          (not
            (foo_2_1 ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
          (and
            (not
              (foo_2_1 ($Snap.combine
                ($Snap.first $t@13@01)
                ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
            (not (= s@11@01 r@12@01))
            (not (= r@12@01 s@11@01))
            (=>
              (guard<Bool> s@11@01)
              (and
                (not (= r@12@01 s@11@01))
                (not (= s@11@01 r@12@01))
                (foo_2_2%precondition ($Snap.combine
                  ($Snap.first $t@13@01)
                  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
        (or
          (not
            (foo_2_1 ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
    (or
      (not
        (foo_1_2 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not (joined_foo_1_1@15@01 s@11@01 r@12@01))
  (joined_foo_1_1@15@01 s@11@01 r@12@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (joined_foo_1_1@15@01 s@11@01 r@12@01)
  (or
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
    (or
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      (foo_2_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
; [eval] foo_1_1(s, r) || (foo_1_2(s, r) || (foo_2_1(s, r) || foo_2_2(s, r)))
; [eval] foo_1_1(s, r)
(set-option :timeout 0)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | guard[Bool](s@11@01) | live]
; [else-branch: 18 | !(guard[Bool](s@11@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | guard[Bool](s@11@01)]
(assert (guard<Bool> s@11@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (foo_1_1%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 18 | !(guard[Bool](s@11@01))]
(assert (not (guard<Bool> s@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (foo_1_1%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_1@16@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@11@01)
  (=
    (joined_foo_1_1@16@01 s@11@01 r@12@01)
    (foo_1_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(assert (=>
  (not (guard<Bool> s@11@01))
  (=
    (joined_foo_1_1@16@01 s@11@01 r@12@01)
    (foo_1_1 ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (guard<Bool> s@11@01)
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (foo_1_1%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@11@01))
  (and
    (not (guard<Bool> s@11@01))
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (foo_1_1%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 19 | joined_foo_1_1@16@01(s@11@01, r@12@01) | live]
; [else-branch: 19 | !(joined_foo_1_1@16@01(s@11@01, r@12@01)) | live]
(push) ; 4
; [then-branch: 19 | joined_foo_1_1@16@01(s@11@01, r@12@01)]
(assert (joined_foo_1_1@16@01 s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 19 | !(joined_foo_1_1@16@01(s@11@01, r@12@01))]
(assert (not (joined_foo_1_1@16@01 s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
; [eval] foo_1_2(s, r)
(set-option :timeout 0)
(push) ; 5
; [eval] guard(y)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (guard<Bool> s@11@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | guard[Bool](s@11@01) | live]
; [else-branch: 20 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 20 | guard[Bool](s@11@01)]
(assert (guard<Bool> s@11@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (foo_1_2%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (guard<Bool> s@11@01)
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (foo_1_2%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(assert (guard<Bool> s@11@01))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01) | live]
; [else-branch: 21 | !(foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)) | live]
(push) ; 6
; [then-branch: 21 | foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)]
(assert (foo_1_2 ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))
(assert false)
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 21 | !(foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01))]
(assert (not
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
; [eval] foo_2_1(s, r)
(set-option :timeout 0)
(push) ; 7
; [eval] guard(y)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | guard[Bool](s@11@01) | live]
; [else-branch: 22 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 22 | guard[Bool](s@11@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (foo_2_1%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (foo_2_1%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 23 | foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01) | live]
; [else-branch: 23 | !(foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)) | live]
(push) ; 8
; [then-branch: 23 | foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)]
(assert (foo_2_1 ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
  ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))
(assert false)
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 23 | !(foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01))]
(assert (not
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
; [eval] foo_2_2(s, r)
(set-option :timeout 0)
(push) ; 9
; [eval] guard(y)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | guard[Bool](s@11@01) | live]
; [else-branch: 24 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 24 | guard[Bool](s@11@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (foo_2_2%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (foo_2_2%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
  false))
; Joined path conditions
(assert (=>
  (not
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (and
    (not
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (not (= s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (foo_2_2%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))))
(assert (or
  (not
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
  false))
; Joined path conditions
(assert (=>
  (not
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (and
    (not
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (not (= r@12@01 s@11@01))
        (not (= s@11@01 r@12@01))
        (foo_2_1%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
    (=>
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      false)
    (=>
      (not
        (foo_2_1 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (and
        (not
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (not (= s@11@01 r@12@01))
        (=>
          (guard<Bool> s@11@01)
          (and
            (not (= s@11@01 r@12@01))
            (not (= r@12@01 s@11@01))
            (foo_2_2%precondition ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
    (or
      (not
        (foo_2_1 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (joined_foo_1_1@16@01 s@11@01 r@12@01)
  (and
    (joined_foo_1_1@16@01 s@11@01 r@12@01)
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01)))))
; Joined path conditions
(assert (=>
  (not (joined_foo_1_1@16@01 s@11@01 r@12@01))
  (and
    (not (joined_foo_1_1@16@01 s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (guard<Bool> s@11@01)
        (not (= s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (foo_1_2%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
    (guard<Bool> s@11@01)
    (=>
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      false)
    (=>
      (not
        (foo_1_2 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (and
        (not
          (foo_1_2 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (not (= s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (=>
          (guard<Bool> s@11@01)
          (and
            (not (= r@12@01 s@11@01))
            (not (= s@11@01 r@12@01))
            (foo_2_1%precondition ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
        (=>
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
          false)
        (=>
          (not
            (foo_2_1 ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
          (and
            (not
              (foo_2_1 ($Snap.combine
                ($Snap.first $t@13@01)
                ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
            (not (= r@12@01 s@11@01))
            (not (= s@11@01 r@12@01))
            (=>
              (guard<Bool> s@11@01)
              (and
                (not (= s@11@01 r@12@01))
                (not (= r@12@01 s@11@01))
                (foo_2_2%precondition ($Snap.combine
                  ($Snap.first $t@13@01)
                  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
        (or
          (not
            (foo_2_1 ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
    (or
      (not
        (foo_1_2 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not (joined_foo_1_1@16@01 s@11@01 r@12@01))
  (joined_foo_1_1@16@01 s@11@01 r@12@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (joined_foo_1_1@16@01 s@11@01 r@12@01)
  (or
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
    (or
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      (foo_2_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
; [eval] foo_1_1(s, r) || (foo_1_2(s, r) || (foo_2_1(s, r) || foo_2_2(s, r)))
; [eval] foo_1_1(s, r)
(set-option :timeout 0)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | guard[Bool](s@11@01) | live]
; [else-branch: 25 | !(guard[Bool](s@11@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | guard[Bool](s@11@01)]
(assert (guard<Bool> s@11@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (foo_1_1%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 25 | !(guard[Bool](s@11@01))]
(assert (not (guard<Bool> s@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (foo_1_1%precondition ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_1@17@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@11@01)
  (=
    (joined_foo_1_1@17@01 s@11@01 r@12@01)
    (foo_1_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(assert (=>
  (not (guard<Bool> s@11@01))
  (=
    (joined_foo_1_1@17@01 s@11@01 r@12@01)
    (foo_1_1 ($Snap.combine ($Snap.first $t@13@01) $Snap.unit) s@11@01 r@12@01))))
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
; [then-branch: 26 | joined_foo_1_1@17@01(s@11@01, r@12@01) | live]
; [else-branch: 26 | !(joined_foo_1_1@17@01(s@11@01, r@12@01)) | live]
(push) ; 4
; [then-branch: 26 | joined_foo_1_1@17@01(s@11@01, r@12@01)]
(assert (joined_foo_1_1@17@01 s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 26 | !(joined_foo_1_1@17@01(s@11@01, r@12@01))]
(assert (not (joined_foo_1_1@17@01 s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
; [eval] foo_1_2(s, r)
(set-option :timeout 0)
(push) ; 5
; [eval] guard(y)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (guard<Bool> s@11@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | guard[Bool](s@11@01) | live]
; [else-branch: 27 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 27 | guard[Bool](s@11@01)]
(assert (guard<Bool> s@11@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (foo_1_2%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (guard<Bool> s@11@01)
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (foo_1_2%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(assert (guard<Bool> s@11@01))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 28 | foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01) | live]
; [else-branch: 28 | !(foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)) | live]
(push) ; 6
; [then-branch: 28 | foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)]
(assert (foo_1_2 ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
  ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))
(assert false)
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 28 | !(foo_1_2((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01))]
(assert (not
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
; [eval] foo_2_1(s, r)
(set-option :timeout 0)
(push) ; 7
; [eval] guard(y)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | guard[Bool](s@11@01) | live]
; [else-branch: 29 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 29 | guard[Bool](s@11@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (foo_2_1%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (foo_2_1%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 30 | foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01) | live]
; [else-branch: 30 | !(foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)) | live]
(push) ; 8
; [then-branch: 30 | foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01)]
(assert (foo_2_1 ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))
(assert false)
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 30 | !(foo_2_1((First:($t@13@01), First:(Second:($t@13@01))), s@11@01, r@12@01))]
(assert (not
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= r@12@01 s@11@01)))
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
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
(assert (and (not (= s@11@01 r@12@01)) (not (= r@12@01 s@11@01))))
; [eval] foo_2_2(s, r)
(set-option :timeout 0)
(push) ; 9
; [eval] guard(y)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@11@01))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | guard[Bool](s@11@01) | live]
; [else-branch: 31 | !(guard[Bool](s@11@01)) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 31 | guard[Bool](s@11@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= s@11@01 r@12@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@13@01)))
    ($SortWrappers.$SnapToBool ($Snap.first $t@13@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (and (not (= r@12@01 s@11@01)) (not (= s@11@01 r@12@01))))
(assert (foo_2_2%precondition ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (guard<Bool> s@11@01)
  (and
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (foo_2_2%precondition ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
  false))
; Joined path conditions
(assert (=>
  (not
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (and
    (not
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (not (= r@12@01 s@11@01))
        (not (= s@11@01 r@12@01))
        (foo_2_2%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))))
(assert (or
  (not
    (foo_2_1 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (foo_2_1 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
  false))
; Joined path conditions
(assert (=>
  (not
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (and
    (not
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (not (= s@11@01 r@12@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (not (= s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (foo_2_1%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
    (=>
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      false)
    (=>
      (not
        (foo_2_1 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (and
        (not
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (not (= s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (=>
          (guard<Bool> s@11@01)
          (and
            (not (= r@12@01 s@11@01))
            (not (= s@11@01 r@12@01))
            (foo_2_2%precondition ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
    (or
      (not
        (foo_2_1 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
  (foo_1_2 ($Snap.combine
    ($Snap.first $t@13@01)
    ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (joined_foo_1_1@17@01 s@11@01 r@12@01)
  (and
    (joined_foo_1_1@17@01 s@11@01 r@12@01)
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01)))))
; Joined path conditions
(assert (=>
  (not (joined_foo_1_1@17@01 s@11@01 r@12@01))
  (and
    (not (joined_foo_1_1@17@01 s@11@01 r@12@01))
    (not (= s@11@01 r@12@01))
    (not (= r@12@01 s@11@01))
    (=>
      (guard<Bool> s@11@01)
      (and
        (guard<Bool> s@11@01)
        (not (= r@12@01 s@11@01))
        (not (= s@11@01 r@12@01))
        (foo_1_2%precondition ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
    (guard<Bool> s@11@01)
    (=>
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      false)
    (=>
      (not
        (foo_1_2 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (and
        (not
          (foo_1_2 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
        (not (= r@12@01 s@11@01))
        (not (= s@11@01 r@12@01))
        (=>
          (guard<Bool> s@11@01)
          (and
            (not (= s@11@01 r@12@01))
            (not (= r@12@01 s@11@01))
            (foo_2_1%precondition ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))
        (=>
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
          false)
        (=>
          (not
            (foo_2_1 ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
          (and
            (not
              (foo_2_1 ($Snap.combine
                ($Snap.first $t@13@01)
                ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
            (not (= s@11@01 r@12@01))
            (not (= r@12@01 s@11@01))
            (=>
              (guard<Bool> s@11@01)
              (and
                (not (= r@12@01 s@11@01))
                (not (= s@11@01 r@12@01))
                (foo_2_2%precondition ($Snap.combine
                  ($Snap.first $t@13@01)
                  ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
        (or
          (not
            (foo_2_1 ($Snap.combine
              ($Snap.first $t@13@01)
              ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
          (foo_2_1 ($Snap.combine
            ($Snap.first $t@13@01)
            ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))
    (or
      (not
        (foo_1_2 ($Snap.combine
          ($Snap.first $t@13@01)
          ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))
      (foo_1_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)))))
(assert (or
  (not (joined_foo_1_1@17@01 s@11@01 r@12@01))
  (joined_foo_1_1@17@01 s@11@01 r@12@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (joined_foo_1_1@17@01 s@11@01 r@12@01)
  (or
    (foo_1_2 ($Snap.combine
      ($Snap.first $t@13@01)
      ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
    (or
      (foo_2_1 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01)
      (foo_2_2 ($Snap.combine
        ($Snap.first $t@13@01)
        ($Snap.first ($Snap.second $t@13@01))) s@11@01 r@12@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- testC ----------
(declare-const s@18@01 $Ref)
(declare-const r@19@01 $Ref)
(declare-const s@20@01 $Ref)
(declare-const r@21@01 $Ref)
(push) ; 1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (not (= r@21@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r@21@01 s@20@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= s@20@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert foo_1_1(s, r) == foo_1_2(s, r) &&
;   (foo_1_2(s, r) == foo_2_1(s, r) && foo_2_1(s, r) == foo_2_2(s, r))
; [eval] foo_1_1(s, r) == foo_1_2(s, r)
; [eval] foo_1_1(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@20@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@20@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | guard[Bool](s@20@01) | live]
; [else-branch: 32 | !(guard[Bool](s@20@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 32 | guard[Bool](s@20@01)]
(assert (guard<Bool> s@20@01))
(assert (foo_1_1%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.second $t@22@01)) s@20@01 r@21@01))
(pop) ; 4
(push) ; 4
; [else-branch: 32 | !(guard[Bool](s@20@01))]
(assert (not (guard<Bool> s@20@01)))
(assert (foo_1_1%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) s@20@01 r@21@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_1@23@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@20@01)
  (=
    (joined_foo_1_1@23@01 s@20@01 r@21@01)
    (foo_1_1 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01)) s@20@01 r@21@01))))
(assert (=>
  (not (guard<Bool> s@20@01))
  (=
    (joined_foo_1_1@23@01 s@20@01 r@21@01)
    (foo_1_1 ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) s@20@01 r@21@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@20@01)
  (and
    (guard<Bool> s@20@01)
    (foo_1_1%precondition ($Snap.combine
      ($Snap.first $t@22@01)
      ($Snap.second $t@22@01)) s@20@01 r@21@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@20@01))
  (and
    (not (guard<Bool> s@20@01))
    (foo_1_1%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) s@20@01 r@21@01))))
(assert (or (not (guard<Bool> s@20@01)) (guard<Bool> s@20@01)))
; [eval] foo_1_2(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@20@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@20@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | guard[Bool](s@20@01) | live]
; [else-branch: 33 | !(guard[Bool](s@20@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 33 | guard[Bool](s@20@01)]
(assert (guard<Bool> s@20@01))
(assert (foo_1_2%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.second $t@22@01)) s@20@01 r@21@01))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | !(guard[Bool](s@20@01))]
(assert (not (guard<Bool> s@20@01)))
(assert (foo_1_2%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) s@20@01 r@21@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_2@24@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@20@01)
  (=
    (joined_foo_1_2@24@01 s@20@01 r@21@01)
    (foo_1_2 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01)) s@20@01 r@21@01))))
(assert (=>
  (not (guard<Bool> s@20@01))
  (=
    (joined_foo_1_2@24@01 s@20@01 r@21@01)
    (foo_1_2 ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) s@20@01 r@21@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@20@01)
  (and
    (guard<Bool> s@20@01)
    (foo_1_2%precondition ($Snap.combine
      ($Snap.first $t@22@01)
      ($Snap.second $t@22@01)) s@20@01 r@21@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@20@01))
  (and
    (not (guard<Bool> s@20@01))
    (foo_1_2%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) s@20@01 r@21@01))))
(push) ; 3
(assert (not (= (joined_foo_1_1@23@01 s@20@01 r@21@01) (joined_foo_1_2@24@01 s@20@01 r@21@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (joined_foo_1_1@23@01 s@20@01 r@21@01) (joined_foo_1_2@24@01 s@20@01 r@21@01)))
; [eval] foo_1_2(s, r) == foo_2_1(s, r)
; [eval] foo_1_2(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@20@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@20@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | guard[Bool](s@20@01) | live]
; [else-branch: 34 | !(guard[Bool](s@20@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 34 | guard[Bool](s@20@01)]
(assert (guard<Bool> s@20@01))
(assert (foo_1_2%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.second $t@22@01)) s@20@01 r@21@01))
(pop) ; 4
(push) ; 4
; [else-branch: 34 | !(guard[Bool](s@20@01))]
(assert (not (guard<Bool> s@20@01)))
(assert (foo_1_2%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) s@20@01 r@21@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_1_2@25@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@20@01)
  (=
    (joined_foo_1_2@25@01 s@20@01 r@21@01)
    (foo_1_2 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01)) s@20@01 r@21@01))))
(assert (=>
  (not (guard<Bool> s@20@01))
  (=
    (joined_foo_1_2@25@01 s@20@01 r@21@01)
    (foo_1_2 ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) s@20@01 r@21@01))))
; Joined path conditions
; Joined path conditions
; [eval] foo_2_1(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@20@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@20@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | guard[Bool](s@20@01) | live]
; [else-branch: 35 | !(guard[Bool](s@20@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | guard[Bool](s@20@01)]
(assert (guard<Bool> s@20@01))
(assert (foo_2_1%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.second $t@22@01)) s@20@01 r@21@01))
(pop) ; 4
(push) ; 4
; [else-branch: 35 | !(guard[Bool](s@20@01))]
(assert (not (guard<Bool> s@20@01)))
(assert (foo_2_1%precondition ($Snap.first $t@22@01) s@20@01 r@21@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_2_1@26@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@20@01)
  (=
    (joined_foo_2_1@26@01 s@20@01 r@21@01)
    (foo_2_1 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01)) s@20@01 r@21@01))))
(assert (=>
  (not (guard<Bool> s@20@01))
  (=
    (joined_foo_2_1@26@01 s@20@01 r@21@01)
    (foo_2_1 ($Snap.first $t@22@01) s@20@01 r@21@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@20@01)
  (and
    (guard<Bool> s@20@01)
    (foo_2_1%precondition ($Snap.combine
      ($Snap.first $t@22@01)
      ($Snap.second $t@22@01)) s@20@01 r@21@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@20@01))
  (and
    (not (guard<Bool> s@20@01))
    (foo_2_1%precondition ($Snap.first $t@22@01) s@20@01 r@21@01))))
(push) ; 3
(assert (not (= (joined_foo_1_2@25@01 s@20@01 r@21@01) (joined_foo_2_1@26@01 s@20@01 r@21@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (joined_foo_1_2@25@01 s@20@01 r@21@01) (joined_foo_2_1@26@01 s@20@01 r@21@01)))
; [eval] foo_2_1(s, r) == foo_2_2(s, r)
; [eval] foo_2_1(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@20@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@20@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | guard[Bool](s@20@01) | live]
; [else-branch: 36 | !(guard[Bool](s@20@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 36 | guard[Bool](s@20@01)]
(assert (guard<Bool> s@20@01))
(assert (foo_2_1%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.second $t@22@01)) s@20@01 r@21@01))
(pop) ; 4
(push) ; 4
; [else-branch: 36 | !(guard[Bool](s@20@01))]
(assert (not (guard<Bool> s@20@01)))
(assert (foo_2_1%precondition ($Snap.first $t@22@01) s@20@01 r@21@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_2_1@27@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@20@01)
  (=
    (joined_foo_2_1@27@01 s@20@01 r@21@01)
    (foo_2_1 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01)) s@20@01 r@21@01))))
(assert (=>
  (not (guard<Bool> s@20@01))
  (=
    (joined_foo_2_1@27@01 s@20@01 r@21@01)
    (foo_2_1 ($Snap.first $t@22@01) s@20@01 r@21@01))))
; Joined path conditions
; Joined path conditions
; [eval] foo_2_2(s, r)
(push) ; 3
; [eval] guard(y)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (guard<Bool> s@20@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (guard<Bool> s@20@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | guard[Bool](s@20@01) | live]
; [else-branch: 37 | !(guard[Bool](s@20@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 37 | guard[Bool](s@20@01)]
(assert (guard<Bool> s@20@01))
(assert (foo_2_2%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.second $t@22@01)) s@20@01 r@21@01))
(pop) ; 4
(push) ; 4
; [else-branch: 37 | !(guard[Bool](s@20@01))]
(assert (not (guard<Bool> s@20@01)))
(assert (foo_2_2%precondition ($Snap.first $t@22@01) s@20@01 r@21@01))
(pop) ; 4
(pop) ; 3
(declare-fun joined_foo_2_2@28@01 ($Ref $Ref) Bool)
(assert (=>
  (guard<Bool> s@20@01)
  (=
    (joined_foo_2_2@28@01 s@20@01 r@21@01)
    (foo_2_2 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01)) s@20@01 r@21@01))))
(assert (=>
  (not (guard<Bool> s@20@01))
  (=
    (joined_foo_2_2@28@01 s@20@01 r@21@01)
    (foo_2_2 ($Snap.first $t@22@01) s@20@01 r@21@01))))
; Joined path conditions
(assert (=>
  (guard<Bool> s@20@01)
  (and
    (guard<Bool> s@20@01)
    (foo_2_2%precondition ($Snap.combine
      ($Snap.first $t@22@01)
      ($Snap.second $t@22@01)) s@20@01 r@21@01))))
; Joined path conditions
(assert (=>
  (not (guard<Bool> s@20@01))
  (and
    (not (guard<Bool> s@20@01))
    (foo_2_2%precondition ($Snap.first $t@22@01) s@20@01 r@21@01))))
(push) ; 3
(assert (not (= (joined_foo_2_1@27@01 s@20@01 r@21@01) (joined_foo_2_2@28@01 s@20@01 r@21@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (joined_foo_2_1@27@01 s@20@01 r@21@01) (joined_foo_2_2@28@01 s@20@01 r@21@01)))
(pop) ; 2
(pop) ; 1
