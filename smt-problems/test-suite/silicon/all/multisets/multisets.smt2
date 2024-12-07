(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:05:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/multisets/multisets.vpr
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
(declare-sort Multiset<Int> 0)
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
(declare-fun $SortWrappers.Multiset<Int>To$Snap (Multiset<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<Int> ($Snap) Multiset<Int>)
(assert (forall ((x Multiset<Int>)) (!
    (= x ($SortWrappers.$SnapToMultiset<Int>($SortWrappers.Multiset<Int>To$Snap x)))
    :pattern (($SortWrappers.Multiset<Int>To$Snap x))
    :qid |$Snap.$SnapToMultiset<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<Int>To$Snap($SortWrappers.$SnapToMultiset<Int> x)))
    :pattern (($SortWrappers.$SnapToMultiset<Int> x))
    :qid |$Snap.Multiset<Int>To$SnapToMultiset<Int>|
    )))
; ////////// Symbols
(declare-fun Multiset_count (Multiset<Int> Int) Int)
(declare-fun Multiset_card (Multiset<Int>) Int)
(declare-const Multiset_empty Multiset<Int>)
(declare-fun Multiset_singleton (Int) Multiset<Int>)
(declare-fun Multiset_unionone (Multiset<Int> Int) Multiset<Int>)
(declare-fun Multiset_union (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_intersection (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_difference (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_subset (Multiset<Int> Multiset<Int>) Bool)
(declare-fun Multiset_equal (Multiset<Int> Multiset<Int>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<Int> Multiset<Int>) Int)
(declare-fun Multiset_disjoint (Multiset<Int> Multiset<Int>) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((ms Multiset<Int>) (x Int)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<Int>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o Int)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<Int>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<Int>) o))
  )))
