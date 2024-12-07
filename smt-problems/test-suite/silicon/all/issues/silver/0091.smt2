(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:00:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0091.vpr
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
; ---------- test09 ----------
(declare-const B@0@01 Multiset<Int>)
(declare-const x@1@01 Int)
(declare-const xc@2@01 Int)
(declare-const y@3@01 Int)
(declare-const yc@4@01 Int)
(declare-const B@5@01 Multiset<Int>)
(declare-const x@6@01 Int)
(declare-const xc@7@01 Int)
(declare-const y@8@01 Int)
(declare-const yc@9@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.first $t@10@01) $Snap.unit))
; [eval] (x in B) == xc
; [eval] (x in B)
(assert (= (Multiset_count B@5@01 x@6@01) xc@7@01))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] (y in B) == yc
; [eval] (y in B)
(assert (= (Multiset_count B@5@01 y@8@01) yc@9@01))
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
(declare-const B1@11@01 Multiset<Int>)
; [exec]
; B1 := (B union Multiset(x, y, x))
; [eval] (B union Multiset(x, y, x))
; [eval] Multiset(x, y, x)
(declare-const B1@12@01 Multiset<Int>)
(assert (=
  B1@12@01
  (Multiset_union B@5@01 (Multiset_unionone (Multiset_unionone (Multiset_singleton x@6@01) y@8@01) x@6@01))))
; [exec]
; assert (y in B1) == yc + 1 && (x in B1) == xc + 2
; [eval] (y in B1) == yc + 1
; [eval] (y in B1)
; [eval] yc + 1
(push) ; 3
(assert (not (= (Multiset_count B1@12@01 y@8@01) (+ yc@9@01 1))))
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
; [eval] (y in B1) == yc + 1
; [eval] (y in B1)
; [eval] yc + 1
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_count B1@12@01 y@8@01) (+ yc@9@01 1))))
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
; [eval] (y in B1) == yc + 1
; [eval] (y in B1)
; [eval] yc + 1
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_count B1@12@01 y@8@01) (+ yc@9@01 1))))
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
; [eval] (y in B1) == yc + 1
; [eval] (y in B1)
; [eval] yc + 1
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_count B1@12@01 y@8@01) (+ yc@9@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test09_fixed ----------
(declare-const B@13@01 Multiset<Int>)
(declare-const x@14@01 Int)
(declare-const xc@15@01 Int)
(declare-const y@16@01 Int)
(declare-const yc@17@01 Int)
(declare-const B@18@01 Multiset<Int>)
(declare-const x@19@01 Int)
(declare-const xc@20@01 Int)
(declare-const y@21@01 Int)
(declare-const yc@22@01 Int)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (= ($Snap.first $t@23@01) $Snap.unit))
; [eval] x != y
(assert (not (= x@19@01 y@21@01)))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(assert (= ($Snap.first ($Snap.second $t@23@01)) $Snap.unit))
; [eval] (x in B) == xc
; [eval] (x in B)
(assert (= (Multiset_count B@18@01 x@19@01) xc@20@01))
(assert (= ($Snap.second ($Snap.second $t@23@01)) $Snap.unit))
; [eval] (y in B) == yc
; [eval] (y in B)
(assert (= (Multiset_count B@18@01 y@21@01) yc@22@01))
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
(declare-const B1@24@01 Multiset<Int>)
; [exec]
; B1 := (B union Multiset(x, y, x))
; [eval] (B union Multiset(x, y, x))
; [eval] Multiset(x, y, x)
(declare-const B1@25@01 Multiset<Int>)
(assert (=
  B1@25@01
  (Multiset_union B@18@01 (Multiset_unionone (Multiset_unionone (Multiset_singleton x@19@01) y@21@01) x@19@01))))
; [exec]
; assert (y in B1) == yc + 1 && (x in B1) == xc + 2
; [eval] (y in B1) == yc + 1
; [eval] (y in B1)
; [eval] yc + 1
(push) ; 3
(assert (not (= (Multiset_count B1@25@01 y@21@01) (+ yc@22@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_count B1@25@01 y@21@01) (+ yc@22@01 1)))
; [eval] (x in B1) == xc + 2
; [eval] (x in B1)
; [eval] xc + 2
(push) ; 3
(assert (not (= (Multiset_count B1@25@01 x@19@01) (+ xc@20@01 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_count B1@25@01 x@19@01) (+ xc@20@01 2)))
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
(declare-const B@26@01 Multiset<Int>)
(declare-const x@27@01 Int)
(declare-const xc@28@01 Int)
(declare-const y@29@01 Int)
(declare-const yc@30@01 Int)
(declare-const B@31@01 Multiset<Int>)
(declare-const x@32@01 Int)
(declare-const xc@33@01 Int)
(declare-const y@34@01 Int)
(declare-const yc@35@01 Int)
(push) ; 1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.first $t@36@01) $Snap.unit))
; [eval] (x in B) == xc
; [eval] (x in B)
(assert (= (Multiset_count B@31@01 x@32@01) xc@33@01))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(assert (= ($Snap.first ($Snap.second $t@36@01)) $Snap.unit))
; [eval] (y in B) == yc
; [eval] (y in B)
(assert (= (Multiset_count B@31@01 y@34@01) yc@35@01))
(assert (=
  ($Snap.second ($Snap.second $t@36@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@36@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@36@01))) $Snap.unit))
