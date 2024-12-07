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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
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
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (= (isBST%limited s@$ t@6@00) (isBST s@$ t@6@00))
  :pattern ((isBST s@$ t@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (isBST%stateless t@6@00)
  :pattern ((isBST%limited s@$ t@6@00))
  :qid |quant-u-5|)))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- insertValue ----------
(declare-const v@0@01 Int)
(declare-const t@1@01 Tree)
(declare-const res@2@01 Tree)
(declare-const v@3@01 Int)
(declare-const t@4@01 Tree)
(declare-const res@5@01 Tree)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] (forall i: Int :: { allNodesGreaterThan(t, i) } { allNodesGreaterThan(res, i) } allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i))
(declare-const i@7@01 Int)
(push) ; 3
; [eval] allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i)
; [eval] allNodesGreaterThan(t, i) && i < v
; [eval] allNodesGreaterThan(t, i)
(push) ; 4
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@7@01))
(pop) ; 4
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@7@01))
(push) ; 4
; [then-branch: 0 | !(allNodesGreaterThan(_, t@4@01, i@7@01)) | live]
; [else-branch: 0 | allNodesGreaterThan(_, t@4@01, i@7@01) | live]
(push) ; 5
; [then-branch: 0 | !(allNodesGreaterThan(_, t@4@01, i@7@01))]
(assert (not (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | allNodesGreaterThan(_, t@4@01, i@7@01)]
(assert (allNodesGreaterThan $Snap.unit t@4@01 i@7@01))
; [eval] i < v
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)
  (not (allNodesGreaterThan $Snap.unit t@4@01 i@7@01))))
(push) ; 4
; [then-branch: 1 | allNodesGreaterThan(_, t@4@01, i@7@01) && i@7@01 < v@3@01 | live]
; [else-branch: 1 | !(allNodesGreaterThan(_, t@4@01, i@7@01) && i@7@01 < v@3@01) | live]
(push) ; 5
; [then-branch: 1 | allNodesGreaterThan(_, t@4@01, i@7@01) && i@7@01 < v@3@01]
(assert (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01)))
; [eval] allNodesGreaterThan(res, i)
(push) ; 6
(assert (allNodesGreaterThan%precondition $Snap.unit res@5@01 i@7@01))
(pop) ; 6
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit res@5@01 i@7@01))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(allNodesGreaterThan(_, t@4@01, i@7@01) && i@7@01 < v@3@01)]
(assert (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01))
  (and
    (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)
    (< i@7@01 v@3@01)
    (allNodesGreaterThan%precondition $Snap.unit res@5@01 i@7@01))))
; Joined path conditions
(assert (or
  (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01)))
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@7@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)))
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)
        (< i@7@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@5@01 i@7@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@7@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@7@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@7@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)))
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit t@4@01 i@7@01)
        (< i@7@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@5@01 i@7@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@5@01 i@7@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (allNodesGreaterThan $Snap.unit t@4@01 i@7@01) (< i@7@01 v@3@01))
    (allNodesGreaterThan $Snap.unit res@5@01 i@7@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@7@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@5@01 i@7@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] (forall i: Int :: { allNodesLessThan(t, i) } { allNodesLessThan(res, i) } allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i))
(declare-const i@8@01 Int)
(push) ; 3
; [eval] allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i)
; [eval] allNodesLessThan(t, i) && v < i
; [eval] allNodesLessThan(t, i)
(push) ; 4
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@8@01))
(pop) ; 4
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@8@01))
(push) ; 4
; [then-branch: 2 | !(allNodesLessThan(_, t@4@01, i@8@01)) | live]
; [else-branch: 2 | allNodesLessThan(_, t@4@01, i@8@01) | live]
(push) ; 5
; [then-branch: 2 | !(allNodesLessThan(_, t@4@01, i@8@01))]
(assert (not (allNodesLessThan $Snap.unit t@4@01 i@8@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | allNodesLessThan(_, t@4@01, i@8@01)]
(assert (allNodesLessThan $Snap.unit t@4@01 i@8@01))
; [eval] v < i
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesLessThan $Snap.unit t@4@01 i@8@01)
  (not (allNodesLessThan $Snap.unit t@4@01 i@8@01))))
(push) ; 4
; [then-branch: 3 | allNodesLessThan(_, t@4@01, i@8@01) && v@3@01 < i@8@01 | live]
; [else-branch: 3 | !(allNodesLessThan(_, t@4@01, i@8@01) && v@3@01 < i@8@01) | live]
(push) ; 5
; [then-branch: 3 | allNodesLessThan(_, t@4@01, i@8@01) && v@3@01 < i@8@01]
(assert (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01)))
; [eval] allNodesLessThan(res, i)
(push) ; 6
(assert (allNodesLessThan%precondition $Snap.unit res@5@01 i@8@01))
(pop) ; 6
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit res@5@01 i@8@01))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(allNodesLessThan(_, t@4@01, i@8@01) && v@3@01 < i@8@01)]
(assert (not (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01))
  (and
    (allNodesLessThan $Snap.unit t@4@01 i@8@01)
    (< v@3@01 i@8@01)
    (allNodesLessThan%precondition $Snap.unit res@5@01 i@8@01))))
; Joined path conditions
(assert (or
  (not (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01)))
  (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@8@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@8@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@8@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@8@01)))
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01))
      (and
        (allNodesLessThan $Snap.unit t@4@01 i@8@01)
        (< v@3@01 i@8@01)
        (allNodesLessThan%precondition $Snap.unit res@5@01 i@8@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@8@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@8@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@8@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@8@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@8@01)))
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01))
      (and
        (allNodesLessThan $Snap.unit t@4@01 i@8@01)
        (< v@3@01 i@8@01)
        (allNodesLessThan%precondition $Snap.unit res@5@01 i@8@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit res@5@01 i@8@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@8@01 Int)) (!
  (=>
    (and (allNodesLessThan $Snap.unit t@4@01 i@8@01) (< v@3@01 i@8@01))
    (allNodesLessThan $Snap.unit res@5@01 i@8@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@8@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@5@01 i@8@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|)))
