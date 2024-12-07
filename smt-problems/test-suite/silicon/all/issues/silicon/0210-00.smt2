(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:52:38
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0210.vpr
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
(declare-sort List_ 0)
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
(declare-fun $SortWrappers.List_To$Snap (List_) $Snap)
(declare-fun $SortWrappers.$SnapToList_ ($Snap) List_)
(assert (forall ((x List_)) (!
    (= x ($SortWrappers.$SnapToList_($SortWrappers.List_To$Snap x)))
    :pattern (($SortWrappers.List_To$Snap x))
    :qid |$Snap.$SnapToList_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List_To$Snap($SortWrappers.$SnapToList_ x)))
    :pattern (($SortWrappers.$SnapToList_ x))
    :qid |$Snap.List_To$SnapToList_|
    )))
; ////////// Symbols
(declare-const fn$$List__Node<List> List_)
(declare-const fn$$List__Nil<List> List_)
(declare-fun variantOfList<List> ($Ref) List_)
(declare-fun isList<Bool> ($Ref) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun silver_length ($Snap $Ref) Int)
(declare-fun silver_length%limited ($Snap $Ref) Int)
(declare-fun silver_length%stateless ($Ref) Bool)
(declare-fun silver_length%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid__List%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
(assert (distinct fn$$List__Node<List> fn$$List__Nil<List>))
; ////////// Axioms
(assert (forall ((x $Ref)) (!
  (or
    (= (variantOfList<List> x) (as fn$$List__Node<List>  List_))
    (= (variantOfList<List> x) (as fn$$List__Nil<List>  List_)))
  :pattern ((variantOfList<List> x))
  :qid |prog.ax_variantOfList|)))
(assert (forall ((x $Ref)) (!
  (=
    (isList<Bool> x)
    (or
      (= (variantOfList<List> x) (as fn$$List__Node<List>  List_))
      (= (variantOfList<List> x) (as fn$$List__Nil<List>  List_))))
  :pattern ((isList<Bool> x))
  :pattern ((variantOfList<List> x))
  :qid |prog.ax_isList|)))
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
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (silver_length%limited s@$ this@0@00) (silver_length s@$ this@0@00))
  :pattern ((silver_length s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (silver_length%stateless this@0@00)
  :pattern ((silver_length%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (silver_length%limited s@$ this@0@00))) (and
    ($Perm.isReadVar $k@2@00)
    (=> (silver_length%precondition s@$ this@0@00) (>= result@1@00 0))))
  :pattern ((silver_length%limited s@$ this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (silver_length%limited s@$ this@0@00))) true)
  :pattern ((silver_length%limited s@$ this@0@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@2@00)
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    (=>
      (silver_length%precondition s@$ this@0@00)
      (=
        (silver_length s@$ this@0@00)
        (ite
          (=
            (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (as fn$$List__Nil<List>  List_))
          0
          (+
            1
            (silver_length%limited ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))))))
  :pattern ((silver_length s@$ this@0@00))
  :pattern ((silver_length%stateless this@0@00) (valid__List%trigger s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (silver_length%precondition s@$ this@0@00)
    (ite
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Nil<List>  List_))
      true
      (silver_length%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((silver_length s@$ this@0@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- length_iter ----------
(declare-const list$1@0@01 $Ref)
(declare-const rd$1@1@01 $Perm)
(declare-const res$1@2@01 Int)
(declare-const list$1@3@01 $Ref)
(declare-const rd$1@4@01 $Perm)
(declare-const res$1@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] none < rd$1
(assert (< $Perm.No rd$1@4@01))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] rd$1 < write
(assert (< rd$1@4@01 $Perm.Write))
(push) ; 2
(assert (not (or (= rd$1@4@01 $Perm.No) (< $Perm.No rd$1@4@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No rd$1@4@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(assert (not (or (= rd$1@4@01 $Perm.No) (< $Perm.No rd$1@4@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@7@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; var current$1: Ref
(declare-const current$1@8@01 $Ref)
; [exec]
; var counter$1: Int
(declare-const counter$1@9@01 Int)
; [exec]
; current$1 := list$1
; [exec]
; counter$1 := 0
(declare-const tail$1@10@01 $Ref)
(declare-const counter$1@11@01 Int)
(declare-const current$1@12@01 $Ref)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(push) ; 4
(assert (not (or (= rd$1@4@01 $Perm.No) (< $Perm.No rd$1@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@13@01 $Snap)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(assert (not (or (= rd$1@4@01 $Perm.No) (< $Perm.No rd$1@4@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 4
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
(push) ; 5
; [eval] !true
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | True]
; [exec]
; var tail$1: Ref
(declare-const tail$1@14@01 $Ref)
; [exec]
; unfold acc(valid__List(current$1), rd$1)
(push) ; 6
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (<= rd$1@4@01 $Perm.Write))
(assert (=> (< $Perm.No rd$1@4@01) (not (= current$1@12@01 $Ref.null))))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(assert (= ($Snap.first ($Snap.second $t@13@01)) $Snap.unit))
; [eval] isList(this.List__variant)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (isList<Bool> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01))))
(assert (=
  ($Snap.second ($Snap.second $t@13@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@13@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@13@01))))))
; [eval] variantOfList(this.List__variant) == fn$$List__Node()
; [eval] variantOfList(this.List__variant)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Node()
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
    (as fn$$List__Node<List>  List_)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
  (as fn$$List__Node<List>  List_))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List] | live]
; [else-branch: 1 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List] | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 1 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List]]
(assert (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
  (as fn$$List__Node<List>  List_)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@13@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@13@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@13@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@13@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@13@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@13@01))))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Nil()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
    (as fn$$List__Nil<List>  List_)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | variantOfList[List](First:($t@13@01)) == fn$$List__Nil[List] | dead]
; [else-branch: 2 | variantOfList[List](First:($t@13@01)) != fn$$List__Nil[List] | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 2 | variantOfList[List](First:($t@13@01)) != fn$$List__Nil[List]]
(assert (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
    (as fn$$List__Nil<List>  List_))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@13@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid__List%trigger $t@13@01 current$1@12@01))
; [exec]
; tail$1 := current$1.List__Node__1
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(declare-const tail$1@15@01 $Ref)
(assert (=
  tail$1@15@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@13@01))))))))
