(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:03:01
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0207.vpr
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
(declare-sort BST 0)
(declare-sort Foo 0)
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
(declare-fun $SortWrappers.BSTTo$Snap (BST) $Snap)
(declare-fun $SortWrappers.$SnapToBST ($Snap) BST)
(assert (forall ((x BST)) (!
    (= x ($SortWrappers.$SnapToBST($SortWrappers.BSTTo$Snap x)))
    :pattern (($SortWrappers.BSTTo$Snap x))
    :qid |$Snap.$SnapToBSTTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BSTTo$Snap($SortWrappers.$SnapToBST x)))
    :pattern (($SortWrappers.$SnapToBST x))
    :qid |$Snap.BSTTo$SnapToBST|
    )))
(declare-fun $SortWrappers.FooTo$Snap (Foo) $Snap)
(declare-fun $SortWrappers.$SnapToFoo ($Snap) Foo)
(assert (forall ((x Foo)) (!
    (= x ($SortWrappers.$SnapToFoo($SortWrappers.FooTo$Snap x)))
    :pattern (($SortWrappers.FooTo$Snap x))
    :qid |$Snap.$SnapToFooTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FooTo$Snap($SortWrappers.$SnapToFoo x)))
    :pattern (($SortWrappers.$SnapToFoo x))
    :qid |$Snap.FooTo$SnapToFoo|
    )))
; ////////// Symbols
(declare-fun value<Int> (BST) Int)
(declare-fun left<BST> (BST) BST)
(declare-fun right<BST> (BST) BST)
(declare-const nullNode<BST> BST)
(declare-fun isParent<Bool> (BST BST) Bool)
(declare-const foo<Foo> Foo)
(declare-fun bar<Foo> (Foo) Foo)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((t BST)) (!
  (=>
    (not (= (left<BST> t) (as nullNode<BST>  BST)))
    (> (value<Int> t) (value<Int> (left<BST> t))))
  :pattern ((value<Int> t) (value<Int> (left<BST> t)))
  :qid |prog.left_smaller|)))
(assert (forall ((t BST) (c BST)) (!
  (=>
    (and
      (not (= t (as nullNode<BST>  BST)))
      (and (not (= c (as nullNode<BST>  BST))) (isParent<Bool> (left<BST> t) c)))
    (< (value<Int> c) (value<Int> t)))
  :pattern ((value<Int> t) (value<Int> c))
  :pattern ((isParent<Bool> (left<BST> t) c))
  :qid |prog.left_sub_tree_smaller|)))
(assert (forall ((t BST) (c BST)) (!
  (=>
    (and
      (not (= t (as nullNode<BST>  BST)))
      (and (not (= c (as nullNode<BST>  BST))) (isParent<Bool> (right<BST> t) c)))
    (> (value<Int> c) (value<Int> t)))
  :pattern ((value<Int> t) (value<Int> c))
  :qid |prog.right_sub_tree_larger|)))
(assert (forall ((t BST)) (!
  (isParent<Bool> t t)
  :pattern ((isParent<Bool> t t))
  :qid |prog.isParent_reflexive|)))
(assert (forall ((t BST)) (!
  (and (isParent<Bool> t (left<BST> t)) (isParent<Bool> t (right<BST> t)))
  :pattern ((isParent<Bool> t (left<BST> t)))
  :pattern ((isParent<Bool> t (right<BST> t)))
  :qid |prog.isParent_base|)))
(assert (forall ((p BST) (c BST)) (!
  (=>
    (isParent<Bool> p c)
    (and (isParent<Bool> p (left<BST> c)) (isParent<Bool> p (right<BST> c))))
  :pattern ((isParent<Bool> p (left<BST> c)))
  :pattern ((isParent<Bool> p (right<BST> c)))
  :qid |prog.isParent_recursive|)))
