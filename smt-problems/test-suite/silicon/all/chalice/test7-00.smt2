(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:47
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/test7.vpr
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
(declare-fun get ($Snap $Ref) Int)
(declare-fun get%limited ($Snap $Ref) Int)
(declare-fun get%stateless ($Ref) Bool)
(declare-fun get%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun inv%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (get%limited s@$ this@0@00) (get s@$ this@0@00))
  :pattern ((get s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (get%stateless this@0@00)
  :pattern ((get%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (get%precondition s@$ this@0@00)
    (= (get s@$ this@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((get s@$ this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((get s@$ this@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- set ----------
(declare-const this@0@01 $Ref)
(declare-const newval@1@01 Int)
(declare-const this@2@01 $Ref)
(declare-const newval@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] get(this) == newval
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($Snap.first $t@5@01) this@2@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@5@01) this@2@01))
(assert (= (get ($Snap.first $t@5@01) this@2@01) newval@3@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(inv(this), write)
(assert (not (= this@2@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($SortWrappers.IntTo$Snap $t@4@01) this@2@01))
; [exec]
; this.value := newval
; [exec]
; fold acc(inv(this), write)
(assert (inv%trigger ($SortWrappers.IntTo$Snap newval@3@01) this@2@01))
; [eval] get(this) == newval
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($SortWrappers.IntTo$Snap newval@3@01) this@2@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($SortWrappers.IntTo$Snap newval@3@01) this@2@01))
(push) ; 3
(assert (not (= (get ($SortWrappers.IntTo$Snap newval@3@01) this@2@01) newval@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (get ($SortWrappers.IntTo$Snap newval@3@01) this@2@01) newval@3@01))
(pop) ; 2
(pop) ; 1
; ---------- callmethod0 ----------
(declare-const this@6@01 $Ref)
(declare-const this@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] get(this) == 3
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($Snap.first $t@9@01) this@7@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@9@01) this@7@01))
(assert (= (get ($Snap.first $t@9@01) this@7@01) 3))
(pop) ; 2
(push) ; 2
; [exec]
; set(this, 3)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] get(this) == newval
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($Snap.first $t@10@01) this@7@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@10@01) this@7@01))
(assert (= (get ($Snap.first $t@10@01) this@7@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] get(this) == 3
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- callmethod1 ----------
(declare-const this@11@01 $Ref)
(declare-const this@12@01 $Ref)
(push) ; 1
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] this != null
(assert (not (= this@12@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; set(this, 3)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- ifc ----------
(declare-const this@14@01 $Ref)
(declare-const this@15@01 $Ref)
(push) ; 1
(declare-const $t@16@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] get(this) > old(get(this))
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($Snap.first $t@17@01) this@15@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@17@01) this@15@01))
; [eval] old(get(this))
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($SortWrappers.IntTo$Snap $t@16@01) this@15@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($SortWrappers.IntTo$Snap $t@16@01) this@15@01))
(assert (>
  (get ($Snap.first $t@17@01) this@15@01)
  (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01)))
(pop) ; 2
(push) ; 2
; [eval] get(this) > 0
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($SortWrappers.IntTo$Snap $t@16@01) this@15@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($SortWrappers.IntTo$Snap $t@16@01) this@15@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | get($t@16@01, this@15@01) > 0 | live]
; [else-branch: 0 | !(get($t@16@01, this@15@01) > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | get($t@16@01, this@15@01) > 0]
(assert (> (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01) 0))
; [exec]
; set(this, get(this) + get(this))
; [eval] get(this) + get(this)
; [eval] get(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] get(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.second $t@18@01) $Snap.unit))
; [eval] get(this) == newval
; [eval] get(this)
(push) ; 4
(assert (get%precondition ($Snap.first $t@18@01) this@15@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition ($Snap.first $t@18@01) this@15@01))
(assert (=
  (get ($Snap.first $t@18@01) this@15@01)
  (+
    (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01)
    (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] get(this) > old(get(this))
; [eval] get(this)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] old(get(this))
; [eval] get(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (>
  (get ($Snap.first $t@18@01) this@15@01)
  (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (>
  (get ($Snap.first $t@18@01) this@15@01)
  (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(get($t@16@01, this@15@01) > 0)]
(assert (not (> (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01) 0)))
(pop) ; 3
; [eval] !(get(this) > 0)
; [eval] get(this) > 0
; [eval] get(this)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (> (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(get($t@16@01, this@15@01) > 0) | live]
; [else-branch: 1 | get($t@16@01, this@15@01) > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(get($t@16@01, this@15@01) > 0)]
(assert (not (> (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01) 0)))
; [exec]
; set(this, 2)
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.second $t@19@01) $Snap.unit))
; [eval] get(this) == newval
; [eval] get(this)
(push) ; 4
(assert (get%precondition ($Snap.first $t@19@01) this@15@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition ($Snap.first $t@19@01) this@15@01))
(assert (= (get ($Snap.first $t@19@01) this@15@01) 2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] get(this) > old(get(this))
; [eval] get(this)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] old(get(this))
; [eval] get(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (>
  (get ($Snap.first $t@19@01) this@15@01)
  (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (>
  (get ($Snap.first $t@19@01) this@15@01)
  (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | get($t@16@01, this@15@01) > 0]
(assert (> (get ($SortWrappers.IntTo$Snap $t@16@01) this@15@01) 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- loop0 ----------
(declare-const this@20@01 $Ref)
(declare-const r@21@01 Int)
(declare-const this@22@01 $Ref)
(declare-const r@23@01 Int)
(push) ; 1
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (= ($Snap.second $t@24@01) $Snap.unit))
; [eval] get(this) > 0
; [eval] get(this)
(push) ; 2
(assert (get%precondition ($Snap.first $t@24@01) this@22@01))
(pop) ; 2
; Joined path conditions
(assert (get%precondition ($Snap.first $t@24@01) this@22@01))
(assert (> (get ($Snap.first $t@24@01) this@22@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.second $t@25@01) $Snap.unit))
; [eval] r == get(this)
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($Snap.first $t@25@01) this@22@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@25@01) this@22@01))
(assert (= r@23@01 (get ($Snap.first $t@25@01) this@22@01)))
(pop) ; 2
(push) ; 2
; [exec]
; r := 0
(declare-const r@26@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (= ($Snap.second $t@27@01) $Snap.unit))
; [eval] r <= get(this)
; [eval] get(this)
(push) ; 4
(assert (get%precondition ($Snap.first $t@27@01) this@22@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition ($Snap.first $t@27@01) this@22@01))
(assert (<= r@26@01 (get ($Snap.first $t@27@01) this@22@01)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] r <= get(this)
; [eval] get(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<= 0 (get ($Snap.first $t@24@01) this@22@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (get ($Snap.first $t@24@01) this@22@01)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (= ($Snap.second $t@27@01) $Snap.unit))
(assert (get%precondition ($Snap.first $t@27@01) this@22@01))
(assert (<= r@26@01 (get ($Snap.first $t@27@01) this@22@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] r < (unfolding acc(inv(this), write) in this.value)
; [eval] (unfolding acc(inv(this), write) in this.value)
(push) ; 6
(assert (inv%trigger ($Snap.first $t@27@01) this@22@01))
(assert (not (= this@22@01 $Ref.null)))
(pop) ; 6
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@27@01) this@22@01)
  (not (= this@22@01 $Ref.null))))
(pop) ; 5
(push) ; 5
; [eval] !(r < (unfolding acc(inv(this), write) in this.value))
; [eval] r < (unfolding acc(inv(this), write) in this.value)
; [eval] (unfolding acc(inv(this), write) in this.value)
(push) ; 6
(assert (inv%trigger ($Snap.first $t@27@01) this@22@01))
(assert (not (= this@22@01 $Ref.null)))
(pop) ; 6
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@27@01) this@22@01)
  (not (= this@22@01 $Ref.null))))
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] r < (unfolding acc(inv(this), write) in this.value)
; [eval] (unfolding acc(inv(this), write) in this.value)
(push) ; 5
(assert (inv%trigger ($Snap.first $t@27@01) this@22@01))
(assert (not (= this@22@01 $Ref.null)))
(pop) ; 5
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@27@01) this@22@01)
  (not (= this@22@01 $Ref.null))))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< r@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< r@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@27@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | r@26@01 < First:($t@27@01) | live]
