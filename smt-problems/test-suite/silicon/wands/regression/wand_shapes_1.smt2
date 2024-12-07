(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:37:31
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/wand_shapes_1.vpr
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test07 ----------
(declare-const p@0@01 $Ref)
(declare-const p@1@01 $Ref)
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
; var r: Ref
(declare-const r@2@01 $Ref)
; [exec]
; inhale acc(p.f, write)
(declare-const $t@3@01 $Ref)
(assert (not (= p@1@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package acc(p.f, write) && acc(p.f.g, write) --* true {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@4@01)) $Ref.null)))
; Create MagicWandSnapFunction for wand acc(p.f, write) && acc(p.f.g, write) --* true
(declare-const mwsf@5@01 $MWSF)
(assert (forall (($t@4@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@4@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-0|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@4@01 $Snap)) (!
  (= (MWSF_apply mwsf@5@01 $t@4@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@5@01 $t@4@01))
  :qid |quant-u-1|)))
; [exec]
; exhale acc(p.f, write)
; [exec]
; r := p
; [exec]
; exhale acc(r.f, write) && acc(r.f.g, write) --* true
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test08 ----------
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
; var x: Int
(declare-const x@6@01 Int)
; [exec]
; var y: Int
(declare-const y@7@01 Int)
; [exec]
; var t: Int
(declare-const t@8@01 Int)
; [exec]
; package x == 2 && y == 2 --* true {
; }
(push) ; 3
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] x == 2
(assert (= x@6@01 2))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] y == 2
(assert (= y@7@01 2))
; Create MagicWandSnapFunction for wand x == 2 && y == 2 --* true
(declare-const mwsf@10@01 $MWSF)
(assert (forall (($t@9@01 $Snap)) (!
  (= (MWSF_apply mwsf@10@01 $t@9@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@10@01 $t@9@01))
  :qid |quant-u-2|)))
; [eval] x == 2 && y == 2
; [eval] x == 2
(push) ; 4
; [then-branch: 0 | x@6@01 != 2 | live]
; [else-branch: 0 | x@6@01 == 2 | live]
(push) ; 5
; [then-branch: 0 | x@6@01 != 2]
(assert (not (= x@6@01 2)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | x@6@01 == 2]
; [eval] y == 2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@6@01 2) (not (= x@6@01 2))))
(pop) ; 3
(push) ; 3
(assert (forall (($t@9@01 $Snap)) (!
  (= (MWSF_apply mwsf@10@01 $t@9@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@10@01 $t@9@01))
  :qid |quant-u-3|)))
; [exec]
; exhale y == 2 && x == 2 --* true
; [eval] y == 2 && x == 2
; [eval] y == 2
(push) ; 4
; [then-branch: 1 | y@7@01 != 2 | live]
; [else-branch: 1 | y@7@01 == 2 | live]
(push) ; 5
; [then-branch: 1 | y@7@01 != 2]
(assert (not (= y@7@01 2)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | y@7@01 == 2]
(assert (= y@7@01 2))
; [eval] x == 2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= y@7@01 2) (not (= y@7@01 2))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= (and (= x@6@01 2) (= y@7@01 2)) (and (= y@7@01 2) (= x@6@01 2)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test09 ----------
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
; var x: Int
(declare-const x@11@01 Int)
; [exec]
; var y: Int
(declare-const y@12@01 Int)
; [exec]
; var t: Int
(declare-const t@13@01 Int)
; [exec]
; package x == 2 && y == 2 --* true {
; }
(push) ; 3
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] x == 2
(assert (= x@11@01 2))
(assert (= ($Snap.second $t@14@01) $Snap.unit))
; [eval] y == 2
(assert (= y@12@01 2))
; Create MagicWandSnapFunction for wand x == 2 && y == 2 --* true
(declare-const mwsf@15@01 $MWSF)
(assert (forall (($t@14@01 $Snap)) (!
  (= (MWSF_apply mwsf@15@01 $t@14@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@15@01 $t@14@01))
  :qid |quant-u-4|)))
; [eval] x == 2 && y == 2
; [eval] x == 2
(push) ; 4
; [then-branch: 2 | x@11@01 != 2 | live]
; [else-branch: 2 | x@11@01 == 2 | live]
(push) ; 5
; [then-branch: 2 | x@11@01 != 2]
(assert (not (= x@11@01 2)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | x@11@01 == 2]
; [eval] y == 2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@11@01 2) (not (= x@11@01 2))))
(pop) ; 3
(push) ; 3
(assert (forall (($t@14@01 $Snap)) (!
  (= (MWSF_apply mwsf@15@01 $t@14@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@15@01 $t@14@01))
  :qid |quant-u-5|)))
; [exec]
; x := t
; [exec]
; exhale y == 2 && x == 2 --* true
; [eval] y == 2 && x == 2
; [eval] y == 2
(push) ; 4
; [then-branch: 3 | y@12@01 != 2 | live]
; [else-branch: 3 | y@12@01 == 2 | live]
(push) ; 5
; [then-branch: 3 | y@12@01 != 2]
(assert (not (= y@12@01 2)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | y@12@01 == 2]
(assert (= y@12@01 2))
; [eval] x == 2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= y@12@01 2) (not (= y@12@01 2))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= (and (= x@11@01 2) (= y@12@01 2)) (and (= y@12@01 2) (= t@13@01 2)))))
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
(assert (not (= (and (= x@11@01 2) (= y@12@01 2)) (and (= y@12@01 2) (= t@13@01 2)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
; [eval] y == 2 && x == 2
; [eval] y == 2
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | y@12@01 != 2 | live]
; [else-branch: 4 | y@12@01 == 2 | live]
(push) ; 5
; [then-branch: 4 | y@12@01 != 2]
(assert (not (= y@12@01 2)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | y@12@01 == 2]
(assert (= y@12@01 2))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x == 2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (and (= x@11@01 2) (= y@12@01 2)) (and (= y@12@01 2) (= t@13@01 2)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
(assert (not (= (and (= x@11@01 2) (= y@12@01 2)) (and (= y@12@01 2) (= t@13@01 2)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
; ---------- test10 ----------
(declare-const p@16@01 $Ref)
(declare-const q@17@01 $Ref)
(declare-const p@18@01 $Ref)
(declare-const q@19@01 $Ref)
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
; package acc(p.f, write) && acc(q.f, write) --* true {
; }
(push) ; 3
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (not (= p@18@01 $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (= p@18@01 q@19@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= q@19@01 $Ref.null)))
; Create MagicWandSnapFunction for wand acc(p.f, write) && acc(q.f, write) --* true
(declare-const mwsf@21@01 $MWSF)
(assert (forall (($t@20@01 $Snap)) (!
  (= (MWSF_apply mwsf@21@01 $t@20@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@21@01 $t@20@01))
  :qid |quant-u-6|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@20@01 $Snap)) (!
  (= (MWSF_apply mwsf@21@01 $t@20@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@21@01 $t@20@01))
  :qid |quant-u-7|)))
; [exec]
; exhale acc(q.f, write) && acc(p.f, write) --* true
(push) ; 4
(set-option :timeout 10)
(assert (not (and (= p@18@01 q@19@01) (= q@19@01 p@18@01))))
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
(assert (not (and (= p@18@01 q@19@01) (= q@19@01 p@18@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
(assert (not (and (= p@18@01 q@19@01) (= q@19@01 p@18@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
(assert (not (and (= p@18@01 q@19@01) (= q@19@01 p@18@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
