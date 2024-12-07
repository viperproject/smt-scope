(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/test_fibonacci.vpr
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
(declare-fun Fib__fib ($Snap Int) Int)
(declare-fun Fib__fib%limited ($Snap Int) Int)
(declare-fun Fib__fib%stateless (Int) Bool)
(declare-fun Fib__fib%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Fib__joinToken%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION Fib__fib----------
(declare-fun n@0@00 () Int)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (= (Fib__fib%limited s@$ n@0@00) (Fib__fib s@$ n@0@00))
  :pattern ((Fib__fib s@$ n@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (Fib__fib%stateless n@0@00)
  :pattern ((Fib__fib%limited s@$ n@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (n < 2 ? 1 : Fib__fib(n - 1) + Fib__fib(n - 2))
; [eval] n < 2
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< n@0@00 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< n@0@00 2)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | n@0@00 < 2 | live]
; [else-branch: 0 | !(n@0@00 < 2) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | n@0@00 < 2]
(assert (< n@0@00 2))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(n@0@00 < 2)]
(assert (not (< n@0@00 2)))
; [eval] Fib__fib(n - 1) + Fib__fib(n - 2)
; [eval] Fib__fib(n - 1)
; [eval] n - 1
(push) ; 4
(assert (Fib__fib%precondition $Snap.unit (- n@0@00 1)))
(pop) ; 4
; Joined path conditions
(assert (Fib__fib%precondition $Snap.unit (- n@0@00 1)))
; [eval] Fib__fib(n - 2)
; [eval] n - 2
(push) ; 4
(assert (Fib__fib%precondition $Snap.unit (- n@0@00 2)))
(pop) ; 4
; Joined path conditions
(assert (Fib__fib%precondition $Snap.unit (- n@0@00 2)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (< n@0@00 2))
  (and
    (not (< n@0@00 2))
    (Fib__fib%precondition $Snap.unit (- n@0@00 1))
    (Fib__fib%precondition $Snap.unit (- n@0@00 2)))))
(assert (or (not (< n@0@00 2)) (< n@0@00 2)))
(assert (=
  result@1@00
  (ite
    (< n@0@00 2)
    1
    (+ (Fib__fib $Snap.unit (- n@0@00 1)) (Fib__fib $Snap.unit (- n@0@00 2))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (=>
    (Fib__fib%precondition s@$ n@0@00)
    (=
      (Fib__fib s@$ n@0@00)
      (ite
        (< n@0@00 2)
        1
        (+
          (Fib__fib%limited $Snap.unit (- n@0@00 1))
          (Fib__fib%limited $Snap.unit (- n@0@00 2))))))
  :pattern ((Fib__fib s@$ n@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (=>
    (Fib__fib%precondition s@$ n@0@00)
    (ite
      (< n@0@00 2)
      true
      (and
        (Fib__fib%precondition $Snap.unit (- n@0@00 1))
        (Fib__fib%precondition $Snap.unit (- n@0@00 2)))))
  :pattern ((Fib__fib s@$ n@0@00))
  :qid |quant-u-3|)))
; ---------- Fib__joinToken ----------
(declare-const diz@2@00 $Ref)