(assert (= ($Snap.second ($Snap.second $t@6@01)) $Snap.unit))
; [eval] isBST(t) ==> isBST(res)
; [eval] isBST(t)
(push) ; 3
(assert (isBST%precondition $Snap.unit t@4@01))
(pop) ; 3
; Joined path conditions
(assert (isBST%precondition $Snap.unit t@4@01))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (isBST $Snap.unit t@4@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (isBST $Snap.unit t@4@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | isBST(_, t@4@01) | live]
; [else-branch: 4 | !(isBST(_, t@4@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | isBST(_, t@4@01)]
(assert (isBST $Snap.unit t@4@01))
; [eval] isBST(res)
(push) ; 5
(assert (isBST%precondition $Snap.unit res@5@01))
(pop) ; 5
; Joined path conditions
(assert (isBST%precondition $Snap.unit res@5@01))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(isBST(_, t@4@01))]
(assert (not (isBST $Snap.unit t@4@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (isBST $Snap.unit t@4@01)
  (and (isBST $Snap.unit t@4@01) (isBST%precondition $Snap.unit res@5@01))))
; Joined path conditions
(assert (or (not (isBST $Snap.unit t@4@01)) (isBST $Snap.unit t@4@01)))
(assert (=> (isBST $Snap.unit t@4@01) (isBST $Snap.unit res@5@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var new_rightsubtree: Tree
(declare-const new_rightsubtree@9@01 Tree)
; [exec]
; var new_leftsubtree: Tree
(declare-const new_leftsubtree@10@01 Tree)
; [eval] Tree_tag(t) == 0
; [eval] Tree_tag(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> t@4@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> t@4@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | Tree_tag[Int](t@4@01) == 0 | live]
; [else-branch: 5 | Tree_tag[Int](t@4@01) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | Tree_tag[Int](t@4@01) == 0]
(assert (= (Tree_tag<Int> t@4@01) 0))
; [exec]
; res := Node(v, Leaf(), Leaf())
; [eval] Node(v, Leaf(), Leaf())
; [eval] Leaf()
; [eval] Leaf()
(declare-const res@11@01 Tree)
(assert (= res@11@01 (Node<Tree> v@3@01 (as Leaf<Tree>  Tree) (as Leaf<Tree>  Tree))))
; [eval] (forall i: Int :: { allNodesGreaterThan(t, i) } { allNodesGreaterThan(res, i) } allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i))
(declare-const i@12@01 Int)
(push) ; 4
; [eval] allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i)
; [eval] allNodesGreaterThan(t, i) && i < v
; [eval] allNodesGreaterThan(t, i)
(push) ; 5
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@12@01))
(pop) ; 5
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@12@01))
(push) ; 5
; [then-branch: 6 | !(allNodesGreaterThan(_, t@4@01, i@12@01)) | live]
; [else-branch: 6 | allNodesGreaterThan(_, t@4@01, i@12@01) | live]
(push) ; 6
; [then-branch: 6 | !(allNodesGreaterThan(_, t@4@01, i@12@01))]
(assert (not (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | allNodesGreaterThan(_, t@4@01, i@12@01)]
(assert (allNodesGreaterThan $Snap.unit t@4@01 i@12@01))
; [eval] i < v
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)
  (not (allNodesGreaterThan $Snap.unit t@4@01 i@12@01))))
(push) ; 5
; [then-branch: 7 | allNodesGreaterThan(_, t@4@01, i@12@01) && i@12@01 < v@3@01 | live]
; [else-branch: 7 | !(allNodesGreaterThan(_, t@4@01, i@12@01) && i@12@01 < v@3@01) | live]
(push) ; 6
; [then-branch: 7 | allNodesGreaterThan(_, t@4@01, i@12@01) && i@12@01 < v@3@01]
(assert (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01)))
; [eval] allNodesGreaterThan(res, i)
(push) ; 7
(assert (allNodesGreaterThan%precondition $Snap.unit res@11@01 i@12@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit res@11@01 i@12@01))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | !(allNodesGreaterThan(_, t@4@01, i@12@01) && i@12@01 < v@3@01)]
(assert (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))
  (and
    (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)
    (< i@12@01 v@3@01)
    (allNodesGreaterThan%precondition $Snap.unit res@11@01 i@12@01))))
; Joined path conditions
(assert (or
  (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01)))
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@12@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@12@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)))
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)
        (< i@12@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@11@01 i@12@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@12@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@12@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)))
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)
        (< i@12@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@11@01 i@12@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@11@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@12@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@12@01)
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))
      (allNodesGreaterThan%precondition $Snap.unit res@11@01 i@12@01)))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@12@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@11@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94_precondition|)))
(push) ; 4
(assert (not (forall ((i@12@01 Int)) (!
  (=>
    (and
      (and
        (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@12@01)
        (=>
          (and
            (allNodesGreaterThan $Snap.unit t@4@01 i@12@01)
            (< i@12@01 v@3@01))
          (allNodesGreaterThan%precondition $Snap.unit res@11@01 i@12@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01)))
    (allNodesGreaterThan $Snap.unit res@11@01 i@12@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@12@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@11@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (allNodesGreaterThan $Snap.unit t@4@01 i@12@01) (< i@12@01 v@3@01))
    (allNodesGreaterThan $Snap.unit res@11@01 i@12@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@12@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@11@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|)))
; [eval] (forall i: Int :: { allNodesLessThan(t, i) } { allNodesLessThan(res, i) } allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i))
(declare-const i@13@01 Int)
(push) ; 4
; [eval] allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i)
; [eval] allNodesLessThan(t, i) && v < i
; [eval] allNodesLessThan(t, i)
(push) ; 5
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@13@01))
(pop) ; 5
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@13@01))
(push) ; 5
; [then-branch: 8 | !(allNodesLessThan(_, t@4@01, i@13@01)) | live]
; [else-branch: 8 | allNodesLessThan(_, t@4@01, i@13@01) | live]
(push) ; 6
; [then-branch: 8 | !(allNodesLessThan(_, t@4@01, i@13@01))]
(assert (not (allNodesLessThan $Snap.unit t@4@01 i@13@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | allNodesLessThan(_, t@4@01, i@13@01)]
(assert (allNodesLessThan $Snap.unit t@4@01 i@13@01))
; [eval] v < i
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesLessThan $Snap.unit t@4@01 i@13@01)
  (not (allNodesLessThan $Snap.unit t@4@01 i@13@01))))
(push) ; 5
; [then-branch: 9 | allNodesLessThan(_, t@4@01, i@13@01) && v@3@01 < i@13@01 | live]
; [else-branch: 9 | !(allNodesLessThan(_, t@4@01, i@13@01) && v@3@01 < i@13@01) | live]
(push) ; 6
; [then-branch: 9 | allNodesLessThan(_, t@4@01, i@13@01) && v@3@01 < i@13@01]
(assert (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01)))
; [eval] allNodesLessThan(res, i)
(push) ; 7
(assert (allNodesLessThan%precondition $Snap.unit res@11@01 i@13@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit res@11@01 i@13@01))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | !(allNodesLessThan(_, t@4@01, i@13@01) && v@3@01 < i@13@01)]
(assert (not (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))
  (and
    (allNodesLessThan $Snap.unit t@4@01 i@13@01)
    (< v@3@01 i@13@01)
    (allNodesLessThan%precondition $Snap.unit res@11@01 i@13@01))))
; Joined path conditions
(assert (or
  (not (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01)))
  (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@13@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@13@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@13@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@13@01)))
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))
      (and
        (allNodesLessThan $Snap.unit t@4@01 i@13@01)
        (< v@3@01 i@13@01)
        (allNodesLessThan%precondition $Snap.unit res@11@01 i@13@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@13@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@13@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@13@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@13@01)))
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))
      (and
        (allNodesLessThan $Snap.unit t@4@01 i@13@01)
        (< v@3@01 i@13@01)
        (allNodesLessThan%precondition $Snap.unit res@11@01 i@13@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit res@11@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@13@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@13@01)
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))
      (allNodesLessThan%precondition $Snap.unit res@11@01 i@13@01)))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@13@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@11@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89_precondition|)))
