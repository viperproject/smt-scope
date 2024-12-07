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
; ---------- FUNCTION fun4----------
(declare-fun x@0@00 () $Ref)
(declare-fun y@1@00 () $Ref)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref)) (!
  (= (fun4%limited s@$ x@0@00 y@1@00) (fun4 s@$ x@0@00 y@1@00))
  :pattern ((fun4 s@$ x@0@00 y@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref)) (!
  (fun4%stateless x@0@00 y@1@00)
  :pattern ((fun4%limited s@$ x@0@00 y@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(FF(x, y), write) in x.f)
(set-option :timeout 0)
(push) ; 2
(assert (FF%trigger s@$ x@0@00 y@1@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= x@0@00 $Ref.null)))
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@0@00 y@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@1@00 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and
  (FF%trigger s@$ x@0@00 y@1@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= x@0@00 $Ref.null))
  (not (= y@1@00 $Ref.null))))
(assert (= result@2@00 ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(pop) ; 1
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
; ---------- FUNCTION fun3----------
(declare-fun x@3@00 () $Ref)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  (= (fun3%limited s@$ x@3@00) (fun3 s@$ x@3@00))
  :pattern ((fun3 s@$ x@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref)) (!
  (fun3%stateless x@3@00)
  :pattern ((fun3%limited s@$ x@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(F(x), write) in x.f)
(set-option :timeout 0)
(push) ; 2
(assert (F%trigger s@$ x@3@00))
(assert (not (= x@3@00 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and (F%trigger s@$ x@3@00) (not (= x@3@00 $Ref.null))))
(assert (= result@4@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
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
; ---------- F ----------
(declare-const x@5@00 $Ref)
(push) ; 1
(declare-const $t@6@00 Int)
(assert (not (= x@5@00 $Ref.null)))
(pop) ; 1
; ---------- G ----------
(declare-const x@7@00 $Ref)
(push) ; 1
(declare-const $t@8@00 Int)
(assert (not (= x@7@00 $Ref.null)))
(pop) ; 1
; ---------- FF ----------
(declare-const x@9@00 $Ref)
(declare-const y@10@00 $Ref)
(push) ; 1
(declare-const $t@11@00 $Snap)
(assert (= $t@11@00 ($Snap.combine ($Snap.first $t@11@00) ($Snap.second $t@11@00))))
(assert (not (= x@9@00 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@9@00 y@10@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@10@00 $Ref.null)))
(pop) ; 1
