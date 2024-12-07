(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:13
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/functions.vpr
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
(declare-fun err1 ($Snap $Ref) Int)
(declare-fun err1%limited ($Snap $Ref) Int)
(declare-fun err1%stateless ($Ref) Bool)
(declare-fun err1%precondition ($Snap $Ref) Bool)
(declare-fun er3 ($Snap $Ref $Ref) Int)
(declare-fun er3%limited ($Snap $Ref $Ref) Int)
(declare-fun er3%stateless ($Ref $Ref) Bool)
(declare-fun er3%precondition ($Snap $Ref $Ref) Bool)
(declare-fun fun2 ($Snap $Ref $Ref) Int)
(declare-fun fun2%limited ($Snap $Ref $Ref) Int)
(declare-fun fun2%stateless ($Ref $Ref) Bool)
(declare-fun fun2%precondition ($Snap $Ref $Ref) Bool)
(declare-fun fun6 ($Snap Bool $Ref) Int)
(declare-fun fun6%limited ($Snap Bool $Ref) Int)
(declare-fun fun6%stateless (Bool $Ref) Bool)
(declare-fun fun6%precondition ($Snap Bool $Ref) Bool)
(declare-fun fun3 ($Snap $Ref) Int)
(declare-fun fun3%limited ($Snap $Ref) Int)
(declare-fun fun3%stateless ($Ref) Bool)
(declare-fun fun3%precondition ($Snap $Ref) Bool)
(declare-fun fun5 ($Snap $Ref) Int)
(declare-fun fun5%limited ($Snap $Ref) Int)
(declare-fun fun5%stateless ($Ref) Bool)
(declare-fun fun5%precondition ($Snap $Ref) Bool)
(declare-fun err2 ($Snap $Ref) Int)
(declare-fun err2%limited ($Snap $Ref) Int)
(declare-fun err2%stateless ($Ref) Bool)
(declare-fun err2%precondition ($Snap $Ref) Bool)
(declare-fun fun4 ($Snap $Ref $Ref) Int)
(declare-fun fun4%limited ($Snap $Ref $Ref) Int)
(declare-fun fun4%stateless ($Ref $Ref) Bool)
(declare-fun fun4%precondition ($Snap $Ref $Ref) Bool)
(declare-fun fun1 ($Snap $Ref $Ref) Int)
(declare-fun fun1%limited ($Snap $Ref $Ref) Int)
(declare-fun fun1%stateless ($Ref $Ref) Bool)
(declare-fun fun1%precondition ($Snap $Ref $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
(declare-fun Q%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION err1----------
(declare-fun x@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
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
(pop) ; 1
; ---------- FUNCTION er3----------
(declare-fun x@2@00 () $Ref)
(declare-fun y@3@00 () $Ref)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@2@00 $Ref.null)))
(assert (not (= y@3@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (y@3@00 $Ref)) (!
  (= (er3%limited s@$ x@2@00 y@3@00) (er3 s@$ x@2@00 y@3@00))
  :pattern ((er3 s@$ x@2@00 y@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (y@3@00 $Ref)) (!
  (er3%stateless x@2@00 y@3@00)
  :pattern ((er3%limited s@$ x@2@00 y@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@2@00 $Ref.null)))
(assert (not (= y@3@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] y.f + x.g
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@2@00 y@3@00)))
(check-sat)
; unknown
(pop) ; 2
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
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@2@00 y@3@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 1
; ---------- FUNCTION fun2----------
(declare-fun x@5@00 () $Ref)
(declare-fun y@6@00 () $Ref)
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
; [eval] x == y
(assert (= x@5@00 y@6@00))
(assert (not (= y@6@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (y@6@00 $Ref)) (!
  (= (fun2%limited s@$ x@5@00 y@6@00) (fun2 s@$ x@5@00 y@6@00))
  :pattern ((fun2 s@$ x@5@00 y@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (y@6@00 $Ref)) (!
  (fun2%stateless x@5@00 y@6@00)
  :pattern ((fun2%limited s@$ x@5@00 y@6@00))
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
(assert (= x@5@00 y@6@00))
(assert (not (= y@6@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] y.f + x.g
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@6@00 x@5@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@7@00
  (+
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (y@6@00 $Ref)) (!
  (=>
    (fun2%precondition s@$ x@5@00 y@6@00)
    (=
      (fun2 s@$ x@5@00 y@6@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$))))))
  :pattern ((fun2 s@$ x@5@00 y@6@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (y@6@00 $Ref)) (!
  true
  :pattern ((fun2 s@$ x@5@00 y@6@00))
  :qid |quant-u-19|)))
; ---------- FUNCTION fun6----------
(declare-fun b@8@00 () Bool)
(declare-fun x@9@00 () $Ref)
(declare-fun result@10@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(push) ; 2
(set-option :timeout 10)
(assert (not (not b@8@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not b@8@00))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@8@00 | live]
; [else-branch: 0 | !(b@8@00) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | b@8@00]
(assert b@8@00)
(assert (not (= x@9@00 $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 0 | !(b@8@00)]
(assert (not b@8@00))
(assert (= s@$ $Snap.unit))
(pop) ; 2
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@8@00 Bool) (x@9@00 $Ref)) (!
  (= (fun6%limited s@$ b@8@00 x@9@00) (fun6 s@$ b@8@00 x@9@00))
  :pattern ((fun6 s@$ b@8@00 x@9@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (b@8@00 Bool) (x@9@00 $Ref)) (!
  (fun6%stateless b@8@00 x@9@00)
  :pattern ((fun6%limited s@$ b@8@00 x@9@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert b@8@00)
(assert (not (= x@9@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (b ? x.f : 0)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@8@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@8@00 | live]
; [else-branch: 1 | !(b@8@00) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | b@8@00]
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (= result@10@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(push) ; 1
(assert (not b@8@00))
(assert (= s@$ $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (b ? x.f : 0)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 2 | b@8@00 | dead]
; [else-branch: 2 | !(b@8@00) | live]
(push) ; 3
; [else-branch: 2 | !(b@8@00)]
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (= result@10@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@8@00 Bool) (x@9@00 $Ref)) (!
  (=>
    (fun6%precondition s@$ b@8@00 x@9@00)
    (= (fun6 s@$ b@8@00 x@9@00) (ite b@8@00 ($SortWrappers.$SnapToInt s@$) 0)))
  :pattern ((fun6 s@$ b@8@00 x@9@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (b@8@00 Bool) (x@9@00 $Ref)) (!
  true
  :pattern ((fun6 s@$ b@8@00 x@9@00))
  :qid |quant-u-21|)))
; ---------- FUNCTION fun3----------
(declare-fun x@11@00 () $Ref)
(declare-fun result@12@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  (= (fun3%limited s@$ x@11@00) (fun3 s@$ x@11@00))
  :pattern ((fun3 s@$ x@11@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  (fun3%stateless x@11@00)
  :pattern ((fun3%limited s@$ x@11@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P(x), write) in x.g)
(set-option :timeout 0)
(push) ; 2
(assert (P%trigger s@$ x@11@00))
(assert (not (= x@11@00 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and (P%trigger s@$ x@11@00) (not (= x@11@00 $Ref.null))))
(assert (= result@12@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  (=>
    (fun3%precondition s@$ x@11@00)
    (= (fun3 s@$ x@11@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((fun3 s@$ x@11@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  true
  :pattern ((fun3 s@$ x@11@00))
  :qid |quant-u-23|)))
; ---------- FUNCTION fun5----------
(declare-fun x@13@00 () $Ref)
(declare-fun result@14@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@13@00 $Ref)) (!
  (= (fun5%limited s@$ x@13@00) (fun5 s@$ x@13@00))
  :pattern ((fun5 s@$ x@13@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@13@00 $Ref)) (!
  (fun5%stateless x@13@00)
  :pattern ((fun5%limited s@$ x@13@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Q(x), write) in x.f + (x.h == null ? 0 : x.h.g))
(set-option :timeout 0)
(push) ; 2
(assert (Q%trigger s@$ x@13@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@13@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] x.h != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(s@$)) != Null | live]
; [else-branch: 3 | First:(Second:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
; [eval] x.f + (x.h == null ? 0 : x.h.g)
; [eval] (x.h == null ? 0 : x.h.g)
; [eval] x.h == null
(push) ; 4
; [then-branch: 4 | First:(Second:(s@$)) == Null | dead]
; [else-branch: 4 | First:(Second:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 4 | First:(Second:(s@$)) != Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
; [else-branch: 3 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] x.f + (x.h == null ? 0 : x.h.g)
; [eval] (x.h == null ? 0 : x.h.g)
; [eval] x.h == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(s@$)) == Null | live]
; [else-branch: 5 | First:(Second:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | First:(Second:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@23@00 ($Snap $Ref) Int)
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (=
    (joined_unfolding@23@00 s@$ x@13@00)
    (+
      ($SortWrappers.$SnapToInt ($Snap.first s@$))
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (=
    (joined_unfolding@23@00 s@$ x@13@00)
    ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
; Joined path conditions
(assert (and
  (Q%trigger s@$ x@13@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= x@13@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))))
; Joined path conditions
(assert (and
  (Q%trigger s@$ x@13@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= x@13@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second s@$)) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(assert (= result@14@00 (joined_unfolding@23@00 s@$ x@13@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@13@00 $Ref)) (!
  (=>
    (fun5%precondition s@$ x@13@00)
    (=
      (fun5 s@$ x@13@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)
          0
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))))
  :pattern ((fun5 s@$ x@13@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (x@13@00 $Ref)) (!
  true
  :pattern ((fun5 s@$ x@13@00))
  :qid |quant-u-25|)))
; ---------- FUNCTION err2----------
(declare-fun x@15@00 () $Ref)
(declare-fun result@16@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@15@00 $Ref.null)))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] err1(x) == 0
; [eval] err1(x)
(push) ; 2
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
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
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
(pop) ; 2
(pop) ; 1
; ---------- FUNCTION fun4----------
(declare-fun x@17@00 () $Ref)
(declare-fun y@18@00 () $Ref)
(declare-fun result@19@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@17@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] x == y
(assert (= x@17@00 y@18@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@17@00 $Ref) (y@18@00 $Ref)) (!
  (= (fun4%limited s@$ x@17@00 y@18@00) (fun4 s@$ x@17@00 y@18@00))
  :pattern ((fun4 s@$ x@17@00 y@18@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@17@00 $Ref) (y@18@00 $Ref)) (!
  (fun4%stateless x@17@00 y@18@00)
  :pattern ((fun4%limited s@$ x@17@00 y@18@00))
  :qid |quant-u-15|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@17@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (= x@17@00 y@18@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] y.f + (unfolding acc(P(x), write) in y.g)
; [eval] (unfolding acc(P(x), write) in y.g)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@18@00 x@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (P%trigger ($Snap.first ($Snap.second s@$)) x@17@00))
(pop) ; 2
; Joined path conditions
(assert (P%trigger ($Snap.first ($Snap.second s@$)) x@17@00))
(assert (=
  result@19@00
  (+
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@17@00 $Ref) (y@18@00 $Ref)) (!
  (=>
    (fun4%precondition s@$ x@17@00 y@18@00)
    (=
      (fun4 s@$ x@17@00 y@18@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
  :pattern ((fun4 s@$ x@17@00 y@18@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (x@17@00 $Ref) (y@18@00 $Ref)) (!
  true
  :pattern ((fun4 s@$ x@17@00 y@18@00))
  :qid |quant-u-27|)))
; ---------- FUNCTION fun1----------
(declare-fun x@20@00 () $Ref)
(declare-fun y@21@00 () $Ref)
(declare-fun result@22@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@20@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (not (= y@21@00 $Ref.null)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] x == y
(assert (= x@20@00 y@21@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@20@00 $Ref) (y@21@00 $Ref)) (!
  (= (fun1%limited s@$ x@20@00 y@21@00) (fun1 s@$ x@20@00 y@21@00))
  :pattern ((fun1 s@$ x@20@00 y@21@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@20@00 $Ref) (y@21@00 $Ref)) (!
  (fun1%stateless x@20@00 y@21@00)
  :pattern ((fun1%limited s@$ x@20@00 y@21@00))
  :qid |quant-u-17|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@20@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (not (= y@21@00 $Ref.null)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (= x@20@00 y@21@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] y.f + x.g
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@21@00 x@20@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@22@00
  (+
    ($SortWrappers.$SnapToInt ($Snap.first s@$))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@20@00 $Ref) (y@21@00 $Ref)) (!
  (=>
    (fun1%precondition s@$ x@20@00 y@21@00)
    (=
      (fun1 s@$ x@20@00 y@21@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
  :pattern ((fun1 s@$ x@20@00 y@21@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (x@20@00 $Ref) (y@21@00 $Ref)) (!
  true
  :pattern ((fun1 s@$ x@20@00 y@21@00))
  :qid |quant-u-29|)))
; ---------- P ----------
(declare-const x@24@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@25@00 Int)
(assert (not (= x@24@00 $Ref.null)))
(pop) ; 1
; ---------- Q ----------
(declare-const x@26@00 $Ref)
(push) ; 1
(declare-const $t@27@00 $Snap)
(assert (= $t@27@00 ($Snap.combine ($Snap.first $t@27@00) ($Snap.second $t@27@00))))
(assert (not (= x@26@00 $Ref.null)))
(assert (=
  ($Snap.second $t@27@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@00))
    ($Snap.second ($Snap.second $t@27@00)))))
; [eval] x.h != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@27@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@27@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:($t@27@00)) != Null | live]
; [else-branch: 6 | First:(Second:($t@27@00)) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 6 | First:(Second:($t@27@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@27@00))) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 6 | First:(Second:($t@27@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@27@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@27@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