(push) ; 4
(assert (not (forall ((i@13@01 Int)) (!
  (=>
    (and
      (and
        (allNodesLessThan%precondition $Snap.unit t@4@01 i@13@01)
        (=>
          (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))
          (allNodesLessThan%precondition $Snap.unit res@11@01 i@13@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01)))
    (allNodesLessThan $Snap.unit res@11@01 i@13@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@13@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@11@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (allNodesLessThan $Snap.unit t@4@01 i@13@01) (< v@3@01 i@13@01))
    (allNodesLessThan $Snap.unit res@11@01 i@13@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@13@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@11@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|)))
; [eval] isBST(t) ==> isBST(res)
; [eval] isBST(t)
(push) ; 4
(assert (isBST%precondition $Snap.unit t@4@01))
(pop) ; 4
; Joined path conditions
(assert (isBST%precondition $Snap.unit t@4@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (isBST $Snap.unit t@4@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (isBST $Snap.unit t@4@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | isBST(_, t@4@01) | live]
; [else-branch: 10 | !(isBST(_, t@4@01)) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | isBST(_, t@4@01)]
(assert (isBST $Snap.unit t@4@01))
; [eval] isBST(res)
(push) ; 6
(assert (isBST%precondition $Snap.unit res@11@01))
(pop) ; 6
; Joined path conditions
(assert (isBST%precondition $Snap.unit res@11@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (isBST $Snap.unit t@4@01)
  (and (isBST $Snap.unit t@4@01) (isBST%precondition $Snap.unit res@11@01))))
(assert (isBST $Snap.unit t@4@01))
(push) ; 4
(assert (not (=> (isBST $Snap.unit t@4@01) (isBST $Snap.unit res@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (isBST $Snap.unit t@4@01) (isBST $Snap.unit res@11@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | Tree_tag[Int](t@4@01) != 0]
(assert (not (= (Tree_tag<Int> t@4@01) 0)))
(pop) ; 3
; [eval] !(Tree_tag(t) == 0)
; [eval] Tree_tag(t) == 0
; [eval] Tree_tag(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> t@4@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> t@4@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | Tree_tag[Int](t@4@01) != 0 | live]
; [else-branch: 11 | Tree_tag[Int](t@4@01) == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | Tree_tag[Int](t@4@01) != 0]
(assert (not (= (Tree_tag<Int> t@4@01) 0)))
; [eval] v == get_Tree_v(t)
; [eval] get_Tree_v(t)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= v@3@01 (get_Tree_v<Int> t@4@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= v@3@01 (get_Tree_v<Int> t@4@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | v@3@01 == get_Tree_v[Int](t@4@01) | live]
; [else-branch: 12 | v@3@01 != get_Tree_v[Int](t@4@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | v@3@01 == get_Tree_v[Int](t@4@01)]
(assert (= v@3@01 (get_Tree_v<Int> t@4@01)))
; [exec]
; res := t
; [eval] (forall i: Int :: { allNodesGreaterThan(t, i) } { allNodesGreaterThan(res, i) } allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i))
(declare-const i@14@01 Int)
(push) ; 5
; [eval] allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i)
; [eval] allNodesGreaterThan(t, i) && i < v
; [eval] allNodesGreaterThan(t, i)
(push) ; 6
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@14@01))
(pop) ; 6
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@14@01))
(push) ; 6
; [then-branch: 13 | !(allNodesGreaterThan(_, t@4@01, i@14@01)) | live]
; [else-branch: 13 | allNodesGreaterThan(_, t@4@01, i@14@01) | live]
(push) ; 7
; [then-branch: 13 | !(allNodesGreaterThan(_, t@4@01, i@14@01))]
(assert (not (allNodesGreaterThan $Snap.unit t@4@01 i@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | allNodesGreaterThan(_, t@4@01, i@14@01)]
(assert (allNodesGreaterThan $Snap.unit t@4@01 i@14@01))
; [eval] i < v
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesGreaterThan $Snap.unit t@4@01 i@14@01)
  (not (allNodesGreaterThan $Snap.unit t@4@01 i@14@01))))
(push) ; 6
; [then-branch: 14 | allNodesGreaterThan(_, t@4@01, i@14@01) && i@14@01 < v@3@01 | live]
; [else-branch: 14 | !(allNodesGreaterThan(_, t@4@01, i@14@01) && i@14@01 < v@3@01) | live]
(push) ; 7
; [then-branch: 14 | allNodesGreaterThan(_, t@4@01, i@14@01) && i@14@01 < v@3@01]
(assert (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01)))
; [eval] allNodesGreaterThan(res, i)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 14 | !(allNodesGreaterThan(_, t@4@01, i@14@01) && i@14@01 < v@3@01)]
(assert (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01)))
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@14@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@14@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@14@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@14@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@14@01)
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01))
      (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@14@01)))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@14@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94_precondition|)))
(push) ; 5
(assert (not (forall ((i@14@01 Int)) (!
  (=>
    (and
      (and
        (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@14@01)
        (=>
          (and
            (allNodesGreaterThan $Snap.unit t@4@01 i@14@01)
            (< i@14@01 v@3@01))
          (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@14@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01)))
    (allNodesGreaterThan $Snap.unit t@4@01 i@14@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@14@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@14@01 Int)) (!
  (=>
    (and (allNodesGreaterThan $Snap.unit t@4@01 i@14@01) (< i@14@01 v@3@01))
    (allNodesGreaterThan $Snap.unit t@4@01 i@14@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@14@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|)))
; [eval] (forall i: Int :: { allNodesLessThan(t, i) } { allNodesLessThan(res, i) } allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i))
(declare-const i@15@01 Int)
(push) ; 5
; [eval] allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i)
; [eval] allNodesLessThan(t, i) && v < i
; [eval] allNodesLessThan(t, i)
(push) ; 6
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@15@01))
(pop) ; 6
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@15@01))
(push) ; 6
; [then-branch: 15 | !(allNodesLessThan(_, t@4@01, i@15@01)) | live]
; [else-branch: 15 | allNodesLessThan(_, t@4@01, i@15@01) | live]
(push) ; 7
; [then-branch: 15 | !(allNodesLessThan(_, t@4@01, i@15@01))]
(assert (not (allNodesLessThan $Snap.unit t@4@01 i@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 15 | allNodesLessThan(_, t@4@01, i@15@01)]
(assert (allNodesLessThan $Snap.unit t@4@01 i@15@01))
; [eval] v < i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesLessThan $Snap.unit t@4@01 i@15@01)
  (not (allNodesLessThan $Snap.unit t@4@01 i@15@01))))
(push) ; 6
; [then-branch: 16 | allNodesLessThan(_, t@4@01, i@15@01) && v@3@01 < i@15@01 | live]
; [else-branch: 16 | !(allNodesLessThan(_, t@4@01, i@15@01) && v@3@01 < i@15@01) | live]
(push) ; 7
; [then-branch: 16 | allNodesLessThan(_, t@4@01, i@15@01) && v@3@01 < i@15@01]
(assert (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01)))
; [eval] allNodesLessThan(res, i)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 16 | !(allNodesLessThan(_, t@4@01, i@15@01) && v@3@01 < i@15@01)]
(assert (not (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01)))
  (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@15@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@15@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@15@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@15@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@15@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@15@01)
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01))
      (allNodesLessThan%precondition $Snap.unit t@4@01 i@15@01)))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@15@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@15@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89_precondition|)))
