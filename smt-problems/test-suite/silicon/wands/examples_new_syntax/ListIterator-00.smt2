(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:33:21
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/examples_new_syntax/ListIterator.vpr
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
(declare-sort $MWSF 0)
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
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
    )))
; ////////// Symbols
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun Node_first ($Snap $Ref) $Ref)
(declare-fun Node_first%limited ($Snap $Ref) $Ref)
(declare-fun Node_first%stateless ($Ref) Bool)
(declare-fun Node_first%precondition ($Snap $Ref) Bool)
(declare-fun Node_rev_prev ($Snap $Ref) $Ref)
(declare-fun Node_rev_prev%limited ($Snap $Ref) $Ref)
(declare-fun Node_rev_prev%stateless ($Ref) Bool)
(declare-fun Node_rev_prev%precondition ($Snap $Ref) Bool)
(declare-fun Node_rev_next ($Snap $Ref) $Ref)
(declare-fun Node_rev_next%limited ($Snap $Ref) $Ref)
(declare-fun Node_rev_next%stateless ($Ref) Bool)
(declare-fun Node_rev_next%precondition ($Snap $Ref) Bool)
(declare-fun Node_get_prev ($Snap $Ref) $Ref)
(declare-fun Node_get_prev%limited ($Snap $Ref) $Ref)
(declare-fun Node_get_prev%stateless ($Ref) Bool)
(declare-fun Node_get_prev%precondition ($Snap $Ref) Bool)
(declare-fun Node_get_next ($Snap $Ref) $Ref)
(declare-fun Node_get_next%limited ($Snap $Ref) $Ref)
(declare-fun Node_get_next%stateless ($Ref) Bool)
(declare-fun Node_get_next%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Iterator_ready%trigger ($Snap $Ref) Bool)
(declare-fun Iterator_readyForNext%trigger ($Snap $Ref) Bool)
(declare-fun Iterator_readyForRemove%trigger ($Snap $Ref) Bool)
(declare-fun List_state%trigger ($Snap $Ref) Bool)
(declare-fun Node_state%trigger ($Snap $Ref) Bool)
(declare-fun Node_reverse%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@10@00 ($Snap $Ref) $Ref)
(declare-fun joined_unfolding@11@00 ($Snap $Ref) $Ref)
(declare-fun joined_unfolding@12@00 ($Snap $Ref) $Ref)
(declare-fun joined_unfolding@13@00 ($Snap $Ref) $Ref)
(declare-fun joined_unfolding@14@00 ($Snap $Ref) $Ref)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (Node_first%limited s@$ this@0@00) (Node_first s@$ this@0@00))
  :pattern ((Node_first s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (Node_first%stateless this@0@00)
  :pattern ((Node_first%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (Node_first%precondition s@$ this@0@00)
    (=
      (Node_first s@$ this@0@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        this@0@00
        (Node_first%limited ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
  :pattern ((Node_first s@$ this@0@00))
  :pattern ((Node_first%stateless this@0@00) (Node_reverse%trigger s@$ this@0@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (Node_first%precondition s@$ this@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (Node_first%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((Node_first s@$ this@0@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (Node_rev_prev%limited s@$ this@2@00) (Node_rev_prev s@$ this@2@00))
  :pattern ((Node_rev_prev s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (Node_rev_prev%stateless this@2@00)
  :pattern ((Node_rev_prev%limited s@$ this@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (=>
    (Node_rev_prev%precondition s@$ this@2@00)
    (=
      (Node_rev_prev s@$ this@2@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
  :pattern ((Node_rev_prev s@$ this@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  true
  :pattern ((Node_rev_prev s@$ this@2@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (= (Node_rev_next%limited s@$ this@4@00) (Node_rev_next s@$ this@4@00))
  :pattern ((Node_rev_next s@$ this@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (Node_rev_next%stateless this@4@00)
  :pattern ((Node_rev_next%limited s@$ this@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (=>
    (Node_rev_next%precondition s@$ this@4@00)
    (=
      (Node_rev_next s@$ this@4@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))
  :pattern ((Node_rev_next s@$ this@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  true
  :pattern ((Node_rev_next s@$ this@4@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (= (Node_get_prev%limited s@$ this@6@00) (Node_get_prev s@$ this@6@00))
  :pattern ((Node_get_prev s@$ this@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (Node_get_prev%stateless this@6@00)
  :pattern ((Node_get_prev%limited s@$ this@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (=>
    (Node_get_prev%precondition s@$ this@6@00)
    (=
      (Node_get_prev s@$ this@6@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
  :pattern ((Node_get_prev s@$ this@6@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  true
  :pattern ((Node_get_prev s@$ this@6@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (= (Node_get_next%limited s@$ this@8@00) (Node_get_next s@$ this@8@00))
  :pattern ((Node_get_next s@$ this@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (Node_get_next%stateless this@8@00)
  :pattern ((Node_get_next%limited s@$ this@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (=>
    (Node_get_next%precondition s@$ this@8@00)
    (=
      (Node_get_next s@$ this@8@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))
  :pattern ((Node_get_next s@$ this@8@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  true
  :pattern ((Node_get_next s@$ this@8@00))
  :qid |quant-u-19|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- main ----------
(declare-const l@0@01 $Ref)
(declare-const l@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] l != null
(assert (not (= l@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(assert (= ($Snap.first $t@3@01) $Snap.unit))
; [eval] l != null
(pop) ; 2
(push) ; 2
; [exec]
; var b: Bool
(declare-const b@4@01 Bool)
; [exec]
; var i: Ref
(declare-const i@5@01 $Ref)
; [exec]
; List_put(l, 1)
(declare-const $t@6@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; List_put(l, 0)
(declare-const $t@7@01 $Snap)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; List_put(l, -1)
; [eval] -1
(declare-const $t@8@01 $Snap)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; i := Iterator_new(l)
; [eval] l != null
(declare-const this@9@01 $Ref)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; b := Iterator_hasNext(i)
(declare-const res@11@01 Bool)
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not res@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not res@11@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | res@11@01 | live]
; [else-branch: 0 | !(res@11@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | res@11@01]
(assert res@11@01)
; [eval] !res
; [then-branch: 1 | !(res@11@01) | dead]
; [else-branch: 1 | res@11@01 | live]
(push) ; 4
; [else-branch: 1 | res@11@01]
(assert (= ($Snap.second $t@12@01) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const tmp@13@01 Int)
(declare-const b@14@01 Bool)
(set-option :timeout 0)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(push) ; 6
(set-option :timeout 10)
(assert (not (not b@14@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b@14@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@14@01 | live]
; [else-branch: 2 | !(b@14@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | b@14@01]
(assert b@14@01)
; [eval] !b
; [then-branch: 3 | !(b@14@01) | dead]
; [else-branch: 3 | b@14@01 | live]
(push) ; 7
; [else-branch: 3 | b@14@01]
(assert (= ($Snap.second $t@15@01) $Snap.unit))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 2 | !(b@14@01)]
(assert (not b@14@01))
(assert (= ($Snap.first $t@15@01) $Snap.unit))
; [eval] !b
(push) ; 7
(set-option :timeout 10)
(assert (not b@14@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(b@14@01) | live]
; [else-branch: 4 | b@14@01 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 4 | !(b@14@01)]
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
(push) ; 6
(set-option :timeout 10)
(assert (not (not res@11@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | res@11@01 | live]
; [else-branch: 5 | !(res@11@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 5 | res@11@01]
; [eval] !b
; [then-branch: 6 | !(res@11@01) | dead]
; [else-branch: 6 | res@11@01 | live]
(push) ; 7
; [else-branch: 6 | res@11@01]
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
(assert (= ($Snap.second $t@15@01) $Snap.unit))
(assert b@14@01)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
(push) ; 9
; [eval] !b
(pop) ; 9
; Loop head block: Follow loop-internal edges
(push) ; 9
(set-option :timeout 10)
(assert (not (not b@14@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | b@14@01 | live]
; [else-branch: 7 | !(b@14@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 7 | b@14@01]
; [exec]
; var tmp: Int
(declare-const tmp@16@01 Int)
; [exec]
; tmp := Iterator_next(i)
(declare-const res@17@01 Int)
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] tmp < 0
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (< res@17@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (< res@17@01 0)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | res@17@01 < 0 | live]
; [else-branch: 8 | !(res@17@01 < 0) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 8 | res@17@01 < 0]
(assert (< res@17@01 0))
; [exec]
; Iterator_remove(i)
(declare-const $t@19@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; b := Iterator_hasNext(i)
(declare-const res@20@01 Bool)
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not res@20@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not res@20@01))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | res@20@01 | live]
; [else-branch: 9 | !(res@20@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 9 | res@20@01]
(assert res@20@01)
; [eval] !res
; [then-branch: 10 | !(res@20@01) | dead]
; [else-branch: 10 | res@20@01 | live]
(push) ; 12
; [else-branch: 10 | res@20@01]
(assert (= ($Snap.second $t@21@01) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not res@20@01)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | res@20@01 | live]
; [else-branch: 11 | !(res@20@01) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 11 | res@20@01]
; [eval] !b
; [then-branch: 12 | !(res@20@01) | dead]
; [else-branch: 12 | res@20@01 | live]
(push) ; 14
; [else-branch: 12 | res@20@01]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 9 | !(res@20@01)]
(assert (not res@20@01))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
; [eval] !res
(push) ; 12
(set-option :timeout 10)
(assert (not res@20@01))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(res@20@01) | live]
; [else-branch: 13 | res@20@01 | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 13 | !(res@20@01)]
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
; [then-branch: 14 | res@20@01 | dead]
; [else-branch: 14 | !(res@20@01) | live]
(set-option :timeout 0)
(push) ; 13
; [else-branch: 14 | !(res@20@01)]
; [eval] !b
(push) ; 14
(set-option :timeout 10)
(assert (not res@20@01))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | !(res@20@01) | live]
; [else-branch: 15 | res@20@01 | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 15 | !(res@20@01)]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 8 | !(res@17@01 < 0)]
(assert (not (< res@17@01 0)))
(pop) ; 10
; [eval] !(tmp < 0)
; [eval] tmp < 0
(push) ; 10
(set-option :timeout 10)
(assert (not (< res@17@01 0)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (< res@17@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | !(res@17@01 < 0) | live]
; [else-branch: 16 | res@17@01 < 0 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 16 | !(res@17@01 < 0)]
(assert (not (< res@17@01 0)))
; [exec]
; apply acc(Iterator_readyForRemove(i), write) --*
;   acc(Iterator_ready(i), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; b := Iterator_hasNext(i)
(declare-const res@22@01 Bool)
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not res@22@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not res@22@01))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | res@22@01 | live]
; [else-branch: 17 | !(res@22@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 17 | res@22@01]
(assert res@22@01)
; [eval] !res
; [then-branch: 18 | !(res@22@01) | dead]
; [else-branch: 18 | res@22@01 | live]
(push) ; 12
; [else-branch: 18 | res@22@01]
(assert (= ($Snap.second $t@23@01) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not res@22@01)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | res@22@01 | live]
; [else-branch: 19 | !(res@22@01) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 19 | res@22@01]
; [eval] !b
; [then-branch: 20 | !(res@22@01) | dead]
; [else-branch: 20 | res@22@01 | live]
(push) ; 14
; [else-branch: 20 | res@22@01]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 17 | !(res@22@01)]
(assert (not res@22@01))
(assert (= ($Snap.first $t@23@01) $Snap.unit))
; [eval] !res
(push) ; 12
(set-option :timeout 10)
(assert (not res@22@01))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | !(res@22@01) | live]
; [else-branch: 21 | res@22@01 | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 21 | !(res@22@01)]
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
; [then-branch: 22 | res@22@01 | dead]
; [else-branch: 22 | !(res@22@01) | live]
(set-option :timeout 0)
(push) ; 13
; [else-branch: 22 | !(res@22@01)]
; [eval] !b
(push) ; 14
(set-option :timeout 10)
(assert (not res@22@01))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | !(res@22@01) | live]
; [else-branch: 23 | res@22@01 | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 23 | !(res@22@01)]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 16 | res@17@01 < 0]
(assert (< res@17@01 0))
(pop) ; 10
(pop) ; 9
; [eval] !b
; [then-branch: 24 | !(b@14@01) | dead]
; [else-branch: 24 | b@14@01 | live]
(push) ; 9
; [else-branch: 24 | b@14@01]
(pop) ; 9
(pop) ; 8
(push) ; 8
(assert (not b@14@01))
(assert (= ($Snap.first $t@15@01) $Snap.unit))
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
(push) ; 9
; [eval] !b
(pop) ; 9
; Loop head block: Follow loop-internal edges
; [then-branch: 25 | b@14@01 | dead]
; [else-branch: 25 | !(b@14@01) | live]
(push) ; 9
; [else-branch: 25 | !(b@14@01)]
(pop) ; 9
; [eval] !b
(push) ; 9
(set-option :timeout 10)
(assert (not b@14@01))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | !(b@14@01) | live]
; [else-branch: 26 | b@14@01 | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 26 | !(b@14@01)]
; [exec]
; apply acc(Iterator_ready(i), write) --* acc(List_state(l), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] l != null
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | !(res@11@01)]
(assert (not res@11@01))
(assert (= ($Snap.first $t@12@01) $Snap.unit))
; [eval] !res
(push) ; 4
(set-option :timeout 10)
(assert (not res@11@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | !(res@11@01) | live]
; [else-branch: 27 | res@11@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 27 | !(res@11@01)]
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const tmp@24@01 Int)
(declare-const b@25@01 Bool)
(set-option :timeout 0)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(push) ; 6
(set-option :timeout 10)
(assert (not (not b@25@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not b@25@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | b@25@01 | live]
; [else-branch: 28 | !(b@25@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 28 | b@25@01]
(assert b@25@01)
; [eval] !b
; [then-branch: 29 | !(b@25@01) | dead]
; [else-branch: 29 | b@25@01 | live]
(push) ; 7
; [else-branch: 29 | b@25@01]
(assert (= ($Snap.second $t@26@01) $Snap.unit))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 28 | !(b@25@01)]
(assert (not b@25@01))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] !b
(push) ; 7
(set-option :timeout 10)
(assert (not b@25@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | !(b@25@01) | live]
; [else-branch: 30 | b@25@01 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 30 | !(b@25@01)]
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
; [then-branch: 31 | res@11@01 | dead]
; [else-branch: 31 | !(res@11@01) | live]
(push) ; 6
; [else-branch: 31 | !(res@11@01)]
; [eval] !b
(push) ; 7
(set-option :timeout 10)
(assert (not res@11@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | !(res@11@01) | live]
; [else-branch: 32 | res@11@01 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 32 | !(res@11@01)]
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
(assert (= ($Snap.second $t@26@01) $Snap.unit))
(assert b@25@01)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
(push) ; 9
; [eval] !b
(pop) ; 9
; Loop head block: Follow loop-internal edges
(push) ; 9
(set-option :timeout 10)
(assert (not (not b@25@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | b@25@01 | live]
; [else-branch: 33 | !(b@25@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 33 | b@25@01]
; [exec]
; var tmp: Int
(declare-const tmp@27@01 Int)
; [exec]
; tmp := Iterator_next(i)
(declare-const res@28@01 Int)
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] tmp < 0
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (< res@28@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (< res@28@01 0)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | res@28@01 < 0 | live]
; [else-branch: 34 | !(res@28@01 < 0) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 34 | res@28@01 < 0]
(assert (< res@28@01 0))
; [exec]
; Iterator_remove(i)
(declare-const $t@30@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; b := Iterator_hasNext(i)
(declare-const res@31@01 Bool)
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not res@31@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not res@31@01))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | res@31@01 | live]
; [else-branch: 35 | !(res@31@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 35 | res@31@01]
(assert res@31@01)
; [eval] !res
; [then-branch: 36 | !(res@31@01) | dead]
; [else-branch: 36 | res@31@01 | live]
(push) ; 12
; [else-branch: 36 | res@31@01]
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not res@31@01)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | res@31@01 | live]
; [else-branch: 37 | !(res@31@01) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 37 | res@31@01]
; [eval] !b
; [then-branch: 38 | !(res@31@01) | dead]
; [else-branch: 38 | res@31@01 | live]
(push) ; 14
; [else-branch: 38 | res@31@01]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 35 | !(res@31@01)]
(assert (not res@31@01))
(assert (= ($Snap.first $t@32@01) $Snap.unit))
; [eval] !res
(push) ; 12
(set-option :timeout 10)
(assert (not res@31@01))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | !(res@31@01) | live]
; [else-branch: 39 | res@31@01 | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 39 | !(res@31@01)]
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
; [then-branch: 40 | res@31@01 | dead]
; [else-branch: 40 | !(res@31@01) | live]
(set-option :timeout 0)
(push) ; 13
; [else-branch: 40 | !(res@31@01)]
; [eval] !b
(push) ; 14
(set-option :timeout 10)
(assert (not res@31@01))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | !(res@31@01) | live]
; [else-branch: 41 | res@31@01 | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 41 | !(res@31@01)]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 34 | !(res@28@01 < 0)]
(assert (not (< res@28@01 0)))
(pop) ; 10
; [eval] !(tmp < 0)
; [eval] tmp < 0
(push) ; 10
(set-option :timeout 10)
(assert (not (< res@28@01 0)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (< res@28@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | !(res@28@01 < 0) | live]
; [else-branch: 42 | res@28@01 < 0 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 42 | !(res@28@01 < 0)]
(assert (not (< res@28@01 0)))
; [exec]
; apply acc(Iterator_readyForRemove(i), write) --*
;   acc(Iterator_ready(i), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; b := Iterator_hasNext(i)
(declare-const res@33@01 Bool)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not res@33@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not res@33@01))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | res@33@01 | live]
; [else-branch: 43 | !(res@33@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 43 | res@33@01]
(assert res@33@01)
; [eval] !res
; [then-branch: 44 | !(res@33@01) | dead]
; [else-branch: 44 | res@33@01 | live]
(push) ; 12
; [else-branch: 44 | res@33@01]
(assert (= ($Snap.second $t@34@01) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not res@33@01)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | res@33@01 | live]
; [else-branch: 45 | !(res@33@01) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 45 | res@33@01]
; [eval] !b
; [then-branch: 46 | !(res@33@01) | dead]
; [else-branch: 46 | res@33@01 | live]
(push) ; 14
; [else-branch: 46 | res@33@01]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 43 | !(res@33@01)]
(assert (not res@33@01))
(assert (= ($Snap.first $t@34@01) $Snap.unit))
; [eval] !res
(push) ; 12
(set-option :timeout 10)
(assert (not res@33@01))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | !(res@33@01) | live]
; [else-branch: 47 | res@33@01 | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 47 | !(res@33@01)]
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
; [then-branch: 48 | res@33@01 | dead]
; [else-branch: 48 | !(res@33@01) | live]
(set-option :timeout 0)
(push) ; 13
; [else-branch: 48 | !(res@33@01)]
; [eval] !b
(push) ; 14
(set-option :timeout 10)
(assert (not res@33@01))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | !(res@33@01) | live]
; [else-branch: 49 | res@33@01 | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 49 | !(res@33@01)]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 42 | res@28@01 < 0]
(assert (< res@28@01 0))
(pop) ; 10
(pop) ; 9
; [eval] !b
; [then-branch: 50 | !(b@25@01) | dead]
; [else-branch: 50 | b@25@01 | live]
(push) ; 9
; [else-branch: 50 | b@25@01]
(pop) ; 9
(pop) ; 8
(push) ; 8
(assert (not b@25@01))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
(push) ; 9
; [eval] !b
(pop) ; 9
; Loop head block: Follow loop-internal edges
; [then-branch: 51 | b@25@01 | dead]
; [else-branch: 51 | !(b@25@01) | live]
(push) ; 9
; [else-branch: 51 | !(b@25@01)]
(pop) ; 9
; [eval] !b
(push) ; 9
(set-option :timeout 10)
(assert (not b@25@01))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | !(b@25@01) | live]
; [else-branch: 52 | b@25@01 | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 52 | !(b@25@01)]
; [exec]
; apply acc(Iterator_ready(i), write) --* acc(List_state(l), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] l != null
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Iterator_new ----------
(declare-const l@35@01 $Ref)
(declare-const this@36@01 $Ref)
(declare-const l@37@01 $Ref)
(declare-const this@38@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
(assert (= ($Snap.first $t@39@01) $Snap.unit))
; [eval] l != null
(assert (not (= l@37@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 ($Snap.combine ($Snap.first $t@40@01) ($Snap.second $t@40@01))))
(pop) ; 2
(push) ; 2
; [exec]
; this := new(Iterator_iteratee, Iterator_current, Iterator_last)
(declare-const this@41@01 $Ref)
(assert (not (= this@41@01 $Ref.null)))
(declare-const Iterator_iteratee@42@01 $Ref)
(declare-const Iterator_current@43@01 $Ref)
(declare-const Iterator_last@44@01 $Ref)
(assert (not (= this@41@01 this@38@01)))
(assert (not (= this@41@01 l@37@01)))
; [exec]
; unfold acc(List_state(l), write)
(assert (=
  ($Snap.second $t@39@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@39@01))
    ($Snap.second ($Snap.second $t@39@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@39@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@39@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@39@01))) $Snap.unit))
; [eval] this.List_sentinel != null
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List_state%trigger ($Snap.second $t@39@01) l@37@01))
; [exec]
; this.Iterator_current := l.List_sentinel
(declare-const Iterator_current@45@01 $Ref)
(assert (=
  Iterator_current@45@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@01)))))
; [exec]
; unfold acc(Node_state(this.Iterator_current), write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@01)))
  Iterator_current@45@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@39@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@39@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))))
(assert (not (= Iterator_current@45@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))))))
; [eval] this.Node_next != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))))
  $Ref.null)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | First:(Second:(Second:(Second:(Second:(Second:($t@39@01)))))) != Null | live]
; [else-branch: 53 | First:(Second:(Second:(Second:(Second:(Second:($t@39@01)))))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 53 | First:(Second:(Second:(Second:(Second:(Second:($t@39@01)))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Node_state%trigger ($Snap.second ($Snap.second ($Snap.second $t@39@01))) Iterator_current@45@01))
; [exec]
; this.Iterator_current.Node_prev := null
; [exec]
; this.Iterator_iteratee := l
; [exec]
; fold acc(Iterator_ready(this), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] this.Iterator_iteratee != null
; [eval] this.Iterator_iteratee.List_sentinel != null
; [eval] this.Iterator_current != null
; [eval] this.Iterator_current.Node_prev == null ==> this.Iterator_current == this.Iterator_iteratee.List_sentinel
; [eval] this.Iterator_current.Node_prev == null
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | True | live]
; [else-branch: 54 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 54 | True]
; [eval] this.Iterator_current == this.Iterator_iteratee.List_sentinel
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] this.Iterator_current.Node_prev != null
; [then-branch: 55 | False | dead]
; [else-branch: 55 | True | live]
(push) ; 4
; [else-branch: 55 | True]
; [eval] this.Iterator_current.Node_next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 56 | First:(Second:(Second:(Second:(Second:(Second:($t@39@01)))))) != Null | live]
; [else-branch: 56 | First:(Second:(Second:(Second:(Second:(Second:($t@39@01)))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 56 | First:(Second:(Second:(Second:(Second:(Second:($t@39@01)))))) != Null]
(assert (Iterator_ready%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@37@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second $t@39@01))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap Iterator_current@45@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap Iterator_last@44@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@39@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $Ref.null)
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@01)))))))))))))))))) this@41@01))
; [exec]
; package acc(Iterator_ready(this), write) --* acc(List_state(l), write) {
;   unfold acc(Iterator_ready(this), write)
;   fold acc(Node_state(this.Iterator_current), write)
;   if (Node_get_prev(this.Iterator_current) != null) {
;     Node_swap(Node_get_prev(this.Iterator_current), this.Iterator_iteratee.List_sentinel,
;       this.Iterator_current)
;   }
;   assert acc(this.Iterator_iteratee, write)
;   fold acc(List_state(l), write)
; }
(push) ; 6
(declare-const $t@46@01 $Snap)
; [exec]
; unfold acc(Iterator_ready(this), write)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (=
  ($Snap.second $t@46@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@46@01))
    ($Snap.second ($Snap.second $t@46@01)))))
(assert (= ($Snap.first ($Snap.second $t@46@01)) $Snap.unit))
; [eval] this.Iterator_iteratee != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@46@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@46@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@46@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@46@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@46@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@46@01))))
  $Snap.unit))
