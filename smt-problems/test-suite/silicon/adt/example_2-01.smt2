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
; ---------- FUNCTION children----------
(declare-fun t@0@00 () Tree)
(declare-fun result@1@00 () Seq<Tree>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (= (children%limited s@$ t@0@00) (children s@$ t@0@00))
  :pattern ((children s@$ t@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (t@0@00 Tree)) (!
  (children%stateless t@0@00)
  :pattern ((children%limited s@$ t@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (Tree_tag(t) == 0 || Tree_tag(t) == 1 && (Tree_tag(get_Tree_left(t)) == 0 && Tree_tag(get_Tree_right(t)) == 0) ? Seq[Tree]() : (Tree_tag(get_Tree_left(t)) == 1 && Tree_tag(get_Tree_right(t)) == 1 ? Seq(get_Tree_right(t)) ++ Seq(get_Tree_left(t)) : (Tree_tag(get_Tree_left(t)) == 1 ? Seq(get_Tree_left(t)) : Seq(get_Tree_right(t)))))
; [eval] Tree_tag(t) == 0 || Tree_tag(t) == 1 && (Tree_tag(get_Tree_left(t)) == 0 && Tree_tag(get_Tree_right(t)) == 0)
; [eval] Tree_tag(t) == 0
; [eval] Tree_tag(t)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | Tree_tag[Int](t@0@00) == 0 | live]
; [else-branch: 0 | Tree_tag[Int](t@0@00) != 0 | live]
(push) ; 3
; [then-branch: 0 | Tree_tag[Int](t@0@00) == 0]
(assert (= (Tree_tag<Int> t@0@00) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | Tree_tag[Int](t@0@00) != 0]
(assert (not (= (Tree_tag<Int> t@0@00) 0)))
; [eval] Tree_tag(t) == 1 && (Tree_tag(get_Tree_left(t)) == 0 && Tree_tag(get_Tree_right(t)) == 0)
; [eval] Tree_tag(t) == 1
; [eval] Tree_tag(t)
(push) ; 4
; [then-branch: 1 | Tree_tag[Int](t@0@00) != 1 | live]
; [else-branch: 1 | Tree_tag[Int](t@0@00) == 1 | live]
(push) ; 5
; [then-branch: 1 | Tree_tag[Int](t@0@00) != 1]
(assert (not (= (Tree_tag<Int> t@0@00) 1)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | Tree_tag[Int](t@0@00) == 1]
(assert (= (Tree_tag<Int> t@0@00) 1))
; [eval] Tree_tag(get_Tree_left(t)) == 0
; [eval] Tree_tag(get_Tree_left(t))
; [eval] get_Tree_left(t)
(push) ; 6
; [then-branch: 2 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) != 0 | live]
; [else-branch: 2 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 0 | live]
(push) ; 7
; [then-branch: 2 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) != 0]
(assert (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 0]
(assert (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0))
; [eval] Tree_tag(get_Tree_right(t)) == 0
; [eval] Tree_tag(get_Tree_right(t))
; [eval] get_Tree_right(t)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
  (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (Tree_tag<Int> t@0@00) 1)
  (and
    (= (Tree_tag<Int> t@0@00) 1)
    (or
      (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
      (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0))))))
(assert (or (= (Tree_tag<Int> t@0@00) 1) (not (= (Tree_tag<Int> t@0@00) 1))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Tree_tag<Int> t@0@00) 0))
  (and
    (not (= (Tree_tag<Int> t@0@00) 0))
    (=>
      (= (Tree_tag<Int> t@0@00) 1)
      (and
        (= (Tree_tag<Int> t@0@00) 1)
        (or
          (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
          (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)))))
    (or (= (Tree_tag<Int> t@0@00) 1) (not (= (Tree_tag<Int> t@0@00) 1))))))
