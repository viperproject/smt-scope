(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:39
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/annotation/annotationSuccess.vpr
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
(declare-sort MyType 0)
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
(declare-fun $SortWrappers.MyTypeTo$Snap (MyType) $Snap)
(declare-fun $SortWrappers.$SnapToMyType ($Snap) MyType)
(assert (forall ((x MyType)) (!
    (= x ($SortWrappers.$SnapToMyType($SortWrappers.MyTypeTo$Snap x)))
    :pattern (($SortWrappers.MyTypeTo$Snap x))
    :qid |$Snap.$SnapToMyTypeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MyTypeTo$Snap($SortWrappers.$SnapToMyType x)))
    :pattern (($SortWrappers.$SnapToMyType x))
    :qid |$Snap.MyTypeTo$SnapToMyType|
    )))
; ////////// Symbols
(declare-fun id<MyType> (MyType) MyType)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun01 ($Snap $Ref $Ref Bool) Int)
(declare-fun fun01%limited ($Snap $Ref $Ref Bool) Int)
(declare-fun fun01%stateless ($Ref $Ref Bool) Bool)
(declare-fun fun01%precondition ($Snap $Ref $Ref Bool) Bool)
(declare-fun fun02 ($Snap $Ref $Ref Bool) Int)
(declare-fun fun02%limited ($Snap $Ref $Ref Bool) Int)
(declare-fun fun02%stateless ($Ref $Ref Bool) Bool)
(declare-fun fun02%precondition ($Snap $Ref $Ref Bool) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert true)
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION fun01----------
(declare-fun x@0@00 () $Ref)
(declare-fun y@1@00 () $Ref)
(declare-fun b@2@00 () Bool)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(push) ; 2
(set-option :timeout 10)
(assert (not (not b@2@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not b@2@00))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@2@00 | live]
; [else-branch: 0 | !(b@2@00) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | b@2@00]
(assert b@2@00)
(assert (not (= x@0@00 $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 0 | !(b@2@00)]
(assert (not b@2@00))
(assert (not (= y@1@00 $Ref.null)))
(pop) ; 2
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref) (b@2@00 Bool)) (!
  (= (fun01%limited s@$ x@0@00 y@1@00 b@2@00) (fun01 s@$ x@0@00 y@1@00 b@2@00))
  :pattern ((fun01 s@$ x@0@00 y@1@00 b@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 $Ref) (b@2@00 Bool)) (!
  (fun01%stateless x@0@00 y@1@00 b@2@00)
  :pattern ((fun01%limited s@$ x@0@00 y@1@00 b@2@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION fun02----------
(declare-fun x@4@00 () $Ref)
(declare-fun y@5@00 () $Ref)
(declare-fun b@6@00 () Bool)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
; [eval] (b ? write : none)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@6@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@6@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@6@00 | live]
; [else-branch: 1 | !(b@6@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | b@6@00]
(assert b@6@00)
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(b@6@00)]
(assert (not b@6@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not b@6@00) b@6@00))
(push) ; 2
(assert (not (or (= (ite b@6@00 $Perm.Write $Perm.No) $Perm.No) b@6@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (ite b@6@00 $Perm.Write $Perm.No)))
(assert (<= (ite b@6@00 $Perm.Write $Perm.No) $Perm.Write))
(assert (=> b@6@00 (not (= x@4@00 $Ref.null))))
; [eval] (!b ? write : none)
; [eval] !b
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not b@6@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@6@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | !(b@6@00) | live]
; [else-branch: 2 | b@6@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | !(b@6@00)]
(assert (not b@6@00))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | b@6@00]
(assert b@6@00)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or b@6@00 (not b@6@00)))
(push) ; 2
(assert (not (or (= (ite (not b@6@00) $Perm.Write $Perm.No) $Perm.No) (not b@6@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@4@00 y@5@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (ite (not b@6@00) $Perm.Write $Perm.No)))
(assert (<= (ite (not b@6@00) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (not b@6@00) (not (= y@5@00 $Ref.null))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 $Ref) (y@5@00 $Ref) (b@6@00 Bool)) (!
  (= (fun02%limited s@$ x@4@00 y@5@00 b@6@00) (fun02 s@$ x@4@00 y@5@00 b@6@00))
  :pattern ((fun02 s@$ x@4@00 y@5@00 b@6@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref) (y@5@00 $Ref) (b@6@00 Bool)) (!
  (fun02%stateless x@4@00 y@5@00 b@6@00)
  :pattern ((fun02%limited s@$ x@4@00 y@5@00 b@6@00))
  :qid |quant-u-3|)))
; ---------- P ----------
(declare-const x@8@00 $Ref)
