(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:34
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr
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
(declare-sort Seq<Tree> 0)
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
(declare-fun $SortWrappers.Seq<Tree>To$Snap (Seq<Tree>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Tree> ($Snap) Seq<Tree>)
(assert (forall ((x Seq<Tree>)) (!
    (= x ($SortWrappers.$SnapToSeq<Tree>($SortWrappers.Seq<Tree>To$Snap x)))
    :pattern (($SortWrappers.Seq<Tree>To$Snap x))
    :qid |$Snap.$SnapToSeq<Tree>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Tree>To$Snap($SortWrappers.$SnapToSeq<Tree> x)))
    :pattern (($SortWrappers.$SnapToSeq<Tree> x))
    :qid |$Snap.Seq<Tree>To$SnapToSeq<Tree>|
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
(declare-fun Seq_length (Seq<Tree>) Int)
(declare-const Seq_empty Seq<Tree>)
(declare-fun Seq_singleton (Tree) Seq<Tree>)
(declare-fun Seq_append (Seq<Tree> Seq<Tree>) Seq<Tree>)
(declare-fun Seq_index (Seq<Tree> Int) Tree)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Tree> Int Tree) Seq<Tree>)
(declare-fun Seq_take (Seq<Tree> Int) Seq<Tree>)
(declare-fun Seq_drop (Seq<Tree> Int) Seq<Tree>)
(declare-fun Seq_contains (Seq<Tree> Tree) Bool)
(declare-fun Seq_contains_trigger (Seq<Tree> Tree) Bool)
(declare-fun Seq_skolem (Seq<Tree> Tree) Int)
(declare-fun Seq_equal (Seq<Tree> Seq<Tree>) Bool)
(declare-fun Seq_skolem_diff (Seq<Tree> Seq<Tree>) Int)
(declare-const Leaf<Tree> Tree)
(declare-fun Node<Tree> (Int Tree Tree) Tree)
(declare-fun isLeaf<Bool> (Tree) Bool)
(declare-fun isNode<Bool> (Tree) Bool)
(declare-fun getVal<Int> (Tree) Int)
(declare-fun getLeft<Tree> (Tree) Tree)
(declare-fun getRight<Tree> (Tree) Tree)
(declare-fun type<Int> (Tree) Int)
(declare-const type_Leaf<Int> Int)
(declare-const type_Node<Int> Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun height ($Snap Tree) Int)
(declare-fun height%limited ($Snap Tree) Int)
(declare-fun height%stateless (Tree) Bool)
(declare-fun height%precondition ($Snap Tree) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
(assert (distinct type_Leaf<Int> type_Node<Int>))
; ////////// Axioms
(assert (forall ((s Seq<Tree>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Tree>)) 0))
(assert (forall ((s Seq<Tree>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Tree>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Tree)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Tree>) (s1 Seq<Tree>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Tree>)))
      (not (= s1 (as Seq_empty  Seq<Tree>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Tree>) (s1 Seq<Tree>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Tree>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Tree>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Tree)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
  )))
(assert (forall ((s0 Seq<Tree>) (s1 Seq<Tree>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Tree>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Tree>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Tree>) (s1 Seq<Tree>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Tree>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Tree>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Tree>) (s1 Seq<Tree>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Tree>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Tree>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Tree>) (i Int) (v Tree)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Tree>) (i Int) (v Tree) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Tree>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<Tree>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Tree>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<Tree>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Tree>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Tree>) (t Seq<Tree>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Tree>) (t Seq<Tree>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Tree>) (t Seq<Tree>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Tree>) (t Seq<Tree>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Tree>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Tree>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Tree>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Tree>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Tree>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Tree>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Tree>) (x Tree)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Tree>) (x Tree) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Tree>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Tree>) (s1 Seq<Tree>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<Tree>) (b Seq<Tree>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Tree) (y Tree)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((t Tree)) (!
  (= (isLeaf<Bool> t) (= (type<Int> t) (as type_Leaf<Int>  Int)))
  :pattern ((isLeaf<Bool> t))
  :pattern ((type<Int> t))
  :qid |prog.type_is_leaf|)))
(assert (forall ((t Tree)) (!
  (=> (isLeaf<Bool> t) (= t (as Leaf<Tree>  Tree)))
  :pattern ((isLeaf<Bool> t))
  :qid |prog.construct_over_destruct_Leaf|)))
(assert (forall ((t Tree)) (!
  (= (isNode<Bool> t) (= (type<Int> t) (as type_Node<Int>  Int)))
  :pattern ((isNode<Bool> t))
  :pattern ((type<Int> t))
  :qid |prog.type_is_node|)))
(assert (forall ((t Tree)) (!
  (=>
    (isNode<Bool> t)
    (= t (Node<Tree> (getVal<Int> t) (getLeft<Tree> t) (getRight<Tree> t))))
  :pattern ((isNode<Bool> t))
  :pattern ((Node<Tree> (getVal<Int> t) (getLeft<Tree> t) (getRight<Tree> t)))
  :qid |prog.construct_over_destruct_Node|)))
(assert (forall ((v Int) (lft Tree) (rgt Tree)) (!
  (and
    (= (getVal<Int> (Node<Tree> v lft rgt)) v)
    (and
      (= (getLeft<Tree> (Node<Tree> v lft rgt)) lft)
      (= (getRight<Tree> (Node<Tree> v lft rgt)) rgt)))
  :pattern ((getVal<Int> (Node<Tree> v lft rgt)))
  :pattern ((getLeft<Tree> (Node<Tree> v lft rgt)))
  :pattern ((getRight<Tree> (Node<Tree> v lft rgt)))
  :qid |prog.destruct_over_construct|)))
(assert (= (type<Int> (as Leaf<Tree>  Tree)) (as type_Leaf<Int>  Int)))
(assert (forall ((v Int) (lft Tree) (rgt Tree)) (!
  (= (type<Int> (Node<Tree> v lft rgt)) (as type_Node<Int>  Int))
  :pattern ((type<Int> (Node<Tree> v lft rgt)))
  :qid |prog.type_of_Node|)))
