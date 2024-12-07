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
; ---------- FUNCTION fun01----------
(declare-fun x@0@00 () Int)
(declare-fun result@1@00 () $Perm)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (= (fun01%limited s@$ x@0@00) (fun01 s@$ x@0@00))
  :pattern ((fun01 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (fun01%stateless x@0@00)
  :pattern ((fun01%limited s@$ x@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x <= 0 ? fun01(x + 1) : 1 / x)
; [eval] x <= 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= x@0@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= x@0@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@0@00 <= 0 | live]
; [else-branch: 0 | !(x@0@00 <= 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@0@00 <= 0]
(assert (<= x@0@00 0))
; [eval] fun01(x + 1)
; [eval] x + 1
(push) ; 4
(assert (fun01%precondition $Snap.unit (+ x@0@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fun01%precondition $Snap.unit (+ x@0@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(x@0@00 <= 0)]
(assert (not (<= x@0@00 0)))
(push) ; 4
(assert (not (not (= x@0@00 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (<= x@0@00 0)
  (and (<= x@0@00 0) (fun01%precondition $Snap.unit (+ x@0@00 1)))))
; Joined path conditions
(assert (or (not (<= x@0@00 0)) (<= x@0@00 0)))
(assert (=
  result@1@00
  (ite
    (<= x@0@00 0)
    (fun01 $Snap.unit (+ x@0@00 1))
    (/ (to_real 1) (to_real x@0@00)))))
(pop) ; 1
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
; ---------- token ----------
(declare-const diz@2@00 $Ref)
(push) ; 1
(declare-const $t@3@00 $Snap)
(assert (= $t@3@00 ($Snap.combine ($Snap.first $t@3@00) ($Snap.second $t@3@00))))
(declare-const $k@4@00 $Perm)
(assert ($Perm.isReadVar $k@4@00))
(assert (<= $Perm.No $k@4@00))
(assert (<= $k@4@00 $Perm.Write))
(assert (=> (< $Perm.No $k@4@00) (not (= diz@2@00 $Ref.null))))
(assert (=
  ($Snap.second $t@3@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@00))
    ($Snap.second ($Snap.second $t@3@00)))))
(assert (= ($Snap.first ($Snap.second $t@3@00)) $Snap.unit))
; [eval] unknown(diz.unknown_x) >= none
; [eval] unknown(diz.unknown_x)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@3@00))) $Perm.No))
; [eval] unknown(diz.unknown_x)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(assert (not (or
  (= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@3@00))) $Perm.No)
  (< $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@3@00)))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@3@00)))))
(assert (<= (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@3@00))) $Perm.Write))
(assert (=>
  (< $Perm.No (unknown<Perm> ($SortWrappers.$SnapToInt ($Snap.first $t@3@00))))
  (not (= diz@2@00 $Ref.null))))
(pop) ; 1
