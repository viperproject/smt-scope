(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/conditionals1.vpr
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
(declare-sort $MWSF 0)
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
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
    )))
; ////////// Symbols
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun get ($Snap $Ref Int) Bool)
(declare-fun get%limited ($Snap $Ref Int) Bool)
(declare-fun get%stateless ($Ref Int) Bool)
(declare-fun get%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun M%trigger ($Snap $Ref) Bool)
(declare-fun B%trigger ($Snap $Ref) Bool)
(declare-fun T%trigger ($Snap $Ref) Bool)
(declare-fun E%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (i@1@00 Int)) (!
  (= (get%limited s@$ x@0@00 i@1@00) (get s@$ x@0@00 i@1@00))
  :pattern ((get s@$ x@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (i@1@00 Int)) (!
  (get%stateless x@0@00 i@1@00)
  :pattern ((get%limited s@$ x@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (i@1@00 Int)) (!
  (=>
    (get%precondition s@$ x@0@00 i@1@00)
    (= (get s@$ x@0@00 i@1@00) (not (= i@1@00 0))))
  :pattern ((get s@$ x@0@00 i@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (i@1@00 Int)) (!
  true
  :pattern ((get s@$ x@0@00 i@1@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test15 ----------
(declare-const x@0@01 $Ref)
(declare-const b@1@01 Bool)
(declare-const x@2@01 $Ref)
(declare-const b@3@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= x@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, (b ? write : none)) --* acc(x.g, write) {
; }
(push) ; 3
(declare-const $t@5@01 $Snap)
; [eval] (b ? write : none)
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
; [then-branch: 0 | b@3@01 | live]
; [else-branch: 0 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | b@3@01]
(assert b@3@01)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(b@3@01)]
(assert (not b@3@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not b@3@01) b@3@01))
(push) ; 4
(assert (not (or (= (ite b@3@01 $Perm.Write $Perm.No) $Perm.No) b@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (ite b@3@01 $Perm.Write $Perm.No)))
(assert (<= (ite b@3@01 $Perm.Write $Perm.No) $Perm.Write))
(assert (=> b@3@01 (not (= x@2@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, (b ? write : none)) --* acc(x.g, write)
(declare-const mwsf@6@01 $MWSF)
(assert (forall (($t@5@01 $Snap)) (!
  (= (MWSF_apply mwsf@6@01 $t@5@01) ($Snap.second $t@4@01))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
  :qid |quant-u-4|)))
; [eval] (b ? write : none)
(set-option :timeout 0)
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
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(b@3@01)]
(assert (not b@3@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (forall (($t@5@01 $Snap)) (!
  (= (MWSF_apply mwsf@6@01 $t@5@01) ($Snap.second $t@4@01))
  :pattern ((MWSF_apply mwsf@6@01 $t@5@01))
  :qid |quant-u-5|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01a ----------
(declare-const x@7@01 $Ref)
(declare-const i@8@01 Int)
(declare-const x@9@01 $Ref)
(declare-const i@10@01 Int)
(push) ; 1
(declare-const $t@11@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* (i == 0 ? acc(M(x), write) : true) {
; }
(push) ; 3
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] i == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@10@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@10@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | i@10@01 == 0 | live]
; [else-branch: 2 | i@10@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | i@10@01 == 0]
(assert (= i@10@01 0))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (i == 0 ? acc(M(x), write) : true)
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) $t@11@01)
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-6|)))
; [eval] i == 0
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | i@10@01 != 0]
(assert (not (= i@10@01 0)))
; Create MagicWandSnapFunction for wand true --* (i == 0 ? acc(M(x), write) : true)
(declare-const mwsf@14@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@14@01 $t@12@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@14@01 $t@12@01))
  :qid |quant-u-8|)))
; [eval] i == 0
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (= i@10@01 0))
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) $t@11@01)
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-7|)))
(assert true)
; [exec]
; assert true --* (i == 0 ? acc(M(x), write) : true)
; [eval] i == 0
; [exec]
; assert i != 0 ==> acc(M(x), write)
; [eval] i != 0
; [then-branch: 3 | i@10@01 != 0 | dead]
; [else-branch: 3 | i@10@01 == 0 | live]
(push) ; 4
; [else-branch: 3 | i@10@01 == 0]
; [exec]
; assert acc(M(x), write)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01b ----------
(declare-const x@15@01 $Ref)
(declare-const i@16@01 Int)
(declare-const x@17@01 $Ref)
(declare-const i@18@01 Int)
(push) ; 1
(declare-const $t@19@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* (i == 0 ? true : acc(M(x), write)) {
; }
(push) ; 3
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] i == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@18@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@18@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | i@18@01 == 0 | live]
; [else-branch: 4 | i@18@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | i@18@01 == 0]
(assert (= i@18@01 0))
; Create MagicWandSnapFunction for wand true --* (i == 0 ? true : acc(M(x), write))
(declare-const mwsf@21@01 $MWSF)
(assert (forall (($t@20@01 $Snap)) (!
  (= (MWSF_apply mwsf@21@01 $t@20@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@21@01 $t@20@01))
  :qid |quant-u-10|)))
; [eval] i == 0
(pop) ; 4
(push) ; 4
; [else-branch: 4 | i@18@01 != 0]
(assert (not (= i@18@01 0)))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (i == 0 ? true : acc(M(x), write))
(declare-const mwsf@22@01 $MWSF)
(assert (forall (($t@20@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@20@01) $t@19@01)
  :pattern ((MWSF_apply mwsf@22@01 $t@20@01))
  :qid |quant-u-12|)))
