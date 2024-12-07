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
; ---------- FUNCTION silver_length----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $k@2@00 $Perm)
(assert ($Perm.isReadVar $k@2@00))
(assert (<= $Perm.No $k@2@00))
(declare-const $t@3@00 $Snap)
(assert (= $t@3@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@1@00 0))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@2@00))
(assert (<= $Perm.No $k@2@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(valid__List(this), wildcard) in (variantOfList(this.List__variant) == fn$$List__Nil() ? 0 : 1 + silver_length(this.List__Node__1)))
(declare-const $k@4@00 $Perm)
(assert ($Perm.isReadVar $k@4@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@5@00 $Perm)
(assert ($Perm.isReadVar $k@5@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@2@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@5@00 $k@2@00))
(assert (<= $Perm.No (- $k@2@00 $k@5@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (valid__List%trigger s@$ this@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= $Perm.No $k@4@00))
(assert (<= $k@4@00 $Perm.Write))
(assert (=> (< $Perm.No $k@4@00) (not (= this@0@00 $Ref.null))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] isList(this.List__variant)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (isList<Bool> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
; [eval] variantOfList(this.List__variant) == fn$$List__Node()
; [eval] variantOfList(this.List__variant)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Node()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (as fn$$List__Node<List>  List_)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (as fn$$List__Node<List>  List_))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | variantOfList[List](First:(s@$)) == fn$$List__Node[List] | live]
; [else-branch: 0 | variantOfList[List](First:(s@$)) != fn$$List__Node[List] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | variantOfList[List](First:(s@$)) == fn$$List__Node[List]]
(assert (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (as fn$$List__Node<List>  List_)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@0@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Nil()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (as fn$$List__Nil<List>  List_)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | variantOfList[List](First:(s@$)) == fn$$List__Nil[List] | dead]
; [else-branch: 1 | variantOfList[List](First:(s@$)) != fn$$List__Nil[List] | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | variantOfList[List](First:(s@$)) != fn$$List__Nil[List]]
(assert (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (as fn$$List__Nil<List>  List_))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (variantOfList(this.List__variant) == fn$$List__Nil() ? 0 : 1 + silver_length(this.List__Node__1))
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Nil()
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | variantOfList[List](First:(s@$)) == fn$$List__Nil[List] | dead]
; [else-branch: 2 | variantOfList[List](First:(s@$)) != fn$$List__Nil[List] | live]
(push) ; 6
; [else-branch: 2 | variantOfList[List](First:(s@$)) != fn$$List__Nil[List]]
; [eval] 1 + silver_length(this.List__Node__1)
; [eval] silver_length(this.List__Node__1)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(declare-const $k@6@00 $Perm)
(assert ($Perm.isReadVar $k@6@00))
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= $k@4@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (< $k@6@00 $k@4@00))
(assert (<= $Perm.No (- $k@4@00 $k@6@00)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@00)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (silver_length%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@6@00))
(assert (and
  (< $k@6@00 $k@4@00)
  (<= $Perm.No (- $k@4@00 $k@6@00))
  (silver_length%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@6@00))
(assert (=>
  (not
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Nil<List>  List_)))
  (and
    (< $k@6@00 $k@4@00)
    (<= $Perm.No (- $k@4@00 $k@6@00))
    (silver_length%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | variantOfList[List](First:(s@$)) != fn$$List__Node[List]]
(assert (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (as fn$$List__Node<List>  List_))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Nil()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (as fn$$List__Nil<List>  List_)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (as fn$$List__Nil<List>  List_))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | variantOfList[List](First:(s@$)) == fn$$List__Nil[List] | live]
; [else-branch: 3 | variantOfList[List](First:(s@$)) != fn$$List__Nil[List] | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | variantOfList[List](First:(s@$)) == fn$$List__Nil[List]]
(assert (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (as fn$$List__Nil<List>  List_)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
; [eval] (variantOfList(this.List__variant) == fn$$List__Nil() ? 0 : 1 + silver_length(this.List__Node__1))
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] fn$$List__Nil()
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (as fn$$List__Nil<List>  List_)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | variantOfList[List](First:(s@$)) == fn$$List__Nil[List] | live]
; [else-branch: 4 | variantOfList[List](First:(s@$)) != fn$$List__Nil[List] | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | variantOfList[List](First:(s@$)) == fn$$List__Nil[List]]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@7@00 ($Snap $Ref) Int)
(assert (=>
  (and
    (not
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Nil<List>  List_)))
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Node<List>  List_)))
  (=
    (joined_unfolding@7@00 s@$ this@0@00)
    (+
      1
      (silver_length ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (and
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Nil<List>  List_))
    (not
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Node<List>  List_))))
  (= (joined_unfolding@7@00 s@$ this@0@00) 0)))
