(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0348.vpr
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
(declare-fun bufferRight ($Snap $Ref) Int)
(declare-fun bufferRight%limited ($Snap $Ref) Int)
(declare-fun bufferRight%stateless ($Ref) Bool)
(declare-fun bufferRight%precondition ($Snap $Ref) Bool)
(declare-fun bar ($Snap Int) Bool)
(declare-fun bar%limited ($Snap Int) Bool)
(declare-fun bar%stateless (Int) Bool)
(declare-fun bar%precondition ($Snap Int) Bool)
(declare-fun arrayAt ($Snap $Ref Int) Int)
(declare-fun arrayAt%limited ($Snap $Ref Int) Int)
(declare-fun arrayAt%stateless ($Ref Int) Bool)
(declare-fun arrayAt%precondition ($Snap $Ref Int) Bool)
(declare-fun outer ($Snap $Ref Int) Bool)
(declare-fun outer%limited ($Snap $Ref Int) Bool)
(declare-fun outer%stateless ($Ref Int) Bool)
(declare-fun outer%precondition ($Snap $Ref Int) Bool)
(declare-fun inner ($Snap $Ref) Int)
(declare-fun inner%limited ($Snap $Ref) Int)
(declare-fun inner%stateless ($Ref) Bool)
(declare-fun inner%precondition ($Snap $Ref) Bool)
(declare-fun foo ($Snap $Ref) Int)
(declare-fun foo%limited ($Snap $Ref) Int)
(declare-fun foo%stateless ($Ref) Bool)
(declare-fun foo%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
(declare-fun gapBuffer%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (buffer@0@00 $Ref)) (!
  (= (bufferRight%limited s@$ buffer@0@00) (bufferRight s@$ buffer@0@00))
  :pattern ((bufferRight s@$ buffer@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (buffer@0@00 $Ref)) (!
  (bufferRight%stateless buffer@0@00)
  :pattern ((bufferRight%limited s@$ buffer@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (= (bar%limited s@$ i@2@00) (bar s@$ i@2@00))
  :pattern ((bar s@$ i@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (bar%stateless i@2@00)
  :pattern ((bar%limited s@$ i@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (buffer@4@00 $Ref) (index@5@00 Int)) (!
  (=
    (arrayAt%limited s@$ buffer@4@00 index@5@00)
    (arrayAt s@$ buffer@4@00 index@5@00))
  :pattern ((arrayAt s@$ buffer@4@00 index@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (buffer@4@00 $Ref) (index@5@00 Int)) (!
  (arrayAt%stateless buffer@4@00 index@5@00)
  :pattern ((arrayAt%limited s@$ buffer@4@00 index@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@7@00 $Ref) (v@8@00 Int)) (!
  (= (outer%limited s@$ x@7@00 v@8@00) (outer s@$ x@7@00 v@8@00))
  :pattern ((outer s@$ x@7@00 v@8@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@7@00 $Ref) (v@8@00 Int)) (!
  (outer%stateless x@7@00 v@8@00)
  :pattern ((outer%limited s@$ x@7@00 v@8@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@10@00 $Ref)) (!
  (= (inner%limited s@$ x@10@00) (inner s@$ x@10@00))
  :pattern ((inner s@$ x@10@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@10@00 $Ref)) (!
  (inner%stateless x@10@00)
  :pattern ((inner%limited s@$ x@10@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  (= (foo%limited s@$ x@12@00) (foo s@$ x@12@00))
  :pattern ((foo s@$ x@12@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@12@00 $Ref)) (!
  (foo%stateless x@12@00)
  :pattern ((foo%limited s@$ x@12@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
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
; inhale bar(foo(x))
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] bar(foo(x))
; [eval] foo(x)
(push) ; 3
(assert (foo%precondition $Snap.unit x@1@01))
(pop) ; 3
; Joined path conditions
(assert (foo%precondition $Snap.unit x@1@01))
(push) ; 3
; [eval] 0 < i
(push) ; 4
(assert (not (< 0 (foo $Snap.unit x@1@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 < i
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (foo $Snap.unit x@1@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 < i
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (foo $Snap.unit x@1@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 < i
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (foo $Snap.unit x@1@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const x@3@01 $Ref)
(declare-const x@4@01 $Ref)
(push) ; 1
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] outer(x, inner(x))
; [eval] inner(x)
(push) ; 2
(assert (inner%precondition ($Snap.first $t@5@01) x@4@01))
(pop) ; 2
; Joined path conditions
(assert (inner%precondition ($Snap.first $t@5@01) x@4@01))
(push) ; 2
; [eval] (unfolding acc(P(x), write) in v == 0)
(push) ; 3
(assert (P%trigger ($Snap.first $t@5@01) x@4@01))
(assert (not (= x@4@01 $Ref.null)))
; [eval] v == 0
(pop) ; 3
; Joined path conditions
(assert (and (P%trigger ($Snap.first $t@5@01) x@4@01) (not (= x@4@01 $Ref.null))))
(push) ; 3
(assert (not (= (inner ($Snap.first $t@5@01) x@4@01) 0)))
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
; [eval] (unfolding acc(P(x), write) in v == 0)
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v == 0
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (= (inner ($Snap.first $t@5@01) x@4@01) 0)))
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
; [eval] (unfolding acc(P(x), write) in v == 0)
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v == 0
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (= (inner ($Snap.first $t@5@01) x@4@01) 0)))
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
; [eval] (unfolding acc(P(x), write) in v == 0)
(set-option :timeout 0)
(push) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v == 0
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (= (inner ($Snap.first $t@5@01) x@4@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@6@01 $Ref)
(declare-const x@7@01 $Ref)
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
; inhale acc(P(x), write)
(declare-const $t@8@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale outer(x, inner(x))
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] outer(x, inner(x))
; [eval] inner(x)
(set-option :timeout 0)
(push) ; 3
(assert (inner%precondition ($SortWrappers.IntTo$Snap $t@8@01) x@7@01))
(pop) ; 3
; Joined path conditions
(assert (inner%precondition ($SortWrappers.IntTo$Snap $t@8@01) x@7@01))
(push) ; 3
; [eval] (unfolding acc(P(x), write) in v == 0)
(push) ; 4
(assert (P%trigger ($SortWrappers.IntTo$Snap $t@8@01) x@7@01))
(assert (not (= x@7@01 $Ref.null)))
; [eval] v == 0
(pop) ; 4
; Joined path conditions
(assert (and
  (P%trigger ($SortWrappers.IntTo$Snap $t@8@01) x@7@01)
  (not (= x@7@01 $Ref.null))))
(push) ; 4
(assert (not (= (inner ($SortWrappers.IntTo$Snap $t@8@01) x@7@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(x), write) in v == 0)
(set-option :timeout 0)
(push) ; 4
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v == 0
(pop) ; 4
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (= (inner ($SortWrappers.IntTo$Snap $t@8@01) x@7@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(x), write) in v == 0)
(set-option :timeout 0)
(push) ; 4
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v == 0
(pop) ; 4
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (= (inner ($SortWrappers.IntTo$Snap $t@8@01) x@7@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(P(x), write) in v == 0)
(set-option :timeout 0)
(push) ; 4
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v == 0
(pop) ; 4
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (= (inner ($SortWrappers.IntTo$Snap $t@8@01) x@7@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- cursor_left ----------
(declare-const buffer@10@01 $Ref)
(declare-const buffer@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))
; [eval] bufferRight(buffer) == 4
; [eval] bufferRight(buffer)
(push) ; 2
(assert (bufferRight%precondition ($Snap.first $t@12@01) buffer@11@01))
(pop) ; 2
; Joined path conditions
(assert (bufferRight%precondition ($Snap.first $t@12@01) buffer@11@01))
(assert (= (bufferRight ($Snap.first $t@12@01) buffer@11@01) 4))
(assert (= ($Snap.second ($Snap.second $t@12@01)) $Snap.unit))
; [eval] arrayAt(buffer, bufferRight(buffer)) == 5
; [eval] arrayAt(buffer, bufferRight(buffer))
; [eval] bufferRight(buffer)
(push) ; 2
(pop) ; 2
; Joined path conditions
(push) ; 2
; [eval] (unfolding acc(gapBuffer(buffer), write) in index >= 0)
(push) ; 3
(assert (gapBuffer%trigger ($Snap.first $t@12@01) buffer@11@01))
(assert (not (= buffer@11@01 $Ref.null)))
; [eval] index >= 0
(pop) ; 3
; Joined path conditions
(assert (and
  (gapBuffer%trigger ($Snap.first $t@12@01) buffer@11@01)
  (not (= buffer@11@01 $Ref.null))))
(push) ; 3
(assert (not (>= (bufferRight ($Snap.first $t@12@01) buffer@11@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= (bufferRight ($Snap.first $t@12@01) buffer@11@01) 0))
(assert (arrayAt%precondition ($Snap.combine ($Snap.first $t@12@01) $Snap.unit) buffer@11@01 (bufferRight ($Snap.first $t@12@01) buffer@11@01)))
(pop) ; 2
; Joined path conditions
(assert (and
  (gapBuffer%trigger ($Snap.first $t@12@01) buffer@11@01)
  (not (= buffer@11@01 $Ref.null))
  (>= (bufferRight ($Snap.first $t@12@01) buffer@11@01) 0)
  (arrayAt%precondition ($Snap.combine ($Snap.first $t@12@01) $Snap.unit) buffer@11@01 (bufferRight ($Snap.first $t@12@01) buffer@11@01))))
(assert (=
  (arrayAt ($Snap.combine ($Snap.first $t@12@01) $Snap.unit) buffer@11@01 (bufferRight ($Snap.first $t@12@01) buffer@11@01))
  5))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
; ---------- callee ----------
(declare-const i@13@01 Int)
(declare-const i@14@01 Int)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] 0 < i
(assert (< 0 i@14@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- caller ----------
(declare-const x@16@01 $Ref)
(declare-const x@17@01 $Ref)
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
; inhale acc(P(x), write)
(declare-const $t@18@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; callee(inner(x))
; [eval] inner(x)
(set-option :timeout 0)
(push) ; 3
(assert (inner%precondition ($SortWrappers.IntTo$Snap $t@18@01) x@17@01))
(pop) ; 3
; Joined path conditions
(assert (inner%precondition ($SortWrappers.IntTo$Snap $t@18@01) x@17@01))
; [eval] 0 < i
(push) ; 3
(assert (not (< 0 (inner ($SortWrappers.IntTo$Snap $t@18@01) x@17@01))))
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
; [eval] 0 < i
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (inner ($SortWrappers.IntTo$Snap $t@18@01) x@17@01))))
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
; [eval] 0 < i
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (inner ($SortWrappers.IntTo$Snap $t@18@01) x@17@01))))
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
; [eval] 0 < i
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (inner ($SortWrappers.IntTo$Snap $t@18@01) x@17@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