(push) ; 5
(assert (not (forall ((i@15@01 Int)) (!
  (=>
    (and
      (and
        (allNodesLessThan%precondition $Snap.unit t@4@01 i@15@01)
        (=>
          (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01))
          (allNodesLessThan%precondition $Snap.unit t@4@01 i@15@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01)))
    (allNodesLessThan $Snap.unit t@4@01 i@15@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@15@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@15@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (allNodesLessThan $Snap.unit t@4@01 i@15@01) (< v@3@01 i@15@01))
    (allNodesLessThan $Snap.unit t@4@01 i@15@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@15@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@15@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|)))
; [eval] isBST(t) ==> isBST(res)
; [eval] isBST(t)
(push) ; 5
(assert (isBST%precondition $Snap.unit t@4@01))
(pop) ; 5
; Joined path conditions
(assert (isBST%precondition $Snap.unit t@4@01))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (isBST $Snap.unit t@4@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (isBST $Snap.unit t@4@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | isBST(_, t@4@01) | live]
; [else-branch: 17 | !(isBST(_, t@4@01)) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 17 | isBST(_, t@4@01)]
(assert (isBST $Snap.unit t@4@01))
; [eval] isBST(res)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 17 | !(isBST(_, t@4@01))]
(assert (not (isBST $Snap.unit t@4@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (isBST $Snap.unit t@4@01)) (isBST $Snap.unit t@4@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | v@3@01 != get_Tree_v[Int](t@4@01)]
(assert (not (= v@3@01 (get_Tree_v<Int> t@4@01))))
(pop) ; 4
; [eval] !(v == get_Tree_v(t))
; [eval] v == get_Tree_v(t)
; [eval] get_Tree_v(t)
(push) ; 4
(set-option :timeout 10)
(assert (not (= v@3@01 (get_Tree_v<Int> t@4@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= v@3@01 (get_Tree_v<Int> t@4@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | v@3@01 != get_Tree_v[Int](t@4@01) | live]
; [else-branch: 18 | v@3@01 == get_Tree_v[Int](t@4@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | v@3@01 != get_Tree_v[Int](t@4@01)]
(assert (not (= v@3@01 (get_Tree_v<Int> t@4@01))))
; [eval] v < get_Tree_v(t)
; [eval] get_Tree_v(t)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< v@3@01 (get_Tree_v<Int> t@4@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< v@3@01 (get_Tree_v<Int> t@4@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | v@3@01 < get_Tree_v[Int](t@4@01) | live]
; [else-branch: 19 | !(v@3@01 < get_Tree_v[Int](t@4@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | v@3@01 < get_Tree_v[Int](t@4@01)]
(assert (< v@3@01 (get_Tree_v<Int> t@4@01)))
; [exec]
; new_leftsubtree := insertValue(v, get_Tree_left(t))
; [eval] get_Tree_left(t)
(declare-const res@16@01 Tree)
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.first $t@17@01) $Snap.unit))
; [eval] (forall i: Int :: { allNodesGreaterThan(t, i) } { allNodesGreaterThan(res, i) } allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i))
(declare-const i@18@01 Int)
(push) ; 6
; [eval] allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i)
; [eval] allNodesGreaterThan(t, i) && i < v
; [eval] allNodesGreaterThan(t, i)
(push) ; 7
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01))
(push) ; 7
; [then-branch: 20 | !(allNodesGreaterThan(_, get_Tree_left[Tree](t@4@01), i@18@01)) | live]
; [else-branch: 20 | allNodesGreaterThan(_, get_Tree_left[Tree](t@4@01), i@18@01) | live]
(push) ; 8
; [then-branch: 20 | !(allNodesGreaterThan(_, get_Tree_left[Tree](t@4@01), i@18@01))]
(assert (not (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | allNodesGreaterThan(_, get_Tree_left[Tree](t@4@01), i@18@01)]
(assert (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01))
; [eval] i < v
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
  (not (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01))))
(push) ; 7
; [then-branch: 21 | allNodesGreaterThan(_, get_Tree_left[Tree](t@4@01), i@18@01) && i@18@01 < v@3@01 | live]
; [else-branch: 21 | !(allNodesGreaterThan(_, get_Tree_left[Tree](t@4@01), i@18@01) && i@18@01 < v@3@01) | live]
(push) ; 8
; [then-branch: 21 | allNodesGreaterThan(_, get_Tree_left[Tree](t@4@01), i@18@01) && i@18@01 < v@3@01]
(assert (and
  (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
  (< i@18@01 v@3@01)))
; [eval] allNodesGreaterThan(res, i)
(push) ; 9
(assert (allNodesGreaterThan%precondition $Snap.unit res@16@01 i@18@01))
(pop) ; 9
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit res@16@01 i@18@01))
(pop) ; 8
(push) ; 8
; [else-branch: 21 | !(allNodesGreaterThan(_, get_Tree_left[Tree](t@4@01), i@18@01) && i@18@01 < v@3@01)]
(assert (not
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
    (< i@18@01 v@3@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
    (< i@18@01 v@3@01))
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
    (< i@18@01 v@3@01)
    (allNodesGreaterThan%precondition $Snap.unit res@16@01 i@18@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
      (< i@18@01 v@3@01)))
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
    (< i@18@01 v@3@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@18@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
    (or
      (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
      (not (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)))
    (=>
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
        (< i@18@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
        (< i@18@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@16@01 i@18@01)))
    (or
      (not
        (and
          (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
          (< i@18@01 v@3@01)))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
        (< i@18@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@18@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
    (or
      (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
      (not (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)))
    (=>
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
        (< i@18@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
        (< i@18@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@16@01 i@18@01)))
    (or
      (not
        (and
          (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
          (< i@18@01 v@3@01)))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
        (< i@18@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@16@01 i@18@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and
      (allNodesGreaterThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01)
      (< i@18@01 v@3@01))
    (allNodesGreaterThan $Snap.unit res@16@01 i@18@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit (get_Tree_left<Tree> t@4@01) i@18@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@16@01 i@18@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|)))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (= ($Snap.first ($Snap.second $t@17@01)) $Snap.unit))
; [eval] (forall i: Int :: { allNodesLessThan(t, i) } { allNodesLessThan(res, i) } allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i))
(declare-const i@19@01 Int)
(push) ; 6
; [eval] allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i)
; [eval] allNodesLessThan(t, i) && v < i
; [eval] allNodesLessThan(t, i)
(push) ; 7
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01))
(push) ; 7
; [then-branch: 22 | !(allNodesLessThan(_, get_Tree_left[Tree](t@4@01), i@19@01)) | live]
; [else-branch: 22 | allNodesLessThan(_, get_Tree_left[Tree](t@4@01), i@19@01) | live]
(push) ; 8
; [then-branch: 22 | !(allNodesLessThan(_, get_Tree_left[Tree](t@4@01), i@19@01))]
(assert (not (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 22 | allNodesLessThan(_, get_Tree_left[Tree](t@4@01), i@19@01)]
(assert (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01))
; [eval] v < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
  (not (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01))))
(push) ; 7
; [then-branch: 23 | allNodesLessThan(_, get_Tree_left[Tree](t@4@01), i@19@01) && v@3@01 < i@19@01 | live]
; [else-branch: 23 | !(allNodesLessThan(_, get_Tree_left[Tree](t@4@01), i@19@01) && v@3@01 < i@19@01) | live]
(push) ; 8
; [then-branch: 23 | allNodesLessThan(_, get_Tree_left[Tree](t@4@01), i@19@01) && v@3@01 < i@19@01]
(assert (and
  (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
  (< v@3@01 i@19@01)))
; [eval] allNodesLessThan(res, i)
(push) ; 9
(assert (allNodesLessThan%precondition $Snap.unit res@16@01 i@19@01))
(pop) ; 9
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit res@16@01 i@19@01))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | !(allNodesLessThan(_, get_Tree_left[Tree](t@4@01), i@19@01) && v@3@01 < i@19@01)]
(assert (not
  (and
    (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
    (< v@3@01 i@19@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
    (< v@3@01 i@19@01))
  (and
    (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
    (< v@3@01 i@19@01)
    (allNodesLessThan%precondition $Snap.unit res@16@01 i@19@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
      (< v@3@01 i@19@01)))
  (and
    (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
    (< v@3@01 i@19@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@19@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
    (or
      (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
      (not (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)))
    (=>
      (and
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
        (< v@3@01 i@19@01))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
        (< v@3@01 i@19@01)
        (allNodesLessThan%precondition $Snap.unit res@16@01 i@19@01)))
    (or
      (not
        (and
          (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
          (< v@3@01 i@19@01)))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
        (< v@3@01 i@19@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@19@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
    (or
      (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
      (not (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)))
    (=>
      (and
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
        (< v@3@01 i@19@01))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
        (< v@3@01 i@19@01)
        (allNodesLessThan%precondition $Snap.unit res@16@01 i@19@01)))
    (or
      (not
        (and
          (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
          (< v@3@01 i@19@01)))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
        (< v@3@01 i@19@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit res@16@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and
      (allNodesLessThan $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01)
      (< v@3@01 i@19@01))
    (allNodesLessThan $Snap.unit res@16@01 i@19@01))
  :pattern ((allNodesLessThan%limited $Snap.unit (get_Tree_left<Tree> t@4@01) i@19@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@16@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|)))
(assert (= ($Snap.second ($Snap.second $t@17@01)) $Snap.unit))
; [eval] isBST(t) ==> isBST(res)
; [eval] isBST(t)
(push) ; 6
(assert (isBST%precondition $Snap.unit (get_Tree_left<Tree> t@4@01)))
(pop) ; 6
; Joined path conditions
(assert (isBST%precondition $Snap.unit (get_Tree_left<Tree> t@4@01)))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (isBST $Snap.unit (get_Tree_left<Tree> t@4@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (isBST $Snap.unit (get_Tree_left<Tree> t@4@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | isBST(_, get_Tree_left[Tree](t@4@01)) | live]
; [else-branch: 24 | !(isBST(_, get_Tree_left[Tree](t@4@01))) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 24 | isBST(_, get_Tree_left[Tree](t@4@01))]
(assert (isBST $Snap.unit (get_Tree_left<Tree> t@4@01)))
; [eval] isBST(res)
(push) ; 8
(assert (isBST%precondition $Snap.unit res@16@01))
(pop) ; 8
; Joined path conditions
(assert (isBST%precondition $Snap.unit res@16@01))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | !(isBST(_, get_Tree_left[Tree](t@4@01)))]
(assert (not (isBST $Snap.unit (get_Tree_left<Tree> t@4@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (isBST $Snap.unit (get_Tree_left<Tree> t@4@01))
  (and
    (isBST $Snap.unit (get_Tree_left<Tree> t@4@01))
    (isBST%precondition $Snap.unit res@16@01))))
; Joined path conditions
(assert (or
  (not (isBST $Snap.unit (get_Tree_left<Tree> t@4@01)))
  (isBST $Snap.unit (get_Tree_left<Tree> t@4@01))))
(assert (=> (isBST $Snap.unit (get_Tree_left<Tree> t@4@01)) (isBST $Snap.unit res@16@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; res := Node(get_Tree_v(t), new_leftsubtree, get_Tree_right(t))
; [eval] Node(get_Tree_v(t), new_leftsubtree, get_Tree_right(t))
; [eval] get_Tree_v(t)
; [eval] get_Tree_right(t)
(declare-const res@20@01 Tree)
(assert (=
  res@20@01
  (Node<Tree> (get_Tree_v<Int> t@4@01) res@16@01 (get_Tree_right<Tree> t@4@01))))
; [eval] (forall i: Int :: { allNodesGreaterThan(t, i) } { allNodesGreaterThan(res, i) } allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i))
(declare-const i@21@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i)
; [eval] allNodesGreaterThan(t, i) && i < v
; [eval] allNodesGreaterThan(t, i)
(push) ; 7
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@21@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@21@01))
(push) ; 7
; [then-branch: 25 | !(allNodesGreaterThan(_, t@4@01, i@21@01)) | live]
; [else-branch: 25 | allNodesGreaterThan(_, t@4@01, i@21@01) | live]
(push) ; 8
; [then-branch: 25 | !(allNodesGreaterThan(_, t@4@01, i@21@01))]
(assert (not (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 25 | allNodesGreaterThan(_, t@4@01, i@21@01)]
(assert (allNodesGreaterThan $Snap.unit t@4@01 i@21@01))
; [eval] i < v
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)
  (not (allNodesGreaterThan $Snap.unit t@4@01 i@21@01))))
(push) ; 7
; [then-branch: 26 | allNodesGreaterThan(_, t@4@01, i@21@01) && i@21@01 < v@3@01 | live]
; [else-branch: 26 | !(allNodesGreaterThan(_, t@4@01, i@21@01) && i@21@01 < v@3@01) | live]
(push) ; 8
; [then-branch: 26 | allNodesGreaterThan(_, t@4@01, i@21@01) && i@21@01 < v@3@01]
(assert (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01)))
; [eval] allNodesGreaterThan(res, i)
(push) ; 9
(assert (allNodesGreaterThan%precondition $Snap.unit res@20@01 i@21@01))
(pop) ; 9
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit res@20@01 i@21@01))
(pop) ; 8
(push) ; 8
; [else-branch: 26 | !(allNodesGreaterThan(_, t@4@01, i@21@01) && i@21@01 < v@3@01)]
(assert (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))
  (and
    (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)
    (< i@21@01 v@3@01)
    (allNodesGreaterThan%precondition $Snap.unit res@20@01 i@21@01))))
; Joined path conditions
(assert (or
  (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01)))
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@21@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@21@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)))
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)
        (< i@21@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@20@01 i@21@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@21@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@21@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)))
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)
        (< i@21@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@20@01 i@21@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@20@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@21@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@21@01)
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))
      (allNodesGreaterThan%precondition $Snap.unit res@20@01 i@21@01)))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@21@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@20@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94_precondition|)))
