(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0276.vpr
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
(declare-fun f ($Snap Int Int) Bool)
(declare-fun f%limited ($Snap Int Int) Bool)
(declare-fun f%stateless (Int Int) Bool)
(declare-fun f%precondition ($Snap Int Int) Bool)
(declare-fun m ($Snap Int) Int)
(declare-fun m%limited ($Snap Int) Int)
(declare-fun m%stateless (Int) Bool)
(declare-fun m%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION f----------
(declare-fun a@0@00 () Int)
(declare-fun b@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int)) (!
  (= (f%limited s@$ a@0@00 b@1@00) (f s@$ a@0@00 b@1@00))
  :pattern ((f s@$ a@0@00 b@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int)) (!
  (f%stateless a@0@00 b@1@00)
  :pattern ((f%limited s@$ a@0@00 b@1@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION m----------
(declare-fun a@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall b: Int :: { f(a, b) } f(a, b))
(declare-const b@5@00 Int)
(push) ; 2
; [eval] f(a, b)
(push) ; 3
(assert (f%precondition $Snap.unit a@3@00 b@5@00))
(pop) ; 3
; Joined path conditions
(assert (f%precondition $Snap.unit a@3@00 b@5@00))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((b@5@00 Int)) (!
  (f%precondition $Snap.unit a@3@00 b@5@00)
  :pattern ((f%limited $Snap.unit a@3@00 b@5@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45-aux|)))
(assert (forall ((b@5@00 Int)) (!
  (f $Snap.unit a@3@00 b@5@00)
  :pattern ((f%limited $Snap.unit a@3@00 b@5@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@3@00 Int)) (!
  (= (m%limited s@$ a@3@00) (m s@$ a@3@00))
  :pattern ((m s@$ a@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@3@00 Int)) (!
  (m%stateless a@3@00)
  :pattern ((m%limited s@$ a@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (forall ((b@5@00 Int)) (!
  (f%precondition $Snap.unit a@3@00 b@5@00)
  :pattern ((f%limited $Snap.unit a@3@00 b@5@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45-aux|)))
(assert (forall ((b@5@00 Int)) (!
  (f $Snap.unit a@3@00 b@5@00)
  :pattern ((f%limited $Snap.unit a@3@00 b@5@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0276.vpr@7@12@7@45|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@4@00 14))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@3@00 Int)) (!
  (=> (m%precondition s@$ a@3@00) (= (m s@$ a@3@00) 14))
  :pattern ((m s@$ a@3@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (a@3@00 Int)) (!
  true
  :pattern ((m s@$ a@3@00))
  :qid |quant-u-5|)))