; [eval] xc > 10
(assert (> xc@33@01 10))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@36@01))) $Snap.unit))
; [eval] yc > 10
(assert (> yc@35@01 10))
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
; B1 := (B setminus Multiset(x, y, y))
; [eval] (B setminus Multiset(x, y, y))
; [eval] Multiset(x, y, y)
(declare-const B1@38@01 Multiset<Int>)
(assert (=
  B1@38@01
  (Multiset_difference B@31@01 (Multiset_unionone (Multiset_unionone (Multiset_singleton x@32@01) y@34@01) y@34@01))))
; [exec]
; assert (y in B1) == yc - 2 && (x in B1) == xc - 1
; [eval] (y in B1) == yc - 2
; [eval] (y in B1)
; [eval] yc - 2
(push) ; 3
(assert (not (= (Multiset_count B1@38@01 y@34@01) (- yc@35@01 2))))
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
; [eval] (y in B1) == yc - 2
; [eval] (y in B1)
; [eval] yc - 2
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_count B1@38@01 y@34@01) (- yc@35@01 2))))
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
; [eval] (y in B1) == yc - 2
; [eval] (y in B1)
; [eval] yc - 2
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_count B1@38@01 y@34@01) (- yc@35@01 2))))
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
; [eval] (y in B1) == yc - 2
; [eval] (y in B1)
; [eval] yc - 2
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Multiset_count B1@38@01 y@34@01) (- yc@35@01 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test10_fixed ----------
(declare-const B@39@01 Multiset<Int>)
(declare-const x@40@01 Int)
(declare-const xc@41@01 Int)
(declare-const y@42@01 Int)
(declare-const yc@43@01 Int)
(declare-const B@44@01 Multiset<Int>)
(declare-const x@45@01 Int)
(declare-const xc@46@01 Int)
(declare-const y@47@01 Int)
(declare-const yc@48@01 Int)
(push) ; 1
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 ($Snap.combine ($Snap.first $t@49@01) ($Snap.second $t@49@01))))
(assert (= ($Snap.first $t@49@01) $Snap.unit))
; [eval] x != y
(assert (not (= x@45@01 y@47@01)))
(assert (=
  ($Snap.second $t@49@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@49@01))
    ($Snap.second ($Snap.second $t@49@01)))))
(assert (= ($Snap.first ($Snap.second $t@49@01)) $Snap.unit))
; [eval] (x in B) == xc
; [eval] (x in B)
(assert (= (Multiset_count B@44@01 x@45@01) xc@46@01))
(assert (=
  ($Snap.second ($Snap.second $t@49@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@49@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@49@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@49@01))) $Snap.unit))
; [eval] (y in B) == yc
; [eval] (y in B)
(assert (= (Multiset_count B@44@01 y@47@01) yc@48@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@49@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@49@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@49@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@49@01))))
  $Snap.unit))
; [eval] xc > 10
(assert (> xc@46@01 10))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@49@01))))
  $Snap.unit))
; [eval] yc > 10
(assert (> yc@48@01 10))
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
(declare-const B1@50@01 Multiset<Int>)
; [exec]
; B1 := (B setminus Multiset(x, y, y))
; [eval] (B setminus Multiset(x, y, y))
; [eval] Multiset(x, y, y)
(declare-const B1@51@01 Multiset<Int>)
(assert (=
  B1@51@01
  (Multiset_difference B@44@01 (Multiset_unionone (Multiset_unionone (Multiset_singleton x@45@01) y@47@01) y@47@01))))
; [exec]
; assert (y in B1) == yc - 2 && (x in B1) == xc - 1
; [eval] (y in B1) == yc - 2
; [eval] (y in B1)
; [eval] yc - 2
(push) ; 3
(assert (not (= (Multiset_count B1@51@01 y@47@01) (- yc@48@01 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_count B1@51@01 y@47@01) (- yc@48@01 2)))
; [eval] (x in B1) == xc - 1
; [eval] (x in B1)
; [eval] xc - 1
(push) ; 3
(assert (not (= (Multiset_count B1@51@01 x@45@01) (- xc@46@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_count B1@51@01 x@45@01) (- xc@46@01 1)))
(pop) ; 2
(pop) ; 1