(push) ; 6
(assert (not (forall ((i@21@01 Int)) (!
  (=>
    (and
      (and
        (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@21@01)
        (=>
          (and
            (allNodesGreaterThan $Snap.unit t@4@01 i@21@01)
            (< i@21@01 v@3@01))
          (allNodesGreaterThan%precondition $Snap.unit res@20@01 i@21@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01)))
    (allNodesGreaterThan $Snap.unit res@20@01 i@21@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@21@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@20@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and (allNodesGreaterThan $Snap.unit t@4@01 i@21@01) (< i@21@01 v@3@01))
    (allNodesGreaterThan $Snap.unit res@20@01 i@21@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@21@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@20@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|)))
; [eval] (forall i: Int :: { allNodesLessThan(t, i) } { allNodesLessThan(res, i) } allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i))
(declare-const i@22@01 Int)
(push) ; 6
; [eval] allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i)
; [eval] allNodesLessThan(t, i) && v < i
; [eval] allNodesLessThan(t, i)
(push) ; 7
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@22@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@22@01))
(push) ; 7
; [then-branch: 27 | !(allNodesLessThan(_, t@4@01, i@22@01)) | live]
; [else-branch: 27 | allNodesLessThan(_, t@4@01, i@22@01) | live]
(push) ; 8
; [then-branch: 27 | !(allNodesLessThan(_, t@4@01, i@22@01))]
(assert (not (allNodesLessThan $Snap.unit t@4@01 i@22@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 27 | allNodesLessThan(_, t@4@01, i@22@01)]
(assert (allNodesLessThan $Snap.unit t@4@01 i@22@01))
; [eval] v < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesLessThan $Snap.unit t@4@01 i@22@01)
  (not (allNodesLessThan $Snap.unit t@4@01 i@22@01))))
(push) ; 7
; [then-branch: 28 | allNodesLessThan(_, t@4@01, i@22@01) && v@3@01 < i@22@01 | live]
; [else-branch: 28 | !(allNodesLessThan(_, t@4@01, i@22@01) && v@3@01 < i@22@01) | live]
(push) ; 8
; [then-branch: 28 | allNodesLessThan(_, t@4@01, i@22@01) && v@3@01 < i@22@01]
(assert (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01)))
; [eval] allNodesLessThan(res, i)
(push) ; 9
(assert (allNodesLessThan%precondition $Snap.unit res@20@01 i@22@01))
(pop) ; 9
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit res@20@01 i@22@01))
(pop) ; 8
(push) ; 8
; [else-branch: 28 | !(allNodesLessThan(_, t@4@01, i@22@01) && v@3@01 < i@22@01)]
(assert (not (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))
  (and
    (allNodesLessThan $Snap.unit t@4@01 i@22@01)
    (< v@3@01 i@22@01)
    (allNodesLessThan%precondition $Snap.unit res@20@01 i@22@01))))
