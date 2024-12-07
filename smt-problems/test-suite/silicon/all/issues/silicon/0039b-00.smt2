(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:13
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0039b.vpr
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
(declare-fun Node_size ($Snap $Ref) Int)
(declare-fun Node_size%limited ($Snap $Ref) Int)
(declare-fun Node_size%stateless ($Ref) Bool)
(declare-fun Node_size%precondition ($Snap $Ref) Bool)
(declare-fun Node_val ($Snap $Ref) Int)
(declare-fun Node_val%limited ($Snap $Ref) Int)
(declare-fun Node_val%stateless ($Ref) Bool)
(declare-fun Node_val%precondition ($Snap $Ref) Bool)
(declare-fun List_size ($Snap $Ref) Int)
(declare-fun List_size%limited ($Snap $Ref) Int)
(declare-fun List_size%stateless ($Ref) Bool)
(declare-fun List_size%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List_valid%trigger ($Snap $Ref) Bool)
(declare-fun Node_valid%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@7@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@8@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@10@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (Node_size%limited s@$ this@0@00) (Node_size s@$ this@0@00))
  :pattern ((Node_size s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (Node_size%stateless this@0@00)
  :pattern ((Node_size%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (Node_size%limited s@$ this@0@00))) (=>
    (Node_size%precondition s@$ this@0@00)
    (>= result@1@00 1)))
  :pattern ((Node_size%limited s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (Node_size%limited s@$ this@0@00))) true)
  :pattern ((Node_size%limited s@$ this@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (Node_size%precondition s@$ this@0@00)
    (=
      (Node_size s@$ this@0@00)
      (+
        1
        (ite
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null))
          (Node_size%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
          0))))
  :pattern ((Node_size s@$ this@0@00))
  :pattern ((Node_size%stateless this@0@00) (Node_valid%trigger s@$ this@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (Node_size%precondition s@$ this@0@00)
    (ite
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (Node_size%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      true))
  :pattern ((Node_size s@$ this@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (Node_val%limited s@$ this@2@00) (Node_val s@$ this@2@00))
  :pattern ((Node_val s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (Node_val%stateless this@2@00)
  :pattern ((Node_val%limited s@$ this@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (=>
    (Node_val%precondition s@$ this@2@00)
    (= (Node_val s@$ this@2@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((Node_val s@$ this@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  true
  :pattern ((Node_val s@$ this@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (= (List_size%limited s@$ this@4@00) (List_size s@$ this@4@00))
  :pattern ((List_size s@$ this@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (List_size%stateless this@4@00)
  :pattern ((List_size%limited s@$ this@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (let ((result@5@00 (List_size%limited s@$ this@4@00))) (=>
    (List_size%precondition s@$ this@4@00)
    (>= result@5@00 0)))
  :pattern ((List_size%limited s@$ this@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (let ((result@5@00 (List_size%limited s@$ this@4@00))) true)
  :pattern ((List_size%limited s@$ this@4@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (=>
    (List_size%precondition s@$ this@4@00)
    (=
      (List_size s@$ this@4@00)
      (ite
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
        0
        (Node_size ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))
  :pattern ((List_size s@$ this@4@00))
  :pattern ((List_size%stateless this@4@00) (List_valid%trigger s@$ this@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (=>
    (List_size%precondition s@$ this@4@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
      true
      (Node_size%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
  :pattern ((List_size s@$ this@4@00))
  :qid |quant-u-15|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- List_test ----------
(declare-const this@0@01 $Ref)
(declare-const i@1@01 Int)
(declare-const this@2@01 $Ref)
(declare-const i@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] i >= 0
(assert (>= i@3@01 0))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
; [eval] i < List_size(this)
; [eval] List_size(this)
(push) ; 2
(assert (List_size%precondition ($Snap.first $t@4@01) this@2@01))
(pop) ; 2
; Joined path conditions
(assert (List_size%precondition ($Snap.first $t@4@01) this@2@01))
(assert (< i@3@01 (List_size ($Snap.first $t@4@01) this@2@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; assert List_size(this) == 1
; [eval] List_size(this) == 1
; [eval] List_size(this)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (List_size ($Snap.first $t@4@01) this@2@01) 1)))
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
; [eval] List_size(this) == 1
; [eval] List_size(this)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (List_size ($Snap.first $t@4@01) this@2@01) 1)))
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
; [eval] List_size(this) == 1
; [eval] List_size(this)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (List_size ($Snap.first $t@4@01) this@2@01) 1)))
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
; [eval] List_size(this) == 1
; [eval] List_size(this)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (List_size ($Snap.first $t@4@01) this@2@01) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
