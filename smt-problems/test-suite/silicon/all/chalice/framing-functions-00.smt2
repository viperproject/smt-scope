(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/framing-functions.vpr
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
(declare-fun itemAt ($Snap $Ref Int) Int)
(declare-fun itemAt%limited ($Snap $Ref Int) Int)
(declare-fun itemAt%stateless ($Ref Int) Bool)
(declare-fun itemAt%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@3@00 ($Snap $Ref Int) Int)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (= (itemAt%limited s@$ this@0@00 i@1@00) (itemAt s@$ this@0@00 i@1@00))
  :pattern ((itemAt s@$ this@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (itemAt%stateless this@0@00 i@1@00)
  :pattern ((itemAt%limited s@$ this@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (=>
    (itemAt%precondition s@$ this@0@00 i@1@00)
    (=
      (itemAt s@$ this@0@00 i@1@00)
      (ite
        (or
          (= i@1@00 0)
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
            $Ref.null))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
        (itemAt%limited ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
          i@1@00
          1)))))
  :pattern ((itemAt s@$ this@0@00 i@1@00))
  :pattern ((itemAt%stateless this@0@00 i@1@00) (valid%trigger ($Snap.first s@$) this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (i@1@00 Int)) (!
  (=>
    (itemAt%precondition s@$ this@0@00 i@1@00)
    (ite
      (or
        (= i@1@00 0)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          $Ref.null))
      true
      (itemAt%precondition ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.first s@$)))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) (-
        i@1@00
        1))))
  :pattern ((itemAt s@$ this@0@00 i@1@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- set ----------
(declare-const this@0@01 $Ref)
(declare-const x@1@01 Int)
(declare-const y@2@01 Int)
(declare-const this@3@01 $Ref)
(declare-const x@4@01 Int)
(declare-const y@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
; ---------- M ----------
(declare-const this@8@01 $Ref)
(declare-const x@9@01 $Ref)
(declare-const y@10@01 $Ref)
(declare-const this@11@01 $Ref)
(declare-const x@12@01 $Ref)
(declare-const y@13@01 $Ref)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@12@01 $Ref.null)))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] y != null
(assert (not (= y@13@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@14@01))) $Snap.unit))
; [eval] x != y
(assert (not (= x@12@01 y@13@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@12@01 y@13@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@15@01 Int)
; [exec]
; var j: Int
(declare-const j@16@01 Int)
; [exec]
; i := itemAt(x, 0)
; [eval] itemAt(x, 0)
(push) ; 3
; [eval] 0 <= i
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
  $Snap.unit) x@12@01 0))
(pop) ; 3
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
  $Snap.unit) x@12@01 0))
(declare-const i@17@01 Int)
(assert (=
  i@17@01
  (itemAt ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    $Snap.unit) x@12@01 0)))
; [exec]
; j := itemAt(y, 0)
; [eval] itemAt(y, 0)
(push) ; 3
; [eval] 0 <= i
(assert (itemAt%precondition ($Snap.combine
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
  $Snap.unit) y@13@01 0))
(pop) ; 3
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
  $Snap.unit) y@13@01 0))
(declare-const j@18@01 Int)
(assert (=
  j@18@01
  (itemAt ($Snap.combine
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    $Snap.unit) y@13@01 0)))
; [exec]
; set(y, 0, 10)
(declare-const $t@19@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@12@01 y@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert i == itemAt(x, 0)
; [eval] i == itemAt(x, 0)
; [eval] itemAt(x, 0)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
(pop) ; 3
; Joined path conditions
; [exec]
; assert j == itemAt(y, 0)
; [eval] j == itemAt(y, 0)
; [eval] itemAt(y, 0)
(push) ; 3
; [eval] 0 <= i
(assert (itemAt%precondition ($Snap.combine $t@19@01 $Snap.unit) y@13@01 0))
(pop) ; 3
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine $t@19@01 $Snap.unit) y@13@01 0))
(push) ; 3
(assert (not (= j@18@01 (itemAt ($Snap.combine $t@19@01 $Snap.unit) y@13@01 0))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@13@01 x@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    $t@19@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    $t@19@01
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] j == itemAt(y, 0)
; [eval] itemAt(y, 0)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= j@18@01 (itemAt ($Snap.combine $t@19@01 $Snap.unit) y@13@01 0))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@13@01 x@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    $t@19@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    $t@19@01
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] j == itemAt(y, 0)
; [eval] itemAt(y, 0)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= j@18@01 (itemAt ($Snap.combine $t@19@01 $Snap.unit) y@13@01 0))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@13@01 x@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    $t@19@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    $t@19@01
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] j == itemAt(y, 0)
; [eval] itemAt(y, 0)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= j@18@01 (itemAt ($Snap.combine $t@19@01 $Snap.unit) y@13@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
