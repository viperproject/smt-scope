(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0114.vpr
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
(declare-sort D 0)
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
(declare-fun $SortWrappers.DTo$Snap (D) $Snap)
(declare-fun $SortWrappers.$SnapToD ($Snap) D)
(assert (forall ((x D)) (!
    (= x ($SortWrappers.$SnapToD($SortWrappers.DTo$Snap x)))
    :pattern (($SortWrappers.DTo$Snap x))
    :qid |$Snap.$SnapToDTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DTo$Snap($SortWrappers.$SnapToD x)))
    :pattern (($SortWrappers.$SnapToD x))
    :qid |$Snap.DTo$SnapToD|
    )))
; ////////// Symbols
(declare-fun fun3<Bool> (Int) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun2 ($Snap Bool $Ref $Ref Int) Int)
(declare-fun fun2%limited ($Snap Bool $Ref $Ref Int) Int)
(declare-fun fun2%stateless (Bool $Ref $Ref Int) Bool)
(declare-fun fun2%precondition ($Snap Bool $Ref $Ref Int) Bool)
(declare-fun fun1 ($Snap Int) Int)
(declare-fun fun1%limited ($Snap Int) Int)
(declare-fun fun1%stateless (Int) Bool)
(declare-fun fun1%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref Bool) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION fun2----------
(declare-fun b@0@00 () Bool)
(declare-fun x@1@00 () $Ref)
(declare-fun y@2@00 () $Ref)
(declare-fun j@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(push) ; 2
(set-option :timeout 10)
(assert (not (not b@0@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not b@0@00))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@0@00 | live]
; [else-branch: 0 | !(b@0@00) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | b@0@00]
(assert b@0@00)
(assert (not (= x@1@00 $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 0 | !(b@0@00)]
(assert (not b@0@00))
(assert (not (= y@2@00 $Ref.null)))
(pop) ; 2
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@0@00 Bool) (x@1@00 $Ref) (y@2@00 $Ref) (j@3@00 Int)) (!
  (=
    (fun2%limited s@$ b@0@00 x@1@00 y@2@00 j@3@00)
    (fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :pattern ((fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (b@0@00 Bool) (x@1@00 $Ref) (y@2@00 $Ref) (j@3@00 Int)) (!
  (fun2%stateless b@0@00 x@1@00 y@2@00 j@3@00)
  :pattern ((fun2%limited s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert b@0@00)
(assert (not (= x@1@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@4@00 10))
(pop) ; 1
(set-option :timeout 0)
(push) ; 1
(assert (not b@0@00))
(assert (not (= y@2@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@4@00 10))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@0@00 Bool) (x@1@00 $Ref) (y@2@00 $Ref) (j@3@00 Int)) (!
  (=>
    (fun2%precondition s@$ b@0@00 x@1@00 y@2@00 j@3@00)
    (= (fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00) 10))
  :pattern ((fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (b@0@00 Bool) (x@1@00 $Ref) (y@2@00 $Ref) (j@3@00 Int)) (!
  true
  :pattern ((fun2 s@$ b@0@00 x@1@00 y@2@00 j@3@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION fun1----------
(declare-fun j@5@00 () Int)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (j@5@00 Int)) (!
  (= (fun1%limited s@$ j@5@00) (fun1 s@$ j@5@00))
  :pattern ((fun1 s@$ j@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (j@5@00 Int)) (!
  (fun1%stateless j@5@00)
  :pattern ((fun1%limited s@$ j@5@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@6@00 10))
(pop) ; 1
(assert (forall ((s@$ $Snap) (j@5@00 Int)) (!
  (=> (fun1%precondition s@$ j@5@00) (= (fun1 s@$ j@5@00) 10))
  :pattern ((fun1 s@$ j@5@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (j@5@00 Int)) (!
  true
  :pattern ((fun1 s@$ j@5@00))
  :qid |quant-u-7|)))
; ---------- P ----------
(declare-const x@7@00 $Ref)
(declare-const b@8@00 Bool)
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
; [then-branch: 1 | b@8@00 | live]
; [else-branch: 1 | !(b@8@00) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 1 | b@8@00]
(assert b@8@00)
(declare-const $t@9@00 Int)
(assert (not (= x@7@00 $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 1 | !(b@8@00)]
(assert (not b@8@00))
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