; Joined path conditions
(assert ($Perm.isReadVar $k@5@00))
(assert ($Perm.isReadVar $k@6@00))
(assert (and
  (< $k@5@00 $k@2@00)
  (<= $Perm.No (- $k@2@00 $k@5@00))
  (valid__List%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (<= $Perm.No $k@4@00)
  (<= $k@4@00 $Perm.Write)
  (=> (< $Perm.No $k@4@00) (not (= this@0@00 $Ref.null)))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (= ($Snap.first ($Snap.second s@$)) $Snap.unit)
  (isList<Bool> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (as fn$$List__Node<List>  List_))
  (and
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Node<List>  List_))
    (=
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (=>
  (and
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Node<List>  List_))
    (not
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Nil<List>  List_))))
  (and
    (not
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Nil<List>  List_)))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (=
          (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
          (as fn$$List__Nil<List>  List_)))
      (and
        (< $k@6@00 $k@4@00)
        (<= $Perm.No (- $k@4@00 $k@6@00))
        (silver_length%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))))))
; Joined path conditions
(assert (and
  (< $k@5@00 $k@2@00)
  (<= $Perm.No (- $k@2@00 $k@5@00))
  (valid__List%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (<= $Perm.No $k@4@00)
  (<= $k@4@00 $Perm.Write)
  (=> (< $Perm.No $k@4@00) (not (= this@0@00 $Ref.null)))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (= ($Snap.first ($Snap.second s@$)) $Snap.unit)
  (isList<Bool> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (not
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Node<List>  List_)))
  (and
    (not
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Node<List>  List_)))
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (=>
  (and
    (not
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Node<List>  List_)))
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Nil<List>  List_)))
  (and
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Nil<List>  List_))
    (=
      ($Snap.second ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (or
  (and
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Nil<List>  List_))
    (not
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Node<List>  List_))))
  (and
    (not
      (=
        (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (as fn$$List__Nil<List>  List_)))
    (=
      (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as fn$$List__Node<List>  List_)))))
(assert (= result@1@00 (joined_unfolding@7@00 s@$ this@0@00)))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@1@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@1@00 0))
(pop) ; 1
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
; ---------- valid__List ----------
(declare-const this@8@00 $Ref)
(push) ; 1
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 ($Snap.combine ($Snap.first $t@9@00) ($Snap.second $t@9@00))))
(assert (not (= this@8@00 $Ref.null)))
(assert (=
  ($Snap.second $t@9@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@00))
    ($Snap.second ($Snap.second $t@9@00)))))
(assert (= ($Snap.first ($Snap.second $t@9@00)) $Snap.unit))
; [eval] isList(this.List__variant)
(assert (isList<Bool> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00))))
(assert (=
  ($Snap.second ($Snap.second $t@9@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@9@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
; [eval] variantOfList(this.List__variant) == fn$$List__Node()
; [eval] variantOfList(this.List__variant)
; [eval] fn$$List__Node()
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
    (as fn$$List__Node<List>  List_)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
  (as fn$$List__Node<List>  List_))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | variantOfList[List](First:($t@9@00)) == fn$$List__Node[List] | live]
; [else-branch: 5 | variantOfList[List](First:($t@9@00)) != fn$$List__Node[List] | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 5 | variantOfList[List](First:($t@9@00)) == fn$$List__Node[List]]
(assert (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
  (as fn$$List__Node<List>  List_)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@9@00)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@9@00))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@9@00)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@9@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@9@00)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@9@00))))))))
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
; [eval] fn$$List__Nil()
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
    (as fn$$List__Nil<List>  List_)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | variantOfList[List](First:($t@9@00)) == fn$$List__Nil[List] | dead]
; [else-branch: 6 | variantOfList[List](First:($t@9@00)) != fn$$List__Nil[List] | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 6 | variantOfList[List](First:($t@9@00)) != fn$$List__Nil[List]]
(assert (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
    (as fn$$List__Nil<List>  List_))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@9@00))) $Snap.unit))
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 5 | variantOfList[List](First:($t@9@00)) != fn$$List__Node[List]]
(assert (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
    (as fn$$List__Node<List>  List_))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@9@00))) $Snap.unit))
; [eval] variantOfList(this.List__variant) == fn$$List__Nil()
; [eval] variantOfList(this.List__variant)
; [eval] fn$$List__Nil()
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
    (as fn$$List__Nil<List>  List_)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
  (as fn$$List__Nil<List>  List_))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | variantOfList[List](First:($t@9@00)) == fn$$List__Nil[List] | live]
; [else-branch: 7 | variantOfList[List](First:($t@9@00)) != fn$$List__Nil[List] | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | variantOfList[List](First:($t@9@00)) == fn$$List__Nil[List]]
(assert (=
  (variantOfList<List> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))
  (as fn$$List__Nil<List>  List_)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@9@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