; [else-branch: 2 | !(r@26@01 < First:($t@27@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | r@26@01 < First:($t@27@01)]
(assert (< r@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))
; [exec]
; r := r + 1
; [eval] r + 1
(declare-const r@28@01 Int)
(assert (= r@28@01 (+ r@26@01 1)))
; Loop head block: Re-establish invariant
; [eval] r <= get(this)
; [eval] get(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<= r@28@01 (get ($Snap.first $t@27@01) this@22@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= r@28@01 (get ($Snap.first $t@27@01) this@22@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(r@26@01 < First:($t@27@01))]
(assert (not (< r@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@27@01)))))
(pop) ; 5
; [eval] !(r < (unfolding acc(inv(this), write) in this.value))
; [eval] r < (unfolding acc(inv(this), write) in this.value)
; [eval] (unfolding acc(inv(this), write) in this.value)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (< r@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@27@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< r@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(r@26@01 < First:($t@27@01)) | live]
; [else-branch: 3 | r@26@01 < First:($t@27@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | !(r@26@01 < First:($t@27@01))]
(assert (not (< r@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@27@01)))))
; [eval] r == get(this)
; [eval] get(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (= r@26@01 (get ($Snap.first $t@27@01) this@22@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= r@26@01 (get ($Snap.first $t@27@01) this@22@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | r@26@01 < First:($t@27@01)]
(assert (< r@26@01 ($SortWrappers.$SnapToInt ($Snap.first $t@27@01))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- loop1 ----------
(declare-const this@29@01 $Ref)
(declare-const r@30@01 Int)
(declare-const this@31@01 $Ref)
(declare-const r@32@01 Int)
(push) ; 1
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (= ($Snap.second $t@33@01) $Snap.unit))
; [eval] get(this) > 0
; [eval] get(this)
(push) ; 2
(assert (get%precondition ($Snap.first $t@33@01) this@31@01))
(pop) ; 2
; Joined path conditions
(assert (get%precondition ($Snap.first $t@33@01) this@31@01))
(assert (> (get ($Snap.first $t@33@01) this@31@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (= ($Snap.second $t@34@01) $Snap.unit))
; [eval] r == get(this)
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($Snap.first $t@34@01) this@31@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@34@01) this@31@01))
(assert (= r@32@01 (get ($Snap.first $t@34@01) this@31@01)))
(pop) ; 2
(push) ; 2
; [exec]
; r := 0
(declare-const r@35@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.second $t@36@01) $Snap.unit))
; [eval] r <= (unfolding acc(inv(this), write) in this.value)
; [eval] (unfolding acc(inv(this), write) in this.value)
(push) ; 4
(assert (inv%trigger ($Snap.first $t@36@01) this@31@01))
(assert (not (= this@31@01 $Ref.null)))
(pop) ; 4
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@36@01) this@31@01)
  (not (= this@31@01 $Ref.null))))