(assert (forall ((s Multiset<Int>)) (!
  (and
    (= (= (Multiset_card s) 0) (= s (as Multiset_empty  Multiset<Int>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x Int)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r Int) (o Int)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r Int)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r Int)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<Int>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<Int>) (x Int) (o Int)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<Int>) (x Int)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<Int>) (x Int)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (y Int)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (and
    (=
      (+
        (+
          (Multiset_card (Multiset_difference a b))
          (Multiset_card (Multiset_difference b a)))
        (* 2 (Multiset_card (Multiset_intersection a b))))
      (Multiset_card (Multiset_union a b)))
    (=
      (Multiset_card (Multiset_difference a b))
      (- (Multiset_card a) (Multiset_card (Multiset_intersection a b)))))
  :pattern ((Multiset_card (Multiset_difference a b)))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o Int)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (or
    (and (Multiset_equal a b) (= a b))
    (and
      (not (Multiset_equal a b))
      (and
        (not (= a b))
        (and
          (= (Multiset_skolem_diff a b) (Multiset_skolem_diff b a))
          (not
            (=
              (Multiset_count a (Multiset_skolem_diff a b))
              (Multiset_count b (Multiset_skolem_diff a b))))))))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o Int)) (!
      (or (= (Multiset_count a o) 0) (= (Multiset_count b o) 0))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_disjoint a b))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
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
; var B1: Multiset[Int]
(declare-const B1@0@01 Multiset<Int>)
; [exec]
; var B2: Multiset[Int]
(declare-const B2@1@01 Multiset<Int>)
; [exec]
; B1 := Multiset(1)
; [eval] Multiset(1)
(declare-const B1@2@01 Multiset<Int>)
(assert (= B1@2@01 (Multiset_singleton 1)))
; [exec]
; B2 := Multiset(1, 1)
; [eval] Multiset(1, 1)
(declare-const B2@3@01 Multiset<Int>)
(assert (= B2@3@01 (Multiset_unionone (Multiset_singleton 1) 1)))
; [exec]
; assert B1 == B2
; [eval] B1 == B2
(push) ; 3
(assert (not (Multiset_equal B1@2@01 B2@3@01)))
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
; [eval] B1 == B2
(set-option :timeout 0)
(push) ; 3
(assert (not (Multiset_equal B1@2@01 B2@3@01)))
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
; [eval] B1 == B2
(set-option :timeout 0)
(push) ; 3
(assert (not (Multiset_equal B1@2@01 B2@3@01)))
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
; [eval] B1 == B2
(set-option :timeout 0)
(push) ; 3
(assert (not (Multiset_equal B1@2@01 B2@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
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
; var B: Multiset[Int]
(declare-const B@4@01 Multiset<Int>)
; [exec]
; B := Multiset(1, 2, 3, 3, 1)
; [eval] Multiset(1, 2, 3, 3, 1)
(declare-const B@5@01 Multiset<Int>)
(assert (=
  B@5@01
  (Multiset_unionone (Multiset_unionone (Multiset_unionone (Multiset_unionone (Multiset_singleton 1) 2) 3) 3) 1)))
; [exec]
; assert |B| == 5
; [eval] |B| == 5
; [eval] |B|
(push) ; 3
(assert (not (= (Multiset_card B@5@01) 5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_card B@5@01) 5))
; [exec]
; assert |Multiset[Int]()| == 0
; [eval] |Multiset[Int]()| == 0
; [eval] |Multiset[Int]()|
; [eval] Multiset[Int]()
(push) ; 3
(assert (not (= (Multiset_card (as Multiset_empty  Multiset<Int>)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_card (as Multiset_empty  Multiset<Int>)) 0))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const B@6@01 Multiset<Int>)
(declare-const n@7@01 Int)
(declare-const x@8@01 Int)
(declare-const y@9@01 Int)
(declare-const B@10@01 Multiset<Int>)
(declare-const n@11@01 Int)
(declare-const x@12@01 Int)
(declare-const y@13@01 Int)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] |B| == n
; [eval] |B|
(assert (= (Multiset_card B@10@01) n@11@01))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] ((x in B)) > 0
; [eval] (x in B)
(assert (> (Multiset_count B@10@01 x@12@01) 0))
(assert (= ($Snap.second ($Snap.second $t@14@01)) $Snap.unit))
; [eval] ((y in B)) > 0
; [eval] (y in B)
(assert (> (Multiset_count B@10@01 y@13@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var B1: Multiset[Int]
(declare-const B1@15@01 Multiset<Int>)
; [exec]
; B1 := (B setminus Multiset[Int]())
; [eval] (B setminus Multiset[Int]())
; [eval] Multiset[Int]()
(declare-const B1@16@01 Multiset<Int>)
(assert (= B1@16@01 (Multiset_difference B@10@01 (as Multiset_empty  Multiset<Int>))))
; [exec]
; assert ((x in B1)) > 0
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(push) ; 3
(assert (not (> (Multiset_count B1@16@01 x@12@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (Multiset_count B1@16@01 x@12@01) 0))
; [exec]
; assert ((y in B1)) > 0
; [eval] ((y in B1)) > 0
; [eval] (y in B1)
(push) ; 3
(assert (not (> (Multiset_count B1@16@01 y@13@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (Multiset_count B1@16@01 y@13@01) 0))
; [exec]
; assert |B1| == n
; [eval] |B1| == n
; [eval] |B1|
(push) ; 3
(assert (not (= (Multiset_card B1@16@01) n@11@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_card B1@16@01) n@11@01))
(pop) ; 2
(pop) ; 1
; ---------- test04a ----------
(declare-const B@17@01 Multiset<Int>)
(declare-const n@18@01 Int)
(declare-const x@19@01 Int)
(declare-const y@20@01 Int)
(declare-const B@21@01 Multiset<Int>)
(declare-const n@22@01 Int)
(declare-const x@23@01 Int)
(declare-const y@24@01 Int)
(push) ; 1
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
; [eval] |B| == n
; [eval] |B|
(assert (= (Multiset_card B@21@01) n@22@01))
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.first ($Snap.second $t@25@01)) $Snap.unit))
; [eval] ((x in B)) > 0
; [eval] (x in B)
(assert (> (Multiset_count B@21@01 x@23@01) 0))
(assert (=
  ($Snap.second ($Snap.second $t@25@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@25@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@25@01))) $Snap.unit))
; [eval] ((y in B)) > 0
; [eval] (y in B)
(assert (> (Multiset_count B@21@01 y@24@01) 0))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@25@01))) $Snap.unit))
; [eval] x != y
(assert (not (= x@23@01 y@24@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var B1: Multiset[Int]
(declare-const B1@26@01 Multiset<Int>)
; [exec]
; B1 := (B setminus Multiset(x))
; [eval] (B setminus Multiset(x))
; [eval] Multiset(x)
(declare-const B1@27@01 Multiset<Int>)
(assert (= B1@27@01 (Multiset_difference B@21@01 (Multiset_singleton x@23@01))))
; [exec]
; assert ((y in B1)) > 0
; [eval] ((y in B1)) > 0
; [eval] (y in B1)
(push) ; 3
(assert (not (> (Multiset_count B1@27@01 y@24@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (Multiset_count B1@27@01 y@24@01) 0))
; [exec]
; assert |B1| == n - 1
; [eval] |B1| == n - 1
; [eval] |B1|
; [eval] n - 1
(push) ; 3
(assert (not (= (Multiset_card B1@27@01) (- n@22@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_card B1@27@01) (- n@22@01 1)))
; [exec]
; assert ((x in B1)) > 0
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(push) ; 3
(assert (not (> (Multiset_count B1@27@01 x@23@01) 0)))
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
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(set-option :timeout 0)
(push) ; 3
(assert (not (> (Multiset_count B1@27@01 x@23@01) 0)))
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
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(set-option :timeout 0)
(push) ; 3
(assert (not (> (Multiset_count B1@27@01 x@23@01) 0)))
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
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(set-option :timeout 0)
(push) ; 3
(assert (not (> (Multiset_count B1@27@01 x@23@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04b ----------
(declare-const B@28@01 Multiset<Int>)
(declare-const n@29@01 Int)
(declare-const x@30@01 Int)
(declare-const y@31@01 Int)
(declare-const B@32@01 Multiset<Int>)
(declare-const n@33@01 Int)
(declare-const x@34@01 Int)
(declare-const y@35@01 Int)
(push) ; 1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.first $t@36@01) $Snap.unit))
; [eval] |B| == n
; [eval] |B|
(assert (= (Multiset_card B@32@01) n@33@01))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(assert (= ($Snap.first ($Snap.second $t@36@01)) $Snap.unit))
; [eval] ((x in B)) > 0
; [eval] (x in B)
(assert (> (Multiset_count B@32@01 x@34@01) 0))
(assert (= ($Snap.second ($Snap.second $t@36@01)) $Snap.unit))
; [eval] x != y
(assert (not (= x@34@01 y@35@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var B1: Multiset[Int]
(declare-const B1@37@01 Multiset<Int>)
; [exec]
; B1 := (B setminus Multiset(x))
; [eval] (B setminus Multiset(x))
; [eval] Multiset(x)
(declare-const B1@38@01 Multiset<Int>)
(assert (= B1@38@01 (Multiset_difference B@32@01 (Multiset_singleton x@34@01))))
; [exec]
; assert |B1| == n - 1
; [eval] |B1| == n - 1
; [eval] |B1|
; [eval] n - 1
(push) ; 3
(assert (not (= (Multiset_card B1@38@01) (- n@33@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_card B1@38@01) (- n@33@01 1)))
; [exec]
; assert ((x in B1)) > 0
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(push) ; 3
(assert (not (> (Multiset_count B1@38@01 x@34@01) 0)))
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
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(set-option :timeout 0)
(push) ; 3
(assert (not (> (Multiset_count B1@38@01 x@34@01) 0)))
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
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(set-option :timeout 0)
(push) ; 3
(assert (not (> (Multiset_count B1@38@01 x@34@01) 0)))
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
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(set-option :timeout 0)
(push) ; 3
(assert (not (> (Multiset_count B1@38@01 x@34@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const B@39@01 Multiset<Int>)
(declare-const n@40@01 Int)
(declare-const x@41@01 Int)
(declare-const B@42@01 Multiset<Int>)
(declare-const n@43@01 Int)
(declare-const x@44@01 Int)
(push) ; 1
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 $Snap.unit))
; [eval] |B| == n
; [eval] |B|
(assert (= (Multiset_card B@42@01) n@43@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var B1: Multiset[Int]
(declare-const B1@46@01 Multiset<Int>)
; [exec]
; B1 := (B union B)
; [eval] (B union B)
(declare-const B1@47@01 Multiset<Int>)
(assert (= B1@47@01 (Multiset_union B@42@01 B@42@01)))
; [exec]
; assert ((x in B1)) > 0 == ((x in B)) > 0
; [eval] ((x in B1)) > 0 == ((x in B)) > 0
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
; [eval] ((x in B)) > 0
; [eval] (x in B)
(push) ; 3
(assert (not (=
  (> (Multiset_count B1@47@01 x@44@01) 0)
  (> (Multiset_count B@42@01 x@44@01) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (> (Multiset_count B1@47@01 x@44@01) 0)
  (> (Multiset_count B@42@01 x@44@01) 0)))
; [exec]
; assert |B1| == 2 * n
; [eval] |B1| == 2 * n
; [eval] |B1|
; [eval] 2 * n
(push) ; 3
(assert (not (= (Multiset_card B1@47@01) (* 2 n@43@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_card B1@47@01) (* 2 n@43@01)))
(pop) ; 2
(pop) ; 1
; ---------- test06a ----------
(declare-const B@48@01 Multiset<Int>)
(declare-const n@49@01 Int)
(declare-const x@50@01 Int)
(declare-const b@51@01 Bool)
(declare-const B@52@01 Multiset<Int>)
(declare-const n@53@01 Int)
(declare-const x@54@01 Int)
(declare-const b@55@01 Bool)
(push) ; 1
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; [eval] |B| == n
; [eval] |B|
(assert (= (Multiset_card B@52@01) n@53@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var B1: Multiset[Int]
(declare-const B1@57@01 Multiset<Int>)
; [exec]
; B1 := (B intersection B)
; [eval] (B intersection B)
(declare-const B1@58@01 Multiset<Int>)
(assert (= B1@58@01 (Multiset_intersection B@52@01 B@52@01)))
; [exec]
; assert |B1| == n
; [eval] |B1| == n
; [eval] |B1|
(push) ; 3
(assert (not (= (Multiset_card B1@58@01) n@53@01)))
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
; [eval] |B1| == n
; [eval] |B1|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_card B1@58@01) n@53@01)))
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
; [eval] |B1| == n
; [eval] |B1|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_card B1@58@01) n@53@01)))
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
; [eval] |B1| == n
; [eval] |B1|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_card B1@58@01) n@53@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test06b ----------
(declare-const B@59@01 Multiset<Int>)
(declare-const n@60@01 Int)
(declare-const x@61@01 Int)
(declare-const b@62@01 Bool)
(declare-const B@63@01 Multiset<Int>)
(declare-const n@64@01 Int)
(declare-const x@65@01 Int)
(declare-const b@66@01 Bool)
(push) ; 1
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] |B| == n
; [eval] |B|
(assert (= (Multiset_card B@63@01) n@64@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var B1: Multiset[Int]
(declare-const B1@68@01 Multiset<Int>)
; [exec]
; B1 := (B intersection B)
; [eval] (B intersection B)
(declare-const B1@69@01 Multiset<Int>)
(assert (= B1@69@01 (Multiset_intersection B@63@01 B@63@01)))
; [exec]
; assert B1 == B
; [eval] B1 == B
(push) ; 3
(assert (not (Multiset_equal B1@69@01 B@63@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Multiset_equal B1@69@01 B@63@01))
; [exec]
; assert |B1| == n
; [eval] |B1| == n
; [eval] |B1|
(push) ; 3
(assert (not (= (Multiset_card B1@69@01) n@64@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_card B1@69@01) n@64@01))
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const B@70@01 Multiset<Int>)
(declare-const n@71@01 Int)
(declare-const x@72@01 Int)
(declare-const y@73@01 Int)
(declare-const B@74@01 Multiset<Int>)
(declare-const n@75@01 Int)
(declare-const x@76@01 Int)
(declare-const y@77@01 Int)
(push) ; 1
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 $Snap.unit))
; [eval] |B| == n
; [eval] |B|
(assert (= (Multiset_card B@74@01) n@75@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var B1: Multiset[Int]
(declare-const B1@79@01 Multiset<Int>)
; [exec]
; B1 := (B union Multiset(x, y))
; [eval] (B union Multiset(x, y))
; [eval] Multiset(x, y)
(declare-const B1@80@01 Multiset<Int>)
(assert (=
  B1@80@01
  (Multiset_union B@74@01 (Multiset_unionone (Multiset_singleton x@76@01) y@77@01))))
; [exec]
; assert ((x in B1)) > 0
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
(push) ; 3
(assert (not (> (Multiset_count B1@80@01 x@76@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (Multiset_count B1@80@01 x@76@01) 0))
; [exec]
; assert ((y in B1)) > 0
; [eval] ((y in B1)) > 0
; [eval] (y in B1)
(push) ; 3
(assert (not (> (Multiset_count B1@80@01 y@77@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (Multiset_count B1@80@01 y@77@01) 0))
; [exec]
; assert |B1| == n + 2
; [eval] |B1| == n + 2
; [eval] |B1|
; [eval] n + 2
(push) ; 3
(assert (not (= (Multiset_card B1@80@01) (+ n@75@01 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_card B1@80@01) (+ n@75@01 2)))
(pop) ; 2
(pop) ; 1
; ---------- test08 ----------
(declare-const B@81@01 Multiset<Int>)
(declare-const n@82@01 Int)
(declare-const x@83@01 Int)
(declare-const y@84@01 Int)
(declare-const B@85@01 Multiset<Int>)
(declare-const n@86@01 Int)
(declare-const x@87@01 Int)
(declare-const y@88@01 Int)
(push) ; 1
(declare-const $t@89@01 $Snap)
(assert (= $t@89@01 $Snap.unit))
; [eval] |B| == n
; [eval] |B|
(assert (= (Multiset_card B@85@01) n@86@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var B1: Multiset[Int]
(declare-const B1@90@01 Multiset<Int>)
; [exec]
; B1 := (B intersection Multiset(x, y))
; [eval] (B intersection Multiset(x, y))
; [eval] Multiset(x, y)
(declare-const B1@91@01 Multiset<Int>)
(assert (=
  B1@91@01
  (Multiset_intersection B@85@01 (Multiset_unionone (Multiset_singleton x@87@01) y@88@01))))
; [exec]
; assert ((x in B1)) > 0 == ((x in B)) > 0
; [eval] ((x in B1)) > 0 == ((x in B)) > 0
; [eval] ((x in B1)) > 0
; [eval] (x in B1)
; [eval] ((x in B)) > 0
; [eval] (x in B)
(push) ; 3
(assert (not (=
  (> (Multiset_count B1@91@01 x@87@01) 0)
  (> (Multiset_count B@85@01 x@87@01) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (> (Multiset_count B1@91@01 x@87@01) 0)
  (> (Multiset_count B@85@01 x@87@01) 0)))
; [exec]
; assert |B1| <= 2
; [eval] |B1| <= 2
; [eval] |B1|
(push) ; 3
(assert (not (<= (Multiset_card B1@91@01) 2)))
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
; [eval] |B1| <= 2
; [eval] |B1|
(set-option :timeout 0)
(push) ; 3
(assert (not (<= (Multiset_card B1@91@01) 2)))
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
; [eval] |B1| <= 2
; [eval] |B1|
(set-option :timeout 0)
(push) ; 3
(assert (not (<= (Multiset_card B1@91@01) 2)))
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
; [eval] |B1| <= 2
; [eval] |B1|
(set-option :timeout 0)
(push) ; 3
(assert (not (<= (Multiset_card B1@91@01) 2)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test09 ----------
(declare-const A@92@01 Multiset<Int>)
(declare-const B@93@01 Multiset<Int>)
(declare-const C@94@01 Multiset<Int>)
(declare-const A@95@01 Multiset<Int>)
(declare-const B@96@01 Multiset<Int>)
(declare-const C@97@01 Multiset<Int>)
(push) ; 1
(declare-const $t@98@01 $Snap)
(assert (= $t@98@01 $Snap.unit))
; [eval] (A union B) == C
; [eval] (A union B)
(assert (Multiset_equal (Multiset_union A@95@01 B@96@01) C@97@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (A subset C)
; [eval] (A subset C)
(push) ; 3
(assert (not (Multiset_subset A@95@01 C@97@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Multiset_subset A@95@01 C@97@01))
; [exec]
; assert (B subset C)
; [eval] (B subset C)
(push) ; 3
(assert (not (Multiset_subset B@96@01 C@97@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Multiset_subset B@96@01 C@97@01))
; [exec]
; assert (A subset B)
; [eval] (A subset B)
(push) ; 3
(assert (not (Multiset_subset A@95@01 B@96@01)))
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
; [eval] (A subset B)
(set-option :timeout 0)
(push) ; 3
(assert (not (Multiset_subset A@95@01 B@96@01)))
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
; [eval] (A subset B)
(set-option :timeout 0)
(push) ; 3
(assert (not (Multiset_subset A@95@01 B@96@01)))
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
; [eval] (A subset B)
(set-option :timeout 0)
(push) ; 3
(assert (not (Multiset_subset A@95@01 B@96@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