; [eval] true && variantOfList(current$1.List__variant) == fn$$List__Node()
(set-option :timeout 0)
(push) ; 8
; [then-branch: 3 | False | live]
; [else-branch: 3 | True | live]
(push) ; 9
; [then-branch: 3 | False]
(assert false)
(pop) ; 9
(push) ; 9
; [else-branch: 3 | True]
; [eval] variantOfList(current$1.List__variant) == fn$$List__Node()
; [eval] variantOfList(current$1.List__variant)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Node()
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
    (as fn$$List__Node<List>  List_)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List] | live]
; [else-branch: 4 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List] | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 4 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List]]
; [exec]
; counter$1 := counter$1 + 1
; [eval] counter$1 + 1
(declare-const counter$1@16@01 Int)
(assert (= counter$1@16@01 (+ counter$1@11@01 1)))
; [exec]
; current$1 := tail$1
; [exec]
; assert perm(valid__List(current$1)) > none
; [eval] perm(valid__List(current$1)) > none
; [eval] perm(valid__List(current$1))
(push) ; 9
(assert (not (>
  (ite
    (=
      tail$1@15@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@13@01)))))))
    rd$1@4@01
    $Perm.No)
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (>
  (ite
    (=
      tail$1@15@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@13@01)))))))
    rd$1@4@01
    $Perm.No)
  $Perm.No))
; Loop head block: Re-establish invariant
(push) ; 9
(assert (not (or (= rd$1@4@01 $Perm.No) (< $Perm.No rd$1@4@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@13@01))))))
  tail$1@15@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; [eval] !(true && variantOfList(current$1.List__variant) == fn$$List__Node())
