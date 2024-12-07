(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:00
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/unfolding_nonnull.vpr
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
(declare-fun fun4 ($Snap $Ref $Ref) Int)
(declare-fun fun4%limited ($Snap $Ref $Ref) Int)
(declare-fun fun4%stateless ($Ref $Ref) Bool)
(declare-fun fun4%precondition ($Snap $Ref $Ref) Bool)
(declare-fun fun3 ($Snap $Ref) Int)
(declare-fun fun3%limited ($Snap $Ref) Int)
(declare-fun fun3%stateless ($Ref) Bool)
(declare-fun fun3%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun F%trigger ($Snap $Ref) Bool)
(declare-fun G%trigger ($Snap $Ref) Bool)
(declare-fun FF%trigger ($Snap $Ref $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref)) (!
  (= (fun4%limited s@$ x@0@00 y@1@00) (fun4 s@$ x@0@00 y@1@00))
  :pattern ((fun4 s@$ x@0@00 y@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref)) (!
  (fun4%stateless x@0@00 y@1@00)
  :pattern ((fun4%limited s@$ x@0@00 y@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref)) (!
  (=>
    (fun4%precondition s@$ x@0@00 y@1@00)
    (= (fun4 s@$ x@0@00 y@1@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((fun4 s@$ x@0@00 y@1@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref)) (!
  true
  :pattern ((fun4 s@$ x@0@00 y@1@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  (= (fun3%limited s@$ x@3@00) (fun3 s@$ x@3@00))
  :pattern ((fun3 s@$ x@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  (fun3%stateless x@3@00)
  :pattern ((fun3%limited s@$ x@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  (=>
    (fun3%precondition s@$ x@3@00)
    (= (fun3 s@$ x@3@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((fun3 s@$ x@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  true
  :pattern ((fun3 s@$ x@3@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test6 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] fun3(x) == 1
; [eval] fun3(x)
(push) ; 2
(assert (fun3%precondition ($Snap.first $t@2@01) x@1@01))
(pop) ; 2
; Joined path conditions
(assert (fun3%precondition ($Snap.first $t@2@01) x@1@01))
(assert (= (fun3 ($Snap.first $t@2@01) x@1@01) 1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert x != null
; [eval] x != null
(push) ; 3
(assert (not (not (= x@1@01 $Ref.null))))
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
; [eval] x != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= x@1@01 $Ref.null))))
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
; [eval] x != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= x@1@01 $Ref.null))))
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
; [eval] x != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= x@1@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test7 ----------
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(declare-const x@5@01 $Ref)
(declare-const y@6@01 $Ref)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] fun4(x, y) == 1
; [eval] fun4(x, y)
(push) ; 2
(assert (fun4%precondition ($Snap.first $t@7@01) x@5@01 y@6@01))
(pop) ; 2
; Joined path conditions
(assert (fun4%precondition ($Snap.first $t@7@01) x@5@01 y@6@01))
(assert (= (fun4 ($Snap.first $t@7@01) x@5@01 y@6@01) 1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert x != null
; [eval] x != null
(push) ; 3
(assert (not (not (= x@5@01 $Ref.null))))
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
; [eval] x != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= x@5@01 $Ref.null))))
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
; [eval] x != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= x@5@01 $Ref.null))))
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
; [eval] x != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= x@5@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
