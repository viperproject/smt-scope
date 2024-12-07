(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0118.vpr
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
(declare-fun Nodelen ($Snap $Ref) Int)
(declare-fun Nodelen%limited ($Snap $Ref) Int)
(declare-fun Nodelen%stateless ($Ref) Bool)
(declare-fun Nodelen%precondition ($Snap $Ref) Bool)
(declare-fun Listlen ($Snap $Ref) Int)
(declare-fun Listlen%limited ($Snap $Ref) Int)
(declare-fun Listlen%stateless ($Ref) Bool)
(declare-fun Listlen%precondition ($Snap $Ref) Bool)
(declare-fun Nodeget ($Snap $Ref Int) Int)
(declare-fun Nodeget%limited ($Snap $Ref Int) Int)
(declare-fun Nodeget%stateless ($Ref Int) Bool)
(declare-fun Nodeget%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Nodeinv%trigger ($Snap $Ref) Bool)
(declare-fun Listinv%trigger ($Snap $Ref) Bool)
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
(declare-fun $k@7@00 () $Perm)
(declare-fun joined_unfolding@12@00 ($Snap $Ref) Int)
(declare-fun $k@9@00 () $Perm)
(declare-fun $k@10@00 () $Perm)
(declare-fun $k@11@00 () $Perm)
(declare-fun $k@13@00 () $Perm)
(declare-fun joined_unfolding@18@00 ($Snap $Ref) Int)
(declare-fun $k@15@00 () $Perm)
(declare-fun $k@16@00 () $Perm)
(declare-fun $k@17@00 () $Perm)
(declare-fun $k@19@00 () $Perm)
(declare-fun $k@20@00 () $Perm)
(declare-fun joined_unfolding@25@00 ($Snap $Ref Int) Int)
(declare-fun $k@21@00 () $Perm)
(declare-fun $k@22@00 () $Perm)
(declare-fun $k@23@00 () $Perm)
(declare-fun $k@24@00 () $Perm)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (Nodelen%limited s@$ this@0@00) (Nodelen s@$ this@0@00))
  :pattern ((Nodelen s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (Nodelen%stateless this@0@00)
  :pattern ((Nodelen%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (Nodelen%limited s@$ this@0@00))) (and
    ($Perm.isReadVar $k@7@00)
    (=> (Nodelen%precondition s@$ this@0@00) (> result@1@00 0))))
  :pattern ((Nodelen%limited s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (Nodelen%limited s@$ this@0@00))) true)
  :pattern ((Nodelen%limited s@$ this@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@7@00)
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@11@00)
    (=>
      (Nodelen%precondition s@$ this@0@00)
      (=
        (Nodelen s@$ this@0@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
            $Ref.null)
          1
          (+
            1
            (Nodelen%limited ($Snap.combine
              $Snap.unit
              ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((Nodelen s@$ this@0@00))
  :pattern ((Nodelen%stateless this@0@00) (Nodeinv%trigger ($Snap.second s@$) this@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (Nodelen%precondition s@$ this@0@00)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null)
      true
      (Nodelen%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((Nodelen s@$ this@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (Listlen%limited s@$ this@2@00) (Listlen s@$ this@2@00))
  :pattern ((Listlen s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (Listlen%stateless this@2@00)
  :pattern ((Listlen%limited s@$ this@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (Listlen%limited s@$ this@2@00))) (and
    ($Perm.isReadVar $k@13@00)
    (=> (Listlen%precondition s@$ this@2@00) (>= result@3@00 0))))
  :pattern ((Listlen%limited s@$ this@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (Listlen%limited s@$ this@2@00))) true)
  :pattern ((Listlen%limited s@$ this@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@15@00)
    ($Perm.isReadVar $k@16@00)
    ($Perm.isReadVar $k@17@00)
    (=>
      (Listlen%precondition s@$ this@2@00)
      (=
        (Listlen s@$ this@2@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)
          0
          (Nodelen ($Snap.combine $Snap.unit ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((Listlen s@$ this@2@00))
  :pattern ((Listlen%stateless this@2@00) (Listinv%trigger ($Snap.second s@$) this@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (=>
    (Listlen%precondition s@$ this@2@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (Nodelen%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((Listlen s@$ this@2@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref) (i@5@00 Int)) (!
  (= (Nodeget%limited s@$ this@4@00 i@5@00) (Nodeget s@$ this@4@00 i@5@00))
  :pattern ((Nodeget s@$ this@4@00 i@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref) (i@5@00 Int)) (!
  (Nodeget%stateless this@4@00 i@5@00)
  :pattern ((Nodeget%limited s@$ this@4@00 i@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref) (i@5@00 Int)) (!
  (and
    ($Perm.isReadVar $k@19@00)
    ($Perm.isReadVar $k@20@00)
    ($Perm.isReadVar $k@21@00)
    ($Perm.isReadVar $k@22@00)
    ($Perm.isReadVar $k@23@00)
    ($Perm.isReadVar $k@24@00)
    (=>
      (Nodeget%precondition s@$ this@4@00 i@5@00)
      (=
        (Nodeget s@$ this@4@00 i@5@00)
        (ite
          (= i@5@00 0)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second s@$))))
          (Nodeget%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
              ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
            i@5@00
            1))))))
  :pattern ((Nodeget s@$ this@4@00 i@5@00))
  :pattern ((Nodeget%stateless this@4@00 i@5@00) (Nodeinv%trigger ($Snap.first ($Snap.second s@$)) this@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref) (i@5@00 Int)) (!
  (=>
    (Nodeget%precondition s@$ this@4@00 i@5@00)
    (ite
      (= i@5@00 0)
      true
      (Nodeget%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
          ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))) (-
        i@5@00
        1))))
  :pattern ((Nodeget s@$ this@4@00 i@5@00))
  :qid |quant-u-15|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
