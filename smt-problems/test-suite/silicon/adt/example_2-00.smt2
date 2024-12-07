(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:39:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/example_2.vpr
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
(declare-fun get_Tree_v<Int> (Tree) Int)
(declare-fun get_Tree_left<Tree> (Tree) Tree)
(declare-fun get_Tree_right<Tree> (Tree) Tree)
(declare-fun Tree_tag<Int> (Tree) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun children ($Snap Tree) Seq<Tree>)
(declare-fun children%limited ($Snap Tree) Seq<Tree>)
(declare-fun children%stateless (Tree) Bool)
(declare-fun children%precondition ($Snap Tree) Bool)
(declare-fun children_seq ($Snap Seq<Tree>) Seq<Tree>)
(declare-fun children_seq%limited ($Snap Seq<Tree>) Seq<Tree>)
(declare-fun children_seq%stateless (Seq<Tree>) Bool)
(declare-fun children_seq%precondition ($Snap Seq<Tree>) Bool)
(declare-fun height_recursive ($Snap Seq<Tree>) Int)
(declare-fun height_recursive%limited ($Snap Seq<Tree>) Int)
(declare-fun height_recursive%stateless (Seq<Tree>) Bool)
(declare-fun height_recursive%precondition ($Snap Seq<Tree>) Bool)
(declare-fun height ($Snap Tree) Int)
(declare-fun height%limited ($Snap Tree) Int)
(declare-fun height%stateless (Tree) Bool)
(declare-fun height%precondition ($Snap Tree) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
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
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (= (children%limited s@$ t@0@00) (children s@$ t@0@00))
  :pattern ((children s@$ t@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (children%stateless t@0@00)
  :pattern ((children%limited s@$ t@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (=>
    (children%precondition s@$ t@0@00)
    (=
      (children s@$ t@0@00)
      (ite
        (or
          (= (Tree_tag<Int> t@0@00) 0)
          (and
            (= (Tree_tag<Int> t@0@00) 1)
            (and
              (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
              (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0))))
        (as Seq_empty  Seq<Tree>)
        (ite
          (and
            (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
            (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1))
          (Seq_append
            (Seq_singleton (get_Tree_right<Tree> t@0@00))
            (Seq_singleton (get_Tree_left<Tree> t@0@00)))
          (ite
            (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
            (Seq_singleton (get_Tree_left<Tree> t@0@00))
            (Seq_singleton (get_Tree_right<Tree> t@0@00)))))))
  :pattern ((children s@$ t@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  true
  :pattern ((children s@$ t@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (ts@2@00 Seq<Tree>)) (!
  (= (children_seq%limited s@$ ts@2@00) (children_seq s@$ ts@2@00))
  :pattern ((children_seq s@$ ts@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (ts@2@00 Seq<Tree>)) (!
  (children_seq%stateless ts@2@00)
  :pattern ((children_seq%limited s@$ ts@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (ts@2@00 Seq<Tree>)) (!
  (=>
    (children_seq%precondition s@$ ts@2@00)
    (=
      (children_seq s@$ ts@2@00)
      (ite
        (= (Seq_length ts@2@00) 0)
        (as Seq_empty  Seq<Tree>)
        (ite
          (= (Seq_length ts@2@00) 1)
          (children $Snap.unit (Seq_index ts@2@00 0))
          (Seq_append
            (children_seq%limited $Snap.unit (Seq_drop ts@2@00 1))
            (children $Snap.unit (Seq_index ts@2@00 0)))))))
  :pattern ((children_seq s@$ ts@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (ts@2@00 Seq<Tree>)) (!
  (=>
    (children_seq%precondition s@$ ts@2@00)
    (ite
      (= (Seq_length ts@2@00) 0)
      true
      (ite
        (= (Seq_length ts@2@00) 1)
        (children%precondition $Snap.unit (Seq_index ts@2@00 0))
        (and
          (children_seq%precondition $Snap.unit (Seq_drop ts@2@00 1))
          (children%precondition $Snap.unit (Seq_index ts@2@00 0))))))
  :pattern ((children_seq s@$ ts@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (ts@4@00 Seq<Tree>)) (!
  (= (height_recursive%limited s@$ ts@4@00) (height_recursive s@$ ts@4@00))
  :pattern ((height_recursive s@$ ts@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (ts@4@00 Seq<Tree>)) (!
  (height_recursive%stateless ts@4@00)
  :pattern ((height_recursive%limited s@$ ts@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (ts@4@00 Seq<Tree>)) (!
  (=>
    (height_recursive%precondition s@$ ts@4@00)
    (=
      (height_recursive s@$ ts@4@00)
      (ite
        (= (Seq_length ts@4@00) 0)
        0
        (+
          1
          (height_recursive%limited $Snap.unit (children_seq $Snap.unit ts@4@00))))))
  :pattern ((height_recursive s@$ ts@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (ts@4@00 Seq<Tree>)) (!
  (=>
    (height_recursive%precondition s@$ ts@4@00)
    (ite
      (= (Seq_length ts@4@00) 0)
      true
      (and
        (children_seq%precondition $Snap.unit ts@4@00)
        (height_recursive%precondition $Snap.unit (children_seq $Snap.unit ts@4@00)))))
  :pattern ((height_recursive s@$ ts@4@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (= (height%limited s@$ t@6@00) (height s@$ t@6@00))
  :pattern ((height s@$ t@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (height%stateless t@6@00)
  :pattern ((height%limited s@$ t@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (=>
    (height%precondition s@$ t@6@00)
    (=
      (height s@$ t@6@00)
      (ite
        (= (Tree_tag<Int> t@6@00) 0)
        0
        (height_recursive $Snap.unit (Seq_singleton t@6@00)))))
  :pattern ((height s@$ t@6@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (=>
    (height%precondition s@$ t@6@00)
    (ite
      (= (Tree_tag<Int> t@6@00) 0)
      true
      (height_recursive%precondition $Snap.unit (Seq_singleton t@6@00))))
  :pattern ((height s@$ t@6@00))
  :qid |quant-u-15|)))
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
; [eval] height(t) == res
; [eval] height(t)
(push) ; 3
(assert (height%precondition $Snap.unit t@2@01))
(pop) ; 3
; Joined path conditions
(assert (height%precondition $Snap.unit t@2@01))
(assert (= (height $Snap.unit t@2@01) res@3@01))
(pop) ; 2
(push) ; 2
; [exec]
; var old_current: Seq[Tree]
(declare-const old_current@5@01 Seq<Tree>)
; [eval] Tree_tag(t) == 0
; [eval] Tree_tag(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> t@2@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> t@2@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | Tree_tag[Int](t@2@01) == 0 | live]
; [else-branch: 0 | Tree_tag[Int](t@2@01) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | Tree_tag[Int](t@2@01) == 0]
(assert (= (Tree_tag<Int> t@2@01) 0))
; [exec]
; res := 0
; [eval] height(t) == res
; [eval] height(t)
(push) ; 4
(assert (height%precondition $Snap.unit t@2@01))
(pop) ; 4
; Joined path conditions
(assert (height%precondition $Snap.unit t@2@01))
(push) ; 4
(assert (not (= (height $Snap.unit t@2@01) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (height $Snap.unit t@2@01) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | Tree_tag[Int](t@2@01) != 0]
(assert (not (= (Tree_tag<Int> t@2@01) 0)))
(pop) ; 3
; [eval] !(Tree_tag(t) == 0)
; [eval] Tree_tag(t) == 0
; [eval] Tree_tag(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> t@2@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> t@2@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | Tree_tag[Int](t@2@01) != 0 | live]
; [else-branch: 1 | Tree_tag[Int](t@2@01) == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | Tree_tag[Int](t@2@01) != 0]
(assert (not (= (Tree_tag<Int> t@2@01) 0)))
; [exec]
; var current: Seq[Tree]
(declare-const current@6@01 Seq<Tree>)
; [exec]
; var next: Seq[Tree]
(declare-const next@7@01 Seq<Tree>)
; [exec]
; current := Seq(t)
; [eval] Seq(t)
(assert (= (Seq_length (Seq_singleton t@2@01)) 1))
(declare-const current@8@01 Seq<Tree>)
(assert (= current@8@01 (Seq_singleton t@2@01)))
; [exec]
; next := Seq[Tree]()
; [eval] Seq[Tree]()
; [exec]
; res := 0
(declare-const res@9@01 Int)
(declare-const next@10@01 Seq<Tree>)
(declare-const node@11@01 Tree)
(declare-const current@12@01 Seq<Tree>)
(push) ; 4
; Loop head block: Check well-definedness of invariant
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.first $t@13@01) $Snap.unit))
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@14@01 Int)
(push) ; 5
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 6
; [then-branch: 2 | !(i@14@01 >= 0) | live]
; [else-branch: 2 | i@14@01 >= 0 | live]
(push) ; 7
; [then-branch: 2 | !(i@14@01 >= 0)]
(assert (not (>= i@14@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | i@14@01 >= 0]
(assert (>= i@14@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (>= i@14@01 0) (not (>= i@14@01 0))))
(push) ; 6
; [then-branch: 3 | i@14@01 >= 0 && i@14@01 < |current@12@01| | live]
; [else-branch: 3 | !(i@14@01 >= 0 && i@14@01 < |current@12@01|) | live]
(push) ; 7
; [then-branch: 3 | i@14@01 >= 0 && i@14@01 < |current@12@01|]
(assert (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 7
(push) ; 7
; [else-branch: 3 | !(i@14@01 >= 0 && i@14@01 < |current@12@01|)]
(assert (not (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01))))
  (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@01 Int)) (!
  (and
    (or (>= i@14@01 0) (not (>= i@14@01 0)))
    (or
      (not (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01))))
      (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@12@01 i@14@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79-aux|)))
(assert (forall ((i@14@01 Int)) (!
  (=>
    (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01)))
    (= (Tree_tag<Int> (Seq_index current@12@01 i@14@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@12@01 i@14@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79|)))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; [eval] height(t) == res + height_recursive(current)
; [eval] height(t)
(push) ; 5
(assert (height%precondition $Snap.unit t@2@01))
(pop) ; 5
; Joined path conditions
(assert (height%precondition $Snap.unit t@2@01))
; [eval] res + height_recursive(current)
; [eval] height_recursive(current)
(push) ; 5
(assert (height_recursive%precondition $Snap.unit current@12@01))
(pop) ; 5
; Joined path conditions
(assert (height_recursive%precondition $Snap.unit current@12@01))
(assert (=
  (height $Snap.unit t@2@01)
  (+ res@9@01 (height_recursive $Snap.unit current@12@01))))
(pop) ; 4
(push) ; 4
; Loop head block: Establish invariant
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@15@01 Int)
(push) ; 5
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 6
; [then-branch: 4 | !(i@15@01 >= 0) | live]
; [else-branch: 4 | i@15@01 >= 0 | live]
(push) ; 7
; [then-branch: 4 | !(i@15@01 >= 0)]
(assert (not (>= i@15@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | i@15@01 >= 0]
(assert (>= i@15@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (>= i@15@01 0) (not (>= i@15@01 0))))
(push) ; 6
; [then-branch: 5 | i@15@01 >= 0 && i@15@01 < |current@8@01| | live]
; [else-branch: 5 | !(i@15@01 >= 0 && i@15@01 < |current@8@01|) | live]
(push) ; 7
; [then-branch: 5 | i@15@01 >= 0 && i@15@01 < |current@8@01|]
(assert (and (>= i@15@01 0) (< i@15@01 (Seq_length current@8@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 7
(push) ; 7
; [else-branch: 5 | !(i@15@01 >= 0 && i@15@01 < |current@8@01|)]
(assert (not (and (>= i@15@01 0) (< i@15@01 (Seq_length current@8@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@15@01 0) (< i@15@01 (Seq_length current@8@01))))
  (and (>= i@15@01 0) (< i@15@01 (Seq_length current@8@01)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@01 Int)) (!
  (and
    (or (>= i@15@01 0) (not (>= i@15@01 0)))
    (or
      (not (and (>= i@15@01 0) (< i@15@01 (Seq_length current@8@01))))
      (and (>= i@15@01 0) (< i@15@01 (Seq_length current@8@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@8@01 i@15@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79-aux|)))
(push) ; 5
(assert (not (forall ((i@15@01 Int)) (!
  (=>
    (and (>= i@15@01 0) (< i@15@01 (Seq_length current@8@01)))
    (= (Tree_tag<Int> (Seq_index current@8@01 i@15@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@8@01 i@15@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (>= i@15@01 0) (< i@15@01 (Seq_length current@8@01)))
    (= (Tree_tag<Int> (Seq_index current@8@01 i@15@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@8@01 i@15@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79|)))
; [eval] height(t) == res + height_recursive(current)
; [eval] height(t)
(push) ; 5
(assert (height%precondition $Snap.unit t@2@01))
(pop) ; 5
; Joined path conditions
(assert (height%precondition $Snap.unit t@2@01))
; [eval] res + height_recursive(current)
; [eval] height_recursive(current)
(push) ; 5
(assert (height_recursive%precondition $Snap.unit current@8@01))
(pop) ; 5
; Joined path conditions
(assert (height_recursive%precondition $Snap.unit current@8@01))
(push) ; 5
(assert (not (= (height $Snap.unit t@2@01) (height_recursive $Snap.unit current@8@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= (height $Snap.unit t@2@01) (height_recursive $Snap.unit current@8@01)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 5
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.first $t@13@01) $Snap.unit))
(assert (forall ((i@14@01 Int)) (!
  (and
    (or (>= i@14@01 0) (not (>= i@14@01 0)))
    (or
      (not (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01))))
      (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@12@01 i@14@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79-aux|)))
(assert (forall ((i@14@01 Int)) (!
  (=>
    (and (>= i@14@01 0) (< i@14@01 (Seq_length current@12@01)))
    (= (Tree_tag<Int> (Seq_index current@12@01 i@14@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@12@01 i@14@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79|)))
(assert (= ($Snap.second $t@13@01) $Snap.unit))
(assert (height_recursive%precondition $Snap.unit current@12@01))
(assert (=
  (height $Snap.unit t@2@01)
  (+ res@9@01 (height_recursive $Snap.unit current@12@01))))
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
(assert (not (not (> (Seq_length current@12@01) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (> (Seq_length current@12@01) 0)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | |current@12@01| > 0 | live]
; [else-branch: 6 | !(|current@12@01| > 0) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | |current@12@01| > 0]
(assert (> (Seq_length current@12@01) 0))
; [exec]
; res := res + 1
; [eval] res + 1
(declare-const res@16@01 Int)
(assert (= res@16@01 (+ res@9@01 1)))
; [exec]
; next := Seq[Tree]()
; [eval] Seq[Tree]()
; [exec]
; inhale old_current == current
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] old_current == current
(assert (Seq_equal old_current@5@01 current@12@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(declare-const node@18@01 Tree)
(declare-const current@19@01 Seq<Tree>)
(declare-const next@20@01 Seq<Tree>)
(set-option :timeout 0)
(push) ; 7
; Loop head block: Check well-definedness of invariant
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@22@01 Int)
(push) ; 8
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 9
; [then-branch: 7 | !(i@22@01 >= 0) | live]
; [else-branch: 7 | i@22@01 >= 0 | live]
(push) ; 10
; [then-branch: 7 | !(i@22@01 >= 0)]
(assert (not (>= i@22@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 7 | i@22@01 >= 0]
(assert (>= i@22@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (>= i@22@01 0) (not (>= i@22@01 0))))
(push) ; 9
; [then-branch: 8 | i@22@01 >= 0 && i@22@01 < |current@19@01| | live]
; [else-branch: 8 | !(i@22@01 >= 0 && i@22@01 < |current@19@01|) | live]
(push) ; 10
; [then-branch: 8 | i@22@01 >= 0 && i@22@01 < |current@19@01|]
(assert (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 10
(push) ; 10
; [else-branch: 8 | !(i@22@01 >= 0 && i@22@01 < |current@19@01|)]
(assert (not (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01))))
  (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@22@01 Int)) (!
  (and
    (or (>= i@22@01 0) (not (>= i@22@01 0)))
    (or
      (not (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01))))
      (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@19@01 i@22@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81-aux|)))
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01)))
    (= (Tree_tag<Int> (Seq_index current@19@01 i@22@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@19@01 i@22@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.first ($Snap.second $t@21@01)) $Snap.unit))
; [eval] (forall i: Int :: { Tree_tag(next[i]) } i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1)
(declare-const i@23@01 Int)
(push) ; 8
; [eval] i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1
; [eval] i >= 0 && i < |next|
; [eval] i >= 0
(push) ; 9
; [then-branch: 9 | !(i@23@01 >= 0) | live]
; [else-branch: 9 | i@23@01 >= 0 | live]
(push) ; 10
; [then-branch: 9 | !(i@23@01 >= 0)]
(assert (not (>= i@23@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | i@23@01 >= 0]
(assert (>= i@23@01 0))
; [eval] i < |next|
; [eval] |next|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (>= i@23@01 0) (not (>= i@23@01 0))))
(push) ; 9
; [then-branch: 10 | i@23@01 >= 0 && i@23@01 < |next@20@01| | live]
; [else-branch: 10 | !(i@23@01 >= 0 && i@23@01 < |next@20@01|) | live]
(push) ; 10
; [then-branch: 10 | i@23@01 >= 0 && i@23@01 < |next@20@01|]
(assert (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01))))
; [eval] Tree_tag(next[i]) == 1
; [eval] Tree_tag(next[i])
; [eval] next[i]
(pop) ; 10
(push) ; 10
; [else-branch: 10 | !(i@23@01 >= 0 && i@23@01 < |next@20@01|)]
(assert (not (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01))))
  (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@23@01 Int)) (!
  (and
    (or (>= i@23@01 0) (not (>= i@23@01 0)))
    (or
      (not (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01))))
      (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01)))))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@23@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75-aux|)))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01)))
    (= (Tree_tag<Int> (Seq_index next@20@01 i@23@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@23@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|)))
(assert (= ($Snap.second ($Snap.second $t@21@01)) $Snap.unit))
; [eval] children_seq(old_current) == children_seq(current) ++ next
; [eval] children_seq(old_current)
(push) ; 8
(assert (children_seq%precondition $Snap.unit old_current@5@01))
(pop) ; 8
; Joined path conditions
(assert (children_seq%precondition $Snap.unit old_current@5@01))
; [eval] children_seq(current) ++ next
; [eval] children_seq(current)
(push) ; 8
(assert (children_seq%precondition $Snap.unit current@19@01))
(pop) ; 8
; Joined path conditions
(assert (children_seq%precondition $Snap.unit current@19@01))
(assert (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@19@01) next@20@01)))
(pop) ; 7
(push) ; 7
; Loop head block: Establish invariant
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@24@01 Int)
(push) ; 8
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 9
; [then-branch: 11 | !(i@24@01 >= 0) | live]
; [else-branch: 11 | i@24@01 >= 0 | live]
(push) ; 10
; [then-branch: 11 | !(i@24@01 >= 0)]
(assert (not (>= i@24@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 11 | i@24@01 >= 0]
(assert (>= i@24@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (>= i@24@01 0) (not (>= i@24@01 0))))
(push) ; 9
; [then-branch: 12 | i@24@01 >= 0 && i@24@01 < |current@12@01| | live]
; [else-branch: 12 | !(i@24@01 >= 0 && i@24@01 < |current@12@01|) | live]
(push) ; 10
; [then-branch: 12 | i@24@01 >= 0 && i@24@01 < |current@12@01|]
(assert (and (>= i@24@01 0) (< i@24@01 (Seq_length current@12@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 10
(push) ; 10
; [else-branch: 12 | !(i@24@01 >= 0 && i@24@01 < |current@12@01|)]
(assert (not (and (>= i@24@01 0) (< i@24@01 (Seq_length current@12@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@24@01 0) (< i@24@01 (Seq_length current@12@01))))
  (and (>= i@24@01 0) (< i@24@01 (Seq_length current@12@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@24@01 Int)) (!
  (and
    (or (>= i@24@01 0) (not (>= i@24@01 0)))
    (or
      (not (and (>= i@24@01 0) (< i@24@01 (Seq_length current@12@01))))
      (and (>= i@24@01 0) (< i@24@01 (Seq_length current@12@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@12@01 i@24@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81-aux|)))
(push) ; 8
(assert (not (forall ((i@24@01 Int)) (!
  (=>
    (and (>= i@24@01 0) (< i@24@01 (Seq_length current@12@01)))
    (= (Tree_tag<Int> (Seq_index current@12@01 i@24@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@12@01 i@24@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and (>= i@24@01 0) (< i@24@01 (Seq_length current@12@01)))
    (= (Tree_tag<Int> (Seq_index current@12@01 i@24@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@12@01 i@24@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|)))
; [eval] (forall i: Int :: { Tree_tag(next[i]) } i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1)
(declare-const i@25@01 Int)
(push) ; 8
; [eval] i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1
; [eval] i >= 0 && i < |next|
; [eval] i >= 0
(push) ; 9
; [then-branch: 13 | !(i@25@01 >= 0) | live]
; [else-branch: 13 | i@25@01 >= 0 | live]
(push) ; 10
; [then-branch: 13 | !(i@25@01 >= 0)]
(assert (not (>= i@25@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 13 | i@25@01 >= 0]
(assert (>= i@25@01 0))
; [eval] i < |next|
; [eval] |next|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (>= i@25@01 0) (not (>= i@25@01 0))))
(push) ; 9
; [then-branch: 14 | i@25@01 >= 0 && i@25@01 < |Nil| | live]
; [else-branch: 14 | !(i@25@01 >= 0 && i@25@01 < |Nil|) | live]
(push) ; 10
; [then-branch: 14 | i@25@01 >= 0 && i@25@01 < |Nil|]
(assert (and (>= i@25@01 0) (< i@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
; [eval] Tree_tag(next[i]) == 1
; [eval] Tree_tag(next[i])
; [eval] next[i]
(pop) ; 10
(push) ; 10
; [else-branch: 14 | !(i@25@01 >= 0 && i@25@01 < |Nil|)]
(assert (not (and (>= i@25@01 0) (< i@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@25@01 0) (< i@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
  (and (>= i@25@01 0) (< i@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@25@01 Int)) (!
  (and
    (or (>= i@25@01 0) (not (>= i@25@01 0)))
    (or
      (not
        (and (>= i@25@01 0) (< i@25@01 (Seq_length (as Seq_empty  Seq<Tree>)))))
      (and (>= i@25@01 0) (< i@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))))
  :pattern ((Tree_tag<Int> (Seq_index (as Seq_empty  Seq<Tree>) i@25@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75-aux|)))
(push) ; 8
(assert (not (forall ((i@25@01 Int)) (!
  (=>
    (and (>= i@25@01 0) (< i@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))
    (= (Tree_tag<Int> (Seq_index (as Seq_empty  Seq<Tree>) i@25@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index (as Seq_empty  Seq<Tree>) i@25@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (>= i@25@01 0) (< i@25@01 (Seq_length (as Seq_empty  Seq<Tree>))))
    (= (Tree_tag<Int> (Seq_index (as Seq_empty  Seq<Tree>) i@25@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index (as Seq_empty  Seq<Tree>) i@25@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|)))
; [eval] children_seq(old_current) == children_seq(current) ++ next
; [eval] children_seq(old_current)
(push) ; 8
(assert (children_seq%precondition $Snap.unit old_current@5@01))
(pop) ; 8
; Joined path conditions
(assert (children_seq%precondition $Snap.unit old_current@5@01))
; [eval] children_seq(current) ++ next
; [eval] children_seq(current)
(push) ; 8
(assert (children_seq%precondition $Snap.unit current@12@01))
(pop) ; 8
; Joined path conditions
(assert (children_seq%precondition $Snap.unit current@12@01))
(push) ; 8
(assert (not (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@12@01) (as Seq_empty  Seq<Tree>)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@12@01) (as Seq_empty  Seq<Tree>))))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
(assert (forall ((i@22@01 Int)) (!
  (and
    (or (>= i@22@01 0) (not (>= i@22@01 0)))
    (or
      (not (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01))))
      (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@19@01 i@22@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81-aux|)))
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (>= i@22@01 0) (< i@22@01 (Seq_length current@19@01)))
    (= (Tree_tag<Int> (Seq_index current@19@01 i@22@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@19@01 i@22@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.first ($Snap.second $t@21@01)) $Snap.unit))
(assert (forall ((i@23@01 Int)) (!
  (and
    (or (>= i@23@01 0) (not (>= i@23@01 0)))
    (or
      (not (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01))))
      (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01)))))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@23@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75-aux|)))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (>= i@23@01 0) (< i@23@01 (Seq_length next@20@01)))
    (= (Tree_tag<Int> (Seq_index next@20@01 i@23@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@23@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|)))
(assert (= ($Snap.second ($Snap.second $t@21@01)) $Snap.unit))
(assert (children_seq%precondition $Snap.unit current@19@01))
(assert (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@19@01) next@20@01)))
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
; [eval] |current| > 0
; [eval] |current|
(pop) ; 9
(push) ; 9
; [eval] !(|current| > 0)
; [eval] |current| > 0
; [eval] |current|
(pop) ; 9
; Loop head block: Follow loop-internal edges
; [eval] |current| > 0
; [eval] |current|
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> (Seq_length current@19@01) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (> (Seq_length current@19@01) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | |current@19@01| > 0 | live]
; [else-branch: 15 | !(|current@19@01| > 0) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 15 | |current@19@01| > 0]
(assert (> (Seq_length current@19@01) 0))
; [exec]
; var node: Tree
(declare-const node@26@01 Tree)
; [exec]
; node := current[0]
; [eval] current[0]
(push) ; 10
(assert (not (< 0 (Seq_length current@19@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const node@27@01 Tree)
(assert (= node@27@01 (Seq_index current@19@01 0)))
; [exec]
; current := current[1..]
; [eval] current[1..]
(declare-const current@28@01 Seq<Tree>)
(assert (= current@28@01 (Seq_drop current@19@01 1)))
; [eval] Tree_tag(get_Tree_left(node)) == 1
; [eval] Tree_tag(get_Tree_left(node))
; [eval] get_Tree_left(node)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> (get_Tree_left<Tree> node@27@01)) 1))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> (get_Tree_left<Tree> node@27@01)) 1)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | Tree_tag[Int](get_Tree_left[Tree](node@27@01)) == 1 | live]
; [else-branch: 16 | Tree_tag[Int](get_Tree_left[Tree](node@27@01)) != 1 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 16 | Tree_tag[Int](get_Tree_left[Tree](node@27@01)) == 1]
(assert (= (Tree_tag<Int> (get_Tree_left<Tree> node@27@01)) 1))
; [exec]
; next := Seq(get_Tree_left(node)) ++ next
; [eval] Seq(get_Tree_left(node)) ++ next
; [eval] Seq(get_Tree_left(node))
; [eval] get_Tree_left(node)
(assert (= (Seq_length (Seq_singleton (get_Tree_left<Tree> node@27@01))) 1))
(declare-const next@29@01 Seq<Tree>)
(assert (=
  next@29@01
  (Seq_append (Seq_singleton (get_Tree_left<Tree> node@27@01)) next@20@01)))
; [eval] Tree_tag(get_Tree_right(node)) == 1
; [eval] Tree_tag(get_Tree_right(node))
; [eval] get_Tree_right(node)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) == 1 | live]
; [else-branch: 17 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) != 1 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 17 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) == 1]
(assert (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1))
; [exec]
; next := Seq(get_Tree_right(node)) ++ next
; [eval] Seq(get_Tree_right(node)) ++ next
; [eval] Seq(get_Tree_right(node))
; [eval] get_Tree_right(node)
(assert (= (Seq_length (Seq_singleton (get_Tree_right<Tree> node@27@01))) 1))
(declare-const next@30@01 Seq<Tree>)
(assert (=
  next@30@01
  (Seq_append (Seq_singleton (get_Tree_right<Tree> node@27@01)) next@29@01)))
; Loop head block: Re-establish invariant
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@31@01 Int)
(push) ; 12
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 13
; [then-branch: 18 | !(i@31@01 >= 0) | live]
; [else-branch: 18 | i@31@01 >= 0 | live]
(push) ; 14
; [then-branch: 18 | !(i@31@01 >= 0)]
(assert (not (>= i@31@01 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 18 | i@31@01 >= 0]
(assert (>= i@31@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (>= i@31@01 0) (not (>= i@31@01 0))))
(push) ; 13
; [then-branch: 19 | i@31@01 >= 0 && i@31@01 < |current@28@01| | live]
; [else-branch: 19 | !(i@31@01 >= 0 && i@31@01 < |current@28@01|) | live]
(push) ; 14
; [then-branch: 19 | i@31@01 >= 0 && i@31@01 < |current@28@01|]
(assert (and (>= i@31@01 0) (< i@31@01 (Seq_length current@28@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 14
(push) ; 14
; [else-branch: 19 | !(i@31@01 >= 0 && i@31@01 < |current@28@01|)]
(assert (not (and (>= i@31@01 0) (< i@31@01 (Seq_length current@28@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@31@01 0) (< i@31@01 (Seq_length current@28@01))))
  (and (>= i@31@01 0) (< i@31@01 (Seq_length current@28@01)))))
(pop) ; 12
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@31@01 Int)) (!
  (and
    (or (>= i@31@01 0) (not (>= i@31@01 0)))
    (or
      (not (and (>= i@31@01 0) (< i@31@01 (Seq_length current@28@01))))
      (and (>= i@31@01 0) (< i@31@01 (Seq_length current@28@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@31@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81-aux|)))
(push) ; 12
(assert (not (forall ((i@31@01 Int)) (!
  (=>
    (and (>= i@31@01 0) (< i@31@01 (Seq_length current@28@01)))
    (= (Tree_tag<Int> (Seq_index current@28@01 i@31@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@31@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@31@01 Int)) (!
  (=>
    (and (>= i@31@01 0) (< i@31@01 (Seq_length current@28@01)))
    (= (Tree_tag<Int> (Seq_index current@28@01 i@31@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@31@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|)))
; [eval] (forall i: Int :: { Tree_tag(next[i]) } i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1)
(declare-const i@32@01 Int)
(push) ; 12
; [eval] i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1
; [eval] i >= 0 && i < |next|
; [eval] i >= 0
(push) ; 13
; [then-branch: 20 | !(i@32@01 >= 0) | live]
; [else-branch: 20 | i@32@01 >= 0 | live]
(push) ; 14
; [then-branch: 20 | !(i@32@01 >= 0)]
(assert (not (>= i@32@01 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 20 | i@32@01 >= 0]
(assert (>= i@32@01 0))
; [eval] i < |next|
; [eval] |next|
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (>= i@32@01 0) (not (>= i@32@01 0))))
(push) ; 13
; [then-branch: 21 | i@32@01 >= 0 && i@32@01 < |next@30@01| | live]
; [else-branch: 21 | !(i@32@01 >= 0 && i@32@01 < |next@30@01|) | live]
(push) ; 14
; [then-branch: 21 | i@32@01 >= 0 && i@32@01 < |next@30@01|]
(assert (and (>= i@32@01 0) (< i@32@01 (Seq_length next@30@01))))
; [eval] Tree_tag(next[i]) == 1
; [eval] Tree_tag(next[i])
; [eval] next[i]
(pop) ; 14
(push) ; 14
; [else-branch: 21 | !(i@32@01 >= 0 && i@32@01 < |next@30@01|)]
(assert (not (and (>= i@32@01 0) (< i@32@01 (Seq_length next@30@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@32@01 0) (< i@32@01 (Seq_length next@30@01))))
  (and (>= i@32@01 0) (< i@32@01 (Seq_length next@30@01)))))
(pop) ; 12
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@32@01 Int)) (!
  (and
    (or (>= i@32@01 0) (not (>= i@32@01 0)))
    (or
      (not (and (>= i@32@01 0) (< i@32@01 (Seq_length next@30@01))))
      (and (>= i@32@01 0) (< i@32@01 (Seq_length next@30@01)))))
  :pattern ((Tree_tag<Int> (Seq_index next@30@01 i@32@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75-aux|)))
(push) ; 12
(assert (not (forall ((i@32@01 Int)) (!
  (=>
    (and (>= i@32@01 0) (< i@32@01 (Seq_length next@30@01)))
    (= (Tree_tag<Int> (Seq_index next@30@01 i@32@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@30@01 i@32@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (>= i@32@01 0) (< i@32@01 (Seq_length next@30@01)))
    (= (Tree_tag<Int> (Seq_index next@30@01 i@32@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@30@01 i@32@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|)))
; [eval] children_seq(old_current) == children_seq(current) ++ next
; [eval] children_seq(old_current)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] children_seq(current) ++ next
; [eval] children_seq(current)
(push) ; 12
(assert (children_seq%precondition $Snap.unit current@28@01))
(pop) ; 12
; Joined path conditions
(assert (children_seq%precondition $Snap.unit current@28@01))
(push) ; 12
(assert (not (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@28@01) next@30@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@28@01) next@30@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 17 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) != 1]
(assert (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1)))
(pop) ; 11
; [eval] !(Tree_tag(get_Tree_right(node)) == 1)
; [eval] Tree_tag(get_Tree_right(node)) == 1
; [eval] Tree_tag(get_Tree_right(node))
; [eval] get_Tree_right(node)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) != 1 | live]
; [else-branch: 22 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) == 1 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 22 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) != 1]
(assert (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1)))
; Loop head block: Re-establish invariant
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@33@01 Int)
(push) ; 12
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 13
; [then-branch: 23 | !(i@33@01 >= 0) | live]
; [else-branch: 23 | i@33@01 >= 0 | live]
(push) ; 14
; [then-branch: 23 | !(i@33@01 >= 0)]
(assert (not (>= i@33@01 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 23 | i@33@01 >= 0]
(assert (>= i@33@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (>= i@33@01 0) (not (>= i@33@01 0))))
(push) ; 13
; [then-branch: 24 | i@33@01 >= 0 && i@33@01 < |current@28@01| | live]
; [else-branch: 24 | !(i@33@01 >= 0 && i@33@01 < |current@28@01|) | live]
(push) ; 14
; [then-branch: 24 | i@33@01 >= 0 && i@33@01 < |current@28@01|]
(assert (and (>= i@33@01 0) (< i@33@01 (Seq_length current@28@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 14
(push) ; 14
; [else-branch: 24 | !(i@33@01 >= 0 && i@33@01 < |current@28@01|)]
(assert (not (and (>= i@33@01 0) (< i@33@01 (Seq_length current@28@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@33@01 0) (< i@33@01 (Seq_length current@28@01))))
  (and (>= i@33@01 0) (< i@33@01 (Seq_length current@28@01)))))
(pop) ; 12
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@33@01 Int)) (!
  (and
    (or (>= i@33@01 0) (not (>= i@33@01 0)))
    (or
      (not (and (>= i@33@01 0) (< i@33@01 (Seq_length current@28@01))))
      (and (>= i@33@01 0) (< i@33@01 (Seq_length current@28@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@33@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81-aux|)))
(push) ; 12
(assert (not (forall ((i@33@01 Int)) (!
  (=>
    (and (>= i@33@01 0) (< i@33@01 (Seq_length current@28@01)))
    (= (Tree_tag<Int> (Seq_index current@28@01 i@33@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@33@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (>= i@33@01 0) (< i@33@01 (Seq_length current@28@01)))
    (= (Tree_tag<Int> (Seq_index current@28@01 i@33@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@33@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|)))
; [eval] (forall i: Int :: { Tree_tag(next[i]) } i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1)
(declare-const i@34@01 Int)
(push) ; 12
; [eval] i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1
; [eval] i >= 0 && i < |next|
; [eval] i >= 0
(push) ; 13
; [then-branch: 25 | !(i@34@01 >= 0) | live]
; [else-branch: 25 | i@34@01 >= 0 | live]
(push) ; 14
; [then-branch: 25 | !(i@34@01 >= 0)]
(assert (not (>= i@34@01 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 25 | i@34@01 >= 0]
(assert (>= i@34@01 0))
; [eval] i < |next|
; [eval] |next|
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (>= i@34@01 0) (not (>= i@34@01 0))))
(push) ; 13
; [then-branch: 26 | i@34@01 >= 0 && i@34@01 < |next@29@01| | live]
; [else-branch: 26 | !(i@34@01 >= 0 && i@34@01 < |next@29@01|) | live]
(push) ; 14
; [then-branch: 26 | i@34@01 >= 0 && i@34@01 < |next@29@01|]
(assert (and (>= i@34@01 0) (< i@34@01 (Seq_length next@29@01))))
; [eval] Tree_tag(next[i]) == 1
; [eval] Tree_tag(next[i])
; [eval] next[i]
(pop) ; 14
(push) ; 14
; [else-branch: 26 | !(i@34@01 >= 0 && i@34@01 < |next@29@01|)]
(assert (not (and (>= i@34@01 0) (< i@34@01 (Seq_length next@29@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@34@01 0) (< i@34@01 (Seq_length next@29@01))))
  (and (>= i@34@01 0) (< i@34@01 (Seq_length next@29@01)))))
(pop) ; 12
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@34@01 Int)) (!
  (and
    (or (>= i@34@01 0) (not (>= i@34@01 0)))
    (or
      (not (and (>= i@34@01 0) (< i@34@01 (Seq_length next@29@01))))
      (and (>= i@34@01 0) (< i@34@01 (Seq_length next@29@01)))))
  :pattern ((Tree_tag<Int> (Seq_index next@29@01 i@34@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75-aux|)))
(push) ; 12
(assert (not (forall ((i@34@01 Int)) (!
  (=>
    (and (>= i@34@01 0) (< i@34@01 (Seq_length next@29@01)))
    (= (Tree_tag<Int> (Seq_index next@29@01 i@34@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@29@01 i@34@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@34@01 Int)) (!
  (=>
    (and (>= i@34@01 0) (< i@34@01 (Seq_length next@29@01)))
    (= (Tree_tag<Int> (Seq_index next@29@01 i@34@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@29@01 i@34@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|)))
; [eval] children_seq(old_current) == children_seq(current) ++ next
; [eval] children_seq(old_current)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] children_seq(current) ++ next
; [eval] children_seq(current)
(push) ; 12
(assert (children_seq%precondition $Snap.unit current@28@01))
(pop) ; 12
; Joined path conditions
(assert (children_seq%precondition $Snap.unit current@28@01))
(push) ; 12
(assert (not (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@28@01) next@29@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@28@01) next@29@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 22 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) == 1]
(assert (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 16 | Tree_tag[Int](get_Tree_left[Tree](node@27@01)) != 1]
(assert (not (= (Tree_tag<Int> (get_Tree_left<Tree> node@27@01)) 1)))
(pop) ; 10
; [eval] !(Tree_tag(get_Tree_left(node)) == 1)
; [eval] Tree_tag(get_Tree_left(node)) == 1
; [eval] Tree_tag(get_Tree_left(node))
; [eval] get_Tree_left(node)
(push) ; 10
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> (get_Tree_left<Tree> node@27@01)) 1)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> (get_Tree_left<Tree> node@27@01)) 1))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | Tree_tag[Int](get_Tree_left[Tree](node@27@01)) != 1 | live]
; [else-branch: 27 | Tree_tag[Int](get_Tree_left[Tree](node@27@01)) == 1 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 27 | Tree_tag[Int](get_Tree_left[Tree](node@27@01)) != 1]
(assert (not (= (Tree_tag<Int> (get_Tree_left<Tree> node@27@01)) 1)))
; [eval] Tree_tag(get_Tree_right(node)) == 1
; [eval] Tree_tag(get_Tree_right(node))
; [eval] get_Tree_right(node)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) == 1 | live]
; [else-branch: 28 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) != 1 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 28 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) == 1]
(assert (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1))
; [exec]
; next := Seq(get_Tree_right(node)) ++ next
; [eval] Seq(get_Tree_right(node)) ++ next
; [eval] Seq(get_Tree_right(node))
; [eval] get_Tree_right(node)
(assert (= (Seq_length (Seq_singleton (get_Tree_right<Tree> node@27@01))) 1))
(declare-const next@35@01 Seq<Tree>)
(assert (=
  next@35@01
  (Seq_append (Seq_singleton (get_Tree_right<Tree> node@27@01)) next@20@01)))
; Loop head block: Re-establish invariant
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@36@01 Int)
(push) ; 12
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 13
; [then-branch: 29 | !(i@36@01 >= 0) | live]
; [else-branch: 29 | i@36@01 >= 0 | live]
(push) ; 14
; [then-branch: 29 | !(i@36@01 >= 0)]
(assert (not (>= i@36@01 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 29 | i@36@01 >= 0]
(assert (>= i@36@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (>= i@36@01 0) (not (>= i@36@01 0))))
(push) ; 13
; [then-branch: 30 | i@36@01 >= 0 && i@36@01 < |current@28@01| | live]
; [else-branch: 30 | !(i@36@01 >= 0 && i@36@01 < |current@28@01|) | live]
(push) ; 14
; [then-branch: 30 | i@36@01 >= 0 && i@36@01 < |current@28@01|]
(assert (and (>= i@36@01 0) (< i@36@01 (Seq_length current@28@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 14
(push) ; 14
; [else-branch: 30 | !(i@36@01 >= 0 && i@36@01 < |current@28@01|)]
(assert (not (and (>= i@36@01 0) (< i@36@01 (Seq_length current@28@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@36@01 0) (< i@36@01 (Seq_length current@28@01))))
  (and (>= i@36@01 0) (< i@36@01 (Seq_length current@28@01)))))
(pop) ; 12
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@36@01 Int)) (!
  (and
    (or (>= i@36@01 0) (not (>= i@36@01 0)))
    (or
      (not (and (>= i@36@01 0) (< i@36@01 (Seq_length current@28@01))))
      (and (>= i@36@01 0) (< i@36@01 (Seq_length current@28@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@36@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81-aux|)))
(push) ; 12
(assert (not (forall ((i@36@01 Int)) (!
  (=>
    (and (>= i@36@01 0) (< i@36@01 (Seq_length current@28@01)))
    (= (Tree_tag<Int> (Seq_index current@28@01 i@36@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@36@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (>= i@36@01 0) (< i@36@01 (Seq_length current@28@01)))
    (= (Tree_tag<Int> (Seq_index current@28@01 i@36@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@36@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|)))
; [eval] (forall i: Int :: { Tree_tag(next[i]) } i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1)
(declare-const i@37@01 Int)
(push) ; 12
; [eval] i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1
; [eval] i >= 0 && i < |next|
; [eval] i >= 0
(push) ; 13
; [then-branch: 31 | !(i@37@01 >= 0) | live]
; [else-branch: 31 | i@37@01 >= 0 | live]
(push) ; 14
; [then-branch: 31 | !(i@37@01 >= 0)]
(assert (not (>= i@37@01 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 31 | i@37@01 >= 0]
(assert (>= i@37@01 0))
; [eval] i < |next|
; [eval] |next|
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (>= i@37@01 0) (not (>= i@37@01 0))))
(push) ; 13
; [then-branch: 32 | i@37@01 >= 0 && i@37@01 < |next@35@01| | live]
; [else-branch: 32 | !(i@37@01 >= 0 && i@37@01 < |next@35@01|) | live]
(push) ; 14
; [then-branch: 32 | i@37@01 >= 0 && i@37@01 < |next@35@01|]
(assert (and (>= i@37@01 0) (< i@37@01 (Seq_length next@35@01))))
; [eval] Tree_tag(next[i]) == 1
; [eval] Tree_tag(next[i])
; [eval] next[i]
(pop) ; 14
(push) ; 14
; [else-branch: 32 | !(i@37@01 >= 0 && i@37@01 < |next@35@01|)]
(assert (not (and (>= i@37@01 0) (< i@37@01 (Seq_length next@35@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@37@01 0) (< i@37@01 (Seq_length next@35@01))))
  (and (>= i@37@01 0) (< i@37@01 (Seq_length next@35@01)))))
(pop) ; 12
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@37@01 Int)) (!
  (and
    (or (>= i@37@01 0) (not (>= i@37@01 0)))
    (or
      (not (and (>= i@37@01 0) (< i@37@01 (Seq_length next@35@01))))
      (and (>= i@37@01 0) (< i@37@01 (Seq_length next@35@01)))))
  :pattern ((Tree_tag<Int> (Seq_index next@35@01 i@37@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75-aux|)))
(push) ; 12
(assert (not (forall ((i@37@01 Int)) (!
  (=>
    (and (>= i@37@01 0) (< i@37@01 (Seq_length next@35@01)))
    (= (Tree_tag<Int> (Seq_index next@35@01 i@37@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@35@01 i@37@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (>= i@37@01 0) (< i@37@01 (Seq_length next@35@01)))
    (= (Tree_tag<Int> (Seq_index next@35@01 i@37@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@35@01 i@37@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|)))
; [eval] children_seq(old_current) == children_seq(current) ++ next
; [eval] children_seq(old_current)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] children_seq(current) ++ next
; [eval] children_seq(current)
(push) ; 12
(assert (children_seq%precondition $Snap.unit current@28@01))
(pop) ; 12
; Joined path conditions
(assert (children_seq%precondition $Snap.unit current@28@01))
(push) ; 12
(assert (not (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@28@01) next@35@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@28@01) next@35@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 28 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) != 1]
(assert (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1)))
(pop) ; 11
; [eval] !(Tree_tag(get_Tree_right(node)) == 1)
; [eval] Tree_tag(get_Tree_right(node)) == 1
; [eval] Tree_tag(get_Tree_right(node))
; [eval] get_Tree_right(node)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) != 1 | live]
; [else-branch: 33 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) == 1 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 33 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) != 1]
(assert (not (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1)))
; Loop head block: Re-establish invariant
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@38@01 Int)
(push) ; 12
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 13
; [then-branch: 34 | !(i@38@01 >= 0) | live]
; [else-branch: 34 | i@38@01 >= 0 | live]
(push) ; 14
; [then-branch: 34 | !(i@38@01 >= 0)]
(assert (not (>= i@38@01 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 34 | i@38@01 >= 0]
(assert (>= i@38@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (>= i@38@01 0) (not (>= i@38@01 0))))
(push) ; 13
; [then-branch: 35 | i@38@01 >= 0 && i@38@01 < |current@28@01| | live]
; [else-branch: 35 | !(i@38@01 >= 0 && i@38@01 < |current@28@01|) | live]
(push) ; 14
; [then-branch: 35 | i@38@01 >= 0 && i@38@01 < |current@28@01|]
(assert (and (>= i@38@01 0) (< i@38@01 (Seq_length current@28@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 14
(push) ; 14
; [else-branch: 35 | !(i@38@01 >= 0 && i@38@01 < |current@28@01|)]
(assert (not (and (>= i@38@01 0) (< i@38@01 (Seq_length current@28@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@38@01 0) (< i@38@01 (Seq_length current@28@01))))
  (and (>= i@38@01 0) (< i@38@01 (Seq_length current@28@01)))))
(pop) ; 12
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@38@01 Int)) (!
  (and
    (or (>= i@38@01 0) (not (>= i@38@01 0)))
    (or
      (not (and (>= i@38@01 0) (< i@38@01 (Seq_length current@28@01))))
      (and (>= i@38@01 0) (< i@38@01 (Seq_length current@28@01)))))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@38@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81-aux|)))
(push) ; 12
(assert (not (forall ((i@38@01 Int)) (!
  (=>
    (and (>= i@38@01 0) (< i@38@01 (Seq_length current@28@01)))
    (= (Tree_tag<Int> (Seq_index current@28@01 i@38@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@38@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (>= i@38@01 0) (< i@38@01 (Seq_length current@28@01)))
    (= (Tree_tag<Int> (Seq_index current@28@01 i@38@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index current@28@01 i@38@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@88@19@88@81|)))
; [eval] (forall i: Int :: { Tree_tag(next[i]) } i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1)
(declare-const i@39@01 Int)
(push) ; 12
; [eval] i >= 0 && i < |next| ==> Tree_tag(next[i]) == 1
; [eval] i >= 0 && i < |next|
; [eval] i >= 0
(push) ; 13
; [then-branch: 36 | !(i@39@01 >= 0) | live]
; [else-branch: 36 | i@39@01 >= 0 | live]
(push) ; 14
; [then-branch: 36 | !(i@39@01 >= 0)]
(assert (not (>= i@39@01 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 36 | i@39@01 >= 0]
(assert (>= i@39@01 0))
; [eval] i < |next|
; [eval] |next|
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (>= i@39@01 0) (not (>= i@39@01 0))))
(push) ; 13
; [then-branch: 37 | i@39@01 >= 0 && i@39@01 < |next@20@01| | live]
; [else-branch: 37 | !(i@39@01 >= 0 && i@39@01 < |next@20@01|) | live]
(push) ; 14
; [then-branch: 37 | i@39@01 >= 0 && i@39@01 < |next@20@01|]
(assert (and (>= i@39@01 0) (< i@39@01 (Seq_length next@20@01))))
; [eval] Tree_tag(next[i]) == 1
; [eval] Tree_tag(next[i])
; [eval] next[i]
(pop) ; 14
(push) ; 14
; [else-branch: 37 | !(i@39@01 >= 0 && i@39@01 < |next@20@01|)]
(assert (not (and (>= i@39@01 0) (< i@39@01 (Seq_length next@20@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@39@01 0) (< i@39@01 (Seq_length next@20@01))))
  (and (>= i@39@01 0) (< i@39@01 (Seq_length next@20@01)))))
(pop) ; 12
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@39@01 Int)) (!
  (and
    (or (>= i@39@01 0) (not (>= i@39@01 0)))
    (or
      (not (and (>= i@39@01 0) (< i@39@01 (Seq_length next@20@01))))
      (and (>= i@39@01 0) (< i@39@01 (Seq_length next@20@01)))))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@39@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75-aux|)))
(push) ; 12
(assert (not (forall ((i@39@01 Int)) (!
  (=>
    (and (>= i@39@01 0) (< i@39@01 (Seq_length next@20@01)))
    (= (Tree_tag<Int> (Seq_index next@20@01 i@39@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@39@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@39@01 Int)) (!
  (=>
    (and (>= i@39@01 0) (< i@39@01 (Seq_length next@20@01)))
    (= (Tree_tag<Int> (Seq_index next@20@01 i@39@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@39@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@89@19@89@75|)))
; [eval] children_seq(old_current) == children_seq(current) ++ next
; [eval] children_seq(old_current)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] children_seq(current) ++ next
; [eval] children_seq(current)
(push) ; 12
(assert (children_seq%precondition $Snap.unit current@28@01))
(pop) ; 12
; Joined path conditions
(assert (children_seq%precondition $Snap.unit current@28@01))
(push) ; 12
(assert (not (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@28@01) next@20@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (children_seq $Snap.unit old_current@5@01)
  (Seq_append (children_seq $Snap.unit current@28@01) next@20@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 33 | Tree_tag[Int](get_Tree_right[Tree](node@27@01)) == 1]
(assert (= (Tree_tag<Int> (get_Tree_right<Tree> node@27@01)) 1))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 27 | Tree_tag[Int](get_Tree_left[Tree](node@27@01)) == 1]
(assert (= (Tree_tag<Int> (get_Tree_left<Tree> node@27@01)) 1))
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 15 | !(|current@19@01| > 0)]
(assert (not (> (Seq_length current@19@01) 0)))
(pop) ; 9
; [eval] !(|current| > 0)
; [eval] |current| > 0
; [eval] |current|
(push) ; 9
(set-option :timeout 10)
(assert (not (> (Seq_length current@19@01) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> (Seq_length current@19@01) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | !(|current@19@01| > 0) | live]
; [else-branch: 38 | |current@19@01| > 0 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 38 | !(|current@19@01| > 0)]
(assert (not (> (Seq_length current@19@01) 0)))
; [exec]
; current := next
; Loop head block: Re-establish invariant
; [eval] (forall i: Int :: { Tree_tag(current[i]) } i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1)
(declare-const i@40@01 Int)
(push) ; 10
; [eval] i >= 0 && i < |current| ==> Tree_tag(current[i]) == 1
; [eval] i >= 0 && i < |current|
; [eval] i >= 0
(push) ; 11
; [then-branch: 39 | !(i@40@01 >= 0) | live]
; [else-branch: 39 | i@40@01 >= 0 | live]
(push) ; 12
; [then-branch: 39 | !(i@40@01 >= 0)]
(assert (not (>= i@40@01 0)))
(pop) ; 12
(push) ; 12
; [else-branch: 39 | i@40@01 >= 0]
(assert (>= i@40@01 0))
; [eval] i < |current|
; [eval] |current|
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (>= i@40@01 0) (not (>= i@40@01 0))))
(push) ; 11
; [then-branch: 40 | i@40@01 >= 0 && i@40@01 < |next@20@01| | live]
; [else-branch: 40 | !(i@40@01 >= 0 && i@40@01 < |next@20@01|) | live]
(push) ; 12
; [then-branch: 40 | i@40@01 >= 0 && i@40@01 < |next@20@01|]
(assert (and (>= i@40@01 0) (< i@40@01 (Seq_length next@20@01))))
; [eval] Tree_tag(current[i]) == 1
; [eval] Tree_tag(current[i])
; [eval] current[i]
(pop) ; 12
(push) ; 12
; [else-branch: 40 | !(i@40@01 >= 0 && i@40@01 < |next@20@01|)]
(assert (not (and (>= i@40@01 0) (< i@40@01 (Seq_length next@20@01)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (>= i@40@01 0) (< i@40@01 (Seq_length next@20@01))))
  (and (>= i@40@01 0) (< i@40@01 (Seq_length next@20@01)))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@40@01 Int)) (!
  (and
    (or (>= i@40@01 0) (not (>= i@40@01 0)))
    (or
      (not (and (>= i@40@01 0) (< i@40@01 (Seq_length next@20@01))))
      (and (>= i@40@01 0) (< i@40@01 (Seq_length next@20@01)))))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@40@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79-aux|)))
(push) ; 10
(assert (not (forall ((i@40@01 Int)) (!
  (=>
    (and (>= i@40@01 0) (< i@40@01 (Seq_length next@20@01)))
    (= (Tree_tag<Int> (Seq_index next@20@01 i@40@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@40@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@40@01 Int)) (!
  (=>
    (and (>= i@40@01 0) (< i@40@01 (Seq_length next@20@01)))
    (= (Tree_tag<Int> (Seq_index next@20@01 i@40@01)) 1))
  :pattern ((Tree_tag<Int> (Seq_index next@20@01 i@40@01)))
  :qid |prog./silicon/silver/src/test/resources/adt/example_2.vpr@77@17@77@79|)))
; [eval] height(t) == res + height_recursive(current)
; [eval] height(t)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] res + height_recursive(current)
; [eval] height_recursive(current)
(push) ; 10
(assert (height_recursive%precondition $Snap.unit next@20@01))
(pop) ; 10
; Joined path conditions
(assert (height_recursive%precondition $Snap.unit next@20@01))
(push) ; 10
(assert (not (=
  (height $Snap.unit t@2@01)
  (+ res@16@01 (height_recursive $Snap.unit next@20@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  (height $Snap.unit t@2@01)
  (+ res@16@01 (height_recursive $Snap.unit next@20@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 38 | |current@19@01| > 0]
(assert (> (Seq_length current@19@01) 0))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(|current@12@01| > 0)]
(assert (not (> (Seq_length current@12@01) 0)))
(pop) ; 6
; [eval] !(|current| > 0)
; [eval] |current| > 0
; [eval] |current|
(push) ; 6
(set-option :timeout 10)
(assert (not (> (Seq_length current@12@01) 0)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> (Seq_length current@12@01) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | !(|current@12@01| > 0) | live]
; [else-branch: 41 | |current@12@01| > 0 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 41 | !(|current@12@01| > 0)]
(assert (not (> (Seq_length current@12@01) 0)))
; [eval] height(t) == res
; [eval] height(t)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (= (height $Snap.unit t@2@01) res@9@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= (height $Snap.unit t@2@01) res@9@01))
(pop) ; 6
(push) ; 6
; [else-branch: 41 | |current@12@01| > 0]
(assert (> (Seq_length current@12@01) 0))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 1 | Tree_tag[Int](t@2@01) == 0]
(assert (= (Tree_tag<Int> t@2@01) 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