(assert (forall ((t Tree)) (!
  (or
    (and (= (type<Int> t) (as type_Leaf<Int>  Int)) (= t (as Leaf<Tree>  Tree)))
    (and
      (= (type<Int> t) (as type_Node<Int>  Int))
      (exists ((v Int) (lft Tree) (rgt Tree)) (!
        (= t (Node<Tree> v lft rgt))
        :pattern ((Node<Tree> v lft rgt))
        ))))
  :pattern ((type<Int> t))
  :qid |prog.all_types|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (= (height%limited s@$ t@0@00) (height s@$ t@0@00))
  :pattern ((height s@$ t@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (height%stateless t@0@00)
  :pattern ((height%limited s@$ t@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (=>
    (height%precondition s@$ t@0@00)
    (=
      (height s@$ t@0@00)
      (ite
        (isLeaf<Bool> t@0@00)
        0
        (ite
          (>
            (height%limited $Snap.unit (getLeft<Tree> t@0@00))
            (height%limited $Snap.unit (getRight<Tree> t@0@00)))
          (+ (height%limited $Snap.unit (getLeft<Tree> t@0@00)) 1)
          (+ (height%limited $Snap.unit (getRight<Tree> t@0@00)) 1)))))
  :pattern ((height s@$ t@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (=>
    (height%precondition s@$ t@0@00)
    (ite
      (isLeaf<Bool> t@0@00)
      true
      (and
        (and
          (height%precondition $Snap.unit (getLeft<Tree> t@0@00))
          (height%precondition $Snap.unit (getRight<Tree> t@0@00)))
        (ite
          (>
            (height%limited $Snap.unit (getLeft<Tree> t@0@00))
            (height%limited $Snap.unit (getRight<Tree> t@0@00)))
          (height%precondition $Snap.unit (getLeft<Tree> t@0@00))
          (height%precondition $Snap.unit (getRight<Tree> t@0@00))))))
  :pattern ((height s@$ t@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- computeTreeHeight ----------
(declare-const t@0@01 Tree)
(declare-const res@1@01 Int)
(declare-const t@2@01 Tree)
(declare-const res@3@01 Int)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] res == height(t)
; [eval] height(t)
(push) ; 3
(assert (height%precondition $Snap.unit t@2@01))
(pop) ; 3
; Joined path conditions
(assert (height%precondition $Snap.unit t@2@01))
(assert (= res@3@01 (height $Snap.unit t@2@01)))
(pop) ; 2
(push) ; 2
; [eval] isLeaf(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (isLeaf<Bool> t@2@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (isLeaf<Bool> t@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | isLeaf[Bool](t@2@01) | live]
; [else-branch: 0 | !(isLeaf[Bool](t@2@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | isLeaf[Bool](t@2@01)]
(assert (isLeaf<Bool> t@2@01))
; [exec]
; res := 0
; [eval] res == height(t)
; [eval] height(t)
(push) ; 4
(assert (height%precondition $Snap.unit t@2@01))
(pop) ; 4
; Joined path conditions
(assert (height%precondition $Snap.unit t@2@01))
(push) ; 4
(assert (not (= 0 (height $Snap.unit t@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= 0 (height $Snap.unit t@2@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(isLeaf[Bool](t@2@01))]
(assert (not (isLeaf<Bool> t@2@01)))
(pop) ; 3
; [eval] !isLeaf(t)
; [eval] isLeaf(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (isLeaf<Bool> t@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (isLeaf<Bool> t@2@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(isLeaf[Bool](t@2@01)) | live]
; [else-branch: 1 | isLeaf[Bool](t@2@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(isLeaf[Bool](t@2@01))]
(assert (not (isLeaf<Bool> t@2@01)))
; [exec]
; var current: Seq[Tree]
(declare-const current@5@01 Seq<Tree>)
; [exec]
; var next: Seq[Tree]
(declare-const next@6@01 Seq<Tree>)
; [exec]
; current := Seq(t)
; [eval] Seq(t)
(assert (= (Seq_length (Seq_singleton t@2@01)) 1))
(declare-const current@7@01 Seq<Tree>)
(assert (= current@7@01 (Seq_singleton t@2@01)))
; [exec]
; next := Seq[Tree]()
; [eval] Seq[Tree]()
; [exec]
; res := 0
(declare-const res@8@01 Int)
(declare-const next@9@01 Seq<Tree>)
(declare-const node@10@01 Tree)
(declare-const current@11@01 Seq<Tree>)
(push) ; 4
; Loop head block: Check well-definedness of invariant
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] |current| == 0 ==> res == height(t)
; [eval] |current| == 0
; [eval] |current|
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= (Seq_length current@11@01) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_length current@11@01) 0)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | |current@11@01| == 0 | live]
; [else-branch: 2 | |current@11@01| != 0 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | |current@11@01| == 0]
(assert (= (Seq_length current@11@01) 0))
; [eval] res == height(t)
; [eval] height(t)
(push) ; 7
(assert (height%precondition $Snap.unit t@2@01))
(pop) ; 7
; Joined path conditions
(assert (height%precondition $Snap.unit t@2@01))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | |current@11@01| != 0]
(assert (not (= (Seq_length current@11@01) 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (= (Seq_length current@11@01) 0)
  (and (= (Seq_length current@11@01) 0) (height%precondition $Snap.unit t@2@01))))
; Joined path conditions
(assert (or (not (= (Seq_length current@11@01) 0)) (= (Seq_length current@11@01) 0)))
(assert (=> (= (Seq_length current@11@01) 0) (= res@8@01 (height $Snap.unit t@2@01))))
(pop) ; 4
(push) ; 4
; Loop head block: Establish invariant
; [eval] |current| == 0 ==> res == height(t)
; [eval] |current| == 0
; [eval] |current|
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= (Seq_length current@7@01) 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | |current@7@01| == 0 | dead]
; [else-branch: 3 | |current@7@01| != 0 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 3 | |current@7@01| != 0]
(assert (not (= (Seq_length current@7@01) 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (not (= (Seq_length current@7@01) 0)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 5
(assert (= $t@12@01 $Snap.unit))
(assert (=>
  (= (Seq_length current@11@01) 0)
  (and (= (Seq_length current@11@01) 0) (height%precondition $Snap.unit t@2@01))))
(assert (or (not (= (Seq_length current@11@01) 0)) (= (Seq_length current@11@01) 0)))
(assert (=> (= (Seq_length current@11@01) 0) (= res@8@01 (height $Snap.unit t@2@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 6
; [eval] |current| > 0
; [eval] |current|
(pop) ; 6
(push) ; 6
; [eval] !(|current| > 0)
; [eval] |current| > 0
; [eval] |current|
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [eval] |current| > 0
; [eval] |current|
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> (Seq_length current@11@01) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (> (Seq_length current@11@01) 0)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | |current@11@01| > 0 | live]
; [else-branch: 4 | !(|current@11@01| > 0) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | |current@11@01| > 0]
(assert (> (Seq_length current@11@01) 0))
; [exec]
; res := res + 1
; [eval] res + 1
(declare-const res@13@01 Int)
(assert (= res@13@01 (+ res@8@01 1)))
; [exec]
; next := Seq[Tree]()
; [eval] Seq[Tree]()
(declare-const node@14@01 Tree)
(declare-const current@15@01 Seq<Tree>)
(declare-const next@16@01 Seq<Tree>)
(push) ; 7
; Loop head block: Check well-definedness of invariant
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] (forall i: Int :: { height(current[i]) } i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1))))
(declare-const i@18@01 Int)
(push) ; 8
; [eval] i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 5 | !(i@18@01 >= 0) | live]
; [else-branch: 5 | i@18@01 >= 0 | live]
(push) ; 10
; [then-branch: 5 | !(i@18@01 >= 0)]
(assert (not (>= i@18@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 5 | i@18@01 >= 0]
(assert (>= i@18@01 0))
; [eval] i < |current|
; [eval] |current|
(push) ; 11
; [then-branch: 6 | !(i@18@01 < |current@15@01|) | live]
; [else-branch: 6 | i@18@01 < |current@15@01| | live]
(push) ; 12
; [then-branch: 6 | !(i@18@01 < |current@15@01|)]
(assert (not (< i@18@01 (Seq_length current@15@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 6 | i@18@01 < |current@15@01|]
(assert (< i@18@01 (Seq_length current@15@01)))
; [eval] (forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k])))
(declare-const k@19@01 Int)
(push) ; 13
; [eval] k >= 0 && (k < |current| && height(current[i]) > height(current[k]))
; [eval] k >= 0
(push) ; 14
; [then-branch: 7 | !(k@19@01 >= 0) | live]
; [else-branch: 7 | k@19@01 >= 0 | live]
(push) ; 15
; [then-branch: 7 | !(k@19@01 >= 0)]
(assert (not (>= k@19@01 0)))
(pop) ; 15
(push) ; 15
; [else-branch: 7 | k@19@01 >= 0]
(assert (>= k@19@01 0))
; [eval] k < |current|
; [eval] |current|
(push) ; 16
; [then-branch: 8 | !(k@19@01 < |current@15@01|) | live]
; [else-branch: 8 | k@19@01 < |current@15@01| | live]
(push) ; 17
; [then-branch: 8 | !(k@19@01 < |current@15@01|)]
(assert (not (< k@19@01 (Seq_length current@15@01))))
(pop) ; 17
(push) ; 17
; [else-branch: 8 | k@19@01 < |current@15@01|]
(assert (< k@19@01 (Seq_length current@15@01)))
; [eval] height(current[i]) > height(current[k])
; [eval] height(current[i])
; [eval] current[i]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01)))
; [eval] height(current[k])
; [eval] current[k]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@15@01 k@19@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@15@01 k@19@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@19@01 (Seq_length current@15@01))
  (and
    (< k@19@01 (Seq_length current@15@01))
    (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01))
    (height%precondition $Snap.unit (Seq_index current@15@01 k@19@01)))))
(assert (or
  (< k@19@01 (Seq_length current@15@01))
  (not (< k@19@01 (Seq_length current@15@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@19@01 0)
  (and
    (>= k@19@01 0)
    (=>
      (< k@19@01 (Seq_length current@15@01))
      (and
        (< k@19@01 (Seq_length current@15@01))
        (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01))
        (height%precondition $Snap.unit (Seq_index current@15@01 k@19@01))))
    (or
      (< k@19@01 (Seq_length current@15@01))
      (not (< k@19@01 (Seq_length current@15@01)))))))
(assert (or (>= k@19@01 0) (not (>= k@19@01 0))))
(pop) ; 13
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@19@01 Int)) (!
  (and
    (=>
      (>= k@19@01 0)
      (and
        (>= k@19@01 0)
        (=>
          (< k@19@01 (Seq_length current@15@01))
          (and
            (< k@19@01 (Seq_length current@15@01))
            (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01))
            (height%precondition $Snap.unit (Seq_index current@15@01 k@19@01))))
        (or
          (< k@19@01 (Seq_length current@15@01))
          (not (< k@19@01 (Seq_length current@15@01))))))
    (or (>= k@19@01 0) (not (>= k@19@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|)))
(push) ; 13
; [then-branch: 9 | !(QA k@19@01 :: k@19@01 >= 0 && k@19@01 < |current@15@01| && height(_, current@15@01[i@18@01]) > height(_, current@15@01[k@19@01])) | live]
; [else-branch: 9 | QA k@19@01 :: k@19@01 >= 0 && k@19@01 < |current@15@01| && height(_, current@15@01[i@18@01]) > height(_, current@15@01[k@19@01]) | live]
(push) ; 14
; [then-branch: 9 | !(QA k@19@01 :: k@19@01 >= 0 && k@19@01 < |current@15@01| && height(_, current@15@01[i@18@01]) > height(_, current@15@01[k@19@01]))]
(assert (not
  (forall ((k@19@01 Int)) (!
    (and
      (>= k@19@01 0)
      (and
        (< k@19@01 (Seq_length current@15@01))
        (>
          (height $Snap.unit (Seq_index current@15@01 i@18@01))
          (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))
(pop) ; 14
(push) ; 14
; [else-branch: 9 | QA k@19@01 :: k@19@01 >= 0 && k@19@01 < |current@15@01| && height(_, current@15@01[i@18@01]) > height(_, current@15@01[k@19@01])]
(assert (forall ((k@19@01 Int)) (!
  (and
    (>= k@19@01 0)
    (and
      (< k@19@01 (Seq_length current@15@01))
      (>
        (height $Snap.unit (Seq_index current@15@01 i@18@01))
        (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))
; [eval] (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)
(declare-const j@20@01 Int)
(push) ; 15
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k]))))
; [eval] j >= 0
(push) ; 16
; [then-branch: 10 | !(j@20@01 >= 0) | live]
; [else-branch: 10 | j@20@01 >= 0 | live]
(push) ; 17
; [then-branch: 10 | !(j@20@01 >= 0)]
(assert (not (>= j@20@01 0)))
(pop) ; 17
(push) ; 17
; [else-branch: 10 | j@20@01 >= 0]
(assert (>= j@20@01 0))
; [eval] j < |next|
; [eval] |next|
(push) ; 18
; [then-branch: 11 | !(j@20@01 < |next@16@01|) | live]
; [else-branch: 11 | j@20@01 < |next@16@01| | live]
(push) ; 19
; [then-branch: 11 | !(j@20@01 < |next@16@01|)]
(assert (not (< j@20@01 (Seq_length next@16@01))))
(pop) ; 19
(push) ; 19
; [else-branch: 11 | j@20@01 < |next@16@01|]
(assert (< j@20@01 (Seq_length next@16@01)))
; [eval] (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))
(declare-const k@21@01 Int)
(push) ; 20
; [eval] k >= 0 && (k < |next| && height(next[j]) > height(next[k]))
; [eval] k >= 0
(push) ; 21
; [then-branch: 12 | !(k@21@01 >= 0) | live]
; [else-branch: 12 | k@21@01 >= 0 | live]
(push) ; 22
; [then-branch: 12 | !(k@21@01 >= 0)]
(assert (not (>= k@21@01 0)))
(pop) ; 22
(push) ; 22
; [else-branch: 12 | k@21@01 >= 0]
(assert (>= k@21@01 0))
; [eval] k < |next|
; [eval] |next|
(push) ; 23
; [then-branch: 13 | !(k@21@01 < |next@16@01|) | live]
; [else-branch: 13 | k@21@01 < |next@16@01| | live]
(push) ; 24
; [then-branch: 13 | !(k@21@01 < |next@16@01|)]
(assert (not (< k@21@01 (Seq_length next@16@01))))
(pop) ; 24
(push) ; 24
; [else-branch: 13 | k@21@01 < |next@16@01|]
(assert (< k@21@01 (Seq_length next@16@01)))
; [eval] height(next[j]) > height(next[k])
; [eval] height(next[j])
; [eval] next[j]
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01)))
; [eval] height(next[k])
; [eval] next[k]
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index next@16@01 k@21@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index next@16@01 k@21@01)))
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@21@01 (Seq_length next@16@01))
  (and
    (< k@21@01 (Seq_length next@16@01))
    (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01))
    (height%precondition $Snap.unit (Seq_index next@16@01 k@21@01)))))
(assert (or
  (< k@21@01 (Seq_length next@16@01))
  (not (< k@21@01 (Seq_length next@16@01)))))
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@21@01 0)
  (and
    (>= k@21@01 0)
    (=>
      (< k@21@01 (Seq_length next@16@01))
      (and
        (< k@21@01 (Seq_length next@16@01))
        (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01))
        (height%precondition $Snap.unit (Seq_index next@16@01 k@21@01))))
    (or
      (< k@21@01 (Seq_length next@16@01))
      (not (< k@21@01 (Seq_length next@16@01)))))))
(assert (or (>= k@21@01 0) (not (>= k@21@01 0))))
(pop) ; 20
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@21@01 Int)) (!
  (and
    (=>
      (>= k@21@01 0)
      (and
        (>= k@21@01 0)
        (=>
          (< k@21@01 (Seq_length next@16@01))
          (and
            (< k@21@01 (Seq_length next@16@01))
            (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01))
            (height%precondition $Snap.unit (Seq_index next@16@01 k@21@01))))
        (or
          (< k@21@01 (Seq_length next@16@01))
          (not (< k@21@01 (Seq_length next@16@01))))))
    (or (>= k@21@01 0) (not (>= k@21@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@20@01 (Seq_length next@16@01))
  (and
    (< j@20@01 (Seq_length next@16@01))
    (forall ((k@21@01 Int)) (!
      (and
        (=>
          (>= k@21@01 0)
          (and
            (>= k@21@01 0)
            (=>
              (< k@21@01 (Seq_length next@16@01))
              (and
                (< k@21@01 (Seq_length next@16@01))
                (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01))
                (height%precondition $Snap.unit (Seq_index next@16@01 k@21@01))))
            (or
              (< k@21@01 (Seq_length next@16@01))
              (not (< k@21@01 (Seq_length next@16@01))))))
        (or (>= k@21@01 0) (not (>= k@21@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))))
(assert (or
  (< j@20@01 (Seq_length next@16@01))
  (not (< j@20@01 (Seq_length next@16@01)))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@20@01 0)
  (and
    (>= j@20@01 0)
    (=>
      (< j@20@01 (Seq_length next@16@01))
      (and
        (< j@20@01 (Seq_length next@16@01))
        (forall ((k@21@01 Int)) (!
          (and
            (=>
              (>= k@21@01 0)
              (and
                (>= k@21@01 0)
                (=>
                  (< k@21@01 (Seq_length next@16@01))
                  (and
                    (< k@21@01 (Seq_length next@16@01))
                    (height%precondition $Snap.unit (Seq_index
                      next@16@01
                      j@20@01))
                    (height%precondition $Snap.unit (Seq_index
                      next@16@01
                      k@21@01))))
                (or
                  (< k@21@01 (Seq_length next@16@01))
                  (not (< k@21@01 (Seq_length next@16@01))))))
            (or (>= k@21@01 0) (not (>= k@21@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
    (or
      (< j@20@01 (Seq_length next@16@01))
      (not (< j@20@01 (Seq_length next@16@01)))))))
(assert (or (>= j@20@01 0) (not (>= j@20@01 0))))
(push) ; 16
; [then-branch: 14 | j@20@01 >= 0 && j@20@01 < |next@16@01| && QA k@21@01 :: k@21@01 >= 0 && k@21@01 < |next@16@01| && height(_, next@16@01[j@20@01]) > height(_, next@16@01[k@21@01]) | live]
; [else-branch: 14 | !(j@20@01 >= 0 && j@20@01 < |next@16@01| && QA k@21@01 :: k@21@01 >= 0 && k@21@01 < |next@16@01| && height(_, next@16@01[j@20@01]) > height(_, next@16@01[k@21@01])) | live]
(push) ; 17
; [then-branch: 14 | j@20@01 >= 0 && j@20@01 < |next@16@01| && QA k@21@01 :: k@21@01 >= 0 && k@21@01 < |next@16@01| && height(_, next@16@01[j@20@01]) > height(_, next@16@01[k@21@01])]
(assert (and
  (>= j@20@01 0)
  (and
    (< j@20@01 (Seq_length next@16@01))
    (forall ((k@21@01 Int)) (!
      (and
        (>= k@21@01 0)
        (and
          (< k@21@01 (Seq_length next@16@01))
          (>
            (height $Snap.unit (Seq_index next@16@01 j@20@01))
            (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
; [eval] height(next[j]) == height(current[i]) - 1
; [eval] height(next[j])
; [eval] next[j]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01)))
; [eval] height(current[i]) - 1
; [eval] height(current[i])
; [eval] current[i]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01)))
(pop) ; 17
(push) ; 17
; [else-branch: 14 | !(j@20@01 >= 0 && j@20@01 < |next@16@01| && QA k@21@01 :: k@21@01 >= 0 && k@21@01 < |next@16@01| && height(_, next@16@01[j@20@01]) > height(_, next@16@01[k@21@01]))]
(assert (not
  (and
    (>= j@20@01 0)
    (and
      (< j@20@01 (Seq_length next@16@01))
      (forall ((k@21@01 Int)) (!
        (and
          (>= k@21@01 0)
          (and
            (< k@21@01 (Seq_length next@16@01))
            (>
              (height $Snap.unit (Seq_index next@16@01 j@20@01))
              (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (=>
  (and
    (>= j@20@01 0)
    (and
      (< j@20@01 (Seq_length next@16@01))
      (forall ((k@21@01 Int)) (!
        (and
          (>= k@21@01 0)
          (and
            (< k@21@01 (Seq_length next@16@01))
            (>
              (height $Snap.unit (Seq_index next@16@01 j@20@01))
              (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
  (and
    (>= j@20@01 0)
    (< j@20@01 (Seq_length next@16@01))
    (forall ((k@21@01 Int)) (!
      (and
        (>= k@21@01 0)
        (and
          (< k@21@01 (Seq_length next@16@01))
          (>
            (height $Snap.unit (Seq_index next@16@01 j@20@01))
            (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
    (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01))
    (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@20@01 0)
      (and
        (< j@20@01 (Seq_length next@16@01))
        (forall ((k@21@01 Int)) (!
          (and
            (>= k@21@01 0)
            (and
              (< k@21@01 (Seq_length next@16@01))
              (>
                (height $Snap.unit (Seq_index next@16@01 j@20@01))
                (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
  (and
    (>= j@20@01 0)
    (and
      (< j@20@01 (Seq_length next@16@01))
      (forall ((k@21@01 Int)) (!
        (and
          (>= k@21@01 0)
          (and
            (< k@21@01 (Seq_length next@16@01))
            (>
              (height $Snap.unit (Seq_index next@16@01 j@20@01))
              (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
(pop) ; 15
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@20@01 Int)) (!
  (and
    (=>
      (>= j@20@01 0)
      (and
        (>= j@20@01 0)
        (=>
          (< j@20@01 (Seq_length next@16@01))
          (and
            (< j@20@01 (Seq_length next@16@01))
            (forall ((k@21@01 Int)) (!
              (and
                (=>
                  (>= k@21@01 0)
                  (and
                    (>= k@21@01 0)
                    (=>
                      (< k@21@01 (Seq_length next@16@01))
                      (and
                        (< k@21@01 (Seq_length next@16@01))
                        (height%precondition $Snap.unit (Seq_index
                          next@16@01
                          j@20@01))
                        (height%precondition $Snap.unit (Seq_index
                          next@16@01
                          k@21@01))))
                    (or
                      (< k@21@01 (Seq_length next@16@01))
                      (not (< k@21@01 (Seq_length next@16@01))))))
                (or (>= k@21@01 0) (not (>= k@21@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
        (or
          (< j@20@01 (Seq_length next@16@01))
          (not (< j@20@01 (Seq_length next@16@01))))))
    (or (>= j@20@01 0) (not (>= j@20@01 0)))
    (=>
      (and
        (>= j@20@01 0)
        (and
          (< j@20@01 (Seq_length next@16@01))
          (forall ((k@21@01 Int)) (!
            (and
              (>= k@21@01 0)
              (and
                (< k@21@01 (Seq_length next@16@01))
                (>
                  (height $Snap.unit (Seq_index next@16@01 j@20@01))
                  (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
      (and
        (>= j@20@01 0)
        (< j@20@01 (Seq_length next@16@01))
        (forall ((k@21@01 Int)) (!
          (and
            (>= k@21@01 0)
            (and
              (< k@21@01 (Seq_length next@16@01))
              (>
                (height $Snap.unit (Seq_index next@16@01 j@20@01))
                (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
        (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01))
        (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01))))
    (or
      (not
        (and
          (>= j@20@01 0)
          (and
            (< j@20@01 (Seq_length next@16@01))
            (forall ((k@21@01 Int)) (!
              (and
                (>= k@21@01 0)
                (and
                  (< k@21@01 (Seq_length next@16@01))
                  (>
                    (height $Snap.unit (Seq_index next@16@01 j@20@01))
                    (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
      (and
        (>= j@20@01 0)
        (and
          (< j@20@01 (Seq_length next@16@01))
          (forall ((k@21@01 Int)) (!
            (and
              (>= k@21@01 0)
              (and
                (< k@21@01 (Seq_length next@16@01))
                (>
                  (height $Snap.unit (Seq_index next@16@01 j@20@01))
                  (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
  :pattern ((height%limited $Snap.unit (Seq_index next@16@01 j@20@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (forall ((k@19@01 Int)) (!
    (and
      (>= k@19@01 0)
      (and
        (< k@19@01 (Seq_length current@15@01))
        (>
          (height $Snap.unit (Seq_index current@15@01 i@18@01))
          (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (and
    (forall ((k@19@01 Int)) (!
      (and
        (>= k@19@01 0)
        (and
          (< k@19@01 (Seq_length current@15@01))
          (>
            (height $Snap.unit (Seq_index current@15@01 i@18@01))
            (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
    (forall ((j@20@01 Int)) (!
      (and
        (=>
          (>= j@20@01 0)
          (and
            (>= j@20@01 0)
            (=>
              (< j@20@01 (Seq_length next@16@01))
              (and
                (< j@20@01 (Seq_length next@16@01))
                (forall ((k@21@01 Int)) (!
                  (and
                    (=>
                      (>= k@21@01 0)
                      (and
                        (>= k@21@01 0)
                        (=>
                          (< k@21@01 (Seq_length next@16@01))
                          (and
                            (< k@21@01 (Seq_length next@16@01))
                            (height%precondition $Snap.unit (Seq_index
                              next@16@01
                              j@20@01))
                            (height%precondition $Snap.unit (Seq_index
                              next@16@01
                              k@21@01))))
                        (or
                          (< k@21@01 (Seq_length next@16@01))
                          (not (< k@21@01 (Seq_length next@16@01))))))
                    (or (>= k@21@01 0) (not (>= k@21@01 0))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    next@16@01
                    k@21@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
            (or
              (< j@20@01 (Seq_length next@16@01))
              (not (< j@20@01 (Seq_length next@16@01))))))
        (or (>= j@20@01 0) (not (>= j@20@01 0)))
        (=>
          (and
            (>= j@20@01 0)
            (and
              (< j@20@01 (Seq_length next@16@01))
              (forall ((k@21@01 Int)) (!
                (and
                  (>= k@21@01 0)
                  (and
                    (< k@21@01 (Seq_length next@16@01))
                    (>
                      (height $Snap.unit (Seq_index next@16@01 j@20@01))
                      (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  next@16@01
                  k@21@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
          (and
            (>= j@20@01 0)
            (< j@20@01 (Seq_length next@16@01))
            (forall ((k@21@01 Int)) (!
              (and
                (>= k@21@01 0)
                (and
                  (< k@21@01 (Seq_length next@16@01))
                  (>
                    (height $Snap.unit (Seq_index next@16@01 j@20@01))
                    (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index next@16@01 k@21@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
            (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01))
            (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01))))
        (or
          (not
            (and
              (>= j@20@01 0)
              (and
                (< j@20@01 (Seq_length next@16@01))
                (forall ((k@21@01 Int)) (!
                  (and
                    (>= k@21@01 0)
                    (and
                      (< k@21@01 (Seq_length next@16@01))
                      (>
                        (height $Snap.unit (Seq_index next@16@01 j@20@01))
                        (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    next@16@01
                    k@21@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
          (and
            (>= j@20@01 0)
            (and
              (< j@20@01 (Seq_length next@16@01))
              (forall ((k@21@01 Int)) (!
                (and
                  (>= k@21@01 0)
                  (and
                    (< k@21@01 (Seq_length next@16@01))
                    (>
                      (height $Snap.unit (Seq_index next@16@01 j@20@01))
                      (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  next@16@01
                  k@21@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
      :pattern ((height%limited $Snap.unit (Seq_index next@16@01 j@20@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))))
(assert (or
  (forall ((k@19@01 Int)) (!
    (and
      (>= k@19@01 0)
      (and
        (< k@19@01 (Seq_length current@15@01))
        (>
          (height $Snap.unit (Seq_index current@15@01 i@18@01))
          (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (not
    (forall ((k@19@01 Int)) (!
      (and
        (>= k@19@01 0)
        (and
          (< k@19@01 (Seq_length current@15@01))
          (>
            (height $Snap.unit (Seq_index current@15@01 i@18@01))
            (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@18@01 (Seq_length current@15@01))
  (and
    (< i@18@01 (Seq_length current@15@01))
    (forall ((k@19@01 Int)) (!
      (and
        (=>
          (>= k@19@01 0)
          (and
            (>= k@19@01 0)
            (=>
              (< k@19@01 (Seq_length current@15@01))
              (and
                (< k@19@01 (Seq_length current@15@01))
                (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01))
                (height%precondition $Snap.unit (Seq_index current@15@01 k@19@01))))
            (or
              (< k@19@01 (Seq_length current@15@01))
              (not (< k@19@01 (Seq_length current@15@01))))))
        (or (>= k@19@01 0) (not (>= k@19@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
    (=>
      (forall ((k@19@01 Int)) (!
        (and
          (>= k@19@01 0)
          (and
            (< k@19@01 (Seq_length current@15@01))
            (>
              (height $Snap.unit (Seq_index current@15@01 i@18@01))
              (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (and
        (forall ((k@19@01 Int)) (!
          (and
            (>= k@19@01 0)
            (and
              (< k@19@01 (Seq_length current@15@01))
              (>
                (height $Snap.unit (Seq_index current@15@01 i@18@01))
                (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@20@01 Int)) (!
          (and
            (=>
              (>= j@20@01 0)
              (and
                (>= j@20@01 0)
                (=>
                  (< j@20@01 (Seq_length next@16@01))
                  (and
                    (< j@20@01 (Seq_length next@16@01))
                    (forall ((k@21@01 Int)) (!
                      (and
                        (=>
                          (>= k@21@01 0)
                          (and
                            (>= k@21@01 0)
                            (=>
                              (< k@21@01 (Seq_length next@16@01))
                              (and
                                (< k@21@01 (Seq_length next@16@01))
                                (height%precondition $Snap.unit (Seq_index
                                  next@16@01
                                  j@20@01))
                                (height%precondition $Snap.unit (Seq_index
                                  next@16@01
                                  k@21@01))))
                            (or
                              (< k@21@01 (Seq_length next@16@01))
                              (not (< k@21@01 (Seq_length next@16@01))))))
                        (or (>= k@21@01 0) (not (>= k@21@01 0))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        next@16@01
                        k@21@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                (or
                  (< j@20@01 (Seq_length next@16@01))
                  (not (< j@20@01 (Seq_length next@16@01))))))
            (or (>= j@20@01 0) (not (>= j@20@01 0)))
            (=>
              (and
                (>= j@20@01 0)
                (and
                  (< j@20@01 (Seq_length next@16@01))
                  (forall ((k@21@01 Int)) (!
                    (and
                      (>= k@21@01 0)
                      (and
                        (< k@21@01 (Seq_length next@16@01))
                        (>
                          (height $Snap.unit (Seq_index next@16@01 j@20@01))
                          (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      next@16@01
                      k@21@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (>= j@20@01 0)
                (< j@20@01 (Seq_length next@16@01))
                (forall ((k@21@01 Int)) (!
                  (and
                    (>= k@21@01 0)
                    (and
                      (< k@21@01 (Seq_length next@16@01))
                      (>
                        (height $Snap.unit (Seq_index next@16@01 j@20@01))
                        (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    next@16@01
                    k@21@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                (height%precondition $Snap.unit (Seq_index next@16@01 j@20@01))
                (height%precondition $Snap.unit (Seq_index current@15@01 i@18@01))))
            (or
              (not
                (and
                  (>= j@20@01 0)
                  (and
                    (< j@20@01 (Seq_length next@16@01))
                    (forall ((k@21@01 Int)) (!
                      (and
                        (>= k@21@01 0)
                        (and
                          (< k@21@01 (Seq_length next@16@01))
                          (>
                            (height $Snap.unit (Seq_index next@16@01 j@20@01))
                            (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        next@16@01
                        k@21@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
              (and
                (>= j@20@01 0)
                (and
                  (< j@20@01 (Seq_length next@16@01))
                  (forall ((k@21@01 Int)) (!
                    (and
                      (>= k@21@01 0)
                      (and
                        (< k@21@01 (Seq_length next@16@01))
                        (>
                          (height $Snap.unit (Seq_index next@16@01 j@20@01))
                          (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      next@16@01
                      k@21@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
          :pattern ((height%limited $Snap.unit (Seq_index next@16@01 j@20@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
    (or
      (forall ((k@19@01 Int)) (!
        (and
          (>= k@19@01 0)
          (and
            (< k@19@01 (Seq_length current@15@01))
            (>
              (height $Snap.unit (Seq_index current@15@01 i@18@01))
              (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (not
        (forall ((k@19@01 Int)) (!
          (and
            (>= k@19@01 0)
            (and
              (< k@19@01 (Seq_length current@15@01))
              (>
                (height $Snap.unit (Seq_index current@15@01 i@18@01))
                (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))))
(assert (or
  (< i@18@01 (Seq_length current@15@01))
  (not (< i@18@01 (Seq_length current@15@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@18@01 0)
  (and
    (>= i@18@01 0)
    (=>
      (< i@18@01 (Seq_length current@15@01))
      (and
        (< i@18@01 (Seq_length current@15@01))
        (forall ((k@19@01 Int)) (!
          (and
            (=>
              (>= k@19@01 0)
              (and
                (>= k@19@01 0)
                (=>
                  (< k@19@01 (Seq_length current@15@01))
                  (and
                    (< k@19@01 (Seq_length current@15@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@15@01
                      i@18@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@15@01
                      k@19@01))))
                (or
                  (< k@19@01 (Seq_length current@15@01))
                  (not (< k@19@01 (Seq_length current@15@01))))))
            (or (>= k@19@01 0) (not (>= k@19@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
        (=>
          (forall ((k@19@01 Int)) (!
            (and
              (>= k@19@01 0)
              (and
                (< k@19@01 (Seq_length current@15@01))
                (>
                  (height $Snap.unit (Seq_index current@15@01 i@18@01))
                  (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@15@01
              k@19@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (and
            (forall ((k@19@01 Int)) (!
              (and
                (>= k@19@01 0)
                (and
                  (< k@19@01 (Seq_length current@15@01))
                  (>
                    (height $Snap.unit (Seq_index current@15@01 i@18@01))
                    (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@15@01
                k@19@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
            (forall ((j@20@01 Int)) (!
              (and
                (=>
                  (>= j@20@01 0)
                  (and
                    (>= j@20@01 0)
                    (=>
                      (< j@20@01 (Seq_length next@16@01))
                      (and
                        (< j@20@01 (Seq_length next@16@01))
                        (forall ((k@21@01 Int)) (!
                          (and
                            (=>
                              (>= k@21@01 0)
                              (and
                                (>= k@21@01 0)
                                (=>
                                  (< k@21@01 (Seq_length next@16@01))
                                  (and
                                    (< k@21@01 (Seq_length next@16@01))
                                    (height%precondition $Snap.unit (Seq_index
                                      next@16@01
                                      j@20@01))
                                    (height%precondition $Snap.unit (Seq_index
                                      next@16@01
                                      k@21@01))))
                                (or
                                  (< k@21@01 (Seq_length next@16@01))
                                  (not (< k@21@01 (Seq_length next@16@01))))))
                            (or (>= k@21@01 0) (not (>= k@21@01 0))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            next@16@01
                            k@21@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                    (or
                      (< j@20@01 (Seq_length next@16@01))
                      (not (< j@20@01 (Seq_length next@16@01))))))
                (or (>= j@20@01 0) (not (>= j@20@01 0)))
                (=>
                  (and
                    (>= j@20@01 0)
                    (and
                      (< j@20@01 (Seq_length next@16@01))
                      (forall ((k@21@01 Int)) (!
                        (and
                          (>= k@21@01 0)
                          (and
                            (< k@21@01 (Seq_length next@16@01))
                            (>
                              (height $Snap.unit (Seq_index next@16@01 j@20@01))
                              (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          next@16@01
                          k@21@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                  (and
                    (>= j@20@01 0)
                    (< j@20@01 (Seq_length next@16@01))
                    (forall ((k@21@01 Int)) (!
                      (and
                        (>= k@21@01 0)
                        (and
                          (< k@21@01 (Seq_length next@16@01))
                          (>
                            (height $Snap.unit (Seq_index next@16@01 j@20@01))
                            (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        next@16@01
                        k@21@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                    (height%precondition $Snap.unit (Seq_index
                      next@16@01
                      j@20@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@15@01
                      i@18@01))))
                (or
                  (not
                    (and
                      (>= j@20@01 0)
                      (and
                        (< j@20@01 (Seq_length next@16@01))
                        (forall ((k@21@01 Int)) (!
                          (and
                            (>= k@21@01 0)
                            (and
                              (< k@21@01 (Seq_length next@16@01))
                              (>
                                (height $Snap.unit (Seq_index next@16@01 j@20@01))
                                (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            next@16@01
                            k@21@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                  (and
                    (>= j@20@01 0)
                    (and
                      (< j@20@01 (Seq_length next@16@01))
                      (forall ((k@21@01 Int)) (!
                        (and
                          (>= k@21@01 0)
                          (and
                            (< k@21@01 (Seq_length next@16@01))
                            (>
                              (height $Snap.unit (Seq_index next@16@01 j@20@01))
                              (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          next@16@01
                          k@21@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
              :pattern ((height%limited $Snap.unit (Seq_index next@16@01 j@20@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
        (or
          (forall ((k@19@01 Int)) (!
            (and
              (>= k@19@01 0)
              (and
                (< k@19@01 (Seq_length current@15@01))
                (>
                  (height $Snap.unit (Seq_index current@15@01 i@18@01))
                  (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@15@01
              k@19@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (not
            (forall ((k@19@01 Int)) (!
              (and
                (>= k@19@01 0)
                (and
                  (< k@19@01 (Seq_length current@15@01))
                  (>
                    (height $Snap.unit (Seq_index current@15@01 i@18@01))
                    (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@15@01
                k@19@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
    (or
      (< i@18@01 (Seq_length current@15@01))
      (not (< i@18@01 (Seq_length current@15@01)))))))
(assert (or (>= i@18@01 0) (not (>= i@18@01 0))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@18@01 Int)) (!
  (and
    (=>
      (>= i@18@01 0)
      (and
        (>= i@18@01 0)
        (=>
          (< i@18@01 (Seq_length current@15@01))
          (and
            (< i@18@01 (Seq_length current@15@01))
            (forall ((k@19@01 Int)) (!
              (and
                (=>
                  (>= k@19@01 0)
                  (and
                    (>= k@19@01 0)
                    (=>
                      (< k@19@01 (Seq_length current@15@01))
                      (and
                        (< k@19@01 (Seq_length current@15@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@15@01
                          i@18@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@15@01
                          k@19@01))))
                    (or
                      (< k@19@01 (Seq_length current@15@01))
                      (not (< k@19@01 (Seq_length current@15@01))))))
                (or (>= k@19@01 0) (not (>= k@19@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@15@01
                k@19@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
            (=>
              (forall ((k@19@01 Int)) (!
                (and
                  (>= k@19@01 0)
                  (and
                    (< k@19@01 (Seq_length current@15@01))
                    (>
                      (height $Snap.unit (Seq_index current@15@01 i@18@01))
                      (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@15@01
                  k@19@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (and
                (forall ((k@19@01 Int)) (!
                  (and
                    (>= k@19@01 0)
                    (and
                      (< k@19@01 (Seq_length current@15@01))
                      (>
                        (height $Snap.unit (Seq_index current@15@01 i@18@01))
                        (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@15@01
                    k@19@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
                (forall ((j@20@01 Int)) (!
                  (and
                    (=>
                      (>= j@20@01 0)
                      (and
                        (>= j@20@01 0)
                        (=>
                          (< j@20@01 (Seq_length next@16@01))
                          (and
                            (< j@20@01 (Seq_length next@16@01))
                            (forall ((k@21@01 Int)) (!
                              (and
                                (=>
                                  (>= k@21@01 0)
                                  (and
                                    (>= k@21@01 0)
                                    (=>
                                      (< k@21@01 (Seq_length next@16@01))
                                      (and
                                        (< k@21@01 (Seq_length next@16@01))
                                        (height%precondition $Snap.unit (Seq_index
                                          next@16@01
                                          j@20@01))
                                        (height%precondition $Snap.unit (Seq_index
                                          next@16@01
                                          k@21@01))))
                                    (or
                                      (< k@21@01 (Seq_length next@16@01))
                                      (not (< k@21@01 (Seq_length next@16@01))))))
                                (or (>= k@21@01 0) (not (>= k@21@01 0))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                next@16@01
                                k@21@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                        (or
                          (< j@20@01 (Seq_length next@16@01))
                          (not (< j@20@01 (Seq_length next@16@01))))))
                    (or (>= j@20@01 0) (not (>= j@20@01 0)))
                    (=>
                      (and
                        (>= j@20@01 0)
                        (and
                          (< j@20@01 (Seq_length next@16@01))
                          (forall ((k@21@01 Int)) (!
                            (and
                              (>= k@21@01 0)
                              (and
                                (< k@21@01 (Seq_length next@16@01))
                                (>
                                  (height $Snap.unit (Seq_index
                                    next@16@01
                                    j@20@01))
                                  (height $Snap.unit (Seq_index
                                    next@16@01
                                    k@21@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              next@16@01
                              k@21@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                      (and
                        (>= j@20@01 0)
                        (< j@20@01 (Seq_length next@16@01))
                        (forall ((k@21@01 Int)) (!
                          (and
                            (>= k@21@01 0)
                            (and
                              (< k@21@01 (Seq_length next@16@01))
                              (>
                                (height $Snap.unit (Seq_index next@16@01 j@20@01))
                                (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            next@16@01
                            k@21@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                        (height%precondition $Snap.unit (Seq_index
                          next@16@01
                          j@20@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@15@01
                          i@18@01))))
                    (or
                      (not
                        (and
                          (>= j@20@01 0)
                          (and
                            (< j@20@01 (Seq_length next@16@01))
                            (forall ((k@21@01 Int)) (!
                              (and
                                (>= k@21@01 0)
                                (and
                                  (< k@21@01 (Seq_length next@16@01))
                                  (>
                                    (height $Snap.unit (Seq_index
                                      next@16@01
                                      j@20@01))
                                    (height $Snap.unit (Seq_index
                                      next@16@01
                                      k@21@01)))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                next@16@01
                                k@21@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                      (and
                        (>= j@20@01 0)
                        (and
                          (< j@20@01 (Seq_length next@16@01))
                          (forall ((k@21@01 Int)) (!
                            (and
                              (>= k@21@01 0)
                              (and
                                (< k@21@01 (Seq_length next@16@01))
                                (>
                                  (height $Snap.unit (Seq_index
                                    next@16@01
                                    j@20@01))
                                  (height $Snap.unit (Seq_index
                                    next@16@01
                                    k@21@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              next@16@01
                              k@21@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    next@16@01
                    j@20@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
            (or
              (forall ((k@19@01 Int)) (!
                (and
                  (>= k@19@01 0)
                  (and
                    (< k@19@01 (Seq_length current@15@01))
                    (>
                      (height $Snap.unit (Seq_index current@15@01 i@18@01))
                      (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@15@01
                  k@19@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (not
                (forall ((k@19@01 Int)) (!
                  (and
                    (>= k@19@01 0)
                    (and
                      (< k@19@01 (Seq_length current@15@01))
                      (>
                        (height $Snap.unit (Seq_index current@15@01 i@18@01))
                        (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@15@01
                    k@19@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
        (or
          (< i@18@01 (Seq_length current@15@01))
          (not (< i@18@01 (Seq_length current@15@01))))))
    (or (>= i@18@01 0) (not (>= i@18@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@15@01 i@18@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60-aux|)))
(assert (forall ((i@18@01 Int)) (!
  (and
    (>= i@18@01 0)
    (and
      (< i@18@01 (Seq_length current@15@01))
      (and
        (forall ((k@19@01 Int)) (!
          (and
            (>= k@19@01 0)
            (and
              (< k@19@01 (Seq_length current@15@01))
              (>
                (height $Snap.unit (Seq_index current@15@01 i@18@01))
                (height $Snap.unit (Seq_index current@15@01 k@19@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@15@01 k@19@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@20@01 Int)) (!
          (=>
            (and
              (>= j@20@01 0)
              (and
                (< j@20@01 (Seq_length next@16@01))
                (forall ((k@21@01 Int)) (!
                  (and
                    (>= k@21@01 0)
                    (and
                      (< k@21@01 (Seq_length next@16@01))
                      (>
                        (height $Snap.unit (Seq_index next@16@01 j@20@01))
                        (height $Snap.unit (Seq_index next@16@01 k@21@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    next@16@01
                    k@21@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
            (=
              (height $Snap.unit (Seq_index next@16@01 j@20@01))
              (- (height $Snap.unit (Seq_index current@15@01 i@18@01)) 1)))
          :pattern ((height%limited $Snap.unit (Seq_index next@16@01 j@20@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@15@01 i@18@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60|)))
(pop) ; 7
(push) ; 7
; Loop head block: Establish invariant
; [eval] (forall i: Int :: { height(current[i]) } i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1))))
(declare-const i@22@01 Int)
(push) ; 8
; [eval] i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 15 | !(i@22@01 >= 0) | live]
; [else-branch: 15 | i@22@01 >= 0 | live]
(push) ; 10
; [then-branch: 15 | !(i@22@01 >= 0)]
(assert (not (>= i@22@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 15 | i@22@01 >= 0]
(assert (>= i@22@01 0))
; [eval] i < |current|
; [eval] |current|
(push) ; 11
; [then-branch: 16 | !(i@22@01 < |current@11@01|) | live]
; [else-branch: 16 | i@22@01 < |current@11@01| | live]
(push) ; 12
; [then-branch: 16 | !(i@22@01 < |current@11@01|)]
(assert (not (< i@22@01 (Seq_length current@11@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 16 | i@22@01 < |current@11@01|]
(assert (< i@22@01 (Seq_length current@11@01)))
; [eval] (forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k])))
(declare-const k@23@01 Int)
(push) ; 13
; [eval] k >= 0 && (k < |current| && height(current[i]) > height(current[k]))
; [eval] k >= 0
(push) ; 14
; [then-branch: 17 | !(k@23@01 >= 0) | live]
; [else-branch: 17 | k@23@01 >= 0 | live]
(push) ; 15
; [then-branch: 17 | !(k@23@01 >= 0)]
(assert (not (>= k@23@01 0)))
(pop) ; 15
(push) ; 15
; [else-branch: 17 | k@23@01 >= 0]
(assert (>= k@23@01 0))
; [eval] k < |current|
; [eval] |current|
(push) ; 16
; [then-branch: 18 | !(k@23@01 < |current@11@01|) | live]
; [else-branch: 18 | k@23@01 < |current@11@01| | live]
(push) ; 17
; [then-branch: 18 | !(k@23@01 < |current@11@01|)]
(assert (not (< k@23@01 (Seq_length current@11@01))))
(pop) ; 17
(push) ; 17
; [else-branch: 18 | k@23@01 < |current@11@01|]
(assert (< k@23@01 (Seq_length current@11@01)))
; [eval] height(current[i]) > height(current[k])
; [eval] height(current[i])
; [eval] current[i]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01)))
; [eval] height(current[k])
; [eval] current[k]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 k@23@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 k@23@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@23@01 (Seq_length current@11@01))
  (and
    (< k@23@01 (Seq_length current@11@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 k@23@01)))))
(assert (or
  (< k@23@01 (Seq_length current@11@01))
  (not (< k@23@01 (Seq_length current@11@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@23@01 0)
  (and
    (>= k@23@01 0)
    (=>
      (< k@23@01 (Seq_length current@11@01))
      (and
        (< k@23@01 (Seq_length current@11@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 k@23@01))))
    (or
      (< k@23@01 (Seq_length current@11@01))
      (not (< k@23@01 (Seq_length current@11@01)))))))
(assert (or (>= k@23@01 0) (not (>= k@23@01 0))))
(pop) ; 13
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@23@01 Int)) (!
  (and
    (=>
      (>= k@23@01 0)
      (and
        (>= k@23@01 0)
        (=>
          (< k@23@01 (Seq_length current@11@01))
          (and
            (< k@23@01 (Seq_length current@11@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 k@23@01))))
        (or
          (< k@23@01 (Seq_length current@11@01))
          (not (< k@23@01 (Seq_length current@11@01))))))
    (or (>= k@23@01 0) (not (>= k@23@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|)))
(push) ; 13
; [then-branch: 19 | !(QA k@23@01 :: k@23@01 >= 0 && k@23@01 < |current@11@01| && height(_, current@11@01[i@22@01]) > height(_, current@11@01[k@23@01])) | live]
; [else-branch: 19 | QA k@23@01 :: k@23@01 >= 0 && k@23@01 < |current@11@01| && height(_, current@11@01[i@22@01]) > height(_, current@11@01[k@23@01]) | live]
(push) ; 14
; [then-branch: 19 | !(QA k@23@01 :: k@23@01 >= 0 && k@23@01 < |current@11@01| && height(_, current@11@01[i@22@01]) > height(_, current@11@01[k@23@01]))]
(assert (not
  (forall ((k@23@01 Int)) (!
    (and
      (>= k@23@01 0)
      (and
        (< k@23@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@22@01))
          (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))
(pop) ; 14
(push) ; 14
; [else-branch: 19 | QA k@23@01 :: k@23@01 >= 0 && k@23@01 < |current@11@01| && height(_, current@11@01[i@22@01]) > height(_, current@11@01[k@23@01])]
(assert (forall ((k@23@01 Int)) (!
  (and
    (>= k@23@01 0)
    (and
      (< k@23@01 (Seq_length current@11@01))
      (>
        (height $Snap.unit (Seq_index current@11@01 i@22@01))
        (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))
; [eval] (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)
(declare-const j@24@01 Int)
(push) ; 15
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k]))))
; [eval] j >= 0
(push) ; 16
; [then-branch: 20 | !(j@24@01 >= 0) | live]
; [else-branch: 20 | j@24@01 >= 0 | live]
(push) ; 17
; [then-branch: 20 | !(j@24@01 >= 0)]
(assert (not (>= j@24@01 0)))
(pop) ; 17
(push) ; 17
; [else-branch: 20 | j@24@01 >= 0]
(assert (>= j@24@01 0))
; [eval] j < |next|
; [eval] |next|
(push) ; 18
; [then-branch: 21 | !(j@24@01 < |Nil|) | live]
; [else-branch: 21 | j@24@01 < |Nil| | live]
(push) ; 19
; [then-branch: 21 | !(j@24@01 < |Nil|)]
(assert (not (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
(pop) ; 19
(push) ; 19
; [else-branch: 21 | j@24@01 < |Nil|]
(assert (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>))))
; [eval] (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))
(declare-const k@25@01 Int)
(push) ; 20
; [eval] k >= 0 && (k < |next| && height(next[j]) > height(next[k]))
; [eval] k >= 0
(push) ; 21
; [then-branch: 22 | !(k@25@01 >= 0) | live]
; [else-branch: 22 | k@25@01 >= 0 | live]
(push) ; 22
; [then-branch: 22 | !(k@25@01 >= 0)]
(assert (not (>= k@25@01 0)))
(pop) ; 22
(push) ; 22
; [else-branch: 22 | k@25@01 >= 0]
(assert (>= k@25@01 0))
; [eval] k < |next|
; [eval] |next|
(push) ; 23
; [then-branch: 23 | !(k@25@01 < |Nil|) | live]
; [else-branch: 23 | k@25@01 < |Nil| | live]
(push) ; 24
; [then-branch: 23 | !(k@25@01 < |Nil|)]
(assert (not (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
(pop) ; 24
(push) ; 24
; [else-branch: 23 | k@25@01 < |Nil|]
(assert (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))
; [eval] height(next[j]) > height(next[k])
; [eval] height(next[j])
; [eval] next[j]
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01)))
; [eval] height(next[k])
; [eval] next[k]
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (and
    (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))))
(assert (or
  (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (not (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@25@01 0)
  (and
    (>= k@25@01 0)
    (=>
      (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (and
        (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          j@24@01))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@25@01))))
    (or
      (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (not (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))))))
(assert (or (>= k@25@01 0) (not (>= k@25@01 0))))
(pop) ; 20
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@25@01 Int)) (!
  (and
    (=>
      (>= k@25@01 0)
      (and
        (>= k@25@01 0)
        (=>
          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (and
            (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@24@01))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@25@01))))
        (or
          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (not (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
    (or (>= k@25@01 0) (not (>= k@25@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index
    (as Seq_empty  Seq<Tree>)
    k@25@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (and
    (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@25@01 Int)) (!
      (and
        (=>
          (>= k@25@01 0)
          (and
            (>= k@25@01 0)
            (=>
              (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (and
                (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@24@01))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@25@01))))
            (or
              (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (not (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
        (or (>= k@25@01 0) (not (>= k@25@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@25@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))))
(assert (or
  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (not (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@24@01 0)
  (and
    (>= j@24@01 0)
    (=>
      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (and
        (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@25@01 Int)) (!
          (and
            (=>
              (>= k@25@01 0)
              (and
                (>= k@25@01 0)
                (=>
                  (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (and
                    (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@24@01))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@25@01))))
                (or
                  (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (not (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
            (or (>= k@25@01 0) (not (>= k@25@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@25@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
    (or
      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (not (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>))))))))
(assert (or (>= j@24@01 0) (not (>= j@24@01 0))))
(push) ; 16
; [then-branch: 24 | j@24@01 >= 0 && j@24@01 < |Nil| && QA k@25@01 :: k@25@01 >= 0 && k@25@01 < |Nil| && height(_, Nil[j@24@01]) > height(_, Nil[k@25@01]) | live]
; [else-branch: 24 | !(j@24@01 >= 0 && j@24@01 < |Nil| && QA k@25@01 :: k@25@01 >= 0 && k@25@01 < |Nil| && height(_, Nil[j@24@01]) > height(_, Nil[k@25@01])) | live]
(push) ; 17
; [then-branch: 24 | j@24@01 >= 0 && j@24@01 < |Nil| && QA k@25@01 :: k@25@01 >= 0 && k@25@01 < |Nil| && height(_, Nil[j@24@01]) > height(_, Nil[k@25@01])]
(assert (and
  (>= j@24@01 0)
  (and
    (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@25@01 Int)) (!
      (and
        (>= k@25@01 0)
        (and
          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (>
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@25@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
; [eval] height(next[j]) == height(current[i]) - 1
; [eval] height(next[j])
; [eval] next[j]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01)))
; [eval] height(current[i]) - 1
; [eval] height(current[i])
; [eval] current[i]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01)))
(pop) ; 17
(push) ; 17
; [else-branch: 24 | !(j@24@01 >= 0 && j@24@01 < |Nil| && QA k@25@01 :: k@25@01 >= 0 && k@25@01 < |Nil| && height(_, Nil[j@24@01]) > height(_, Nil[k@25@01]))]
(assert (not
  (and
    (>= j@24@01 0)
    (and
      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@25@01 Int)) (!
        (and
          (>= k@25@01 0)
          (and
            (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@25@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (=>
  (and
    (>= j@24@01 0)
    (and
      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@25@01 Int)) (!
        (and
          (>= k@25@01 0)
          (and
            (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@25@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
  (and
    (>= j@24@01 0)
    (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@25@01 Int)) (!
      (and
        (>= k@25@01 0)
        (and
          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (>
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@25@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@24@01 0)
      (and
        (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@25@01 Int)) (!
          (and
            (>= k@25@01 0)
            (and
              (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (>
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@25@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
  (and
    (>= j@24@01 0)
    (and
      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@25@01 Int)) (!
        (and
          (>= k@25@01 0)
          (and
            (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@25@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
(pop) ; 15
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@24@01 Int)) (!
  (and
    (=>
      (>= j@24@01 0)
      (and
        (>= j@24@01 0)
        (=>
          (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (and
            (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@25@01 Int)) (!
              (and
                (=>
                  (>= k@25@01 0)
                  (and
                    (>= k@25@01 0)
                    (=>
                      (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (and
                        (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@24@01))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@25@01))))
                    (or
                      (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (not (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                (or (>= k@25@01 0) (not (>= k@25@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@25@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
        (or
          (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (not (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
    (or (>= j@24@01 0) (not (>= j@24@01 0)))
    (=>
      (and
        (>= j@24@01 0)
        (and
          (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (forall ((k@25@01 Int)) (!
            (and
              (>= k@25@01 0)
              (and
                (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (>
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@24@01))
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@25@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@25@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
      (and
        (>= j@24@01 0)
        (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@25@01 Int)) (!
          (and
            (>= k@25@01 0)
            (and
              (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (>
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@25@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@25@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          j@24@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))))
    (or
      (not
        (and
          (>= j@24@01 0)
          (and
            (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@25@01 Int)) (!
              (and
                (>= k@25@01 0)
                (and
                  (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (>
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@24@01))
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@25@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@25@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
      (and
        (>= j@24@01 0)
        (and
          (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (forall ((k@25@01 Int)) (!
            (and
              (>= k@25@01 0)
              (and
                (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (>
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@24@01))
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@25@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@25@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
  :pattern ((height%limited $Snap.unit (Seq_index
    (as Seq_empty  Seq<Tree>)
    j@24@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (forall ((k@23@01 Int)) (!
    (and
      (>= k@23@01 0)
      (and
        (< k@23@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@22@01))
          (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (and
    (forall ((k@23@01 Int)) (!
      (and
        (>= k@23@01 0)
        (and
          (< k@23@01 (Seq_length current@11@01))
          (>
            (height $Snap.unit (Seq_index current@11@01 i@22@01))
            (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
    (forall ((j@24@01 Int)) (!
      (and
        (=>
          (>= j@24@01 0)
          (and
            (>= j@24@01 0)
            (=>
              (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (and
                (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@25@01 Int)) (!
                  (and
                    (=>
                      (>= k@25@01 0)
                      (and
                        (>= k@25@01 0)
                        (=>
                          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (and
                            (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (height%precondition $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@24@01))
                            (height%precondition $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@25@01))))
                        (or
                          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (not
                            (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                    (or (>= k@25@01 0) (not (>= k@25@01 0))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@25@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
            (or
              (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (not (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
        (or (>= j@24@01 0) (not (>= j@24@01 0)))
        (=>
          (and
            (>= j@24@01 0)
            (and
              (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (forall ((k@25@01 Int)) (!
                (and
                  (>= k@25@01 0)
                  (and
                    (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (>
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@24@01))
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@25@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@25@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
          (and
            (>= j@24@01 0)
            (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@25@01 Int)) (!
              (and
                (>= k@25@01 0)
                (and
                  (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (>
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@24@01))
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@25@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@25@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@24@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))))
        (or
          (not
            (and
              (>= j@24@01 0)
              (and
                (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@25@01 Int)) (!
                  (and
                    (>= k@25@01 0)
                    (and
                      (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (>
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@24@01))
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@25@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@25@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
          (and
            (>= j@24@01 0)
            (and
              (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (forall ((k@25@01 Int)) (!
                (and
                  (>= k@25@01 0)
                  (and
                    (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (>
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@24@01))
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@25@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@25@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        j@24@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))))
(assert (or
  (forall ((k@23@01 Int)) (!
    (and
      (>= k@23@01 0)
      (and
        (< k@23@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@22@01))
          (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (not
    (forall ((k@23@01 Int)) (!
      (and
        (>= k@23@01 0)
        (and
          (< k@23@01 (Seq_length current@11@01))
          (>
            (height $Snap.unit (Seq_index current@11@01 i@22@01))
            (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@22@01 (Seq_length current@11@01))
  (and
    (< i@22@01 (Seq_length current@11@01))
    (forall ((k@23@01 Int)) (!
      (and
        (=>
          (>= k@23@01 0)
          (and
            (>= k@23@01 0)
            (=>
              (< k@23@01 (Seq_length current@11@01))
              (and
                (< k@23@01 (Seq_length current@11@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 k@23@01))))
            (or
              (< k@23@01 (Seq_length current@11@01))
              (not (< k@23@01 (Seq_length current@11@01))))))
        (or (>= k@23@01 0) (not (>= k@23@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
    (=>
      (forall ((k@23@01 Int)) (!
        (and
          (>= k@23@01 0)
          (and
            (< k@23@01 (Seq_length current@11@01))
            (>
              (height $Snap.unit (Seq_index current@11@01 i@22@01))
              (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (and
        (forall ((k@23@01 Int)) (!
          (and
            (>= k@23@01 0)
            (and
              (< k@23@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@22@01))
                (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@24@01 Int)) (!
          (and
            (=>
              (>= j@24@01 0)
              (and
                (>= j@24@01 0)
                (=>
                  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (and
                    (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@25@01 Int)) (!
                      (and
                        (=>
                          (>= k@25@01 0)
                          (and
                            (>= k@25@01 0)
                            (=>
                              (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (and
                                (<
                                  k@25@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (height%precondition $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@24@01))
                                (height%precondition $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@25@01))))
                            (or
                              (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (not
                                (<
                                  k@25@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))))))
                        (or (>= k@25@01 0) (not (>= k@25@01 0))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@25@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                (or
                  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (not (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
            (or (>= j@24@01 0) (not (>= j@24@01 0)))
            (=>
              (and
                (>= j@24@01 0)
                (and
                  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@25@01 Int)) (!
                    (and
                      (>= k@25@01 0)
                      (and
                        (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@24@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@25@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@25@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (>= j@24@01 0)
                (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@25@01 Int)) (!
                  (and
                    (>= k@25@01 0)
                    (and
                      (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (>
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@24@01))
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@25@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@25@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@24@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))))
            (or
              (not
                (and
                  (>= j@24@01 0)
                  (and
                    (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@25@01 Int)) (!
                      (and
                        (>= k@25@01 0)
                        (and
                          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@24@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@25@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@25@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
              (and
                (>= j@24@01 0)
                (and
                  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@25@01 Int)) (!
                    (and
                      (>= k@25@01 0)
                      (and
                        (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@24@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@25@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@25@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            j@24@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
    (or
      (forall ((k@23@01 Int)) (!
        (and
          (>= k@23@01 0)
          (and
            (< k@23@01 (Seq_length current@11@01))
            (>
              (height $Snap.unit (Seq_index current@11@01 i@22@01))
              (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (not
        (forall ((k@23@01 Int)) (!
          (and
            (>= k@23@01 0)
            (and
              (< k@23@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@22@01))
                (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))))
(assert (or
  (< i@22@01 (Seq_length current@11@01))
  (not (< i@22@01 (Seq_length current@11@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@22@01 0)
  (and
    (>= i@22@01 0)
    (=>
      (< i@22@01 (Seq_length current@11@01))
      (and
        (< i@22@01 (Seq_length current@11@01))
        (forall ((k@23@01 Int)) (!
          (and
            (=>
              (>= k@23@01 0)
              (and
                (>= k@23@01 0)
                (=>
                  (< k@23@01 (Seq_length current@11@01))
                  (and
                    (< k@23@01 (Seq_length current@11@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      i@22@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      k@23@01))))
                (or
                  (< k@23@01 (Seq_length current@11@01))
                  (not (< k@23@01 (Seq_length current@11@01))))))
            (or (>= k@23@01 0) (not (>= k@23@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
        (=>
          (forall ((k@23@01 Int)) (!
            (and
              (>= k@23@01 0)
              (and
                (< k@23@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@22@01))
                  (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@23@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (and
            (forall ((k@23@01 Int)) (!
              (and
                (>= k@23@01 0)
                (and
                  (< k@23@01 (Seq_length current@11@01))
                  (>
                    (height $Snap.unit (Seq_index current@11@01 i@22@01))
                    (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@23@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
            (forall ((j@24@01 Int)) (!
              (and
                (=>
                  (>= j@24@01 0)
                  (and
                    (>= j@24@01 0)
                    (=>
                      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (and
                        (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@25@01 Int)) (!
                          (and
                            (=>
                              (>= k@25@01 0)
                              (and
                                (>= k@25@01 0)
                                (=>
                                  (<
                                    k@25@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (and
                                    (<
                                      k@25@01
                                      (Seq_length (as Seq_empty  Seq<Tree>)))
                                    (height%precondition $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      j@24@01))
                                    (height%precondition $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      k@25@01))))
                                (or
                                  (<
                                    k@25@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (not
                                    (<
                                      k@25@01
                                      (Seq_length (as Seq_empty  Seq<Tree>)))))))
                            (or (>= k@25@01 0) (not (>= k@25@01 0))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@25@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                    (or
                      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (not (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                (or (>= j@24@01 0) (not (>= j@24@01 0)))
                (=>
                  (and
                    (>= j@24@01 0)
                    (and
                      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (forall ((k@25@01 Int)) (!
                        (and
                          (>= k@25@01 0)
                          (and
                            (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (>
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                j@24@01))
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@25@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@25@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                  (and
                    (>= j@24@01 0)
                    (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@25@01 Int)) (!
                      (and
                        (>= k@25@01 0)
                        (and
                          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@24@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@25@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@25@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@24@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      i@22@01))))
                (or
                  (not
                    (and
                      (>= j@24@01 0)
                      (and
                        (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@25@01 Int)) (!
                          (and
                            (>= k@25@01 0)
                            (and
                              (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (>
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@24@01))
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@25@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@25@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                  (and
                    (>= j@24@01 0)
                    (and
                      (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (forall ((k@25@01 Int)) (!
                        (and
                          (>= k@25@01 0)
                          (and
                            (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (>
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                j@24@01))
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@25@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@25@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                j@24@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
        (or
          (forall ((k@23@01 Int)) (!
            (and
              (>= k@23@01 0)
              (and
                (< k@23@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@22@01))
                  (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@23@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (not
            (forall ((k@23@01 Int)) (!
              (and
                (>= k@23@01 0)
                (and
                  (< k@23@01 (Seq_length current@11@01))
                  (>
                    (height $Snap.unit (Seq_index current@11@01 i@22@01))
                    (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@23@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
    (or
      (< i@22@01 (Seq_length current@11@01))
      (not (< i@22@01 (Seq_length current@11@01)))))))
(assert (or (>= i@22@01 0) (not (>= i@22@01 0))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@22@01 Int)) (!
  (and
    (=>
      (>= i@22@01 0)
      (and
        (>= i@22@01 0)
        (=>
          (< i@22@01 (Seq_length current@11@01))
          (and
            (< i@22@01 (Seq_length current@11@01))
            (forall ((k@23@01 Int)) (!
              (and
                (=>
                  (>= k@23@01 0)
                  (and
                    (>= k@23@01 0)
                    (=>
                      (< k@23@01 (Seq_length current@11@01))
                      (and
                        (< k@23@01 (Seq_length current@11@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          i@22@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          k@23@01))))
                    (or
                      (< k@23@01 (Seq_length current@11@01))
                      (not (< k@23@01 (Seq_length current@11@01))))))
                (or (>= k@23@01 0) (not (>= k@23@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@23@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
            (=>
              (forall ((k@23@01 Int)) (!
                (and
                  (>= k@23@01 0)
                  (and
                    (< k@23@01 (Seq_length current@11@01))
                    (>
                      (height $Snap.unit (Seq_index current@11@01 i@22@01))
                      (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@11@01
                  k@23@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (and
                (forall ((k@23@01 Int)) (!
                  (and
                    (>= k@23@01 0)
                    (and
                      (< k@23@01 (Seq_length current@11@01))
                      (>
                        (height $Snap.unit (Seq_index current@11@01 i@22@01))
                        (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@11@01
                    k@23@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
                (forall ((j@24@01 Int)) (!
                  (and
                    (=>
                      (>= j@24@01 0)
                      (and
                        (>= j@24@01 0)
                        (=>
                          (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (and
                            (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (forall ((k@25@01 Int)) (!
                              (and
                                (=>
                                  (>= k@25@01 0)
                                  (and
                                    (>= k@25@01 0)
                                    (=>
                                      (<
                                        k@25@01
                                        (Seq_length (as Seq_empty  Seq<Tree>)))
                                      (and
                                        (<
                                          k@25@01
                                          (Seq_length (as Seq_empty  Seq<Tree>)))
                                        (height%precondition $Snap.unit (Seq_index
                                          (as Seq_empty  Seq<Tree>)
                                          j@24@01))
                                        (height%precondition $Snap.unit (Seq_index
                                          (as Seq_empty  Seq<Tree>)
                                          k@25@01))))
                                    (or
                                      (<
                                        k@25@01
                                        (Seq_length (as Seq_empty  Seq<Tree>)))
                                      (not
                                        (<
                                          k@25@01
                                          (Seq_length (as Seq_empty  Seq<Tree>)))))))
                                (or (>= k@25@01 0) (not (>= k@25@01 0))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@25@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                        (or
                          (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (not
                            (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                    (or (>= j@24@01 0) (not (>= j@24@01 0)))
                    (=>
                      (and
                        (>= j@24@01 0)
                        (and
                          (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (forall ((k@25@01 Int)) (!
                            (and
                              (>= k@25@01 0)
                              (and
                                (<
                                  k@25@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (>
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    j@24@01))
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    k@25@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@25@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                      (and
                        (>= j@24@01 0)
                        (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@25@01 Int)) (!
                          (and
                            (>= k@25@01 0)
                            (and
                              (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (>
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@24@01))
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@25@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@25@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@24@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          i@22@01))))
                    (or
                      (not
                        (and
                          (>= j@24@01 0)
                          (and
                            (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (forall ((k@25@01 Int)) (!
                              (and
                                (>= k@25@01 0)
                                (and
                                  (<
                                    k@25@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (>
                                    (height $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      j@24@01))
                                    (height $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      k@25@01)))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@25@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                      (and
                        (>= j@24@01 0)
                        (and
                          (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (forall ((k@25@01 Int)) (!
                            (and
                              (>= k@25@01 0)
                              (and
                                (<
                                  k@25@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (>
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    j@24@01))
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    k@25@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@25@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@24@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
            (or
              (forall ((k@23@01 Int)) (!
                (and
                  (>= k@23@01 0)
                  (and
                    (< k@23@01 (Seq_length current@11@01))
                    (>
                      (height $Snap.unit (Seq_index current@11@01 i@22@01))
                      (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@11@01
                  k@23@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (not
                (forall ((k@23@01 Int)) (!
                  (and
                    (>= k@23@01 0)
                    (and
                      (< k@23@01 (Seq_length current@11@01))
                      (>
                        (height $Snap.unit (Seq_index current@11@01 i@22@01))
                        (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@11@01
                    k@23@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
        (or
          (< i@22@01 (Seq_length current@11@01))
          (not (< i@22@01 (Seq_length current@11@01))))))
    (or (>= i@22@01 0) (not (>= i@22@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@22@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60-aux|)))
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (>= i@22@01 0) (< i@22@01 (Seq_length current@11@01)))
    (and
      (forall ((k@23@01 Int)) (!
        (=>
          (and (>= k@23@01 0) (< k@23@01 (Seq_length current@11@01)))
          (and
            (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 k@23@01))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (=>
        (forall ((k@23@01 Int)) (!
          (and
            (>= k@23@01 0)
            (and
              (< k@23@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@22@01))
                (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@24@01 Int)) (!
          (and
            (=>
              (and
                (>= j@24@01 0)
                (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>))))
              (forall ((k@25@01 Int)) (!
                (=>
                  (and
                    (>= k@25@01 0)
                    (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                  (and
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@24@01))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@25@01))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@25@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))
            (=>
              (and
                (>= j@24@01 0)
                (and
                  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@25@01 Int)) (!
                    (and
                      (>= k@25@01 0)
                      (and
                        (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@24@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@25@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@25@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@24@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            j@24@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@22@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60_precondition|)))
(push) ; 8
(assert (not (forall ((i@22@01 Int)) (!
  (=>
    (=>
      (and (>= i@22@01 0) (< i@22@01 (Seq_length current@11@01)))
      (and
        (forall ((k@23@01 Int)) (!
          (=>
            (and (>= k@23@01 0) (< k@23@01 (Seq_length current@11@01)))
            (and
              (height%precondition $Snap.unit (Seq_index current@11@01 i@22@01))
              (height%precondition $Snap.unit (Seq_index current@11@01 k@23@01))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@23@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (=>
          (forall ((k@23@01 Int)) (!
            (and
              (>= k@23@01 0)
              (and
                (< k@23@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@22@01))
                  (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@23@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (forall ((j@24@01 Int)) (!
            (and
              (=>
                (and
                  (>= j@24@01 0)
                  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                (forall ((k@25@01 Int)) (!
                  (=>
                    (and
                      (>= k@25@01 0)
                      (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                    (and
                      (height%precondition $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@24@01))
                      (height%precondition $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@25@01))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@25@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))
              (=>
                (and
                  (>= j@24@01 0)
                  (and
                    (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@25@01 Int)) (!
                      (and
                        (>= k@25@01 0)
                        (and
                          (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@24@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@25@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@25@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                (and
                  (height%precondition $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@24@01))
                  (height%precondition $Snap.unit (Seq_index
                    current@11@01
                    i@22@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@24@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
    (and
      (>= i@22@01 0)
      (and
        (< i@22@01 (Seq_length current@11@01))
        (and
          (forall ((k@23@01 Int)) (!
            (and
              (>= k@23@01 0)
              (and
                (< k@23@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@22@01))
                  (height $Snap.unit (Seq_index current@11@01 k@23@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@23@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (forall ((j@24@01 Int)) (!
            (=>
              (and
                (>= j@24@01 0)
                (and
                  (< j@24@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@25@01 Int)) (!
                    (and
                      (>= k@25@01 0)
                      (and
                        (< k@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@24@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@25@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@25@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (=
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@24@01))
                (- (height $Snap.unit (Seq_index current@11@01 i@22@01)) 1)))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@24@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|))))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@22@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { height(current[i]) } i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1))))
(declare-const i@26@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 25 | !(i@26@01 >= 0) | live]
; [else-branch: 25 | i@26@01 >= 0 | live]
(push) ; 10
; [then-branch: 25 | !(i@26@01 >= 0)]
(assert (not (>= i@26@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 25 | i@26@01 >= 0]
(assert (>= i@26@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < |current|
; [eval] |current|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 26 | !(i@26@01 < |current@11@01|) | live]
; [else-branch: 26 | i@26@01 < |current@11@01| | live]
(push) ; 12
; [then-branch: 26 | !(i@26@01 < |current@11@01|)]
(assert (not (< i@26@01 (Seq_length current@11@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 26 | i@26@01 < |current@11@01|]
(assert (< i@26@01 (Seq_length current@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k])))
(declare-const k@27@01 Int)
(set-option :timeout 0)
(push) ; 13
; [eval] k >= 0 && (k < |current| && height(current[i]) > height(current[k]))
; [eval] k >= 0
(push) ; 14
; [then-branch: 27 | !(k@27@01 >= 0) | live]
; [else-branch: 27 | k@27@01 >= 0 | live]
(push) ; 15
; [then-branch: 27 | !(k@27@01 >= 0)]
(assert (not (>= k@27@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 15
(set-option :timeout 0)
(push) ; 15
; [else-branch: 27 | k@27@01 >= 0]
(assert (>= k@27@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] k < |current|
; [eval] |current|
(set-option :timeout 0)
(push) ; 16
; [then-branch: 28 | !(k@27@01 < |current@11@01|) | live]
; [else-branch: 28 | k@27@01 < |current@11@01| | live]
(push) ; 17
; [then-branch: 28 | !(k@27@01 < |current@11@01|)]
(assert (not (< k@27@01 (Seq_length current@11@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 28 | k@27@01 < |current@11@01|]
(assert (< k@27@01 (Seq_length current@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] height(current[i]) > height(current[k])
; [eval] height(current[i])
; [eval] current[i]
(set-option :timeout 0)
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01)))
; [eval] height(current[k])
; [eval] current[k]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 k@27@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 k@27@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@27@01 (Seq_length current@11@01))
  (and
    (< k@27@01 (Seq_length current@11@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 k@27@01)))))
(assert (or
  (< k@27@01 (Seq_length current@11@01))
  (not (< k@27@01 (Seq_length current@11@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@27@01 0)
  (and
    (>= k@27@01 0)
    (=>
      (< k@27@01 (Seq_length current@11@01))
      (and
        (< k@27@01 (Seq_length current@11@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 k@27@01))))
    (or
      (< k@27@01 (Seq_length current@11@01))
      (not (< k@27@01 (Seq_length current@11@01)))))))
(assert (or (>= k@27@01 0) (not (>= k@27@01 0))))
(pop) ; 13
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@27@01 Int)) (!
  (and
    (=>
      (>= k@27@01 0)
      (and
        (>= k@27@01 0)
        (=>
          (< k@27@01 (Seq_length current@11@01))
          (and
            (< k@27@01 (Seq_length current@11@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 k@27@01))))
        (or
          (< k@27@01 (Seq_length current@11@01))
          (not (< k@27@01 (Seq_length current@11@01))))))
    (or (>= k@27@01 0) (not (>= k@27@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|)))
(push) ; 13
; [then-branch: 29 | !(QA k@27@01 :: k@27@01 >= 0 && k@27@01 < |current@11@01| && height(_, current@11@01[i@26@01]) > height(_, current@11@01[k@27@01])) | live]
; [else-branch: 29 | QA k@27@01 :: k@27@01 >= 0 && k@27@01 < |current@11@01| && height(_, current@11@01[i@26@01]) > height(_, current@11@01[k@27@01]) | live]
(push) ; 14
; [then-branch: 29 | !(QA k@27@01 :: k@27@01 >= 0 && k@27@01 < |current@11@01| && height(_, current@11@01[i@26@01]) > height(_, current@11@01[k@27@01]))]
(assert (not
  (forall ((k@27@01 Int)) (!
    (and
      (>= k@27@01 0)
      (and
        (< k@27@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@26@01))
          (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 29 | QA k@27@01 :: k@27@01 >= 0 && k@27@01 < |current@11@01| && height(_, current@11@01[i@26@01]) > height(_, current@11@01[k@27@01])]
(assert (forall ((k@27@01 Int)) (!
  (and
    (>= k@27@01 0)
    (and
      (< k@27@01 (Seq_length current@11@01))
      (>
        (height $Snap.unit (Seq_index current@11@01 i@26@01))
        (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)
(declare-const j@28@01 Int)
(set-option :timeout 0)
(push) ; 15
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k]))))
; [eval] j >= 0
(push) ; 16
; [then-branch: 30 | !(j@28@01 >= 0) | live]
; [else-branch: 30 | j@28@01 >= 0 | live]
(push) ; 17
; [then-branch: 30 | !(j@28@01 >= 0)]
(assert (not (>= j@28@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 30 | j@28@01 >= 0]
(assert (>= j@28@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j < |next|
; [eval] |next|
(set-option :timeout 0)
(push) ; 18
; [then-branch: 31 | !(j@28@01 < |Nil|) | live]
; [else-branch: 31 | j@28@01 < |Nil| | live]
(push) ; 19
; [then-branch: 31 | !(j@28@01 < |Nil|)]
(assert (not (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 19
(set-option :timeout 0)
(push) ; 19
; [else-branch: 31 | j@28@01 < |Nil|]
(assert (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))
(declare-const k@29@01 Int)
(set-option :timeout 0)
(push) ; 20
; [eval] k >= 0 && (k < |next| && height(next[j]) > height(next[k]))
; [eval] k >= 0
(push) ; 21
; [then-branch: 32 | !(k@29@01 >= 0) | live]
; [else-branch: 32 | k@29@01 >= 0 | live]
(push) ; 22
; [then-branch: 32 | !(k@29@01 >= 0)]
(assert (not (>= k@29@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 22
(set-option :timeout 0)
(push) ; 22
; [else-branch: 32 | k@29@01 >= 0]
(assert (>= k@29@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] k < |next|
; [eval] |next|
(set-option :timeout 0)
(push) ; 23
; [then-branch: 33 | !(k@29@01 < |Nil|) | live]
; [else-branch: 33 | k@29@01 < |Nil| | live]
(push) ; 24
; [then-branch: 33 | !(k@29@01 < |Nil|)]
(assert (not (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 24
(set-option :timeout 0)
(push) ; 24
; [else-branch: 33 | k@29@01 < |Nil|]
(assert (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] height(next[j]) > height(next[k])
; [eval] height(next[j])
; [eval] next[j]
(set-option :timeout 0)
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01)))
; [eval] height(next[k])
; [eval] next[k]
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (and
    (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))))
(assert (or
  (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (not (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@29@01 0)
  (and
    (>= k@29@01 0)
    (=>
      (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (and
        (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          j@28@01))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@29@01))))
    (or
      (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (not (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>))))))))
(assert (or (>= k@29@01 0) (not (>= k@29@01 0))))
(pop) ; 20
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@29@01 Int)) (!
  (and
    (=>
      (>= k@29@01 0)
      (and
        (>= k@29@01 0)
        (=>
          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (and
            (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@28@01))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@29@01))))
        (or
          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (not (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
    (or (>= k@29@01 0) (not (>= k@29@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index
    (as Seq_empty  Seq<Tree>)
    k@29@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (and
    (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@29@01 Int)) (!
      (and
        (=>
          (>= k@29@01 0)
          (and
            (>= k@29@01 0)
            (=>
              (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (and
                (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@28@01))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@29@01))))
            (or
              (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (not (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
        (or (>= k@29@01 0) (not (>= k@29@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@29@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))))
(assert (or
  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (not (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@28@01 0)
  (and
    (>= j@28@01 0)
    (=>
      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (and
        (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@29@01 Int)) (!
          (and
            (=>
              (>= k@29@01 0)
              (and
                (>= k@29@01 0)
                (=>
                  (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (and
                    (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@28@01))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@29@01))))
                (or
                  (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (not (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
            (or (>= k@29@01 0) (not (>= k@29@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@29@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
    (or
      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (not (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>))))))))
(assert (or (>= j@28@01 0) (not (>= j@28@01 0))))
(push) ; 16
; [then-branch: 34 | j@28@01 >= 0 && j@28@01 < |Nil| && QA k@29@01 :: k@29@01 >= 0 && k@29@01 < |Nil| && height(_, Nil[j@28@01]) > height(_, Nil[k@29@01]) | live]
; [else-branch: 34 | !(j@28@01 >= 0 && j@28@01 < |Nil| && QA k@29@01 :: k@29@01 >= 0 && k@29@01 < |Nil| && height(_, Nil[j@28@01]) > height(_, Nil[k@29@01])) | live]
(push) ; 17
; [then-branch: 34 | j@28@01 >= 0 && j@28@01 < |Nil| && QA k@29@01 :: k@29@01 >= 0 && k@29@01 < |Nil| && height(_, Nil[j@28@01]) > height(_, Nil[k@29@01])]
(assert (and
  (>= j@28@01 0)
  (and
    (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@29@01 Int)) (!
      (and
        (>= k@29@01 0)
        (and
          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (>
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@29@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] height(next[j]) == height(current[i]) - 1
; [eval] height(next[j])
; [eval] next[j]
(set-option :timeout 0)
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01)))
; [eval] height(current[i]) - 1
; [eval] height(current[i])
; [eval] current[i]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01)))
(pop) ; 17
(push) ; 17
; [else-branch: 34 | !(j@28@01 >= 0 && j@28@01 < |Nil| && QA k@29@01 :: k@29@01 >= 0 && k@29@01 < |Nil| && height(_, Nil[j@28@01]) > height(_, Nil[k@29@01]))]
(assert (not
  (and
    (>= j@28@01 0)
    (and
      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@29@01 Int)) (!
        (and
          (>= k@29@01 0)
          (and
            (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@29@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (=>
  (and
    (>= j@28@01 0)
    (and
      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@29@01 Int)) (!
        (and
          (>= k@29@01 0)
          (and
            (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@29@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
  (and
    (>= j@28@01 0)
    (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@29@01 Int)) (!
      (and
        (>= k@29@01 0)
        (and
          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (>
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@29@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@28@01 0)
      (and
        (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@29@01 Int)) (!
          (and
            (>= k@29@01 0)
            (and
              (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (>
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@29@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
  (and
    (>= j@28@01 0)
    (and
      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@29@01 Int)) (!
        (and
          (>= k@29@01 0)
          (and
            (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@29@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
(pop) ; 15
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@28@01 Int)) (!
  (and
    (=>
      (>= j@28@01 0)
      (and
        (>= j@28@01 0)
        (=>
          (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (and
            (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@29@01 Int)) (!
              (and
                (=>
                  (>= k@29@01 0)
                  (and
                    (>= k@29@01 0)
                    (=>
                      (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (and
                        (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@28@01))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@29@01))))
                    (or
                      (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (not (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                (or (>= k@29@01 0) (not (>= k@29@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@29@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
        (or
          (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (not (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
    (or (>= j@28@01 0) (not (>= j@28@01 0)))
    (=>
      (and
        (>= j@28@01 0)
        (and
          (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (forall ((k@29@01 Int)) (!
            (and
              (>= k@29@01 0)
              (and
                (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (>
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@28@01))
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@29@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@29@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
      (and
        (>= j@28@01 0)
        (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@29@01 Int)) (!
          (and
            (>= k@29@01 0)
            (and
              (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (>
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@29@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@29@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          j@28@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))))
    (or
      (not
        (and
          (>= j@28@01 0)
          (and
            (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@29@01 Int)) (!
              (and
                (>= k@29@01 0)
                (and
                  (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (>
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@28@01))
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@29@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@29@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
      (and
        (>= j@28@01 0)
        (and
          (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (forall ((k@29@01 Int)) (!
            (and
              (>= k@29@01 0)
              (and
                (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (>
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@28@01))
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@29@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@29@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
  :pattern ((height%limited $Snap.unit (Seq_index
    (as Seq_empty  Seq<Tree>)
    j@28@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (forall ((k@27@01 Int)) (!
    (and
      (>= k@27@01 0)
      (and
        (< k@27@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@26@01))
          (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (and
    (forall ((k@27@01 Int)) (!
      (and
        (>= k@27@01 0)
        (and
          (< k@27@01 (Seq_length current@11@01))
          (>
            (height $Snap.unit (Seq_index current@11@01 i@26@01))
            (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
    (forall ((j@28@01 Int)) (!
      (and
        (=>
          (>= j@28@01 0)
          (and
            (>= j@28@01 0)
            (=>
              (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (and
                (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@29@01 Int)) (!
                  (and
                    (=>
                      (>= k@29@01 0)
                      (and
                        (>= k@29@01 0)
                        (=>
                          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (and
                            (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (height%precondition $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@28@01))
                            (height%precondition $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@29@01))))
                        (or
                          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (not
                            (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                    (or (>= k@29@01 0) (not (>= k@29@01 0))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@29@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
            (or
              (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (not (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
        (or (>= j@28@01 0) (not (>= j@28@01 0)))
        (=>
          (and
            (>= j@28@01 0)
            (and
              (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (forall ((k@29@01 Int)) (!
                (and
                  (>= k@29@01 0)
                  (and
                    (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (>
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@28@01))
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@29@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@29@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
          (and
            (>= j@28@01 0)
            (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@29@01 Int)) (!
              (and
                (>= k@29@01 0)
                (and
                  (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (>
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@28@01))
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@29@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@29@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@28@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))))
        (or
          (not
            (and
              (>= j@28@01 0)
              (and
                (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@29@01 Int)) (!
                  (and
                    (>= k@29@01 0)
                    (and
                      (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (>
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@28@01))
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@29@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@29@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
          (and
            (>= j@28@01 0)
            (and
              (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (forall ((k@29@01 Int)) (!
                (and
                  (>= k@29@01 0)
                  (and
                    (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (>
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@28@01))
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@29@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@29@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        j@28@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))))
(assert (or
  (forall ((k@27@01 Int)) (!
    (and
      (>= k@27@01 0)
      (and
        (< k@27@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@26@01))
          (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (not
    (forall ((k@27@01 Int)) (!
      (and
        (>= k@27@01 0)
        (and
          (< k@27@01 (Seq_length current@11@01))
          (>
            (height $Snap.unit (Seq_index current@11@01 i@26@01))
            (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@26@01 (Seq_length current@11@01))
  (and
    (< i@26@01 (Seq_length current@11@01))
    (forall ((k@27@01 Int)) (!
      (and
        (=>
          (>= k@27@01 0)
          (and
            (>= k@27@01 0)
            (=>
              (< k@27@01 (Seq_length current@11@01))
              (and
                (< k@27@01 (Seq_length current@11@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 k@27@01))))
            (or
              (< k@27@01 (Seq_length current@11@01))
              (not (< k@27@01 (Seq_length current@11@01))))))
        (or (>= k@27@01 0) (not (>= k@27@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
    (=>
      (forall ((k@27@01 Int)) (!
        (and
          (>= k@27@01 0)
          (and
            (< k@27@01 (Seq_length current@11@01))
            (>
              (height $Snap.unit (Seq_index current@11@01 i@26@01))
              (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (and
        (forall ((k@27@01 Int)) (!
          (and
            (>= k@27@01 0)
            (and
              (< k@27@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@26@01))
                (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@28@01 Int)) (!
          (and
            (=>
              (>= j@28@01 0)
              (and
                (>= j@28@01 0)
                (=>
                  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (and
                    (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@29@01 Int)) (!
                      (and
                        (=>
                          (>= k@29@01 0)
                          (and
                            (>= k@29@01 0)
                            (=>
                              (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (and
                                (<
                                  k@29@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (height%precondition $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@28@01))
                                (height%precondition $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@29@01))))
                            (or
                              (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (not
                                (<
                                  k@29@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))))))
                        (or (>= k@29@01 0) (not (>= k@29@01 0))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@29@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                (or
                  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (not (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
            (or (>= j@28@01 0) (not (>= j@28@01 0)))
            (=>
              (and
                (>= j@28@01 0)
                (and
                  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@29@01 Int)) (!
                    (and
                      (>= k@29@01 0)
                      (and
                        (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@28@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@29@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@29@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (>= j@28@01 0)
                (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@29@01 Int)) (!
                  (and
                    (>= k@29@01 0)
                    (and
                      (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (>
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@28@01))
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@29@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@29@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@28@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))))
            (or
              (not
                (and
                  (>= j@28@01 0)
                  (and
                    (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@29@01 Int)) (!
                      (and
                        (>= k@29@01 0)
                        (and
                          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@28@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@29@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@29@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
              (and
                (>= j@28@01 0)
                (and
                  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@29@01 Int)) (!
                    (and
                      (>= k@29@01 0)
                      (and
                        (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@28@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@29@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@29@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            j@28@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
    (or
      (forall ((k@27@01 Int)) (!
        (and
          (>= k@27@01 0)
          (and
            (< k@27@01 (Seq_length current@11@01))
            (>
              (height $Snap.unit (Seq_index current@11@01 i@26@01))
              (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (not
        (forall ((k@27@01 Int)) (!
          (and
            (>= k@27@01 0)
            (and
              (< k@27@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@26@01))
                (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))))
(assert (or
  (< i@26@01 (Seq_length current@11@01))
  (not (< i@26@01 (Seq_length current@11@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@26@01 0)
  (and
    (>= i@26@01 0)
    (=>
      (< i@26@01 (Seq_length current@11@01))
      (and
        (< i@26@01 (Seq_length current@11@01))
        (forall ((k@27@01 Int)) (!
          (and
            (=>
              (>= k@27@01 0)
              (and
                (>= k@27@01 0)
                (=>
                  (< k@27@01 (Seq_length current@11@01))
                  (and
                    (< k@27@01 (Seq_length current@11@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      i@26@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      k@27@01))))
                (or
                  (< k@27@01 (Seq_length current@11@01))
                  (not (< k@27@01 (Seq_length current@11@01))))))
            (or (>= k@27@01 0) (not (>= k@27@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
        (=>
          (forall ((k@27@01 Int)) (!
            (and
              (>= k@27@01 0)
              (and
                (< k@27@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@26@01))
                  (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@27@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (and
            (forall ((k@27@01 Int)) (!
              (and
                (>= k@27@01 0)
                (and
                  (< k@27@01 (Seq_length current@11@01))
                  (>
                    (height $Snap.unit (Seq_index current@11@01 i@26@01))
                    (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@27@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
            (forall ((j@28@01 Int)) (!
              (and
                (=>
                  (>= j@28@01 0)
                  (and
                    (>= j@28@01 0)
                    (=>
                      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (and
                        (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@29@01 Int)) (!
                          (and
                            (=>
                              (>= k@29@01 0)
                              (and
                                (>= k@29@01 0)
                                (=>
                                  (<
                                    k@29@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (and
                                    (<
                                      k@29@01
                                      (Seq_length (as Seq_empty  Seq<Tree>)))
                                    (height%precondition $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      j@28@01))
                                    (height%precondition $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      k@29@01))))
                                (or
                                  (<
                                    k@29@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (not
                                    (<
                                      k@29@01
                                      (Seq_length (as Seq_empty  Seq<Tree>)))))))
                            (or (>= k@29@01 0) (not (>= k@29@01 0))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@29@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                    (or
                      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (not (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                (or (>= j@28@01 0) (not (>= j@28@01 0)))
                (=>
                  (and
                    (>= j@28@01 0)
                    (and
                      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (forall ((k@29@01 Int)) (!
                        (and
                          (>= k@29@01 0)
                          (and
                            (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (>
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                j@28@01))
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@29@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@29@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                  (and
                    (>= j@28@01 0)
                    (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@29@01 Int)) (!
                      (and
                        (>= k@29@01 0)
                        (and
                          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@28@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@29@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@29@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@28@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      i@26@01))))
                (or
                  (not
                    (and
                      (>= j@28@01 0)
                      (and
                        (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@29@01 Int)) (!
                          (and
                            (>= k@29@01 0)
                            (and
                              (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (>
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@28@01))
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@29@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@29@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                  (and
                    (>= j@28@01 0)
                    (and
                      (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (forall ((k@29@01 Int)) (!
                        (and
                          (>= k@29@01 0)
                          (and
                            (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (>
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                j@28@01))
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@29@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@29@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                j@28@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
        (or
          (forall ((k@27@01 Int)) (!
            (and
              (>= k@27@01 0)
              (and
                (< k@27@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@26@01))
                  (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@27@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (not
            (forall ((k@27@01 Int)) (!
              (and
                (>= k@27@01 0)
                (and
                  (< k@27@01 (Seq_length current@11@01))
                  (>
                    (height $Snap.unit (Seq_index current@11@01 i@26@01))
                    (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@27@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
    (or
      (< i@26@01 (Seq_length current@11@01))
      (not (< i@26@01 (Seq_length current@11@01)))))))
(assert (or (>= i@26@01 0) (not (>= i@26@01 0))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int)) (!
  (and
    (=>
      (>= i@26@01 0)
      (and
        (>= i@26@01 0)
        (=>
          (< i@26@01 (Seq_length current@11@01))
          (and
            (< i@26@01 (Seq_length current@11@01))
            (forall ((k@27@01 Int)) (!
              (and
                (=>
                  (>= k@27@01 0)
                  (and
                    (>= k@27@01 0)
                    (=>
                      (< k@27@01 (Seq_length current@11@01))
                      (and
                        (< k@27@01 (Seq_length current@11@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          i@26@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          k@27@01))))
                    (or
                      (< k@27@01 (Seq_length current@11@01))
                      (not (< k@27@01 (Seq_length current@11@01))))))
                (or (>= k@27@01 0) (not (>= k@27@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@27@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
            (=>
              (forall ((k@27@01 Int)) (!
                (and
                  (>= k@27@01 0)
                  (and
                    (< k@27@01 (Seq_length current@11@01))
                    (>
                      (height $Snap.unit (Seq_index current@11@01 i@26@01))
                      (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@11@01
                  k@27@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (and
                (forall ((k@27@01 Int)) (!
                  (and
                    (>= k@27@01 0)
                    (and
                      (< k@27@01 (Seq_length current@11@01))
                      (>
                        (height $Snap.unit (Seq_index current@11@01 i@26@01))
                        (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@11@01
                    k@27@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
                (forall ((j@28@01 Int)) (!
                  (and
                    (=>
                      (>= j@28@01 0)
                      (and
                        (>= j@28@01 0)
                        (=>
                          (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (and
                            (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (forall ((k@29@01 Int)) (!
                              (and
                                (=>
                                  (>= k@29@01 0)
                                  (and
                                    (>= k@29@01 0)
                                    (=>
                                      (<
                                        k@29@01
                                        (Seq_length (as Seq_empty  Seq<Tree>)))
                                      (and
                                        (<
                                          k@29@01
                                          (Seq_length (as Seq_empty  Seq<Tree>)))
                                        (height%precondition $Snap.unit (Seq_index
                                          (as Seq_empty  Seq<Tree>)
                                          j@28@01))
                                        (height%precondition $Snap.unit (Seq_index
                                          (as Seq_empty  Seq<Tree>)
                                          k@29@01))))
                                    (or
                                      (<
                                        k@29@01
                                        (Seq_length (as Seq_empty  Seq<Tree>)))
                                      (not
                                        (<
                                          k@29@01
                                          (Seq_length (as Seq_empty  Seq<Tree>)))))))
                                (or (>= k@29@01 0) (not (>= k@29@01 0))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@29@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                        (or
                          (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (not
                            (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                    (or (>= j@28@01 0) (not (>= j@28@01 0)))
                    (=>
                      (and
                        (>= j@28@01 0)
                        (and
                          (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (forall ((k@29@01 Int)) (!
                            (and
                              (>= k@29@01 0)
                              (and
                                (<
                                  k@29@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (>
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    j@28@01))
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    k@29@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@29@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                      (and
                        (>= j@28@01 0)
                        (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@29@01 Int)) (!
                          (and
                            (>= k@29@01 0)
                            (and
                              (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (>
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@28@01))
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@29@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@29@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@28@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          i@26@01))))
                    (or
                      (not
                        (and
                          (>= j@28@01 0)
                          (and
                            (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (forall ((k@29@01 Int)) (!
                              (and
                                (>= k@29@01 0)
                                (and
                                  (<
                                    k@29@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (>
                                    (height $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      j@28@01))
                                    (height $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      k@29@01)))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@29@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                      (and
                        (>= j@28@01 0)
                        (and
                          (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (forall ((k@29@01 Int)) (!
                            (and
                              (>= k@29@01 0)
                              (and
                                (<
                                  k@29@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (>
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    j@28@01))
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    k@29@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@29@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@28@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
            (or
              (forall ((k@27@01 Int)) (!
                (and
                  (>= k@27@01 0)
                  (and
                    (< k@27@01 (Seq_length current@11@01))
                    (>
                      (height $Snap.unit (Seq_index current@11@01 i@26@01))
                      (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@11@01
                  k@27@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (not
                (forall ((k@27@01 Int)) (!
                  (and
                    (>= k@27@01 0)
                    (and
                      (< k@27@01 (Seq_length current@11@01))
                      (>
                        (height $Snap.unit (Seq_index current@11@01 i@26@01))
                        (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@11@01
                    k@27@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
        (or
          (< i@26@01 (Seq_length current@11@01))
          (not (< i@26@01 (Seq_length current@11@01))))))
    (or (>= i@26@01 0) (not (>= i@26@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@26@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60-aux|)))
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (>= i@26@01 0) (< i@26@01 (Seq_length current@11@01)))
    (and
      (forall ((k@27@01 Int)) (!
        (=>
          (and (>= k@27@01 0) (< k@27@01 (Seq_length current@11@01)))
          (and
            (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 k@27@01))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (=>
        (forall ((k@27@01 Int)) (!
          (and
            (>= k@27@01 0)
            (and
              (< k@27@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@26@01))
                (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@28@01 Int)) (!
          (and
            (=>
              (and
                (>= j@28@01 0)
                (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>))))
              (forall ((k@29@01 Int)) (!
                (=>
                  (and
                    (>= k@29@01 0)
                    (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                  (and
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@28@01))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@29@01))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@29@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))
            (=>
              (and
                (>= j@28@01 0)
                (and
                  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@29@01 Int)) (!
                    (and
                      (>= k@29@01 0)
                      (and
                        (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@28@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@29@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@29@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@28@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            j@28@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@26@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60_precondition|)))
(set-option :timeout 0)
(push) ; 8
(assert (not (forall ((i@26@01 Int)) (!
  (=>
    (=>
      (and (>= i@26@01 0) (< i@26@01 (Seq_length current@11@01)))
      (and
        (forall ((k@27@01 Int)) (!
          (=>
            (and (>= k@27@01 0) (< k@27@01 (Seq_length current@11@01)))
            (and
              (height%precondition $Snap.unit (Seq_index current@11@01 i@26@01))
              (height%precondition $Snap.unit (Seq_index current@11@01 k@27@01))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@27@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (=>
          (forall ((k@27@01 Int)) (!
            (and
              (>= k@27@01 0)
              (and
                (< k@27@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@26@01))
                  (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@27@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (forall ((j@28@01 Int)) (!
            (and
              (=>
                (and
                  (>= j@28@01 0)
                  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                (forall ((k@29@01 Int)) (!
                  (=>
                    (and
                      (>= k@29@01 0)
                      (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                    (and
                      (height%precondition $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@28@01))
                      (height%precondition $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@29@01))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@29@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))
              (=>
                (and
                  (>= j@28@01 0)
                  (and
                    (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@29@01 Int)) (!
                      (and
                        (>= k@29@01 0)
                        (and
                          (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@28@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@29@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@29@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                (and
                  (height%precondition $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@28@01))
                  (height%precondition $Snap.unit (Seq_index
                    current@11@01
                    i@26@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@28@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
    (and
      (>= i@26@01 0)
      (and
        (< i@26@01 (Seq_length current@11@01))
        (and
          (forall ((k@27@01 Int)) (!
            (and
              (>= k@27@01 0)
              (and
                (< k@27@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@26@01))
                  (height $Snap.unit (Seq_index current@11@01 k@27@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@27@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (forall ((j@28@01 Int)) (!
            (=>
              (and
                (>= j@28@01 0)
                (and
                  (< j@28@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@29@01 Int)) (!
                    (and
                      (>= k@29@01 0)
                      (and
                        (< k@29@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@28@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@29@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@29@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (=
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@28@01))
                (- (height $Snap.unit (Seq_index current@11@01 i@26@01)) 1)))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@28@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|))))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@26@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { height(current[i]) } i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1))))
(declare-const i@30@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 35 | !(i@30@01 >= 0) | live]
; [else-branch: 35 | i@30@01 >= 0 | live]
(push) ; 10
; [then-branch: 35 | !(i@30@01 >= 0)]
(assert (not (>= i@30@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 35 | i@30@01 >= 0]
(assert (>= i@30@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < |current|
; [eval] |current|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 36 | !(i@30@01 < |current@11@01|) | live]
; [else-branch: 36 | i@30@01 < |current@11@01| | live]
(push) ; 12
; [then-branch: 36 | !(i@30@01 < |current@11@01|)]
(assert (not (< i@30@01 (Seq_length current@11@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 36 | i@30@01 < |current@11@01|]
(assert (< i@30@01 (Seq_length current@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k])))
(declare-const k@31@01 Int)
(set-option :timeout 0)
(push) ; 13
; [eval] k >= 0 && (k < |current| && height(current[i]) > height(current[k]))
; [eval] k >= 0
(push) ; 14
; [then-branch: 37 | !(k@31@01 >= 0) | live]
; [else-branch: 37 | k@31@01 >= 0 | live]
(push) ; 15
; [then-branch: 37 | !(k@31@01 >= 0)]
(assert (not (>= k@31@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 15
(set-option :timeout 0)
(push) ; 15
; [else-branch: 37 | k@31@01 >= 0]
(assert (>= k@31@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] k < |current|
; [eval] |current|
(set-option :timeout 0)
(push) ; 16
; [then-branch: 38 | !(k@31@01 < |current@11@01|) | live]
; [else-branch: 38 | k@31@01 < |current@11@01| | live]
(push) ; 17
; [then-branch: 38 | !(k@31@01 < |current@11@01|)]
(assert (not (< k@31@01 (Seq_length current@11@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 38 | k@31@01 < |current@11@01|]
(assert (< k@31@01 (Seq_length current@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] height(current[i]) > height(current[k])
; [eval] height(current[i])
; [eval] current[i]
(set-option :timeout 0)
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01)))
; [eval] height(current[k])
; [eval] current[k]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 k@31@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 k@31@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@31@01 (Seq_length current@11@01))
  (and
    (< k@31@01 (Seq_length current@11@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 k@31@01)))))
(assert (or
  (< k@31@01 (Seq_length current@11@01))
  (not (< k@31@01 (Seq_length current@11@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@31@01 0)
  (and
    (>= k@31@01 0)
    (=>
      (< k@31@01 (Seq_length current@11@01))
      (and
        (< k@31@01 (Seq_length current@11@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 k@31@01))))
    (or
      (< k@31@01 (Seq_length current@11@01))
      (not (< k@31@01 (Seq_length current@11@01)))))))
(assert (or (>= k@31@01 0) (not (>= k@31@01 0))))
(pop) ; 13
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@31@01 Int)) (!
  (and
    (=>
      (>= k@31@01 0)
      (and
        (>= k@31@01 0)
        (=>
          (< k@31@01 (Seq_length current@11@01))
          (and
            (< k@31@01 (Seq_length current@11@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 k@31@01))))
        (or
          (< k@31@01 (Seq_length current@11@01))
          (not (< k@31@01 (Seq_length current@11@01))))))
    (or (>= k@31@01 0) (not (>= k@31@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|)))
(push) ; 13
; [then-branch: 39 | !(QA k@31@01 :: k@31@01 >= 0 && k@31@01 < |current@11@01| && height(_, current@11@01[i@30@01]) > height(_, current@11@01[k@31@01])) | live]
; [else-branch: 39 | QA k@31@01 :: k@31@01 >= 0 && k@31@01 < |current@11@01| && height(_, current@11@01[i@30@01]) > height(_, current@11@01[k@31@01]) | live]
(push) ; 14
; [then-branch: 39 | !(QA k@31@01 :: k@31@01 >= 0 && k@31@01 < |current@11@01| && height(_, current@11@01[i@30@01]) > height(_, current@11@01[k@31@01]))]
(assert (not
  (forall ((k@31@01 Int)) (!
    (and
      (>= k@31@01 0)
      (and
        (< k@31@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@30@01))
          (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 39 | QA k@31@01 :: k@31@01 >= 0 && k@31@01 < |current@11@01| && height(_, current@11@01[i@30@01]) > height(_, current@11@01[k@31@01])]
(assert (forall ((k@31@01 Int)) (!
  (and
    (>= k@31@01 0)
    (and
      (< k@31@01 (Seq_length current@11@01))
      (>
        (height $Snap.unit (Seq_index current@11@01 i@30@01))
        (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)
(declare-const j@32@01 Int)
(set-option :timeout 0)
(push) ; 15
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k]))))
; [eval] j >= 0
(push) ; 16
; [then-branch: 40 | !(j@32@01 >= 0) | live]
; [else-branch: 40 | j@32@01 >= 0 | live]
(push) ; 17
; [then-branch: 40 | !(j@32@01 >= 0)]
(assert (not (>= j@32@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 40 | j@32@01 >= 0]
(assert (>= j@32@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j < |next|
; [eval] |next|
(set-option :timeout 0)
(push) ; 18
; [then-branch: 41 | !(j@32@01 < |Nil|) | live]
; [else-branch: 41 | j@32@01 < |Nil| | live]
(push) ; 19
; [then-branch: 41 | !(j@32@01 < |Nil|)]
(assert (not (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 19
(set-option :timeout 0)
(push) ; 19
; [else-branch: 41 | j@32@01 < |Nil|]
(assert (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))
(declare-const k@33@01 Int)
(set-option :timeout 0)
(push) ; 20
; [eval] k >= 0 && (k < |next| && height(next[j]) > height(next[k]))
; [eval] k >= 0
(push) ; 21
; [then-branch: 42 | !(k@33@01 >= 0) | live]
; [else-branch: 42 | k@33@01 >= 0 | live]
(push) ; 22
; [then-branch: 42 | !(k@33@01 >= 0)]
(assert (not (>= k@33@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 22
(set-option :timeout 0)
(push) ; 22
; [else-branch: 42 | k@33@01 >= 0]
(assert (>= k@33@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] k < |next|
; [eval] |next|
(set-option :timeout 0)
(push) ; 23
; [then-branch: 43 | !(k@33@01 < |Nil|) | live]
; [else-branch: 43 | k@33@01 < |Nil| | live]
(push) ; 24
; [then-branch: 43 | !(k@33@01 < |Nil|)]
(assert (not (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 24
(set-option :timeout 0)
(push) ; 24
; [else-branch: 43 | k@33@01 < |Nil|]
(assert (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] height(next[j]) > height(next[k])
; [eval] height(next[j])
; [eval] next[j]
(set-option :timeout 0)
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01)))
; [eval] height(next[k])
; [eval] next[k]
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (and
    (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))))
(assert (or
  (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (not (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@33@01 0)
  (and
    (>= k@33@01 0)
    (=>
      (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (and
        (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          j@32@01))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@33@01))))
    (or
      (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (not (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>))))))))
(assert (or (>= k@33@01 0) (not (>= k@33@01 0))))
(pop) ; 20
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@33@01 Int)) (!
  (and
    (=>
      (>= k@33@01 0)
      (and
        (>= k@33@01 0)
        (=>
          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (and
            (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@32@01))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@33@01))))
        (or
          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (not (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
    (or (>= k@33@01 0) (not (>= k@33@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index
    (as Seq_empty  Seq<Tree>)
    k@33@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (and
    (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@33@01 Int)) (!
      (and
        (=>
          (>= k@33@01 0)
          (and
            (>= k@33@01 0)
            (=>
              (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (and
                (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@32@01))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@33@01))))
            (or
              (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (not (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
        (or (>= k@33@01 0) (not (>= k@33@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@33@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))))
(assert (or
  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (not (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@32@01 0)
  (and
    (>= j@32@01 0)
    (=>
      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (and
        (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@33@01 Int)) (!
          (and
            (=>
              (>= k@33@01 0)
              (and
                (>= k@33@01 0)
                (=>
                  (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (and
                    (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@32@01))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@33@01))))
                (or
                  (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (not (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
            (or (>= k@33@01 0) (not (>= k@33@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@33@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
    (or
      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (not (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>))))))))
(assert (or (>= j@32@01 0) (not (>= j@32@01 0))))
(push) ; 16
; [then-branch: 44 | j@32@01 >= 0 && j@32@01 < |Nil| && QA k@33@01 :: k@33@01 >= 0 && k@33@01 < |Nil| && height(_, Nil[j@32@01]) > height(_, Nil[k@33@01]) | live]
; [else-branch: 44 | !(j@32@01 >= 0 && j@32@01 < |Nil| && QA k@33@01 :: k@33@01 >= 0 && k@33@01 < |Nil| && height(_, Nil[j@32@01]) > height(_, Nil[k@33@01])) | live]
(push) ; 17
; [then-branch: 44 | j@32@01 >= 0 && j@32@01 < |Nil| && QA k@33@01 :: k@33@01 >= 0 && k@33@01 < |Nil| && height(_, Nil[j@32@01]) > height(_, Nil[k@33@01])]
(assert (and
  (>= j@32@01 0)
  (and
    (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@33@01 Int)) (!
      (and
        (>= k@33@01 0)
        (and
          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (>
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@33@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] height(next[j]) == height(current[i]) - 1
; [eval] height(next[j])
; [eval] next[j]
(set-option :timeout 0)
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01)))
; [eval] height(current[i]) - 1
; [eval] height(current[i])
; [eval] current[i]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01)))
(pop) ; 17
(push) ; 17
; [else-branch: 44 | !(j@32@01 >= 0 && j@32@01 < |Nil| && QA k@33@01 :: k@33@01 >= 0 && k@33@01 < |Nil| && height(_, Nil[j@32@01]) > height(_, Nil[k@33@01]))]
(assert (not
  (and
    (>= j@32@01 0)
    (and
      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@33@01 Int)) (!
        (and
          (>= k@33@01 0)
          (and
            (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@33@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (=>
  (and
    (>= j@32@01 0)
    (and
      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@33@01 Int)) (!
        (and
          (>= k@33@01 0)
          (and
            (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@33@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
  (and
    (>= j@32@01 0)
    (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@33@01 Int)) (!
      (and
        (>= k@33@01 0)
        (and
          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (>
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@33@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@32@01 0)
      (and
        (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@33@01 Int)) (!
          (and
            (>= k@33@01 0)
            (and
              (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (>
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@33@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
  (and
    (>= j@32@01 0)
    (and
      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@33@01 Int)) (!
        (and
          (>= k@33@01 0)
          (and
            (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@33@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
(pop) ; 15
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@32@01 Int)) (!
  (and
    (=>
      (>= j@32@01 0)
      (and
        (>= j@32@01 0)
        (=>
          (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (and
            (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@33@01 Int)) (!
              (and
                (=>
                  (>= k@33@01 0)
                  (and
                    (>= k@33@01 0)
                    (=>
                      (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (and
                        (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@32@01))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@33@01))))
                    (or
                      (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (not (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                (or (>= k@33@01 0) (not (>= k@33@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@33@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
        (or
          (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (not (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
    (or (>= j@32@01 0) (not (>= j@32@01 0)))
    (=>
      (and
        (>= j@32@01 0)
        (and
          (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (forall ((k@33@01 Int)) (!
            (and
              (>= k@33@01 0)
              (and
                (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (>
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@32@01))
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@33@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@33@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
      (and
        (>= j@32@01 0)
        (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@33@01 Int)) (!
          (and
            (>= k@33@01 0)
            (and
              (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (>
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@33@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@33@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          j@32@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))))
    (or
      (not
        (and
          (>= j@32@01 0)
          (and
            (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@33@01 Int)) (!
              (and
                (>= k@33@01 0)
                (and
                  (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (>
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@32@01))
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@33@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@33@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
      (and
        (>= j@32@01 0)
        (and
          (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (forall ((k@33@01 Int)) (!
            (and
              (>= k@33@01 0)
              (and
                (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (>
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@32@01))
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@33@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@33@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
  :pattern ((height%limited $Snap.unit (Seq_index
    (as Seq_empty  Seq<Tree>)
    j@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (forall ((k@31@01 Int)) (!
    (and
      (>= k@31@01 0)
      (and
        (< k@31@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@30@01))
          (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (and
    (forall ((k@31@01 Int)) (!
      (and
        (>= k@31@01 0)
        (and
          (< k@31@01 (Seq_length current@11@01))
          (>
            (height $Snap.unit (Seq_index current@11@01 i@30@01))
            (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
    (forall ((j@32@01 Int)) (!
      (and
        (=>
          (>= j@32@01 0)
          (and
            (>= j@32@01 0)
            (=>
              (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (and
                (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@33@01 Int)) (!
                  (and
                    (=>
                      (>= k@33@01 0)
                      (and
                        (>= k@33@01 0)
                        (=>
                          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (and
                            (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (height%precondition $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@32@01))
                            (height%precondition $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@33@01))))
                        (or
                          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (not
                            (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                    (or (>= k@33@01 0) (not (>= k@33@01 0))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@33@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
            (or
              (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (not (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
        (or (>= j@32@01 0) (not (>= j@32@01 0)))
        (=>
          (and
            (>= j@32@01 0)
            (and
              (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (forall ((k@33@01 Int)) (!
                (and
                  (>= k@33@01 0)
                  (and
                    (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (>
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@32@01))
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@33@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@33@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
          (and
            (>= j@32@01 0)
            (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@33@01 Int)) (!
              (and
                (>= k@33@01 0)
                (and
                  (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (>
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@32@01))
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@33@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@33@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@32@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))))
        (or
          (not
            (and
              (>= j@32@01 0)
              (and
                (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@33@01 Int)) (!
                  (and
                    (>= k@33@01 0)
                    (and
                      (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (>
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@32@01))
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@33@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@33@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
          (and
            (>= j@32@01 0)
            (and
              (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (forall ((k@33@01 Int)) (!
                (and
                  (>= k@33@01 0)
                  (and
                    (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (>
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@32@01))
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@33@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@33@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        j@32@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))))
(assert (or
  (forall ((k@31@01 Int)) (!
    (and
      (>= k@31@01 0)
      (and
        (< k@31@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@30@01))
          (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (not
    (forall ((k@31@01 Int)) (!
      (and
        (>= k@31@01 0)
        (and
          (< k@31@01 (Seq_length current@11@01))
          (>
            (height $Snap.unit (Seq_index current@11@01 i@30@01))
            (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@30@01 (Seq_length current@11@01))
  (and
    (< i@30@01 (Seq_length current@11@01))
    (forall ((k@31@01 Int)) (!
      (and
        (=>
          (>= k@31@01 0)
          (and
            (>= k@31@01 0)
            (=>
              (< k@31@01 (Seq_length current@11@01))
              (and
                (< k@31@01 (Seq_length current@11@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 k@31@01))))
            (or
              (< k@31@01 (Seq_length current@11@01))
              (not (< k@31@01 (Seq_length current@11@01))))))
        (or (>= k@31@01 0) (not (>= k@31@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
    (=>
      (forall ((k@31@01 Int)) (!
        (and
          (>= k@31@01 0)
          (and
            (< k@31@01 (Seq_length current@11@01))
            (>
              (height $Snap.unit (Seq_index current@11@01 i@30@01))
              (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (and
        (forall ((k@31@01 Int)) (!
          (and
            (>= k@31@01 0)
            (and
              (< k@31@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@30@01))
                (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@32@01 Int)) (!
          (and
            (=>
              (>= j@32@01 0)
              (and
                (>= j@32@01 0)
                (=>
                  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (and
                    (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@33@01 Int)) (!
                      (and
                        (=>
                          (>= k@33@01 0)
                          (and
                            (>= k@33@01 0)
                            (=>
                              (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (and
                                (<
                                  k@33@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (height%precondition $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@32@01))
                                (height%precondition $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@33@01))))
                            (or
                              (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (not
                                (<
                                  k@33@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))))))
                        (or (>= k@33@01 0) (not (>= k@33@01 0))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@33@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                (or
                  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (not (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
            (or (>= j@32@01 0) (not (>= j@32@01 0)))
            (=>
              (and
                (>= j@32@01 0)
                (and
                  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@33@01 Int)) (!
                    (and
                      (>= k@33@01 0)
                      (and
                        (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@32@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@33@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@33@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (>= j@32@01 0)
                (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@33@01 Int)) (!
                  (and
                    (>= k@33@01 0)
                    (and
                      (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (>
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@32@01))
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@33@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@33@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@32@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))))
            (or
              (not
                (and
                  (>= j@32@01 0)
                  (and
                    (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@33@01 Int)) (!
                      (and
                        (>= k@33@01 0)
                        (and
                          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@32@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@33@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@33@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
              (and
                (>= j@32@01 0)
                (and
                  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@33@01 Int)) (!
                    (and
                      (>= k@33@01 0)
                      (and
                        (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@32@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@33@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@33@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            j@32@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
    (or
      (forall ((k@31@01 Int)) (!
        (and
          (>= k@31@01 0)
          (and
            (< k@31@01 (Seq_length current@11@01))
            (>
              (height $Snap.unit (Seq_index current@11@01 i@30@01))
              (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (not
        (forall ((k@31@01 Int)) (!
          (and
            (>= k@31@01 0)
            (and
              (< k@31@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@30@01))
                (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))))
(assert (or
  (< i@30@01 (Seq_length current@11@01))
  (not (< i@30@01 (Seq_length current@11@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@30@01 0)
  (and
    (>= i@30@01 0)
    (=>
      (< i@30@01 (Seq_length current@11@01))
      (and
        (< i@30@01 (Seq_length current@11@01))
        (forall ((k@31@01 Int)) (!
          (and
            (=>
              (>= k@31@01 0)
              (and
                (>= k@31@01 0)
                (=>
                  (< k@31@01 (Seq_length current@11@01))
                  (and
                    (< k@31@01 (Seq_length current@11@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      i@30@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      k@31@01))))
                (or
                  (< k@31@01 (Seq_length current@11@01))
                  (not (< k@31@01 (Seq_length current@11@01))))))
            (or (>= k@31@01 0) (not (>= k@31@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
        (=>
          (forall ((k@31@01 Int)) (!
            (and
              (>= k@31@01 0)
              (and
                (< k@31@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@30@01))
                  (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@31@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (and
            (forall ((k@31@01 Int)) (!
              (and
                (>= k@31@01 0)
                (and
                  (< k@31@01 (Seq_length current@11@01))
                  (>
                    (height $Snap.unit (Seq_index current@11@01 i@30@01))
                    (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@31@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
            (forall ((j@32@01 Int)) (!
              (and
                (=>
                  (>= j@32@01 0)
                  (and
                    (>= j@32@01 0)
                    (=>
                      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (and
                        (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@33@01 Int)) (!
                          (and
                            (=>
                              (>= k@33@01 0)
                              (and
                                (>= k@33@01 0)
                                (=>
                                  (<
                                    k@33@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (and
                                    (<
                                      k@33@01
                                      (Seq_length (as Seq_empty  Seq<Tree>)))
                                    (height%precondition $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      j@32@01))
                                    (height%precondition $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      k@33@01))))
                                (or
                                  (<
                                    k@33@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (not
                                    (<
                                      k@33@01
                                      (Seq_length (as Seq_empty  Seq<Tree>)))))))
                            (or (>= k@33@01 0) (not (>= k@33@01 0))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@33@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                    (or
                      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (not (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                (or (>= j@32@01 0) (not (>= j@32@01 0)))
                (=>
                  (and
                    (>= j@32@01 0)
                    (and
                      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (forall ((k@33@01 Int)) (!
                        (and
                          (>= k@33@01 0)
                          (and
                            (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (>
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                j@32@01))
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@33@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@33@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                  (and
                    (>= j@32@01 0)
                    (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@33@01 Int)) (!
                      (and
                        (>= k@33@01 0)
                        (and
                          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@32@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@33@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@33@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@32@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      i@30@01))))
                (or
                  (not
                    (and
                      (>= j@32@01 0)
                      (and
                        (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@33@01 Int)) (!
                          (and
                            (>= k@33@01 0)
                            (and
                              (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (>
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@32@01))
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@33@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@33@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                  (and
                    (>= j@32@01 0)
                    (and
                      (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (forall ((k@33@01 Int)) (!
                        (and
                          (>= k@33@01 0)
                          (and
                            (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (>
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                j@32@01))
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@33@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@33@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                j@32@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
        (or
          (forall ((k@31@01 Int)) (!
            (and
              (>= k@31@01 0)
              (and
                (< k@31@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@30@01))
                  (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@31@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (not
            (forall ((k@31@01 Int)) (!
              (and
                (>= k@31@01 0)
                (and
                  (< k@31@01 (Seq_length current@11@01))
                  (>
                    (height $Snap.unit (Seq_index current@11@01 i@30@01))
                    (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@31@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
    (or
      (< i@30@01 (Seq_length current@11@01))
      (not (< i@30@01 (Seq_length current@11@01)))))))
(assert (or (>= i@30@01 0) (not (>= i@30@01 0))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@30@01 Int)) (!
  (and
    (=>
      (>= i@30@01 0)
      (and
        (>= i@30@01 0)
        (=>
          (< i@30@01 (Seq_length current@11@01))
          (and
            (< i@30@01 (Seq_length current@11@01))
            (forall ((k@31@01 Int)) (!
              (and
                (=>
                  (>= k@31@01 0)
                  (and
                    (>= k@31@01 0)
                    (=>
                      (< k@31@01 (Seq_length current@11@01))
                      (and
                        (< k@31@01 (Seq_length current@11@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          i@30@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          k@31@01))))
                    (or
                      (< k@31@01 (Seq_length current@11@01))
                      (not (< k@31@01 (Seq_length current@11@01))))))
                (or (>= k@31@01 0) (not (>= k@31@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@31@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
            (=>
              (forall ((k@31@01 Int)) (!
                (and
                  (>= k@31@01 0)
                  (and
                    (< k@31@01 (Seq_length current@11@01))
                    (>
                      (height $Snap.unit (Seq_index current@11@01 i@30@01))
                      (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@11@01
                  k@31@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (and
                (forall ((k@31@01 Int)) (!
                  (and
                    (>= k@31@01 0)
                    (and
                      (< k@31@01 (Seq_length current@11@01))
                      (>
                        (height $Snap.unit (Seq_index current@11@01 i@30@01))
                        (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@11@01
                    k@31@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
                (forall ((j@32@01 Int)) (!
                  (and
                    (=>
                      (>= j@32@01 0)
                      (and
                        (>= j@32@01 0)
                        (=>
                          (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (and
                            (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (forall ((k@33@01 Int)) (!
                              (and
                                (=>
                                  (>= k@33@01 0)
                                  (and
                                    (>= k@33@01 0)
                                    (=>
                                      (<
                                        k@33@01
                                        (Seq_length (as Seq_empty  Seq<Tree>)))
                                      (and
                                        (<
                                          k@33@01
                                          (Seq_length (as Seq_empty  Seq<Tree>)))
                                        (height%precondition $Snap.unit (Seq_index
                                          (as Seq_empty  Seq<Tree>)
                                          j@32@01))
                                        (height%precondition $Snap.unit (Seq_index
                                          (as Seq_empty  Seq<Tree>)
                                          k@33@01))))
                                    (or
                                      (<
                                        k@33@01
                                        (Seq_length (as Seq_empty  Seq<Tree>)))
                                      (not
                                        (<
                                          k@33@01
                                          (Seq_length (as Seq_empty  Seq<Tree>)))))))
                                (or (>= k@33@01 0) (not (>= k@33@01 0))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@33@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                        (or
                          (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (not
                            (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                    (or (>= j@32@01 0) (not (>= j@32@01 0)))
                    (=>
                      (and
                        (>= j@32@01 0)
                        (and
                          (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (forall ((k@33@01 Int)) (!
                            (and
                              (>= k@33@01 0)
                              (and
                                (<
                                  k@33@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (>
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    j@32@01))
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    k@33@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@33@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                      (and
                        (>= j@32@01 0)
                        (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@33@01 Int)) (!
                          (and
                            (>= k@33@01 0)
                            (and
                              (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (>
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@32@01))
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@33@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@33@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@32@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          i@30@01))))
                    (or
                      (not
                        (and
                          (>= j@32@01 0)
                          (and
                            (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (forall ((k@33@01 Int)) (!
                              (and
                                (>= k@33@01 0)
                                (and
                                  (<
                                    k@33@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (>
                                    (height $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      j@32@01))
                                    (height $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      k@33@01)))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@33@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                      (and
                        (>= j@32@01 0)
                        (and
                          (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (forall ((k@33@01 Int)) (!
                            (and
                              (>= k@33@01 0)
                              (and
                                (<
                                  k@33@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (>
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    j@32@01))
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    k@33@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@33@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@32@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
            (or
              (forall ((k@31@01 Int)) (!
                (and
                  (>= k@31@01 0)
                  (and
                    (< k@31@01 (Seq_length current@11@01))
                    (>
                      (height $Snap.unit (Seq_index current@11@01 i@30@01))
                      (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@11@01
                  k@31@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (not
                (forall ((k@31@01 Int)) (!
                  (and
                    (>= k@31@01 0)
                    (and
                      (< k@31@01 (Seq_length current@11@01))
                      (>
                        (height $Snap.unit (Seq_index current@11@01 i@30@01))
                        (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@11@01
                    k@31@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
        (or
          (< i@30@01 (Seq_length current@11@01))
          (not (< i@30@01 (Seq_length current@11@01))))))
    (or (>= i@30@01 0) (not (>= i@30@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@30@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60-aux|)))
(assert (forall ((i@30@01 Int)) (!
  (=>
    (and (>= i@30@01 0) (< i@30@01 (Seq_length current@11@01)))
    (and
      (forall ((k@31@01 Int)) (!
        (=>
          (and (>= k@31@01 0) (< k@31@01 (Seq_length current@11@01)))
          (and
            (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 k@31@01))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (=>
        (forall ((k@31@01 Int)) (!
          (and
            (>= k@31@01 0)
            (and
              (< k@31@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@30@01))
                (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@32@01 Int)) (!
          (and
            (=>
              (and
                (>= j@32@01 0)
                (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>))))
              (forall ((k@33@01 Int)) (!
                (=>
                  (and
                    (>= k@33@01 0)
                    (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                  (and
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@32@01))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@33@01))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@33@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))
            (=>
              (and
                (>= j@32@01 0)
                (and
                  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@33@01 Int)) (!
                    (and
                      (>= k@33@01 0)
                      (and
                        (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@32@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@33@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@33@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@32@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            j@32@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@30@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60_precondition|)))
(set-option :timeout 0)
(push) ; 8
(assert (not (forall ((i@30@01 Int)) (!
  (=>
    (=>
      (and (>= i@30@01 0) (< i@30@01 (Seq_length current@11@01)))
      (and
        (forall ((k@31@01 Int)) (!
          (=>
            (and (>= k@31@01 0) (< k@31@01 (Seq_length current@11@01)))
            (and
              (height%precondition $Snap.unit (Seq_index current@11@01 i@30@01))
              (height%precondition $Snap.unit (Seq_index current@11@01 k@31@01))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@31@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (=>
          (forall ((k@31@01 Int)) (!
            (and
              (>= k@31@01 0)
              (and
                (< k@31@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@30@01))
                  (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@31@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (forall ((j@32@01 Int)) (!
            (and
              (=>
                (and
                  (>= j@32@01 0)
                  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                (forall ((k@33@01 Int)) (!
                  (=>
                    (and
                      (>= k@33@01 0)
                      (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                    (and
                      (height%precondition $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@32@01))
                      (height%precondition $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@33@01))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@33@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))
              (=>
                (and
                  (>= j@32@01 0)
                  (and
                    (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@33@01 Int)) (!
                      (and
                        (>= k@33@01 0)
                        (and
                          (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@32@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@33@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@33@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                (and
                  (height%precondition $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@32@01))
                  (height%precondition $Snap.unit (Seq_index
                    current@11@01
                    i@30@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@32@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
    (and
      (>= i@30@01 0)
      (and
        (< i@30@01 (Seq_length current@11@01))
        (and
          (forall ((k@31@01 Int)) (!
            (and
              (>= k@31@01 0)
              (and
                (< k@31@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@30@01))
                  (height $Snap.unit (Seq_index current@11@01 k@31@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@31@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (forall ((j@32@01 Int)) (!
            (=>
              (and
                (>= j@32@01 0)
                (and
                  (< j@32@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@33@01 Int)) (!
                    (and
                      (>= k@33@01 0)
                      (and
                        (< k@33@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@32@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@33@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@33@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (=
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@32@01))
                (- (height $Snap.unit (Seq_index current@11@01 i@30@01)) 1)))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@32@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|))))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@30@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { height(current[i]) } i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1))))
(declare-const i@34@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] i >= 0 && (i < |current| && ((forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k]))) && (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 45 | !(i@34@01 >= 0) | live]
; [else-branch: 45 | i@34@01 >= 0 | live]
(push) ; 10
; [then-branch: 45 | !(i@34@01 >= 0)]
(assert (not (>= i@34@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 45 | i@34@01 >= 0]
(assert (>= i@34@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < |current|
; [eval] |current|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 46 | !(i@34@01 < |current@11@01|) | live]
; [else-branch: 46 | i@34@01 < |current@11@01| | live]
(push) ; 12
; [then-branch: 46 | !(i@34@01 < |current@11@01|)]
(assert (not (< i@34@01 (Seq_length current@11@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 46 | i@34@01 < |current@11@01|]
(assert (< i@34@01 (Seq_length current@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall k: Int :: { height(current[k]) } k >= 0 && (k < |current| && height(current[i]) > height(current[k])))
(declare-const k@35@01 Int)
(set-option :timeout 0)
(push) ; 13
; [eval] k >= 0 && (k < |current| && height(current[i]) > height(current[k]))
; [eval] k >= 0
(push) ; 14
; [then-branch: 47 | !(k@35@01 >= 0) | live]
; [else-branch: 47 | k@35@01 >= 0 | live]
(push) ; 15
; [then-branch: 47 | !(k@35@01 >= 0)]
(assert (not (>= k@35@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 15
(set-option :timeout 0)
(push) ; 15
; [else-branch: 47 | k@35@01 >= 0]
(assert (>= k@35@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] k < |current|
; [eval] |current|
(set-option :timeout 0)
(push) ; 16
; [then-branch: 48 | !(k@35@01 < |current@11@01|) | live]
; [else-branch: 48 | k@35@01 < |current@11@01| | live]
(push) ; 17
; [then-branch: 48 | !(k@35@01 < |current@11@01|)]
(assert (not (< k@35@01 (Seq_length current@11@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 48 | k@35@01 < |current@11@01|]
(assert (< k@35@01 (Seq_length current@11@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] height(current[i]) > height(current[k])
; [eval] height(current[i])
; [eval] current[i]
(set-option :timeout 0)
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01)))
; [eval] height(current[k])
; [eval] current[k]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 k@35@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 k@35@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@35@01 (Seq_length current@11@01))
  (and
    (< k@35@01 (Seq_length current@11@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 k@35@01)))))
(assert (or
  (< k@35@01 (Seq_length current@11@01))
  (not (< k@35@01 (Seq_length current@11@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@35@01 0)
  (and
    (>= k@35@01 0)
    (=>
      (< k@35@01 (Seq_length current@11@01))
      (and
        (< k@35@01 (Seq_length current@11@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 k@35@01))))
    (or
      (< k@35@01 (Seq_length current@11@01))
      (not (< k@35@01 (Seq_length current@11@01)))))))
(assert (or (>= k@35@01 0) (not (>= k@35@01 0))))
(pop) ; 13
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@35@01 Int)) (!
  (and
    (=>
      (>= k@35@01 0)
      (and
        (>= k@35@01 0)
        (=>
          (< k@35@01 (Seq_length current@11@01))
          (and
            (< k@35@01 (Seq_length current@11@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 k@35@01))))
        (or
          (< k@35@01 (Seq_length current@11@01))
          (not (< k@35@01 (Seq_length current@11@01))))))
    (or (>= k@35@01 0) (not (>= k@35@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|)))
(push) ; 13
; [then-branch: 49 | !(QA k@35@01 :: k@35@01 >= 0 && k@35@01 < |current@11@01| && height(_, current@11@01[i@34@01]) > height(_, current@11@01[k@35@01])) | live]
; [else-branch: 49 | QA k@35@01 :: k@35@01 >= 0 && k@35@01 < |current@11@01| && height(_, current@11@01[i@34@01]) > height(_, current@11@01[k@35@01]) | live]
(push) ; 14
; [then-branch: 49 | !(QA k@35@01 :: k@35@01 >= 0 && k@35@01 < |current@11@01| && height(_, current@11@01[i@34@01]) > height(_, current@11@01[k@35@01]))]
(assert (not
  (forall ((k@35@01 Int)) (!
    (and
      (>= k@35@01 0)
      (and
        (< k@35@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@34@01))
          (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 49 | QA k@35@01 :: k@35@01 >= 0 && k@35@01 < |current@11@01| && height(_, current@11@01[i@34@01]) > height(_, current@11@01[k@35@01])]
(assert (forall ((k@35@01 Int)) (!
  (and
    (>= k@35@01 0)
    (and
      (< k@35@01 (Seq_length current@11@01))
      (>
        (height $Snap.unit (Seq_index current@11@01 i@34@01))
        (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall j: Int :: { height(next[j]) } j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1)
(declare-const j@36@01 Int)
(set-option :timeout 0)
(push) ; 15
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))) ==> height(next[j]) == height(current[i]) - 1
; [eval] j >= 0 && (j < |next| && (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k]))))
; [eval] j >= 0
(push) ; 16
; [then-branch: 50 | !(j@36@01 >= 0) | live]
; [else-branch: 50 | j@36@01 >= 0 | live]
(push) ; 17
; [then-branch: 50 | !(j@36@01 >= 0)]
(assert (not (>= j@36@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(set-option :timeout 0)
(push) ; 17
; [else-branch: 50 | j@36@01 >= 0]
(assert (>= j@36@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j < |next|
; [eval] |next|
(set-option :timeout 0)
(push) ; 18
; [then-branch: 51 | !(j@36@01 < |Nil|) | live]
; [else-branch: 51 | j@36@01 < |Nil| | live]
(push) ; 19
; [then-branch: 51 | !(j@36@01 < |Nil|)]
(assert (not (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 19
(set-option :timeout 0)
(push) ; 19
; [else-branch: 51 | j@36@01 < |Nil|]
(assert (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] (forall k: Int :: { height(next[k]) } k >= 0 && (k < |next| && height(next[j]) > height(next[k])))
(declare-const k@37@01 Int)
(set-option :timeout 0)
(push) ; 20
; [eval] k >= 0 && (k < |next| && height(next[j]) > height(next[k]))
; [eval] k >= 0
(push) ; 21
; [then-branch: 52 | !(k@37@01 >= 0) | live]
; [else-branch: 52 | k@37@01 >= 0 | live]
(push) ; 22
; [then-branch: 52 | !(k@37@01 >= 0)]
(assert (not (>= k@37@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 22
(set-option :timeout 0)
(push) ; 22
; [else-branch: 52 | k@37@01 >= 0]
(assert (>= k@37@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] k < |next|
; [eval] |next|
(set-option :timeout 0)
(push) ; 23
; [then-branch: 53 | !(k@37@01 < |Nil|) | live]
; [else-branch: 53 | k@37@01 < |Nil| | live]
(push) ; 24
; [then-branch: 53 | !(k@37@01 < |Nil|)]
(assert (not (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 24
(set-option :timeout 0)
(push) ; 24
; [else-branch: 53 | k@37@01 < |Nil|]
(assert (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] height(next[j]) > height(next[k])
; [eval] height(next[j])
; [eval] next[j]
(set-option :timeout 0)
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01)))
; [eval] height(next[k])
; [eval] next[k]
(push) ; 25
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))
(pop) ; 25
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (and
    (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))))
(assert (or
  (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (not (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@37@01 0)
  (and
    (>= k@37@01 0)
    (=>
      (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (and
        (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          j@36@01))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@37@01))))
    (or
      (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (not (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>))))))))
(assert (or (>= k@37@01 0) (not (>= k@37@01 0))))
(pop) ; 20
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@37@01 Int)) (!
  (and
    (=>
      (>= k@37@01 0)
      (and
        (>= k@37@01 0)
        (=>
          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (and
            (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@36@01))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@37@01))))
        (or
          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (not (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
    (or (>= k@37@01 0) (not (>= k@37@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index
    (as Seq_empty  Seq<Tree>)
    k@37@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (and
    (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@37@01 Int)) (!
      (and
        (=>
          (>= k@37@01 0)
          (and
            (>= k@37@01 0)
            (=>
              (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (and
                (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@36@01))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@37@01))))
            (or
              (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (not (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
        (or (>= k@37@01 0) (not (>= k@37@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@37@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|)))))
(assert (or
  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
  (not (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@36@01 0)
  (and
    (>= j@36@01 0)
    (=>
      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (and
        (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@37@01 Int)) (!
          (and
            (=>
              (>= k@37@01 0)
              (and
                (>= k@37@01 0)
                (=>
                  (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (and
                    (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@36@01))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@37@01))))
                (or
                  (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (not (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
            (or (>= k@37@01 0) (not (>= k@37@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@37@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
    (or
      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (not (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>))))))))
(assert (or (>= j@36@01 0) (not (>= j@36@01 0))))
(push) ; 16
; [then-branch: 54 | j@36@01 >= 0 && j@36@01 < |Nil| && QA k@37@01 :: k@37@01 >= 0 && k@37@01 < |Nil| && height(_, Nil[j@36@01]) > height(_, Nil[k@37@01]) | live]
; [else-branch: 54 | !(j@36@01 >= 0 && j@36@01 < |Nil| && QA k@37@01 :: k@37@01 >= 0 && k@37@01 < |Nil| && height(_, Nil[j@36@01]) > height(_, Nil[k@37@01])) | live]
(push) ; 17
; [then-branch: 54 | j@36@01 >= 0 && j@36@01 < |Nil| && QA k@37@01 :: k@37@01 >= 0 && k@37@01 < |Nil| && height(_, Nil[j@36@01]) > height(_, Nil[k@37@01])]
(assert (and
  (>= j@36@01 0)
  (and
    (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@37@01 Int)) (!
      (and
        (>= k@37@01 0)
        (and
          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (>
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@37@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] height(next[j]) == height(current[i]) - 1
; [eval] height(next[j])
; [eval] next[j]
(set-option :timeout 0)
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01)))
; [eval] height(current[i]) - 1
; [eval] height(current[i])
; [eval] current[i]
(push) ; 18
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01)))
(pop) ; 18
; Joined path conditions
(assert (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01)))
(pop) ; 17
(push) ; 17
; [else-branch: 54 | !(j@36@01 >= 0 && j@36@01 < |Nil| && QA k@37@01 :: k@37@01 >= 0 && k@37@01 < |Nil| && height(_, Nil[j@36@01]) > height(_, Nil[k@37@01]))]
(assert (not
  (and
    (>= j@36@01 0)
    (and
      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@37@01 Int)) (!
        (and
          (>= k@37@01 0)
          (and
            (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@37@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (=>
  (and
    (>= j@36@01 0)
    (and
      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@37@01 Int)) (!
        (and
          (>= k@37@01 0)
          (and
            (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@37@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
  (and
    (>= j@36@01 0)
    (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
    (forall ((k@37@01 Int)) (!
      (and
        (>= k@37@01 0)
        (and
          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (>
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
            (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        k@37@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
    (height%precondition $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
    (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@36@01 0)
      (and
        (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@37@01 Int)) (!
          (and
            (>= k@37@01 0)
            (and
              (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (>
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@37@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
  (and
    (>= j@36@01 0)
    (and
      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
      (forall ((k@37@01 Int)) (!
        (and
          (>= k@37@01 0)
          (and
            (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (>
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
              (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          k@37@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
(pop) ; 15
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@36@01 Int)) (!
  (and
    (=>
      (>= j@36@01 0)
      (and
        (>= j@36@01 0)
        (=>
          (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (and
            (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@37@01 Int)) (!
              (and
                (=>
                  (>= k@37@01 0)
                  (and
                    (>= k@37@01 0)
                    (=>
                      (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (and
                        (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@36@01))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@37@01))))
                    (or
                      (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (not (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                (or (>= k@37@01 0) (not (>= k@37@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@37@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
        (or
          (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (not (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
    (or (>= j@36@01 0) (not (>= j@36@01 0)))
    (=>
      (and
        (>= j@36@01 0)
        (and
          (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (forall ((k@37@01 Int)) (!
            (and
              (>= k@37@01 0)
              (and
                (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (>
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@36@01))
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@37@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@37@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
      (and
        (>= j@36@01 0)
        (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
        (forall ((k@37@01 Int)) (!
          (and
            (>= k@37@01 0)
            (and
              (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (>
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) k@37@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            k@37@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
        (height%precondition $Snap.unit (Seq_index
          (as Seq_empty  Seq<Tree>)
          j@36@01))
        (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))))
    (or
      (not
        (and
          (>= j@36@01 0)
          (and
            (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@37@01 Int)) (!
              (and
                (>= k@37@01 0)
                (and
                  (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (>
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@36@01))
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@37@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@37@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
      (and
        (>= j@36@01 0)
        (and
          (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
          (forall ((k@37@01 Int)) (!
            (and
              (>= k@37@01 0)
              (and
                (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (>
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@36@01))
                  (height $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@37@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              k@37@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
  :pattern ((height%limited $Snap.unit (Seq_index
    (as Seq_empty  Seq<Tree>)
    j@36@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (forall ((k@35@01 Int)) (!
    (and
      (>= k@35@01 0)
      (and
        (< k@35@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@34@01))
          (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (and
    (forall ((k@35@01 Int)) (!
      (and
        (>= k@35@01 0)
        (and
          (< k@35@01 (Seq_length current@11@01))
          (>
            (height $Snap.unit (Seq_index current@11@01 i@34@01))
            (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
    (forall ((j@36@01 Int)) (!
      (and
        (=>
          (>= j@36@01 0)
          (and
            (>= j@36@01 0)
            (=>
              (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (and
                (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@37@01 Int)) (!
                  (and
                    (=>
                      (>= k@37@01 0)
                      (and
                        (>= k@37@01 0)
                        (=>
                          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (and
                            (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (height%precondition $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@36@01))
                            (height%precondition $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@37@01))))
                        (or
                          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (not
                            (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                    (or (>= k@37@01 0) (not (>= k@37@01 0))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@37@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
            (or
              (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (not (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
        (or (>= j@36@01 0) (not (>= j@36@01 0)))
        (=>
          (and
            (>= j@36@01 0)
            (and
              (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (forall ((k@37@01 Int)) (!
                (and
                  (>= k@37@01 0)
                  (and
                    (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (>
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@36@01))
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@37@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@37@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
          (and
            (>= j@36@01 0)
            (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
            (forall ((k@37@01 Int)) (!
              (and
                (>= k@37@01 0)
                (and
                  (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (>
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@36@01))
                    (height $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@37@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                k@37@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
            (height%precondition $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@36@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))))
        (or
          (not
            (and
              (>= j@36@01 0)
              (and
                (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@37@01 Int)) (!
                  (and
                    (>= k@37@01 0)
                    (and
                      (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (>
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@36@01))
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@37@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@37@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
          (and
            (>= j@36@01 0)
            (and
              (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
              (forall ((k@37@01 Int)) (!
                (and
                  (>= k@37@01 0)
                  (and
                    (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (>
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@36@01))
                      (height $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@37@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@37@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
      :pattern ((height%limited $Snap.unit (Seq_index
        (as Seq_empty  Seq<Tree>)
        j@36@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|)))))
(assert (or
  (forall ((k@35@01 Int)) (!
    (and
      (>= k@35@01 0)
      (and
        (< k@35@01 (Seq_length current@11@01))
        (>
          (height $Snap.unit (Seq_index current@11@01 i@34@01))
          (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
    :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
  (not
    (forall ((k@35@01 Int)) (!
      (and
        (>= k@35@01 0)
        (and
          (< k@35@01 (Seq_length current@11@01))
          (>
            (height $Snap.unit (Seq_index current@11@01 i@34@01))
            (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@34@01 (Seq_length current@11@01))
  (and
    (< i@34@01 (Seq_length current@11@01))
    (forall ((k@35@01 Int)) (!
      (and
        (=>
          (>= k@35@01 0)
          (and
            (>= k@35@01 0)
            (=>
              (< k@35@01 (Seq_length current@11@01))
              (and
                (< k@35@01 (Seq_length current@11@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 k@35@01))))
            (or
              (< k@35@01 (Seq_length current@11@01))
              (not (< k@35@01 (Seq_length current@11@01))))))
        (or (>= k@35@01 0) (not (>= k@35@01 0))))
      :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
    (=>
      (forall ((k@35@01 Int)) (!
        (and
          (>= k@35@01 0)
          (and
            (< k@35@01 (Seq_length current@11@01))
            (>
              (height $Snap.unit (Seq_index current@11@01 i@34@01))
              (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (and
        (forall ((k@35@01 Int)) (!
          (and
            (>= k@35@01 0)
            (and
              (< k@35@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@34@01))
                (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@36@01 Int)) (!
          (and
            (=>
              (>= j@36@01 0)
              (and
                (>= j@36@01 0)
                (=>
                  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (and
                    (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@37@01 Int)) (!
                      (and
                        (=>
                          (>= k@37@01 0)
                          (and
                            (>= k@37@01 0)
                            (=>
                              (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (and
                                (<
                                  k@37@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (height%precondition $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@36@01))
                                (height%precondition $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@37@01))))
                            (or
                              (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (not
                                (<
                                  k@37@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))))))
                        (or (>= k@37@01 0) (not (>= k@37@01 0))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@37@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                (or
                  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (not (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
            (or (>= j@36@01 0) (not (>= j@36@01 0)))
            (=>
              (and
                (>= j@36@01 0)
                (and
                  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@37@01 Int)) (!
                    (and
                      (>= k@37@01 0)
                      (and
                        (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@36@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@37@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@37@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (>= j@36@01 0)
                (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                (forall ((k@37@01 Int)) (!
                  (and
                    (>= k@37@01 0)
                    (and
                      (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (>
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@36@01))
                        (height $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@37@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@37@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@36@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))))
            (or
              (not
                (and
                  (>= j@36@01 0)
                  (and
                    (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@37@01 Int)) (!
                      (and
                        (>= k@37@01 0)
                        (and
                          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@36@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@37@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@37@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
              (and
                (>= j@36@01 0)
                (and
                  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@37@01 Int)) (!
                    (and
                      (>= k@37@01 0)
                      (and
                        (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@36@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@37@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@37@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            j@36@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
    (or
      (forall ((k@35@01 Int)) (!
        (and
          (>= k@35@01 0)
          (and
            (< k@35@01 (Seq_length current@11@01))
            (>
              (height $Snap.unit (Seq_index current@11@01 i@34@01))
              (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (not
        (forall ((k@35@01 Int)) (!
          (and
            (>= k@35@01 0)
            (and
              (< k@35@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@34@01))
                (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|)))))))
(assert (or
  (< i@34@01 (Seq_length current@11@01))
  (not (< i@34@01 (Seq_length current@11@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@34@01 0)
  (and
    (>= i@34@01 0)
    (=>
      (< i@34@01 (Seq_length current@11@01))
      (and
        (< i@34@01 (Seq_length current@11@01))
        (forall ((k@35@01 Int)) (!
          (and
            (=>
              (>= k@35@01 0)
              (and
                (>= k@35@01 0)
                (=>
                  (< k@35@01 (Seq_length current@11@01))
                  (and
                    (< k@35@01 (Seq_length current@11@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      i@34@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      k@35@01))))
                (or
                  (< k@35@01 (Seq_length current@11@01))
                  (not (< k@35@01 (Seq_length current@11@01))))))
            (or (>= k@35@01 0) (not (>= k@35@01 0))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
        (=>
          (forall ((k@35@01 Int)) (!
            (and
              (>= k@35@01 0)
              (and
                (< k@35@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@34@01))
                  (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@35@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (and
            (forall ((k@35@01 Int)) (!
              (and
                (>= k@35@01 0)
                (and
                  (< k@35@01 (Seq_length current@11@01))
                  (>
                    (height $Snap.unit (Seq_index current@11@01 i@34@01))
                    (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@35@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
            (forall ((j@36@01 Int)) (!
              (and
                (=>
                  (>= j@36@01 0)
                  (and
                    (>= j@36@01 0)
                    (=>
                      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (and
                        (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@37@01 Int)) (!
                          (and
                            (=>
                              (>= k@37@01 0)
                              (and
                                (>= k@37@01 0)
                                (=>
                                  (<
                                    k@37@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (and
                                    (<
                                      k@37@01
                                      (Seq_length (as Seq_empty  Seq<Tree>)))
                                    (height%precondition $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      j@36@01))
                                    (height%precondition $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      k@37@01))))
                                (or
                                  (<
                                    k@37@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (not
                                    (<
                                      k@37@01
                                      (Seq_length (as Seq_empty  Seq<Tree>)))))))
                            (or (>= k@37@01 0) (not (>= k@37@01 0))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@37@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                    (or
                      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (not (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                (or (>= j@36@01 0) (not (>= j@36@01 0)))
                (=>
                  (and
                    (>= j@36@01 0)
                    (and
                      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (forall ((k@37@01 Int)) (!
                        (and
                          (>= k@37@01 0)
                          (and
                            (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (>
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                j@36@01))
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@37@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@37@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                  (and
                    (>= j@36@01 0)
                    (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@37@01 Int)) (!
                      (and
                        (>= k@37@01 0)
                        (and
                          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@36@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@37@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@37@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@36@01))
                    (height%precondition $Snap.unit (Seq_index
                      current@11@01
                      i@34@01))))
                (or
                  (not
                    (and
                      (>= j@36@01 0)
                      (and
                        (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@37@01 Int)) (!
                          (and
                            (>= k@37@01 0)
                            (and
                              (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (>
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@36@01))
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@37@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@37@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                  (and
                    (>= j@36@01 0)
                    (and
                      (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                      (forall ((k@37@01 Int)) (!
                        (and
                          (>= k@37@01 0)
                          (and
                            (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (>
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                j@36@01))
                              (height $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@37@01)))))
                        :pattern ((height%limited $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          k@37@01)))
                        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
              :pattern ((height%limited $Snap.unit (Seq_index
                (as Seq_empty  Seq<Tree>)
                j@36@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
        (or
          (forall ((k@35@01 Int)) (!
            (and
              (>= k@35@01 0)
              (and
                (< k@35@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@34@01))
                  (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@35@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (not
            (forall ((k@35@01 Int)) (!
              (and
                (>= k@35@01 0)
                (and
                  (< k@35@01 (Seq_length current@11@01))
                  (>
                    (height $Snap.unit (Seq_index current@11@01 i@34@01))
                    (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@35@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
    (or
      (< i@34@01 (Seq_length current@11@01))
      (not (< i@34@01 (Seq_length current@11@01)))))))
(assert (or (>= i@34@01 0) (not (>= i@34@01 0))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@34@01 Int)) (!
  (and
    (=>
      (>= i@34@01 0)
      (and
        (>= i@34@01 0)
        (=>
          (< i@34@01 (Seq_length current@11@01))
          (and
            (< i@34@01 (Seq_length current@11@01))
            (forall ((k@35@01 Int)) (!
              (and
                (=>
                  (>= k@35@01 0)
                  (and
                    (>= k@35@01 0)
                    (=>
                      (< k@35@01 (Seq_length current@11@01))
                      (and
                        (< k@35@01 (Seq_length current@11@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          i@34@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          k@35@01))))
                    (or
                      (< k@35@01 (Seq_length current@11@01))
                      (not (< k@35@01 (Seq_length current@11@01))))))
                (or (>= k@35@01 0) (not (>= k@35@01 0))))
              :pattern ((height%limited $Snap.unit (Seq_index
                current@11@01
                k@35@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52-aux|))
            (=>
              (forall ((k@35@01 Int)) (!
                (and
                  (>= k@35@01 0)
                  (and
                    (< k@35@01 (Seq_length current@11@01))
                    (>
                      (height $Snap.unit (Seq_index current@11@01 i@34@01))
                      (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@11@01
                  k@35@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (and
                (forall ((k@35@01 Int)) (!
                  (and
                    (>= k@35@01 0)
                    (and
                      (< k@35@01 (Seq_length current@11@01))
                      (>
                        (height $Snap.unit (Seq_index current@11@01 i@34@01))
                        (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@11@01
                    k@35@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
                (forall ((j@36@01 Int)) (!
                  (and
                    (=>
                      (>= j@36@01 0)
                      (and
                        (>= j@36@01 0)
                        (=>
                          (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (and
                            (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (forall ((k@37@01 Int)) (!
                              (and
                                (=>
                                  (>= k@37@01 0)
                                  (and
                                    (>= k@37@01 0)
                                    (=>
                                      (<
                                        k@37@01
                                        (Seq_length (as Seq_empty  Seq<Tree>)))
                                      (and
                                        (<
                                          k@37@01
                                          (Seq_length (as Seq_empty  Seq<Tree>)))
                                        (height%precondition $Snap.unit (Seq_index
                                          (as Seq_empty  Seq<Tree>)
                                          j@36@01))
                                        (height%precondition $Snap.unit (Seq_index
                                          (as Seq_empty  Seq<Tree>)
                                          k@37@01))))
                                    (or
                                      (<
                                        k@37@01
                                        (Seq_length (as Seq_empty  Seq<Tree>)))
                                      (not
                                        (<
                                          k@37@01
                                          (Seq_length (as Seq_empty  Seq<Tree>)))))))
                                (or (>= k@37@01 0) (not (>= k@37@01 0))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@37@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46-aux|))))
                        (or
                          (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (not
                            (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))))))
                    (or (>= j@36@01 0) (not (>= j@36@01 0)))
                    (=>
                      (and
                        (>= j@36@01 0)
                        (and
                          (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (forall ((k@37@01 Int)) (!
                            (and
                              (>= k@37@01 0)
                              (and
                                (<
                                  k@37@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (>
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    j@36@01))
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    k@37@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@37@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                      (and
                        (>= j@36@01 0)
                        (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (forall ((k@37@01 Int)) (!
                          (and
                            (>= k@37@01 0)
                            (and
                              (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                              (>
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  j@36@01))
                                (height $Snap.unit (Seq_index
                                  (as Seq_empty  Seq<Tree>)
                                  k@37@01)))))
                          :pattern ((height%limited $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@37@01)))
                          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))
                        (height%precondition $Snap.unit (Seq_index
                          (as Seq_empty  Seq<Tree>)
                          j@36@01))
                        (height%precondition $Snap.unit (Seq_index
                          current@11@01
                          i@34@01))))
                    (or
                      (not
                        (and
                          (>= j@36@01 0)
                          (and
                            (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                            (forall ((k@37@01 Int)) (!
                              (and
                                (>= k@37@01 0)
                                (and
                                  (<
                                    k@37@01
                                    (Seq_length (as Seq_empty  Seq<Tree>)))
                                  (>
                                    (height $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      j@36@01))
                                    (height $Snap.unit (Seq_index
                                      (as Seq_empty  Seq<Tree>)
                                      k@37@01)))))
                              :pattern ((height%limited $Snap.unit (Seq_index
                                (as Seq_empty  Seq<Tree>)
                                k@37@01)))
                              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))))
                      (and
                        (>= j@36@01 0)
                        (and
                          (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (forall ((k@37@01 Int)) (!
                            (and
                              (>= k@37@01 0)
                              (and
                                (<
                                  k@37@01
                                  (Seq_length (as Seq_empty  Seq<Tree>)))
                                (>
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    j@36@01))
                                  (height $Snap.unit (Seq_index
                                    (as Seq_empty  Seq<Tree>)
                                    k@37@01)))))
                            :pattern ((height%limited $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@37@01)))
                            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@36@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60-aux|))))
            (or
              (forall ((k@35@01 Int)) (!
                (and
                  (>= k@35@01 0)
                  (and
                    (< k@35@01 (Seq_length current@11@01))
                    (>
                      (height $Snap.unit (Seq_index current@11@01 i@34@01))
                      (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  current@11@01
                  k@35@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
              (not
                (forall ((k@35@01 Int)) (!
                  (and
                    (>= k@35@01 0)
                    (and
                      (< k@35@01 (Seq_length current@11@01))
                      (>
                        (height $Snap.unit (Seq_index current@11@01 i@34@01))
                        (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    current@11@01
                    k@35@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))))))
        (or
          (< i@34@01 (Seq_length current@11@01))
          (not (< i@34@01 (Seq_length current@11@01))))))
    (or (>= i@34@01 0) (not (>= i@34@01 0))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@34@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60-aux|)))
(assert (forall ((i@34@01 Int)) (!
  (=>
    (and (>= i@34@01 0) (< i@34@01 (Seq_length current@11@01)))
    (and
      (forall ((k@35@01 Int)) (!
        (=>
          (and (>= k@35@01 0) (< k@35@01 (Seq_length current@11@01)))
          (and
            (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))
            (height%precondition $Snap.unit (Seq_index current@11@01 k@35@01))))
        :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
      (=>
        (forall ((k@35@01 Int)) (!
          (and
            (>= k@35@01 0)
            (and
              (< k@35@01 (Seq_length current@11@01))
              (>
                (height $Snap.unit (Seq_index current@11@01 i@34@01))
                (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (forall ((j@36@01 Int)) (!
          (and
            (=>
              (and
                (>= j@36@01 0)
                (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>))))
              (forall ((k@37@01 Int)) (!
                (=>
                  (and
                    (>= k@37@01 0)
                    (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                  (and
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      j@36@01))
                    (height%precondition $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@37@01))))
                :pattern ((height%limited $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  k@37@01)))
                :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))
            (=>
              (and
                (>= j@36@01 0)
                (and
                  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@37@01 Int)) (!
                    (and
                      (>= k@37@01 0)
                      (and
                        (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@36@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@37@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@37@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (and
                (height%precondition $Snap.unit (Seq_index
                  (as Seq_empty  Seq<Tree>)
                  j@36@01))
                (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01)))))
          :pattern ((height%limited $Snap.unit (Seq_index
            (as Seq_empty  Seq<Tree>)
            j@36@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@34@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60_precondition|)))
(set-option :timeout 0)
(push) ; 8
(assert (not (forall ((i@34@01 Int)) (!
  (=>
    (=>
      (and (>= i@34@01 0) (< i@34@01 (Seq_length current@11@01)))
      (and
        (forall ((k@35@01 Int)) (!
          (=>
            (and (>= k@35@01 0) (< k@35@01 (Seq_length current@11@01)))
            (and
              (height%precondition $Snap.unit (Seq_index current@11@01 i@34@01))
              (height%precondition $Snap.unit (Seq_index current@11@01 k@35@01))))
          :pattern ((height%limited $Snap.unit (Seq_index current@11@01 k@35@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
        (=>
          (forall ((k@35@01 Int)) (!
            (and
              (>= k@35@01 0)
              (and
                (< k@35@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@34@01))
                  (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@35@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (forall ((j@36@01 Int)) (!
            (and
              (=>
                (and
                  (>= j@36@01 0)
                  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                (forall ((k@37@01 Int)) (!
                  (=>
                    (and
                      (>= k@37@01 0)
                      (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>))))
                    (and
                      (height%precondition $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        j@36@01))
                      (height%precondition $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@37@01))))
                  :pattern ((height%limited $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    k@37@01)))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|)))
              (=>
                (and
                  (>= j@36@01 0)
                  (and
                    (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                    (forall ((k@37@01 Int)) (!
                      (and
                        (>= k@37@01 0)
                        (and
                          (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                          (>
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              j@36@01))
                            (height $Snap.unit (Seq_index
                              (as Seq_empty  Seq<Tree>)
                              k@37@01)))))
                      :pattern ((height%limited $Snap.unit (Seq_index
                        (as Seq_empty  Seq<Tree>)
                        k@37@01)))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
                (and
                  (height%precondition $Snap.unit (Seq_index
                    (as Seq_empty  Seq<Tree>)
                    j@36@01))
                  (height%precondition $Snap.unit (Seq_index
                    current@11@01
                    i@34@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@36@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|)))))
    (and
      (>= i@34@01 0)
      (and
        (< i@34@01 (Seq_length current@11@01))
        (and
          (forall ((k@35@01 Int)) (!
            (and
              (>= k@35@01 0)
              (and
                (< k@35@01 (Seq_length current@11@01))
                (>
                  (height $Snap.unit (Seq_index current@11@01 i@34@01))
                  (height $Snap.unit (Seq_index current@11@01 k@35@01)))))
            :pattern ((height%limited $Snap.unit (Seq_index
              current@11@01
              k@35@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@101@12@102@52|))
          (forall ((j@36@01 Int)) (!
            (=>
              (and
                (>= j@36@01 0)
                (and
                  (< j@36@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                  (forall ((k@37@01 Int)) (!
                    (and
                      (>= k@37@01 0)
                      (and
                        (< k@37@01 (Seq_length (as Seq_empty  Seq<Tree>)))
                        (>
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            j@36@01))
                          (height $Snap.unit (Seq_index
                            (as Seq_empty  Seq<Tree>)
                            k@37@01)))))
                    :pattern ((height%limited $Snap.unit (Seq_index
                      (as Seq_empty  Seq<Tree>)
                      k@37@01)))
                    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@104@12@105@46|))))
              (=
                (height $Snap.unit (Seq_index (as Seq_empty  Seq<Tree>) j@36@01))
                (- (height $Snap.unit (Seq_index current@11@01 i@34@01)) 1)))
            :pattern ((height%limited $Snap.unit (Seq_index
              (as Seq_empty  Seq<Tree>)
              j@36@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@103@11@106@60|))))))
  :pattern ((height%limited $Snap.unit (Seq_index current@11@01 i@34@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0560b.vpr@100@19@106@60|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
