(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:18
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0042.vpr
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
(declare-fun size ($Snap $Ref) Int)
(declare-fun size%limited ($Snap $Ref) Int)
(declare-fun size%stateless ($Ref) Bool)
(declare-fun size%precondition ($Snap $Ref) Bool)
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
(declare-fun $k@2@00 () $Perm)
(declare-fun joined_unfolding@7@00 ($Snap $Ref) Int)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(assert (forall ((s@$ $Snap) (list@0@00 $Ref)) (!
  (= (size%limited s@$ list@0@00) (size s@$ list@0@00))
  :pattern ((size s@$ list@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (list@0@00 $Ref)) (!
  (size%stateless list@0@00)
  :pattern ((size%limited s@$ list@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (list@0@00 $Ref)) (!
  (let ((result@1@00 (size%limited s@$ list@0@00))) (and
    ($Perm.isReadVar $k@2@00)
    (=> (size%precondition s@$ list@0@00) (>= result@1@00 1))))
  :pattern ((size%limited s@$ list@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (list@0@00 $Ref)) (!
  (let ((result@1@00 (size%limited s@$ list@0@00))) true)
  :pattern ((size%limited s@$ list@0@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (list@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@2@00)
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    (=>
      (size%precondition s@$ list@0@00)
      (=
        (size s@$ list@0@00)
        (ite
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
          1
          (+
            1
            (size%limited ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))))
  :pattern ((size s@$ list@0@00))
  :pattern ((size%stateless list@0@00) (valid%trigger s@$ list@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (list@0@00 $Ref)) (!
  (=>
    (size%precondition s@$ list@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
      true
      (size%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
  :pattern ((size s@$ list@0@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- testFails1 ----------
(declare-const list@0@01 $Ref)
(declare-const list@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert list != null
; [eval] list != null
(push) ; 3
(assert (not (not (= list@1@01 $Ref.null))))
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
; [eval] list != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= list@1@01 $Ref.null))))
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
; [eval] list != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= list@1@01 $Ref.null))))
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
; [eval] list != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= list@1@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- testFails2 ----------
(declare-const list@2@01 $Ref)
(declare-const list@3@01 $Ref)
(push) ; 1
(declare-const $k@4@01 $Perm)
(assert ($Perm.isReadVar $k@4@01))
(declare-const $t@5@01 $Snap)
(assert (<= $Perm.No $k@4@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert list != null
; [eval] list != null
(push) ; 3
(assert (not (not (= list@3@01 $Ref.null))))
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
; [eval] list != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= list@3@01 $Ref.null))))
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
; [eval] list != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= list@3@01 $Ref.null))))
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
; [eval] list != null
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= list@3@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- testSuccess1 ----------
(declare-const list@6@01 $Ref)
(declare-const list@7@01 $Ref)
(push) ; 1
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(declare-const $t@9@01 $Ref)
(assert (<= $Perm.No $k@8@01))
(assert (<= $k@8@01 $Perm.Write))
(assert (=> (< $Perm.No $k@8@01) (not (= list@7@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert list != null
; [eval] list != null
(push) ; 3
(assert (not (not (= list@7@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= list@7@01 $Ref.null)))
(pop) ; 2
(pop) ; 1
; ---------- testSuccess2 ----------
(declare-const list@10@01 $Ref)
(declare-const list@11@01 $Ref)
(push) ; 1
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(declare-const $t@13@01 $Snap)
(assert (<= $Perm.No $k@12@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(valid(list), wildcard)
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@12@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@14@01 $k@12@01))
(assert (<= $Perm.No (- $k@12@01 $k@14@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (<= $Perm.No $k@14@01))
(assert (<= $k@14@01 $Perm.Write))
(assert (=> (< $Perm.No $k@14@01) (not (= list@11@01 $Ref.null))))
; [eval] list.next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@13@01) != Null | live]
; [else-branch: 0 | First:($t@13@01) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:($t@13@01) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= list@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@13@01 list@11@01))
; [exec]
; assert list != null
; [eval] list != null
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= list@11@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= list@11@01 $Ref.null)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:($t@13@01) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)) $Ref.null))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid%trigger $t@13@01 list@11@01))
; [exec]
; assert list != null
; [eval] list != null
(set-option :timeout 0)
(push) ; 4
(assert (not (not (= list@11@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= list@11@01 $Ref.null)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
