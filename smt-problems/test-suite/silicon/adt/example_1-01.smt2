(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:39:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/example_1.vpr
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
(declare-sort Tree 0)
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
(declare-fun $SortWrappers.TreeTo$Snap (Tree) $Snap)
(declare-fun $SortWrappers.$SnapToTree ($Snap) Tree)
(assert (forall ((x Tree)) (!
    (= x ($SortWrappers.$SnapToTree($SortWrappers.TreeTo$Snap x)))
    :pattern (($SortWrappers.TreeTo$Snap x))
    :qid |$Snap.$SnapToTreeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.TreeTo$Snap($SortWrappers.$SnapToTree x)))
    :pattern (($SortWrappers.$SnapToTree x))
    :qid |$Snap.TreeTo$SnapToTree|
    )))
; ////////// Symbols
(declare-const Leaf<Tree> Tree)
(declare-fun Node<Tree> (Int Tree Tree) Tree)
(declare-fun get_Tree_v<Int> (Tree) Int)
(declare-fun get_Tree_left<Tree> (Tree) Tree)
(declare-fun get_Tree_right<Tree> (Tree) Tree)
(declare-fun Tree_tag<Int> (Tree) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun allNodesGreaterThan ($Snap Tree Int) Bool)
(declare-fun allNodesGreaterThan%limited ($Snap Tree Int) Bool)
(declare-fun allNodesGreaterThan%stateless (Tree Int) Bool)
(declare-fun allNodesGreaterThan%precondition ($Snap Tree Int) Bool)
(declare-fun allNodesLessThan ($Snap Tree Int) Bool)
(declare-fun allNodesLessThan%limited ($Snap Tree Int) Bool)
(declare-fun allNodesLessThan%stateless (Tree Int) Bool)
(declare-fun allNodesLessThan%precondition ($Snap Tree Int) Bool)
(declare-fun isBST ($Snap Tree) Bool)
(declare-fun isBST%limited ($Snap Tree) Bool)
(declare-fun isBST%stateless (Tree) Bool)
(declare-fun isBST%precondition ($Snap Tree) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((v Int) (left Tree) (right Tree)) (!
  (= v (get_Tree_v<Int> (Node<Tree> v left right)))
  :pattern ((Node<Tree> v left right))
  )))
(assert (forall ((v Int) (left Tree) (right Tree)) (!
  (= left (get_Tree_left<Tree> (Node<Tree> v left right)))
  :pattern ((Node<Tree> v left right))
  )))
(assert (forall ((v Int) (left Tree) (right Tree)) (!
  (= right (get_Tree_right<Tree> (Node<Tree> v left right)))
  :pattern ((Node<Tree> v left right))
  )))
(assert (= (Tree_tag<Int> (as Leaf<Tree>  Tree)) 0))
(assert (forall ((v Int) (left Tree) (right Tree)) (!
  (= (Tree_tag<Int> (Node<Tree> v left right)) 1)
  :pattern ((Node<Tree> v left right))
  )))
