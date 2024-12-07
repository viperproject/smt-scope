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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@23@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (y@3@00 $Ref)) (!
  (= (er3%limited s@$ x@2@00 y@3@00) (er3 s@$ x@2@00 y@3@00))
  :pattern ((er3 s@$ x@2@00 y@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (y@3@00 $Ref)) (!
  (er3%stateless x@2@00 y@3@00)
  :pattern ((er3%limited s@$ x@2@00 y@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (y@6@00 $Ref)) (!
  (= (fun2%limited s@$ x@5@00 y@6@00) (fun2 s@$ x@5@00 y@6@00))
  :pattern ((fun2 s@$ x@5@00 y@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (y@6@00 $Ref)) (!
  (fun2%stateless x@5@00 y@6@00)
  :pattern ((fun2%limited s@$ x@5@00 y@6@00))
  :qid |quant-u-5|)))
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
(assert (forall ((s@$ $Snap) (b@8@00 Bool) (x@9@00 $Ref)) (!
  (= (fun6%limited s@$ b@8@00 x@9@00) (fun6 s@$ b@8@00 x@9@00))
  :pattern ((fun6 s@$ b@8@00 x@9@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (b@8@00 Bool) (x@9@00 $Ref)) (!
  (fun6%stateless b@8@00 x@9@00)
  :pattern ((fun6%limited s@$ b@8@00 x@9@00))
  :qid |quant-u-7|)))
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
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  (= (fun3%limited s@$ x@11@00) (fun3 s@$ x@11@00))
  :pattern ((fun3 s@$ x@11@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  (fun3%stateless x@11@00)
  :pattern ((fun3%limited s@$ x@11@00))
  :qid |quant-u-9|)))
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
(assert (forall ((s@$ $Snap) (x@13@00 $Ref)) (!
  (= (fun5%limited s@$ x@13@00) (fun5 s@$ x@13@00))
  :pattern ((fun5 s@$ x@13@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@13@00 $Ref)) (!
  (fun5%stateless x@13@00)
  :pattern ((fun5%limited s@$ x@13@00))
  :qid |quant-u-11|)))
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
(assert (forall ((s@$ $Snap) (x@17@00 $Ref) (y@18@00 $Ref)) (!
  (= (fun4%limited s@$ x@17@00 y@18@00) (fun4 s@$ x@17@00 y@18@00))
  :pattern ((fun4 s@$ x@17@00 y@18@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@17@00 $Ref) (y@18@00 $Ref)) (!
  (fun4%stateless x@17@00 y@18@00)
  :pattern ((fun4%limited s@$ x@17@00 y@18@00))
  :qid |quant-u-15|)))
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
(assert (forall ((s@$ $Snap) (x@20@00 $Ref) (y@21@00 $Ref)) (!
  (= (fun1%limited s@$ x@20@00 y@21@00) (fun1 s@$ x@20@00 y@21@00))
  :pattern ((fun1 s@$ x@20@00 y@21@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@20@00 $Ref) (y@21@00 $Ref)) (!
  (fun1%stateless x@20@00 y@21@00)
  :pattern ((fun1%limited s@$ x@20@00 y@21@00))
  :qid |quant-u-17|)))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