; [eval] true && variantOfList(current$1.List__variant) == fn$$List__Node()
(set-option :timeout 0)
(push) ; 8
; [then-branch: 5 | False | live]
; [else-branch: 5 | True | live]
(push) ; 9
; [then-branch: 5 | False]
(assert false)
(pop) ; 9
(push) ; 9
; [else-branch: 5 | True]
; [eval] variantOfList(current$1.List__variant) == fn$$List__Node()
; [eval] variantOfList(current$1.List__variant)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Node()
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
; [then-branch: 6 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List] | dead]
; [else-branch: 6 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List] | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 6 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List]]
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 1 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List]]
(assert (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
    (as fn$$List__Node<List>  List_))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@13@01))) $Snap.unit))
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Nil()
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
    (as fn$$List__Nil<List>  List_)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
  (as fn$$List__Nil<List>  List_))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | variantOfList[List](First:($t@13@01)) == fn$$List__Nil[List] | live]
; [else-branch: 7 | variantOfList[List](First:($t@13@01)) != fn$$List__Nil[List] | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 7 | variantOfList[List](First:($t@13@01)) == fn$$List__Nil[List]]
(assert (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
  (as fn$$List__Nil<List>  List_)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@13@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (valid__List%trigger $t@13@01 current$1@12@01))
; [exec]
; tail$1 := current$1.List__Node__1
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(declare-const tail$1@17@01 $Ref)
(assert (=
  tail$1@17@01
  ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))))
; [eval] true && variantOfList(current$1.List__variant) == fn$$List__Node()
(set-option :timeout 0)
(push) ; 8
; [then-branch: 8 | False | live]
; [else-branch: 8 | True | live]
(push) ; 9
; [then-branch: 8 | False]
(assert false)
(pop) ; 9
(push) ; 9
; [else-branch: 8 | True]
; [eval] variantOfList(current$1.List__variant) == fn$$List__Node()
; [eval] variantOfList(current$1.List__variant)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Node()
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
; [then-branch: 9 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List] | dead]
; [else-branch: 9 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List] | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 9 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List]]
(pop) ; 8
; [eval] !(true && variantOfList(current$1.List__variant) == fn$$List__Node())
; [eval] true && variantOfList(current$1.List__variant) == fn$$List__Node()
(push) ; 8
; [then-branch: 10 | False | live]
; [else-branch: 10 | True | live]
(push) ; 9
; [then-branch: 10 | False]
(assert false)
(pop) ; 9
(push) ; 9
; [else-branch: 10 | True]
; [eval] variantOfList(current$1.List__variant) == fn$$List__Node()
; [eval] variantOfList(current$1.List__variant)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Node()
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
  (as fn$$List__Node<List>  List_))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List] | live]
; [else-branch: 11 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List] | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 11 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List]]
; [exec]
; fold acc(valid__List(current$1), rd$1)
(push) ; 9
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] isList(this.List__variant)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] variantOfList(this.List__variant) == fn$$List__Node()
; [eval] variantOfList(this.List__variant)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Node()
; [then-branch: 12 | variantOfList[List](First:($t@13@01)) == fn$$List__Node[List] | dead]
; [else-branch: 12 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List] | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 12 | variantOfList[List](First:($t@13@01)) != fn$$List__Node[List]]
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Nil()
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@01)))
    (as fn$$List__Nil<List>  List_)))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | variantOfList[List](First:($t@13@01)) == fn$$List__Nil[List] | live]
; [else-branch: 13 | variantOfList[List](First:($t@13@01)) != fn$$List__Nil[List] | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 13 | variantOfList[List](First:($t@13@01)) == fn$$List__Nil[List]]
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No rd$1@4@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (valid__List%trigger ($Snap.combine
  ($Snap.first $t@13@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))))) current$1@12@01))
; [exec]
; label loop_end
; [exec]
; res$1 := counter$1
(set-option :timeout 0)
(push) ; 11
(assert (not (or (= rd$1@4@01 $Perm.No) (< $Perm.No rd$1@4@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (= current$1@12@01 list$1@3@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= current$1@12@01 list$1@3@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= rd$1@4@01 $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(assert (not (or (= rd$1@4@01 $Perm.No) (< $Perm.No rd$1@4@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (= current$1@12@01 list$1@3@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= rd$1@4@01 $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= current$1@12@01 list$1@3@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= rd$1@4@01 $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