(assert (forall ((p BST) (c BST)) (!
  (=>
    (and
      (not (= p (as nullNode<BST>  BST)))
      (and (isParent<Bool> p c) (> (value<Int> p) (value<Int> c))))
    (and
      (not (= (left<BST> p) (as nullNode<BST>  BST)))
      (isParent<Bool> (left<BST> p) c)))
  :pattern ((isParent<Bool> (left<BST> p) c))
  :qid |prog.isParent_left|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
(declare-const f@0@01 Foo)
(declare-const f@1@01 Foo)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] bar(f) == foo()
; [eval] bar(f)
; [eval] foo()
(assert (= (bar<Foo> f@1@01) (as foo<Foo>  Foo)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- getMin ----------
(declare-const t@3@01 BST)
(declare-const min@4@01 Int)
(declare-const t@5@01 BST)
(declare-const min@6@01 Int)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] !(t == nullNode())
; [eval] t == nullNode()
; [eval] nullNode()
(assert (not (= t@5@01 (as nullNode<BST>  BST))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (forall t1: BST :: { isParent(t1, t) } t1 == t || !isParent(t1, t))
(declare-const t1@8@01 BST)
(push) ; 2
; [eval] t1 == t || !isParent(t1, t)
; [eval] t1 == t
(push) ; 3
; [then-branch: 0 | t1@8@01 == t@5@01 | live]
; [else-branch: 0 | t1@8@01 != t@5@01 | live]
(push) ; 4
; [then-branch: 0 | t1@8@01 == t@5@01]
(assert (= t1@8@01 t@5@01))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | t1@8@01 != t@5@01]
(assert (not (= t1@8@01 t@5@01)))
; [eval] !isParent(t1, t)
; [eval] isParent(t1, t)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (= t1@8@01 t@5@01)) (= t1@8@01 t@5@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t1@8@01 BST)) (!
  (or (not (= t1@8@01 t@5@01)) (= t1@8@01 t@5@01))
  :pattern ((isParent<Bool> t1@8@01 t@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0207.vpr@63@12@63@57-aux|)))
(assert (forall ((t1@8@01 BST)) (!
  (or (= t1@8@01 t@5@01) (not (isParent<Bool> t1@8@01 t@5@01)))
  :pattern ((isParent<Bool> t1@8@01 t@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0207.vpr@63@12@63@57|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] (forall t1: BST :: { value(t1) } !(t1 == nullNode()) && isParent(t, t1) ==> value(t1) >= min)
(declare-const t1@10@01 BST)
(push) ; 3
; [eval] !(t1 == nullNode()) && isParent(t, t1) ==> value(t1) >= min
; [eval] !(t1 == nullNode()) && isParent(t, t1)
; [eval] !(t1 == nullNode())
; [eval] t1 == nullNode()
; [eval] nullNode()
(push) ; 4
; [then-branch: 1 | t1@10@01 == nullNode[BST] | live]
; [else-branch: 1 | t1@10@01 != nullNode[BST] | live]
(push) ; 5
; [then-branch: 1 | t1@10@01 == nullNode[BST]]
(assert (= t1@10@01 (as nullNode<BST>  BST)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | t1@10@01 != nullNode[BST]]
(assert (not (= t1@10@01 (as nullNode<BST>  BST))))
; [eval] isParent(t, t1)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= t1@10@01 (as nullNode<BST>  BST)))
  (= t1@10@01 (as nullNode<BST>  BST))))
(push) ; 4
; [then-branch: 2 | t1@10@01 != nullNode[BST] && isParent[Bool](t@5@01, t1@10@01) | live]
; [else-branch: 2 | !(t1@10@01 != nullNode[BST] && isParent[Bool](t@5@01, t1@10@01)) | live]
(push) ; 5
; [then-branch: 2 | t1@10@01 != nullNode[BST] && isParent[Bool](t@5@01, t1@10@01)]
(assert (and (not (= t1@10@01 (as nullNode<BST>  BST))) (isParent<Bool> t@5@01 t1@10@01)))
; [eval] value(t1) >= min
; [eval] value(t1)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(t1@10@01 != nullNode[BST] && isParent[Bool](t@5@01, t1@10@01))]
(assert (not
  (and
    (not (= t1@10@01 (as nullNode<BST>  BST)))
    (isParent<Bool> t@5@01 t1@10@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (not (= t1@10@01 (as nullNode<BST>  BST)))
      (isParent<Bool> t@5@01 t1@10@01)))
  (and
    (not (= t1@10@01 (as nullNode<BST>  BST)))
    (isParent<Bool> t@5@01 t1@10@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t1@10@01 BST)) (!
  (and
    (or
      (not (= t1@10@01 (as nullNode<BST>  BST)))
      (= t1@10@01 (as nullNode<BST>  BST)))
    (or
      (not
        (and
          (not (= t1@10@01 (as nullNode<BST>  BST)))
          (isParent<Bool> t@5@01 t1@10@01)))
      (and
        (not (= t1@10@01 (as nullNode<BST>  BST)))
        (isParent<Bool> t@5@01 t1@10@01))))
  :pattern ((value<Int> t1@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0207.vpr@64@11@65@56-aux|)))
(assert (forall ((t1@10@01 BST)) (!
  (=>
    (and
      (not (= t1@10@01 (as nullNode<BST>  BST)))
      (isParent<Bool> t@5@01 t1@10@01))
    (>= (value<Int> t1@10@01) min@6@01))
  :pattern ((value<Int> t1@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0207.vpr@64@11@65@56|)))
(pop) ; 2
(push) ; 2
; [exec]
; var currentNode: BST
(declare-const currentNode@11@01 BST)
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
