(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:36:34
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/package_hyp.vpr
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
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
(assert (not (= x@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) && acc(x.f, write) --* false {
; }
(push) ; 3
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@3@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@3@01))))
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, write) && acc(x.f, write) --* false
(declare-const mwsf@4@01 $MWSF)
(assert (forall (($t@3@01 $Snap)) (!
  (= (MWSF_apply mwsf@4@01 $t@3@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-0|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@3@01 $Snap)) (!
  (= (MWSF_apply mwsf@4@01 $t@3@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-1|)))
; [exec]
; package acc(x.f, write) && acc(x.f, write) --*
; acc(x.f, write) && (acc(x.f, write) && false) {
; }
(push) ; 4
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@5@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@5@01))))
(assert false)
(declare-const $t@6@01 $Snap)
(declare-const $t@7@01 $Snap)
; Create MagicWandSnapFunction for wand acc(x.f, write) && acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) && false)
(declare-const mwsf@8@01 $MWSF)
(assert (forall (($t@5@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@8@01 $t@5@01)
    ($Snap.combine $t@6@01 ($Snap.combine $t@7@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@8@01 $t@5@01))
  :qid |quant-u-2|)))
(pop) ; 4
(push) ; 4
(assert (forall (($t@5@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@8@01 $t@5@01)
    ($Snap.combine $t@6@01 ($Snap.combine $t@7@01 $Snap.unit)))
  :pattern ((MWSF_apply mwsf@8@01 $t@5@01))
  :qid |quant-u-3|)))
(assert true)
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
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@9@01 $Ref)
(declare-const x@10@01 $Ref)
(push) ; 1
(declare-const $t@11@01 Int)
(assert (not (= x@10@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) && (x.f == 2 && x.f == 3) --* false {
; }
(push) ; 3
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))
; [eval] x.f == 2
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@12@01)) 2))
(assert (= ($Snap.second ($Snap.second $t@12@01)) $Snap.unit))
; [eval] x.f == 3
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@12@01)) 3))
(push) ; 4
(assert (not false))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, write) && (x.f == 2 && x.f == 3) --* false
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-4|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-5|)))
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
; ---------- test03 ----------
(declare-const x@14@01 $Ref)
(declare-const x@15@01 $Ref)
(push) ; 1
(declare-const $t@16@01 Int)
(assert (not (= x@15@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) && (x.f == 2 && x.f == 3) --* false {
;   package true --* false {
;   }
; }
(push) ; 3
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (= ($Snap.first ($Snap.second $t@17@01)) $Snap.unit))
; [eval] x.f == 2
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@17@01)) 2))
(assert (= ($Snap.second ($Snap.second $t@17@01)) $Snap.unit))
; [eval] x.f == 3
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@17@01)) 3))
; [exec]
; package true --* false {
; }
(push) ; 4
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 $Snap.unit))
(push) ; 5
(assert (not false))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert false)
; Create MagicWandSnapFunction for wand true --* false
(declare-const mwsf@19@01 $MWSF)
(assert (forall (($t@18@01 $Snap)) (!
  (= (MWSF_apply mwsf@19@01 $t@18@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@19@01 $t@18@01))
  :qid |quant-u-6|)))
(pop) ; 4
(push) ; 4
(assert (forall (($t@18@01 $Snap)) (!
  (= (MWSF_apply mwsf@19@01 $t@18@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@19@01 $t@18@01))
  :qid |quant-u-7|)))
(push) ; 5
(assert (not false))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, write) && (x.f == 2 && x.f == 3) --* false
(declare-const mwsf@20@01 $MWSF)
(assert (forall (($t@17@01 $Snap)) (!
  (= (MWSF_apply mwsf@20@01 $t@17@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@20@01 $t@17@01))
  :qid |quant-u-8|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (forall (($t@17@01 $Snap)) (!
  (= (MWSF_apply mwsf@20@01 $t@17@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@20@01 $t@17@01))
  :qid |quant-u-9|)))
(assert (forall (($t@18@01 $Snap)) (!
  (= (MWSF_apply mwsf@19@01 $t@18@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@19@01 $t@18@01))
  :qid |quant-u-6|)))
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
; ---------- test05 ----------
(declare-const x@21@01 $Ref)
(declare-const x@22@01 $Ref)
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
; package true --* true {
;   package true --* false {
;   }
; }
(push) ; 3
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [exec]
; package true --* false {
; }
(push) ; 4
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@25@01 $Snap)
(declare-const $t@26@01 $Snap)
; Create MagicWandSnapFunction for wand true --* false
(declare-const mwsf@27@01 $MWSF)
(assert (forall (($t@25@01 $Snap)) (!
  (= (MWSF_apply mwsf@27@01 $t@25@01) $t@26@01)
  :pattern ((MWSF_apply mwsf@27@01 $t@25@01))
  :qid |quant-u-10|)))
(pop) ; 3
(declare-const $t@28@01 $Snap)
(declare-const $t@29@01 $Snap)
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@30@01 $MWSF)
(assert (forall (($t@28@01 $Snap)) (!
  (= (MWSF_apply mwsf@30@01 $t@28@01) $t@29@01)
  :pattern ((MWSF_apply mwsf@30@01 $t@28@01))
  :qid |quant-u-12|)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@31@01 $Ref)
(declare-const x@32@01 $Ref)
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
; package acc(x.f, write) && acc(x.f, write) --* false {
;   package true --* false {
;   }
; }
(push) ; 3
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (not (= x@32@01 $Ref.null)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@33@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@33@01))))
(assert false)
; [exec]
; package true --* false {
; }
(push) ; 4
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; Create MagicWandSnapFunction for wand true --* false
(declare-const mwsf@35@01 $MWSF)
(assert (forall (($t@34@01 $Snap)) (!
  (= (MWSF_apply mwsf@35@01 $t@34@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@35@01 $t@34@01))
  :qid |quant-u-14|)))
(pop) ; 4
(push) ; 4
(assert (forall (($t@34@01 $Snap)) (!
  (= (MWSF_apply mwsf@35@01 $t@34@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@35@01 $t@34@01))
  :qid |quant-u-15|)))
; Create MagicWandSnapFunction for wand acc(x.f, write) && acc(x.f, write) --* false
(declare-const mwsf@36@01 $MWSF)
(assert (forall (($t@33@01 $Snap)) (!
  (= (MWSF_apply mwsf@36@01 $t@33@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@36@01 $t@33@01))
  :qid |quant-u-16|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
(assert (forall (($t@33@01 $Snap)) (!
  (= (MWSF_apply mwsf@36@01 $t@33@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@36@01 $t@33@01))
  :qid |quant-u-17|)))
(assert (forall (($t@34@01 $Snap)) (!
  (= (MWSF_apply mwsf@35@01 $t@34@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@35@01 $t@34@01))
  :qid |quant-u-14|)))
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