; [eval] this.Iterator_iteratee.List_sentinel != null
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@46@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
  $Snap.unit))
; [eval] this.Iterator_current != null
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
  $Snap.unit))
; [eval] this.Iterator_current.Node_prev == null ==> this.Iterator_current == this.Iterator_iteratee.List_sentinel
; [eval] this.Iterator_current.Node_prev == null
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01)))))))))) == Null | live]
; [else-branch: 57 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01)))))))))) != Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 57 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01)))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
  $Ref.null))
; [eval] this.Iterator_current == this.Iterator_iteratee.List_sentinel
(pop) ; 8
(push) ; 8
; [else-branch: 57 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01)))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
    $Ref.null)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
    $Ref.null)))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
    $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@46@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))))
; [eval] this.Iterator_current.Node_prev != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01)))))))))) != Null | live]
; [else-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01)))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01)))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))
    $Ref.null)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))))
  $Snap.unit))
; [eval] Node_first(this.Iterator_current.Node_prev) == this.Iterator_iteratee.List_sentinel
; [eval] Node_first(this.Iterator_current.Node_prev)
(push) ; 8
(assert (Node_first%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))
(pop) ; 8
; Joined path conditions
(assert (Node_first%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))
(assert (=
  (Node_first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@46@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))))
  $Snap.unit))
; [eval] Node_rev_next(this.Iterator_current.Node_prev) == this.Iterator_current
; [eval] Node_rev_next(this.Iterator_current.Node_prev)
(push) ; 8
(assert (Node_rev_next%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))
(pop) ; 8
; Joined path conditions
(assert (Node_rev_next%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01)))))))))))))
(assert (=
  (Node_rev_next ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))
; [eval] this.Iterator_current.Node_next != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01))))))))) != Null | live]
; [else-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@46@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Iterator_ready%trigger $t@46@01 this@41@01))
; [exec]
; fold acc(Node_state(this.Iterator_current), write)
; ---------- Iterator_hasNext ----------
(declare-const this@47@01 $Ref)
(declare-const res@48@01 Bool)
(declare-const this@49@01 $Ref)
(declare-const res@50@01 Bool)
(set-option :timeout 0)
(push) ; 9
(declare-const $t@51@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
; ---------- Iterator_next ----------
