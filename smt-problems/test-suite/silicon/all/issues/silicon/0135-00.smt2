(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0135.vpr
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
(declare-sort Unknown 0)
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
(declare-fun $SortWrappers.UnknownTo$Snap (Unknown) $Snap)
(declare-fun $SortWrappers.$SnapToUnknown ($Snap) Unknown)
(assert (forall ((x Unknown)) (!
    (= x ($SortWrappers.$SnapToUnknown($SortWrappers.UnknownTo$Snap x)))
    :pattern (($SortWrappers.UnknownTo$Snap x))
    :qid |$Snap.$SnapToUnknownTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.UnknownTo$Snap($SortWrappers.$SnapToUnknown x)))
    :pattern (($SortWrappers.$SnapToUnknown x))
    :qid |$Snap.UnknownTo$SnapToUnknown|
    )))
; ////////// Symbols
(declare-fun unknown<Perm> (Int) $Perm)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun01 ($Snap Int) $Perm)
(declare-fun fun01%limited ($Snap Int) $Perm)
(declare-fun fun01%stateless (Int) Bool)
(declare-fun fun01%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun token%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (= (fun01%limited s@$ x@0@00) (fun01 s@$ x@0@00))
  :pattern ((fun01 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (fun01%stateless x@0@00)
  :pattern ((fun01%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (fun01%precondition s@$ x@0@00)
    (=
      (fun01 s@$ x@0@00)
      (ite
        (<= x@0@00 0)
        (fun01%limited $Snap.unit (+ x@0@00 1))
        (/ (to_real 1) (to_real x@0@00)))))
  :pattern ((fun01 s@$ x@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (fun01%precondition s@$ x@0@00)
    (ite (<= x@0@00 0) (fun01%precondition $Snap.unit (+ x@0@00 1)) true))
  :pattern ((fun01 s@$ x@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test02 ----------
(declare-const x@0@01 Int)
(declare-const x@1@01 Int)
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
; assert unknown(x) >= none
; [eval] unknown(x) >= none
; [eval] unknown(x)
(push) ; 3
(assert (not (>= (unknown<Perm> x@1@01) $Perm.No)))
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
; [eval] unknown(x) >= none
; [eval] unknown(x)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= (unknown<Perm> x@1@01) $Perm.No)))
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
; [eval] unknown(x) >= none
; [eval] unknown(x)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= (unknown<Perm> x@1@01) $Perm.No)))
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
; [eval] unknown(x) >= none
; [eval] unknown(x)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= (unknown<Perm> x@1@01) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@2@01 Int)
(declare-const x@3@01 Int)
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
; assert fun01(x) >= none
; [eval] fun01(x) >= none
; [eval] fun01(x)
(push) ; 3
(assert (fun01%precondition $Snap.unit x@3@01))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition $Snap.unit x@3@01))
(push) ; 3
(assert (not (>= (fun01 $Snap.unit x@3@01) $Perm.No)))
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
; [eval] fun01(x) >= none
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (>= (fun01 $Snap.unit x@3@01) $Perm.No)))
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
; [eval] fun01(x) >= none
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (>= (fun01 $Snap.unit x@3@01) $Perm.No)))
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
; [eval] fun01(x) >= none
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (>= (fun01 $Snap.unit x@3@01) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const diz@4@01 $Ref)
(declare-const diz@5@01 $Ref)
(push) ; 1
(declare-const $t@6@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(token(diz), write)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (<= $Perm.No $k@8@01))
(assert (<= $k@8@01 $Perm.Write))
(assert (=> (< $Perm.No $k@8@01) (not (= diz@5@01 $Ref.null))))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] unknown(diz.unknown_x) >= none
; [eval] unknown(diz.unknown_x)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.No))
; [eval] unknown(diz.unknown_x)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.No)
  (< $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)))))
(assert (<= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.Write))
(assert (=>
  (< $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))))
  (not (= diz@5@01 $Ref.null))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (token%trigger $t@6@01 diz@5@01))
; [exec]
; fold acc(token(diz), write)
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@8@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@9@01 $k@8@01))
(assert (<= $Perm.No (- $k@8@01 $k@9@01)))
(assert (<= (- $k@8@01 $k@9@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@8@01 $k@9@01)) (not (= diz@5@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] unknown(diz.unknown_x) >= none
; [eval] unknown(diz.unknown_x)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] unknown(diz.unknown_x)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.No)
  (< $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (token%trigger ($Snap.combine
  ($Snap.first $t@6@01)
  ($Snap.combine
    $Snap.unit
    (ite
      (<
        $Perm.No
        (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second $t@6@01))
      $Snap.unit))) diz@5@01))
; [exec]
; fold acc(token(diz), write)
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (- $k@8@01 $k@9@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@10@01 (- $k@8@01 $k@9@01)))
(assert (<= $Perm.No (- (- $k@8@01 $k@9@01) $k@10@01)))
(assert (<= (- (- $k@8@01 $k@9@01) $k@10@01) $Perm.Write))
(assert (=> (< $Perm.No (- (- $k@8@01 $k@9@01) $k@10@01)) (not (= diz@5@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] unknown(diz.unknown_x) >= none
; [eval] unknown(diz.unknown_x)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@8@01 $k@9@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] unknown(diz.unknown_x)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@8@01 $k@9@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.No)
  (< $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
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
(assert (not (= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.No)))
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
; [eval] unknown(diz.unknown_x)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@8@01 $k@9@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.No)
  (< $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.No)))
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
(assert (not (= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))) $Perm.No)))
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