(assert (or (not (= (Tree_tag<Int> t@0@00) 0)) (= (Tree_tag<Int> t@0@00) 0)))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (or
    (= (Tree_tag<Int> t@0@00) 0)
    (and
      (= (Tree_tag<Int> t@0@00) 1)
      (and
        (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
        (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (or
  (= (Tree_tag<Int> t@0@00) 0)
  (and
    (= (Tree_tag<Int> t@0@00) 1)
    (and
      (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
      (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | Tree_tag[Int](t@0@00) == 0 || Tree_tag[Int](t@0@00) == 1 && Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 0 && Tree_tag[Int](get_Tree_right[Tree](t@0@00)) == 0 | live]
; [else-branch: 3 | !(Tree_tag[Int](t@0@00) == 0 || Tree_tag[Int](t@0@00) == 1 && Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 0 && Tree_tag[Int](get_Tree_right[Tree](t@0@00)) == 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | Tree_tag[Int](t@0@00) == 0 || Tree_tag[Int](t@0@00) == 1 && Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 0 && Tree_tag[Int](get_Tree_right[Tree](t@0@00)) == 0]
(assert (or
  (= (Tree_tag<Int> t@0@00) 0)
  (and
    (= (Tree_tag<Int> t@0@00) 1)
    (and
      (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
      (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0)))))
; [eval] Seq[Tree]()
(pop) ; 3
(push) ; 3
; [else-branch: 3 | !(Tree_tag[Int](t@0@00) == 0 || Tree_tag[Int](t@0@00) == 1 && Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 0 && Tree_tag[Int](get_Tree_right[Tree](t@0@00)) == 0)]
(assert (not
  (or
    (= (Tree_tag<Int> t@0@00) 0)
    (and
      (= (Tree_tag<Int> t@0@00) 1)
      (and
        (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
        (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0))))))
; [eval] (Tree_tag(get_Tree_left(t)) == 1 && Tree_tag(get_Tree_right(t)) == 1 ? Seq(get_Tree_right(t)) ++ Seq(get_Tree_left(t)) : (Tree_tag(get_Tree_left(t)) == 1 ? Seq(get_Tree_left(t)) : Seq(get_Tree_right(t))))
; [eval] Tree_tag(get_Tree_left(t)) == 1 && Tree_tag(get_Tree_right(t)) == 1
; [eval] Tree_tag(get_Tree_left(t)) == 1
; [eval] Tree_tag(get_Tree_left(t))
; [eval] get_Tree_left(t)
(push) ; 4
; [then-branch: 4 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) != 1 | live]
; [else-branch: 4 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 1 | live]
(push) ; 5
; [then-branch: 4 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) != 1]
(assert (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 1]
(assert (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
; [eval] Tree_tag(get_Tree_right(t)) == 1
; [eval] Tree_tag(get_Tree_right(t))
; [eval] get_Tree_right(t)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
  (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
    (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
  (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 1 && Tree_tag[Int](get_Tree_right[Tree](t@0@00)) == 1 | live]
; [else-branch: 5 | !(Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 1 && Tree_tag[Int](get_Tree_right[Tree](t@0@00)) == 1) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 1 && Tree_tag[Int](get_Tree_right[Tree](t@0@00)) == 1]
(assert (and
  (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
  (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)))
; [eval] Seq(get_Tree_right(t)) ++ Seq(get_Tree_left(t))
; [eval] Seq(get_Tree_right(t))
; [eval] get_Tree_right(t)
(assert (= (Seq_length (Seq_singleton (get_Tree_right<Tree> t@0@00))) 1))
; [eval] Seq(get_Tree_left(t))
; [eval] get_Tree_left(t)
(assert (= (Seq_length (Seq_singleton (get_Tree_left<Tree> t@0@00))) 1))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 1 && Tree_tag[Int](get_Tree_right[Tree](t@0@00)) == 1)]
(assert (not
  (and
    (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
    (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1))))
; [eval] (Tree_tag(get_Tree_left(t)) == 1 ? Seq(get_Tree_left(t)) : Seq(get_Tree_right(t)))
; [eval] Tree_tag(get_Tree_left(t)) == 1
; [eval] Tree_tag(get_Tree_left(t))
; [eval] get_Tree_left(t)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 1 | live]
; [else-branch: 6 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) != 1 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 6 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) == 1]
(assert (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
; [eval] Seq(get_Tree_left(t))
; [eval] get_Tree_left(t)
(assert (= (Seq_length (Seq_singleton (get_Tree_left<Tree> t@0@00))) 1))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | Tree_tag[Int](get_Tree_left[Tree](t@0@00)) != 1]
(assert (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)))
; [eval] Seq(get_Tree_right(t))
; [eval] get_Tree_right(t)
(assert (= (Seq_length (Seq_singleton (get_Tree_right<Tree> t@0@00))) 1))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
  (and
    (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
    (= (Seq_length (Seq_singleton (get_Tree_left<Tree> t@0@00))) 1))))
; Joined path conditions
(assert (=>
  (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
  (and
    (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
    (= (Seq_length (Seq_singleton (get_Tree_right<Tree> t@0@00))) 1))))
(assert (or
  (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
  (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
    (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1))
  (and
    (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
    (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)
    (= (Seq_length (Seq_singleton (get_Tree_right<Tree> t@0@00))) 1)
    (= (Seq_length (Seq_singleton (get_Tree_left<Tree> t@0@00))) 1))))
; Joined path conditions
(assert (=>
  (not
    (and
      (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
      (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)))
  (and
    (not
      (and
        (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
        (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)))
    (=>
      (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
      (and
        (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
        (= (Seq_length (Seq_singleton (get_Tree_left<Tree> t@0@00))) 1)))
    (=>
      (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
      (and
        (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
        (= (Seq_length (Seq_singleton (get_Tree_right<Tree> t@0@00))) 1)))
    (or
      (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
      (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)))))
(assert (or
  (not
    (and
      (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
      (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)))
  (and
    (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
    (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (or
      (= (Tree_tag<Int> t@0@00) 0)
      (and
        (= (Tree_tag<Int> t@0@00) 1)
        (and
          (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
          (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0)))))
  (and
    (not
      (or
        (= (Tree_tag<Int> t@0@00) 0)
        (and
          (= (Tree_tag<Int> t@0@00) 1)
          (and
            (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
            (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0)))))
    (or
      (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
      (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)))
    (=>
      (and
        (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
        (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1))
      (and
        (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
        (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)
        (= (Seq_length (Seq_singleton (get_Tree_right<Tree> t@0@00))) 1)
        (= (Seq_length (Seq_singleton (get_Tree_left<Tree> t@0@00))) 1)))
    (=>
      (not
        (and
          (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
          (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)))
      (and
        (not
          (and
            (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
            (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)))
        (=>
          (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
          (and
            (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
            (= (Seq_length (Seq_singleton (get_Tree_left<Tree> t@0@00))) 1)))
        (=>
          (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
          (and
            (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
            (= (Seq_length (Seq_singleton (get_Tree_right<Tree> t@0@00))) 1)))
        (or
          (not (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))
          (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1))))
    (or
      (not
        (and
          (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
          (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1)))
      (and
        (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 1)
        (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 1))))))
(assert (or
  (not
    (or
      (= (Tree_tag<Int> t@0@00) 0)
      (and
        (= (Tree_tag<Int> t@0@00) 1)
        (and
          (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
          (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0)))))
  (or
    (= (Tree_tag<Int> t@0@00) 0)
    (and
      (= (Tree_tag<Int> t@0@00) 1)
      (and
        (= (Tree_tag<Int> (get_Tree_left<Tree> t@0@00)) 0)
        (= (Tree_tag<Int> (get_Tree_right<Tree> t@0@00)) 0))))))
(assert (=
  result@1@00
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
(pop) ; 1
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
; ---------- FUNCTION children_seq----------
(declare-fun ts@2@00 () Seq<Tree>)
(declare-fun result@3@00 () Seq<Tree>)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (ts@2@00 Seq<Tree>)) (!
  (= (children_seq%limited s@$ ts@2@00) (children_seq s@$ ts@2@00))
  :pattern ((children_seq s@$ ts@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (ts@2@00 Seq<Tree>)) (!
  (children_seq%stateless ts@2@00)
  :pattern ((children_seq%limited s@$ ts@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|ts| == 0 ? Seq[Tree]() : (|ts| == 1 ? children(ts[0]) : children_seq(ts[1..]) ++ children(ts[0])))
; [eval] |ts| == 0
; [eval] |ts|
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Seq_length ts@2@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_length ts@2@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | |ts@2@00| == 0 | live]
; [else-branch: 7 | |ts@2@00| != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | |ts@2@00| == 0]
(assert (= (Seq_length ts@2@00) 0))
; [eval] Seq[Tree]()
(pop) ; 3
(push) ; 3
; [else-branch: 7 | |ts@2@00| != 0]
(assert (not (= (Seq_length ts@2@00) 0)))
; [eval] (|ts| == 1 ? children(ts[0]) : children_seq(ts[1..]) ++ children(ts[0]))
; [eval] |ts| == 1
; [eval] |ts|
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (Seq_length ts@2@00) 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_length ts@2@00) 1)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | |ts@2@00| == 1 | live]
; [else-branch: 8 | |ts@2@00| != 1 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | |ts@2@00| == 1]
(assert (= (Seq_length ts@2@00) 1))
; [eval] children(ts[0])
; [eval] ts[0]
(push) ; 6
(assert (not (< 0 (Seq_length ts@2@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (children%precondition $Snap.unit (Seq_index ts@2@00 0)))
(pop) ; 6
; Joined path conditions
(assert (children%precondition $Snap.unit (Seq_index ts@2@00 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | |ts@2@00| != 1]
(assert (not (= (Seq_length ts@2@00) 1)))
; [eval] children_seq(ts[1..]) ++ children(ts[0])
; [eval] children_seq(ts[1..])
; [eval] ts[1..]
(push) ; 6
(assert (children_seq%precondition $Snap.unit (Seq_drop ts@2@00 1)))
(pop) ; 6
; Joined path conditions
(assert (children_seq%precondition $Snap.unit (Seq_drop ts@2@00 1)))
; [eval] children(ts[0])
; [eval] ts[0]
(push) ; 6
(assert (not (< 0 (Seq_length ts@2@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (children%precondition $Snap.unit (Seq_index ts@2@00 0)))
(pop) ; 6
; Joined path conditions
(assert (children%precondition $Snap.unit (Seq_index ts@2@00 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (= (Seq_length ts@2@00) 1)
  (and
    (= (Seq_length ts@2@00) 1)
    (children%precondition $Snap.unit (Seq_index ts@2@00 0)))))
; Joined path conditions
(assert (=>
  (not (= (Seq_length ts@2@00) 1))
  (and
    (not (= (Seq_length ts@2@00) 1))
    (children_seq%precondition $Snap.unit (Seq_drop ts@2@00 1))
    (children%precondition $Snap.unit (Seq_index ts@2@00 0)))))
(assert (or (not (= (Seq_length ts@2@00) 1)) (= (Seq_length ts@2@00) 1)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Seq_length ts@2@00) 0))
  (and
    (not (= (Seq_length ts@2@00) 0))
    (=>
      (= (Seq_length ts@2@00) 1)
      (and
        (= (Seq_length ts@2@00) 1)
        (children%precondition $Snap.unit (Seq_index ts@2@00 0))))
    (=>
      (not (= (Seq_length ts@2@00) 1))
      (and
        (not (= (Seq_length ts@2@00) 1))
        (children_seq%precondition $Snap.unit (Seq_drop ts@2@00 1))
        (children%precondition $Snap.unit (Seq_index ts@2@00 0))))
    (or (not (= (Seq_length ts@2@00) 1)) (= (Seq_length ts@2@00) 1)))))
(assert (or (not (= (Seq_length ts@2@00) 0)) (= (Seq_length ts@2@00) 0)))
(assert (=
  result@3@00
  (ite
    (= (Seq_length ts@2@00) 0)
    (as Seq_empty  Seq<Tree>)
    (ite
      (= (Seq_length ts@2@00) 1)
      (children $Snap.unit (Seq_index ts@2@00 0))
      (Seq_append
        (children_seq $Snap.unit (Seq_drop ts@2@00 1))
        (children $Snap.unit (Seq_index ts@2@00 0)))))))
(pop) ; 1
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
; ---------- FUNCTION height_recursive----------
(declare-fun ts@4@00 () Seq<Tree>)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (ts@4@00 Seq<Tree>)) (!
  (= (height_recursive%limited s@$ ts@4@00) (height_recursive s@$ ts@4@00))
  :pattern ((height_recursive s@$ ts@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (ts@4@00 Seq<Tree>)) (!
  (height_recursive%stateless ts@4@00)
  :pattern ((height_recursive%limited s@$ ts@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|ts| == 0 ? 0 : 1 + height_recursive(children_seq(ts)))
; [eval] |ts| == 0
; [eval] |ts|
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Seq_length ts@4@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_length ts@4@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | |ts@4@00| == 0 | live]
; [else-branch: 9 | |ts@4@00| != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | |ts@4@00| == 0]
(assert (= (Seq_length ts@4@00) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | |ts@4@00| != 0]
(assert (not (= (Seq_length ts@4@00) 0)))
; [eval] 1 + height_recursive(children_seq(ts))
; [eval] height_recursive(children_seq(ts))
; [eval] children_seq(ts)
(push) ; 4
(assert (children_seq%precondition $Snap.unit ts@4@00))
(pop) ; 4
; Joined path conditions
(assert (children_seq%precondition $Snap.unit ts@4@00))
(push) ; 4
(assert (height_recursive%precondition $Snap.unit (children_seq $Snap.unit ts@4@00)))
(pop) ; 4
; Joined path conditions
(assert (height_recursive%precondition $Snap.unit (children_seq $Snap.unit ts@4@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Seq_length ts@4@00) 0))
  (and
    (not (= (Seq_length ts@4@00) 0))
    (children_seq%precondition $Snap.unit ts@4@00)
    (height_recursive%precondition $Snap.unit (children_seq $Snap.unit ts@4@00)))))
(assert (or (not (= (Seq_length ts@4@00) 0)) (= (Seq_length ts@4@00) 0)))
(assert (=
  result@5@00
  (ite
    (= (Seq_length ts@4@00) 0)
    0
    (+ 1 (height_recursive $Snap.unit (children_seq $Snap.unit ts@4@00))))))
(pop) ; 1
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
; ---------- FUNCTION height----------
(declare-fun t@6@00 () Tree)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (= (height%limited s@$ t@6@00) (height s@$ t@6@00))
  :pattern ((height s@$ t@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (t@6@00 Tree)) (!
  (height%stateless t@6@00)
  :pattern ((height%limited s@$ t@6@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (Tree_tag(t) == 0 ? 0 : height_recursive(Seq(t)))
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
; [then-branch: 10 | Tree_tag[Int](t@6@00) == 0 | live]
; [else-branch: 10 | Tree_tag[Int](t@6@00) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | Tree_tag[Int](t@6@00) == 0]
(assert (= (Tree_tag<Int> t@6@00) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 10 | Tree_tag[Int](t@6@00) != 0]
(assert (not (= (Tree_tag<Int> t@6@00) 0)))
; [eval] height_recursive(Seq(t))
; [eval] Seq(t)
(assert (= (Seq_length (Seq_singleton t@6@00)) 1))
(push) ; 4
(assert (height_recursive%precondition $Snap.unit (Seq_singleton t@6@00)))
(pop) ; 4
; Joined path conditions
(assert (height_recursive%precondition $Snap.unit (Seq_singleton t@6@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Tree_tag<Int> t@6@00) 0))
  (and
    (not (= (Tree_tag<Int> t@6@00) 0))
    (= (Seq_length (Seq_singleton t@6@00)) 1)
    (height_recursive%precondition $Snap.unit (Seq_singleton t@6@00)))))
(assert (or (not (= (Tree_tag<Int> t@6@00) 0)) (= (Tree_tag<Int> t@6@00) 0)))
(assert (=
  result@7@00
  (ite
    (= (Tree_tag<Int> t@6@00) 0)
    0
    (height_recursive $Snap.unit (Seq_singleton t@6@00)))))
(pop) ; 1
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