(assert (forall ((t Tree)) (!
  (or
    (= t (as Leaf<Tree>  Tree))
    (=
      t
      (Node<Tree> (get_Tree_v<Int> t) (get_Tree_left<Tree> t) (get_Tree_right<Tree> t))))
  :pattern ((Tree_tag<Int> t))
  :pattern ((get_Tree_v<Int> t))
  :pattern ((get_Tree_left<Tree> t))
  :pattern ((get_Tree_right<Tree> t))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION allNodesGreaterThan----------
(declare-fun t@0@00 () Tree)
(declare-fun value@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@0@00 Tree) (value@1@00 Int)) (!
  (=
    (allNodesGreaterThan%limited s@$ t@0@00 value@1@00)
    (allNodesGreaterThan s@$ t@0@00 value@1@00))
  :pattern ((allNodesGreaterThan s@$ t@0@00 value@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree) (value@1@00 Int)) (!
  (allNodesGreaterThan%stateless t@0@00 value@1@00)
  :pattern ((allNodesGreaterThan%limited s@$ t@0@00 value@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (Tree_tag(t) == 0 ? true : get_Tree_v(t) > value && (allNodesGreaterThan(get_Tree_left(t), value) && allNodesGreaterThan(get_Tree_right(t), value)))
; [eval] Tree_tag(t) == 0
; [eval] Tree_tag(t)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> t@0@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> t@0@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | Tree_tag[Int](t@0@00) == 0 | live]
; [else-branch: 0 | Tree_tag[Int](t@0@00) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | Tree_tag[Int](t@0@00) == 0]
(assert (= (Tree_tag<Int> t@0@00) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | Tree_tag[Int](t@0@00) != 0]
(assert (not (= (Tree_tag<Int> t@0@00) 0)))
; [eval] get_Tree_v(t) > value && (allNodesGreaterThan(get_Tree_left(t), value) && allNodesGreaterThan(get_Tree_right(t), value))
; [eval] get_Tree_v(t) > value
; [eval] get_Tree_v(t)
(push) ; 4
; [then-branch: 1 | !(get_Tree_v[Int](t@0@00) > value@1@00) | live]
; [else-branch: 1 | get_Tree_v[Int](t@0@00) > value@1@00 | live]
(push) ; 5
; [then-branch: 1 | !(get_Tree_v[Int](t@0@00) > value@1@00)]
(assert (not (> (get_Tree_v<Int> t@0@00) value@1@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | get_Tree_v[Int](t@0@00) > value@1@00]
(assert (> (get_Tree_v<Int> t@0@00) value@1@00))
; [eval] allNodesGreaterThan(get_Tree_left(t), value)
; [eval] get_Tree_left(t)
(push) ; 6
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00))
(pop) ; 6
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00))
(push) ; 6
; [then-branch: 2 | !(allNodesGreaterThan(_, get_Tree_left[Tree](t@0@00), value@1@00)) | live]
; [else-branch: 2 | allNodesGreaterThan(_, get_Tree_left[Tree](t@0@00), value@1@00) | live]
(push) ; 7
; [then-branch: 2 | !(allNodesGreaterThan(_, get_Tree_left[Tree](t@0@00), value@1@00))]
(assert (not (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | allNodesGreaterThan(_, get_Tree_left[Tree](t@0@00), value@1@00)]
(assert (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00))
; [eval] allNodesGreaterThan(get_Tree_right(t), value)
; [eval] get_Tree_right(t)
(push) ; 8
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@0@00) value@1@00))
(pop) ; 8
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@0@00) value@1@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
    (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@0@00) value@1@00))))