(assert (<= r@35@01 ($SortWrappers.$SnapToInt ($Snap.first $t@36@01))))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] r <= (unfolding acc(inv(this), write) in this.value)
; [eval] (unfolding acc(inv(this), write) in this.value)
(push) ; 4
(assert (inv%trigger ($Snap.first $t@33@01) this@31@01))
(assert (not (= this@31@01 $Ref.null)))
(pop) ; 4
; Joined path conditions
(assert (and
  (inv%trigger ($Snap.first $t@33@01) this@31@01)
  (not (= this@31@01 $Ref.null))))
(push) ; 4
(assert (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@33@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.second $t@36@01) $Snap.unit))
(assert (inv%trigger ($Snap.first $t@36@01) this@31@01))
(assert (<= r@35@01 ($SortWrappers.$SnapToInt ($Snap.first $t@36@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] r < get(this)
; [eval] get(this)
(push) ; 6
(assert (get%precondition ($Snap.first $t@36@01) this@31@01))
(pop) ; 6
; Joined path conditions
(assert (get%precondition ($Snap.first $t@36@01) this@31@01))
(pop) ; 5
(push) ; 5
; [eval] !(r < get(this))
; [eval] r < get(this)
; [eval] get(this)
(push) ; 6
(assert (get%precondition ($Snap.first $t@36@01) this@31@01))
(pop) ; 6
; Joined path conditions
(assert (get%precondition ($Snap.first $t@36@01) this@31@01))
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] r < get(this)
; [eval] get(this)
(push) ; 5
(assert (get%precondition ($Snap.first $t@36@01) this@31@01))
(pop) ; 5
; Joined path conditions
(assert (get%precondition ($Snap.first $t@36@01) this@31@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< r@35@01 (get ($Snap.first $t@36@01) this@31@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< r@35@01 (get ($Snap.first $t@36@01) this@31@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | r@35@01 < get(First:($t@36@01), this@31@01) | live]
; [else-branch: 4 | !(r@35@01 < get(First:($t@36@01), this@31@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | r@35@01 < get(First:($t@36@01), this@31@01)]
(assert (< r@35@01 (get ($Snap.first $t@36@01) this@31@01)))
; [exec]
; r := r + 1
; [eval] r + 1
(declare-const r@37@01 Int)
(assert (= r@37@01 (+ r@35@01 1)))
; Loop head block: Re-establish invariant
; [eval] r <= (unfolding acc(inv(this), write) in this.value)
; [eval] (unfolding acc(inv(this), write) in this.value)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<= r@37@01 ($SortWrappers.$SnapToInt ($Snap.first $t@36@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= r@37@01 ($SortWrappers.$SnapToInt ($Snap.first $t@36@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(r@35@01 < get(First:($t@36@01), this@31@01))]
(assert (not (< r@35@01 (get ($Snap.first $t@36@01) this@31@01))))
(pop) ; 5
; [eval] !(r < get(this))
; [eval] r < get(this)
; [eval] get(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (< r@35@01 (get ($Snap.first $t@36@01) this@31@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< r@35@01 (get ($Snap.first $t@36@01) this@31@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(r@35@01 < get(First:($t@36@01), this@31@01)) | live]
; [else-branch: 5 | r@35@01 < get(First:($t@36@01), this@31@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(r@35@01 < get(First:($t@36@01), this@31@01))]
(assert (not (< r@35@01 (get ($Snap.first $t@36@01) this@31@01))))
; [eval] r == get(this)
; [eval] get(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (= r@35@01 (get ($Snap.first $t@36@01) this@31@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= r@35@01 (get ($Snap.first $t@36@01) this@31@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | r@35@01 < get(First:($t@36@01), this@31@01)]
(assert (< r@35@01 (get ($Snap.first $t@36@01) this@31@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- uf0 ----------
(declare-const this@38@01 $Ref)
(declare-const this@39@01 $Ref)
(push) ; 1
(declare-const $t@40@01 Int)
(assert (not (= this@39@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert acc(this.value, write)
; [exec]
; fold acc(inv(this), write)
(assert (inv%trigger ($SortWrappers.IntTo$Snap $t@40@01) this@39@01))
; [exec]
; assert acc(this.value, write)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- uf1 ----------
(declare-const this@41@01 $Ref)
(declare-const this@42@01 $Ref)
(push) ; 1
(declare-const $t@43@01 Int)
(assert (not (= this@42@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert acc(this.value, write)
; [exec]
; fold acc(inv(this), write)
(assert (inv%trigger ($SortWrappers.IntTo$Snap $t@43@01) this@42@01))
; [exec]
; assert acc(inv(this), write)
(pop) ; 2
(pop) ; 1
; ---------- uf2 ----------
(declare-const this@44@01 $Ref)
(declare-const this@45@01 $Ref)
(push) ; 1
(declare-const $t@46@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert acc(inv(this), write)
; [exec]
; unfold acc(inv(this), write)
(assert (not (= this@45@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($SortWrappers.IntTo$Snap $t@46@01) this@45@01))
; [exec]
; assert acc(this.value, write)
(pop) ; 2
(pop) ; 1
; ---------- uf3 ----------
(declare-const this@47@01 $Ref)
(declare-const this@48@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@49@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert acc(inv(this), write)
; [exec]
; unfold acc(inv(this), write)
(assert (not (= this@48@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($SortWrappers.IntTo$Snap $t@49@01) this@48@01))
; [exec]
; assert acc(inv(this), write)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- badframing0 ----------
(declare-const this@50@01 $Ref)
(declare-const this@51@01 $Ref)
(push) ; 1
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 ($Snap.combine ($Snap.first $t@52@01) ($Snap.second $t@52@01))))
(assert (= ($Snap.first $t@52@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@51@01 $Ref.null)))
(assert (= ($Snap.second $t@52@01) $Snap.unit))
; [eval] get(this) == 2
; [eval] get(this)
(push) ; 2
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- badframing1 ----------
(declare-const this@53@01 $Ref)
(declare-const this@54@01 $Ref)
(push) ; 1
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (= ($Snap.first $t@55@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@54@01 $Ref.null)))
(assert (= ($Snap.second $t@55@01) $Snap.unit))
; [eval] this.value == 2
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
(pop) ; 1
; ---------- badframing2 ----------
(declare-const this@56@01 $Ref)
(declare-const this@57@01 $Ref)
(push) ; 1
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(assert (= ($Snap.first $t@58@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@57@01 $Ref.null)))
(assert (=
  ($Snap.second $t@58@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@58@01))
    ($Snap.second ($Snap.second $t@58@01)))))
(assert (= ($Snap.second ($Snap.second $t@58@01)) $Snap.unit))
; [eval] get(this) == 2
; [eval] get(this)
(push) ; 2
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- badframing3 ----------
(declare-const this@59@01 $Ref)
(declare-const this@60@01 $Ref)
(push) ; 1
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(assert (= ($Snap.first $t@61@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@60@01 $Ref.null)))
(assert (=
  ($Snap.second $t@61@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@61@01))
    ($Snap.second ($Snap.second $t@61@01)))))
(assert (= ($Snap.second ($Snap.second $t@61@01)) $Snap.unit))
; [eval] this.value == 2
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
(pop) ; 1