; Joined path conditions
(assert (or
  (not (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01)))
  (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@22@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@22@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@22@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@22@01)))
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))
      (and
        (allNodesLessThan $Snap.unit t@4@01 i@22@01)
        (< v@3@01 i@22@01)
        (allNodesLessThan%precondition $Snap.unit res@20@01 i@22@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@22@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@22@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@22@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@22@01)))
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))
      (and
        (allNodesLessThan $Snap.unit t@4@01 i@22@01)
        (< v@3@01 i@22@01)
        (allNodesLessThan%precondition $Snap.unit res@20@01 i@22@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit res@20@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@22@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@22@01)
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))
      (allNodesLessThan%precondition $Snap.unit res@20@01 i@22@01)))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@22@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@20@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89_precondition|)))
(push) ; 6
(assert (not (forall ((i@22@01 Int)) (!
  (=>
    (and
      (and
        (allNodesLessThan%precondition $Snap.unit t@4@01 i@22@01)
        (=>
          (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))
          (allNodesLessThan%precondition $Snap.unit res@20@01 i@22@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01)))
    (allNodesLessThan $Snap.unit res@20@01 i@22@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@22@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@20@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (allNodesLessThan $Snap.unit t@4@01 i@22@01) (< v@3@01 i@22@01))
    (allNodesLessThan $Snap.unit res@20@01 i@22@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@22@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@20@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|)))
; [eval] isBST(t) ==> isBST(res)
; [eval] isBST(t)
(push) ; 6
(assert (isBST%precondition $Snap.unit t@4@01))
(pop) ; 6
; Joined path conditions
(assert (isBST%precondition $Snap.unit t@4@01))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (isBST $Snap.unit t@4@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (isBST $Snap.unit t@4@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | isBST(_, t@4@01) | live]
; [else-branch: 29 | !(isBST(_, t@4@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 29 | isBST(_, t@4@01)]
(assert (isBST $Snap.unit t@4@01))
; [eval] isBST(res)
(push) ; 8
(assert (isBST%precondition $Snap.unit res@20@01))
(pop) ; 8
; Joined path conditions
(assert (isBST%precondition $Snap.unit res@20@01))
(pop) ; 7
(push) ; 7
; [else-branch: 29 | !(isBST(_, t@4@01))]
(assert (not (isBST $Snap.unit t@4@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (isBST $Snap.unit t@4@01)
  (and (isBST $Snap.unit t@4@01) (isBST%precondition $Snap.unit res@20@01))))
; Joined path conditions
(assert (or (not (isBST $Snap.unit t@4@01)) (isBST $Snap.unit t@4@01)))
(push) ; 6
(assert (not (=> (isBST $Snap.unit t@4@01) (isBST $Snap.unit res@20@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=> (isBST $Snap.unit t@4@01) (isBST $Snap.unit res@20@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | !(v@3@01 < get_Tree_v[Int](t@4@01))]
(assert (not (< v@3@01 (get_Tree_v<Int> t@4@01))))
(pop) ; 5
; [eval] !(v < get_Tree_v(t))
; [eval] v < get_Tree_v(t)
; [eval] get_Tree_v(t)
(push) ; 5
(set-option :timeout 10)
(assert (not (< v@3@01 (get_Tree_v<Int> t@4@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< v@3@01 (get_Tree_v<Int> t@4@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | !(v@3@01 < get_Tree_v[Int](t@4@01)) | live]
; [else-branch: 30 | v@3@01 < get_Tree_v[Int](t@4@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | !(v@3@01 < get_Tree_v[Int](t@4@01))]
(assert (not (< v@3@01 (get_Tree_v<Int> t@4@01))))
; [exec]
; new_rightsubtree := insertValue(v, get_Tree_right(t))
; [eval] get_Tree_right(t)
(declare-const res@23@01 Tree)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (= ($Snap.first $t@24@01) $Snap.unit))
; [eval] (forall i: Int :: { allNodesGreaterThan(t, i) } { allNodesGreaterThan(res, i) } allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i))
(declare-const i@25@01 Int)
(push) ; 6
; [eval] allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i)
; [eval] allNodesGreaterThan(t, i) && i < v
; [eval] allNodesGreaterThan(t, i)
(push) ; 7
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01))
(push) ; 7
; [then-branch: 31 | !(allNodesGreaterThan(_, get_Tree_right[Tree](t@4@01), i@25@01)) | live]
; [else-branch: 31 | allNodesGreaterThan(_, get_Tree_right[Tree](t@4@01), i@25@01) | live]
(push) ; 8
; [then-branch: 31 | !(allNodesGreaterThan(_, get_Tree_right[Tree](t@4@01), i@25@01))]
(assert (not (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 31 | allNodesGreaterThan(_, get_Tree_right[Tree](t@4@01), i@25@01)]
(assert (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01))
; [eval] i < v
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
  (not (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01))))
(push) ; 7
; [then-branch: 32 | allNodesGreaterThan(_, get_Tree_right[Tree](t@4@01), i@25@01) && i@25@01 < v@3@01 | live]
; [else-branch: 32 | !(allNodesGreaterThan(_, get_Tree_right[Tree](t@4@01), i@25@01) && i@25@01 < v@3@01) | live]
(push) ; 8
; [then-branch: 32 | allNodesGreaterThan(_, get_Tree_right[Tree](t@4@01), i@25@01) && i@25@01 < v@3@01]
(assert (and
  (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
  (< i@25@01 v@3@01)))
; [eval] allNodesGreaterThan(res, i)
(push) ; 9
(assert (allNodesGreaterThan%precondition $Snap.unit res@23@01 i@25@01))
(pop) ; 9
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit res@23@01 i@25@01))
(pop) ; 8
(push) ; 8
; [else-branch: 32 | !(allNodesGreaterThan(_, get_Tree_right[Tree](t@4@01), i@25@01) && i@25@01 < v@3@01)]
(assert (not
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
    (< i@25@01 v@3@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
    (< i@25@01 v@3@01))
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
    (< i@25@01 v@3@01)
    (allNodesGreaterThan%precondition $Snap.unit res@23@01 i@25@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
      (< i@25@01 v@3@01)))
  (and
    (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
    (< i@25@01 v@3@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@25@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
    (or
      (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
      (not
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)))
    (=>
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
        (< i@25@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
        (< i@25@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@23@01 i@25@01)))
    (or
      (not
        (and
          (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
          (< i@25@01 v@3@01)))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
        (< i@25@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@25@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
    (or
      (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
      (not
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)))
    (=>
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
        (< i@25@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
        (< i@25@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@23@01 i@25@01)))
    (or
      (not
        (and
          (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
          (< i@25@01 v@3@01)))
      (and
        (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
        (< i@25@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@23@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and
      (allNodesGreaterThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01)
      (< i@25@01 v@3@01))
    (allNodesGreaterThan $Snap.unit res@23@01 i@25@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit (get_Tree_right<Tree> t@4@01) i@25@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@23@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|)))
(assert (=
  ($Snap.second $t@24@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@24@01))
    ($Snap.second ($Snap.second $t@24@01)))))
(assert (= ($Snap.first ($Snap.second $t@24@01)) $Snap.unit))
; [eval] (forall i: Int :: { allNodesLessThan(t, i) } { allNodesLessThan(res, i) } allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i))
(declare-const i@26@01 Int)
(push) ; 6
; [eval] allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i)
; [eval] allNodesLessThan(t, i) && v < i
; [eval] allNodesLessThan(t, i)
(push) ; 7
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01))
(push) ; 7
; [then-branch: 33 | !(allNodesLessThan(_, get_Tree_right[Tree](t@4@01), i@26@01)) | live]
; [else-branch: 33 | allNodesLessThan(_, get_Tree_right[Tree](t@4@01), i@26@01) | live]
(push) ; 8
; [then-branch: 33 | !(allNodesLessThan(_, get_Tree_right[Tree](t@4@01), i@26@01))]
(assert (not (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 33 | allNodesLessThan(_, get_Tree_right[Tree](t@4@01), i@26@01)]
(assert (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01))
; [eval] v < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
  (not (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01))))
(push) ; 7
; [then-branch: 34 | allNodesLessThan(_, get_Tree_right[Tree](t@4@01), i@26@01) && v@3@01 < i@26@01 | live]
; [else-branch: 34 | !(allNodesLessThan(_, get_Tree_right[Tree](t@4@01), i@26@01) && v@3@01 < i@26@01) | live]
(push) ; 8
; [then-branch: 34 | allNodesLessThan(_, get_Tree_right[Tree](t@4@01), i@26@01) && v@3@01 < i@26@01]
(assert (and
  (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
  (< v@3@01 i@26@01)))
; [eval] allNodesLessThan(res, i)
(push) ; 9
(assert (allNodesLessThan%precondition $Snap.unit res@23@01 i@26@01))
(pop) ; 9
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit res@23@01 i@26@01))
(pop) ; 8
(push) ; 8
; [else-branch: 34 | !(allNodesLessThan(_, get_Tree_right[Tree](t@4@01), i@26@01) && v@3@01 < i@26@01)]
(assert (not
  (and
    (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
    (< v@3@01 i@26@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
    (< v@3@01 i@26@01))
  (and
    (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
    (< v@3@01 i@26@01)
    (allNodesLessThan%precondition $Snap.unit res@23@01 i@26@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
      (< v@3@01 i@26@01)))
  (and
    (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
    (< v@3@01 i@26@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
    (or
      (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
      (not (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)))
    (=>
      (and
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
        (< v@3@01 i@26@01))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
        (< v@3@01 i@26@01)
        (allNodesLessThan%precondition $Snap.unit res@23@01 i@26@01)))
    (or
      (not
        (and
          (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
          (< v@3@01 i@26@01)))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
        (< v@3@01 i@26@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@26@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
    (or
      (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
      (not (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)))
    (=>
      (and
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
        (< v@3@01 i@26@01))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
        (< v@3@01 i@26@01)
        (allNodesLessThan%precondition $Snap.unit res@23@01 i@26@01)))
    (or
      (not
        (and
          (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
          (< v@3@01 i@26@01)))
      (and
        (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
        (< v@3@01 i@26@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit res@23@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and
      (allNodesLessThan $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01)
      (< v@3@01 i@26@01))
    (allNodesLessThan $Snap.unit res@23@01 i@26@01))
  :pattern ((allNodesLessThan%limited $Snap.unit (get_Tree_right<Tree> t@4@01) i@26@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@23@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|)))
(assert (= ($Snap.second ($Snap.second $t@24@01)) $Snap.unit))
; [eval] isBST(t) ==> isBST(res)
; [eval] isBST(t)
(push) ; 6
(assert (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@4@01)))
(pop) ; 6
; Joined path conditions
(assert (isBST%precondition $Snap.unit (get_Tree_right<Tree> t@4@01)))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (isBST $Snap.unit (get_Tree_right<Tree> t@4@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (isBST $Snap.unit (get_Tree_right<Tree> t@4@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | isBST(_, get_Tree_right[Tree](t@4@01)) | live]
; [else-branch: 35 | !(isBST(_, get_Tree_right[Tree](t@4@01))) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 35 | isBST(_, get_Tree_right[Tree](t@4@01))]
(assert (isBST $Snap.unit (get_Tree_right<Tree> t@4@01)))
; [eval] isBST(res)
(push) ; 8
(assert (isBST%precondition $Snap.unit res@23@01))
(pop) ; 8
; Joined path conditions
(assert (isBST%precondition $Snap.unit res@23@01))
(pop) ; 7
(push) ; 7
; [else-branch: 35 | !(isBST(_, get_Tree_right[Tree](t@4@01)))]
(assert (not (isBST $Snap.unit (get_Tree_right<Tree> t@4@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (isBST $Snap.unit (get_Tree_right<Tree> t@4@01))
  (and
    (isBST $Snap.unit (get_Tree_right<Tree> t@4@01))
    (isBST%precondition $Snap.unit res@23@01))))
; Joined path conditions
(assert (or
  (not (isBST $Snap.unit (get_Tree_right<Tree> t@4@01)))
  (isBST $Snap.unit (get_Tree_right<Tree> t@4@01))))
(assert (=>
  (isBST $Snap.unit (get_Tree_right<Tree> t@4@01))
  (isBST $Snap.unit res@23@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; res := Node(get_Tree_v(t), get_Tree_left(t), new_rightsubtree)
; [eval] Node(get_Tree_v(t), get_Tree_left(t), new_rightsubtree)
; [eval] get_Tree_v(t)
; [eval] get_Tree_left(t)
(declare-const res@27@01 Tree)
(assert (=
  res@27@01
  (Node<Tree> (get_Tree_v<Int> t@4@01) (get_Tree_left<Tree> t@4@01) res@23@01)))
; [eval] (forall i: Int :: { allNodesGreaterThan(t, i) } { allNodesGreaterThan(res, i) } allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i))
(declare-const i@28@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] allNodesGreaterThan(t, i) && i < v ==> allNodesGreaterThan(res, i)
; [eval] allNodesGreaterThan(t, i) && i < v
; [eval] allNodesGreaterThan(t, i)
(push) ; 7
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@28@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@28@01))
(push) ; 7
; [then-branch: 36 | !(allNodesGreaterThan(_, t@4@01, i@28@01)) | live]
; [else-branch: 36 | allNodesGreaterThan(_, t@4@01, i@28@01) | live]
(push) ; 8
; [then-branch: 36 | !(allNodesGreaterThan(_, t@4@01, i@28@01))]
(assert (not (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 36 | allNodesGreaterThan(_, t@4@01, i@28@01)]
(assert (allNodesGreaterThan $Snap.unit t@4@01 i@28@01))
; [eval] i < v
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)
  (not (allNodesGreaterThan $Snap.unit t@4@01 i@28@01))))
(push) ; 7
; [then-branch: 37 | allNodesGreaterThan(_, t@4@01, i@28@01) && i@28@01 < v@3@01 | live]
; [else-branch: 37 | !(allNodesGreaterThan(_, t@4@01, i@28@01) && i@28@01 < v@3@01) | live]
(push) ; 8
; [then-branch: 37 | allNodesGreaterThan(_, t@4@01, i@28@01) && i@28@01 < v@3@01]
(assert (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01)))
; [eval] allNodesGreaterThan(res, i)
(push) ; 9
(assert (allNodesGreaterThan%precondition $Snap.unit res@27@01 i@28@01))
(pop) ; 9
; Joined path conditions
(assert (allNodesGreaterThan%precondition $Snap.unit res@27@01 i@28@01))
(pop) ; 8
(push) ; 8
; [else-branch: 37 | !(allNodesGreaterThan(_, t@4@01, i@28@01) && i@28@01 < v@3@01)]
(assert (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))
  (and
    (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)
    (< i@28@01 v@3@01)
    (allNodesGreaterThan%precondition $Snap.unit res@27@01 i@28@01))))
; Joined path conditions
(assert (or
  (not (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01)))
  (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@28@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@28@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)))
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)
        (< i@28@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@27@01 i@28@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@28@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@28@01)
    (or
      (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)
      (not (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)))
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))
      (and
        (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)
        (< i@28@01 v@3@01)
        (allNodesGreaterThan%precondition $Snap.unit res@27@01 i@28@01)))
    (or
      (not
        (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@27@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94-aux|)))
(assert (forall ((i@28@01 Int)) (!
  (and
    (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@28@01)
    (=>
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))
      (allNodesGreaterThan%precondition $Snap.unit res@27@01 i@28@01)))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@28@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@27@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94_precondition|)))
(push) ; 6
(assert (not (forall ((i@28@01 Int)) (!
  (=>
    (and
      (and
        (allNodesGreaterThan%precondition $Snap.unit t@4@01 i@28@01)
        (=>
          (and
            (allNodesGreaterThan $Snap.unit t@4@01 i@28@01)
            (< i@28@01 v@3@01))
          (allNodesGreaterThan%precondition $Snap.unit res@27@01 i@28@01)))
      (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01)))
    (allNodesGreaterThan $Snap.unit res@27@01 i@28@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@28@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@27@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (allNodesGreaterThan $Snap.unit t@4@01 i@28@01) (< i@28@01 v@3@01))
    (allNodesGreaterThan $Snap.unit res@27@01 i@28@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit t@4@01 i@28@01))
  :pattern ((allNodesGreaterThan%limited $Snap.unit res@27@01 i@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@30@13@30@94|)))
; [eval] (forall i: Int :: { allNodesLessThan(t, i) } { allNodesLessThan(res, i) } allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i))
(declare-const i@29@01 Int)
(push) ; 6
; [eval] allNodesLessThan(t, i) && v < i ==> allNodesLessThan(res, i)
; [eval] allNodesLessThan(t, i) && v < i
; [eval] allNodesLessThan(t, i)
(push) ; 7
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@29@01))
(pop) ; 7
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit t@4@01 i@29@01))
(push) ; 7
; [then-branch: 38 | !(allNodesLessThan(_, t@4@01, i@29@01)) | live]
; [else-branch: 38 | allNodesLessThan(_, t@4@01, i@29@01) | live]
(push) ; 8
; [then-branch: 38 | !(allNodesLessThan(_, t@4@01, i@29@01))]
(assert (not (allNodesLessThan $Snap.unit t@4@01 i@29@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 38 | allNodesLessThan(_, t@4@01, i@29@01)]
(assert (allNodesLessThan $Snap.unit t@4@01 i@29@01))
; [eval] v < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (allNodesLessThan $Snap.unit t@4@01 i@29@01)
  (not (allNodesLessThan $Snap.unit t@4@01 i@29@01))))
(push) ; 7
; [then-branch: 39 | allNodesLessThan(_, t@4@01, i@29@01) && v@3@01 < i@29@01 | live]
; [else-branch: 39 | !(allNodesLessThan(_, t@4@01, i@29@01) && v@3@01 < i@29@01) | live]
(push) ; 8
; [then-branch: 39 | allNodesLessThan(_, t@4@01, i@29@01) && v@3@01 < i@29@01]
(assert (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01)))
; [eval] allNodesLessThan(res, i)
(push) ; 9
(assert (allNodesLessThan%precondition $Snap.unit res@27@01 i@29@01))
(pop) ; 9
; Joined path conditions
(assert (allNodesLessThan%precondition $Snap.unit res@27@01 i@29@01))
(pop) ; 8
(push) ; 8
; [else-branch: 39 | !(allNodesLessThan(_, t@4@01, i@29@01) && v@3@01 < i@29@01)]
(assert (not (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))
  (and
    (allNodesLessThan $Snap.unit t@4@01 i@29@01)
    (< v@3@01 i@29@01)
    (allNodesLessThan%precondition $Snap.unit res@27@01 i@29@01))))
; Joined path conditions
(assert (or
  (not (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01)))
  (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@29@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@29@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@29@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@29@01)))
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))
      (and
        (allNodesLessThan $Snap.unit t@4@01 i@29@01)
        (< v@3@01 i@29@01)
        (allNodesLessThan%precondition $Snap.unit res@27@01 i@29@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@29@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@29@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@29@01)
    (or
      (allNodesLessThan $Snap.unit t@4@01 i@29@01)
      (not (allNodesLessThan $Snap.unit t@4@01 i@29@01)))
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))
      (and
        (allNodesLessThan $Snap.unit t@4@01 i@29@01)
        (< v@3@01 i@29@01)
        (allNodesLessThan%precondition $Snap.unit res@27@01 i@29@01)))
    (or
      (not (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))))
  :pattern ((allNodesLessThan%limited $Snap.unit res@27@01 i@29@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89-aux|)))
(assert (forall ((i@29@01 Int)) (!
  (and
    (allNodesLessThan%precondition $Snap.unit t@4@01 i@29@01)
    (=>
      (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))
      (allNodesLessThan%precondition $Snap.unit res@27@01 i@29@01)))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@29@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@27@01 i@29@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89_precondition|)))
(push) ; 6
(assert (not (forall ((i@29@01 Int)) (!
  (=>
    (and
      (and
        (allNodesLessThan%precondition $Snap.unit t@4@01 i@29@01)
        (=>
          (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))
          (allNodesLessThan%precondition $Snap.unit res@27@01 i@29@01)))
      (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01)))
    (allNodesLessThan $Snap.unit res@27@01 i@29@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@29@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@27@01 i@29@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (allNodesLessThan $Snap.unit t@4@01 i@29@01) (< v@3@01 i@29@01))
    (allNodesLessThan $Snap.unit res@27@01 i@29@01))
  :pattern ((allNodesLessThan%limited $Snap.unit t@4@01 i@29@01))
  :pattern ((allNodesLessThan%limited $Snap.unit res@27@01 i@29@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_1.vpr@31@13@31@89|)))
; [eval] isBST(t) ==> isBST(res)
; [eval] isBST(t)
(push) ; 6
(assert (isBST%precondition $Snap.unit t@4@01))
(pop) ; 6
; Joined path conditions
(assert (isBST%precondition $Snap.unit t@4@01))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (isBST $Snap.unit t@4@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (isBST $Snap.unit t@4@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | isBST(_, t@4@01) | live]
; [else-branch: 40 | !(isBST(_, t@4@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 40 | isBST(_, t@4@01)]
(assert (isBST $Snap.unit t@4@01))
; [eval] isBST(res)
(push) ; 8
(assert (isBST%precondition $Snap.unit res@27@01))
(pop) ; 8
; Joined path conditions
(assert (isBST%precondition $Snap.unit res@27@01))
(pop) ; 7
(push) ; 7
; [else-branch: 40 | !(isBST(_, t@4@01))]
(assert (not (isBST $Snap.unit t@4@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (isBST $Snap.unit t@4@01)
  (and (isBST $Snap.unit t@4@01) (isBST%precondition $Snap.unit res@27@01))))
; Joined path conditions
(assert (or (not (isBST $Snap.unit t@4@01)) (isBST $Snap.unit t@4@01)))
(push) ; 6
(assert (not (=> (isBST $Snap.unit t@4@01) (isBST $Snap.unit res@27@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=> (isBST $Snap.unit t@4@01) (isBST $Snap.unit res@27@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 30 | v@3@01 < get_Tree_v[Int](t@4@01)]
(assert (< v@3@01 (get_Tree_v<Int> t@4@01)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 18 | v@3@01 == get_Tree_v[Int](t@4@01)]
(assert (= v@3@01 (get_Tree_v<Int> t@4@01)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 11 | Tree_tag[Int](t@4@01) == 0]
(assert (= (Tree_tag<Int> t@4@01) 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
