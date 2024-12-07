(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/unconstrainedType.vpr
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
(declare-sort Huh 0)
(declare-sort WellFoundedOrder<Huh> 0)
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
(declare-fun $SortWrappers.HuhTo$Snap (Huh) $Snap)
(declare-fun $SortWrappers.$SnapToHuh ($Snap) Huh)
(assert (forall ((x Huh)) (!
    (= x ($SortWrappers.$SnapToHuh($SortWrappers.HuhTo$Snap x)))
    :pattern (($SortWrappers.HuhTo$Snap x))
    :qid |$Snap.$SnapToHuhTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.HuhTo$Snap($SortWrappers.$SnapToHuh x)))
    :pattern (($SortWrappers.$SnapToHuh x))
    :qid |$Snap.HuhTo$SnapToHuh|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Huh>To$Snap (WellFoundedOrder<Huh>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Huh> ($Snap) WellFoundedOrder<Huh>)
(assert (forall ((x WellFoundedOrder<Huh>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Huh>($SortWrappers.WellFoundedOrder<Huh>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Huh>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Huh>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Huh>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Huh> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Huh> x))
    :qid |$Snap.WellFoundedOrder<Huh>To$SnapToWellFoundedOrder<Huh>|
    )))
; ////////// Symbols
(declare-fun decreasing<Bool> (Huh Huh) Bool)
(declare-fun bounded<Bool> (Huh) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fac ($Snap Int Huh) Int)
(declare-fun fac%limited ($Snap Int Huh) Int)
(declare-fun fac%stateless (Int Huh) Bool)
(declare-fun fac%precondition ($Snap Int Huh) Bool)
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
; ---------- FUNCTION fac----------
(declare-fun i@0@00 () Int)
(declare-fun h@1@00 () Huh)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] i >= 0
(assert (>= i@0@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@0@00 Int) (h@1@00 Huh)) (!
  (= (fac%limited s@$ i@0@00 h@1@00) (fac s@$ i@0@00 h@1@00))
  :pattern ((fac s@$ i@0@00 h@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (h@1@00 Huh)) (!
  (fac%stateless i@0@00 h@1@00)
  :pattern ((fac%limited s@$ i@0@00 h@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (>= i@0@00 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (i == 0 ? 1 : i * fac(i - 1, h))
; [eval] i == 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= i@0@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= i@0@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@0@00 == 0 | live]
; [else-branch: 0 | i@0@00 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | i@0@00 == 0]
(assert (= i@0@00 0))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | i@0@00 != 0]
(assert (not (= i@0@00 0)))
; [eval] i * fac(i - 1, h)
; [eval] fac(i - 1, h)
; [eval] i - 1
(push) ; 4
; [eval] i >= 0
(push) ; 5
(assert (not (>= (- i@0@00 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- i@0@00 1) 0))
(assert (fac%precondition $Snap.unit (- i@0@00 1) h@1@00))
(pop) ; 4
; Joined path conditions
(assert (and (>= (- i@0@00 1) 0) (fac%precondition $Snap.unit (- i@0@00 1) h@1@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= i@0@00 0))
  (and
    (not (= i@0@00 0))
    (>= (- i@0@00 1) 0)
    (fac%precondition $Snap.unit (- i@0@00 1) h@1@00))))
(assert (or (not (= i@0@00 0)) (= i@0@00 0)))
(assert (=
  result@2@00
  (ite (= i@0@00 0) 1 (* i@0@00 (fac $Snap.unit (- i@0@00 1) h@1@00)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (i@0@00 Int) (h@1@00 Huh)) (!
  (=>
    (fac%precondition s@$ i@0@00 h@1@00)
    (=
      (fac s@$ i@0@00 h@1@00)
      (ite
        (= i@0@00 0)
        1
        (* i@0@00 (fac%limited $Snap.unit (- i@0@00 1) h@1@00)))))
  :pattern ((fac s@$ i@0@00 h@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (h@1@00 Huh)) (!
  (=>
    (fac%precondition s@$ i@0@00 h@1@00)
    (ite (= i@0@00 0) true (fac%precondition $Snap.unit (- i@0@00 1) h@1@00)))
  :pattern ((fac s@$ i@0@00 h@1@00))
  :qid |quant-u-3|)))
