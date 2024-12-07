(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0114.vpr
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
(declare-sort D 0)
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
(declare-fun $SortWrappers.DTo$Snap (D) $Snap)
(declare-fun $SortWrappers.$SnapToD ($Snap) D)
(assert (forall ((x D)) (!
    (= x ($SortWrappers.$SnapToD($SortWrappers.DTo$Snap x)))
    :pattern (($SortWrappers.DTo$Snap x))
    :qid |$Snap.$SnapToDTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DTo$Snap($SortWrappers.$SnapToD x)))
    :pattern (($SortWrappers.$SnapToD x))
    :qid |$Snap.DTo$SnapToD|
    )))
; ////////// Symbols
(declare-fun fun3<Bool> (Int) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun2 ($Snap Bool $Ref $Ref Int) Int)
(declare-fun fun2%limited ($Snap Bool $Ref $Ref Int) Int)
(declare-fun fun2%stateless (Bool $Ref $Ref Int) Bool)
(declare-fun fun2%precondition ($Snap Bool $Ref $Ref Int) Bool)
(declare-fun fun1 ($Snap Int) Int)
(declare-fun fun1%limited ($Snap Int) Int)
(declare-fun fun1%stateless (Int) Bool)
(declare-fun fun1%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref Bool) Bool)
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
(assert (forall ((s@$ $Snap) (b@0@00 Bool) (x@1@00 $Ref) (y@2@00 $Ref) (j@3@00 Int)) (!
  (=
    (fun2%limited s@$ b@0@00 x@1@00 y@2@00 j@3@00)
    (fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :pattern ((fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (b@0@00 Bool) (x@1@00 $Ref) (y@2@00 $Ref) (j@3@00 Int)) (!
  (fun2%stateless b@0@00 x@1@00 y@2@00 j@3@00)
  :pattern ((fun2%limited s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (b@0@00 Bool) (x@1@00 $Ref) (y@2@00 $Ref) (j@3@00 Int)) (!
  (=>
    (fun2%precondition s@$ b@0@00 x@1@00 y@2@00 j@3@00)
    (= (fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00) 10))
  :pattern ((fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (b@0@00 Bool) (x@1@00 $Ref) (y@2@00 $Ref) (j@3@00 Int)) (!
  true
  :pattern ((fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (j@5@00 Int)) (!
  (= (fun1%limited s@$ j@5@00) (fun1 s@$ j@5@00))
  :pattern ((fun1 s@$ j@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (j@5@00 Int)) (!
  (fun1%stateless j@5@00)
  :pattern ((fun1%limited s@$ j@5@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (j@5@00 Int)) (!
  (=> (fun1%precondition s@$ j@5@00) (= (fun1 s@$ j@5@00) 10))
  :pattern ((fun1 s@$ j@5@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (j@5@00 Int)) (!
  true
  :pattern ((fun1 s@$ j@5@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test02 ----------
(declare-const x@0@01 $Ref)
(declare-const b@1@01 Bool)
(declare-const x@2@01 $Ref)
(declare-const b@3@01 Bool)
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
; inhale acc(P(x, b), write)
(declare-const $t@4@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall j: Int ::
;     { fun1(j) }
;     (unfolding acc(P(x, b), write) in fun1(j) > 0))
; [eval] (forall j: Int :: { fun1(j) } (unfolding acc(P(x, b), write) in fun1(j) > 0))
(declare-const j@5@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (unfolding acc(P(x, b), write) in fun1(j) > 0)
(push) ; 4
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@4@01) x@2@01 b@3@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@3@01 | live]
; [else-branch: 0 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | b@3@01]
(assert b@3@01)
(assert (not (= x@2@01 $Ref.null)))
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@5@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@5@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(b@3@01)]
(assert (not b@3@01))
(assert (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit))
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@5@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@5@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@6@01 (Int) Bool)
(assert (=> b@3@01 (= (joined_unfolding@6@01 j@5@01) (> (fun1 $Snap.unit j@5@01) 0))))
(assert (=>
  (not b@3@01)
  (= (joined_unfolding@6@01 j@5@01) (> (fun1 $Snap.unit j@5@01) 0))))
; Joined path conditions
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@4@01) x@2@01 b@3@01))
(assert (=>
  b@3@01
  (and b@3@01 (not (= x@2@01 $Ref.null)) (fun1%precondition $Snap.unit j@5@01))))
; Joined path conditions
(assert (=>
  (not b@3@01)
  (and
    (not b@3@01)
    (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit)
    (fun1%precondition $Snap.unit j@5@01))))
(assert (or (not b@3@01) b@3@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@4@01) x@2@01 b@3@01))
(assert (or (not b@3@01) b@3@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@5@01 Int)) (!
  (and
    (=> b@3@01 (= (joined_unfolding@6@01 j@5@01) (> (fun1 $Snap.unit j@5@01) 0)))
    (=>
      (not b@3@01)
      (= (joined_unfolding@6@01 j@5@01) (> (fun1 $Snap.unit j@5@01) 0)))
    (=>
      b@3@01
      (and
        b@3@01
        (not (= x@2@01 $Ref.null))
        (fun1%precondition $Snap.unit j@5@01)))
    (=>
      (not b@3@01)
      (and
        (not b@3@01)
        (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit)
        (fun1%precondition $Snap.unit j@5@01))))
  :pattern ((fun1%limited $Snap.unit j@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@15@10@15@69-aux|)))
(push) ; 3
(assert (not (forall ((j@5@01 Int)) (!
  (joined_unfolding@6@01 j@5@01)
  :pattern ((fun1%limited $Snap.unit j@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@15@10@15@69|))))
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
; [eval] (forall j: Int :: { fun1(j) } (unfolding acc(P(x, b), write) in fun1(j) > 0))
(declare-const j@7@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (unfolding acc(P(x, b), write) in fun1(j) > 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@3@01 | live]
; [else-branch: 1 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | b@3@01]
(assert b@3@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (not (= x@2@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@7@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@7@01))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(b@3@01)]
(assert (not b@3@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@7@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@7@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@8@01 (Int) Bool)
(assert (=> b@3@01 (= (joined_unfolding@8@01 j@7@01) (> (fun1 $Snap.unit j@7@01) 0))))
(assert (=>
  (not b@3@01)
  (= (joined_unfolding@8@01 j@7@01) (> (fun1 $Snap.unit j@7@01) 0))))
; Joined path conditions
(assert (=>
  b@3@01
  (and b@3@01 (not (= x@2@01 $Ref.null)) (fun1%precondition $Snap.unit j@7@01))))
; Joined path conditions
(assert (=>
  (not b@3@01)
  (and
    (not b@3@01)
    (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit)
    (fun1%precondition $Snap.unit j@7@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@7@01 Int)) (!
  (and
    (=> b@3@01 (= (joined_unfolding@8@01 j@7@01) (> (fun1 $Snap.unit j@7@01) 0)))
    (=>
      (not b@3@01)
      (= (joined_unfolding@8@01 j@7@01) (> (fun1 $Snap.unit j@7@01) 0)))
    (=>
      b@3@01
      (and
        b@3@01
        (not (= x@2@01 $Ref.null))
        (fun1%precondition $Snap.unit j@7@01)))
    (=>
      (not b@3@01)
      (and
        (not b@3@01)
        (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit)
        (fun1%precondition $Snap.unit j@7@01))))
  :pattern ((fun1%limited $Snap.unit j@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@15@10@15@69-aux|)))
(push) ; 3
(assert (not (forall ((j@7@01 Int)) (!
  (joined_unfolding@8@01 j@7@01)
  :pattern ((fun1%limited $Snap.unit j@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@15@10@15@69|))))
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
; [eval] (forall j: Int :: { fun1(j) } (unfolding acc(P(x, b), write) in fun1(j) > 0))
(declare-const j@9@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (unfolding acc(P(x, b), write) in fun1(j) > 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@3@01 | live]
; [else-branch: 2 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | b@3@01]
(assert b@3@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (not (= x@2@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@9@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@9@01))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(b@3@01)]
(assert (not b@3@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@9@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@9@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@10@01 (Int) Bool)
(assert (=> b@3@01 (= (joined_unfolding@10@01 j@9@01) (> (fun1 $Snap.unit j@9@01) 0))))
(assert (=>
  (not b@3@01)
  (= (joined_unfolding@10@01 j@9@01) (> (fun1 $Snap.unit j@9@01) 0))))
; Joined path conditions
(assert (=>
  b@3@01
  (and b@3@01 (not (= x@2@01 $Ref.null)) (fun1%precondition $Snap.unit j@9@01))))
; Joined path conditions
(assert (=>
  (not b@3@01)
  (and
    (not b@3@01)
    (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit)
    (fun1%precondition $Snap.unit j@9@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@9@01 Int)) (!
  (and
    (=>
      b@3@01
      (= (joined_unfolding@10@01 j@9@01) (> (fun1 $Snap.unit j@9@01) 0)))
    (=>
      (not b@3@01)
      (= (joined_unfolding@10@01 j@9@01) (> (fun1 $Snap.unit j@9@01) 0)))
    (=>
      b@3@01
      (and
        b@3@01
        (not (= x@2@01 $Ref.null))
        (fun1%precondition $Snap.unit j@9@01)))
    (=>
      (not b@3@01)
      (and
        (not b@3@01)
        (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit)
        (fun1%precondition $Snap.unit j@9@01))))
  :pattern ((fun1%limited $Snap.unit j@9@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@15@10@15@69-aux|)))
(push) ; 3
(assert (not (forall ((j@9@01 Int)) (!
  (joined_unfolding@10@01 j@9@01)
  :pattern ((fun1%limited $Snap.unit j@9@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@15@10@15@69|))))
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
; [eval] (forall j: Int :: { fun1(j) } (unfolding acc(P(x, b), write) in fun1(j) > 0))
(declare-const j@11@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (unfolding acc(P(x, b), write) in fun1(j) > 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | b@3@01 | live]
; [else-branch: 3 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | b@3@01]
(assert b@3@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (not (= x@2@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@11@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@11@01))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(b@3@01)]
(assert (not b@3@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@11@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@11@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@12@01 (Int) Bool)
(assert (=> b@3@01 (= (joined_unfolding@12@01 j@11@01) (> (fun1 $Snap.unit j@11@01) 0))))
(assert (=>
  (not b@3@01)
  (= (joined_unfolding@12@01 j@11@01) (> (fun1 $Snap.unit j@11@01) 0))))
; Joined path conditions
(assert (=>
  b@3@01
  (and b@3@01 (not (= x@2@01 $Ref.null)) (fun1%precondition $Snap.unit j@11@01))))
; Joined path conditions
(assert (=>
  (not b@3@01)
  (and
    (not b@3@01)
    (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit)
    (fun1%precondition $Snap.unit j@11@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@11@01 Int)) (!
  (and
    (=>
      b@3@01
      (= (joined_unfolding@12@01 j@11@01) (> (fun1 $Snap.unit j@11@01) 0)))
    (=>
      (not b@3@01)
      (= (joined_unfolding@12@01 j@11@01) (> (fun1 $Snap.unit j@11@01) 0)))
    (=>
      b@3@01
      (and
        b@3@01
        (not (= x@2@01 $Ref.null))
        (fun1%precondition $Snap.unit j@11@01)))
    (=>
      (not b@3@01)
      (and
        (not b@3@01)
        (= ($SortWrappers.IntTo$Snap $t@4@01) $Snap.unit)
        (fun1%precondition $Snap.unit j@11@01))))
  :pattern ((fun1%limited $Snap.unit j@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@15@10@15@69-aux|)))
(push) ; 3
(assert (not (forall ((j@11@01 Int)) (!
  (joined_unfolding@12@01 j@11@01)
  :pattern ((fun1%limited $Snap.unit j@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@15@10@15@69|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@13@01 $Ref)
(declare-const b@14@01 Bool)
(declare-const x@15@01 $Ref)
(declare-const b@16@01 Bool)
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
; assert (forall j: Int :: { fun1(j) } (b ? fun1(j) > 0 : fun1(j) > 1))
; [eval] (forall j: Int :: { fun1(j) } (b ? fun1(j) > 0 : fun1(j) > 1))
(declare-const j@17@01 Int)
(push) ; 3
; [eval] (b ? fun1(j) > 0 : fun1(j) > 1)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@16@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@16@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | b@16@01 | live]
; [else-branch: 4 | !(b@16@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | b@16@01]
(assert b@16@01)
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@17@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@17@01))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(b@16@01)]
(assert (not b@16@01))
; [eval] fun1(j) > 1
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@17@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@17@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@16@01 (and b@16@01 (fun1%precondition $Snap.unit j@17@01))))
; Joined path conditions
(assert (=> (not b@16@01) (and (not b@16@01) (fun1%precondition $Snap.unit j@17@01))))
(assert (or (not b@16@01) b@16@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (or (not b@16@01) b@16@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@17@01 Int)) (!
  (and
    (=> b@16@01 (and b@16@01 (fun1%precondition $Snap.unit j@17@01)))
    (=> (not b@16@01) (and (not b@16@01) (fun1%precondition $Snap.unit j@17@01))))
  :pattern ((fun1%limited $Snap.unit j@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@20@10@20@66-aux|)))
(assert (forall ((j@17@01 Int)) (!
  (fun1%precondition $Snap.unit j@17@01)
  :pattern ((fun1%limited $Snap.unit j@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@20@10@20@66_precondition|)))
(push) ; 3
(assert (not (forall ((j@17@01 Int)) (!
  (=>
    (fun1%precondition $Snap.unit j@17@01)
    (ite b@16@01 (> (fun1 $Snap.unit j@17@01) 0) (> (fun1 $Snap.unit j@17@01) 1)))
  :pattern ((fun1%limited $Snap.unit j@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@20@10@20@66|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@17@01 Int)) (!
  (ite b@16@01 (> (fun1 $Snap.unit j@17@01) 0) (> (fun1 $Snap.unit j@17@01) 1))
  :pattern ((fun1%limited $Snap.unit j@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@20@10@20@66|)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@18@01 $Ref)
(declare-const y@19@01 $Ref)
(declare-const b@20@01 Bool)
(declare-const x@21@01 $Ref)
(declare-const y@22@01 $Ref)
(declare-const b@23@01 Bool)
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
; inhale acc(x.f, write) && acc(y.f, write)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (not (= x@21@01 $Ref.null)))
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@21@01 y@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@22@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall j: Int :: { fun2(b, x, y, j) } fun2(b, x, y, j) > 0)
; [eval] (forall j: Int :: { fun2(b, x, y, j) } fun2(b, x, y, j) > 0)
(declare-const j@25@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] fun2(b, x, y, j) > 0
; [eval] fun2(b, x, y, j)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@23@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@23@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | b@23@01 | live]
; [else-branch: 5 | !(b@23@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | b@23@01]
(assert b@23@01)
(assert (fun2%precondition ($Snap.first $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(b@23@01)]
(assert (not b@23@01))
(assert (fun2%precondition ($Snap.second $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_fun2@26@01 (Bool $Ref $Ref Int) Int)
(assert (=>
  b@23@01
  (=
    (joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01)
    (fun2 ($Snap.first $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01))))
(assert (=>
  (not b@23@01)
  (=
    (joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01)
    (fun2 ($Snap.second $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01))))
; Joined path conditions
(assert (=>
  b@23@01
  (and
    b@23@01
    (fun2%precondition ($Snap.first $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01))))
; Joined path conditions
(assert (=>
  (not b@23@01)
  (and
    (not b@23@01)
    (fun2%precondition ($Snap.second $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01))))
(assert (or (not b@23@01) b@23@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (or (not b@23@01) b@23@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@25@01 Int)) (!
  (and
    (=>
      b@23@01
      (=
        (joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01)
        (fun2 ($Snap.first $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01)))
    (=>
      (not b@23@01)
      (=
        (joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01)
        (fun2 ($Snap.second $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01)))
    (=>
      b@23@01
      (and
        b@23@01
        (fun2%precondition ($Snap.first $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01)))
    (=>
      (not b@23@01)
      (and
        (not b@23@01)
        (fun2%precondition ($Snap.second $t@24@01) b@23@01 x@21@01 y@22@01 j@25@01))))
  :pattern ((joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@31@10@31@66-aux|)))
(push) ; 3
(assert (not (forall ((j@25@01 Int)) (!
  (> (joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01) 0)
  :pattern ((joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@31@10@31@66|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@25@01 Int)) (!
  (> (joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01) 0)
  :pattern ((joined_fun2@26@01 b@23@01 x@21@01 y@22@01 j@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@31@10@31@66|)))
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@27@01 $Ref)
(declare-const y@28@01 $Ref)
(declare-const b@29@01 Bool)
(declare-const x@30@01 $Ref)
(declare-const y@31@01 $Ref)
(declare-const b@32@01 Bool)
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
; inhale acc(x.f, write) && acc(y.f, write)
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (not (= x@30@01 $Ref.null)))
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@30@01 y@31@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@31@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int :: { fun2(b, x, y, j) } 0 < j && j < 10 ==> fun3(j))
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] (forall j: Int :: { fun2(b, x, y, j) } 0 < j && j < 10 ==> fun3(j))
(declare-const j@35@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < j && j < 10 ==> fun3(j)
; [eval] 0 < j && j < 10
; [eval] 0 < j
(push) ; 4
; [then-branch: 6 | !(0 < j@35@01) | live]
; [else-branch: 6 | 0 < j@35@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 < j@35@01)]
(assert (not (< 0 j@35@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 < j@35@01]
(assert (< 0 j@35@01))
; [eval] j < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (< 0 j@35@01) (not (< 0 j@35@01))))
(push) ; 4
; [then-branch: 7 | 0 < j@35@01 && j@35@01 < 10 | live]
; [else-branch: 7 | !(0 < j@35@01 && j@35@01 < 10) | live]
(push) ; 5
; [then-branch: 7 | 0 < j@35@01 && j@35@01 < 10]
(assert (and (< 0 j@35@01) (< j@35@01 10)))
; [eval] fun3(j)
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(0 < j@35@01 && j@35@01 < 10)]
(assert (not (and (< 0 j@35@01) (< j@35@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (and (< 0 j@35@01) (< j@35@01 10))) (and (< 0 j@35@01) (< j@35@01 10))))
; [eval] fun2(b, x, y, j)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@32@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@32@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b@32@01 | live]
; [else-branch: 8 | !(b@32@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | b@32@01]
(assert b@32@01)
(assert (fun2%precondition ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(b@32@01)]
(assert (not b@32@01))
(assert (fun2%precondition ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_fun2@36@01 (Bool $Ref $Ref Int) Int)
(assert (=>
  b@32@01
  (=
    (joined_fun2@36@01 b@32@01 x@30@01 y@31@01 j@35@01)
    (fun2 ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
(assert (=>
  (not b@32@01)
  (=
    (joined_fun2@36@01 b@32@01 x@30@01 y@31@01 j@35@01)
    (fun2 ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
; Joined path conditions
(assert (=>
  b@32@01
  (and
    b@32@01
    (fun2%precondition ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
; Joined path conditions
(assert (=>
  (not b@32@01)
  (and
    (not b@32@01)
    (fun2%precondition ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
(assert (or (not b@32@01) b@32@01))
(assert (=>
  b@32@01
  (=
    (joined_fun2@36@01 b@32@01 x@30@01 y@31@01 j@35@01)
    (fun2 ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
(assert (=>
  (not b@32@01)
  (=
    (joined_fun2@36@01 b@32@01 x@30@01 y@31@01 j@35@01)
    (fun2 ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
(assert (=>
  b@32@01
  (and
    b@32@01
    (fun2%precondition ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
(assert (=>
  (not b@32@01)
  (and
    (not b@32@01)
    (fun2%precondition ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
(assert (or (not b@32@01) b@32@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (or (not b@32@01) b@32@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@35@01 Int)) (!
  (and
    (or (< 0 j@35@01) (not (< 0 j@35@01)))
    (or
      (not (and (< 0 j@35@01) (< j@35@01 10)))
      (and (< 0 j@35@01) (< j@35@01 10)))
    (=>
      b@32@01
      (=
        (joined_fun2@36@01 b@32@01 x@30@01 y@31@01 j@35@01)
        (fun2 ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01)))
    (=>
      (not b@32@01)
      (=
        (joined_fun2@36@01 b@32@01 x@30@01 y@31@01 j@35@01)
        (fun2 ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01)))
    (=>
      b@32@01
      (and
        b@32@01
        (fun2%precondition ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01)))
    (=>
      (not b@32@01)
      (and
        (not b@32@01)
        (fun2%precondition ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 j@35@01))))
  :pattern ((joined_fun2@36@01 b@32@01 x@30@01 y@31@01 j@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@42@10@42@73-aux|)))
(assert (forall ((j@35@01 Int)) (!
  (=> (and (< 0 j@35@01) (< j@35@01 10)) (fun3<Bool> j@35@01))
  :pattern ((joined_fun2@36@01 b@32@01 x@30@01 y@31@01 j@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@42@10@42@73|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun2(b, x, y, 5) > 0
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] fun2(b, x, y, 5) > 0
; [eval] fun2(b, x, y, 5)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@32@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@32@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | b@32@01 | live]
; [else-branch: 9 | !(b@32@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | b@32@01]
(assert b@32@01)
(assert (fun2%precondition ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 5))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(b@32@01)]
(assert (not b@32@01))
(assert (fun2%precondition ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 5))
(pop) ; 4
(pop) ; 3
(declare-fun joined_fun2@38@01 (Bool $Ref $Ref Int) Int)
(assert (=>
  b@32@01
  (=
    (joined_fun2@38@01 b@32@01 x@30@01 y@31@01 5)
    (fun2 ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 5))))
(assert (=>
  (not b@32@01)
  (=
    (joined_fun2@38@01 b@32@01 x@30@01 y@31@01 5)
    (fun2 ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 5))))
; Joined path conditions
(assert (=>
  b@32@01
  (and
    b@32@01
    (fun2%precondition ($Snap.first $t@33@01) b@32@01 x@30@01 y@31@01 5))))
; Joined path conditions
(assert (=>
  (not b@32@01)
  (and
    (not b@32@01)
    (fun2%precondition ($Snap.second $t@33@01) b@32@01 x@30@01 y@31@01 5))))
(assert (> (joined_fun2@38@01 b@32@01 x@30@01 y@31@01 5) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert fun3(5)
; [eval] fun3(5)
(set-option :timeout 0)
(push) ; 3
(assert (not (fun3<Bool> 5)))
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
(assert (not (= y@31@01 x@30@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@33@01))))))
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
    ($SortWrappers.$SnapToInt ($Snap.second $t@33@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@30@01 y@31@01)) (not (= y@31@01 x@30@01))))
; [eval] fun3(5)
(set-option :timeout 0)
(push) ; 3
(assert (not (fun3<Bool> 5)))
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
(assert (not (= y@31@01 x@30@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@33@01))))))
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
    ($SortWrappers.$SnapToInt ($Snap.second $t@33@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@30@01 y@31@01)) (not (= y@31@01 x@30@01))))
; [eval] fun3(5)
(set-option :timeout 0)
(push) ; 3
(assert (not (fun3<Bool> 5)))
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
(assert (not (= y@31@01 x@30@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@33@01))))))
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
    ($SortWrappers.$SnapToInt ($Snap.second $t@33@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@30@01 y@31@01)) (not (= y@31@01 x@30@01))))
; [eval] fun3(5)
(set-option :timeout 0)
(push) ; 3
(assert (not (fun3<Bool> 5)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const x@39@01 $Ref)
(declare-const b@40@01 Bool)
(declare-const c@41@01 Bool)
(declare-const x@42@01 $Ref)
(declare-const b@43@01 Bool)
(declare-const c@44@01 Bool)
(push) ; 1
(declare-const $t@45@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall j: Int :: { fun1(j) } fun1(j) > 0)
; [eval] (forall j: Int :: { fun1(j) } fun1(j) > 0)
(declare-const j@46@01 Int)
(push) ; 3
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 4
(assert (fun1%precondition $Snap.unit j@46@01))
(pop) ; 4
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@46@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@46@01 Int)) (!
  (fun1%precondition $Snap.unit j@46@01)
  :pattern ((fun1%limited $Snap.unit j@46@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@53@10@53@38-aux|)))
(assert (forall ((j@46@01 Int)) (!
  (fun1%precondition $Snap.unit j@46@01)
  :pattern ((fun1%limited $Snap.unit j@46@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@53@10@53@38_precondition|)))
(push) ; 3
(assert (not (forall ((j@46@01 Int)) (!
  (=> (fun1%precondition $Snap.unit j@46@01) (> (fun1 $Snap.unit j@46@01) 0))
  :pattern ((fun1%limited $Snap.unit j@46@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@53@10@53@38|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@46@01 Int)) (!
  (> (fun1 $Snap.unit j@46@01) 0)
  :pattern ((fun1%limited $Snap.unit j@46@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@53@10@53@38|)))
; [exec]
; assert (forall j: Int :: { fun1(j) } (false ? true : fun1(j) > 0))
; [eval] (forall j: Int :: { fun1(j) } (false ? true : fun1(j) > 0))
(declare-const j@47@01 Int)
(push) ; 3
; [eval] (false ? true : fun1(j) > 0)
(push) ; 4
; [then-branch: 10 | False | dead]
; [else-branch: 10 | True | live]
(push) ; 5
; [else-branch: 10 | True]
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@47@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@47@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@47@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@47@01 Int)) (!
  (fun1%precondition $Snap.unit j@47@01)
  :pattern ((fun1%limited $Snap.unit j@47@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@54@10@54@53-aux|)))
(assert (forall ((j@47@01 Int)) (!
  (fun1%precondition $Snap.unit j@47@01)
  :pattern ((fun1%limited $Snap.unit j@47@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@54@10@54@53_precondition|)))
(push) ; 3
(assert (not (forall ((j@47@01 Int)) (!
  (=> (fun1%precondition $Snap.unit j@47@01) (> (fun1 $Snap.unit j@47@01) 0))
  :pattern ((fun1%limited $Snap.unit j@47@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@54@10@54@53|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@47@01 Int)) (!
  (> (fun1 $Snap.unit j@47@01) 0)
  :pattern ((fun1%limited $Snap.unit j@47@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@54@10@54@53|)))
; [exec]
; assert (forall j: Int :: { fun1(j) } (b ? fun1(j) > 5 : fun1(j) > 0))
; [eval] (forall j: Int :: { fun1(j) } (b ? fun1(j) > 5 : fun1(j) > 0))
(declare-const j@48@01 Int)
(push) ; 3
; [eval] (b ? fun1(j) > 5 : fun1(j) > 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@43@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@43@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b@43@01 | live]
; [else-branch: 11 | !(b@43@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | b@43@01]
(assert b@43@01)
; [eval] fun1(j) > 5
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@48@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@48@01))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(b@43@01)]
(assert (not b@43@01))
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@48@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@48@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@43@01 (and b@43@01 (fun1%precondition $Snap.unit j@48@01))))
; Joined path conditions
(assert (=> (not b@43@01) (and (not b@43@01) (fun1%precondition $Snap.unit j@48@01))))
(assert (or (not b@43@01) b@43@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (or (not b@43@01) b@43@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@48@01 Int)) (!
  (and
    (=> b@43@01 (and b@43@01 (fun1%precondition $Snap.unit j@48@01)))
    (=> (not b@43@01) (and (not b@43@01) (fun1%precondition $Snap.unit j@48@01))))
  :pattern ((fun1%limited $Snap.unit j@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@55@10@55@56-aux|)))
(assert (forall ((j@48@01 Int)) (!
  (fun1%precondition $Snap.unit j@48@01)
  :pattern ((fun1%limited $Snap.unit j@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@55@10@55@56_precondition|)))
(push) ; 3
(assert (not (forall ((j@48@01 Int)) (!
  (=>
    (fun1%precondition $Snap.unit j@48@01)
    (ite b@43@01 (> (fun1 $Snap.unit j@48@01) 5) (> (fun1 $Snap.unit j@48@01) 0)))
  :pattern ((fun1%limited $Snap.unit j@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@55@10@55@56|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@48@01 Int)) (!
  (ite b@43@01 (> (fun1 $Snap.unit j@48@01) 5) (> (fun1 $Snap.unit j@48@01) 0))
  :pattern ((fun1%limited $Snap.unit j@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@55@10@55@56|)))
; [exec]
; assert (forall j: Int :: { fun1(j) } true ==> fun1(j) > 0)
; [eval] (forall j: Int :: { fun1(j) } true ==> fun1(j) > 0)
(declare-const j@49@01 Int)
(push) ; 3
; [eval] true ==> fun1(j) > 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | True | live]
; [else-branch: 12 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | True]
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@49@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@49@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@49@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@49@01 Int)) (!
  (fun1%precondition $Snap.unit j@49@01)
  :pattern ((fun1%limited $Snap.unit j@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@57@10@57@47-aux|)))
(assert (forall ((j@49@01 Int)) (!
  (fun1%precondition $Snap.unit j@49@01)
  :pattern ((fun1%limited $Snap.unit j@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@57@10@57@47_precondition|)))
(push) ; 3
(assert (not (forall ((j@49@01 Int)) (!
  (=> (fun1%precondition $Snap.unit j@49@01) (> (fun1 $Snap.unit j@49@01) 0))
  :pattern ((fun1%limited $Snap.unit j@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@57@10@57@47|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@49@01 Int)) (!
  (> (fun1 $Snap.unit j@49@01) 0)
  :pattern ((fun1%limited $Snap.unit j@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@57@10@57@47|)))
; [exec]
; assert (forall j: Int :: { fun1(j) } b ==> fun1(j) > 0)
; [eval] (forall j: Int :: { fun1(j) } b ==> fun1(j) > 0)
(declare-const j@50@01 Int)
(push) ; 3
; [eval] b ==> fun1(j) > 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@43@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@43@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | b@43@01 | live]
; [else-branch: 13 | !(b@43@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | b@43@01]
(assert b@43@01)
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@50@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@50@01))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(b@43@01)]
(assert (not b@43@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@43@01 (and b@43@01 (fun1%precondition $Snap.unit j@50@01))))
; Joined path conditions
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@50@01 Int)) (!
  (=> b@43@01 (and b@43@01 (fun1%precondition $Snap.unit j@50@01)))
  :pattern ((fun1%limited $Snap.unit j@50@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@58@10@58@44-aux|)))
(assert (forall ((j@50@01 Int)) (!
  (=> b@43@01 (fun1%precondition $Snap.unit j@50@01))
  :pattern ((fun1%limited $Snap.unit j@50@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@58@10@58@44_precondition|)))
(push) ; 3
(assert (not (forall ((j@50@01 Int)) (!
  (=>
    (and (=> b@43@01 (fun1%precondition $Snap.unit j@50@01)) b@43@01)
    (> (fun1 $Snap.unit j@50@01) 0))
  :pattern ((fun1%limited $Snap.unit j@50@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@58@10@58@44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@50@01 Int)) (!
  (=> b@43@01 (> (fun1 $Snap.unit j@50@01) 0))
  :pattern ((fun1%limited $Snap.unit j@50@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@58@10@58@44|)))
; [exec]
; assert (forall j: Int ::
;     { fun1(j) }
;     (unfolding acc(P(x, c), write) in fun1(j) > 0))
; [eval] (forall j: Int :: { fun1(j) } (unfolding acc(P(x, c), write) in fun1(j) > 0))
(declare-const j@51@01 Int)
(push) ; 3
; [eval] (unfolding acc(P(x, c), write) in fun1(j) > 0)
(push) ; 4
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@45@01) x@42@01 c@44@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not c@44@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | c@44@01 | live]
; [else-branch: 14 | !(c@44@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | c@44@01]
(assert c@44@01)
(assert (not (= x@42@01 $Ref.null)))
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@51@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@51@01))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(c@44@01)]
(assert (not c@44@01))
(assert (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit))
; [eval] fun1(j) > 0
; [eval] fun1(j)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@51@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@51@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@52@01 (Int) Bool)
(assert (=> c@44@01 (= (joined_unfolding@52@01 j@51@01) (> (fun1 $Snap.unit j@51@01) 0))))
(assert (=>
  (not c@44@01)
  (= (joined_unfolding@52@01 j@51@01) (> (fun1 $Snap.unit j@51@01) 0))))
; Joined path conditions
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@45@01) x@42@01 c@44@01))
(assert (=>
  c@44@01
  (and
    c@44@01
    (not (= x@42@01 $Ref.null))
    (fun1%precondition $Snap.unit j@51@01))))
; Joined path conditions
(assert (=>
  (not c@44@01)
  (and
    (not c@44@01)
    (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit)
    (fun1%precondition $Snap.unit j@51@01))))
(assert (or (not c@44@01) c@44@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@45@01) x@42@01 c@44@01))
(assert (or (not c@44@01) c@44@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@51@01 Int)) (!
  (and
    (=>
      c@44@01
      (= (joined_unfolding@52@01 j@51@01) (> (fun1 $Snap.unit j@51@01) 0)))
    (=>
      (not c@44@01)
      (= (joined_unfolding@52@01 j@51@01) (> (fun1 $Snap.unit j@51@01) 0)))
    (=>
      c@44@01
      (and
        c@44@01
        (not (= x@42@01 $Ref.null))
        (fun1%precondition $Snap.unit j@51@01)))
    (=>
      (not c@44@01)
      (and
        (not c@44@01)
        (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit)
        (fun1%precondition $Snap.unit j@51@01))))
  :pattern ((fun1%limited $Snap.unit j@51@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@61@10@61@64-aux|)))
(push) ; 3
(assert (not (forall ((j@51@01 Int)) (!
  (joined_unfolding@52@01 j@51@01)
  :pattern ((fun1%limited $Snap.unit j@51@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@61@10@61@64|))))
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
; [eval] (forall j: Int :: { fun1(j) } (unfolding acc(P(x, c), write) in fun1(j) > 0))
(declare-const j@53@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (unfolding acc(P(x, c), write) in fun1(j) > 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not c@44@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | c@44@01 | live]
; [else-branch: 15 | !(c@44@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | c@44@01]
(assert c@44@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (not (= x@42@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@53@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@53@01))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(c@44@01)]
(assert (not c@44@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@53@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@53@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@54@01 (Int) Bool)
(assert (=> c@44@01 (= (joined_unfolding@54@01 j@53@01) (> (fun1 $Snap.unit j@53@01) 0))))
(assert (=>
  (not c@44@01)
  (= (joined_unfolding@54@01 j@53@01) (> (fun1 $Snap.unit j@53@01) 0))))
; Joined path conditions
(assert (=>
  c@44@01
  (and
    c@44@01
    (not (= x@42@01 $Ref.null))
    (fun1%precondition $Snap.unit j@53@01))))
; Joined path conditions
(assert (=>
  (not c@44@01)
  (and
    (not c@44@01)
    (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit)
    (fun1%precondition $Snap.unit j@53@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@53@01 Int)) (!
  (and
    (=>
      c@44@01
      (= (joined_unfolding@54@01 j@53@01) (> (fun1 $Snap.unit j@53@01) 0)))
    (=>
      (not c@44@01)
      (= (joined_unfolding@54@01 j@53@01) (> (fun1 $Snap.unit j@53@01) 0)))
    (=>
      c@44@01
      (and
        c@44@01
        (not (= x@42@01 $Ref.null))
        (fun1%precondition $Snap.unit j@53@01)))
    (=>
      (not c@44@01)
      (and
        (not c@44@01)
        (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit)
        (fun1%precondition $Snap.unit j@53@01))))
  :pattern ((fun1%limited $Snap.unit j@53@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@61@10@61@64-aux|)))
(push) ; 3
(assert (not (forall ((j@53@01 Int)) (!
  (joined_unfolding@54@01 j@53@01)
  :pattern ((fun1%limited $Snap.unit j@53@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@61@10@61@64|))))
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
; [eval] (forall j: Int :: { fun1(j) } (unfolding acc(P(x, c), write) in fun1(j) > 0))
(declare-const j@55@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (unfolding acc(P(x, c), write) in fun1(j) > 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not c@44@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | c@44@01 | live]
; [else-branch: 16 | !(c@44@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | c@44@01]
(assert c@44@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (not (= x@42@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@55@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@55@01))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | !(c@44@01)]
(assert (not c@44@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@55@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@55@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@56@01 (Int) Bool)
(assert (=> c@44@01 (= (joined_unfolding@56@01 j@55@01) (> (fun1 $Snap.unit j@55@01) 0))))
(assert (=>
  (not c@44@01)
  (= (joined_unfolding@56@01 j@55@01) (> (fun1 $Snap.unit j@55@01) 0))))
; Joined path conditions
(assert (=>
  c@44@01
  (and
    c@44@01
    (not (= x@42@01 $Ref.null))
    (fun1%precondition $Snap.unit j@55@01))))
; Joined path conditions
(assert (=>
  (not c@44@01)
  (and
    (not c@44@01)
    (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit)
    (fun1%precondition $Snap.unit j@55@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@55@01 Int)) (!
  (and
    (=>
      c@44@01
      (= (joined_unfolding@56@01 j@55@01) (> (fun1 $Snap.unit j@55@01) 0)))
    (=>
      (not c@44@01)
      (= (joined_unfolding@56@01 j@55@01) (> (fun1 $Snap.unit j@55@01) 0)))
    (=>
      c@44@01
      (and
        c@44@01
        (not (= x@42@01 $Ref.null))
        (fun1%precondition $Snap.unit j@55@01)))
    (=>
      (not c@44@01)
      (and
        (not c@44@01)
        (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit)
        (fun1%precondition $Snap.unit j@55@01))))
  :pattern ((fun1%limited $Snap.unit j@55@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@61@10@61@64-aux|)))
(push) ; 3
(assert (not (forall ((j@55@01 Int)) (!
  (joined_unfolding@56@01 j@55@01)
  :pattern ((fun1%limited $Snap.unit j@55@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@61@10@61@64|))))
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
; [eval] (forall j: Int :: { fun1(j) } (unfolding acc(P(x, c), write) in fun1(j) > 0))
(declare-const j@57@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (unfolding acc(P(x, c), write) in fun1(j) > 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not c@44@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not c@44@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | c@44@01 | live]
; [else-branch: 17 | !(c@44@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | c@44@01]
(assert c@44@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (not (= x@42@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@57@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@57@01))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(c@44@01)]
(assert (not c@44@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] fun1(j) > 0
; [eval] fun1(j)
(set-option :timeout 0)
(push) ; 6
(assert (fun1%precondition $Snap.unit j@57@01))
(pop) ; 6
; Joined path conditions
(assert (fun1%precondition $Snap.unit j@57@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@58@01 (Int) Bool)
(assert (=> c@44@01 (= (joined_unfolding@58@01 j@57@01) (> (fun1 $Snap.unit j@57@01) 0))))
(assert (=>
  (not c@44@01)
  (= (joined_unfolding@58@01 j@57@01) (> (fun1 $Snap.unit j@57@01) 0))))
; Joined path conditions
(assert (=>
  c@44@01
  (and
    c@44@01
    (not (= x@42@01 $Ref.null))
    (fun1%precondition $Snap.unit j@57@01))))
; Joined path conditions
(assert (=>
  (not c@44@01)
  (and
    (not c@44@01)
    (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit)
    (fun1%precondition $Snap.unit j@57@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@57@01 Int)) (!
  (and
    (=>
      c@44@01
      (= (joined_unfolding@58@01 j@57@01) (> (fun1 $Snap.unit j@57@01) 0)))
    (=>
      (not c@44@01)
      (= (joined_unfolding@58@01 j@57@01) (> (fun1 $Snap.unit j@57@01) 0)))
    (=>
      c@44@01
      (and
        c@44@01
        (not (= x@42@01 $Ref.null))
        (fun1%precondition $Snap.unit j@57@01)))
    (=>
      (not c@44@01)
      (and
        (not c@44@01)
        (= ($SortWrappers.IntTo$Snap $t@45@01) $Snap.unit)
        (fun1%precondition $Snap.unit j@57@01))))
  :pattern ((fun1%limited $Snap.unit j@57@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@61@10@61@64-aux|)))
(push) ; 3
(assert (not (forall ((j@57@01 Int)) (!
  (joined_unfolding@58@01 j@57@01)
  :pattern ((fun1%limited $Snap.unit j@57@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0114.vpr@61@10@61@64|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