; [eval] i == 0
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (= i@18@01 0))
(assert (forall (($t@20@01 $Snap)) (!
  (= (MWSF_apply mwsf@21@01 $t@20@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@21@01 $t@20@01))
  :qid |quant-u-11|)))
; [exec]
; assert true --* (i == 0 ? true : acc(M(x), write))
; [eval] i == 0
; [exec]
; assert i == 0 ==> acc(M(x), write)
; [eval] i == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@18@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | i@18@01 == 0 | live]
; [else-branch: 5 | i@18@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | i@18@01 == 0]
; [exec]
; assert acc(M(x), write)
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (not (= i@18@01 0)))
(assert (forall (($t@20@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@20@01) $t@19@01)
  :pattern ((MWSF_apply mwsf@22@01 $t@20@01))
  :qid |quant-u-13|)))
(assert true)
; [exec]
; assert true --* (i == 0 ? true : acc(M(x), write))
; [eval] i == 0
; [exec]
; assert i == 0 ==> acc(M(x), write)
; [eval] i == 0
; [then-branch: 6 | i@18@01 == 0 | dead]
; [else-branch: 6 | i@18@01 != 0 | live]
(push) ; 4
; [else-branch: 6 | i@18@01 != 0]
; [exec]
; assert acc(M(x), write)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@23@01 $Ref)
(declare-const b1@24@01 Bool)
(declare-const b2@25@01 Bool)
(declare-const x@26@01 $Ref)
(declare-const b1@27@01 Bool)
(declare-const b2@28@01 Bool)
(push) ; 1
(declare-const $t@29@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* (b1 ==> acc(M(x), 1 / 2)) && (b2 ==> acc(M(x), 1 / 4)) {
; }
(push) ; 3
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@27@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@27@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | b1@27@01 | live]
; [else-branch: 7 | !(b1@27@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | b1@27@01]
(assert b1@27@01)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b2@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@28@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b2@28@01 | live]
; [else-branch: 8 | !(b2@28@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | b2@28@01]
(assert b2@28@01)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(M(x), 1 / 2)) && (b2 ==> acc(M(x), 1 / 4))
(declare-const mwsf@31@01 $MWSF)
(assert (forall (($t@30@01 $Snap)) (!
  (= (MWSF_apply mwsf@31@01 $t@30@01) ($Snap.combine $t@29@01 $t@29@01))
  :pattern ((MWSF_apply mwsf@31@01 $t@30@01))
  :qid |quant-u-14|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 8 | !(b2@28@01)]
(assert (not b2@28@01))
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(M(x), 1 / 2)) && (b2 ==> acc(M(x), 1 / 4))
(declare-const mwsf@32@01 $MWSF)
(assert (forall (($t@30@01 $Snap)) (!
  (= (MWSF_apply mwsf@32@01 $t@30@01) ($Snap.combine $t@29@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@32@01 $t@30@01))
  :qid |quant-u-16|)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(b1@27@01)]
(assert (not b1@27@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not b2@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@28@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | b2@28@01 | live]
; [else-branch: 9 | !(b2@28@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | b2@28@01]
(assert b2@28@01)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(M(x), 1 / 2)) && (b2 ==> acc(M(x), 1 / 4))
(declare-const mwsf@33@01 $MWSF)
(assert (forall (($t@30@01 $Snap)) (!
  (= (MWSF_apply mwsf@33@01 $t@30@01) ($Snap.combine $Snap.unit $t@29@01))
  :pattern ((MWSF_apply mwsf@33@01 $t@30@01))
  :qid |quant-u-18|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | !(b2@28@01)]
(assert (not b2@28@01))
; Create MagicWandSnapFunction for wand true --* (b1 ==> acc(M(x), 1 / 2)) && (b2 ==> acc(M(x), 1 / 4))
(declare-const mwsf@34@01 $MWSF)
(assert (forall (($t@30@01 $Snap)) (!
  (= (MWSF_apply mwsf@34@01 $t@30@01) ($Snap.combine $Snap.unit $Snap.unit))
  :pattern ((MWSF_apply mwsf@34@01 $t@30@01))
  :qid |quant-u-20|)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (and b2@28@01 b1@27@01))
(assert (forall (($t@30@01 $Snap)) (!
  (= (MWSF_apply mwsf@31@01 $t@30@01) ($Snap.combine $t@29@01 $t@29@01))
  :pattern ((MWSF_apply mwsf@31@01 $t@30@01))
  :qid |quant-u-15|)))
(assert true)
; [exec]
; assert b1 && b2 ==> acc(M(x), 1 / 4)
; [eval] b1 && b2
(push) ; 4
; [then-branch: 10 | !(b1@27@01) | live]
; [else-branch: 10 | b1@27@01 | live]
(push) ; 5
; [then-branch: 10 | !(b1@27@01)]
(assert (not b1@27@01))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | b1@27@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@27@01 (not b1@27@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and b1@27@01 b2@28@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and b1@27@01 b2@28@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b1@27@01 && b2@28@01 | live]
; [else-branch: 11 | !(b1@27@01 && b2@28@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | b1@27@01 && b2@28@01]
(assert (and b1@27@01 b2@28@01))
; [exec]
; assert b1 && !b2 ==> acc(M(x), 1 / 2)
; [eval] b1 && !b2
(push) ; 5
; [then-branch: 12 | !(b1@27@01) | live]
; [else-branch: 12 | b1@27@01 | live]
(push) ; 6
; [then-branch: 12 | !(b1@27@01)]
(assert (not b1@27@01))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | b1@27@01]
; [eval] !b2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@27@01 (not b2@28@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | b1@27@01 && !(b2@28@01) | dead]
; [else-branch: 13 | !(b1@27@01 && !(b2@28@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 13 | !(b1@27@01 && !(b2@28@01))]
(assert (not (and b1@27@01 (not b2@28@01))))
; [exec]
; assert !b1 && b2 ==> acc(M(x), 3 / 4)
; [eval] !b1 && b2
; [eval] !b1
(push) ; 6
; [then-branch: 14 | b1@27@01 | live]
; [else-branch: 14 | !(b1@27@01) | live]
(push) ; 7
; [then-branch: 14 | b1@27@01]
(pop) ; 7
(push) ; 7
; [else-branch: 14 | !(b1@27@01)]
(assert (not b1@27@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b1@27@01) b1@27@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (not (and (not b1@27@01) b2@28@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | !(b1@27@01) && b2@28@01 | dead]
; [else-branch: 15 | !(!(b1@27@01) && b2@28@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 15 | !(!(b1@27@01) && b2@28@01)]
(assert (not (and (not b1@27@01) b2@28@01)))
; [exec]
; assert !b1 && !b2 ==> acc(M(x), write)
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 7
; [then-branch: 16 | b1@27@01 | live]
; [else-branch: 16 | !(b1@27@01) | live]
(push) ; 8
; [then-branch: 16 | b1@27@01]
(pop) ; 8
(push) ; 8
; [else-branch: 16 | !(b1@27@01)]
(assert (not b1@27@01))
; [eval] !b2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and (not b1@27@01) (not b2@28@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | !(b1@27@01) && !(b2@28@01) | dead]
; [else-branch: 17 | !(!(b1@27@01) && !(b2@28@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 17 | !(!(b1@27@01) && !(b2@28@01))]
(assert (not (and (not b1@27@01) (not b2@28@01))))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (and (not b2@28@01) b1@27@01))
(assert (forall (($t@30@01 $Snap)) (!
  (= (MWSF_apply mwsf@32@01 $t@30@01) ($Snap.combine $t@29@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@32@01 $t@30@01))
  :qid |quant-u-17|)))
(assert true)
; [exec]
; assert b1 && b2 ==> acc(M(x), 1 / 4)
; [eval] b1 && b2
(push) ; 4
; [then-branch: 18 | !(b1@27@01) | live]
; [else-branch: 18 | b1@27@01 | live]
(push) ; 5
; [then-branch: 18 | !(b1@27@01)]
(assert (not b1@27@01))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | b1@27@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@27@01 (not b1@27@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and b1@27@01 b2@28@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | b1@27@01 && b2@28@01 | dead]
; [else-branch: 19 | !(b1@27@01 && b2@28@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 19 | !(b1@27@01 && b2@28@01)]
(assert (not (and b1@27@01 b2@28@01)))
; [exec]
; assert b1 && !b2 ==> acc(M(x), 1 / 2)
; [eval] b1 && !b2
(push) ; 5
; [then-branch: 20 | !(b1@27@01) | live]
; [else-branch: 20 | b1@27@01 | live]
(push) ; 6
; [then-branch: 20 | !(b1@27@01)]
(assert (not b1@27@01))
(pop) ; 6
(push) ; 6
; [else-branch: 20 | b1@27@01]
; [eval] !b2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@27@01 (not b2@28@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and b1@27@01 (not b2@28@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | b1@27@01 && !(b2@28@01) | live]
; [else-branch: 21 | !(b1@27@01 && !(b2@28@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | b1@27@01 && !(b2@28@01)]
(assert (and b1@27@01 (not b2@28@01)))
; [exec]
; assert !b1 && b2 ==> acc(M(x), 3 / 4)
; [eval] !b1 && b2
; [eval] !b1
(push) ; 6
; [then-branch: 22 | b1@27@01 | live]
; [else-branch: 22 | !(b1@27@01) | live]
(push) ; 7
; [then-branch: 22 | b1@27@01]
(pop) ; 7
(push) ; 7
; [else-branch: 22 | !(b1@27@01)]
(assert (not b1@27@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b1@27@01) b1@27@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (not (and (not b1@27@01) b2@28@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | !(b1@27@01) && b2@28@01 | dead]
; [else-branch: 23 | !(!(b1@27@01) && b2@28@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 23 | !(!(b1@27@01) && b2@28@01)]
(assert (not (and (not b1@27@01) b2@28@01)))
; [exec]
; assert !b1 && !b2 ==> acc(M(x), write)
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 7
; [then-branch: 24 | b1@27@01 | live]
; [else-branch: 24 | !(b1@27@01) | live]
(push) ; 8
; [then-branch: 24 | b1@27@01]
(pop) ; 8
(push) ; 8
; [else-branch: 24 | !(b1@27@01)]
(assert (not b1@27@01))
; [eval] !b2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and (not b1@27@01) (not b2@28@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | !(b1@27@01) && !(b2@28@01) | dead]
; [else-branch: 25 | !(!(b1@27@01) && !(b2@28@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 25 | !(!(b1@27@01) && !(b2@28@01))]
(assert (not (and (not b1@27@01) (not b2@28@01))))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (and b2@28@01 (not b1@27@01)))
(assert (forall (($t@30@01 $Snap)) (!
  (= (MWSF_apply mwsf@33@01 $t@30@01) ($Snap.combine $Snap.unit $t@29@01))
  :pattern ((MWSF_apply mwsf@33@01 $t@30@01))
  :qid |quant-u-19|)))
(assert true)
; [exec]
; assert b1 && b2 ==> acc(M(x), 1 / 4)
; [eval] b1 && b2
(push) ; 4
; [then-branch: 26 | !(b1@27@01) | live]
; [else-branch: 26 | b1@27@01 | live]
(push) ; 5
; [then-branch: 26 | !(b1@27@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 26 | b1@27@01]
(assert b1@27@01)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@27@01 (not b1@27@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and b1@27@01 b2@28@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | b1@27@01 && b2@28@01 | dead]
; [else-branch: 27 | !(b1@27@01 && b2@28@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 27 | !(b1@27@01 && b2@28@01)]
(assert (not (and b1@27@01 b2@28@01)))
; [exec]
; assert b1 && !b2 ==> acc(M(x), 1 / 2)
; [eval] b1 && !b2
(push) ; 5
; [then-branch: 28 | !(b1@27@01) | live]
; [else-branch: 28 | b1@27@01 | live]
(push) ; 6
; [then-branch: 28 | !(b1@27@01)]
(pop) ; 6
(push) ; 6
; [else-branch: 28 | b1@27@01]
(assert b1@27@01)
; [eval] !b2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@27@01 (not b2@28@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | b1@27@01 && !(b2@28@01) | dead]
; [else-branch: 29 | !(b1@27@01 && !(b2@28@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 29 | !(b1@27@01 && !(b2@28@01))]
(assert (not (and b1@27@01 (not b2@28@01))))
; [exec]
; assert !b1 && b2 ==> acc(M(x), 3 / 4)
; [eval] !b1 && b2
; [eval] !b1
(push) ; 6
; [then-branch: 30 | b1@27@01 | live]
; [else-branch: 30 | !(b1@27@01) | live]
(push) ; 7
; [then-branch: 30 | b1@27@01]
(assert b1@27@01)
(pop) ; 7
(push) ; 7
; [else-branch: 30 | !(b1@27@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b1@27@01) b1@27@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (not (and (not b1@27@01) b2@28@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (not b1@27@01) b2@28@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | !(b1@27@01) && b2@28@01 | live]
; [else-branch: 31 | !(!(b1@27@01) && b2@28@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 31 | !(b1@27@01) && b2@28@01]
(assert (and (not b1@27@01) b2@28@01))
; [exec]
; assert !b1 && !b2 ==> acc(M(x), write)
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 7
; [then-branch: 32 | b1@27@01 | live]
; [else-branch: 32 | !(b1@27@01) | live]
(push) ; 8
; [then-branch: 32 | b1@27@01]
(assert b1@27@01)
(pop) ; 8
(push) ; 8
; [else-branch: 32 | !(b1@27@01)]
; [eval] !b2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and (not b1@27@01) (not b2@28@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | !(b1@27@01) && !(b2@28@01) | dead]
; [else-branch: 33 | !(!(b1@27@01) && !(b2@28@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 33 | !(!(b1@27@01) && !(b2@28@01))]
(assert (not (and (not b1@27@01) (not b2@28@01))))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (and (not b2@28@01) (not b1@27@01)))
(assert (forall (($t@30@01 $Snap)) (!
  (= (MWSF_apply mwsf@34@01 $t@30@01) ($Snap.combine $Snap.unit $Snap.unit))
  :pattern ((MWSF_apply mwsf@34@01 $t@30@01))
  :qid |quant-u-21|)))
; [exec]
; assert b1 && b2 ==> acc(M(x), 1 / 4)
; [eval] b1 && b2
(push) ; 4
; [then-branch: 34 | !(b1@27@01) | live]
; [else-branch: 34 | b1@27@01 | live]
(push) ; 5
; [then-branch: 34 | !(b1@27@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 34 | b1@27@01]
(assert b1@27@01)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b1@27@01 (not b1@27@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and b1@27@01 b2@28@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | b1@27@01 && b2@28@01 | dead]
; [else-branch: 35 | !(b1@27@01 && b2@28@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 35 | !(b1@27@01 && b2@28@01)]
(assert (not (and b1@27@01 b2@28@01)))
; [exec]
; assert b1 && !b2 ==> acc(M(x), 1 / 2)
; [eval] b1 && !b2
(push) ; 5
; [then-branch: 36 | !(b1@27@01) | live]
; [else-branch: 36 | b1@27@01 | live]
(push) ; 6
; [then-branch: 36 | !(b1@27@01)]
(pop) ; 6
(push) ; 6
; [else-branch: 36 | b1@27@01]
(assert b1@27@01)
; [eval] !b2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not (and b1@27@01 (not b2@28@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | b1@27@01 && !(b2@28@01) | dead]
; [else-branch: 37 | !(b1@27@01 && !(b2@28@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 37 | !(b1@27@01 && !(b2@28@01))]
(assert (not (and b1@27@01 (not b2@28@01))))
; [exec]
; assert !b1 && b2 ==> acc(M(x), 3 / 4)
; [eval] !b1 && b2
; [eval] !b1
(push) ; 6
; [then-branch: 38 | b1@27@01 | live]
; [else-branch: 38 | !(b1@27@01) | live]
(push) ; 7
; [then-branch: 38 | b1@27@01]
(assert b1@27@01)
(pop) ; 7
(push) ; 7
; [else-branch: 38 | !(b1@27@01)]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not b1@27@01) b1@27@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (not (and (not b1@27@01) b2@28@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | !(b1@27@01) && b2@28@01 | dead]
; [else-branch: 39 | !(!(b1@27@01) && b2@28@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 39 | !(!(b1@27@01) && b2@28@01)]
(assert (not (and (not b1@27@01) b2@28@01)))
; [exec]
; assert !b1 && !b2 ==> acc(M(x), write)
; [eval] !b1 && !b2
; [eval] !b1
(push) ; 7
; [then-branch: 40 | b1@27@01 | live]
; [else-branch: 40 | !(b1@27@01) | live]
(push) ; 8
; [then-branch: 40 | b1@27@01]
(assert b1@27@01)
(pop) ; 8
(push) ; 8
; [else-branch: 40 | !(b1@27@01)]
; [eval] !b2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and (not b1@27@01) (not b2@28@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (not b1@27@01) (not b2@28@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | !(b1@27@01) && !(b2@28@01) | live]
; [else-branch: 41 | !(!(b1@27@01) && !(b2@28@01)) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 41 | !(b1@27@01) && !(b2@28@01)]
(assert (and (not b1@27@01) (not b2@28@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test08 ----------
(declare-const x@35@01 $Ref)
(declare-const i@36@01 Int)
(declare-const x@37@01 $Ref)
(declare-const i@38@01 Int)
(push) ; 1
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* (i == 0 ? acc(M(x), write) : acc(B(x), write)) {
; }
(push) ; 3
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 $Snap.unit))
; [eval] i == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@38@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@38@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | i@38@01 == 0 | live]
; [else-branch: 42 | i@38@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 42 | i@38@01 == 0]
(assert (= i@38@01 0))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (i == 0 ? acc(M(x), write) : acc(B(x), write))
(declare-const mwsf@41@01 $MWSF)
(assert (forall (($t@40@01 $Snap)) (!
  (= (MWSF_apply mwsf@41@01 $t@40@01) ($Snap.first $t@39@01))
  :pattern ((MWSF_apply mwsf@41@01 $t@40@01))
  :qid |quant-u-22|)))
; [eval] i == 0
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 42 | i@38@01 != 0]
(assert (not (= i@38@01 0)))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (i == 0 ? acc(M(x), write) : acc(B(x), write))
(declare-const mwsf@42@01 $MWSF)
(assert (forall (($t@40@01 $Snap)) (!
  (= (MWSF_apply mwsf@42@01 $t@40@01) ($Snap.second $t@39@01))
  :pattern ((MWSF_apply mwsf@42@01 $t@40@01))
  :qid |quant-u-24|)))
; [eval] i == 0
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (= i@38@01 0))
(assert (forall (($t@40@01 $Snap)) (!
  (= (MWSF_apply mwsf@41@01 $t@40@01) ($Snap.first $t@39@01))
  :pattern ((MWSF_apply mwsf@41@01 $t@40@01))
  :qid |quant-u-23|)))
(assert true)
; [exec]
; apply true --* (i == 0 ? acc(M(x), write) : acc(B(x), write))
; [eval] i == 0
; [eval] i == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@38@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | i@38@01 == 0 | live]
; [else-branch: 43 | i@38@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 43 | i@38@01 == 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(M(x), write) && acc(B(x), write)
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (not (= i@38@01 0)))
(assert (forall (($t@40@01 $Snap)) (!
  (= (MWSF_apply mwsf@42@01 $t@40@01) ($Snap.second $t@39@01))
  :pattern ((MWSF_apply mwsf@42@01 $t@40@01))
  :qid |quant-u-25|)))
(assert true)
; [exec]
; apply true --* (i == 0 ? acc(M(x), write) : acc(B(x), write))
; [eval] i == 0
; [eval] i == 0
; [then-branch: 44 | i@38@01 == 0 | dead]
; [else-branch: 44 | i@38@01 != 0 | live]
(push) ; 4
; [else-branch: 44 | i@38@01 != 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(M(x), write) && acc(B(x), write)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@43@01 $Ref)
(declare-const i@44@01 Int)
(declare-const x@45@01 $Ref)
(declare-const i@46@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 ($Snap.combine ($Snap.first $t@47@01) ($Snap.second $t@47@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* (i == 0 ? acc(T(x), write) : acc(E(x), write)) {
; }
(push) ; 3
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 $Snap.unit))
; [eval] i == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@46@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@46@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | i@46@01 == 0 | live]
; [else-branch: 45 | i@46@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 45 | i@46@01 == 0]
(assert (= i@46@01 0))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (i == 0 ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@49@01 $MWSF)
(assert (forall (($t@48@01 $Snap)) (!
  (= (MWSF_apply mwsf@49@01 $t@48@01) ($Snap.first $t@47@01))
  :pattern ((MWSF_apply mwsf@49@01 $t@48@01))
  :qid |quant-u-26|)))
; [eval] i == 0
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 45 | i@46@01 != 0]
(assert (not (= i@46@01 0)))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (i == 0 ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@50@01 $MWSF)
(assert (forall (($t@48@01 $Snap)) (!
  (= (MWSF_apply mwsf@50@01 $t@48@01) ($Snap.second $t@47@01))
  :pattern ((MWSF_apply mwsf@50@01 $t@48@01))
  :qid |quant-u-28|)))
; [eval] i == 0
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (= i@46@01 0))
(assert (forall (($t@48@01 $Snap)) (!
  (= (MWSF_apply mwsf@49@01 $t@48@01) ($Snap.first $t@47@01))
  :pattern ((MWSF_apply mwsf@49@01 $t@48@01))
  :qid |quant-u-27|)))
(assert true)
; [exec]
; assert i == 0 ==> acc(T(x), write)
; [eval] i == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@46@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | i@46@01 == 0 | live]
; [else-branch: 46 | i@46@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 46 | i@46@01 == 0]
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i == 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@46@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | i@46@01 == 0 | live]
; [else-branch: 47 | i@46@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 47 | i@46@01 == 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@51@01 $Ref)
(declare-const i@52@01 Int)
(declare-const x@53@01 $Ref)
(declare-const i@54@01 Int)
(push) ; 1
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* (i == 0 ? acc(T(x), write) : acc(E(x), write)) {
; }
(push) ; 3
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; [eval] i == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@54@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | i@54@01 == 0 | live]
; [else-branch: 48 | i@54@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 48 | i@54@01 == 0]
(assert (= i@54@01 0))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (i == 0 ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@57@01 $MWSF)
(assert (forall (($t@56@01 $Snap)) (!
  (= (MWSF_apply mwsf@57@01 $t@56@01) ($Snap.first $t@55@01))
  :pattern ((MWSF_apply mwsf@57@01 $t@56@01))
  :qid |quant-u-30|)))
; [eval] i == 0
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 48 | i@54@01 != 0]
(assert (not (= i@54@01 0)))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (i == 0 ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@58@01 $MWSF)
(assert (forall (($t@56@01 $Snap)) (!
  (= (MWSF_apply mwsf@58@01 $t@56@01) ($Snap.second $t@55@01))
  :pattern ((MWSF_apply mwsf@58@01 $t@56@01))
  :qid |quant-u-32|)))
; [eval] i == 0
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (= i@54@01 0))
(assert (forall (($t@56@01 $Snap)) (!
  (= (MWSF_apply mwsf@57@01 $t@56@01) ($Snap.first $t@55@01))
  :pattern ((MWSF_apply mwsf@57@01 $t@56@01))
  :qid |quant-u-31|)))
(assert true)
; [exec]
; assert i != 0 ==> acc(T(x), write)
; [eval] i != 0
; [then-branch: 49 | i@54@01 != 0 | dead]
; [else-branch: 49 | i@54@01 == 0 | live]
(push) ; 4
; [else-branch: 49 | i@54@01 == 0]
; [exec]
; assert i == 0 ==> acc(E(x), write)
; [eval] i == 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= i@54@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | i@54@01 == 0 | live]
; [else-branch: 50 | i@54@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 50 | i@54@01 == 0]
; [exec]
; assert (i == 0 ? acc(E(x), write) : acc(T(x), write))
; [eval] i == 0
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= i@54@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | i@54@01 == 0 | live]
; [else-branch: 51 | i@54@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 51 | i@54@01 == 0]
; [exec]
; assert acc(E(x), write) && acc(T(x), write)
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
(assert (not false))
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
(assert (not false))
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
(assert (not false))
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
; ---------- test05 ----------
(declare-const x@59@01 $Ref)
(declare-const i@60@01 Int)
(declare-const x@61@01 $Ref)
(declare-const i@62@01 Int)
(push) ; 1
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (=
  ($Snap.second $t@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@63@01))
    ($Snap.second ($Snap.second $t@63@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@63@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@63@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@63@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(M(x), write) --*
; acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write)) {
; }
(push) ; 3
(declare-const $t@64@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 4
(assert (get%precondition $Snap.unit x@61@01 i@62@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition $Snap.unit x@61@01 i@62@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (get $Snap.unit x@61@01 i@62@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (get $Snap.unit x@61@01 i@62@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | get(_, x@61@01, i@62@01) | live]
; [else-branch: 52 | !(get(_, x@61@01, i@62@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 52 | get(_, x@61@01, i@62@01)]
(assert (get $Snap.unit x@61@01 i@62@01))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(M(x), write) --* acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@65@01 $MWSF)
(assert (forall (($t@64@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@65@01 $t@64@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@63@01))
      ($Snap.first ($Snap.second ($Snap.second $t@63@01)))))
  :pattern ((MWSF_apply mwsf@65@01 $t@64@01))
  :qid |quant-u-34|)))
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 52 | !(get(_, x@61@01, i@62@01))]
(assert (not (get $Snap.unit x@61@01 i@62@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(M(x), write) --* acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@66@01 $MWSF)
(assert (forall (($t@64@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@66@01 $t@64@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@63@01))
      ($Snap.second ($Snap.second ($Snap.second $t@63@01)))))
  :pattern ((MWSF_apply mwsf@66@01 $t@64@01))
  :qid |quant-u-36|)))
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (get $Snap.unit x@61@01 i@62@01))
(assert (forall (($t@64@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@65@01 $t@64@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@63@01))
      ($Snap.first ($Snap.second ($Snap.second $t@63@01)))))
  :pattern ((MWSF_apply mwsf@65@01 $t@64@01))
  :qid |quant-u-35|)))
(assert true)
; [exec]
; assert (get(x, i) ? acc(E(x), write) : acc(T(x), write))
; [eval] get(x, i)
(push) ; 4
(assert (get%precondition $Snap.unit x@61@01 i@62@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition $Snap.unit x@61@01 i@62@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (get $Snap.unit x@61@01 i@62@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | get(_, x@61@01, i@62@01) | live]
; [else-branch: 53 | !(get(_, x@61@01, i@62@01)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 53 | get(_, x@61@01, i@62@01)]
; [exec]
; assert acc(E(x), write) && acc(T(x), write)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const x@67@01 $Ref)
(declare-const i@68@01 Int)
(declare-const x@69@01 $Ref)
(declare-const i@70@01 Int)
(push) ; 1
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 ($Snap.combine ($Snap.first $t@71@01) ($Snap.second $t@71@01))))
(assert (=
  ($Snap.second $t@71@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@71@01))
    ($Snap.second ($Snap.second $t@71@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@71@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@71@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@71@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(M(x), write) --*
; acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write)) {
; }
(push) ; 3
(declare-const $t@72@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 4
(assert (get%precondition $Snap.unit x@69@01 i@70@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition $Snap.unit x@69@01 i@70@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (get $Snap.unit x@69@01 i@70@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (get $Snap.unit x@69@01 i@70@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | get(_, x@69@01, i@70@01) | live]
; [else-branch: 54 | !(get(_, x@69@01, i@70@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 54 | get(_, x@69@01, i@70@01)]
(assert (get $Snap.unit x@69@01 i@70@01))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(M(x), write) --* acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@73@01 $MWSF)
(assert (forall (($t@72@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@73@01 $t@72@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@71@01))
      ($Snap.first ($Snap.second ($Snap.second $t@71@01)))))
  :pattern ((MWSF_apply mwsf@73@01 $t@72@01))
  :qid |quant-u-38|)))
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 54 | !(get(_, x@69@01, i@70@01))]
(assert (not (get $Snap.unit x@69@01 i@70@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(M(x), write) --* acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@74@01 $MWSF)
(assert (forall (($t@72@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@74@01 $t@72@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@71@01))
      ($Snap.second ($Snap.second ($Snap.second $t@71@01)))))
  :pattern ((MWSF_apply mwsf@74@01 $t@72@01))
  :qid |quant-u-40|)))
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (get $Snap.unit x@69@01 i@70@01))
(assert (forall (($t@72@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@73@01 $t@72@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@71@01))
      ($Snap.first ($Snap.second ($Snap.second $t@71@01)))))
  :pattern ((MWSF_apply mwsf@73@01 $t@72@01))
  :qid |quant-u-39|)))
(assert true)
; [exec]
; apply acc(M(x), write) --*
;   acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
; [eval] get(x, i)
(push) ; 4
(assert (get%precondition $Snap.unit x@69@01 i@70@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition $Snap.unit x@69@01 i@70@01))
(assert (=
  (MWSF_apply mwsf@73@01 ($Snap.first $t@71@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@73@01 ($Snap.first $t@71@01)))
    ($Snap.second (MWSF_apply mwsf@73@01 ($Snap.first $t@71@01))))))
; [eval] get(x, i)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (get $Snap.unit x@69@01 i@70@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 55 | get(_, x@69@01, i@70@01) | live]
; [else-branch: 55 | !(get(_, x@69@01, i@70@01)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 55 | get(_, x@69@01, i@70@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(B(x), write) && (acc(E(x), write) && acc(T(x), write))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (not (get $Snap.unit x@69@01 i@70@01)))
(assert (forall (($t@72@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@74@01 $t@72@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@71@01))
      ($Snap.second ($Snap.second ($Snap.second $t@71@01)))))
  :pattern ((MWSF_apply mwsf@74@01 $t@72@01))
  :qid |quant-u-41|)))
(assert true)
; [exec]
; apply acc(M(x), write) --*
;   acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
; [eval] get(x, i)
(push) ; 4
(assert (get%precondition $Snap.unit x@69@01 i@70@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition $Snap.unit x@69@01 i@70@01))
(assert (=
  (MWSF_apply mwsf@74@01 ($Snap.first $t@71@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@74@01 ($Snap.first $t@71@01)))
    ($Snap.second (MWSF_apply mwsf@74@01 ($Snap.first $t@71@01))))))
; [eval] get(x, i)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [then-branch: 56 | get(_, x@69@01, i@70@01) | dead]
; [else-branch: 56 | !(get(_, x@69@01, i@70@01)) | live]
(push) ; 4
; [else-branch: 56 | !(get(_, x@69@01, i@70@01))]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(B(x), write) && (acc(E(x), write) && acc(T(x), write))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const x@75@01 $Ref)
(declare-const i@76@01 Int)
(declare-const x@77@01 $Ref)
(declare-const i@78@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 ($Snap.combine ($Snap.first $t@79@01) ($Snap.second $t@79@01))))
(assert (=
  ($Snap.second $t@79@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@79@01))
    ($Snap.second ($Snap.second $t@79@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@79@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@79@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(M(x), write) --*
; acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write)) {
; }
(push) ; 3
(declare-const $t@80@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 4
(assert (get%precondition $Snap.unit x@77@01 i@78@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition $Snap.unit x@77@01 i@78@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (get $Snap.unit x@77@01 i@78@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (get $Snap.unit x@77@01 i@78@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | get(_, x@77@01, i@78@01) | live]
; [else-branch: 57 | !(get(_, x@77@01, i@78@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 57 | get(_, x@77@01, i@78@01)]
(assert (get $Snap.unit x@77@01 i@78@01))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(M(x), write) --* acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@81@01 $MWSF)
(assert (forall (($t@80@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@81@01 $t@80@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@79@01))
      ($Snap.first ($Snap.second ($Snap.second $t@79@01)))))
  :pattern ((MWSF_apply mwsf@81@01 $t@80@01))
  :qid |quant-u-42|)))
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 57 | !(get(_, x@77@01, i@78@01))]
(assert (not (get $Snap.unit x@77@01 i@78@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(M(x), write) --* acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@82@01 $MWSF)
(assert (forall (($t@80@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@82@01 $t@80@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@79@01))
      ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))
  :pattern ((MWSF_apply mwsf@82@01 $t@80@01))
  :qid |quant-u-44|)))
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (get $Snap.unit x@77@01 i@78@01))
(assert (forall (($t@80@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@81@01 $t@80@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@79@01))
      ($Snap.first ($Snap.second ($Snap.second $t@79@01)))))
  :pattern ((MWSF_apply mwsf@81@01 $t@80@01))
  :qid |quant-u-43|)))
(assert true)
; [exec]
; apply acc(M(x), write) --*
;   acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
; [eval] get(x, i)
(push) ; 4
(assert (get%precondition $Snap.unit x@77@01 i@78@01))
(pop) ; 4
; Joined path conditions
(assert (get%precondition $Snap.unit x@77@01 i@78@01))
(assert (=
  (MWSF_apply mwsf@81@01 ($Snap.first $t@79@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@81@01 ($Snap.first $t@79@01)))
    ($Snap.second (MWSF_apply mwsf@81@01 ($Snap.first $t@79@01))))))
; [eval] get(x, i)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (get $Snap.unit x@77@01 i@78@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | get(_, x@77@01, i@78@01) | live]
; [else-branch: 58 | !(get(_, x@77@01, i@78@01)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 58 | get(_, x@77@01, i@78@01)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(B(x), write) && (acc(E(x), write) && acc(T(x), write))
; [exec]
; assert false
(set-option :timeout 0)
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
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
(declare-const x@83@01 $Ref)
(declare-const i@84@01 Int)
(declare-const x@85@01 $Ref)
(declare-const i@86@01 Int)
(push) ; 1
(declare-const $t@87@01 $Snap)
(assert (= $t@87@01 ($Snap.combine ($Snap.first $t@87@01) ($Snap.second $t@87@01))))
(assert (=
  ($Snap.second $t@87@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@87@01))
    ($Snap.second ($Snap.second $t@87@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@87@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@87@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@87@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] i == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= i@86@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= i@86@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 59 | i@86@01 == 0 | live]
; [else-branch: 59 | i@86@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 59 | i@86@01 == 0]
(assert (= i@86@01 0))
; [exec]
; package acc(M(x), write) --*
; acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write)) {
; }
(push) ; 4
(declare-const $t@88@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 5
(assert (get%precondition $Snap.unit x@85@01 i@86@01))
(pop) ; 5
; Joined path conditions
(assert (get%precondition $Snap.unit x@85@01 i@86@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not (get $Snap.unit x@85@01 i@86@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 60 | get(_, x@85@01, i@86@01) | dead]
; [else-branch: 60 | !(get(_, x@85@01, i@86@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 60 | !(get(_, x@85@01, i@86@01))]
(assert (not (get $Snap.unit x@85@01 i@86@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(M(x), write) --* acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
(declare-const mwsf@89@01 $MWSF)
(assert (forall (($t@88@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@89@01 $t@88@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@87@01))
      ($Snap.second ($Snap.second ($Snap.second $t@87@01)))))
  :pattern ((MWSF_apply mwsf@89@01 $t@88@01))
  :qid |quant-u-46|)))
; [eval] get(x, i)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(push) ; 4
(assert (and (not (get $Snap.unit x@85@01 i@86@01)) (= i@86@01 0)))
(assert (forall (($t@88@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@89@01 $t@88@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@87@01))
      ($Snap.second ($Snap.second ($Snap.second $t@87@01)))))
  :pattern ((MWSF_apply mwsf@89@01 $t@88@01))
  :qid |quant-u-47|)))
(assert true)
; [exec]
; assert acc(T(x), write)
; [exec]
; apply acc(M(x), write) --*
;   acc(B(x), write) && (get(x, i) ? acc(T(x), write) : acc(E(x), write))
; [eval] get(x, i)
(push) ; 5
(assert (get%precondition $Snap.unit x@85@01 i@86@01))
(pop) ; 5
; Joined path conditions
(assert (get%precondition $Snap.unit x@85@01 i@86@01))
(assert (=
  (MWSF_apply mwsf@89@01 ($Snap.first $t@87@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@89@01 ($Snap.first $t@87@01)))
    ($Snap.second (MWSF_apply mwsf@89@01 ($Snap.first $t@87@01))))))
; [eval] get(x, i)
(push) ; 5
(pop) ; 5
; Joined path conditions
; [then-branch: 61 | get(_, x@85@01, i@86@01) | dead]
; [else-branch: 61 | !(get(_, x@85@01, i@86@01)) | live]
(push) ; 5
; [else-branch: 61 | !(get(_, x@85@01, i@86@01))]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(B(x), write) && (acc(T(x), write) && acc(E(x), write))
; [exec]
; assert false
(set-option :timeout 0)
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
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
