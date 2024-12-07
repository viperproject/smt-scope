(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:46:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0045.vpr
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
(declare-fun sum ($Snap $Ref) Int)
(declare-fun sum%limited ($Snap $Ref) Int)
(declare-fun sum%stateless ($Ref) Bool)
(declare-fun sum%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Pair%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  (= (sum%limited s@$ p@0@00) (sum s@$ p@0@00))
  :pattern ((sum s@$ p@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  (sum%stateless p@0@00)
  :pattern ((sum%limited s@$ p@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  (=>
    (sum%precondition s@$ p@0@00)
    (=
      (sum s@$ p@0@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((sum s@$ p@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (p@0@00 $Ref)) (!
  true
  :pattern ((sum s@$ p@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test08 ----------
(declare-const p@0@01 $Ref)
(declare-const r@1@01 $Ref)
(declare-const p@2@01 $Ref)
(declare-const r@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= r@3@01 $Ref.null)))
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
(declare-const x@5@01 Int)
; [exec]
; x := sum(p)
; [eval] sum(p)
(push) ; 3
(assert (sum%precondition ($Snap.first $t@4@01) p@2@01))
(pop) ; 3
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@4@01) p@2@01))
(declare-const x@6@01 Int)
(assert (= x@6@01 (sum ($Snap.first $t@4@01) p@2@01)))
; [exec]
; exhale acc(r.f, write)
; [exec]
; assert (unfolding acc(Pair(p), write) in p.f + p.g == x)
; [eval] (unfolding acc(Pair(p), write) in p.f + p.g == x)
(push) ; 3
(assert (Pair%trigger ($Snap.first $t@4@01) p@2@01))
(assert (=
  ($Snap.first $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.second ($Snap.first $t@4@01)))))
(assert (not (= p@2@01 $Ref.null)))
; [eval] p.f + p.g == x
; [eval] p.f + p.g
(pop) ; 3
; Joined path conditions
(assert (and
  (Pair%trigger ($Snap.first $t@4@01) p@2@01)
  (=
    ($Snap.first $t@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.second ($Snap.first $t@4@01))))
  (not (= p@2@01 $Ref.null))))
(push) ; 3
(assert (not (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@4@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@4@01))))
  x@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@4@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@4@01))))
  x@6@01))
(pop) ; 2
(pop) ; 1
