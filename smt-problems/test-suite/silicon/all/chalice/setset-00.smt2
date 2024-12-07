(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:33
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/setset.vpr
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
(declare-fun valid%trigger ($Snap $Ref) Bool)
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
; ---------- init ----------
(declare-const this@0@01 $Ref)
(declare-const v@1@01 Int)
(declare-const this@2@01 $Ref)
(declare-const v@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 Int)
(assert (not (= this@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; this.value := v
; [exec]
; fold acc(valid(this), write)
(assert (valid%trigger ($SortWrappers.IntTo$Snap v@3@01) this@2@01))
(pop) ; 2
(pop) ; 1
; ---------- set ----------
(declare-const this@6@01 $Ref)
(declare-const v@7@01 Int)
(declare-const this@8@01 $Ref)
(declare-const v@9@01 Int)
(push) ; 1
(declare-const $t@10@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.second $t@11@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(push) ; 3
(assert (get%precondition ($Snap.first $t@11@01) this@8@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@11@01) this@8@01))
(assert (= (get ($Snap.first $t@11@01) this@8@01) v@9@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(this), write)
(assert (not (= this@8@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($SortWrappers.IntTo$Snap $t@10@01) this@8@01))
; [exec]
; this.value := v
; [exec]
; fold acc(valid(this), write)
(assert (valid%trigger ($SortWrappers.IntTo$Snap v@9@01) this@8@01))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($SortWrappers.IntTo$Snap v@9@01) this@8@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($SortWrappers.IntTo$Snap v@9@01) this@8@01))
(push) ; 3
(assert (not (= (get ($SortWrappers.IntTo$Snap v@9@01) this@8@01) v@9@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (get ($SortWrappers.IntTo$Snap v@9@01) this@8@01) v@9@01))
(pop) ; 2
(pop) ; 1
; ---------- main ----------
(declare-const this@12@01 $Ref)
(declare-const x@13@01 $Ref)
(declare-const y@14@01 $Ref)
(declare-const this@15@01 $Ref)
(declare-const x@16@01 $Ref)
(declare-const y@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.first $t@18@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@16@01 $Ref.null)))
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
(assert (= ($Snap.first ($Snap.second $t@18@01)) $Snap.unit))
; [eval] y != null
(assert (not (= y@17@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@18@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@18@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; set(x, 3)
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@19@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@19@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@19@01) x@16@01))
(assert (= (get ($Snap.first $t@19@01) x@16@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(y, 3)
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@20@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@20@01) y@17@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@20@01) y@17@01))
(assert (= (get ($Snap.first $t@20@01) y@17@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(x, 3)
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@21@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@21@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@21@01) x@16@01))
(assert (= (get ($Snap.first $t@21@01) x@16@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(y, 3)
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@22@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@22@01) y@17@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@22@01) y@17@01))
(assert (= (get ($Snap.first $t@22@01) y@17@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(x, 3)
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@23@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@23@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@23@01) x@16@01))
(assert (= (get ($Snap.first $t@23@01) x@16@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(y, 3)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@24@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@24@01) y@17@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@24@01) y@17@01))
(assert (= (get ($Snap.first $t@24@01) y@17@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(x, 3)
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@25@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@25@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@25@01) x@16@01))
(assert (= (get ($Snap.first $t@25@01) x@16@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(valid(x), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.first $t@25@01) x@16@01))
; [exec]
; x.value := 3
; [exec]
; fold acc(valid(x), write)
(assert (valid%trigger ($SortWrappers.IntTo$Snap 3) x@16@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; set(y, 3)
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@26@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@26@01) y@17@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@26@01) y@17@01))
(assert (= (get ($Snap.first $t@26@01) y@17@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(x, 3)
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@27@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@27@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@27@01) x@16@01))
(assert (= (get ($Snap.first $t@27@01) x@16@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(y, 3)
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@28@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@28@01) y@17@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@28@01) y@17@01))
(assert (= (get ($Snap.first $t@28@01) y@17@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(valid(x), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger ($Snap.first $t@27@01) x@16@01))
; [exec]
; x.value := 3
; [exec]
; fold acc(valid(x), write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; unfold acc(valid(x), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; x.value := 3
; [exec]
; fold acc(valid(x), write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; set(x, 3)
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@29@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@29@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@29@01) x@16@01))
(assert (= (get ($Snap.first $t@29@01) x@16@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(y, 3)
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@30@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@30@01) y@17@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@30@01) y@17@01))
(assert (= (get ($Snap.first $t@30@01) y@17@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; set(x, 4)
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@31@01) $Snap.unit))
; [eval] get(this) == v
; [eval] get(this)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition ($Snap.first $t@31@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition ($Snap.first $t@31@01) x@16@01))
(assert (= (get ($Snap.first $t@31@01) x@16@01) 4))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert get(y) == 3
; [eval] get(y) == 3
; [eval] get(y)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [exec]
; assert get(x) == 3
; [eval] get(x) == 3
; [eval] get(x)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (get ($Snap.first $t@31@01) x@16@01) 3)))
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
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($Snap.first $t@30@01) ($Snap.first $t@31@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($Snap.first $t@31@01) ($Snap.first $t@30@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@17@01 x@16@01)) (not (= x@16@01 y@17@01))))
; [eval] get(x) == 3
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (get ($Snap.first $t@31@01) x@16@01) 3)))
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
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($Snap.first $t@30@01) ($Snap.first $t@31@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($Snap.first $t@31@01) ($Snap.first $t@30@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@17@01 x@16@01)) (not (= x@16@01 y@17@01))))
; [eval] get(x) == 3
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (get ($Snap.first $t@31@01) x@16@01) 3)))
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
(assert (not (= x@16@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($Snap.first $t@30@01) ($Snap.first $t@31@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($Snap.first $t@31@01) ($Snap.first $t@30@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@17@01 x@16@01)) (not (= x@16@01 y@17@01))))
; [eval] get(x) == 3
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (get ($Snap.first $t@31@01) x@16@01) 3)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
