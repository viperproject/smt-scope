(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:07
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/basic.vpr
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
(declare-fun add ($Snap $Ref) Int)
(declare-fun add%limited ($Snap $Ref) Int)
(declare-fun add%stateless ($Ref) Bool)
(declare-fun add%precondition ($Snap $Ref) Bool)
(declare-fun tern ($Snap $Ref Bool) Int)
(declare-fun tern%limited ($Snap $Ref Bool) Int)
(declare-fun tern%stateless ($Ref Bool) Bool)
(declare-fun tern%precondition ($Snap $Ref Bool) Bool)
(declare-fun add3 ($Snap $Ref Int) Int)
(declare-fun add3%limited ($Snap $Ref Int) Int)
(declare-fun add3%stateless ($Ref Int) Bool)
(declare-fun add3%precondition ($Snap $Ref Int) Bool)
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
; ---------- FUNCTION add----------
(declare-fun x@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@0@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (add%limited s@$ x@0@00) (add s@$ x@0@00))
  :pattern ((add s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (add%stateless x@0@00)
  :pattern ((add%limited s@$ x@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@0@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] x.f + x.g
(assert (=
  result@1@00
  (+
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (add%precondition s@$ x@0@00)
    (=
      (add s@$ x@0@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((add s@$ x@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((add s@$ x@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION tern----------
(declare-fun x@2@00 () $Ref)
(declare-fun b@3@00 () Bool)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(push) ; 2
(set-option :timeout 10)
(assert (not (not b@3@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not b@3@00))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@3@00 | live]
; [else-branch: 0 | !(b@3@00) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | b@3@00]
(assert b@3@00)
(assert (not (= x@2@00 $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 0 | !(b@3@00)]
(assert (not b@3@00))
(assert (not (= x@2@00 $Ref.null)))
(pop) ; 2
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (b@3@00 Bool)) (!
  (= (tern%limited s@$ x@2@00 b@3@00) (tern s@$ x@2@00 b@3@00))
  :pattern ((tern s@$ x@2@00 b@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (b@3@00 Bool)) (!
  (tern%stateless x@2@00 b@3@00)
  :pattern ((tern%limited s@$ x@2@00 b@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert b@3@00)
(assert (not (= x@2@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (b ? x.f : x.g)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@3@00 | live]
; [else-branch: 1 | !(b@3@00) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | b@3@00]
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (= result@4@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(push) ; 1
(assert (not b@3@00))
(assert (not (= x@2@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (b ? x.f : x.g)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 2 | b@3@00 | dead]
; [else-branch: 2 | !(b@3@00) | live]
(push) ; 3
; [else-branch: 2 | !(b@3@00)]
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (= result@4@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (b@3@00 Bool)) (!
  (=>
    (tern%precondition s@$ x@2@00 b@3@00)
    (= (tern s@$ x@2@00 b@3@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((tern s@$ x@2@00 b@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (b@3@00 Bool)) (!
  true
  :pattern ((tern s@$ x@2@00 b@3@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION add3----------
(declare-fun x@5@00 () $Ref)
(declare-fun a@6@00 () Int)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@5@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] x.g > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 0))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first s@$))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second s@$))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (a@6@00 Int)) (!
  (= (add3%limited s@$ x@5@00 a@6@00) (add3 s@$ x@5@00 a@6@00))
  :pattern ((add3 s@$ x@5@00 a@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (a@6@00 Int)) (!
  (add3%stateless x@5@00 a@6@00)
  :pattern ((add3%limited s@$ x@5@00 a@6@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@5@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (> ($SortWrappers.$SnapToInt ($Snap.first s@$)) 0))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first s@$))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second s@$))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] x.f - a + x.g
; [eval] x.f - a
(assert (=
  result@7@00
  (+
    (-
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      a@6@00)
    ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (a@6@00 Int)) (!
  (=>
    (add3%precondition s@$ x@5@00 a@6@00)
    (=
      (add3 s@$ x@5@00 a@6@00)
      (+
        (-
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          a@6@00)
        ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((add3 s@$ x@5@00 a@6@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (a@6@00 Int)) (!
  true
  :pattern ((add3 s@$ x@5@00 a@6@00))
  :qid |quant-u-11|)))