(assert (or
  (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
  (not (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (> (get_Tree_v<Int> t@0@00) value@1@00)
  (and
    (> (get_Tree_v<Int> t@0@00) value@1@00)
    (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
    (=>
      (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
        (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@0@00) value@1@00)))
    (or
      (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
      (not
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00))))))
(assert (or
  (> (get_Tree_v<Int> t@0@00) value@1@00)
  (not (> (get_Tree_v<Int> t@0@00) value@1@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Tree_tag<Int> t@0@00) 0))
  (and
    (not (= (Tree_tag<Int> t@0@00) 0))
    (=>
      (> (get_Tree_v<Int> t@0@00) value@1@00)
      (and
        (> (get_Tree_v<Int> t@0@00) value@1@00)
        (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
        (=>
          (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
          (and
            (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
            (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@0@00) value@1@00)))
        (or
          (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
          (not
            (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)))))
    (or
      (> (get_Tree_v<Int> t@0@00) value@1@00)
      (not (> (get_Tree_v<Int> t@0@00) value@1@00))))))
(assert (or (not (= (Tree_tag<Int> t@0@00) 0)) (= (Tree_tag<Int> t@0@00) 0)))
(assert (=
  result@2@00
  (ite
    (= (Tree_tag<Int> t@0@00) 0)
    true
    (and
      (> (get_Tree_v<Int> t@0@00) value@1@00)
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@0@00) value@1@00))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@0@00 Tree) (value@1@00 Int)) (!
  (=>
    (allNodesGreaterThan%precondition s@$ t@0@00 value@1@00)
    (=
      (allNodesGreaterThan s@$ t@0@00 value@1@00)
      (ite
        (= (Tree_tag<Int> t@0@00) 0)
        true
        (and
          (> (get_Tree_v<Int> t@0@00) value@1@00)
          (and
            (allNodesGreaterThan%limited $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
            (allNodesGreaterThan%limited $Snap.unit (get_Tree_right<Tree> t@0@00) value@1@00))))))
  :pattern ((allNodesGreaterThan s@$ t@0@00 value@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree) (value@1@00 Int)) (!
  (=>
    (allNodesGreaterThan%precondition s@$ t@0@00 value@1@00)
    (ite
      (= (Tree_tag<Int> t@0@00) 0)
      true
      (=>
        (> (get_Tree_v<Int> t@0@00) value@1@00)
        (and
          (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
          (=>
            (allNodesGreaterThan%limited $Snap.unit (get_Tree_left<Tree> t@0@00) value@1@00)
            (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@0@00) value@1@00))))))
  :pattern ((allNodesGreaterThan s@$ t@0@00 value@1@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION allNodesLessThan----------
(declare-fun t@3@00 () Tree)
(declare-fun value@4@00 () Int)
(declare-fun result@5@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@3@00 Tree) (value@4@00 Int)) (!
  (=
    (allNodesLessThan%limited s@$ t@3@00 value@4@00)
    (allNodesLessThan s@$ t@3@00 value@4@00))
  :pattern ((allNodesLessThan s@$ t@3@00 value@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (t@3@00 Tree) (value@4@00 Int)) (!
  (allNodesLessThan%stateless t@3@00 value@4@00)
  :pattern ((allNodesLessThan%limited s@$ t@3@00 value@4@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (Tree_tag(t) == 0 ? true : get_Tree_v(t) < value && (allNodesLessThan(get_Tree_right(t), value) && allNodesLessThan(get_Tree_left(t), value)))
; [eval] Tree_tag(t) == 0
; [eval] Tree_tag(t)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> t@3@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> t@3@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | Tree_tag[Int](t@3@00) == 0 | live]
; [else-branch: 3 | Tree_tag[Int](t@3@00) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | Tree_tag[Int](t@3@00) == 0]
(assert (= (Tree_tag<Int> t@3@00) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | Tree_tag[Int](t@3@00) != 0]
(assert (not (= (Tree_tag<Int> t@3@00) 0)))
; [eval] get_Tree_v(t) < value && (allNodesLessThan(get_Tree_right(t), value) && allNodesLessThan(get_Tree_left(t), value))
; [eval] get_Tree_v(t) < value
; [eval] get_Tree_v(t)
(push) ; 4
; [then-branch: 4 | !(get_Tree_v[Int](t@3@00) < value@4@00) | live]
; [else-branch: 4 | get_Tree_v[Int](t@3@00) < value@4@00 | live]
(push) ; 5
; [then-branch: 4 | !(get_Tree_v[Int](t@3@00) < value@4@00)]
(assert (not (< (get_Tree_v<Int> t@3@00) value@4@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | get_Tree_v[Int](t@3@00) < value@4@00]
(assert (< (get_Tree_v<Int> t@3@00) value@4@00))
; [eval] allNodesLessThan(get_Tree_right(t), value)
; [eval] get_Tree_right(t)
(push) ; 6
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00))
(pop) ; 6
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00))
(push) ; 6
; [then-branch: 5 | !(allNodesLessThan(_, get_Tree_right[Tree](t@3@00), value@4@00)) | live]
; [else-branch: 5 | allNodesLessThan(_, get_Tree_right[Tree](t@3@00), value@4@00) | live]
(push) ; 7
; [then-branch: 5 | !(allNodesLessThan(_, get_Tree_right[Tree](t@3@00), value@4@00))]
(assert (not (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | allNodesLessThan(_, get_Tree_right[Tree](t@3@00), value@4@00)]
(assert (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00))
; [eval] allNodesLessThan(get_Tree_left(t), value)
; [eval] get_Tree_left(t)
(push) ; 8
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@3@00) value@4@00))
(pop) ; 8
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@3@00) value@4@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
  (and
    (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
    (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@3@00) value@4@00))))
(assert (or
  (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
  (not (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (< (get_Tree_v<Int> t@3@00) value@4@00)
  (and
    (< (get_Tree_v<Int> t@3@00) value@4@00)
    (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
    (=>
      (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
      (and
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
        (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@3@00) value@4@00)))
    (or
      (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
      (not
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00))))))
(assert (or
  (< (get_Tree_v<Int> t@3@00) value@4@00)
  (not (< (get_Tree_v<Int> t@3@00) value@4@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Tree_tag<Int> t@3@00) 0))
  (and
    (not (= (Tree_tag<Int> t@3@00) 0))
    (=>
      (< (get_Tree_v<Int> t@3@00) value@4@00)
      (and
        (< (get_Tree_v<Int> t@3@00) value@4@00)
        (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
        (=>
          (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
          (and
            (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
            (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@3@00) value@4@00)))
        (or
          (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
          (not
            (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)))))
    (or
      (< (get_Tree_v<Int> t@3@00) value@4@00)
      (not (< (get_Tree_v<Int> t@3@00) value@4@00))))))
(assert (or (not (= (Tree_tag<Int> t@3@00) 0)) (= (Tree_tag<Int> t@3@00) 0)))
(assert (=
  result@5@00
  (ite
    (= (Tree_tag<Int> t@3@00) 0)
    true
    (and
      (< (get_Tree_v<Int> t@3@00) value@4@00)
      (and
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@3@00) value@4@00))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@3@00 Tree) (value@4@00 Int)) (!
  (=>
    (allNodesLessThan%precondition s@$ t@3@00 value@4@00)
    (=
      (allNodesLessThan s@$ t@3@00 value@4@00)
      (ite
        (= (Tree_tag<Int> t@3@00) 0)
        true
        (and
          (< (get_Tree_v<Int> t@3@00) value@4@00)
          (and
            (allNodesLessThan%limited $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
            (allNodesLessThan%limited $Snap.unit (get_Tree_left<Tree> t@3@00) value@4@00))))))
  :pattern ((allNodesLessThan s@$ t@3@00 value@4@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (t@3@00 Tree) (value@4@00 Int)) (!
  (=>
    (allNodesLessThan%precondition s@$ t@3@00 value@4@00)
    (ite
      (= (Tree_tag<Int> t@3@00) 0)
      true
      (=>
        (< (get_Tree_v<Int> t@3@00) value@4@00)
        (and
          (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
          (=>
            (allNodesLessThan%limited $Snap.unit (get_Tree_right<Tree> t@3@00) value@4@00)
            (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@3@00) value@4@00))))))
  :pattern ((allNodesLessThan s@$ t@3@00 value@4@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION isBST----------
(declare-fun t@6@00 () Tree)
(declare-fun result@7@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (= (isBST%limited s@$ t@6@00) (isBST s@$ t@6@00))
  :pattern ((isBST s@$ t@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (isBST%stateless t@6@00)
  :pattern ((isBST%limited s@$ t@6@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (Tree_tag(t) == 0 ? true : allNodesLessThan(get_Tree_left(t), get_Tree_v(t)) && (isBST(get_Tree_left(t)) && (allNodesGreaterThan(get_Tree_right(t), get_Tree_v(t)) && isBST(get_Tree_right(t)))))
; [eval] Tree_tag(t) == 0
; [eval] Tree_tag(t)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> t@6@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> t@6@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | Tree_tag[Int](t@6@00) == 0 | live]
; [else-branch: 6 | Tree_tag[Int](t@6@00) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | Tree_tag[Int](t@6@00) == 0]
(assert (= (Tree_tag<Int> t@6@00) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | Tree_tag[Int](t@6@00) != 0]
(assert (not (= (Tree_tag<Int> t@6@00) 0)))
; [eval] allNodesLessThan(get_Tree_left(t), get_Tree_v(t)) && (isBST(get_Tree_left(t)) && (allNodesGreaterThan(get_Tree_right(t), get_Tree_v(t)) && isBST(get_Tree_right(t))))
; [eval] allNodesLessThan(get_Tree_left(t), get_Tree_v(t))
; [eval] get_Tree_left(t)
; [eval] get_Tree_v(t)
(push) ; 4
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))
(pop) ; 4
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))
(push) ; 4
; [then-branch: 7 | !(allNodesLessThan(_, get_Tree_left[Tree](t@6@00), get_Tree_v[Int](t@6@00))) | live]
; [else-branch: 7 | allNodesLessThan(_, get_Tree_left[Tree](t@6@00), get_Tree_v[Int](t@6@00)) | live]
(push) ; 5
; [then-branch: 7 | !(allNodesLessThan(_, get_Tree_left[Tree](t@6@00), get_Tree_v[Int](t@6@00)))]
(assert (not
  (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | allNodesLessThan(_, get_Tree_left[Tree](t@6@00), get_Tree_v[Int](t@6@00))]
(assert (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))
; [eval] isBST(get_Tree_left(t))
; [eval] get_Tree_left(t)
(push) ; 6
(assert (isBST%precondition $Snap.unit (get_Tree_left<Tree> t@6@00)))
(pop) ; 6
; Joined path conditions
(assert (isBST%precondition $Snap.unit (get_Tree_left<Tree> t@6@00)))
(push) ; 6
; [then-branch: 8 | !(isBST(_, get_Tree_left[Tree](t@6@00))) | live]
; [else-branch: 8 | isBST(_, get_Tree_left[Tree](t@6@00)) | live]
(push) ; 7
; [then-branch: 8 | !(isBST(_, get_Tree_left[Tree](t@6@00)))]
(assert (not (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | isBST(_, get_Tree_left[Tree](t@6@00))]
(assert (isBST $Snap.unit (get_Tree_left<Tree> t@6@00)))
; [eval] allNodesGreaterThan(get_Tree_right(t), get_Tree_v(t))
; [eval] get_Tree_right(t)
; [eval] get_Tree_v(t)
(push) ; 8
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))
(pop) ; 8
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))
(push) ; 8
; [then-branch: 9 | !(allNodesGreaterThan(_, get_Tree_right[Tree](t@6@00), get_Tree_v[Int](t@6@00))) | live]
; [else-branch: 9 | allNodesGreaterThan(_, get_Tree_right[Tree](t@6@00), get_Tree_v[Int](t@6@00)) | live]
(push) ; 9
; [then-branch: 9 | !(allNodesGreaterThan(_, get_Tree_right[Tree](t@6@00), get_Tree_v[Int](t@6@00)))]
(assert (not
  (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))))
(pop) ; 9
(push) ; 9
; [else-branch: 9 | allNodesGreaterThan(_, get_Tree_right[Tree](t@6@00), get_Tree_v[Int](t@6@00))]
(assert (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))
; [eval] isBST(get_Tree_right(t))
; [eval] get_Tree_right(t)
(push) ; 10
(assert (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@6@00)))
(pop) ; 10
; Joined path conditions
(assert (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@6@00)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
    (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@6@00)))))
(assert (or
  (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
  (not
    (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
  (and
    (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
    (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
    (=>
      (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
        (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@6@00))))
    (or
      (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
      (not
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))))))
(assert (or
  (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
  (not (isBST $Snap.unit (get_Tree_left<Tree> t@6@00)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
  (and
    (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
    (isBST%precondition $Snap.unit (get_Tree_left<Tree> t@6@00))
    (=>
      (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
      (and
        (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
        (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
        (=>
          (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
          (and
            (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
            (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@6@00))))
        (or
          (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
          (not
            (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))))))
    (or
      (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
      (not (isBST $Snap.unit (get_Tree_left<Tree> t@6@00)))))))
(assert (or
  (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
  (not
    (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Tree_tag<Int> t@6@00) 0))
  (and
    (not (= (Tree_tag<Int> t@6@00) 0))
    (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
    (=>
      (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
        (isBST%precondition $Snap.unit (get_Tree_left<Tree> t@6@00))
        (=>
          (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
          (and
            (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
            (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
            (=>
              (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
              (and
                (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
                (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@6@00))))
            (or
              (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
              (not
                (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))))))
        (or
          (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
          (not (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))))))
    (or
      (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
      (not
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00)))))))
(assert (or (not (= (Tree_tag<Int> t@6@00) 0)) (= (Tree_tag<Int> t@6@00) 0)))
(assert (=
  result@7@00
  (ite
    (= (Tree_tag<Int> t@6@00) 0)
    true
    (and
      (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
      (and
        (isBST $Snap.unit (get_Tree_left<Tree> t@6@00))
        (and
          (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
          (isBST $Snap.unit (get_Tree_right<Tree> t@6@00))))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (=>
    (isBST%precondition s@$ t@6@00)
    (=
      (isBST s@$ t@6@00)
      (ite
        (= (Tree_tag<Int> t@6@00) 0)
        true
        (and
          (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
          (and
            (isBST%limited $Snap.unit (get_Tree_left<Tree> t@6@00))
            (and
              (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
              (isBST%limited $Snap.unit (get_Tree_right<Tree> t@6@00))))))))
  :pattern ((isBST s@$ t@6@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (=>
    (isBST%precondition s@$ t@6@00)
    (ite
      (= (Tree_tag<Int> t@6@00) 0)
      true
      (and
        (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
        (=>
          (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
          (and
            (isBST%precondition $Snap.unit (get_Tree_left<Tree> t@6@00))
            (=>
              (isBST%limited $Snap.unit (get_Tree_left<Tree> t@6@00))
              (and
                (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
                (=>
                  (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@6@00) (get_Tree_v<Int> t@6@00))
                  (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@6@00))))))))))
  :pattern ((isBST s@$ t@6@00))
  :qid |quant-u-11|)))
